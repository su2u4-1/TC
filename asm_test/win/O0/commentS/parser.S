	.file	"D:\\TC\\src\\parser.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Failed to parse import statement\0"
	.align 8
.LC1:
	.ascii "Failed to parse function declaration\0"
	.align 8
.LC2:
	.ascii "Failed to parse class declaration\0"
	.align 8
.LC3:
	.ascii "Unexpected token in code member\0"
	.text
	.globl	parse_code
	.def	parse_code;	.scl	2;	.type	32;	.endef
parse_code:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$112, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:23:     if (builtin_scope == 0) {
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp117
	movq	(%rax), %rax	 ; builtin_scope, builtin_scope.0_1
 ; D:\TC\src\parser.c:23:     if (builtin_scope == 0) {
	testq	%rax, %rax	 ; builtin_scope.0_1
	jne	.L2	 ;,
 ; D:\TC\src\parser.c:24:         builtin_scope = create_scope(0);
	movl	$0, %ecx	 ;,
	call	create_scope	 ;
 ; D:\TC\src\parser.c:24:         builtin_scope = create_scope(0);
	movq	.refptr.builtin_scope(%rip), %rdx	 ;, tmp118
	movq	%rax, (%rdx)	 ; _2, builtin_scope
 ; D:\TC\src\parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp119
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope.1_3
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp120
	movq	(%rax), %rax	 ; VOID_KEYWORD, VOID_KEYWORD.2_4
	movq	%rdx, 32(%rsp)	 ; builtin_scope.1_3,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; VOID_KEYWORD.2_4,
	call	create_name	 ;
 ; D:\TC\src\parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp121
	movq	%rax, (%rdx)	 ; _5, name_void
 ; D:\TC\src\parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp122
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope.3_6
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp123
	movq	(%rax), %rax	 ; INT_KEYWORD, INT_KEYWORD.4_7
	movq	%rdx, 32(%rsp)	 ; builtin_scope.3_6,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; INT_KEYWORD.4_7,
	call	create_name	 ;
 ; D:\TC\src\parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp124
	movq	%rax, (%rdx)	 ; _8, name_int
 ; D:\TC\src\parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp125
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope.5_9
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp126
	movq	(%rax), %rax	 ; FLOAT_KEYWORD, FLOAT_KEYWORD.6_10
	movq	%rdx, 32(%rsp)	 ; builtin_scope.5_9,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; FLOAT_KEYWORD.6_10,
	call	create_name	 ;
 ; D:\TC\src\parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp127
	movq	%rax, (%rdx)	 ; _11, name_float
 ; D:\TC\src\parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp128
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope.7_12
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp129
	movq	(%rax), %rax	 ; STRING_KEYWORD, STRING_KEYWORD.8_13
	movq	%rdx, 32(%rsp)	 ; builtin_scope.7_12,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; STRING_KEYWORD.8_13,
	call	create_name	 ;
 ; D:\TC\src\parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp130
	movq	%rax, (%rdx)	 ; _14, name_string
 ; D:\TC\src\parser.c:29:         name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp131
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope.9_15
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp132
	movq	(%rax), %rax	 ; BOOL_KEYWORD, BOOL_KEYWORD.10_16
	movq	%rdx, 32(%rsp)	 ; builtin_scope.9_15,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; BOOL_KEYWORD.10_16,
	call	create_name	 ;
 ; D:\TC\src\parser.c:29:         name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp133
	movq	%rax, (%rdx)	 ; _17, name_bool
.L2:
 ; D:\TC\src\parser.c:31:     if (now_scope == 0)
	cmpq	$0, 24(%rbp)	 ;, now_scope
	jne	.L3	 ;,
 ; D:\TC\src\parser.c:32:         now_scope = builtin_scope;
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp134
	movq	(%rax), %rax	 ; builtin_scope, tmp135
	movq	%rax, 24(%rbp)	 ; tmp135, now_scope
.L3:
 ; D:\TC\src\parser.c:33:     Token* token = 0;
	movq	$0, -8(%rbp)	 ;, token
 ; D:\TC\src\parser.c:34:     Token* token_ptr = NULL;
	movq	$0, -16(%rbp)	 ;, token_ptr
 ; D:\TC\src\parser.c:35:     list(CodeMember*) members = create_list();
	call	create_list	 ;
	movq	%rax, -24(%rbp)	 ; tmp136, members
 ; D:\TC\src\parser.c:36:     Scope* global_scope = create_scope(now_scope);
	movq	24(%rbp), %rax	 ; now_scope, tmp137
	movq	%rax, %rcx	 ; tmp137,
	call	create_scope	 ;
	movq	%rax, -32(%rbp)	 ; tmp138, global_scope
 ; D:\TC\src\parser.c:37:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp139
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp139,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp140, token
 ; D:\TC\src\parser.c:38:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp141
	movq	%rax, -16(%rbp)	 ; tmp141, token_ptr
 ; D:\TC\src\parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	jmp	.L4	 ;
.L13:
 ; D:\TC\src\parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp142
	movl	24(%rax), %eax	 ; token_ptr_36->type, _18
 ; D:\TC\src\parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	 ;, _18
	jne	.L5	 ;,
 ; D:\TC\src\parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax	 ;, tmp143
	movq	(%rax), %rdx	 ; IMPORT_KEYWORD, IMPORT_KEYWORD.11_19
	movq	-16(%rbp), %rax	 ; token_ptr, tmp144
	movq	(%rax), %rax	 ; token_ptr_36->lexeme, _20
	movq	%rax, %rcx	 ; _20,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	testb	%al, %al	 ; _21
	je	.L5	 ;,
 ; D:\TC\src\parser.c:41:             Import* import = parse_import(lexer, global_scope);
	movq	-32(%rbp), %rdx	 ; global_scope, tmp145
	movq	16(%rbp), %rax	 ; lexer, tmp146
	movq	%rax, %rcx	 ; tmp146,
	call	parse_import	 ;
	movq	%rax, -40(%rbp)	 ; tmp147, import
 ; D:\TC\src\parser.c:42:             if (import == 0)
	cmpq	$0, -40(%rbp)	 ;, import
	jne	.L6	 ;,
 ; D:\TC\src\parser.c:43:                 parser_error("Failed to parse import statement", token);
	movq	-8(%rbp), %rax	 ; token, tmp148
	movq	%rax, %rdx	 ; tmp148,
	leaq	.LC0(%rip), %rax	 ;, tmp149
	movq	%rax, %rcx	 ; tmp149,
	call	parser_error	 ;
.L6:
 ; D:\TC\src\parser.c:44:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	-40(%rbp), %rax	 ; import, tmp150
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp150,
	movl	$0, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ;, _22
 ; D:\TC\src\parser.c:44:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	-24(%rbp), %rax	 ; members, tmp151
	movq	%rax, %rcx	 ; tmp151,
	call	list_append	 ;
 ; D:\TC\src\parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	jmp	.L7	 ;
.L5:
 ; D:\TC\src\parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp152
	movl	24(%rax), %eax	 ; token_ptr_36->type, _23
 ; D:\TC\src\parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	cmpl	$6, %eax	 ;, _23
	jne	.L8	 ;,
 ; D:\TC\src\parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	movq	.refptr.FUNC_KEYWORD(%rip), %rax	 ;, tmp153
	movq	(%rax), %rdx	 ; FUNC_KEYWORD, FUNC_KEYWORD.12_24
	movq	-16(%rbp), %rax	 ; token_ptr, tmp154
	movq	(%rax), %rax	 ; token_ptr_36->lexeme, _25
	movq	%rax, %rcx	 ; _25,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	testb	%al, %al	 ; _26
	je	.L8	 ;,
 ; D:\TC\src\parser.c:46:             Function* function = parse_function(lexer, global_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp155
	movq	-32(%rbp), %rdx	 ; global_scope, tmp156
	movq	16(%rbp), %rax	 ; lexer, tmp157
	movq	%rcx, %r8	 ; tmp155,
	movq	%rax, %rcx	 ; tmp157,
	call	parse_function	 ;
	movq	%rax, -48(%rbp)	 ; tmp158, function
 ; D:\TC\src\parser.c:47:             if (function == 0)
	cmpq	$0, -48(%rbp)	 ;, function
	jne	.L9	 ;,
 ; D:\TC\src\parser.c:48:                 parser_error("Failed to parse function declaration", token);
	movq	-8(%rbp), %rax	 ; token, tmp159
	movq	%rax, %rdx	 ; tmp159,
	leaq	.LC1(%rip), %rax	 ;, tmp160
	movq	%rax, %rcx	 ; tmp160,
	call	parser_error	 ;
.L9:
 ; D:\TC\src\parser.c:49:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	-48(%rbp), %rax	 ; function, tmp161
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; tmp161,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ;, _27
 ; D:\TC\src\parser.c:49:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	-24(%rbp), %rax	 ; members, tmp162
	movq	%rax, %rcx	 ; tmp162,
	call	list_append	 ;
 ; D:\TC\src\parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	jmp	.L7	 ;
.L8:
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp163
	movl	24(%rax), %eax	 ; token_ptr_36->type, _28
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	cmpl	$6, %eax	 ;, _28
	jne	.L10	 ;,
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	movq	.refptr.CLASS_KEYWORD(%rip), %rax	 ;, tmp164
	movq	(%rax), %rdx	 ; CLASS_KEYWORD, CLASS_KEYWORD.13_29
	movq	-16(%rbp), %rax	 ; token_ptr, tmp165
	movq	(%rax), %rax	 ; token_ptr_36->lexeme, _30
	movq	%rax, %rcx	 ; _30,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	testb	%al, %al	 ; _31
	je	.L10	 ;,
 ; D:\TC\src\parser.c:51:             Class* class_ = parse_class(lexer, global_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp166
	movq	-32(%rbp), %rdx	 ; global_scope, tmp167
	movq	16(%rbp), %rax	 ; lexer, tmp168
	movq	%rcx, %r8	 ; tmp166,
	movq	%rax, %rcx	 ; tmp168,
	call	parse_class	 ;
	movq	%rax, -56(%rbp)	 ; tmp169, class_
 ; D:\TC\src\parser.c:52:             if (class_ == 0)
	cmpq	$0, -56(%rbp)	 ;, class_
	jne	.L11	 ;,
 ; D:\TC\src\parser.c:53:                 parser_error("Failed to parse class declaration", token);
	movq	-8(%rbp), %rax	 ; token, tmp170
	movq	%rax, %rdx	 ; tmp170,
	leaq	.LC2(%rip), %rax	 ;, tmp171
	movq	%rax, %rcx	 ; tmp171,
	call	parser_error	 ;
.L11:
 ; D:\TC\src\parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	-56(%rbp), %rax	 ; class_, tmp172
	movq	%rax, %r9	 ; tmp172,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$2, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ;, _32
 ; D:\TC\src\parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	-24(%rbp), %rax	 ; members, tmp173
	movq	%rax, %rcx	 ; tmp173,
	call	list_append	 ;
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	jmp	.L7	 ;
.L10:
 ; D:\TC\src\parser.c:56:             parser_error("Unexpected token in code member", token);
	movq	-8(%rbp), %rax	 ; token, tmp174
	movq	%rax, %rdx	 ; tmp174,
	leaq	.LC3(%rip), %rax	 ;, tmp175
	movq	%rax, %rcx	 ; tmp175,
	call	parser_error	 ;
.L7:
 ; D:\TC\src\parser.c:57:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp176
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp176,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp177, token
 ; D:\TC\src\parser.c:58:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp178
	movq	%rax, -16(%rbp)	 ; tmp178, token_ptr
.L4:
 ; D:\TC\src\parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	cmpq	$0, -8(%rbp)	 ;, token
	je	.L12	 ;,
 ; D:\TC\src\parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp179
	movl	24(%rax), %eax	 ; token_ptr_36->type, _33
 ; D:\TC\src\parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	testl	%eax, %eax	 ; _33
	jne	.L13	 ;,
.L12:
 ; D:\TC\src\parser.c:60:     return create_code(members, global_scope);
	movq	-32(%rbp), %rdx	 ; global_scope, tmp180
	movq	-24(%rbp), %rax	 ; members, tmp181
	movq	%rax, %rcx	 ; tmp181,
	call	create_code	 ;
 ; D:\TC\src\parser.c:61: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "Expected identifier after 'import'\0"
	.align 8
.LC5:
	.ascii "Expected string literal after 'from'\0"
	.align 8
.LC6:
	.ascii "Expected ';' at end of import statement\0"
	.text
	.def	parse_import;	.scl	3;	.type	32;	.endef
parse_import:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$96, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
 ; D:\TC\src\parser.c:66:     Token* token = 0;
	movq	$0, -8(%rbp)	 ;, token
 ; D:\TC\src\parser.c:67:     Token* token_ptr = NULL;
	movq	$0, -16(%rbp)	 ;, token_ptr
 ; D:\TC\src\parser.c:68:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp95
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp95,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp96, token
 ; D:\TC\src\parser.c:69:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp97
	movq	%rax, -16(%rbp)	 ; tmp97, token_ptr
 ; D:\TC\src\parser.c:70:     if (token_ptr->type != IDENTIFIER) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp98
	movl	24(%rax), %eax	 ; token_ptr_27->type, _1
 ; D:\TC\src\parser.c:70:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, %eax	 ;, _1
	je	.L16	 ;,
 ; D:\TC\src\parser.c:71:         parser_error("Expected identifier after 'import'", token);
	movq	-8(%rbp), %rax	 ; token, tmp99
	movq	%rax, %rdx	 ; tmp99,
	leaq	.LC4(%rip), %rax	 ;, tmp100
	movq	%rax, %rcx	 ; tmp100,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:72:         return NULL;
	movl	$0, %eax	 ;, _16
	jmp	.L17	 ;
.L16:
 ; D:\TC\src\parser.c:74:     string import_name = token_ptr->lexeme;
	movq	-16(%rbp), %rax	 ; token_ptr, tmp101
	movq	(%rax), %rax	 ; token_ptr_27->lexeme, tmp102
	movq	%rax, -40(%rbp)	 ; tmp102, import_name
 ; D:\TC\src\parser.c:75:     string source = 0;
	movq	$0, -24(%rbp)	 ;, source
 ; D:\TC\src\parser.c:76:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp103
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp103,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp104, token
 ; D:\TC\src\parser.c:77:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp105
	movq	%rax, -16(%rbp)	 ; tmp105, token_ptr
 ; D:\TC\src\parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp106
	movl	24(%rax), %eax	 ; token_ptr_32->type, _2
 ; D:\TC\src\parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	cmpl	$6, %eax	 ;, _2
	jne	.L18	 ;,
 ; D:\TC\src\parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	movq	.refptr.FROM_KEYWORD(%rip), %rax	 ;, tmp107
	movq	(%rax), %rdx	 ; FROM_KEYWORD, FROM_KEYWORD.14_3
	movq	-16(%rbp), %rax	 ; token_ptr, tmp108
	movq	(%rax), %rax	 ; token_ptr_32->lexeme, _4
	movq	%rax, %rcx	 ; _4,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	testb	%al, %al	 ; _5
	je	.L18	 ;,
 ; D:\TC\src\parser.c:79:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp109
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp109,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp110, token
 ; D:\TC\src\parser.c:80:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp111
	movq	%rax, -16(%rbp)	 ; tmp111, token_ptr
 ; D:\TC\src\parser.c:81:         if (token_ptr->type != STRING) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp112
	movl	24(%rax), %eax	 ; token_ptr_36->type, _6
 ; D:\TC\src\parser.c:81:         if (token_ptr->type != STRING) {
	cmpl	$4, %eax	 ;, _6
	je	.L19	 ;,
 ; D:\TC\src\parser.c:82:             parser_error("Expected string literal after 'from'", token);
	movq	-8(%rbp), %rax	 ; token, tmp113
	movq	%rax, %rdx	 ; tmp113,
	leaq	.LC5(%rip), %rax	 ;, tmp114
	movq	%rax, %rcx	 ; tmp114,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:83:             return NULL;
	movl	$0, %eax	 ;, _16
	jmp	.L17	 ;
.L19:
 ; D:\TC\src\parser.c:85:         source = token_ptr->lexeme;
	movq	-16(%rbp), %rax	 ; token_ptr, tmp115
	movq	(%rax), %rax	 ; token_ptr_36->lexeme, tmp116
	movq	%rax, -24(%rbp)	 ; tmp116, source
 ; D:\TC\src\parser.c:86:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp117
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp117,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp118, token
 ; D:\TC\src\parser.c:87:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp119
	movq	%rax, -16(%rbp)	 ; tmp119, token_ptr
.L18:
 ; D:\TC\src\parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp120
	movl	24(%rax), %eax	 ; token_ptr_13->type, _7
 ; D:\TC\src\parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	 ;, _7
	jne	.L20	 ;,
 ; D:\TC\src\parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp121
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.15_8
	movq	-16(%rbp), %rax	 ; token_ptr, tmp122
	movq	(%rax), %rax	 ; token_ptr_13->lexeme, _9
	movq	%rax, %rcx	 ; _9,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; _10
	jne	.L21	 ;,
.L20:
 ; D:\TC\src\parser.c:90:         parser_error("Expected ';' at end of import statement", token);
	movq	-8(%rbp), %rax	 ; token, tmp123
	movq	%rax, %rdx	 ; tmp123,
	leaq	.LC6(%rip), %rax	 ;, tmp124
	movq	%rax, %rcx	 ; tmp124,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:91:         return NULL;
	movl	$0, %eax	 ;, _16
	jmp	.L17	 ;
.L21:
 ; D:\TC\src\parser.c:94:     name = parse_import_file(import_name, source, now_scope);
	movq	24(%rbp), %rcx	 ; now_scope, tmp125
	movq	-24(%rbp), %rdx	 ; source, tmp126
	movq	-40(%rbp), %rax	 ; import_name, tmp127
	movq	%rcx, %r8	 ; tmp125,
	movq	%rax, %rcx	 ; tmp127,
	call	parse_import_file	 ;
	movq	%rax, -32(%rbp)	 ; tmp128, name
 ; D:\TC\src\parser.c:95:     if (name == 0)
	cmpq	$0, -32(%rbp)	 ;, name
	jne	.L22	 ;,
 ; D:\TC\src\parser.c:96:         name = create_name(import_name, NAME_VARIABLE, name_void, NULL, now_scope);
	movq	.refptr.name_void(%rip), %rax	 ;, tmp129
	movq	(%rax), %rcx	 ; name_void, name_void.16_11
	movq	-40(%rbp), %rax	 ; import_name, tmp130
	movq	24(%rbp), %rdx	 ; now_scope, tmp131
	movq	%rdx, 32(%rsp)	 ; tmp131,
	movl	$0, %r9d	 ;,
	movq	%rcx, %r8	 ; name_void.16_11,
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp130,
	call	create_name	 ;
	movq	%rax, -32(%rbp)	 ; tmp132, name
.L22:
 ; D:\TC\src\parser.c:97:     return create_import(name, source);
	movq	-24(%rbp), %rdx	 ; source, tmp133
	movq	-32(%rbp), %rax	 ; name, tmp134
	movq	%rax, %rcx	 ; tmp134,
	call	create_import	 ;
.L17:
 ; D:\TC\src\parser.c:98: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "Expected function return type after 'func'\0"
.LC8:
	.ascii "Unknown function return type\0"
	.align 8
.LC9:
	.ascii "Expected function name after return type\0"
	.align 8
.LC10:
	.ascii "Expected '(' after function name\0"
	.align 8
.LC11:
	.ascii "Failed to parse function parameter\0"
	.align 8
.LC12:
	.ascii "Function parameters cannot have default values\0"
	.align 8
.LC13:
	.ascii "Expected ',' or ')' after function parameter\0"
	.align 8
.LC14:
	.ascii "Expected '{' to start function body\0"
	.align 8
.LC15:
	.ascii "Failed to parse function body statement\0"
	.align 8
.LC16:
	.ascii "Unreachable code after return statement\0"
	.align 8
.LC17:
	.ascii "Function missing return statement\0"
	.text
	.def	parse_function;	.scl	3;	.type	32;	.endef
parse_function:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	addq	$-128, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:103:     Token* token = 0;
	movq	$0, -8(%rbp)	 ;, token
 ; D:\TC\src\parser.c:104:     Token* token_ptr = NULL;
	movq	$0, -16(%rbp)	 ;, token_ptr
 ; D:\TC\src\parser.c:105:     Scope* function_scope = create_scope(now_scope);
	movq	24(%rbp), %rax	 ; now_scope, tmp118
	movq	%rax, %rcx	 ; tmp118,
	call	create_scope	 ;
	movq	%rax, -32(%rbp)	 ; tmp119, function_scope
 ; D:\TC\src\parser.c:106:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp120
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp120,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp121, token
 ; D:\TC\src\parser.c:107:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp122
	movq	%rax, -16(%rbp)	 ; tmp122, token_ptr
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp123
	movl	24(%rax), %eax	 ; token_ptr_65->type, _1
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	 ;, _1
	je	.L24	 ;,
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp124
	movl	24(%rax), %eax	 ; token_ptr_65->type, _2
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	 ;, _2
	jne	.L25	 ;,
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp125
	movq	(%rax), %rax	 ; token_ptr_65->lexeme, _3
	movq	%rax, %rcx	 ; _3,
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	 ; _4
	jne	.L24	 ;,
.L25:
 ; D:\TC\src\parser.c:109:         parser_error("Expected function return type after 'func'", token);
	movq	-8(%rbp), %rax	 ; token, tmp126
	movq	%rax, %rdx	 ; tmp126,
	leaq	.LC7(%rip), %rax	 ;, tmp127
	movq	%rax, %rcx	 ; tmp127,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:110:         return NULL;
	movl	$0, %eax	 ;, _41
	jmp	.L26	 ;
.L24:
 ; D:\TC\src\parser.c:112:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	-16(%rbp), %rax	 ; token_ptr, tmp128
	movq	(%rax), %rdx	 ; token_ptr_65->lexeme, _5
	movq	24(%rbp), %rax	 ; now_scope, tmp129
	movq	%rax, %rcx	 ; tmp129,
	call	search	 ;
	movq	%rax, -40(%rbp)	 ; tmp130, return_type
 ; D:\TC\src\parser.c:113:     if (return_type == 0)
	cmpq	$0, -40(%rbp)	 ;, return_type
	jne	.L27	 ;,
 ; D:\TC\src\parser.c:116:         parser_error("Unknown function return type", token);
	movq	-8(%rbp), %rax	 ; token, tmp131
	movq	%rax, %rdx	 ; tmp131,
	leaq	.LC8(%rip), %rax	 ;, tmp132
	movq	%rax, %rcx	 ; tmp132,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:117:         return NULL;
	movl	$0, %eax	 ;, _41
	jmp	.L26	 ;
.L27:
 ; D:\TC\src\parser.c:119:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp133
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp133,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp134, token
 ; D:\TC\src\parser.c:120:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp135
	movq	%rax, -16(%rbp)	 ; tmp135, token_ptr
 ; D:\TC\src\parser.c:121:     if (token_ptr->type != IDENTIFIER) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp136
	movl	24(%rax), %eax	 ; token_ptr_73->type, _6
 ; D:\TC\src\parser.c:121:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, %eax	 ;, _6
	je	.L28	 ;,
 ; D:\TC\src\parser.c:122:         parser_error("Expected function name after return type", token);
	movq	-8(%rbp), %rax	 ; token, tmp137
	movq	%rax, %rdx	 ; tmp137,
	leaq	.LC9(%rip), %rax	 ;, tmp138
	movq	%rax, %rcx	 ; tmp138,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:123:         return NULL;
	movl	$0, %eax	 ;, _41
	jmp	.L26	 ;
.L28:
 ; D:\TC\src\parser.c:125:     Name* name = create_name(token_ptr->lexeme, NAME_FUNCTION, return_type, NULL, now_scope);
	movq	-16(%rbp), %rax	 ; token_ptr, tmp139
	movq	(%rax), %rax	 ; token_ptr_73->lexeme, _7
	movq	-40(%rbp), %rcx	 ; return_type, tmp140
	movq	24(%rbp), %rdx	 ; now_scope, tmp141
	movq	%rdx, 32(%rsp)	 ; tmp141,
	movl	$0, %r9d	 ;,
	movq	%rcx, %r8	 ; tmp140,
	movl	$2, %edx	 ;,
	movq	%rax, %rcx	 ; _7,
	call	create_name	 ;
	movq	%rax, -48(%rbp)	 ; tmp142, name
 ; D:\TC\src\parser.c:126:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp143
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp143,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp144, token
 ; D:\TC\src\parser.c:127:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp145
	movq	%rax, -16(%rbp)	 ; tmp145, token_ptr
 ; D:\TC\src\parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp146
	movl	24(%rax), %eax	 ; token_ptr_78->type, _8
 ; D:\TC\src\parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _8
	jne	.L29	 ;,
 ; D:\TC\src\parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp147
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.17_9
	movq	-16(%rbp), %rax	 ; token_ptr, tmp148
	movq	(%rax), %rax	 ; token_ptr_78->lexeme, _10
	movq	%rax, %rcx	 ; _10,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _11
	jne	.L30	 ;,
.L29:
 ; D:\TC\src\parser.c:129:         parser_error("Expected '(' after function name", token);
	movq	-8(%rbp), %rax	 ; token, tmp149
	movq	%rax, %rdx	 ; tmp149,
	leaq	.LC10(%rip), %rax	 ;, tmp150
	movq	%rax, %rcx	 ; tmp150,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:130:         return NULL;
	movl	$0, %eax	 ;, _41
	jmp	.L26	 ;
.L30:
 ; D:\TC\src\parser.c:132:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp151
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp151,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp152, token
 ; D:\TC\src\parser.c:133:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp153
	movq	%rax, -16(%rbp)	 ; tmp153, token_ptr
 ; D:\TC\src\parser.c:134:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rax, -56(%rbp)	 ; tmp154, parameters
 ; D:\TC\src\parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L31	 ;
.L38:
 ; D:\TC\src\parser.c:136:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp155
	movq	-32(%rbp), %rdx	 ; function_scope, tmp156
	movq	16(%rbp), %rax	 ; lexer, tmp157
	movq	%rcx, %r8	 ; tmp155,
	movq	%rax, %rcx	 ; tmp157,
	call	parse_variable	 ;
	movq	%rax, -80(%rbp)	 ; tmp158, parameter
 ; D:\TC\src\parser.c:137:         if (parameter == 0)
	cmpq	$0, -80(%rbp)	 ;, parameter
	jne	.L32	 ;,
 ; D:\TC\src\parser.c:138:             parser_error("Failed to parse function parameter", token);
	movq	-8(%rbp), %rax	 ; token, tmp159
	movq	%rax, %rdx	 ; tmp159,
	leaq	.LC11(%rip), %rax	 ;, tmp160
	movq	%rax, %rcx	 ; tmp160,
	call	parser_error	 ;
	jmp	.L33	 ;
.L32:
 ; D:\TC\src\parser.c:139:         else if (parameter->value != 0)
	movq	-80(%rbp), %rax	 ; parameter, tmp161
	movq	16(%rax), %rax	 ; parameter_115->value, _12
 ; D:\TC\src\parser.c:139:         else if (parameter->value != 0)
	testq	%rax, %rax	 ; _12
	je	.L34	 ;,
 ; D:\TC\src\parser.c:140:             parser_error("Function parameters cannot have default values", token);
	movq	-8(%rbp), %rax	 ; token, tmp162
	movq	%rax, %rdx	 ; tmp162,
	leaq	.LC12(%rip), %rax	 ;, tmp163
	movq	%rax, %rcx	 ; tmp163,
	call	parser_error	 ;
	jmp	.L33	 ;
.L34:
 ; D:\TC\src\parser.c:142:             list_append(parameters, (pointer)parameter);
	movq	-80(%rbp), %rdx	 ; parameter, tmp164
	movq	-56(%rbp), %rax	 ; parameters, tmp165
	movq	%rax, %rcx	 ; tmp165,
	call	list_append	 ;
.L33:
 ; D:\TC\src\parser.c:143:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp166
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp166,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp167, token
 ; D:\TC\src\parser.c:144:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp168
	movq	%rax, -16(%rbp)	 ; tmp168, token_ptr
 ; D:\TC\src\parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp169
	movl	24(%rax), %eax	 ; token_ptr_121->type, _13
 ; D:\TC\src\parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, %eax	 ;, _13
	jne	.L35	 ;,
 ; D:\TC\src\parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp170
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL.18_14
	movq	-16(%rbp), %rax	 ; token_ptr, tmp171
	movq	(%rax), %rax	 ; token_ptr_121->lexeme, _15
	movq	%rax, %rcx	 ; _15,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; _16
	je	.L35	 ;,
 ; D:\TC\src\parser.c:146:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp172
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp172,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp173, token
 ; D:\TC\src\parser.c:147:             token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp174
	movq	%rax, -16(%rbp)	 ; tmp174, token_ptr
	jmp	.L31	 ;
.L35:
 ; D:\TC\src\parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp175
	movl	24(%rax), %eax	 ; token_ptr_121->type, _17
 ; D:\TC\src\parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _17
	jne	.L37	 ;,
 ; D:\TC\src\parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp176
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.19_18
	movq	-16(%rbp), %rax	 ; token_ptr, tmp177
	movq	(%rax), %rax	 ; token_ptr_121->lexeme, _19
	movq	%rax, %rcx	 ; _19,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _20
	jne	.L31	 ;,
.L37:
 ; D:\TC\src\parser.c:149:             parser_error("Expected ',' or ')' after function parameter", token);
	movq	-8(%rbp), %rax	 ; token, tmp178
	movq	%rax, %rdx	 ; tmp178,
	leaq	.LC13(%rip), %rax	 ;, tmp179
	movq	%rax, %rcx	 ; tmp179,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:150:             return NULL;
	movl	$0, %eax	 ;, _41
	jmp	.L26	 ;
.L31:
 ; D:\TC\src\parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp180
	movl	24(%rax), %eax	 ; token_ptr_37->type, _21
 ; D:\TC\src\parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _21
	jne	.L38	 ;,
 ; D:\TC\src\parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp181
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.20_22
	movq	-16(%rbp), %rax	 ; token_ptr, tmp182
	movq	(%rax), %rax	 ; token_ptr_37->lexeme, _23
	movq	%rax, %rcx	 ; _23,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _24
	je	.L38	 ;,
 ; D:\TC\src\parser.c:153:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp183
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp183,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp184, token
 ; D:\TC\src\parser.c:154:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp185
	movq	%rax, -16(%rbp)	 ; tmp185, token_ptr
 ; D:\TC\src\parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp186
	movl	24(%rax), %eax	 ; token_ptr_88->type, _25
 ; D:\TC\src\parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _25
	jne	.L39	 ;,
 ; D:\TC\src\parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp187
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.21_26
	movq	-16(%rbp), %rax	 ; token_ptr, tmp188
	movq	(%rax), %rax	 ; token_ptr_88->lexeme, _27
	movq	%rax, %rcx	 ; _27,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _28
	jne	.L40	 ;,
.L39:
 ; D:\TC\src\parser.c:156:         parser_error("Expected '{' to start function body", token);
	movq	-8(%rbp), %rax	 ; token, tmp189
	movq	%rax, %rdx	 ; tmp189,
	leaq	.LC14(%rip), %rax	 ;, tmp190
	movq	%rax, %rcx	 ; tmp190,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:157:         return NULL;
	movl	$0, %eax	 ;, _41
	jmp	.L26	 ;
.L40:
 ; D:\TC\src\parser.c:159:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, -64(%rbp)	 ; tmp191, body
 ; D:\TC\src\parser.c:160:     parser->in_function = true;
	movq	32(%rbp), %rax	 ; parser, tmp192
	movb	$1, (%rax)	 ;, parser_92(D)->in_function
 ; D:\TC\src\parser.c:161:     bool have_return = false;
	movb	$0, -17(%rbp)	 ;, have_return
 ; D:\TC\src\parser.c:162:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp193
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp193,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp194, token
 ; D:\TC\src\parser.c:163:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp195
	movq	%rax, -16(%rbp)	 ; tmp195, token_ptr
 ; D:\TC\src\parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L41	 ;
.L45:
 ; D:\TC\src\parser.c:165:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp196
	movq	-32(%rbp), %rdx	 ; function_scope, tmp197
	movq	16(%rbp), %rax	 ; lexer, tmp198
	movq	%rcx, %r8	 ; tmp196,
	movq	%rax, %rcx	 ; tmp198,
	call	parse_statement	 ;
	movq	%rax, -72(%rbp)	 ; tmp199, statement
 ; D:\TC\src\parser.c:166:         if (statement == 0)
	cmpq	$0, -72(%rbp)	 ;, statement
	jne	.L42	 ;,
 ; D:\TC\src\parser.c:167:             parser_error("Failed to parse function body statement", token);
	movq	-8(%rbp), %rax	 ; token, tmp200
	movq	%rax, %rdx	 ; tmp200,
	leaq	.LC15(%rip), %rax	 ;, tmp201
	movq	%rax, %rcx	 ; tmp201,
	call	parser_error	 ;
	jmp	.L43	 ;
.L42:
 ; D:\TC\src\parser.c:168:         else if (have_return)
	cmpb	$0, -17(%rbp)	 ;, have_return
	je	.L43	 ;,
 ; D:\TC\src\parser.c:169:             parser_error("Unreachable code after return statement", token);
	movq	-8(%rbp), %rax	 ; token, tmp202
	movq	%rax, %rdx	 ; tmp202,
	leaq	.LC16(%rip), %rax	 ;, tmp203
	movq	%rax, %rcx	 ; tmp203,
	call	parser_error	 ;
.L43:
 ; D:\TC\src\parser.c:170:         if (((statement))->type == RETURN_STATEMENT)
	movq	-72(%rbp), %rax	 ; statement, tmp204
	movl	8(%rax), %eax	 ; statement_104->type, _29
 ; D:\TC\src\parser.c:170:         if (((statement))->type == RETURN_STATEMENT)
	cmpl	$5, %eax	 ;, _29
	jne	.L44	 ;,
 ; D:\TC\src\parser.c:171:             have_return = true;
	movb	$1, -17(%rbp)	 ;, have_return
.L44:
 ; D:\TC\src\parser.c:172:         list_append(body, (pointer)statement);
	movq	-72(%rbp), %rdx	 ; statement, tmp205
	movq	-64(%rbp), %rax	 ; body, tmp206
	movq	%rax, %rcx	 ; tmp206,
	call	list_append	 ;
 ; D:\TC\src\parser.c:173:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp207
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp207,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp208, token
 ; D:\TC\src\parser.c:174:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp209
	movq	%rax, -16(%rbp)	 ; tmp209, token_ptr
.L41:
 ; D:\TC\src\parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp210
	movl	24(%rax), %eax	 ; token_ptr_38->type, _30
 ; D:\TC\src\parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _30
	jne	.L45	 ;,
 ; D:\TC\src\parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp211
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.22_31
	movq	-16(%rbp), %rax	 ; token_ptr, tmp212
	movq	(%rax), %rax	 ; token_ptr_38->lexeme, _32
	movq	%rax, %rcx	 ; _32,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _33
	je	.L45	 ;,
 ; D:\TC\src\parser.c:176:     ((parser))->in_function = false;
	movq	32(%rbp), %rax	 ; parser, tmp213
	movb	$0, (%rax)	 ;, parser_92(D)->in_function
 ; D:\TC\src\parser.c:177:     if (!have_return && return_type != name_void)
	cmpb	$0, -17(%rbp)	 ;, have_return
	jne	.L46	 ;,
 ; D:\TC\src\parser.c:177:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp214
	movq	(%rax), %rax	 ; name_void, name_void.23_34
 ; D:\TC\src\parser.c:177:     if (!have_return && return_type != name_void)
	cmpq	%rax, -40(%rbp)	 ; name_void.23_34, return_type
	je	.L46	 ;,
 ; D:\TC\src\parser.c:178:         parser_error("Function missing return statement", token);
	movq	-8(%rbp), %rax	 ; token, tmp215
	movq	%rax, %rdx	 ; tmp215,
	leaq	.LC17(%rip), %rax	 ;, tmp216
	movq	%rax, %rcx	 ; tmp216,
	call	parser_error	 ;
.L46:
 ; D:\TC\src\parser.c:179:     return create_function(name, return_type, parameters, body, function_scope);
	movq	-64(%rbp), %r9	 ; body, tmp217
	movq	-56(%rbp), %r8	 ; parameters, tmp218
	movq	-40(%rbp), %rdx	 ; return_type, tmp219
	movq	-48(%rbp), %rax	 ; name, tmp220
	movq	-32(%rbp), %rcx	 ; function_scope, tmp221
	movq	%rcx, 32(%rsp)	 ; tmp221,
	movq	%rax, %rcx	 ; tmp220,
	call	create_function	 ;
.L26:
 ; D:\TC\src\parser.c:180: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC18:
	.ascii "Expected method return type after 'method'\0"
	.align 8
.LC19:
	.ascii "Unknown return type for method\0"
	.align 8
.LC20:
	.ascii "Expected method name after return type\0"
	.align 8
.LC21:
	.ascii "Expected '(' after method name\0"
	.align 8
.LC22:
	.ascii "Expected 'self' as first parameter of method\0"
	.align 8
.LC23:
	.ascii "Expected ',' or ')' after method parameter\0"
	.align 8
.LC24:
	.ascii "Failed to parse method parameter\0"
	.align 8
.LC25:
	.ascii "Method parameters cannot have default values\0"
	.align 8
.LC26:
	.ascii "Expected '{' to start method body\0"
	.align 8
.LC27:
	.ascii "Failed to parse method body statement\0"
	.align 8
.LC28:
	.ascii "Method missing return statement\0"
	.text
	.def	parse_method;	.scl	3;	.type	32;	.endef
parse_method:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$144, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; class_name, class_name
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:185:     Token* token = 0;
	movq	$0, -8(%rbp)	 ;, token
 ; D:\TC\src\parser.c:186:     Token* token_ptr = NULL;
	movq	$0, -16(%rbp)	 ;, token_ptr
 ; D:\TC\src\parser.c:187:     Scope* method_scope = create_scope(now_scope);
	movq	24(%rbp), %rax	 ; now_scope, tmp124
	movq	%rax, %rcx	 ; tmp124,
	call	create_scope	 ;
	movq	%rax, -32(%rbp)	 ; tmp125, method_scope
 ; D:\TC\src\parser.c:188:     Name* self = create_name(SELF_KEYWORD, NAME_VARIABLE, class_name, NULL, method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp126
	movq	(%rax), %rax	 ; SELF_KEYWORD, SELF_KEYWORD.24_1
	movq	32(%rbp), %rcx	 ; class_name, tmp127
	movq	-32(%rbp), %rdx	 ; method_scope, tmp128
	movq	%rdx, 32(%rsp)	 ; tmp128,
	movl	$0, %r9d	 ;,
	movq	%rcx, %r8	 ; tmp127,
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; SELF_KEYWORD.24_1,
	call	create_name	 ;
	movq	%rax, -40(%rbp)	 ; tmp129, self
 ; D:\TC\src\parser.c:189:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp130
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp130,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp131, token
 ; D:\TC\src\parser.c:190:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp132
	movq	%rax, -16(%rbp)	 ; tmp132, token_ptr
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp133
	movl	24(%rax), %eax	 ; token_ptr_77->type, _2
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	 ;, _2
	je	.L48	 ;,
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp134
	movl	24(%rax), %eax	 ; token_ptr_77->type, _3
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	 ;, _3
	jne	.L49	 ;,
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp135
	movq	(%rax), %rax	 ; token_ptr_77->lexeme, _4
	movq	%rax, %rcx	 ; _4,
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	 ; _5
	jne	.L48	 ;,
.L49:
 ; D:\TC\src\parser.c:192:         parser_error("Expected method return type after 'method'", token);
	movq	-8(%rbp), %rax	 ; token, tmp136
	movq	%rax, %rdx	 ; tmp136,
	leaq	.LC18(%rip), %rax	 ;, tmp137
	movq	%rax, %rcx	 ; tmp137,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:193:         return NULL;
	movl	$0, %eax	 ;, _47
	jmp	.L50	 ;
.L48:
 ; D:\TC\src\parser.c:195:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	-16(%rbp), %rax	 ; token_ptr, tmp138
	movq	(%rax), %rdx	 ; token_ptr_77->lexeme, _6
	movq	24(%rbp), %rax	 ; now_scope, tmp139
	movq	%rax, %rcx	 ; tmp139,
	call	search	 ;
	movq	%rax, -48(%rbp)	 ; tmp140, return_type
 ; D:\TC\src\parser.c:196:     if (return_type == 0) {
	cmpq	$0, -48(%rbp)	 ;, return_type
	jne	.L51	 ;,
 ; D:\TC\src\parser.c:197:         parser_error("Unknown return type for method", token);
	movq	-8(%rbp), %rax	 ; token, tmp141
	movq	%rax, %rdx	 ; tmp141,
	leaq	.LC19(%rip), %rax	 ;, tmp142
	movq	%rax, %rcx	 ; tmp142,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:198:         return NULL;
	movl	$0, %eax	 ;, _47
	jmp	.L50	 ;
.L51:
 ; D:\TC\src\parser.c:200:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp143
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp143,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp144, token
 ; D:\TC\src\parser.c:201:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp145
	movq	%rax, -16(%rbp)	 ; tmp145, token_ptr
 ; D:\TC\src\parser.c:202:     if (token_ptr->type != IDENTIFIER) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp146
	movl	24(%rax), %eax	 ; token_ptr_85->type, _7
 ; D:\TC\src\parser.c:202:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, %eax	 ;, _7
	je	.L52	 ;,
 ; D:\TC\src\parser.c:203:         parser_error("Expected method name after return type", token);
	movq	-8(%rbp), %rax	 ; token, tmp147
	movq	%rax, %rdx	 ; tmp147,
	leaq	.LC20(%rip), %rax	 ;, tmp148
	movq	%rax, %rcx	 ; tmp148,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:204:         return NULL;
	movl	$0, %eax	 ;, _47
	jmp	.L50	 ;
.L52:
 ; D:\TC\src\parser.c:206:     Name* name = create_name(token_ptr->lexeme, NAME_METHOD, return_type, NULL, now_scope);
	movq	-16(%rbp), %rax	 ; token_ptr, tmp149
	movq	(%rax), %rax	 ; token_ptr_85->lexeme, _8
	movq	-48(%rbp), %rcx	 ; return_type, tmp150
	movq	24(%rbp), %rdx	 ; now_scope, tmp151
	movq	%rdx, 32(%rsp)	 ; tmp151,
	movl	$0, %r9d	 ;,
	movq	%rcx, %r8	 ; tmp150,
	movl	$3, %edx	 ;,
	movq	%rax, %rcx	 ; _8,
	call	create_name	 ;
	movq	%rax, -56(%rbp)	 ; tmp152, name
 ; D:\TC\src\parser.c:207:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp153
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp153,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp154, token
 ; D:\TC\src\parser.c:208:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp155
	movq	%rax, -16(%rbp)	 ; tmp155, token_ptr
 ; D:\TC\src\parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp156
	movl	24(%rax), %eax	 ; token_ptr_90->type, _9
 ; D:\TC\src\parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _9
	jne	.L53	 ;,
 ; D:\TC\src\parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp157
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.25_10
	movq	-16(%rbp), %rax	 ; token_ptr, tmp158
	movq	(%rax), %rax	 ; token_ptr_90->lexeme, _11
	movq	%rax, %rcx	 ; _11,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _12
	jne	.L54	 ;,
.L53:
 ; D:\TC\src\parser.c:210:         parser_error("Expected '(' after method name", token);
	movq	-8(%rbp), %rax	 ; token, tmp159
	movq	%rax, %rdx	 ; tmp159,
	leaq	.LC21(%rip), %rax	 ;, tmp160
	movq	%rax, %rcx	 ; tmp160,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:211:         return NULL;
	movl	$0, %eax	 ;, _47
	jmp	.L50	 ;
.L54:
 ; D:\TC\src\parser.c:213:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp161
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp161,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp162, token
 ; D:\TC\src\parser.c:214:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp163
	movq	%rax, -16(%rbp)	 ; tmp163, token_ptr
 ; D:\TC\src\parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	movq	-16(%rbp), %rax	 ; token_ptr, tmp164
	movl	24(%rax), %eax	 ; token_ptr_94->type, _13
 ; D:\TC\src\parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	cmpl	$6, %eax	 ;, _13
	jne	.L55	 ;,
 ; D:\TC\src\parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp165
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD.26_14
	movq	-16(%rbp), %rax	 ; token_ptr, tmp166
	movq	(%rax), %rax	 ; token_ptr_94->lexeme, _15
	movq	%rax, %rcx	 ; _15,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	testb	%al, %al	 ; _16
	jne	.L56	 ;,
.L55:
 ; D:\TC\src\parser.c:216:         parser_error("Expected 'self' as first parameter of method", token);
	movq	-8(%rbp), %rax	 ; token, tmp167
	movq	%rax, %rdx	 ; tmp167,
	leaq	.LC22(%rip), %rax	 ;, tmp168
	movq	%rax, %rcx	 ; tmp168,
	call	parser_error	 ;
.L56:
 ; D:\TC\src\parser.c:217:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp169
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp169,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp170, token
 ; D:\TC\src\parser.c:218:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp171
	movq	%rax, -16(%rbp)	 ; tmp171, token_ptr
 ; D:\TC\src\parser.c:219:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rax, -64(%rbp)	 ; tmp172, parameters
 ; D:\TC\src\parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	movq	-40(%rbp), %rdx	 ; self, tmp173
	movq	32(%rbp), %rax	 ; class_name, tmp174
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp174,
	call	create_variable	 ;
	movq	%rax, %rdx	 ;, _17
 ; D:\TC\src\parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	movq	-64(%rbp), %rax	 ; parameters, tmp175
	movq	%rax, %rcx	 ; tmp175,
	call	list_append	 ;
 ; D:\TC\src\parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L57	 ;
.L65:
 ; D:\TC\src\parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp176
	movl	24(%rax), %eax	 ; token_ptr_43->type, _18
 ; D:\TC\src\parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, %eax	 ;, _18
	jne	.L58	 ;,
 ; D:\TC\src\parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp177
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL.27_19
	movq	-16(%rbp), %rax	 ; token_ptr, tmp178
	movq	(%rax), %rax	 ; token_ptr_43->lexeme, _20
	movq	%rax, %rcx	 ; _20,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; _21
	je	.L58	 ;,
 ; D:\TC\src\parser.c:223:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp179
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp179,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp180, token
 ; D:\TC\src\parser.c:224:             token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp181
	movq	%rax, -16(%rbp)	 ; tmp181, token_ptr
 ; D:\TC\src\parser.c:230:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	40(%rbp), %rcx	 ; parser, tmp182
	movq	-32(%rbp), %rdx	 ; method_scope, tmp183
	movq	16(%rbp), %rax	 ; lexer, tmp184
	movq	%rcx, %r8	 ; tmp182,
	movq	%rax, %rcx	 ; tmp184,
	call	parse_variable	 ;
	movq	%rax, -72(%rbp)	 ; tmp185, parameter
 ; D:\TC\src\parser.c:231:         if (parameter == 0)
	cmpq	$0, -72(%rbp)	 ;, parameter
	je	.L59	 ;,
	jmp	.L74	 ;
.L58:
 ; D:\TC\src\parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	movq	-16(%rbp), %rax	 ; token_ptr, tmp186
	movl	24(%rax), %eax	 ; token_ptr_43->type, _22
 ; D:\TC\src\parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, %eax	 ;, _22
	jne	.L61	 ;,
 ; D:\TC\src\parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp187
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.28_23
	movq	-16(%rbp), %rax	 ; token_ptr, tmp188
	movq	(%rax), %rax	 ; token_ptr_43->lexeme, _24
	movq	%rax, %rcx	 ; _24,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	testb	%al, %al	 ; _25
	jne	.L62	 ;,
.L61:
 ; D:\TC\src\parser.c:227:             parser_error("Expected ',' or ')' after method parameter", token);
	movq	-8(%rbp), %rax	 ; token, tmp189
	movq	%rax, %rdx	 ; tmp189,
	leaq	.LC23(%rip), %rax	 ;, tmp190
	movq	%rax, %rcx	 ; tmp190,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:228:             return NULL;
	movl	$0, %eax	 ;, _47
	jmp	.L50	 ;
.L59:
 ; D:\TC\src\parser.c:232:             parser_error("Failed to parse method parameter", token);
	movq	-8(%rbp), %rax	 ; token, tmp191
	movq	%rax, %rdx	 ; tmp191,
	leaq	.LC24(%rip), %rax	 ;, tmp192
	movq	%rax, %rcx	 ; tmp192,
	call	parser_error	 ;
	jmp	.L63	 ;
.L74:
 ; D:\TC\src\parser.c:233:         else if (((parameter))->value != 0)
	movq	-72(%rbp), %rax	 ; parameter, tmp193
	movq	16(%rax), %rax	 ; parameter_111->value, _26
 ; D:\TC\src\parser.c:233:         else if (((parameter))->value != 0)
	testq	%rax, %rax	 ; _26
	je	.L64	 ;,
 ; D:\TC\src\parser.c:234:             parser_error("Method parameters cannot have default values", token);
	movq	-8(%rbp), %rax	 ; token, tmp194
	movq	%rax, %rdx	 ; tmp194,
	leaq	.LC25(%rip), %rax	 ;, tmp195
	movq	%rax, %rcx	 ; tmp195,
	call	parser_error	 ;
	jmp	.L63	 ;
.L64:
 ; D:\TC\src\parser.c:236:             list_append(parameters, (pointer)parameter);
	movq	-72(%rbp), %rdx	 ; parameter, tmp196
	movq	-64(%rbp), %rax	 ; parameters, tmp197
	movq	%rax, %rcx	 ; tmp197,
	call	list_append	 ;
.L63:
 ; D:\TC\src\parser.c:237:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp198
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp198,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp199, token
 ; D:\TC\src\parser.c:238:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp200
	movq	%rax, -16(%rbp)	 ; tmp200, token_ptr
.L57:
 ; D:\TC\src\parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp201
	movl	24(%rax), %eax	 ; token_ptr_43->type, _27
 ; D:\TC\src\parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _27
	jne	.L65	 ;,
 ; D:\TC\src\parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp202
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.29_28
	movq	-16(%rbp), %rax	 ; token_ptr, tmp203
	movq	(%rax), %rax	 ; token_ptr_43->lexeme, _29
	movq	%rax, %rcx	 ; _29,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _30
	je	.L65	 ;,
.L62:
 ; D:\TC\src\parser.c:240:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp204
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp204,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp205, token
 ; D:\TC\src\parser.c:241:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp206
	movq	%rax, -16(%rbp)	 ; tmp206, token_ptr
 ; D:\TC\src\parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp207
	movl	24(%rax), %eax	 ; token_ptr_123->type, _31
 ; D:\TC\src\parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _31
	jne	.L66	 ;,
 ; D:\TC\src\parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp208
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.30_32
	movq	-16(%rbp), %rax	 ; token_ptr, tmp209
	movq	(%rax), %rax	 ; token_ptr_123->lexeme, _33
	movq	%rax, %rcx	 ; _33,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _34
	jne	.L67	 ;,
.L66:
 ; D:\TC\src\parser.c:243:         parser_error("Expected '{' to start method body", token);
	movq	-8(%rbp), %rax	 ; token, tmp210
	movq	%rax, %rdx	 ; tmp210,
	leaq	.LC26(%rip), %rax	 ;, tmp211
	movq	%rax, %rcx	 ; tmp211,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:244:         return NULL;
	movl	$0, %eax	 ;, _47
	jmp	.L50	 ;
.L67:
 ; D:\TC\src\parser.c:246:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, -80(%rbp)	 ; tmp212, body
 ; D:\TC\src\parser.c:247:     ((parser))->in_function = true;
	movq	40(%rbp), %rax	 ; parser, tmp213
	movb	$1, (%rax)	 ;, parser_109(D)->in_function
 ; D:\TC\src\parser.c:248:     ((parser))->in_method = true;
	movq	40(%rbp), %rax	 ; parser, tmp214
	movb	$1, 1(%rax)	 ;, parser_109(D)->in_method
 ; D:\TC\src\parser.c:249:     bool have_return = false;
	movb	$0, -17(%rbp)	 ;, have_return
 ; D:\TC\src\parser.c:250:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp215
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp215,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp216, token
 ; D:\TC\src\parser.c:251:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp217
	movq	%rax, -16(%rbp)	 ; tmp217, token_ptr
 ; D:\TC\src\parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L68	 ;
.L72:
 ; D:\TC\src\parser.c:253:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	40(%rbp), %rcx	 ; parser, tmp218
	movq	-32(%rbp), %rdx	 ; method_scope, tmp219
	movq	16(%rbp), %rax	 ; lexer, tmp220
	movq	%rcx, %r8	 ; tmp218,
	movq	%rax, %rcx	 ; tmp220,
	call	parse_statement	 ;
	movq	%rax, -88(%rbp)	 ; tmp221, statement
 ; D:\TC\src\parser.c:254:         if (statement == 0)
	cmpq	$0, -88(%rbp)	 ;, statement
	jne	.L69	 ;,
 ; D:\TC\src\parser.c:255:             parser_error("Failed to parse method body statement", token);
	movq	-8(%rbp), %rax	 ; token, tmp222
	movq	%rax, %rdx	 ; tmp222,
	leaq	.LC27(%rip), %rax	 ;, tmp223
	movq	%rax, %rcx	 ; tmp223,
	call	parser_error	 ;
	jmp	.L70	 ;
.L69:
 ; D:\TC\src\parser.c:256:         else if (have_return)
	cmpb	$0, -17(%rbp)	 ;, have_return
	je	.L70	 ;,
 ; D:\TC\src\parser.c:257:             parser_error("Unreachable code after return statement", token);
	movq	-8(%rbp), %rax	 ; token, tmp224
	movq	%rax, %rdx	 ; tmp224,
	leaq	.LC16(%rip), %rax	 ;, tmp225
	movq	%rax, %rcx	 ; tmp225,
	call	parser_error	 ;
.L70:
 ; D:\TC\src\parser.c:258:         if (((statement))->type == RETURN_STATEMENT)
	movq	-88(%rbp), %rax	 ; statement, tmp226
	movl	8(%rax), %eax	 ; statement_140->type, _35
 ; D:\TC\src\parser.c:258:         if (((statement))->type == RETURN_STATEMENT)
	cmpl	$5, %eax	 ;, _35
	jne	.L71	 ;,
 ; D:\TC\src\parser.c:259:             have_return = true;
	movb	$1, -17(%rbp)	 ;, have_return
.L71:
 ; D:\TC\src\parser.c:260:         list_append(body, (pointer)statement);
	movq	-88(%rbp), %rdx	 ; statement, tmp227
	movq	-80(%rbp), %rax	 ; body, tmp228
	movq	%rax, %rcx	 ; tmp228,
	call	list_append	 ;
 ; D:\TC\src\parser.c:261:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp229
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp229,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp230, token
 ; D:\TC\src\parser.c:262:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp231
	movq	%rax, -16(%rbp)	 ; tmp231, token_ptr
.L68:
 ; D:\TC\src\parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp232
	movl	24(%rax), %eax	 ; token_ptr_44->type, _36
 ; D:\TC\src\parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _36
	jne	.L72	 ;,
 ; D:\TC\src\parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp233
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.31_37
	movq	-16(%rbp), %rax	 ; token_ptr, tmp234
	movq	(%rax), %rax	 ; token_ptr_44->lexeme, _38
	movq	%rax, %rcx	 ; _38,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _39
	je	.L72	 ;,
 ; D:\TC\src\parser.c:264:     ((parser))->in_function = false;
	movq	40(%rbp), %rax	 ; parser, tmp235
	movb	$0, (%rax)	 ;, parser_109(D)->in_function
 ; D:\TC\src\parser.c:265:     ((parser))->in_method = false;
	movq	40(%rbp), %rax	 ; parser, tmp236
	movb	$0, 1(%rax)	 ;, parser_109(D)->in_method
 ; D:\TC\src\parser.c:266:     if (!have_return && return_type != name_void)
	cmpb	$0, -17(%rbp)	 ;, have_return
	jne	.L73	 ;,
 ; D:\TC\src\parser.c:266:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp237
	movq	(%rax), %rax	 ; name_void, name_void.32_40
 ; D:\TC\src\parser.c:266:     if (!have_return && return_type != name_void)
	cmpq	%rax, -48(%rbp)	 ; name_void.32_40, return_type
	je	.L73	 ;,
 ; D:\TC\src\parser.c:267:         parser_error("Method missing return statement", token);
	movq	-8(%rbp), %rax	 ; token, tmp238
	movq	%rax, %rdx	 ; tmp238,
	leaq	.LC28(%rip), %rax	 ;, tmp239
	movq	%rax, %rcx	 ; tmp239,
	call	parser_error	 ;
.L73:
 ; D:\TC\src\parser.c:268:     return create_method(name, return_type, parameters, body, method_scope);
	movq	-80(%rbp), %r9	 ; body, tmp240
	movq	-64(%rbp), %r8	 ; parameters, tmp241
	movq	-48(%rbp), %rdx	 ; return_type, tmp242
	movq	-56(%rbp), %rax	 ; name, tmp243
	movq	-32(%rbp), %rcx	 ; method_scope, tmp244
	movq	%rcx, 32(%rsp)	 ; tmp244,
	movq	%rax, %rcx	 ; tmp243,
	call	create_method	 ;
.L50:
 ; D:\TC\src\parser.c:269: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC29:
	.ascii "Expected class name after 'class'\0"
	.align 8
.LC30:
	.ascii "Expected '{' to start class body\0"
.LC31:
	.ascii "Failed to parse class method\0"
	.align 8
.LC32:
	.ascii "Failed to parse class variable\0"
	.align 8
.LC33:
	.ascii "Expected ';' after class variable declaration\0"
	.align 8
.LC34:
	.ascii "Unexpected token in class member\0"
	.text
	.def	parse_class;	.scl	3;	.type	32;	.endef
parse_class:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$112, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:274:     Token* token = 0;
	movq	$0, -8(%rbp)	 ;, token
 ; D:\TC\src\parser.c:275:     Token* token_ptr = NULL;
	movq	$0, -16(%rbp)	 ;, token_ptr
 ; D:\TC\src\parser.c:276:     Scope* class_scope = create_scope(now_scope);
	movq	24(%rbp), %rax	 ; now_scope, tmp108
	movq	%rax, %rcx	 ; tmp108,
	call	create_scope	 ;
	movq	%rax, -24(%rbp)	 ; tmp109, class_scope
 ; D:\TC\src\parser.c:277:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp110
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp110,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp111, token
 ; D:\TC\src\parser.c:278:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp112
	movq	%rax, -16(%rbp)	 ; tmp112, token_ptr
 ; D:\TC\src\parser.c:279:     if (token_ptr->type != IDENTIFIER) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp113
	movl	24(%rax), %eax	 ; token_ptr_48->type, _1
 ; D:\TC\src\parser.c:279:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, %eax	 ;, _1
	je	.L76	 ;,
 ; D:\TC\src\parser.c:280:         parser_error("Expected class name after 'class'", token);
	movq	-8(%rbp), %rax	 ; token, tmp114
	movq	%rax, %rdx	 ; tmp114,
	leaq	.LC29(%rip), %rax	 ;, tmp115
	movq	%rax, %rcx	 ; tmp115,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:281:         return NULL;
	movl	$0, %eax	 ;, _27
	jmp	.L77	 ;
.L76:
 ; D:\TC\src\parser.c:283:     Name* name = create_name(token_ptr->lexeme, NAME_CLASS, NULL, class_scope, now_scope);
	movq	-16(%rbp), %rax	 ; token_ptr, tmp116
	movq	(%rax), %rax	 ; token_ptr_48->lexeme, _2
	movq	-24(%rbp), %rcx	 ; class_scope, tmp117
	movq	24(%rbp), %rdx	 ; now_scope, tmp118
	movq	%rdx, 32(%rsp)	 ; tmp118,
	movq	%rcx, %r9	 ; tmp117,
	movl	$0, %r8d	 ;,
	movl	$4, %edx	 ;,
	movq	%rax, %rcx	 ; _2,
	call	create_name	 ;
	movq	%rax, -32(%rbp)	 ; tmp119, name
 ; D:\TC\src\parser.c:284:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp120
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp120,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp121, token
 ; D:\TC\src\parser.c:285:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp122
	movq	%rax, -16(%rbp)	 ; tmp122, token_ptr
 ; D:\TC\src\parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp123
	movl	24(%rax), %eax	 ; token_ptr_53->type, _3
 ; D:\TC\src\parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _3
	jne	.L78	 ;,
 ; D:\TC\src\parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp124
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.33_4
	movq	-16(%rbp), %rax	 ; token_ptr, tmp125
	movq	(%rax), %rax	 ; token_ptr_53->lexeme, _5
	movq	%rax, %rcx	 ; _5,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _6
	jne	.L79	 ;,
.L78:
 ; D:\TC\src\parser.c:287:         parser_error("Expected '{' to start class body", token);
	movq	-8(%rbp), %rax	 ; token, tmp126
	movq	%rax, %rdx	 ; tmp126,
	leaq	.LC30(%rip), %rax	 ;, tmp127
	movq	%rax, %rcx	 ; tmp127,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:288:         return NULL;
	movl	$0, %eax	 ;, _27
	jmp	.L77	 ;
.L79:
 ; D:\TC\src\parser.c:290:     list(ClassMember*) members = create_list();
	call	create_list	 ;
	movq	%rax, -40(%rbp)	 ; tmp128, members
 ; D:\TC\src\parser.c:291:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp129
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp129,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp130, token
 ; D:\TC\src\parser.c:292:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp131
	movq	%rax, -16(%rbp)	 ; tmp131, token_ptr
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L80	 ;
.L88:
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp132
	movl	24(%rax), %eax	 ; token_ptr_26->type, _7
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	 ;, _7
	jne	.L81	 ;,
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	movq	.refptr.METHOD_KEYWORD(%rip), %rax	 ;, tmp133
	movq	(%rax), %rdx	 ; METHOD_KEYWORD, METHOD_KEYWORD.34_8
	movq	-16(%rbp), %rax	 ; token_ptr, tmp134
	movq	(%rax), %rax	 ; token_ptr_26->lexeme, _9
	movq	%rax, %rcx	 ; _9,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	testb	%al, %al	 ; _10
	je	.L81	 ;,
 ; D:\TC\src\parser.c:295:             Method* method = parse_method(lexer, class_scope, name, parser);
	movq	32(%rbp), %r8	 ; parser, tmp135
	movq	-32(%rbp), %rcx	 ; name, tmp136
	movq	-24(%rbp), %rdx	 ; class_scope, tmp137
	movq	16(%rbp), %rax	 ; lexer, tmp138
	movq	%r8, %r9	 ; tmp135,
	movq	%rcx, %r8	 ; tmp136,
	movq	%rax, %rcx	 ; tmp138,
	call	parse_method	 ;
	movq	%rax, -48(%rbp)	 ; tmp139, method
 ; D:\TC\src\parser.c:296:             if (method == 0)
	cmpq	$0, -48(%rbp)	 ;, method
	jne	.L82	 ;,
 ; D:\TC\src\parser.c:297:                 parser_error("Failed to parse class method", token);
	movq	-8(%rbp), %rax	 ; token, tmp140
	movq	%rax, %rdx	 ; tmp140,
	leaq	.LC31(%rip), %rax	 ;, tmp141
	movq	%rax, %rcx	 ; tmp141,
	call	parser_error	 ;
.L82:
 ; D:\TC\src\parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	-48(%rbp), %rax	 ; method, tmp142
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp142,
	movl	$0, %ecx	 ;,
	call	create_class_member	 ;
	movq	%rax, %rdx	 ;, _11
 ; D:\TC\src\parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	-40(%rbp), %rax	 ; members, tmp143
	movq	%rax, %rcx	 ; tmp143,
	call	list_append	 ;
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	jmp	.L83	 ;
.L81:
 ; D:\TC\src\parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp144
	movl	24(%rax), %eax	 ; token_ptr_26->type, _12
 ; D:\TC\src\parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	cmpl	$6, %eax	 ;, _12
	jne	.L84	 ;,
 ; D:\TC\src\parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp145
	movq	(%rax), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD.35_13
	movq	-16(%rbp), %rax	 ; token_ptr, tmp146
	movq	(%rax), %rax	 ; token_ptr_26->lexeme, _14
	movq	%rax, %rcx	 ; _14,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; _15
	je	.L84	 ;,
 ; D:\TC\src\parser.c:300:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp147
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp147,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp148, token
 ; D:\TC\src\parser.c:301:             token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp149
	movq	%rax, -16(%rbp)	 ; tmp149, token_ptr
 ; D:\TC\src\parser.c:302:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp150
	movq	-24(%rbp), %rdx	 ; class_scope, tmp151
	movq	16(%rbp), %rax	 ; lexer, tmp152
	movq	%rcx, %r8	 ; tmp150,
	movq	%rax, %rcx	 ; tmp152,
	call	parse_variable	 ;
	movq	%rax, -56(%rbp)	 ; tmp153, variable
 ; D:\TC\src\parser.c:303:             if (variable == 0)
	cmpq	$0, -56(%rbp)	 ;, variable
	jne	.L85	 ;,
 ; D:\TC\src\parser.c:304:                 parser_error("Failed to parse class variable", token);
	movq	-8(%rbp), %rax	 ; token, tmp154
	movq	%rax, %rdx	 ; tmp154,
	leaq	.LC32(%rip), %rax	 ;, tmp155
	movq	%rax, %rcx	 ; tmp155,
	call	parser_error	 ;
.L85:
 ; D:\TC\src\parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	-56(%rbp), %rax	 ; variable, tmp156
	movq	%rax, %r8	 ; tmp156,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_class_member	 ;
	movq	%rax, %rdx	 ;, _16
 ; D:\TC\src\parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	-40(%rbp), %rax	 ; members, tmp157
	movq	%rax, %rcx	 ; tmp157,
	call	list_append	 ;
 ; D:\TC\src\parser.c:306:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp158
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp158,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp159, token
 ; D:\TC\src\parser.c:307:             token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp160
	movq	%rax, -16(%rbp)	 ; tmp160, token_ptr
 ; D:\TC\src\parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	-16(%rbp), %rax	 ; token_ptr, tmp161
	movl	24(%rax), %eax	 ; token_ptr_81->type, _17
 ; D:\TC\src\parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, %eax	 ;, _17
	jne	.L86	 ;,
 ; D:\TC\src\parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp162
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.36_18
	movq	-16(%rbp), %rax	 ; token_ptr, tmp163
	movq	(%rax), %rax	 ; token_ptr_81->lexeme, _19
	movq	%rax, %rcx	 ; _19,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; _20
	jne	.L89	 ;,
.L86:
 ; D:\TC\src\parser.c:309:                 parser_error("Expected ';' after class variable declaration", token);
	movq	-8(%rbp), %rax	 ; token, tmp164
	movq	%rax, %rdx	 ; tmp164,
	leaq	.LC33(%rip), %rax	 ;, tmp165
	movq	%rax, %rcx	 ; tmp165,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	jmp	.L89	 ;
.L84:
 ; D:\TC\src\parser.c:311:             parser_error("Unexpected token in class member", token);
	movq	-8(%rbp), %rax	 ; token, tmp166
	movq	%rax, %rdx	 ; tmp166,
	leaq	.LC34(%rip), %rax	 ;, tmp167
	movq	%rax, %rcx	 ; tmp167,
	call	parser_error	 ;
	jmp	.L83	 ;
.L89:
 ; D:\TC\src\parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	nop	
.L83:
 ; D:\TC\src\parser.c:312:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp168
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp168,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp169, token
 ; D:\TC\src\parser.c:313:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp170
	movq	%rax, -16(%rbp)	 ; tmp170, token_ptr
.L80:
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp171
	movl	24(%rax), %eax	 ; token_ptr_26->type, _21
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _21
	jne	.L88	 ;,
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp172
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.37_22
	movq	-16(%rbp), %rax	 ; token_ptr, tmp173
	movq	(%rax), %rax	 ; token_ptr_26->lexeme, _23
	movq	%rax, %rcx	 ; _23,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _24
	je	.L88	 ;,
 ; D:\TC\src\parser.c:315:     return create_class(name, members, class_scope);
	movq	-24(%rbp), %rcx	 ; class_scope, tmp174
	movq	-40(%rbp), %rdx	 ; members, tmp175
	movq	-32(%rbp), %rax	 ; name, tmp176
	movq	%rcx, %r8	 ; tmp174,
	movq	%rax, %rcx	 ; tmp176,
	call	create_class	 ;
.L77:
 ; D:\TC\src\parser.c:316: }
	leave	
	ret	
	.section .rdata,"dr"
.LC35:
	.ascii "Expected variable type\0"
	.align 8
.LC36:
	.ascii "Expected a type for variable declaration\0"
.LC37:
	.ascii "Unknown variable type\0"
.LC38:
	.ascii "Expected variable name\0"
	.align 8
.LC39:
	.ascii "Failed to parse variable initializer\0"
	.text
	.def	parse_variable;	.scl	3;	.type	32;	.endef
parse_variable:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$96, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:321:     Token* token = 0;
	movq	$0, -16(%rbp)	 ;, token
 ; D:\TC\src\parser.c:322:     Token* token_ptr = NULL;
	movq	$0, -24(%rbp)	 ;, token_ptr
 ; D:\TC\src\parser.c:323:     token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp97
	movq	%rax, %rcx	 ; tmp97,
	call	peek_current_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp98, token
 ; D:\TC\src\parser.c:324:     token_ptr = token;
	movq	-16(%rbp), %rax	 ; token, tmp99
	movq	%rax, -24(%rbp)	 ; tmp99, token_ptr
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	-24(%rbp), %rax	 ; token_ptr, tmp100
	movl	24(%rax), %eax	 ; token_ptr_28->type, _1
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	 ;, _1
	je	.L91	 ;,
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	-24(%rbp), %rax	 ; token_ptr, tmp101
	movl	24(%rax), %eax	 ; token_ptr_28->type, _2
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	 ;, _2
	jne	.L92	 ;,
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	-24(%rbp), %rax	 ; token_ptr, tmp102
	movq	(%rax), %rax	 ; token_ptr_28->lexeme, _3
	movq	%rax, %rcx	 ; _3,
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	 ; _4
	jne	.L91	 ;,
.L92:
 ; D:\TC\src\parser.c:326:         parser_error("Expected variable type", token);
	movq	-16(%rbp), %rax	 ; token, tmp103
	movq	%rax, %rdx	 ; tmp103,
	leaq	.LC35(%rip), %rax	 ;, tmp104
	movq	%rax, %rcx	 ; tmp104,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:327:         return NULL;
	movl	$0, %eax	 ;, _15
	jmp	.L93	 ;
.L91:
 ; D:\TC\src\parser.c:329:     Name* type = search(now_scope, token_ptr->lexeme);
	movq	-24(%rbp), %rax	 ; token_ptr, tmp105
	movq	(%rax), %rdx	 ; token_ptr_28->lexeme, _5
	movq	24(%rbp), %rax	 ; now_scope, tmp106
	movq	%rax, %rcx	 ; tmp106,
	call	search	 ;
	movq	%rax, -32(%rbp)	 ; tmp107, type
 ; D:\TC\src\parser.c:330:     if (type != 0) {
	cmpq	$0, -32(%rbp)	 ;, type
	je	.L94	 ;,
 ; D:\TC\src\parser.c:331:         Name* type_ptr = (type);
	movq	-32(%rbp), %rax	 ; type, tmp108
	movq	%rax, -40(%rbp)	 ; tmp108, type_ptr
 ; D:\TC\src\parser.c:332:         if (type_ptr->kind != NAME_TYPE && type_ptr->kind != NAME_CLASS)
	movq	-40(%rbp), %rax	 ; type_ptr, tmp109
	movl	24(%rax), %eax	 ; type_ptr_36->kind, _6
 ; D:\TC\src\parser.c:332:         if (type_ptr->kind != NAME_TYPE && type_ptr->kind != NAME_CLASS)
	testl	%eax, %eax	 ; _6
	je	.L95	 ;,
 ; D:\TC\src\parser.c:332:         if (type_ptr->kind != NAME_TYPE && type_ptr->kind != NAME_CLASS)
	movq	-40(%rbp), %rax	 ; type_ptr, tmp110
	movl	24(%rax), %eax	 ; type_ptr_36->kind, _7
 ; D:\TC\src\parser.c:332:         if (type_ptr->kind != NAME_TYPE && type_ptr->kind != NAME_CLASS)
	cmpl	$4, %eax	 ;, _7
	je	.L95	 ;,
 ; D:\TC\src\parser.c:333:             parser_error("Expected a type for variable declaration", token);
	movq	-16(%rbp), %rax	 ; token, tmp111
	movq	%rax, %rdx	 ; tmp111,
	leaq	.LC36(%rip), %rax	 ;, tmp112
	movq	%rax, %rcx	 ; tmp112,
	call	parser_error	 ;
	jmp	.L95	 ;
.L94:
 ; D:\TC\src\parser.c:335:         parser_error("Unknown variable type", token);
	movq	-16(%rbp), %rax	 ; token, tmp113
	movq	%rax, %rdx	 ; tmp113,
	leaq	.LC37(%rip), %rax	 ;, tmp114
	movq	%rax, %rcx	 ; tmp114,
	call	parser_error	 ;
.L95:
 ; D:\TC\src\parser.c:336:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp115
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp115,
	call	get_next_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp116, token
 ; D:\TC\src\parser.c:337:     token_ptr = token;
	movq	-16(%rbp), %rax	 ; token, tmp117
	movq	%rax, -24(%rbp)	 ; tmp117, token_ptr
 ; D:\TC\src\parser.c:338:     if (token_ptr->type != IDENTIFIER)
	movq	-24(%rbp), %rax	 ; token_ptr, tmp118
	movl	24(%rax), %eax	 ; token_ptr_40->type, _8
 ; D:\TC\src\parser.c:338:     if (token_ptr->type != IDENTIFIER)
	cmpl	$1, %eax	 ;, _8
	je	.L96	 ;,
 ; D:\TC\src\parser.c:339:         parser_error("Expected variable name", token);
	movq	-16(%rbp), %rax	 ; token, tmp119
	movq	%rax, %rdx	 ; tmp119,
	leaq	.LC38(%rip), %rax	 ;, tmp120
	movq	%rax, %rcx	 ; tmp120,
	call	parser_error	 ;
.L96:
 ; D:\TC\src\parser.c:340:     Name* name = create_name(token_ptr->lexeme, NAME_VARIABLE, type, NULL, now_scope);
	movq	-24(%rbp), %rax	 ; token_ptr, tmp121
	movq	(%rax), %rax	 ; token_ptr_40->lexeme, _9
	movq	-32(%rbp), %rcx	 ; type, tmp122
	movq	24(%rbp), %rdx	 ; now_scope, tmp123
	movq	%rdx, 32(%rsp)	 ; tmp123,
	movl	$0, %r9d	 ;,
	movq	%rcx, %r8	 ; tmp122,
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; _9,
	call	create_name	 ;
	movq	%rax, -48(%rbp)	 ; tmp124, name
 ; D:\TC\src\parser.c:341:     Expression* value = 0;
	movq	$0, -8(%rbp)	 ;, value
 ; D:\TC\src\parser.c:342:     token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp125
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp125,
	call	peek_next_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp126, token
 ; D:\TC\src\parser.c:343:     token_ptr = token;
	movq	-16(%rbp), %rax	 ; token, tmp127
	movq	%rax, -24(%rbp)	 ; tmp127, token_ptr
 ; D:\TC\src\parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	movq	-24(%rbp), %rax	 ; token_ptr, tmp128
	movl	24(%rax), %eax	 ; token_ptr_47->type, _10
 ; D:\TC\src\parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _10
	jne	.L97	 ;,
 ; D:\TC\src\parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp129
	movq	(%rax), %rdx	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL.38_11
	movq	-24(%rbp), %rax	 ; token_ptr, tmp130
	movq	(%rax), %rax	 ; token_ptr_47->lexeme, _12
	movq	%rax, %rcx	 ; _12,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	 ; _13
	je	.L97	 ;,
 ; D:\TC\src\parser.c:345:         token = get_next_token(lexer, true);  // consume '='
	movq	16(%rbp), %rax	 ; lexer, tmp131
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp131,
	call	get_next_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp132, token
 ; D:\TC\src\parser.c:346:         token_ptr = token;
	movq	-16(%rbp), %rax	 ; token, tmp133
	movq	%rax, -24(%rbp)	 ; tmp133, token_ptr
 ; D:\TC\src\parser.c:347:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp134
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp134,
	call	get_next_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp135, token
 ; D:\TC\src\parser.c:348:         token_ptr = token;
	movq	-16(%rbp), %rax	 ; token, tmp136
	movq	%rax, -24(%rbp)	 ; tmp136, token_ptr
 ; D:\TC\src\parser.c:349:         value = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp137
	movq	24(%rbp), %rdx	 ; now_scope, tmp138
	movq	16(%rbp), %rax	 ; lexer, tmp139
	movq	%rcx, %r8	 ; tmp137,
	movq	%rax, %rcx	 ; tmp139,
	call	parse_expression	 ;
	movq	%rax, -8(%rbp)	 ; tmp140, value
 ; D:\TC\src\parser.c:350:         if (value == 0)
	cmpq	$0, -8(%rbp)	 ;, value
	jne	.L97	 ;,
 ; D:\TC\src\parser.c:351:             parser_error("Failed to parse variable initializer", token);
	movq	-16(%rbp), %rax	 ; token, tmp141
	movq	%rax, %rdx	 ; tmp141,
	leaq	.LC39(%rip), %rax	 ;, tmp142
	movq	%rax, %rcx	 ; tmp142,
	call	parser_error	 ;
.L97:
 ; D:\TC\src\parser.c:353:     return create_variable(type, name, value);
	movq	-8(%rbp), %rcx	 ; value, tmp143
	movq	-48(%rbp), %rdx	 ; name, tmp144
	movq	-32(%rbp), %rax	 ; type, tmp145
	movq	%rcx, %r8	 ; tmp143,
	movq	%rax, %rcx	 ; tmp145,
	call	create_variable	 ;
.L93:
 ; D:\TC\src\parser.c:354: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC40:
	.ascii "Cannot use 'break' outside of a loop\0"
	.align 8
.LC41:
	.ascii "Cannot use 'continue' outside of a loop\0"
.LC42:
	.ascii "Failed to parse statement\0"
.LC43:
	.ascii "Expected ';' after statement\0"
	.text
	.def	parse_statement;	.scl	3;	.type	32;	.endef
parse_statement:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$80, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:359:     Token* token = 0;
	movq	$0, -16(%rbp)	 ;, token
 ; D:\TC\src\parser.c:360:     Token* token_ptr = NULL;
	movq	$0, -24(%rbp)	 ;, token_ptr
 ; D:\TC\src\parser.c:361:     token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp119
	movq	%rax, %rcx	 ; tmp119,
	call	peek_current_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp120, token
 ; D:\TC\src\parser.c:362:     token_ptr = token;
	movq	-16(%rbp), %rax	 ; token, tmp121
	movq	%rax, -24(%rbp)	 ; tmp121, token_ptr
 ; D:\TC\src\parser.c:363:     Statement* statement = 0;
	movq	$0, -8(%rbp)	 ;, statement
 ; D:\TC\src\parser.c:364:     if (token_ptr->type == KEYWORD) {
	movq	-24(%rbp), %rax	 ; token_ptr, tmp122
	movl	24(%rax), %eax	 ; token_ptr_49->type, _1
 ; D:\TC\src\parser.c:364:     if (token_ptr->type == KEYWORD) {
	cmpl	$6, %eax	 ;, _1
	jne	.L99	 ;,
 ; D:\TC\src\parser.c:365:         if (string_equal(token_ptr->lexeme, IF_KEYWORD))
	movq	.refptr.IF_KEYWORD(%rip), %rax	 ;, tmp123
	movq	(%rax), %rdx	 ; IF_KEYWORD, IF_KEYWORD.39_2
	movq	-24(%rbp), %rax	 ; token_ptr, tmp124
	movq	(%rax), %rax	 ; token_ptr_49->lexeme, _3
	movq	%rax, %rcx	 ; _3,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:365:         if (string_equal(token_ptr->lexeme, IF_KEYWORD))
	testb	%al, %al	 ; _4
	je	.L100	 ;,
 ; D:\TC\src\parser.c:366:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movq	32(%rbp), %rcx	 ; parser, tmp125
	movq	24(%rbp), %rdx	 ; now_scope, tmp126
	movq	16(%rbp), %rax	 ; lexer, tmp127
	movq	%rcx, %r8	 ; tmp125,
	movq	%rax, %rcx	 ; tmp127,
	call	parse_if	 ;
 ; D:\TC\src\parser.c:366:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _5,
	movl	$2, %ecx	 ;,
	call	create_statement	 ;
 ; D:\TC\src\parser.c:366:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	jmp	.L101	 ;
.L100:
 ; D:\TC\src\parser.c:367:         else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
	movq	.refptr.FOR_KEYWORD(%rip), %rax	 ;, tmp128
	movq	(%rax), %rdx	 ; FOR_KEYWORD, FOR_KEYWORD.40_6
	movq	-24(%rbp), %rax	 ; token_ptr, tmp129
	movq	(%rax), %rax	 ; token_ptr_49->lexeme, _7
	movq	%rax, %rcx	 ; _7,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:367:         else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
	testb	%al, %al	 ; _8
	je	.L102	 ;,
 ; D:\TC\src\parser.c:368:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movq	32(%rbp), %rcx	 ; parser, tmp130
	movq	24(%rbp), %rdx	 ; now_scope, tmp131
	movq	16(%rbp), %rax	 ; lexer, tmp132
	movq	%rcx, %r8	 ; tmp130,
	movq	%rax, %rcx	 ; tmp132,
	call	parse_for	 ;
 ; D:\TC\src\parser.c:368:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movq	%rax, %r9	 ; _9,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$4, %ecx	 ;,
	call	create_statement	 ;
 ; D:\TC\src\parser.c:368:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L101	 ;
.L102:
 ; D:\TC\src\parser.c:369:         else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
	movq	.refptr.WHILE_KEYWORD(%rip), %rax	 ;, tmp133
	movq	(%rax), %rdx	 ; WHILE_KEYWORD, WHILE_KEYWORD.41_10
	movq	-24(%rbp), %rax	 ; token_ptr, tmp134
	movq	(%rax), %rax	 ; token_ptr_49->lexeme, _11
	movq	%rax, %rcx	 ; _11,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:369:         else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
	testb	%al, %al	 ; _12
	je	.L103	 ;,
 ; D:\TC\src\parser.c:370:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movq	32(%rbp), %rcx	 ; parser, tmp135
	movq	24(%rbp), %rdx	 ; now_scope, tmp136
	movq	16(%rbp), %rax	 ; lexer, tmp137
	movq	%rcx, %r8	 ; tmp135,
	movq	%rax, %rcx	 ; tmp137,
	call	parse_while	 ;
 ; D:\TC\src\parser.c:370:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; _13,
	movl	$0, %edx	 ;,
	movl	$3, %ecx	 ;,
	call	create_statement	 ;
 ; D:\TC\src\parser.c:370:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	jmp	.L101	 ;
.L103:
 ; D:\TC\src\parser.c:371:         else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp138
	movq	(%rax), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD.42_14
	movq	-24(%rbp), %rax	 ; token_ptr, tmp139
	movq	(%rax), %rax	 ; token_ptr_49->lexeme, _15
	movq	%rax, %rcx	 ; _15,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:371:         else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; _16
	je	.L104	 ;,
 ; D:\TC\src\parser.c:372:             get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp140
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp140,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:373:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	32(%rbp), %rcx	 ; parser, tmp141
	movq	24(%rbp), %rdx	 ; now_scope, tmp142
	movq	16(%rbp), %rax	 ; lexer, tmp143
	movq	%rcx, %r8	 ; tmp141,
	movq	%rax, %rcx	 ; tmp143,
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:373:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rax, 40(%rsp)	 ; _17,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, -8(%rbp)	 ; tmp144, statement
	jmp	.L105	 ;
.L104:
 ; D:\TC\src\parser.c:374:         } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
	movq	.refptr.RETURN_KEYWORD(%rip), %rax	 ;, tmp145
	movq	(%rax), %rdx	 ; RETURN_KEYWORD, RETURN_KEYWORD.43_18
	movq	-24(%rbp), %rax	 ; token_ptr, tmp146
	movq	(%rax), %rax	 ; token_ptr_49->lexeme, _19
	movq	%rax, %rcx	 ; _19,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:374:         } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	 ; _20
	je	.L106	 ;,
 ; D:\TC\src\parser.c:375:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp147
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp147,
	call	get_next_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp148, token
 ; D:\TC\src\parser.c:376:             token_ptr = token;
	movq	-16(%rbp), %rax	 ; token, tmp149
	movq	%rax, -24(%rbp)	 ; tmp149, token_ptr
 ; D:\TC\src\parser.c:377:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	32(%rbp), %rcx	 ; parser, tmp150
	movq	24(%rbp), %rdx	 ; now_scope, tmp151
	movq	16(%rbp), %rax	 ; lexer, tmp152
	movq	%rcx, %r8	 ; tmp150,
	movq	%rax, %rcx	 ; tmp152,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:377:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; _21,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, -8(%rbp)	 ; tmp153, statement
	jmp	.L105	 ;
.L106:
 ; D:\TC\src\parser.c:378:         } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
	movq	.refptr.BREAK_KEYWORD(%rip), %rax	 ;, tmp154
	movq	(%rax), %rdx	 ; BREAK_KEYWORD, BREAK_KEYWORD.44_22
	movq	-24(%rbp), %rax	 ; token_ptr, tmp155
	movq	(%rax), %rax	 ; token_ptr_49->lexeme, _23
	movq	%rax, %rcx	 ; _23,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:378:         } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	 ; _24
	je	.L107	 ;,
 ; D:\TC\src\parser.c:379:             if (!(((parser))->in_loop))
	movq	32(%rbp), %rax	 ; parser, tmp156
	movzbl	2(%rax), %eax	 ; parser_52(D)->in_loop, _25
 ; D:\TC\src\parser.c:379:             if (!(((parser))->in_loop))
	testb	%al, %al	 ; _25
	jne	.L108	 ;,
 ; D:\TC\src\parser.c:382:                 parser_error("Cannot use 'break' outside of a loop", token);
	movq	-16(%rbp), %rax	 ; token, tmp157
	movq	%rax, %rdx	 ; tmp157,
	leaq	.LC40(%rip), %rax	 ;, tmp158
	movq	%rax, %rcx	 ; tmp158,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:383:                 return NULL;
	movl	$0, %eax	 ;, _37
	jmp	.L101	 ;
.L108:
 ; D:\TC\src\parser.c:385:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$6, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, -8(%rbp)	 ; tmp159, statement
	jmp	.L105	 ;
.L107:
 ; D:\TC\src\parser.c:386:         } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax	 ;, tmp160
	movq	(%rax), %rdx	 ; CONTINUE_KEYWORD, CONTINUE_KEYWORD.45_26
	movq	-24(%rbp), %rax	 ; token_ptr, tmp161
	movq	(%rax), %rax	 ; token_ptr_49->lexeme, _27
	movq	%rax, %rcx	 ; _27,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:386:         } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	 ; _28
	je	.L109	 ;,
 ; D:\TC\src\parser.c:387:             if (!(((parser))->in_loop))
	movq	32(%rbp), %rax	 ; parser, tmp162
	movzbl	2(%rax), %eax	 ; parser_52(D)->in_loop, _29
 ; D:\TC\src\parser.c:387:             if (!(((parser))->in_loop))
	testb	%al, %al	 ; _29
	jne	.L110	 ;,
 ; D:\TC\src\parser.c:390:                 parser_error("Cannot use 'continue' outside of a loop", token);
	movq	-16(%rbp), %rax	 ; token, tmp163
	movq	%rax, %rdx	 ; tmp163,
	leaq	.LC41(%rip), %rax	 ;, tmp164
	movq	%rax, %rcx	 ; tmp164,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:391:                 return NULL;
	movl	$0, %eax	 ;, _37
	jmp	.L101	 ;
.L110:
 ; D:\TC\src\parser.c:393:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$7, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, -8(%rbp)	 ; tmp165, statement
	jmp	.L105	 ;
.L109:
 ; D:\TC\src\parser.c:395:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	32(%rbp), %rcx	 ; parser, tmp166
	movq	24(%rbp), %rdx	 ; now_scope, tmp167
	movq	16(%rbp), %rax	 ; lexer, tmp168
	movq	%rcx, %r8	 ; tmp166,
	movq	%rax, %rcx	 ; tmp168,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:395:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; _30,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, -8(%rbp)	 ; tmp169, statement
	jmp	.L105	 ;
.L99:
 ; D:\TC\src\parser.c:397:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	32(%rbp), %rcx	 ; parser, tmp170
	movq	24(%rbp), %rdx	 ; now_scope, tmp171
	movq	16(%rbp), %rax	 ; lexer, tmp172
	movq	%rcx, %r8	 ; tmp170,
	movq	%rax, %rcx	 ; tmp172,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:397:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; _31,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, -8(%rbp)	 ; tmp173, statement
.L105:
 ; D:\TC\src\parser.c:398:     token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp174
	movq	%rax, %rcx	 ; tmp174,
	call	peek_current_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp175, token
 ; D:\TC\src\parser.c:399:     if (statement == 0)
	cmpq	$0, -8(%rbp)	 ;, statement
	jne	.L111	 ;,
 ; D:\TC\src\parser.c:400:         parser_error("Failed to parse statement", token);
	movq	-16(%rbp), %rax	 ; token, tmp176
	movq	%rax, %rdx	 ; tmp176,
	leaq	.LC42(%rip), %rax	 ;, tmp177
	movq	%rax, %rcx	 ; tmp177,
	call	parser_error	 ;
.L111:
 ; D:\TC\src\parser.c:401:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp178
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp178,
	call	get_next_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp179, token
 ; D:\TC\src\parser.c:402:     token_ptr = token;
	movq	-16(%rbp), %rax	 ; token, tmp180
	movq	%rax, -24(%rbp)	 ; tmp180, token_ptr
 ; D:\TC\src\parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	-24(%rbp), %rax	 ; token_ptr, tmp181
	movl	24(%rax), %eax	 ; token_ptr_98->type, _32
 ; D:\TC\src\parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, %eax	 ;, _32
	jne	.L112	 ;,
 ; D:\TC\src\parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp182
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.46_33
	movq	-24(%rbp), %rax	 ; token_ptr, tmp183
	movq	(%rax), %rax	 ; token_ptr_98->lexeme, _34
	movq	%rax, %rcx	 ; _34,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; _35
	jne	.L113	 ;,
.L112:
 ; D:\TC\src\parser.c:404:         parser_error("Expected ';' after statement", token);
	movq	-16(%rbp), %rax	 ; token, tmp184
	movq	%rax, %rdx	 ; tmp184,
	leaq	.LC43(%rip), %rax	 ;, tmp185
	movq	%rax, %rcx	 ; tmp185,
	call	parser_error	 ;
.L113:
 ; D:\TC\src\parser.c:405:     return statement;
	movq	-8(%rbp), %rax	 ; statement, _37
.L101:
 ; D:\TC\src\parser.c:406: }
	leave	
	ret	
	.section .rdata,"dr"
.LC44:
	.ascii "Expected '(' after 'if'\0"
.LC45:
	.ascii "Failed to parse if condition\0"
	.align 8
.LC46:
	.ascii "Expected ')' after if condition\0"
.LC47:
	.ascii "Expected '{' to start if body\0"
	.align 8
.LC48:
	.ascii "Failed to parse if body statement\0"
.LC49:
	.ascii "Expected '(' after 'elif'\0"
	.align 8
.LC50:
	.ascii "Failed to parse else-if condition\0"
	.align 8
.LC51:
	.ascii "Expected ')' after else-if condition\0"
	.align 8
.LC52:
	.ascii "Expected '{' to start else-if body\0"
	.align 8
.LC53:
	.ascii "Failed to parse else-if body statement\0"
	.align 8
.LC54:
	.ascii "Expected '{' to start else body\0"
	.align 8
.LC55:
	.ascii "Failed to parse else body statement\0"
	.text
	.def	parse_if;	.scl	3;	.type	32;	.endef
parse_if:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	addq	$-128, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:411:     Token* token = 0;
	movq	$0, -8(%rbp)	 ;, token
 ; D:\TC\src\parser.c:412:     Token* token_ptr = NULL;
	movq	$0, -16(%rbp)	 ;, token_ptr
 ; D:\TC\src\parser.c:413:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp133
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp133,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp134, token
 ; D:\TC\src\parser.c:414:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp135
	movq	%rax, -16(%rbp)	 ; tmp135, token_ptr
 ; D:\TC\src\parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp136
	movl	24(%rax), %eax	 ; token_ptr_86->type, _1
 ; D:\TC\src\parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _1
	jne	.L115	 ;,
 ; D:\TC\src\parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp137
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.47_2
	movq	-16(%rbp), %rax	 ; token_ptr, tmp138
	movq	(%rax), %rax	 ; token_ptr_86->lexeme, _3
	movq	%rax, %rcx	 ; _3,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _4
	jne	.L116	 ;,
.L115:
 ; D:\TC\src\parser.c:416:         parser_error("Expected '(' after 'if'", token);
	movq	-8(%rbp), %rax	 ; token, tmp139
	movq	%rax, %rdx	 ; tmp139,
	leaq	.LC44(%rip), %rax	 ;, tmp140
	movq	%rax, %rcx	 ; tmp140,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:417:         return NULL;
	movl	$0, %eax	 ;, _57
	jmp	.L117	 ;
.L116:
 ; D:\TC\src\parser.c:419:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp141
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp141,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp142, token
 ; D:\TC\src\parser.c:420:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp143
	movq	%rax, -16(%rbp)	 ; tmp143, token_ptr
 ; D:\TC\src\parser.c:421:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp144
	movq	24(%rbp), %rdx	 ; now_scope, tmp145
	movq	16(%rbp), %rax	 ; lexer, tmp146
	movq	%rcx, %r8	 ; tmp144,
	movq	%rax, %rcx	 ; tmp146,
	call	parse_expression	 ;
	movq	%rax, -24(%rbp)	 ; tmp147, condition
 ; D:\TC\src\parser.c:422:     if (condition == 0)
	cmpq	$0, -24(%rbp)	 ;, condition
	jne	.L118	 ;,
 ; D:\TC\src\parser.c:423:         parser_error("Failed to parse if condition", token);
	movq	-8(%rbp), %rax	 ; token, tmp148
	movq	%rax, %rdx	 ; tmp148,
	leaq	.LC45(%rip), %rax	 ;, tmp149
	movq	%rax, %rcx	 ; tmp149,
	call	parser_error	 ;
.L118:
 ; D:\TC\src\parser.c:424:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp150
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp150,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp151, token
 ; D:\TC\src\parser.c:425:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp152
	movq	%rax, -16(%rbp)	 ; tmp152, token_ptr
 ; D:\TC\src\parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp153
	movl	24(%rax), %eax	 ; token_ptr_98->type, _5
 ; D:\TC\src\parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _5
	jne	.L119	 ;,
 ; D:\TC\src\parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp154
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.48_6
	movq	-16(%rbp), %rax	 ; token_ptr, tmp155
	movq	(%rax), %rax	 ; token_ptr_98->lexeme, _7
	movq	%rax, %rcx	 ; _7,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _8
	jne	.L120	 ;,
.L119:
 ; D:\TC\src\parser.c:427:         parser_error("Expected ')' after if condition", token);
	movq	-8(%rbp), %rax	 ; token, tmp156
	movq	%rax, %rdx	 ; tmp156,
	leaq	.LC46(%rip), %rax	 ;, tmp157
	movq	%rax, %rcx	 ; tmp157,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:428:         return NULL;
	movl	$0, %eax	 ;, _57
	jmp	.L117	 ;
.L120:
 ; D:\TC\src\parser.c:430:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp158
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp158,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp159, token
 ; D:\TC\src\parser.c:431:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp160
	movq	%rax, -16(%rbp)	 ; tmp160, token_ptr
 ; D:\TC\src\parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp161
	movl	24(%rax), %eax	 ; token_ptr_102->type, _9
 ; D:\TC\src\parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _9
	jne	.L121	 ;,
 ; D:\TC\src\parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp162
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.49_10
	movq	-16(%rbp), %rax	 ; token_ptr, tmp163
	movq	(%rax), %rax	 ; token_ptr_102->lexeme, _11
	movq	%rax, %rcx	 ; _11,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _12
	jne	.L122	 ;,
.L121:
 ; D:\TC\src\parser.c:433:         parser_error("Expected '{' to start if body", token);
	movq	-8(%rbp), %rax	 ; token, tmp164
	movq	%rax, %rdx	 ; tmp164,
	leaq	.LC47(%rip), %rax	 ;, tmp165
	movq	%rax, %rcx	 ; tmp165,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:434:         return NULL;
	movl	$0, %eax	 ;, _57
	jmp	.L117	 ;
.L122:
 ; D:\TC\src\parser.c:436:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, -32(%rbp)	 ; tmp166, body
 ; D:\TC\src\parser.c:437:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp167
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp167,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp168, token
 ; D:\TC\src\parser.c:438:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp169
	movq	%rax, -16(%rbp)	 ; tmp169, token_ptr
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L123	 ;
.L125:
 ; D:\TC\src\parser.c:440:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp170
	movq	24(%rbp), %rdx	 ; now_scope, tmp171
	movq	16(%rbp), %rax	 ; lexer, tmp172
	movq	%rcx, %r8	 ; tmp170,
	movq	%rax, %rcx	 ; tmp172,
	call	parse_statement	 ;
	movq	%rax, -88(%rbp)	 ; tmp173, statement
 ; D:\TC\src\parser.c:441:         if (statement == 0)
	cmpq	$0, -88(%rbp)	 ;, statement
	jne	.L124	 ;,
 ; D:\TC\src\parser.c:442:             parser_error("Failed to parse if body statement", token);
	movq	-8(%rbp), %rax	 ; token, tmp174
	movq	%rax, %rdx	 ; tmp174,
	leaq	.LC48(%rip), %rax	 ;, tmp175
	movq	%rax, %rcx	 ; tmp175,
	call	parser_error	 ;
.L124:
 ; D:\TC\src\parser.c:443:         list_append(body, (pointer)statement);
	movq	-88(%rbp), %rdx	 ; statement, tmp176
	movq	-32(%rbp), %rax	 ; body, tmp177
	movq	%rax, %rcx	 ; tmp177,
	call	list_append	 ;
 ; D:\TC\src\parser.c:444:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp178
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp178,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp179, token
 ; D:\TC\src\parser.c:445:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp180
	movq	%rax, -16(%rbp)	 ; tmp180, token_ptr
.L123:
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp181
	movl	24(%rax), %eax	 ; token_ptr_53->type, _13
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _13
	jne	.L125	 ;,
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp182
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.50_14
	movq	-16(%rbp), %rax	 ; token_ptr, tmp183
	movq	(%rax), %rax	 ; token_ptr_53->lexeme, _15
	movq	%rax, %rcx	 ; _15,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _16
	je	.L125	 ;,
 ; D:\TC\src\parser.c:447:     list(ElseIf*) else_if = create_list();
	call	create_list	 ;
	movq	%rax, -40(%rbp)	 ; tmp184, else_if
 ; D:\TC\src\parser.c:448:     list(Statement*) else_body = create_list();
	call	create_list	 ;
	movq	%rax, -48(%rbp)	 ; tmp185, else_body
 ; D:\TC\src\parser.c:449:     token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp186
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp186,
	call	peek_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp187, token
 ; D:\TC\src\parser.c:450:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp188
	movq	%rax, -16(%rbp)	 ; tmp188, token_ptr
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	jmp	.L126	 ;
.L138:
 ; D:\TC\src\parser.c:452:         token = get_next_token(lexer, true);  // consume 'elif'
	movq	16(%rbp), %rax	 ; lexer, tmp189
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp189,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp190, token
 ; D:\TC\src\parser.c:453:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp191
	movq	%rax, -16(%rbp)	 ; tmp191, token_ptr
 ; D:\TC\src\parser.c:454:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp192
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp192,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp193, token
 ; D:\TC\src\parser.c:455:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp194
	movq	%rax, -16(%rbp)	 ; tmp194, token_ptr
 ; D:\TC\src\parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp195
	movl	24(%rax), %eax	 ; token_ptr_123->type, _17
 ; D:\TC\src\parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _17
	jne	.L127	 ;,
 ; D:\TC\src\parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp196
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.51_18
	movq	-16(%rbp), %rax	 ; token_ptr, tmp197
	movq	(%rax), %rax	 ; token_ptr_123->lexeme, _19
	movq	%rax, %rcx	 ; _19,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _20
	jne	.L128	 ;,
.L127:
 ; D:\TC\src\parser.c:457:             parser_error("Expected '(' after 'elif'", token);
	movq	-8(%rbp), %rax	 ; token, tmp198
	movq	%rax, %rdx	 ; tmp198,
	leaq	.LC49(%rip), %rax	 ;, tmp199
	movq	%rax, %rcx	 ; tmp199,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:458:             return NULL;
	movl	$0, %eax	 ;, _57
	jmp	.L117	 ;
.L128:
 ; D:\TC\src\parser.c:460:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp200
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp200,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp201, token
 ; D:\TC\src\parser.c:461:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp202
	movq	%rax, -16(%rbp)	 ; tmp202, token_ptr
 ; D:\TC\src\parser.c:462:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp203
	movq	24(%rbp), %rdx	 ; now_scope, tmp204
	movq	16(%rbp), %rax	 ; lexer, tmp205
	movq	%rcx, %r8	 ; tmp203,
	movq	%rax, %rcx	 ; tmp205,
	call	parse_expression	 ;
	movq	%rax, -56(%rbp)	 ; tmp206, elif_condition
 ; D:\TC\src\parser.c:463:         if (elif_condition == 0)
	cmpq	$0, -56(%rbp)	 ;, elif_condition
	jne	.L129	 ;,
 ; D:\TC\src\parser.c:464:             parser_error("Failed to parse else-if condition", token);
	movq	-8(%rbp), %rax	 ; token, tmp207
	movq	%rax, %rdx	 ; tmp207,
	leaq	.LC50(%rip), %rax	 ;, tmp208
	movq	%rax, %rcx	 ; tmp208,
	call	parser_error	 ;
.L129:
 ; D:\TC\src\parser.c:465:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp209
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp209,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp210, token
 ; D:\TC\src\parser.c:466:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp211
	movq	%rax, -16(%rbp)	 ; tmp211, token_ptr
 ; D:\TC\src\parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp212
	movl	24(%rax), %eax	 ; token_ptr_133->type, _21
 ; D:\TC\src\parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _21
	jne	.L130	 ;,
 ; D:\TC\src\parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp213
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.52_22
	movq	-16(%rbp), %rax	 ; token_ptr, tmp214
	movq	(%rax), %rax	 ; token_ptr_133->lexeme, _23
	movq	%rax, %rcx	 ; _23,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _24
	jne	.L131	 ;,
.L130:
 ; D:\TC\src\parser.c:468:             parser_error("Expected ')' after else-if condition", token);
	movq	-8(%rbp), %rax	 ; token, tmp215
	movq	%rax, %rdx	 ; tmp215,
	leaq	.LC51(%rip), %rax	 ;, tmp216
	movq	%rax, %rcx	 ; tmp216,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:469:             return NULL;
	movl	$0, %eax	 ;, _57
	jmp	.L117	 ;
.L131:
 ; D:\TC\src\parser.c:471:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp217
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp217,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp218, token
 ; D:\TC\src\parser.c:472:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp219
	movq	%rax, -16(%rbp)	 ; tmp219, token_ptr
 ; D:\TC\src\parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp220
	movl	24(%rax), %eax	 ; token_ptr_137->type, _25
 ; D:\TC\src\parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _25
	jne	.L132	 ;,
 ; D:\TC\src\parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp221
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.53_26
	movq	-16(%rbp), %rax	 ; token_ptr, tmp222
	movq	(%rax), %rax	 ; token_ptr_137->lexeme, _27
	movq	%rax, %rcx	 ; _27,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _28
	jne	.L133	 ;,
.L132:
 ; D:\TC\src\parser.c:474:             parser_error("Expected '{' to start else-if body", token);
	movq	-8(%rbp), %rax	 ; token, tmp223
	movq	%rax, %rdx	 ; tmp223,
	leaq	.LC52(%rip), %rax	 ;, tmp224
	movq	%rax, %rcx	 ; tmp224,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:475:             return NULL;
	movl	$0, %eax	 ;, _57
	jmp	.L117	 ;
.L133:
 ; D:\TC\src\parser.c:477:         list(Statement*) elif_body = create_list();
	call	create_list	 ;
	movq	%rax, -64(%rbp)	 ; tmp225, elif_body
 ; D:\TC\src\parser.c:478:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp226
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp226,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp227, token
 ; D:\TC\src\parser.c:479:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp228
	movq	%rax, -16(%rbp)	 ; tmp228, token_ptr
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L134	 ;
.L136:
 ; D:\TC\src\parser.c:481:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp229
	movq	24(%rbp), %rdx	 ; now_scope, tmp230
	movq	16(%rbp), %rax	 ; lexer, tmp231
	movq	%rcx, %r8	 ; tmp229,
	movq	%rax, %rcx	 ; tmp231,
	call	parse_statement	 ;
	movq	%rax, -72(%rbp)	 ; tmp232, statement
 ; D:\TC\src\parser.c:482:             if (statement == 0)
	cmpq	$0, -72(%rbp)	 ;, statement
	jne	.L135	 ;,
 ; D:\TC\src\parser.c:483:                 parser_error("Failed to parse else-if body statement", token);
	movq	-8(%rbp), %rax	 ; token, tmp233
	movq	%rax, %rdx	 ; tmp233,
	leaq	.LC53(%rip), %rax	 ;, tmp234
	movq	%rax, %rcx	 ; tmp234,
	call	parser_error	 ;
.L135:
 ; D:\TC\src\parser.c:484:             list_append(elif_body, (pointer)statement);
	movq	-72(%rbp), %rdx	 ; statement, tmp235
	movq	-64(%rbp), %rax	 ; elif_body, tmp236
	movq	%rax, %rcx	 ; tmp236,
	call	list_append	 ;
 ; D:\TC\src\parser.c:485:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp237
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp237,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp238, token
 ; D:\TC\src\parser.c:486:             token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp239
	movq	%rax, -16(%rbp)	 ; tmp239, token_ptr
.L134:
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp240
	movl	24(%rax), %eax	 ; token_ptr_54->type, _29
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _29
	jne	.L136	 ;,
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp241
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.54_30
	movq	-16(%rbp), %rax	 ; token_ptr, tmp242
	movq	(%rax), %rax	 ; token_ptr_54->lexeme, _31
	movq	%rax, %rcx	 ; _31,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _32
	je	.L136	 ;,
 ; D:\TC\src\parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	-64(%rbp), %rdx	 ; elif_body, tmp243
	movq	-56(%rbp), %rax	 ; elif_condition, tmp244
	movq	%rax, %rcx	 ; tmp244,
	call	create_else_if	 ;
	movq	%rax, %rdx	 ;, _33
 ; D:\TC\src\parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	-40(%rbp), %rax	 ; else_if, tmp245
	movq	%rax, %rcx	 ; tmp245,
	call	list_append	 ;
 ; D:\TC\src\parser.c:489:         token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp246
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp246,
	call	peek_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp247, token
 ; D:\TC\src\parser.c:490:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp248
	movq	%rax, -16(%rbp)	 ; tmp248, token_ptr
.L126:
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp249
	movl	24(%rax), %eax	 ; token_ptr_55->type, _34
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, %eax	 ;, _34
	jne	.L137	 ;,
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	movq	.refptr.ELIF_KEYWORD(%rip), %rax	 ;, tmp250
	movq	(%rax), %rdx	 ; ELIF_KEYWORD, ELIF_KEYWORD.55_35
	movq	-16(%rbp), %rax	 ; token_ptr, tmp251
	movq	(%rax), %rax	 ; token_ptr_55->lexeme, _36
	movq	%rax, %rcx	 ; _36,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	 ; _37
	jne	.L138	 ;,
.L137:
 ; D:\TC\src\parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp252
	movl	24(%rax), %eax	 ; token_ptr_55->type, _38
 ; D:\TC\src\parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _38
	jne	.L139	 ;,
 ; D:\TC\src\parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	movq	.refptr.ELSE_KEYWORD(%rip), %rax	 ;, tmp253
	movq	(%rax), %rdx	 ; ELSE_KEYWORD, ELSE_KEYWORD.56_39
	movq	-16(%rbp), %rax	 ; token_ptr, tmp254
	movq	(%rax), %rax	 ; token_ptr_55->lexeme, _40
	movq	%rax, %rcx	 ; _40,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	 ; _41
	je	.L139	 ;,
 ; D:\TC\src\parser.c:493:         token = get_next_token(lexer, true);  // consume 'else'
	movq	16(%rbp), %rax	 ; lexer, tmp255
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp255,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp256, token
 ; D:\TC\src\parser.c:494:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp257
	movq	%rax, -16(%rbp)	 ; tmp257, token_ptr
 ; D:\TC\src\parser.c:495:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp258
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp258,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp259, token
 ; D:\TC\src\parser.c:496:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp260
	movq	%rax, -16(%rbp)	 ; tmp260, token_ptr
 ; D:\TC\src\parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp261
	movl	24(%rax), %eax	 ; token_ptr_169->type, _42
 ; D:\TC\src\parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _42
	jne	.L140	 ;,
 ; D:\TC\src\parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp262
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.57_43
	movq	-16(%rbp), %rax	 ; token_ptr, tmp263
	movq	(%rax), %rax	 ; token_ptr_169->lexeme, _44
	movq	%rax, %rcx	 ; _44,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _45
	jne	.L141	 ;,
.L140:
 ; D:\TC\src\parser.c:498:             parser_error("Expected '{' to start else body", token);
	movq	-8(%rbp), %rax	 ; token, tmp264
	movq	%rax, %rdx	 ; tmp264,
	leaq	.LC54(%rip), %rax	 ;, tmp265
	movq	%rax, %rcx	 ; tmp265,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:499:             return NULL;
	movl	$0, %eax	 ;, _57
	jmp	.L117	 ;
.L141:
 ; D:\TC\src\parser.c:501:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp266
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp266,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp267, token
 ; D:\TC\src\parser.c:502:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp268
	movq	%rax, -16(%rbp)	 ; tmp268, token_ptr
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L142	 ;
.L144:
 ; D:\TC\src\parser.c:504:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp269
	movq	24(%rbp), %rdx	 ; now_scope, tmp270
	movq	16(%rbp), %rax	 ; lexer, tmp271
	movq	%rcx, %r8	 ; tmp269,
	movq	%rax, %rcx	 ; tmp271,
	call	parse_statement	 ;
	movq	%rax, -80(%rbp)	 ; tmp272, statement
 ; D:\TC\src\parser.c:505:             if (statement == 0)
	cmpq	$0, -80(%rbp)	 ;, statement
	jne	.L143	 ;,
 ; D:\TC\src\parser.c:506:                 parser_error("Failed to parse else body statement", token);
	movq	-8(%rbp), %rax	 ; token, tmp273
	movq	%rax, %rdx	 ; tmp273,
	leaq	.LC55(%rip), %rax	 ;, tmp274
	movq	%rax, %rcx	 ; tmp274,
	call	parser_error	 ;
.L143:
 ; D:\TC\src\parser.c:507:             list_append(else_body, (pointer)statement);
	movq	-80(%rbp), %rdx	 ; statement, tmp275
	movq	-48(%rbp), %rax	 ; else_body, tmp276
	movq	%rax, %rcx	 ; tmp276,
	call	list_append	 ;
 ; D:\TC\src\parser.c:508:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp277
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp277,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp278, token
 ; D:\TC\src\parser.c:509:             token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp279
	movq	%rax, -16(%rbp)	 ; tmp279, token_ptr
.L142:
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp280
	movl	24(%rax), %eax	 ; token_ptr_56->type, _46
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _46
	jne	.L144	 ;,
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp281
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.58_47
	movq	-16(%rbp), %rax	 ; token_ptr, tmp282
	movq	(%rax), %rax	 ; token_ptr_56->lexeme, _48
	movq	%rax, %rcx	 ; _48,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _49
	je	.L144	 ;,
.L139:
 ; D:\TC\src\parser.c:512:     token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp283
	movq	%rax, %rcx	 ; tmp283,
	call	peek_current_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp284, token
 ; D:\TC\src\parser.c:513:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp285
	movq	%rax, -16(%rbp)	 ; tmp285, token_ptr
 ; D:\TC\src\parser.c:514:     return create_if(condition, body, else_if, else_body);
	movq	-48(%rbp), %r8	 ; else_body, tmp286
	movq	-40(%rbp), %rcx	 ; else_if, tmp287
	movq	-32(%rbp), %rdx	 ; body, tmp288
	movq	-24(%rbp), %rax	 ; condition, tmp289
	movq	%r8, %r9	 ; tmp286,
	movq	%rcx, %r8	 ; tmp287,
	movq	%rax, %rcx	 ; tmp289,
	call	create_if	 ;
.L117:
 ; D:\TC\src\parser.c:515: }
	leave	
	ret	
	.section .rdata,"dr"
.LC56:
	.ascii "Expected '(' after 'for'\0"
	.align 8
.LC57:
	.ascii "Failed to parse for loop initializer\0"
	.align 8
.LC58:
	.ascii "Expected ';' after for loop initializer\0"
	.align 8
.LC59:
	.ascii "Failed to parse for loop condition\0"
	.align 8
.LC60:
	.ascii "Expected ';' after for loop condition\0"
	.align 8
.LC61:
	.ascii "Failed to parse for loop increment\0"
	.align 8
.LC62:
	.ascii "Expected ')' after for loop increment\0"
	.align 8
.LC63:
	.ascii "Expected '{' to start for loop body\0"
	.align 8
.LC64:
	.ascii "Failed to parse for loop body statement\0"
	.text
	.def	parse_for;	.scl	3;	.type	32;	.endef
parse_for:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$96, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:520:     Token* token = 0;
	movq	$0, -8(%rbp)	 ;, token
 ; D:\TC\src\parser.c:521:     Token* token_ptr = NULL;
	movq	$0, -16(%rbp)	 ;, token_ptr
 ; D:\TC\src\parser.c:522:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp120
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp120,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp121, token
 ; D:\TC\src\parser.c:523:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp122
	movq	%rax, -16(%rbp)	 ; tmp122, token_ptr
 ; D:\TC\src\parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp123
	movl	24(%rax), %eax	 ; token_ptr_73->type, _1
 ; D:\TC\src\parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _1
	jne	.L146	 ;,
 ; D:\TC\src\parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp124
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.59_2
	movq	-16(%rbp), %rax	 ; token_ptr, tmp125
	movq	(%rax), %rax	 ; token_ptr_73->lexeme, _3
	movq	%rax, %rcx	 ; _3,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _4
	jne	.L147	 ;,
.L146:
 ; D:\TC\src\parser.c:525:         parser_error("Expected '(' after 'for'", token);
	movq	-8(%rbp), %rax	 ; token, tmp126
	movq	%rax, %rdx	 ; tmp126,
	leaq	.LC56(%rip), %rax	 ;, tmp127
	movq	%rax, %rcx	 ; tmp127,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:526:         return NULL;
	movl	$0, %eax	 ;, _48
	jmp	.L148	 ;
.L147:
 ; D:\TC\src\parser.c:528:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp128
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp128,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp129, token
 ; D:\TC\src\parser.c:529:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp130
	movq	%rax, -16(%rbp)	 ; tmp130, token_ptr
 ; D:\TC\src\parser.c:530:     Variable* initializer = 0;
	movq	$0, -24(%rbp)	 ;, initializer
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp131
	movl	24(%rax), %eax	 ; token_ptr_77->type, _5
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	 ;, _5
	jne	.L149	 ;,
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp132
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.60_6
	movq	-16(%rbp), %rax	 ; token_ptr, tmp133
	movq	(%rax), %rax	 ; token_ptr_77->lexeme, _7
	movq	%rax, %rcx	 ; _7,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; _8
	jne	.L150	 ;,
.L149:
 ; D:\TC\src\parser.c:532:         initializer = parse_variable(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp134
	movq	24(%rbp), %rdx	 ; now_scope, tmp135
	movq	16(%rbp), %rax	 ; lexer, tmp136
	movq	%rcx, %r8	 ; tmp134,
	movq	%rax, %rcx	 ; tmp136,
	call	parse_variable	 ;
	movq	%rax, -24(%rbp)	 ; tmp137, initializer
 ; D:\TC\src\parser.c:533:         if (initializer == 0)
	cmpq	$0, -24(%rbp)	 ;, initializer
	jne	.L151	 ;,
 ; D:\TC\src\parser.c:534:             parser_error("Failed to parse for loop initializer", token);
	movq	-8(%rbp), %rax	 ; token, tmp138
	movq	%rax, %rdx	 ; tmp138,
	leaq	.LC57(%rip), %rax	 ;, tmp139
	movq	%rax, %rcx	 ; tmp139,
	call	parser_error	 ;
.L151:
 ; D:\TC\src\parser.c:535:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp140
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp140,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp141, token
 ; D:\TC\src\parser.c:536:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp142
	movq	%rax, -16(%rbp)	 ; tmp142, token_ptr
.L150:
 ; D:\TC\src\parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	-16(%rbp), %rax	 ; token_ptr, tmp143
	movl	24(%rax), %eax	 ; token_ptr_41->type, _9
 ; D:\TC\src\parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, %eax	 ;, _9
	jne	.L152	 ;,
 ; D:\TC\src\parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp144
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.61_10
	movq	-16(%rbp), %rax	 ; token_ptr, tmp145
	movq	(%rax), %rax	 ; token_ptr_41->lexeme, _11
	movq	%rax, %rcx	 ; _11,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; _12
	jne	.L153	 ;,
.L152:
 ; D:\TC\src\parser.c:541:         parser_error("Expected ';' after for loop initializer", token);
	movq	-8(%rbp), %rax	 ; token, tmp146
	movq	%rax, %rdx	 ; tmp146,
	leaq	.LC58(%rip), %rax	 ;, tmp147
	movq	%rax, %rcx	 ; tmp147,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:542:         return NULL;
	movl	$0, %eax	 ;, _48
	jmp	.L148	 ;
.L153:
 ; D:\TC\src\parser.c:544:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp148
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp148,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp149, token
 ; D:\TC\src\parser.c:545:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp150
	movq	%rax, -16(%rbp)	 ; tmp150, token_ptr
 ; D:\TC\src\parser.c:546:     Expression* condition = 0;
	movq	$0, -32(%rbp)	 ;, condition
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp151
	movl	24(%rax), %eax	 ; token_ptr_91->type, _13
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	 ;, _13
	jne	.L154	 ;,
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp152
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.62_14
	movq	-16(%rbp), %rax	 ; token_ptr, tmp153
	movq	(%rax), %rax	 ; token_ptr_91->lexeme, _15
	movq	%rax, %rcx	 ; _15,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; _16
	jne	.L155	 ;,
.L154:
 ; D:\TC\src\parser.c:548:         condition = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp154
	movq	24(%rbp), %rdx	 ; now_scope, tmp155
	movq	16(%rbp), %rax	 ; lexer, tmp156
	movq	%rcx, %r8	 ; tmp154,
	movq	%rax, %rcx	 ; tmp156,
	call	parse_expression	 ;
	movq	%rax, -32(%rbp)	 ; tmp157, condition
 ; D:\TC\src\parser.c:549:         if (condition == 0)
	cmpq	$0, -32(%rbp)	 ;, condition
	jne	.L156	 ;,
 ; D:\TC\src\parser.c:550:             parser_error("Failed to parse for loop condition", token);
	movq	-8(%rbp), %rax	 ; token, tmp158
	movq	%rax, %rdx	 ; tmp158,
	leaq	.LC59(%rip), %rax	 ;, tmp159
	movq	%rax, %rcx	 ; tmp159,
	call	parser_error	 ;
.L156:
 ; D:\TC\src\parser.c:551:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp160
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp160,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp161, token
 ; D:\TC\src\parser.c:552:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp162
	movq	%rax, -16(%rbp)	 ; tmp162, token_ptr
.L155:
 ; D:\TC\src\parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	-16(%rbp), %rax	 ; token_ptr, tmp163
	movl	24(%rax), %eax	 ; token_ptr_42->type, _17
 ; D:\TC\src\parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, %eax	 ;, _17
	jne	.L157	 ;,
 ; D:\TC\src\parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp164
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.63_18
	movq	-16(%rbp), %rax	 ; token_ptr, tmp165
	movq	(%rax), %rax	 ; token_ptr_42->lexeme, _19
	movq	%rax, %rcx	 ; _19,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; _20
	jne	.L158	 ;,
.L157:
 ; D:\TC\src\parser.c:557:         parser_error("Expected ';' after for loop condition", token);
	movq	-8(%rbp), %rax	 ; token, tmp166
	movq	%rax, %rdx	 ; tmp166,
	leaq	.LC60(%rip), %rax	 ;, tmp167
	movq	%rax, %rcx	 ; tmp167,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:558:         return NULL;
	movl	$0, %eax	 ;, _48
	jmp	.L148	 ;
.L158:
 ; D:\TC\src\parser.c:560:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp168
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp168,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp169, token
 ; D:\TC\src\parser.c:561:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp170
	movq	%rax, -16(%rbp)	 ; tmp170, token_ptr
 ; D:\TC\src\parser.c:562:     Expression* increment = 0;
	movq	$0, -40(%rbp)	 ;, increment
 ; D:\TC\src\parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp171
	movl	24(%rax), %eax	 ; token_ptr_103->type, _21
 ; D:\TC\src\parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _21
	jne	.L159	 ;,
 ; D:\TC\src\parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp172
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.64_22
	movq	-16(%rbp), %rax	 ; token_ptr, tmp173
	movq	(%rax), %rax	 ; token_ptr_103->lexeme, _23
	movq	%rax, %rcx	 ; _23,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _24
	jne	.L160	 ;,
.L159:
 ; D:\TC\src\parser.c:564:         increment = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp174
	movq	24(%rbp), %rdx	 ; now_scope, tmp175
	movq	16(%rbp), %rax	 ; lexer, tmp176
	movq	%rcx, %r8	 ; tmp174,
	movq	%rax, %rcx	 ; tmp176,
	call	parse_expression	 ;
	movq	%rax, -40(%rbp)	 ; tmp177, increment
 ; D:\TC\src\parser.c:565:         if (increment == 0)
	cmpq	$0, -40(%rbp)	 ;, increment
	jne	.L161	 ;,
 ; D:\TC\src\parser.c:566:             parser_error("Failed to parse for loop increment", token);
	movq	-8(%rbp), %rax	 ; token, tmp178
	movq	%rax, %rdx	 ; tmp178,
	leaq	.LC61(%rip), %rax	 ;, tmp179
	movq	%rax, %rcx	 ; tmp179,
	call	parser_error	 ;
.L161:
 ; D:\TC\src\parser.c:567:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp180
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp180,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp181, token
 ; D:\TC\src\parser.c:568:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp182
	movq	%rax, -16(%rbp)	 ; tmp182, token_ptr
.L160:
 ; D:\TC\src\parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	movq	-16(%rbp), %rax	 ; token_ptr, tmp183
	movl	24(%rax), %eax	 ; token_ptr_43->type, _25
 ; D:\TC\src\parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	cmpl	$5, %eax	 ;, _25
	jne	.L162	 ;,
 ; D:\TC\src\parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp184
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.65_26
	movq	-16(%rbp), %rax	 ; token_ptr, tmp185
	movq	(%rax), %rax	 ; token_ptr_43->lexeme, _27
	movq	%rax, %rcx	 ; _27,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	testb	%al, %al	 ; _28
	jne	.L163	 ;,
.L162:
 ; D:\TC\src\parser.c:573:         parser_error("Expected ')' after for loop increment", token);
	movq	-8(%rbp), %rax	 ; token, tmp186
	movq	%rax, %rdx	 ; tmp186,
	leaq	.LC62(%rip), %rax	 ;, tmp187
	movq	%rax, %rcx	 ; tmp187,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:574:         return NULL;
	movl	$0, %eax	 ;, _48
	jmp	.L148	 ;
.L163:
 ; D:\TC\src\parser.c:576:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp188
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp188,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp189, token
 ; D:\TC\src\parser.c:577:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp190
	movq	%rax, -16(%rbp)	 ; tmp190, token_ptr
 ; D:\TC\src\parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp191
	movl	24(%rax), %eax	 ; token_ptr_115->type, _29
 ; D:\TC\src\parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _29
	jne	.L164	 ;,
 ; D:\TC\src\parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp192
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.66_30
	movq	-16(%rbp), %rax	 ; token_ptr, tmp193
	movq	(%rax), %rax	 ; token_ptr_115->lexeme, _31
	movq	%rax, %rcx	 ; _31,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _32
	jne	.L165	 ;,
.L164:
 ; D:\TC\src\parser.c:579:         parser_error("Expected '{' to start for loop body", token);
	movq	-8(%rbp), %rax	 ; token, tmp194
	movq	%rax, %rdx	 ; tmp194,
	leaq	.LC63(%rip), %rax	 ;, tmp195
	movq	%rax, %rcx	 ; tmp195,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:580:         return NULL;
	movl	$0, %eax	 ;, _48
	jmp	.L148	 ;
.L165:
 ; D:\TC\src\parser.c:582:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, -48(%rbp)	 ; tmp196, body
 ; D:\TC\src\parser.c:583:     ((parser))->in_loop = true;
	movq	32(%rbp), %rax	 ; parser, tmp197
	movb	$1, 2(%rax)	 ;, parser_81(D)->in_loop
 ; D:\TC\src\parser.c:584:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp198
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp198,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp199, token
 ; D:\TC\src\parser.c:585:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp200
	movq	%rax, -16(%rbp)	 ; tmp200, token_ptr
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L166	 ;
.L168:
 ; D:\TC\src\parser.c:587:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp201
	movq	24(%rbp), %rdx	 ; now_scope, tmp202
	movq	16(%rbp), %rax	 ; lexer, tmp203
	movq	%rcx, %r8	 ; tmp201,
	movq	%rax, %rcx	 ; tmp203,
	call	parse_statement	 ;
	movq	%rax, -56(%rbp)	 ; tmp204, statement
 ; D:\TC\src\parser.c:588:         if (statement == 0)
	cmpq	$0, -56(%rbp)	 ;, statement
	jne	.L167	 ;,
 ; D:\TC\src\parser.c:589:             parser_error("Failed to parse for loop body statement", token);
	movq	-8(%rbp), %rax	 ; token, tmp205
	movq	%rax, %rdx	 ; tmp205,
	leaq	.LC64(%rip), %rax	 ;, tmp206
	movq	%rax, %rcx	 ; tmp206,
	call	parser_error	 ;
.L167:
 ; D:\TC\src\parser.c:590:         list_append(body, (pointer)statement);
	movq	-56(%rbp), %rdx	 ; statement, tmp207
	movq	-48(%rbp), %rax	 ; body, tmp208
	movq	%rax, %rcx	 ; tmp208,
	call	list_append	 ;
 ; D:\TC\src\parser.c:591:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp209
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp209,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp210, token
 ; D:\TC\src\parser.c:592:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp211
	movq	%rax, -16(%rbp)	 ; tmp211, token_ptr
.L166:
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp212
	movl	24(%rax), %eax	 ; token_ptr_44->type, _33
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _33
	jne	.L168	 ;,
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp213
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.67_34
	movq	-16(%rbp), %rax	 ; token_ptr, tmp214
	movq	(%rax), %rax	 ; token_ptr_44->lexeme, _35
	movq	%rax, %rcx	 ; _35,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _36
	je	.L168	 ;,
 ; D:\TC\src\parser.c:594:     ((parser))->in_loop = false;
	movq	32(%rbp), %rax	 ; parser, tmp215
	movb	$0, 2(%rax)	 ;, parser_81(D)->in_loop
 ; D:\TC\src\parser.c:595:     return create_for(initializer, condition, increment, body);
	movq	-48(%rbp), %r8	 ; body, tmp216
	movq	-40(%rbp), %rcx	 ; increment, tmp217
	movq	-32(%rbp), %rdx	 ; condition, tmp218
	movq	-24(%rbp), %rax	 ; initializer, tmp219
	movq	%r8, %r9	 ; tmp216,
	movq	%rcx, %r8	 ; tmp217,
	movq	%rax, %rcx	 ; tmp219,
	call	create_for	 ;
.L148:
 ; D:\TC\src\parser.c:596: }
	leave	
	ret	
	.section .rdata,"dr"
.LC65:
	.ascii "Expected '(' after 'while'\0"
	.align 8
.LC66:
	.ascii "Failed to parse while condition\0"
	.align 8
.LC67:
	.ascii "Expected ')' after while condition\0"
	.align 8
.LC68:
	.ascii "Expected '{' to start while body\0"
	.align 8
.LC69:
	.ascii "Failed to parse while body statement\0"
	.text
	.def	parse_while;	.scl	3;	.type	32;	.endef
parse_while:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$80, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:601:     Token* token = 0;
	movq	$0, -8(%rbp)	 ;, token
 ; D:\TC\src\parser.c:602:     Token* token_ptr = NULL;
	movq	$0, -16(%rbp)	 ;, token_ptr
 ; D:\TC\src\parser.c:603:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp100
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp100,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp101, token
 ; D:\TC\src\parser.c:604:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp102
	movq	%rax, -16(%rbp)	 ; tmp102, token_ptr
 ; D:\TC\src\parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp103
	movl	24(%rax), %eax	 ; token_ptr_34->type, _1
 ; D:\TC\src\parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _1
	jne	.L170	 ;,
 ; D:\TC\src\parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp104
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.68_2
	movq	-16(%rbp), %rax	 ; token_ptr, tmp105
	movq	(%rax), %rax	 ; token_ptr_34->lexeme, _3
	movq	%rax, %rcx	 ; _3,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _4
	jne	.L171	 ;,
.L170:
 ; D:\TC\src\parser.c:606:         parser_error("Expected '(' after 'while'", token);
	movq	-8(%rbp), %rax	 ; token, tmp106
	movq	%rax, %rdx	 ; tmp106,
	leaq	.LC65(%rip), %rax	 ;, tmp107
	movq	%rax, %rcx	 ; tmp107,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:607:         return NULL;
	movl	$0, %eax	 ;, _19
	jmp	.L172	 ;
.L171:
 ; D:\TC\src\parser.c:609:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp108
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp108,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp109, token
 ; D:\TC\src\parser.c:610:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp110
	movq	%rax, -16(%rbp)	 ; tmp110, token_ptr
 ; D:\TC\src\parser.c:611:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp111
	movq	24(%rbp), %rdx	 ; now_scope, tmp112
	movq	16(%rbp), %rax	 ; lexer, tmp113
	movq	%rcx, %r8	 ; tmp111,
	movq	%rax, %rcx	 ; tmp113,
	call	parse_expression	 ;
	movq	%rax, -24(%rbp)	 ; tmp114, condition
 ; D:\TC\src\parser.c:612:     if (condition == 0)
	cmpq	$0, -24(%rbp)	 ;, condition
	jne	.L173	 ;,
 ; D:\TC\src\parser.c:613:         parser_error("Failed to parse while condition", token);
	movq	-8(%rbp), %rax	 ; token, tmp115
	movq	%rax, %rdx	 ; tmp115,
	leaq	.LC66(%rip), %rax	 ;, tmp116
	movq	%rax, %rcx	 ; tmp116,
	call	parser_error	 ;
.L173:
 ; D:\TC\src\parser.c:614:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp117
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp117,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp118, token
 ; D:\TC\src\parser.c:615:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp119
	movq	%rax, -16(%rbp)	 ; tmp119, token_ptr
 ; D:\TC\src\parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp120
	movl	24(%rax), %eax	 ; token_ptr_46->type, _5
 ; D:\TC\src\parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _5
	jne	.L174	 ;,
 ; D:\TC\src\parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp121
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.69_6
	movq	-16(%rbp), %rax	 ; token_ptr, tmp122
	movq	(%rax), %rax	 ; token_ptr_46->lexeme, _7
	movq	%rax, %rcx	 ; _7,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _8
	jne	.L175	 ;,
.L174:
 ; D:\TC\src\parser.c:617:         parser_error("Expected ')' after while condition", token);
	movq	-8(%rbp), %rax	 ; token, tmp123
	movq	%rax, %rdx	 ; tmp123,
	leaq	.LC67(%rip), %rax	 ;, tmp124
	movq	%rax, %rcx	 ; tmp124,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:618:         return NULL;
	movl	$0, %eax	 ;, _19
	jmp	.L172	 ;
.L175:
 ; D:\TC\src\parser.c:620:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp125
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp125,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp126, token
 ; D:\TC\src\parser.c:621:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp127
	movq	%rax, -16(%rbp)	 ; tmp127, token_ptr
 ; D:\TC\src\parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp128
	movl	24(%rax), %eax	 ; token_ptr_50->type, _9
 ; D:\TC\src\parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _9
	jne	.L176	 ;,
 ; D:\TC\src\parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp129
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.70_10
	movq	-16(%rbp), %rax	 ; token_ptr, tmp130
	movq	(%rax), %rax	 ; token_ptr_50->lexeme, _11
	movq	%rax, %rcx	 ; _11,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _12
	jne	.L177	 ;,
.L176:
 ; D:\TC\src\parser.c:623:         parser_error("Expected '{' to start while body", token);
	movq	-8(%rbp), %rax	 ; token, tmp131
	movq	%rax, %rdx	 ; tmp131,
	leaq	.LC68(%rip), %rax	 ;, tmp132
	movq	%rax, %rcx	 ; tmp132,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:624:         return NULL;
	movl	$0, %eax	 ;, _19
	jmp	.L172	 ;
.L177:
 ; D:\TC\src\parser.c:626:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, -32(%rbp)	 ; tmp133, body
 ; D:\TC\src\parser.c:627:     ((parser))->in_loop = true;
	movq	32(%rbp), %rax	 ; parser, tmp134
	movb	$1, 2(%rax)	 ;, parser_40(D)->in_loop
 ; D:\TC\src\parser.c:628:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp135
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp135,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp136, token
 ; D:\TC\src\parser.c:629:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp137
	movq	%rax, -16(%rbp)	 ; tmp137, token_ptr
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L178	 ;
.L180:
 ; D:\TC\src\parser.c:631:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp138
	movq	24(%rbp), %rdx	 ; now_scope, tmp139
	movq	16(%rbp), %rax	 ; lexer, tmp140
	movq	%rcx, %r8	 ; tmp138,
	movq	%rax, %rcx	 ; tmp140,
	call	parse_statement	 ;
	movq	%rax, -40(%rbp)	 ; tmp141, statement
 ; D:\TC\src\parser.c:632:         if (statement == 0)
	cmpq	$0, -40(%rbp)	 ;, statement
	jne	.L179	 ;,
 ; D:\TC\src\parser.c:633:             parser_error("Failed to parse while body statement", token);
	movq	-8(%rbp), %rax	 ; token, tmp142
	movq	%rax, %rdx	 ; tmp142,
	leaq	.LC69(%rip), %rax	 ;, tmp143
	movq	%rax, %rcx	 ; tmp143,
	call	parser_error	 ;
.L179:
 ; D:\TC\src\parser.c:634:         list_append(body, (pointer)statement);
	movq	-40(%rbp), %rdx	 ; statement, tmp144
	movq	-32(%rbp), %rax	 ; body, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	list_append	 ;
 ; D:\TC\src\parser.c:635:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp146
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp146,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp147, token
 ; D:\TC\src\parser.c:636:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp148
	movq	%rax, -16(%rbp)	 ; tmp148, token_ptr
.L178:
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp149
	movl	24(%rax), %eax	 ; token_ptr_18->type, _13
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _13
	jne	.L180	 ;,
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp150
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.71_14
	movq	-16(%rbp), %rax	 ; token_ptr, tmp151
	movq	(%rax), %rax	 ; token_ptr_18->lexeme, _15
	movq	%rax, %rcx	 ; _15,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _16
	je	.L180	 ;,
 ; D:\TC\src\parser.c:638:     ((parser))->in_loop = false;
	movq	32(%rbp), %rax	 ; parser, tmp152
	movb	$0, 2(%rax)	 ;, parser_40(D)->in_loop
 ; D:\TC\src\parser.c:639:     return create_while(condition, body);
	movq	-32(%rbp), %rdx	 ; body, tmp153
	movq	-24(%rbp), %rax	 ; condition, tmp154
	movq	%rax, %rcx	 ; tmp154,
	call	create_while	 ;
.L172:
 ; D:\TC\src\parser.c:640: }
	leave	
	ret	
	.section .rdata,"dr"
.LC70:
	.ascii "Failed to parse right operand\0"
	.text
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
parse_expr_prec:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$96, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; expr_left, expr_left
	movl	%r8d, 32(%rbp)	 ; min_prec, min_prec
	movq	%r9, 40(%rbp)	 ; now_scope, now_scope
 ; D:\TC\src\parser.c:645:     Token* token = 0;
	movq	$0, -24(%rbp)	 ;, token
 ; D:\TC\src\parser.c:646:     Token* token_ptr = NULL;
	movq	$0, -8(%rbp)	 ;, token_ptr
 ; D:\TC\src\parser.c:647:     token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp88
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp88,
	call	peek_next_token	 ;
	movq	%rax, -24(%rbp)	 ; tmp89, token
 ; D:\TC\src\parser.c:648:     token_ptr = token;
	movq	-24(%rbp), %rax	 ; token, tmp90
	movq	%rax, -8(%rbp)	 ; tmp90, token_ptr
 ; D:\TC\src\parser.c:649:     while (token_ptr->type == SYMBOL) {
	jmp	.L182	 ;
.L190:
 ; D:\TC\src\parser.c:650:         OperatorType op = string_to_operator(token_ptr->lexeme);
	movq	-8(%rbp), %rax	 ; token_ptr, tmp91
	movq	(%rax), %rax	 ; token_ptr_7->lexeme, _1
	movq	%rax, %rcx	 ; _1,
	call	string_to_operator	 ;
	movl	%eax, -28(%rbp)	 ; tmp92, op
 ; D:\TC\src\parser.c:651:         int op_prec = operator_precedence(op);
	movl	-28(%rbp), %eax	 ; op, tmp93
	movl	%eax, %ecx	 ; tmp93,
	call	operator_precedence	 ;
	movl	%eax, -32(%rbp)	 ; tmp94, op_prec
 ; D:\TC\src\parser.c:652:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, -28(%rbp)	 ;, op
	je	.L183	 ;,
 ; D:\TC\src\parser.c:652:         if (op == OP_NONE || op_prec < min_prec)
	movl	-32(%rbp), %eax	 ; op_prec, tmp95
	cmpl	32(%rbp), %eax	 ; min_prec, tmp95
	jl	.L183	 ;,
 ; D:\TC\src\parser.c:654:         token = get_next_token(lexer, true);  // consume operator
	movq	16(%rbp), %rax	 ; lexer, tmp96
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp96,
	call	get_next_token	 ;
	movq	%rax, -24(%rbp)	 ; tmp97, token
 ; D:\TC\src\parser.c:655:         token_ptr = token;
	movq	-24(%rbp), %rax	 ; token, tmp98
	movq	%rax, -8(%rbp)	 ; tmp98, token_ptr
 ; D:\TC\src\parser.c:656:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp99
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp99,
	call	get_next_token	 ;
	movq	%rax, -24(%rbp)	 ; tmp100, token
 ; D:\TC\src\parser.c:657:         token_ptr = token;
	movq	-24(%rbp), %rax	 ; token, tmp101
	movq	%rax, -8(%rbp)	 ; tmp101, token_ptr
 ; D:\TC\src\parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	48(%rbp), %rcx	 ; parser, tmp102
	movq	40(%rbp), %rdx	 ; now_scope, tmp103
	movq	16(%rbp), %rax	 ; lexer, tmp104
	movq	%rcx, %r8	 ; tmp102,
	movq	%rax, %rcx	 ; tmp104,
	call	parse_primary	 ;
	movq	%rax, -40(%rbp)	 ; tmp105, right_primary
 ; D:\TC\src\parser.c:659:         if (right_primary == 0) {
	cmpq	$0, -40(%rbp)	 ;, right_primary
	jne	.L184	 ;,
 ; D:\TC\src\parser.c:660:             parser_error("Failed to parse right operand", token);
	movq	-24(%rbp), %rax	 ; token, tmp106
	movq	%rax, %rdx	 ; tmp106,
	leaq	.LC70(%rip), %rax	 ;, tmp107
	movq	%rax, %rcx	 ; tmp107,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:661:             return NULL;
	movl	$0, %eax	 ;, _9
	jmp	.L185	 ;
.L184:
 ; D:\TC\src\parser.c:663:         Expression* right = create_expression(OP_NONE, NULL, right_primary, 0);
	movq	-40(%rbp), %rax	 ; right_primary, tmp108
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; tmp108,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, -16(%rbp)	 ; tmp109, right
 ; D:\TC\src\parser.c:664:         token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp110
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp110,
	call	peek_next_token	 ;
	movq	%rax, -24(%rbp)	 ; tmp111, token
 ; D:\TC\src\parser.c:665:         token_ptr = token;
	movq	-24(%rbp), %rax	 ; token, tmp112
	movq	%rax, -8(%rbp)	 ; tmp112, token_ptr
 ; D:\TC\src\parser.c:666:         while (token_ptr->type == SYMBOL) {
	jmp	.L186	 ;
.L189:
 ; D:\TC\src\parser.c:667:             OperatorType next_op = string_to_operator(token_ptr->lexeme);
	movq	-8(%rbp), %rax	 ; token_ptr, tmp113
	movq	(%rax), %rax	 ; token_ptr_6->lexeme, _2
	movq	%rax, %rcx	 ; _2,
	call	string_to_operator	 ;
	movl	%eax, -44(%rbp)	 ; tmp114, next_op
 ; D:\TC\src\parser.c:668:             int next_prec = operator_precedence(next_op);
	movl	-44(%rbp), %eax	 ; next_op, tmp115
	movl	%eax, %ecx	 ; tmp115,
	call	operator_precedence	 ;
	movl	%eax, -48(%rbp)	 ; tmp116, next_prec
 ; D:\TC\src\parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, -44(%rbp)	 ;, next_op
	je	.L187	 ;,
 ; D:\TC\src\parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	movl	-48(%rbp), %eax	 ; next_prec, tmp117
	cmpl	-32(%rbp), %eax	 ; op_prec, tmp117
	jle	.L187	 ;,
 ; D:\TC\src\parser.c:671:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	40(%rbp), %r9	 ; now_scope, tmp118
	movl	-48(%rbp), %r8d	 ; next_prec, tmp119
	movq	-16(%rbp), %rdx	 ; right, tmp120
	movq	16(%rbp), %rax	 ; lexer, tmp121
	movq	48(%rbp), %rcx	 ; parser, tmp122
	movq	%rcx, 32(%rsp)	 ; tmp122,
	movq	%rax, %rcx	 ; tmp121,
	call	parse_expr_prec	 ;
	movq	%rax, -16(%rbp)	 ; tmp123, right
 ; D:\TC\src\parser.c:672:             if (right == 0)
	cmpq	$0, -16(%rbp)	 ;, right
	jne	.L188	 ;,
 ; D:\TC\src\parser.c:673:                 return NULL;
	movl	$0, %eax	 ;, _9
	jmp	.L185	 ;
.L188:
 ; D:\TC\src\parser.c:674:             token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp124
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp124,
	call	peek_next_token	 ;
	movq	%rax, -24(%rbp)	 ; tmp125, token
 ; D:\TC\src\parser.c:675:             token_ptr = token;
	movq	-24(%rbp), %rax	 ; token, tmp126
	movq	%rax, -8(%rbp)	 ; tmp126, token_ptr
.L186:
 ; D:\TC\src\parser.c:666:         while (token_ptr->type == SYMBOL) {
	movq	-8(%rbp), %rax	 ; token_ptr, tmp127
	movl	24(%rax), %eax	 ; token_ptr_6->type, _3
 ; D:\TC\src\parser.c:666:         while (token_ptr->type == SYMBOL) {
	cmpl	$5, %eax	 ;, _3
	je	.L189	 ;,
.L187:
 ; D:\TC\src\parser.c:677:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	-16(%rbp), %rcx	 ; right, tmp128
	movq	24(%rbp), %rdx	 ; expr_left, tmp129
	movl	-28(%rbp), %eax	 ; op, tmp130
	movq	%rcx, %r9	 ; tmp128,
	movl	$0, %r8d	 ;,
	movl	%eax, %ecx	 ; tmp130,
	call	create_expression	 ;
	movq	%rax, 24(%rbp)	 ; tmp131, expr_left
 ; D:\TC\src\parser.c:678:         token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp132
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp132,
	call	peek_next_token	 ;
	movq	%rax, -24(%rbp)	 ; tmp133, token
 ; D:\TC\src\parser.c:679:         token_ptr = token;
	movq	-24(%rbp), %rax	 ; token, tmp134
	movq	%rax, -8(%rbp)	 ; tmp134, token_ptr
.L182:
 ; D:\TC\src\parser.c:649:     while (token_ptr->type == SYMBOL) {
	movq	-8(%rbp), %rax	 ; token_ptr, tmp135
	movl	24(%rax), %eax	 ; token_ptr_7->type, _4
 ; D:\TC\src\parser.c:649:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, %eax	 ;, _4
	je	.L190	 ;,
.L183:
 ; D:\TC\src\parser.c:681:     token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp136
	movq	%rax, %rcx	 ; tmp136,
	call	peek_current_token	 ;
	movq	%rax, -24(%rbp)	 ; tmp137, token
 ; D:\TC\src\parser.c:682:     token_ptr = token;
	movq	-24(%rbp), %rax	 ; token, tmp138
	movq	%rax, -8(%rbp)	 ; tmp138, token_ptr
 ; D:\TC\src\parser.c:683:     return expr_left;
	movq	24(%rbp), %rax	 ; expr_left, _9
.L185:
 ; D:\TC\src\parser.c:684: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC71:
	.ascii "Failed to parse expression primary\0"
	.text
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$64, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp86
	movq	24(%rbp), %rdx	 ; now_scope, tmp87
	movq	16(%rbp), %rax	 ; lexer, tmp88
	movq	%rcx, %r8	 ; tmp86,
	movq	%rax, %rcx	 ; tmp88,
	call	parse_primary	 ;
	movq	%rax, -8(%rbp)	 ; tmp89, left_primary
 ; D:\TC\src\parser.c:690:     if (left_primary == 0) {
	cmpq	$0, -8(%rbp)	 ;, left_primary
	jne	.L192	 ;,
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	16(%rbp), %rax	 ; lexer, tmp90
	movq	%rax, %rcx	 ; tmp90,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rdx	 ; _1,
	leaq	.LC71(%rip), %rax	 ;, tmp91
	movq	%rax, %rcx	 ; tmp91,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:692:         return NULL;
	movl	$0, %eax	 ;, _3
	jmp	.L193	 ;
.L192:
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	-8(%rbp), %rax	 ; left_primary, tmp92
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; tmp92,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rcx	 ;, _2
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	24(%rbp), %r8	 ; now_scope, tmp93
	movq	16(%rbp), %rax	 ; lexer, tmp94
	movq	32(%rbp), %rdx	 ; parser, tmp95
	movq	%rdx, 32(%rsp)	 ; tmp95,
	movq	%r8, %r9	 ; tmp93,
	movl	$0, %r8d	 ;,
	movq	%rcx, %rdx	 ; _2,
	movq	%rax, %rcx	 ; tmp94,
	call	parse_expr_prec	 ;
.L193:
 ; D:\TC\src\parser.c:695: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC72:
	.ascii "Failed to parse parenthesized expression\0"
.LC73:
	.ascii "Expected ')' after expression\0"
	.align 8
.LC74:
	.ascii "Failed to parse operand of unary '!'\0"
	.align 8
.LC75:
	.ascii "Failed to parse operand of unary '-'\0"
	.align 8
.LC76:
	.ascii "Failed to parse variable access\0"
	.align 8
.LC77:
	.ascii "Unexpected token in primary expression\0"
	.text
	.def	parse_primary;	.scl	3;	.type	32;	.endef
parse_primary:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$112, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:700:     Token* token = 0;
	movq	$0, -48(%rbp)	 ;, token
 ; D:\TC\src\parser.c:701:     Token* token_ptr = NULL;
	movq	$0, -56(%rbp)	 ;, token_ptr
 ; D:\TC\src\parser.c:702:     token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp117
	movq	%rax, %rcx	 ; tmp117,
	call	peek_current_token	 ;
	movq	%rax, -48(%rbp)	 ; tmp118, token
 ; D:\TC\src\parser.c:703:     token_ptr = token;
	movq	-48(%rbp), %rax	 ; token, tmp119
	movq	%rax, -56(%rbp)	 ; tmp119, token_ptr
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	movq	$0, -16(%rbp)	 ;, str_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	movq	$0, -24(%rbp)	 ;, expr_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	movq	$0, -32(%rbp)	 ;, prim_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	movq	$0, -40(%rbp)	 ;, variable_value
 ; D:\TC\src\parser.c:709:     if (token_ptr->type == INTEGER) {
	movq	-56(%rbp), %rax	 ; token_ptr, tmp120
	movl	24(%rax), %eax	 ; token_ptr_56->type, _1
 ; D:\TC\src\parser.c:709:     if (token_ptr->type == INTEGER) {
	cmpl	$2, %eax	 ;, _1
	jne	.L195	 ;,
 ; D:\TC\src\parser.c:710:         type = PRIM_INTEGER;
	movl	$0, -4(%rbp)	 ;, type
 ; D:\TC\src\parser.c:711:         str_value = token_ptr->lexeme;
	movq	-56(%rbp), %rax	 ; token_ptr, tmp121
	movq	(%rax), %rax	 ; token_ptr_56->lexeme, tmp122
	movq	%rax, -16(%rbp)	 ; tmp122, str_value
	jmp	.L196	 ;
.L195:
 ; D:\TC\src\parser.c:712:     } else if (token_ptr->type == FLOAT) {
	movq	-56(%rbp), %rax	 ; token_ptr, tmp123
	movl	24(%rax), %eax	 ; token_ptr_56->type, _2
 ; D:\TC\src\parser.c:712:     } else if (token_ptr->type == FLOAT) {
	cmpl	$3, %eax	 ;, _2
	jne	.L197	 ;,
 ; D:\TC\src\parser.c:713:         type = PRIM_FLOAT;
	movl	$1, -4(%rbp)	 ;, type
 ; D:\TC\src\parser.c:714:         str_value = token_ptr->lexeme;
	movq	-56(%rbp), %rax	 ; token_ptr, tmp124
	movq	(%rax), %rax	 ; token_ptr_56->lexeme, tmp125
	movq	%rax, -16(%rbp)	 ; tmp125, str_value
	jmp	.L196	 ;
.L197:
 ; D:\TC\src\parser.c:715:     } else if (token_ptr->type == STRING) {
	movq	-56(%rbp), %rax	 ; token_ptr, tmp126
	movl	24(%rax), %eax	 ; token_ptr_56->type, _3
 ; D:\TC\src\parser.c:715:     } else if (token_ptr->type == STRING) {
	cmpl	$4, %eax	 ;, _3
	jne	.L198	 ;,
 ; D:\TC\src\parser.c:716:         type = PRIM_STRING;
	movl	$2, -4(%rbp)	 ;, type
 ; D:\TC\src\parser.c:717:         str_value = token_ptr->lexeme;
	movq	-56(%rbp), %rax	 ; token_ptr, tmp127
	movq	(%rax), %rax	 ; token_ptr_56->lexeme, tmp128
	movq	%rax, -16(%rbp)	 ; tmp128, str_value
	jmp	.L196	 ;
.L198:
 ; D:\TC\src\parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	movq	-56(%rbp), %rax	 ; token_ptr, tmp129
	movl	24(%rax), %eax	 ; token_ptr_56->type, _4
 ; D:\TC\src\parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _4
	jne	.L199	 ;,
 ; D:\TC\src\parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	movq	.refptr.TRUE_KEYWORD(%rip), %rax	 ;, tmp130
	movq	(%rax), %rdx	 ; TRUE_KEYWORD, TRUE_KEYWORD.72_5
	movq	-56(%rbp), %rax	 ; token_ptr, tmp131
	movq	(%rax), %rax	 ; token_ptr_56->lexeme, _6
	movq	%rax, %rcx	 ; _6,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	 ; _7
	je	.L199	 ;,
 ; D:\TC\src\parser.c:719:         type = PRIM_TRUE;
	movl	$3, -4(%rbp)	 ;, type
 ; D:\TC\src\parser.c:720:         str_value = token_ptr->lexeme;
	movq	-56(%rbp), %rax	 ; token_ptr, tmp132
	movq	(%rax), %rax	 ; token_ptr_56->lexeme, tmp133
	movq	%rax, -16(%rbp)	 ; tmp133, str_value
	jmp	.L196	 ;
.L199:
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	movq	-56(%rbp), %rax	 ; token_ptr, tmp134
	movl	24(%rax), %eax	 ; token_ptr_56->type, _8
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _8
	jne	.L200	 ;,
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	movq	.refptr.FALSE_KEYWORD(%rip), %rax	 ;, tmp135
	movq	(%rax), %rdx	 ; FALSE_KEYWORD, FALSE_KEYWORD.73_9
	movq	-56(%rbp), %rax	 ; token_ptr, tmp136
	movq	(%rax), %rax	 ; token_ptr_56->lexeme, _10
	movq	%rax, %rcx	 ; _10,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	 ; _11
	je	.L200	 ;,
 ; D:\TC\src\parser.c:722:         type = PRIM_FALSE;
	movl	$4, -4(%rbp)	 ;, type
 ; D:\TC\src\parser.c:723:         str_value = token_ptr->lexeme;
	movq	-56(%rbp), %rax	 ; token_ptr, tmp137
	movq	(%rax), %rax	 ; token_ptr_56->lexeme, tmp138
	movq	%rax, -16(%rbp)	 ; tmp138, str_value
	jmp	.L196	 ;
.L200:
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	-56(%rbp), %rax	 ; token_ptr, tmp139
	movl	24(%rax), %eax	 ; token_ptr_56->type, _12
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _12
	jne	.L201	 ;,
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp140
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.74_13
	movq	-56(%rbp), %rax	 ; token_ptr, tmp141
	movq	(%rax), %rax	 ; token_ptr_56->lexeme, _14
	movq	%rax, %rcx	 ; _14,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _15
	je	.L201	 ;,
 ; D:\TC\src\parser.c:725:         type = PRIM_EXPRESSION;
	movl	$5, -4(%rbp)	 ;, type
 ; D:\TC\src\parser.c:726:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp142
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp142,
	call	get_next_token	 ;
	movq	%rax, -48(%rbp)	 ; tmp143, token
 ; D:\TC\src\parser.c:727:         token_ptr = token;
	movq	-48(%rbp), %rax	 ; token, tmp144
	movq	%rax, -56(%rbp)	 ; tmp144, token_ptr
 ; D:\TC\src\parser.c:728:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp145
	movq	24(%rbp), %rdx	 ; now_scope, tmp146
	movq	16(%rbp), %rax	 ; lexer, tmp147
	movq	%rcx, %r8	 ; tmp145,
	movq	%rax, %rcx	 ; tmp147,
	call	parse_expression	 ;
	movq	%rax, -24(%rbp)	 ; tmp148, expr_value
 ; D:\TC\src\parser.c:729:         if (expr_value == NULL) {
	cmpq	$0, -24(%rbp)	 ;, expr_value
	jne	.L202	 ;,
 ; D:\TC\src\parser.c:730:             parser_error("Failed to parse parenthesized expression", token);
	movq	-48(%rbp), %rax	 ; token, tmp149
	movq	%rax, %rdx	 ; tmp149,
	leaq	.LC72(%rip), %rax	 ;, tmp150
	movq	%rax, %rcx	 ; tmp150,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:731:             return NULL;
	movl	$0, %eax	 ;, _39
	jmp	.L203	 ;
.L202:
 ; D:\TC\src\parser.c:733:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp151
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp151,
	call	get_next_token	 ;
	movq	%rax, -48(%rbp)	 ; tmp152, token
 ; D:\TC\src\parser.c:734:         token_ptr = token;
	movq	-48(%rbp), %rax	 ; token, tmp153
	movq	%rax, -56(%rbp)	 ; tmp153, token_ptr
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	-56(%rbp), %rax	 ; token_ptr, tmp154
	movl	24(%rax), %eax	 ; token_ptr_78->type, _16
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _16
	jne	.L204	 ;,
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp155
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.75_17
	movq	-56(%rbp), %rax	 ; token_ptr, tmp156
	movq	(%rax), %rax	 ; token_ptr_78->lexeme, _18
	movq	%rax, %rcx	 ; _18,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _19
	jne	.L213	 ;,
.L204:
 ; D:\TC\src\parser.c:736:             parser_error("Expected ')' after expression", token);
	movq	-48(%rbp), %rax	 ; token, tmp157
	movq	%rax, %rdx	 ; tmp157,
	leaq	.LC73(%rip), %rax	 ;, tmp158
	movq	%rax, %rcx	 ; tmp158,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:737:             return NULL;
	movl	$0, %eax	 ;, _39
	jmp	.L203	 ;
.L201:
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	movq	-56(%rbp), %rax	 ; token_ptr, tmp159
	movl	24(%rax), %eax	 ; token_ptr_56->type, _20
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	cmpl	$5, %eax	 ;, _20
	jne	.L206	 ;,
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp160
	movq	(%rax), %rdx	 ; NOT_SYMBOL, NOT_SYMBOL.76_21
	movq	-56(%rbp), %rax	 ; token_ptr, tmp161
	movq	(%rax), %rax	 ; token_ptr_56->lexeme, _22
	movq	%rax, %rcx	 ; _22,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	 ; _23
	je	.L206	 ;,
 ; D:\TC\src\parser.c:740:         type = PRIM_NOT_OPERAND;
	movl	$6, -4(%rbp)	 ;, type
 ; D:\TC\src\parser.c:741:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp162
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp162,
	call	get_next_token	 ;
	movq	%rax, -48(%rbp)	 ; tmp163, token
 ; D:\TC\src\parser.c:742:         token_ptr = token;
	movq	-48(%rbp), %rax	 ; token, tmp164
	movq	%rax, -56(%rbp)	 ; tmp164, token_ptr
 ; D:\TC\src\parser.c:743:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp165
	movq	24(%rbp), %rdx	 ; now_scope, tmp166
	movq	16(%rbp), %rax	 ; lexer, tmp167
	movq	%rcx, %r8	 ; tmp165,
	movq	%rax, %rcx	 ; tmp167,
	call	parse_primary	 ;
	movq	%rax, -32(%rbp)	 ; tmp168, prim_value
 ; D:\TC\src\parser.c:744:         if (prim_value == 0) {
	cmpq	$0, -32(%rbp)	 ;, prim_value
	jne	.L196	 ;,
 ; D:\TC\src\parser.c:745:             parser_error("Failed to parse operand of unary '!'", token);
	movq	-48(%rbp), %rax	 ; token, tmp169
	movq	%rax, %rdx	 ; tmp169,
	leaq	.LC74(%rip), %rax	 ;, tmp170
	movq	%rax, %rcx	 ; tmp170,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:746:             return NULL;
	movl	$0, %eax	 ;, _39
	jmp	.L203	 ;
.L206:
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	movq	-56(%rbp), %rax	 ; token_ptr, tmp171
	movl	24(%rax), %eax	 ; token_ptr_56->type, _24
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	cmpl	$5, %eax	 ;, _24
	jne	.L208	 ;,
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp172
	movq	(%rax), %rdx	 ; SUB_SYMBOL, SUB_SYMBOL.77_25
	movq	-56(%rbp), %rax	 ; token_ptr, tmp173
	movq	(%rax), %rax	 ; token_ptr_56->lexeme, _26
	movq	%rax, %rcx	 ; _26,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	 ; _27
	je	.L208	 ;,
 ; D:\TC\src\parser.c:749:         type = PRIM_NEG_OPERAND;
	movl	$7, -4(%rbp)	 ;, type
 ; D:\TC\src\parser.c:750:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp174
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp174,
	call	get_next_token	 ;
	movq	%rax, -48(%rbp)	 ; tmp175, token
 ; D:\TC\src\parser.c:751:         token_ptr = token;
	movq	-48(%rbp), %rax	 ; token, tmp176
	movq	%rax, -56(%rbp)	 ; tmp176, token_ptr
 ; D:\TC\src\parser.c:752:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp177
	movq	24(%rbp), %rdx	 ; now_scope, tmp178
	movq	16(%rbp), %rax	 ; lexer, tmp179
	movq	%rcx, %r8	 ; tmp177,
	movq	%rax, %rcx	 ; tmp179,
	call	parse_primary	 ;
	movq	%rax, -32(%rbp)	 ; tmp180, prim_value
 ; D:\TC\src\parser.c:753:         if (prim_value == 0) {
	cmpq	$0, -32(%rbp)	 ;, prim_value
	jne	.L196	 ;,
 ; D:\TC\src\parser.c:754:             parser_error("Failed to parse operand of unary '-'", token);
	movq	-48(%rbp), %rax	 ; token, tmp181
	movq	%rax, %rdx	 ; tmp181,
	leaq	.LC75(%rip), %rax	 ;, tmp182
	movq	%rax, %rcx	 ; tmp182,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:755:             return NULL;
	movl	$0, %eax	 ;, _39
	jmp	.L203	 ;
.L208:
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movq	-56(%rbp), %rax	 ; token_ptr, tmp183
	movl	24(%rax), %eax	 ; token_ptr_56->type, _28
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$1, %eax	 ;, _28
	je	.L210	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movq	-56(%rbp), %rax	 ; token_ptr, tmp184
	movl	24(%rax), %eax	 ; token_ptr_56->type, _29
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$6, %eax	 ;, _29
	jne	.L211	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp185
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD.78_30
	movq	-56(%rbp), %rax	 ; token_ptr, tmp186
	movq	(%rax), %rax	 ; token_ptr_56->lexeme, _31
	movq	%rax, %rcx	 ; _31,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	testb	%al, %al	 ; _32
	je	.L211	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movq	32(%rbp), %rax	 ; parser, tmp187
	movzbl	1(%rax), %eax	 ; parser_73(D)->in_method, _33
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	testb	%al, %al	 ; _33
	je	.L211	 ;,
.L210:
 ; D:\TC\src\parser.c:758:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, -4(%rbp)	 ;, type
 ; D:\TC\src\parser.c:759:         variable_value = parse_variable_access(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp188
	movq	24(%rbp), %rdx	 ; now_scope, tmp189
	movq	16(%rbp), %rax	 ; lexer, tmp190
	movq	%rcx, %r8	 ; tmp188,
	movq	%rax, %rcx	 ; tmp190,
	call	parse_variable_access	 ;
	movq	%rax, -40(%rbp)	 ; tmp191, variable_value
 ; D:\TC\src\parser.c:760:         if (variable_value == 0) {
	cmpq	$0, -40(%rbp)	 ;, variable_value
	jne	.L196	 ;,
 ; D:\TC\src\parser.c:761:             parser_error("Failed to parse variable access", token);
	movq	-48(%rbp), %rax	 ; token, tmp192
	movq	%rax, %rdx	 ; tmp192,
	leaq	.LC76(%rip), %rax	 ;, tmp193
	movq	%rax, %rcx	 ; tmp193,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:762:             return NULL;
	movl	$0, %eax	 ;, _39
	jmp	.L203	 ;
.L211:
 ; D:\TC\src\parser.c:765:         parser_error("Unexpected token in primary expression", token);
	movq	-48(%rbp), %rax	 ; token, tmp194
	movq	%rax, %rdx	 ; tmp194,
	leaq	.LC77(%rip), %rax	 ;, tmp195
	movq	%rax, %rcx	 ; tmp195,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:766:         return NULL;
	movl	$0, %eax	 ;, _39
	jmp	.L203	 ;
.L213:
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	nop	
.L196:
 ; D:\TC\src\parser.c:768:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	-32(%rbp), %r9	 ; prim_value, tmp196
	movq	-24(%rbp), %r8	 ; expr_value, tmp197
	movq	-16(%rbp), %rdx	 ; str_value, tmp198
	movl	-4(%rbp), %eax	 ; type, tmp199
	movq	-40(%rbp), %rcx	 ; variable_value, tmp200
	movq	%rcx, 32(%rsp)	 ; tmp200,
	movl	%eax, %ecx	 ; tmp199,
	call	create_primary	 ;
.L203:
 ; D:\TC\src\parser.c:769: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC78:
	.ascii "Expected variable name in variable access\0"
	.align 8
.LC79:
	.ascii "Cannot call undefined variable\0"
	.align 8
.LC80:
	.ascii "Cannot call non-function variable\0"
	.align 8
.LC81:
	.ascii "Failed to parse function call argument\0"
	.align 8
.LC82:
	.ascii "Expected ',' or ')' after function call argument\0"
	.align 8
.LC83:
	.ascii "Failed to parse sequence index\0"
	.align 8
.LC84:
	.ascii "Expected ']' after sequence index\0"
	.align 8
.LC85:
	.ascii "Cannot access attribute without a valid scope\0"
	.align 8
.LC86:
	.ascii "Expected attribute name after '.'\0"
.LC87:
	.ascii "Unknown attribute name\0"
	.text
	.def	parse_variable_access;	.scl	3;	.type	32;	.endef
parse_variable_access:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$144, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:774:     Token* token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp127
	movq	%rax, %rcx	 ; tmp127,
	call	peek_current_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp128, token
 ; D:\TC\src\parser.c:775:     Token* token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp129
	movq	%rax, -16(%rbp)	 ; tmp129, token_ptr
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp130
	movl	24(%rax), %eax	 ; token_ptr_77->type, _1
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	 ;, _1
	je	.L215	 ;,
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp131
	movl	24(%rax), %eax	 ; token_ptr_77->type, _2
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	 ;, _2
	jne	.L216	 ;,
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp132
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD.79_3
	movq	-16(%rbp), %rax	 ; token_ptr, tmp133
	movq	(%rax), %rax	 ; token_ptr_77->lexeme, _4
	movq	%rax, %rcx	 ; _4,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	 ; _5
	jne	.L215	 ;,
.L216:
 ; D:\TC\src\parser.c:777:         parser_error("Expected variable name in variable access", token);
	movq	-8(%rbp), %rax	 ; token, tmp134
	movq	%rax, %rdx	 ; tmp134,
	leaq	.LC78(%rip), %rax	 ;, tmp135
	movq	%rax, %rcx	 ; tmp135,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:778:         return NULL;
	movl	$0, %eax	 ;, _57
	jmp	.L217	 ;
.L215:
 ; D:\TC\src\parser.c:780:     Name* current_type = 0;
	movq	$0, -24(%rbp)	 ;, current_type
 ; D:\TC\src\parser.c:781:     Name* base_name = 0;
	movq	$0, -32(%rbp)	 ;, base_name
 ; D:\TC\src\parser.c:782:     Scope* var_scope = 0;
	movq	$0, -40(%rbp)	 ;, var_scope
 ; D:\TC\src\parser.c:783:     Name* base_name_ptr = NULL;
	movq	$0, -56(%rbp)	 ;, base_name_ptr
 ; D:\TC\src\parser.c:784:     base_name = search(now_scope, token_ptr->lexeme);
	movq	-16(%rbp), %rax	 ; token_ptr, tmp136
	movq	(%rax), %rdx	 ; token_ptr_77->lexeme, _6
	movq	24(%rbp), %rax	 ; now_scope, tmp137
	movq	%rax, %rcx	 ; tmp137,
	call	search	 ;
	movq	%rax, -32(%rbp)	 ; tmp138, base_name
 ; D:\TC\src\parser.c:785:     VariableAccess* base = create_variable_access(VAR_NAME, 0, base_name, NULL, NULL);
	movq	-32(%rbp), %rax	 ; base_name, tmp139
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; tmp139,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, -48(%rbp)	 ; tmp140, base
 ; D:\TC\src\parser.c:786:     token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp141
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp141,
	call	peek_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp142, token
 ; D:\TC\src\parser.c:787:     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp143
	movq	%rax, -16(%rbp)	 ; tmp143, token_ptr
 ; D:\TC\src\parser.c:788:     while (token_ptr->type == SYMBOL) {
	jmp	.L218	 ;
.L243:
 ; D:\TC\src\parser.c:789:         if (base_name != 0) {
	cmpq	$0, -32(%rbp)	 ;, base_name
	je	.L219	 ;,
 ; D:\TC\src\parser.c:790:             base_name_ptr = (base_name);
	movq	-32(%rbp), %rax	 ; base_name, tmp144
	movq	%rax, -56(%rbp)	 ; tmp144, base_name_ptr
 ; D:\TC\src\parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	movq	-56(%rbp), %rax	 ; base_name_ptr, tmp145
	movl	24(%rax), %eax	 ; base_name_ptr_93->kind, _7
 ; D:\TC\src\parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	cmpl	$1, %eax	 ;, _7
	je	.L220	 ;,
 ; D:\TC\src\parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	movq	-56(%rbp), %rax	 ; base_name_ptr, tmp146
	movl	24(%rax), %eax	 ; base_name_ptr_93->kind, _8
 ; D:\TC\src\parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	cmpl	$5, %eax	 ;, _8
	je	.L220	 ;,
 ; D:\TC\src\parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	movq	-56(%rbp), %rax	 ; base_name_ptr, tmp147
	movl	24(%rax), %eax	 ; base_name_ptr_93->kind, _9
 ; D:\TC\src\parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	cmpl	$2, %eax	 ;, _9
	je	.L220	 ;,
 ; D:\TC\src\parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	movq	-56(%rbp), %rax	 ; base_name_ptr, tmp148
	movl	24(%rax), %eax	 ; base_name_ptr_93->kind, _10
 ; D:\TC\src\parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	cmpl	$3, %eax	 ;, _10
	jne	.L221	 ;,
.L220:
 ; D:\TC\src\parser.c:792:                 current_type = base_name_ptr->info.type;
	movq	-56(%rbp), %rax	 ; base_name_ptr, tmp149
	movq	16(%rax), %rax	 ; base_name_ptr_93->info.type, tmp150
	movq	%rax, -24(%rbp)	 ; tmp150, current_type
	jmp	.L219	 ;
.L221:
 ; D:\TC\src\parser.c:793:             else if (base_name_ptr->kind == NAME_CLASS || base_name_ptr->kind == NAME_TYPE)
	movq	-56(%rbp), %rax	 ; base_name_ptr, tmp151
	movl	24(%rax), %eax	 ; base_name_ptr_93->kind, _11
 ; D:\TC\src\parser.c:793:             else if (base_name_ptr->kind == NAME_CLASS || base_name_ptr->kind == NAME_TYPE)
	cmpl	$4, %eax	 ;, _11
	je	.L222	 ;,
 ; D:\TC\src\parser.c:793:             else if (base_name_ptr->kind == NAME_CLASS || base_name_ptr->kind == NAME_TYPE)
	movq	-56(%rbp), %rax	 ; base_name_ptr, tmp152
	movl	24(%rax), %eax	 ; base_name_ptr_93->kind, _12
 ; D:\TC\src\parser.c:793:             else if (base_name_ptr->kind == NAME_CLASS || base_name_ptr->kind == NAME_TYPE)
	testl	%eax, %eax	 ; _12
	jne	.L219	 ;,
.L222:
 ; D:\TC\src\parser.c:794:                 current_type = base_name;
	movq	-32(%rbp), %rax	 ; base_name, tmp153
	movq	%rax, -24(%rbp)	 ; tmp153, current_type
.L219:
 ; D:\TC\src\parser.c:796:         if (var_scope == 0 && current_type != 0) {
	cmpq	$0, -40(%rbp)	 ;, var_scope
	jne	.L223	 ;,
 ; D:\TC\src\parser.c:796:         if (var_scope == 0 && current_type != 0) {
	cmpq	$0, -24(%rbp)	 ;, current_type
	je	.L223	 ;,
 ; D:\TC\src\parser.c:797:             Name* type_ptr = (current_type);
	movq	-24(%rbp), %rax	 ; current_type, tmp154
	movq	%rax, -64(%rbp)	 ; tmp154, type_ptr
 ; D:\TC\src\parser.c:798:             if (type_ptr->kind == NAME_CLASS)
	movq	-64(%rbp), %rax	 ; type_ptr, tmp155
	movl	24(%rax), %eax	 ; type_ptr_96->kind, _13
 ; D:\TC\src\parser.c:798:             if (type_ptr->kind == NAME_CLASS)
	cmpl	$4, %eax	 ;, _13
	jne	.L223	 ;,
 ; D:\TC\src\parser.c:799:                 var_scope = type_ptr->info.scope;
	movq	-64(%rbp), %rax	 ; type_ptr, tmp156
	movq	16(%rax), %rax	 ; type_ptr_96->info.scope, tmp157
	movq	%rax, -40(%rbp)	 ; tmp157, var_scope
.L223:
 ; D:\TC\src\parser.c:801:         if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp158
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.80_14
	movq	-16(%rbp), %rax	 ; token_ptr, tmp159
	movq	(%rax), %rax	 ; token_ptr_46->lexeme, _15
	movq	%rax, %rcx	 ; _15,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:801:         if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _16
	je	.L224	 ;,
 ; D:\TC\src\parser.c:802:             token = get_next_token(lexer, true);  // consume '('
	movq	16(%rbp), %rax	 ; lexer, tmp160
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp160,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp161, token
 ; D:\TC\src\parser.c:803:             token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp162
	movq	%rax, -16(%rbp)	 ; tmp162, token_ptr
 ; D:\TC\src\parser.c:804:             if (base_name == 0)
	cmpq	$0, -32(%rbp)	 ;, base_name
	jne	.L225	 ;,
 ; D:\TC\src\parser.c:805:                 parser_error("Cannot call undefined variable", token);
	movq	-8(%rbp), %rax	 ; token, tmp163
	movq	%rax, %rdx	 ; tmp163,
	leaq	.LC79(%rip), %rax	 ;, tmp164
	movq	%rax, %rcx	 ; tmp164,
	call	parser_error	 ;
.L225:
 ; D:\TC\src\parser.c:806:             base_name_ptr = (base_name);
	movq	-32(%rbp), %rax	 ; base_name, tmp165
	movq	%rax, -56(%rbp)	 ; tmp165, base_name_ptr
 ; D:\TC\src\parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	movq	-56(%rbp), %rax	 ; base_name_ptr, tmp166
	movl	24(%rax), %eax	 ; base_name_ptr_141->kind, _17
 ; D:\TC\src\parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	cmpl	$2, %eax	 ;, _17
	je	.L226	 ;,
 ; D:\TC\src\parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	movq	-56(%rbp), %rax	 ; base_name_ptr, tmp167
	movl	24(%rax), %eax	 ; base_name_ptr_141->kind, _18
 ; D:\TC\src\parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	cmpl	$3, %eax	 ;, _18
	je	.L226	 ;,
 ; D:\TC\src\parser.c:808:                 parser_error("Cannot call non-function variable", token);
	movq	-8(%rbp), %rax	 ; token, tmp168
	movq	%rax, %rdx	 ; tmp168,
	leaq	.LC80(%rip), %rax	 ;, tmp169
	movq	%rax, %rcx	 ; tmp169,
	call	parser_error	 ;
.L226:
 ; D:\TC\src\parser.c:809:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp170
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp170,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp171, token
 ; D:\TC\src\parser.c:810:             token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp172
	movq	%rax, -16(%rbp)	 ; tmp172, token_ptr
 ; D:\TC\src\parser.c:811:             list(Expression*) args = create_list();
	call	create_list	 ;
	movq	%rax, -80(%rbp)	 ; tmp173, args
 ; D:\TC\src\parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L227	 ;
.L232:
 ; D:\TC\src\parser.c:813:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp174
	movq	24(%rbp), %rdx	 ; now_scope, tmp175
	movq	16(%rbp), %rax	 ; lexer, tmp176
	movq	%rcx, %r8	 ; tmp174,
	movq	%rax, %rcx	 ; tmp176,
	call	parse_expression	 ;
	movq	%rax, -88(%rbp)	 ; tmp177, arg
 ; D:\TC\src\parser.c:814:                 if (arg == 0)
	cmpq	$0, -88(%rbp)	 ;, arg
	jne	.L228	 ;,
 ; D:\TC\src\parser.c:815:                     parser_error("Failed to parse function call argument", token);
	movq	-8(%rbp), %rax	 ; token, tmp178
	movq	%rax, %rdx	 ; tmp178,
	leaq	.LC81(%rip), %rax	 ;, tmp179
	movq	%rax, %rcx	 ; tmp179,
	call	parser_error	 ;
.L228:
 ; D:\TC\src\parser.c:816:                 list_append(args, (pointer)arg);
	movq	-88(%rbp), %rdx	 ; arg, tmp180
	movq	-80(%rbp), %rax	 ; args, tmp181
	movq	%rax, %rcx	 ; tmp181,
	call	list_append	 ;
 ; D:\TC\src\parser.c:817:                 token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp182
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp182,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp183, token
 ; D:\TC\src\parser.c:818:                 token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp184
	movq	%rax, -16(%rbp)	 ; tmp184, token_ptr
 ; D:\TC\src\parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp185
	movl	24(%rax), %eax	 ; token_ptr_160->type, _19
 ; D:\TC\src\parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, %eax	 ;, _19
	jne	.L229	 ;,
 ; D:\TC\src\parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp186
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL.81_20
	movq	-16(%rbp), %rax	 ; token_ptr, tmp187
	movq	(%rax), %rax	 ; token_ptr_160->lexeme, _21
	movq	%rax, %rcx	 ; _21,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; _22
	je	.L229	 ;,
 ; D:\TC\src\parser.c:820:                     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp188
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp188,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp189, token
 ; D:\TC\src\parser.c:821:                     token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp190
	movq	%rax, -16(%rbp)	 ; tmp190, token_ptr
	jmp	.L227	 ;
.L229:
 ; D:\TC\src\parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp191
	movl	24(%rax), %eax	 ; token_ptr_160->type, _23
 ; D:\TC\src\parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _23
	jne	.L231	 ;,
 ; D:\TC\src\parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp192
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.82_24
	movq	-16(%rbp), %rax	 ; token_ptr, tmp193
	movq	(%rax), %rax	 ; token_ptr_160->lexeme, _25
	movq	%rax, %rcx	 ; _25,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _26
	jne	.L227	 ;,
.L231:
 ; D:\TC\src\parser.c:823:                     parser_error("Expected ',' or ')' after function call argument", token);
	movq	-8(%rbp), %rax	 ; token, tmp194
	movq	%rax, %rdx	 ; tmp194,
	leaq	.LC82(%rip), %rax	 ;, tmp195
	movq	%rax, %rcx	 ; tmp195,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:824:                     return NULL;
	movl	$0, %eax	 ;, _57
	jmp	.L217	 ;
.L227:
 ; D:\TC\src\parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp196
	movl	24(%rax), %eax	 ; token_ptr_45->type, _27
 ; D:\TC\src\parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _27
	jne	.L232	 ;,
 ; D:\TC\src\parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp197
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.83_28
	movq	-16(%rbp), %rax	 ; token_ptr, tmp198
	movq	(%rax), %rax	 ; token_ptr_45->lexeme, _29
	movq	%rax, %rcx	 ; _29,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _30
	je	.L232	 ;,
 ; D:\TC\src\parser.c:827:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	-48(%rbp), %rax	 ; base, tmp199
	movq	-80(%rbp), %rdx	 ; args, tmp200
	movq	%rdx, 32(%rsp)	 ; tmp200,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp199,
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, -48(%rbp)	 ; tmp201, base
 ; D:\TC\src\parser.c:828:             base_name = base_name_ptr->info.type;
	movq	-56(%rbp), %rax	 ; base_name_ptr, tmp202
	movq	16(%rax), %rax	 ; base_name_ptr_141->info.type, tmp203
	movq	%rax, -32(%rbp)	 ; tmp203, base_name
 ; D:\TC\src\parser.c:829:             current_type = 0;
	movq	$0, -24(%rbp)	 ;, current_type
 ; D:\TC\src\parser.c:830:             var_scope = 0;
	movq	$0, -40(%rbp)	 ;, var_scope
	jmp	.L233	 ;
.L224:
 ; D:\TC\src\parser.c:831:         } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp204
	movq	(%rax), %rdx	 ; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL.84_31
	movq	-16(%rbp), %rax	 ; token_ptr, tmp205
	movq	(%rax), %rax	 ; token_ptr_46->lexeme, _32
	movq	%rax, %rcx	 ; _32,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:831:         } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; _33
	je	.L234	 ;,
 ; D:\TC\src\parser.c:832:             token = get_next_token(lexer, true);  // consume '['
	movq	16(%rbp), %rax	 ; lexer, tmp206
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp206,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp207, token
 ; D:\TC\src\parser.c:833:             token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp208
	movq	%rax, -16(%rbp)	 ; tmp208, token_ptr
 ; D:\TC\src\parser.c:834:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp209
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp209,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp210, token
 ; D:\TC\src\parser.c:835:             token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp211
	movq	%rax, -16(%rbp)	 ; tmp211, token_ptr
 ; D:\TC\src\parser.c:836:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp212
	movq	24(%rbp), %rdx	 ; now_scope, tmp213
	movq	16(%rbp), %rax	 ; lexer, tmp214
	movq	%rcx, %r8	 ; tmp212,
	movq	%rax, %rcx	 ; tmp214,
	call	parse_expression	 ;
	movq	%rax, -72(%rbp)	 ; tmp215, index
 ; D:\TC\src\parser.c:837:             if (index == 0)
	cmpq	$0, -72(%rbp)	 ;, index
	jne	.L235	 ;,
 ; D:\TC\src\parser.c:838:                 parser_error("Failed to parse sequence index", token);
	movq	-8(%rbp), %rax	 ; token, tmp216
	movq	%rax, %rdx	 ; tmp216,
	leaq	.LC83(%rip), %rax	 ;, tmp217
	movq	%rax, %rcx	 ; tmp217,
	call	parser_error	 ;
.L235:
 ; D:\TC\src\parser.c:839:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp218
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp218,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp219, token
 ; D:\TC\src\parser.c:840:             token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp220
	movq	%rax, -16(%rbp)	 ; tmp220, token_ptr
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp221
	movl	24(%rax), %eax	 ; token_ptr_131->type, _34
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, %eax	 ;, _34
	jne	.L236	 ;,
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp222
	movq	(%rax), %rdx	 ; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL.85_35
	movq	-16(%rbp), %rax	 ; token_ptr, tmp223
	movq	(%rax), %rax	 ; token_ptr_131->lexeme, _36
	movq	%rax, %rcx	 ; _36,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; _37
	jne	.L237	 ;,
.L236:
 ; D:\TC\src\parser.c:842:                 parser_error("Expected ']' after sequence index", token);
	movq	-8(%rbp), %rax	 ; token, tmp224
	movq	%rax, %rdx	 ; tmp224,
	leaq	.LC84(%rip), %rax	 ;, tmp225
	movq	%rax, %rcx	 ; tmp225,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:843:                 return NULL;
	movl	$0, %eax	 ;, _57
	jmp	.L217	 ;
.L237:
 ; D:\TC\src\parser.c:845:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movq	-72(%rbp), %rdx	 ; index, tmp226
	movq	-48(%rbp), %rax	 ; base, tmp227
	movq	$0, 32(%rsp)	 ;,
	movq	%rdx, %r9	 ; tmp226,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp227,
	movl	$3, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, -48(%rbp)	 ; tmp228, base
	jmp	.L233	 ;
.L234:
 ; D:\TC\src\parser.c:846:         } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp229
	movq	(%rax), %rdx	 ; DOT_SYMBOL, DOT_SYMBOL.86_38
	movq	-16(%rbp), %rax	 ; token_ptr, tmp230
	movq	(%rax), %rax	 ; token_ptr_46->lexeme, _39
	movq	%rax, %rcx	 ; _39,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:846:         } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	 ; _40
	je	.L244	 ;,
 ; D:\TC\src\parser.c:847:             token = get_next_token(lexer, true);  // consume '.'
	movq	16(%rbp), %rax	 ; lexer, tmp231
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp231,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp232, token
 ; D:\TC\src\parser.c:848:             token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp233
	movq	%rax, -16(%rbp)	 ; tmp233, token_ptr
 ; D:\TC\src\parser.c:849:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp234
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp234,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp235, token
 ; D:\TC\src\parser.c:850:             token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp236
	movq	%rax, -16(%rbp)	 ; tmp236, token_ptr
 ; D:\TC\src\parser.c:851:             if (var_scope == 0) {
	cmpq	$0, -40(%rbp)	 ;, var_scope
	jne	.L239	 ;,
 ; D:\TC\src\parser.c:852:                 parser_error("Cannot access attribute without a valid scope", token);
	movq	-8(%rbp), %rax	 ; token, tmp237
	movq	%rax, %rdx	 ; tmp237,
	leaq	.LC85(%rip), %rax	 ;, tmp238
	movq	%rax, %rcx	 ; tmp238,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:853:                 return NULL;
	movl	$0, %eax	 ;, _57
	jmp	.L217	 ;
.L239:
 ; D:\TC\src\parser.c:855:             if (token_ptr->type != IDENTIFIER) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp239
	movl	24(%rax), %eax	 ; token_ptr_106->type, _41
 ; D:\TC\src\parser.c:855:             if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, %eax	 ;, _41
	je	.L240	 ;,
 ; D:\TC\src\parser.c:856:                 parser_error("Expected attribute name after '.'", token);
	movq	-8(%rbp), %rax	 ; token, tmp240
	movq	%rax, %rdx	 ; tmp240,
	leaq	.LC86(%rip), %rax	 ;, tmp241
	movq	%rax, %rcx	 ; tmp241,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:857:                 return NULL;
	movl	$0, %eax	 ;, _57
	jmp	.L217	 ;
.L240:
 ; D:\TC\src\parser.c:859:             base_name = search(var_scope, token_ptr->lexeme);
	movq	-16(%rbp), %rax	 ; token_ptr, tmp242
	movq	(%rax), %rdx	 ; token_ptr_106->lexeme, _42
	movq	-40(%rbp), %rax	 ; var_scope, tmp243
	movq	%rax, %rcx	 ; tmp243,
	call	search	 ;
	movq	%rax, -32(%rbp)	 ; tmp244, base_name
 ; D:\TC\src\parser.c:860:             if (base_name == 0) {
	cmpq	$0, -32(%rbp)	 ;, base_name
	jne	.L241	 ;,
 ; D:\TC\src\parser.c:861:                 parser_error("Unknown attribute name", token);
	movq	-8(%rbp), %rax	 ; token, tmp245
	movq	%rax, %rdx	 ; tmp245,
	leaq	.LC87(%rip), %rax	 ;, tmp246
	movq	%rax, %rcx	 ; tmp246,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:862:                 return NULL;
	movl	$0, %eax	 ;, _57
	jmp	.L217	 ;
.L241:
 ; D:\TC\src\parser.c:864:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	-32(%rbp), %rdx	 ; base_name, tmp247
	movq	-48(%rbp), %rax	 ; base, tmp248
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp247,
	movq	%rax, %rdx	 ; tmp248,
	movl	$2, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, -48(%rbp)	 ; tmp249, base
 ; D:\TC\src\parser.c:865:             current_type = 0;
	movq	$0, -24(%rbp)	 ;, current_type
 ; D:\TC\src\parser.c:866:             var_scope = 0;
	movq	$0, -40(%rbp)	 ;, var_scope
.L233:
 ; D:\TC\src\parser.c:869:         token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp250
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp250,
	call	peek_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp251, token
 ; D:\TC\src\parser.c:870:         token_ptr = token;
	movq	-8(%rbp), %rax	 ; token, tmp252
	movq	%rax, -16(%rbp)	 ; tmp252, token_ptr
.L218:
 ; D:\TC\src\parser.c:788:     while (token_ptr->type == SYMBOL) {
	movq	-16(%rbp), %rax	 ; token_ptr, tmp253
	movl	24(%rax), %eax	 ; token_ptr_46->type, _43
 ; D:\TC\src\parser.c:788:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, %eax	 ;, _43
	je	.L243	 ;,
	jmp	.L242	 ;
.L244:
 ; D:\TC\src\parser.c:868:             break;
	nop	
.L242:
 ; D:\TC\src\parser.c:872:     return base;
	movq	-48(%rbp), %rax	 ; base, _57
.L217:
 ; D:\TC\src\parser.c:873: }
	leave	
	ret	
	.ident	"GCC: (GNU) 13.2.0"
	.def	create_scope;	.scl	2;	.type	32;	.endef
	.def	create_name;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	create_code;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	search;	.scl	2;	.type	32;	.endef
	.def	create_function;	.scl	2;	.type	32;	.endef
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.def	create_method;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	create_class;	.scl	2;	.type	32;	.endef
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.DOT_SYMBOL, "dr"
	.globl	.refptr.DOT_SYMBOL
	.linkonce	discard
.refptr.DOT_SYMBOL:
	.quad	DOT_SYMBOL
	.section	.rdata$.refptr.R_BRACKET_SYMBOL, "dr"
	.globl	.refptr.R_BRACKET_SYMBOL
	.linkonce	discard
.refptr.R_BRACKET_SYMBOL:
	.quad	R_BRACKET_SYMBOL
	.section	.rdata$.refptr.L_BRACKET_SYMBOL, "dr"
	.globl	.refptr.L_BRACKET_SYMBOL
	.linkonce	discard
.refptr.L_BRACKET_SYMBOL:
	.quad	L_BRACKET_SYMBOL
	.section	.rdata$.refptr.SUB_SYMBOL, "dr"
	.globl	.refptr.SUB_SYMBOL
	.linkonce	discard
.refptr.SUB_SYMBOL:
	.quad	SUB_SYMBOL
	.section	.rdata$.refptr.NOT_SYMBOL, "dr"
	.globl	.refptr.NOT_SYMBOL
	.linkonce	discard
.refptr.NOT_SYMBOL:
	.quad	NOT_SYMBOL
	.section	.rdata$.refptr.FALSE_KEYWORD, "dr"
	.globl	.refptr.FALSE_KEYWORD
	.linkonce	discard
.refptr.FALSE_KEYWORD:
	.quad	FALSE_KEYWORD
	.section	.rdata$.refptr.TRUE_KEYWORD, "dr"
	.globl	.refptr.TRUE_KEYWORD
	.linkonce	discard
.refptr.TRUE_KEYWORD:
	.quad	TRUE_KEYWORD
	.section	.rdata$.refptr.ELSE_KEYWORD, "dr"
	.globl	.refptr.ELSE_KEYWORD
	.linkonce	discard
.refptr.ELSE_KEYWORD:
	.quad	ELSE_KEYWORD
	.section	.rdata$.refptr.ELIF_KEYWORD, "dr"
	.globl	.refptr.ELIF_KEYWORD
	.linkonce	discard
.refptr.ELIF_KEYWORD:
	.quad	ELIF_KEYWORD
	.section	.rdata$.refptr.CONTINUE_KEYWORD, "dr"
	.globl	.refptr.CONTINUE_KEYWORD
	.linkonce	discard
.refptr.CONTINUE_KEYWORD:
	.quad	CONTINUE_KEYWORD
	.section	.rdata$.refptr.BREAK_KEYWORD, "dr"
	.globl	.refptr.BREAK_KEYWORD
	.linkonce	discard
.refptr.BREAK_KEYWORD:
	.quad	BREAK_KEYWORD
	.section	.rdata$.refptr.RETURN_KEYWORD, "dr"
	.globl	.refptr.RETURN_KEYWORD
	.linkonce	discard
.refptr.RETURN_KEYWORD:
	.quad	RETURN_KEYWORD
	.section	.rdata$.refptr.WHILE_KEYWORD, "dr"
	.globl	.refptr.WHILE_KEYWORD
	.linkonce	discard
.refptr.WHILE_KEYWORD:
	.quad	WHILE_KEYWORD
	.section	.rdata$.refptr.FOR_KEYWORD, "dr"
	.globl	.refptr.FOR_KEYWORD
	.linkonce	discard
.refptr.FOR_KEYWORD:
	.quad	FOR_KEYWORD
	.section	.rdata$.refptr.IF_KEYWORD, "dr"
	.globl	.refptr.IF_KEYWORD
	.linkonce	discard
.refptr.IF_KEYWORD:
	.quad	IF_KEYWORD
	.section	.rdata$.refptr.ASSIGN_SYMBOL, "dr"
	.globl	.refptr.ASSIGN_SYMBOL
	.linkonce	discard
.refptr.ASSIGN_SYMBOL:
	.quad	ASSIGN_SYMBOL
	.section	.rdata$.refptr.VAR_KEYWORD, "dr"
	.globl	.refptr.VAR_KEYWORD
	.linkonce	discard
.refptr.VAR_KEYWORD:
	.quad	VAR_KEYWORD
	.section	.rdata$.refptr.METHOD_KEYWORD, "dr"
	.globl	.refptr.METHOD_KEYWORD
	.linkonce	discard
.refptr.METHOD_KEYWORD:
	.quad	METHOD_KEYWORD
	.section	.rdata$.refptr.SELF_KEYWORD, "dr"
	.globl	.refptr.SELF_KEYWORD
	.linkonce	discard
.refptr.SELF_KEYWORD:
	.quad	SELF_KEYWORD
	.section	.rdata$.refptr.R_BRACE_SYMBOL, "dr"
	.globl	.refptr.R_BRACE_SYMBOL
	.linkonce	discard
.refptr.R_BRACE_SYMBOL:
	.quad	R_BRACE_SYMBOL
	.section	.rdata$.refptr.L_BRACE_SYMBOL, "dr"
	.globl	.refptr.L_BRACE_SYMBOL
	.linkonce	discard
.refptr.L_BRACE_SYMBOL:
	.quad	L_BRACE_SYMBOL
	.section	.rdata$.refptr.R_PAREN_SYMBOL, "dr"
	.globl	.refptr.R_PAREN_SYMBOL
	.linkonce	discard
.refptr.R_PAREN_SYMBOL:
	.quad	R_PAREN_SYMBOL
	.section	.rdata$.refptr.COMMA_SYMBOL, "dr"
	.globl	.refptr.COMMA_SYMBOL
	.linkonce	discard
.refptr.COMMA_SYMBOL:
	.quad	COMMA_SYMBOL
	.section	.rdata$.refptr.L_PAREN_SYMBOL, "dr"
	.globl	.refptr.L_PAREN_SYMBOL
	.linkonce	discard
.refptr.L_PAREN_SYMBOL:
	.quad	L_PAREN_SYMBOL
	.section	.rdata$.refptr.SEMICOLON_SYMBOL, "dr"
	.globl	.refptr.SEMICOLON_SYMBOL
	.linkonce	discard
.refptr.SEMICOLON_SYMBOL:
	.quad	SEMICOLON_SYMBOL
	.section	.rdata$.refptr.FROM_KEYWORD, "dr"
	.globl	.refptr.FROM_KEYWORD
	.linkonce	discard
.refptr.FROM_KEYWORD:
	.quad	FROM_KEYWORD
	.section	.rdata$.refptr.CLASS_KEYWORD, "dr"
	.globl	.refptr.CLASS_KEYWORD
	.linkonce	discard
.refptr.CLASS_KEYWORD:
	.quad	CLASS_KEYWORD
	.section	.rdata$.refptr.FUNC_KEYWORD, "dr"
	.globl	.refptr.FUNC_KEYWORD
	.linkonce	discard
.refptr.FUNC_KEYWORD:
	.quad	FUNC_KEYWORD
	.section	.rdata$.refptr.IMPORT_KEYWORD, "dr"
	.globl	.refptr.IMPORT_KEYWORD
	.linkonce	discard
.refptr.IMPORT_KEYWORD:
	.quad	IMPORT_KEYWORD
	.section	.rdata$.refptr.name_bool, "dr"
	.globl	.refptr.name_bool
	.linkonce	discard
.refptr.name_bool:
	.quad	name_bool
	.section	.rdata$.refptr.BOOL_KEYWORD, "dr"
	.globl	.refptr.BOOL_KEYWORD
	.linkonce	discard
.refptr.BOOL_KEYWORD:
	.quad	BOOL_KEYWORD
	.section	.rdata$.refptr.name_string, "dr"
	.globl	.refptr.name_string
	.linkonce	discard
.refptr.name_string:
	.quad	name_string
	.section	.rdata$.refptr.STRING_KEYWORD, "dr"
	.globl	.refptr.STRING_KEYWORD
	.linkonce	discard
.refptr.STRING_KEYWORD:
	.quad	STRING_KEYWORD
	.section	.rdata$.refptr.name_float, "dr"
	.globl	.refptr.name_float
	.linkonce	discard
.refptr.name_float:
	.quad	name_float
	.section	.rdata$.refptr.FLOAT_KEYWORD, "dr"
	.globl	.refptr.FLOAT_KEYWORD
	.linkonce	discard
.refptr.FLOAT_KEYWORD:
	.quad	FLOAT_KEYWORD
	.section	.rdata$.refptr.name_int, "dr"
	.globl	.refptr.name_int
	.linkonce	discard
.refptr.name_int:
	.quad	name_int
	.section	.rdata$.refptr.INT_KEYWORD, "dr"
	.globl	.refptr.INT_KEYWORD
	.linkonce	discard
.refptr.INT_KEYWORD:
	.quad	INT_KEYWORD
	.section	.rdata$.refptr.name_void, "dr"
	.globl	.refptr.name_void
	.linkonce	discard
.refptr.name_void:
	.quad	name_void
	.section	.rdata$.refptr.VOID_KEYWORD, "dr"
	.globl	.refptr.VOID_KEYWORD
	.linkonce	discard
.refptr.VOID_KEYWORD:
	.quad	VOID_KEYWORD
	.section	.rdata$.refptr.builtin_scope, "dr"
	.globl	.refptr.builtin_scope
	.linkonce	discard
.refptr.builtin_scope:
	.quad	builtin_scope
