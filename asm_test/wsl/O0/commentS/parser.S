	.file	"parser.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Failed to parse import statement"
	.align 8
.LC1:
	.string	"Failed to parse function declaration"
	.align 8
.LC2:
	.string	"Failed to parse class declaration"
	.align 8
.LC3:
	.string	"Unexpected token in code member"
	.text
	.globl	parse_code
	.type	parse_code, @function
parse_code:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$80, %rsp	;,
	movq	%rdi, -56(%rbp)	; lexer, lexer
	movq	%rsi, -64(%rbp)	; now_scope, now_scope
	movq	%rdx, -72(%rbp)	; parser, parser
; src/parser.c:23:     if (builtin_scope == NULL) {
	movq	builtin_scope(%rip), %rax	; builtin_scope, builtin_scope.0_1
; src/parser.c:23:     if (builtin_scope == NULL) {
	testq	%rax, %rax	; builtin_scope.0_1
	jne	.L2	;,
; src/parser.c:24:         builtin_scope = create_symbol_table(NULL);
	movl	$0, %edi	;,
	call	*create_symbol_table@GOTPCREL(%rip)	;
; src/parser.c:24:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, builtin_scope(%rip)	; _2, builtin_scope
; src/parser.c:25:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rdx	; builtin_scope, builtin_scope.1_3
	movq	VOID_KEYWORD(%rip), %rax	; VOID_KEYWORD, VOID_KEYWORD.2_4
	movq	%rdx, %rcx	; builtin_scope.1_3,
	movl	$0, %edx	;,
	movl	$6, %esi	;,
	movq	%rax, %rdi	; VOID_KEYWORD.2_4,
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:25:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_void(%rip)	; _5, name_void
; src/parser.c:26:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rdx	; builtin_scope, builtin_scope.3_6
	movq	INT_KEYWORD(%rip), %rax	; INT_KEYWORD, INT_KEYWORD.4_7
	movq	%rdx, %rcx	; builtin_scope.3_6,
	movl	$0, %edx	;,
	movl	$6, %esi	;,
	movq	%rax, %rdi	; INT_KEYWORD.4_7,
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:26:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_int(%rip)	; _8, name_int
; src/parser.c:27:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rdx	; builtin_scope, builtin_scope.5_9
	movq	FLOAT_KEYWORD(%rip), %rax	; FLOAT_KEYWORD, FLOAT_KEYWORD.6_10
	movq	%rdx, %rcx	; builtin_scope.5_9,
	movl	$0, %edx	;,
	movl	$6, %esi	;,
	movq	%rax, %rdi	; FLOAT_KEYWORD.6_10,
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:27:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_float(%rip)	; _11, name_float
; src/parser.c:28:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rdx	; builtin_scope, builtin_scope.7_12
	movq	STRING_KEYWORD(%rip), %rax	; STRING_KEYWORD, STRING_KEYWORD.8_13
	movq	%rdx, %rcx	; builtin_scope.7_12,
	movl	$0, %edx	;,
	movl	$6, %esi	;,
	movq	%rax, %rdi	; STRING_KEYWORD.8_13,
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:28:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_string(%rip)	; _14, name_string
; src/parser.c:29:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rdx	; builtin_scope, builtin_scope.9_15
	movq	BOOL_KEYWORD(%rip), %rax	; BOOL_KEYWORD, BOOL_KEYWORD.10_16
	movq	%rdx, %rcx	; builtin_scope.9_15,
	movl	$0, %edx	;,
	movl	$6, %esi	;,
	movq	%rax, %rdi	; BOOL_KEYWORD.10_16,
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:29:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_bool(%rip)	; _17, name_bool
.L2:
; src/parser.c:31:     if (now_scope == NULL)
	cmpq	$0, -64(%rbp)	;, now_scope
	jne	.L3	;,
; src/parser.c:32:         now_scope = builtin_scope;
	movq	builtin_scope(%rip), %rax	; builtin_scope, tmp125
	movq	%rax, -64(%rbp)	; tmp125, now_scope
.L3:
; src/parser.c:33:     Token* token = NULL;
	movq	$0, -8(%rbp)	;, token
; src/parser.c:34:     list(CodeMember*) members = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp126, members
; src/parser.c:35:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	-64(%rbp), %rax	; now_scope, tmp127
	movq	%rax, %rdi	; tmp127,
	call	*create_symbol_table@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp128, global_scope
; src/parser.c:36:     token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp129
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp129,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp130, token
; src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	jmp	.L4	;
.L13:
; src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movq	-8(%rbp), %rax	; token, tmp131
	movl	24(%rax), %eax	; token_43->type, _18
; src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	;, _18
	jne	.L5	;,
; src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movq	IMPORT_KEYWORD(%rip), %rdx	; IMPORT_KEYWORD, IMPORT_KEYWORD.11_19
	movq	-8(%rbp), %rax	; token, tmp132
	movq	(%rax), %rax	; token_43->lexeme, _20
	movq	%rdx, %rsi	; IMPORT_KEYWORD.11_19,
	movq	%rax, %rdi	; _20,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	testb	%al, %al	; _21
	je	.L5	;,
; src/parser.c:39:             Import* import = parse_import(lexer, global_scope, parser);
	movq	-72(%rbp), %rdx	; parser, tmp133
	movq	-24(%rbp), %rcx	; global_scope, tmp134
	movq	-56(%rbp), %rax	; lexer, tmp135
	movq	%rcx, %rsi	; tmp134,
	movq	%rax, %rdi	; tmp135,
	call	parse_import	;
	movq	%rax, -32(%rbp)	; tmp136, import
; src/parser.c:40:             if (import == NULL)
	cmpq	$0, -32(%rbp)	;, import
	jne	.L6	;,
; src/parser.c:41:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	-72(%rbp), %rax	; parser, tmp137
	movq	(%rax), %rax	; parser_77(D)->source_file, _22
	movq	%rax, %rdi	; _22,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _23
; src/parser.c:41:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp138
	movq	%rax, %rsi	; tmp138,
	leaq	.LC0(%rip), %rax	;, tmp139
	movq	%rax, %rdi	; tmp139,
	call	*parser_error@GOTPCREL(%rip)	;
.L6:
; src/parser.c:42:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	-32(%rbp), %rax	; import, tmp140
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp140,
	movl	$0, %edi	;,
	call	*create_code_member@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _24
; src/parser.c:42:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	-16(%rbp), %rax	; members, tmp141
	movq	%rdx, %rsi	; _24,
	movq	%rax, %rdi	; tmp141,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	jmp	.L7	;
.L5:
; src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	-8(%rbp), %rax	; token, tmp142
	movl	24(%rax), %eax	; token_43->type, _25
; src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	cmpl	$6, %eax	;, _25
	jne	.L8	;,
; src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	FUNC_KEYWORD(%rip), %rdx	; FUNC_KEYWORD, FUNC_KEYWORD.12_26
	movq	-8(%rbp), %rax	; token, tmp143
	movq	(%rax), %rax	; token_43->lexeme, _27
	movq	%rdx, %rsi	; FUNC_KEYWORD.12_26,
	movq	%rax, %rdi	; _27,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	testb	%al, %al	; _28
	je	.L8	;,
; src/parser.c:44:             Function* function = parse_function(lexer, global_scope, parser);
	movq	-72(%rbp), %rdx	; parser, tmp144
	movq	-24(%rbp), %rcx	; global_scope, tmp145
	movq	-56(%rbp), %rax	; lexer, tmp146
	movq	%rcx, %rsi	; tmp145,
	movq	%rax, %rdi	; tmp146,
	call	parse_function	;
	movq	%rax, -40(%rbp)	; tmp147, function
; src/parser.c:45:             if (function == NULL)
	cmpq	$0, -40(%rbp)	;, function
	jne	.L9	;,
; src/parser.c:46:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	-72(%rbp), %rax	; parser, tmp148
	movq	(%rax), %rax	; parser_77(D)->source_file, _29
	movq	%rax, %rdi	; _29,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _30
; src/parser.c:46:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp149
	movq	%rax, %rsi	; tmp149,
	leaq	.LC1(%rip), %rax	;, tmp150
	movq	%rax, %rdi	; tmp150,
	call	*parser_error@GOTPCREL(%rip)	;
.L9:
; src/parser.c:47:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	-40(%rbp), %rax	; function, tmp151
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; tmp151,
	movl	$0, %esi	;,
	movl	$1, %edi	;,
	call	*create_code_member@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _31
; src/parser.c:47:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	-16(%rbp), %rax	; members, tmp152
	movq	%rdx, %rsi	; _31,
	movq	%rax, %rdi	; tmp152,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	jmp	.L7	;
.L8:
; src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	-8(%rbp), %rax	; token, tmp153
	movl	24(%rax), %eax	; token_43->type, _32
; src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	cmpl	$6, %eax	;, _32
	jne	.L10	;,
; src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	CLASS_KEYWORD(%rip), %rdx	; CLASS_KEYWORD, CLASS_KEYWORD.13_33
	movq	-8(%rbp), %rax	; token, tmp154
	movq	(%rax), %rax	; token_43->lexeme, _34
	movq	%rdx, %rsi	; CLASS_KEYWORD.13_33,
	movq	%rax, %rdi	; _34,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	testb	%al, %al	; _35
	je	.L10	;,
; src/parser.c:49:             Class* class = parse_class(lexer, global_scope, parser);
	movq	-72(%rbp), %rdx	; parser, tmp155
	movq	-24(%rbp), %rcx	; global_scope, tmp156
	movq	-56(%rbp), %rax	; lexer, tmp157
	movq	%rcx, %rsi	; tmp156,
	movq	%rax, %rdi	; tmp157,
	call	parse_class	;
	movq	%rax, -48(%rbp)	; tmp158, class
; src/parser.c:50:             if (class == NULL)
	cmpq	$0, -48(%rbp)	;, class
	jne	.L11	;,
; src/parser.c:51:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	-72(%rbp), %rax	; parser, tmp159
	movq	(%rax), %rax	; parser_77(D)->source_file, _36
	movq	%rax, %rdi	; _36,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _37
; src/parser.c:51:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp160
	movq	%rax, %rsi	; tmp160,
	leaq	.LC2(%rip), %rax	;, tmp161
	movq	%rax, %rdi	; tmp161,
	call	*parser_error@GOTPCREL(%rip)	;
.L11:
; src/parser.c:52:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	-48(%rbp), %rax	; class, tmp162
	movq	%rax, %rcx	; tmp162,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$2, %edi	;,
	call	*create_code_member@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _38
; src/parser.c:52:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	-16(%rbp), %rax	; members, tmp163
	movq	%rdx, %rsi	; _38,
	movq	%rax, %rdi	; tmp163,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	jmp	.L7	;
.L10:
; src/parser.c:54:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	-72(%rbp), %rax	; parser, tmp164
	movq	(%rax), %rax	; parser_77(D)->source_file, _39
	movq	%rax, %rdi	; _39,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _40
; src/parser.c:54:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp165
	movq	%rax, %rsi	; tmp165,
	leaq	.LC3(%rip), %rax	;, tmp166
	movq	%rax, %rdi	; tmp166,
	call	*parser_error@GOTPCREL(%rip)	;
.L7:
; src/parser.c:55:         token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp167
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp167,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp168, token
.L4:
; src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	cmpq	$0, -8(%rbp)	;, token
	je	.L12	;,
; src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	movq	-8(%rbp), %rax	; token, tmp169
	movl	24(%rax), %eax	; token_43->type, _41
; src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	testl	%eax, %eax	; _41
	jne	.L13	;,
.L12:
; src/parser.c:58:     return create_code(members, global_scope);
	movq	-24(%rbp), %rdx	; global_scope, tmp170
	movq	-16(%rbp), %rax	; members, tmp171
	movq	%rdx, %rsi	; tmp170,
	movq	%rax, %rdi	; tmp171,
	call	*create_code@GOTPCREL(%rip)	;
; src/parser.c:59: }
	leave	
	ret	
	.size	parse_code, .-parse_code
	.section	.rodata
	.align 8
.LC4:
	.string	"Expected identifier after 'import'"
	.align 8
.LC5:
	.string	"Expected string literal after 'from'"
	.align 8
.LC6:
	.string	"Expected ';' at end of import statement"
.LC7:
	.string	"Failed to import module"
	.text
	.type	parse_import, @function
parse_import:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -40(%rbp)	; lexer, lexer
	movq	%rsi, -48(%rbp)	; now_scope, now_scope
	movq	%rdx, -56(%rbp)	; parser, parser
; src/parser.c:62:     Token* token = NULL;
	movq	$0, -8(%rbp)	;, token
; src/parser.c:63:     token = get_next_token(lexer, true);
	movq	-40(%rbp), %rax	; lexer, tmp104
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp104,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp105, token
; src/parser.c:64:     if (token->type != IDENTIFIER) {
	movq	-8(%rbp), %rax	; token, tmp106
	movl	24(%rax), %eax	; token_33->type, _1
; src/parser.c:64:     if (token->type != IDENTIFIER) {
	cmpl	$1, %eax	;, _1
	je	.L16	;,
; src/parser.c:65:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	-56(%rbp), %rax	; parser, tmp107
	movq	(%rax), %rax	; parser_44(D)->source_file, _2
	movq	%rax, %rdi	; _2,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _3
; src/parser.c:65:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp108
	movq	%rax, %rsi	; tmp108,
	leaq	.LC4(%rip), %rax	;, tmp109
	movq	%rax, %rdi	; tmp109,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:67:         return NULL;
	movl	$0, %eax	;, _24
	jmp	.L17	;
.L16:
; src/parser.c:69:     string import_name = token->lexeme;
	movq	-8(%rbp), %rax	; token, tmp110
	movq	(%rax), %rax	; token_33->lexeme, tmp111
	movq	%rax, -32(%rbp)	; tmp111, import_name
; src/parser.c:70:     string source = NULL;
	movq	$0, -16(%rbp)	;, source
; src/parser.c:71:     token = get_next_token(lexer, true);
	movq	-40(%rbp), %rax	; lexer, tmp112
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp112,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp113, token
; src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	-8(%rbp), %rax	; token, tmp114
	movl	24(%rax), %eax	; token_37->type, _4
; src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	cmpl	$6, %eax	;, _4
	jne	.L18	;,
; src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	FROM_KEYWORD(%rip), %rdx	; FROM_KEYWORD, FROM_KEYWORD.14_5
	movq	-8(%rbp), %rax	; token, tmp115
	movq	(%rax), %rax	; token_37->lexeme, _6
	movq	%rdx, %rsi	; FROM_KEYWORD.14_5,
	movq	%rax, %rdi	; _6,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	testb	%al, %al	; _7
	je	.L18	;,
; src/parser.c:73:         token = get_next_token(lexer, true);
	movq	-40(%rbp), %rax	; lexer, tmp116
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp116,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp117, token
; src/parser.c:74:         if (token->type != STRING) {
	movq	-8(%rbp), %rax	; token, tmp118
	movl	24(%rax), %eax	; token_40->type, _8
; src/parser.c:74:         if (token->type != STRING) {
	cmpl	$4, %eax	;, _8
	je	.L19	;,
; src/parser.c:75:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	-56(%rbp), %rax	; parser, tmp119
	movq	(%rax), %rax	; parser_44(D)->source_file, _9
	movq	%rax, %rdi	; _9,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _10
; src/parser.c:75:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp120
	movq	%rax, %rsi	; tmp120,
	leaq	.LC5(%rip), %rax	;, tmp121
	movq	%rax, %rdi	; tmp121,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:77:             return NULL;
	movl	$0, %eax	;, _24
	jmp	.L17	;
.L19:
; src/parser.c:79:         source = token->lexeme;
	movq	-8(%rbp), %rax	; token, tmp122
	movq	(%rax), %rax	; token_40->lexeme, tmp123
	movq	%rax, -16(%rbp)	; tmp123, source
; src/parser.c:80:         token = get_next_token(lexer, true);
	movq	-40(%rbp), %rax	; lexer, tmp124
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp124,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp125, token
.L18:
; src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp126
	movl	24(%rax), %eax	; token_21->type, _11
; src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	;, _11
	jne	.L20	;,
; src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	SEMICOLON_SYMBOL(%rip), %rdx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.15_12
	movq	-8(%rbp), %rax	; token, tmp127
	movq	(%rax), %rax	; token_21->lexeme, _13
	movq	%rdx, %rsi	; SEMICOLON_SYMBOL.15_12,
	movq	%rax, %rdi	; _13,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; _14
	jne	.L21	;,
.L20:
; src/parser.c:83:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	-56(%rbp), %rax	; parser, tmp128
	movq	(%rax), %rax	; parser_44(D)->source_file, _15
	movq	%rax, %rdi	; _15,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _16
; src/parser.c:83:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp129
	movq	%rax, %rsi	; tmp129,
	leaq	.LC6(%rip), %rax	;, tmp130
	movq	%rax, %rdi	; tmp130,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:85:         return NULL;
	movl	$0, %eax	;, _24
	jmp	.L17	;
.L21:
; src/parser.c:88:     name = parse_import_file(import_name, source, now_scope, parser->source_file);
	movq	-56(%rbp), %rax	; parser, tmp131
	movq	(%rax), %rcx	; parser_44(D)->source_file, _17
	movq	-48(%rbp), %rdx	; now_scope, tmp132
	movq	-16(%rbp), %rsi	; source, tmp133
	movq	-32(%rbp), %rax	; import_name, tmp134
	movq	%rax, %rdi	; tmp134,
	call	*parse_import_file@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp135, name
; src/parser.c:89:     if (name == NULL) {
	cmpq	$0, -24(%rbp)	;, name
	jne	.L22	;,
; src/parser.c:90:         parser_error("Failed to import module", token, get_full_path(parser->source_file));
	movq	-56(%rbp), %rax	; parser, tmp136
	movq	(%rax), %rax	; parser_44(D)->source_file, _18
	movq	%rax, %rdi	; _18,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _19
; src/parser.c:90:         parser_error("Failed to import module", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp137
	movq	%rax, %rsi	; tmp137,
	leaq	.LC7(%rip), %rax	;, tmp138
	movq	%rax, %rdi	; tmp138,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:91:         name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
	movq	name_void(%rip), %rdx	; name_void, name_void.16_20
	movq	-48(%rbp), %rcx	; now_scope, tmp139
	movq	-32(%rbp), %rax	; import_name, tmp140
	movl	$3, %esi	;,
	movq	%rax, %rdi	; tmp140,
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp141, name
.L22:
; src/parser.c:94:     return create_import(name, source);
	movq	-16(%rbp), %rdx	; source, tmp142
	movq	-24(%rbp), %rax	; name, tmp143
	movq	%rdx, %rsi	; tmp142,
	movq	%rax, %rdi	; tmp143,
	call	*create_import@GOTPCREL(%rip)	;
.L17:
; src/parser.c:95: }
	leave	
	ret	
	.size	parse_import, .-parse_import
	.section	.rodata
	.align 8
.LC8:
	.string	"Expected function return type after 'func'"
.LC9:
	.string	"Unknown function return type"
	.align 8
.LC10:
	.string	"Expected function name after return type"
	.align 8
.LC11:
	.string	"Expected '(' after function name"
	.align 8
.LC12:
	.string	"Failed to parse function parameter"
	.align 8
.LC13:
	.string	"Function parameters cannot have default values"
	.align 8
.LC14:
	.string	"Expected ',' or ')' after function parameter"
	.align 8
.LC15:
	.string	"Expected '{' to start function body"
	.align 8
.LC16:
	.string	"Failed to parse function body statement"
	.align 8
.LC17:
	.string	"Unreachable code after return statement"
	.align 8
.LC18:
	.string	"Function missing return statement"
	.text
	.type	parse_function, @function
parse_function:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$112, %rsp	;,
	movq	%rdi, -88(%rbp)	; lexer, lexer
	movq	%rsi, -96(%rbp)	; now_scope, now_scope
	movq	%rdx, -104(%rbp)	; parser, parser
; src/parser.c:98:     Token* token = NULL;
	movq	$0, -8(%rbp)	;, token
; src/parser.c:99:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	-96(%rbp), %rax	; now_scope, tmp142
	movq	%rax, %rdi	; tmp142,
	call	*create_symbol_table@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp143, function_scope
; src/parser.c:100:     token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp144
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp144,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp145, token
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-8(%rbp), %rax	; token, tmp146
	movl	24(%rax), %eax	; token_86->type, _1
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	;, _1
	je	.L24	;,
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-8(%rbp), %rax	; token, tmp147
	movl	24(%rax), %eax	; token_86->type, _2
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	;, _2
	jne	.L25	;,
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-8(%rbp), %rax	; token, tmp148
	movq	(%rax), %rax	; token_86->lexeme, _3
	movq	%rax, %rdi	; _3,
	call	*is_builtin_type@GOTPCREL(%rip)	;
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	; _4
	jne	.L24	;,
.L25:
; src/parser.c:102:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp149
	movq	(%rax), %rax	; parser_88(D)->source_file, _5
	movq	%rax, %rdi	; _5,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _6
; src/parser.c:102:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp150
	movq	%rax, %rsi	; tmp150,
	leaq	.LC8(%rip), %rax	;, tmp151
	movq	%rax, %rdi	; tmp151,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:104:         return NULL;
	movl	$0, %eax	;, _63
	jmp	.L26	;
.L24:
; src/parser.c:106:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	-8(%rbp), %rax	; token, tmp152
	movq	(%rax), %rdx	; token_86->lexeme, _7
	movq	-96(%rbp), %rax	; now_scope, tmp153
	movq	%rdx, %rsi	; _7,
	movq	%rax, %rdi	; tmp153,
	call	*search_name@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp154, return_type
; src/parser.c:107:     if (return_type == NULL) {
	cmpq	$0, -32(%rbp)	;, return_type
	jne	.L27	;,
; src/parser.c:108:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp155
	movq	(%rax), %rax	; parser_88(D)->source_file, _8
	movq	%rax, %rdi	; _8,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _9
; src/parser.c:108:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp156
	movq	%rax, %rsi	; tmp156,
	leaq	.LC9(%rip), %rax	;, tmp157
	movq	%rax, %rdi	; tmp157,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:110:         return NULL;
	movl	$0, %eax	;, _63
	jmp	.L26	;
.L27:
; src/parser.c:112:     token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp158
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp158,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp159, token
; src/parser.c:113:     if (token->type != IDENTIFIER) {
	movq	-8(%rbp), %rax	; token, tmp160
	movl	24(%rax), %eax	; token_95->type, _10
; src/parser.c:113:     if (token->type != IDENTIFIER) {
	cmpl	$1, %eax	;, _10
	je	.L28	;,
; src/parser.c:114:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp161
	movq	(%rax), %rax	; parser_88(D)->source_file, _11
	movq	%rax, %rdi	; _11,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _12
; src/parser.c:114:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp162
	movq	%rax, %rsi	; tmp162,
	leaq	.LC10(%rip), %rax	;, tmp163
	movq	%rax, %rdi	; tmp163,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:116:         return NULL;
	movl	$0, %eax	;, _63
	jmp	.L26	;
.L28:
; src/parser.c:118:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp164, function
; src/parser.c:119:     function->function_scope = function_scope;
	movq	-40(%rbp), %rax	; function, tmp165
	movq	-24(%rbp), %rdx	; function_scope, tmp166
	movq	%rdx, 32(%rax)	; tmp166, function_97->function_scope
; src/parser.c:120:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	-8(%rbp), %rax	; token, tmp167
	movq	(%rax), %rax	; token_95->lexeme, _13
	movq	-40(%rbp), %rcx	; function, tmp168
	movq	-32(%rbp), %rdx	; return_type, tmp169
	movl	$1, %esi	;,
	movq	%rax, %rdi	; _13,
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp170, name
; src/parser.c:121:     token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp171
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp171,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp172, token
; src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp173
	movl	24(%rax), %eax	; token_102->type, _14
; src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _14
	jne	.L29	;,
; src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rdx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.17_15
	movq	-8(%rbp), %rax	; token, tmp174
	movq	(%rax), %rax	; token_102->lexeme, _16
	movq	%rdx, %rsi	; L_PAREN_SYMBOL.17_15,
	movq	%rax, %rdi	; _16,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; _17
	jne	.L30	;,
.L29:
; src/parser.c:123:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp175
	movq	(%rax), %rax	; parser_88(D)->source_file, _18
	movq	%rax, %rdi	; _18,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _19
; src/parser.c:123:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp176
	movq	%rax, %rsi	; tmp176,
	leaq	.LC11(%rip), %rax	;, tmp177
	movq	%rax, %rdi	; tmp177,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:125:         return NULL;
	movl	$0, %eax	;, _63
	jmp	.L26	;
.L30:
; src/parser.c:127:     token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp178
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp178,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp179, token
; src/parser.c:128:     list(Variable*) parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, -56(%rbp)	; tmp180, parameters
; src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L31	;
.L38:
; src/parser.c:130:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	-104(%rbp), %rdx	; parser, tmp181
	movq	-24(%rbp), %rcx	; function_scope, tmp182
	movq	-88(%rbp), %rax	; lexer, tmp183
	movq	%rcx, %rsi	; tmp182,
	movq	%rax, %rdi	; tmp183,
	call	parse_variable	;
	movq	%rax, -80(%rbp)	; tmp184, parameter
; src/parser.c:131:         if (parameter == NULL)
	cmpq	$0, -80(%rbp)	;, parameter
	jne	.L32	;,
; src/parser.c:132:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp185
	movq	(%rax), %rax	; parser_88(D)->source_file, _20
	movq	%rax, %rdi	; _20,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _21
; src/parser.c:132:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp186
	movq	%rax, %rsi	; tmp186,
	leaq	.LC12(%rip), %rax	;, tmp187
	movq	%rax, %rdi	; tmp187,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L33	;
.L32:
; src/parser.c:133:         else if (parameter->value != NULL)
	movq	-80(%rbp), %rax	; parameter, tmp188
	movq	16(%rax), %rax	; parameter_140->value, _22
; src/parser.c:133:         else if (parameter->value != NULL)
	testq	%rax, %rax	; _22
	je	.L34	;,
; src/parser.c:134:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp189
	movq	(%rax), %rax	; parser_88(D)->source_file, _23
	movq	%rax, %rdi	; _23,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _24
; src/parser.c:134:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp190
	movq	%rax, %rsi	; tmp190,
	leaq	.LC13(%rip), %rax	;, tmp191
	movq	%rax, %rdi	; tmp191,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L33	;
.L34:
; src/parser.c:136:             list_append(parameters, (pointer)parameter);
	movq	-80(%rbp), %rdx	; parameter, tmp192
	movq	-56(%rbp), %rax	; parameters, tmp193
	movq	%rdx, %rsi	; tmp192,
	movq	%rax, %rdi	; tmp193,
	call	*list_append@GOTPCREL(%rip)	;
.L33:
; src/parser.c:137:         token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp194
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp194,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp195, token
; src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp196
	movl	24(%rax), %eax	; token_147->type, _25
; src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, %eax	;, _25
	jne	.L35	;,
; src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	COMMA_SYMBOL(%rip), %rdx	; COMMA_SYMBOL, COMMA_SYMBOL.18_26
	movq	-8(%rbp), %rax	; token, tmp197
	movq	(%rax), %rax	; token_147->lexeme, _27
	movq	%rdx, %rsi	; COMMA_SYMBOL.18_26,
	movq	%rax, %rdi	; _27,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	; _28
	je	.L35	;,
; src/parser.c:139:             token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp198
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp198,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp199, token
; src/parser.c:139:             token = get_next_token(lexer, true);
	jmp	.L31	;
.L35:
; src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp200
	movl	24(%rax), %eax	; token_147->type, _29
; src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _29
	jne	.L37	;,
; src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.19_30
	movq	-8(%rbp), %rax	; token, tmp201
	movq	(%rax), %rax	; token_147->lexeme, _31
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.19_30,
	movq	%rax, %rdi	; _31,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _32
	jne	.L31	;,
.L37:
; src/parser.c:141:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp202
	movq	(%rax), %rax	; parser_88(D)->source_file, _33
	movq	%rax, %rdi	; _33,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _34
; src/parser.c:141:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp203
	movq	%rax, %rsi	; tmp203,
	leaq	.LC14(%rip), %rax	;, tmp204
	movq	%rax, %rdi	; tmp204,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:143:             return NULL;
	movl	$0, %eax	;, _63
	jmp	.L26	;
.L31:
; src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp205
	movl	24(%rax), %eax	; token_59->type, _35
; src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _35
	jne	.L38	;,
; src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.20_36
	movq	-8(%rbp), %rax	; token, tmp206
	movq	(%rax), %rax	; token_59->lexeme, _37
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.20_36,
	movq	%rax, %rdi	; _37,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _38
	je	.L38	;,
; src/parser.c:146:     token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp207
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp207,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp208, token
; src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp209
	movl	24(%rax), %eax	; token_110->type, _39
; src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _39
	jne	.L39	;,
; src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rdx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.21_40
	movq	-8(%rbp), %rax	; token, tmp210
	movq	(%rax), %rax	; token_110->lexeme, _41
	movq	%rdx, %rsi	; L_BRACE_SYMBOL.21_40,
	movq	%rax, %rdi	; _41,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; _42
	jne	.L40	;,
.L39:
; src/parser.c:148:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp211
	movq	(%rax), %rax	; parser_88(D)->source_file, _43
	movq	%rax, %rdi	; _43,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _44
; src/parser.c:148:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp212
	movq	%rax, %rsi	; tmp212,
	leaq	.LC15(%rip), %rax	;, tmp213
	movq	%rax, %rdi	; tmp213,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:150:         return NULL;
	movl	$0, %eax	;, _63
	jmp	.L26	;
.L40:
; src/parser.c:152:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, -64(%rbp)	; tmp214, body
; src/parser.c:153:     parser->in_function = true;
	movq	-104(%rbp), %rax	; parser, tmp215
	movb	$1, 8(%rax)	;, parser_88(D)->in_function
; src/parser.c:154:     bool have_return = false;
	movb	$0, -9(%rbp)	;, have_return
; src/parser.c:155:     token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp216
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp216,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp217, token
; src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L41	;
.L45:
; src/parser.c:157:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	-104(%rbp), %rdx	; parser, tmp218
	movq	-24(%rbp), %rcx	; function_scope, tmp219
	movq	-88(%rbp), %rax	; lexer, tmp220
	movq	%rcx, %rsi	; tmp219,
	movq	%rax, %rdi	; tmp220,
	call	parse_statement	;
	movq	%rax, -72(%rbp)	; tmp221, statement
; src/parser.c:158:         if (statement == NULL)
	cmpq	$0, -72(%rbp)	;, statement
	jne	.L42	;,
; src/parser.c:159:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp222
	movq	(%rax), %rax	; parser_88(D)->source_file, _45
	movq	%rax, %rdi	; _45,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _46
; src/parser.c:159:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp223
	movq	%rax, %rsi	; tmp223,
	leaq	.LC16(%rip), %rax	;, tmp224
	movq	%rax, %rdi	; tmp224,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L43	;
.L42:
; src/parser.c:160:         else if (have_return)
	cmpb	$0, -9(%rbp)	;, have_return
	je	.L43	;,
; src/parser.c:161:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp225
	movq	(%rax), %rax	; parser_88(D)->source_file, _47
	movq	%rax, %rdi	; _47,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _48
; src/parser.c:161:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp226
	movq	%rax, %rsi	; tmp226,
	leaq	.LC17(%rip), %rax	;, tmp227
	movq	%rax, %rdi	; tmp227,
	call	*parser_error@GOTPCREL(%rip)	;
.L43:
; src/parser.c:162:         if (statement != NULL && statement->type == RETURN_STATEMENT)
	cmpq	$0, -72(%rbp)	;, statement
	je	.L44	;,
; src/parser.c:162:         if (statement != NULL && statement->type == RETURN_STATEMENT)
	movq	-72(%rbp), %rax	; statement, tmp228
	movl	8(%rax), %eax	; statement_127->type, _49
; src/parser.c:162:         if (statement != NULL && statement->type == RETURN_STATEMENT)
	cmpl	$5, %eax	;, _49
	jne	.L44	;,
; src/parser.c:163:             have_return = true;
	movb	$1, -9(%rbp)	;, have_return
.L44:
; src/parser.c:164:         list_append(body, (pointer)statement);
	movq	-72(%rbp), %rdx	; statement, tmp229
	movq	-64(%rbp), %rax	; body, tmp230
	movq	%rdx, %rsi	; tmp229,
	movq	%rax, %rdi	; tmp230,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:165:         token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp231
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp231,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp232, token
.L41:
; src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp233
	movl	24(%rax), %eax	; token_60->type, _50
; src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _50
	jne	.L45	;,
; src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rdx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.22_51
	movq	-8(%rbp), %rax	; token, tmp234
	movq	(%rax), %rax	; token_60->lexeme, _52
	movq	%rdx, %rsi	; R_BRACE_SYMBOL.22_51,
	movq	%rax, %rdi	; _52,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; _53
	je	.L45	;,
; src/parser.c:167:     parser->in_function = false;
	movq	-104(%rbp), %rax	; parser, tmp235
	movb	$0, 8(%rax)	;, parser_88(D)->in_function
; src/parser.c:168:     if (!have_return && return_type != name_void)
	cmpb	$0, -9(%rbp)	;, have_return
	jne	.L46	;,
; src/parser.c:168:     if (!have_return && return_type != name_void)
	movq	name_void(%rip), %rax	; name_void, name_void.23_54
; src/parser.c:168:     if (!have_return && return_type != name_void)
	cmpq	%rax, -32(%rbp)	; name_void.23_54, return_type
	je	.L46	;,
; src/parser.c:169:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp236
	movq	(%rax), %rax	; parser_88(D)->source_file, _55
	movq	%rax, %rdi	; _55,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _56
; src/parser.c:169:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp237
	movq	%rax, %rsi	; tmp237,
	leaq	.LC18(%rip), %rax	;, tmp238
	movq	%rax, %rdi	; tmp238,
	call	*parser_error@GOTPCREL(%rip)	;
.L46:
; src/parser.c:170:     if (!have_return && return_type == name_void)
	cmpb	$0, -9(%rbp)	;, have_return
	jne	.L47	;,
; src/parser.c:170:     if (!have_return && return_type == name_void)
	movq	name_void(%rip), %rax	; name_void, name_void.24_57
; src/parser.c:170:     if (!have_return && return_type == name_void)
	cmpq	%rax, -32(%rbp)	; name_void.24_57, return_type
	jne	.L47	;,
; src/parser.c:171:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _58
; src/parser.c:171:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	-64(%rbp), %rax	; body, tmp239
	movq	%rdx, %rsi	; _58,
	movq	%rax, %rdi	; tmp239,
	call	*list_append@GOTPCREL(%rip)	;
.L47:
; src/parser.c:173:     return create_function_use_ptr(function, name, return_type, parameters, body, function_scope);
	movq	-24(%rbp), %r8	; function_scope, tmp240
	movq	-64(%rbp), %rdi	; body, tmp241
	movq	-56(%rbp), %rcx	; parameters, tmp242
	movq	-32(%rbp), %rdx	; return_type, tmp243
	movq	-48(%rbp), %rsi	; name, tmp244
	movq	-40(%rbp), %rax	; function, tmp245
	movq	%r8, %r9	; tmp240,
	movq	%rdi, %r8	; tmp241,
	movq	%rax, %rdi	; tmp245,
	call	*create_function_use_ptr@GOTPCREL(%rip)	;
.L26:
; src/parser.c:174: }
	leave	
	ret	
	.size	parse_function, .-parse_function
	.section	.rodata
	.align 8
.LC19:
	.string	"Expected method return type after 'method'"
	.align 8
.LC20:
	.string	"Unknown return type for method"
	.align 8
.LC21:
	.string	"Expected method name after return type"
	.align 8
.LC22:
	.string	"Expected '(' after method name"
	.align 8
.LC23:
	.string	"Expected 'self' as first parameter of method"
	.align 8
.LC24:
	.string	"Expected ',' or ')' after method parameter"
	.align 8
.LC25:
	.string	"Failed to parse method parameter"
	.align 8
.LC26:
	.string	"Method parameters cannot have default values"
	.align 8
.LC27:
	.string	"Expected '{' to start method body"
	.align 8
.LC28:
	.string	"Failed to parse method body statement"
	.align 8
.LC29:
	.string	"Method missing return statement"
	.text
	.type	parse_method, @function
parse_method:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	addq	$-128, %rsp	;,
	movq	%rdi, -104(%rbp)	; lexer, lexer
	movq	%rsi, -112(%rbp)	; now_scope, now_scope
	movq	%rdx, -120(%rbp)	; class_name, class_name
	movq	%rcx, -128(%rbp)	; parser, parser
; src/parser.c:177:     Token* token = NULL;
	movq	$0, -8(%rbp)	;, token
; src/parser.c:178:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	-112(%rbp), %rax	; now_scope, tmp152
	movq	%rax, %rdi	; tmp152,
	call	*create_symbol_table@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp153, method_scope
; src/parser.c:179:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	SELF_KEYWORD(%rip), %rax	; SELF_KEYWORD, SELF_KEYWORD.25_1
	movq	-24(%rbp), %rcx	; method_scope, tmp154
	movq	-120(%rbp), %rdx	; class_name, tmp155
	movl	$3, %esi	;,
	movq	%rax, %rdi	; SELF_KEYWORD.25_1,
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp156, self
; src/parser.c:180:     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp157
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp157,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp158, token
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-8(%rbp), %rax	; token, tmp159
	movl	24(%rax), %eax	; token_102->type, _2
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	;, _2
	je	.L49	;,
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-8(%rbp), %rax	; token, tmp160
	movl	24(%rax), %eax	; token_102->type, _3
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	;, _3
	jne	.L50	;,
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-8(%rbp), %rax	; token, tmp161
	movq	(%rax), %rax	; token_102->lexeme, _4
	movq	%rax, %rdi	; _4,
	call	*is_builtin_type@GOTPCREL(%rip)	;
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	; _5
	jne	.L49	;,
.L50:
; src/parser.c:182:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	-128(%rbp), %rax	; parser, tmp162
	movq	(%rax), %rax	; parser_104(D)->source_file, _6
	movq	%rax, %rdi	; _6,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _7
; src/parser.c:182:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp163
	movq	%rax, %rsi	; tmp163,
	leaq	.LC19(%rip), %rax	;, tmp164
	movq	%rax, %rdi	; tmp164,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:184:         return NULL;
	movl	$0, %eax	;, _73
	jmp	.L51	;
.L49:
; src/parser.c:186:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	-8(%rbp), %rax	; token, tmp165
	movq	(%rax), %rdx	; token_102->lexeme, _8
	movq	-112(%rbp), %rax	; now_scope, tmp166
	movq	%rdx, %rsi	; _8,
	movq	%rax, %rdi	; tmp166,
	call	*search_name@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp167, return_type
; src/parser.c:187:     if (return_type == NULL) {
	cmpq	$0, -40(%rbp)	;, return_type
	jne	.L52	;,
; src/parser.c:188:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	-128(%rbp), %rax	; parser, tmp168
	movq	(%rax), %rax	; parser_104(D)->source_file, _9
	movq	%rax, %rdi	; _9,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _10
; src/parser.c:188:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp169
	movq	%rax, %rsi	; tmp169,
	leaq	.LC20(%rip), %rax	;, tmp170
	movq	%rax, %rdi	; tmp170,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:190:         return NULL;
	movl	$0, %eax	;, _73
	jmp	.L51	;
.L52:
; src/parser.c:192:     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp171
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp171,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp172, token
; src/parser.c:193:     if (token->type != IDENTIFIER) {
	movq	-8(%rbp), %rax	; token, tmp173
	movl	24(%rax), %eax	; token_111->type, _11
; src/parser.c:193:     if (token->type != IDENTIFIER) {
	cmpl	$1, %eax	;, _11
	je	.L53	;,
; src/parser.c:194:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	-128(%rbp), %rax	; parser, tmp174
	movq	(%rax), %rax	; parser_104(D)->source_file, _12
	movq	%rax, %rdi	; _12,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _13
; src/parser.c:194:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp175
	movq	%rax, %rsi	; tmp175,
	leaq	.LC21(%rip), %rax	;, tmp176
	movq	%rax, %rdi	; tmp176,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:196:         return NULL;
	movl	$0, %eax	;, _73
	jmp	.L51	;
.L53:
; src/parser.c:198:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp177, method
; src/parser.c:199:     method->method_scope = method_scope;
	movq	-48(%rbp), %rax	; method, tmp178
	movq	-24(%rbp), %rdx	; method_scope, tmp179
	movq	%rdx, 32(%rax)	; tmp179, method_113->method_scope
; src/parser.c:200:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	-8(%rbp), %rax	; token, tmp180
	movq	(%rax), %rdx	; token_111->lexeme, _14
	movq	-120(%rbp), %rax	; class_name, tmp181
	movq	8(%rax), %rax	; class_name_97(D)->name, _15
	movq	%rdx, %rsi	; _14,
	movq	%rax, %rdi	; _15,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rdi	;, _16
; src/parser.c:200:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	-48(%rbp), %rdx	; method, tmp182
	movq	-40(%rbp), %rax	; return_type, tmp183
	movq	%rdx, %rcx	; tmp182,
	movq	%rax, %rdx	; tmp183,
	movl	$2, %esi	;,
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, -56(%rbp)	; tmp184, name
; src/parser.c:201:     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp185
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp185,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp186, token
; src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp187
	movl	24(%rax), %eax	; token_119->type, _17
; src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _17
	jne	.L54	;,
; src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rdx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.26_18
	movq	-8(%rbp), %rax	; token, tmp188
	movq	(%rax), %rax	; token_119->lexeme, _19
	movq	%rdx, %rsi	; L_PAREN_SYMBOL.26_18,
	movq	%rax, %rdi	; _19,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; _20
	jne	.L55	;,
.L54:
; src/parser.c:203:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	-128(%rbp), %rax	; parser, tmp189
	movq	(%rax), %rax	; parser_104(D)->source_file, _21
	movq	%rax, %rdi	; _21,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _22
; src/parser.c:203:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp190
	movq	%rax, %rsi	; tmp190,
	leaq	.LC22(%rip), %rax	;, tmp191
	movq	%rax, %rdi	; tmp191,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:205:         return NULL;
	movl	$0, %eax	;, _73
	jmp	.L51	;
.L55:
; src/parser.c:207:     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp192
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp192,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp193, token
; src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	-8(%rbp), %rax	; token, tmp194
	movl	24(%rax), %eax	; token_122->type, _23
; src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	cmpl	$6, %eax	;, _23
	jne	.L56	;,
; src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	SELF_KEYWORD(%rip), %rdx	; SELF_KEYWORD, SELF_KEYWORD.27_24
	movq	-8(%rbp), %rax	; token, tmp195
	movq	(%rax), %rax	; token_122->lexeme, _25
	movq	%rdx, %rsi	; SELF_KEYWORD.27_24,
	movq	%rax, %rdi	; _25,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	testb	%al, %al	; _26
	jne	.L57	;,
.L56:
; src/parser.c:209:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	-128(%rbp), %rax	; parser, tmp196
	movq	(%rax), %rax	; parser_104(D)->source_file, _27
	movq	%rax, %rdi	; _27,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _28
; src/parser.c:209:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp197
	movq	%rax, %rsi	; tmp197,
	leaq	.LC23(%rip), %rax	;, tmp198
	movq	%rax, %rdi	; tmp198,
	call	*parser_error@GOTPCREL(%rip)	;
.L57:
; src/parser.c:210:     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp199
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp199,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp200, token
; src/parser.c:211:     list(Variable*) parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, -64(%rbp)	; tmp201, parameters
; src/parser.c:212:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	-32(%rbp), %rcx	; self, tmp202
	movq	-120(%rbp), %rax	; class_name, tmp203
	movl	$0, %edx	;,
	movq	%rcx, %rsi	; tmp202,
	movq	%rax, %rdi	; tmp203,
	call	*create_variable@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _29
; src/parser.c:212:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	-64(%rbp), %rax	; parameters, tmp204
	movq	%rdx, %rsi	; _29,
	movq	%rax, %rdi	; tmp204,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L58	;
.L66:
; src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp205
	movl	24(%rax), %eax	; token_69->type, _30
; src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, %eax	;, _30
	jne	.L59	;,
; src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	COMMA_SYMBOL(%rip), %rdx	; COMMA_SYMBOL, COMMA_SYMBOL.28_31
	movq	-8(%rbp), %rax	; token, tmp206
	movq	(%rax), %rax	; token_69->lexeme, _32
	movq	%rdx, %rsi	; COMMA_SYMBOL.28_31,
	movq	%rax, %rdi	; _32,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	; _33
	je	.L59	;,
; src/parser.c:215:             token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp207
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp207,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp208, token
; src/parser.c:215:             token = get_next_token(lexer, true);
	nop	
; src/parser.c:221:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	-128(%rbp), %rdx	; parser, tmp214
	movq	-24(%rbp), %rcx	; method_scope, tmp215
	movq	-104(%rbp), %rax	; lexer, tmp216
	movq	%rcx, %rsi	; tmp215,
	movq	%rax, %rdi	; tmp216,
	call	parse_variable	;
	movq	%rax, -72(%rbp)	; tmp217, parameter
; src/parser.c:222:         if (parameter == NULL)
	cmpq	$0, -72(%rbp)	;, parameter
	jne	.L63	;,
	jmp	.L76	;
.L59:
; src/parser.c:216:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	-8(%rbp), %rax	; token, tmp209
	movl	24(%rax), %eax	; token_69->type, _34
; src/parser.c:216:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, %eax	;, _34
	jne	.L61	;,
; src/parser.c:216:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.29_35
	movq	-8(%rbp), %rax	; token, tmp210
	movq	(%rax), %rax	; token_69->lexeme, _36
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.29_35,
	movq	%rax, %rdi	; _36,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:216:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	testb	%al, %al	; _37
	jne	.L62	;,
.L61:
; src/parser.c:218:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	-128(%rbp), %rax	; parser, tmp211
	movq	(%rax), %rax	; parser_104(D)->source_file, _38
	movq	%rax, %rdi	; _38,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _39
; src/parser.c:218:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp212
	movq	%rax, %rsi	; tmp212,
	leaq	.LC24(%rip), %rax	;, tmp213
	movq	%rax, %rdi	; tmp213,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:219:             return NULL;
	movl	$0, %eax	;, _73
	jmp	.L51	;
.L76:
; src/parser.c:223:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	-128(%rbp), %rax	; parser, tmp218
	movq	(%rax), %rax	; parser_104(D)->source_file, _40
	movq	%rax, %rdi	; _40,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _41
; src/parser.c:223:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp219
	movq	%rax, %rsi	; tmp219,
	leaq	.LC25(%rip), %rax	;, tmp220
	movq	%rax, %rdi	; tmp220,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L64	;
.L63:
; src/parser.c:224:         else if (parameter->value != NULL)
	movq	-72(%rbp), %rax	; parameter, tmp221
	movq	16(%rax), %rax	; parameter_137->value, _42
; src/parser.c:224:         else if (parameter->value != NULL)
	testq	%rax, %rax	; _42
	je	.L65	;,
; src/parser.c:225:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	-128(%rbp), %rax	; parser, tmp222
	movq	(%rax), %rax	; parser_104(D)->source_file, _43
	movq	%rax, %rdi	; _43,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _44
; src/parser.c:225:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp223
	movq	%rax, %rsi	; tmp223,
	leaq	.LC26(%rip), %rax	;, tmp224
	movq	%rax, %rdi	; tmp224,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L64	;
.L65:
; src/parser.c:227:             list_append(parameters, (pointer)parameter);
	movq	-72(%rbp), %rdx	; parameter, tmp225
	movq	-64(%rbp), %rax	; parameters, tmp226
	movq	%rdx, %rsi	; tmp225,
	movq	%rax, %rdi	; tmp226,
	call	*list_append@GOTPCREL(%rip)	;
.L64:
; src/parser.c:228:         token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp227
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp227,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp228, token
.L58:
; src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp229
	movl	24(%rax), %eax	; token_69->type, _45
; src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _45
	jne	.L66	;,
; src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.30_46
	movq	-8(%rbp), %rax	; token, tmp230
	movq	(%rax), %rax	; token_69->lexeme, _47
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.30_46,
	movq	%rax, %rdi	; _47,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _48
	je	.L66	;,
.L62:
; src/parser.c:230:     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp231
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp231,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp232, token
; src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp233
	movl	24(%rax), %eax	; token_150->type, _49
; src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _49
	jne	.L67	;,
; src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rdx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.31_50
	movq	-8(%rbp), %rax	; token, tmp234
	movq	(%rax), %rax	; token_150->lexeme, _51
	movq	%rdx, %rsi	; L_BRACE_SYMBOL.31_50,
	movq	%rax, %rdi	; _51,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; _52
	jne	.L68	;,
.L67:
; src/parser.c:232:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	-128(%rbp), %rax	; parser, tmp235
	movq	(%rax), %rax	; parser_104(D)->source_file, _53
	movq	%rax, %rdi	; _53,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _54
; src/parser.c:232:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp236
	movq	%rax, %rsi	; tmp236,
	leaq	.LC27(%rip), %rax	;, tmp237
	movq	%rax, %rdi	; tmp237,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:234:         return NULL;
	movl	$0, %eax	;, _73
	jmp	.L51	;
.L68:
; src/parser.c:236:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, -80(%rbp)	; tmp238, body
; src/parser.c:237:     parser->in_function = true;
	movq	-128(%rbp), %rax	; parser, tmp239
	movb	$1, 8(%rax)	;, parser_104(D)->in_function
; src/parser.c:238:     parser->in_method = true;
	movq	-128(%rbp), %rax	; parser, tmp240
	movb	$1, 9(%rax)	;, parser_104(D)->in_method
; src/parser.c:239:     bool have_return = false;
	movb	$0, -9(%rbp)	;, have_return
; src/parser.c:240:     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp241
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp241,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp242, token
; src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L69	;
.L73:
; src/parser.c:242:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	-128(%rbp), %rdx	; parser, tmp243
	movq	-24(%rbp), %rcx	; method_scope, tmp244
	movq	-104(%rbp), %rax	; lexer, tmp245
	movq	%rcx, %rsi	; tmp244,
	movq	%rax, %rdi	; tmp245,
	call	parse_statement	;
	movq	%rax, -88(%rbp)	; tmp246, statement
; src/parser.c:243:         if (statement == NULL)
	cmpq	$0, -88(%rbp)	;, statement
	jne	.L70	;,
; src/parser.c:244:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	-128(%rbp), %rax	; parser, tmp247
	movq	(%rax), %rax	; parser_104(D)->source_file, _55
	movq	%rax, %rdi	; _55,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _56
; src/parser.c:244:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp248
	movq	%rax, %rsi	; tmp248,
	leaq	.LC28(%rip), %rax	;, tmp249
	movq	%rax, %rdi	; tmp249,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L71	;
.L70:
; src/parser.c:245:         else if (have_return)
	cmpb	$0, -9(%rbp)	;, have_return
	je	.L71	;,
; src/parser.c:246:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	-128(%rbp), %rax	; parser, tmp250
	movq	(%rax), %rax	; parser_104(D)->source_file, _57
	movq	%rax, %rdi	; _57,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _58
; src/parser.c:246:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp251
	movq	%rax, %rsi	; tmp251,
	leaq	.LC17(%rip), %rax	;, tmp252
	movq	%rax, %rdi	; tmp252,
	call	*parser_error@GOTPCREL(%rip)	;
.L71:
; src/parser.c:247:         if (statement != NULL && statement->type == RETURN_STATEMENT)
	cmpq	$0, -88(%rbp)	;, statement
	je	.L72	;,
; src/parser.c:247:         if (statement != NULL && statement->type == RETURN_STATEMENT)
	movq	-88(%rbp), %rax	; statement, tmp253
	movl	8(%rax), %eax	; statement_169->type, _59
; src/parser.c:247:         if (statement != NULL && statement->type == RETURN_STATEMENT)
	cmpl	$5, %eax	;, _59
	jne	.L72	;,
; src/parser.c:248:             have_return = true;
	movb	$1, -9(%rbp)	;, have_return
.L72:
; src/parser.c:249:         list_append(body, (pointer)statement);
	movq	-88(%rbp), %rdx	; statement, tmp254
	movq	-80(%rbp), %rax	; body, tmp255
	movq	%rdx, %rsi	; tmp254,
	movq	%rax, %rdi	; tmp255,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:250:         token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp256
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp256,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp257, token
.L69:
; src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp258
	movl	24(%rax), %eax	; token_70->type, _60
; src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _60
	jne	.L73	;,
; src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rdx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.32_61
	movq	-8(%rbp), %rax	; token, tmp259
	movq	(%rax), %rax	; token_70->lexeme, _62
	movq	%rdx, %rsi	; R_BRACE_SYMBOL.32_61,
	movq	%rax, %rdi	; _62,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; _63
	je	.L73	;,
; src/parser.c:252:     parser->in_function = false;
	movq	-128(%rbp), %rax	; parser, tmp260
	movb	$0, 8(%rax)	;, parser_104(D)->in_function
; src/parser.c:253:     parser->in_method = false;
	movq	-128(%rbp), %rax	; parser, tmp261
	movb	$0, 9(%rax)	;, parser_104(D)->in_method
; src/parser.c:254:     if (!have_return && return_type != name_void)
	cmpb	$0, -9(%rbp)	;, have_return
	jne	.L74	;,
; src/parser.c:254:     if (!have_return && return_type != name_void)
	movq	name_void(%rip), %rax	; name_void, name_void.33_64
; src/parser.c:254:     if (!have_return && return_type != name_void)
	cmpq	%rax, -40(%rbp)	; name_void.33_64, return_type
	je	.L74	;,
; src/parser.c:255:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	-128(%rbp), %rax	; parser, tmp262
	movq	(%rax), %rax	; parser_104(D)->source_file, _65
	movq	%rax, %rdi	; _65,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _66
; src/parser.c:255:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp263
	movq	%rax, %rsi	; tmp263,
	leaq	.LC29(%rip), %rax	;, tmp264
	movq	%rax, %rdi	; tmp264,
	call	*parser_error@GOTPCREL(%rip)	;
.L74:
; src/parser.c:256:     if (!have_return && return_type == name_void)
	cmpb	$0, -9(%rbp)	;, have_return
	jne	.L75	;,
; src/parser.c:256:     if (!have_return && return_type == name_void)
	movq	name_void(%rip), %rax	; name_void, name_void.34_67
; src/parser.c:256:     if (!have_return && return_type == name_void)
	cmpq	%rax, -40(%rbp)	; name_void.34_67, return_type
	jne	.L75	;,
; src/parser.c:257:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _68
; src/parser.c:257:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	-80(%rbp), %rax	; body, tmp265
	movq	%rdx, %rsi	; _68,
	movq	%rax, %rdi	; tmp265,
	call	*list_append@GOTPCREL(%rip)	;
.L75:
; src/parser.c:259:     return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
	movq	-24(%rbp), %r8	; method_scope, tmp266
	movq	-80(%rbp), %rdi	; body, tmp267
	movq	-64(%rbp), %rcx	; parameters, tmp268
	movq	-40(%rbp), %rdx	; return_type, tmp269
	movq	-56(%rbp), %rsi	; name, tmp270
	movq	-48(%rbp), %rax	; method, tmp271
	movq	%r8, %r9	; tmp266,
	movq	%rdi, %r8	; tmp267,
	movq	%rax, %rdi	; tmp271,
	call	*create_method_use_ptr@GOTPCREL(%rip)	;
.L51:
; src/parser.c:260: }
	leave	
	ret	
	.size	parse_method, .-parse_method
	.section	.rodata
	.align 8
.LC30:
	.string	"Expected class name after 'class'"
	.align 8
.LC31:
	.string	"Expected '{' to start class body"
.LC32:
	.string	"Failed to parse class method"
	.align 8
.LC33:
	.string	"Failed to parse class variable"
	.align 8
.LC34:
	.string	"Unsupported type for class variable"
	.align 8
.LC35:
	.string	"Expected ';' after class variable declaration"
	.align 8
.LC36:
	.string	"Unexpected token in class member"
	.align 8
.LC37:
	.string	"Constructor name conflicts with existing member"
.LC38:
	.string	"0"
	.text
	.type	parse_class, @function
parse_class:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	pushq	%rbx	;
	subq	$280, %rsp	;,
	movq	%rdi, -264(%rbp)	; lexer, lexer
	movq	%rsi, -272(%rbp)	; now_scope, now_scope
	movq	%rdx, -280(%rbp)	; parser, parser
; src/parser.c:263:     Token* token = NULL;
	movq	$0, -24(%rbp)	;, token
; src/parser.c:264:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	-272(%rbp), %rax	; now_scope, tmp190
	movq	%rax, %rdi	; tmp190,
	call	*create_symbol_table@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp191, class_scope
; src/parser.c:265:     token = get_next_token(lexer, true);
	movq	-264(%rbp), %rax	; lexer, tmp192
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp192,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp193, token
; src/parser.c:266:     if (token->type != IDENTIFIER) {
	movq	-24(%rbp), %rax	; token, tmp194
	movl	24(%rax), %eax	; token_138->type, _1
; src/parser.c:266:     if (token->type != IDENTIFIER) {
	cmpl	$1, %eax	;, _1
	je	.L78	;,
; src/parser.c:267:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	-280(%rbp), %rax	; parser, tmp195
	movq	(%rax), %rax	; parser_179(D)->source_file, _2
	movq	%rax, %rdi	; _2,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _3
; src/parser.c:267:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	-24(%rbp), %rax	; token, tmp196
	movq	%rax, %rsi	; tmp196,
	leaq	.LC30(%rip), %rax	;, tmp197
	movq	%rax, %rdi	; tmp197,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:269:         return NULL;
	movl	$0, %eax	;, _111
	jmp	.L79	;
.L78:
; src/parser.c:271:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -56(%rbp)	; tmp198, class
; src/parser.c:272:     class->class_scope = class_scope;
	movq	-56(%rbp), %rax	; class, tmp199
	movq	-48(%rbp), %rdx	; class_scope, tmp200
	movq	%rdx, 16(%rax)	; tmp200, class_140->class_scope
; src/parser.c:273:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	movq	-24(%rbp), %rax	; token, tmp201
	movq	(%rax), %rax	; token_138->lexeme, _4
	movq	-56(%rbp), %rdx	; class, tmp202
	movq	%rdx, %rcx	; tmp202,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movq	%rax, %rdi	; _4,
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, -64(%rbp)	; tmp203, name
; src/parser.c:274:     token = get_next_token(lexer, true);
	movq	-264(%rbp), %rax	; lexer, tmp204
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp204,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp205, token
; src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-24(%rbp), %rax	; token, tmp206
	movl	24(%rax), %eax	; token_145->type, _5
; src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _5
	jne	.L80	;,
; src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rdx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.35_6
	movq	-24(%rbp), %rax	; token, tmp207
	movq	(%rax), %rax	; token_145->lexeme, _7
	movq	%rdx, %rsi	; L_BRACE_SYMBOL.35_6,
	movq	%rax, %rdi	; _7,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; _8
	jne	.L81	;,
.L80:
; src/parser.c:276:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	-280(%rbp), %rax	; parser, tmp208
	movq	(%rax), %rax	; parser_179(D)->source_file, _9
	movq	%rax, %rdi	; _9,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _10
; src/parser.c:276:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	-24(%rbp), %rax	; token, tmp209
	movq	%rax, %rsi	; tmp209,
	leaq	.LC31(%rip), %rax	;, tmp210
	movq	%rax, %rdi	; tmp210,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:278:         return NULL;
	movl	$0, %eax	;, _111
	jmp	.L79	;
.L81:
; src/parser.c:280:     list(ClassMember*) members = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, -72(%rbp)	; tmp211, members
; src/parser.c:281:     token = get_next_token(lexer, true);
	movq	-264(%rbp), %rax	; lexer, tmp212
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp212,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp213, token
; src/parser.c:282:     size_t size = 0;
	movq	$0, -32(%rbp)	;, size
; src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L82	;
.L96:
; src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	-24(%rbp), %rax	; token, tmp214
	movl	24(%rax), %eax	; token_106->type, _11
; src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	;, _11
	jne	.L83	;,
; src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	METHOD_KEYWORD(%rip), %rdx	; METHOD_KEYWORD, METHOD_KEYWORD.36_12
	movq	-24(%rbp), %rax	; token, tmp215
	movq	(%rax), %rax	; token_106->lexeme, _13
	movq	%rdx, %rsi	; METHOD_KEYWORD.36_12,
	movq	%rax, %rdi	; _13,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	testb	%al, %al	; _14
	je	.L83	;,
; src/parser.c:285:             Method* method = parse_method(lexer, class_scope, name, parser);
	movq	-280(%rbp), %rcx	; parser, tmp216
	movq	-64(%rbp), %rdx	; name, tmp217
	movq	-48(%rbp), %rsi	; class_scope, tmp218
	movq	-264(%rbp), %rax	; lexer, tmp219
	movq	%rax, %rdi	; tmp219,
	call	parse_method	;
	movq	%rax, -232(%rbp)	; tmp220, method
; src/parser.c:286:             if (method == NULL)
	cmpq	$0, -232(%rbp)	;, method
	jne	.L84	;,
; src/parser.c:287:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	-280(%rbp), %rax	; parser, tmp221
	movq	(%rax), %rax	; parser_179(D)->source_file, _15
	movq	%rax, %rdi	; _15,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _16
; src/parser.c:287:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	-24(%rbp), %rax	; token, tmp222
	movq	%rax, %rsi	; tmp222,
	leaq	.LC32(%rip), %rax	;, tmp223
	movq	%rax, %rdi	; tmp223,
	call	*parser_error@GOTPCREL(%rip)	;
.L84:
; src/parser.c:288:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	-232(%rbp), %rax	; method, tmp224
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp224,
	movl	$0, %edi	;,
	call	*create_class_member@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _17
; src/parser.c:288:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	-72(%rbp), %rax	; members, tmp225
	movq	%rdx, %rsi	; _17,
	movq	%rax, %rdi	; tmp225,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	jmp	.L85	;
.L83:
; src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	-24(%rbp), %rax	; token, tmp226
	movl	24(%rax), %eax	; token_106->type, _18
; src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	cmpl	$6, %eax	;, _18
	jne	.L86	;,
; src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	VAR_KEYWORD(%rip), %rdx	; VAR_KEYWORD, VAR_KEYWORD.37_19
	movq	-24(%rbp), %rax	; token, tmp227
	movq	(%rax), %rax	; token_106->lexeme, _20
	movq	%rdx, %rsi	; VAR_KEYWORD.37_19,
	movq	%rax, %rdi	; _20,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	; _21
	je	.L86	;,
; src/parser.c:290:             token = get_next_token(lexer, true);
	movq	-264(%rbp), %rax	; lexer, tmp228
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp228,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp229, token
; src/parser.c:291:             parser->in_class = true;
	movq	-280(%rbp), %rax	; parser, tmp230
	movb	$1, 10(%rax)	;, parser_179(D)->in_class
; src/parser.c:292:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	-280(%rbp), %rdx	; parser, tmp231
	movq	-48(%rbp), %rcx	; class_scope, tmp232
	movq	-264(%rbp), %rax	; lexer, tmp233
	movq	%rcx, %rsi	; tmp232,
	movq	%rax, %rdi	; tmp233,
	call	parse_variable	;
	movq	%rax, -240(%rbp)	; tmp234, variable
; src/parser.c:293:             parser->in_class = false;
	movq	-280(%rbp), %rax	; parser, tmp235
	movb	$0, 10(%rax)	;, parser_179(D)->in_class
; src/parser.c:294:             if (variable == NULL)
	cmpq	$0, -240(%rbp)	;, variable
	jne	.L87	;,
; src/parser.c:295:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	-280(%rbp), %rax	; parser, tmp236
	movq	(%rax), %rax	; parser_179(D)->source_file, _22
	movq	%rax, %rdi	; _22,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _23
; src/parser.c:295:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	-24(%rbp), %rax	; token, tmp237
	movq	%rax, %rsi	; tmp237,
	leaq	.LC33(%rip), %rax	;, tmp238
	movq	%rax, %rdi	; tmp238,
	call	*parser_error@GOTPCREL(%rip)	;
.L87:
; src/parser.c:296:             ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
	movq	-240(%rbp), %rax	; variable, tmp239
	movq	%rax, %rdx	; tmp239,
	movl	$0, %esi	;,
	movl	$1, %edi	;,
	call	*create_class_member@GOTPCREL(%rip)	;
	movq	%rax, -248(%rbp)	; tmp240, member
; src/parser.c:297:             list_append(members, (pointer)member);
	movq	-248(%rbp), %rdx	; member, tmp241
	movq	-72(%rbp), %rax	; members, tmp242
	movq	%rdx, %rsi	; tmp241,
	movq	%rax, %rdi	; tmp242,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:298:             if (member->type == CLASS_VARIABLE) {
	movq	-248(%rbp), %rax	; member, tmp243
	movl	8(%rax), %eax	; member_268->type, _24
; src/parser.c:298:             if (member->type == CLASS_VARIABLE) {
	cmpl	$1, %eax	;, _24
	jne	.L88	;,
; src/parser.c:299:                 Symbol* type = member->content.variable->type;
	movq	-248(%rbp), %rax	; member, tmp244
	movq	(%rax), %rax	; member_268->content.variable, _25
; src/parser.c:299:                 Symbol* type = member->content.variable->type;
	movq	(%rax), %rax	; _25->type, tmp245
	movq	%rax, -256(%rbp)	; tmp245, type
; src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	movq	name_int(%rip), %rax	; name_int, name_int.38_26
; src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	%rax, -256(%rbp)	; name_int.38_26, type
	je	.L89	;,
; src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	movq	name_float(%rip), %rax	; name_float, name_float.39_27
; src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	%rax, -256(%rbp)	; name_float.39_27, type
	je	.L89	;,
; src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	movq	name_string(%rip), %rax	; name_string, name_string.40_28
; src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	%rax, -256(%rbp)	; name_string.40_28, type
	jne	.L90	;,
.L89:
; src/parser.c:301:                     size += 8;
	addq	$8, -32(%rbp)	;, size
	jmp	.L88	;
.L90:
; src/parser.c:302:                 else if (type == name_bool || type == name_void)
	movq	name_bool(%rip), %rax	; name_bool, name_bool.41_29
; src/parser.c:302:                 else if (type == name_bool || type == name_void)
	cmpq	%rax, -256(%rbp)	; name_bool.41_29, type
	je	.L91	;,
; src/parser.c:302:                 else if (type == name_bool || type == name_void)
	movq	name_void(%rip), %rax	; name_void, name_void.42_30
; src/parser.c:302:                 else if (type == name_bool || type == name_void)
	cmpq	%rax, -256(%rbp)	; name_void.42_30, type
	jne	.L92	;,
.L91:
; src/parser.c:303:                     size += 1;
	addq	$1, -32(%rbp)	;, size
	jmp	.L88	;
.L92:
; src/parser.c:304:                 else if (type->kind == SYMBOL_CLASS)
	movq	-256(%rbp), %rax	; type, tmp246
	movl	32(%rax), %eax	; type_270->kind, _31
; src/parser.c:304:                 else if (type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	; _31
	jne	.L93	;,
; src/parser.c:305:                     size += 8;  // pointer to object
	addq	$8, -32(%rbp)	;, size
	jmp	.L88	;
.L93:
; src/parser.c:307:                     parser_error("Unsupported type for class variable", token, get_full_path(parser->source_file));
	movq	-280(%rbp), %rax	; parser, tmp247
	movq	(%rax), %rax	; parser_179(D)->source_file, _32
	movq	%rax, %rdi	; _32,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _33
; src/parser.c:307:                     parser_error("Unsupported type for class variable", token, get_full_path(parser->source_file));
	movq	-24(%rbp), %rax	; token, tmp248
	movq	%rax, %rsi	; tmp248,
	leaq	.LC34(%rip), %rax	;, tmp249
	movq	%rax, %rdi	; tmp249,
	call	*parser_error@GOTPCREL(%rip)	;
.L88:
; src/parser.c:309:             token = get_next_token(lexer, true);
	movq	-264(%rbp), %rax	; lexer, tmp250
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp250,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp251, token
; src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	-24(%rbp), %rax	; token, tmp252
	movl	24(%rax), %eax	; token_277->type, _34
; src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, %eax	;, _34
	jne	.L94	;,
; src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	SEMICOLON_SYMBOL(%rip), %rdx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.43_35
	movq	-24(%rbp), %rax	; token, tmp253
	movq	(%rax), %rax	; token_277->lexeme, _36
	movq	%rdx, %rsi	; SEMICOLON_SYMBOL.43_35,
	movq	%rax, %rdi	; _36,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; _37
	jne	.L110	;,
.L94:
; src/parser.c:311:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	-280(%rbp), %rax	; parser, tmp254
	movq	(%rax), %rax	; parser_179(D)->source_file, _38
	movq	%rax, %rdi	; _38,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _39
; src/parser.c:311:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	-24(%rbp), %rax	; token, tmp255
	movq	%rax, %rsi	; tmp255,
	leaq	.LC35(%rip), %rax	;, tmp256
	movq	%rax, %rdi	; tmp256,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	jmp	.L110	;
.L86:
; src/parser.c:313:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	-280(%rbp), %rax	; parser, tmp257
	movq	(%rax), %rax	; parser_179(D)->source_file, _40
	movq	%rax, %rdi	; _40,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _41
; src/parser.c:313:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	-24(%rbp), %rax	; token, tmp258
	movq	%rax, %rsi	; tmp258,
	leaq	.LC36(%rip), %rax	;, tmp259
	movq	%rax, %rdi	; tmp259,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L85	;
.L110:
; src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	nop	
.L85:
; src/parser.c:314:         token = get_next_token(lexer, true);
	movq	-264(%rbp), %rax	; lexer, tmp260
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp260,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp261, token
.L82:
; src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-24(%rbp), %rax	; token, tmp262
	movl	24(%rax), %eax	; token_106->type, _42
; src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _42
	jne	.L96	;,
; src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rdx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.44_43
	movq	-24(%rbp), %rax	; token, tmp263
	movq	(%rax), %rax	; token_106->lexeme, _44
	movq	%rdx, %rsi	; R_BRACE_SYMBOL.44_43,
	movq	%rax, %rdi	; _44,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; _45
	je	.L96	;,
; src/parser.c:316:     string init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
	movq	DEFAULT_INIT_NAME(%rip), %rdx	; DEFAULT_INIT_NAME, DEFAULT_INIT_NAME.45_46
	movq	-64(%rbp), %rax	; name, tmp264
	movq	8(%rax), %rax	; name_143->name, _47
	movq	%rdx, %rsi	; DEFAULT_INIT_NAME.45_46,
	movq	%rax, %rdi	; _47,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, -80(%rbp)	; tmp265, init_name
; src/parser.c:317:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	movq	-80(%rbp), %rdx	; init_name, tmp266
	movq	-48(%rbp), %rax	; class_scope, tmp267
	movq	%rdx, %rsi	; tmp266,
	movq	%rax, %rdi	; tmp267,
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp268, init
; src/parser.c:318:     if (init == NULL) {
	cmpq	$0, -40(%rbp)	;, init
	jne	.L97	;,
; src/parser.c:319:         Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -88(%rbp)	; tmp269, method
; src/parser.c:320:         method->method_scope = create_symbol_table(class_scope);
	movq	-48(%rbp), %rax	; class_scope, tmp270
	movq	%rax, %rdi	; tmp270,
	call	*create_symbol_table@GOTPCREL(%rip)	;
; src/parser.c:320:         method->method_scope = create_symbol_table(class_scope);
	movq	-88(%rbp), %rdx	; method, tmp271
	movq	%rax, 32(%rdx)	; _48, method_158->method_scope
; src/parser.c:321:         init = create_symbol(init_name, SYMBOL_METHOD, name, method);
	movq	-88(%rbp), %rcx	; method, tmp272
	movq	-64(%rbp), %rdx	; name, tmp273
	movq	-80(%rbp), %rax	; init_name, tmp274
	movl	$2, %esi	;,
	movq	%rax, %rdi	; tmp274,
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp275, init
; src/parser.c:322:         list(Variable*) parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, -96(%rbp)	; tmp276, parameters
; src/parser.c:323:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	-88(%rbp), %rax	; method, tmp277
	movq	32(%rax), %rcx	; method_158->method_scope, _49
; src/parser.c:323:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	SELF_KEYWORD(%rip), %rax	; SELF_KEYWORD, SELF_KEYWORD.46_50
	movq	-64(%rbp), %rdx	; name, tmp278
	movl	$3, %esi	;,
	movq	%rax, %rdi	; SELF_KEYWORD.46_50,
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, -104(%rbp)	; tmp279, self
; src/parser.c:324:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	-104(%rbp), %rcx	; self, tmp280
	movq	-64(%rbp), %rax	; name, tmp281
	movl	$0, %edx	;,
	movq	%rcx, %rsi	; tmp280,
	movq	%rax, %rdi	; tmp281,
	call	*create_variable@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _51
; src/parser.c:324:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	-96(%rbp), %rax	; parameters, tmp282
	movq	%rdx, %rsi	; _51,
	movq	%rax, %rdi	; tmp282,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:325:         list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, -112(%rbp)	; tmp283, body
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	-104(%rbp), %rax	; self, tmp284
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; tmp284,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %r8	; _52,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; _53,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movl	$0, %r9d	;,
	movq	%rax, %r8	; _54,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _55
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	-112(%rbp), %rax	; body, tmp285
	movq	%rdx, %rsi	; _55,
	movq	%rax, %rdi	; tmp285,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:327:         create_method_use_ptr(method, init, name, parameters, body, method->method_scope);
	movq	-88(%rbp), %rax	; method, tmp286
	movq	32(%rax), %r8	; method_158->method_scope, _56
	movq	-112(%rbp), %rdi	; body, tmp287
	movq	-96(%rbp), %rcx	; parameters, tmp288
	movq	-64(%rbp), %rdx	; name, tmp289
	movq	-40(%rbp), %rsi	; init, tmp290
	movq	-88(%rbp), %rax	; method, tmp291
	movq	%r8, %r9	; _56,
	movq	%rdi, %r8	; tmp287,
	movq	%rax, %rdi	; tmp291,
	call	*create_method_use_ptr@GOTPCREL(%rip)	;
; src/parser.c:328:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	-88(%rbp), %rax	; method, tmp292
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp292,
	movl	$0, %edi	;,
	call	*create_class_member@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _57
; src/parser.c:328:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	-72(%rbp), %rax	; members, tmp293
	movq	%rdx, %rsi	; _57,
	movq	%rax, %rdi	; tmp293,
	call	*list_append@GOTPCREL(%rip)	;
.L97:
; src/parser.c:330:     if (init->kind != SYMBOL_METHOD)
	movq	-40(%rbp), %rax	; init, tmp294
	movl	32(%rax), %eax	; init_110->kind, _58
; src/parser.c:330:     if (init->kind != SYMBOL_METHOD)
	cmpl	$2, %eax	;, _58
	je	.L98	;,
; src/parser.c:331:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	-280(%rbp), %rax	; parser, tmp295
	movq	(%rax), %rax	; parser_179(D)->source_file, _59
	movq	%rax, %rdi	; _59,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _60
; src/parser.c:331:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	-24(%rbp), %rax	; token, tmp296
	movq	%rax, %rsi	; tmp296,
	leaq	.LC37(%rip), %rax	;, tmp297
	movq	%rax, %rdi	; tmp297,
	call	*parser_error@GOTPCREL(%rip)	;
.L98:
; src/parser.c:332:     string constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME.47_61
	movq	-64(%rbp), %rax	; name, tmp298
	movq	8(%rax), %rax	; name_143->name, _62
	movq	%rdx, %rsi	; DEFAULT_CONSTRUCTOR_NAME.47_61,
	movq	%rax, %rdi	; _62,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, -120(%rbp)	; tmp299, constructor_name
; src/parser.c:333:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -128(%rbp)	; tmp300, method
; src/parser.c:334:     method->method_scope = create_symbol_table(class_scope);
	movq	-48(%rbp), %rax	; class_scope, tmp301
	movq	%rax, %rdi	; tmp301,
	call	*create_symbol_table@GOTPCREL(%rip)	;
; src/parser.c:334:     method->method_scope = create_symbol_table(class_scope);
	movq	-128(%rbp), %rdx	; method, tmp302
	movq	%rax, 32(%rdx)	; _63, method_185->method_scope
; src/parser.c:335:     Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
	movq	-128(%rbp), %rcx	; method, tmp303
	movq	-64(%rbp), %rdx	; name, tmp304
	movq	-120(%rbp), %rax	; constructor_name, tmp305
	movl	$2, %esi	;,
	movq	%rax, %rdi	; tmp305,
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, -136(%rbp)	; tmp306, constructor
; src/parser.c:336:     list(Variable*) parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, -144(%rbp)	; tmp307, parameters
; src/parser.c:337:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	-128(%rbp), %rax	; method, tmp308
	movq	32(%rax), %rcx	; method_185->method_scope, _64
; src/parser.c:337:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	SELF_KEYWORD(%rip), %rax	; SELF_KEYWORD, SELF_KEYWORD.48_65
	movq	-64(%rbp), %rdx	; name, tmp309
	movl	$3, %esi	;,
	movq	%rax, %rdi	; SELF_KEYWORD.48_65,
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, -152(%rbp)	; tmp310, self
; src/parser.c:338:     list(Variable*) init_params = list_copy(init->ast_node.method->parameters);
	movq	-40(%rbp), %rax	; init, tmp311
	movq	24(%rax), %rax	; init_110->ast_node.method, _66
; src/parser.c:338:     list(Variable*) init_params = list_copy(init->ast_node.method->parameters);
	movq	16(%rax), %rax	; _66->parameters, _67
	movq	%rax, %rdi	; _67,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -160(%rbp)	; tmp312, init_params
; src/parser.c:340:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	jmp	.L99	;
.L102:
; src/parser.c:341:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	movq	SELF_KEYWORD(%rip), %rdx	; SELF_KEYWORD, SELF_KEYWORD.49_68
; src/parser.c:341:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	movq	-168(%rbp), %rax	; param, tmp313
	movq	8(%rax), %rax	; param_197->name, _69
; src/parser.c:341:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	movq	8(%rax), %rax	; _69->name, _70
	movq	%rdx, %rsi	; SELF_KEYWORD.49_68,
	movq	%rax, %rdi	; _70,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:341:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	testb	%al, %al	; _71
	jne	.L111	;,
; src/parser.c:342:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	-168(%rbp), %rax	; param, tmp314
	movq	8(%rax), %rcx	; param_197->name, _72
	movq	-168(%rbp), %rax	; param, tmp315
	movq	(%rax), %rax	; param_197->type, _73
	movl	$0, %edx	;,
	movq	%rcx, %rsi	; _72,
	movq	%rax, %rdi	; _73,
	call	*create_variable@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _74
; src/parser.c:342:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	-144(%rbp), %rax	; parameters, tmp316
	movq	%rdx, %rsi	; _74,
	movq	%rax, %rdi	; tmp316,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L99	;
.L111:
; src/parser.c:341:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	nop	
.L99:
; src/parser.c:340:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	movq	-160(%rbp), %rax	; init_params, tmp317
	movq	%rax, %rdi	; tmp317,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -168(%rbp)	; tmp318, param
; src/parser.c:340:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	cmpq	$0, -168(%rbp)	;, param
	jne	.L102	;,
; src/parser.c:344:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, -176(%rbp)	; tmp319, body
; src/parser.c:345:     list(ClassMember*) ms = list_copy(members);
	movq	-72(%rbp), %rax	; members, tmp320
	movq	%rax, %rdi	; tmp320,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -184(%rbp)	; tmp321, ms
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	-152(%rbp), %rax	; self, tmp322
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; tmp322,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %r8	; _75,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; _76,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movl	$0, %r9d	;,
	movq	%rax, %r8	; _77,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _78
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	-176(%rbp), %rax	; body, tmp323
	movq	%rdx, %rsi	; _78,
	movq	%rax, %rdi	; tmp323,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:348:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	jmp	.L104	;
.L107:
; src/parser.c:349:         if (mb->type == CLASS_VARIABLE) {
	movq	-192(%rbp), %rax	; mb, tmp324
	movl	8(%rax), %eax	; mb_208->type, _79
; src/parser.c:349:         if (mb->type == CLASS_VARIABLE) {
	cmpl	$1, %eax	;, _79
	jne	.L104	;,
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	-192(%rbp), %rax	; mb, tmp325
	movq	(%rax), %rax	; mb_208->content.variable, _80
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	8(%rax), %rbx	; _80->name, _81
	movq	-152(%rbp), %rax	; self, tmp326
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; tmp326,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	%rbx, %rdx	; _81,
	movq	%rax, %rsi	; _82,
	movl	$2, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	%rax, %r8	; _83,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; _84,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, -216(%rbp)	; tmp327, left
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	-192(%rbp), %rax	; mb, tmp328
	movq	(%rax), %rax	; mb_208->content.variable, _85
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	16(%rax), %rax	; _85->value, _86
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	testq	%rax, %rax	; _86
	je	.L105	;,
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	-192(%rbp), %rax	; mb, tmp329
	movq	(%rax), %rax	; mb_208->content.variable, _87
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	16(%rax), %rax	; _87->value, iftmp.50_112
	jmp	.L106	;
.L105:
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movl	$2, %esi	;,
	leaq	.LC38(%rip), %rax	;, tmp330
	movq	%rax, %rdi	; tmp330,
	call	*create_string@GOTPCREL(%rip)	;
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _88,
	movl	$0, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; _89,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
.L106:
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	%rax, -224(%rbp)	; iftmp.50_112, right
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	-224(%rbp), %rdx	; right, tmp331
	movq	-216(%rbp), %rax	; left, tmp332
	movq	%rdx, %rcx	; tmp331,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp332,
	movl	$13, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movl	$0, %r9d	;,
	movq	%rax, %r8	; _90,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _91
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	-176(%rbp), %rax	; body, tmp333
	movq	%rdx, %rsi	; _91,
	movq	%rax, %rdi	; tmp333,
	call	*list_append@GOTPCREL(%rip)	;
.L104:
; src/parser.c:348:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	movq	-184(%rbp), %rax	; ms, tmp334
	movq	%rax, %rdi	; tmp334,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -192(%rbp)	; tmp335, mb
; src/parser.c:348:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	cmpq	$0, -192(%rbp)	;, mb
	jne	.L107	;,
; src/parser.c:355:     list(Expression*) args = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, -200(%rbp)	; tmp336, args
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	-152(%rbp), %rax	; self, tmp337
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; tmp337,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	%rax, %r8	; _92,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; _93,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _94
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	-200(%rbp), %rax	; args, tmp338
	movq	%rdx, %rsi	; _94,
	movq	%rax, %rdi	; tmp338,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:357:     list(Variable*) params = list_copy(parameters);
	movq	-144(%rbp), %rax	; parameters, tmp339
	movq	%rax, %rdi	; tmp339,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -208(%rbp)	; tmp340, params
; src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	jmp	.L108	;
.L109:
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	-168(%rbp), %rax	; param, tmp341
	movq	8(%rax), %rax	; param_218->name, _95
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; _95,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rax, %r8	; _96,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; _97,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _98
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	-200(%rbp), %rax	; args, tmp342
	movq	%rdx, %rsi	; _98,
	movq	%rax, %rdi	; tmp342,
	call	*list_append@GOTPCREL(%rip)	;
.L108:
; src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	movq	-208(%rbp), %rax	; params, tmp343
	movq	%rax, %rdi	; tmp343,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -168(%rbp)	; tmp344, param
; src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	cmpq	$0, -168(%rbp)	;, param
	jne	.L109	;,
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	-40(%rbp), %rax	; init, tmp345
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; tmp345,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	-200(%rbp), %rdx	; args, tmp346
	movq	%rdx, %r8	; tmp346,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _99,
	movl	$1, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %r8	; _100,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; _101,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movl	$0, %r9d	;,
	movq	%rax, %r8	; _102,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _103
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	-176(%rbp), %rax	; body, tmp347
	movq	%rdx, %rsi	; _103,
	movq	%rax, %rdi	; tmp347,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:361:     create_method_use_ptr(method, constructor, name, parameters, body, method->method_scope);
	movq	-128(%rbp), %rax	; method, tmp348
	movq	32(%rax), %r8	; method_185->method_scope, _104
	movq	-176(%rbp), %rdi	; body, tmp349
	movq	-144(%rbp), %rcx	; parameters, tmp350
	movq	-64(%rbp), %rdx	; name, tmp351
	movq	-136(%rbp), %rsi	; constructor, tmp352
	movq	-128(%rbp), %rax	; method, tmp353
	movq	%r8, %r9	; _104,
	movq	%rdi, %r8	; tmp349,
	movq	%rax, %rdi	; tmp353,
	call	*create_method_use_ptr@GOTPCREL(%rip)	;
; src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	-128(%rbp), %rax	; method, tmp354
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp354,
	movl	$0, %edi	;,
	call	*create_class_member@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _105
; src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	-72(%rbp), %rax	; members, tmp355
	movq	%rdx, %rsi	; _105,
	movq	%rax, %rdi	; tmp355,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:364:     return create_class_use_ptr(class, name, members, class_scope, size);
	movq	-32(%rbp), %rdi	; size, tmp356
	movq	-48(%rbp), %rcx	; class_scope, tmp357
	movq	-72(%rbp), %rdx	; members, tmp358
	movq	-64(%rbp), %rsi	; name, tmp359
	movq	-56(%rbp), %rax	; class, tmp360
	movq	%rdi, %r8	; tmp356,
	movq	%rax, %rdi	; tmp360,
	call	*create_class_use_ptr@GOTPCREL(%rip)	;
.L79:
; src/parser.c:365: }
	movq	-8(%rbp), %rbx	;,
	leave	
	ret	
	.size	parse_class, .-parse_class
	.section	.rodata
.LC39:
	.string	"Expected variable type"
	.align 8
.LC40:
	.string	"Expected a type for variable declaration"
.LC41:
	.string	"Unknown variable type"
.LC42:
	.string	"Expected variable name"
	.align 8
.LC43:
	.string	"Failed to parse variable initializer"
	.text
	.type	parse_variable, @function
parse_variable:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -40(%rbp)	; lexer, lexer
	movq	%rsi, -48(%rbp)	; now_scope, now_scope
	movq	%rdx, -56(%rbp)	; parser, parser
; src/parser.c:368:     Token* token = NULL;
	movq	$0, -16(%rbp)	;, token
; src/parser.c:369:     token = peek_current_token(lexer);
	movq	-40(%rbp), %rax	; lexer, tmp110
	movq	%rax, %rdi	; tmp110,
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp111, token
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-16(%rbp), %rax	; token, tmp112
	movl	24(%rax), %eax	; token_39->type, _1
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	;, _1
	je	.L113	;,
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-16(%rbp), %rax	; token, tmp113
	movl	24(%rax), %eax	; token_39->type, _2
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	;, _2
	jne	.L114	;,
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	-16(%rbp), %rax	; token, tmp114
	movq	(%rax), %rax	; token_39->lexeme, _3
	movq	%rax, %rdi	; _3,
	call	*is_builtin_type@GOTPCREL(%rip)	;
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	; _4
	jne	.L113	;,
.L114:
; src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	-56(%rbp), %rax	; parser, tmp115
	movq	(%rax), %rax	; parser_41(D)->source_file, _5
	movq	%rax, %rdi	; _5,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _6
; src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	; token, tmp116
	movq	%rax, %rsi	; tmp116,
	leaq	.LC39(%rip), %rax	;, tmp117
	movq	%rax, %rdi	; tmp117,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:373:         return NULL;
	movl	$0, %eax	;, _27
	jmp	.L115	;
.L113:
; src/parser.c:375:     Symbol* type = search_name(now_scope, token->lexeme);
	movq	-16(%rbp), %rax	; token, tmp118
	movq	(%rax), %rdx	; token_39->lexeme, _7
	movq	-48(%rbp), %rax	; now_scope, tmp119
	movq	%rdx, %rsi	; _7,
	movq	%rax, %rdi	; tmp119,
	call	*search_name@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp120, type
; src/parser.c:376:     if (type != NULL) {
	cmpq	$0, -24(%rbp)	;, type
	je	.L116	;,
; src/parser.c:377:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	movq	-24(%rbp), %rax	; type, tmp121
	movl	32(%rax), %eax	; type_47->kind, _8
; src/parser.c:377:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	cmpl	$6, %eax	;, _8
	je	.L117	;,
; src/parser.c:377:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	movq	-24(%rbp), %rax	; type, tmp122
	movl	32(%rax), %eax	; type_47->kind, _9
; src/parser.c:377:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	testl	%eax, %eax	; _9
	je	.L117	;,
; src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	-56(%rbp), %rax	; parser, tmp123
	movq	(%rax), %rax	; parser_41(D)->source_file, _10
	movq	%rax, %rdi	; _10,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _11
; src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	; token, tmp124
	movq	%rax, %rsi	; tmp124,
	leaq	.LC40(%rip), %rax	;, tmp125
	movq	%rax, %rdi	; tmp125,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L117	;
.L116:
; src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	-56(%rbp), %rax	; parser, tmp126
	movq	(%rax), %rax	; parser_41(D)->source_file, _12
	movq	%rax, %rdi	; _12,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _13
; src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	; token, tmp127
	movq	%rax, %rsi	; tmp127,
	leaq	.LC41(%rip), %rax	;, tmp128
	movq	%rax, %rdi	; tmp128,
	call	*parser_error@GOTPCREL(%rip)	;
.L117:
; src/parser.c:381:     token = get_next_token(lexer, true);
	movq	-40(%rbp), %rax	; lexer, tmp129
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp129,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp130, token
; src/parser.c:382:     if (token->type != IDENTIFIER)
	movq	-16(%rbp), %rax	; token, tmp131
	movl	24(%rax), %eax	; token_53->type, _14
; src/parser.c:382:     if (token->type != IDENTIFIER)
	cmpl	$1, %eax	;, _14
	je	.L118	;,
; src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	-56(%rbp), %rax	; parser, tmp132
	movq	(%rax), %rax	; parser_41(D)->source_file, _15
	movq	%rax, %rdi	; _15,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _16
; src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	; token, tmp133
	movq	%rax, %rsi	; tmp133,
	leaq	.LC42(%rip), %rax	;, tmp134
	movq	%rax, %rdi	; tmp134,
	call	*parser_error@GOTPCREL(%rip)	;
.L118:
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movq	-56(%rbp), %rax	; parser, tmp135
	movzbl	10(%rax), %eax	; parser_41(D)->in_class, _17
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	testb	%al, %al	; _17
	je	.L119	;,
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movq	-56(%rbp), %rax	; parser, tmp136
	movzbl	9(%rax), %eax	; parser_41(D)->in_method, _18
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	testb	%al, %al	; _18
	jne	.L119	;,
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movl	$5, %esi	;, iftmp.51_28
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	jmp	.L120	;
.L119:
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movl	$3, %esi	;, iftmp.51_28
.L120:
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movq	-16(%rbp), %rax	; token, tmp137
	movq	(%rax), %rax	; token_53->lexeme, _19
	movq	-48(%rbp), %rcx	; now_scope, tmp138
	movq	-24(%rbp), %rdx	; type, tmp139
	movq	%rax, %rdi	; _19,
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp140, name
; src/parser.c:385:     Expression* value = NULL;
	movq	$0, -8(%rbp)	;, value
; src/parser.c:386:     token = peek_next_token(lexer, true);
	movq	-40(%rbp), %rax	; lexer, tmp141
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp141,
	call	*peek_next_token@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp142, token
; src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	movq	-16(%rbp), %rax	; token, tmp143
	movl	24(%rax), %eax	; token_62->type, _20
; src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, %eax	;, _20
	jne	.L121	;,
; src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	movq	ASSIGN_SYMBOL(%rip), %rdx	; ASSIGN_SYMBOL, ASSIGN_SYMBOL.52_21
	movq	-16(%rbp), %rax	; token, tmp144
	movq	(%rax), %rax	; token_62->lexeme, _22
	movq	%rdx, %rsi	; ASSIGN_SYMBOL.52_21,
	movq	%rax, %rdi	; _22,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	; _23
	je	.L121	;,
; src/parser.c:388:         token = get_next_token(lexer, true);  // consume '='
	movq	-40(%rbp), %rax	; lexer, tmp145
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp145,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp146, token
; src/parser.c:389:         token = get_next_token(lexer, true);
	movq	-40(%rbp), %rax	; lexer, tmp147
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp147,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp148, token
; src/parser.c:390:         value = parse_expression(lexer, now_scope, parser);
	movq	-56(%rbp), %rdx	; parser, tmp149
	movq	-48(%rbp), %rcx	; now_scope, tmp150
	movq	-40(%rbp), %rax	; lexer, tmp151
	movq	%rcx, %rsi	; tmp150,
	movq	%rax, %rdi	; tmp151,
	call	parse_expression	;
	movq	%rax, -8(%rbp)	; tmp152, value
; src/parser.c:391:         if (value == NULL)
	cmpq	$0, -8(%rbp)	;, value
	jne	.L121	;,
; src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	-56(%rbp), %rax	; parser, tmp153
	movq	(%rax), %rax	; parser_41(D)->source_file, _24
	movq	%rax, %rdi	; _24,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _25
; src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	; token, tmp154
	movq	%rax, %rsi	; tmp154,
	leaq	.LC43(%rip), %rax	;, tmp155
	movq	%rax, %rdi	; tmp155,
	call	*parser_error@GOTPCREL(%rip)	;
.L121:
; src/parser.c:395:     return create_variable(type, name, value);
	movq	-8(%rbp), %rdx	; value, tmp156
	movq	-32(%rbp), %rcx	; name, tmp157
	movq	-24(%rbp), %rax	; type, tmp158
	movq	%rcx, %rsi	; tmp157,
	movq	%rax, %rdi	; tmp158,
	call	*create_variable@GOTPCREL(%rip)	;
.L115:
; src/parser.c:396: }
	leave	
	ret	
	.size	parse_variable, .-parse_variable
	.section	.rodata
	.align 8
.LC44:
	.string	"Cannot use 'break' outside of a loop"
	.align 8
.LC45:
	.string	"Cannot use 'continue' outside of a loop"
.LC46:
	.string	"Failed to parse statement"
.LC47:
	.string	"Expected ';' after statement"
	.text
	.type	parse_statement, @function
parse_statement:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; lexer, lexer
	movq	%rsi, -32(%rbp)	; now_scope, now_scope
	movq	%rdx, -40(%rbp)	; parser, parser
; src/parser.c:399:     Token* token = NULL;
	movq	$0, -16(%rbp)	;, token
; src/parser.c:400:     token = peek_current_token(lexer);
	movq	-24(%rbp), %rax	; lexer, tmp131
	movq	%rax, %rdi	; tmp131,
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp132, token
; src/parser.c:401:     Statement* statement = NULL;
	movq	$0, -8(%rbp)	;, statement
; src/parser.c:402:     if (token->type == KEYWORD) {
	movq	-16(%rbp), %rax	; token, tmp133
	movl	24(%rax), %eax	; token_60->type, _1
; src/parser.c:402:     if (token->type == KEYWORD) {
	cmpl	$6, %eax	;, _1
	jne	.L123	;,
; src/parser.c:403:         if (string_equal(token->lexeme, IF_KEYWORD))
	movq	IF_KEYWORD(%rip), %rdx	; IF_KEYWORD, IF_KEYWORD.53_2
	movq	-16(%rbp), %rax	; token, tmp134
	movq	(%rax), %rax	; token_60->lexeme, _3
	movq	%rdx, %rsi	; IF_KEYWORD.53_2,
	movq	%rax, %rdi	; _3,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:403:         if (string_equal(token->lexeme, IF_KEYWORD))
	testb	%al, %al	; _4
	je	.L124	;,
; src/parser.c:404:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movq	-40(%rbp), %rdx	; parser, tmp135
	movq	-32(%rbp), %rcx	; now_scope, tmp136
	movq	-24(%rbp), %rax	; lexer, tmp137
	movq	%rcx, %rsi	; tmp136,
	movq	%rax, %rdi	; tmp137,
	call	parse_if	;
; src/parser.c:404:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _5,
	movl	$2, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
; src/parser.c:404:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	jmp	.L125	;
.L124:
; src/parser.c:405:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	movq	FOR_KEYWORD(%rip), %rdx	; FOR_KEYWORD, FOR_KEYWORD.54_6
	movq	-16(%rbp), %rax	; token, tmp138
	movq	(%rax), %rax	; token_60->lexeme, _7
	movq	%rdx, %rsi	; FOR_KEYWORD.54_6,
	movq	%rax, %rdi	; _7,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:405:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	testb	%al, %al	; _8
	je	.L126	;,
; src/parser.c:406:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movq	-40(%rbp), %rdx	; parser, tmp139
	movq	-32(%rbp), %rcx	; now_scope, tmp140
	movq	-24(%rbp), %rax	; lexer, tmp141
	movq	%rcx, %rsi	; tmp140,
	movq	%rax, %rdi	; tmp141,
	call	parse_for	;
; src/parser.c:406:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movq	%rax, %rcx	; _9,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$4, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
; src/parser.c:406:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L125	;
.L126:
; src/parser.c:407:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	movq	WHILE_KEYWORD(%rip), %rdx	; WHILE_KEYWORD, WHILE_KEYWORD.55_10
	movq	-16(%rbp), %rax	; token, tmp142
	movq	(%rax), %rax	; token_60->lexeme, _11
	movq	%rdx, %rsi	; WHILE_KEYWORD.55_10,
	movq	%rax, %rdi	; _11,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:407:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	testb	%al, %al	; _12
	je	.L127	;,
; src/parser.c:408:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movq	-40(%rbp), %rdx	; parser, tmp143
	movq	-32(%rbp), %rcx	; now_scope, tmp144
	movq	-24(%rbp), %rax	; lexer, tmp145
	movq	%rcx, %rsi	; tmp144,
	movq	%rax, %rdi	; tmp145,
	call	parse_while	;
; src/parser.c:408:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; _13,
	movl	$0, %esi	;,
	movl	$3, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
; src/parser.c:408:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	jmp	.L125	;
.L127:
; src/parser.c:409:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	VAR_KEYWORD(%rip), %rdx	; VAR_KEYWORD, VAR_KEYWORD.56_14
	movq	-16(%rbp), %rax	; token, tmp146
	movq	(%rax), %rax	; token_60->lexeme, _15
	movq	%rdx, %rsi	; VAR_KEYWORD.56_14,
	movq	%rax, %rdi	; _15,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:409:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	; _16
	je	.L128	;,
; src/parser.c:410:             get_next_token(lexer, true);
	movq	-24(%rbp), %rax	; lexer, tmp147
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp147,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:411:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	-40(%rbp), %rdx	; parser, tmp148
	movq	-32(%rbp), %rcx	; now_scope, tmp149
	movq	-24(%rbp), %rax	; lexer, tmp150
	movq	%rcx, %rsi	; tmp149,
	movq	%rax, %rdi	; tmp150,
	call	parse_variable	;
; src/parser.c:411:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rax, %r9	; _17,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$1, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp151, statement
	jmp	.L129	;
.L128:
; src/parser.c:412:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	movq	RETURN_KEYWORD(%rip), %rdx	; RETURN_KEYWORD, RETURN_KEYWORD.57_18
	movq	-16(%rbp), %rax	; token, tmp152
	movq	(%rax), %rax	; token_60->lexeme, _19
	movq	%rdx, %rsi	; RETURN_KEYWORD.57_18,
	movq	%rax, %rdi	; _19,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:412:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	; _20
	je	.L130	;,
; src/parser.c:413:             token = get_next_token(lexer, true);
	movq	-24(%rbp), %rax	; lexer, tmp153
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp153,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp154, token
; src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	-16(%rbp), %rax	; token, tmp155
	movl	24(%rax), %eax	; token_88->type, _21
; src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	;, _21
	jne	.L131	;,
; src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	SEMICOLON_SYMBOL(%rip), %rdx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.58_22
	movq	-16(%rbp), %rax	; token, tmp156
	movq	(%rax), %rax	; token_88->lexeme, _23
	movq	%rdx, %rsi	; SEMICOLON_SYMBOL.58_22,
	movq	%rax, %rdi	; _23,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; _24
	je	.L131	;,
; src/parser.c:416:                 return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	jmp	.L125	;
.L131:
; src/parser.c:418:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	-40(%rbp), %rdx	; parser, tmp157
	movq	-32(%rbp), %rcx	; now_scope, tmp158
	movq	-24(%rbp), %rax	; lexer, tmp159
	movq	%rcx, %rsi	; tmp158,
	movq	%rax, %rdi	; tmp159,
	call	parse_expression	;
; src/parser.c:418:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movl	$0, %r9d	;,
	movq	%rax, %r8	; _25,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp160, statement
	jmp	.L129	;
.L130:
; src/parser.c:419:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	movq	BREAK_KEYWORD(%rip), %rdx	; BREAK_KEYWORD, BREAK_KEYWORD.59_26
	movq	-16(%rbp), %rax	; token, tmp161
	movq	(%rax), %rax	; token_60->lexeme, _27
	movq	%rdx, %rsi	; BREAK_KEYWORD.59_26,
	movq	%rax, %rdi	; _27,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:419:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	; _28
	je	.L132	;,
; src/parser.c:420:             if (!parser->in_loop) {
	movq	-40(%rbp), %rax	; parser, tmp162
	movzbl	11(%rax), %eax	; parser_63(D)->in_loop, _29
; src/parser.c:420:             if (!parser->in_loop) {
	testb	%al, %al	; _29
	jne	.L133	;,
; src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	-40(%rbp), %rax	; parser, tmp163
	movq	(%rax), %rax	; parser_63(D)->source_file, _30
	movq	%rax, %rdi	; _30,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _31
; src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	; token, tmp164
	movq	%rax, %rsi	; tmp164,
	leaq	.LC44(%rip), %rax	;, tmp165
	movq	%rax, %rdi	; tmp165,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:423:                 return NULL;
	movl	$0, %eax	;, _49
	jmp	.L125	;
.L133:
; src/parser.c:425:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$6, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp166, statement
	jmp	.L129	;
.L132:
; src/parser.c:426:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	movq	CONTINUE_KEYWORD(%rip), %rdx	; CONTINUE_KEYWORD, CONTINUE_KEYWORD.60_32
	movq	-16(%rbp), %rax	; token, tmp167
	movq	(%rax), %rax	; token_60->lexeme, _33
	movq	%rdx, %rsi	; CONTINUE_KEYWORD.60_32,
	movq	%rax, %rdi	; _33,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:426:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	; _34
	je	.L134	;,
; src/parser.c:427:             if (!parser->in_loop) {
	movq	-40(%rbp), %rax	; parser, tmp168
	movzbl	11(%rax), %eax	; parser_63(D)->in_loop, _35
; src/parser.c:427:             if (!parser->in_loop) {
	testb	%al, %al	; _35
	jne	.L135	;,
; src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	-40(%rbp), %rax	; parser, tmp169
	movq	(%rax), %rax	; parser_63(D)->source_file, _36
	movq	%rax, %rdi	; _36,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _37
; src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	; token, tmp170
	movq	%rax, %rsi	; tmp170,
	leaq	.LC45(%rip), %rax	;, tmp171
	movq	%rax, %rdi	; tmp171,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:430:                 return NULL;
	movl	$0, %eax	;, _49
	jmp	.L125	;
.L135:
; src/parser.c:432:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$7, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp172, statement
	jmp	.L129	;
.L134:
; src/parser.c:434:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	-40(%rbp), %rdx	; parser, tmp173
	movq	-32(%rbp), %rcx	; now_scope, tmp174
	movq	-24(%rbp), %rax	; lexer, tmp175
	movq	%rcx, %rsi	; tmp174,
	movq	%rax, %rdi	; tmp175,
	call	parse_expression	;
; src/parser.c:434:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movl	$0, %r9d	;,
	movq	%rax, %r8	; _38,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp176, statement
	jmp	.L129	;
.L123:
; src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	-40(%rbp), %rdx	; parser, tmp177
	movq	-32(%rbp), %rcx	; now_scope, tmp178
	movq	-24(%rbp), %rax	; lexer, tmp179
	movq	%rcx, %rsi	; tmp178,
	movq	%rax, %rdi	; tmp179,
	call	parse_expression	;
; src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movl	$0, %r9d	;,
	movq	%rax, %r8	; _39,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp180, statement
.L129:
; src/parser.c:437:     token = peek_current_token(lexer);
	movq	-24(%rbp), %rax	; lexer, tmp181
	movq	%rax, %rdi	; tmp181,
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp182, token
; src/parser.c:438:     if (statement == NULL)
	cmpq	$0, -8(%rbp)	;, statement
	jne	.L136	;,
; src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	-40(%rbp), %rax	; parser, tmp183
	movq	(%rax), %rax	; parser_63(D)->source_file, _40
	movq	%rax, %rdi	; _40,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _41
; src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	; token, tmp184
	movq	%rax, %rsi	; tmp184,
	leaq	.LC46(%rip), %rax	;, tmp185
	movq	%rax, %rdi	; tmp185,
	call	*parser_error@GOTPCREL(%rip)	;
.L136:
; src/parser.c:440:     token = get_next_token(lexer, true);
	movq	-24(%rbp), %rax	; lexer, tmp186
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp186,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp187, token
; src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	-16(%rbp), %rax	; token, tmp188
	movl	24(%rax), %eax	; token_113->type, _42
; src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, %eax	;, _42
	jne	.L137	;,
; src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	SEMICOLON_SYMBOL(%rip), %rdx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.61_43
	movq	-16(%rbp), %rax	; token, tmp189
	movq	(%rax), %rax	; token_113->lexeme, _44
	movq	%rdx, %rsi	; SEMICOLON_SYMBOL.61_43,
	movq	%rax, %rdi	; _44,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; _45
	jne	.L138	;,
.L137:
; src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	-40(%rbp), %rax	; parser, tmp190
	movq	(%rax), %rax	; parser_63(D)->source_file, _46
	movq	%rax, %rdi	; _46,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _47
; src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	-16(%rbp), %rax	; token, tmp191
	movq	%rax, %rsi	; tmp191,
	leaq	.LC47(%rip), %rax	;, tmp192
	movq	%rax, %rdi	; tmp192,
	call	*parser_error@GOTPCREL(%rip)	;
.L138:
; src/parser.c:444:     return statement;
	movq	-8(%rbp), %rax	; statement, _49
.L125:
; src/parser.c:445: }
	leave	
	ret	
	.size	parse_statement, .-parse_statement
	.section	.rodata
.LC48:
	.string	"Expected '(' after 'if'"
.LC49:
	.string	"Failed to parse if condition"
	.align 8
.LC50:
	.string	"Expected ')' after if condition"
.LC51:
	.string	"Expected '{' to start if body"
	.align 8
.LC52:
	.string	"Failed to parse if body statement"
.LC53:
	.string	"Expected '(' after 'elif'"
	.align 8
.LC54:
	.string	"Failed to parse else-if condition"
	.align 8
.LC55:
	.string	"Expected ')' after else-if condition"
	.align 8
.LC56:
	.string	"Expected '{' to start else-if body"
	.align 8
.LC57:
	.string	"Failed to parse else-if body statement"
	.align 8
.LC58:
	.string	"Expected '{' to start else body"
	.align 8
.LC59:
	.string	"Failed to parse else body statement"
	.text
	.type	parse_if, @function
parse_if:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$112, %rsp	;,
	movq	%rdi, -88(%rbp)	; lexer, lexer
	movq	%rsi, -96(%rbp)	; now_scope, now_scope
	movq	%rdx, -104(%rbp)	; parser, parser
; src/parser.c:448:     Token* token = NULL;
	movq	$0, -8(%rbp)	;, token
; src/parser.c:449:     token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp157
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp157,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp158, token
; src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp159
	movl	24(%rax), %eax	; token_105->type, _1
; src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _1
	jne	.L140	;,
; src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rdx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.62_2
	movq	-8(%rbp), %rax	; token, tmp160
	movq	(%rax), %rax	; token_105->lexeme, _3
	movq	%rdx, %rsi	; L_PAREN_SYMBOL.62_2,
	movq	%rax, %rdi	; _3,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; _4
	jne	.L141	;,
.L140:
; src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp161
	movq	(%rax), %rax	; parser_110(D)->source_file, _5
	movq	%rax, %rdi	; _5,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _6
; src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp162
	movq	%rax, %rsi	; tmp162,
	leaq	.LC48(%rip), %rax	;, tmp163
	movq	%rax, %rdi	; tmp163,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:453:         return NULL;
	movl	$0, %eax	;, _78
	jmp	.L142	;
.L141:
; src/parser.c:455:     token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp164
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp164,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp165, token
; src/parser.c:456:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	-104(%rbp), %rdx	; parser, tmp166
	movq	-96(%rbp), %rcx	; now_scope, tmp167
	movq	-88(%rbp), %rax	; lexer, tmp168
	movq	%rcx, %rsi	; tmp167,
	movq	%rax, %rdi	; tmp168,
	call	parse_expression	;
	movq	%rax, -16(%rbp)	; tmp169, condition
; src/parser.c:457:     if (condition == NULL)
	cmpq	$0, -16(%rbp)	;, condition
	jne	.L143	;,
; src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp170
	movq	(%rax), %rax	; parser_110(D)->source_file, _7
	movq	%rax, %rdi	; _7,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _8
; src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp171
	movq	%rax, %rsi	; tmp171,
	leaq	.LC49(%rip), %rax	;, tmp172
	movq	%rax, %rdi	; tmp172,
	call	*parser_error@GOTPCREL(%rip)	;
.L143:
; src/parser.c:459:     token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp173
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp173,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp174, token
; src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp175
	movl	24(%rax), %eax	; token_116->type, _9
; src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _9
	jne	.L144	;,
; src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.63_10
	movq	-8(%rbp), %rax	; token, tmp176
	movq	(%rax), %rax	; token_116->lexeme, _11
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.63_10,
	movq	%rax, %rdi	; _11,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _12
	jne	.L145	;,
.L144:
; src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp177
	movq	(%rax), %rax	; parser_110(D)->source_file, _13
	movq	%rax, %rdi	; _13,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _14
; src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp178
	movq	%rax, %rsi	; tmp178,
	leaq	.LC50(%rip), %rax	;, tmp179
	movq	%rax, %rdi	; tmp179,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:463:         return NULL;
	movl	$0, %eax	;, _78
	jmp	.L142	;
.L145:
; src/parser.c:465:     token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp180
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp180,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp181, token
; src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp182
	movl	24(%rax), %eax	; token_119->type, _15
; src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _15
	jne	.L146	;,
; src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rdx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.64_16
	movq	-8(%rbp), %rax	; token, tmp183
	movq	(%rax), %rax	; token_119->lexeme, _17
	movq	%rdx, %rsi	; L_BRACE_SYMBOL.64_16,
	movq	%rax, %rdi	; _17,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; _18
	jne	.L147	;,
.L146:
; src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp184
	movq	(%rax), %rax	; parser_110(D)->source_file, _19
	movq	%rax, %rdi	; _19,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _20
; src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp185
	movq	%rax, %rsi	; tmp185,
	leaq	.LC51(%rip), %rax	;, tmp186
	movq	%rax, %rdi	; tmp186,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:469:         return NULL;
	movl	$0, %eax	;, _78
	jmp	.L142	;
.L147:
; src/parser.c:471:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp187, body
; src/parser.c:472:     token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp188
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp188,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp189, token
; src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L148	;
.L150:
; src/parser.c:474:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	-104(%rbp), %rdx	; parser, tmp190
	movq	-96(%rbp), %rcx	; now_scope, tmp191
	movq	-88(%rbp), %rax	; lexer, tmp192
	movq	%rcx, %rsi	; tmp191,
	movq	%rax, %rdi	; tmp192,
	call	parse_statement	;
	movq	%rax, -80(%rbp)	; tmp193, statement
; src/parser.c:475:         if (statement == NULL)
	cmpq	$0, -80(%rbp)	;, statement
	jne	.L149	;,
; src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp194
	movq	(%rax), %rax	; parser_110(D)->source_file, _21
	movq	%rax, %rdi	; _21,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _22
; src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp195
	movq	%rax, %rsi	; tmp195,
	leaq	.LC52(%rip), %rax	;, tmp196
	movq	%rax, %rdi	; tmp196,
	call	*parser_error@GOTPCREL(%rip)	;
.L149:
; src/parser.c:477:         list_append(body, (pointer)statement);
	movq	-80(%rbp), %rdx	; statement, tmp197
	movq	-24(%rbp), %rax	; body, tmp198
	movq	%rdx, %rsi	; tmp197,
	movq	%rax, %rdi	; tmp198,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:478:         token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp199
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp199,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp200, token
.L148:
; src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp201
	movl	24(%rax), %eax	; token_74->type, _23
; src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _23
	jne	.L150	;,
; src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rdx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.65_24
	movq	-8(%rbp), %rax	; token, tmp202
	movq	(%rax), %rax	; token_74->lexeme, _25
	movq	%rdx, %rsi	; R_BRACE_SYMBOL.65_24,
	movq	%rax, %rdi	; _25,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; _26
	je	.L150	;,
; src/parser.c:480:     list(ElseIf*) else_if = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp203, else_if
; src/parser.c:481:     list(Statement*) else_body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp204, else_body
; src/parser.c:482:     token = peek_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp205
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp205,
	call	*peek_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp206, token
; src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	jmp	.L151	;
.L163:
; src/parser.c:484:         token = get_next_token(lexer, true);  // consume 'elif'
	movq	-88(%rbp), %rax	; lexer, tmp207
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp207,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp208, token
; src/parser.c:485:         token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp209
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp209,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp210, token
; src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp211
	movl	24(%rax), %eax	; token_136->type, _27
; src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _27
	jne	.L152	;,
; src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rdx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.66_28
	movq	-8(%rbp), %rax	; token, tmp212
	movq	(%rax), %rax	; token_136->lexeme, _29
	movq	%rdx, %rsi	; L_PAREN_SYMBOL.66_28,
	movq	%rax, %rdi	; _29,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; _30
	jne	.L153	;,
.L152:
; src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp213
	movq	(%rax), %rax	; parser_110(D)->source_file, _31
	movq	%rax, %rdi	; _31,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _32
; src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp214
	movq	%rax, %rsi	; tmp214,
	leaq	.LC53(%rip), %rax	;, tmp215
	movq	%rax, %rdi	; tmp215,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:489:             return NULL;
	movl	$0, %eax	;, _78
	jmp	.L142	;
.L153:
; src/parser.c:491:         token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp216
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp216,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp217, token
; src/parser.c:492:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	-104(%rbp), %rdx	; parser, tmp218
	movq	-96(%rbp), %rcx	; now_scope, tmp219
	movq	-88(%rbp), %rax	; lexer, tmp220
	movq	%rcx, %rsi	; tmp219,
	movq	%rax, %rdi	; tmp220,
	call	parse_expression	;
	movq	%rax, -48(%rbp)	; tmp221, elif_condition
; src/parser.c:493:         if (elif_condition == NULL)
	cmpq	$0, -48(%rbp)	;, elif_condition
	jne	.L154	;,
; src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp222
	movq	(%rax), %rax	; parser_110(D)->source_file, _33
	movq	%rax, %rdi	; _33,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _34
; src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp223
	movq	%rax, %rsi	; tmp223,
	leaq	.LC54(%rip), %rax	;, tmp224
	movq	%rax, %rdi	; tmp224,
	call	*parser_error@GOTPCREL(%rip)	;
.L154:
; src/parser.c:495:         token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp225
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp225,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp226, token
; src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp227
	movl	24(%rax), %eax	; token_145->type, _35
; src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _35
	jne	.L155	;,
; src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.67_36
	movq	-8(%rbp), %rax	; token, tmp228
	movq	(%rax), %rax	; token_145->lexeme, _37
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.67_36,
	movq	%rax, %rdi	; _37,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _38
	jne	.L156	;,
.L155:
; src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp229
	movq	(%rax), %rax	; parser_110(D)->source_file, _39
	movq	%rax, %rdi	; _39,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _40
; src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp230
	movq	%rax, %rsi	; tmp230,
	leaq	.LC55(%rip), %rax	;, tmp231
	movq	%rax, %rdi	; tmp231,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:499:             return NULL;
	movl	$0, %eax	;, _78
	jmp	.L142	;
.L156:
; src/parser.c:501:         token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp232
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp232,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp233, token
; src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp234
	movl	24(%rax), %eax	; token_148->type, _41
; src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _41
	jne	.L157	;,
; src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rdx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.68_42
	movq	-8(%rbp), %rax	; token, tmp235
	movq	(%rax), %rax	; token_148->lexeme, _43
	movq	%rdx, %rsi	; L_BRACE_SYMBOL.68_42,
	movq	%rax, %rdi	; _43,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; _44
	jne	.L158	;,
.L157:
; src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp236
	movq	(%rax), %rax	; parser_110(D)->source_file, _45
	movq	%rax, %rdi	; _45,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _46
; src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp237
	movq	%rax, %rsi	; tmp237,
	leaq	.LC56(%rip), %rax	;, tmp238
	movq	%rax, %rdi	; tmp238,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:505:             return NULL;
	movl	$0, %eax	;, _78
	jmp	.L142	;
.L158:
; src/parser.c:507:         list(Statement*) elif_body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, -56(%rbp)	; tmp239, elif_body
; src/parser.c:508:         token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp240
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp240,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp241, token
; src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L159	;
.L161:
; src/parser.c:510:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	-104(%rbp), %rdx	; parser, tmp242
	movq	-96(%rbp), %rcx	; now_scope, tmp243
	movq	-88(%rbp), %rax	; lexer, tmp244
	movq	%rcx, %rsi	; tmp243,
	movq	%rax, %rdi	; tmp244,
	call	parse_statement	;
	movq	%rax, -64(%rbp)	; tmp245, statement
; src/parser.c:511:             if (statement == NULL)
	cmpq	$0, -64(%rbp)	;, statement
	jne	.L160	;,
; src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp246
	movq	(%rax), %rax	; parser_110(D)->source_file, _47
	movq	%rax, %rdi	; _47,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _48
; src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp247
	movq	%rax, %rsi	; tmp247,
	leaq	.LC57(%rip), %rax	;, tmp248
	movq	%rax, %rdi	; tmp248,
	call	*parser_error@GOTPCREL(%rip)	;
.L160:
; src/parser.c:513:             list_append(elif_body, (pointer)statement);
	movq	-64(%rbp), %rdx	; statement, tmp249
	movq	-56(%rbp), %rax	; elif_body, tmp250
	movq	%rdx, %rsi	; tmp249,
	movq	%rax, %rdi	; tmp250,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:514:             token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp251
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp251,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp252, token
.L159:
; src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp253
	movl	24(%rax), %eax	; token_75->type, _49
; src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _49
	jne	.L161	;,
; src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rdx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.69_50
	movq	-8(%rbp), %rax	; token, tmp254
	movq	(%rax), %rax	; token_75->lexeme, _51
	movq	%rdx, %rsi	; R_BRACE_SYMBOL.69_50,
	movq	%rax, %rdi	; _51,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; _52
	je	.L161	;,
; src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	-56(%rbp), %rdx	; elif_body, tmp255
	movq	-48(%rbp), %rax	; elif_condition, tmp256
	movq	%rdx, %rsi	; tmp255,
	movq	%rax, %rdi	; tmp256,
	call	*create_else_if@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _53
; src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	-32(%rbp), %rax	; else_if, tmp257
	movq	%rdx, %rsi	; _53,
	movq	%rax, %rdi	; tmp257,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:517:         token = peek_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp258
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp258,
	call	*peek_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp259, token
.L151:
; src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	movq	-8(%rbp), %rax	; token, tmp260
	movl	24(%rax), %eax	; token_76->type, _54
; src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, %eax	;, _54
	jne	.L162	;,
; src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	movq	ELIF_KEYWORD(%rip), %rdx	; ELIF_KEYWORD, ELIF_KEYWORD.70_55
	movq	-8(%rbp), %rax	; token, tmp261
	movq	(%rax), %rax	; token_76->lexeme, _56
	movq	%rdx, %rsi	; ELIF_KEYWORD.70_55,
	movq	%rax, %rdi	; _56,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	; _57
	jne	.L163	;,
.L162:
; src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	movq	-8(%rbp), %rax	; token, tmp262
	movl	24(%rax), %eax	; token_76->type, _58
; src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, %eax	;, _58
	jne	.L164	;,
; src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	movq	ELSE_KEYWORD(%rip), %rdx	; ELSE_KEYWORD, ELSE_KEYWORD.71_59
	movq	-8(%rbp), %rax	; token, tmp263
	movq	(%rax), %rax	; token_76->lexeme, _60
	movq	%rdx, %rsi	; ELSE_KEYWORD.71_59,
	movq	%rax, %rdi	; _60,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	; _61
	je	.L164	;,
; src/parser.c:520:         token = get_next_token(lexer, true);  // consume 'else'
	movq	-88(%rbp), %rax	; lexer, tmp264
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp264,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp265, token
; src/parser.c:521:         token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp266
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp266,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp267, token
; src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp268
	movl	24(%rax), %eax	; token_179->type, _62
; src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _62
	jne	.L165	;,
; src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rdx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.72_63
	movq	-8(%rbp), %rax	; token, tmp269
	movq	(%rax), %rax	; token_179->lexeme, _64
	movq	%rdx, %rsi	; L_BRACE_SYMBOL.72_63,
	movq	%rax, %rdi	; _64,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; _65
	jne	.L166	;,
.L165:
; src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp270
	movq	(%rax), %rax	; parser_110(D)->source_file, _66
	movq	%rax, %rdi	; _66,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _67
; src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp271
	movq	%rax, %rsi	; tmp271,
	leaq	.LC58(%rip), %rax	;, tmp272
	movq	%rax, %rdi	; tmp272,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:525:             return NULL;
	movl	$0, %eax	;, _78
	jmp	.L142	;
.L166:
; src/parser.c:527:         token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp273
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp273,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp274, token
; src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L167	;
.L169:
; src/parser.c:529:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	-104(%rbp), %rdx	; parser, tmp275
	movq	-96(%rbp), %rcx	; now_scope, tmp276
	movq	-88(%rbp), %rax	; lexer, tmp277
	movq	%rcx, %rsi	; tmp276,
	movq	%rax, %rdi	; tmp277,
	call	parse_statement	;
	movq	%rax, -72(%rbp)	; tmp278, statement
; src/parser.c:530:             if (statement == NULL)
	cmpq	$0, -72(%rbp)	;, statement
	jne	.L168	;,
; src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	-104(%rbp), %rax	; parser, tmp279
	movq	(%rax), %rax	; parser_110(D)->source_file, _68
	movq	%rax, %rdi	; _68,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _69
; src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp280
	movq	%rax, %rsi	; tmp280,
	leaq	.LC59(%rip), %rax	;, tmp281
	movq	%rax, %rdi	; tmp281,
	call	*parser_error@GOTPCREL(%rip)	;
.L168:
; src/parser.c:532:             list_append(else_body, (pointer)statement);
	movq	-72(%rbp), %rdx	; statement, tmp282
	movq	-40(%rbp), %rax	; else_body, tmp283
	movq	%rdx, %rsi	; tmp282,
	movq	%rax, %rdi	; tmp283,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:533:             token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp284
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp284,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp285, token
.L167:
; src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp286
	movl	24(%rax), %eax	; token_77->type, _70
; src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _70
	jne	.L169	;,
; src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rdx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.73_71
	movq	-8(%rbp), %rax	; token, tmp287
	movq	(%rax), %rax	; token_77->lexeme, _72
	movq	%rdx, %rsi	; R_BRACE_SYMBOL.73_71,
	movq	%rax, %rdi	; _72,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; _73
	je	.L169	;,
.L164:
; src/parser.c:536:     token = peek_current_token(lexer);
	movq	-88(%rbp), %rax	; lexer, tmp288
	movq	%rax, %rdi	; tmp288,
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp289, token
; src/parser.c:538:     return create_if(condition, body, else_if, else_body);
	movq	-40(%rbp), %rcx	; else_body, tmp290
	movq	-32(%rbp), %rdx	; else_if, tmp291
	movq	-24(%rbp), %rsi	; body, tmp292
	movq	-16(%rbp), %rax	; condition, tmp293
	movq	%rax, %rdi	; tmp293,
	call	*create_if@GOTPCREL(%rip)	;
.L142:
; src/parser.c:539: }
	leave	
	ret	
	.size	parse_if, .-parse_if
	.section	.rodata
.LC60:
	.string	"Expected '(' after 'for'"
	.align 8
.LC61:
	.string	"Failed to parse for loop initializer"
	.align 8
.LC62:
	.string	"Expected ';' after for loop initializer"
	.align 8
.LC63:
	.string	"Failed to parse for loop condition"
	.align 8
.LC64:
	.string	"Expected ';' after for loop condition"
	.align 8
.LC65:
	.string	"Failed to parse for loop increment"
	.align 8
.LC66:
	.string	"Expected ')' after for loop increment"
	.align 8
.LC67:
	.string	"Expected '{' to start for loop body"
	.align 8
.LC68:
	.string	"Failed to parse for loop body statement"
	.text
	.type	parse_for, @function
parse_for:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$80, %rsp	;,
	movq	%rdi, -56(%rbp)	; lexer, lexer
	movq	%rsi, -64(%rbp)	; now_scope, now_scope
	movq	%rdx, -72(%rbp)	; parser, parser
; src/parser.c:542:     Token* token = NULL;
	movq	$0, -8(%rbp)	;, token
; src/parser.c:543:     token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp138
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp138,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp139, token
; src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp140
	movl	24(%rax), %eax	; token_85->type, _1
; src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _1
	jne	.L171	;,
; src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rdx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.74_2
	movq	-8(%rbp), %rax	; token, tmp141
	movq	(%rax), %rax	; token_85->lexeme, _3
	movq	%rdx, %rsi	; L_PAREN_SYMBOL.74_2,
	movq	%rax, %rdi	; _3,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; _4
	jne	.L172	;,
.L171:
; src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	-72(%rbp), %rax	; parser, tmp142
	movq	(%rax), %rax	; parser_92(D)->source_file, _5
	movq	%rax, %rdi	; _5,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _6
; src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp143
	movq	%rax, %rsi	; tmp143,
	leaq	.LC60(%rip), %rax	;, tmp144
	movq	%rax, %rdi	; tmp144,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:547:         return NULL;
	movl	$0, %eax	;, _62
	jmp	.L173	;
.L172:
; src/parser.c:549:     token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp145
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp145,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp146, token
; src/parser.c:550:     Variable* initializer = NULL;
	movq	$0, -16(%rbp)	;, initializer
; src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp147
	movl	24(%rax), %eax	; token_88->type, _7
; src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	;, _7
	jne	.L174	;,
; src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	SEMICOLON_SYMBOL(%rip), %rdx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.75_8
	movq	-8(%rbp), %rax	; token, tmp148
	movq	(%rax), %rax	; token_88->lexeme, _9
	movq	%rdx, %rsi	; SEMICOLON_SYMBOL.75_8,
	movq	%rax, %rdi	; _9,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; _10
	jne	.L175	;,
.L174:
; src/parser.c:552:         initializer = parse_variable(lexer, now_scope, parser);
	movq	-72(%rbp), %rdx	; parser, tmp149
	movq	-64(%rbp), %rcx	; now_scope, tmp150
	movq	-56(%rbp), %rax	; lexer, tmp151
	movq	%rcx, %rsi	; tmp150,
	movq	%rax, %rdi	; tmp151,
	call	parse_variable	;
	movq	%rax, -16(%rbp)	; tmp152, initializer
; src/parser.c:553:         if (initializer == NULL)
	cmpq	$0, -16(%rbp)	;, initializer
	jne	.L176	;,
; src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	-72(%rbp), %rax	; parser, tmp153
	movq	(%rax), %rax	; parser_92(D)->source_file, _11
	movq	%rax, %rdi	; _11,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _12
; src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp154
	movq	%rax, %rsi	; tmp154,
	leaq	.LC61(%rip), %rax	;, tmp155
	movq	%rax, %rdi	; tmp155,
	call	*parser_error@GOTPCREL(%rip)	;
.L176:
; src/parser.c:555:         token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp156
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp156,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp157, token
.L175:
; src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp158
	movl	24(%rax), %eax	; token_55->type, _13
; src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	;, _13
	jne	.L177	;,
; src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	SEMICOLON_SYMBOL(%rip), %rdx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.76_14
	movq	-8(%rbp), %rax	; token, tmp159
	movq	(%rax), %rax	; token_55->lexeme, _15
	movq	%rdx, %rsi	; SEMICOLON_SYMBOL.76_14,
	movq	%rax, %rdi	; _15,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; _16
	jne	.L178	;,
.L177:
; src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	-72(%rbp), %rax	; parser, tmp160
	movq	(%rax), %rax	; parser_92(D)->source_file, _17
	movq	%rax, %rdi	; _17,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _18
; src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp161
	movq	%rax, %rsi	; tmp161,
	leaq	.LC62(%rip), %rax	;, tmp162
	movq	%rax, %rdi	; tmp162,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:560:         return NULL;
	movl	$0, %eax	;, _62
	jmp	.L173	;
.L178:
; src/parser.c:562:     token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp163
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp163,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp164, token
; src/parser.c:563:     Expression* condition = NULL;
	movq	$0, -24(%rbp)	;, condition
; src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp165
	movl	24(%rax), %eax	; token_101->type, _19
; src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	;, _19
	jne	.L179	;,
; src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	SEMICOLON_SYMBOL(%rip), %rdx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.77_20
	movq	-8(%rbp), %rax	; token, tmp166
	movq	(%rax), %rax	; token_101->lexeme, _21
	movq	%rdx, %rsi	; SEMICOLON_SYMBOL.77_20,
	movq	%rax, %rdi	; _21,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; _22
	jne	.L180	;,
.L179:
; src/parser.c:565:         condition = parse_expression(lexer, now_scope, parser);
	movq	-72(%rbp), %rdx	; parser, tmp167
	movq	-64(%rbp), %rcx	; now_scope, tmp168
	movq	-56(%rbp), %rax	; lexer, tmp169
	movq	%rcx, %rsi	; tmp168,
	movq	%rax, %rdi	; tmp169,
	call	parse_expression	;
	movq	%rax, -24(%rbp)	; tmp170, condition
; src/parser.c:566:         if (condition == NULL)
	cmpq	$0, -24(%rbp)	;, condition
	jne	.L181	;,
; src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	-72(%rbp), %rax	; parser, tmp171
	movq	(%rax), %rax	; parser_92(D)->source_file, _23
	movq	%rax, %rdi	; _23,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _24
; src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp172
	movq	%rax, %rsi	; tmp172,
	leaq	.LC63(%rip), %rax	;, tmp173
	movq	%rax, %rdi	; tmp173,
	call	*parser_error@GOTPCREL(%rip)	;
.L181:
; src/parser.c:568:         token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp174
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp174,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp175, token
.L180:
; src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp176
	movl	24(%rax), %eax	; token_56->type, _25
; src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	;, _25
	jne	.L182	;,
; src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	SEMICOLON_SYMBOL(%rip), %rdx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.78_26
	movq	-8(%rbp), %rax	; token, tmp177
	movq	(%rax), %rax	; token_56->lexeme, _27
	movq	%rdx, %rsi	; SEMICOLON_SYMBOL.78_26,
	movq	%rax, %rdi	; _27,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; _28
	jne	.L183	;,
.L182:
; src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	-72(%rbp), %rax	; parser, tmp178
	movq	(%rax), %rax	; parser_92(D)->source_file, _29
	movq	%rax, %rdi	; _29,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _30
; src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp179
	movq	%rax, %rsi	; tmp179,
	leaq	.LC64(%rip), %rax	;, tmp180
	movq	%rax, %rdi	; tmp180,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:573:         return NULL;
	movl	$0, %eax	;, _62
	jmp	.L173	;
.L183:
; src/parser.c:575:     token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp181
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp181,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp182, token
; src/parser.c:576:     Expression* increment = NULL;
	movq	$0, -32(%rbp)	;, increment
; src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp183
	movl	24(%rax), %eax	; token_112->type, _31
; src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _31
	jne	.L184	;,
; src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.79_32
	movq	-8(%rbp), %rax	; token, tmp184
	movq	(%rax), %rax	; token_112->lexeme, _33
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.79_32,
	movq	%rax, %rdi	; _33,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _34
	jne	.L185	;,
.L184:
; src/parser.c:578:         increment = parse_expression(lexer, now_scope, parser);
	movq	-72(%rbp), %rdx	; parser, tmp185
	movq	-64(%rbp), %rcx	; now_scope, tmp186
	movq	-56(%rbp), %rax	; lexer, tmp187
	movq	%rcx, %rsi	; tmp186,
	movq	%rax, %rdi	; tmp187,
	call	parse_expression	;
	movq	%rax, -32(%rbp)	; tmp188, increment
; src/parser.c:579:         if (increment == NULL)
	cmpq	$0, -32(%rbp)	;, increment
	jne	.L186	;,
; src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	-72(%rbp), %rax	; parser, tmp189
	movq	(%rax), %rax	; parser_92(D)->source_file, _35
	movq	%rax, %rdi	; _35,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _36
; src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp190
	movq	%rax, %rsi	; tmp190,
	leaq	.LC65(%rip), %rax	;, tmp191
	movq	%rax, %rdi	; tmp191,
	call	*parser_error@GOTPCREL(%rip)	;
.L186:
; src/parser.c:581:         token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp192
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp192,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp193, token
.L185:
; src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp194
	movl	24(%rax), %eax	; token_57->type, _37
; src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _37
	jne	.L187	;,
; src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.80_38
	movq	-8(%rbp), %rax	; token, tmp195
	movq	(%rax), %rax	; token_57->lexeme, _39
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.80_38,
	movq	%rax, %rdi	; _39,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _40
	jne	.L188	;,
.L187:
; src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	-72(%rbp), %rax	; parser, tmp196
	movq	(%rax), %rax	; parser_92(D)->source_file, _41
	movq	%rax, %rdi	; _41,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _42
; src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp197
	movq	%rax, %rsi	; tmp197,
	leaq	.LC66(%rip), %rax	;, tmp198
	movq	%rax, %rdi	; tmp198,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:586:         return NULL;
	movl	$0, %eax	;, _62
	jmp	.L173	;
.L188:
; src/parser.c:588:     token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp199
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp199,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp200, token
; src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp201
	movl	24(%rax), %eax	; token_123->type, _43
; src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _43
	jne	.L189	;,
; src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rdx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.81_44
	movq	-8(%rbp), %rax	; token, tmp202
	movq	(%rax), %rax	; token_123->lexeme, _45
	movq	%rdx, %rsi	; L_BRACE_SYMBOL.81_44,
	movq	%rax, %rdi	; _45,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; _46
	jne	.L190	;,
.L189:
; src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	-72(%rbp), %rax	; parser, tmp203
	movq	(%rax), %rax	; parser_92(D)->source_file, _47
	movq	%rax, %rdi	; _47,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _48
; src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp204
	movq	%rax, %rsi	; tmp204,
	leaq	.LC67(%rip), %rax	;, tmp205
	movq	%rax, %rdi	; tmp205,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:592:         return NULL;
	movl	$0, %eax	;, _62
	jmp	.L173	;
.L190:
; src/parser.c:594:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp206, body
; src/parser.c:595:     parser->in_loop = true;
	movq	-72(%rbp), %rax	; parser, tmp207
	movb	$1, 11(%rax)	;, parser_92(D)->in_loop
; src/parser.c:596:     token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp208
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp208,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp209, token
; src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L191	;
.L193:
; src/parser.c:598:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	-72(%rbp), %rdx	; parser, tmp210
	movq	-64(%rbp), %rcx	; now_scope, tmp211
	movq	-56(%rbp), %rax	; lexer, tmp212
	movq	%rcx, %rsi	; tmp211,
	movq	%rax, %rdi	; tmp212,
	call	parse_statement	;
	movq	%rax, -48(%rbp)	; tmp213, statement
; src/parser.c:599:         if (statement == NULL)
	cmpq	$0, -48(%rbp)	;, statement
	jne	.L192	;,
; src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	-72(%rbp), %rax	; parser, tmp214
	movq	(%rax), %rax	; parser_92(D)->source_file, _49
	movq	%rax, %rdi	; _49,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _50
; src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp215
	movq	%rax, %rsi	; tmp215,
	leaq	.LC68(%rip), %rax	;, tmp216
	movq	%rax, %rdi	; tmp216,
	call	*parser_error@GOTPCREL(%rip)	;
.L192:
; src/parser.c:601:         list_append(body, (pointer)statement);
	movq	-48(%rbp), %rdx	; statement, tmp217
	movq	-40(%rbp), %rax	; body, tmp218
	movq	%rdx, %rsi	; tmp217,
	movq	%rax, %rdi	; tmp218,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:602:         token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp219
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp219,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp220, token
.L191:
; src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp221
	movl	24(%rax), %eax	; token_58->type, _51
; src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _51
	jne	.L193	;,
; src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rdx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.82_52
	movq	-8(%rbp), %rax	; token, tmp222
	movq	(%rax), %rax	; token_58->lexeme, _53
	movq	%rdx, %rsi	; R_BRACE_SYMBOL.82_52,
	movq	%rax, %rdi	; _53,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; _54
	je	.L193	;,
; src/parser.c:604:     parser->in_loop = false;
	movq	-72(%rbp), %rax	; parser, tmp223
	movb	$0, 11(%rax)	;, parser_92(D)->in_loop
; src/parser.c:606:     return create_for(initializer, condition, increment, body);
	movq	-40(%rbp), %rcx	; body, tmp224
	movq	-32(%rbp), %rdx	; increment, tmp225
	movq	-24(%rbp), %rsi	; condition, tmp226
	movq	-16(%rbp), %rax	; initializer, tmp227
	movq	%rax, %rdi	; tmp227,
	call	*create_for@GOTPCREL(%rip)	;
.L173:
; src/parser.c:607: }
	leave	
	ret	
	.size	parse_for, .-parse_for
	.section	.rodata
.LC69:
	.string	"Expected '(' after 'while'"
	.align 8
.LC70:
	.string	"Failed to parse while condition"
	.align 8
.LC71:
	.string	"Expected ')' after while condition"
	.align 8
.LC72:
	.string	"Expected '{' to start while body"
	.align 8
.LC73:
	.string	"Failed to parse while body statement"
	.text
	.type	parse_while, @function
parse_while:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -40(%rbp)	; lexer, lexer
	movq	%rsi, -48(%rbp)	; now_scope, now_scope
	movq	%rdx, -56(%rbp)	; parser, parser
; src/parser.c:610:     Token* token = NULL;
	movq	$0, -8(%rbp)	;, token
; src/parser.c:611:     token = get_next_token(lexer, true);
	movq	-40(%rbp), %rax	; lexer, tmp110
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp110,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp111, token
; src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp112
	movl	24(%rax), %eax	; token_41->type, _1
; src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _1
	jne	.L195	;,
; src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rdx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.83_2
	movq	-8(%rbp), %rax	; token, tmp113
	movq	(%rax), %rax	; token_41->lexeme, _3
	movq	%rdx, %rsi	; L_PAREN_SYMBOL.83_2,
	movq	%rax, %rdi	; _3,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; _4
	jne	.L196	;,
.L195:
; src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	-56(%rbp), %rax	; parser, tmp114
	movq	(%rax), %rax	; parser_46(D)->source_file, _5
	movq	%rax, %rdi	; _5,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _6
; src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp115
	movq	%rax, %rsi	; tmp115,
	leaq	.LC69(%rip), %rax	;, tmp116
	movq	%rax, %rdi	; tmp116,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:615:         return NULL;
	movl	$0, %eax	;, _28
	jmp	.L197	;
.L196:
; src/parser.c:617:     token = get_next_token(lexer, true);
	movq	-40(%rbp), %rax	; lexer, tmp117
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp117,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp118, token
; src/parser.c:618:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	-56(%rbp), %rdx	; parser, tmp119
	movq	-48(%rbp), %rcx	; now_scope, tmp120
	movq	-40(%rbp), %rax	; lexer, tmp121
	movq	%rcx, %rsi	; tmp120,
	movq	%rax, %rdi	; tmp121,
	call	parse_expression	;
	movq	%rax, -16(%rbp)	; tmp122, condition
; src/parser.c:619:     if (condition == NULL)
	cmpq	$0, -16(%rbp)	;, condition
	jne	.L198	;,
; src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	-56(%rbp), %rax	; parser, tmp123
	movq	(%rax), %rax	; parser_46(D)->source_file, _7
	movq	%rax, %rdi	; _7,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _8
; src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp124
	movq	%rax, %rsi	; tmp124,
	leaq	.LC70(%rip), %rax	;, tmp125
	movq	%rax, %rdi	; tmp125,
	call	*parser_error@GOTPCREL(%rip)	;
.L198:
; src/parser.c:621:     token = get_next_token(lexer, true);
	movq	-40(%rbp), %rax	; lexer, tmp126
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp126,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp127, token
; src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp128
	movl	24(%rax), %eax	; token_52->type, _9
; src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _9
	jne	.L199	;,
; src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.84_10
	movq	-8(%rbp), %rax	; token, tmp129
	movq	(%rax), %rax	; token_52->lexeme, _11
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.84_10,
	movq	%rax, %rdi	; _11,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _12
	jne	.L200	;,
.L199:
; src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	-56(%rbp), %rax	; parser, tmp130
	movq	(%rax), %rax	; parser_46(D)->source_file, _13
	movq	%rax, %rdi	; _13,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _14
; src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp131
	movq	%rax, %rsi	; tmp131,
	leaq	.LC71(%rip), %rax	;, tmp132
	movq	%rax, %rdi	; tmp132,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:625:         return NULL;
	movl	$0, %eax	;, _28
	jmp	.L197	;
.L200:
; src/parser.c:627:     token = get_next_token(lexer, true);
	movq	-40(%rbp), %rax	; lexer, tmp133
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp133,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp134, token
; src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp135
	movl	24(%rax), %eax	; token_55->type, _15
; src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _15
	jne	.L201	;,
; src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rdx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.85_16
	movq	-8(%rbp), %rax	; token, tmp136
	movq	(%rax), %rax	; token_55->lexeme, _17
	movq	%rdx, %rsi	; L_BRACE_SYMBOL.85_16,
	movq	%rax, %rdi	; _17,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; _18
	jne	.L202	;,
.L201:
; src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	-56(%rbp), %rax	; parser, tmp137
	movq	(%rax), %rax	; parser_46(D)->source_file, _19
	movq	%rax, %rdi	; _19,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _20
; src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp138
	movq	%rax, %rsi	; tmp138,
	leaq	.LC72(%rip), %rax	;, tmp139
	movq	%rax, %rdi	; tmp139,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:631:         return NULL;
	movl	$0, %eax	;, _28
	jmp	.L197	;
.L202:
; src/parser.c:633:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp140, body
; src/parser.c:634:     parser->in_loop = true;
	movq	-56(%rbp), %rax	; parser, tmp141
	movb	$1, 11(%rax)	;, parser_46(D)->in_loop
; src/parser.c:635:     token = get_next_token(lexer, true);
	movq	-40(%rbp), %rax	; lexer, tmp142
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp142,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp143, token
; src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L203	;
.L205:
; src/parser.c:637:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	-56(%rbp), %rdx	; parser, tmp144
	movq	-48(%rbp), %rcx	; now_scope, tmp145
	movq	-40(%rbp), %rax	; lexer, tmp146
	movq	%rcx, %rsi	; tmp145,
	movq	%rax, %rdi	; tmp146,
	call	parse_statement	;
	movq	%rax, -32(%rbp)	; tmp147, statement
; src/parser.c:638:         if (statement == NULL)
	cmpq	$0, -32(%rbp)	;, statement
	jne	.L204	;,
; src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	-56(%rbp), %rax	; parser, tmp148
	movq	(%rax), %rax	; parser_46(D)->source_file, _21
	movq	%rax, %rdi	; _21,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _22
; src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp149
	movq	%rax, %rsi	; tmp149,
	leaq	.LC73(%rip), %rax	;, tmp150
	movq	%rax, %rdi	; tmp150,
	call	*parser_error@GOTPCREL(%rip)	;
.L204:
; src/parser.c:640:         list_append(body, (pointer)statement);
	movq	-32(%rbp), %rdx	; statement, tmp151
	movq	-24(%rbp), %rax	; body, tmp152
	movq	%rdx, %rsi	; tmp151,
	movq	%rax, %rdi	; tmp152,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:641:         token = get_next_token(lexer, true);
	movq	-40(%rbp), %rax	; lexer, tmp153
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp153,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp154, token
.L203:
; src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp155
	movl	24(%rax), %eax	; token_27->type, _23
; src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _23
	jne	.L205	;,
; src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rdx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.86_24
	movq	-8(%rbp), %rax	; token, tmp156
	movq	(%rax), %rax	; token_27->lexeme, _25
	movq	%rdx, %rsi	; R_BRACE_SYMBOL.86_24,
	movq	%rax, %rdi	; _25,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; _26
	je	.L205	;,
; src/parser.c:643:     parser->in_loop = false;
	movq	-56(%rbp), %rax	; parser, tmp157
	movb	$0, 11(%rax)	;, parser_46(D)->in_loop
; src/parser.c:645:     return create_while(condition, body);
	movq	-24(%rbp), %rdx	; body, tmp158
	movq	-16(%rbp), %rax	; condition, tmp159
	movq	%rdx, %rsi	; tmp158,
	movq	%rax, %rdi	; tmp159,
	call	*create_while@GOTPCREL(%rip)	;
.L197:
; src/parser.c:646: }
	leave	
	ret	
	.size	parse_while, .-parse_while
	.section	.rodata
.LC74:
	.string	"Failed to parse right operand"
	.text
	.type	parse_expr_prec, @function
parse_expr_prec:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$96, %rsp	;,
	movq	%rdi, -56(%rbp)	; lexer, lexer
	movq	%rsi, -64(%rbp)	; expr_left, expr_left
	movl	%edx, -68(%rbp)	; min_prec, min_prec
	movq	%rcx, -80(%rbp)	; now_scope, now_scope
	movq	%r8, -88(%rbp)	; parser, parser
; src/parser.c:649:     Token* token = NULL;
	movq	$0, -8(%rbp)	;, token
; src/parser.c:650:     token = peek_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp90
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp90,
	call	*peek_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp91, token
; src/parser.c:651:     while (token->type == SYMBOL) {
	jmp	.L207	;
.L215:
; src/parser.c:652:         OperatorType op = string_to_operator(token->lexeme);
	movq	-8(%rbp), %rax	; token, tmp92
	movq	(%rax), %rax	; token_9->lexeme, _1
	movq	%rax, %rdi	; _1,
	call	*string_to_operator@GOTPCREL(%rip)	;
	movl	%eax, -20(%rbp)	; tmp93, op
; src/parser.c:653:         int op_prec = operator_precedence(op);
	movl	-20(%rbp), %eax	; op, tmp94
	movl	%eax, %edi	; tmp94,
	call	*operator_precedence@GOTPCREL(%rip)	;
	movl	%eax, -24(%rbp)	; tmp95, op_prec
; src/parser.c:654:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, -20(%rbp)	;, op
	je	.L208	;,
; src/parser.c:654:         if (op == OP_NONE || op_prec < min_prec)
	movl	-24(%rbp), %eax	; op_prec, tmp96
	cmpl	-68(%rbp), %eax	; min_prec, tmp96
	jl	.L208	;,
; src/parser.c:656:         token = get_next_token(lexer, true);  // consume operator
	movq	-56(%rbp), %rax	; lexer, tmp97
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp97,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp98, token
; src/parser.c:657:         token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp99
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp99,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp100, token
; src/parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	-88(%rbp), %rdx	; parser, tmp101
	movq	-80(%rbp), %rcx	; now_scope, tmp102
	movq	-56(%rbp), %rax	; lexer, tmp103
	movq	%rcx, %rsi	; tmp102,
	movq	%rax, %rdi	; tmp103,
	call	parse_primary	;
	movq	%rax, -32(%rbp)	; tmp104, right_primary
; src/parser.c:659:         if (right_primary == NULL) {
	cmpq	$0, -32(%rbp)	;, right_primary
	jne	.L209	;,
; src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	-88(%rbp), %rax	; parser, tmp105
	movq	(%rax), %rax	; parser_33(D)->source_file, _2
	movq	%rax, %rdi	; _2,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _3
; src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp106
	movq	%rax, %rsi	; tmp106,
	leaq	.LC74(%rip), %rax	;, tmp107
	movq	%rax, %rdi	; tmp107,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:662:             return NULL;
	movl	$0, %eax	;, _11
	jmp	.L210	;
.L209:
; src/parser.c:664:         Expression* right = create_expression(OP_NONE, NULL, right_primary, NULL);
	movq	-32(%rbp), %rax	; right_primary, tmp108
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; tmp108,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp109, right
; src/parser.c:665:         token = peek_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp110
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp110,
	call	*peek_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp111, token
; src/parser.c:666:         while (token->type == SYMBOL) {
	jmp	.L211	;
.L214:
; src/parser.c:667:             OperatorType next_op = string_to_operator(token->lexeme);
	movq	-8(%rbp), %rax	; token, tmp112
	movq	(%rax), %rax	; token_8->lexeme, _4
	movq	%rax, %rdi	; _4,
	call	*string_to_operator@GOTPCREL(%rip)	;
	movl	%eax, -36(%rbp)	; tmp113, next_op
; src/parser.c:668:             int next_prec = operator_precedence(next_op);
	movl	-36(%rbp), %eax	; next_op, tmp114
	movl	%eax, %edi	; tmp114,
	call	*operator_precedence@GOTPCREL(%rip)	;
	movl	%eax, -40(%rbp)	; tmp115, next_prec
; src/parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, -36(%rbp)	;, next_op
	je	.L212	;,
; src/parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	movl	-40(%rbp), %eax	; next_prec, tmp116
	cmpl	-24(%rbp), %eax	; op_prec, tmp116
	jle	.L212	;,
; src/parser.c:671:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	-88(%rbp), %rdi	; parser, tmp117
	movq	-80(%rbp), %rcx	; now_scope, tmp118
	movl	-40(%rbp), %edx	; next_prec, tmp119
	movq	-16(%rbp), %rsi	; right, tmp120
	movq	-56(%rbp), %rax	; lexer, tmp121
	movq	%rdi, %r8	; tmp117,
	movq	%rax, %rdi	; tmp121,
	call	parse_expr_prec	;
	movq	%rax, -16(%rbp)	; tmp122, right
; src/parser.c:672:             if (right == NULL) {
	cmpq	$0, -16(%rbp)	;, right
	jne	.L213	;,
; src/parser.c:674:                 return NULL;
	movl	$0, %eax	;, _11
	jmp	.L210	;
.L213:
; src/parser.c:676:             token = peek_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp123
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp123,
	call	*peek_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp124, token
.L211:
; src/parser.c:666:         while (token->type == SYMBOL) {
	movq	-8(%rbp), %rax	; token, tmp125
	movl	24(%rax), %eax	; token_8->type, _5
; src/parser.c:666:         while (token->type == SYMBOL) {
	cmpl	$5, %eax	;, _5
	je	.L214	;,
.L212:
; src/parser.c:678:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	-16(%rbp), %rdx	; right, tmp126
	movq	-64(%rbp), %rsi	; expr_left, tmp127
	movl	-20(%rbp), %eax	; op, tmp128
	movq	%rdx, %rcx	; tmp126,
	movl	$0, %edx	;,
	movl	%eax, %edi	; tmp128,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, -64(%rbp)	; tmp129, expr_left
; src/parser.c:679:         token = peek_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp130
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp130,
	call	*peek_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp131, token
.L207:
; src/parser.c:651:     while (token->type == SYMBOL) {
	movq	-8(%rbp), %rax	; token, tmp132
	movl	24(%rax), %eax	; token_9->type, _6
; src/parser.c:651:     while (token->type == SYMBOL) {
	cmpl	$5, %eax	;, _6
	je	.L215	;,
.L208:
; src/parser.c:681:     token = peek_current_token(lexer);
	movq	-56(%rbp), %rax	; lexer, tmp133
	movq	%rax, %rdi	; tmp133,
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp134, token
; src/parser.c:683:     return expr_left;
	movq	-64(%rbp), %rax	; expr_left, _11
.L210:
; src/parser.c:684: }
	leave	
	ret	
	.size	parse_expr_prec, .-parse_expr_prec
	.section	.rodata
	.align 8
.LC75:
	.string	"Failed to parse expression primary"
	.text
	.type	parse_expression, @function
parse_expression:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	pushq	%rbx	;
	subq	$56, %rsp	;,
	movq	%rdi, -40(%rbp)	; lexer, lexer
	movq	%rsi, -48(%rbp)	; now_scope, now_scope
	movq	%rdx, -56(%rbp)	; parser, parser
; src/parser.c:687:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	-56(%rbp), %rdx	; parser, tmp88
	movq	-48(%rbp), %rcx	; now_scope, tmp89
	movq	-40(%rbp), %rax	; lexer, tmp90
	movq	%rcx, %rsi	; tmp89,
	movq	%rax, %rdi	; tmp90,
	call	parse_primary	;
	movq	%rax, -24(%rbp)	; tmp91, left_primary
; src/parser.c:688:     if (left_primary == NULL) {
	cmpq	$0, -24(%rbp)	;, left_primary
	jne	.L217	;,
; src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	-56(%rbp), %rax	; parser, tmp92
	movq	(%rax), %rax	; parser_10(D)->source_file, _1
	movq	%rax, %rdi	; _1,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rbx	;, _2
; src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	-40(%rbp), %rax	; lexer, tmp93
	movq	%rax, %rdi	; tmp93,
	call	*peek_current_token@GOTPCREL(%rip)	;
; src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rdx	; _2,
	movq	%rax, %rsi	; _3,
	leaq	.LC75(%rip), %rax	;, tmp94
	movq	%rax, %rdi	; tmp94,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:691:         return NULL;
	movl	$0, %eax	;, _5
	jmp	.L218	;
.L217:
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	-24(%rbp), %rax	; left_primary, tmp95
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; tmp95,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, %rsi	;, _4
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	-56(%rbp), %rcx	; parser, tmp96
	movq	-48(%rbp), %rdx	; now_scope, tmp97
	movq	-40(%rbp), %rax	; lexer, tmp98
	movq	%rcx, %r8	; tmp96,
	movq	%rdx, %rcx	; tmp97,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp98,
	call	parse_expr_prec	;
.L218:
; src/parser.c:695: }
	movq	-8(%rbp), %rbx	;,
	leave	
	ret	
	.size	parse_expression, .-parse_expression
	.section	.rodata
	.align 8
.LC76:
	.string	"Failed to parse parenthesized expression"
.LC77:
	.string	"Expected ')' after expression"
	.align 8
.LC78:
	.string	"Failed to parse operand of unary '!'"
	.align 8
.LC79:
	.string	"Failed to parse operand of unary '-'"
	.align 8
.LC80:
	.string	"Failed to parse variable access"
	.align 8
.LC81:
	.string	"Unexpected token in primary expression"
	.text
	.type	parse_primary, @function
parse_primary:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$80, %rsp	;,
	movq	%rdi, -56(%rbp)	; lexer, lexer
	movq	%rsi, -64(%rbp)	; now_scope, now_scope
	movq	%rdx, -72(%rbp)	; parser, parser
; src/parser.c:698:     Token* token = NULL;
	movq	$0, -48(%rbp)	;, token
; src/parser.c:699:     token = peek_current_token(lexer);
	movq	-56(%rbp), %rax	; lexer, tmp129
	movq	%rax, %rdi	; tmp129,
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp130, token
; src/parser.c:701:     string str_value = NULL;
	movq	$0, -16(%rbp)	;, str_value
; src/parser.c:702:     Expression* expr_value = NULL;
	movq	$0, -24(%rbp)	;, expr_value
; src/parser.c:703:     Primary* prim_value = NULL;
	movq	$0, -32(%rbp)	;, prim_value
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	movq	$0, -40(%rbp)	;, variable_value
; src/parser.c:705:     if (token->type == INTEGER) {
	movq	-48(%rbp), %rax	; token, tmp131
	movl	24(%rax), %eax	; token_66->type, _1
; src/parser.c:705:     if (token->type == INTEGER) {
	cmpl	$2, %eax	;, _1
	jne	.L220	;,
; src/parser.c:706:         type = PRIM_INTEGER;
	movl	$0, -4(%rbp)	;, type
; src/parser.c:707:         str_value = token->lexeme;
	movq	-48(%rbp), %rax	; token, tmp132
	movq	(%rax), %rax	; token_66->lexeme, tmp133
	movq	%rax, -16(%rbp)	; tmp133, str_value
	jmp	.L221	;
.L220:
; src/parser.c:708:     } else if (token->type == FLOAT) {
	movq	-48(%rbp), %rax	; token, tmp134
	movl	24(%rax), %eax	; token_66->type, _2
; src/parser.c:708:     } else if (token->type == FLOAT) {
	cmpl	$3, %eax	;, _2
	jne	.L222	;,
; src/parser.c:709:         type = PRIM_FLOAT;
	movl	$1, -4(%rbp)	;, type
; src/parser.c:710:         str_value = token->lexeme;
	movq	-48(%rbp), %rax	; token, tmp135
	movq	(%rax), %rax	; token_66->lexeme, tmp136
	movq	%rax, -16(%rbp)	; tmp136, str_value
	jmp	.L221	;
.L222:
; src/parser.c:711:     } else if (token->type == STRING) {
	movq	-48(%rbp), %rax	; token, tmp137
	movl	24(%rax), %eax	; token_66->type, _3
; src/parser.c:711:     } else if (token->type == STRING) {
	cmpl	$4, %eax	;, _3
	jne	.L223	;,
; src/parser.c:712:         type = PRIM_STRING;
	movl	$2, -4(%rbp)	;, type
; src/parser.c:713:         str_value = token->lexeme;
	movq	-48(%rbp), %rax	; token, tmp138
	movq	(%rax), %rax	; token_66->lexeme, tmp139
	movq	%rax, -16(%rbp)	; tmp139, str_value
	jmp	.L221	;
.L223:
; src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	movq	-48(%rbp), %rax	; token, tmp140
	movl	24(%rax), %eax	; token_66->type, _4
; src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	;, _4
	jne	.L224	;,
; src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	movq	TRUE_KEYWORD(%rip), %rdx	; TRUE_KEYWORD, TRUE_KEYWORD.87_5
	movq	-48(%rbp), %rax	; token, tmp141
	movq	(%rax), %rax	; token_66->lexeme, _6
	movq	%rdx, %rsi	; TRUE_KEYWORD.87_5,
	movq	%rax, %rdi	; _6,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	; _7
	je	.L224	;,
; src/parser.c:715:         type = PRIM_TRUE;
	movl	$3, -4(%rbp)	;, type
; src/parser.c:716:         str_value = token->lexeme;
	movq	-48(%rbp), %rax	; token, tmp142
	movq	(%rax), %rax	; token_66->lexeme, tmp143
	movq	%rax, -16(%rbp)	; tmp143, str_value
	jmp	.L221	;
.L224:
; src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movq	-48(%rbp), %rax	; token, tmp144
	movl	24(%rax), %eax	; token_66->type, _8
; src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, %eax	;, _8
	jne	.L225	;,
; src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movq	FALSE_KEYWORD(%rip), %rdx	; FALSE_KEYWORD, FALSE_KEYWORD.88_9
	movq	-48(%rbp), %rax	; token, tmp145
	movq	(%rax), %rax	; token_66->lexeme, _10
	movq	%rdx, %rsi	; FALSE_KEYWORD.88_9,
	movq	%rax, %rdi	; _10,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	; _11
	je	.L225	;,
; src/parser.c:718:         type = PRIM_FALSE;
	movl	$4, -4(%rbp)	;, type
; src/parser.c:719:         str_value = token->lexeme;
	movq	-48(%rbp), %rax	; token, tmp146
	movq	(%rax), %rax	; token_66->lexeme, tmp147
	movq	%rax, -16(%rbp)	; tmp147, str_value
	jmp	.L221	;
.L225:
; src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	-48(%rbp), %rax	; token, tmp148
	movl	24(%rax), %eax	; token_66->type, _12
; src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _12
	jne	.L226	;,
; src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rdx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.89_13
	movq	-48(%rbp), %rax	; token, tmp149
	movq	(%rax), %rax	; token_66->lexeme, _14
	movq	%rdx, %rsi	; L_PAREN_SYMBOL.89_13,
	movq	%rax, %rdi	; _14,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; _15
	je	.L226	;,
; src/parser.c:721:         type = PRIM_EXPRESSION;
	movl	$5, -4(%rbp)	;, type
; src/parser.c:722:         token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp150
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp150,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp151, token
; src/parser.c:723:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	-72(%rbp), %rdx	; parser, tmp152
	movq	-64(%rbp), %rcx	; now_scope, tmp153
	movq	-56(%rbp), %rax	; lexer, tmp154
	movq	%rcx, %rsi	; tmp153,
	movq	%rax, %rdi	; tmp154,
	call	parse_expression	;
	movq	%rax, -24(%rbp)	; tmp155, expr_value
; src/parser.c:724:         if (expr_value == NULL) {
	cmpq	$0, -24(%rbp)	;, expr_value
	jne	.L227	;,
; src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	-72(%rbp), %rax	; parser, tmp156
	movq	(%rax), %rax	; parser_82(D)->source_file, _16
	movq	%rax, %rdi	; _16,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _17
; src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	-48(%rbp), %rax	; token, tmp157
	movq	%rax, %rsi	; tmp157,
	leaq	.LC76(%rip), %rax	;, tmp158
	movq	%rax, %rdi	; tmp158,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:727:             return NULL;
	movl	$0, %eax	;, _51
	jmp	.L228	;
.L227:
; src/parser.c:729:         token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp159
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp159,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp160, token
; src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-48(%rbp), %rax	; token, tmp161
	movl	24(%rax), %eax	; token_86->type, _18
; src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _18
	jne	.L229	;,
; src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.90_19
	movq	-48(%rbp), %rax	; token, tmp162
	movq	(%rax), %rax	; token_86->lexeme, _20
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.90_19,
	movq	%rax, %rdi	; _20,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _21
	jne	.L238	;,
.L229:
; src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	-72(%rbp), %rax	; parser, tmp163
	movq	(%rax), %rax	; parser_82(D)->source_file, _22
	movq	%rax, %rdi	; _22,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _23
; src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	-48(%rbp), %rax	; token, tmp164
	movq	%rax, %rsi	; tmp164,
	leaq	.LC77(%rip), %rax	;, tmp165
	movq	%rax, %rdi	; tmp165,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:733:             return NULL;
	movl	$0, %eax	;, _51
	jmp	.L228	;
.L226:
; src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movq	-48(%rbp), %rax	; token, tmp166
	movl	24(%rax), %eax	; token_66->type, _24
; src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	cmpl	$5, %eax	;, _24
	jne	.L231	;,
; src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movq	NOT_SYMBOL(%rip), %rdx	; NOT_SYMBOL, NOT_SYMBOL.91_25
	movq	-48(%rbp), %rax	; token, tmp167
	movq	(%rax), %rax	; token_66->lexeme, _26
	movq	%rdx, %rsi	; NOT_SYMBOL.91_25,
	movq	%rax, %rdi	; _26,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	; _27
	je	.L231	;,
; src/parser.c:736:         type = PRIM_NOT_OPERAND;
	movl	$6, -4(%rbp)	;, type
; src/parser.c:737:         token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp168
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp168,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp169, token
; src/parser.c:738:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	-72(%rbp), %rdx	; parser, tmp170
	movq	-64(%rbp), %rcx	; now_scope, tmp171
	movq	-56(%rbp), %rax	; lexer, tmp172
	movq	%rcx, %rsi	; tmp171,
	movq	%rax, %rdi	; tmp172,
	call	parse_primary	;
	movq	%rax, -32(%rbp)	; tmp173, prim_value
; src/parser.c:739:         if (prim_value == NULL) {
	cmpq	$0, -32(%rbp)	;, prim_value
	jne	.L221	;,
; src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	-72(%rbp), %rax	; parser, tmp174
	movq	(%rax), %rax	; parser_82(D)->source_file, _28
	movq	%rax, %rdi	; _28,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _29
; src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	-48(%rbp), %rax	; token, tmp175
	movq	%rax, %rsi	; tmp175,
	leaq	.LC78(%rip), %rax	;, tmp176
	movq	%rax, %rdi	; tmp176,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:742:             return NULL;
	movl	$0, %eax	;, _51
	jmp	.L228	;
.L231:
; src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movq	-48(%rbp), %rax	; token, tmp177
	movl	24(%rax), %eax	; token_66->type, _30
; src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	cmpl	$5, %eax	;, _30
	jne	.L233	;,
; src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movq	SUB_SYMBOL(%rip), %rdx	; SUB_SYMBOL, SUB_SYMBOL.92_31
	movq	-48(%rbp), %rax	; token, tmp178
	movq	(%rax), %rax	; token_66->lexeme, _32
	movq	%rdx, %rsi	; SUB_SYMBOL.92_31,
	movq	%rax, %rdi	; _32,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	; _33
	je	.L233	;,
; src/parser.c:745:         type = PRIM_NEG_OPERAND;
	movl	$7, -4(%rbp)	;, type
; src/parser.c:746:         token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp179
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp179,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp180, token
; src/parser.c:747:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	-72(%rbp), %rdx	; parser, tmp181
	movq	-64(%rbp), %rcx	; now_scope, tmp182
	movq	-56(%rbp), %rax	; lexer, tmp183
	movq	%rcx, %rsi	; tmp182,
	movq	%rax, %rdi	; tmp183,
	call	parse_primary	;
	movq	%rax, -32(%rbp)	; tmp184, prim_value
; src/parser.c:748:         if (prim_value == NULL) {
	cmpq	$0, -32(%rbp)	;, prim_value
	jne	.L221	;,
; src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	-72(%rbp), %rax	; parser, tmp185
	movq	(%rax), %rax	; parser_82(D)->source_file, _34
	movq	%rax, %rdi	; _34,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _35
; src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	-48(%rbp), %rax	; token, tmp186
	movq	%rax, %rsi	; tmp186,
	leaq	.LC79(%rip), %rax	;, tmp187
	movq	%rax, %rdi	; tmp187,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:751:             return NULL;
	movl	$0, %eax	;, _51
	jmp	.L228	;
.L233:
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	-48(%rbp), %rax	; token, tmp188
	movl	24(%rax), %eax	; token_66->type, _36
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$1, %eax	;, _36
	je	.L235	;,
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	-48(%rbp), %rax	; token, tmp189
	movl	24(%rax), %eax	; token_66->type, _37
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$6, %eax	;, _37
	jne	.L236	;,
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	SELF_KEYWORD(%rip), %rdx	; SELF_KEYWORD, SELF_KEYWORD.93_38
	movq	-48(%rbp), %rax	; token, tmp190
	movq	(%rax), %rax	; token_66->lexeme, _39
	movq	%rdx, %rsi	; SELF_KEYWORD.93_38,
	movq	%rax, %rdi	; _39,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	testb	%al, %al	; _40
	je	.L236	;,
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	-72(%rbp), %rax	; parser, tmp191
	movzbl	9(%rax), %eax	; parser_82(D)->in_method, _41
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	testb	%al, %al	; _41
	je	.L236	;,
.L235:
; src/parser.c:754:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, -4(%rbp)	;, type
; src/parser.c:755:         variable_value = parse_variable_access(lexer, now_scope, parser);
	movq	-72(%rbp), %rdx	; parser, tmp192
	movq	-64(%rbp), %rcx	; now_scope, tmp193
	movq	-56(%rbp), %rax	; lexer, tmp194
	movq	%rcx, %rsi	; tmp193,
	movq	%rax, %rdi	; tmp194,
	call	parse_variable_access	;
	movq	%rax, -40(%rbp)	; tmp195, variable_value
; src/parser.c:756:         if (variable_value == NULL) {
	cmpq	$0, -40(%rbp)	;, variable_value
	jne	.L221	;,
; src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	-72(%rbp), %rax	; parser, tmp196
	movq	(%rax), %rax	; parser_82(D)->source_file, _42
	movq	%rax, %rdi	; _42,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _43
; src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	-48(%rbp), %rax	; token, tmp197
	movq	%rax, %rsi	; tmp197,
	leaq	.LC80(%rip), %rax	;, tmp198
	movq	%rax, %rdi	; tmp198,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:759:             return NULL;
	movl	$0, %eax	;, _51
	jmp	.L228	;
.L236:
; src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	-72(%rbp), %rax	; parser, tmp199
	movq	(%rax), %rax	; parser_82(D)->source_file, _44
	movq	%rax, %rdi	; _44,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _45
; src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	-48(%rbp), %rax	; token, tmp200
	movq	%rax, %rsi	; tmp200,
	leaq	.LC81(%rip), %rax	;, tmp201
	movq	%rax, %rdi	; tmp201,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:764:         return NULL;
	movl	$0, %eax	;, _51
	jmp	.L228	;
.L238:
; src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	nop	
.L221:
; src/parser.c:767:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	-40(%rbp), %rdi	; variable_value, tmp202
	movq	-32(%rbp), %rcx	; prim_value, tmp203
	movq	-24(%rbp), %rdx	; expr_value, tmp204
	movq	-16(%rbp), %rsi	; str_value, tmp205
	movl	-4(%rbp), %eax	; type, tmp206
	movq	%rdi, %r8	; tmp202,
	movl	%eax, %edi	; tmp206,
	call	*create_primary@GOTPCREL(%rip)	;
.L228:
; src/parser.c:768: }
	leave	
	ret	
	.size	parse_primary, .-parse_primary
	.section	.rodata
	.align 8
.LC82:
	.string	"Expected variable name in variable access"
	.align 8
.LC83:
	.string	"Cannot call undefined variable"
	.align 8
.LC84:
	.string	"Cannot call non-function variable"
	.align 8
.LC85:
	.string	"Failed to parse function call argument"
	.align 8
.LC86:
	.string	"Expected ',' or ')' after function call argument"
	.align 8
.LC87:
	.string	"Failed to parse sequence index"
	.align 8
.LC88:
	.string	"Expected ']' after sequence index"
	.align 8
.LC89:
	.string	"Cannot access attribute without a valid scope"
	.align 8
.LC90:
	.string	"Expected attribute name after '.'"
.LC91:
	.string	"Unknown attribute name"
	.text
	.type	parse_variable_access, @function
parse_variable_access:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	addq	$-128, %rsp	;,
	movq	%rdi, -104(%rbp)	; lexer, lexer
	movq	%rsi, -112(%rbp)	; now_scope, now_scope
	movq	%rdx, -120(%rbp)	; parser, parser
; src/parser.c:771:     Token* token = peek_current_token(lexer);
	movq	-104(%rbp), %rax	; lexer, tmp156
	movq	%rax, %rdi	; tmp156,
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp157, token
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	-8(%rbp), %rax	; token, tmp158
	movl	24(%rax), %eax	; token_109->type, _1
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	;, _1
	je	.L240	;,
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	-8(%rbp), %rax	; token, tmp159
	movl	24(%rax), %eax	; token_109->type, _2
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	;, _2
	jne	.L241	;,
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	SELF_KEYWORD(%rip), %rdx	; SELF_KEYWORD, SELF_KEYWORD.94_3
	movq	-8(%rbp), %rax	; token, tmp160
	movq	(%rax), %rax	; token_109->lexeme, _4
	movq	%rdx, %rsi	; SELF_KEYWORD.94_3,
	movq	%rax, %rdi	; _4,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	; _5
	jne	.L240	;,
.L241:
; src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	-120(%rbp), %rax	; parser, tmp161
	movq	(%rax), %rax	; parser_111(D)->source_file, _6
	movq	%rax, %rdi	; _6,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _7
; src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp162
	movq	%rax, %rsi	; tmp162,
	leaq	.LC82(%rip), %rax	;, tmp163
	movq	%rax, %rdi	; tmp163,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:775:         return NULL;
	movl	$0, %eax	;, _89
	jmp	.L242	;
.L240:
; src/parser.c:777:     Symbol* current_type = NULL;
	movq	$0, -16(%rbp)	;, current_type
; src/parser.c:778:     Symbol* base_name = NULL;
	movq	$0, -24(%rbp)	;, base_name
; src/parser.c:779:     SymbolTable* var_scope = NULL;
	movq	$0, -32(%rbp)	;, var_scope
; src/parser.c:780:     base_name = search_name(now_scope, token->lexeme);
	movq	-8(%rbp), %rax	; token, tmp164
	movq	(%rax), %rdx	; token_109->lexeme, _8
	movq	-112(%rbp), %rax	; now_scope, tmp165
	movq	%rdx, %rsi	; _8,
	movq	%rax, %rdi	; tmp165,
	call	*search_name@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp166, base_name
; src/parser.c:781:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	movq	-24(%rbp), %rax	; base_name, tmp167
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; tmp167,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp168, base
; src/parser.c:782:     token = peek_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp169
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp169,
	call	*peek_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp170, token
; src/parser.c:783:     while (token->type == SYMBOL) {
	jmp	.L243	;
.L269:
; src/parser.c:784:         if (base_name != NULL) {
	cmpq	$0, -24(%rbp)	;, base_name
	je	.L244	;,
; src/parser.c:785:             current_type = base_name;     // class or type
	movq	-24(%rbp), %rax	; base_name, tmp171
	movq	%rax, -16(%rbp)	; tmp171, current_type
; src/parser.c:786:             if (base_name->type != NULL)  // subroutine or variable or attribute or parameter
	movq	-24(%rbp), %rax	; base_name, tmp172
	movq	(%rax), %rax	; base_name_81->type, _9
; src/parser.c:786:             if (base_name->type != NULL)  // subroutine or variable or attribute or parameter
	testq	%rax, %rax	; _9
	je	.L244	;,
; src/parser.c:787:                 current_type = base_name->type;
	movq	-24(%rbp), %rax	; base_name, tmp173
	movq	(%rax), %rax	; base_name_81->type, tmp174
	movq	%rax, -16(%rbp)	; tmp174, current_type
.L244:
; src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	cmpq	$0, -32(%rbp)	;, var_scope
	jne	.L245	;,
; src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	cmpq	$0, -16(%rbp)	;, current_type
	je	.L245	;,
; src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	movq	-16(%rbp), %rax	; current_type, tmp175
	movl	32(%rax), %eax	; current_type_75->kind, _10
; src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	; _10
	jne	.L245	;,
; src/parser.c:790:             var_scope = current_type->ast_node.class->class_scope;
	movq	-16(%rbp), %rax	; current_type, tmp176
	movq	24(%rax), %rax	; current_type_75->ast_node.class, _11
; src/parser.c:790:             var_scope = current_type->ast_node.class->class_scope;
	movq	16(%rax), %rax	; _11->class_scope, tmp177
	movq	%rax, -32(%rbp)	; tmp177, var_scope
.L245:
; src/parser.c:791:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rdx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.95_12
	movq	-8(%rbp), %rax	; token, tmp178
	movq	(%rax), %rax	; token_74->lexeme, _13
	movq	%rdx, %rsi	; L_PAREN_SYMBOL.95_12,
	movq	%rax, %rdi	; _13,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:791:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; _14
	je	.L246	;,
; src/parser.c:792:             token = get_next_token(lexer, true);  // consume '('
	movq	-104(%rbp), %rax	; lexer, tmp179
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp179,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp180, token
; src/parser.c:793:             if (base_name == NULL)
	cmpq	$0, -24(%rbp)	;, base_name
	jne	.L247	;,
; src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	-120(%rbp), %rax	; parser, tmp181
	movq	(%rax), %rax	; parser_111(D)->source_file, _15
	movq	%rax, %rdi	; _15,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _16
; src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp182
	movq	%rax, %rsi	; tmp182,
	leaq	.LC83(%rip), %rax	;, tmp183
	movq	%rax, %rdi	; tmp183,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L248	;
.L247:
; src/parser.c:795:             else if (base_name->kind == SYMBOL_CLASS) {
	movq	-24(%rbp), %rax	; base_name, tmp184
	movl	32(%rax), %eax	; base_name_81->kind, _17
; src/parser.c:795:             else if (base_name->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	; _17
	jne	.L248	;,
; src/parser.c:796:                 string name = make_method_name(base_name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME.96_18
	movq	-24(%rbp), %rax	; base_name, tmp185
	movq	8(%rax), %rax	; base_name_81->name, _19
	movq	%rdx, %rsi	; DEFAULT_CONSTRUCTOR_NAME.96_18,
	movq	%rax, %rdi	; _19,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, -72(%rbp)	; tmp186, name
; src/parser.c:797:                 base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
	movq	-24(%rbp), %rax	; base_name, tmp187
	movq	24(%rax), %rax	; base_name_81->ast_node.class, _20
; src/parser.c:797:                 base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
	movq	16(%rax), %rax	; _20->class_scope, _21
	movq	-72(%rbp), %rdx	; name, tmp188
	movq	%rdx, %rsi	; tmp188,
	movq	%rax, %rdi	; _21,
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp189, base_name
; src/parser.c:798:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	-24(%rbp), %rdx	; base_name, tmp190
	movq	-40(%rbp), %rax	; base, tmp191
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	%rax, %rsi	; tmp191,
	movl	$2, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp192, base
.L248:
; src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	cmpq	$0, -24(%rbp)	;, base_name
	je	.L249	;,
; src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	movq	-24(%rbp), %rax	; base_name, tmp193
	movl	32(%rax), %eax	; base_name_78->kind, _22
; src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	cmpl	$1, %eax	;, _22
	je	.L249	;,
; src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	movq	-24(%rbp), %rax	; base_name, tmp194
	movl	32(%rax), %eax	; base_name_78->kind, _23
; src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	cmpl	$2, %eax	;, _23
	je	.L249	;,
; src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	-120(%rbp), %rax	; parser, tmp195
	movq	(%rax), %rax	; parser_111(D)->source_file, _24
	movq	%rax, %rdi	; _24,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _25
; src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp196
	movq	%rax, %rsi	; tmp196,
	leaq	.LC84(%rip), %rax	;, tmp197
	movq	%rax, %rdi	; tmp197,
	call	*parser_error@GOTPCREL(%rip)	;
.L249:
; src/parser.c:802:             token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp198
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp198,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp199, token
; src/parser.c:803:             list(Expression*) args = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, -80(%rbp)	; tmp200, args
; src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L250	;
.L255:
; src/parser.c:805:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	-120(%rbp), %rdx	; parser, tmp201
	movq	-112(%rbp), %rcx	; now_scope, tmp202
	movq	-104(%rbp), %rax	; lexer, tmp203
	movq	%rcx, %rsi	; tmp202,
	movq	%rax, %rdi	; tmp203,
	call	parse_expression	;
	movq	%rax, -88(%rbp)	; tmp204, arg
; src/parser.c:806:                 if (arg == NULL)
	cmpq	$0, -88(%rbp)	;, arg
	jne	.L251	;,
; src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	-120(%rbp), %rax	; parser, tmp205
	movq	(%rax), %rax	; parser_111(D)->source_file, _26
	movq	%rax, %rdi	; _26,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _27
; src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp206
	movq	%rax, %rsi	; tmp206,
	leaq	.LC85(%rip), %rax	;, tmp207
	movq	%rax, %rdi	; tmp207,
	call	*parser_error@GOTPCREL(%rip)	;
.L251:
; src/parser.c:808:                 list_append(args, (pointer)arg);
	movq	-88(%rbp), %rdx	; arg, tmp208
	movq	-80(%rbp), %rax	; args, tmp209
	movq	%rdx, %rsi	; tmp208,
	movq	%rax, %rdi	; tmp209,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:809:                 token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp210
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp210,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp211, token
; src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	movq	-8(%rbp), %rax	; token, tmp212
	movl	24(%rax), %eax	; token_202->type, _28
; src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	cmpl	$5, %eax	;, _28
	jne	.L252	;,
; src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	movq	COMMA_SYMBOL(%rip), %rdx	; COMMA_SYMBOL, COMMA_SYMBOL.97_29
	movq	-8(%rbp), %rax	; token, tmp213
	movq	(%rax), %rax	; token_202->lexeme, _30
	movq	%rdx, %rsi	; COMMA_SYMBOL.97_29,
	movq	%rax, %rdi	; _30,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	testb	%al, %al	; _31
	je	.L252	;,
; src/parser.c:811:                     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp214
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp214,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp215, token
; src/parser.c:811:                     token = get_next_token(lexer, true);
	jmp	.L250	;
.L252:
; src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp216
	movl	24(%rax), %eax	; token_202->type, _32
; src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _32
	jne	.L254	;,
; src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.98_33
	movq	-8(%rbp), %rax	; token, tmp217
	movq	(%rax), %rax	; token_202->lexeme, _34
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.98_33,
	movq	%rax, %rdi	; _34,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _35
	jne	.L250	;,
.L254:
; src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	-120(%rbp), %rax	; parser, tmp218
	movq	(%rax), %rax	; parser_111(D)->source_file, _36
	movq	%rax, %rdi	; _36,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _37
; src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp219
	movq	%rax, %rsi	; tmp219,
	leaq	.LC86(%rip), %rax	;, tmp220
	movq	%rax, %rdi	; tmp220,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:815:                     return NULL;
	movl	$0, %eax	;, _89
	jmp	.L242	;
.L250:
; src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp221
	movl	24(%rax), %eax	; token_73->type, _38
; src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _38
	jne	.L255	;,
; src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.99_39
	movq	-8(%rbp), %rax	; token, tmp222
	movq	(%rax), %rax	; token_73->lexeme, _40
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.99_39,
	movq	%rax, %rdi	; _40,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _41
	je	.L255	;,
; src/parser.c:818:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	-80(%rbp), %rdx	; args, tmp223
	movq	-40(%rbp), %rax	; base, tmp224
	movq	%rdx, %r8	; tmp223,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp224,
	movl	$1, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp225, base
; src/parser.c:819:             base_name = base_name->type;
	movq	-24(%rbp), %rax	; base_name, tmp226
	movq	(%rax), %rax	; base_name_78->type, tmp227
	movq	%rax, -24(%rbp)	; tmp227, base_name
; src/parser.c:820:             current_type = NULL;
	movq	$0, -16(%rbp)	;, current_type
; src/parser.c:821:             var_scope = NULL;
	movq	$0, -32(%rbp)	;, var_scope
; src/parser.c:822:             if (base_name->kind == SYMBOL_CLASS)
	movq	-24(%rbp), %rax	; base_name, tmp228
	movl	32(%rax), %eax	; base_name_192->kind, _42
; src/parser.c:822:             if (base_name->kind == SYMBOL_CLASS)
	testl	%eax, %eax	; _42
	jne	.L256	;,
; src/parser.c:823:                 var_scope = base_name->ast_node.class->class_scope;
	movq	-24(%rbp), %rax	; base_name, tmp229
	movq	24(%rax), %rax	; base_name_192->ast_node.class, _43
; src/parser.c:823:                 var_scope = base_name->ast_node.class->class_scope;
	movq	16(%rax), %rax	; _43->class_scope, tmp230
	movq	%rax, -32(%rbp)	; tmp230, var_scope
	jmp	.L256	;
.L246:
; src/parser.c:824:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	movq	L_BRACKET_SYMBOL(%rip), %rdx	; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL.100_44
	movq	-8(%rbp), %rax	; token, tmp231
	movq	(%rax), %rax	; token_74->lexeme, _45
	movq	%rdx, %rsi	; L_BRACKET_SYMBOL.100_44,
	movq	%rax, %rdi	; _45,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:824:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	; _46
	je	.L257	;,
; src/parser.c:825:             token = get_next_token(lexer, true);  // consume '['
	movq	-104(%rbp), %rax	; lexer, tmp232
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp232,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp233, token
; src/parser.c:826:             token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp234
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp234,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp235, token
; src/parser.c:827:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	-120(%rbp), %rdx	; parser, tmp236
	movq	-112(%rbp), %rcx	; now_scope, tmp237
	movq	-104(%rbp), %rax	; lexer, tmp238
	movq	%rcx, %rsi	; tmp237,
	movq	%rax, %rdi	; tmp238,
	call	parse_expression	;
	movq	%rax, -64(%rbp)	; tmp239, index
; src/parser.c:828:             if (index == NULL)
	cmpq	$0, -64(%rbp)	;, index
	jne	.L258	;,
; src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	-120(%rbp), %rax	; parser, tmp240
	movq	(%rax), %rax	; parser_111(D)->source_file, _47
	movq	%rax, %rdi	; _47,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _48
; src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp241
	movq	%rax, %rsi	; tmp241,
	leaq	.LC87(%rip), %rax	;, tmp242
	movq	%rax, %rdi	; tmp242,
	call	*parser_error@GOTPCREL(%rip)	;
.L258:
; src/parser.c:830:             token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp243
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp243,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp244, token
; src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	-8(%rbp), %rax	; token, tmp245
	movl	24(%rax), %eax	; token_166->type, _49
; src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, %eax	;, _49
	jne	.L259	;,
; src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	R_BRACKET_SYMBOL(%rip), %rdx	; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL.101_50
	movq	-8(%rbp), %rax	; token, tmp246
	movq	(%rax), %rax	; token_166->lexeme, _51
	movq	%rdx, %rsi	; R_BRACKET_SYMBOL.101_50,
	movq	%rax, %rdi	; _51,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	testb	%al, %al	; _52
	jne	.L260	;,
.L259:
; src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	-120(%rbp), %rax	; parser, tmp247
	movq	(%rax), %rax	; parser_111(D)->source_file, _53
	movq	%rax, %rdi	; _53,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _54
; src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp248
	movq	%rax, %rsi	; tmp248,
	leaq	.LC88(%rip), %rax	;, tmp249
	movq	%rax, %rdi	; tmp249,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:834:                 return NULL;
	movl	$0, %eax	;, _89
	jmp	.L242	;
.L260:
; src/parser.c:836:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movq	-64(%rbp), %rdx	; index, tmp250
	movq	-40(%rbp), %rax	; base, tmp251
	movl	$0, %r8d	;,
	movq	%rdx, %rcx	; tmp250,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp251,
	movl	$3, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp252, base
	jmp	.L256	;
.L257:
; src/parser.c:837:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	movq	DOT_SYMBOL(%rip), %rdx	; DOT_SYMBOL, DOT_SYMBOL.102_55
	movq	-8(%rbp), %rax	; token, tmp253
	movq	(%rax), %rax	; token_74->lexeme, _56
	movq	%rdx, %rsi	; DOT_SYMBOL.102_55,
	movq	%rax, %rdi	; _56,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:837:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	; _57
	je	.L270	;,
; src/parser.c:838:             token = get_next_token(lexer, true);  // consume '.'
	movq	-104(%rbp), %rax	; lexer, tmp254
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp254,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp255, token
; src/parser.c:839:             token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp256
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp256,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp257, token
; src/parser.c:840:             if (var_scope == NULL) {
	cmpq	$0, -32(%rbp)	;, var_scope
	jne	.L262	;,
; src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	-120(%rbp), %rax	; parser, tmp258
	movq	(%rax), %rax	; parser_111(D)->source_file, _58
	movq	%rax, %rdi	; _58,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _59
; src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp259
	movq	%rax, %rsi	; tmp259,
	leaq	.LC89(%rip), %rax	;, tmp260
	movq	%rax, %rdi	; tmp260,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:843:                 return NULL;
	movl	$0, %eax	;, _89
	jmp	.L242	;
.L262:
; src/parser.c:845:             if (token->type != IDENTIFIER) {
	movq	-8(%rbp), %rax	; token, tmp261
	movl	24(%rax), %eax	; token_134->type, _60
; src/parser.c:845:             if (token->type != IDENTIFIER) {
	cmpl	$1, %eax	;, _60
	je	.L263	;,
; src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	-120(%rbp), %rax	; parser, tmp262
	movq	(%rax), %rax	; parser_111(D)->source_file, _61
	movq	%rax, %rdi	; _61,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _62
; src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp263
	movq	%rax, %rsi	; tmp263,
	leaq	.LC90(%rip), %rax	;, tmp264
	movq	%rax, %rdi	; tmp264,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:848:                 return NULL;
	movl	$0, %eax	;, _89
	jmp	.L242	;
.L263:
; src/parser.c:850:             base_name = search_name(var_scope, token->lexeme);
	movq	-8(%rbp), %rax	; token, tmp265
	movq	(%rax), %rdx	; token_134->lexeme, _63
	movq	-32(%rbp), %rax	; var_scope, tmp266
	movq	%rdx, %rsi	; _63,
	movq	%rax, %rdi	; tmp266,
	call	*search_name@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp267, base_name
; src/parser.c:851:             if (base_name == NULL) {
	cmpq	$0, -24(%rbp)	;, base_name
	jne	.L264	;,
; src/parser.c:852:                 string class_name = NULL;
	movq	$0, -48(%rbp)	;, class_name
; src/parser.c:853:                 if (current_type != NULL) {
	cmpq	$0, -16(%rbp)	;, current_type
	je	.L265	;,
; src/parser.c:854:                     if (current_type->kind == SYMBOL_CLASS)
	movq	-16(%rbp), %rax	; current_type, tmp268
	movl	32(%rax), %eax	; current_type_75->kind, _64
; src/parser.c:854:                     if (current_type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	; _64
	jne	.L266	;,
; src/parser.c:855:                         class_name = current_type->name;
	movq	-16(%rbp), %rax	; current_type, tmp269
	movq	8(%rax), %rax	; current_type_75->name, tmp270
	movq	%rax, -48(%rbp)	; tmp270, class_name
	jmp	.L265	;
.L266:
; src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	movq	-16(%rbp), %rax	; current_type, tmp271
	movq	(%rax), %rax	; current_type_75->type, _65
; src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	testq	%rax, %rax	; _65
	je	.L265	;,
; src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	movq	-16(%rbp), %rax	; current_type, tmp272
	movq	(%rax), %rax	; current_type_75->type, _66
; src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	; _66->kind, _67
; src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	; _67
	jne	.L265	;,
; src/parser.c:857:                         class_name = current_type->type->name;
	movq	-16(%rbp), %rax	; current_type, tmp273
	movq	(%rax), %rax	; current_type_75->type, _68
; src/parser.c:857:                         class_name = current_type->type->name;
	movq	8(%rax), %rax	; _68->name, tmp274
	movq	%rax, -48(%rbp)	; tmp274, class_name
.L265:
; src/parser.c:859:                 string name = make_method_name(class_name, token->lexeme);
	movq	-8(%rbp), %rax	; token, tmp275
	movq	(%rax), %rdx	; token_134->lexeme, _69
	movq	-48(%rbp), %rax	; class_name, tmp276
	movq	%rdx, %rsi	; _69,
	movq	%rax, %rdi	; tmp276,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, -56(%rbp)	; tmp277, name
; src/parser.c:860:                 base_name = search_name_use_strcmp(var_scope, name);
	movq	-56(%rbp), %rdx	; name, tmp278
	movq	-32(%rbp), %rax	; var_scope, tmp279
	movq	%rdx, %rsi	; tmp278,
	movq	%rax, %rdi	; tmp279,
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp280, base_name
.L264:
; src/parser.c:862:             if (base_name == NULL) {
	cmpq	$0, -24(%rbp)	;, base_name
	jne	.L267	;,
; src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	-120(%rbp), %rax	; parser, tmp281
	movq	(%rax), %rax	; parser_111(D)->source_file, _70
	movq	%rax, %rdi	; _70,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _71
; src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	-8(%rbp), %rax	; token, tmp282
	movq	%rax, %rsi	; tmp282,
	leaq	.LC91(%rip), %rax	;, tmp283
	movq	%rax, %rdi	; tmp283,
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:865:                 return NULL;
	movl	$0, %eax	;, _89
	jmp	.L242	;
.L267:
; src/parser.c:867:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	-24(%rbp), %rdx	; base_name, tmp284
	movq	-40(%rbp), %rax	; base, tmp285
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	%rax, %rsi	; tmp285,
	movl	$2, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp286, base
; src/parser.c:868:             current_type = NULL;
	movq	$0, -16(%rbp)	;, current_type
; src/parser.c:869:             var_scope = NULL;
	movq	$0, -32(%rbp)	;, var_scope
.L256:
; src/parser.c:872:         token = peek_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp287
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp287,
	call	*peek_next_token@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp288, token
.L243:
; src/parser.c:783:     while (token->type == SYMBOL) {
	movq	-8(%rbp), %rax	; token, tmp289
	movl	24(%rax), %eax	; token_74->type, _72
; src/parser.c:783:     while (token->type == SYMBOL) {
	cmpl	$5, %eax	;, _72
	je	.L269	;,
	jmp	.L268	;
.L270:
; src/parser.c:871:             break;
	nop	
.L268:
; src/parser.c:875:     return base;
	movq	-40(%rbp), %rax	; base, _89
.L242:
; src/parser.c:876: }
	leave	
	ret	
	.size	parse_variable_access, .-parse_variable_access
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
