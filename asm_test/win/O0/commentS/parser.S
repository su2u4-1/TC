	.file	"parser.c"
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
 ; D:/TC/src/parser.c:23:     if (builtin_scope == NULL) {
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp125
	movq	(%rax), %rax	 ; builtin_scope, builtin_scope.0_1
 ; D:/TC/src/parser.c:23:     if (builtin_scope == NULL) {
	testq	%rax, %rax	 ; builtin_scope.0_1
	jne	.L2	 ;,
 ; D:/TC/src/parser.c:24:         builtin_scope = create_symbol_table(NULL);
	movl	$0, %ecx	 ;,
	call	create_symbol_table	 ;
 ; D:/TC/src/parser.c:24:         builtin_scope = create_symbol_table(NULL);
	movq	.refptr.builtin_scope(%rip), %rdx	 ;, tmp126
	movq	%rax, (%rdx)	 ; _2, builtin_scope
 ; D:/TC/src/parser.c:25:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp127
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope.1_3
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp128
	movq	(%rax), %rax	 ; VOID_KEYWORD, VOID_KEYWORD.2_4
	movq	%rdx, %r9	 ; builtin_scope.1_3,
	movl	$0, %r8d	 ;,
	movl	$6, %edx	 ;,
	movq	%rax, %rcx	 ; VOID_KEYWORD.2_4,
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:25:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp129
	movq	%rax, (%rdx)	 ; _5, name_void
 ; D:/TC/src/parser.c:26:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp130
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope.3_6
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp131
	movq	(%rax), %rax	 ; INT_KEYWORD, INT_KEYWORD.4_7
	movq	%rdx, %r9	 ; builtin_scope.3_6,
	movl	$0, %r8d	 ;,
	movl	$6, %edx	 ;,
	movq	%rax, %rcx	 ; INT_KEYWORD.4_7,
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:26:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp132
	movq	%rax, (%rdx)	 ; _8, name_int
 ; D:/TC/src/parser.c:27:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp133
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope.5_9
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp134
	movq	(%rax), %rax	 ; FLOAT_KEYWORD, FLOAT_KEYWORD.6_10
	movq	%rdx, %r9	 ; builtin_scope.5_9,
	movl	$0, %r8d	 ;,
	movl	$6, %edx	 ;,
	movq	%rax, %rcx	 ; FLOAT_KEYWORD.6_10,
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:27:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp135
	movq	%rax, (%rdx)	 ; _11, name_float
 ; D:/TC/src/parser.c:28:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp136
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope.7_12
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp137
	movq	(%rax), %rax	 ; STRING_KEYWORD, STRING_KEYWORD.8_13
	movq	%rdx, %r9	 ; builtin_scope.7_12,
	movl	$0, %r8d	 ;,
	movl	$6, %edx	 ;,
	movq	%rax, %rcx	 ; STRING_KEYWORD.8_13,
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:28:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp138
	movq	%rax, (%rdx)	 ; _14, name_string
 ; D:/TC/src/parser.c:29:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp139
	movq	(%rax), %rdx	 ; builtin_scope, builtin_scope.9_15
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp140
	movq	(%rax), %rax	 ; BOOL_KEYWORD, BOOL_KEYWORD.10_16
	movq	%rdx, %r9	 ; builtin_scope.9_15,
	movl	$0, %r8d	 ;,
	movl	$6, %edx	 ;,
	movq	%rax, %rcx	 ; BOOL_KEYWORD.10_16,
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:29:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp141
	movq	%rax, (%rdx)	 ; _17, name_bool
.L2:
 ; D:/TC/src/parser.c:31:     if (now_scope == NULL)
	cmpq	$0, 24(%rbp)	 ;, now_scope
	jne	.L3	 ;,
 ; D:/TC/src/parser.c:32:         now_scope = builtin_scope;
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp142
	movq	(%rax), %rax	 ; builtin_scope, tmp143
	movq	%rax, 24(%rbp)	 ; tmp143, now_scope
.L3:
 ; D:/TC/src/parser.c:33:     Token* token = NULL;
	movq	$0, -8(%rbp)	 ;, token
 ; D:/TC/src/parser.c:34:     list(CodeMember*) members = create_list();
	call	create_list	 ;
	movq	%rax, -16(%rbp)	 ; tmp144, members
 ; D:/TC/src/parser.c:35:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	24(%rbp), %rax	 ; now_scope, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	create_symbol_table	 ;
	movq	%rax, -24(%rbp)	 ; tmp146, global_scope
 ; D:/TC/src/parser.c:36:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp147
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp147,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp148, token
 ; D:/TC/src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	jmp	.L4	 ;
.L13:
 ; D:/TC/src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movq	-8(%rbp), %rax	 ; token, tmp149
	movl	24(%rax), %eax	 ; token_43->type, _18
 ; D:/TC/src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	 ;, _18
	jne	.L5	 ;,
 ; D:/TC/src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax	 ;, tmp150
	movq	(%rax), %rdx	 ; IMPORT_KEYWORD, IMPORT_KEYWORD.11_19
	movq	-8(%rbp), %rax	 ; token, tmp151
	movq	(%rax), %rax	 ; token_43->lexeme, _20
	movq	%rax, %rcx	 ; _20,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	testb	%al, %al	 ; _21
	je	.L5	 ;,
 ; D:/TC/src/parser.c:39:             Import* import = parse_import(lexer, global_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp152
	movq	-24(%rbp), %rdx	 ; global_scope, tmp153
	movq	16(%rbp), %rax	 ; lexer, tmp154
	movq	%rcx, %r8	 ; tmp152,
	movq	%rax, %rcx	 ; tmp154,
	call	parse_import	 ;
	movq	%rax, -32(%rbp)	 ; tmp155, import
 ; D:/TC/src/parser.c:40:             if (import == NULL)
	cmpq	$0, -32(%rbp)	 ;, import
	jne	.L6	 ;,
 ; D:/TC/src/parser.c:41:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp156
	movq	(%rax), %rax	 ; parser_77(D)->source_file, _22
	movq	%rax, %rcx	 ; _22,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _23
 ; D:/TC/src/parser.c:41:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp157
	movq	%rdx, %r8	 ; _23,
	movq	%rax, %rdx	 ; tmp157,
	leaq	.LC0(%rip), %rax	 ;, tmp158
	movq	%rax, %rcx	 ; tmp158,
	call	parser_error	 ;
.L6:
 ; D:/TC/src/parser.c:42:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	-32(%rbp), %rax	 ; import, tmp159
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp159,
	movl	$0, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ;, _24
 ; D:/TC/src/parser.c:42:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	-16(%rbp), %rax	 ; members, tmp160
	movq	%rax, %rcx	 ; tmp160,
	call	list_append	 ;
 ; D:/TC/src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	jmp	.L7	 ;
.L5:
 ; D:/TC/src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	-8(%rbp), %rax	 ; token, tmp161
	movl	24(%rax), %eax	 ; token_43->type, _25
 ; D:/TC/src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	cmpl	$6, %eax	 ;, _25
	jne	.L8	 ;,
 ; D:/TC/src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	.refptr.FUNC_KEYWORD(%rip), %rax	 ;, tmp162
	movq	(%rax), %rdx	 ; FUNC_KEYWORD, FUNC_KEYWORD.12_26
	movq	-8(%rbp), %rax	 ; token, tmp163
	movq	(%rax), %rax	 ; token_43->lexeme, _27
	movq	%rax, %rcx	 ; _27,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	testb	%al, %al	 ; _28
	je	.L8	 ;,
 ; D:/TC/src/parser.c:44:             Function* function = parse_function(lexer, global_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp164
	movq	-24(%rbp), %rdx	 ; global_scope, tmp165
	movq	16(%rbp), %rax	 ; lexer, tmp166
	movq	%rcx, %r8	 ; tmp164,
	movq	%rax, %rcx	 ; tmp166,
	call	parse_function	 ;
	movq	%rax, -40(%rbp)	 ; tmp167, function
 ; D:/TC/src/parser.c:45:             if (function == NULL)
	cmpq	$0, -40(%rbp)	 ;, function
	jne	.L9	 ;,
 ; D:/TC/src/parser.c:46:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp168
	movq	(%rax), %rax	 ; parser_77(D)->source_file, _29
	movq	%rax, %rcx	 ; _29,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _30
 ; D:/TC/src/parser.c:46:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp169
	movq	%rdx, %r8	 ; _30,
	movq	%rax, %rdx	 ; tmp169,
	leaq	.LC1(%rip), %rax	 ;, tmp170
	movq	%rax, %rcx	 ; tmp170,
	call	parser_error	 ;
.L9:
 ; D:/TC/src/parser.c:47:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	-40(%rbp), %rax	 ; function, tmp171
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; tmp171,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ;, _31
 ; D:/TC/src/parser.c:47:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	-16(%rbp), %rax	 ; members, tmp172
	movq	%rax, %rcx	 ; tmp172,
	call	list_append	 ;
 ; D:/TC/src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	jmp	.L7	 ;
.L8:
 ; D:/TC/src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	-8(%rbp), %rax	 ; token, tmp173
	movl	24(%rax), %eax	 ; token_43->type, _32
 ; D:/TC/src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	cmpl	$6, %eax	 ;, _32
	jne	.L10	 ;,
 ; D:/TC/src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	.refptr.CLASS_KEYWORD(%rip), %rax	 ;, tmp174
	movq	(%rax), %rdx	 ; CLASS_KEYWORD, CLASS_KEYWORD.13_33
	movq	-8(%rbp), %rax	 ; token, tmp175
	movq	(%rax), %rax	 ; token_43->lexeme, _34
	movq	%rax, %rcx	 ; _34,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	testb	%al, %al	 ; _35
	je	.L10	 ;,
 ; D:/TC/src/parser.c:49:             Class* class = parse_class(lexer, global_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp176
	movq	-24(%rbp), %rdx	 ; global_scope, tmp177
	movq	16(%rbp), %rax	 ; lexer, tmp178
	movq	%rcx, %r8	 ; tmp176,
	movq	%rax, %rcx	 ; tmp178,
	call	parse_class	 ;
	movq	%rax, -48(%rbp)	 ; tmp179, class
 ; D:/TC/src/parser.c:50:             if (class == NULL)
	cmpq	$0, -48(%rbp)	 ;, class
	jne	.L11	 ;,
 ; D:/TC/src/parser.c:51:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp180
	movq	(%rax), %rax	 ; parser_77(D)->source_file, _36
	movq	%rax, %rcx	 ; _36,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _37
 ; D:/TC/src/parser.c:51:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp181
	movq	%rdx, %r8	 ; _37,
	movq	%rax, %rdx	 ; tmp181,
	leaq	.LC2(%rip), %rax	 ;, tmp182
	movq	%rax, %rcx	 ; tmp182,
	call	parser_error	 ;
.L11:
 ; D:/TC/src/parser.c:52:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	-48(%rbp), %rax	 ; class, tmp183
	movq	%rax, %r9	 ; tmp183,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$2, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ;, _38
 ; D:/TC/src/parser.c:52:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	-16(%rbp), %rax	 ; members, tmp184
	movq	%rax, %rcx	 ; tmp184,
	call	list_append	 ;
 ; D:/TC/src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	jmp	.L7	 ;
.L10:
 ; D:/TC/src/parser.c:54:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp185
	movq	(%rax), %rax	 ; parser_77(D)->source_file, _39
	movq	%rax, %rcx	 ; _39,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _40
 ; D:/TC/src/parser.c:54:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp186
	movq	%rdx, %r8	 ; _40,
	movq	%rax, %rdx	 ; tmp186,
	leaq	.LC3(%rip), %rax	 ;, tmp187
	movq	%rax, %rcx	 ; tmp187,
	call	parser_error	 ;
.L7:
 ; D:/TC/src/parser.c:55:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp188
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp188,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp189, token
.L4:
 ; D:/TC/src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	cmpq	$0, -8(%rbp)	 ;, token
	je	.L12	 ;,
 ; D:/TC/src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	movq	-8(%rbp), %rax	 ; token, tmp190
	movl	24(%rax), %eax	 ; token_43->type, _41
 ; D:/TC/src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	testl	%eax, %eax	 ; _41
	jne	.L13	 ;,
.L12:
 ; D:/TC/src/parser.c:58:     return create_code(members, global_scope);
	movq	-24(%rbp), %rdx	 ; global_scope, tmp191
	movq	-16(%rbp), %rax	 ; members, tmp192
	movq	%rax, %rcx	 ; tmp192,
	call	create_code	 ;
 ; D:/TC/src/parser.c:59: }
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
.LC7:
	.ascii "Failed to import module\0"
	.text
	.def	parse_import;	.scl	3;	.type	32;	.endef
parse_import:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$64, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:/TC/src/parser.c:62:     Token* token = NULL;
	movq	$0, -8(%rbp)	 ;, token
 ; D:/TC/src/parser.c:63:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp104
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp104,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp105, token
 ; D:/TC/src/parser.c:64:     if (token->type != IDENTIFIER) {
	movq	-8(%rbp), %rax	 ; token, tmp106
	movl	24(%rax), %eax	 ; token_33->type, _1
 ; D:/TC/src/parser.c:64:     if (token->type != IDENTIFIER) {
	cmpl	$1, %eax	 ;, _1
	je	.L16	 ;,
 ; D:/TC/src/parser.c:65:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp107
	movq	(%rax), %rax	 ; parser_44(D)->source_file, _2
	movq	%rax, %rcx	 ; _2,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _3
 ; D:/TC/src/parser.c:65:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp108
	movq	%rdx, %r8	 ; _3,
	movq	%rax, %rdx	 ; tmp108,
	leaq	.LC4(%rip), %rax	 ;, tmp109
	movq	%rax, %rcx	 ; tmp109,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:67:         return NULL;
	movl	$0, %eax	 ;, _24
	jmp	.L17	 ;
.L16:
 ; D:/TC/src/parser.c:69:     string import_name = token->lexeme;
	movq	-8(%rbp), %rax	 ; token, tmp110
	movq	(%rax), %rax	 ; token_33->lexeme, tmp111
	movq	%rax, -32(%rbp)	 ; tmp111, import_name
 ; D:/TC/src/parser.c:70:     string source = NULL;
	movq	$0, -16(%rbp)	 ;, source
 ; D:/TC/src/parser.c:71:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp112
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp112,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp113, token
 ; D:/TC/src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	-8(%rbp), %rax	 ; token, tmp114
	movl	24(%rax), %eax	 ; token_37->type, _4
 ; D:/TC/src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	cmpl	$6, %eax	 ;, _4
	jne	.L18	 ;,
 ; D:/TC/src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	.refptr.FROM_KEYWORD(%rip), %rax	 ;, tmp115
	movq	(%rax), %rdx	 ; FROM_KEYWORD, FROM_KEYWORD.14_5
	movq	-8(%rbp), %rax	 ; token, tmp116
	movq	(%rax), %rax	 ; token_37->lexeme, _6
	movq	%rax, %rcx	 ; _6,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	testb	%al, %al	 ; _7
	je	.L18	 ;,
 ; D:/TC/src/parser.c:73:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp117
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp117,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp118, token
 ; D:/TC/src/parser.c:74:         if (token->type != STRING) {
	movq	-8(%rbp), %rax	 ; token, tmp119
	movl	24(%rax), %eax	 ; token_40->type, _8
 ; D:/TC/src/parser.c:74:         if (token->type != STRING) {
	cmpl	$4, %eax	 ;, _8
	je	.L19	 ;,
 ; D:/TC/src/parser.c:75:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp120
	movq	(%rax), %rax	 ; parser_44(D)->source_file, _9
	movq	%rax, %rcx	 ; _9,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _10
 ; D:/TC/src/parser.c:75:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp121
	movq	%rdx, %r8	 ; _10,
	movq	%rax, %rdx	 ; tmp121,
	leaq	.LC5(%rip), %rax	 ;, tmp122
	movq	%rax, %rcx	 ; tmp122,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:77:             return NULL;
	movl	$0, %eax	 ;, _24
	jmp	.L17	 ;
.L19:
 ; D:/TC/src/parser.c:79:         source = token->lexeme;
	movq	-8(%rbp), %rax	 ; token, tmp123
	movq	(%rax), %rax	 ; token_40->lexeme, tmp124
	movq	%rax, -16(%rbp)	 ; tmp124, source
 ; D:/TC/src/parser.c:80:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp125
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp125,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp126, token
.L18:
 ; D:/TC/src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp127
	movl	24(%rax), %eax	 ; token_21->type, _11
 ; D:/TC/src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	 ;, _11
	jne	.L20	 ;,
 ; D:/TC/src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp128
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.15_12
	movq	-8(%rbp), %rax	 ; token, tmp129
	movq	(%rax), %rax	 ; token_21->lexeme, _13
	movq	%rax, %rcx	 ; _13,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; _14
	jne	.L21	 ;,
.L20:
 ; D:/TC/src/parser.c:83:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp130
	movq	(%rax), %rax	 ; parser_44(D)->source_file, _15
	movq	%rax, %rcx	 ; _15,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _16
 ; D:/TC/src/parser.c:83:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp131
	movq	%rdx, %r8	 ; _16,
	movq	%rax, %rdx	 ; tmp131,
	leaq	.LC6(%rip), %rax	 ;, tmp132
	movq	%rax, %rcx	 ; tmp132,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:85:         return NULL;
	movl	$0, %eax	 ;, _24
	jmp	.L17	 ;
.L21:
 ; D:/TC/src/parser.c:88:     name = parse_import_file(import_name, source, now_scope, parser->source_file);
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
 ; D:/TC/src/parser.c:89:     if (name == NULL) {
	cmpq	$0, -24(%rbp)	 ;, name
	jne	.L22	 ;,
 ; D:/TC/src/parser.c:90:         parser_error("Failed to import module", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp138
	movq	(%rax), %rax	 ; parser_44(D)->source_file, _18
	movq	%rax, %rcx	 ; _18,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _19
 ; D:/TC/src/parser.c:90:         parser_error("Failed to import module", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp139
	movq	%rdx, %r8	 ; _19,
	movq	%rax, %rdx	 ; tmp139,
	leaq	.LC7(%rip), %rax	 ;, tmp140
	movq	%rax, %rcx	 ; tmp140,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:91:         name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
	movq	.refptr.name_void(%rip), %rax	 ;, tmp141
	movq	(%rax), %rdx	 ; name_void, name_void.16_20
	movq	24(%rbp), %rcx	 ; now_scope, tmp142
	movq	-32(%rbp), %rax	 ; import_name, tmp143
	movq	%rcx, %r9	 ; tmp142,
	movq	%rdx, %r8	 ; name_void.16_20,
	movl	$3, %edx	 ;,
	movq	%rax, %rcx	 ; tmp143,
	call	create_symbol	 ;
	movq	%rax, -24(%rbp)	 ; tmp144, name
.L22:
 ; D:/TC/src/parser.c:94:     return create_import(name, source);
	movq	-16(%rbp), %rdx	 ; source, tmp145
	movq	-24(%rbp), %rax	 ; name, tmp146
	movq	%rax, %rcx	 ; tmp146,
	call	create_import	 ;
.L17:
 ; D:/TC/src/parser.c:95: }
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
 ; D:/TC/src/parser.c:98:     Token* token = NULL;
	movq	$0, -8(%rbp)	 ;, token
 ; D:/TC/src/parser.c:99:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	24(%rbp), %rax	 ; now_scope, tmp142
	movq	%rax, %rcx	 ; tmp142,
	call	create_symbol_table	 ;
	movq	%rax, -24(%rbp)	 ; tmp143, function_scope
 ; D:/TC/src/parser.c:100:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp144
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp144,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp145, token
 ; D:/TC/src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-8(%rbp), %rax	 ; token, tmp146
	movl	24(%rax), %eax	 ; token_86->type, _1
 ; D:/TC/src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _1
	je	.L24	 ;,
 ; D:/TC/src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-8(%rbp), %rax	 ; token, tmp147
	movl	24(%rax), %eax	 ; token_86->type, _2
 ; D:/TC/src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _2
	jne	.L25	 ;,
 ; D:/TC/src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-8(%rbp), %rax	 ; token, tmp148
	movq	(%rax), %rax	 ; token_86->lexeme, _3
	movq	%rax, %rcx	 ; _3,
	call	is_builtin_type	 ;
 ; D:/TC/src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; _4
	jne	.L24	 ;,
.L25:
 ; D:/TC/src/parser.c:102:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp149
	movq	(%rax), %rax	 ; parser_88(D)->source_file, _5
	movq	%rax, %rcx	 ; _5,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _6
 ; D:/TC/src/parser.c:102:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp150
	movq	%rdx, %r8	 ; _6,
	movq	%rax, %rdx	 ; tmp150,
	leaq	.LC8(%rip), %rax	 ;, tmp151
	movq	%rax, %rcx	 ; tmp151,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:104:         return NULL;
	movl	$0, %eax	 ;, _63
	jmp	.L26	 ;
.L24:
 ; D:/TC/src/parser.c:106:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	-8(%rbp), %rax	 ; token, tmp152
	movq	(%rax), %rdx	 ; token_86->lexeme, _7
	movq	24(%rbp), %rax	 ; now_scope, tmp153
	movq	%rax, %rcx	 ; tmp153,
	call	search_name	 ;
	movq	%rax, -32(%rbp)	 ; tmp154, return_type
 ; D:/TC/src/parser.c:107:     if (return_type == NULL) {
	cmpq	$0, -32(%rbp)	 ;, return_type
	jne	.L27	 ;,
 ; D:/TC/src/parser.c:108:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp155
	movq	(%rax), %rax	 ; parser_88(D)->source_file, _8
	movq	%rax, %rcx	 ; _8,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _9
 ; D:/TC/src/parser.c:108:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp156
	movq	%rdx, %r8	 ; _9,
	movq	%rax, %rdx	 ; tmp156,
	leaq	.LC9(%rip), %rax	 ;, tmp157
	movq	%rax, %rcx	 ; tmp157,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:110:         return NULL;
	movl	$0, %eax	 ;, _63
	jmp	.L26	 ;
.L27:
 ; D:/TC/src/parser.c:112:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp158
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp158,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp159, token
 ; D:/TC/src/parser.c:113:     if (token->type != IDENTIFIER) {
	movq	-8(%rbp), %rax	 ; token, tmp160
	movl	24(%rax), %eax	 ; token_95->type, _10
 ; D:/TC/src/parser.c:113:     if (token->type != IDENTIFIER) {
	cmpl	$1, %eax	 ;, _10
	je	.L28	 ;,
 ; D:/TC/src/parser.c:114:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp161
	movq	(%rax), %rax	 ; parser_88(D)->source_file, _11
	movq	%rax, %rcx	 ; _11,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _12
 ; D:/TC/src/parser.c:114:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp162
	movq	%rdx, %r8	 ; _12,
	movq	%rax, %rdx	 ; tmp162,
	leaq	.LC10(%rip), %rax	 ;, tmp163
	movq	%rax, %rcx	 ; tmp163,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:116:         return NULL;
	movl	$0, %eax	 ;, _63
	jmp	.L26	 ;
.L28:
 ; D:/TC/src/parser.c:118:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -40(%rbp)	 ; tmp164, function
 ; D:/TC/src/parser.c:119:     function->function_scope = function_scope;
	movq	-40(%rbp), %rax	 ; function, tmp165
	movq	-24(%rbp), %rdx	 ; function_scope, tmp166
	movq	%rdx, 32(%rax)	 ; tmp166, function_97->function_scope
 ; D:/TC/src/parser.c:120:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	-8(%rbp), %rax	 ; token, tmp167
	movq	(%rax), %rax	 ; token_95->lexeme, _13
	movq	-40(%rbp), %rcx	 ; function, tmp168
	movq	-32(%rbp), %rdx	 ; return_type, tmp169
	movq	%rcx, %r9	 ; tmp168,
	movq	%rdx, %r8	 ; tmp169,
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; _13,
	call	create_symbol	 ;
	movq	%rax, -48(%rbp)	 ; tmp170, name
 ; D:/TC/src/parser.c:121:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp171
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp171,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp172, token
 ; D:/TC/src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp173
	movl	24(%rax), %eax	 ; token_102->type, _14
 ; D:/TC/src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _14
	jne	.L29	 ;,
 ; D:/TC/src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp174
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.17_15
	movq	-8(%rbp), %rax	 ; token, tmp175
	movq	(%rax), %rax	 ; token_102->lexeme, _16
	movq	%rax, %rcx	 ; _16,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _17
	jne	.L30	 ;,
.L29:
 ; D:/TC/src/parser.c:123:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp176
	movq	(%rax), %rax	 ; parser_88(D)->source_file, _18
	movq	%rax, %rcx	 ; _18,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _19
 ; D:/TC/src/parser.c:123:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp177
	movq	%rdx, %r8	 ; _19,
	movq	%rax, %rdx	 ; tmp177,
	leaq	.LC11(%rip), %rax	 ;, tmp178
	movq	%rax, %rcx	 ; tmp178,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:125:         return NULL;
	movl	$0, %eax	 ;, _63
	jmp	.L26	 ;
.L30:
 ; D:/TC/src/parser.c:127:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp179
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp179,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp180, token
 ; D:/TC/src/parser.c:128:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rax, -56(%rbp)	 ; tmp181, parameters
 ; D:/TC/src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L31	 ;
.L38:
 ; D:/TC/src/parser.c:130:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp182
	movq	-24(%rbp), %rdx	 ; function_scope, tmp183
	movq	16(%rbp), %rax	 ; lexer, tmp184
	movq	%rcx, %r8	 ; tmp182,
	movq	%rax, %rcx	 ; tmp184,
	call	parse_variable	 ;
	movq	%rax, -80(%rbp)	 ; tmp185, parameter
 ; D:/TC/src/parser.c:131:         if (parameter == NULL)
	cmpq	$0, -80(%rbp)	 ;, parameter
	jne	.L32	 ;,
 ; D:/TC/src/parser.c:132:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp186
	movq	(%rax), %rax	 ; parser_88(D)->source_file, _20
	movq	%rax, %rcx	 ; _20,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _21
 ; D:/TC/src/parser.c:132:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp187
	movq	%rdx, %r8	 ; _21,
	movq	%rax, %rdx	 ; tmp187,
	leaq	.LC12(%rip), %rax	 ;, tmp188
	movq	%rax, %rcx	 ; tmp188,
	call	parser_error	 ;
	jmp	.L33	 ;
.L32:
 ; D:/TC/src/parser.c:133:         else if (parameter->value != NULL)
	movq	-80(%rbp), %rax	 ; parameter, tmp189
	movq	16(%rax), %rax	 ; parameter_140->value, _22
 ; D:/TC/src/parser.c:133:         else if (parameter->value != NULL)
	testq	%rax, %rax	 ; _22
	je	.L34	 ;,
 ; D:/TC/src/parser.c:134:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp190
	movq	(%rax), %rax	 ; parser_88(D)->source_file, _23
	movq	%rax, %rcx	 ; _23,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _24
 ; D:/TC/src/parser.c:134:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp191
	movq	%rdx, %r8	 ; _24,
	movq	%rax, %rdx	 ; tmp191,
	leaq	.LC13(%rip), %rax	 ;, tmp192
	movq	%rax, %rcx	 ; tmp192,
	call	parser_error	 ;
	jmp	.L33	 ;
.L34:
 ; D:/TC/src/parser.c:136:             list_append(parameters, (pointer)parameter);
	movq	-80(%rbp), %rdx	 ; parameter, tmp193
	movq	-56(%rbp), %rax	 ; parameters, tmp194
	movq	%rax, %rcx	 ; tmp194,
	call	list_append	 ;
.L33:
 ; D:/TC/src/parser.c:137:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp195
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp195,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp196, token
 ; D:/TC/src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp197
	movl	24(%rax), %eax	 ; token_147->type, _25
 ; D:/TC/src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, %eax	 ;, _25
	jne	.L35	 ;,
 ; D:/TC/src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp198
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL.18_26
	movq	-8(%rbp), %rax	 ; token, tmp199
	movq	(%rax), %rax	 ; token_147->lexeme, _27
	movq	%rax, %rcx	 ; _27,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; _28
	je	.L35	 ;,
 ; D:/TC/src/parser.c:139:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp200
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp200,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp201, token
 ; D:/TC/src/parser.c:139:             token = get_next_token(lexer, true);
	jmp	.L31	 ;
.L35:
 ; D:/TC/src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp202
	movl	24(%rax), %eax	 ; token_147->type, _29
 ; D:/TC/src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _29
	jne	.L37	 ;,
 ; D:/TC/src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp203
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.19_30
	movq	-8(%rbp), %rax	 ; token, tmp204
	movq	(%rax), %rax	 ; token_147->lexeme, _31
	movq	%rax, %rcx	 ; _31,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _32
	jne	.L31	 ;,
.L37:
 ; D:/TC/src/parser.c:141:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp205
	movq	(%rax), %rax	 ; parser_88(D)->source_file, _33
	movq	%rax, %rcx	 ; _33,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _34
 ; D:/TC/src/parser.c:141:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp206
	movq	%rdx, %r8	 ; _34,
	movq	%rax, %rdx	 ; tmp206,
	leaq	.LC14(%rip), %rax	 ;, tmp207
	movq	%rax, %rcx	 ; tmp207,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:143:             return NULL;
	movl	$0, %eax	 ;, _63
	jmp	.L26	 ;
.L31:
 ; D:/TC/src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp208
	movl	24(%rax), %eax	 ; token_59->type, _35
 ; D:/TC/src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _35
	jne	.L38	 ;,
 ; D:/TC/src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp209
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.20_36
	movq	-8(%rbp), %rax	 ; token, tmp210
	movq	(%rax), %rax	 ; token_59->lexeme, _37
	movq	%rax, %rcx	 ; _37,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _38
	je	.L38	 ;,
 ; D:/TC/src/parser.c:146:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp211
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp211,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp212, token
 ; D:/TC/src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp213
	movl	24(%rax), %eax	 ; token_110->type, _39
 ; D:/TC/src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _39
	jne	.L39	 ;,
 ; D:/TC/src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp214
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.21_40
	movq	-8(%rbp), %rax	 ; token, tmp215
	movq	(%rax), %rax	 ; token_110->lexeme, _41
	movq	%rax, %rcx	 ; _41,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _42
	jne	.L40	 ;,
.L39:
 ; D:/TC/src/parser.c:148:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp216
	movq	(%rax), %rax	 ; parser_88(D)->source_file, _43
	movq	%rax, %rcx	 ; _43,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _44
 ; D:/TC/src/parser.c:148:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp217
	movq	%rdx, %r8	 ; _44,
	movq	%rax, %rdx	 ; tmp217,
	leaq	.LC15(%rip), %rax	 ;, tmp218
	movq	%rax, %rcx	 ; tmp218,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:150:         return NULL;
	movl	$0, %eax	 ;, _63
	jmp	.L26	 ;
.L40:
 ; D:/TC/src/parser.c:152:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, -64(%rbp)	 ; tmp219, body
 ; D:/TC/src/parser.c:153:     parser->in_function = true;
	movq	32(%rbp), %rax	 ; parser, tmp220
	movb	$1, 8(%rax)	 ;, parser_88(D)->in_function
 ; D:/TC/src/parser.c:154:     bool have_return = false;
	movb	$0, -9(%rbp)	 ;, have_return
 ; D:/TC/src/parser.c:155:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp221
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp221,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp222, token
 ; D:/TC/src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L41	 ;
.L45:
 ; D:/TC/src/parser.c:157:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp223
	movq	-24(%rbp), %rdx	 ; function_scope, tmp224
	movq	16(%rbp), %rax	 ; lexer, tmp225
	movq	%rcx, %r8	 ; tmp223,
	movq	%rax, %rcx	 ; tmp225,
	call	parse_statement	 ;
	movq	%rax, -72(%rbp)	 ; tmp226, statement
 ; D:/TC/src/parser.c:158:         if (statement == NULL)
	cmpq	$0, -72(%rbp)	 ;, statement
	jne	.L42	 ;,
 ; D:/TC/src/parser.c:159:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp227
	movq	(%rax), %rax	 ; parser_88(D)->source_file, _45
	movq	%rax, %rcx	 ; _45,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _46
 ; D:/TC/src/parser.c:159:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp228
	movq	%rdx, %r8	 ; _46,
	movq	%rax, %rdx	 ; tmp228,
	leaq	.LC16(%rip), %rax	 ;, tmp229
	movq	%rax, %rcx	 ; tmp229,
	call	parser_error	 ;
	jmp	.L43	 ;
.L42:
 ; D:/TC/src/parser.c:160:         else if (have_return)
	cmpb	$0, -9(%rbp)	 ;, have_return
	je	.L43	 ;,
 ; D:/TC/src/parser.c:161:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp230
	movq	(%rax), %rax	 ; parser_88(D)->source_file, _47
	movq	%rax, %rcx	 ; _47,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _48
 ; D:/TC/src/parser.c:161:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp231
	movq	%rdx, %r8	 ; _48,
	movq	%rax, %rdx	 ; tmp231,
	leaq	.LC17(%rip), %rax	 ;, tmp232
	movq	%rax, %rcx	 ; tmp232,
	call	parser_error	 ;
.L43:
 ; D:/TC/src/parser.c:162:         if (statement != NULL && statement->type == RETURN_STATEMENT)
	cmpq	$0, -72(%rbp)	 ;, statement
	je	.L44	 ;,
 ; D:/TC/src/parser.c:162:         if (statement != NULL && statement->type == RETURN_STATEMENT)
	movq	-72(%rbp), %rax	 ; statement, tmp233
	movl	8(%rax), %eax	 ; statement_127->type, _49
 ; D:/TC/src/parser.c:162:         if (statement != NULL && statement->type == RETURN_STATEMENT)
	cmpl	$5, %eax	 ;, _49
	jne	.L44	 ;,
 ; D:/TC/src/parser.c:163:             have_return = true;
	movb	$1, -9(%rbp)	 ;, have_return
.L44:
 ; D:/TC/src/parser.c:164:         list_append(body, (pointer)statement);
	movq	-72(%rbp), %rdx	 ; statement, tmp234
	movq	-64(%rbp), %rax	 ; body, tmp235
	movq	%rax, %rcx	 ; tmp235,
	call	list_append	 ;
 ; D:/TC/src/parser.c:165:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp236
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp236,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp237, token
.L41:
 ; D:/TC/src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp238
	movl	24(%rax), %eax	 ; token_60->type, _50
 ; D:/TC/src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _50
	jne	.L45	 ;,
 ; D:/TC/src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp239
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.22_51
	movq	-8(%rbp), %rax	 ; token, tmp240
	movq	(%rax), %rax	 ; token_60->lexeme, _52
	movq	%rax, %rcx	 ; _52,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _53
	je	.L45	 ;,
 ; D:/TC/src/parser.c:167:     parser->in_function = false;
	movq	32(%rbp), %rax	 ; parser, tmp241
	movb	$0, 8(%rax)	 ;, parser_88(D)->in_function
 ; D:/TC/src/parser.c:168:     if (!have_return && return_type != name_void)
	cmpb	$0, -9(%rbp)	 ;, have_return
	jne	.L46	 ;,
 ; D:/TC/src/parser.c:168:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp242
	movq	(%rax), %rax	 ; name_void, name_void.23_54
 ; D:/TC/src/parser.c:168:     if (!have_return && return_type != name_void)
	cmpq	%rax, -32(%rbp)	 ; name_void.23_54, return_type
	je	.L46	 ;,
 ; D:/TC/src/parser.c:169:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp243
	movq	(%rax), %rax	 ; parser_88(D)->source_file, _55
	movq	%rax, %rcx	 ; _55,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _56
 ; D:/TC/src/parser.c:169:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp244
	movq	%rdx, %r8	 ; _56,
	movq	%rax, %rdx	 ; tmp244,
	leaq	.LC18(%rip), %rax	 ;, tmp245
	movq	%rax, %rcx	 ; tmp245,
	call	parser_error	 ;
.L46:
 ; D:/TC/src/parser.c:170:     if (!have_return && return_type == name_void)
	cmpb	$0, -9(%rbp)	 ;, have_return
	jne	.L47	 ;,
 ; D:/TC/src/parser.c:170:     if (!have_return && return_type == name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp246
	movq	(%rax), %rax	 ; name_void, name_void.24_57
 ; D:/TC/src/parser.c:170:     if (!have_return && return_type == name_void)
	cmpq	%rax, -32(%rbp)	 ; name_void.24_57, return_type
	jne	.L47	 ;,
 ; D:/TC/src/parser.c:171:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdx	 ;, _58
 ; D:/TC/src/parser.c:171:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	-64(%rbp), %rax	 ; body, tmp247
	movq	%rax, %rcx	 ; tmp247,
	call	list_append	 ;
.L47:
 ; D:/TC/src/parser.c:173:     return create_function_use_ptr(function, name, return_type, parameters, body, function_scope);
	movq	-56(%rbp), %r9	 ; parameters, tmp248
	movq	-32(%rbp), %r8	 ; return_type, tmp249
	movq	-48(%rbp), %rdx	 ; name, tmp250
	movq	-40(%rbp), %rax	 ; function, tmp251
	movq	-24(%rbp), %rcx	 ; function_scope, tmp252
	movq	%rcx, 40(%rsp)	 ; tmp252,
	movq	-64(%rbp), %rcx	 ; body, tmp253
	movq	%rcx, 32(%rsp)	 ; tmp253,
	movq	%rax, %rcx	 ; tmp251,
	call	create_function_use_ptr	 ;
.L26:
 ; D:/TC/src/parser.c:174: }
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
	subq	$144, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; class_name, class_name
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:/TC/src/parser.c:177:     Token* token = NULL;
	movq	$0, -8(%rbp)	 ;, token
 ; D:/TC/src/parser.c:178:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	24(%rbp), %rax	 ; now_scope, tmp152
	movq	%rax, %rcx	 ; tmp152,
	call	create_symbol_table	 ;
	movq	%rax, -24(%rbp)	 ; tmp153, method_scope
 ; D:/TC/src/parser.c:179:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp154
	movq	(%rax), %rax	 ; SELF_KEYWORD, SELF_KEYWORD.25_1
	movq	-24(%rbp), %rcx	 ; method_scope, tmp155
	movq	32(%rbp), %rdx	 ; class_name, tmp156
	movq	%rcx, %r9	 ; tmp155,
	movq	%rdx, %r8	 ; tmp156,
	movl	$3, %edx	 ;,
	movq	%rax, %rcx	 ; SELF_KEYWORD.25_1,
	call	create_symbol	 ;
	movq	%rax, -32(%rbp)	 ; tmp157, self
 ; D:/TC/src/parser.c:180:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp158
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp158,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp159, token
 ; D:/TC/src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-8(%rbp), %rax	 ; token, tmp160
	movl	24(%rax), %eax	 ; token_102->type, _2
 ; D:/TC/src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _2
	je	.L49	 ;,
 ; D:/TC/src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-8(%rbp), %rax	 ; token, tmp161
	movl	24(%rax), %eax	 ; token_102->type, _3
 ; D:/TC/src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _3
	jne	.L50	 ;,
 ; D:/TC/src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-8(%rbp), %rax	 ; token, tmp162
	movq	(%rax), %rax	 ; token_102->lexeme, _4
	movq	%rax, %rcx	 ; _4,
	call	is_builtin_type	 ;
 ; D:/TC/src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; _5
	jne	.L49	 ;,
.L50:
 ; D:/TC/src/parser.c:182:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp163
	movq	(%rax), %rax	 ; parser_104(D)->source_file, _6
	movq	%rax, %rcx	 ; _6,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _7
 ; D:/TC/src/parser.c:182:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp164
	movq	%rdx, %r8	 ; _7,
	movq	%rax, %rdx	 ; tmp164,
	leaq	.LC19(%rip), %rax	 ;, tmp165
	movq	%rax, %rcx	 ; tmp165,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:184:         return NULL;
	movl	$0, %eax	 ;, _73
	jmp	.L51	 ;
.L49:
 ; D:/TC/src/parser.c:186:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	-8(%rbp), %rax	 ; token, tmp166
	movq	(%rax), %rdx	 ; token_102->lexeme, _8
	movq	24(%rbp), %rax	 ; now_scope, tmp167
	movq	%rax, %rcx	 ; tmp167,
	call	search_name	 ;
	movq	%rax, -40(%rbp)	 ; tmp168, return_type
 ; D:/TC/src/parser.c:187:     if (return_type == NULL) {
	cmpq	$0, -40(%rbp)	 ;, return_type
	jne	.L52	 ;,
 ; D:/TC/src/parser.c:188:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp169
	movq	(%rax), %rax	 ; parser_104(D)->source_file, _9
	movq	%rax, %rcx	 ; _9,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _10
 ; D:/TC/src/parser.c:188:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp170
	movq	%rdx, %r8	 ; _10,
	movq	%rax, %rdx	 ; tmp170,
	leaq	.LC20(%rip), %rax	 ;, tmp171
	movq	%rax, %rcx	 ; tmp171,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:190:         return NULL;
	movl	$0, %eax	 ;, _73
	jmp	.L51	 ;
.L52:
 ; D:/TC/src/parser.c:192:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp172
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp172,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp173, token
 ; D:/TC/src/parser.c:193:     if (token->type != IDENTIFIER) {
	movq	-8(%rbp), %rax	 ; token, tmp174
	movl	24(%rax), %eax	 ; token_111->type, _11
 ; D:/TC/src/parser.c:193:     if (token->type != IDENTIFIER) {
	cmpl	$1, %eax	 ;, _11
	je	.L53	 ;,
 ; D:/TC/src/parser.c:194:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp175
	movq	(%rax), %rax	 ; parser_104(D)->source_file, _12
	movq	%rax, %rcx	 ; _12,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _13
 ; D:/TC/src/parser.c:194:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp176
	movq	%rdx, %r8	 ; _13,
	movq	%rax, %rdx	 ; tmp176,
	leaq	.LC21(%rip), %rax	 ;, tmp177
	movq	%rax, %rcx	 ; tmp177,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:196:         return NULL;
	movl	$0, %eax	 ;, _73
	jmp	.L51	 ;
.L53:
 ; D:/TC/src/parser.c:198:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -48(%rbp)	 ; tmp178, method
 ; D:/TC/src/parser.c:199:     method->method_scope = method_scope;
	movq	-48(%rbp), %rax	 ; method, tmp179
	movq	-24(%rbp), %rdx	 ; method_scope, tmp180
	movq	%rdx, 32(%rax)	 ; tmp180, method_113->method_scope
 ; D:/TC/src/parser.c:200:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	-8(%rbp), %rax	 ; token, tmp181
	movq	(%rax), %rdx	 ; token_111->lexeme, _14
	movq	32(%rbp), %rax	 ; class_name, tmp182
	movq	8(%rax), %rax	 ; class_name_97(D)->name, _15
	movq	%rax, %rcx	 ; _15,
	call	make_method_name	 ;
 ; D:/TC/src/parser.c:200:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	-48(%rbp), %rcx	 ; method, tmp183
	movq	-40(%rbp), %rdx	 ; return_type, tmp184
	movq	%rcx, %r9	 ; tmp183,
	movq	%rdx, %r8	 ; tmp184,
	movl	$2, %edx	 ;,
	movq	%rax, %rcx	 ; _16,
	call	create_symbol	 ;
	movq	%rax, -56(%rbp)	 ; tmp185, name
 ; D:/TC/src/parser.c:201:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp186
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp186,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp187, token
 ; D:/TC/src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp188
	movl	24(%rax), %eax	 ; token_119->type, _17
 ; D:/TC/src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _17
	jne	.L54	 ;,
 ; D:/TC/src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp189
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.26_18
	movq	-8(%rbp), %rax	 ; token, tmp190
	movq	(%rax), %rax	 ; token_119->lexeme, _19
	movq	%rax, %rcx	 ; _19,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _20
	jne	.L55	 ;,
.L54:
 ; D:/TC/src/parser.c:203:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp191
	movq	(%rax), %rax	 ; parser_104(D)->source_file, _21
	movq	%rax, %rcx	 ; _21,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _22
 ; D:/TC/src/parser.c:203:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp192
	movq	%rdx, %r8	 ; _22,
	movq	%rax, %rdx	 ; tmp192,
	leaq	.LC22(%rip), %rax	 ;, tmp193
	movq	%rax, %rcx	 ; tmp193,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:205:         return NULL;
	movl	$0, %eax	 ;, _73
	jmp	.L51	 ;
.L55:
 ; D:/TC/src/parser.c:207:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp194
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp194,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp195, token
 ; D:/TC/src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	-8(%rbp), %rax	 ; token, tmp196
	movl	24(%rax), %eax	 ; token_122->type, _23
 ; D:/TC/src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	cmpl	$6, %eax	 ;, _23
	jne	.L56	 ;,
 ; D:/TC/src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp197
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD.27_24
	movq	-8(%rbp), %rax	 ; token, tmp198
	movq	(%rax), %rax	 ; token_122->lexeme, _25
	movq	%rax, %rcx	 ; _25,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	testb	%al, %al	 ; _26
	jne	.L57	 ;,
.L56:
 ; D:/TC/src/parser.c:209:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp199
	movq	(%rax), %rax	 ; parser_104(D)->source_file, _27
	movq	%rax, %rcx	 ; _27,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _28
 ; D:/TC/src/parser.c:209:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp200
	movq	%rdx, %r8	 ; _28,
	movq	%rax, %rdx	 ; tmp200,
	leaq	.LC23(%rip), %rax	 ;, tmp201
	movq	%rax, %rcx	 ; tmp201,
	call	parser_error	 ;
.L57:
 ; D:/TC/src/parser.c:210:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp202
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp202,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp203, token
 ; D:/TC/src/parser.c:211:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rax, -64(%rbp)	 ; tmp204, parameters
 ; D:/TC/src/parser.c:212:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	-32(%rbp), %rdx	 ; self, tmp205
	movq	32(%rbp), %rax	 ; class_name, tmp206
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp206,
	call	create_variable	 ;
	movq	%rax, %rdx	 ;, _29
 ; D:/TC/src/parser.c:212:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	-64(%rbp), %rax	 ; parameters, tmp207
	movq	%rax, %rcx	 ; tmp207,
	call	list_append	 ;
 ; D:/TC/src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L58	 ;
.L66:
 ; D:/TC/src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp208
	movl	24(%rax), %eax	 ; token_69->type, _30
 ; D:/TC/src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, %eax	 ;, _30
	jne	.L59	 ;,
 ; D:/TC/src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp209
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL.28_31
	movq	-8(%rbp), %rax	 ; token, tmp210
	movq	(%rax), %rax	 ; token_69->lexeme, _32
	movq	%rax, %rcx	 ; _32,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; _33
	je	.L59	 ;,
 ; D:/TC/src/parser.c:215:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp211
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp211,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp212, token
 ; D:/TC/src/parser.c:215:             token = get_next_token(lexer, true);
	nop	
 ; D:/TC/src/parser.c:221:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	40(%rbp), %rcx	 ; parser, tmp219
	movq	-24(%rbp), %rdx	 ; method_scope, tmp220
	movq	16(%rbp), %rax	 ; lexer, tmp221
	movq	%rcx, %r8	 ; tmp219,
	movq	%rax, %rcx	 ; tmp221,
	call	parse_variable	 ;
	movq	%rax, -72(%rbp)	 ; tmp222, parameter
 ; D:/TC/src/parser.c:222:         if (parameter == NULL)
	cmpq	$0, -72(%rbp)	 ;, parameter
	jne	.L63	 ;,
	jmp	.L76	 ;
.L59:
 ; D:/TC/src/parser.c:216:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	-8(%rbp), %rax	 ; token, tmp213
	movl	24(%rax), %eax	 ; token_69->type, _34
 ; D:/TC/src/parser.c:216:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, %eax	 ;, _34
	jne	.L61	 ;,
 ; D:/TC/src/parser.c:216:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp214
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.29_35
	movq	-8(%rbp), %rax	 ; token, tmp215
	movq	(%rax), %rax	 ; token_69->lexeme, _36
	movq	%rax, %rcx	 ; _36,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:216:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	testb	%al, %al	 ; _37
	jne	.L62	 ;,
.L61:
 ; D:/TC/src/parser.c:218:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp216
	movq	(%rax), %rax	 ; parser_104(D)->source_file, _38
	movq	%rax, %rcx	 ; _38,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _39
 ; D:/TC/src/parser.c:218:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp217
	movq	%rdx, %r8	 ; _39,
	movq	%rax, %rdx	 ; tmp217,
	leaq	.LC24(%rip), %rax	 ;, tmp218
	movq	%rax, %rcx	 ; tmp218,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:219:             return NULL;
	movl	$0, %eax	 ;, _73
	jmp	.L51	 ;
.L76:
 ; D:/TC/src/parser.c:223:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp223
	movq	(%rax), %rax	 ; parser_104(D)->source_file, _40
	movq	%rax, %rcx	 ; _40,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _41
 ; D:/TC/src/parser.c:223:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp224
	movq	%rdx, %r8	 ; _41,
	movq	%rax, %rdx	 ; tmp224,
	leaq	.LC25(%rip), %rax	 ;, tmp225
	movq	%rax, %rcx	 ; tmp225,
	call	parser_error	 ;
	jmp	.L64	 ;
.L63:
 ; D:/TC/src/parser.c:224:         else if (parameter->value != NULL)
	movq	-72(%rbp), %rax	 ; parameter, tmp226
	movq	16(%rax), %rax	 ; parameter_137->value, _42
 ; D:/TC/src/parser.c:224:         else if (parameter->value != NULL)
	testq	%rax, %rax	 ; _42
	je	.L65	 ;,
 ; D:/TC/src/parser.c:225:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp227
	movq	(%rax), %rax	 ; parser_104(D)->source_file, _43
	movq	%rax, %rcx	 ; _43,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _44
 ; D:/TC/src/parser.c:225:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp228
	movq	%rdx, %r8	 ; _44,
	movq	%rax, %rdx	 ; tmp228,
	leaq	.LC26(%rip), %rax	 ;, tmp229
	movq	%rax, %rcx	 ; tmp229,
	call	parser_error	 ;
	jmp	.L64	 ;
.L65:
 ; D:/TC/src/parser.c:227:             list_append(parameters, (pointer)parameter);
	movq	-72(%rbp), %rdx	 ; parameter, tmp230
	movq	-64(%rbp), %rax	 ; parameters, tmp231
	movq	%rax, %rcx	 ; tmp231,
	call	list_append	 ;
.L64:
 ; D:/TC/src/parser.c:228:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp232
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp232,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp233, token
.L58:
 ; D:/TC/src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp234
	movl	24(%rax), %eax	 ; token_69->type, _45
 ; D:/TC/src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _45
	jne	.L66	 ;,
 ; D:/TC/src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp235
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.30_46
	movq	-8(%rbp), %rax	 ; token, tmp236
	movq	(%rax), %rax	 ; token_69->lexeme, _47
	movq	%rax, %rcx	 ; _47,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _48
	je	.L66	 ;,
.L62:
 ; D:/TC/src/parser.c:230:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp237
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp237,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp238, token
 ; D:/TC/src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp239
	movl	24(%rax), %eax	 ; token_150->type, _49
 ; D:/TC/src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _49
	jne	.L67	 ;,
 ; D:/TC/src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp240
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.31_50
	movq	-8(%rbp), %rax	 ; token, tmp241
	movq	(%rax), %rax	 ; token_150->lexeme, _51
	movq	%rax, %rcx	 ; _51,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _52
	jne	.L68	 ;,
.L67:
 ; D:/TC/src/parser.c:232:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp242
	movq	(%rax), %rax	 ; parser_104(D)->source_file, _53
	movq	%rax, %rcx	 ; _53,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _54
 ; D:/TC/src/parser.c:232:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp243
	movq	%rdx, %r8	 ; _54,
	movq	%rax, %rdx	 ; tmp243,
	leaq	.LC27(%rip), %rax	 ;, tmp244
	movq	%rax, %rcx	 ; tmp244,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:234:         return NULL;
	movl	$0, %eax	 ;, _73
	jmp	.L51	 ;
.L68:
 ; D:/TC/src/parser.c:236:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, -80(%rbp)	 ; tmp245, body
 ; D:/TC/src/parser.c:237:     parser->in_function = true;
	movq	40(%rbp), %rax	 ; parser, tmp246
	movb	$1, 8(%rax)	 ;, parser_104(D)->in_function
 ; D:/TC/src/parser.c:238:     parser->in_method = true;
	movq	40(%rbp), %rax	 ; parser, tmp247
	movb	$1, 9(%rax)	 ;, parser_104(D)->in_method
 ; D:/TC/src/parser.c:239:     bool have_return = false;
	movb	$0, -9(%rbp)	 ;, have_return
 ; D:/TC/src/parser.c:240:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp248
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp248,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp249, token
 ; D:/TC/src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L69	 ;
.L73:
 ; D:/TC/src/parser.c:242:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	40(%rbp), %rcx	 ; parser, tmp250
	movq	-24(%rbp), %rdx	 ; method_scope, tmp251
	movq	16(%rbp), %rax	 ; lexer, tmp252
	movq	%rcx, %r8	 ; tmp250,
	movq	%rax, %rcx	 ; tmp252,
	call	parse_statement	 ;
	movq	%rax, -88(%rbp)	 ; tmp253, statement
 ; D:/TC/src/parser.c:243:         if (statement == NULL)
	cmpq	$0, -88(%rbp)	 ;, statement
	jne	.L70	 ;,
 ; D:/TC/src/parser.c:244:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp254
	movq	(%rax), %rax	 ; parser_104(D)->source_file, _55
	movq	%rax, %rcx	 ; _55,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _56
 ; D:/TC/src/parser.c:244:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp255
	movq	%rdx, %r8	 ; _56,
	movq	%rax, %rdx	 ; tmp255,
	leaq	.LC28(%rip), %rax	 ;, tmp256
	movq	%rax, %rcx	 ; tmp256,
	call	parser_error	 ;
	jmp	.L71	 ;
.L70:
 ; D:/TC/src/parser.c:245:         else if (have_return)
	cmpb	$0, -9(%rbp)	 ;, have_return
	je	.L71	 ;,
 ; D:/TC/src/parser.c:246:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp257
	movq	(%rax), %rax	 ; parser_104(D)->source_file, _57
	movq	%rax, %rcx	 ; _57,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _58
 ; D:/TC/src/parser.c:246:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp258
	movq	%rdx, %r8	 ; _58,
	movq	%rax, %rdx	 ; tmp258,
	leaq	.LC17(%rip), %rax	 ;, tmp259
	movq	%rax, %rcx	 ; tmp259,
	call	parser_error	 ;
.L71:
 ; D:/TC/src/parser.c:247:         if (statement != NULL && statement->type == RETURN_STATEMENT)
	cmpq	$0, -88(%rbp)	 ;, statement
	je	.L72	 ;,
 ; D:/TC/src/parser.c:247:         if (statement != NULL && statement->type == RETURN_STATEMENT)
	movq	-88(%rbp), %rax	 ; statement, tmp260
	movl	8(%rax), %eax	 ; statement_169->type, _59
 ; D:/TC/src/parser.c:247:         if (statement != NULL && statement->type == RETURN_STATEMENT)
	cmpl	$5, %eax	 ;, _59
	jne	.L72	 ;,
 ; D:/TC/src/parser.c:248:             have_return = true;
	movb	$1, -9(%rbp)	 ;, have_return
.L72:
 ; D:/TC/src/parser.c:249:         list_append(body, (pointer)statement);
	movq	-88(%rbp), %rdx	 ; statement, tmp261
	movq	-80(%rbp), %rax	 ; body, tmp262
	movq	%rax, %rcx	 ; tmp262,
	call	list_append	 ;
 ; D:/TC/src/parser.c:250:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp263
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp263,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp264, token
.L69:
 ; D:/TC/src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp265
	movl	24(%rax), %eax	 ; token_70->type, _60
 ; D:/TC/src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _60
	jne	.L73	 ;,
 ; D:/TC/src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp266
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.32_61
	movq	-8(%rbp), %rax	 ; token, tmp267
	movq	(%rax), %rax	 ; token_70->lexeme, _62
	movq	%rax, %rcx	 ; _62,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _63
	je	.L73	 ;,
 ; D:/TC/src/parser.c:252:     parser->in_function = false;
	movq	40(%rbp), %rax	 ; parser, tmp268
	movb	$0, 8(%rax)	 ;, parser_104(D)->in_function
 ; D:/TC/src/parser.c:253:     parser->in_method = false;
	movq	40(%rbp), %rax	 ; parser, tmp269
	movb	$0, 9(%rax)	 ;, parser_104(D)->in_method
 ; D:/TC/src/parser.c:254:     if (!have_return && return_type != name_void)
	cmpb	$0, -9(%rbp)	 ;, have_return
	jne	.L74	 ;,
 ; D:/TC/src/parser.c:254:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp270
	movq	(%rax), %rax	 ; name_void, name_void.33_64
 ; D:/TC/src/parser.c:254:     if (!have_return && return_type != name_void)
	cmpq	%rax, -40(%rbp)	 ; name_void.33_64, return_type
	je	.L74	 ;,
 ; D:/TC/src/parser.c:255:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	40(%rbp), %rax	 ; parser, tmp271
	movq	(%rax), %rax	 ; parser_104(D)->source_file, _65
	movq	%rax, %rcx	 ; _65,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _66
 ; D:/TC/src/parser.c:255:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp272
	movq	%rdx, %r8	 ; _66,
	movq	%rax, %rdx	 ; tmp272,
	leaq	.LC29(%rip), %rax	 ;, tmp273
	movq	%rax, %rcx	 ; tmp273,
	call	parser_error	 ;
.L74:
 ; D:/TC/src/parser.c:256:     if (!have_return && return_type == name_void)
	cmpb	$0, -9(%rbp)	 ;, have_return
	jne	.L75	 ;,
 ; D:/TC/src/parser.c:256:     if (!have_return && return_type == name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp274
	movq	(%rax), %rax	 ; name_void, name_void.34_67
 ; D:/TC/src/parser.c:256:     if (!have_return && return_type == name_void)
	cmpq	%rax, -40(%rbp)	 ; name_void.34_67, return_type
	jne	.L75	 ;,
 ; D:/TC/src/parser.c:257:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdx	 ;, _68
 ; D:/TC/src/parser.c:257:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	-80(%rbp), %rax	 ; body, tmp275
	movq	%rax, %rcx	 ; tmp275,
	call	list_append	 ;
.L75:
 ; D:/TC/src/parser.c:259:     return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
	movq	-64(%rbp), %r9	 ; parameters, tmp276
	movq	-40(%rbp), %r8	 ; return_type, tmp277
	movq	-56(%rbp), %rdx	 ; name, tmp278
	movq	-48(%rbp), %rax	 ; method, tmp279
	movq	-24(%rbp), %rcx	 ; method_scope, tmp280
	movq	%rcx, 40(%rsp)	 ; tmp280,
	movq	-80(%rbp), %rcx	 ; body, tmp281
	movq	%rcx, 32(%rsp)	 ; tmp281,
	movq	%rax, %rcx	 ; tmp279,
	call	create_method_use_ptr	 ;
.L51:
 ; D:/TC/src/parser.c:260: }
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
	.ascii "Unsupported type for class variable\0"
	.align 8
.LC35:
	.ascii "Expected ';' after class variable declaration\0"
	.align 8
.LC36:
	.ascii "Unexpected token in class member\0"
	.align 8
.LC37:
	.ascii "Constructor name conflicts with existing member\0"
.LC38:
	.ascii "0\0"
	.text
	.def	parse_class;	.scl	3;	.type	32;	.endef
parse_class:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$296, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:/TC/src/parser.c:263:     Token* token = NULL;
	movq	$0, -24(%rbp)	 ;, token
 ; D:/TC/src/parser.c:264:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	24(%rbp), %rax	 ; now_scope, tmp190
	movq	%rax, %rcx	 ; tmp190,
	call	create_symbol_table	 ;
	movq	%rax, -48(%rbp)	 ; tmp191, class_scope
 ; D:/TC/src/parser.c:265:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp192
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp192,
	call	get_next_token	 ;
	movq	%rax, -24(%rbp)	 ; tmp193, token
 ; D:/TC/src/parser.c:266:     if (token->type != IDENTIFIER) {
	movq	-24(%rbp), %rax	 ; token, tmp194
	movl	24(%rax), %eax	 ; token_138->type, _1
 ; D:/TC/src/parser.c:266:     if (token->type != IDENTIFIER) {
	cmpl	$1, %eax	 ;, _1
	je	.L78	 ;,
 ; D:/TC/src/parser.c:267:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp195
	movq	(%rax), %rax	 ; parser_179(D)->source_file, _2
	movq	%rax, %rcx	 ; _2,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _3
 ; D:/TC/src/parser.c:267:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	-24(%rbp), %rax	 ; token, tmp196
	movq	%rdx, %r8	 ; _3,
	movq	%rax, %rdx	 ; tmp196,
	leaq	.LC30(%rip), %rax	 ;, tmp197
	movq	%rax, %rcx	 ; tmp197,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:269:         return NULL;
	movl	$0, %eax	 ;, _111
	jmp	.L79	 ;
.L78:
 ; D:/TC/src/parser.c:271:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -56(%rbp)	 ; tmp198, class
 ; D:/TC/src/parser.c:272:     class->class_scope = class_scope;
	movq	-56(%rbp), %rax	 ; class, tmp199
	movq	-48(%rbp), %rdx	 ; class_scope, tmp200
	movq	%rdx, 16(%rax)	 ; tmp200, class_140->class_scope
 ; D:/TC/src/parser.c:273:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	movq	-24(%rbp), %rax	 ; token, tmp201
	movq	(%rax), %rax	 ; token_138->lexeme, _4
	movq	-56(%rbp), %rdx	 ; class, tmp202
	movq	%rdx, %r9	 ; tmp202,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; _4,
	call	create_symbol	 ;
	movq	%rax, -64(%rbp)	 ; tmp203, name
 ; D:/TC/src/parser.c:274:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp204
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp204,
	call	get_next_token	 ;
	movq	%rax, -24(%rbp)	 ; tmp205, token
 ; D:/TC/src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-24(%rbp), %rax	 ; token, tmp206
	movl	24(%rax), %eax	 ; token_145->type, _5
 ; D:/TC/src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _5
	jne	.L80	 ;,
 ; D:/TC/src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp207
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.35_6
	movq	-24(%rbp), %rax	 ; token, tmp208
	movq	(%rax), %rax	 ; token_145->lexeme, _7
	movq	%rax, %rcx	 ; _7,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _8
	jne	.L81	 ;,
.L80:
 ; D:/TC/src/parser.c:276:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp209
	movq	(%rax), %rax	 ; parser_179(D)->source_file, _9
	movq	%rax, %rcx	 ; _9,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _10
 ; D:/TC/src/parser.c:276:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	-24(%rbp), %rax	 ; token, tmp210
	movq	%rdx, %r8	 ; _10,
	movq	%rax, %rdx	 ; tmp210,
	leaq	.LC31(%rip), %rax	 ;, tmp211
	movq	%rax, %rcx	 ; tmp211,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:278:         return NULL;
	movl	$0, %eax	 ;, _111
	jmp	.L79	 ;
.L81:
 ; D:/TC/src/parser.c:280:     list(ClassMember*) members = create_list();
	call	create_list	 ;
	movq	%rax, -72(%rbp)	 ; tmp212, members
 ; D:/TC/src/parser.c:281:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp213
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp213,
	call	get_next_token	 ;
	movq	%rax, -24(%rbp)	 ; tmp214, token
 ; D:/TC/src/parser.c:282:     size_t size = 0;
	movq	$0, -32(%rbp)	 ;, size
 ; D:/TC/src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L82	 ;
.L96:
 ; D:/TC/src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	-24(%rbp), %rax	 ; token, tmp215
	movl	24(%rax), %eax	 ; token_106->type, _11
 ; D:/TC/src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	 ;, _11
	jne	.L83	 ;,
 ; D:/TC/src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	.refptr.METHOD_KEYWORD(%rip), %rax	 ;, tmp216
	movq	(%rax), %rdx	 ; METHOD_KEYWORD, METHOD_KEYWORD.36_12
	movq	-24(%rbp), %rax	 ; token, tmp217
	movq	(%rax), %rax	 ; token_106->lexeme, _13
	movq	%rax, %rcx	 ; _13,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	testb	%al, %al	 ; _14
	je	.L83	 ;,
 ; D:/TC/src/parser.c:285:             Method* method = parse_method(lexer, class_scope, name, parser);
	movq	32(%rbp), %r8	 ; parser, tmp218
	movq	-64(%rbp), %rcx	 ; name, tmp219
	movq	-48(%rbp), %rdx	 ; class_scope, tmp220
	movq	16(%rbp), %rax	 ; lexer, tmp221
	movq	%r8, %r9	 ; tmp218,
	movq	%rcx, %r8	 ; tmp219,
	movq	%rax, %rcx	 ; tmp221,
	call	parse_method	 ;
	movq	%rax, -232(%rbp)	 ; tmp222, method
 ; D:/TC/src/parser.c:286:             if (method == NULL)
	cmpq	$0, -232(%rbp)	 ;, method
	jne	.L84	 ;,
 ; D:/TC/src/parser.c:287:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp223
	movq	(%rax), %rax	 ; parser_179(D)->source_file, _15
	movq	%rax, %rcx	 ; _15,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _16
 ; D:/TC/src/parser.c:287:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	-24(%rbp), %rax	 ; token, tmp224
	movq	%rdx, %r8	 ; _16,
	movq	%rax, %rdx	 ; tmp224,
	leaq	.LC32(%rip), %rax	 ;, tmp225
	movq	%rax, %rcx	 ; tmp225,
	call	parser_error	 ;
.L84:
 ; D:/TC/src/parser.c:288:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	-232(%rbp), %rax	 ; method, tmp226
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp226,
	movl	$0, %ecx	 ;,
	call	create_class_member	 ;
	movq	%rax, %rdx	 ;, _17
 ; D:/TC/src/parser.c:288:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	-72(%rbp), %rax	 ; members, tmp227
	movq	%rax, %rcx	 ; tmp227,
	call	list_append	 ;
 ; D:/TC/src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	jmp	.L85	 ;
.L83:
 ; D:/TC/src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	-24(%rbp), %rax	 ; token, tmp228
	movl	24(%rax), %eax	 ; token_106->type, _18
 ; D:/TC/src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	cmpl	$6, %eax	 ;, _18
	jne	.L86	 ;,
 ; D:/TC/src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp229
	movq	(%rax), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD.37_19
	movq	-24(%rbp), %rax	 ; token, tmp230
	movq	(%rax), %rax	 ; token_106->lexeme, _20
	movq	%rax, %rcx	 ; _20,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; _21
	je	.L86	 ;,
 ; D:/TC/src/parser.c:290:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp231
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp231,
	call	get_next_token	 ;
	movq	%rax, -24(%rbp)	 ; tmp232, token
 ; D:/TC/src/parser.c:291:             parser->in_class = true;
	movq	32(%rbp), %rax	 ; parser, tmp233
	movb	$1, 10(%rax)	 ;, parser_179(D)->in_class
 ; D:/TC/src/parser.c:292:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp234
	movq	-48(%rbp), %rdx	 ; class_scope, tmp235
	movq	16(%rbp), %rax	 ; lexer, tmp236
	movq	%rcx, %r8	 ; tmp234,
	movq	%rax, %rcx	 ; tmp236,
	call	parse_variable	 ;
	movq	%rax, -240(%rbp)	 ; tmp237, variable
 ; D:/TC/src/parser.c:293:             parser->in_class = false;
	movq	32(%rbp), %rax	 ; parser, tmp238
	movb	$0, 10(%rax)	 ;, parser_179(D)->in_class
 ; D:/TC/src/parser.c:294:             if (variable == NULL)
	cmpq	$0, -240(%rbp)	 ;, variable
	jne	.L87	 ;,
 ; D:/TC/src/parser.c:295:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp239
	movq	(%rax), %rax	 ; parser_179(D)->source_file, _22
	movq	%rax, %rcx	 ; _22,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _23
 ; D:/TC/src/parser.c:295:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	-24(%rbp), %rax	 ; token, tmp240
	movq	%rdx, %r8	 ; _23,
	movq	%rax, %rdx	 ; tmp240,
	leaq	.LC33(%rip), %rax	 ;, tmp241
	movq	%rax, %rcx	 ; tmp241,
	call	parser_error	 ;
.L87:
 ; D:/TC/src/parser.c:296:             ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
	movq	-240(%rbp), %rax	 ; variable, tmp242
	movq	%rax, %r8	 ; tmp242,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_class_member	 ;
	movq	%rax, -248(%rbp)	 ; tmp243, member
 ; D:/TC/src/parser.c:297:             list_append(members, (pointer)member);
	movq	-248(%rbp), %rdx	 ; member, tmp244
	movq	-72(%rbp), %rax	 ; members, tmp245
	movq	%rax, %rcx	 ; tmp245,
	call	list_append	 ;
 ; D:/TC/src/parser.c:298:             if (member->type == CLASS_VARIABLE) {
	movq	-248(%rbp), %rax	 ; member, tmp246
	movl	8(%rax), %eax	 ; member_268->type, _24
 ; D:/TC/src/parser.c:298:             if (member->type == CLASS_VARIABLE) {
	cmpl	$1, %eax	 ;, _24
	jne	.L88	 ;,
 ; D:/TC/src/parser.c:299:                 Symbol* type = member->content.variable->type;
	movq	-248(%rbp), %rax	 ; member, tmp247
	movq	(%rax), %rax	 ; member_268->content.variable, _25
 ; D:/TC/src/parser.c:299:                 Symbol* type = member->content.variable->type;
	movq	(%rax), %rax	 ; _25->type, tmp248
	movq	%rax, -256(%rbp)	 ; tmp248, type
 ; D:/TC/src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %rax	 ;, tmp249
	movq	(%rax), %rax	 ; name_int, name_int.38_26
 ; D:/TC/src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	%rax, -256(%rbp)	 ; name_int.38_26, type
	je	.L89	 ;,
 ; D:/TC/src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rax	 ;, tmp250
	movq	(%rax), %rax	 ; name_float, name_float.39_27
 ; D:/TC/src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	%rax, -256(%rbp)	 ; name_float.39_27, type
	je	.L89	 ;,
 ; D:/TC/src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rax	 ;, tmp251
	movq	(%rax), %rax	 ; name_string, name_string.40_28
 ; D:/TC/src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	%rax, -256(%rbp)	 ; name_string.40_28, type
	jne	.L90	 ;,
.L89:
 ; D:/TC/src/parser.c:301:                     size += 8;
	addq	$8, -32(%rbp)	 ;, size
	jmp	.L88	 ;
.L90:
 ; D:/TC/src/parser.c:302:                 else if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp252
	movq	(%rax), %rax	 ; name_bool, name_bool.41_29
 ; D:/TC/src/parser.c:302:                 else if (type == name_bool || type == name_void)
	cmpq	%rax, -256(%rbp)	 ; name_bool.41_29, type
	je	.L91	 ;,
 ; D:/TC/src/parser.c:302:                 else if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp253
	movq	(%rax), %rax	 ; name_void, name_void.42_30
 ; D:/TC/src/parser.c:302:                 else if (type == name_bool || type == name_void)
	cmpq	%rax, -256(%rbp)	 ; name_void.42_30, type
	jne	.L92	 ;,
.L91:
 ; D:/TC/src/parser.c:303:                     size += 1;
	addq	$1, -32(%rbp)	 ;, size
	jmp	.L88	 ;
.L92:
 ; D:/TC/src/parser.c:304:                 else if (type->kind == SYMBOL_CLASS)
	movq	-256(%rbp), %rax	 ; type, tmp254
	movl	32(%rax), %eax	 ; type_270->kind, _31
 ; D:/TC/src/parser.c:304:                 else if (type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _31
	jne	.L93	 ;,
 ; D:/TC/src/parser.c:305:                     size += 8;  // pointer to object
	addq	$8, -32(%rbp)	 ;, size
	jmp	.L88	 ;
.L93:
 ; D:/TC/src/parser.c:307:                     parser_error("Unsupported type for class variable", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp255
	movq	(%rax), %rax	 ; parser_179(D)->source_file, _32
	movq	%rax, %rcx	 ; _32,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _33
 ; D:/TC/src/parser.c:307:                     parser_error("Unsupported type for class variable", token, get_full_path(parser->source_file));
	movq	-24(%rbp), %rax	 ; token, tmp256
	movq	%rdx, %r8	 ; _33,
	movq	%rax, %rdx	 ; tmp256,
	leaq	.LC34(%rip), %rax	 ;, tmp257
	movq	%rax, %rcx	 ; tmp257,
	call	parser_error	 ;
.L88:
 ; D:/TC/src/parser.c:309:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp258
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp258,
	call	get_next_token	 ;
	movq	%rax, -24(%rbp)	 ; tmp259, token
 ; D:/TC/src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	-24(%rbp), %rax	 ; token, tmp260
	movl	24(%rax), %eax	 ; token_277->type, _34
 ; D:/TC/src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, %eax	 ;, _34
	jne	.L94	 ;,
 ; D:/TC/src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp261
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.43_35
	movq	-24(%rbp), %rax	 ; token, tmp262
	movq	(%rax), %rax	 ; token_277->lexeme, _36
	movq	%rax, %rcx	 ; _36,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; _37
	jne	.L110	 ;,
.L94:
 ; D:/TC/src/parser.c:311:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp263
	movq	(%rax), %rax	 ; parser_179(D)->source_file, _38
	movq	%rax, %rcx	 ; _38,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _39
 ; D:/TC/src/parser.c:311:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	-24(%rbp), %rax	 ; token, tmp264
	movq	%rdx, %r8	 ; _39,
	movq	%rax, %rdx	 ; tmp264,
	leaq	.LC35(%rip), %rax	 ;, tmp265
	movq	%rax, %rcx	 ; tmp265,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	jmp	.L110	 ;
.L86:
 ; D:/TC/src/parser.c:313:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp266
	movq	(%rax), %rax	 ; parser_179(D)->source_file, _40
	movq	%rax, %rcx	 ; _40,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _41
 ; D:/TC/src/parser.c:313:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	-24(%rbp), %rax	 ; token, tmp267
	movq	%rdx, %r8	 ; _41,
	movq	%rax, %rdx	 ; tmp267,
	leaq	.LC36(%rip), %rax	 ;, tmp268
	movq	%rax, %rcx	 ; tmp268,
	call	parser_error	 ;
	jmp	.L85	 ;
.L110:
 ; D:/TC/src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	nop	
.L85:
 ; D:/TC/src/parser.c:314:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp269
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp269,
	call	get_next_token	 ;
	movq	%rax, -24(%rbp)	 ; tmp270, token
.L82:
 ; D:/TC/src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-24(%rbp), %rax	 ; token, tmp271
	movl	24(%rax), %eax	 ; token_106->type, _42
 ; D:/TC/src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _42
	jne	.L96	 ;,
 ; D:/TC/src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp272
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.44_43
	movq	-24(%rbp), %rax	 ; token, tmp273
	movq	(%rax), %rax	 ; token_106->lexeme, _44
	movq	%rax, %rcx	 ; _44,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _45
	je	.L96	 ;,
 ; D:/TC/src/parser.c:316:     string init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
	movq	.refptr.DEFAULT_INIT_NAME(%rip), %rax	 ;, tmp274
	movq	(%rax), %rdx	 ; DEFAULT_INIT_NAME, DEFAULT_INIT_NAME.45_46
	movq	-64(%rbp), %rax	 ; name, tmp275
	movq	8(%rax), %rax	 ; name_143->name, _47
	movq	%rax, %rcx	 ; _47,
	call	make_method_name	 ;
	movq	%rax, -80(%rbp)	 ; tmp276, init_name
 ; D:/TC/src/parser.c:317:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	movq	-80(%rbp), %rdx	 ; init_name, tmp277
	movq	-48(%rbp), %rax	 ; class_scope, tmp278
	movq	%rax, %rcx	 ; tmp278,
	call	search_name_use_strcmp	 ;
	movq	%rax, -40(%rbp)	 ; tmp279, init
 ; D:/TC/src/parser.c:318:     if (init == NULL) {
	cmpq	$0, -40(%rbp)	 ;, init
	jne	.L97	 ;,
 ; D:/TC/src/parser.c:319:         Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -88(%rbp)	 ; tmp280, method
 ; D:/TC/src/parser.c:320:         method->method_scope = create_symbol_table(class_scope);
	movq	-48(%rbp), %rax	 ; class_scope, tmp281
	movq	%rax, %rcx	 ; tmp281,
	call	create_symbol_table	 ;
 ; D:/TC/src/parser.c:320:         method->method_scope = create_symbol_table(class_scope);
	movq	-88(%rbp), %rdx	 ; method, tmp282
	movq	%rax, 32(%rdx)	 ; _48, method_158->method_scope
 ; D:/TC/src/parser.c:321:         init = create_symbol(init_name, SYMBOL_METHOD, name, method);
	movq	-88(%rbp), %rcx	 ; method, tmp283
	movq	-64(%rbp), %rdx	 ; name, tmp284
	movq	-80(%rbp), %rax	 ; init_name, tmp285
	movq	%rcx, %r9	 ; tmp283,
	movq	%rdx, %r8	 ; tmp284,
	movl	$2, %edx	 ;,
	movq	%rax, %rcx	 ; tmp285,
	call	create_symbol	 ;
	movq	%rax, -40(%rbp)	 ; tmp286, init
 ; D:/TC/src/parser.c:322:         list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rax, -96(%rbp)	 ; tmp287, parameters
 ; D:/TC/src/parser.c:323:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	-88(%rbp), %rax	 ; method, tmp288
	movq	32(%rax), %rcx	 ; method_158->method_scope, _49
 ; D:/TC/src/parser.c:323:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp289
	movq	(%rax), %rax	 ; SELF_KEYWORD, SELF_KEYWORD.46_50
	movq	-64(%rbp), %rdx	 ; name, tmp290
	movq	%rcx, %r9	 ; _49,
	movq	%rdx, %r8	 ; tmp290,
	movl	$3, %edx	 ;,
	movq	%rax, %rcx	 ; SELF_KEYWORD.46_50,
	call	create_symbol	 ;
	movq	%rax, -104(%rbp)	 ; tmp291, self
 ; D:/TC/src/parser.c:324:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	-104(%rbp), %rdx	 ; self, tmp292
	movq	-64(%rbp), %rax	 ; name, tmp293
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp293,
	call	create_variable	 ;
	movq	%rax, %rdx	 ;, _51
 ; D:/TC/src/parser.c:324:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	-96(%rbp), %rax	 ; parameters, tmp294
	movq	%rax, %rcx	 ; tmp294,
	call	list_append	 ;
 ; D:/TC/src/parser.c:325:         list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, -112(%rbp)	 ; tmp295, body
 ; D:/TC/src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	-104(%rbp), %rax	 ; self, tmp296
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; tmp296,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, 32(%rsp)	 ; _52,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:/TC/src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; _53,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:/TC/src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; _54,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdx	 ;, _55
 ; D:/TC/src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	-112(%rbp), %rax	 ; body, tmp297
	movq	%rax, %rcx	 ; tmp297,
	call	list_append	 ;
 ; D:/TC/src/parser.c:327:         create_method_use_ptr(method, init, name, parameters, body, method->method_scope);
	movq	-88(%rbp), %rax	 ; method, tmp298
	movq	32(%rax), %rcx	 ; method_158->method_scope, _56
	movq	-96(%rbp), %r9	 ; parameters, tmp299
	movq	-64(%rbp), %r8	 ; name, tmp300
	movq	-40(%rbp), %rdx	 ; init, tmp301
	movq	-88(%rbp), %rax	 ; method, tmp302
	movq	%rcx, 40(%rsp)	 ; _56,
	movq	-112(%rbp), %rcx	 ; body, tmp303
	movq	%rcx, 32(%rsp)	 ; tmp303,
	movq	%rax, %rcx	 ; tmp302,
	call	create_method_use_ptr	 ;
 ; D:/TC/src/parser.c:328:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	-88(%rbp), %rax	 ; method, tmp304
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp304,
	movl	$0, %ecx	 ;,
	call	create_class_member	 ;
	movq	%rax, %rdx	 ;, _57
 ; D:/TC/src/parser.c:328:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	-72(%rbp), %rax	 ; members, tmp305
	movq	%rax, %rcx	 ; tmp305,
	call	list_append	 ;
.L97:
 ; D:/TC/src/parser.c:330:     if (init->kind != SYMBOL_METHOD)
	movq	-40(%rbp), %rax	 ; init, tmp306
	movl	32(%rax), %eax	 ; init_110->kind, _58
 ; D:/TC/src/parser.c:330:     if (init->kind != SYMBOL_METHOD)
	cmpl	$2, %eax	 ;, _58
	je	.L98	 ;,
 ; D:/TC/src/parser.c:331:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp307
	movq	(%rax), %rax	 ; parser_179(D)->source_file, _59
	movq	%rax, %rcx	 ; _59,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _60
 ; D:/TC/src/parser.c:331:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	-24(%rbp), %rax	 ; token, tmp308
	movq	%rdx, %r8	 ; _60,
	movq	%rax, %rdx	 ; tmp308,
	leaq	.LC37(%rip), %rax	 ;, tmp309
	movq	%rax, %rcx	 ; tmp309,
	call	parser_error	 ;
.L98:
 ; D:/TC/src/parser.c:332:     string constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp310
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME.47_61
	movq	-64(%rbp), %rax	 ; name, tmp311
	movq	8(%rax), %rax	 ; name_143->name, _62
	movq	%rax, %rcx	 ; _62,
	call	make_method_name	 ;
	movq	%rax, -120(%rbp)	 ; tmp312, constructor_name
 ; D:/TC/src/parser.c:333:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -128(%rbp)	 ; tmp313, method
 ; D:/TC/src/parser.c:334:     method->method_scope = create_symbol_table(class_scope);
	movq	-48(%rbp), %rax	 ; class_scope, tmp314
	movq	%rax, %rcx	 ; tmp314,
	call	create_symbol_table	 ;
 ; D:/TC/src/parser.c:334:     method->method_scope = create_symbol_table(class_scope);
	movq	-128(%rbp), %rdx	 ; method, tmp315
	movq	%rax, 32(%rdx)	 ; _63, method_185->method_scope
 ; D:/TC/src/parser.c:335:     Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
	movq	-128(%rbp), %rcx	 ; method, tmp316
	movq	-64(%rbp), %rdx	 ; name, tmp317
	movq	-120(%rbp), %rax	 ; constructor_name, tmp318
	movq	%rcx, %r9	 ; tmp316,
	movq	%rdx, %r8	 ; tmp317,
	movl	$2, %edx	 ;,
	movq	%rax, %rcx	 ; tmp318,
	call	create_symbol	 ;
	movq	%rax, -136(%rbp)	 ; tmp319, constructor
 ; D:/TC/src/parser.c:336:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rax, -144(%rbp)	 ; tmp320, parameters
 ; D:/TC/src/parser.c:337:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	-128(%rbp), %rax	 ; method, tmp321
	movq	32(%rax), %rcx	 ; method_185->method_scope, _64
 ; D:/TC/src/parser.c:337:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp322
	movq	(%rax), %rax	 ; SELF_KEYWORD, SELF_KEYWORD.48_65
	movq	-64(%rbp), %rdx	 ; name, tmp323
	movq	%rcx, %r9	 ; _64,
	movq	%rdx, %r8	 ; tmp323,
	movl	$3, %edx	 ;,
	movq	%rax, %rcx	 ; SELF_KEYWORD.48_65,
	call	create_symbol	 ;
	movq	%rax, -152(%rbp)	 ; tmp324, self
 ; D:/TC/src/parser.c:338:     list(Variable*) init_params = list_copy(init->ast_node.method->parameters);
	movq	-40(%rbp), %rax	 ; init, tmp325
	movq	24(%rax), %rax	 ; init_110->ast_node.method, _66
 ; D:/TC/src/parser.c:338:     list(Variable*) init_params = list_copy(init->ast_node.method->parameters);
	movq	16(%rax), %rax	 ; _66->parameters, _67
	movq	%rax, %rcx	 ; _67,
	call	list_copy	 ;
	movq	%rax, -160(%rbp)	 ; tmp326, init_params
 ; D:/TC/src/parser.c:340:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	jmp	.L99	 ;
.L102:
 ; D:/TC/src/parser.c:341:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp327
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD.49_68
 ; D:/TC/src/parser.c:341:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	movq	-168(%rbp), %rax	 ; param, tmp328
	movq	8(%rax), %rax	 ; param_197->name, _69
 ; D:/TC/src/parser.c:341:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	movq	8(%rax), %rax	 ; _69->name, _70
	movq	%rax, %rcx	 ; _70,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:341:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	testb	%al, %al	 ; _71
	jne	.L111	 ;,
 ; D:/TC/src/parser.c:342:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	-168(%rbp), %rax	 ; param, tmp329
	movq	8(%rax), %rdx	 ; param_197->name, _72
	movq	-168(%rbp), %rax	 ; param, tmp330
	movq	(%rax), %rax	 ; param_197->type, _73
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; _73,
	call	create_variable	 ;
	movq	%rax, %rdx	 ;, _74
 ; D:/TC/src/parser.c:342:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	-144(%rbp), %rax	 ; parameters, tmp331
	movq	%rax, %rcx	 ; tmp331,
	call	list_append	 ;
	jmp	.L99	 ;
.L111:
 ; D:/TC/src/parser.c:341:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	nop	
.L99:
 ; D:/TC/src/parser.c:340:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	movq	-160(%rbp), %rax	 ; init_params, tmp332
	movq	%rax, %rcx	 ; tmp332,
	call	list_pop	 ;
	movq	%rax, -168(%rbp)	 ; tmp333, param
 ; D:/TC/src/parser.c:340:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	cmpq	$0, -168(%rbp)	 ;, param
	jne	.L102	 ;,
 ; D:/TC/src/parser.c:344:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, -176(%rbp)	 ; tmp334, body
 ; D:/TC/src/parser.c:345:     list(ClassMember*) ms = list_copy(members);
	movq	-72(%rbp), %rax	 ; members, tmp335
	movq	%rax, %rcx	 ; tmp335,
	call	list_copy	 ;
	movq	%rax, -184(%rbp)	 ; tmp336, ms
 ; D:/TC/src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	-152(%rbp), %rax	 ; self, tmp337
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; tmp337,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, 32(%rsp)	 ; _75,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:/TC/src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; _76,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:/TC/src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; _77,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdx	 ;, _78
 ; D:/TC/src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	-176(%rbp), %rax	 ; body, tmp338
	movq	%rax, %rcx	 ; tmp338,
	call	list_append	 ;
 ; D:/TC/src/parser.c:348:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	jmp	.L104	 ;
.L107:
 ; D:/TC/src/parser.c:349:         if (mb->type == CLASS_VARIABLE) {
	movq	-192(%rbp), %rax	 ; mb, tmp339
	movl	8(%rax), %eax	 ; mb_208->type, _79
 ; D:/TC/src/parser.c:349:         if (mb->type == CLASS_VARIABLE) {
	cmpl	$1, %eax	 ;, _79
	jne	.L104	 ;,
 ; D:/TC/src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	-192(%rbp), %rax	 ; mb, tmp340
	movq	(%rax), %rax	 ; mb_208->content.variable, _80
 ; D:/TC/src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	8(%rax), %rbx	 ; _80->name, _81
	movq	-152(%rbp), %rax	 ; self, tmp341
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; tmp341,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rbx, %r8	 ; _81,
	movq	%rax, %rdx	 ; _82,
	movl	$2, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	%rax, 32(%rsp)	 ; _83,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:/TC/src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; _84,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, -216(%rbp)	 ; tmp342, left
 ; D:/TC/src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	-192(%rbp), %rax	 ; mb, tmp343
	movq	(%rax), %rax	 ; mb_208->content.variable, _85
 ; D:/TC/src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	16(%rax), %rax	 ; _85->value, _86
 ; D:/TC/src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	testq	%rax, %rax	 ; _86
	je	.L105	 ;,
 ; D:/TC/src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	-192(%rbp), %rax	 ; mb, tmp344
	movq	(%rax), %rax	 ; mb_208->content.variable, _87
 ; D:/TC/src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	16(%rax), %rax	 ; _87->value, iftmp.50_112
	jmp	.L106	 ;
.L105:
 ; D:/TC/src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movl	$2, %edx	 ;,
	leaq	.LC38(%rip), %rax	 ;, tmp345
	movq	%rax, %rcx	 ; tmp345,
	call	create_string	 ;
 ; D:/TC/src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _88,
	movl	$0, %ecx	 ;,
	call	create_primary	 ;
 ; D:/TC/src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; _89,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
.L106:
 ; D:/TC/src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	%rax, -224(%rbp)	 ; iftmp.50_112, right
 ; D:/TC/src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	-224(%rbp), %rdx	 ; right, tmp346
	movq	-216(%rbp), %rax	 ; left, tmp347
	movq	%rdx, %r9	 ; tmp346,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp347,
	movl	$13, %ecx	 ;,
	call	create_expression	 ;
 ; D:/TC/src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; _90,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdx	 ;, _91
 ; D:/TC/src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	-176(%rbp), %rax	 ; body, tmp348
	movq	%rax, %rcx	 ; tmp348,
	call	list_append	 ;
.L104:
 ; D:/TC/src/parser.c:348:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	movq	-184(%rbp), %rax	 ; ms, tmp349
	movq	%rax, %rcx	 ; tmp349,
	call	list_pop	 ;
	movq	%rax, -192(%rbp)	 ; tmp350, mb
 ; D:/TC/src/parser.c:348:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	cmpq	$0, -192(%rbp)	 ;, mb
	jne	.L107	 ;,
 ; D:/TC/src/parser.c:355:     list(Expression*) args = create_list();
	call	create_list	 ;
	movq	%rax, -200(%rbp)	 ; tmp351, args
 ; D:/TC/src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	-152(%rbp), %rax	 ; self, tmp352
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; tmp352,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	%rax, 32(%rsp)	 ; _92,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:/TC/src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; _93,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rdx	 ;, _94
 ; D:/TC/src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	-200(%rbp), %rax	 ; args, tmp353
	movq	%rax, %rcx	 ; tmp353,
	call	list_append	 ;
 ; D:/TC/src/parser.c:357:     list(Variable*) params = list_copy(parameters);
	movq	-144(%rbp), %rax	 ; parameters, tmp354
	movq	%rax, %rcx	 ; tmp354,
	call	list_copy	 ;
	movq	%rax, -208(%rbp)	 ; tmp355, params
 ; D:/TC/src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	jmp	.L108	 ;
.L109:
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	-168(%rbp), %rax	 ; param, tmp356
	movq	8(%rax), %rax	 ; param_218->name, _95
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; _95,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rax, 32(%rsp)	 ; _96,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; _97,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rdx	 ;, _98
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	-200(%rbp), %rax	 ; args, tmp357
	movq	%rax, %rcx	 ; tmp357,
	call	list_append	 ;
.L108:
 ; D:/TC/src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	movq	-208(%rbp), %rax	 ; params, tmp358
	movq	%rax, %rcx	 ; tmp358,
	call	list_pop	 ;
	movq	%rax, -168(%rbp)	 ; tmp359, param
 ; D:/TC/src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	cmpq	$0, -168(%rbp)	 ;, param
	jne	.L109	 ;,
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	-40(%rbp), %rax	 ; init, tmp360
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; tmp360,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, %rdx	 ;, _99
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	-200(%rbp), %rax	 ; args, tmp361
	movq	%rax, 32(%rsp)	 ; tmp361,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, 32(%rsp)	 ; _100,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; _101,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; _102,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdx	 ;, _103
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	-176(%rbp), %rax	 ; body, tmp362
	movq	%rax, %rcx	 ; tmp362,
	call	list_append	 ;
 ; D:/TC/src/parser.c:361:     create_method_use_ptr(method, constructor, name, parameters, body, method->method_scope);
	movq	-128(%rbp), %rax	 ; method, tmp363
	movq	32(%rax), %rcx	 ; method_185->method_scope, _104
	movq	-144(%rbp), %r9	 ; parameters, tmp364
	movq	-64(%rbp), %r8	 ; name, tmp365
	movq	-136(%rbp), %rdx	 ; constructor, tmp366
	movq	-128(%rbp), %rax	 ; method, tmp367
	movq	%rcx, 40(%rsp)	 ; _104,
	movq	-176(%rbp), %rcx	 ; body, tmp368
	movq	%rcx, 32(%rsp)	 ; tmp368,
	movq	%rax, %rcx	 ; tmp367,
	call	create_method_use_ptr	 ;
 ; D:/TC/src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	-128(%rbp), %rax	 ; method, tmp369
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp369,
	movl	$0, %ecx	 ;,
	call	create_class_member	 ;
	movq	%rax, %rdx	 ;, _105
 ; D:/TC/src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	-72(%rbp), %rax	 ; members, tmp370
	movq	%rax, %rcx	 ; tmp370,
	call	list_append	 ;
 ; D:/TC/src/parser.c:364:     return create_class_use_ptr(class, name, members, class_scope, size);
	movq	-48(%rbp), %r9	 ; class_scope, tmp371
	movq	-72(%rbp), %r8	 ; members, tmp372
	movq	-64(%rbp), %rdx	 ; name, tmp373
	movq	-56(%rbp), %rax	 ; class, tmp374
	movq	-32(%rbp), %rcx	 ; size, tmp375
	movq	%rcx, 32(%rsp)	 ; tmp375,
	movq	%rax, %rcx	 ; tmp374,
	call	create_class_use_ptr	 ;
.L79:
 ; D:/TC/src/parser.c:365: }
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.section .rdata,"dr"
.LC39:
	.ascii "Expected variable type\0"
	.align 8
.LC40:
	.ascii "Expected a type for variable declaration\0"
.LC41:
	.ascii "Unknown variable type\0"
.LC42:
	.ascii "Expected variable name\0"
	.align 8
.LC43:
	.ascii "Failed to parse variable initializer\0"
	.text
	.def	parse_variable;	.scl	3;	.type	32;	.endef
parse_variable:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$64, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; lexer, lexer
	movq	%rdx, 24(%rbp)	 ; now_scope, now_scope
	movq	%r8, 32(%rbp)	 ; parser, parser
 ; D:/TC/src/parser.c:368:     Token* token = NULL;
	movq	$0, -16(%rbp)	 ;, token
 ; D:/TC/src/parser.c:369:     token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp110
	movq	%rax, %rcx	 ; tmp110,
	call	peek_current_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp111, token
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-16(%rbp), %rax	 ; token, tmp112
	movl	24(%rax), %eax	 ; token_39->type, _1
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _1
	je	.L113	 ;,
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-16(%rbp), %rax	 ; token, tmp113
	movl	24(%rax), %eax	 ; token_39->type, _2
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _2
	jne	.L114	 ;,
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-16(%rbp), %rax	 ; token, tmp114
	movq	(%rax), %rax	 ; token_39->lexeme, _3
	movq	%rax, %rcx	 ; _3,
	call	is_builtin_type	 ;
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; _4
	jne	.L113	 ;,
.L114:
 ; D:/TC/src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp115
	movq	(%rax), %rax	 ; parser_41(D)->source_file, _5
	movq	%rax, %rcx	 ; _5,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _6
 ; D:/TC/src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	 ; token, tmp116
	movq	%rdx, %r8	 ; _6,
	movq	%rax, %rdx	 ; tmp116,
	leaq	.LC39(%rip), %rax	 ;, tmp117
	movq	%rax, %rcx	 ; tmp117,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:373:         return NULL;
	movl	$0, %eax	 ;, _27
	jmp	.L115	 ;
.L113:
 ; D:/TC/src/parser.c:375:     Symbol* type = search_name(now_scope, token->lexeme);
	movq	-16(%rbp), %rax	 ; token, tmp118
	movq	(%rax), %rdx	 ; token_39->lexeme, _7
	movq	24(%rbp), %rax	 ; now_scope, tmp119
	movq	%rax, %rcx	 ; tmp119,
	call	search_name	 ;
	movq	%rax, -24(%rbp)	 ; tmp120, type
 ; D:/TC/src/parser.c:376:     if (type != NULL) {
	cmpq	$0, -24(%rbp)	 ;, type
	je	.L116	 ;,
 ; D:/TC/src/parser.c:377:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	movq	-24(%rbp), %rax	 ; type, tmp121
	movl	32(%rax), %eax	 ; type_47->kind, _8
 ; D:/TC/src/parser.c:377:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	cmpl	$6, %eax	 ;, _8
	je	.L117	 ;,
 ; D:/TC/src/parser.c:377:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	movq	-24(%rbp), %rax	 ; type, tmp122
	movl	32(%rax), %eax	 ; type_47->kind, _9
 ; D:/TC/src/parser.c:377:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	testl	%eax, %eax	 ; _9
	je	.L117	 ;,
 ; D:/TC/src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp123
	movq	(%rax), %rax	 ; parser_41(D)->source_file, _10
	movq	%rax, %rcx	 ; _10,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _11
 ; D:/TC/src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	 ; token, tmp124
	movq	%rdx, %r8	 ; _11,
	movq	%rax, %rdx	 ; tmp124,
	leaq	.LC40(%rip), %rax	 ;, tmp125
	movq	%rax, %rcx	 ; tmp125,
	call	parser_error	 ;
	jmp	.L117	 ;
.L116:
 ; D:/TC/src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp126
	movq	(%rax), %rax	 ; parser_41(D)->source_file, _12
	movq	%rax, %rcx	 ; _12,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _13
 ; D:/TC/src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	 ; token, tmp127
	movq	%rdx, %r8	 ; _13,
	movq	%rax, %rdx	 ; tmp127,
	leaq	.LC41(%rip), %rax	 ;, tmp128
	movq	%rax, %rcx	 ; tmp128,
	call	parser_error	 ;
.L117:
 ; D:/TC/src/parser.c:381:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp129
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp129,
	call	get_next_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp130, token
 ; D:/TC/src/parser.c:382:     if (token->type != IDENTIFIER)
	movq	-16(%rbp), %rax	 ; token, tmp131
	movl	24(%rax), %eax	 ; token_53->type, _14
 ; D:/TC/src/parser.c:382:     if (token->type != IDENTIFIER)
	cmpl	$1, %eax	 ;, _14
	je	.L118	 ;,
 ; D:/TC/src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp132
	movq	(%rax), %rax	 ; parser_41(D)->source_file, _15
	movq	%rax, %rcx	 ; _15,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _16
 ; D:/TC/src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	 ; token, tmp133
	movq	%rdx, %r8	 ; _16,
	movq	%rax, %rdx	 ; tmp133,
	leaq	.LC42(%rip), %rax	 ;, tmp134
	movq	%rax, %rcx	 ; tmp134,
	call	parser_error	 ;
.L118:
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movq	32(%rbp), %rax	 ; parser, tmp135
	movzbl	10(%rax), %eax	 ; parser_41(D)->in_class, _17
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	testb	%al, %al	 ; _17
	je	.L119	 ;,
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movq	32(%rbp), %rax	 ; parser, tmp136
	movzbl	9(%rax), %eax	 ; parser_41(D)->in_method, _18
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	testb	%al, %al	 ; _18
	jne	.L119	 ;,
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movl	$5, %r10d	 ;, iftmp.51_28
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	jmp	.L120	 ;
.L119:
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movl	$3, %r10d	 ;, iftmp.51_28
.L120:
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movq	-16(%rbp), %rax	 ; token, tmp137
	movq	(%rax), %rax	 ; token_53->lexeme, _19
	movq	24(%rbp), %rcx	 ; now_scope, tmp138
	movq	-24(%rbp), %rdx	 ; type, tmp139
	movq	%rcx, %r9	 ; tmp138,
	movq	%rdx, %r8	 ; tmp139,
	movl	%r10d, %edx	 ; iftmp.51_28,
	movq	%rax, %rcx	 ; _19,
	call	create_symbol	 ;
	movq	%rax, -32(%rbp)	 ; tmp140, name
 ; D:/TC/src/parser.c:385:     Expression* value = NULL;
	movq	$0, -8(%rbp)	 ;, value
 ; D:/TC/src/parser.c:386:     token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp141
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp141,
	call	peek_next_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp142, token
 ; D:/TC/src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token, tmp143
	movl	24(%rax), %eax	 ; token_62->type, _20
 ; D:/TC/src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _20
	jne	.L121	 ;,
 ; D:/TC/src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp144
	movq	(%rax), %rdx	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL.52_21
	movq	-16(%rbp), %rax	 ; token, tmp145
	movq	(%rax), %rax	 ; token_62->lexeme, _22
	movq	%rax, %rcx	 ; _22,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	 ; _23
	je	.L121	 ;,
 ; D:/TC/src/parser.c:388:         token = get_next_token(lexer, true);  // consume '='
	movq	16(%rbp), %rax	 ; lexer, tmp146
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp146,
	call	get_next_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp147, token
 ; D:/TC/src/parser.c:389:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp148
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp148,
	call	get_next_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp149, token
 ; D:/TC/src/parser.c:390:         value = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp150
	movq	24(%rbp), %rdx	 ; now_scope, tmp151
	movq	16(%rbp), %rax	 ; lexer, tmp152
	movq	%rcx, %r8	 ; tmp150,
	movq	%rax, %rcx	 ; tmp152,
	call	parse_expression	 ;
	movq	%rax, -8(%rbp)	 ; tmp153, value
 ; D:/TC/src/parser.c:391:         if (value == NULL)
	cmpq	$0, -8(%rbp)	 ;, value
	jne	.L121	 ;,
 ; D:/TC/src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp154
	movq	(%rax), %rax	 ; parser_41(D)->source_file, _24
	movq	%rax, %rcx	 ; _24,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _25
 ; D:/TC/src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	 ; token, tmp155
	movq	%rdx, %r8	 ; _25,
	movq	%rax, %rdx	 ; tmp155,
	leaq	.LC43(%rip), %rax	 ;, tmp156
	movq	%rax, %rcx	 ; tmp156,
	call	parser_error	 ;
.L121:
 ; D:/TC/src/parser.c:395:     return create_variable(type, name, value);
	movq	-8(%rbp), %rcx	 ; value, tmp157
	movq	-32(%rbp), %rdx	 ; name, tmp158
	movq	-24(%rbp), %rax	 ; type, tmp159
	movq	%rcx, %r8	 ; tmp157,
	movq	%rax, %rcx	 ; tmp159,
	call	create_variable	 ;
.L115:
 ; D:/TC/src/parser.c:396: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC44:
	.ascii "Cannot use 'break' outside of a loop\0"
	.align 8
.LC45:
	.ascii "Cannot use 'continue' outside of a loop\0"
.LC46:
	.ascii "Failed to parse statement\0"
.LC47:
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
 ; D:/TC/src/parser.c:399:     Token* token = NULL;
	movq	$0, -16(%rbp)	 ;, token
 ; D:/TC/src/parser.c:400:     token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp131
	movq	%rax, %rcx	 ; tmp131,
	call	peek_current_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp132, token
 ; D:/TC/src/parser.c:401:     Statement* statement = NULL;
	movq	$0, -8(%rbp)	 ;, statement
 ; D:/TC/src/parser.c:402:     if (token->type == KEYWORD) {
	movq	-16(%rbp), %rax	 ; token, tmp133
	movl	24(%rax), %eax	 ; token_60->type, _1
 ; D:/TC/src/parser.c:402:     if (token->type == KEYWORD) {
	cmpl	$6, %eax	 ;, _1
	jne	.L123	 ;,
 ; D:/TC/src/parser.c:403:         if (string_equal(token->lexeme, IF_KEYWORD))
	movq	.refptr.IF_KEYWORD(%rip), %rax	 ;, tmp134
	movq	(%rax), %rdx	 ; IF_KEYWORD, IF_KEYWORD.53_2
	movq	-16(%rbp), %rax	 ; token, tmp135
	movq	(%rax), %rax	 ; token_60->lexeme, _3
	movq	%rax, %rcx	 ; _3,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:403:         if (string_equal(token->lexeme, IF_KEYWORD))
	testb	%al, %al	 ; _4
	je	.L124	 ;,
 ; D:/TC/src/parser.c:404:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movq	32(%rbp), %rcx	 ; parser, tmp136
	movq	24(%rbp), %rdx	 ; now_scope, tmp137
	movq	16(%rbp), %rax	 ; lexer, tmp138
	movq	%rcx, %r8	 ; tmp136,
	movq	%rax, %rcx	 ; tmp138,
	call	parse_if	 ;
 ; D:/TC/src/parser.c:404:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _5,
	movl	$2, %ecx	 ;,
	call	create_statement	 ;
 ; D:/TC/src/parser.c:404:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	jmp	.L125	 ;
.L124:
 ; D:/TC/src/parser.c:405:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	movq	.refptr.FOR_KEYWORD(%rip), %rax	 ;, tmp139
	movq	(%rax), %rdx	 ; FOR_KEYWORD, FOR_KEYWORD.54_6
	movq	-16(%rbp), %rax	 ; token, tmp140
	movq	(%rax), %rax	 ; token_60->lexeme, _7
	movq	%rax, %rcx	 ; _7,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:405:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	testb	%al, %al	 ; _8
	je	.L126	 ;,
 ; D:/TC/src/parser.c:406:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movq	32(%rbp), %rcx	 ; parser, tmp141
	movq	24(%rbp), %rdx	 ; now_scope, tmp142
	movq	16(%rbp), %rax	 ; lexer, tmp143
	movq	%rcx, %r8	 ; tmp141,
	movq	%rax, %rcx	 ; tmp143,
	call	parse_for	 ;
 ; D:/TC/src/parser.c:406:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movq	%rax, %r9	 ; _9,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$4, %ecx	 ;,
	call	create_statement	 ;
 ; D:/TC/src/parser.c:406:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L125	 ;
.L126:
 ; D:/TC/src/parser.c:407:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	movq	.refptr.WHILE_KEYWORD(%rip), %rax	 ;, tmp144
	movq	(%rax), %rdx	 ; WHILE_KEYWORD, WHILE_KEYWORD.55_10
	movq	-16(%rbp), %rax	 ; token, tmp145
	movq	(%rax), %rax	 ; token_60->lexeme, _11
	movq	%rax, %rcx	 ; _11,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:407:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	testb	%al, %al	 ; _12
	je	.L127	 ;,
 ; D:/TC/src/parser.c:408:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movq	32(%rbp), %rcx	 ; parser, tmp146
	movq	24(%rbp), %rdx	 ; now_scope, tmp147
	movq	16(%rbp), %rax	 ; lexer, tmp148
	movq	%rcx, %r8	 ; tmp146,
	movq	%rax, %rcx	 ; tmp148,
	call	parse_while	 ;
 ; D:/TC/src/parser.c:408:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; _13,
	movl	$0, %edx	 ;,
	movl	$3, %ecx	 ;,
	call	create_statement	 ;
 ; D:/TC/src/parser.c:408:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	jmp	.L125	 ;
.L127:
 ; D:/TC/src/parser.c:409:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp149
	movq	(%rax), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD.56_14
	movq	-16(%rbp), %rax	 ; token, tmp150
	movq	(%rax), %rax	 ; token_60->lexeme, _15
	movq	%rax, %rcx	 ; _15,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:409:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; _16
	je	.L128	 ;,
 ; D:/TC/src/parser.c:410:             get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp151
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp151,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:411:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	32(%rbp), %rcx	 ; parser, tmp152
	movq	24(%rbp), %rdx	 ; now_scope, tmp153
	movq	16(%rbp), %rax	 ; lexer, tmp154
	movq	%rcx, %r8	 ; tmp152,
	movq	%rax, %rcx	 ; tmp154,
	call	parse_variable	 ;
 ; D:/TC/src/parser.c:411:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rax, 40(%rsp)	 ; _17,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, -8(%rbp)	 ; tmp155, statement
	jmp	.L129	 ;
.L128:
 ; D:/TC/src/parser.c:412:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	movq	.refptr.RETURN_KEYWORD(%rip), %rax	 ;, tmp156
	movq	(%rax), %rdx	 ; RETURN_KEYWORD, RETURN_KEYWORD.57_18
	movq	-16(%rbp), %rax	 ; token, tmp157
	movq	(%rax), %rax	 ; token_60->lexeme, _19
	movq	%rax, %rcx	 ; _19,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:412:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	 ; _20
	je	.L130	 ;,
 ; D:/TC/src/parser.c:413:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp158
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp158,
	call	get_next_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp159, token
 ; D:/TC/src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	-16(%rbp), %rax	 ; token, tmp160
	movl	24(%rax), %eax	 ; token_88->type, _21
 ; D:/TC/src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	 ;, _21
	jne	.L131	 ;,
 ; D:/TC/src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp161
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.58_22
	movq	-16(%rbp), %rax	 ; token, tmp162
	movq	(%rax), %rax	 ; token_88->lexeme, _23
	movq	%rax, %rcx	 ; _23,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; _24
	je	.L131	 ;,
 ; D:/TC/src/parser.c:416:                 return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	jmp	.L125	 ;
.L131:
 ; D:/TC/src/parser.c:418:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	32(%rbp), %rcx	 ; parser, tmp163
	movq	24(%rbp), %rdx	 ; now_scope, tmp164
	movq	16(%rbp), %rax	 ; lexer, tmp165
	movq	%rcx, %r8	 ; tmp163,
	movq	%rax, %rcx	 ; tmp165,
	call	parse_expression	 ;
 ; D:/TC/src/parser.c:418:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; _25,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, -8(%rbp)	 ; tmp166, statement
	jmp	.L129	 ;
.L130:
 ; D:/TC/src/parser.c:419:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	movq	.refptr.BREAK_KEYWORD(%rip), %rax	 ;, tmp167
	movq	(%rax), %rdx	 ; BREAK_KEYWORD, BREAK_KEYWORD.59_26
	movq	-16(%rbp), %rax	 ; token, tmp168
	movq	(%rax), %rax	 ; token_60->lexeme, _27
	movq	%rax, %rcx	 ; _27,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:419:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	 ; _28
	je	.L132	 ;,
 ; D:/TC/src/parser.c:420:             if (!parser->in_loop) {
	movq	32(%rbp), %rax	 ; parser, tmp169
	movzbl	11(%rax), %eax	 ; parser_63(D)->in_loop, _29
 ; D:/TC/src/parser.c:420:             if (!parser->in_loop) {
	testb	%al, %al	 ; _29
	jne	.L133	 ;,
 ; D:/TC/src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp170
	movq	(%rax), %rax	 ; parser_63(D)->source_file, _30
	movq	%rax, %rcx	 ; _30,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _31
 ; D:/TC/src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	 ; token, tmp171
	movq	%rdx, %r8	 ; _31,
	movq	%rax, %rdx	 ; tmp171,
	leaq	.LC44(%rip), %rax	 ;, tmp172
	movq	%rax, %rcx	 ; tmp172,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:423:                 return NULL;
	movl	$0, %eax	 ;, _49
	jmp	.L125	 ;
.L133:
 ; D:/TC/src/parser.c:425:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$6, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, -8(%rbp)	 ; tmp173, statement
	jmp	.L129	 ;
.L132:
 ; D:/TC/src/parser.c:426:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax	 ;, tmp174
	movq	(%rax), %rdx	 ; CONTINUE_KEYWORD, CONTINUE_KEYWORD.60_32
	movq	-16(%rbp), %rax	 ; token, tmp175
	movq	(%rax), %rax	 ; token_60->lexeme, _33
	movq	%rax, %rcx	 ; _33,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:426:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	 ; _34
	je	.L134	 ;,
 ; D:/TC/src/parser.c:427:             if (!parser->in_loop) {
	movq	32(%rbp), %rax	 ; parser, tmp176
	movzbl	11(%rax), %eax	 ; parser_63(D)->in_loop, _35
 ; D:/TC/src/parser.c:427:             if (!parser->in_loop) {
	testb	%al, %al	 ; _35
	jne	.L135	 ;,
 ; D:/TC/src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp177
	movq	(%rax), %rax	 ; parser_63(D)->source_file, _36
	movq	%rax, %rcx	 ; _36,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _37
 ; D:/TC/src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	 ; token, tmp178
	movq	%rdx, %r8	 ; _37,
	movq	%rax, %rdx	 ; tmp178,
	leaq	.LC45(%rip), %rax	 ;, tmp179
	movq	%rax, %rcx	 ; tmp179,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:430:                 return NULL;
	movl	$0, %eax	 ;, _49
	jmp	.L125	 ;
.L135:
 ; D:/TC/src/parser.c:432:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$7, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, -8(%rbp)	 ; tmp180, statement
	jmp	.L129	 ;
.L134:
 ; D:/TC/src/parser.c:434:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	32(%rbp), %rcx	 ; parser, tmp181
	movq	24(%rbp), %rdx	 ; now_scope, tmp182
	movq	16(%rbp), %rax	 ; lexer, tmp183
	movq	%rcx, %r8	 ; tmp181,
	movq	%rax, %rcx	 ; tmp183,
	call	parse_expression	 ;
 ; D:/TC/src/parser.c:434:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; _38,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, -8(%rbp)	 ; tmp184, statement
	jmp	.L129	 ;
.L123:
 ; D:/TC/src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	32(%rbp), %rcx	 ; parser, tmp185
	movq	24(%rbp), %rdx	 ; now_scope, tmp186
	movq	16(%rbp), %rax	 ; lexer, tmp187
	movq	%rcx, %r8	 ; tmp185,
	movq	%rax, %rcx	 ; tmp187,
	call	parse_expression	 ;
 ; D:/TC/src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; _39,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, -8(%rbp)	 ; tmp188, statement
.L129:
 ; D:/TC/src/parser.c:437:     token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp189
	movq	%rax, %rcx	 ; tmp189,
	call	peek_current_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp190, token
 ; D:/TC/src/parser.c:438:     if (statement == NULL)
	cmpq	$0, -8(%rbp)	 ;, statement
	jne	.L136	 ;,
 ; D:/TC/src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp191
	movq	(%rax), %rax	 ; parser_63(D)->source_file, _40
	movq	%rax, %rcx	 ; _40,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _41
 ; D:/TC/src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	 ; token, tmp192
	movq	%rdx, %r8	 ; _41,
	movq	%rax, %rdx	 ; tmp192,
	leaq	.LC46(%rip), %rax	 ;, tmp193
	movq	%rax, %rcx	 ; tmp193,
	call	parser_error	 ;
.L136:
 ; D:/TC/src/parser.c:440:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp194
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp194,
	call	get_next_token	 ;
	movq	%rax, -16(%rbp)	 ; tmp195, token
 ; D:/TC/src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	-16(%rbp), %rax	 ; token, tmp196
	movl	24(%rax), %eax	 ; token_113->type, _42
 ; D:/TC/src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, %eax	 ;, _42
	jne	.L137	 ;,
 ; D:/TC/src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp197
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.61_43
	movq	-16(%rbp), %rax	 ; token, tmp198
	movq	(%rax), %rax	 ; token_113->lexeme, _44
	movq	%rax, %rcx	 ; _44,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; _45
	jne	.L138	 ;,
.L137:
 ; D:/TC/src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp199
	movq	(%rax), %rax	 ; parser_63(D)->source_file, _46
	movq	%rax, %rcx	 ; _46,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _47
 ; D:/TC/src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	 ; token, tmp200
	movq	%rdx, %r8	 ; _47,
	movq	%rax, %rdx	 ; tmp200,
	leaq	.LC47(%rip), %rax	 ;, tmp201
	movq	%rax, %rcx	 ; tmp201,
	call	parser_error	 ;
.L138:
 ; D:/TC/src/parser.c:444:     return statement;
	movq	-8(%rbp), %rax	 ; statement, _49
.L125:
 ; D:/TC/src/parser.c:445: }
	leave	
	ret	
	.section .rdata,"dr"
.LC48:
	.ascii "Expected '(' after 'if'\0"
.LC49:
	.ascii "Failed to parse if condition\0"
	.align 8
.LC50:
	.ascii "Expected ')' after if condition\0"
.LC51:
	.ascii "Expected '{' to start if body\0"
	.align 8
.LC52:
	.ascii "Failed to parse if body statement\0"
.LC53:
	.ascii "Expected '(' after 'elif'\0"
	.align 8
.LC54:
	.ascii "Failed to parse else-if condition\0"
	.align 8
.LC55:
	.ascii "Expected ')' after else-if condition\0"
	.align 8
.LC56:
	.ascii "Expected '{' to start else-if body\0"
	.align 8
.LC57:
	.ascii "Failed to parse else-if body statement\0"
	.align 8
.LC58:
	.ascii "Expected '{' to start else body\0"
	.align 8
.LC59:
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
 ; D:/TC/src/parser.c:448:     Token* token = NULL;
	movq	$0, -8(%rbp)	 ;, token
 ; D:/TC/src/parser.c:449:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp157
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp157,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp158, token
 ; D:/TC/src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp159
	movl	24(%rax), %eax	 ; token_105->type, _1
 ; D:/TC/src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _1
	jne	.L140	 ;,
 ; D:/TC/src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp160
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.62_2
	movq	-8(%rbp), %rax	 ; token, tmp161
	movq	(%rax), %rax	 ; token_105->lexeme, _3
	movq	%rax, %rcx	 ; _3,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _4
	jne	.L141	 ;,
.L140:
 ; D:/TC/src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp162
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _5
	movq	%rax, %rcx	 ; _5,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _6
 ; D:/TC/src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp163
	movq	%rdx, %r8	 ; _6,
	movq	%rax, %rdx	 ; tmp163,
	leaq	.LC48(%rip), %rax	 ;, tmp164
	movq	%rax, %rcx	 ; tmp164,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:453:         return NULL;
	movl	$0, %eax	 ;, _78
	jmp	.L142	 ;
.L141:
 ; D:/TC/src/parser.c:455:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp165
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp165,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp166, token
 ; D:/TC/src/parser.c:456:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp167
	movq	24(%rbp), %rdx	 ; now_scope, tmp168
	movq	16(%rbp), %rax	 ; lexer, tmp169
	movq	%rcx, %r8	 ; tmp167,
	movq	%rax, %rcx	 ; tmp169,
	call	parse_expression	 ;
	movq	%rax, -16(%rbp)	 ; tmp170, condition
 ; D:/TC/src/parser.c:457:     if (condition == NULL)
	cmpq	$0, -16(%rbp)	 ;, condition
	jne	.L143	 ;,
 ; D:/TC/src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp171
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _7
	movq	%rax, %rcx	 ; _7,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _8
 ; D:/TC/src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp172
	movq	%rdx, %r8	 ; _8,
	movq	%rax, %rdx	 ; tmp172,
	leaq	.LC49(%rip), %rax	 ;, tmp173
	movq	%rax, %rcx	 ; tmp173,
	call	parser_error	 ;
.L143:
 ; D:/TC/src/parser.c:459:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp174
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp174,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp175, token
 ; D:/TC/src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp176
	movl	24(%rax), %eax	 ; token_116->type, _9
 ; D:/TC/src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _9
	jne	.L144	 ;,
 ; D:/TC/src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp177
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.63_10
	movq	-8(%rbp), %rax	 ; token, tmp178
	movq	(%rax), %rax	 ; token_116->lexeme, _11
	movq	%rax, %rcx	 ; _11,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _12
	jne	.L145	 ;,
.L144:
 ; D:/TC/src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp179
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _13
	movq	%rax, %rcx	 ; _13,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _14
 ; D:/TC/src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp180
	movq	%rdx, %r8	 ; _14,
	movq	%rax, %rdx	 ; tmp180,
	leaq	.LC50(%rip), %rax	 ;, tmp181
	movq	%rax, %rcx	 ; tmp181,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:463:         return NULL;
	movl	$0, %eax	 ;, _78
	jmp	.L142	 ;
.L145:
 ; D:/TC/src/parser.c:465:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp182
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp182,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp183, token
 ; D:/TC/src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp184
	movl	24(%rax), %eax	 ; token_119->type, _15
 ; D:/TC/src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _15
	jne	.L146	 ;,
 ; D:/TC/src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp185
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.64_16
	movq	-8(%rbp), %rax	 ; token, tmp186
	movq	(%rax), %rax	 ; token_119->lexeme, _17
	movq	%rax, %rcx	 ; _17,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _18
	jne	.L147	 ;,
.L146:
 ; D:/TC/src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp187
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _19
	movq	%rax, %rcx	 ; _19,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _20
 ; D:/TC/src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp188
	movq	%rdx, %r8	 ; _20,
	movq	%rax, %rdx	 ; tmp188,
	leaq	.LC51(%rip), %rax	 ;, tmp189
	movq	%rax, %rcx	 ; tmp189,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:469:         return NULL;
	movl	$0, %eax	 ;, _78
	jmp	.L142	 ;
.L147:
 ; D:/TC/src/parser.c:471:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, -24(%rbp)	 ; tmp190, body
 ; D:/TC/src/parser.c:472:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp191
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp191,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp192, token
 ; D:/TC/src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L148	 ;
.L150:
 ; D:/TC/src/parser.c:474:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp193
	movq	24(%rbp), %rdx	 ; now_scope, tmp194
	movq	16(%rbp), %rax	 ; lexer, tmp195
	movq	%rcx, %r8	 ; tmp193,
	movq	%rax, %rcx	 ; tmp195,
	call	parse_statement	 ;
	movq	%rax, -80(%rbp)	 ; tmp196, statement
 ; D:/TC/src/parser.c:475:         if (statement == NULL)
	cmpq	$0, -80(%rbp)	 ;, statement
	jne	.L149	 ;,
 ; D:/TC/src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp197
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _21
	movq	%rax, %rcx	 ; _21,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _22
 ; D:/TC/src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp198
	movq	%rdx, %r8	 ; _22,
	movq	%rax, %rdx	 ; tmp198,
	leaq	.LC52(%rip), %rax	 ;, tmp199
	movq	%rax, %rcx	 ; tmp199,
	call	parser_error	 ;
.L149:
 ; D:/TC/src/parser.c:477:         list_append(body, (pointer)statement);
	movq	-80(%rbp), %rdx	 ; statement, tmp200
	movq	-24(%rbp), %rax	 ; body, tmp201
	movq	%rax, %rcx	 ; tmp201,
	call	list_append	 ;
 ; D:/TC/src/parser.c:478:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp202
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp202,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp203, token
.L148:
 ; D:/TC/src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp204
	movl	24(%rax), %eax	 ; token_74->type, _23
 ; D:/TC/src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _23
	jne	.L150	 ;,
 ; D:/TC/src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp205
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.65_24
	movq	-8(%rbp), %rax	 ; token, tmp206
	movq	(%rax), %rax	 ; token_74->lexeme, _25
	movq	%rax, %rcx	 ; _25,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _26
	je	.L150	 ;,
 ; D:/TC/src/parser.c:480:     list(ElseIf*) else_if = create_list();
	call	create_list	 ;
	movq	%rax, -32(%rbp)	 ; tmp207, else_if
 ; D:/TC/src/parser.c:481:     list(Statement*) else_body = create_list();
	call	create_list	 ;
	movq	%rax, -40(%rbp)	 ; tmp208, else_body
 ; D:/TC/src/parser.c:482:     token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp209
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp209,
	call	peek_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp210, token
 ; D:/TC/src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	jmp	.L151	 ;
.L163:
 ; D:/TC/src/parser.c:484:         token = get_next_token(lexer, true);  // consume 'elif'
	movq	16(%rbp), %rax	 ; lexer, tmp211
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp211,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp212, token
 ; D:/TC/src/parser.c:485:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp213
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp213,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp214, token
 ; D:/TC/src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp215
	movl	24(%rax), %eax	 ; token_136->type, _27
 ; D:/TC/src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _27
	jne	.L152	 ;,
 ; D:/TC/src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp216
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.66_28
	movq	-8(%rbp), %rax	 ; token, tmp217
	movq	(%rax), %rax	 ; token_136->lexeme, _29
	movq	%rax, %rcx	 ; _29,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _30
	jne	.L153	 ;,
.L152:
 ; D:/TC/src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp218
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _31
	movq	%rax, %rcx	 ; _31,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _32
 ; D:/TC/src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp219
	movq	%rdx, %r8	 ; _32,
	movq	%rax, %rdx	 ; tmp219,
	leaq	.LC53(%rip), %rax	 ;, tmp220
	movq	%rax, %rcx	 ; tmp220,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:489:             return NULL;
	movl	$0, %eax	 ;, _78
	jmp	.L142	 ;
.L153:
 ; D:/TC/src/parser.c:491:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp221
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp221,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp222, token
 ; D:/TC/src/parser.c:492:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp223
	movq	24(%rbp), %rdx	 ; now_scope, tmp224
	movq	16(%rbp), %rax	 ; lexer, tmp225
	movq	%rcx, %r8	 ; tmp223,
	movq	%rax, %rcx	 ; tmp225,
	call	parse_expression	 ;
	movq	%rax, -48(%rbp)	 ; tmp226, elif_condition
 ; D:/TC/src/parser.c:493:         if (elif_condition == NULL)
	cmpq	$0, -48(%rbp)	 ;, elif_condition
	jne	.L154	 ;,
 ; D:/TC/src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp227
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _33
	movq	%rax, %rcx	 ; _33,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _34
 ; D:/TC/src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp228
	movq	%rdx, %r8	 ; _34,
	movq	%rax, %rdx	 ; tmp228,
	leaq	.LC54(%rip), %rax	 ;, tmp229
	movq	%rax, %rcx	 ; tmp229,
	call	parser_error	 ;
.L154:
 ; D:/TC/src/parser.c:495:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp230
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp230,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp231, token
 ; D:/TC/src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp232
	movl	24(%rax), %eax	 ; token_145->type, _35
 ; D:/TC/src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _35
	jne	.L155	 ;,
 ; D:/TC/src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp233
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.67_36
	movq	-8(%rbp), %rax	 ; token, tmp234
	movq	(%rax), %rax	 ; token_145->lexeme, _37
	movq	%rax, %rcx	 ; _37,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _38
	jne	.L156	 ;,
.L155:
 ; D:/TC/src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp235
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _39
	movq	%rax, %rcx	 ; _39,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _40
 ; D:/TC/src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp236
	movq	%rdx, %r8	 ; _40,
	movq	%rax, %rdx	 ; tmp236,
	leaq	.LC55(%rip), %rax	 ;, tmp237
	movq	%rax, %rcx	 ; tmp237,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:499:             return NULL;
	movl	$0, %eax	 ;, _78
	jmp	.L142	 ;
.L156:
 ; D:/TC/src/parser.c:501:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp238
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp238,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp239, token
 ; D:/TC/src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp240
	movl	24(%rax), %eax	 ; token_148->type, _41
 ; D:/TC/src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _41
	jne	.L157	 ;,
 ; D:/TC/src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp241
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.68_42
	movq	-8(%rbp), %rax	 ; token, tmp242
	movq	(%rax), %rax	 ; token_148->lexeme, _43
	movq	%rax, %rcx	 ; _43,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _44
	jne	.L158	 ;,
.L157:
 ; D:/TC/src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp243
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _45
	movq	%rax, %rcx	 ; _45,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _46
 ; D:/TC/src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp244
	movq	%rdx, %r8	 ; _46,
	movq	%rax, %rdx	 ; tmp244,
	leaq	.LC56(%rip), %rax	 ;, tmp245
	movq	%rax, %rcx	 ; tmp245,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:505:             return NULL;
	movl	$0, %eax	 ;, _78
	jmp	.L142	 ;
.L158:
 ; D:/TC/src/parser.c:507:         list(Statement*) elif_body = create_list();
	call	create_list	 ;
	movq	%rax, -56(%rbp)	 ; tmp246, elif_body
 ; D:/TC/src/parser.c:508:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp247
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp247,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp248, token
 ; D:/TC/src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L159	 ;
.L161:
 ; D:/TC/src/parser.c:510:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp249
	movq	24(%rbp), %rdx	 ; now_scope, tmp250
	movq	16(%rbp), %rax	 ; lexer, tmp251
	movq	%rcx, %r8	 ; tmp249,
	movq	%rax, %rcx	 ; tmp251,
	call	parse_statement	 ;
	movq	%rax, -64(%rbp)	 ; tmp252, statement
 ; D:/TC/src/parser.c:511:             if (statement == NULL)
	cmpq	$0, -64(%rbp)	 ;, statement
	jne	.L160	 ;,
 ; D:/TC/src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp253
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _47
	movq	%rax, %rcx	 ; _47,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _48
 ; D:/TC/src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp254
	movq	%rdx, %r8	 ; _48,
	movq	%rax, %rdx	 ; tmp254,
	leaq	.LC57(%rip), %rax	 ;, tmp255
	movq	%rax, %rcx	 ; tmp255,
	call	parser_error	 ;
.L160:
 ; D:/TC/src/parser.c:513:             list_append(elif_body, (pointer)statement);
	movq	-64(%rbp), %rdx	 ; statement, tmp256
	movq	-56(%rbp), %rax	 ; elif_body, tmp257
	movq	%rax, %rcx	 ; tmp257,
	call	list_append	 ;
 ; D:/TC/src/parser.c:514:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp258
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp258,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp259, token
.L159:
 ; D:/TC/src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp260
	movl	24(%rax), %eax	 ; token_75->type, _49
 ; D:/TC/src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _49
	jne	.L161	 ;,
 ; D:/TC/src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp261
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.69_50
	movq	-8(%rbp), %rax	 ; token, tmp262
	movq	(%rax), %rax	 ; token_75->lexeme, _51
	movq	%rax, %rcx	 ; _51,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _52
	je	.L161	 ;,
 ; D:/TC/src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	-56(%rbp), %rdx	 ; elif_body, tmp263
	movq	-48(%rbp), %rax	 ; elif_condition, tmp264
	movq	%rax, %rcx	 ; tmp264,
	call	create_else_if	 ;
	movq	%rax, %rdx	 ;, _53
 ; D:/TC/src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	-32(%rbp), %rax	 ; else_if, tmp265
	movq	%rax, %rcx	 ; tmp265,
	call	list_append	 ;
 ; D:/TC/src/parser.c:517:         token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp266
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp266,
	call	peek_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp267, token
.L151:
 ; D:/TC/src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	movq	-8(%rbp), %rax	 ; token, tmp268
	movl	24(%rax), %eax	 ; token_76->type, _54
 ; D:/TC/src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, %eax	 ;, _54
	jne	.L162	 ;,
 ; D:/TC/src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	movq	.refptr.ELIF_KEYWORD(%rip), %rax	 ;, tmp269
	movq	(%rax), %rdx	 ; ELIF_KEYWORD, ELIF_KEYWORD.70_55
	movq	-8(%rbp), %rax	 ; token, tmp270
	movq	(%rax), %rax	 ; token_76->lexeme, _56
	movq	%rax, %rcx	 ; _56,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	 ; _57
	jne	.L163	 ;,
.L162:
 ; D:/TC/src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	movq	-8(%rbp), %rax	 ; token, tmp271
	movl	24(%rax), %eax	 ; token_76->type, _58
 ; D:/TC/src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _58
	jne	.L164	 ;,
 ; D:/TC/src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	movq	.refptr.ELSE_KEYWORD(%rip), %rax	 ;, tmp272
	movq	(%rax), %rdx	 ; ELSE_KEYWORD, ELSE_KEYWORD.71_59
	movq	-8(%rbp), %rax	 ; token, tmp273
	movq	(%rax), %rax	 ; token_76->lexeme, _60
	movq	%rax, %rcx	 ; _60,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	 ; _61
	je	.L164	 ;,
 ; D:/TC/src/parser.c:520:         token = get_next_token(lexer, true);  // consume 'else'
	movq	16(%rbp), %rax	 ; lexer, tmp274
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp274,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp275, token
 ; D:/TC/src/parser.c:521:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp276
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp276,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp277, token
 ; D:/TC/src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp278
	movl	24(%rax), %eax	 ; token_179->type, _62
 ; D:/TC/src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _62
	jne	.L165	 ;,
 ; D:/TC/src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp279
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.72_63
	movq	-8(%rbp), %rax	 ; token, tmp280
	movq	(%rax), %rax	 ; token_179->lexeme, _64
	movq	%rax, %rcx	 ; _64,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _65
	jne	.L166	 ;,
.L165:
 ; D:/TC/src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp281
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _66
	movq	%rax, %rcx	 ; _66,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _67
 ; D:/TC/src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp282
	movq	%rdx, %r8	 ; _67,
	movq	%rax, %rdx	 ; tmp282,
	leaq	.LC58(%rip), %rax	 ;, tmp283
	movq	%rax, %rcx	 ; tmp283,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:525:             return NULL;
	movl	$0, %eax	 ;, _78
	jmp	.L142	 ;
.L166:
 ; D:/TC/src/parser.c:527:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp284
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp284,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp285, token
 ; D:/TC/src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L167	 ;
.L169:
 ; D:/TC/src/parser.c:529:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp286
	movq	24(%rbp), %rdx	 ; now_scope, tmp287
	movq	16(%rbp), %rax	 ; lexer, tmp288
	movq	%rcx, %r8	 ; tmp286,
	movq	%rax, %rcx	 ; tmp288,
	call	parse_statement	 ;
	movq	%rax, -72(%rbp)	 ; tmp289, statement
 ; D:/TC/src/parser.c:530:             if (statement == NULL)
	cmpq	$0, -72(%rbp)	 ;, statement
	jne	.L168	 ;,
 ; D:/TC/src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp290
	movq	(%rax), %rax	 ; parser_110(D)->source_file, _68
	movq	%rax, %rcx	 ; _68,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _69
 ; D:/TC/src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp291
	movq	%rdx, %r8	 ; _69,
	movq	%rax, %rdx	 ; tmp291,
	leaq	.LC59(%rip), %rax	 ;, tmp292
	movq	%rax, %rcx	 ; tmp292,
	call	parser_error	 ;
.L168:
 ; D:/TC/src/parser.c:532:             list_append(else_body, (pointer)statement);
	movq	-72(%rbp), %rdx	 ; statement, tmp293
	movq	-40(%rbp), %rax	 ; else_body, tmp294
	movq	%rax, %rcx	 ; tmp294,
	call	list_append	 ;
 ; D:/TC/src/parser.c:533:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp295
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp295,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp296, token
.L167:
 ; D:/TC/src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp297
	movl	24(%rax), %eax	 ; token_77->type, _70
 ; D:/TC/src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _70
	jne	.L169	 ;,
 ; D:/TC/src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp298
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.73_71
	movq	-8(%rbp), %rax	 ; token, tmp299
	movq	(%rax), %rax	 ; token_77->lexeme, _72
	movq	%rax, %rcx	 ; _72,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _73
	je	.L169	 ;,
.L164:
 ; D:/TC/src/parser.c:536:     token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp300
	movq	%rax, %rcx	 ; tmp300,
	call	peek_current_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp301, token
 ; D:/TC/src/parser.c:538:     return create_if(condition, body, else_if, else_body);
	movq	-40(%rbp), %r8	 ; else_body, tmp302
	movq	-32(%rbp), %rcx	 ; else_if, tmp303
	movq	-24(%rbp), %rdx	 ; body, tmp304
	movq	-16(%rbp), %rax	 ; condition, tmp305
	movq	%r8, %r9	 ; tmp302,
	movq	%rcx, %r8	 ; tmp303,
	movq	%rax, %rcx	 ; tmp305,
	call	create_if	 ;
.L142:
 ; D:/TC/src/parser.c:539: }
	leave	
	ret	
	.section .rdata,"dr"
.LC60:
	.ascii "Expected '(' after 'for'\0"
	.align 8
.LC61:
	.ascii "Failed to parse for loop initializer\0"
	.align 8
.LC62:
	.ascii "Expected ';' after for loop initializer\0"
	.align 8
.LC63:
	.ascii "Failed to parse for loop condition\0"
	.align 8
.LC64:
	.ascii "Expected ';' after for loop condition\0"
	.align 8
.LC65:
	.ascii "Failed to parse for loop increment\0"
	.align 8
.LC66:
	.ascii "Expected ')' after for loop increment\0"
	.align 8
.LC67:
	.ascii "Expected '{' to start for loop body\0"
	.align 8
.LC68:
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
 ; D:/TC/src/parser.c:542:     Token* token = NULL;
	movq	$0, -8(%rbp)	 ;, token
 ; D:/TC/src/parser.c:543:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp138
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp138,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp139, token
 ; D:/TC/src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp140
	movl	24(%rax), %eax	 ; token_85->type, _1
 ; D:/TC/src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _1
	jne	.L171	 ;,
 ; D:/TC/src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp141
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.74_2
	movq	-8(%rbp), %rax	 ; token, tmp142
	movq	(%rax), %rax	 ; token_85->lexeme, _3
	movq	%rax, %rcx	 ; _3,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _4
	jne	.L172	 ;,
.L171:
 ; D:/TC/src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp143
	movq	(%rax), %rax	 ; parser_92(D)->source_file, _5
	movq	%rax, %rcx	 ; _5,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _6
 ; D:/TC/src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp144
	movq	%rdx, %r8	 ; _6,
	movq	%rax, %rdx	 ; tmp144,
	leaq	.LC60(%rip), %rax	 ;, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:547:         return NULL;
	movl	$0, %eax	 ;, _62
	jmp	.L173	 ;
.L172:
 ; D:/TC/src/parser.c:549:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp146
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp146,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp147, token
 ; D:/TC/src/parser.c:550:     Variable* initializer = NULL;
	movq	$0, -16(%rbp)	 ;, initializer
 ; D:/TC/src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp148
	movl	24(%rax), %eax	 ; token_88->type, _7
 ; D:/TC/src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	 ;, _7
	jne	.L174	 ;,
 ; D:/TC/src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp149
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.75_8
	movq	-8(%rbp), %rax	 ; token, tmp150
	movq	(%rax), %rax	 ; token_88->lexeme, _9
	movq	%rax, %rcx	 ; _9,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; _10
	jne	.L175	 ;,
.L174:
 ; D:/TC/src/parser.c:552:         initializer = parse_variable(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp151
	movq	24(%rbp), %rdx	 ; now_scope, tmp152
	movq	16(%rbp), %rax	 ; lexer, tmp153
	movq	%rcx, %r8	 ; tmp151,
	movq	%rax, %rcx	 ; tmp153,
	call	parse_variable	 ;
	movq	%rax, -16(%rbp)	 ; tmp154, initializer
 ; D:/TC/src/parser.c:553:         if (initializer == NULL)
	cmpq	$0, -16(%rbp)	 ;, initializer
	jne	.L176	 ;,
 ; D:/TC/src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp155
	movq	(%rax), %rax	 ; parser_92(D)->source_file, _11
	movq	%rax, %rcx	 ; _11,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _12
 ; D:/TC/src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp156
	movq	%rdx, %r8	 ; _12,
	movq	%rax, %rdx	 ; tmp156,
	leaq	.LC61(%rip), %rax	 ;, tmp157
	movq	%rax, %rcx	 ; tmp157,
	call	parser_error	 ;
.L176:
 ; D:/TC/src/parser.c:555:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp158
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp158,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp159, token
.L175:
 ; D:/TC/src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp160
	movl	24(%rax), %eax	 ; token_55->type, _13
 ; D:/TC/src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	 ;, _13
	jne	.L177	 ;,
 ; D:/TC/src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp161
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.76_14
	movq	-8(%rbp), %rax	 ; token, tmp162
	movq	(%rax), %rax	 ; token_55->lexeme, _15
	movq	%rax, %rcx	 ; _15,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; _16
	jne	.L178	 ;,
.L177:
 ; D:/TC/src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp163
	movq	(%rax), %rax	 ; parser_92(D)->source_file, _17
	movq	%rax, %rcx	 ; _17,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _18
 ; D:/TC/src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp164
	movq	%rdx, %r8	 ; _18,
	movq	%rax, %rdx	 ; tmp164,
	leaq	.LC62(%rip), %rax	 ;, tmp165
	movq	%rax, %rcx	 ; tmp165,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:560:         return NULL;
	movl	$0, %eax	 ;, _62
	jmp	.L173	 ;
.L178:
 ; D:/TC/src/parser.c:562:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp166
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp166,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp167, token
 ; D:/TC/src/parser.c:563:     Expression* condition = NULL;
	movq	$0, -24(%rbp)	 ;, condition
 ; D:/TC/src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp168
	movl	24(%rax), %eax	 ; token_101->type, _19
 ; D:/TC/src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	 ;, _19
	jne	.L179	 ;,
 ; D:/TC/src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp169
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.77_20
	movq	-8(%rbp), %rax	 ; token, tmp170
	movq	(%rax), %rax	 ; token_101->lexeme, _21
	movq	%rax, %rcx	 ; _21,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; _22
	jne	.L180	 ;,
.L179:
 ; D:/TC/src/parser.c:565:         condition = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp171
	movq	24(%rbp), %rdx	 ; now_scope, tmp172
	movq	16(%rbp), %rax	 ; lexer, tmp173
	movq	%rcx, %r8	 ; tmp171,
	movq	%rax, %rcx	 ; tmp173,
	call	parse_expression	 ;
	movq	%rax, -24(%rbp)	 ; tmp174, condition
 ; D:/TC/src/parser.c:566:         if (condition == NULL)
	cmpq	$0, -24(%rbp)	 ;, condition
	jne	.L181	 ;,
 ; D:/TC/src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp175
	movq	(%rax), %rax	 ; parser_92(D)->source_file, _23
	movq	%rax, %rcx	 ; _23,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _24
 ; D:/TC/src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp176
	movq	%rdx, %r8	 ; _24,
	movq	%rax, %rdx	 ; tmp176,
	leaq	.LC63(%rip), %rax	 ;, tmp177
	movq	%rax, %rcx	 ; tmp177,
	call	parser_error	 ;
.L181:
 ; D:/TC/src/parser.c:568:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp178
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp178,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp179, token
.L180:
 ; D:/TC/src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp180
	movl	24(%rax), %eax	 ; token_56->type, _25
 ; D:/TC/src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	 ;, _25
	jne	.L182	 ;,
 ; D:/TC/src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp181
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.78_26
	movq	-8(%rbp), %rax	 ; token, tmp182
	movq	(%rax), %rax	 ; token_56->lexeme, _27
	movq	%rax, %rcx	 ; _27,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; _28
	jne	.L183	 ;,
.L182:
 ; D:/TC/src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp183
	movq	(%rax), %rax	 ; parser_92(D)->source_file, _29
	movq	%rax, %rcx	 ; _29,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _30
 ; D:/TC/src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp184
	movq	%rdx, %r8	 ; _30,
	movq	%rax, %rdx	 ; tmp184,
	leaq	.LC64(%rip), %rax	 ;, tmp185
	movq	%rax, %rcx	 ; tmp185,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:573:         return NULL;
	movl	$0, %eax	 ;, _62
	jmp	.L173	 ;
.L183:
 ; D:/TC/src/parser.c:575:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp186
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp186,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp187, token
 ; D:/TC/src/parser.c:576:     Expression* increment = NULL;
	movq	$0, -32(%rbp)	 ;, increment
 ; D:/TC/src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp188
	movl	24(%rax), %eax	 ; token_112->type, _31
 ; D:/TC/src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _31
	jne	.L184	 ;,
 ; D:/TC/src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp189
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.79_32
	movq	-8(%rbp), %rax	 ; token, tmp190
	movq	(%rax), %rax	 ; token_112->lexeme, _33
	movq	%rax, %rcx	 ; _33,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _34
	jne	.L185	 ;,
.L184:
 ; D:/TC/src/parser.c:578:         increment = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp191
	movq	24(%rbp), %rdx	 ; now_scope, tmp192
	movq	16(%rbp), %rax	 ; lexer, tmp193
	movq	%rcx, %r8	 ; tmp191,
	movq	%rax, %rcx	 ; tmp193,
	call	parse_expression	 ;
	movq	%rax, -32(%rbp)	 ; tmp194, increment
 ; D:/TC/src/parser.c:579:         if (increment == NULL)
	cmpq	$0, -32(%rbp)	 ;, increment
	jne	.L186	 ;,
 ; D:/TC/src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp195
	movq	(%rax), %rax	 ; parser_92(D)->source_file, _35
	movq	%rax, %rcx	 ; _35,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _36
 ; D:/TC/src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp196
	movq	%rdx, %r8	 ; _36,
	movq	%rax, %rdx	 ; tmp196,
	leaq	.LC65(%rip), %rax	 ;, tmp197
	movq	%rax, %rcx	 ; tmp197,
	call	parser_error	 ;
.L186:
 ; D:/TC/src/parser.c:581:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp198
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp198,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp199, token
.L185:
 ; D:/TC/src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp200
	movl	24(%rax), %eax	 ; token_57->type, _37
 ; D:/TC/src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _37
	jne	.L187	 ;,
 ; D:/TC/src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp201
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.80_38
	movq	-8(%rbp), %rax	 ; token, tmp202
	movq	(%rax), %rax	 ; token_57->lexeme, _39
	movq	%rax, %rcx	 ; _39,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _40
	jne	.L188	 ;,
.L187:
 ; D:/TC/src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp203
	movq	(%rax), %rax	 ; parser_92(D)->source_file, _41
	movq	%rax, %rcx	 ; _41,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _42
 ; D:/TC/src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp204
	movq	%rdx, %r8	 ; _42,
	movq	%rax, %rdx	 ; tmp204,
	leaq	.LC66(%rip), %rax	 ;, tmp205
	movq	%rax, %rcx	 ; tmp205,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:586:         return NULL;
	movl	$0, %eax	 ;, _62
	jmp	.L173	 ;
.L188:
 ; D:/TC/src/parser.c:588:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp206
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp206,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp207, token
 ; D:/TC/src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp208
	movl	24(%rax), %eax	 ; token_123->type, _43
 ; D:/TC/src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _43
	jne	.L189	 ;,
 ; D:/TC/src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp209
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.81_44
	movq	-8(%rbp), %rax	 ; token, tmp210
	movq	(%rax), %rax	 ; token_123->lexeme, _45
	movq	%rax, %rcx	 ; _45,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _46
	jne	.L190	 ;,
.L189:
 ; D:/TC/src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp211
	movq	(%rax), %rax	 ; parser_92(D)->source_file, _47
	movq	%rax, %rcx	 ; _47,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _48
 ; D:/TC/src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp212
	movq	%rdx, %r8	 ; _48,
	movq	%rax, %rdx	 ; tmp212,
	leaq	.LC67(%rip), %rax	 ;, tmp213
	movq	%rax, %rcx	 ; tmp213,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:592:         return NULL;
	movl	$0, %eax	 ;, _62
	jmp	.L173	 ;
.L190:
 ; D:/TC/src/parser.c:594:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, -40(%rbp)	 ; tmp214, body
 ; D:/TC/src/parser.c:595:     parser->in_loop = true;
	movq	32(%rbp), %rax	 ; parser, tmp215
	movb	$1, 11(%rax)	 ;, parser_92(D)->in_loop
 ; D:/TC/src/parser.c:596:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp216
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp216,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp217, token
 ; D:/TC/src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L191	 ;
.L193:
 ; D:/TC/src/parser.c:598:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp218
	movq	24(%rbp), %rdx	 ; now_scope, tmp219
	movq	16(%rbp), %rax	 ; lexer, tmp220
	movq	%rcx, %r8	 ; tmp218,
	movq	%rax, %rcx	 ; tmp220,
	call	parse_statement	 ;
	movq	%rax, -48(%rbp)	 ; tmp221, statement
 ; D:/TC/src/parser.c:599:         if (statement == NULL)
	cmpq	$0, -48(%rbp)	 ;, statement
	jne	.L192	 ;,
 ; D:/TC/src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp222
	movq	(%rax), %rax	 ; parser_92(D)->source_file, _49
	movq	%rax, %rcx	 ; _49,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _50
 ; D:/TC/src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp223
	movq	%rdx, %r8	 ; _50,
	movq	%rax, %rdx	 ; tmp223,
	leaq	.LC68(%rip), %rax	 ;, tmp224
	movq	%rax, %rcx	 ; tmp224,
	call	parser_error	 ;
.L192:
 ; D:/TC/src/parser.c:601:         list_append(body, (pointer)statement);
	movq	-48(%rbp), %rdx	 ; statement, tmp225
	movq	-40(%rbp), %rax	 ; body, tmp226
	movq	%rax, %rcx	 ; tmp226,
	call	list_append	 ;
 ; D:/TC/src/parser.c:602:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp227
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp227,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp228, token
.L191:
 ; D:/TC/src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp229
	movl	24(%rax), %eax	 ; token_58->type, _51
 ; D:/TC/src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _51
	jne	.L193	 ;,
 ; D:/TC/src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp230
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.82_52
	movq	-8(%rbp), %rax	 ; token, tmp231
	movq	(%rax), %rax	 ; token_58->lexeme, _53
	movq	%rax, %rcx	 ; _53,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _54
	je	.L193	 ;,
 ; D:/TC/src/parser.c:604:     parser->in_loop = false;
	movq	32(%rbp), %rax	 ; parser, tmp232
	movb	$0, 11(%rax)	 ;, parser_92(D)->in_loop
 ; D:/TC/src/parser.c:606:     return create_for(initializer, condition, increment, body);
	movq	-40(%rbp), %r8	 ; body, tmp233
	movq	-32(%rbp), %rcx	 ; increment, tmp234
	movq	-24(%rbp), %rdx	 ; condition, tmp235
	movq	-16(%rbp), %rax	 ; initializer, tmp236
	movq	%r8, %r9	 ; tmp233,
	movq	%rcx, %r8	 ; tmp234,
	movq	%rax, %rcx	 ; tmp236,
	call	create_for	 ;
.L173:
 ; D:/TC/src/parser.c:607: }
	leave	
	ret	
	.section .rdata,"dr"
.LC69:
	.ascii "Expected '(' after 'while'\0"
	.align 8
.LC70:
	.ascii "Failed to parse while condition\0"
	.align 8
.LC71:
	.ascii "Expected ')' after while condition\0"
	.align 8
.LC72:
	.ascii "Expected '{' to start while body\0"
	.align 8
.LC73:
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
 ; D:/TC/src/parser.c:610:     Token* token = NULL;
	movq	$0, -8(%rbp)	 ;, token
 ; D:/TC/src/parser.c:611:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp110
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp110,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp111, token
 ; D:/TC/src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp112
	movl	24(%rax), %eax	 ; token_41->type, _1
 ; D:/TC/src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _1
	jne	.L195	 ;,
 ; D:/TC/src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp113
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.83_2
	movq	-8(%rbp), %rax	 ; token, tmp114
	movq	(%rax), %rax	 ; token_41->lexeme, _3
	movq	%rax, %rcx	 ; _3,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _4
	jne	.L196	 ;,
.L195:
 ; D:/TC/src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp115
	movq	(%rax), %rax	 ; parser_46(D)->source_file, _5
	movq	%rax, %rcx	 ; _5,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _6
 ; D:/TC/src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp116
	movq	%rdx, %r8	 ; _6,
	movq	%rax, %rdx	 ; tmp116,
	leaq	.LC69(%rip), %rax	 ;, tmp117
	movq	%rax, %rcx	 ; tmp117,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:615:         return NULL;
	movl	$0, %eax	 ;, _28
	jmp	.L197	 ;
.L196:
 ; D:/TC/src/parser.c:617:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp118
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp118,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp119, token
 ; D:/TC/src/parser.c:618:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp120
	movq	24(%rbp), %rdx	 ; now_scope, tmp121
	movq	16(%rbp), %rax	 ; lexer, tmp122
	movq	%rcx, %r8	 ; tmp120,
	movq	%rax, %rcx	 ; tmp122,
	call	parse_expression	 ;
	movq	%rax, -16(%rbp)	 ; tmp123, condition
 ; D:/TC/src/parser.c:619:     if (condition == NULL)
	cmpq	$0, -16(%rbp)	 ;, condition
	jne	.L198	 ;,
 ; D:/TC/src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp124
	movq	(%rax), %rax	 ; parser_46(D)->source_file, _7
	movq	%rax, %rcx	 ; _7,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _8
 ; D:/TC/src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp125
	movq	%rdx, %r8	 ; _8,
	movq	%rax, %rdx	 ; tmp125,
	leaq	.LC70(%rip), %rax	 ;, tmp126
	movq	%rax, %rcx	 ; tmp126,
	call	parser_error	 ;
.L198:
 ; D:/TC/src/parser.c:621:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp127
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp127,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp128, token
 ; D:/TC/src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp129
	movl	24(%rax), %eax	 ; token_52->type, _9
 ; D:/TC/src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _9
	jne	.L199	 ;,
 ; D:/TC/src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp130
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.84_10
	movq	-8(%rbp), %rax	 ; token, tmp131
	movq	(%rax), %rax	 ; token_52->lexeme, _11
	movq	%rax, %rcx	 ; _11,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _12
	jne	.L200	 ;,
.L199:
 ; D:/TC/src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp132
	movq	(%rax), %rax	 ; parser_46(D)->source_file, _13
	movq	%rax, %rcx	 ; _13,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _14
 ; D:/TC/src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp133
	movq	%rdx, %r8	 ; _14,
	movq	%rax, %rdx	 ; tmp133,
	leaq	.LC71(%rip), %rax	 ;, tmp134
	movq	%rax, %rcx	 ; tmp134,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:625:         return NULL;
	movl	$0, %eax	 ;, _28
	jmp	.L197	 ;
.L200:
 ; D:/TC/src/parser.c:627:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp135
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp135,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp136, token
 ; D:/TC/src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp137
	movl	24(%rax), %eax	 ; token_55->type, _15
 ; D:/TC/src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _15
	jne	.L201	 ;,
 ; D:/TC/src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp138
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL.85_16
	movq	-8(%rbp), %rax	 ; token, tmp139
	movq	(%rax), %rax	 ; token_55->lexeme, _17
	movq	%rax, %rcx	 ; _17,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _18
	jne	.L202	 ;,
.L201:
 ; D:/TC/src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp140
	movq	(%rax), %rax	 ; parser_46(D)->source_file, _19
	movq	%rax, %rcx	 ; _19,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _20
 ; D:/TC/src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp141
	movq	%rdx, %r8	 ; _20,
	movq	%rax, %rdx	 ; tmp141,
	leaq	.LC72(%rip), %rax	 ;, tmp142
	movq	%rax, %rcx	 ; tmp142,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:631:         return NULL;
	movl	$0, %eax	 ;, _28
	jmp	.L197	 ;
.L202:
 ; D:/TC/src/parser.c:633:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, -24(%rbp)	 ; tmp143, body
 ; D:/TC/src/parser.c:634:     parser->in_loop = true;
	movq	32(%rbp), %rax	 ; parser, tmp144
	movb	$1, 11(%rax)	 ;, parser_46(D)->in_loop
 ; D:/TC/src/parser.c:635:     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp145
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp145,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp146, token
 ; D:/TC/src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L203	 ;
.L205:
 ; D:/TC/src/parser.c:637:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp147
	movq	24(%rbp), %rdx	 ; now_scope, tmp148
	movq	16(%rbp), %rax	 ; lexer, tmp149
	movq	%rcx, %r8	 ; tmp147,
	movq	%rax, %rcx	 ; tmp149,
	call	parse_statement	 ;
	movq	%rax, -32(%rbp)	 ; tmp150, statement
 ; D:/TC/src/parser.c:638:         if (statement == NULL)
	cmpq	$0, -32(%rbp)	 ;, statement
	jne	.L204	 ;,
 ; D:/TC/src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp151
	movq	(%rax), %rax	 ; parser_46(D)->source_file, _21
	movq	%rax, %rcx	 ; _21,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _22
 ; D:/TC/src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp152
	movq	%rdx, %r8	 ; _22,
	movq	%rax, %rdx	 ; tmp152,
	leaq	.LC73(%rip), %rax	 ;, tmp153
	movq	%rax, %rcx	 ; tmp153,
	call	parser_error	 ;
.L204:
 ; D:/TC/src/parser.c:640:         list_append(body, (pointer)statement);
	movq	-32(%rbp), %rdx	 ; statement, tmp154
	movq	-24(%rbp), %rax	 ; body, tmp155
	movq	%rax, %rcx	 ; tmp155,
	call	list_append	 ;
 ; D:/TC/src/parser.c:641:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp156
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp156,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp157, token
.L203:
 ; D:/TC/src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp158
	movl	24(%rax), %eax	 ; token_27->type, _23
 ; D:/TC/src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _23
	jne	.L205	 ;,
 ; D:/TC/src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp159
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL.86_24
	movq	-8(%rbp), %rax	 ; token, tmp160
	movq	(%rax), %rax	 ; token_27->lexeme, _25
	movq	%rax, %rcx	 ; _25,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; _26
	je	.L205	 ;,
 ; D:/TC/src/parser.c:643:     parser->in_loop = false;
	movq	32(%rbp), %rax	 ; parser, tmp161
	movb	$0, 11(%rax)	 ;, parser_46(D)->in_loop
 ; D:/TC/src/parser.c:645:     return create_while(condition, body);
	movq	-24(%rbp), %rdx	 ; body, tmp162
	movq	-16(%rbp), %rax	 ; condition, tmp163
	movq	%rax, %rcx	 ; tmp163,
	call	create_while	 ;
.L197:
 ; D:/TC/src/parser.c:646: }
	leave	
	ret	
	.section .rdata,"dr"
.LC74:
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
 ; D:/TC/src/parser.c:649:     Token* token = NULL;
	movq	$0, -8(%rbp)	 ;, token
 ; D:/TC/src/parser.c:650:     token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp90
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp90,
	call	peek_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp91, token
 ; D:/TC/src/parser.c:651:     while (token->type == SYMBOL) {
	jmp	.L207	 ;
.L215:
 ; D:/TC/src/parser.c:652:         OperatorType op = string_to_operator(token->lexeme);
	movq	-8(%rbp), %rax	 ; token, tmp92
	movq	(%rax), %rax	 ; token_9->lexeme, _1
	movq	%rax, %rcx	 ; _1,
	call	string_to_operator	 ;
	movl	%eax, -20(%rbp)	 ; tmp93, op
 ; D:/TC/src/parser.c:653:         int op_prec = operator_precedence(op);
	movl	-20(%rbp), %eax	 ; op, tmp94
	movl	%eax, %ecx	 ; tmp94,
	call	operator_precedence	 ;
	movl	%eax, -24(%rbp)	 ; tmp95, op_prec
 ; D:/TC/src/parser.c:654:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, -20(%rbp)	 ;, op
	je	.L208	 ;,
 ; D:/TC/src/parser.c:654:         if (op == OP_NONE || op_prec < min_prec)
	movl	-24(%rbp), %eax	 ; op_prec, tmp96
	cmpl	32(%rbp), %eax	 ; min_prec, tmp96
	jl	.L208	 ;,
 ; D:/TC/src/parser.c:656:         token = get_next_token(lexer, true);  // consume operator
	movq	16(%rbp), %rax	 ; lexer, tmp97
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp97,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp98, token
 ; D:/TC/src/parser.c:657:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp99
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp99,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp100, token
 ; D:/TC/src/parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	48(%rbp), %rcx	 ; parser, tmp101
	movq	40(%rbp), %rdx	 ; now_scope, tmp102
	movq	16(%rbp), %rax	 ; lexer, tmp103
	movq	%rcx, %r8	 ; tmp101,
	movq	%rax, %rcx	 ; tmp103,
	call	parse_primary	 ;
	movq	%rax, -32(%rbp)	 ; tmp104, right_primary
 ; D:/TC/src/parser.c:659:         if (right_primary == NULL) {
	cmpq	$0, -32(%rbp)	 ;, right_primary
	jne	.L209	 ;,
 ; D:/TC/src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	48(%rbp), %rax	 ; parser, tmp105
	movq	(%rax), %rax	 ; parser_33(D)->source_file, _2
	movq	%rax, %rcx	 ; _2,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _3
 ; D:/TC/src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp106
	movq	%rdx, %r8	 ; _3,
	movq	%rax, %rdx	 ; tmp106,
	leaq	.LC74(%rip), %rax	 ;, tmp107
	movq	%rax, %rcx	 ; tmp107,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:662:             return NULL;
	movl	$0, %eax	 ;, _11
	jmp	.L210	 ;
.L209:
 ; D:/TC/src/parser.c:664:         Expression* right = create_expression(OP_NONE, NULL, right_primary, NULL);
	movq	-32(%rbp), %rax	 ; right_primary, tmp108
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; tmp108,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, -16(%rbp)	 ; tmp109, right
 ; D:/TC/src/parser.c:665:         token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp110
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp110,
	call	peek_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp111, token
 ; D:/TC/src/parser.c:666:         while (token->type == SYMBOL) {
	jmp	.L211	 ;
.L214:
 ; D:/TC/src/parser.c:667:             OperatorType next_op = string_to_operator(token->lexeme);
	movq	-8(%rbp), %rax	 ; token, tmp112
	movq	(%rax), %rax	 ; token_8->lexeme, _4
	movq	%rax, %rcx	 ; _4,
	call	string_to_operator	 ;
	movl	%eax, -36(%rbp)	 ; tmp113, next_op
 ; D:/TC/src/parser.c:668:             int next_prec = operator_precedence(next_op);
	movl	-36(%rbp), %eax	 ; next_op, tmp114
	movl	%eax, %ecx	 ; tmp114,
	call	operator_precedence	 ;
	movl	%eax, -40(%rbp)	 ; tmp115, next_prec
 ; D:/TC/src/parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, -36(%rbp)	 ;, next_op
	je	.L212	 ;,
 ; D:/TC/src/parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	movl	-40(%rbp), %eax	 ; next_prec, tmp116
	cmpl	-24(%rbp), %eax	 ; op_prec, tmp116
	jle	.L212	 ;,
 ; D:/TC/src/parser.c:671:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	40(%rbp), %r9	 ; now_scope, tmp117
	movl	-40(%rbp), %r8d	 ; next_prec, tmp118
	movq	-16(%rbp), %rdx	 ; right, tmp119
	movq	16(%rbp), %rax	 ; lexer, tmp120
	movq	48(%rbp), %rcx	 ; parser, tmp121
	movq	%rcx, 32(%rsp)	 ; tmp121,
	movq	%rax, %rcx	 ; tmp120,
	call	parse_expr_prec	 ;
	movq	%rax, -16(%rbp)	 ; tmp122, right
 ; D:/TC/src/parser.c:672:             if (right == NULL) {
	cmpq	$0, -16(%rbp)	 ;, right
	jne	.L213	 ;,
 ; D:/TC/src/parser.c:674:                 return NULL;
	movl	$0, %eax	 ;, _11
	jmp	.L210	 ;
.L213:
 ; D:/TC/src/parser.c:676:             token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp123
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp123,
	call	peek_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp124, token
.L211:
 ; D:/TC/src/parser.c:666:         while (token->type == SYMBOL) {
	movq	-8(%rbp), %rax	 ; token, tmp125
	movl	24(%rax), %eax	 ; token_8->type, _5
 ; D:/TC/src/parser.c:666:         while (token->type == SYMBOL) {
	cmpl	$5, %eax	 ;, _5
	je	.L214	 ;,
.L212:
 ; D:/TC/src/parser.c:678:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	-16(%rbp), %rcx	 ; right, tmp126
	movq	24(%rbp), %rdx	 ; expr_left, tmp127
	movl	-20(%rbp), %eax	 ; op, tmp128
	movq	%rcx, %r9	 ; tmp126,
	movl	$0, %r8d	 ;,
	movl	%eax, %ecx	 ; tmp128,
	call	create_expression	 ;
	movq	%rax, 24(%rbp)	 ; tmp129, expr_left
 ; D:/TC/src/parser.c:679:         token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp130
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp130,
	call	peek_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp131, token
.L207:
 ; D:/TC/src/parser.c:651:     while (token->type == SYMBOL) {
	movq	-8(%rbp), %rax	 ; token, tmp132
	movl	24(%rax), %eax	 ; token_9->type, _6
 ; D:/TC/src/parser.c:651:     while (token->type == SYMBOL) {
	cmpl	$5, %eax	 ;, _6
	je	.L215	 ;,
.L208:
 ; D:/TC/src/parser.c:681:     token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp133
	movq	%rax, %rcx	 ; tmp133,
	call	peek_current_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp134, token
 ; D:/TC/src/parser.c:683:     return expr_left;
	movq	24(%rbp), %rax	 ; expr_left, _11
.L210:
 ; D:/TC/src/parser.c:684: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC75:
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
 ; D:/TC/src/parser.c:687:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp88
	movq	24(%rbp), %rdx	 ; now_scope, tmp89
	movq	16(%rbp), %rax	 ; lexer, tmp90
	movq	%rcx, %r8	 ; tmp88,
	movq	%rax, %rcx	 ; tmp90,
	call	parse_primary	 ;
	movq	%rax, -24(%rbp)	 ; tmp91, left_primary
 ; D:/TC/src/parser.c:688:     if (left_primary == NULL) {
	cmpq	$0, -24(%rbp)	 ;, left_primary
	jne	.L217	 ;,
 ; D:/TC/src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp92
	movq	(%rax), %rax	 ; parser_10(D)->source_file, _1
	movq	%rax, %rcx	 ; _1,
	call	get_full_path	 ;
	movq	%rax, %rbx	 ;, _2
 ; D:/TC/src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	16(%rbp), %rax	 ; lexer, tmp93
	movq	%rax, %rcx	 ; tmp93,
	call	peek_current_token	 ;
 ; D:/TC/src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %r8	 ; _2,
	movq	%rax, %rdx	 ; _3,
	leaq	.LC75(%rip), %rax	 ;, tmp94
	movq	%rax, %rcx	 ; tmp94,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:691:         return NULL;
	movl	$0, %eax	 ;, _5
	jmp	.L218	 ;
.L217:
 ; D:/TC/src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	-24(%rbp), %rax	 ; left_primary, tmp95
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; tmp95,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rcx	 ;, _4
 ; D:/TC/src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	24(%rbp), %r8	 ; now_scope, tmp96
	movq	16(%rbp), %rax	 ; lexer, tmp97
	movq	32(%rbp), %rdx	 ; parser, tmp98
	movq	%rdx, 32(%rsp)	 ; tmp98,
	movq	%r8, %r9	 ; tmp96,
	movl	$0, %r8d	 ;,
	movq	%rcx, %rdx	 ; _4,
	movq	%rax, %rcx	 ; tmp97,
	call	parse_expr_prec	 ;
.L218:
 ; D:/TC/src/parser.c:695: }
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC76:
	.ascii "Failed to parse parenthesized expression\0"
.LC77:
	.ascii "Expected ')' after expression\0"
	.align 8
.LC78:
	.ascii "Failed to parse operand of unary '!'\0"
	.align 8
.LC79:
	.ascii "Failed to parse operand of unary '-'\0"
	.align 8
.LC80:
	.ascii "Failed to parse variable access\0"
	.align 8
.LC81:
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
 ; D:/TC/src/parser.c:698:     Token* token = NULL;
	movq	$0, -48(%rbp)	 ;, token
 ; D:/TC/src/parser.c:699:     token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp129
	movq	%rax, %rcx	 ; tmp129,
	call	peek_current_token	 ;
	movq	%rax, -48(%rbp)	 ; tmp130, token
 ; D:/TC/src/parser.c:701:     string str_value = NULL;
	movq	$0, -16(%rbp)	 ;, str_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	movq	$0, -24(%rbp)	 ;, expr_value
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	movq	$0, -32(%rbp)	 ;, prim_value
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	movq	$0, -40(%rbp)	 ;, variable_value
 ; D:/TC/src/parser.c:705:     if (token->type == INTEGER) {
	movq	-48(%rbp), %rax	 ; token, tmp131
	movl	24(%rax), %eax	 ; token_66->type, _1
 ; D:/TC/src/parser.c:705:     if (token->type == INTEGER) {
	cmpl	$2, %eax	 ;, _1
	jne	.L220	 ;,
 ; D:/TC/src/parser.c:706:         type = PRIM_INTEGER;
	movl	$0, -4(%rbp)	 ;, type
 ; D:/TC/src/parser.c:707:         str_value = token->lexeme;
	movq	-48(%rbp), %rax	 ; token, tmp132
	movq	(%rax), %rax	 ; token_66->lexeme, tmp133
	movq	%rax, -16(%rbp)	 ; tmp133, str_value
	jmp	.L221	 ;
.L220:
 ; D:/TC/src/parser.c:708:     } else if (token->type == FLOAT) {
	movq	-48(%rbp), %rax	 ; token, tmp134
	movl	24(%rax), %eax	 ; token_66->type, _2
 ; D:/TC/src/parser.c:708:     } else if (token->type == FLOAT) {
	cmpl	$3, %eax	 ;, _2
	jne	.L222	 ;,
 ; D:/TC/src/parser.c:709:         type = PRIM_FLOAT;
	movl	$1, -4(%rbp)	 ;, type
 ; D:/TC/src/parser.c:710:         str_value = token->lexeme;
	movq	-48(%rbp), %rax	 ; token, tmp135
	movq	(%rax), %rax	 ; token_66->lexeme, tmp136
	movq	%rax, -16(%rbp)	 ; tmp136, str_value
	jmp	.L221	 ;
.L222:
 ; D:/TC/src/parser.c:711:     } else if (token->type == STRING) {
	movq	-48(%rbp), %rax	 ; token, tmp137
	movl	24(%rax), %eax	 ; token_66->type, _3
 ; D:/TC/src/parser.c:711:     } else if (token->type == STRING) {
	cmpl	$4, %eax	 ;, _3
	jne	.L223	 ;,
 ; D:/TC/src/parser.c:712:         type = PRIM_STRING;
	movl	$2, -4(%rbp)	 ;, type
 ; D:/TC/src/parser.c:713:         str_value = token->lexeme;
	movq	-48(%rbp), %rax	 ; token, tmp138
	movq	(%rax), %rax	 ; token_66->lexeme, tmp139
	movq	%rax, -16(%rbp)	 ; tmp139, str_value
	jmp	.L221	 ;
.L223:
 ; D:/TC/src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	movq	-48(%rbp), %rax	 ; token, tmp140
	movl	24(%rax), %eax	 ; token_66->type, _4
 ; D:/TC/src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _4
	jne	.L224	 ;,
 ; D:/TC/src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	movq	.refptr.TRUE_KEYWORD(%rip), %rax	 ;, tmp141
	movq	(%rax), %rdx	 ; TRUE_KEYWORD, TRUE_KEYWORD.87_5
	movq	-48(%rbp), %rax	 ; token, tmp142
	movq	(%rax), %rax	 ; token_66->lexeme, _6
	movq	%rax, %rcx	 ; _6,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	 ; _7
	je	.L224	 ;,
 ; D:/TC/src/parser.c:715:         type = PRIM_TRUE;
	movl	$3, -4(%rbp)	 ;, type
 ; D:/TC/src/parser.c:716:         str_value = token->lexeme;
	movq	-48(%rbp), %rax	 ; token, tmp143
	movq	(%rax), %rax	 ; token_66->lexeme, tmp144
	movq	%rax, -16(%rbp)	 ; tmp144, str_value
	jmp	.L221	 ;
.L224:
 ; D:/TC/src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movq	-48(%rbp), %rax	 ; token, tmp145
	movl	24(%rax), %eax	 ; token_66->type, _8
 ; D:/TC/src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _8
	jne	.L225	 ;,
 ; D:/TC/src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movq	.refptr.FALSE_KEYWORD(%rip), %rax	 ;, tmp146
	movq	(%rax), %rdx	 ; FALSE_KEYWORD, FALSE_KEYWORD.88_9
	movq	-48(%rbp), %rax	 ; token, tmp147
	movq	(%rax), %rax	 ; token_66->lexeme, _10
	movq	%rax, %rcx	 ; _10,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	 ; _11
	je	.L225	 ;,
 ; D:/TC/src/parser.c:718:         type = PRIM_FALSE;
	movl	$4, -4(%rbp)	 ;, type
 ; D:/TC/src/parser.c:719:         str_value = token->lexeme;
	movq	-48(%rbp), %rax	 ; token, tmp148
	movq	(%rax), %rax	 ; token_66->lexeme, tmp149
	movq	%rax, -16(%rbp)	 ; tmp149, str_value
	jmp	.L221	 ;
.L225:
 ; D:/TC/src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-48(%rbp), %rax	 ; token, tmp150
	movl	24(%rax), %eax	 ; token_66->type, _12
 ; D:/TC/src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _12
	jne	.L226	 ;,
 ; D:/TC/src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp151
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.89_13
	movq	-48(%rbp), %rax	 ; token, tmp152
	movq	(%rax), %rax	 ; token_66->lexeme, _14
	movq	%rax, %rcx	 ; _14,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _15
	je	.L226	 ;,
 ; D:/TC/src/parser.c:721:         type = PRIM_EXPRESSION;
	movl	$5, -4(%rbp)	 ;, type
 ; D:/TC/src/parser.c:722:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp153
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp153,
	call	get_next_token	 ;
	movq	%rax, -48(%rbp)	 ; tmp154, token
 ; D:/TC/src/parser.c:723:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp155
	movq	24(%rbp), %rdx	 ; now_scope, tmp156
	movq	16(%rbp), %rax	 ; lexer, tmp157
	movq	%rcx, %r8	 ; tmp155,
	movq	%rax, %rcx	 ; tmp157,
	call	parse_expression	 ;
	movq	%rax, -24(%rbp)	 ; tmp158, expr_value
 ; D:/TC/src/parser.c:724:         if (expr_value == NULL) {
	cmpq	$0, -24(%rbp)	 ;, expr_value
	jne	.L227	 ;,
 ; D:/TC/src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp159
	movq	(%rax), %rax	 ; parser_82(D)->source_file, _16
	movq	%rax, %rcx	 ; _16,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _17
 ; D:/TC/src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	-48(%rbp), %rax	 ; token, tmp160
	movq	%rdx, %r8	 ; _17,
	movq	%rax, %rdx	 ; tmp160,
	leaq	.LC76(%rip), %rax	 ;, tmp161
	movq	%rax, %rcx	 ; tmp161,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:727:             return NULL;
	movl	$0, %eax	 ;, _51
	jmp	.L228	 ;
.L227:
 ; D:/TC/src/parser.c:729:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp162
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp162,
	call	get_next_token	 ;
	movq	%rax, -48(%rbp)	 ; tmp163, token
 ; D:/TC/src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-48(%rbp), %rax	 ; token, tmp164
	movl	24(%rax), %eax	 ; token_86->type, _18
 ; D:/TC/src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _18
	jne	.L229	 ;,
 ; D:/TC/src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp165
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.90_19
	movq	-48(%rbp), %rax	 ; token, tmp166
	movq	(%rax), %rax	 ; token_86->lexeme, _20
	movq	%rax, %rcx	 ; _20,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _21
	jne	.L238	 ;,
.L229:
 ; D:/TC/src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp167
	movq	(%rax), %rax	 ; parser_82(D)->source_file, _22
	movq	%rax, %rcx	 ; _22,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _23
 ; D:/TC/src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	-48(%rbp), %rax	 ; token, tmp168
	movq	%rdx, %r8	 ; _23,
	movq	%rax, %rdx	 ; tmp168,
	leaq	.LC77(%rip), %rax	 ;, tmp169
	movq	%rax, %rcx	 ; tmp169,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:733:             return NULL;
	movl	$0, %eax	 ;, _51
	jmp	.L228	 ;
.L226:
 ; D:/TC/src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movq	-48(%rbp), %rax	 ; token, tmp170
	movl	24(%rax), %eax	 ; token_66->type, _24
 ; D:/TC/src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	cmpl	$5, %eax	 ;, _24
	jne	.L231	 ;,
 ; D:/TC/src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp171
	movq	(%rax), %rdx	 ; NOT_SYMBOL, NOT_SYMBOL.91_25
	movq	-48(%rbp), %rax	 ; token, tmp172
	movq	(%rax), %rax	 ; token_66->lexeme, _26
	movq	%rax, %rcx	 ; _26,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	 ; _27
	je	.L231	 ;,
 ; D:/TC/src/parser.c:736:         type = PRIM_NOT_OPERAND;
	movl	$6, -4(%rbp)	 ;, type
 ; D:/TC/src/parser.c:737:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp173
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp173,
	call	get_next_token	 ;
	movq	%rax, -48(%rbp)	 ; tmp174, token
 ; D:/TC/src/parser.c:738:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp175
	movq	24(%rbp), %rdx	 ; now_scope, tmp176
	movq	16(%rbp), %rax	 ; lexer, tmp177
	movq	%rcx, %r8	 ; tmp175,
	movq	%rax, %rcx	 ; tmp177,
	call	parse_primary	 ;
	movq	%rax, -32(%rbp)	 ; tmp178, prim_value
 ; D:/TC/src/parser.c:739:         if (prim_value == NULL) {
	cmpq	$0, -32(%rbp)	 ;, prim_value
	jne	.L221	 ;,
 ; D:/TC/src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp179
	movq	(%rax), %rax	 ; parser_82(D)->source_file, _28
	movq	%rax, %rcx	 ; _28,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _29
 ; D:/TC/src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	-48(%rbp), %rax	 ; token, tmp180
	movq	%rdx, %r8	 ; _29,
	movq	%rax, %rdx	 ; tmp180,
	leaq	.LC78(%rip), %rax	 ;, tmp181
	movq	%rax, %rcx	 ; tmp181,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:742:             return NULL;
	movl	$0, %eax	 ;, _51
	jmp	.L228	 ;
.L231:
 ; D:/TC/src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movq	-48(%rbp), %rax	 ; token, tmp182
	movl	24(%rax), %eax	 ; token_66->type, _30
 ; D:/TC/src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	cmpl	$5, %eax	 ;, _30
	jne	.L233	 ;,
 ; D:/TC/src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp183
	movq	(%rax), %rdx	 ; SUB_SYMBOL, SUB_SYMBOL.92_31
	movq	-48(%rbp), %rax	 ; token, tmp184
	movq	(%rax), %rax	 ; token_66->lexeme, _32
	movq	%rax, %rcx	 ; _32,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	 ; _33
	je	.L233	 ;,
 ; D:/TC/src/parser.c:745:         type = PRIM_NEG_OPERAND;
	movl	$7, -4(%rbp)	 ;, type
 ; D:/TC/src/parser.c:746:         token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp185
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp185,
	call	get_next_token	 ;
	movq	%rax, -48(%rbp)	 ; tmp186, token
 ; D:/TC/src/parser.c:747:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp187
	movq	24(%rbp), %rdx	 ; now_scope, tmp188
	movq	16(%rbp), %rax	 ; lexer, tmp189
	movq	%rcx, %r8	 ; tmp187,
	movq	%rax, %rcx	 ; tmp189,
	call	parse_primary	 ;
	movq	%rax, -32(%rbp)	 ; tmp190, prim_value
 ; D:/TC/src/parser.c:748:         if (prim_value == NULL) {
	cmpq	$0, -32(%rbp)	 ;, prim_value
	jne	.L221	 ;,
 ; D:/TC/src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp191
	movq	(%rax), %rax	 ; parser_82(D)->source_file, _34
	movq	%rax, %rcx	 ; _34,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _35
 ; D:/TC/src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	-48(%rbp), %rax	 ; token, tmp192
	movq	%rdx, %r8	 ; _35,
	movq	%rax, %rdx	 ; tmp192,
	leaq	.LC79(%rip), %rax	 ;, tmp193
	movq	%rax, %rcx	 ; tmp193,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:751:             return NULL;
	movl	$0, %eax	 ;, _51
	jmp	.L228	 ;
.L233:
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	-48(%rbp), %rax	 ; token, tmp194
	movl	24(%rax), %eax	 ; token_66->type, _36
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$1, %eax	 ;, _36
	je	.L235	 ;,
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	-48(%rbp), %rax	 ; token, tmp195
	movl	24(%rax), %eax	 ; token_66->type, _37
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$6, %eax	 ;, _37
	jne	.L236	 ;,
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp196
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD.93_38
	movq	-48(%rbp), %rax	 ; token, tmp197
	movq	(%rax), %rax	 ; token_66->lexeme, _39
	movq	%rax, %rcx	 ; _39,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	testb	%al, %al	 ; _40
	je	.L236	 ;,
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	32(%rbp), %rax	 ; parser, tmp198
	movzbl	9(%rax), %eax	 ; parser_82(D)->in_method, _41
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	testb	%al, %al	 ; _41
	je	.L236	 ;,
.L235:
 ; D:/TC/src/parser.c:754:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, -4(%rbp)	 ;, type
 ; D:/TC/src/parser.c:755:         variable_value = parse_variable_access(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp199
	movq	24(%rbp), %rdx	 ; now_scope, tmp200
	movq	16(%rbp), %rax	 ; lexer, tmp201
	movq	%rcx, %r8	 ; tmp199,
	movq	%rax, %rcx	 ; tmp201,
	call	parse_variable_access	 ;
	movq	%rax, -40(%rbp)	 ; tmp202, variable_value
 ; D:/TC/src/parser.c:756:         if (variable_value == NULL) {
	cmpq	$0, -40(%rbp)	 ;, variable_value
	jne	.L221	 ;,
 ; D:/TC/src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp203
	movq	(%rax), %rax	 ; parser_82(D)->source_file, _42
	movq	%rax, %rcx	 ; _42,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _43
 ; D:/TC/src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	-48(%rbp), %rax	 ; token, tmp204
	movq	%rdx, %r8	 ; _43,
	movq	%rax, %rdx	 ; tmp204,
	leaq	.LC80(%rip), %rax	 ;, tmp205
	movq	%rax, %rcx	 ; tmp205,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:759:             return NULL;
	movl	$0, %eax	 ;, _51
	jmp	.L228	 ;
.L236:
 ; D:/TC/src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp206
	movq	(%rax), %rax	 ; parser_82(D)->source_file, _44
	movq	%rax, %rcx	 ; _44,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _45
 ; D:/TC/src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	-48(%rbp), %rax	 ; token, tmp207
	movq	%rdx, %r8	 ; _45,
	movq	%rax, %rdx	 ; tmp207,
	leaq	.LC81(%rip), %rax	 ;, tmp208
	movq	%rax, %rcx	 ; tmp208,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:764:         return NULL;
	movl	$0, %eax	 ;, _51
	jmp	.L228	 ;
.L238:
 ; D:/TC/src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	nop	
.L221:
 ; D:/TC/src/parser.c:767:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	-32(%rbp), %r9	 ; prim_value, tmp209
	movq	-24(%rbp), %r8	 ; expr_value, tmp210
	movq	-16(%rbp), %rdx	 ; str_value, tmp211
	movl	-4(%rbp), %eax	 ; type, tmp212
	movq	-40(%rbp), %rcx	 ; variable_value, tmp213
	movq	%rcx, 32(%rsp)	 ; tmp213,
	movl	%eax, %ecx	 ; tmp212,
	call	create_primary	 ;
.L228:
 ; D:/TC/src/parser.c:768: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC82:
	.ascii "Expected variable name in variable access\0"
	.align 8
.LC83:
	.ascii "Cannot call undefined variable\0"
	.align 8
.LC84:
	.ascii "Cannot call non-function variable\0"
	.align 8
.LC85:
	.ascii "Failed to parse function call argument\0"
	.align 8
.LC86:
	.ascii "Expected ',' or ')' after function call argument\0"
	.align 8
.LC87:
	.ascii "Failed to parse sequence index\0"
	.align 8
.LC88:
	.ascii "Expected ']' after sequence index\0"
	.align 8
.LC89:
	.ascii "Cannot access attribute without a valid scope\0"
	.align 8
.LC90:
	.ascii "Expected attribute name after '.'\0"
.LC91:
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
 ; D:/TC/src/parser.c:771:     Token* token = peek_current_token(lexer);
	movq	16(%rbp), %rax	 ; lexer, tmp156
	movq	%rax, %rcx	 ; tmp156,
	call	peek_current_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp157, token
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	-8(%rbp), %rax	 ; token, tmp158
	movl	24(%rax), %eax	 ; token_109->type, _1
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	 ;, _1
	je	.L240	 ;,
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	-8(%rbp), %rax	 ; token, tmp159
	movl	24(%rax), %eax	 ; token_109->type, _2
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	 ;, _2
	jne	.L241	 ;,
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp160
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD.94_3
	movq	-8(%rbp), %rax	 ; token, tmp161
	movq	(%rax), %rax	 ; token_109->lexeme, _4
	movq	%rax, %rcx	 ; _4,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	 ; _5
	jne	.L240	 ;,
.L241:
 ; D:/TC/src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp162
	movq	(%rax), %rax	 ; parser_111(D)->source_file, _6
	movq	%rax, %rcx	 ; _6,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _7
 ; D:/TC/src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp163
	movq	%rdx, %r8	 ; _7,
	movq	%rax, %rdx	 ; tmp163,
	leaq	.LC82(%rip), %rax	 ;, tmp164
	movq	%rax, %rcx	 ; tmp164,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:775:         return NULL;
	movl	$0, %eax	 ;, _89
	jmp	.L242	 ;
.L240:
 ; D:/TC/src/parser.c:777:     Symbol* current_type = NULL;
	movq	$0, -16(%rbp)	 ;, current_type
 ; D:/TC/src/parser.c:778:     Symbol* base_name = NULL;
	movq	$0, -24(%rbp)	 ;, base_name
 ; D:/TC/src/parser.c:779:     SymbolTable* var_scope = NULL;
	movq	$0, -32(%rbp)	 ;, var_scope
 ; D:/TC/src/parser.c:780:     base_name = search_name(now_scope, token->lexeme);
	movq	-8(%rbp), %rax	 ; token, tmp165
	movq	(%rax), %rdx	 ; token_109->lexeme, _8
	movq	24(%rbp), %rax	 ; now_scope, tmp166
	movq	%rax, %rcx	 ; tmp166,
	call	search_name	 ;
	movq	%rax, -24(%rbp)	 ; tmp167, base_name
 ; D:/TC/src/parser.c:781:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	movq	-24(%rbp), %rax	 ; base_name, tmp168
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; tmp168,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, -40(%rbp)	 ; tmp169, base
 ; D:/TC/src/parser.c:782:     token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp170
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp170,
	call	peek_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp171, token
 ; D:/TC/src/parser.c:783:     while (token->type == SYMBOL) {
	jmp	.L243	 ;
.L269:
 ; D:/TC/src/parser.c:784:         if (base_name != NULL) {
	cmpq	$0, -24(%rbp)	 ;, base_name
	je	.L244	 ;,
 ; D:/TC/src/parser.c:785:             current_type = base_name;     // class or type
	movq	-24(%rbp), %rax	 ; base_name, tmp172
	movq	%rax, -16(%rbp)	 ; tmp172, current_type
 ; D:/TC/src/parser.c:786:             if (base_name->type != NULL)  // subroutine or variable or attribute or parameter
	movq	-24(%rbp), %rax	 ; base_name, tmp173
	movq	(%rax), %rax	 ; base_name_81->type, _9
 ; D:/TC/src/parser.c:786:             if (base_name->type != NULL)  // subroutine or variable or attribute or parameter
	testq	%rax, %rax	 ; _9
	je	.L244	 ;,
 ; D:/TC/src/parser.c:787:                 current_type = base_name->type;
	movq	-24(%rbp), %rax	 ; base_name, tmp174
	movq	(%rax), %rax	 ; base_name_81->type, tmp175
	movq	%rax, -16(%rbp)	 ; tmp175, current_type
.L244:
 ; D:/TC/src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	cmpq	$0, -32(%rbp)	 ;, var_scope
	jne	.L245	 ;,
 ; D:/TC/src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	cmpq	$0, -16(%rbp)	 ;, current_type
	je	.L245	 ;,
 ; D:/TC/src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	movq	-16(%rbp), %rax	 ; current_type, tmp176
	movl	32(%rax), %eax	 ; current_type_75->kind, _10
 ; D:/TC/src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _10
	jne	.L245	 ;,
 ; D:/TC/src/parser.c:790:             var_scope = current_type->ast_node.class->class_scope;
	movq	-16(%rbp), %rax	 ; current_type, tmp177
	movq	24(%rax), %rax	 ; current_type_75->ast_node.class, _11
 ; D:/TC/src/parser.c:790:             var_scope = current_type->ast_node.class->class_scope;
	movq	16(%rax), %rax	 ; _11->class_scope, tmp178
	movq	%rax, -32(%rbp)	 ; tmp178, var_scope
.L245:
 ; D:/TC/src/parser.c:791:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp179
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL.95_12
	movq	-8(%rbp), %rax	 ; token, tmp180
	movq	(%rax), %rax	 ; token_74->lexeme, _13
	movq	%rax, %rcx	 ; _13,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:791:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _14
	je	.L246	 ;,
 ; D:/TC/src/parser.c:792:             token = get_next_token(lexer, true);  // consume '('
	movq	16(%rbp), %rax	 ; lexer, tmp181
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp181,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp182, token
 ; D:/TC/src/parser.c:793:             if (base_name == NULL)
	cmpq	$0, -24(%rbp)	 ;, base_name
	jne	.L247	 ;,
 ; D:/TC/src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp183
	movq	(%rax), %rax	 ; parser_111(D)->source_file, _15
	movq	%rax, %rcx	 ; _15,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _16
 ; D:/TC/src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp184
	movq	%rdx, %r8	 ; _16,
	movq	%rax, %rdx	 ; tmp184,
	leaq	.LC83(%rip), %rax	 ;, tmp185
	movq	%rax, %rcx	 ; tmp185,
	call	parser_error	 ;
	jmp	.L248	 ;
.L247:
 ; D:/TC/src/parser.c:795:             else if (base_name->kind == SYMBOL_CLASS) {
	movq	-24(%rbp), %rax	 ; base_name, tmp186
	movl	32(%rax), %eax	 ; base_name_81->kind, _17
 ; D:/TC/src/parser.c:795:             else if (base_name->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	 ; _17
	jne	.L248	 ;,
 ; D:/TC/src/parser.c:796:                 string name = make_method_name(base_name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp187
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME.96_18
	movq	-24(%rbp), %rax	 ; base_name, tmp188
	movq	8(%rax), %rax	 ; base_name_81->name, _19
	movq	%rax, %rcx	 ; _19,
	call	make_method_name	 ;
	movq	%rax, -72(%rbp)	 ; tmp189, name
 ; D:/TC/src/parser.c:797:                 base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
	movq	-24(%rbp), %rax	 ; base_name, tmp190
	movq	24(%rax), %rax	 ; base_name_81->ast_node.class, _20
 ; D:/TC/src/parser.c:797:                 base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
	movq	16(%rax), %rax	 ; _20->class_scope, _21
	movq	-72(%rbp), %rdx	 ; name, tmp191
	movq	%rax, %rcx	 ; _21,
	call	search_name_use_strcmp	 ;
	movq	%rax, -24(%rbp)	 ; tmp192, base_name
 ; D:/TC/src/parser.c:798:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	-24(%rbp), %rdx	 ; base_name, tmp193
	movq	-40(%rbp), %rax	 ; base, tmp194
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp193,
	movq	%rax, %rdx	 ; tmp194,
	movl	$2, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, -40(%rbp)	 ; tmp195, base
.L248:
 ; D:/TC/src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	cmpq	$0, -24(%rbp)	 ;, base_name
	je	.L249	 ;,
 ; D:/TC/src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	movq	-24(%rbp), %rax	 ; base_name, tmp196
	movl	32(%rax), %eax	 ; base_name_78->kind, _22
 ; D:/TC/src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, _22
	je	.L249	 ;,
 ; D:/TC/src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	movq	-24(%rbp), %rax	 ; base_name, tmp197
	movl	32(%rax), %eax	 ; base_name_78->kind, _23
 ; D:/TC/src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	cmpl	$2, %eax	 ;, _23
	je	.L249	 ;,
 ; D:/TC/src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp198
	movq	(%rax), %rax	 ; parser_111(D)->source_file, _24
	movq	%rax, %rcx	 ; _24,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _25
 ; D:/TC/src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp199
	movq	%rdx, %r8	 ; _25,
	movq	%rax, %rdx	 ; tmp199,
	leaq	.LC84(%rip), %rax	 ;, tmp200
	movq	%rax, %rcx	 ; tmp200,
	call	parser_error	 ;
.L249:
 ; D:/TC/src/parser.c:802:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp201
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp201,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp202, token
 ; D:/TC/src/parser.c:803:             list(Expression*) args = create_list();
	call	create_list	 ;
	movq	%rax, -80(%rbp)	 ; tmp203, args
 ; D:/TC/src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L250	 ;
.L255:
 ; D:/TC/src/parser.c:805:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp204
	movq	24(%rbp), %rdx	 ; now_scope, tmp205
	movq	16(%rbp), %rax	 ; lexer, tmp206
	movq	%rcx, %r8	 ; tmp204,
	movq	%rax, %rcx	 ; tmp206,
	call	parse_expression	 ;
	movq	%rax, -88(%rbp)	 ; tmp207, arg
 ; D:/TC/src/parser.c:806:                 if (arg == NULL)
	cmpq	$0, -88(%rbp)	 ;, arg
	jne	.L251	 ;,
 ; D:/TC/src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp208
	movq	(%rax), %rax	 ; parser_111(D)->source_file, _26
	movq	%rax, %rcx	 ; _26,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _27
 ; D:/TC/src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp209
	movq	%rdx, %r8	 ; _27,
	movq	%rax, %rdx	 ; tmp209,
	leaq	.LC85(%rip), %rax	 ;, tmp210
	movq	%rax, %rcx	 ; tmp210,
	call	parser_error	 ;
.L251:
 ; D:/TC/src/parser.c:808:                 list_append(args, (pointer)arg);
	movq	-88(%rbp), %rdx	 ; arg, tmp211
	movq	-80(%rbp), %rax	 ; args, tmp212
	movq	%rax, %rcx	 ; tmp212,
	call	list_append	 ;
 ; D:/TC/src/parser.c:809:                 token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp213
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp213,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp214, token
 ; D:/TC/src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	movq	-8(%rbp), %rax	 ; token, tmp215
	movl	24(%rax), %eax	 ; token_202->type, _28
 ; D:/TC/src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	cmpl	$5, %eax	 ;, _28
	jne	.L252	 ;,
 ; D:/TC/src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp216
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL.97_29
	movq	-8(%rbp), %rax	 ; token, tmp217
	movq	(%rax), %rax	 ; token_202->lexeme, _30
	movq	%rax, %rcx	 ; _30,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	testb	%al, %al	 ; _31
	je	.L252	 ;,
 ; D:/TC/src/parser.c:811:                     token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp218
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp218,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp219, token
 ; D:/TC/src/parser.c:811:                     token = get_next_token(lexer, true);
	jmp	.L250	 ;
.L252:
 ; D:/TC/src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp220
	movl	24(%rax), %eax	 ; token_202->type, _32
 ; D:/TC/src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _32
	jne	.L254	 ;,
 ; D:/TC/src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp221
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.98_33
	movq	-8(%rbp), %rax	 ; token, tmp222
	movq	(%rax), %rax	 ; token_202->lexeme, _34
	movq	%rax, %rcx	 ; _34,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _35
	jne	.L250	 ;,
.L254:
 ; D:/TC/src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp223
	movq	(%rax), %rax	 ; parser_111(D)->source_file, _36
	movq	%rax, %rcx	 ; _36,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _37
 ; D:/TC/src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp224
	movq	%rdx, %r8	 ; _37,
	movq	%rax, %rdx	 ; tmp224,
	leaq	.LC86(%rip), %rax	 ;, tmp225
	movq	%rax, %rcx	 ; tmp225,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:815:                     return NULL;
	movl	$0, %eax	 ;, _89
	jmp	.L242	 ;
.L250:
 ; D:/TC/src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp226
	movl	24(%rax), %eax	 ; token_73->type, _38
 ; D:/TC/src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _38
	jne	.L255	 ;,
 ; D:/TC/src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp227
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL.99_39
	movq	-8(%rbp), %rax	 ; token, tmp228
	movq	(%rax), %rax	 ; token_73->lexeme, _40
	movq	%rax, %rcx	 ; _40,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; _41
	je	.L255	 ;,
 ; D:/TC/src/parser.c:818:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	-40(%rbp), %rax	 ; base, tmp229
	movq	-80(%rbp), %rdx	 ; args, tmp230
	movq	%rdx, 32(%rsp)	 ; tmp230,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp229,
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, -40(%rbp)	 ; tmp231, base
 ; D:/TC/src/parser.c:819:             base_name = base_name->type;
	movq	-24(%rbp), %rax	 ; base_name, tmp232
	movq	(%rax), %rax	 ; base_name_78->type, tmp233
	movq	%rax, -24(%rbp)	 ; tmp233, base_name
 ; D:/TC/src/parser.c:820:             current_type = NULL;
	movq	$0, -16(%rbp)	 ;, current_type
 ; D:/TC/src/parser.c:821:             var_scope = NULL;
	movq	$0, -32(%rbp)	 ;, var_scope
 ; D:/TC/src/parser.c:822:             if (base_name->kind == SYMBOL_CLASS)
	movq	-24(%rbp), %rax	 ; base_name, tmp234
	movl	32(%rax), %eax	 ; base_name_192->kind, _42
 ; D:/TC/src/parser.c:822:             if (base_name->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _42
	jne	.L256	 ;,
 ; D:/TC/src/parser.c:823:                 var_scope = base_name->ast_node.class->class_scope;
	movq	-24(%rbp), %rax	 ; base_name, tmp235
	movq	24(%rax), %rax	 ; base_name_192->ast_node.class, _43
 ; D:/TC/src/parser.c:823:                 var_scope = base_name->ast_node.class->class_scope;
	movq	16(%rax), %rax	 ; _43->class_scope, tmp236
	movq	%rax, -32(%rbp)	 ; tmp236, var_scope
	jmp	.L256	 ;
.L246:
 ; D:/TC/src/parser.c:824:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp237
	movq	(%rax), %rdx	 ; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL.100_44
	movq	-8(%rbp), %rax	 ; token, tmp238
	movq	(%rax), %rax	 ; token_74->lexeme, _45
	movq	%rax, %rcx	 ; _45,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:824:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; _46
	je	.L257	 ;,
 ; D:/TC/src/parser.c:825:             token = get_next_token(lexer, true);  // consume '['
	movq	16(%rbp), %rax	 ; lexer, tmp239
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp239,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp240, token
 ; D:/TC/src/parser.c:826:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp241
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp241,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp242, token
 ; D:/TC/src/parser.c:827:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	32(%rbp), %rcx	 ; parser, tmp243
	movq	24(%rbp), %rdx	 ; now_scope, tmp244
	movq	16(%rbp), %rax	 ; lexer, tmp245
	movq	%rcx, %r8	 ; tmp243,
	movq	%rax, %rcx	 ; tmp245,
	call	parse_expression	 ;
	movq	%rax, -64(%rbp)	 ; tmp246, index
 ; D:/TC/src/parser.c:828:             if (index == NULL)
	cmpq	$0, -64(%rbp)	 ;, index
	jne	.L258	 ;,
 ; D:/TC/src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp247
	movq	(%rax), %rax	 ; parser_111(D)->source_file, _47
	movq	%rax, %rcx	 ; _47,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _48
 ; D:/TC/src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp248
	movq	%rdx, %r8	 ; _48,
	movq	%rax, %rdx	 ; tmp248,
	leaq	.LC87(%rip), %rax	 ;, tmp249
	movq	%rax, %rcx	 ; tmp249,
	call	parser_error	 ;
.L258:
 ; D:/TC/src/parser.c:830:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp250
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp250,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp251, token
 ; D:/TC/src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	-8(%rbp), %rax	 ; token, tmp252
	movl	24(%rax), %eax	 ; token_166->type, _49
 ; D:/TC/src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, %eax	 ;, _49
	jne	.L259	 ;,
 ; D:/TC/src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp253
	movq	(%rax), %rdx	 ; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL.101_50
	movq	-8(%rbp), %rax	 ; token, tmp254
	movq	(%rax), %rax	 ; token_166->lexeme, _51
	movq	%rax, %rcx	 ; _51,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; _52
	jne	.L260	 ;,
.L259:
 ; D:/TC/src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp255
	movq	(%rax), %rax	 ; parser_111(D)->source_file, _53
	movq	%rax, %rcx	 ; _53,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _54
 ; D:/TC/src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp256
	movq	%rdx, %r8	 ; _54,
	movq	%rax, %rdx	 ; tmp256,
	leaq	.LC88(%rip), %rax	 ;, tmp257
	movq	%rax, %rcx	 ; tmp257,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:834:                 return NULL;
	movl	$0, %eax	 ;, _89
	jmp	.L242	 ;
.L260:
 ; D:/TC/src/parser.c:836:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movq	-64(%rbp), %rdx	 ; index, tmp258
	movq	-40(%rbp), %rax	 ; base, tmp259
	movq	$0, 32(%rsp)	 ;,
	movq	%rdx, %r9	 ; tmp258,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp259,
	movl	$3, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, -40(%rbp)	 ; tmp260, base
	jmp	.L256	 ;
.L257:
 ; D:/TC/src/parser.c:837:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp261
	movq	(%rax), %rdx	 ; DOT_SYMBOL, DOT_SYMBOL.102_55
	movq	-8(%rbp), %rax	 ; token, tmp262
	movq	(%rax), %rax	 ; token_74->lexeme, _56
	movq	%rax, %rcx	 ; _56,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:837:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	 ; _57
	je	.L270	 ;,
 ; D:/TC/src/parser.c:838:             token = get_next_token(lexer, true);  // consume '.'
	movq	16(%rbp), %rax	 ; lexer, tmp263
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp263,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp264, token
 ; D:/TC/src/parser.c:839:             token = get_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp265
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp265,
	call	get_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp266, token
 ; D:/TC/src/parser.c:840:             if (var_scope == NULL) {
	cmpq	$0, -32(%rbp)	 ;, var_scope
	jne	.L262	 ;,
 ; D:/TC/src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp267
	movq	(%rax), %rax	 ; parser_111(D)->source_file, _58
	movq	%rax, %rcx	 ; _58,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _59
 ; D:/TC/src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp268
	movq	%rdx, %r8	 ; _59,
	movq	%rax, %rdx	 ; tmp268,
	leaq	.LC89(%rip), %rax	 ;, tmp269
	movq	%rax, %rcx	 ; tmp269,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:843:                 return NULL;
	movl	$0, %eax	 ;, _89
	jmp	.L242	 ;
.L262:
 ; D:/TC/src/parser.c:845:             if (token->type != IDENTIFIER) {
	movq	-8(%rbp), %rax	 ; token, tmp270
	movl	24(%rax), %eax	 ; token_134->type, _60
 ; D:/TC/src/parser.c:845:             if (token->type != IDENTIFIER) {
	cmpl	$1, %eax	 ;, _60
	je	.L263	 ;,
 ; D:/TC/src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp271
	movq	(%rax), %rax	 ; parser_111(D)->source_file, _61
	movq	%rax, %rcx	 ; _61,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _62
 ; D:/TC/src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp272
	movq	%rdx, %r8	 ; _62,
	movq	%rax, %rdx	 ; tmp272,
	leaq	.LC90(%rip), %rax	 ;, tmp273
	movq	%rax, %rcx	 ; tmp273,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:848:                 return NULL;
	movl	$0, %eax	 ;, _89
	jmp	.L242	 ;
.L263:
 ; D:/TC/src/parser.c:850:             base_name = search_name(var_scope, token->lexeme);
	movq	-8(%rbp), %rax	 ; token, tmp274
	movq	(%rax), %rdx	 ; token_134->lexeme, _63
	movq	-32(%rbp), %rax	 ; var_scope, tmp275
	movq	%rax, %rcx	 ; tmp275,
	call	search_name	 ;
	movq	%rax, -24(%rbp)	 ; tmp276, base_name
 ; D:/TC/src/parser.c:851:             if (base_name == NULL) {
	cmpq	$0, -24(%rbp)	 ;, base_name
	jne	.L264	 ;,
 ; D:/TC/src/parser.c:852:                 string class_name = NULL;
	movq	$0, -48(%rbp)	 ;, class_name
 ; D:/TC/src/parser.c:853:                 if (current_type != NULL) {
	cmpq	$0, -16(%rbp)	 ;, current_type
	je	.L265	 ;,
 ; D:/TC/src/parser.c:854:                     if (current_type->kind == SYMBOL_CLASS)
	movq	-16(%rbp), %rax	 ; current_type, tmp277
	movl	32(%rax), %eax	 ; current_type_75->kind, _64
 ; D:/TC/src/parser.c:854:                     if (current_type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _64
	jne	.L266	 ;,
 ; D:/TC/src/parser.c:855:                         class_name = current_type->name;
	movq	-16(%rbp), %rax	 ; current_type, tmp278
	movq	8(%rax), %rax	 ; current_type_75->name, tmp279
	movq	%rax, -48(%rbp)	 ; tmp279, class_name
	jmp	.L265	 ;
.L266:
 ; D:/TC/src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	movq	-16(%rbp), %rax	 ; current_type, tmp280
	movq	(%rax), %rax	 ; current_type_75->type, _65
 ; D:/TC/src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	testq	%rax, %rax	 ; _65
	je	.L265	 ;,
 ; D:/TC/src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	movq	-16(%rbp), %rax	 ; current_type, tmp281
	movq	(%rax), %rax	 ; current_type_75->type, _66
 ; D:/TC/src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; _66->kind, _67
 ; D:/TC/src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _67
	jne	.L265	 ;,
 ; D:/TC/src/parser.c:857:                         class_name = current_type->type->name;
	movq	-16(%rbp), %rax	 ; current_type, tmp282
	movq	(%rax), %rax	 ; current_type_75->type, _68
 ; D:/TC/src/parser.c:857:                         class_name = current_type->type->name;
	movq	8(%rax), %rax	 ; _68->name, tmp283
	movq	%rax, -48(%rbp)	 ; tmp283, class_name
.L265:
 ; D:/TC/src/parser.c:859:                 string name = make_method_name(class_name, token->lexeme);
	movq	-8(%rbp), %rax	 ; token, tmp284
	movq	(%rax), %rdx	 ; token_134->lexeme, _69
	movq	-48(%rbp), %rax	 ; class_name, tmp285
	movq	%rax, %rcx	 ; tmp285,
	call	make_method_name	 ;
	movq	%rax, -56(%rbp)	 ; tmp286, name
 ; D:/TC/src/parser.c:860:                 base_name = search_name_use_strcmp(var_scope, name);
	movq	-56(%rbp), %rdx	 ; name, tmp287
	movq	-32(%rbp), %rax	 ; var_scope, tmp288
	movq	%rax, %rcx	 ; tmp288,
	call	search_name_use_strcmp	 ;
	movq	%rax, -24(%rbp)	 ; tmp289, base_name
.L264:
 ; D:/TC/src/parser.c:862:             if (base_name == NULL) {
	cmpq	$0, -24(%rbp)	 ;, base_name
	jne	.L267	 ;,
 ; D:/TC/src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	32(%rbp), %rax	 ; parser, tmp290
	movq	(%rax), %rax	 ; parser_111(D)->source_file, _70
	movq	%rax, %rcx	 ; _70,
	call	get_full_path	 ;
	movq	%rax, %rdx	 ;, _71
 ; D:/TC/src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	 ; token, tmp291
	movq	%rdx, %r8	 ; _71,
	movq	%rax, %rdx	 ; tmp291,
	leaq	.LC91(%rip), %rax	 ;, tmp292
	movq	%rax, %rcx	 ; tmp292,
	call	parser_error	 ;
 ; D:/TC/src/parser.c:865:                 return NULL;
	movl	$0, %eax	 ;, _89
	jmp	.L242	 ;
.L267:
 ; D:/TC/src/parser.c:867:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	-24(%rbp), %rdx	 ; base_name, tmp293
	movq	-40(%rbp), %rax	 ; base, tmp294
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp293,
	movq	%rax, %rdx	 ; tmp294,
	movl	$2, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, -40(%rbp)	 ; tmp295, base
 ; D:/TC/src/parser.c:868:             current_type = NULL;
	movq	$0, -16(%rbp)	 ;, current_type
 ; D:/TC/src/parser.c:869:             var_scope = NULL;
	movq	$0, -32(%rbp)	 ;, var_scope
.L256:
 ; D:/TC/src/parser.c:872:         token = peek_next_token(lexer, true);
	movq	16(%rbp), %rax	 ; lexer, tmp296
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; tmp296,
	call	peek_next_token	 ;
	movq	%rax, -8(%rbp)	 ; tmp297, token
.L243:
 ; D:/TC/src/parser.c:783:     while (token->type == SYMBOL) {
	movq	-8(%rbp), %rax	 ; token, tmp298
	movl	24(%rax), %eax	 ; token_74->type, _72
 ; D:/TC/src/parser.c:783:     while (token->type == SYMBOL) {
	cmpl	$5, %eax	 ;, _72
	je	.L269	 ;,
	jmp	.L268	 ;
.L270:
 ; D:/TC/src/parser.c:871:             break;
	nop	
.L268:
 ; D:/TC/src/parser.c:875:     return base;
	movq	-40(%rbp), %rax	 ; base, _89
.L242:
 ; D:/TC/src/parser.c:876: }
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
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	search_name;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_function_use_ptr;	.scl	2;	.type	32;	.endef
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.def	create_method_use_ptr;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	create_class_use_ptr;	.scl	2;	.type	32;	.endef
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
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
	.section	.rdata$.refptr.DEFAULT_CONSTRUCTOR_NAME, "dr"
	.globl	.refptr.DEFAULT_CONSTRUCTOR_NAME
	.linkonce	discard
.refptr.DEFAULT_CONSTRUCTOR_NAME:
	.quad	DEFAULT_CONSTRUCTOR_NAME
	.section	.rdata$.refptr.DEFAULT_INIT_NAME, "dr"
	.globl	.refptr.DEFAULT_INIT_NAME
	.linkonce	discard
.refptr.DEFAULT_INIT_NAME:
	.quad	DEFAULT_INIT_NAME
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
