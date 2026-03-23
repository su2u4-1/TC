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
	subq	$80, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:21:     if (builtin_scope == NULL) {
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp125
	movq	(%rax), %rax	 ; builtin_scope, builtin_scope.0_1
 ; D:\TC\src\parser.c:21:     if (builtin_scope == NULL) {
	testq	%rax, %rax	 ; builtin_scope.0_1
	jne	.L2	 ;,
 ; D:\TC\src\parser.c:22:         builtin_scope = create_symbol_table(NULL);
	movl	$0, %ecx	 ;,
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:22:         builtin_scope = create_symbol_table(NULL);
	movq	.refptr.builtin_scope(%rip), %rdx	 ;, tmp126
	movq	%rax, (%rdx)	 ; _2, builtin_scope
 ; D:\TC\src\parser.c:23:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp127
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope.1_3
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp128
	movq	(%rax), %rax	 ; VOID_KEYWORD, VOID_KEYWORD.2_4
	movq	%rdx, %r9	 ; builtin_scope.1_3,
	movl	$0, %r8d	 ;,
	movl	$5, %edx	 ;,
	movq	%rax, %rcx	 ; VOID_KEYWORD.2_4,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:23:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp129
	movq	%rax, (%rdx)	 ; _5, name_void
 ; D:\TC\src\parser.c:24:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp130
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope.3_6
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp131
	movq	(%rax), %rax	 ; INT_KEYWORD, INT_KEYWORD.4_7
	movq	%rdx, %r9	 ; builtin_scope.3_6,
	movl	$0, %r8d	 ;,
	movl	$5, %edx	 ;,
	movq	%rax, %rcx	 ; INT_KEYWORD.4_7,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:24:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp132
	movq	%rax, (%rdx)	 ; _8, name_int
 ; D:\TC\src\parser.c:25:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp133
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope.5_9
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp134
	movq	(%rax), %rax	 ; FLOAT_KEYWORD, FLOAT_KEYWORD.6_10
	movq	%rdx, %r9	 ; builtin_scope.5_9,
	movl	$0, %r8d	 ;,
	movl	$5, %edx	 ;,
	movq	%rax, %rcx	 ; FLOAT_KEYWORD.6_10,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:25:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp135
	movq	%rax, (%rdx)	 ; _11, name_float
 ; D:\TC\src\parser.c:26:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp136
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope.7_12
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp137
	movq	(%rax), %rax	 ; STRING_KEYWORD, STRING_KEYWORD.8_13
	movq	%rdx, %r9	 ; builtin_scope.7_12,
	movl	$0, %r8d	 ;,
	movl	$5, %edx	 ;,
	movq	%rax, %rcx	 ; STRING_KEYWORD.8_13,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:26:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp138
	movq	%rax, (%rdx)	 ; _14, name_string
 ; D:\TC\src\parser.c:27:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp139
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope.9_15
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp140
	movq	(%rax), %rax	 ; BOOL_KEYWORD, BOOL_KEYWORD.10_16
	movq	%rdx, %r9	 ; builtin_scope.9_15,
	movl	$0, %r8d	 ;,
	movl	$5, %edx	 ;,
	movq	%rax, %rcx	 ; BOOL_KEYWORD.10_16,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:27:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp141
	movq	%rax, (%rdx)	 ; _17, name_bool
.L2:
 ; D:\TC\src\parser.c:29:     if (now_scope == NULL)
	cmpq	$0, 24(%rbp)	 ;, now_scope
	jne	.L3	 ;,
 ; D:\TC\src\parser.c:30:         now_scope = builtin_scope;
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp142
	movq	(%rax), %rax	 ; builtin_scope, tmp143
	movq	%rax, 24(%rbp)	 ; tmp143, now_scope
.L3:
 ; D:\TC\src\parser.c:31:     Token* token = NULL;
	movq	$0, -8(%rbp)	 ;, token
 ; D:\TC\src\parser.c:32:     list(CodeMember*) members = create_list();
	call	create_list	 ;
	movq	%rax, -16(%rbp)	 ; tmp144, members
 ; D:\TC\src\parser.c:33:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	24(%rbp), %rax	 ; now_scope, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	create_symbol_table	 ;
	movq	%rax, -24(%rbp)	 ; tmp146, global_scope
 ; D:\TC\src\parser.c:34:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp147
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp147,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp148, token
 ; D:\TC\src\parser.c:35:     while (token != NULL && token->type != EOF_TOKEN) {
	jmp	.L4	 ;
.L13:
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movq	-8(%rbp), %rax	 ; token, tmp149
	movl	24(%rax), %eax	 ; token_43->type, _18
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	 ;, _18
	jne	.L5	 ;,
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax	 ;, tmp150
	movq	(%rax), %rdx	 ; IMPORT_KEYWORD, IMPORT_KEYWORD.11_19
	movq	-8(%rbp), %rax	 ; token, tmp151
	movq	(%rax), %rax	 ; token_43->lexeme, _20
	movq	%rax, %rcx	 ; _20,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	testb	%al, %al	 ; _21
	je	.L5	 ;,
 ; D:\TC\src\parser.c:37:             Import* import = parse_import(lexer, global_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp152
	movq	-24(%rbp), %rdx	 ; global_scope, tmp153
	movq	16(%rbp), %rax	 ; lexer, tmp154
	movq	%rcx, %r8	 ; tmp152,
	movq	%rax, %rcx	 ; tmp154,
	call	parse_import	 ;
	movq	%rax, -32(%rbp)	 ; tmp155, import
 ; D:\TC\src\parser.c:38:             if (import == NULL)
	cmpq	$0, -32(%rbp)	 ;, import
	jne	.L6	 ;,
 ; D:\TC\src\parser.c:39:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp156
	movq	(%rax), %rax	 ; parser_77(D)->source_file, _22
	movq	%rax, %rcx	 ; _22,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _23
 ; D:\TC\src\parser.c:39:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp157
	movq	%rdx, %r8	 ; _23,
	movq	%rax, %rdx	 ; tmp157,
	leaq	.LC0(%rip), %rax	 ;, tmp158
	movq	%rax, %rcx	 ; tmp158,
	call	parser_error	 ;
.L6:
 ; D:\TC\src\parser.c:40:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	-32(%rbp), %rax	 ; import, tmp159
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp159,
	movl	$0, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ;, _24
 ; D:\TC\src\parser.c:40:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	-16(%rbp), %rax	 ; members, tmp160
	movq	%rax, %rcx	 ; tmp160,
	call	list_append	 ;
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	jmp	.L7	 ;
.L5:
 ; D:\TC\src\parser.c:41:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	-8(%rbp), %rax	 ; token, tmp161
	movl	24(%rax), %eax	 ; token_43->type, _25
 ; D:\TC\src\parser.c:41:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	cmpl	$6, %eax	 ;, _25
	jne	.L8	 ;,
 ; D:\TC\src\parser.c:41:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	.refptr.FUNC_KEYWORD(%rip), %rax	 ;, tmp162
	movq	(%rax), %rdx	 ; FUNC_KEYWORD, FUNC_KEYWORD.12_26
	movq	-8(%rbp), %rax	 ; token, tmp163
	movq	(%rax), %rax	 ; token_43->lexeme, _27
	movq	%rax, %rcx	 ; _27,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:41:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	testb	%al, %al	 ; _28
	je	.L8	 ;,
 ; D:\TC\src\parser.c:42:             Function* function = parse_function(lexer, global_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp164
	movq	-24(%rbp), %rdx	 ; global_scope, tmp165
	movq	16(%rbp), %rax	 ; lexer, tmp166
	movq	%rcx, %r8	 ; tmp164,
	movq	%rax, %rcx	 ; tmp166,
	call	parse_function	 ;
	movq	%rax, -40(%rbp)	 ; tmp167, function
 ; D:\TC\src\parser.c:43:             if (function == NULL)
	cmpq	$0, -40(%rbp)	 ;, function
	jne	.L9	 ;,
 ; D:\TC\src\parser.c:44:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp168
	movq	(%rax), %rax	 ; parser_77(D)->source_file, _29
	movq	%rax, %rcx	 ; _29,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _30
 ; D:\TC\src\parser.c:44:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp169
	movq	%rdx, %r8	 ; _30,
	movq	%rax, %rdx	 ; tmp169,
	leaq	.LC1(%rip), %rax	 ;, tmp170
	movq	%rax, %rcx	 ; tmp170,
	call	parser_error	 ;
.L9:
 ; D:\TC\src\parser.c:45:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	-40(%rbp), %rax	 ; function, tmp171
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; tmp171,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ;, _31
 ; D:\TC\src\parser.c:45:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	-16(%rbp), %rax	 ; members, tmp172
	movq	%rax, %rcx	 ; tmp172,
	call	list_append	 ;
 ; D:\TC\src\parser.c:41:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	jmp	.L7	 ;
.L8:
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	-8(%rbp), %rax	 ; token, tmp173
	movl	24(%rax), %eax	 ; token_43->type, _32
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	cmpl	$6, %eax	 ;, _32
	jne	.L10	 ;,
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	.refptr.CLASS_KEYWORD(%rip), %rax	 ;, tmp174
	movq	(%rax), %rdx	 ; CLASS_KEYWORD, CLASS_KEYWORD.13_33
	movq	-8(%rbp), %rax	 ; token, tmp175
	movq	(%rax), %rax	 ; token_43->lexeme, _34
	movq	%rax, %rcx	 ; _34,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	testb	%al, %al	 ; _35
	je	.L10	 ;,
 ; D:\TC\src\parser.c:47:             Class* class_ = parse_class(lexer, global_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp176
	movq	-24(%rbp), %rdx	 ; global_scope, tmp177
	movq	16(%rbp), %rax	 ; lexer, tmp178
	movq	%rcx, %r8	 ; tmp176,
	movq	%rax, %rcx	 ; tmp178,
	call	parse_class	 ;
	movq	%rax, -48(%rbp)	 ; tmp179, class_
 ; D:\TC\src\parser.c:48:             if (class_ == NULL)
	cmpq	$0, -48(%rbp)	 ;, class_
	jne	.L11	 ;,
 ; D:\TC\src\parser.c:49:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp180
	movq	(%rax), %rax	 ; parser_77(D)->source_file, _36
	movq	%rax, %rcx	 ; _36,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _37
 ; D:\TC\src\parser.c:49:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp181
	movq	%rdx, %r8	 ; _37,
	movq	%rax, %rdx	 ; tmp181,
	leaq	.LC2(%rip), %rax	 ;, tmp182
	movq	%rax, %rcx	 ; tmp182,
	call	parser_error	 ;
.L11:
 ; D:\TC\src\parser.c:50:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	-48(%rbp), %rax	 ; class_, tmp183
	movq	%rax, %r9	 ; tmp183,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$2, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ;, _38
 ; D:\TC\src\parser.c:50:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	-16(%rbp), %rax	 ; members, tmp184
	movq	%rax, %rcx	 ; tmp184,
	call	list_append	 ;
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	jmp	.L7	 ;
.L10:
 ; D:\TC\src\parser.c:52:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp185
	movq	(%rax), %rax	 ; parser_77(D)->source_file, _39
	movq	%rax, %rcx	 ; _39,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _40
 ; D:\TC\src\parser.c:52:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp186
	movq	%rdx, %r8	 ; _40,
	movq	%rax, %rdx	 ; tmp186,
	leaq	.LC3(%rip), %rax	 ;, tmp187
	movq	%rax, %rcx	 ; tmp187,
	call	parser_error	 ;
.L7:
 ; D:\TC\src\parser.c:53:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp188
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp188,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp189, token
.L4:
 ; D:\TC\src\parser.c:35:     while (token != NULL && token->type != EOF_TOKEN) {
	cmpq	$0, -8(%rbp)	 ;, token
	je	.L12	 ;,
 ; D:\TC\src\parser.c:35:     while (token != NULL && token->type != EOF_TOKEN) {
	movq	-8(%rbp), %rax	 ; token, tmp190
	movl	24(%rax), %eax	 ; token_43->type, _41
 ; D:\TC\src\parser.c:35:     while (token != NULL && token->type != EOF_TOKEN) {
	testl	%eax, %eax	 ; _41
	jne	.L13	 ;,
.L12:
 ; D:\TC\src\parser.c:55:     return create_code(members, global_scope);
	movq	-24(%rbp), %rdx	 ; global_scope, tmp191
	movq	-16(%rbp), %rax	 ; members, tmp192
	movq	%rax, %rcx	 ; tmp192,
	call	create_code	 ;
 ; D:\TC\src\parser.c:56: }
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
	.align 8
.LC7:
	.ascii "Failed to import module '%s' from source '%s'\12\0"
	.text
	.def	parse_import;	.scl	3;	.type	32;	.endef
parse_import:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$64, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:58:     Token* token = NULL;
	movq	$0, -8(%rbp)	 ;, token
 ; D:\TC\src\parser.c:59:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp104
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp104,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp105, token
 ; D:\TC\src\parser.c:60:     if (token->type != IDENTIFIER) {
	movq	-8(%rbp), %rax	 ; token, tmp106
	movl	24(%rax), %eax	 ; token_33->type, _1
 ; D:\TC\src\parser.c:60:     if (token->type != IDENTIFIER) {
	cmpl	$1, %eax	 ;, _1
	je	.L16	 ;,
 ; D:\TC\src\parser.c:61:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp107
	movq	(%rax), %rax	 ; parser_44(D)->source_file, _2
	movq	%rax, %rcx	 ; _2,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _3
 ; D:\TC\src\parser.c:61:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp108
	movq	%rdx, %r8	 ; _3,
	movq	%rax, %rdx	 ; tmp108,
	leaq	.LC4(%rip), %rax	 ;, tmp109
	movq	%rax, %rcx	 ; tmp109,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:62:         return NULL;
	movl	$0, %eax	 ;, _24
	jmp	.L17	 ;
.L16:
 ; D:\TC\src\parser.c:64:     string import_name = token->lexeme;
	movq	-8(%rbp), %rax	 ; token, tmp110
	movq	(%rax), %rax	 ; token_33->lexeme, tmp111
	movq	%rax, -32(%rbp)	 ; tmp111, import_name
 ; D:\TC\src\parser.c:65:     string source = NULL;
	movq	$0, -16(%rbp)	 ;, source
 ; D:\TC\src\parser.c:66:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp112
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp112,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp113, token
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	-8(%rbp), %rax	 ; token, tmp114
	movl	24(%rax), %eax	 ; token_37->type, _4
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	cmpl	$6, %eax	 ;, _4
	jne	.L18	 ;,
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	.refptr.FROM_KEYWORD(%rip), %rax	 ;, tmp115
	movq	(%rax), %rdx	 ; FROM_KEYWORD, FROM_KEYWORD.14_5
	movq	-8(%rbp), %rax	 ; token, tmp116
	movq	(%rax), %rax	 ; token_37->lexeme, _6
	movq	%rax, %rcx	 ; _6,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	testb	%al, %al	 ; _7
	je	.L18	 ;,
 ; D:\TC\src\parser.c:68:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp117
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp117,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp118, token
 ; D:\TC\src\parser.c:69:         if (token->type != STRING) {
	movq	-8(%rbp), %rax	 ; token, tmp119
	movl	24(%rax), %eax	 ; token_40->type, _8
 ; D:\TC\src\parser.c:69:         if (token->type != STRING) {
	cmpl	$4, %eax	 ;, _8
	je	.L19	 ;,
 ; D:\TC\src\parser.c:70:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp120
	movq	(%rax), %rax	 ; parser_44(D)->source_file, _9
	movq	%rax, %rcx	 ; _9,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _10
 ; D:\TC\src\parser.c:70:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp121
	movq	%rdx, %r8	 ; _10,
	movq	%rax, %rdx	 ; tmp121,
	leaq	.LC5(%rip), %rax	 ;, tmp122
	movq	%rax, %rcx	 ; tmp122,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:71:             return NULL;
	movl	$0, %eax	 ;, _24
	jmp	.L17	 ;
.L19:
 ; D:\TC\src\parser.c:73:         source = token->lexeme;
	movq	-8(%rbp), %rax	 ; token, tmp123
	movq	(%rax), %rax	 ; token_40->lexeme, tmp124
	movq	%rax, -16(%rbp)	 ; tmp124, source
 ; D:\TC\src\parser.c:74:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp125
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp125,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp126, token
.L18:
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp127
	movl	24(%rax), %eax	 ; token_21->type, _11
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	 ;, _11
	jne	.L20	 ;,
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp128
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.15_12
	movq	-8(%rbp), %rax	 ; token, tmp129
	movq	(%rax), %rax	 ; token_21->lexeme, _13
	movq	%rax, %rcx	 ; _13,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; _14
	jne	.L21	 ;,
.L20:
 ; D:\TC\src\parser.c:77:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp130
	movq	(%rax), %rax	 ; parser_44(D)->source_file, _15
	movq	%rax, %rcx	 ; _15,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _16
 ; D:\TC\src\parser.c:77:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp131
	movq	%rdx, %r8	 ; _16,
	movq	%rax, %rdx	 ; tmp131,
	leaq	.LC6(%rip), %rax	 ;, tmp132
	movq	%rax, %rcx	 ; tmp132,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:78:         return NULL;
	movl	$0, %eax	 ;, _24
	jmp	.L17	 ;
.L21:
 ; D:\TC\src\parser.c:81:     name = parse_import_file(import_name, source, now_scope, parser->source_file);
	movq	32(%rbp), %rax	 ; parser, tmp133
	movq	(%rax), %r8	 ; parser_44(D)->source_file, _17
	movq	24(%rbp), %rcx	 ; now_scope, tmp134
	movq	-16(%rbp), %rdx	 ; source, tmp135
	movq	-32(%rbp), %rax	 ; import_name, tmp136
	movq	%r8, %r9	 ; _17,
	movq	%rcx, %r8	 ; tmp134,
	movq	%rax, %rcx	 ; tmp136,
	call	parse_import_file	 ;
	movq	%rax, -24(%rbp)	 ; tmp137, name
 ; D:\TC\src\parser.c:82:     if (name == NULL) {
	cmpq	$0, -24(%rbp)	 ;, name
	jne	.L22	 ;,
 ; D:\TC\src\parser.c:83:         fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
	call	__getreent	 ;
 ; D:\TC\src\parser.c:83:         fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
	movq	24(%rax), %rax	 ; _18->_stderr, _19
 ; D:\TC\src\parser.c:83:         fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
	movq	-16(%rbp), %rcx	 ; source, tmp138
	movq	-32(%rbp), %rdx	 ; import_name, tmp139
	movq	%rcx, %r9	 ; tmp138,
	movq	%rdx, %r8	 ; tmp139,
	leaq	.LC7(%rip), %rdx	 ;, tmp140
	movq	%rax, %rcx	 ; _19,
	call	fprintf	 ;
 ; D:\TC\src\parser.c:84:         name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
	movq	.refptr.name_void(%rip), %rax	 ;, tmp141
	movq	(%rax), %rdx	 ; name_void, name_void.16_20
	movq	24(%rbp), %rcx	 ; now_scope, tmp142
	movq	-32(%rbp), %rax	 ; import_name, tmp143
	movq	%rcx, %r9	 ; tmp142,
	movq	%rdx, %r8	 ; name_void.16_20,
	movl	$2, %edx	 ;,
	movq	%rax, %rcx	 ; tmp143,
	call	create_symbol	 ;
	movq	%rax, -24(%rbp)	 ; tmp144, name
.L22:
 ; D:\TC\src\parser.c:86:     return create_import(name, source);
	movq	-16(%rbp), %rdx	 ; source, tmp145
	movq	-24(%rbp), %rax	 ; name, tmp146
	movq	%rax, %rcx	 ; tmp146,
	call	create_import	 ;
.L17:
 ; D:\TC\src\parser.c:87: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "Expected function return type after 'func'\0"
.LC9:
	.ascii "Unknown function return type\0"
	.align 8
.LC10:
	.ascii "Expected function name after return type\0"
	.align 8
.LC11:
	.ascii "Expected '(' after function name\0"
	.align 8
.LC12:
	.ascii "Failed to parse function parameter\0"
	.align 8
.LC13:
	.ascii "Function parameters cannot have default values\0"
	.align 8
.LC14:
	.ascii "Expected ',' or ')' after function parameter\0"
	.align 8
.LC15:
	.ascii "Expected '{' to start function body\0"
	.align 8
.LC16:
	.ascii "Failed to parse function body statement\0"
	.align 8
.LC17:
	.ascii "Unreachable code after return statement\0"
	.align 8
.LC18:
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
 ; D:\TC\src\parser.c:89:     Token* token = NULL;
	movq	$0, -8(%rbp)	 ;, token
 ; D:\TC\src\parser.c:90:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	24(%rbp), %rax	 ; now_scope, tmp140
	movq	%rax, %rcx	 ; tmp140,
	call	create_symbol_table	 ;
	movq	%rax, -24(%rbp)	 ; tmp141, function_scope
 ; D:\TC\src\parser.c:91:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp142
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp142,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp143, token
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-8(%rbp), %rax	 ; token, tmp144
	movl	24(%rax), %eax	 ; token_83->type, _1
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _1
	je	.L24	 ;,
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-8(%rbp), %rax	 ; token, tmp145
	movl	24(%rax), %eax	 ; token_83->type, _2
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _2
	jne	.L25	 ;,
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-8(%rbp), %rax	 ; token, tmp146
	movq	(%rax), %rax	 ; token_83->lexeme, _3
	movq	%rax, %rcx	 ; _3,
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; _4
	jne	.L24	 ;,
.L25:
 ; D:\TC\src\parser.c:93:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp147
	movq	(%rax), %rax	 ; parser_85(D)->source_file, _5
	movq	%rax, %rcx	 ; _5,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _6
 ; D:\TC\src\parser.c:93:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp148
	movq	%rdx, %r8	 ; _6,
	movq	%rax, %rdx	 ; tmp148,
	leaq	.LC8(%rip), %rax	 ;, tmp149
	movq	%rax, %rcx	 ; tmp149,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:94:         return NULL;
	movl	$0, %eax	 ;, _61
	jmp	.L26	 ;
.L24:
 ; D:\TC\src\parser.c:96:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	-8(%rbp), %rax	 ; token, tmp150
	movq	(%rax), %rdx	 ; token_83->lexeme, _7
	movq	24(%rbp), %rax	 ; now_scope, tmp151
	movq	%rax, %rcx	 ; tmp151,
	call	search_name	 ;
	movq	%rax, -32(%rbp)	 ; tmp152, return_type
 ; D:\TC\src\parser.c:97:     if (return_type == NULL) {
	cmpq	$0, -32(%rbp)	 ;, return_type
	jne	.L27	 ;,
 ; D:\TC\src\parser.c:98:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp153
	movq	(%rax), %rax	 ; parser_85(D)->source_file, _8
	movq	%rax, %rcx	 ; _8,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _9
 ; D:\TC\src\parser.c:98:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp154
	movq	%rdx, %r8	 ; _9,
	movq	%rax, %rdx	 ; tmp154,
	leaq	.LC9(%rip), %rax	 ;, tmp155
	movq	%rax, %rcx	 ; tmp155,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:99:         return NULL;
	movl	$0, %eax	 ;, _61
	jmp	.L26	 ;
.L27:
 ; D:\TC\src\parser.c:101:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp156
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp156,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp157, token
 ; D:\TC\src\parser.c:102:     if (token->type != IDENTIFIER) {
	movq	-8(%rbp), %rax	 ; token, tmp158
	movl	24(%rax), %eax	 ; token_92->type, _10
 ; D:\TC\src\parser.c:102:     if (token->type != IDENTIFIER) {
	cmpl	$1, %eax	 ;, _10
	je	.L28	 ;,
 ; D:\TC\src\parser.c:103:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp159
	movq	(%rax), %rax	 ; parser_85(D)->source_file, _11
	movq	%rax, %rcx	 ; _11,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _12
 ; D:\TC\src\parser.c:103:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp160
	movq	%rdx, %r8	 ; _12,
	movq	%rax, %rdx	 ; tmp160,
	leaq	.LC10(%rip), %rax	 ;, tmp161
	movq	%rax, %rcx	 ; tmp161,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:104:         return NULL;
	movl	$0, %eax	 ;, _61
	jmp	.L26	 ;
.L28:
 ; D:\TC\src\parser.c:106:     Symbol* name = create_symbol(token->lexeme, SYMBOL_SUBROUTINE, return_type, function_scope);
	movq	-8(%rbp), %rax	 ; token, tmp162
	movq	(%rax), %rax	 ; token_92->lexeme, _13
	movq	-24(%rbp), %rcx	 ; function_scope, tmp163
	movq	-32(%rbp), %rdx	 ; return_type, tmp164
	movq	%rcx, %r9	 ; tmp163,
	movq	%rdx, %r8	 ; tmp164,
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; _13,
	call	create_symbol	 ;
	movq	%rax, -40(%rbp)	 ; tmp165, name
 ; D:\TC\src\parser.c:107:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp166
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp166,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp167, token
 ; D:\TC\src\parser.c:108:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp168
	movl	24(%rax), %eax	 ; token_96->type, _14
 ; D:\TC\src\parser.c:108:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _14
	jne	.L29	 ;,
 ; D:\TC\src\parser.c:108:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp169
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.17_15
	movq	-8(%rbp), %rax	 ; token, tmp170
	movq	(%rax), %rax	 ; token_96->lexeme, _16
	movq	%rax, %rcx	 ; _16,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:108:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _17
	jne	.L30	 ;,
.L29:
 ; D:\TC\src\parser.c:109:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp171
	movq	(%rax), %rax	 ; parser_85(D)->source_file, _18
	movq	%rax, %rcx	 ; _18,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _19
 ; D:\TC\src\parser.c:109:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp172
	movq	%rdx, %r8	 ; _19,
	movq	%rax, %rdx	 ; tmp172,
	leaq	.LC11(%rip), %rax	 ;, tmp173
	movq	%rax, %rcx	 ; tmp173,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:110:         return NULL;
	movl	$0, %eax	 ;, _61
	jmp	.L26	 ;
.L30:
 ; D:\TC\src\parser.c:112:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp174
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp174,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp175, token
 ; D:\TC\src\parser.c:113:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rax, -48(%rbp)	 ; tmp176, parameters
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L31	 ;
.L38:
 ; D:\TC\src\parser.c:115:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp177
	movq	-24(%rbp), %rdx	 ; function_scope, tmp178
	movq	16(%rbp), %rax	 ; lexer, tmp179
	movq	%rcx, %r8	 ; tmp177,
	movq	%rax, %rcx	 ; tmp179,
	call	parse_variable	 ;
	movq	%rax, -72(%rbp)	 ; tmp180, parameter
 ; D:\TC\src\parser.c:116:         if (parameter == NULL)
	cmpq	$0, -72(%rbp)	 ;, parameter
	jne	.L32	 ;,
 ; D:\TC\src\parser.c:117:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp181
	movq	(%rax), %rax	 ; parser_85(D)->source_file, _20
	movq	%rax, %rcx	 ; _20,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _21
 ; D:\TC\src\parser.c:117:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp182
	movq	%rdx, %r8	 ; _21,
	movq	%rax, %rdx	 ; tmp182,
	leaq	.LC12(%rip), %rax	 ;, tmp183
	movq	%rax, %rcx	 ; tmp183,
	call	parser_error	 ;
	jmp	.L33	 ;
.L32:
 ; D:\TC\src\parser.c:118:         else if (parameter->value != NULL)
	movq	-72(%rbp), %rax	 ; parameter, tmp184
	movq	16(%rax), %rax	 ; parameter_132->value, _22
 ; D:\TC\src\parser.c:118:         else if (parameter->value != NULL)
	testq	%rax, %rax	 ; _22
	je	.L34	 ;,
 ; D:\TC\src\parser.c:119:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp185
	movq	(%rax), %rax	 ; parser_85(D)->source_file, _23
	movq	%rax, %rcx	 ; _23,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _24
 ; D:\TC\src\parser.c:119:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp186
	movq	%rdx, %r8	 ; _24,
	movq	%rax, %rdx	 ; tmp186,
	leaq	.LC13(%rip), %rax	 ;, tmp187
	movq	%rax, %rcx	 ; tmp187,
	call	parser_error	 ;
	jmp	.L33	 ;
.L34:
 ; D:\TC\src\parser.c:121:             list_append(parameters, (pointer)parameter);
	movq	-72(%rbp), %rdx	 ; parameter, tmp188
	movq	-48(%rbp), %rax	 ; parameters, tmp189
	movq	%rax, %rcx	 ; tmp189,
	call	list_append	 ;
.L33:
 ; D:\TC\src\parser.c:122:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp190
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp190,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp191, token
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp192
	movl	24(%rax), %eax	 ; token_139->type, _25
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, %eax	 ;, _25
	jne	.L35	 ;,
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp193
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL.18_26
	movq	-8(%rbp), %rax	 ; token, tmp194
	movq	(%rax), %rax	 ; token_139->lexeme, _27
	movq	%rax, %rcx	 ; _27,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; _28
	je	.L35	 ;,
 ; D:\TC\src\parser.c:124:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp195
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp195,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp196, token
 ; D:\TC\src\parser.c:124:             token = get_next_token(lexer, true);
	jmp	.L31	 ;
.L35:
 ; D:\TC\src\parser.c:125:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp197
	movl	24(%rax), %eax	 ; token_139->type, _29
 ; D:\TC\src\parser.c:125:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _29
	jne	.L37	 ;,
 ; D:\TC\src\parser.c:125:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp198
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.19_30
	movq	-8(%rbp), %rax	 ; token, tmp199
	movq	(%rax), %rax	 ; token_139->lexeme, _31
	movq	%rax, %rcx	 ; _31,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:125:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _32
	jne	.L31	 ;,
.L37:
 ; D:\TC\src\parser.c:126:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp200
	movq	(%rax), %rax	 ; parser_85(D)->source_file, _33
	movq	%rax, %rcx	 ; _33,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _34
 ; D:\TC\src\parser.c:126:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp201
	movq	%rdx, %r8	 ; _34,
	movq	%rax, %rdx	 ; tmp201,
	leaq	.LC14(%rip), %rax	 ;, tmp202
	movq	%rax, %rcx	 ; tmp202,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:127:             return NULL;
	movl	$0, %eax	 ;, _61
	jmp	.L26	 ;
.L31:
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp203
	movl	24(%rax), %eax	 ; token_57->type, _35
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _35
	jne	.L38	 ;,
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp204
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.20_36
	movq	-8(%rbp), %rax	 ; token, tmp205
	movq	(%rax), %rax	 ; token_57->lexeme, _37
	movq	%rax, %rcx	 ; _37,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _38
	je	.L38	 ;,
 ; D:\TC\src\parser.c:130:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp206
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp206,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp207, token
 ; D:\TC\src\parser.c:131:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp208
	movl	24(%rax), %eax	 ; token_104->type, _39
 ; D:\TC\src\parser.c:131:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _39
	jne	.L39	 ;,
 ; D:\TC\src\parser.c:131:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp209
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.21_40
	movq	-8(%rbp), %rax	 ; token, tmp210
	movq	(%rax), %rax	 ; token_104->lexeme, _41
	movq	%rax, %rcx	 ; _41,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:131:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _42
	jne	.L40	 ;,
.L39:
 ; D:\TC\src\parser.c:132:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp211
	movq	(%rax), %rax	 ; parser_85(D)->source_file, _43
	movq	%rax, %rcx	 ; _43,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _44
 ; D:\TC\src\parser.c:132:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp212
	movq	%rdx, %r8	 ; _44,
	movq	%rax, %rdx	 ; tmp212,
	leaq	.LC15(%rip), %rax	 ;, tmp213
	movq	%rax, %rcx	 ; tmp213,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:133:         return NULL;
	movl	$0, %eax	 ;, _61
	jmp	.L26	 ;
.L40:
 ; D:\TC\src\parser.c:135:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, -56(%rbp)	 ; tmp214, body
 ; D:\TC\src\parser.c:136:     parser->in_function = true;
	movq	32(%rbp), %rax	 ; parser, tmp215
	movb	$1, 8(%rax)	 ;, parser_85(D)->in_function
 ; D:\TC\src\parser.c:137:     bool have_return = false;
	movb	$0, -9(%rbp)	 ;, have_return
 ; D:\TC\src\parser.c:138:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp216
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp216,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp217, token
 ; D:\TC\src\parser.c:139:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L41	 ;
.L45:
 ; D:\TC\src\parser.c:140:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp218
	movq	-24(%rbp), %rdx	 ; function_scope, tmp219
	movq	16(%rbp), %rax	 ; lexer, tmp220
	movq	%rcx, %r8	 ; tmp218,
	movq	%rax, %rcx	 ; tmp220,
	call	parse_statement	 ;
	movq	%rax, -64(%rbp)	 ; tmp221, statement
 ; D:\TC\src\parser.c:141:         if (statement == NULL)
	cmpq	$0, -64(%rbp)	 ;, statement
	jne	.L42	 ;,
 ; D:\TC\src\parser.c:142:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp222
	movq	(%rax), %rax	 ; parser_85(D)->source_file, _45
	movq	%rax, %rcx	 ; _45,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _46
 ; D:\TC\src\parser.c:142:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp223
	movq	%rdx, %r8	 ; _46,
	movq	%rax, %rdx	 ; tmp223,
	leaq	.LC16(%rip), %rax	 ;, tmp224
	movq	%rax, %rcx	 ; tmp224,
	call	parser_error	 ;
	jmp	.L43	 ;
.L42:
 ; D:\TC\src\parser.c:143:         else if (have_return)
	cmpb	$0, -9(%rbp)	 ;, have_return
	je	.L43	 ;,
 ; D:\TC\src\parser.c:144:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp225
	movq	(%rax), %rax	 ; parser_85(D)->source_file, _47
	movq	%rax, %rcx	 ; _47,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _48
 ; D:\TC\src\parser.c:144:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp226
	movq	%rdx, %r8	 ; _48,
	movq	%rax, %rdx	 ; tmp226,
	leaq	.LC17(%rip), %rax	 ;, tmp227
	movq	%rax, %rcx	 ; tmp227,
	call	parser_error	 ;
.L43:
 ; D:\TC\src\parser.c:145:         if (statement != NULL && statement->type == RETURN_STATEMENT)
	cmpq	$0, -64(%rbp)	 ;, statement
	je	.L44	 ;,
 ; D:\TC\src\parser.c:145:         if (statement != NULL && statement->type == RETURN_STATEMENT)
	movq	-64(%rbp), %rax	 ; statement, tmp228
	movl	8(%rax), %eax	 ; statement_119->type, _49
 ; D:\TC\src\parser.c:145:         if (statement != NULL && statement->type == RETURN_STATEMENT)
	cmpl	$5, %eax	 ;, _49
	jne	.L44	 ;,
 ; D:\TC\src\parser.c:146:             have_return = true;
	movb	$1, -9(%rbp)	 ;, have_return
.L44:
 ; D:\TC\src\parser.c:147:         list_append(body, (pointer)statement);
	movq	-64(%rbp), %rdx	 ; statement, tmp229
	movq	-56(%rbp), %rax	 ; body, tmp230
	movq	%rax, %rcx	 ; tmp230,
	call	list_append	 ;
 ; D:\TC\src\parser.c:148:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp231
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp231,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp232, token
.L41:
 ; D:\TC\src\parser.c:139:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp233
	movl	24(%rax), %eax	 ; token_58->type, _50
 ; D:\TC\src\parser.c:139:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _50
	jne	.L45	 ;,
 ; D:\TC\src\parser.c:139:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp234
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.22_51
	movq	-8(%rbp), %rax	 ; token, tmp235
	movq	(%rax), %rax	 ; token_58->lexeme, _52
	movq	%rax, %rcx	 ; _52,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:139:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _53
	je	.L45	 ;,
 ; D:\TC\src\parser.c:150:     parser->in_function = false;
	movq	32(%rbp), %rax	 ; parser, tmp236
	movb	$0, 8(%rax)	 ;, parser_85(D)->in_function
 ; D:\TC\src\parser.c:151:     if (!have_return && return_type != name_void)
	cmpb	$0, -9(%rbp)	 ;, have_return
	jne	.L46	 ;,
 ; D:\TC\src\parser.c:151:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp237
	movq	(%rax), %rax	 ; name_void, name_void.23_54
 ; D:\TC\src\parser.c:151:     if (!have_return && return_type != name_void)
	cmpq	%rax, -32(%rbp)	 ; name_void.23_54, return_type
	je	.L46	 ;,
 ; D:\TC\src\parser.c:152:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp238
	movq	(%rax), %rax	 ; parser_85(D)->source_file, _55
	movq	%rax, %rcx	 ; _55,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _56
 ; D:\TC\src\parser.c:152:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp239
	movq	%rdx, %r8	 ; _56,
	movq	%rax, %rdx	 ; tmp239,
	leaq	.LC18(%rip), %rax	 ;, tmp240
	movq	%rax, %rcx	 ; tmp240,
	call	parser_error	 ;
.L46:
 ; D:\TC\src\parser.c:153:     return create_function(name, return_type, parameters, body, function_scope);
	movq	-56(%rbp), %r9	 ; body, tmp241
	movq	-48(%rbp), %r8	 ; parameters, tmp242
	movq	-32(%rbp), %rdx	 ; return_type, tmp243
	movq	-40(%rbp), %rax	 ; name, tmp244
	movq	-24(%rbp), %rcx	 ; function_scope, tmp245
	movq	%rcx, 32(%rsp)	 ; tmp245,
	movq	%rax, %rcx	 ; tmp244,
	call	create_function	 ;
.L26:
 ; D:\TC\src\parser.c:154: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC19:
	.ascii "Expected method return type after 'method'\0"
	.align 8
.LC20:
	.ascii "Unknown return type for method\0"
	.align 8
.LC21:
	.ascii "Expected method name after return type\0"
	.align 8
.LC22:
	.ascii "Expected '(' after method name\0"
	.align 8
.LC23:
	.ascii "Expected 'self' as first parameter of method\0"
	.align 8
.LC24:
	.ascii "Expected ',' or ')' after method parameter\0"
	.align 8
.LC25:
	.ascii "Failed to parse method parameter\0"
	.align 8
.LC26:
	.ascii "Method parameters cannot have default values\0"
	.align 8
.LC27:
	.ascii "Expected '{' to start method body\0"
	.align 8
.LC28:
	.ascii "Failed to parse method body statement\0"
	.align 8
.LC29:
	.ascii "Method missing return statement\0"
	.text
	.def	parse_method;	.scl	3;	.type	32;	.endef
parse_method:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	addq	$-128, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; class_name, class_name
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:156:     Token* token = NULL;
	movq	$0, -8(%rbp)	 ;, token
 ; D:\TC\src\parser.c:157:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	24(%rbp), %rax	 ; now_scope, tmp148
	movq	%rax, %rcx	 ; tmp148,
	call	create_symbol_table	 ;
	movq	%rax, -24(%rbp)	 ; tmp149, method_scope
 ; D:\TC\src\parser.c:158:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp150
	movq	(%rax), %rax	 ; SELF_KEYWORD, SELF_KEYWORD.24_1
	movq	-24(%rbp), %rcx	 ; method_scope, tmp151
	movq	32(%rbp), %rdx	 ; class_name, tmp152
	movq	%rcx, %r9	 ; tmp151,
	movq	%rdx, %r8	 ; tmp152,
	movl	$2, %edx	 ;,
	movq	%rax, %rcx	 ; SELF_KEYWORD.24_1,
	call	create_symbol	 ;
	movq	%rax, -32(%rbp)	 ; tmp153, self
 ; D:\TC\src\parser.c:159:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp154
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp154,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp155, token
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-8(%rbp), %rax	 ; token, tmp156
	movl	24(%rax), %eax	 ; token_97->type, _2
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _2
	je	.L48	 ;,
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-8(%rbp), %rax	 ; token, tmp157
	movl	24(%rax), %eax	 ; token_97->type, _3
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _3
	jne	.L49	 ;,
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-8(%rbp), %rax	 ; token, tmp158
	movq	(%rax), %rax	 ; token_97->lexeme, _4
	movq	%rax, %rcx	 ; _4,
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; _5
	jne	.L48	 ;,
.L49:
 ; D:\TC\src\parser.c:161:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp159
	movq	(%rax), %rax	 ; parser_99(D)->source_file, _6
	movq	%rax, %rcx	 ; _6,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _7
 ; D:\TC\src\parser.c:161:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp160
	movq	%rdx, %r8	 ; _7,
	movq	%rax, %rdx	 ; tmp160,
	leaq	.LC19(%rip), %rax	 ;, tmp161
	movq	%rax, %rcx	 ; tmp161,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:162:         return NULL;
	movl	$0, %eax	 ;, _69
	jmp	.L50	 ;
.L48:
 ; D:\TC\src\parser.c:164:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	-8(%rbp), %rax	 ; token, tmp162
	movq	(%rax), %rdx	 ; token_97->lexeme, _8
	movq	24(%rbp), %rax	 ; now_scope, tmp163
	movq	%rax, %rcx	 ; tmp163,
	call	search_name	 ;
	movq	%rax, -40(%rbp)	 ; tmp164, return_type
 ; D:\TC\src\parser.c:165:     if (return_type == NULL) {
	cmpq	$0, -40(%rbp)	 ;, return_type
	jne	.L51	 ;,
 ; D:\TC\src\parser.c:166:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp165
	movq	(%rax), %rax	 ; parser_99(D)->source_file, _9
	movq	%rax, %rcx	 ; _9,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _10
 ; D:\TC\src\parser.c:166:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp166
	movq	%rdx, %r8	 ; _10,
	movq	%rax, %rdx	 ; tmp166,
	leaq	.LC20(%rip), %rax	 ;, tmp167
	movq	%rax, %rcx	 ; tmp167,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:167:         return NULL;
	movl	$0, %eax	 ;, _69
	jmp	.L50	 ;
.L51:
 ; D:\TC\src\parser.c:169:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp168
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp168,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp169, token
 ; D:\TC\src\parser.c:170:     if (token->type != IDENTIFIER) {
	movq	-8(%rbp), %rax	 ; token, tmp170
	movl	24(%rax), %eax	 ; token_106->type, _11
 ; D:\TC\src\parser.c:170:     if (token->type != IDENTIFIER) {
	cmpl	$1, %eax	 ;, _11
	je	.L52	 ;,
 ; D:\TC\src\parser.c:171:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp171
	movq	(%rax), %rax	 ; parser_99(D)->source_file, _12
	movq	%rax, %rcx	 ; _12,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _13
 ; D:\TC\src\parser.c:171:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp172
	movq	%rdx, %r8	 ; _13,
	movq	%rax, %rdx	 ; tmp172,
	leaq	.LC21(%rip), %rax	 ;, tmp173
	movq	%rax, %rcx	 ; tmp173,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:172:         return NULL;
	movl	$0, %eax	 ;, _69
	jmp	.L50	 ;
.L52:
 ; D:\TC\src\parser.c:174:     Symbol* name = create_symbol(token->lexeme, SYMBOL_SUBROUTINE, return_type, method_scope);
	movq	-8(%rbp), %rax	 ; token, tmp174
	movq	(%rax), %rax	 ; token_106->lexeme, _14
	movq	-24(%rbp), %rcx	 ; method_scope, tmp175
	movq	-40(%rbp), %rdx	 ; return_type, tmp176
	movq	%rcx, %r9	 ; tmp175,
	movq	%rdx, %r8	 ; tmp176,
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; _14,
	call	create_symbol	 ;
	movq	%rax, -48(%rbp)	 ; tmp177, name
 ; D:\TC\src\parser.c:175:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp178
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp178,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp179, token
 ; D:\TC\src\parser.c:176:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp180
	movl	24(%rax), %eax	 ; token_110->type, _15
 ; D:\TC\src\parser.c:176:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _15
	jne	.L53	 ;,
 ; D:\TC\src\parser.c:176:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp181
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.25_16
	movq	-8(%rbp), %rax	 ; token, tmp182
	movq	(%rax), %rax	 ; token_110->lexeme, _17
	movq	%rax, %rcx	 ; _17,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:176:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _18
	jne	.L54	 ;,
.L53:
 ; D:\TC\src\parser.c:177:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp183
	movq	(%rax), %rax	 ; parser_99(D)->source_file, _19
	movq	%rax, %rcx	 ; _19,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _20
 ; D:\TC\src\parser.c:177:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp184
	movq	%rdx, %r8	 ; _20,
	movq	%rax, %rdx	 ; tmp184,
	leaq	.LC22(%rip), %rax	 ;, tmp185
	movq	%rax, %rcx	 ; tmp185,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:178:         return NULL;
	movl	$0, %eax	 ;, _69
	jmp	.L50	 ;
.L54:
 ; D:\TC\src\parser.c:180:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp186
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp186,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp187, token
 ; D:\TC\src\parser.c:181:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	-8(%rbp), %rax	 ; token, tmp188
	movl	24(%rax), %eax	 ; token_113->type, _21
 ; D:\TC\src\parser.c:181:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	cmpl	$6, %eax	 ;, _21
	jne	.L55	 ;,
 ; D:\TC\src\parser.c:181:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp189
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD.26_22
	movq	-8(%rbp), %rax	 ; token, tmp190
	movq	(%rax), %rax	 ; token_113->lexeme, _23
	movq	%rax, %rcx	 ; _23,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:181:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	testb	%al, %al	 ; _24
	jne	.L56	 ;,
.L55:
 ; D:\TC\src\parser.c:182:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp191
	movq	(%rax), %rax	 ; parser_99(D)->source_file, _25
	movq	%rax, %rcx	 ; _25,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _26
 ; D:\TC\src\parser.c:182:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp192
	movq	%rdx, %r8	 ; _26,
	movq	%rax, %rdx	 ; tmp192,
	leaq	.LC23(%rip), %rax	 ;, tmp193
	movq	%rax, %rcx	 ; tmp193,
	call	parser_error	 ;
.L56:
 ; D:\TC\src\parser.c:183:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp194
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp194,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp195, token
 ; D:\TC\src\parser.c:184:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rax, -56(%rbp)	 ; tmp196, parameters
 ; D:\TC\src\parser.c:185:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	-32(%rbp), %rdx	 ; self, tmp197
	movq	32(%rbp), %rax	 ; class_name, tmp198
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp198,
	call	create_variable	 ;
	movq	%rax, %rdx	 ;, _27
 ; D:\TC\src\parser.c:185:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	-56(%rbp), %rax	 ; parameters, tmp199
	movq	%rax, %rcx	 ; tmp199,
	call	list_append	 ;
 ; D:\TC\src\parser.c:186:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L57	 ;
.L65:
 ; D:\TC\src\parser.c:187:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp200
	movl	24(%rax), %eax	 ; token_65->type, _28
 ; D:\TC\src\parser.c:187:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, %eax	 ;, _28
	jne	.L58	 ;,
 ; D:\TC\src\parser.c:187:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp201
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL.27_29
	movq	-8(%rbp), %rax	 ; token, tmp202
	movq	(%rax), %rax	 ; token_65->lexeme, _30
	movq	%rax, %rcx	 ; _30,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:187:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; _31
	je	.L58	 ;,
 ; D:\TC\src\parser.c:188:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp203
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp203,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp204, token
 ; D:\TC\src\parser.c:188:             token = get_next_token(lexer, true);
	nop	
 ; D:\TC\src\parser.c:194:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	40(%rbp), %rcx	 ; parser, tmp211
	movq	-24(%rbp), %rdx	 ; method_scope, tmp212
	movq	16(%rbp), %rax	 ; lexer, tmp213
	movq	%rcx, %r8	 ; tmp211,
	movq	%rax, %rcx	 ; tmp213,
	call	parse_variable	 ;
	movq	%rax, -64(%rbp)	 ; tmp214, parameter
 ; D:\TC\src\parser.c:195:         if (parameter == NULL)
	cmpq	$0, -64(%rbp)	 ;, parameter
	jne	.L62	 ;,
	jmp	.L74	 ;
.L58:
 ; D:\TC\src\parser.c:189:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	-8(%rbp), %rax	 ; token, tmp205
	movl	24(%rax), %eax	 ; token_65->type, _32
 ; D:\TC\src\parser.c:189:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, %eax	 ;, _32
	jne	.L60	 ;,
 ; D:\TC\src\parser.c:189:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp206
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.28_33
	movq	-8(%rbp), %rax	 ; token, tmp207
	movq	(%rax), %rax	 ; token_65->lexeme, _34
	movq	%rax, %rcx	 ; _34,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:189:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	testb	%al, %al	 ; _35
	jne	.L61	 ;,
.L60:
 ; D:\TC\src\parser.c:191:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp208
	movq	(%rax), %rax	 ; parser_99(D)->source_file, _36
	movq	%rax, %rcx	 ; _36,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _37
 ; D:\TC\src\parser.c:191:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp209
	movq	%rdx, %r8	 ; _37,
	movq	%rax, %rdx	 ; tmp209,
	leaq	.LC24(%rip), %rax	 ;, tmp210
	movq	%rax, %rcx	 ; tmp210,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:192:             return NULL;
	movl	$0, %eax	 ;, _69
	jmp	.L50	 ;
.L74:
 ; D:\TC\src\parser.c:196:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp215
	movq	(%rax), %rax	 ; parser_99(D)->source_file, _38
	movq	%rax, %rcx	 ; _38,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _39
 ; D:\TC\src\parser.c:196:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp216
	movq	%rdx, %r8	 ; _39,
	movq	%rax, %rdx	 ; tmp216,
	leaq	.LC25(%rip), %rax	 ;, tmp217
	movq	%rax, %rcx	 ; tmp217,
	call	parser_error	 ;
	jmp	.L63	 ;
.L62:
 ; D:\TC\src\parser.c:197:         else if (parameter->value != NULL)
	movq	-64(%rbp), %rax	 ; parameter, tmp218
	movq	16(%rax), %rax	 ; parameter_128->value, _40
 ; D:\TC\src\parser.c:197:         else if (parameter->value != NULL)
	testq	%rax, %rax	 ; _40
	je	.L64	 ;,
 ; D:\TC\src\parser.c:198:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp219
	movq	(%rax), %rax	 ; parser_99(D)->source_file, _41
	movq	%rax, %rcx	 ; _41,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _42
 ; D:\TC\src\parser.c:198:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp220
	movq	%rdx, %r8	 ; _42,
	movq	%rax, %rdx	 ; tmp220,
	leaq	.LC26(%rip), %rax	 ;, tmp221
	movq	%rax, %rcx	 ; tmp221,
	call	parser_error	 ;
	jmp	.L63	 ;
.L64:
 ; D:\TC\src\parser.c:200:             list_append(parameters, (pointer)parameter);
	movq	-64(%rbp), %rdx	 ; parameter, tmp222
	movq	-56(%rbp), %rax	 ; parameters, tmp223
	movq	%rax, %rcx	 ; tmp223,
	call	list_append	 ;
.L63:
 ; D:\TC\src\parser.c:201:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp224
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp224,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp225, token
.L57:
 ; D:\TC\src\parser.c:186:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp226
	movl	24(%rax), %eax	 ; token_65->type, _43
 ; D:\TC\src\parser.c:186:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _43
	jne	.L65	 ;,
 ; D:\TC\src\parser.c:186:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp227
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.29_44
	movq	-8(%rbp), %rax	 ; token, tmp228
	movq	(%rax), %rax	 ; token_65->lexeme, _45
	movq	%rax, %rcx	 ; _45,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:186:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _46
	je	.L65	 ;,
.L61:
 ; D:\TC\src\parser.c:203:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp229
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp229,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp230, token
 ; D:\TC\src\parser.c:204:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp231
	movl	24(%rax), %eax	 ; token_141->type, _47
 ; D:\TC\src\parser.c:204:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _47
	jne	.L66	 ;,
 ; D:\TC\src\parser.c:204:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp232
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.30_48
	movq	-8(%rbp), %rax	 ; token, tmp233
	movq	(%rax), %rax	 ; token_141->lexeme, _49
	movq	%rax, %rcx	 ; _49,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:204:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _50
	jne	.L67	 ;,
.L66:
 ; D:\TC\src\parser.c:205:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp234
	movq	(%rax), %rax	 ; parser_99(D)->source_file, _51
	movq	%rax, %rcx	 ; _51,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _52
 ; D:\TC\src\parser.c:205:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp235
	movq	%rdx, %r8	 ; _52,
	movq	%rax, %rdx	 ; tmp235,
	leaq	.LC27(%rip), %rax	 ;, tmp236
	movq	%rax, %rcx	 ; tmp236,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:206:         return NULL;
	movl	$0, %eax	 ;, _69
	jmp	.L50	 ;
.L67:
 ; D:\TC\src\parser.c:208:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, -72(%rbp)	 ; tmp237, body
 ; D:\TC\src\parser.c:209:     parser->in_function = true;
	movq	40(%rbp), %rax	 ; parser, tmp238
	movb	$1, 8(%rax)	 ;, parser_99(D)->in_function
 ; D:\TC\src\parser.c:210:     parser->in_method = true;
	movq	40(%rbp), %rax	 ; parser, tmp239
	movb	$1, 9(%rax)	 ;, parser_99(D)->in_method
 ; D:\TC\src\parser.c:211:     bool have_return = false;
	movb	$0, -9(%rbp)	 ;, have_return
 ; D:\TC\src\parser.c:212:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp240
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp240,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp241, token
 ; D:\TC\src\parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L68	 ;
.L72:
 ; D:\TC\src\parser.c:214:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	40(%rbp), %rcx	 ; parser, tmp242
	movq	-24(%rbp), %rdx	 ; method_scope, tmp243
	movq	16(%rbp), %rax	 ; lexer, tmp244
	movq	%rcx, %r8	 ; tmp242,
	movq	%rax, %rcx	 ; tmp244,
	call	parse_statement	 ;
	movq	%rax, -80(%rbp)	 ; tmp245, statement
 ; D:\TC\src\parser.c:215:         if (statement == NULL)
	cmpq	$0, -80(%rbp)	 ;, statement
	jne	.L69	 ;,
 ; D:\TC\src\parser.c:216:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp246
	movq	(%rax), %rax	 ; parser_99(D)->source_file, _53
	movq	%rax, %rcx	 ; _53,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _54
 ; D:\TC\src\parser.c:216:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp247
	movq	%rdx, %r8	 ; _54,
	movq	%rax, %rdx	 ; tmp247,
	leaq	.LC28(%rip), %rax	 ;, tmp248
	movq	%rax, %rcx	 ; tmp248,
	call	parser_error	 ;
	jmp	.L70	 ;
.L69:
 ; D:\TC\src\parser.c:217:         else if (have_return)
	cmpb	$0, -9(%rbp)	 ;, have_return
	je	.L70	 ;,
 ; D:\TC\src\parser.c:218:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp249
	movq	(%rax), %rax	 ; parser_99(D)->source_file, _55
	movq	%rax, %rcx	 ; _55,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _56
 ; D:\TC\src\parser.c:218:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp250
	movq	%rdx, %r8	 ; _56,
	movq	%rax, %rdx	 ; tmp250,
	leaq	.LC17(%rip), %rax	 ;, tmp251
	movq	%rax, %rcx	 ; tmp251,
	call	parser_error	 ;
.L70:
 ; D:\TC\src\parser.c:219:         if (statement != NULL && statement->type == RETURN_STATEMENT)
	cmpq	$0, -80(%rbp)	 ;, statement
	je	.L71	 ;,
 ; D:\TC\src\parser.c:219:         if (statement != NULL && statement->type == RETURN_STATEMENT)
	movq	-80(%rbp), %rax	 ; statement, tmp252
	movl	8(%rax), %eax	 ; statement_158->type, _57
 ; D:\TC\src\parser.c:219:         if (statement != NULL && statement->type == RETURN_STATEMENT)
	cmpl	$5, %eax	 ;, _57
	jne	.L71	 ;,
 ; D:\TC\src\parser.c:220:             have_return = true;
	movb	$1, -9(%rbp)	 ;, have_return
.L71:
 ; D:\TC\src\parser.c:221:         list_append(body, (pointer)statement);
	movq	-80(%rbp), %rdx	 ; statement, tmp253
	movq	-72(%rbp), %rax	 ; body, tmp254
	movq	%rax, %rcx	 ; tmp254,
	call	list_append	 ;
 ; D:\TC\src\parser.c:222:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp255
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp255,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp256, token
.L68:
 ; D:\TC\src\parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp257
	movl	24(%rax), %eax	 ; token_66->type, _58
 ; D:\TC\src\parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _58
	jne	.L72	 ;,
 ; D:\TC\src\parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp258
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.31_59
	movq	-8(%rbp), %rax	 ; token, tmp259
	movq	(%rax), %rax	 ; token_66->lexeme, _60
	movq	%rax, %rcx	 ; _60,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _61
	je	.L72	 ;,
 ; D:\TC\src\parser.c:224:     parser->in_function = false;
	movq	40(%rbp), %rax	 ; parser, tmp260
	movb	$0, 8(%rax)	 ;, parser_99(D)->in_function
 ; D:\TC\src\parser.c:225:     parser->in_method = false;
	movq	40(%rbp), %rax	 ; parser, tmp261
	movb	$0, 9(%rax)	 ;, parser_99(D)->in_method
 ; D:\TC\src\parser.c:226:     if (!have_return && return_type != name_void)
	cmpb	$0, -9(%rbp)	 ;, have_return
	jne	.L73	 ;,
 ; D:\TC\src\parser.c:226:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp262
	movq	(%rax), %rax	 ; name_void, name_void.32_62
 ; D:\TC\src\parser.c:226:     if (!have_return && return_type != name_void)
	cmpq	%rax, -40(%rbp)	 ; name_void.32_62, return_type
	je	.L73	 ;,
 ; D:\TC\src\parser.c:227:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp263
	movq	(%rax), %rax	 ; parser_99(D)->source_file, _63
	movq	%rax, %rcx	 ; _63,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _64
 ; D:\TC\src\parser.c:227:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp264
	movq	%rdx, %r8	 ; _64,
	movq	%rax, %rdx	 ; tmp264,
	leaq	.LC29(%rip), %rax	 ;, tmp265
	movq	%rax, %rcx	 ; tmp265,
	call	parser_error	 ;
.L73:
 ; D:\TC\src\parser.c:228:     return create_method(name, return_type, parameters, body, method_scope);
	movq	-72(%rbp), %r9	 ; body, tmp266
	movq	-56(%rbp), %r8	 ; parameters, tmp267
	movq	-40(%rbp), %rdx	 ; return_type, tmp268
	movq	-48(%rbp), %rax	 ; name, tmp269
	movq	-24(%rbp), %rcx	 ; method_scope, tmp270
	movq	%rcx, 32(%rsp)	 ; tmp270,
	movq	%rax, %rcx	 ; tmp269,
	call	create_method	 ;
.L50:
 ; D:\TC\src\parser.c:229: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC30:
	.ascii "Expected class name after 'class'\0"
	.align 8
.LC31:
	.ascii "Expected '{' to start class body\0"
.LC32:
	.ascii "Failed to parse class method\0"
	.align 8
.LC33:
	.ascii "Failed to parse class variable\0"
	.align 8
.LC34:
	.ascii "Expected ';' after class variable declaration\0"
	.align 8
.LC35:
	.ascii "Unexpected token in class member\0"
	.align 8
.LC36:
	.ascii "Constructor name conflicts with existing member\0"
	.text
	.def	parse_class;	.scl	3;	.type	32;	.endef
parse_class:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$96, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:231:     Token* token = NULL;
	movq	$0, -8(%rbp)	 ;, token
 ; D:\TC\src\parser.c:232:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	24(%rbp), %rax	 ; now_scope, tmp125
	movq	%rax, %rcx	 ; tmp125,
	call	create_symbol_table	 ;
	movq	%rax, -24(%rbp)	 ; tmp126, class_scope
 ; D:\TC\src\parser.c:233:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp127
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp127,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp128, token
 ; D:\TC\src\parser.c:234:     if (token->type != IDENTIFIER) {
	movq	-8(%rbp), %rax	 ; token, tmp129
	movl	24(%rax), %eax	 ; token_65->type, _1
 ; D:\TC\src\parser.c:234:     if (token->type != IDENTIFIER) {
	cmpl	$1, %eax	 ;, _1
	je	.L76	 ;,
 ; D:\TC\src\parser.c:235:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp130
	movq	(%rax), %rax	 ; parser_82(D)->source_file, _2
	movq	%rax, %rcx	 ; _2,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _3
 ; D:\TC\src\parser.c:235:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp131
	movq	%rdx, %r8	 ; _3,
	movq	%rax, %rdx	 ; tmp131,
	leaq	.LC30(%rip), %rax	 ;, tmp132
	movq	%rax, %rcx	 ; tmp132,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:236:         return NULL;
	movl	$0, %eax	 ;, _44
	jmp	.L77	 ;
.L76:
 ; D:\TC\src\parser.c:238:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class_scope);
	movq	-8(%rbp), %rax	 ; token, tmp133
	movq	(%rax), %rax	 ; token_65->lexeme, _4
	movq	-24(%rbp), %rdx	 ; class_scope, tmp134
	movq	%rdx, %r9	 ; tmp134,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; _4,
	call	create_symbol	 ;
	movq	%rax, -32(%rbp)	 ; tmp135, name
 ; D:\TC\src\parser.c:239:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp136
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp136,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp137, token
 ; D:\TC\src\parser.c:240:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp138
	movl	24(%rax), %eax	 ; token_69->type, _5
 ; D:\TC\src\parser.c:240:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _5
	jne	.L78	 ;,
 ; D:\TC\src\parser.c:240:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp139
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.33_6
	movq	-8(%rbp), %rax	 ; token, tmp140
	movq	(%rax), %rax	 ; token_69->lexeme, _7
	movq	%rax, %rcx	 ; _7,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:240:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _8
	jne	.L79	 ;,
.L78:
 ; D:\TC\src\parser.c:241:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp141
	movq	(%rax), %rax	 ; parser_82(D)->source_file, _9
	movq	%rax, %rcx	 ; _9,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _10
 ; D:\TC\src\parser.c:241:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp142
	movq	%rdx, %r8	 ; _10,
	movq	%rax, %rdx	 ; tmp142,
	leaq	.LC31(%rip), %rax	 ;, tmp143
	movq	%rax, %rcx	 ; tmp143,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:242:         return NULL;
	movl	$0, %eax	 ;, _44
	jmp	.L77	 ;
.L79:
 ; D:\TC\src\parser.c:244:     list(ClassMember*) members = create_list();
	call	create_list	 ;
	movq	%rax, -40(%rbp)	 ; tmp144, members
 ; D:\TC\src\parser.c:245:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp145
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp145,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp146, token
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L80	 ;
.L88:
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	-8(%rbp), %rax	 ; token, tmp147
	movl	24(%rax), %eax	 ; token_42->type, _11
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	 ;, _11
	jne	.L81	 ;,
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	.refptr.METHOD_KEYWORD(%rip), %rax	 ;, tmp148
	movq	(%rax), %rdx	 ; METHOD_KEYWORD, METHOD_KEYWORD.34_12
	movq	-8(%rbp), %rax	 ; token, tmp149
	movq	(%rax), %rax	 ; token_42->lexeme, _13
	movq	%rax, %rcx	 ; _13,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	testb	%al, %al	 ; _14
	je	.L81	 ;,
 ; D:\TC\src\parser.c:248:             Method* method = parse_method(lexer, class_scope, name, parser);
	movq	32(%rbp), %r8	 ; parser, tmp150
	movq	-32(%rbp), %rcx	 ; name, tmp151
	movq	-24(%rbp), %rdx	 ; class_scope, tmp152
	movq	16(%rbp), %rax	 ; lexer, tmp153
	movq	%r8, %r9	 ; tmp150,
	movq	%rcx, %r8	 ; tmp151,
	movq	%rax, %rcx	 ; tmp153,
	call	parse_method	 ;
	movq	%rax, -56(%rbp)	 ; tmp154, method
 ; D:\TC\src\parser.c:249:             if (method == NULL)
	cmpq	$0, -56(%rbp)	 ;, method
	jne	.L82	 ;,
 ; D:\TC\src\parser.c:250:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp155
	movq	(%rax), %rax	 ; parser_82(D)->source_file, _15
	movq	%rax, %rcx	 ; _15,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _16
 ; D:\TC\src\parser.c:250:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp156
	movq	%rdx, %r8	 ; _16,
	movq	%rax, %rdx	 ; tmp156,
	leaq	.LC32(%rip), %rax	 ;, tmp157
	movq	%rax, %rcx	 ; tmp157,
	call	parser_error	 ;
.L82:
 ; D:\TC\src\parser.c:251:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	-56(%rbp), %rax	 ; method, tmp158
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp158,
	movl	$0, %ecx	 ;,
	call	create_class_member	 ;
	movq	%rax, %rdx	 ;, _17
 ; D:\TC\src\parser.c:251:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	-40(%rbp), %rax	 ; members, tmp159
	movq	%rax, %rcx	 ; tmp159,
	call	list_append	 ;
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	jmp	.L83	 ;
.L81:
 ; D:\TC\src\parser.c:252:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	-8(%rbp), %rax	 ; token, tmp160
	movl	24(%rax), %eax	 ; token_42->type, _18
 ; D:\TC\src\parser.c:252:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	cmpl	$6, %eax	 ;, _18
	jne	.L84	 ;,
 ; D:\TC\src\parser.c:252:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp161
	movq	(%rax), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD.35_19
	movq	-8(%rbp), %rax	 ; token, tmp162
	movq	(%rax), %rax	 ; token_42->lexeme, _20
	movq	%rax, %rcx	 ; _20,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:252:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; _21
	je	.L84	 ;,
 ; D:\TC\src\parser.c:253:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp163
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp163,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp164, token
 ; D:\TC\src\parser.c:254:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp165
	movq	-24(%rbp), %rdx	 ; class_scope, tmp166
	movq	16(%rbp), %rax	 ; lexer, tmp167
	movq	%rcx, %r8	 ; tmp165,
	movq	%rax, %rcx	 ; tmp167,
	call	parse_variable	 ;
	movq	%rax, -64(%rbp)	 ; tmp168, variable
 ; D:\TC\src\parser.c:255:             if (variable == NULL)
	cmpq	$0, -64(%rbp)	 ;, variable
	jne	.L85	 ;,
 ; D:\TC\src\parser.c:256:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp169
	movq	(%rax), %rax	 ; parser_82(D)->source_file, _22
	movq	%rax, %rcx	 ; _22,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _23
 ; D:\TC\src\parser.c:256:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp170
	movq	%rdx, %r8	 ; _23,
	movq	%rax, %rdx	 ; tmp170,
	leaq	.LC33(%rip), %rax	 ;, tmp171
	movq	%rax, %rcx	 ; tmp171,
	call	parser_error	 ;
.L85:
 ; D:\TC\src\parser.c:257:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	-64(%rbp), %rax	 ; variable, tmp172
	movq	%rax, %r8	 ; tmp172,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_class_member	 ;
	movq	%rax, %rdx	 ;, _24
 ; D:\TC\src\parser.c:257:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	-40(%rbp), %rax	 ; members, tmp173
	movq	%rax, %rcx	 ; tmp173,
	call	list_append	 ;
 ; D:\TC\src\parser.c:258:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp174
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp174,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp175, token
 ; D:\TC\src\parser.c:259:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	-8(%rbp), %rax	 ; token, tmp176
	movl	24(%rax), %eax	 ; token_104->type, _25
 ; D:\TC\src\parser.c:259:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, %eax	 ;, _25
	jne	.L86	 ;,
 ; D:\TC\src\parser.c:259:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp177
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.36_26
	movq	-8(%rbp), %rax	 ; token, tmp178
	movq	(%rax), %rax	 ; token_104->lexeme, _27
	movq	%rax, %rcx	 ; _27,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:259:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; _28
	jne	.L91	 ;,
.L86:
 ; D:\TC\src\parser.c:260:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp179
	movq	(%rax), %rax	 ; parser_82(D)->source_file, _29
	movq	%rax, %rcx	 ; _29,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _30
 ; D:\TC\src\parser.c:260:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp180
	movq	%rdx, %r8	 ; _30,
	movq	%rax, %rdx	 ; tmp180,
	leaq	.LC34(%rip), %rax	 ;, tmp181
	movq	%rax, %rcx	 ; tmp181,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:252:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	jmp	.L91	 ;
.L84:
 ; D:\TC\src\parser.c:262:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp182
	movq	(%rax), %rax	 ; parser_82(D)->source_file, _31
	movq	%rax, %rcx	 ; _31,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _32
 ; D:\TC\src\parser.c:262:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp183
	movq	%rdx, %r8	 ; _32,
	movq	%rax, %rdx	 ; tmp183,
	leaq	.LC35(%rip), %rax	 ;, tmp184
	movq	%rax, %rcx	 ; tmp184,
	call	parser_error	 ;
	jmp	.L83	 ;
.L91:
 ; D:\TC\src\parser.c:252:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	nop	
.L83:
 ; D:\TC\src\parser.c:263:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp185
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp185,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp186, token
.L80:
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp187
	movl	24(%rax), %eax	 ; token_42->type, _33
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _33
	jne	.L88	 ;,
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp188
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.37_34
	movq	-8(%rbp), %rax	 ; token, tmp189
	movq	(%rax), %rax	 ; token_42->lexeme, _35
	movq	%rax, %rcx	 ; _35,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _36
	je	.L88	 ;,
 ; D:\TC\src\parser.c:265:     Symbol* constructor = search_name(class_scope, CONSTRUCTOR_NAME);
	movq	.refptr.CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp190
	movq	(%rax), %rdx	 ; CONSTRUCTOR_NAME, CONSTRUCTOR_NAME.38_37
	movq	-24(%rbp), %rax	 ; class_scope, tmp191
	movq	%rax, %rcx	 ; tmp191,
	call	search_name	 ;
	movq	%rax, -16(%rbp)	 ; tmp192, constructor
 ; D:\TC\src\parser.c:266:     if (constructor == NULL) {
	cmpq	$0, -16(%rbp)	 ;, constructor
	jne	.L89	 ;,
 ; D:\TC\src\parser.c:267:         SymbolTable* constructor_scope = create_symbol_table(class_scope);
	movq	-24(%rbp), %rax	 ; class_scope, tmp193
	movq	%rax, %rcx	 ; tmp193,
	call	create_symbol_table	 ;
	movq	%rax, -48(%rbp)	 ; tmp194, constructor_scope
 ; D:\TC\src\parser.c:268:         constructor = create_symbol(CONSTRUCTOR_NAME, SYMBOL_SUBROUTINE, name, constructor_scope);
	movq	.refptr.CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp195
	movq	(%rax), %rax	 ; CONSTRUCTOR_NAME, CONSTRUCTOR_NAME.39_38
	movq	-48(%rbp), %rcx	 ; constructor_scope, tmp196
	movq	-32(%rbp), %rdx	 ; name, tmp197
	movq	%rcx, %r9	 ; tmp196,
	movq	%rdx, %r8	 ; tmp197,
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; CONSTRUCTOR_NAME.39_38,
	call	create_symbol	 ;
	movq	%rax, -16(%rbp)	 ; tmp198, constructor
.L89:
 ; D:\TC\src\parser.c:270:     if (constructor->kind != SYMBOL_SUBROUTINE)
	movq	-16(%rbp), %rax	 ; constructor, tmp199
	movl	32(%rax), %eax	 ; constructor_43->kind, _39
 ; D:\TC\src\parser.c:270:     if (constructor->kind != SYMBOL_SUBROUTINE)
	cmpl	$1, %eax	 ;, _39
	je	.L90	 ;,
 ; D:\TC\src\parser.c:271:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp200
	movq	(%rax), %rax	 ; parser_82(D)->source_file, _40
	movq	%rax, %rcx	 ; _40,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _41
 ; D:\TC\src\parser.c:271:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp201
	movq	%rdx, %r8	 ; _41,
	movq	%rax, %rdx	 ; tmp201,
	leaq	.LC36(%rip), %rax	 ;, tmp202
	movq	%rax, %rcx	 ; tmp202,
	call	parser_error	 ;
.L90:
 ; D:\TC\src\parser.c:272:     return create_class(name, members, class_scope);
	movq	-24(%rbp), %rcx	 ; class_scope, tmp203
	movq	-40(%rbp), %rdx	 ; members, tmp204
	movq	-32(%rbp), %rax	 ; name, tmp205
	movq	%rcx, %r8	 ; tmp203,
	movq	%rax, %rcx	 ; tmp205,
	call	create_class	 ;
.L77:
 ; D:\TC\src\parser.c:273: }
	leave	
	ret	
	.section .rdata,"dr"
.LC37:
	.ascii "Expected variable type\0"
	.align 8
.LC38:
	.ascii "Expected a type for variable declaration\0"
.LC39:
	.ascii "Unknown variable type\0"
.LC40:
	.ascii "Expected variable name\0"
	.align 8
.LC41:
	.ascii "Failed to parse variable initializer\0"
	.text
	.def	parse_variable;	.scl	3;	.type	32;	.endef
parse_variable:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$80, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:275:     Token* token = NULL;
	movq	$0, -16(%rbp)	 ;, token
 ; D:\TC\src\parser.c:276:     token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp107
	movq	%rax, %rcx	 ; tmp107,
	call	peek_current_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp108, token
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-16(%rbp), %rax	 ; token, tmp109
	movl	24(%rax), %eax	 ; token_36->type, _1
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _1
	je	.L93	 ;,
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-16(%rbp), %rax	 ; token, tmp110
	movl	24(%rax), %eax	 ; token_36->type, _2
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _2
	jne	.L94	 ;,
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-16(%rbp), %rax	 ; token, tmp111
	movq	(%rax), %rax	 ; token_36->lexeme, _3
	movq	%rax, %rcx	 ; _3,
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; _4
	jne	.L93	 ;,
.L94:
 ; D:\TC\src\parser.c:278:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp112
	movq	(%rax), %rax	 ; parser_38(D)->source_file, _5
	movq	%rax, %rcx	 ; _5,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _6
 ; D:\TC\src\parser.c:278:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	 ; token, tmp113
	movq	%rdx, %r8	 ; _6,
	movq	%rax, %rdx	 ; tmp113,
	leaq	.LC37(%rip), %rax	 ;, tmp114
	movq	%rax, %rcx	 ; tmp114,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:279:         return NULL;
	movl	$0, %eax	 ;, _25
	jmp	.L95	 ;
.L93:
 ; D:\TC\src\parser.c:281:     Symbol* type = search_name(now_scope, token->lexeme);
	movq	-16(%rbp), %rax	 ; token, tmp115
	movq	(%rax), %rdx	 ; token_36->lexeme, _7
	movq	24(%rbp), %rax	 ; now_scope, tmp116
	movq	%rax, %rcx	 ; tmp116,
	call	search_name	 ;
	movq	%rax, -24(%rbp)	 ; tmp117, type
 ; D:\TC\src\parser.c:282:     if (type != NULL) {
	cmpq	$0, -24(%rbp)	 ;, type
	je	.L96	 ;,
 ; D:\TC\src\parser.c:283:         Symbol* type_ptr = type;
	movq	-24(%rbp), %rax	 ; type, tmp118
	movq	%rax, -32(%rbp)	 ; tmp118, type_ptr
 ; D:\TC\src\parser.c:284:         if (type_ptr->kind != SYMBOL_TYPE && type_ptr->kind != SYMBOL_CLASS)
	movq	-32(%rbp), %rax	 ; type_ptr, tmp119
	movl	32(%rax), %eax	 ; type_ptr_47->kind, _8
 ; D:\TC\src\parser.c:284:         if (type_ptr->kind != SYMBOL_TYPE && type_ptr->kind != SYMBOL_CLASS)
	cmpl	$5, %eax	 ;, _8
	je	.L97	 ;,
 ; D:\TC\src\parser.c:284:         if (type_ptr->kind != SYMBOL_TYPE && type_ptr->kind != SYMBOL_CLASS)
	movq	-32(%rbp), %rax	 ; type_ptr, tmp120
	movl	32(%rax), %eax	 ; type_ptr_47->kind, _9
 ; D:\TC\src\parser.c:284:         if (type_ptr->kind != SYMBOL_TYPE && type_ptr->kind != SYMBOL_CLASS)
	testl	%eax, %eax	 ; _9
	je	.L97	 ;,
 ; D:\TC\src\parser.c:285:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp121
	movq	(%rax), %rax	 ; parser_38(D)->source_file, _10
	movq	%rax, %rcx	 ; _10,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _11
 ; D:\TC\src\parser.c:285:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	 ; token, tmp122
	movq	%rdx, %r8	 ; _11,
	movq	%rax, %rdx	 ; tmp122,
	leaq	.LC38(%rip), %rax	 ;, tmp123
	movq	%rax, %rcx	 ; tmp123,
	call	parser_error	 ;
	jmp	.L97	 ;
.L96:
 ; D:\TC\src\parser.c:287:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp124
	movq	(%rax), %rax	 ; parser_38(D)->source_file, _12
	movq	%rax, %rcx	 ; _12,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _13
 ; D:\TC\src\parser.c:287:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	 ; token, tmp125
	movq	%rdx, %r8	 ; _13,
	movq	%rax, %rdx	 ; tmp125,
	leaq	.LC39(%rip), %rax	 ;, tmp126
	movq	%rax, %rcx	 ; tmp126,
	call	parser_error	 ;
.L97:
 ; D:\TC\src\parser.c:288:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp127
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp127,
	call	get_next_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp128, token
 ; D:\TC\src\parser.c:289:     if (token->type != IDENTIFIER)
	movq	-16(%rbp), %rax	 ; token, tmp129
	movl	24(%rax), %eax	 ; token_51->type, _14
 ; D:\TC\src\parser.c:289:     if (token->type != IDENTIFIER)
	cmpl	$1, %eax	 ;, _14
	je	.L98	 ;,
 ; D:\TC\src\parser.c:290:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp130
	movq	(%rax), %rax	 ; parser_38(D)->source_file, _15
	movq	%rax, %rcx	 ; _15,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _16
 ; D:\TC\src\parser.c:290:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	 ; token, tmp131
	movq	%rdx, %r8	 ; _16,
	movq	%rax, %rdx	 ; tmp131,
	leaq	.LC40(%rip), %rax	 ;, tmp132
	movq	%rax, %rcx	 ; tmp132,
	call	parser_error	 ;
.L98:
 ; D:\TC\src\parser.c:291:     Symbol* name = create_symbol(token->lexeme, SYMBOL_VARIABLE, type, now_scope);
	movq	-16(%rbp), %rax	 ; token, tmp133
	movq	(%rax), %rax	 ; token_51->lexeme, _17
	movq	24(%rbp), %rcx	 ; now_scope, tmp134
	movq	-24(%rbp), %rdx	 ; type, tmp135
	movq	%rcx, %r9	 ; tmp134,
	movq	%rdx, %r8	 ; tmp135,
	movl	$2, %edx	 ;,
	movq	%rax, %rcx	 ; _17,
	call	create_symbol	 ;
	movq	%rax, -40(%rbp)	 ; tmp136, name
 ; D:\TC\src\parser.c:292:     Expression* value = NULL;
	movq	$0, -8(%rbp)	 ;, value
 ; D:\TC\src\parser.c:293:     token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp137
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp137,
	call	peek_next_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp138, token
 ; D:\TC\src\parser.c:294:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token, tmp139
	movl	24(%rax), %eax	 ; token_58->type, _18
 ; D:\TC\src\parser.c:294:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _18
	jne	.L99	 ;,
 ; D:\TC\src\parser.c:294:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp140
	movq	(%rax), %rdx	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL.40_19
	movq	-16(%rbp), %rax	 ; token, tmp141
	movq	(%rax), %rax	 ; token_58->lexeme, _20
	movq	%rax, %rcx	 ; _20,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:294:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	 ; _21
	je	.L99	 ;,
 ; D:\TC\src\parser.c:295:         token = get_next_token(lexer, true);  // consume '='
	movq	16(%rbp), %rax	 ; lexer, tmp142
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp142,
	call	get_next_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp143, token
 ; D:\TC\src\parser.c:296:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp144
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp144,
	call	get_next_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp145, token
 ; D:\TC\src\parser.c:297:         value = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp146
	movq	24(%rbp), %rdx	 ; now_scope, tmp147
	movq	16(%rbp), %rax	 ; lexer, tmp148
	movq	%rcx, %r8	 ; tmp146,
	movq	%rax, %rcx	 ; tmp148,
	call	parse_expression	 ;
	movq	%rax, -8(%rbp)	 ; tmp149, value
 ; D:\TC\src\parser.c:298:         if (value == NULL)
	cmpq	$0, -8(%rbp)	 ;, value
	jne	.L99	 ;,
 ; D:\TC\src\parser.c:299:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp150
	movq	(%rax), %rax	 ; parser_38(D)->source_file, _22
	movq	%rax, %rcx	 ; _22,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _23
 ; D:\TC\src\parser.c:299:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	 ; token, tmp151
	movq	%rdx, %r8	 ; _23,
	movq	%rax, %rdx	 ; tmp151,
	leaq	.LC41(%rip), %rax	 ;, tmp152
	movq	%rax, %rcx	 ; tmp152,
	call	parser_error	 ;
.L99:
 ; D:\TC\src\parser.c:301:     return create_variable(type, name, value);
	movq	-8(%rbp), %rcx	 ; value, tmp153
	movq	-40(%rbp), %rdx	 ; name, tmp154
	movq	-24(%rbp), %rax	 ; type, tmp155
	movq	%rcx, %r8	 ; tmp153,
	movq	%rax, %rcx	 ; tmp155,
	call	create_variable	 ;
.L95:
 ; D:\TC\src\parser.c:302: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC42:
	.ascii "Cannot use 'break' outside of a loop\0"
	.align 8
.LC43:
	.ascii "Cannot use 'continue' outside of a loop\0"
.LC44:
	.ascii "Failed to parse statement\0"
.LC45:
	.ascii "Expected ';' after statement\0"
	.text
	.def	parse_statement;	.scl	3;	.type	32;	.endef
parse_statement:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$64, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:304:     Token* token = NULL;
	movq	$0, -16(%rbp)	 ;, token
 ; D:\TC\src\parser.c:305:     token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp131
	movq	%rax, %rcx	 ; tmp131,
	call	peek_current_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp132, token
 ; D:\TC\src\parser.c:306:     Statement* statement = NULL;
	movq	$0, -8(%rbp)	 ;, statement
 ; D:\TC\src\parser.c:307:     if (token->type == KEYWORD) {
	movq	-16(%rbp), %rax	 ; token, tmp133
	movl	24(%rax), %eax	 ; token_60->type, _1
 ; D:\TC\src\parser.c:307:     if (token->type == KEYWORD) {
	cmpl	$6, %eax	 ;, _1
	jne	.L101	 ;,
 ; D:\TC\src\parser.c:308:         if (string_equal(token->lexeme, IF_KEYWORD))
	movq	.refptr.IF_KEYWORD(%rip), %rax	 ;, tmp134
	movq	(%rax), %rdx	 ; IF_KEYWORD, IF_KEYWORD.41_2
	movq	-16(%rbp), %rax	 ; token, tmp135
	movq	(%rax), %rax	 ; token_60->lexeme, _3
	movq	%rax, %rcx	 ; _3,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:308:         if (string_equal(token->lexeme, IF_KEYWORD))
	testb	%al, %al	 ; _4
	je	.L102	 ;,
 ; D:\TC\src\parser.c:309:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movq	32(%rbp), %rcx	 ; parser, tmp136
	movq	24(%rbp), %rdx	 ; now_scope, tmp137
	movq	16(%rbp), %rax	 ; lexer, tmp138
	movq	%rcx, %r8	 ; tmp136,
	movq	%rax, %rcx	 ; tmp138,
	call	parse_if	 ;
 ; D:\TC\src\parser.c:309:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _5,
	movl	$2, %ecx	 ;,
	call	create_statement	 ;
 ; D:\TC\src\parser.c:309:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	jmp	.L103	 ;
.L102:
 ; D:\TC\src\parser.c:310:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	movq	.refptr.FOR_KEYWORD(%rip), %rax	 ;, tmp139
	movq	(%rax), %rdx	 ; FOR_KEYWORD, FOR_KEYWORD.42_6
	movq	-16(%rbp), %rax	 ; token, tmp140
	movq	(%rax), %rax	 ; token_60->lexeme, _7
	movq	%rax, %rcx	 ; _7,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:310:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	testb	%al, %al	 ; _8
	je	.L104	 ;,
 ; D:\TC\src\parser.c:311:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movq	32(%rbp), %rcx	 ; parser, tmp141
	movq	24(%rbp), %rdx	 ; now_scope, tmp142
	movq	16(%rbp), %rax	 ; lexer, tmp143
	movq	%rcx, %r8	 ; tmp141,
	movq	%rax, %rcx	 ; tmp143,
	call	parse_for	 ;
 ; D:\TC\src\parser.c:311:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movq	%rax, %r9	 ; _9,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$4, %ecx	 ;,
	call	create_statement	 ;
 ; D:\TC\src\parser.c:311:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L103	 ;
.L104:
 ; D:\TC\src\parser.c:312:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	movq	.refptr.WHILE_KEYWORD(%rip), %rax	 ;, tmp144
	movq	(%rax), %rdx	 ; WHILE_KEYWORD, WHILE_KEYWORD.43_10
	movq	-16(%rbp), %rax	 ; token, tmp145
	movq	(%rax), %rax	 ; token_60->lexeme, _11
	movq	%rax, %rcx	 ; _11,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:312:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	testb	%al, %al	 ; _12
	je	.L105	 ;,
 ; D:\TC\src\parser.c:313:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movq	32(%rbp), %rcx	 ; parser, tmp146
	movq	24(%rbp), %rdx	 ; now_scope, tmp147
	movq	16(%rbp), %rax	 ; lexer, tmp148
	movq	%rcx, %r8	 ; tmp146,
	movq	%rax, %rcx	 ; tmp148,
	call	parse_while	 ;
 ; D:\TC\src\parser.c:313:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; _13,
	movl	$0, %edx	 ;,
	movl	$3, %ecx	 ;,
	call	create_statement	 ;
 ; D:\TC\src\parser.c:313:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	jmp	.L103	 ;
.L105:
 ; D:\TC\src\parser.c:314:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp149
	movq	(%rax), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD.44_14
	movq	-16(%rbp), %rax	 ; token, tmp150
	movq	(%rax), %rax	 ; token_60->lexeme, _15
	movq	%rax, %rcx	 ; _15,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:314:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; _16
	je	.L106	 ;,
 ; D:\TC\src\parser.c:315:             get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp151
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp151,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:316:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	32(%rbp), %rcx	 ; parser, tmp152
	movq	24(%rbp), %rdx	 ; now_scope, tmp153
	movq	16(%rbp), %rax	 ; lexer, tmp154
	movq	%rcx, %r8	 ; tmp152,
	movq	%rax, %rcx	 ; tmp154,
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:316:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rax, 40(%rsp)	 ; _17,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, -8(%rbp)	 ; tmp155, statement
	jmp	.L107	 ;
.L106:
 ; D:\TC\src\parser.c:317:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	movq	.refptr.RETURN_KEYWORD(%rip), %rax	 ;, tmp156
	movq	(%rax), %rdx	 ; RETURN_KEYWORD, RETURN_KEYWORD.45_18
	movq	-16(%rbp), %rax	 ; token, tmp157
	movq	(%rax), %rax	 ; token_60->lexeme, _19
	movq	%rax, %rcx	 ; _19,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:317:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	 ; _20
	je	.L108	 ;,
 ; D:\TC\src\parser.c:318:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp158
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp158,
	call	get_next_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp159, token
 ; D:\TC\src\parser.c:319:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	-16(%rbp), %rax	 ; token, tmp160
	movl	24(%rax), %eax	 ; token_88->type, _21
 ; D:\TC\src\parser.c:319:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, %eax	 ;, _21
	jne	.L109	 ;,
 ; D:\TC\src\parser.c:319:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp161
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.46_22
	movq	-16(%rbp), %rax	 ; token, tmp162
	movq	(%rax), %rax	 ; token_88->lexeme, _23
	movq	%rax, %rcx	 ; _23,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:319:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; _24
	je	.L109	 ;,
 ; D:\TC\src\parser.c:320:                 return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	jmp	.L103	 ;
.L109:
 ; D:\TC\src\parser.c:321:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	32(%rbp), %rcx	 ; parser, tmp163
	movq	24(%rbp), %rdx	 ; now_scope, tmp164
	movq	16(%rbp), %rax	 ; lexer, tmp165
	movq	%rcx, %r8	 ; tmp163,
	movq	%rax, %rcx	 ; tmp165,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:321:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; _25,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, -8(%rbp)	 ; tmp166, statement
	jmp	.L107	 ;
.L108:
 ; D:\TC\src\parser.c:322:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	movq	.refptr.BREAK_KEYWORD(%rip), %rax	 ;, tmp167
	movq	(%rax), %rdx	 ; BREAK_KEYWORD, BREAK_KEYWORD.47_26
	movq	-16(%rbp), %rax	 ; token, tmp168
	movq	(%rax), %rax	 ; token_60->lexeme, _27
	movq	%rax, %rcx	 ; _27,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:322:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	 ; _28
	je	.L110	 ;,
 ; D:\TC\src\parser.c:323:             if (!parser->in_loop) {
	movq	32(%rbp), %rax	 ; parser, tmp169
	movzbl	10(%rax), %eax	 ; parser_63(D)->in_loop, _29
 ; D:\TC\src\parser.c:323:             if (!parser->in_loop) {
	testb	%al, %al	 ; _29
	jne	.L111	 ;,
 ; D:\TC\src\parser.c:324:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp170
	movq	(%rax), %rax	 ; parser_63(D)->source_file, _30
	movq	%rax, %rcx	 ; _30,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _31
 ; D:\TC\src\parser.c:324:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	 ; token, tmp171
	movq	%rdx, %r8	 ; _31,
	movq	%rax, %rdx	 ; tmp171,
	leaq	.LC42(%rip), %rax	 ;, tmp172
	movq	%rax, %rcx	 ; tmp172,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:325:                 return NULL;
	movl	$0, %eax	 ;, _49
	jmp	.L103	 ;
.L111:
 ; D:\TC\src\parser.c:327:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$6, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, -8(%rbp)	 ; tmp173, statement
	jmp	.L107	 ;
.L110:
 ; D:\TC\src\parser.c:328:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax	 ;, tmp174
	movq	(%rax), %rdx	 ; CONTINUE_KEYWORD, CONTINUE_KEYWORD.48_32
	movq	-16(%rbp), %rax	 ; token, tmp175
	movq	(%rax), %rax	 ; token_60->lexeme, _33
	movq	%rax, %rcx	 ; _33,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:328:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	 ; _34
	je	.L112	 ;,
 ; D:\TC\src\parser.c:329:             if (!parser->in_loop) {
	movq	32(%rbp), %rax	 ; parser, tmp176
	movzbl	10(%rax), %eax	 ; parser_63(D)->in_loop, _35
 ; D:\TC\src\parser.c:329:             if (!parser->in_loop) {
	testb	%al, %al	 ; _35
	jne	.L113	 ;,
 ; D:\TC\src\parser.c:330:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp177
	movq	(%rax), %rax	 ; parser_63(D)->source_file, _36
	movq	%rax, %rcx	 ; _36,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _37
 ; D:\TC\src\parser.c:330:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	 ; token, tmp178
	movq	%rdx, %r8	 ; _37,
	movq	%rax, %rdx	 ; tmp178,
	leaq	.LC43(%rip), %rax	 ;, tmp179
	movq	%rax, %rcx	 ; tmp179,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:331:                 return NULL;
	movl	$0, %eax	 ;, _49
	jmp	.L103	 ;
.L113:
 ; D:\TC\src\parser.c:333:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$7, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, -8(%rbp)	 ; tmp180, statement
	jmp	.L107	 ;
.L112:
 ; D:\TC\src\parser.c:335:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	32(%rbp), %rcx	 ; parser, tmp181
	movq	24(%rbp), %rdx	 ; now_scope, tmp182
	movq	16(%rbp), %rax	 ; lexer, tmp183
	movq	%rcx, %r8	 ; tmp181,
	movq	%rax, %rcx	 ; tmp183,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:335:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; _38,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, -8(%rbp)	 ; tmp184, statement
	jmp	.L107	 ;
.L101:
 ; D:\TC\src\parser.c:337:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	32(%rbp), %rcx	 ; parser, tmp185
	movq	24(%rbp), %rdx	 ; now_scope, tmp186
	movq	16(%rbp), %rax	 ; lexer, tmp187
	movq	%rcx, %r8	 ; tmp185,
	movq	%rax, %rcx	 ; tmp187,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:337:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; _39,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, -8(%rbp)	 ; tmp188, statement
.L107:
 ; D:\TC\src\parser.c:338:     token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp189
	movq	%rax, %rcx	 ; tmp189,
	call	peek_current_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp190, token
 ; D:\TC\src\parser.c:339:     if (statement == NULL)
	cmpq	$0, -8(%rbp)	 ;, statement
	jne	.L114	 ;,
 ; D:\TC\src\parser.c:340:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp191
	movq	(%rax), %rax	 ; parser_63(D)->source_file, _40
	movq	%rax, %rcx	 ; _40,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _41
 ; D:\TC\src\parser.c:340:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	 ; token, tmp192
	movq	%rdx, %r8	 ; _41,
	movq	%rax, %rdx	 ; tmp192,
	leaq	.LC44(%rip), %rax	 ;, tmp193
	movq	%rax, %rcx	 ; tmp193,
	call	parser_error	 ;
.L114:
 ; D:\TC\src\parser.c:341:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp194
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp194,
	call	get_next_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp195, token
 ; D:\TC\src\parser.c:342:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	-16(%rbp), %rax	 ; token, tmp196
	movl	24(%rax), %eax	 ; token_113->type, _42
 ; D:\TC\src\parser.c:342:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, %eax	 ;, _42
	jne	.L115	 ;,
 ; D:\TC\src\parser.c:342:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp197
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.49_43
	movq	-16(%rbp), %rax	 ; token, tmp198
	movq	(%rax), %rax	 ; token_113->lexeme, _44
	movq	%rax, %rcx	 ; _44,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:342:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; _45
	jne	.L116	 ;,
.L115:
 ; D:\TC\src\parser.c:343:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp199
	movq	(%rax), %rax	 ; parser_63(D)->source_file, _46
	movq	%rax, %rcx	 ; _46,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _47
 ; D:\TC\src\parser.c:343:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	 ; token, tmp200
	movq	%rdx, %r8	 ; _47,
	movq	%rax, %rdx	 ; tmp200,
	leaq	.LC45(%rip), %rax	 ;, tmp201
	movq	%rax, %rcx	 ; tmp201,
	call	parser_error	 ;
.L116:
 ; D:\TC\src\parser.c:344:     return statement;
	movq	-8(%rbp), %rax	 ; statement, _49
.L103:
 ; D:\TC\src\parser.c:345: }
	leave	
	ret	
	.section .rdata,"dr"
.LC46:
	.ascii "Expected '(' after 'if'\0"
.LC47:
	.ascii "Failed to parse if condition\0"
	.align 8
.LC48:
	.ascii "Expected ')' after if condition\0"
.LC49:
	.ascii "Expected '{' to start if body\0"
	.align 8
.LC50:
	.ascii "Failed to parse if body statement\0"
.LC51:
	.ascii "Expected '(' after 'elif'\0"
	.align 8
.LC52:
	.ascii "Failed to parse else-if condition\0"
	.align 8
.LC53:
	.ascii "Expected ')' after else-if condition\0"
	.align 8
.LC54:
	.ascii "Expected '{' to start else-if body\0"
	.align 8
.LC55:
	.ascii "Failed to parse else-if body statement\0"
	.align 8
.LC56:
	.ascii "Expected '{' to start else body\0"
	.align 8
.LC57:
	.ascii "Failed to parse else body statement\0"
	.text
	.def	parse_if;	.scl	3;	.type	32;	.endef
parse_if:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$112, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:347:     Token* token = NULL;
	movq	$0, -8(%rbp)	 ;, token
 ; D:\TC\src\parser.c:348:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp157
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp157,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp158, token
 ; D:\TC\src\parser.c:349:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp159
	movl	24(%rax), %eax	 ; token_105->type, _1
 ; D:\TC\src\parser.c:349:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _1
	jne	.L118	 ;,
 ; D:\TC\src\parser.c:349:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp160
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.50_2
	movq	-8(%rbp), %rax	 ; token, tmp161
	movq	(%rax), %rax	 ; token_105->lexeme, _3
	movq	%rax, %rcx	 ; _3,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:349:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _4
	jne	.L119	 ;,
.L118:
 ; D:\TC\src\parser.c:350:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp162
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _5
	movq	%rax, %rcx	 ; _5,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _6
 ; D:\TC\src\parser.c:350:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp163
	movq	%rdx, %r8	 ; _6,
	movq	%rax, %rdx	 ; tmp163,
	leaq	.LC46(%rip), %rax	 ;, tmp164
	movq	%rax, %rcx	 ; tmp164,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:351:         return NULL;
	movl	$0, %eax	 ;, _78
	jmp	.L120	 ;
.L119:
 ; D:\TC\src\parser.c:353:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp165
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp165,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp166, token
 ; D:\TC\src\parser.c:354:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp167
	movq	24(%rbp), %rdx	 ; now_scope, tmp168
	movq	16(%rbp), %rax	 ; lexer, tmp169
	movq	%rcx, %r8	 ; tmp167,
	movq	%rax, %rcx	 ; tmp169,
	call	parse_expression	 ;
	movq	%rax, -16(%rbp)	 ; tmp170, condition
 ; D:\TC\src\parser.c:355:     if (condition == NULL)
	cmpq	$0, -16(%rbp)	 ;, condition
	jne	.L121	 ;,
 ; D:\TC\src\parser.c:356:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp171
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _7
	movq	%rax, %rcx	 ; _7,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _8
 ; D:\TC\src\parser.c:356:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp172
	movq	%rdx, %r8	 ; _8,
	movq	%rax, %rdx	 ; tmp172,
	leaq	.LC47(%rip), %rax	 ;, tmp173
	movq	%rax, %rcx	 ; tmp173,
	call	parser_error	 ;
.L121:
 ; D:\TC\src\parser.c:357:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp174
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp174,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp175, token
 ; D:\TC\src\parser.c:358:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp176
	movl	24(%rax), %eax	 ; token_116->type, _9
 ; D:\TC\src\parser.c:358:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _9
	jne	.L122	 ;,
 ; D:\TC\src\parser.c:358:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp177
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.51_10
	movq	-8(%rbp), %rax	 ; token, tmp178
	movq	(%rax), %rax	 ; token_116->lexeme, _11
	movq	%rax, %rcx	 ; _11,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:358:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _12
	jne	.L123	 ;,
.L122:
 ; D:\TC\src\parser.c:359:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp179
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _13
	movq	%rax, %rcx	 ; _13,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _14
 ; D:\TC\src\parser.c:359:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp180
	movq	%rdx, %r8	 ; _14,
	movq	%rax, %rdx	 ; tmp180,
	leaq	.LC48(%rip), %rax	 ;, tmp181
	movq	%rax, %rcx	 ; tmp181,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:360:         return NULL;
	movl	$0, %eax	 ;, _78
	jmp	.L120	 ;
.L123:
 ; D:\TC\src\parser.c:362:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp182
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp182,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp183, token
 ; D:\TC\src\parser.c:363:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp184
	movl	24(%rax), %eax	 ; token_119->type, _15
 ; D:\TC\src\parser.c:363:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _15
	jne	.L124	 ;,
 ; D:\TC\src\parser.c:363:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp185
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.52_16
	movq	-8(%rbp), %rax	 ; token, tmp186
	movq	(%rax), %rax	 ; token_119->lexeme, _17
	movq	%rax, %rcx	 ; _17,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:363:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _18
	jne	.L125	 ;,
.L124:
 ; D:\TC\src\parser.c:364:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp187
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _19
	movq	%rax, %rcx	 ; _19,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _20
 ; D:\TC\src\parser.c:364:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp188
	movq	%rdx, %r8	 ; _20,
	movq	%rax, %rdx	 ; tmp188,
	leaq	.LC49(%rip), %rax	 ;, tmp189
	movq	%rax, %rcx	 ; tmp189,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:365:         return NULL;
	movl	$0, %eax	 ;, _78
	jmp	.L120	 ;
.L125:
 ; D:\TC\src\parser.c:367:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, -24(%rbp)	 ; tmp190, body
 ; D:\TC\src\parser.c:368:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp191
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp191,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp192, token
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L126	 ;
.L128:
 ; D:\TC\src\parser.c:370:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp193
	movq	24(%rbp), %rdx	 ; now_scope, tmp194
	movq	16(%rbp), %rax	 ; lexer, tmp195
	movq	%rcx, %r8	 ; tmp193,
	movq	%rax, %rcx	 ; tmp195,
	call	parse_statement	 ;
	movq	%rax, -80(%rbp)	 ; tmp196, statement
 ; D:\TC\src\parser.c:371:         if (statement == NULL)
	cmpq	$0, -80(%rbp)	 ;, statement
	jne	.L127	 ;,
 ; D:\TC\src\parser.c:372:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp197
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _21
	movq	%rax, %rcx	 ; _21,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _22
 ; D:\TC\src\parser.c:372:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp198
	movq	%rdx, %r8	 ; _22,
	movq	%rax, %rdx	 ; tmp198,
	leaq	.LC50(%rip), %rax	 ;, tmp199
	movq	%rax, %rcx	 ; tmp199,
	call	parser_error	 ;
.L127:
 ; D:\TC\src\parser.c:373:         list_append(body, (pointer)statement);
	movq	-80(%rbp), %rdx	 ; statement, tmp200
	movq	-24(%rbp), %rax	 ; body, tmp201
	movq	%rax, %rcx	 ; tmp201,
	call	list_append	 ;
 ; D:\TC\src\parser.c:374:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp202
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp202,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp203, token
.L126:
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp204
	movl	24(%rax), %eax	 ; token_74->type, _23
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _23
	jne	.L128	 ;,
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp205
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.53_24
	movq	-8(%rbp), %rax	 ; token, tmp206
	movq	(%rax), %rax	 ; token_74->lexeme, _25
	movq	%rax, %rcx	 ; _25,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _26
	je	.L128	 ;,
 ; D:\TC\src\parser.c:376:     list(ElseIf*) else_if = create_list();
	call	create_list	 ;
	movq	%rax, -32(%rbp)	 ; tmp207, else_if
 ; D:\TC\src\parser.c:377:     list(Statement*) else_body = create_list();
	call	create_list	 ;
	movq	%rax, -40(%rbp)	 ; tmp208, else_body
 ; D:\TC\src\parser.c:378:     token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp209
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp209,
	call	peek_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp210, token
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	jmp	.L129	 ;
.L141:
 ; D:\TC\src\parser.c:380:         token = get_next_token(lexer, true);  // consume 'elif'
	movq	16(%rbp), %rax	 ; lexer, tmp211
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp211,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp212, token
 ; D:\TC\src\parser.c:381:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp213
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp213,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp214, token
 ; D:\TC\src\parser.c:382:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp215
	movl	24(%rax), %eax	 ; token_136->type, _27
 ; D:\TC\src\parser.c:382:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _27
	jne	.L130	 ;,
 ; D:\TC\src\parser.c:382:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp216
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.54_28
	movq	-8(%rbp), %rax	 ; token, tmp217
	movq	(%rax), %rax	 ; token_136->lexeme, _29
	movq	%rax, %rcx	 ; _29,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:382:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _30
	jne	.L131	 ;,
.L130:
 ; D:\TC\src\parser.c:383:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp218
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _31
	movq	%rax, %rcx	 ; _31,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _32
 ; D:\TC\src\parser.c:383:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp219
	movq	%rdx, %r8	 ; _32,
	movq	%rax, %rdx	 ; tmp219,
	leaq	.LC51(%rip), %rax	 ;, tmp220
	movq	%rax, %rcx	 ; tmp220,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:384:             return NULL;
	movl	$0, %eax	 ;, _78
	jmp	.L120	 ;
.L131:
 ; D:\TC\src\parser.c:386:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp221
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp221,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp222, token
 ; D:\TC\src\parser.c:387:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp223
	movq	24(%rbp), %rdx	 ; now_scope, tmp224
	movq	16(%rbp), %rax	 ; lexer, tmp225
	movq	%rcx, %r8	 ; tmp223,
	movq	%rax, %rcx	 ; tmp225,
	call	parse_expression	 ;
	movq	%rax, -48(%rbp)	 ; tmp226, elif_condition
 ; D:\TC\src\parser.c:388:         if (elif_condition == NULL)
	cmpq	$0, -48(%rbp)	 ;, elif_condition
	jne	.L132	 ;,
 ; D:\TC\src\parser.c:389:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp227
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _33
	movq	%rax, %rcx	 ; _33,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _34
 ; D:\TC\src\parser.c:389:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp228
	movq	%rdx, %r8	 ; _34,
	movq	%rax, %rdx	 ; tmp228,
	leaq	.LC52(%rip), %rax	 ;, tmp229
	movq	%rax, %rcx	 ; tmp229,
	call	parser_error	 ;
.L132:
 ; D:\TC\src\parser.c:390:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp230
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp230,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp231, token
 ; D:\TC\src\parser.c:391:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp232
	movl	24(%rax), %eax	 ; token_145->type, _35
 ; D:\TC\src\parser.c:391:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _35
	jne	.L133	 ;,
 ; D:\TC\src\parser.c:391:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp233
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.55_36
	movq	-8(%rbp), %rax	 ; token, tmp234
	movq	(%rax), %rax	 ; token_145->lexeme, _37
	movq	%rax, %rcx	 ; _37,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:391:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _38
	jne	.L134	 ;,
.L133:
 ; D:\TC\src\parser.c:392:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp235
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _39
	movq	%rax, %rcx	 ; _39,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _40
 ; D:\TC\src\parser.c:392:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp236
	movq	%rdx, %r8	 ; _40,
	movq	%rax, %rdx	 ; tmp236,
	leaq	.LC53(%rip), %rax	 ;, tmp237
	movq	%rax, %rcx	 ; tmp237,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:393:             return NULL;
	movl	$0, %eax	 ;, _78
	jmp	.L120	 ;
.L134:
 ; D:\TC\src\parser.c:395:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp238
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp238,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp239, token
 ; D:\TC\src\parser.c:396:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp240
	movl	24(%rax), %eax	 ; token_148->type, _41
 ; D:\TC\src\parser.c:396:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _41
	jne	.L135	 ;,
 ; D:\TC\src\parser.c:396:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp241
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.56_42
	movq	-8(%rbp), %rax	 ; token, tmp242
	movq	(%rax), %rax	 ; token_148->lexeme, _43
	movq	%rax, %rcx	 ; _43,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:396:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _44
	jne	.L136	 ;,
.L135:
 ; D:\TC\src\parser.c:397:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp243
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _45
	movq	%rax, %rcx	 ; _45,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _46
 ; D:\TC\src\parser.c:397:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp244
	movq	%rdx, %r8	 ; _46,
	movq	%rax, %rdx	 ; tmp244,
	leaq	.LC54(%rip), %rax	 ;, tmp245
	movq	%rax, %rcx	 ; tmp245,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:398:             return NULL;
	movl	$0, %eax	 ;, _78
	jmp	.L120	 ;
.L136:
 ; D:\TC\src\parser.c:400:         list(Statement*) elif_body = create_list();
	call	create_list	 ;
	movq	%rax, -56(%rbp)	 ; tmp246, elif_body
 ; D:\TC\src\parser.c:401:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp247
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp247,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp248, token
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L137	 ;
.L139:
 ; D:\TC\src\parser.c:403:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp249
	movq	24(%rbp), %rdx	 ; now_scope, tmp250
	movq	16(%rbp), %rax	 ; lexer, tmp251
	movq	%rcx, %r8	 ; tmp249,
	movq	%rax, %rcx	 ; tmp251,
	call	parse_statement	 ;
	movq	%rax, -64(%rbp)	 ; tmp252, statement
 ; D:\TC\src\parser.c:404:             if (statement == NULL)
	cmpq	$0, -64(%rbp)	 ;, statement
	jne	.L138	 ;,
 ; D:\TC\src\parser.c:405:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp253
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _47
	movq	%rax, %rcx	 ; _47,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _48
 ; D:\TC\src\parser.c:405:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp254
	movq	%rdx, %r8	 ; _48,
	movq	%rax, %rdx	 ; tmp254,
	leaq	.LC55(%rip), %rax	 ;, tmp255
	movq	%rax, %rcx	 ; tmp255,
	call	parser_error	 ;
.L138:
 ; D:\TC\src\parser.c:406:             list_append(elif_body, (pointer)statement);
	movq	-64(%rbp), %rdx	 ; statement, tmp256
	movq	-56(%rbp), %rax	 ; elif_body, tmp257
	movq	%rax, %rcx	 ; tmp257,
	call	list_append	 ;
 ; D:\TC\src\parser.c:407:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp258
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp258,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp259, token
.L137:
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp260
	movl	24(%rax), %eax	 ; token_75->type, _49
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _49
	jne	.L139	 ;,
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp261
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.57_50
	movq	-8(%rbp), %rax	 ; token, tmp262
	movq	(%rax), %rax	 ; token_75->lexeme, _51
	movq	%rax, %rcx	 ; _51,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _52
	je	.L139	 ;,
 ; D:\TC\src\parser.c:409:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	-56(%rbp), %rdx	 ; elif_body, tmp263
	movq	-48(%rbp), %rax	 ; elif_condition, tmp264
	movq	%rax, %rcx	 ; tmp264,
	call	create_else_if	 ;
	movq	%rax, %rdx	 ;, _53
 ; D:\TC\src\parser.c:409:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	-32(%rbp), %rax	 ; else_if, tmp265
	movq	%rax, %rcx	 ; tmp265,
	call	list_append	 ;
 ; D:\TC\src\parser.c:410:         token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp266
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp266,
	call	peek_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp267, token
.L129:
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	movq	-8(%rbp), %rax	 ; token, tmp268
	movl	24(%rax), %eax	 ; token_76->type, _54
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, %eax	 ;, _54
	jne	.L140	 ;,
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	movq	.refptr.ELIF_KEYWORD(%rip), %rax	 ;, tmp269
	movq	(%rax), %rdx	 ; ELIF_KEYWORD, ELIF_KEYWORD.58_55
	movq	-8(%rbp), %rax	 ; token, tmp270
	movq	(%rax), %rax	 ; token_76->lexeme, _56
	movq	%rax, %rcx	 ; _56,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	 ; _57
	jne	.L141	 ;,
.L140:
 ; D:\TC\src\parser.c:412:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	movq	-8(%rbp), %rax	 ; token, tmp271
	movl	24(%rax), %eax	 ; token_76->type, _58
 ; D:\TC\src\parser.c:412:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _58
	jne	.L142	 ;,
 ; D:\TC\src\parser.c:412:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	movq	.refptr.ELSE_KEYWORD(%rip), %rax	 ;, tmp272
	movq	(%rax), %rdx	 ; ELSE_KEYWORD, ELSE_KEYWORD.59_59
	movq	-8(%rbp), %rax	 ; token, tmp273
	movq	(%rax), %rax	 ; token_76->lexeme, _60
	movq	%rax, %rcx	 ; _60,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:412:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	 ; _61
	je	.L142	 ;,
 ; D:\TC\src\parser.c:413:         token = get_next_token(lexer, true);  // consume 'else'
	movq	16(%rbp), %rax	 ; lexer, tmp274
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp274,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp275, token
 ; D:\TC\src\parser.c:414:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp276
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp276,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp277, token
 ; D:\TC\src\parser.c:415:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp278
	movl	24(%rax), %eax	 ; token_179->type, _62
 ; D:\TC\src\parser.c:415:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _62
	jne	.L143	 ;,
 ; D:\TC\src\parser.c:415:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp279
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.60_63
	movq	-8(%rbp), %rax	 ; token, tmp280
	movq	(%rax), %rax	 ; token_179->lexeme, _64
	movq	%rax, %rcx	 ; _64,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:415:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _65
	jne	.L144	 ;,
.L143:
 ; D:\TC\src\parser.c:416:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp281
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _66
	movq	%rax, %rcx	 ; _66,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _67
 ; D:\TC\src\parser.c:416:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp282
	movq	%rdx, %r8	 ; _67,
	movq	%rax, %rdx	 ; tmp282,
	leaq	.LC56(%rip), %rax	 ;, tmp283
	movq	%rax, %rcx	 ; tmp283,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:417:             return NULL;
	movl	$0, %eax	 ;, _78
	jmp	.L120	 ;
.L144:
 ; D:\TC\src\parser.c:419:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp284
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp284,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp285, token
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L145	 ;
.L147:
 ; D:\TC\src\parser.c:421:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp286
	movq	24(%rbp), %rdx	 ; now_scope, tmp287
	movq	16(%rbp), %rax	 ; lexer, tmp288
	movq	%rcx, %r8	 ; tmp286,
	movq	%rax, %rcx	 ; tmp288,
	call	parse_statement	 ;
	movq	%rax, -72(%rbp)	 ; tmp289, statement
 ; D:\TC\src\parser.c:422:             if (statement == NULL)
	cmpq	$0, -72(%rbp)	 ;, statement
	jne	.L146	 ;,
 ; D:\TC\src\parser.c:423:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp290
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _68
	movq	%rax, %rcx	 ; _68,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _69
 ; D:\TC\src\parser.c:423:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp291
	movq	%rdx, %r8	 ; _69,
	movq	%rax, %rdx	 ; tmp291,
	leaq	.LC57(%rip), %rax	 ;, tmp292
	movq	%rax, %rcx	 ; tmp292,
	call	parser_error	 ;
.L146:
 ; D:\TC\src\parser.c:424:             list_append(else_body, (pointer)statement);
	movq	-72(%rbp), %rdx	 ; statement, tmp293
	movq	-40(%rbp), %rax	 ; else_body, tmp294
	movq	%rax, %rcx	 ; tmp294,
	call	list_append	 ;
 ; D:\TC\src\parser.c:425:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp295
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp295,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp296, token
.L145:
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp297
	movl	24(%rax), %eax	 ; token_77->type, _70
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _70
	jne	.L147	 ;,
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp298
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.61_71
	movq	-8(%rbp), %rax	 ; token, tmp299
	movq	(%rax), %rax	 ; token_77->lexeme, _72
	movq	%rax, %rcx	 ; _72,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _73
	je	.L147	 ;,
.L142:
 ; D:\TC\src\parser.c:428:     token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp300
	movq	%rax, %rcx	 ; tmp300,
	call	peek_current_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp301, token
 ; D:\TC\src\parser.c:429:     return create_if(condition, body, else_if, else_body);
	movq	-40(%rbp), %r8	 ; else_body, tmp302
	movq	-32(%rbp), %rcx	 ; else_if, tmp303
	movq	-24(%rbp), %rdx	 ; body, tmp304
	movq	-16(%rbp), %rax	 ; condition, tmp305
	movq	%r8, %r9	 ; tmp302,
	movq	%rcx, %r8	 ; tmp303,
	movq	%rax, %rcx	 ; tmp305,
	call	create_if	 ;
.L120:
 ; D:\TC\src\parser.c:430: }
	leave	
	ret	
	.section .rdata,"dr"
.LC58:
	.ascii "Expected '(' after 'for'\0"
	.align 8
.LC59:
	.ascii "Failed to parse for loop initializer\0"
	.align 8
.LC60:
	.ascii "Expected ';' after for loop initializer\0"
	.align 8
.LC61:
	.ascii "Failed to parse for loop condition\0"
	.align 8
.LC62:
	.ascii "Expected ';' after for loop condition\0"
	.align 8
.LC63:
	.ascii "Failed to parse for loop increment\0"
	.align 8
.LC64:
	.ascii "Expected ')' after for loop increment\0"
	.align 8
.LC65:
	.ascii "Expected '{' to start for loop body\0"
	.align 8
.LC66:
	.ascii "Failed to parse for loop body statement\0"
	.text
	.def	parse_for;	.scl	3;	.type	32;	.endef
parse_for:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$80, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:432:     Token* token = NULL;
	movq	$0, -8(%rbp)	 ;, token
 ; D:\TC\src\parser.c:433:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp138
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp138,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp139, token
 ; D:\TC\src\parser.c:434:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp140
	movl	24(%rax), %eax	 ; token_85->type, _1
 ; D:\TC\src\parser.c:434:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _1
	jne	.L149	 ;,
 ; D:\TC\src\parser.c:434:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp141
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.62_2
	movq	-8(%rbp), %rax	 ; token, tmp142
	movq	(%rax), %rax	 ; token_85->lexeme, _3
	movq	%rax, %rcx	 ; _3,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:434:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _4
	jne	.L150	 ;,
.L149:
 ; D:\TC\src\parser.c:435:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp143
	movq	(%rax), %rax	 ; parser_92(D)->source_file, _5
	movq	%rax, %rcx	 ; _5,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _6
 ; D:\TC\src\parser.c:435:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp144
	movq	%rdx, %r8	 ; _6,
	movq	%rax, %rdx	 ; tmp144,
	leaq	.LC58(%rip), %rax	 ;, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:436:         return NULL;
	movl	$0, %eax	 ;, _62
	jmp	.L151	 ;
.L150:
 ; D:\TC\src\parser.c:438:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp146
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp146,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp147, token
 ; D:\TC\src\parser.c:439:     Variable* initializer = NULL;
	movq	$0, -16(%rbp)	 ;, initializer
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp148
	movl	24(%rax), %eax	 ; token_88->type, _7
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	 ;, _7
	jne	.L152	 ;,
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp149
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.63_8
	movq	-8(%rbp), %rax	 ; token, tmp150
	movq	(%rax), %rax	 ; token_88->lexeme, _9
	movq	%rax, %rcx	 ; _9,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; _10
	jne	.L153	 ;,
.L152:
 ; D:\TC\src\parser.c:441:         initializer = parse_variable(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp151
	movq	24(%rbp), %rdx	 ; now_scope, tmp152
	movq	16(%rbp), %rax	 ; lexer, tmp153
	movq	%rcx, %r8	 ; tmp151,
	movq	%rax, %rcx	 ; tmp153,
	call	parse_variable	 ;
	movq	%rax, -16(%rbp)	 ; tmp154, initializer
 ; D:\TC\src\parser.c:442:         if (initializer == NULL)
	cmpq	$0, -16(%rbp)	 ;, initializer
	jne	.L154	 ;,
 ; D:\TC\src\parser.c:443:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp155
	movq	(%rax), %rax	 ; parser_92(D)->source_file, _11
	movq	%rax, %rcx	 ; _11,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _12
 ; D:\TC\src\parser.c:443:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp156
	movq	%rdx, %r8	 ; _12,
	movq	%rax, %rdx	 ; tmp156,
	leaq	.LC59(%rip), %rax	 ;, tmp157
	movq	%rax, %rcx	 ; tmp157,
	call	parser_error	 ;
.L154:
 ; D:\TC\src\parser.c:444:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp158
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp158,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp159, token
.L153:
 ; D:\TC\src\parser.c:446:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp160
	movl	24(%rax), %eax	 ; token_55->type, _13
 ; D:\TC\src\parser.c:446:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	 ;, _13
	jne	.L155	 ;,
 ; D:\TC\src\parser.c:446:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp161
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.64_14
	movq	-8(%rbp), %rax	 ; token, tmp162
	movq	(%rax), %rax	 ; token_55->lexeme, _15
	movq	%rax, %rcx	 ; _15,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:446:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; _16
	jne	.L156	 ;,
.L155:
 ; D:\TC\src\parser.c:447:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp163
	movq	(%rax), %rax	 ; parser_92(D)->source_file, _17
	movq	%rax, %rcx	 ; _17,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _18
 ; D:\TC\src\parser.c:447:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp164
	movq	%rdx, %r8	 ; _18,
	movq	%rax, %rdx	 ; tmp164,
	leaq	.LC60(%rip), %rax	 ;, tmp165
	movq	%rax, %rcx	 ; tmp165,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:448:         return NULL;
	movl	$0, %eax	 ;, _62
	jmp	.L151	 ;
.L156:
 ; D:\TC\src\parser.c:450:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp166
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp166,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp167, token
 ; D:\TC\src\parser.c:451:     Expression* condition = NULL;
	movq	$0, -24(%rbp)	 ;, condition
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp168
	movl	24(%rax), %eax	 ; token_101->type, _19
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	 ;, _19
	jne	.L157	 ;,
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp169
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.65_20
	movq	-8(%rbp), %rax	 ; token, tmp170
	movq	(%rax), %rax	 ; token_101->lexeme, _21
	movq	%rax, %rcx	 ; _21,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; _22
	jne	.L158	 ;,
.L157:
 ; D:\TC\src\parser.c:453:         condition = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp171
	movq	24(%rbp), %rdx	 ; now_scope, tmp172
	movq	16(%rbp), %rax	 ; lexer, tmp173
	movq	%rcx, %r8	 ; tmp171,
	movq	%rax, %rcx	 ; tmp173,
	call	parse_expression	 ;
	movq	%rax, -24(%rbp)	 ; tmp174, condition
 ; D:\TC\src\parser.c:454:         if (condition == NULL)
	cmpq	$0, -24(%rbp)	 ;, condition
	jne	.L159	 ;,
 ; D:\TC\src\parser.c:455:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp175
	movq	(%rax), %rax	 ; parser_92(D)->source_file, _23
	movq	%rax, %rcx	 ; _23,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _24
 ; D:\TC\src\parser.c:455:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp176
	movq	%rdx, %r8	 ; _24,
	movq	%rax, %rdx	 ; tmp176,
	leaq	.LC61(%rip), %rax	 ;, tmp177
	movq	%rax, %rcx	 ; tmp177,
	call	parser_error	 ;
.L159:
 ; D:\TC\src\parser.c:456:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp178
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp178,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp179, token
.L158:
 ; D:\TC\src\parser.c:458:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp180
	movl	24(%rax), %eax	 ; token_56->type, _25
 ; D:\TC\src\parser.c:458:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	 ;, _25
	jne	.L160	 ;,
 ; D:\TC\src\parser.c:458:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp181
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.66_26
	movq	-8(%rbp), %rax	 ; token, tmp182
	movq	(%rax), %rax	 ; token_56->lexeme, _27
	movq	%rax, %rcx	 ; _27,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:458:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; _28
	jne	.L161	 ;,
.L160:
 ; D:\TC\src\parser.c:459:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp183
	movq	(%rax), %rax	 ; parser_92(D)->source_file, _29
	movq	%rax, %rcx	 ; _29,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _30
 ; D:\TC\src\parser.c:459:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp184
	movq	%rdx, %r8	 ; _30,
	movq	%rax, %rdx	 ; tmp184,
	leaq	.LC62(%rip), %rax	 ;, tmp185
	movq	%rax, %rcx	 ; tmp185,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:460:         return NULL;
	movl	$0, %eax	 ;, _62
	jmp	.L151	 ;
.L161:
 ; D:\TC\src\parser.c:462:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp186
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp186,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp187, token
 ; D:\TC\src\parser.c:463:     Expression* increment = NULL;
	movq	$0, -32(%rbp)	 ;, increment
 ; D:\TC\src\parser.c:464:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp188
	movl	24(%rax), %eax	 ; token_112->type, _31
 ; D:\TC\src\parser.c:464:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _31
	jne	.L162	 ;,
 ; D:\TC\src\parser.c:464:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp189
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.67_32
	movq	-8(%rbp), %rax	 ; token, tmp190
	movq	(%rax), %rax	 ; token_112->lexeme, _33
	movq	%rax, %rcx	 ; _33,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:464:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _34
	jne	.L163	 ;,
.L162:
 ; D:\TC\src\parser.c:465:         increment = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp191
	movq	24(%rbp), %rdx	 ; now_scope, tmp192
	movq	16(%rbp), %rax	 ; lexer, tmp193
	movq	%rcx, %r8	 ; tmp191,
	movq	%rax, %rcx	 ; tmp193,
	call	parse_expression	 ;
	movq	%rax, -32(%rbp)	 ; tmp194, increment
 ; D:\TC\src\parser.c:466:         if (increment == NULL)
	cmpq	$0, -32(%rbp)	 ;, increment
	jne	.L164	 ;,
 ; D:\TC\src\parser.c:467:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp195
	movq	(%rax), %rax	 ; parser_92(D)->source_file, _35
	movq	%rax, %rcx	 ; _35,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _36
 ; D:\TC\src\parser.c:467:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp196
	movq	%rdx, %r8	 ; _36,
	movq	%rax, %rdx	 ; tmp196,
	leaq	.LC63(%rip), %rax	 ;, tmp197
	movq	%rax, %rcx	 ; tmp197,
	call	parser_error	 ;
.L164:
 ; D:\TC\src\parser.c:468:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp198
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp198,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp199, token
.L163:
 ; D:\TC\src\parser.c:470:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp200
	movl	24(%rax), %eax	 ; token_57->type, _37
 ; D:\TC\src\parser.c:470:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _37
	jne	.L165	 ;,
 ; D:\TC\src\parser.c:470:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp201
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.68_38
	movq	-8(%rbp), %rax	 ; token, tmp202
	movq	(%rax), %rax	 ; token_57->lexeme, _39
	movq	%rax, %rcx	 ; _39,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:470:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _40
	jne	.L166	 ;,
.L165:
 ; D:\TC\src\parser.c:471:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp203
	movq	(%rax), %rax	 ; parser_92(D)->source_file, _41
	movq	%rax, %rcx	 ; _41,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _42
 ; D:\TC\src\parser.c:471:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp204
	movq	%rdx, %r8	 ; _42,
	movq	%rax, %rdx	 ; tmp204,
	leaq	.LC64(%rip), %rax	 ;, tmp205
	movq	%rax, %rcx	 ; tmp205,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:472:         return NULL;
	movl	$0, %eax	 ;, _62
	jmp	.L151	 ;
.L166:
 ; D:\TC\src\parser.c:474:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp206
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp206,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp207, token
 ; D:\TC\src\parser.c:475:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp208
	movl	24(%rax), %eax	 ; token_123->type, _43
 ; D:\TC\src\parser.c:475:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _43
	jne	.L167	 ;,
 ; D:\TC\src\parser.c:475:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp209
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.69_44
	movq	-8(%rbp), %rax	 ; token, tmp210
	movq	(%rax), %rax	 ; token_123->lexeme, _45
	movq	%rax, %rcx	 ; _45,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:475:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _46
	jne	.L168	 ;,
.L167:
 ; D:\TC\src\parser.c:476:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp211
	movq	(%rax), %rax	 ; parser_92(D)->source_file, _47
	movq	%rax, %rcx	 ; _47,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _48
 ; D:\TC\src\parser.c:476:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp212
	movq	%rdx, %r8	 ; _48,
	movq	%rax, %rdx	 ; tmp212,
	leaq	.LC65(%rip), %rax	 ;, tmp213
	movq	%rax, %rcx	 ; tmp213,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:477:         return NULL;
	movl	$0, %eax	 ;, _62
	jmp	.L151	 ;
.L168:
 ; D:\TC\src\parser.c:479:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, -40(%rbp)	 ; tmp214, body
 ; D:\TC\src\parser.c:480:     parser->in_loop = true;
	movq	32(%rbp), %rax	 ; parser, tmp215
	movb	$1, 10(%rax)	 ;, parser_92(D)->in_loop
 ; D:\TC\src\parser.c:481:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp216
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp216,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp217, token
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L169	 ;
.L171:
 ; D:\TC\src\parser.c:483:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp218
	movq	24(%rbp), %rdx	 ; now_scope, tmp219
	movq	16(%rbp), %rax	 ; lexer, tmp220
	movq	%rcx, %r8	 ; tmp218,
	movq	%rax, %rcx	 ; tmp220,
	call	parse_statement	 ;
	movq	%rax, -48(%rbp)	 ; tmp221, statement
 ; D:\TC\src\parser.c:484:         if (statement == NULL)
	cmpq	$0, -48(%rbp)	 ;, statement
	jne	.L170	 ;,
 ; D:\TC\src\parser.c:485:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp222
	movq	(%rax), %rax	 ; parser_92(D)->source_file, _49
	movq	%rax, %rcx	 ; _49,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _50
 ; D:\TC\src\parser.c:485:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp223
	movq	%rdx, %r8	 ; _50,
	movq	%rax, %rdx	 ; tmp223,
	leaq	.LC66(%rip), %rax	 ;, tmp224
	movq	%rax, %rcx	 ; tmp224,
	call	parser_error	 ;
.L170:
 ; D:\TC\src\parser.c:486:         list_append(body, (pointer)statement);
	movq	-48(%rbp), %rdx	 ; statement, tmp225
	movq	-40(%rbp), %rax	 ; body, tmp226
	movq	%rax, %rcx	 ; tmp226,
	call	list_append	 ;
 ; D:\TC\src\parser.c:487:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp227
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp227,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp228, token
.L169:
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp229
	movl	24(%rax), %eax	 ; token_58->type, _51
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _51
	jne	.L171	 ;,
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp230
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.70_52
	movq	-8(%rbp), %rax	 ; token, tmp231
	movq	(%rax), %rax	 ; token_58->lexeme, _53
	movq	%rax, %rcx	 ; _53,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _54
	je	.L171	 ;,
 ; D:\TC\src\parser.c:489:     parser->in_loop = false;
	movq	32(%rbp), %rax	 ; parser, tmp232
	movb	$0, 10(%rax)	 ;, parser_92(D)->in_loop
 ; D:\TC\src\parser.c:490:     return create_for(initializer, condition, increment, body);
	movq	-40(%rbp), %r8	 ; body, tmp233
	movq	-32(%rbp), %rcx	 ; increment, tmp234
	movq	-24(%rbp), %rdx	 ; condition, tmp235
	movq	-16(%rbp), %rax	 ; initializer, tmp236
	movq	%r8, %r9	 ; tmp233,
	movq	%rcx, %r8	 ; tmp234,
	movq	%rax, %rcx	 ; tmp236,
	call	create_for	 ;
.L151:
 ; D:\TC\src\parser.c:491: }
	leave	
	ret	
	.section .rdata,"dr"
.LC67:
	.ascii "Expected '(' after 'while'\0"
	.align 8
.LC68:
	.ascii "Failed to parse while condition\0"
	.align 8
.LC69:
	.ascii "Expected ')' after while condition\0"
	.align 8
.LC70:
	.ascii "Expected '{' to start while body\0"
	.align 8
.LC71:
	.ascii "Failed to parse while body statement\0"
	.text
	.def	parse_while;	.scl	3;	.type	32;	.endef
parse_while:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$64, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:493:     Token* token = NULL;
	movq	$0, -8(%rbp)	 ;, token
 ; D:\TC\src\parser.c:494:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp110
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp110,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp111, token
 ; D:\TC\src\parser.c:495:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp112
	movl	24(%rax), %eax	 ; token_41->type, _1
 ; D:\TC\src\parser.c:495:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _1
	jne	.L173	 ;,
 ; D:\TC\src\parser.c:495:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp113
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.71_2
	movq	-8(%rbp), %rax	 ; token, tmp114
	movq	(%rax), %rax	 ; token_41->lexeme, _3
	movq	%rax, %rcx	 ; _3,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:495:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _4
	jne	.L174	 ;,
.L173:
 ; D:\TC\src\parser.c:496:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp115
	movq	(%rax), %rax	 ; parser_46(D)->source_file, _5
	movq	%rax, %rcx	 ; _5,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _6
 ; D:\TC\src\parser.c:496:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp116
	movq	%rdx, %r8	 ; _6,
	movq	%rax, %rdx	 ; tmp116,
	leaq	.LC67(%rip), %rax	 ;, tmp117
	movq	%rax, %rcx	 ; tmp117,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:497:         return NULL;
	movl	$0, %eax	 ;, _28
	jmp	.L175	 ;
.L174:
 ; D:\TC\src\parser.c:499:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp118
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp118,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp119, token
 ; D:\TC\src\parser.c:500:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp120
	movq	24(%rbp), %rdx	 ; now_scope, tmp121
	movq	16(%rbp), %rax	 ; lexer, tmp122
	movq	%rcx, %r8	 ; tmp120,
	movq	%rax, %rcx	 ; tmp122,
	call	parse_expression	 ;
	movq	%rax, -16(%rbp)	 ; tmp123, condition
 ; D:\TC\src\parser.c:501:     if (condition == NULL)
	cmpq	$0, -16(%rbp)	 ;, condition
	jne	.L176	 ;,
 ; D:\TC\src\parser.c:502:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp124
	movq	(%rax), %rax	 ; parser_46(D)->source_file, _7
	movq	%rax, %rcx	 ; _7,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _8
 ; D:\TC\src\parser.c:502:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp125
	movq	%rdx, %r8	 ; _8,
	movq	%rax, %rdx	 ; tmp125,
	leaq	.LC68(%rip), %rax	 ;, tmp126
	movq	%rax, %rcx	 ; tmp126,
	call	parser_error	 ;
.L176:
 ; D:\TC\src\parser.c:503:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp127
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp127,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp128, token
 ; D:\TC\src\parser.c:504:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp129
	movl	24(%rax), %eax	 ; token_52->type, _9
 ; D:\TC\src\parser.c:504:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _9
	jne	.L177	 ;,
 ; D:\TC\src\parser.c:504:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp130
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.72_10
	movq	-8(%rbp), %rax	 ; token, tmp131
	movq	(%rax), %rax	 ; token_52->lexeme, _11
	movq	%rax, %rcx	 ; _11,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:504:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _12
	jne	.L178	 ;,
.L177:
 ; D:\TC\src\parser.c:505:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp132
	movq	(%rax), %rax	 ; parser_46(D)->source_file, _13
	movq	%rax, %rcx	 ; _13,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _14
 ; D:\TC\src\parser.c:505:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp133
	movq	%rdx, %r8	 ; _14,
	movq	%rax, %rdx	 ; tmp133,
	leaq	.LC69(%rip), %rax	 ;, tmp134
	movq	%rax, %rcx	 ; tmp134,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:506:         return NULL;
	movl	$0, %eax	 ;, _28
	jmp	.L175	 ;
.L178:
 ; D:\TC\src\parser.c:508:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp135
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp135,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp136, token
 ; D:\TC\src\parser.c:509:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp137
	movl	24(%rax), %eax	 ; token_55->type, _15
 ; D:\TC\src\parser.c:509:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _15
	jne	.L179	 ;,
 ; D:\TC\src\parser.c:509:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp138
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.73_16
	movq	-8(%rbp), %rax	 ; token, tmp139
	movq	(%rax), %rax	 ; token_55->lexeme, _17
	movq	%rax, %rcx	 ; _17,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:509:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _18
	jne	.L180	 ;,
.L179:
 ; D:\TC\src\parser.c:510:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp140
	movq	(%rax), %rax	 ; parser_46(D)->source_file, _19
	movq	%rax, %rcx	 ; _19,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _20
 ; D:\TC\src\parser.c:510:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp141
	movq	%rdx, %r8	 ; _20,
	movq	%rax, %rdx	 ; tmp141,
	leaq	.LC70(%rip), %rax	 ;, tmp142
	movq	%rax, %rcx	 ; tmp142,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:511:         return NULL;
	movl	$0, %eax	 ;, _28
	jmp	.L175	 ;
.L180:
 ; D:\TC\src\parser.c:513:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, -24(%rbp)	 ; tmp143, body
 ; D:\TC\src\parser.c:514:     parser->in_loop = true;
	movq	32(%rbp), %rax	 ; parser, tmp144
	movb	$1, 10(%rax)	 ;, parser_46(D)->in_loop
 ; D:\TC\src\parser.c:515:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp145
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp145,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp146, token
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L181	 ;
.L183:
 ; D:\TC\src\parser.c:517:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp147
	movq	24(%rbp), %rdx	 ; now_scope, tmp148
	movq	16(%rbp), %rax	 ; lexer, tmp149
	movq	%rcx, %r8	 ; tmp147,
	movq	%rax, %rcx	 ; tmp149,
	call	parse_statement	 ;
	movq	%rax, -32(%rbp)	 ; tmp150, statement
 ; D:\TC\src\parser.c:518:         if (statement == NULL)
	cmpq	$0, -32(%rbp)	 ;, statement
	jne	.L182	 ;,
 ; D:\TC\src\parser.c:519:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp151
	movq	(%rax), %rax	 ; parser_46(D)->source_file, _21
	movq	%rax, %rcx	 ; _21,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _22
 ; D:\TC\src\parser.c:519:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp152
	movq	%rdx, %r8	 ; _22,
	movq	%rax, %rdx	 ; tmp152,
	leaq	.LC71(%rip), %rax	 ;, tmp153
	movq	%rax, %rcx	 ; tmp153,
	call	parser_error	 ;
.L182:
 ; D:\TC\src\parser.c:520:         list_append(body, (pointer)statement);
	movq	-32(%rbp), %rdx	 ; statement, tmp154
	movq	-24(%rbp), %rax	 ; body, tmp155
	movq	%rax, %rcx	 ; tmp155,
	call	list_append	 ;
 ; D:\TC\src\parser.c:521:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp156
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp156,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp157, token
.L181:
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp158
	movl	24(%rax), %eax	 ; token_27->type, _23
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _23
	jne	.L183	 ;,
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp159
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.74_24
	movq	-8(%rbp), %rax	 ; token, tmp160
	movq	(%rax), %rax	 ; token_27->lexeme, _25
	movq	%rax, %rcx	 ; _25,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _26
	je	.L183	 ;,
 ; D:\TC\src\parser.c:523:     parser->in_loop = false;
	movq	32(%rbp), %rax	 ; parser, tmp161
	movb	$0, 10(%rax)	 ;, parser_46(D)->in_loop
 ; D:\TC\src\parser.c:524:     return create_while(condition, body);
	movq	-24(%rbp), %rdx	 ; body, tmp162
	movq	-16(%rbp), %rax	 ; condition, tmp163
	movq	%rax, %rcx	 ; tmp163,
	call	create_while	 ;
.L175:
 ; D:\TC\src\parser.c:525: }
	leave	
	ret	
	.section .rdata,"dr"
.LC72:
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
 ; D:\TC\src\parser.c:527:     Token* token = NULL;
	movq	$0, -8(%rbp)	 ;, token
 ; D:\TC\src\parser.c:528:     token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp90
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp90,
	call	peek_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp91, token
 ; D:\TC\src\parser.c:529:     while (token->type == SYMBOL) {
	jmp	.L185	 ;
.L193:
 ; D:\TC\src\parser.c:530:         OperatorType op = string_to_operator(token->lexeme);
	movq	-8(%rbp), %rax	 ; token, tmp92
	movq	(%rax), %rax	 ; token_9->lexeme, _1
	movq	%rax, %rcx	 ; _1,
	call	string_to_operator	 ;
	movl	%eax, -20(%rbp)	 ; tmp93, op
 ; D:\TC\src\parser.c:531:         int op_prec = operator_precedence(op);
	movl	-20(%rbp), %eax	 ; op, tmp94
	movl	%eax, %ecx	 ; tmp94,
	call	operator_precedence	 ;
	movl	%eax, -24(%rbp)	 ; tmp95, op_prec
 ; D:\TC\src\parser.c:532:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, -20(%rbp)	 ;, op
	je	.L186	 ;,
 ; D:\TC\src\parser.c:532:         if (op == OP_NONE || op_prec < min_prec)
	movl	-24(%rbp), %eax	 ; op_prec, tmp96
	cmpl	32(%rbp), %eax	 ; min_prec, tmp96
	jl	.L186	 ;,
 ; D:\TC\src\parser.c:534:         token = get_next_token(lexer, true);  // consume operator
	movq	16(%rbp), %rax	 ; lexer, tmp97
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp97,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp98, token
 ; D:\TC\src\parser.c:535:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp99
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp99,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp100, token
 ; D:\TC\src\parser.c:536:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	48(%rbp), %rcx	 ; parser, tmp101
	movq	40(%rbp), %rdx	 ; now_scope, tmp102
	movq	16(%rbp), %rax	 ; lexer, tmp103
	movq	%rcx, %r8	 ; tmp101,
	movq	%rax, %rcx	 ; tmp103,
	call	parse_primary	 ;
	movq	%rax, -32(%rbp)	 ; tmp104, right_primary
 ; D:\TC\src\parser.c:537:         if (right_primary == NULL) {
	cmpq	$0, -32(%rbp)	 ;, right_primary
	jne	.L187	 ;,
 ; D:\TC\src\parser.c:538:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	48(%rbp), %rax	 ; parser, tmp105
	movq	(%rax), %rax	 ; parser_33(D)->source_file, _2
	movq	%rax, %rcx	 ; _2,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _3
 ; D:\TC\src\parser.c:538:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp106
	movq	%rdx, %r8	 ; _3,
	movq	%rax, %rdx	 ; tmp106,
	leaq	.LC72(%rip), %rax	 ;, tmp107
	movq	%rax, %rcx	 ; tmp107,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:539:             return NULL;
	movl	$0, %eax	 ;, _11
	jmp	.L188	 ;
.L187:
 ; D:\TC\src\parser.c:541:         Expression* right = create_expression(OP_NONE, NULL, right_primary, NULL);
	movq	-32(%rbp), %rax	 ; right_primary, tmp108
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; tmp108,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, -16(%rbp)	 ; tmp109, right
 ; D:\TC\src\parser.c:542:         token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp110
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp110,
	call	peek_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp111, token
 ; D:\TC\src\parser.c:543:         while (token->type == SYMBOL) {
	jmp	.L189	 ;
.L192:
 ; D:\TC\src\parser.c:544:             OperatorType next_op = string_to_operator(token->lexeme);
	movq	-8(%rbp), %rax	 ; token, tmp112
	movq	(%rax), %rax	 ; token_8->lexeme, _4
	movq	%rax, %rcx	 ; _4,
	call	string_to_operator	 ;
	movl	%eax, -36(%rbp)	 ; tmp113, next_op
 ; D:\TC\src\parser.c:545:             int next_prec = operator_precedence(next_op);
	movl	-36(%rbp), %eax	 ; next_op, tmp114
	movl	%eax, %ecx	 ; tmp114,
	call	operator_precedence	 ;
	movl	%eax, -40(%rbp)	 ; tmp115, next_prec
 ; D:\TC\src\parser.c:546:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, -36(%rbp)	 ;, next_op
	je	.L190	 ;,
 ; D:\TC\src\parser.c:546:             if (next_op == OP_NONE || next_prec <= op_prec)
	movl	-40(%rbp), %eax	 ; next_prec, tmp116
	cmpl	-24(%rbp), %eax	 ; op_prec, tmp116
	jle	.L190	 ;,
 ; D:\TC\src\parser.c:548:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	40(%rbp), %r9	 ; now_scope, tmp117
	movl	-40(%rbp), %r8d	 ; next_prec, tmp118
	movq	-16(%rbp), %rdx	 ; right, tmp119
	movq	16(%rbp), %rax	 ; lexer, tmp120
	movq	48(%rbp), %rcx	 ; parser, tmp121
	movq	%rcx, 32(%rsp)	 ; tmp121,
	movq	%rax, %rcx	 ; tmp120,
	call	parse_expr_prec	 ;
	movq	%rax, -16(%rbp)	 ; tmp122, right
 ; D:\TC\src\parser.c:549:             if (right == NULL)
	cmpq	$0, -16(%rbp)	 ;, right
	jne	.L191	 ;,
 ; D:\TC\src\parser.c:550:                 return NULL;
	movl	$0, %eax	 ;, _11
	jmp	.L188	 ;
.L191:
 ; D:\TC\src\parser.c:551:             token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp123
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp123,
	call	peek_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp124, token
.L189:
 ; D:\TC\src\parser.c:543:         while (token->type == SYMBOL) {
	movq	-8(%rbp), %rax	 ; token, tmp125
	movl	24(%rax), %eax	 ; token_8->type, _5
 ; D:\TC\src\parser.c:543:         while (token->type == SYMBOL) {
	cmpl	$5, %eax	 ;, _5
	je	.L192	 ;,
.L190:
 ; D:\TC\src\parser.c:553:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	-16(%rbp), %rcx	 ; right, tmp126
	movq	24(%rbp), %rdx	 ; expr_left, tmp127
	movl	-20(%rbp), %eax	 ; op, tmp128
	movq	%rcx, %r9	 ; tmp126,
	movl	$0, %r8d	 ;,
	movl	%eax, %ecx	 ; tmp128,
	call	create_expression	 ;
	movq	%rax, 24(%rbp)	 ; tmp129, expr_left
 ; D:\TC\src\parser.c:554:         token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp130
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp130,
	call	peek_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp131, token
.L185:
 ; D:\TC\src\parser.c:529:     while (token->type == SYMBOL) {
	movq	-8(%rbp), %rax	 ; token, tmp132
	movl	24(%rax), %eax	 ; token_9->type, _6
 ; D:\TC\src\parser.c:529:     while (token->type == SYMBOL) {
	cmpl	$5, %eax	 ;, _6
	je	.L193	 ;,
.L186:
 ; D:\TC\src\parser.c:556:     token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp133
	movq	%rax, %rcx	 ; tmp133,
	call	peek_current_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp134, token
 ; D:\TC\src\parser.c:557:     return expr_left;
	movq	24(%rbp), %rax	 ; expr_left, _11
.L188:
 ; D:\TC\src\parser.c:558: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC73:
	.ascii "Failed to parse expression primary\0"
	.text
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$72, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp88
	movq	24(%rbp), %rdx	 ; now_scope, tmp89
	movq	16(%rbp), %rax	 ; lexer, tmp90
	movq	%rcx, %r8	 ; tmp88,
	movq	%rax, %rcx	 ; tmp90,
	call	parse_primary	 ;
	movq	%rax, -24(%rbp)	 ; tmp91, left_primary
 ; D:\TC\src\parser.c:561:     if (left_primary == NULL) {
	cmpq	$0, -24(%rbp)	 ;, left_primary
	jne	.L195	 ;,
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp92
	movq	(%rax), %rax	 ; parser_10(D)->source_file, _1
	movq	%rax, %rcx	 ; _1,
	call	get_full_path	 ;
	movq	%rax, %rbx	 ;, _2
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	16(%rbp), %rax	 ; lexer, tmp93
	movq	%rax, %rcx	 ; tmp93,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %r8	 ; _2,
	movq	%rax, %rdx	 ; _3,
	leaq	.LC73(%rip), %rax	 ;, tmp94
	movq	%rax, %rcx	 ; tmp94,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:563:         return NULL;
	movl	$0, %eax	 ;, _5
	jmp	.L196	 ;
.L195:
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	-24(%rbp), %rax	 ; left_primary, tmp95
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; tmp95,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rcx	 ;, _4
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	24(%rbp), %r8	 ; now_scope, tmp96
	movq	16(%rbp), %rax	 ; lexer, tmp97
	movq	32(%rbp), %rdx	 ; parser, tmp98
	movq	%rdx, 32(%rsp)	 ; tmp98,
	movq	%r8, %r9	 ; tmp96,
	movl	$0, %r8d	 ;,
	movq	%rcx, %rdx	 ; _4,
	movq	%rax, %rcx	 ; tmp97,
	call	parse_expr_prec	 ;
.L196:
 ; D:\TC\src\parser.c:566: }
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC74:
	.ascii "Failed to parse parenthesized expression\0"
.LC75:
	.ascii "Expected ')' after expression\0"
	.align 8
.LC76:
	.ascii "Failed to parse operand of unary '!'\0"
	.align 8
.LC77:
	.ascii "Failed to parse operand of unary '-'\0"
	.align 8
.LC78:
	.ascii "Failed to parse variable access\0"
	.align 8
.LC79:
	.ascii "Unexpected token in primary expression\0"
	.text
	.def	parse_primary;	.scl	3;	.type	32;	.endef
parse_primary:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$96, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:568:     Token* token = NULL;
	movq	$0, -48(%rbp)	 ;, token
 ; D:\TC\src\parser.c:569:     token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp129
	movq	%rax, %rcx	 ; tmp129,
	call	peek_current_token	 ;
	movq	%rax, -48(%rbp)	 ; tmp130, token
 ; D:\TC\src\parser.c:571:     string str_value = NULL;
	movq	$0, -16(%rbp)	 ;, str_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	movq	$0, -24(%rbp)	 ;, expr_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	movq	$0, -32(%rbp)	 ;, prim_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	movq	$0, -40(%rbp)	 ;, variable_value
 ; D:\TC\src\parser.c:575:     if (token->type == INTEGER) {
	movq	-48(%rbp), %rax	 ; token, tmp131
	movl	24(%rax), %eax	 ; token_66->type, _1
 ; D:\TC\src\parser.c:575:     if (token->type == INTEGER) {
	cmpl	$2, %eax	 ;, _1
	jne	.L198	 ;,
 ; D:\TC\src\parser.c:576:         type = PRIM_INTEGER;
	movl	$0, -4(%rbp)	 ;, type
 ; D:\TC\src\parser.c:577:         str_value = token->lexeme;
	movq	-48(%rbp), %rax	 ; token, tmp132
	movq	(%rax), %rax	 ; token_66->lexeme, tmp133
	movq	%rax, -16(%rbp)	 ; tmp133, str_value
	jmp	.L199	 ;
.L198:
 ; D:\TC\src\parser.c:578:     } else if (token->type == FLOAT) {
	movq	-48(%rbp), %rax	 ; token, tmp134
	movl	24(%rax), %eax	 ; token_66->type, _2
 ; D:\TC\src\parser.c:578:     } else if (token->type == FLOAT) {
	cmpl	$3, %eax	 ;, _2
	jne	.L200	 ;,
 ; D:\TC\src\parser.c:579:         type = PRIM_FLOAT;
	movl	$1, -4(%rbp)	 ;, type
 ; D:\TC\src\parser.c:580:         str_value = token->lexeme;
	movq	-48(%rbp), %rax	 ; token, tmp135
	movq	(%rax), %rax	 ; token_66->lexeme, tmp136
	movq	%rax, -16(%rbp)	 ; tmp136, str_value
	jmp	.L199	 ;
.L200:
 ; D:\TC\src\parser.c:581:     } else if (token->type == STRING) {
	movq	-48(%rbp), %rax	 ; token, tmp137
	movl	24(%rax), %eax	 ; token_66->type, _3
 ; D:\TC\src\parser.c:581:     } else if (token->type == STRING) {
	cmpl	$4, %eax	 ;, _3
	jne	.L201	 ;,
 ; D:\TC\src\parser.c:582:         type = PRIM_STRING;
	movl	$2, -4(%rbp)	 ;, type
 ; D:\TC\src\parser.c:583:         str_value = token->lexeme;
	movq	-48(%rbp), %rax	 ; token, tmp138
	movq	(%rax), %rax	 ; token_66->lexeme, tmp139
	movq	%rax, -16(%rbp)	 ; tmp139, str_value
	jmp	.L199	 ;
.L201:
 ; D:\TC\src\parser.c:584:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	movq	-48(%rbp), %rax	 ; token, tmp140
	movl	24(%rax), %eax	 ; token_66->type, _4
 ; D:\TC\src\parser.c:584:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _4
	jne	.L202	 ;,
 ; D:\TC\src\parser.c:584:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	movq	.refptr.TRUE_KEYWORD(%rip), %rax	 ;, tmp141
	movq	(%rax), %rdx	 ; TRUE_KEYWORD, TRUE_KEYWORD.75_5
	movq	-48(%rbp), %rax	 ; token, tmp142
	movq	(%rax), %rax	 ; token_66->lexeme, _6
	movq	%rax, %rcx	 ; _6,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:584:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	 ; _7
	je	.L202	 ;,
 ; D:\TC\src\parser.c:585:         type = PRIM_TRUE;
	movl	$3, -4(%rbp)	 ;, type
 ; D:\TC\src\parser.c:586:         str_value = token->lexeme;
	movq	-48(%rbp), %rax	 ; token, tmp143
	movq	(%rax), %rax	 ; token_66->lexeme, tmp144
	movq	%rax, -16(%rbp)	 ; tmp144, str_value
	jmp	.L199	 ;
.L202:
 ; D:\TC\src\parser.c:587:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movq	-48(%rbp), %rax	 ; token, tmp145
	movl	24(%rax), %eax	 ; token_66->type, _8
 ; D:\TC\src\parser.c:587:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _8
	jne	.L203	 ;,
 ; D:\TC\src\parser.c:587:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movq	.refptr.FALSE_KEYWORD(%rip), %rax	 ;, tmp146
	movq	(%rax), %rdx	 ; FALSE_KEYWORD, FALSE_KEYWORD.76_9
	movq	-48(%rbp), %rax	 ; token, tmp147
	movq	(%rax), %rax	 ; token_66->lexeme, _10
	movq	%rax, %rcx	 ; _10,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:587:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	 ; _11
	je	.L203	 ;,
 ; D:\TC\src\parser.c:588:         type = PRIM_FALSE;
	movl	$4, -4(%rbp)	 ;, type
 ; D:\TC\src\parser.c:589:         str_value = token->lexeme;
	movq	-48(%rbp), %rax	 ; token, tmp148
	movq	(%rax), %rax	 ; token_66->lexeme, tmp149
	movq	%rax, -16(%rbp)	 ; tmp149, str_value
	jmp	.L199	 ;
.L203:
 ; D:\TC\src\parser.c:590:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-48(%rbp), %rax	 ; token, tmp150
	movl	24(%rax), %eax	 ; token_66->type, _12
 ; D:\TC\src\parser.c:590:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _12
	jne	.L204	 ;,
 ; D:\TC\src\parser.c:590:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp151
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.77_13
	movq	-48(%rbp), %rax	 ; token, tmp152
	movq	(%rax), %rax	 ; token_66->lexeme, _14
	movq	%rax, %rcx	 ; _14,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:590:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _15
	je	.L204	 ;,
 ; D:\TC\src\parser.c:591:         type = PRIM_EXPRESSION;
	movl	$5, -4(%rbp)	 ;, type
 ; D:\TC\src\parser.c:592:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp153
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp153,
	call	get_next_token	 ;
	movq	%rax, -48(%rbp)	 ; tmp154, token
 ; D:\TC\src\parser.c:593:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp155
	movq	24(%rbp), %rdx	 ; now_scope, tmp156
	movq	16(%rbp), %rax	 ; lexer, tmp157
	movq	%rcx, %r8	 ; tmp155,
	movq	%rax, %rcx	 ; tmp157,
	call	parse_expression	 ;
	movq	%rax, -24(%rbp)	 ; tmp158, expr_value
 ; D:\TC\src\parser.c:594:         if (expr_value == NULL) {
	cmpq	$0, -24(%rbp)	 ;, expr_value
	jne	.L205	 ;,
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp159
	movq	(%rax), %rax	 ; parser_82(D)->source_file, _16
	movq	%rax, %rcx	 ; _16,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _17
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	-48(%rbp), %rax	 ; token, tmp160
	movq	%rdx, %r8	 ; _17,
	movq	%rax, %rdx	 ; tmp160,
	leaq	.LC74(%rip), %rax	 ;, tmp161
	movq	%rax, %rcx	 ; tmp161,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:596:             return NULL;
	movl	$0, %eax	 ;, _51
	jmp	.L206	 ;
.L205:
 ; D:\TC\src\parser.c:598:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp162
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp162,
	call	get_next_token	 ;
	movq	%rax, -48(%rbp)	 ; tmp163, token
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-48(%rbp), %rax	 ; token, tmp164
	movl	24(%rax), %eax	 ; token_86->type, _18
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _18
	jne	.L207	 ;,
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp165
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.78_19
	movq	-48(%rbp), %rax	 ; token, tmp166
	movq	(%rax), %rax	 ; token_86->lexeme, _20
	movq	%rax, %rcx	 ; _20,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _21
	jne	.L216	 ;,
.L207:
 ; D:\TC\src\parser.c:600:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp167
	movq	(%rax), %rax	 ; parser_82(D)->source_file, _22
	movq	%rax, %rcx	 ; _22,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _23
 ; D:\TC\src\parser.c:600:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	-48(%rbp), %rax	 ; token, tmp168
	movq	%rdx, %r8	 ; _23,
	movq	%rax, %rdx	 ; tmp168,
	leaq	.LC75(%rip), %rax	 ;, tmp169
	movq	%rax, %rcx	 ; tmp169,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:601:             return NULL;
	movl	$0, %eax	 ;, _51
	jmp	.L206	 ;
.L204:
 ; D:\TC\src\parser.c:603:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movq	-48(%rbp), %rax	 ; token, tmp170
	movl	24(%rax), %eax	 ; token_66->type, _24
 ; D:\TC\src\parser.c:603:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	cmpl	$5, %eax	 ;, _24
	jne	.L209	 ;,
 ; D:\TC\src\parser.c:603:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp171
	movq	(%rax), %rdx	 ; NOT_SYMBOL, NOT_SYMBOL.79_25
	movq	-48(%rbp), %rax	 ; token, tmp172
	movq	(%rax), %rax	 ; token_66->lexeme, _26
	movq	%rax, %rcx	 ; _26,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:603:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	 ; _27
	je	.L209	 ;,
 ; D:\TC\src\parser.c:604:         type = PRIM_NOT_OPERAND;
	movl	$6, -4(%rbp)	 ;, type
 ; D:\TC\src\parser.c:605:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp173
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp173,
	call	get_next_token	 ;
	movq	%rax, -48(%rbp)	 ; tmp174, token
 ; D:\TC\src\parser.c:606:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp175
	movq	24(%rbp), %rdx	 ; now_scope, tmp176
	movq	16(%rbp), %rax	 ; lexer, tmp177
	movq	%rcx, %r8	 ; tmp175,
	movq	%rax, %rcx	 ; tmp177,
	call	parse_primary	 ;
	movq	%rax, -32(%rbp)	 ; tmp178, prim_value
 ; D:\TC\src\parser.c:607:         if (prim_value == NULL) {
	cmpq	$0, -32(%rbp)	 ;, prim_value
	jne	.L199	 ;,
 ; D:\TC\src\parser.c:608:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp179
	movq	(%rax), %rax	 ; parser_82(D)->source_file, _28
	movq	%rax, %rcx	 ; _28,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _29
 ; D:\TC\src\parser.c:608:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	-48(%rbp), %rax	 ; token, tmp180
	movq	%rdx, %r8	 ; _29,
	movq	%rax, %rdx	 ; tmp180,
	leaq	.LC76(%rip), %rax	 ;, tmp181
	movq	%rax, %rcx	 ; tmp181,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:609:             return NULL;
	movl	$0, %eax	 ;, _51
	jmp	.L206	 ;
.L209:
 ; D:\TC\src\parser.c:611:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movq	-48(%rbp), %rax	 ; token, tmp182
	movl	24(%rax), %eax	 ; token_66->type, _30
 ; D:\TC\src\parser.c:611:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	cmpl	$5, %eax	 ;, _30
	jne	.L211	 ;,
 ; D:\TC\src\parser.c:611:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp183
	movq	(%rax), %rdx	 ; SUB_SYMBOL, SUB_SYMBOL.80_31
	movq	-48(%rbp), %rax	 ; token, tmp184
	movq	(%rax), %rax	 ; token_66->lexeme, _32
	movq	%rax, %rcx	 ; _32,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:611:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	 ; _33
	je	.L211	 ;,
 ; D:\TC\src\parser.c:612:         type = PRIM_NEG_OPERAND;
	movl	$7, -4(%rbp)	 ;, type
 ; D:\TC\src\parser.c:613:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp185
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp185,
	call	get_next_token	 ;
	movq	%rax, -48(%rbp)	 ; tmp186, token
 ; D:\TC\src\parser.c:614:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp187
	movq	24(%rbp), %rdx	 ; now_scope, tmp188
	movq	16(%rbp), %rax	 ; lexer, tmp189
	movq	%rcx, %r8	 ; tmp187,
	movq	%rax, %rcx	 ; tmp189,
	call	parse_primary	 ;
	movq	%rax, -32(%rbp)	 ; tmp190, prim_value
 ; D:\TC\src\parser.c:615:         if (prim_value == NULL) {
	cmpq	$0, -32(%rbp)	 ;, prim_value
	jne	.L199	 ;,
 ; D:\TC\src\parser.c:616:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp191
	movq	(%rax), %rax	 ; parser_82(D)->source_file, _34
	movq	%rax, %rcx	 ; _34,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _35
 ; D:\TC\src\parser.c:616:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	-48(%rbp), %rax	 ; token, tmp192
	movq	%rdx, %r8	 ; _35,
	movq	%rax, %rdx	 ; tmp192,
	leaq	.LC77(%rip), %rax	 ;, tmp193
	movq	%rax, %rcx	 ; tmp193,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:617:             return NULL;
	movl	$0, %eax	 ;, _51
	jmp	.L206	 ;
.L211:
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	-48(%rbp), %rax	 ; token, tmp194
	movl	24(%rax), %eax	 ; token_66->type, _36
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$1, %eax	 ;, _36
	je	.L213	 ;,
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	-48(%rbp), %rax	 ; token, tmp195
	movl	24(%rax), %eax	 ; token_66->type, _37
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$6, %eax	 ;, _37
	jne	.L214	 ;,
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp196
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD.81_38
	movq	-48(%rbp), %rax	 ; token, tmp197
	movq	(%rax), %rax	 ; token_66->lexeme, _39
	movq	%rax, %rcx	 ; _39,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	testb	%al, %al	 ; _40
	je	.L214	 ;,
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	32(%rbp), %rax	 ; parser, tmp198
	movzbl	9(%rax), %eax	 ; parser_82(D)->in_method, _41
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	testb	%al, %al	 ; _41
	je	.L214	 ;,
.L213:
 ; D:\TC\src\parser.c:620:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, -4(%rbp)	 ;, type
 ; D:\TC\src\parser.c:621:         variable_value = parse_variable_access(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp199
	movq	24(%rbp), %rdx	 ; now_scope, tmp200
	movq	16(%rbp), %rax	 ; lexer, tmp201
	movq	%rcx, %r8	 ; tmp199,
	movq	%rax, %rcx	 ; tmp201,
	call	parse_variable_access	 ;
	movq	%rax, -40(%rbp)	 ; tmp202, variable_value
 ; D:\TC\src\parser.c:622:         if (variable_value == NULL) {
	cmpq	$0, -40(%rbp)	 ;, variable_value
	jne	.L199	 ;,
 ; D:\TC\src\parser.c:623:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp203
	movq	(%rax), %rax	 ; parser_82(D)->source_file, _42
	movq	%rax, %rcx	 ; _42,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _43
 ; D:\TC\src\parser.c:623:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	-48(%rbp), %rax	 ; token, tmp204
	movq	%rdx, %r8	 ; _43,
	movq	%rax, %rdx	 ; tmp204,
	leaq	.LC78(%rip), %rax	 ;, tmp205
	movq	%rax, %rcx	 ; tmp205,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:624:             return NULL;
	movl	$0, %eax	 ;, _51
	jmp	.L206	 ;
.L214:
 ; D:\TC\src\parser.c:627:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp206
	movq	(%rax), %rax	 ; parser_82(D)->source_file, _44
	movq	%rax, %rcx	 ; _44,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _45
 ; D:\TC\src\parser.c:627:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	-48(%rbp), %rax	 ; token, tmp207
	movq	%rdx, %r8	 ; _45,
	movq	%rax, %rdx	 ; tmp207,
	leaq	.LC79(%rip), %rax	 ;, tmp208
	movq	%rax, %rcx	 ; tmp208,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:628:         return NULL;
	movl	$0, %eax	 ;, _51
	jmp	.L206	 ;
.L216:
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	nop	
.L199:
 ; D:\TC\src\parser.c:630:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	-32(%rbp), %r9	 ; prim_value, tmp209
	movq	-24(%rbp), %r8	 ; expr_value, tmp210
	movq	-16(%rbp), %rdx	 ; str_value, tmp211
	movl	-4(%rbp), %eax	 ; type, tmp212
	movq	-40(%rbp), %rcx	 ; variable_value, tmp213
	movq	%rcx, 32(%rsp)	 ; tmp213,
	movl	%eax, %ecx	 ; tmp212,
	call	create_primary	 ;
.L206:
 ; D:\TC\src\parser.c:631: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC80:
	.ascii "Expected variable name in variable access\0"
	.align 8
.LC81:
	.ascii "Cannot call undefined variable\0"
	.align 8
.LC82:
	.ascii "Cannot call non-function variable\0"
	.align 8
.LC83:
	.ascii "Failed to parse function call argument\0"
	.align 8
.LC84:
	.ascii "Expected ',' or ')' after function call argument\0"
	.align 8
.LC85:
	.ascii "Failed to parse sequence index\0"
	.align 8
.LC86:
	.ascii "Expected ']' after sequence index\0"
	.align 8
.LC87:
	.ascii "Cannot access attribute without a valid scope\0"
	.align 8
.LC88:
	.ascii "Expected attribute name after '.'\0"
.LC89:
	.ascii "Unknown attribute name\0"
	.text
	.def	parse_variable_access;	.scl	3;	.type	32;	.endef
parse_variable_access:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$112, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:\TC\src\parser.c:633:     Token* token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	peek_current_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp146, token
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	-8(%rbp), %rax	 ; token, tmp147
	movl	24(%rax), %eax	 ; token_95->type, _1
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	 ;, _1
	je	.L218	 ;,
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	-8(%rbp), %rax	 ; token, tmp148
	movl	24(%rax), %eax	 ; token_95->type, _2
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	 ;, _2
	jne	.L219	 ;,
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp149
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD.82_3
	movq	-8(%rbp), %rax	 ; token, tmp150
	movq	(%rax), %rax	 ; token_95->lexeme, _4
	movq	%rax, %rcx	 ; _4,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	 ; _5
	jne	.L218	 ;,
.L219:
 ; D:\TC\src\parser.c:635:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp151
	movq	(%rax), %rax	 ; parser_97(D)->source_file, _6
	movq	%rax, %rcx	 ; _6,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _7
 ; D:\TC\src\parser.c:635:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp152
	movq	%rdx, %r8	 ; _7,
	movq	%rax, %rdx	 ; tmp152,
	leaq	.LC80(%rip), %rax	 ;, tmp153
	movq	%rax, %rcx	 ; tmp153,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:636:         return NULL;
	movl	$0, %eax	 ;, _76
	jmp	.L220	 ;
.L218:
 ; D:\TC\src\parser.c:638:     Symbol* current_type = NULL;
	movq	$0, -16(%rbp)	 ;, current_type
 ; D:\TC\src\parser.c:639:     Symbol* base_name = NULL;
	movq	$0, -24(%rbp)	 ;, base_name
 ; D:\TC\src\parser.c:640:     SymbolTable* var_scope = NULL;
	movq	$0, -32(%rbp)	 ;, var_scope
 ; D:\TC\src\parser.c:641:     base_name = search_name(now_scope, token->lexeme);
	movq	-8(%rbp), %rax	 ; token, tmp154
	movq	(%rax), %rdx	 ; token_95->lexeme, _8
	movq	24(%rbp), %rax	 ; now_scope, tmp155
	movq	%rax, %rcx	 ; tmp155,
	call	search_name	 ;
	movq	%rax, -24(%rbp)	 ; tmp156, base_name
 ; D:\TC\src\parser.c:642:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	movq	-24(%rbp), %rax	 ; base_name, tmp157
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; tmp157,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, -40(%rbp)	 ; tmp158, base
 ; D:\TC\src\parser.c:643:     token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp159
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp159,
	call	peek_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp160, token
 ; D:\TC\src\parser.c:644:     while (token->type == SYMBOL) {
	jmp	.L221	 ;
.L244:
 ; D:\TC\src\parser.c:645:         if (base_name != NULL) {
	cmpq	$0, -24(%rbp)	 ;, base_name
	je	.L222	 ;,
 ; D:\TC\src\parser.c:646:             current_type = base_name;     // class or type
	movq	-24(%rbp), %rax	 ; base_name, tmp161
	movq	%rax, -16(%rbp)	 ; tmp161, current_type
 ; D:\TC\src\parser.c:647:             if (base_name->type != NULL)  // subroutine or variable or attribute or parameter
	movq	-24(%rbp), %rax	 ; base_name, tmp162
	movq	(%rax), %rax	 ; base_name_69->type, _9
 ; D:\TC\src\parser.c:647:             if (base_name->type != NULL)  // subroutine or variable or attribute or parameter
	testq	%rax, %rax	 ; _9
	je	.L222	 ;,
 ; D:\TC\src\parser.c:648:                 current_type = base_name->type;
	movq	-24(%rbp), %rax	 ; base_name, tmp163
	movq	(%rax), %rax	 ; base_name_69->type, tmp164
	movq	%rax, -16(%rbp)	 ; tmp164, current_type
.L222:
 ; D:\TC\src\parser.c:650:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	cmpq	$0, -32(%rbp)	 ;, var_scope
	jne	.L223	 ;,
 ; D:\TC\src\parser.c:650:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	cmpq	$0, -16(%rbp)	 ;, current_type
	je	.L223	 ;,
 ; D:\TC\src\parser.c:650:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	movq	-16(%rbp), %rax	 ; current_type, tmp165
	movl	32(%rax), %eax	 ; current_type_64->kind, _10
 ; D:\TC\src\parser.c:650:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _10
	jne	.L223	 ;,
 ; D:\TC\src\parser.c:651:             var_scope = current_type->scope;
	movq	-16(%rbp), %rax	 ; current_type, tmp166
	movq	8(%rax), %rax	 ; current_type_64->scope, tmp167
	movq	%rax, -32(%rbp)	 ; tmp167, var_scope
.L223:
 ; D:\TC\src\parser.c:652:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp168
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.83_11
	movq	-8(%rbp), %rax	 ; token, tmp169
	movq	(%rax), %rax	 ; token_63->lexeme, _12
	movq	%rax, %rcx	 ; _12,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:652:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _13
	je	.L224	 ;,
 ; D:\TC\src\parser.c:653:             token = get_next_token(lexer, true);  // consume '('
	movq	16(%rbp), %rax	 ; lexer, tmp170
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp170,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp171, token
 ; D:\TC\src\parser.c:654:             if (base_name == NULL)
	cmpq	$0, -24(%rbp)	 ;, base_name
	jne	.L225	 ;,
 ; D:\TC\src\parser.c:655:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp172
	movq	(%rax), %rax	 ; parser_97(D)->source_file, _14
	movq	%rax, %rcx	 ; _14,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _15
 ; D:\TC\src\parser.c:655:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp173
	movq	%rdx, %r8	 ; _15,
	movq	%rax, %rdx	 ; tmp173,
	leaq	.LC81(%rip), %rax	 ;, tmp174
	movq	%rax, %rcx	 ; tmp174,
	call	parser_error	 ;
	jmp	.L226	 ;
.L225:
 ; D:\TC\src\parser.c:656:             else if (base_name->kind == SYMBOL_CLASS) {
	movq	-24(%rbp), %rax	 ; base_name, tmp175
	movl	32(%rax), %eax	 ; base_name_69->kind, _16
 ; D:\TC\src\parser.c:656:             else if (base_name->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	 ; _16
	jne	.L226	 ;,
 ; D:\TC\src\parser.c:657:                 base_name = search_name(base_name->scope, CONSTRUCTOR_NAME);
	movq	.refptr.CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp176
	movq	(%rax), %rdx	 ; CONSTRUCTOR_NAME, CONSTRUCTOR_NAME.84_17
	movq	-24(%rbp), %rax	 ; base_name, tmp177
	movq	8(%rax), %rax	 ; base_name_69->scope, _18
	movq	%rax, %rcx	 ; _18,
	call	search_name	 ;
	movq	%rax, -24(%rbp)	 ; tmp178, base_name
 ; D:\TC\src\parser.c:658:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	-24(%rbp), %rdx	 ; base_name, tmp179
	movq	-40(%rbp), %rax	 ; base, tmp180
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp179,
	movq	%rax, %rdx	 ; tmp180,
	movl	$2, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, -40(%rbp)	 ; tmp181, base
.L226:
 ; D:\TC\src\parser.c:660:             if (base_name != NULL && base_name->kind != SYMBOL_SUBROUTINE)
	cmpq	$0, -24(%rbp)	 ;, base_name
	je	.L227	 ;,
 ; D:\TC\src\parser.c:660:             if (base_name != NULL && base_name->kind != SYMBOL_SUBROUTINE)
	movq	-24(%rbp), %rax	 ; base_name, tmp182
	movl	32(%rax), %eax	 ; base_name_67->kind, _19
 ; D:\TC\src\parser.c:660:             if (base_name != NULL && base_name->kind != SYMBOL_SUBROUTINE)
	cmpl	$1, %eax	 ;, _19
	je	.L227	 ;,
 ; D:\TC\src\parser.c:661:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp183
	movq	(%rax), %rax	 ; parser_97(D)->source_file, _20
	movq	%rax, %rcx	 ; _20,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _21
 ; D:\TC\src\parser.c:661:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp184
	movq	%rdx, %r8	 ; _21,
	movq	%rax, %rdx	 ; tmp184,
	leaq	.LC82(%rip), %rax	 ;, tmp185
	movq	%rax, %rcx	 ; tmp185,
	call	parser_error	 ;
.L227:
 ; D:\TC\src\parser.c:662:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp186
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp186,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp187, token
 ; D:\TC\src\parser.c:663:             list(Expression*) args = create_list();
	call	create_list	 ;
	movq	%rax, -56(%rbp)	 ; tmp188, args
 ; D:\TC\src\parser.c:664:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L228	 ;
.L233:
 ; D:\TC\src\parser.c:665:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp189
	movq	24(%rbp), %rdx	 ; now_scope, tmp190
	movq	16(%rbp), %rax	 ; lexer, tmp191
	movq	%rcx, %r8	 ; tmp189,
	movq	%rax, %rcx	 ; tmp191,
	call	parse_expression	 ;
	movq	%rax, -64(%rbp)	 ; tmp192, arg
 ; D:\TC\src\parser.c:666:                 if (arg == NULL)
	cmpq	$0, -64(%rbp)	 ;, arg
	jne	.L229	 ;,
 ; D:\TC\src\parser.c:667:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp193
	movq	(%rax), %rax	 ; parser_97(D)->source_file, _22
	movq	%rax, %rcx	 ; _22,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _23
 ; D:\TC\src\parser.c:667:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp194
	movq	%rdx, %r8	 ; _23,
	movq	%rax, %rdx	 ; tmp194,
	leaq	.LC83(%rip), %rax	 ;, tmp195
	movq	%rax, %rcx	 ; tmp195,
	call	parser_error	 ;
.L229:
 ; D:\TC\src\parser.c:668:                 list_append(args, (pointer)arg);
	movq	-64(%rbp), %rdx	 ; arg, tmp196
	movq	-56(%rbp), %rax	 ; args, tmp197
	movq	%rax, %rcx	 ; tmp197,
	call	list_append	 ;
 ; D:\TC\src\parser.c:669:                 token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp198
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp198,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp199, token
 ; D:\TC\src\parser.c:670:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	movq	-8(%rbp), %rax	 ; token, tmp200
	movl	24(%rax), %eax	 ; token_179->type, _24
 ; D:\TC\src\parser.c:670:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	cmpl	$5, %eax	 ;, _24
	jne	.L230	 ;,
 ; D:\TC\src\parser.c:670:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp201
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL.85_25
	movq	-8(%rbp), %rax	 ; token, tmp202
	movq	(%rax), %rax	 ; token_179->lexeme, _26
	movq	%rax, %rcx	 ; _26,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:670:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	testb	%al, %al	 ; _27
	je	.L230	 ;,
 ; D:\TC\src\parser.c:671:                     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp203
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp203,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp204, token
 ; D:\TC\src\parser.c:671:                     token = get_next_token(lexer, true);
	jmp	.L228	 ;
.L230:
 ; D:\TC\src\parser.c:672:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp205
	movl	24(%rax), %eax	 ; token_179->type, _28
 ; D:\TC\src\parser.c:672:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _28
	jne	.L232	 ;,
 ; D:\TC\src\parser.c:672:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp206
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.86_29
	movq	-8(%rbp), %rax	 ; token, tmp207
	movq	(%rax), %rax	 ; token_179->lexeme, _30
	movq	%rax, %rcx	 ; _30,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:672:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _31
	jne	.L228	 ;,
.L232:
 ; D:\TC\src\parser.c:673:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp208
	movq	(%rax), %rax	 ; parser_97(D)->source_file, _32
	movq	%rax, %rcx	 ; _32,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _33
 ; D:\TC\src\parser.c:673:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp209
	movq	%rdx, %r8	 ; _33,
	movq	%rax, %rdx	 ; tmp209,
	leaq	.LC84(%rip), %rax	 ;, tmp210
	movq	%rax, %rcx	 ; tmp210,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:674:                     return NULL;
	movl	$0, %eax	 ;, _76
	jmp	.L220	 ;
.L228:
 ; D:\TC\src\parser.c:664:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp211
	movl	24(%rax), %eax	 ; token_62->type, _34
 ; D:\TC\src\parser.c:664:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _34
	jne	.L233	 ;,
 ; D:\TC\src\parser.c:664:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp212
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.87_35
	movq	-8(%rbp), %rax	 ; token, tmp213
	movq	(%rax), %rax	 ; token_62->lexeme, _36
	movq	%rax, %rcx	 ; _36,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:664:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _37
	je	.L233	 ;,
 ; D:\TC\src\parser.c:677:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	-40(%rbp), %rax	 ; base, tmp214
	movq	-56(%rbp), %rdx	 ; args, tmp215
	movq	%rdx, 32(%rsp)	 ; tmp215,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp214,
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, -40(%rbp)	 ; tmp216, base
 ; D:\TC\src\parser.c:678:             base_name = base_name->type;
	movq	-24(%rbp), %rax	 ; base_name, tmp217
	movq	(%rax), %rax	 ; base_name_67->type, tmp218
	movq	%rax, -24(%rbp)	 ; tmp218, base_name
 ; D:\TC\src\parser.c:679:             current_type = NULL;
	movq	$0, -16(%rbp)	 ;, current_type
 ; D:\TC\src\parser.c:680:             var_scope = NULL;
	movq	$0, -32(%rbp)	 ;, var_scope
 ; D:\TC\src\parser.c:681:             if (base_name->kind == SYMBOL_CLASS)
	movq	-24(%rbp), %rax	 ; base_name, tmp219
	movl	32(%rax), %eax	 ; base_name_169->kind, _38
 ; D:\TC\src\parser.c:681:             if (base_name->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _38
	jne	.L234	 ;,
 ; D:\TC\src\parser.c:682:                 var_scope = base_name->scope;
	movq	-24(%rbp), %rax	 ; base_name, tmp220
	movq	8(%rax), %rax	 ; base_name_169->scope, tmp221
	movq	%rax, -32(%rbp)	 ; tmp221, var_scope
	jmp	.L234	 ;
.L224:
 ; D:\TC\src\parser.c:683:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp222
	movq	(%rax), %rdx	 ; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL.88_39
	movq	-8(%rbp), %rax	 ; token, tmp223
	movq	(%rax), %rax	 ; token_63->lexeme, _40
	movq	%rax, %rcx	 ; _40,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:683:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; _41
	je	.L235	 ;,
 ; D:\TC\src\parser.c:684:             token = get_next_token(lexer, true);  // consume '['
	movq	16(%rbp), %rax	 ; lexer, tmp224
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp224,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp225, token
 ; D:\TC\src\parser.c:685:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp226
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp226,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp227, token
 ; D:\TC\src\parser.c:686:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp228
	movq	24(%rbp), %rdx	 ; now_scope, tmp229
	movq	16(%rbp), %rax	 ; lexer, tmp230
	movq	%rcx, %r8	 ; tmp228,
	movq	%rax, %rcx	 ; tmp230,
	call	parse_expression	 ;
	movq	%rax, -48(%rbp)	 ; tmp231, index
 ; D:\TC\src\parser.c:687:             if (index == NULL)
	cmpq	$0, -48(%rbp)	 ;, index
	jne	.L236	 ;,
 ; D:\TC\src\parser.c:688:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp232
	movq	(%rax), %rax	 ; parser_97(D)->source_file, _42
	movq	%rax, %rcx	 ; _42,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _43
 ; D:\TC\src\parser.c:688:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp233
	movq	%rdx, %r8	 ; _43,
	movq	%rax, %rdx	 ; tmp233,
	leaq	.LC85(%rip), %rax	 ;, tmp234
	movq	%rax, %rcx	 ; tmp234,
	call	parser_error	 ;
.L236:
 ; D:\TC\src\parser.c:689:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp235
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp235,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp236, token
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp237
	movl	24(%rax), %eax	 ; token_145->type, _44
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, %eax	 ;, _44
	jne	.L237	 ;,
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp238
	movq	(%rax), %rdx	 ; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL.89_45
	movq	-8(%rbp), %rax	 ; token, tmp239
	movq	(%rax), %rax	 ; token_145->lexeme, _46
	movq	%rax, %rcx	 ; _46,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; _47
	jne	.L238	 ;,
.L237:
 ; D:\TC\src\parser.c:691:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp240
	movq	(%rax), %rax	 ; parser_97(D)->source_file, _48
	movq	%rax, %rcx	 ; _48,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _49
 ; D:\TC\src\parser.c:691:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp241
	movq	%rdx, %r8	 ; _49,
	movq	%rax, %rdx	 ; tmp241,
	leaq	.LC86(%rip), %rax	 ;, tmp242
	movq	%rax, %rcx	 ; tmp242,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:692:                 return NULL;
	movl	$0, %eax	 ;, _76
	jmp	.L220	 ;
.L238:
 ; D:\TC\src\parser.c:694:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movq	-48(%rbp), %rdx	 ; index, tmp243
	movq	-40(%rbp), %rax	 ; base, tmp244
	movq	$0, 32(%rsp)	 ;,
	movq	%rdx, %r9	 ; tmp243,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp244,
	movl	$3, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, -40(%rbp)	 ; tmp245, base
	jmp	.L234	 ;
.L235:
 ; D:\TC\src\parser.c:695:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp246
	movq	(%rax), %rdx	 ; DOT_SYMBOL, DOT_SYMBOL.90_50
	movq	-8(%rbp), %rax	 ; token, tmp247
	movq	(%rax), %rax	 ; token_63->lexeme, _51
	movq	%rax, %rcx	 ; _51,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:695:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	 ; _52
	je	.L245	 ;,
 ; D:\TC\src\parser.c:696:             token = get_next_token(lexer, true);  // consume '.'
	movq	16(%rbp), %rax	 ; lexer, tmp248
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp248,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp249, token
 ; D:\TC\src\parser.c:697:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp250
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp250,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp251, token
 ; D:\TC\src\parser.c:698:             if (var_scope == NULL) {
	cmpq	$0, -32(%rbp)	 ;, var_scope
	jne	.L240	 ;,
 ; D:\TC\src\parser.c:699:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp252
	movq	(%rax), %rax	 ; parser_97(D)->source_file, _53
	movq	%rax, %rcx	 ; _53,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _54
 ; D:\TC\src\parser.c:699:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp253
	movq	%rdx, %r8	 ; _54,
	movq	%rax, %rdx	 ; tmp253,
	leaq	.LC87(%rip), %rax	 ;, tmp254
	movq	%rax, %rcx	 ; tmp254,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:700:                 return NULL;
	movl	$0, %eax	 ;, _76
	jmp	.L220	 ;
.L240:
 ; D:\TC\src\parser.c:702:             if (token->type != IDENTIFIER) {
	movq	-8(%rbp), %rax	 ; token, tmp255
	movl	24(%rax), %eax	 ; token_120->type, _55
 ; D:\TC\src\parser.c:702:             if (token->type != IDENTIFIER) {
	cmpl	$1, %eax	 ;, _55
	je	.L241	 ;,
 ; D:\TC\src\parser.c:703:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp256
	movq	(%rax), %rax	 ; parser_97(D)->source_file, _56
	movq	%rax, %rcx	 ; _56,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _57
 ; D:\TC\src\parser.c:703:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp257
	movq	%rdx, %r8	 ; _57,
	movq	%rax, %rdx	 ; tmp257,
	leaq	.LC88(%rip), %rax	 ;, tmp258
	movq	%rax, %rcx	 ; tmp258,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:704:                 return NULL;
	movl	$0, %eax	 ;, _76
	jmp	.L220	 ;
.L241:
 ; D:\TC\src\parser.c:706:             base_name = search_name(var_scope, token->lexeme);
	movq	-8(%rbp), %rax	 ; token, tmp259
	movq	(%rax), %rdx	 ; token_120->lexeme, _58
	movq	-32(%rbp), %rax	 ; var_scope, tmp260
	movq	%rax, %rcx	 ; tmp260,
	call	search_name	 ;
	movq	%rax, -24(%rbp)	 ; tmp261, base_name
 ; D:\TC\src\parser.c:707:             if (base_name == NULL) {
	cmpq	$0, -24(%rbp)	 ;, base_name
	jne	.L242	 ;,
 ; D:\TC\src\parser.c:708:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp262
	movq	(%rax), %rax	 ; parser_97(D)->source_file, _59
	movq	%rax, %rcx	 ; _59,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _60
 ; D:\TC\src\parser.c:708:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp263
	movq	%rdx, %r8	 ; _60,
	movq	%rax, %rdx	 ; tmp263,
	leaq	.LC89(%rip), %rax	 ;, tmp264
	movq	%rax, %rcx	 ; tmp264,
	call	parser_error	 ;
 ; D:\TC\src\parser.c:709:                 return NULL;
	movl	$0, %eax	 ;, _76
	jmp	.L220	 ;
.L242:
 ; D:\TC\src\parser.c:711:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	-24(%rbp), %rdx	 ; base_name, tmp265
	movq	-40(%rbp), %rax	 ; base, tmp266
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp265,
	movq	%rax, %rdx	 ; tmp266,
	movl	$2, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, -40(%rbp)	 ; tmp267, base
 ; D:\TC\src\parser.c:712:             current_type = NULL;
	movq	$0, -16(%rbp)	 ;, current_type
 ; D:\TC\src\parser.c:713:             var_scope = NULL;
	movq	$0, -32(%rbp)	 ;, var_scope
.L234:
 ; D:\TC\src\parser.c:716:         token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp268
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp268,
	call	peek_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp269, token
.L221:
 ; D:\TC\src\parser.c:644:     while (token->type == SYMBOL) {
	movq	-8(%rbp), %rax	 ; token, tmp270
	movl	24(%rax), %eax	 ; token_63->type, _61
 ; D:\TC\src\parser.c:644:     while (token->type == SYMBOL) {
	cmpl	$5, %eax	 ;, _61
	je	.L244	 ;,
	jmp	.L243	 ;
.L245:
 ; D:\TC\src\parser.c:715:             break;
	nop	
.L243:
 ; D:\TC\src\parser.c:718:     return base;
	movq	-40(%rbp), %rax	 ; base, _76
.L220:
 ; D:\TC\src\parser.c:719: }
	leave	
	ret	
	.ident	"GCC: (GNU) 13.2.0"
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
	.def	create_symbol;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	create_code;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	search_name;	.scl	2;	.type	32;	.endef
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
	.section	.rdata$.refptr.CONSTRUCTOR_NAME, "dr"
	.globl	.refptr.CONSTRUCTOR_NAME
	.linkonce	discard
.refptr.CONSTRUCTOR_NAME:
	.quad	CONSTRUCTOR_NAME
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
