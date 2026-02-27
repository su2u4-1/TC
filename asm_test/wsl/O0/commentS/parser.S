	.file	"parser.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O0 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
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
.LFB6:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$96, %rsp	;,
	movq	%rdi, -72(%rbp)	; lexer, lexer
	movq	%rsi, -80(%rbp)	; now_scope, now_scope
	movq	%rdx, -88(%rbp)	; parser, parser
; src/parser.c:23:     if (builtin_scope == 0) {
	movq	builtin_scope(%rip), %rax	; builtin_scope, builtin_scope.0_1
; src/parser.c:23:     if (builtin_scope == 0) {
	testq	%rax, %rax	; builtin_scope.0_1
	jne	.L2	;,
; src/parser.c:24:         builtin_scope = create_scope(0);
	movl	$0, %edi	;,
	call	create_scope@PLT	;
; src/parser.c:24:         builtin_scope = create_scope(0);
	movq	%rax, builtin_scope(%rip)	; _2, builtin_scope
; src/parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rdx	; builtin_scope, builtin_scope.1_3
	movq	VOID_KEYWORD(%rip), %rax	; VOID_KEYWORD, VOID_KEYWORD.2_4
	movq	%rdx, %r8	; builtin_scope.1_3,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movq	%rax, %rdi	; VOID_KEYWORD.2_4,
	call	create_name@PLT	;
; src/parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, name_void(%rip)	; _5, name_void
; src/parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rdx	; builtin_scope, builtin_scope.3_6
	movq	INT_KEYWORD(%rip), %rax	; INT_KEYWORD, INT_KEYWORD.4_7
	movq	%rdx, %r8	; builtin_scope.3_6,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movq	%rax, %rdi	; INT_KEYWORD.4_7,
	call	create_name@PLT	;
; src/parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, name_int(%rip)	; _8, name_int
; src/parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rdx	; builtin_scope, builtin_scope.5_9
	movq	FLOAT_KEYWORD(%rip), %rax	; FLOAT_KEYWORD, FLOAT_KEYWORD.6_10
	movq	%rdx, %r8	; builtin_scope.5_9,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movq	%rax, %rdi	; FLOAT_KEYWORD.6_10,
	call	create_name@PLT	;
; src/parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, name_float(%rip)	; _11, name_float
; src/parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rdx	; builtin_scope, builtin_scope.7_12
	movq	STRING_KEYWORD(%rip), %rax	; STRING_KEYWORD, STRING_KEYWORD.8_13
	movq	%rdx, %r8	; builtin_scope.7_12,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movq	%rax, %rdi	; STRING_KEYWORD.8_13,
	call	create_name@PLT	;
; src/parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, name_string(%rip)	; _14, name_string
; src/parser.c:29:         name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rdx	; builtin_scope, builtin_scope.9_15
	movq	BOOL_KEYWORD(%rip), %rax	; BOOL_KEYWORD, BOOL_KEYWORD.10_16
	movq	%rdx, %r8	; builtin_scope.9_15,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movq	%rax, %rdi	; BOOL_KEYWORD.10_16,
	call	create_name@PLT	;
; src/parser.c:29:         name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, name_bool(%rip)	; _17, name_bool
.L2:
; src/parser.c:31:     if (now_scope == 0)
	cmpq	$0, -80(%rbp)	;, now_scope
	jne	.L3	;,
; src/parser.c:32:         now_scope = builtin_scope;
	movq	builtin_scope(%rip), %rax	; builtin_scope, tmp117
	movq	%rax, -80(%rbp)	; tmp117, now_scope
.L3:
; src/parser.c:33:     Token* token = 0;
	movq	$0, -56(%rbp)	;, token
; src/parser.c:34:     Token* token_ptr = NULL;
	movq	$0, -48(%rbp)	;, token_ptr
; src/parser.c:35:     list(CodeMember*) members = create_list();
	call	create_list@PLT	;
	movq	%rax, -40(%rbp)	; tmp118, members
; src/parser.c:36:     Scope* global_scope = create_scope(now_scope);
	movq	-80(%rbp), %rax	; now_scope, tmp119
	movq	%rax, %rdi	; tmp119,
	call	create_scope@PLT	;
	movq	%rax, -32(%rbp)	; tmp120, global_scope
; src/parser.c:37:     token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp121
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp121,
	call	get_next_token@PLT	;
	movq	%rax, -56(%rbp)	; tmp122, token
; src/parser.c:38:     token_ptr = token;
	movq	-56(%rbp), %rax	; token, tmp123
	movq	%rax, -48(%rbp)	; tmp123, token_ptr
; src/parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	jmp	.L4	;
.L13:
; src/parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	movq	-48(%rbp), %rax	; token_ptr, tmp124
	movl	24(%rax), %eax	; token_ptr_36->type, _18
; src/parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	;, _18
	jne	.L5	;,
; src/parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	movq	IMPORT_KEYWORD(%rip), %rdx	; IMPORT_KEYWORD, IMPORT_KEYWORD.11_19
	movq	-48(%rbp), %rax	; token_ptr, tmp125
	movq	(%rax), %rax	; token_ptr_36->lexeme, _20
	movq	%rdx, %rsi	; IMPORT_KEYWORD.11_19,
	movq	%rax, %rdi	; _20,
	call	string_equal@PLT	;
; src/parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	testb	%al, %al	; _21
	je	.L5	;,
; src/parser.c:41:             Import* import = parse_import(lexer, global_scope);
	movq	-32(%rbp), %rdx	; global_scope, tmp126
	movq	-72(%rbp), %rax	; lexer, tmp127
	movq	%rdx, %rsi	; tmp126,
	movq	%rax, %rdi	; tmp127,
	call	parse_import	;
	movq	%rax, -24(%rbp)	; tmp128, import
; src/parser.c:42:             if (import == 0)
	cmpq	$0, -24(%rbp)	;, import
	jne	.L6	;,
; src/parser.c:43:                 parser_error("Failed to parse import statement", token);
	movq	-56(%rbp), %rax	; token, tmp129
	movq	%rax, %rsi	; tmp129,
	leaq	.LC0(%rip), %rax	;, tmp130
	movq	%rax, %rdi	; tmp130,
	call	parser_error@PLT	;
.L6:
; src/parser.c:44:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	-24(%rbp), %rax	; import, tmp131
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp131,
	movl	$0, %edi	;,
	call	create_code_member@PLT	;
	movq	%rax, %rdx	;, _22
; src/parser.c:44:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	-40(%rbp), %rax	; members, tmp132
	movq	%rdx, %rsi	; _22,
	movq	%rax, %rdi	; tmp132,
	call	list_append@PLT	;
; src/parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	jmp	.L7	;
.L5:
; src/parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	movq	-48(%rbp), %rax	; token_ptr, tmp133
	movl	24(%rax), %eax	; token_ptr_36->type, _23
; src/parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	cmpl	$6, %eax	;, _23
	jne	.L8	;,
; src/parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	movq	FUNC_KEYWORD(%rip), %rdx	; FUNC_KEYWORD, FUNC_KEYWORD.12_24
	movq	-48(%rbp), %rax	; token_ptr, tmp134
	movq	(%rax), %rax	; token_ptr_36->lexeme, _25
	movq	%rdx, %rsi	; FUNC_KEYWORD.12_24,
	movq	%rax, %rdi	; _25,
	call	string_equal@PLT	;
; src/parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	testb	%al, %al	; _26
	je	.L8	;,
; src/parser.c:46:             Function* function = parse_function(lexer, global_scope, parser);
	movq	-88(%rbp), %rdx	; parser, tmp135
	movq	-32(%rbp), %rcx	; global_scope, tmp136
	movq	-72(%rbp), %rax	; lexer, tmp137
	movq	%rcx, %rsi	; tmp136,
	movq	%rax, %rdi	; tmp137,
	call	parse_function	;
	movq	%rax, -16(%rbp)	; tmp138, function
; src/parser.c:47:             if (function == 0)
	cmpq	$0, -16(%rbp)	;, function
	jne	.L9	;,
; src/parser.c:48:                 parser_error("Failed to parse function declaration", token);
	movq	-56(%rbp), %rax	; token, tmp139
	movq	%rax, %rsi	; tmp139,
	leaq	.LC1(%rip), %rax	;, tmp140
	movq	%rax, %rdi	; tmp140,
	call	parser_error@PLT	;
.L9:
; src/parser.c:49:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	-16(%rbp), %rax	; function, tmp141
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; tmp141,
	movl	$0, %esi	;,
	movl	$1, %edi	;,
	call	create_code_member@PLT	;
	movq	%rax, %rdx	;, _27
; src/parser.c:49:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	-40(%rbp), %rax	; members, tmp142
	movq	%rdx, %rsi	; _27,
	movq	%rax, %rdi	; tmp142,
	call	list_append@PLT	;
; src/parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	jmp	.L7	;
.L8:
; src/parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	movq	-48(%rbp), %rax	; token_ptr, tmp143
	movl	24(%rax), %eax	; token_ptr_36->type, _28
; src/parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	cmpl	$6, %eax	;, _28
	jne	.L10	;,
; src/parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	movq	CLASS_KEYWORD(%rip), %rdx	; CLASS_KEYWORD, CLASS_KEYWORD.13_29
	movq	-48(%rbp), %rax	; token_ptr, tmp144
	movq	(%rax), %rax	; token_ptr_36->lexeme, _30
	movq	%rdx, %rsi	; CLASS_KEYWORD.13_29,
	movq	%rax, %rdi	; _30,
	call	string_equal@PLT	;
; src/parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	testb	%al, %al	; _31
	je	.L10	;,
; src/parser.c:51:             Class* class_ = parse_class(lexer, global_scope, parser);
	movq	-88(%rbp), %rdx	; parser, tmp145
	movq	-32(%rbp), %rcx	; global_scope, tmp146
	movq	-72(%rbp), %rax	; lexer, tmp147
	movq	%rcx, %rsi	; tmp146,
	movq	%rax, %rdi	; tmp147,
	call	parse_class	;
	movq	%rax, -8(%rbp)	; tmp148, class_
; src/parser.c:52:             if (class_ == 0)
	cmpq	$0, -8(%rbp)	;, class_
	jne	.L11	;,
; src/parser.c:53:                 parser_error("Failed to parse class declaration", token);
	movq	-56(%rbp), %rax	; token, tmp149
	movq	%rax, %rsi	; tmp149,
	leaq	.LC2(%rip), %rax	;, tmp150
	movq	%rax, %rdi	; tmp150,
	call	parser_error@PLT	;
.L11:
; src/parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	-8(%rbp), %rax	; class_, tmp151
	movq	%rax, %rcx	; tmp151,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$2, %edi	;,
	call	create_code_member@PLT	;
	movq	%rax, %rdx	;, _32
; src/parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	-40(%rbp), %rax	; members, tmp152
	movq	%rdx, %rsi	; _32,
	movq	%rax, %rdi	; tmp152,
	call	list_append@PLT	;
; src/parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	jmp	.L7	;
.L10:
; src/parser.c:56:             parser_error("Unexpected token in code member", token);
	movq	-56(%rbp), %rax	; token, tmp153
	movq	%rax, %rsi	; tmp153,
	leaq	.LC3(%rip), %rax	;, tmp154
	movq	%rax, %rdi	; tmp154,
	call	parser_error@PLT	;
.L7:
; src/parser.c:57:         token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp155
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp155,
	call	get_next_token@PLT	;
	movq	%rax, -56(%rbp)	; tmp156, token
; src/parser.c:58:         token_ptr = token;
	movq	-56(%rbp), %rax	; token, tmp157
	movq	%rax, -48(%rbp)	; tmp157, token_ptr
.L4:
; src/parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	cmpq	$0, -56(%rbp)	;, token
	je	.L12	;,
; src/parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	movq	-48(%rbp), %rax	; token_ptr, tmp158
	movl	24(%rax), %eax	; token_ptr_36->type, _33
; src/parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	testl	%eax, %eax	; _33
	jne	.L13	;,
.L12:
; src/parser.c:60:     return create_code(members, global_scope);
	movq	-32(%rbp), %rdx	; global_scope, tmp159
	movq	-40(%rbp), %rax	; members, tmp160
	movq	%rdx, %rsi	; tmp159,
	movq	%rax, %rdi	; tmp160,
	call	create_code@PLT	;
; src/parser.c:61: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
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
	.text
	.type	parse_import, @function
parse_import:
.LFB7:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$64, %rsp	;,
	movq	%rdi, -56(%rbp)	; lexer, lexer
	movq	%rsi, -64(%rbp)	; now_scope, now_scope
; src/parser.c:66:     Token* token = 0;
	movq	$0, -40(%rbp)	;, token
; src/parser.c:67:     Token* token_ptr = NULL;
	movq	$0, -32(%rbp)	;, token_ptr
; src/parser.c:68:     token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp95
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp95,
	call	get_next_token@PLT	;
	movq	%rax, -40(%rbp)	; tmp96, token
; src/parser.c:69:     token_ptr = token;
	movq	-40(%rbp), %rax	; token, tmp97
	movq	%rax, -32(%rbp)	; tmp97, token_ptr
; src/parser.c:70:     if (token_ptr->type != IDENTIFIER) {
	movq	-32(%rbp), %rax	; token_ptr, tmp98
	movl	24(%rax), %eax	; token_ptr_27->type, _1
; src/parser.c:70:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, %eax	;, _1
	je	.L16	;,
; src/parser.c:71:         parser_error("Expected identifier after 'import'", token);
	movq	-40(%rbp), %rax	; token, tmp99
	movq	%rax, %rsi	; tmp99,
	leaq	.LC4(%rip), %rax	;, tmp100
	movq	%rax, %rdi	; tmp100,
	call	parser_error@PLT	;
; src/parser.c:72:         return NULL;
	movl	$0, %eax	;, _16
	jmp	.L17	;
.L16:
; src/parser.c:74:     string import_name = token_ptr->lexeme;
	movq	-32(%rbp), %rax	; token_ptr, tmp101
	movq	(%rax), %rax	; token_ptr_27->lexeme, tmp102
	movq	%rax, -8(%rbp)	; tmp102, import_name
; src/parser.c:75:     string source = 0;
	movq	$0, -24(%rbp)	;, source
; src/parser.c:76:     token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp103
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp103,
	call	get_next_token@PLT	;
	movq	%rax, -40(%rbp)	; tmp104, token
; src/parser.c:77:     token_ptr = token;
	movq	-40(%rbp), %rax	; token, tmp105
	movq	%rax, -32(%rbp)	; tmp105, token_ptr
; src/parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	movq	-32(%rbp), %rax	; token_ptr, tmp106
	movl	24(%rax), %eax	; token_ptr_32->type, _2
; src/parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	cmpl	$6, %eax	;, _2
	jne	.L18	;,
; src/parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	movq	FROM_KEYWORD(%rip), %rdx	; FROM_KEYWORD, FROM_KEYWORD.14_3
	movq	-32(%rbp), %rax	; token_ptr, tmp107
	movq	(%rax), %rax	; token_ptr_32->lexeme, _4
	movq	%rdx, %rsi	; FROM_KEYWORD.14_3,
	movq	%rax, %rdi	; _4,
	call	string_equal@PLT	;
; src/parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	testb	%al, %al	; _5
	je	.L18	;,
; src/parser.c:79:         token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp108
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp108,
	call	get_next_token@PLT	;
	movq	%rax, -40(%rbp)	; tmp109, token
; src/parser.c:80:         token_ptr = token;
	movq	-40(%rbp), %rax	; token, tmp110
	movq	%rax, -32(%rbp)	; tmp110, token_ptr
; src/parser.c:81:         if (token_ptr->type != STRING) {
	movq	-32(%rbp), %rax	; token_ptr, tmp111
	movl	24(%rax), %eax	; token_ptr_36->type, _6
; src/parser.c:81:         if (token_ptr->type != STRING) {
	cmpl	$4, %eax	;, _6
	je	.L19	;,
; src/parser.c:82:             parser_error("Expected string literal after 'from'", token);
	movq	-40(%rbp), %rax	; token, tmp112
	movq	%rax, %rsi	; tmp112,
	leaq	.LC5(%rip), %rax	;, tmp113
	movq	%rax, %rdi	; tmp113,
	call	parser_error@PLT	;
; src/parser.c:83:             return NULL;
	movl	$0, %eax	;, _16
	jmp	.L17	;
.L19:
; src/parser.c:85:         source = token_ptr->lexeme;
	movq	-32(%rbp), %rax	; token_ptr, tmp114
	movq	(%rax), %rax	; token_ptr_36->lexeme, tmp115
	movq	%rax, -24(%rbp)	; tmp115, source
; src/parser.c:86:         token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp116
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp116,
	call	get_next_token@PLT	;
	movq	%rax, -40(%rbp)	; tmp117, token
; src/parser.c:87:         token_ptr = token;
	movq	-40(%rbp), %rax	; token, tmp118
	movq	%rax, -32(%rbp)	; tmp118, token_ptr
.L18:
; src/parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	-32(%rbp), %rax	; token_ptr, tmp119
	movl	24(%rax), %eax	; token_ptr_13->type, _7
; src/parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	;, _7
	jne	.L20	;,
; src/parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	SEMICOLON_SYMBOL(%rip), %rdx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.15_8
	movq	-32(%rbp), %rax	; token_ptr, tmp120
	movq	(%rax), %rax	; token_ptr_13->lexeme, _9
	movq	%rdx, %rsi	; SEMICOLON_SYMBOL.15_8,
	movq	%rax, %rdi	; _9,
	call	string_equal@PLT	;
; src/parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; _10
	jne	.L21	;,
.L20:
; src/parser.c:90:         parser_error("Expected ';' at end of import statement", token);
	movq	-40(%rbp), %rax	; token, tmp121
	movq	%rax, %rsi	; tmp121,
	leaq	.LC6(%rip), %rax	;, tmp122
	movq	%rax, %rdi	; tmp122,
	call	parser_error@PLT	;
; src/parser.c:91:         return NULL;
	movl	$0, %eax	;, _16
	jmp	.L17	;
.L21:
; src/parser.c:94:     name = parse_import_file(import_name, source, now_scope);
	movq	-64(%rbp), %rdx	; now_scope, tmp123
	movq	-24(%rbp), %rcx	; source, tmp124
	movq	-8(%rbp), %rax	; import_name, tmp125
	movq	%rcx, %rsi	; tmp124,
	movq	%rax, %rdi	; tmp125,
	call	parse_import_file@PLT	;
	movq	%rax, -16(%rbp)	; tmp126, name
; src/parser.c:95:     if (name == 0)
	cmpq	$0, -16(%rbp)	;, name
	jne	.L22	;,
; src/parser.c:96:         name = create_name(import_name, NAME_VARIABLE, name_void, NULL, now_scope);
	movq	name_void(%rip), %rdx	; name_void, name_void.16_11
	movq	-64(%rbp), %rcx	; now_scope, tmp127
	movq	-8(%rbp), %rax	; import_name, tmp128
	movq	%rcx, %r8	; tmp127,
	movl	$0, %ecx	;,
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp128,
	call	create_name@PLT	;
	movq	%rax, -16(%rbp)	; tmp129, name
.L22:
; src/parser.c:97:     return create_import(name, source);
	movq	-24(%rbp), %rdx	; source, tmp130
	movq	-16(%rbp), %rax	; name, tmp131
	movq	%rdx, %rsi	; tmp130,
	movq	%rax, %rdi	; tmp131,
	call	create_import@PLT	;
.L17:
; src/parser.c:98: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE7:
	.size	parse_import, .-parse_import
	.section	.rodata
	.align 8
.LC7:
	.string	"Expected function return type after 'func'"
.LC8:
	.string	"Unknown function return type"
	.align 8
.LC9:
	.string	"Expected function name after return type"
	.align 8
.LC10:
	.string	"Expected '(' after function name"
	.align 8
.LC11:
	.string	"Failed to parse function parameter"
	.align 8
.LC12:
	.string	"Function parameters cannot have default values"
	.align 8
.LC13:
	.string	"Expected ',' or ')' after function parameter"
	.align 8
.LC14:
	.string	"Expected '{' to start function body"
	.align 8
.LC15:
	.string	"Failed to parse function body statement"
	.align 8
.LC16:
	.string	"Unreachable code after return statement"
	.align 8
.LC17:
	.string	"Function missing return statement"
	.text
	.type	parse_function, @function
parse_function:
.LFB8:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$112, %rsp	;,
	movq	%rdi, -88(%rbp)	; lexer, lexer
	movq	%rsi, -96(%rbp)	; now_scope, now_scope
	movq	%rdx, -104(%rbp)	; parser, parser
; src/parser.c:103:     Token* token = 0;
	movq	$0, -72(%rbp)	;, token
; src/parser.c:104:     Token* token_ptr = NULL;
	movq	$0, -64(%rbp)	;, token_ptr
; src/parser.c:105:     Scope* function_scope = create_scope(now_scope);
	movq	-96(%rbp), %rax	; now_scope, tmp118
	movq	%rax, %rdi	; tmp118,
	call	create_scope@PLT	;
	movq	%rax, -56(%rbp)	; tmp119, function_scope
; src/parser.c:106:     token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp120
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp120,
	call	get_next_token@PLT	;
	movq	%rax, -72(%rbp)	; tmp121, token
; src/parser.c:107:     token_ptr = token;
	movq	-72(%rbp), %rax	; token, tmp122
	movq	%rax, -64(%rbp)	; tmp122, token_ptr
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	-64(%rbp), %rax	; token_ptr, tmp123
	movl	24(%rax), %eax	; token_ptr_65->type, _1
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	;, _1
	je	.L24	;,
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	-64(%rbp), %rax	; token_ptr, tmp124
	movl	24(%rax), %eax	; token_ptr_65->type, _2
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	;, _2
	jne	.L25	;,
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	-64(%rbp), %rax	; token_ptr, tmp125
	movq	(%rax), %rax	; token_ptr_65->lexeme, _3
	movq	%rax, %rdi	; _3,
	call	is_builtin_type@PLT	;
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	; _4
	jne	.L24	;,
.L25:
; src/parser.c:109:         parser_error("Expected function return type after 'func'", token);
	movq	-72(%rbp), %rax	; token, tmp126
	movq	%rax, %rsi	; tmp126,
	leaq	.LC7(%rip), %rax	;, tmp127
	movq	%rax, %rdi	; tmp127,
	call	parser_error@PLT	;
; src/parser.c:110:         return NULL;
	movl	$0, %eax	;, _41
	jmp	.L26	;
.L24:
; src/parser.c:112:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	-64(%rbp), %rax	; token_ptr, tmp128
	movq	(%rax), %rdx	; token_ptr_65->lexeme, _5
	movq	-96(%rbp), %rax	; now_scope, tmp129
	movq	%rdx, %rsi	; _5,
	movq	%rax, %rdi	; tmp129,
	call	search@PLT	;
	movq	%rax, -48(%rbp)	; tmp130, return_type
; src/parser.c:113:     if (return_type == 0)
	cmpq	$0, -48(%rbp)	;, return_type
	jne	.L27	;,
; src/parser.c:116:         parser_error("Unknown function return type", token);
	movq	-72(%rbp), %rax	; token, tmp131
	movq	%rax, %rsi	; tmp131,
	leaq	.LC8(%rip), %rax	;, tmp132
	movq	%rax, %rdi	; tmp132,
	call	parser_error@PLT	;
; src/parser.c:117:         return NULL;
	movl	$0, %eax	;, _41
	jmp	.L26	;
.L27:
; src/parser.c:119:     token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp133
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp133,
	call	get_next_token@PLT	;
	movq	%rax, -72(%rbp)	; tmp134, token
; src/parser.c:120:     token_ptr = token;
	movq	-72(%rbp), %rax	; token, tmp135
	movq	%rax, -64(%rbp)	; tmp135, token_ptr
; src/parser.c:121:     if (token_ptr->type != IDENTIFIER) {
	movq	-64(%rbp), %rax	; token_ptr, tmp136
	movl	24(%rax), %eax	; token_ptr_73->type, _6
; src/parser.c:121:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, %eax	;, _6
	je	.L28	;,
; src/parser.c:122:         parser_error("Expected function name after return type", token);
	movq	-72(%rbp), %rax	; token, tmp137
	movq	%rax, %rsi	; tmp137,
	leaq	.LC9(%rip), %rax	;, tmp138
	movq	%rax, %rdi	; tmp138,
	call	parser_error@PLT	;
; src/parser.c:123:         return NULL;
	movl	$0, %eax	;, _41
	jmp	.L26	;
.L28:
; src/parser.c:125:     Name* name = create_name(token_ptr->lexeme, NAME_FUNCTION, return_type, NULL, now_scope);
	movq	-64(%rbp), %rax	; token_ptr, tmp139
	movq	(%rax), %rax	; token_ptr_73->lexeme, _7
	movq	-96(%rbp), %rcx	; now_scope, tmp140
	movq	-48(%rbp), %rdx	; return_type, tmp141
	movq	%rcx, %r8	; tmp140,
	movl	$0, %ecx	;,
	movl	$2, %esi	;,
	movq	%rax, %rdi	; _7,
	call	create_name@PLT	;
	movq	%rax, -40(%rbp)	; tmp142, name
; src/parser.c:126:     token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp143
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp143,
	call	get_next_token@PLT	;
	movq	%rax, -72(%rbp)	; tmp144, token
; src/parser.c:127:     token_ptr = token;
	movq	-72(%rbp), %rax	; token, tmp145
	movq	%rax, -64(%rbp)	; tmp145, token_ptr
; src/parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	-64(%rbp), %rax	; token_ptr, tmp146
	movl	24(%rax), %eax	; token_ptr_78->type, _8
; src/parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _8
	jne	.L29	;,
; src/parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rdx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.17_9
	movq	-64(%rbp), %rax	; token_ptr, tmp147
	movq	(%rax), %rax	; token_ptr_78->lexeme, _10
	movq	%rdx, %rsi	; L_PAREN_SYMBOL.17_9,
	movq	%rax, %rdi	; _10,
	call	string_equal@PLT	;
; src/parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; _11
	jne	.L30	;,
.L29:
; src/parser.c:129:         parser_error("Expected '(' after function name", token);
	movq	-72(%rbp), %rax	; token, tmp148
	movq	%rax, %rsi	; tmp148,
	leaq	.LC10(%rip), %rax	;, tmp149
	movq	%rax, %rdi	; tmp149,
	call	parser_error@PLT	;
; src/parser.c:130:         return NULL;
	movl	$0, %eax	;, _41
	jmp	.L26	;
.L30:
; src/parser.c:132:     token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp150
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp150,
	call	get_next_token@PLT	;
	movq	%rax, -72(%rbp)	; tmp151, token
; src/parser.c:133:     token_ptr = token;
	movq	-72(%rbp), %rax	; token, tmp152
	movq	%rax, -64(%rbp)	; tmp152, token_ptr
; src/parser.c:134:     list(Variable*) parameters = create_list();
	call	create_list@PLT	;
	movq	%rax, -32(%rbp)	; tmp153, parameters
; src/parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L31	;
.L38:
; src/parser.c:136:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	-104(%rbp), %rdx	; parser, tmp154
	movq	-56(%rbp), %rcx	; function_scope, tmp155
	movq	-88(%rbp), %rax	; lexer, tmp156
	movq	%rcx, %rsi	; tmp155,
	movq	%rax, %rdi	; tmp156,
	call	parse_variable	;
	movq	%rax, -8(%rbp)	; tmp157, parameter
; src/parser.c:137:         if (parameter == 0)
	cmpq	$0, -8(%rbp)	;, parameter
	jne	.L32	;,
; src/parser.c:138:             parser_error("Failed to parse function parameter", token);
	movq	-72(%rbp), %rax	; token, tmp158
	movq	%rax, %rsi	; tmp158,
	leaq	.LC11(%rip), %rax	;, tmp159
	movq	%rax, %rdi	; tmp159,
	call	parser_error@PLT	;
	jmp	.L33	;
.L32:
; src/parser.c:139:         else if (parameter->value != 0)
	movq	-8(%rbp), %rax	; parameter, tmp160
	movq	16(%rax), %rax	; parameter_115->value, _12
; src/parser.c:139:         else if (parameter->value != 0)
	testq	%rax, %rax	; _12
	je	.L34	;,
; src/parser.c:140:             parser_error("Function parameters cannot have default values", token);
	movq	-72(%rbp), %rax	; token, tmp161
	movq	%rax, %rsi	; tmp161,
	leaq	.LC12(%rip), %rax	;, tmp162
	movq	%rax, %rdi	; tmp162,
	call	parser_error@PLT	;
	jmp	.L33	;
.L34:
; src/parser.c:142:             list_append(parameters, (pointer)parameter);
	movq	-8(%rbp), %rdx	; parameter, tmp163
	movq	-32(%rbp), %rax	; parameters, tmp164
	movq	%rdx, %rsi	; tmp163,
	movq	%rax, %rdi	; tmp164,
	call	list_append@PLT	;
.L33:
; src/parser.c:143:         token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp165
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp165,
	call	get_next_token@PLT	;
	movq	%rax, -72(%rbp)	; tmp166, token
; src/parser.c:144:         token_ptr = token;
	movq	-72(%rbp), %rax	; token, tmp167
	movq	%rax, -64(%rbp)	; tmp167, token_ptr
; src/parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	-64(%rbp), %rax	; token_ptr, tmp168
	movl	24(%rax), %eax	; token_ptr_121->type, _13
; src/parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, %eax	;, _13
	jne	.L35	;,
; src/parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	COMMA_SYMBOL(%rip), %rdx	; COMMA_SYMBOL, COMMA_SYMBOL.18_14
	movq	-64(%rbp), %rax	; token_ptr, tmp169
	movq	(%rax), %rax	; token_ptr_121->lexeme, _15
	movq	%rdx, %rsi	; COMMA_SYMBOL.18_14,
	movq	%rax, %rdi	; _15,
	call	string_equal@PLT	;
; src/parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	; _16
	je	.L35	;,
; src/parser.c:146:             token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp170
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp170,
	call	get_next_token@PLT	;
	movq	%rax, -72(%rbp)	; tmp171, token
; src/parser.c:147:             token_ptr = token;
	movq	-72(%rbp), %rax	; token, tmp172
	movq	%rax, -64(%rbp)	; tmp172, token_ptr
	jmp	.L31	;
.L35:
; src/parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	-64(%rbp), %rax	; token_ptr, tmp173
	movl	24(%rax), %eax	; token_ptr_121->type, _17
; src/parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _17
	jne	.L37	;,
; src/parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.19_18
	movq	-64(%rbp), %rax	; token_ptr, tmp174
	movq	(%rax), %rax	; token_ptr_121->lexeme, _19
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.19_18,
	movq	%rax, %rdi	; _19,
	call	string_equal@PLT	;
; src/parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _20
	jne	.L31	;,
.L37:
; src/parser.c:149:             parser_error("Expected ',' or ')' after function parameter", token);
	movq	-72(%rbp), %rax	; token, tmp175
	movq	%rax, %rsi	; tmp175,
	leaq	.LC13(%rip), %rax	;, tmp176
	movq	%rax, %rdi	; tmp176,
	call	parser_error@PLT	;
; src/parser.c:150:             return NULL;
	movl	$0, %eax	;, _41
	jmp	.L26	;
.L31:
; src/parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	-64(%rbp), %rax	; token_ptr, tmp177
	movl	24(%rax), %eax	; token_ptr_37->type, _21
; src/parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _21
	jne	.L38	;,
; src/parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.20_22
	movq	-64(%rbp), %rax	; token_ptr, tmp178
	movq	(%rax), %rax	; token_ptr_37->lexeme, _23
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.20_22,
	movq	%rax, %rdi	; _23,
	call	string_equal@PLT	;
; src/parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _24
	je	.L38	;,
; src/parser.c:153:     token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp179
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp179,
	call	get_next_token@PLT	;
	movq	%rax, -72(%rbp)	; tmp180, token
; src/parser.c:154:     token_ptr = token;
	movq	-72(%rbp), %rax	; token, tmp181
	movq	%rax, -64(%rbp)	; tmp181, token_ptr
; src/parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	-64(%rbp), %rax	; token_ptr, tmp182
	movl	24(%rax), %eax	; token_ptr_88->type, _25
; src/parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _25
	jne	.L39	;,
; src/parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rdx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.21_26
	movq	-64(%rbp), %rax	; token_ptr, tmp183
	movq	(%rax), %rax	; token_ptr_88->lexeme, _27
	movq	%rdx, %rsi	; L_BRACE_SYMBOL.21_26,
	movq	%rax, %rdi	; _27,
	call	string_equal@PLT	;
; src/parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; _28
	jne	.L40	;,
.L39:
; src/parser.c:156:         parser_error("Expected '{' to start function body", token);
	movq	-72(%rbp), %rax	; token, tmp184
	movq	%rax, %rsi	; tmp184,
	leaq	.LC14(%rip), %rax	;, tmp185
	movq	%rax, %rdi	; tmp185,
	call	parser_error@PLT	;
; src/parser.c:157:         return NULL;
	movl	$0, %eax	;, _41
	jmp	.L26	;
.L40:
; src/parser.c:159:     list(Statement*) body = create_list();
	call	create_list@PLT	;
	movq	%rax, -24(%rbp)	; tmp186, body
; src/parser.c:160:     parser->in_function = true;
	movq	-104(%rbp), %rax	; parser, tmp187
	movb	$1, (%rax)	;, parser_92(D)->in_function
; src/parser.c:161:     bool have_return = false;
	movb	$0, -73(%rbp)	;, have_return
; src/parser.c:162:     token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp188
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp188,
	call	get_next_token@PLT	;
	movq	%rax, -72(%rbp)	; tmp189, token
; src/parser.c:163:     token_ptr = token;
	movq	-72(%rbp), %rax	; token, tmp190
	movq	%rax, -64(%rbp)	; tmp190, token_ptr
; src/parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L41	;
.L45:
; src/parser.c:165:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	-104(%rbp), %rdx	; parser, tmp191
	movq	-56(%rbp), %rcx	; function_scope, tmp192
	movq	-88(%rbp), %rax	; lexer, tmp193
	movq	%rcx, %rsi	; tmp192,
	movq	%rax, %rdi	; tmp193,
	call	parse_statement	;
	movq	%rax, -16(%rbp)	; tmp194, statement
; src/parser.c:166:         if (statement == 0)
	cmpq	$0, -16(%rbp)	;, statement
	jne	.L42	;,
; src/parser.c:167:             parser_error("Failed to parse function body statement", token);
	movq	-72(%rbp), %rax	; token, tmp195
	movq	%rax, %rsi	; tmp195,
	leaq	.LC15(%rip), %rax	;, tmp196
	movq	%rax, %rdi	; tmp196,
	call	parser_error@PLT	;
	jmp	.L43	;
.L42:
; src/parser.c:168:         else if (have_return)
	cmpb	$0, -73(%rbp)	;, have_return
	je	.L43	;,
; src/parser.c:169:             parser_error("Unreachable code after return statement", token);
	movq	-72(%rbp), %rax	; token, tmp197
	movq	%rax, %rsi	; tmp197,
	leaq	.LC16(%rip), %rax	;, tmp198
	movq	%rax, %rdi	; tmp198,
	call	parser_error@PLT	;
.L43:
; src/parser.c:170:         if (((statement))->type == RETURN_STATEMENT)
	movq	-16(%rbp), %rax	; statement, tmp199
	movl	8(%rax), %eax	; statement_104->type, _29
; src/parser.c:170:         if (((statement))->type == RETURN_STATEMENT)
	cmpl	$5, %eax	;, _29
	jne	.L44	;,
; src/parser.c:171:             have_return = true;
	movb	$1, -73(%rbp)	;, have_return
.L44:
; src/parser.c:172:         list_append(body, (pointer)statement);
	movq	-16(%rbp), %rdx	; statement, tmp200
	movq	-24(%rbp), %rax	; body, tmp201
	movq	%rdx, %rsi	; tmp200,
	movq	%rax, %rdi	; tmp201,
	call	list_append@PLT	;
; src/parser.c:173:         token = get_next_token(lexer, true);
	movq	-88(%rbp), %rax	; lexer, tmp202
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp202,
	call	get_next_token@PLT	;
	movq	%rax, -72(%rbp)	; tmp203, token
; src/parser.c:174:         token_ptr = token;
	movq	-72(%rbp), %rax	; token, tmp204
	movq	%rax, -64(%rbp)	; tmp204, token_ptr
.L41:
; src/parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	-64(%rbp), %rax	; token_ptr, tmp205
	movl	24(%rax), %eax	; token_ptr_38->type, _30
; src/parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _30
	jne	.L45	;,
; src/parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rdx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.22_31
	movq	-64(%rbp), %rax	; token_ptr, tmp206
	movq	(%rax), %rax	; token_ptr_38->lexeme, _32
	movq	%rdx, %rsi	; R_BRACE_SYMBOL.22_31,
	movq	%rax, %rdi	; _32,
	call	string_equal@PLT	;
; src/parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; _33
	je	.L45	;,
; src/parser.c:176:     ((parser))->in_function = false;
	movq	-104(%rbp), %rax	; parser, tmp207
	movb	$0, (%rax)	;, parser_92(D)->in_function
; src/parser.c:177:     if (!have_return && return_type != name_void)
	cmpb	$0, -73(%rbp)	;, have_return
	jne	.L46	;,
; src/parser.c:177:     if (!have_return && return_type != name_void)
	movq	name_void(%rip), %rax	; name_void, name_void.23_34
; src/parser.c:177:     if (!have_return && return_type != name_void)
	cmpq	%rax, -48(%rbp)	; name_void.23_34, return_type
	je	.L46	;,
; src/parser.c:178:         parser_error("Function missing return statement", token);
	movq	-72(%rbp), %rax	; token, tmp208
	movq	%rax, %rsi	; tmp208,
	leaq	.LC17(%rip), %rax	;, tmp209
	movq	%rax, %rdi	; tmp209,
	call	parser_error@PLT	;
.L46:
; src/parser.c:179:     return create_function(name, return_type, parameters, body, function_scope);
	movq	-56(%rbp), %rdi	; function_scope, tmp210
	movq	-24(%rbp), %rcx	; body, tmp211
	movq	-32(%rbp), %rdx	; parameters, tmp212
	movq	-48(%rbp), %rsi	; return_type, tmp213
	movq	-40(%rbp), %rax	; name, tmp214
	movq	%rdi, %r8	; tmp210,
	movq	%rax, %rdi	; tmp214,
	call	create_function@PLT	;
.L26:
; src/parser.c:180: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE8:
	.size	parse_function, .-parse_function
	.section	.rodata
	.align 8
.LC18:
	.string	"Expected method return type after 'method'"
	.align 8
.LC19:
	.string	"Unknown return type for method"
	.align 8
.LC20:
	.string	"Expected method name after return type"
	.align 8
.LC21:
	.string	"Expected '(' after method name"
	.align 8
.LC22:
	.string	"Expected 'self' as first parameter of method"
	.align 8
.LC23:
	.string	"Expected ',' or ')' after method parameter"
	.align 8
.LC24:
	.string	"Failed to parse method parameter"
	.align 8
.LC25:
	.string	"Method parameters cannot have default values"
	.align 8
.LC26:
	.string	"Expected '{' to start method body"
	.align 8
.LC27:
	.string	"Failed to parse method body statement"
	.align 8
.LC28:
	.string	"Method missing return statement"
	.text
	.type	parse_method, @function
parse_method:
.LFB9:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	addq	$-128, %rsp	;,
	movq	%rdi, -104(%rbp)	; lexer, lexer
	movq	%rsi, -112(%rbp)	; now_scope, now_scope
	movq	%rdx, -120(%rbp)	; class_name, class_name
	movq	%rcx, -128(%rbp)	; parser, parser
; src/parser.c:185:     Token* token = 0;
	movq	$0, -80(%rbp)	;, token
; src/parser.c:186:     Token* token_ptr = NULL;
	movq	$0, -72(%rbp)	;, token_ptr
; src/parser.c:187:     Scope* method_scope = create_scope(now_scope);
	movq	-112(%rbp), %rax	; now_scope, tmp124
	movq	%rax, %rdi	; tmp124,
	call	create_scope@PLT	;
	movq	%rax, -64(%rbp)	; tmp125, method_scope
; src/parser.c:188:     Name* self = create_name(SELF_KEYWORD, NAME_VARIABLE, class_name, NULL, method_scope);
	movq	SELF_KEYWORD(%rip), %rax	; SELF_KEYWORD, SELF_KEYWORD.24_1
	movq	-64(%rbp), %rcx	; method_scope, tmp126
	movq	-120(%rbp), %rdx	; class_name, tmp127
	movq	%rcx, %r8	; tmp126,
	movl	$0, %ecx	;,
	movl	$1, %esi	;,
	movq	%rax, %rdi	; SELF_KEYWORD.24_1,
	call	create_name@PLT	;
	movq	%rax, -56(%rbp)	; tmp128, self
; src/parser.c:189:     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp129
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp129,
	call	get_next_token@PLT	;
	movq	%rax, -80(%rbp)	; tmp130, token
; src/parser.c:190:     token_ptr = token;
	movq	-80(%rbp), %rax	; token, tmp131
	movq	%rax, -72(%rbp)	; tmp131, token_ptr
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	-72(%rbp), %rax	; token_ptr, tmp132
	movl	24(%rax), %eax	; token_ptr_77->type, _2
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	;, _2
	je	.L48	;,
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	-72(%rbp), %rax	; token_ptr, tmp133
	movl	24(%rax), %eax	; token_ptr_77->type, _3
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	;, _3
	jne	.L49	;,
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	-72(%rbp), %rax	; token_ptr, tmp134
	movq	(%rax), %rax	; token_ptr_77->lexeme, _4
	movq	%rax, %rdi	; _4,
	call	is_builtin_type@PLT	;
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	; _5
	jne	.L48	;,
.L49:
; src/parser.c:192:         parser_error("Expected method return type after 'method'", token);
	movq	-80(%rbp), %rax	; token, tmp135
	movq	%rax, %rsi	; tmp135,
	leaq	.LC18(%rip), %rax	;, tmp136
	movq	%rax, %rdi	; tmp136,
	call	parser_error@PLT	;
; src/parser.c:193:         return NULL;
	movl	$0, %eax	;, _47
	jmp	.L50	;
.L48:
; src/parser.c:195:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	-72(%rbp), %rax	; token_ptr, tmp137
	movq	(%rax), %rdx	; token_ptr_77->lexeme, _6
	movq	-112(%rbp), %rax	; now_scope, tmp138
	movq	%rdx, %rsi	; _6,
	movq	%rax, %rdi	; tmp138,
	call	search@PLT	;
	movq	%rax, -48(%rbp)	; tmp139, return_type
; src/parser.c:196:     if (return_type == 0) {
	cmpq	$0, -48(%rbp)	;, return_type
	jne	.L51	;,
; src/parser.c:197:         parser_error("Unknown return type for method", token);
	movq	-80(%rbp), %rax	; token, tmp140
	movq	%rax, %rsi	; tmp140,
	leaq	.LC19(%rip), %rax	;, tmp141
	movq	%rax, %rdi	; tmp141,
	call	parser_error@PLT	;
; src/parser.c:198:         return NULL;
	movl	$0, %eax	;, _47
	jmp	.L50	;
.L51:
; src/parser.c:200:     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp142
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp142,
	call	get_next_token@PLT	;
	movq	%rax, -80(%rbp)	; tmp143, token
; src/parser.c:201:     token_ptr = token;
	movq	-80(%rbp), %rax	; token, tmp144
	movq	%rax, -72(%rbp)	; tmp144, token_ptr
; src/parser.c:202:     if (token_ptr->type != IDENTIFIER) {
	movq	-72(%rbp), %rax	; token_ptr, tmp145
	movl	24(%rax), %eax	; token_ptr_85->type, _7
; src/parser.c:202:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, %eax	;, _7
	je	.L52	;,
; src/parser.c:203:         parser_error("Expected method name after return type", token);
	movq	-80(%rbp), %rax	; token, tmp146
	movq	%rax, %rsi	; tmp146,
	leaq	.LC20(%rip), %rax	;, tmp147
	movq	%rax, %rdi	; tmp147,
	call	parser_error@PLT	;
; src/parser.c:204:         return NULL;
	movl	$0, %eax	;, _47
	jmp	.L50	;
.L52:
; src/parser.c:206:     Name* name = create_name(token_ptr->lexeme, NAME_METHOD, return_type, NULL, now_scope);
	movq	-72(%rbp), %rax	; token_ptr, tmp148
	movq	(%rax), %rax	; token_ptr_85->lexeme, _8
	movq	-112(%rbp), %rcx	; now_scope, tmp149
	movq	-48(%rbp), %rdx	; return_type, tmp150
	movq	%rcx, %r8	; tmp149,
	movl	$0, %ecx	;,
	movl	$3, %esi	;,
	movq	%rax, %rdi	; _8,
	call	create_name@PLT	;
	movq	%rax, -40(%rbp)	; tmp151, name
; src/parser.c:207:     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp152
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp152,
	call	get_next_token@PLT	;
	movq	%rax, -80(%rbp)	; tmp153, token
; src/parser.c:208:     token_ptr = token;
	movq	-80(%rbp), %rax	; token, tmp154
	movq	%rax, -72(%rbp)	; tmp154, token_ptr
; src/parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	-72(%rbp), %rax	; token_ptr, tmp155
	movl	24(%rax), %eax	; token_ptr_90->type, _9
; src/parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _9
	jne	.L53	;,
; src/parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rdx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.25_10
	movq	-72(%rbp), %rax	; token_ptr, tmp156
	movq	(%rax), %rax	; token_ptr_90->lexeme, _11
	movq	%rdx, %rsi	; L_PAREN_SYMBOL.25_10,
	movq	%rax, %rdi	; _11,
	call	string_equal@PLT	;
; src/parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; _12
	jne	.L54	;,
.L53:
; src/parser.c:210:         parser_error("Expected '(' after method name", token);
	movq	-80(%rbp), %rax	; token, tmp157
	movq	%rax, %rsi	; tmp157,
	leaq	.LC21(%rip), %rax	;, tmp158
	movq	%rax, %rdi	; tmp158,
	call	parser_error@PLT	;
; src/parser.c:211:         return NULL;
	movl	$0, %eax	;, _47
	jmp	.L50	;
.L54:
; src/parser.c:213:     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp159
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp159,
	call	get_next_token@PLT	;
	movq	%rax, -80(%rbp)	; tmp160, token
; src/parser.c:214:     token_ptr = token;
	movq	-80(%rbp), %rax	; token, tmp161
	movq	%rax, -72(%rbp)	; tmp161, token_ptr
; src/parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	movq	-72(%rbp), %rax	; token_ptr, tmp162
	movl	24(%rax), %eax	; token_ptr_94->type, _13
; src/parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	cmpl	$6, %eax	;, _13
	jne	.L55	;,
; src/parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	movq	SELF_KEYWORD(%rip), %rdx	; SELF_KEYWORD, SELF_KEYWORD.26_14
	movq	-72(%rbp), %rax	; token_ptr, tmp163
	movq	(%rax), %rax	; token_ptr_94->lexeme, _15
	movq	%rdx, %rsi	; SELF_KEYWORD.26_14,
	movq	%rax, %rdi	; _15,
	call	string_equal@PLT	;
; src/parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	testb	%al, %al	; _16
	jne	.L56	;,
.L55:
; src/parser.c:216:         parser_error("Expected 'self' as first parameter of method", token);
	movq	-80(%rbp), %rax	; token, tmp164
	movq	%rax, %rsi	; tmp164,
	leaq	.LC22(%rip), %rax	;, tmp165
	movq	%rax, %rdi	; tmp165,
	call	parser_error@PLT	;
.L56:
; src/parser.c:217:     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp166
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp166,
	call	get_next_token@PLT	;
	movq	%rax, -80(%rbp)	; tmp167, token
; src/parser.c:218:     token_ptr = token;
	movq	-80(%rbp), %rax	; token, tmp168
	movq	%rax, -72(%rbp)	; tmp168, token_ptr
; src/parser.c:219:     list(Variable*) parameters = create_list();
	call	create_list@PLT	;
	movq	%rax, -32(%rbp)	; tmp169, parameters
; src/parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	movq	-56(%rbp), %rcx	; self, tmp170
	movq	-120(%rbp), %rax	; class_name, tmp171
	movl	$0, %edx	;,
	movq	%rcx, %rsi	; tmp170,
	movq	%rax, %rdi	; tmp171,
	call	create_variable@PLT	;
	movq	%rax, %rdx	;, _17
; src/parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	movq	-32(%rbp), %rax	; parameters, tmp172
	movq	%rdx, %rsi	; _17,
	movq	%rax, %rdi	; tmp172,
	call	list_append@PLT	;
; src/parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L57	;
.L65:
; src/parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	-72(%rbp), %rax	; token_ptr, tmp173
	movl	24(%rax), %eax	; token_ptr_43->type, _18
; src/parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, %eax	;, _18
	jne	.L58	;,
; src/parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	COMMA_SYMBOL(%rip), %rdx	; COMMA_SYMBOL, COMMA_SYMBOL.27_19
	movq	-72(%rbp), %rax	; token_ptr, tmp174
	movq	(%rax), %rax	; token_ptr_43->lexeme, _20
	movq	%rdx, %rsi	; COMMA_SYMBOL.27_19,
	movq	%rax, %rdi	; _20,
	call	string_equal@PLT	;
; src/parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	; _21
	je	.L58	;,
; src/parser.c:223:             token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp175
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp175,
	call	get_next_token@PLT	;
	movq	%rax, -80(%rbp)	; tmp176, token
; src/parser.c:224:             token_ptr = token;
	movq	-80(%rbp), %rax	; token, tmp177
	movq	%rax, -72(%rbp)	; tmp177, token_ptr
; src/parser.c:230:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	-128(%rbp), %rdx	; parser, tmp178
	movq	-64(%rbp), %rcx	; method_scope, tmp179
	movq	-104(%rbp), %rax	; lexer, tmp180
	movq	%rcx, %rsi	; tmp179,
	movq	%rax, %rdi	; tmp180,
	call	parse_variable	;
	movq	%rax, -24(%rbp)	; tmp181, parameter
; src/parser.c:231:         if (parameter == 0)
	cmpq	$0, -24(%rbp)	;, parameter
	je	.L59	;,
	jmp	.L74	;
.L58:
; src/parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	movq	-72(%rbp), %rax	; token_ptr, tmp182
	movl	24(%rax), %eax	; token_ptr_43->type, _22
; src/parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, %eax	;, _22
	jne	.L61	;,
; src/parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.28_23
	movq	-72(%rbp), %rax	; token_ptr, tmp183
	movq	(%rax), %rax	; token_ptr_43->lexeme, _24
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.28_23,
	movq	%rax, %rdi	; _24,
	call	string_equal@PLT	;
; src/parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	testb	%al, %al	; _25
	jne	.L62	;,
.L61:
; src/parser.c:227:             parser_error("Expected ',' or ')' after method parameter", token);
	movq	-80(%rbp), %rax	; token, tmp184
	movq	%rax, %rsi	; tmp184,
	leaq	.LC23(%rip), %rax	;, tmp185
	movq	%rax, %rdi	; tmp185,
	call	parser_error@PLT	;
; src/parser.c:228:             return NULL;
	movl	$0, %eax	;, _47
	jmp	.L50	;
.L59:
; src/parser.c:232:             parser_error("Failed to parse method parameter", token);
	movq	-80(%rbp), %rax	; token, tmp186
	movq	%rax, %rsi	; tmp186,
	leaq	.LC24(%rip), %rax	;, tmp187
	movq	%rax, %rdi	; tmp187,
	call	parser_error@PLT	;
	jmp	.L63	;
.L74:
; src/parser.c:233:         else if (((parameter))->value != 0)
	movq	-24(%rbp), %rax	; parameter, tmp188
	movq	16(%rax), %rax	; parameter_111->value, _26
; src/parser.c:233:         else if (((parameter))->value != 0)
	testq	%rax, %rax	; _26
	je	.L64	;,
; src/parser.c:234:             parser_error("Method parameters cannot have default values", token);
	movq	-80(%rbp), %rax	; token, tmp189
	movq	%rax, %rsi	; tmp189,
	leaq	.LC25(%rip), %rax	;, tmp190
	movq	%rax, %rdi	; tmp190,
	call	parser_error@PLT	;
	jmp	.L63	;
.L64:
; src/parser.c:236:             list_append(parameters, (pointer)parameter);
	movq	-24(%rbp), %rdx	; parameter, tmp191
	movq	-32(%rbp), %rax	; parameters, tmp192
	movq	%rdx, %rsi	; tmp191,
	movq	%rax, %rdi	; tmp192,
	call	list_append@PLT	;
.L63:
; src/parser.c:237:         token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp193
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp193,
	call	get_next_token@PLT	;
	movq	%rax, -80(%rbp)	; tmp194, token
; src/parser.c:238:         token_ptr = token;
	movq	-80(%rbp), %rax	; token, tmp195
	movq	%rax, -72(%rbp)	; tmp195, token_ptr
.L57:
; src/parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	-72(%rbp), %rax	; token_ptr, tmp196
	movl	24(%rax), %eax	; token_ptr_43->type, _27
; src/parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _27
	jne	.L65	;,
; src/parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.29_28
	movq	-72(%rbp), %rax	; token_ptr, tmp197
	movq	(%rax), %rax	; token_ptr_43->lexeme, _29
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.29_28,
	movq	%rax, %rdi	; _29,
	call	string_equal@PLT	;
; src/parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _30
	je	.L65	;,
.L62:
; src/parser.c:240:     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp198
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp198,
	call	get_next_token@PLT	;
	movq	%rax, -80(%rbp)	; tmp199, token
; src/parser.c:241:     token_ptr = token;
	movq	-80(%rbp), %rax	; token, tmp200
	movq	%rax, -72(%rbp)	; tmp200, token_ptr
; src/parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	-72(%rbp), %rax	; token_ptr, tmp201
	movl	24(%rax), %eax	; token_ptr_123->type, _31
; src/parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _31
	jne	.L66	;,
; src/parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rdx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.30_32
	movq	-72(%rbp), %rax	; token_ptr, tmp202
	movq	(%rax), %rax	; token_ptr_123->lexeme, _33
	movq	%rdx, %rsi	; L_BRACE_SYMBOL.30_32,
	movq	%rax, %rdi	; _33,
	call	string_equal@PLT	;
; src/parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; _34
	jne	.L67	;,
.L66:
; src/parser.c:243:         parser_error("Expected '{' to start method body", token);
	movq	-80(%rbp), %rax	; token, tmp203
	movq	%rax, %rsi	; tmp203,
	leaq	.LC26(%rip), %rax	;, tmp204
	movq	%rax, %rdi	; tmp204,
	call	parser_error@PLT	;
; src/parser.c:244:         return NULL;
	movl	$0, %eax	;, _47
	jmp	.L50	;
.L67:
; src/parser.c:246:     list(Statement*) body = create_list();
	call	create_list@PLT	;
	movq	%rax, -16(%rbp)	; tmp205, body
; src/parser.c:247:     ((parser))->in_function = true;
	movq	-128(%rbp), %rax	; parser, tmp206
	movb	$1, (%rax)	;, parser_109(D)->in_function
; src/parser.c:248:     ((parser))->in_method = true;
	movq	-128(%rbp), %rax	; parser, tmp207
	movb	$1, 1(%rax)	;, parser_109(D)->in_method
; src/parser.c:249:     bool have_return = false;
	movb	$0, -81(%rbp)	;, have_return
; src/parser.c:250:     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp208
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp208,
	call	get_next_token@PLT	;
	movq	%rax, -80(%rbp)	; tmp209, token
; src/parser.c:251:     token_ptr = token;
	movq	-80(%rbp), %rax	; token, tmp210
	movq	%rax, -72(%rbp)	; tmp210, token_ptr
; src/parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L68	;
.L72:
; src/parser.c:253:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	-128(%rbp), %rdx	; parser, tmp211
	movq	-64(%rbp), %rcx	; method_scope, tmp212
	movq	-104(%rbp), %rax	; lexer, tmp213
	movq	%rcx, %rsi	; tmp212,
	movq	%rax, %rdi	; tmp213,
	call	parse_statement	;
	movq	%rax, -8(%rbp)	; tmp214, statement
; src/parser.c:254:         if (statement == 0)
	cmpq	$0, -8(%rbp)	;, statement
	jne	.L69	;,
; src/parser.c:255:             parser_error("Failed to parse method body statement", token);
	movq	-80(%rbp), %rax	; token, tmp215
	movq	%rax, %rsi	; tmp215,
	leaq	.LC27(%rip), %rax	;, tmp216
	movq	%rax, %rdi	; tmp216,
	call	parser_error@PLT	;
	jmp	.L70	;
.L69:
; src/parser.c:256:         else if (have_return)
	cmpb	$0, -81(%rbp)	;, have_return
	je	.L70	;,
; src/parser.c:257:             parser_error("Unreachable code after return statement", token);
	movq	-80(%rbp), %rax	; token, tmp217
	movq	%rax, %rsi	; tmp217,
	leaq	.LC16(%rip), %rax	;, tmp218
	movq	%rax, %rdi	; tmp218,
	call	parser_error@PLT	;
.L70:
; src/parser.c:258:         if (((statement))->type == RETURN_STATEMENT)
	movq	-8(%rbp), %rax	; statement, tmp219
	movl	8(%rax), %eax	; statement_140->type, _35
; src/parser.c:258:         if (((statement))->type == RETURN_STATEMENT)
	cmpl	$5, %eax	;, _35
	jne	.L71	;,
; src/parser.c:259:             have_return = true;
	movb	$1, -81(%rbp)	;, have_return
.L71:
; src/parser.c:260:         list_append(body, (pointer)statement);
	movq	-8(%rbp), %rdx	; statement, tmp220
	movq	-16(%rbp), %rax	; body, tmp221
	movq	%rdx, %rsi	; tmp220,
	movq	%rax, %rdi	; tmp221,
	call	list_append@PLT	;
; src/parser.c:261:         token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp222
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp222,
	call	get_next_token@PLT	;
	movq	%rax, -80(%rbp)	; tmp223, token
; src/parser.c:262:         token_ptr = token;
	movq	-80(%rbp), %rax	; token, tmp224
	movq	%rax, -72(%rbp)	; tmp224, token_ptr
.L68:
; src/parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	-72(%rbp), %rax	; token_ptr, tmp225
	movl	24(%rax), %eax	; token_ptr_44->type, _36
; src/parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _36
	jne	.L72	;,
; src/parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rdx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.31_37
	movq	-72(%rbp), %rax	; token_ptr, tmp226
	movq	(%rax), %rax	; token_ptr_44->lexeme, _38
	movq	%rdx, %rsi	; R_BRACE_SYMBOL.31_37,
	movq	%rax, %rdi	; _38,
	call	string_equal@PLT	;
; src/parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; _39
	je	.L72	;,
; src/parser.c:264:     ((parser))->in_function = false;
	movq	-128(%rbp), %rax	; parser, tmp227
	movb	$0, (%rax)	;, parser_109(D)->in_function
; src/parser.c:265:     ((parser))->in_method = false;
	movq	-128(%rbp), %rax	; parser, tmp228
	movb	$0, 1(%rax)	;, parser_109(D)->in_method
; src/parser.c:266:     if (!have_return && return_type != name_void)
	cmpb	$0, -81(%rbp)	;, have_return
	jne	.L73	;,
; src/parser.c:266:     if (!have_return && return_type != name_void)
	movq	name_void(%rip), %rax	; name_void, name_void.32_40
; src/parser.c:266:     if (!have_return && return_type != name_void)
	cmpq	%rax, -48(%rbp)	; name_void.32_40, return_type
	je	.L73	;,
; src/parser.c:267:         parser_error("Method missing return statement", token);
	movq	-80(%rbp), %rax	; token, tmp229
	movq	%rax, %rsi	; tmp229,
	leaq	.LC28(%rip), %rax	;, tmp230
	movq	%rax, %rdi	; tmp230,
	call	parser_error@PLT	;
.L73:
; src/parser.c:268:     return create_method(name, return_type, parameters, body, method_scope);
	movq	-64(%rbp), %rdi	; method_scope, tmp231
	movq	-16(%rbp), %rcx	; body, tmp232
	movq	-32(%rbp), %rdx	; parameters, tmp233
	movq	-48(%rbp), %rsi	; return_type, tmp234
	movq	-40(%rbp), %rax	; name, tmp235
	movq	%rdi, %r8	; tmp231,
	movq	%rax, %rdi	; tmp235,
	call	create_method@PLT	;
.L50:
; src/parser.c:269: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE9:
	.size	parse_method, .-parse_method
	.section	.rodata
	.align 8
.LC29:
	.string	"Expected class name after 'class'"
	.align 8
.LC30:
	.string	"Expected '{' to start class body"
.LC31:
	.string	"Failed to parse class method"
	.align 8
.LC32:
	.string	"Failed to parse class variable"
	.align 8
.LC33:
	.string	"Expected ';' after class variable declaration"
	.align 8
.LC34:
	.string	"Unexpected token in class member"
	.text
	.type	parse_class, @function
parse_class:
.LFB10:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$96, %rsp	;,
	movq	%rdi, -72(%rbp)	; lexer, lexer
	movq	%rsi, -80(%rbp)	; now_scope, now_scope
	movq	%rdx, -88(%rbp)	; parser, parser
; src/parser.c:274:     Token* token = 0;
	movq	$0, -56(%rbp)	;, token
; src/parser.c:275:     Token* token_ptr = NULL;
	movq	$0, -48(%rbp)	;, token_ptr
; src/parser.c:276:     Scope* class_scope = create_scope(now_scope);
	movq	-80(%rbp), %rax	; now_scope, tmp108
	movq	%rax, %rdi	; tmp108,
	call	create_scope@PLT	;
	movq	%rax, -40(%rbp)	; tmp109, class_scope
; src/parser.c:277:     token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp110
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp110,
	call	get_next_token@PLT	;
	movq	%rax, -56(%rbp)	; tmp111, token
; src/parser.c:278:     token_ptr = token;
	movq	-56(%rbp), %rax	; token, tmp112
	movq	%rax, -48(%rbp)	; tmp112, token_ptr
; src/parser.c:279:     if (token_ptr->type != IDENTIFIER) {
	movq	-48(%rbp), %rax	; token_ptr, tmp113
	movl	24(%rax), %eax	; token_ptr_48->type, _1
; src/parser.c:279:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, %eax	;, _1
	je	.L76	;,
; src/parser.c:280:         parser_error("Expected class name after 'class'", token);
	movq	-56(%rbp), %rax	; token, tmp114
	movq	%rax, %rsi	; tmp114,
	leaq	.LC29(%rip), %rax	;, tmp115
	movq	%rax, %rdi	; tmp115,
	call	parser_error@PLT	;
; src/parser.c:281:         return NULL;
	movl	$0, %eax	;, _27
	jmp	.L77	;
.L76:
; src/parser.c:283:     Name* name = create_name(token_ptr->lexeme, NAME_CLASS, NULL, class_scope, now_scope);
	movq	-48(%rbp), %rax	; token_ptr, tmp116
	movq	(%rax), %rax	; token_ptr_48->lexeme, _2
	movq	-80(%rbp), %rcx	; now_scope, tmp117
	movq	-40(%rbp), %rdx	; class_scope, tmp118
	movq	%rcx, %r8	; tmp117,
	movq	%rdx, %rcx	; tmp118,
	movl	$0, %edx	;,
	movl	$4, %esi	;,
	movq	%rax, %rdi	; _2,
	call	create_name@PLT	;
	movq	%rax, -32(%rbp)	; tmp119, name
; src/parser.c:284:     token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp120
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp120,
	call	get_next_token@PLT	;
	movq	%rax, -56(%rbp)	; tmp121, token
; src/parser.c:285:     token_ptr = token;
	movq	-56(%rbp), %rax	; token, tmp122
	movq	%rax, -48(%rbp)	; tmp122, token_ptr
; src/parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	-48(%rbp), %rax	; token_ptr, tmp123
	movl	24(%rax), %eax	; token_ptr_53->type, _3
; src/parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _3
	jne	.L78	;,
; src/parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rdx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.33_4
	movq	-48(%rbp), %rax	; token_ptr, tmp124
	movq	(%rax), %rax	; token_ptr_53->lexeme, _5
	movq	%rdx, %rsi	; L_BRACE_SYMBOL.33_4,
	movq	%rax, %rdi	; _5,
	call	string_equal@PLT	;
; src/parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; _6
	jne	.L79	;,
.L78:
; src/parser.c:287:         parser_error("Expected '{' to start class body", token);
	movq	-56(%rbp), %rax	; token, tmp125
	movq	%rax, %rsi	; tmp125,
	leaq	.LC30(%rip), %rax	;, tmp126
	movq	%rax, %rdi	; tmp126,
	call	parser_error@PLT	;
; src/parser.c:288:         return NULL;
	movl	$0, %eax	;, _27
	jmp	.L77	;
.L79:
; src/parser.c:290:     list(ClassMember*) members = create_list();
	call	create_list@PLT	;
	movq	%rax, -24(%rbp)	; tmp127, members
; src/parser.c:291:     token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp128
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp128,
	call	get_next_token@PLT	;
	movq	%rax, -56(%rbp)	; tmp129, token
; src/parser.c:292:     token_ptr = token;
	movq	-56(%rbp), %rax	; token, tmp130
	movq	%rax, -48(%rbp)	; tmp130, token_ptr
; src/parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L80	;
.L88:
; src/parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	movq	-48(%rbp), %rax	; token_ptr, tmp131
	movl	24(%rax), %eax	; token_ptr_26->type, _7
; src/parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	;, _7
	jne	.L81	;,
; src/parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	movq	METHOD_KEYWORD(%rip), %rdx	; METHOD_KEYWORD, METHOD_KEYWORD.34_8
	movq	-48(%rbp), %rax	; token_ptr, tmp132
	movq	(%rax), %rax	; token_ptr_26->lexeme, _9
	movq	%rdx, %rsi	; METHOD_KEYWORD.34_8,
	movq	%rax, %rdi	; _9,
	call	string_equal@PLT	;
; src/parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	testb	%al, %al	; _10
	je	.L81	;,
; src/parser.c:295:             Method* method = parse_method(lexer, class_scope, name, parser);
	movq	-88(%rbp), %rcx	; parser, tmp133
	movq	-32(%rbp), %rdx	; name, tmp134
	movq	-40(%rbp), %rsi	; class_scope, tmp135
	movq	-72(%rbp), %rax	; lexer, tmp136
	movq	%rax, %rdi	; tmp136,
	call	parse_method	;
	movq	%rax, -16(%rbp)	; tmp137, method
; src/parser.c:296:             if (method == 0)
	cmpq	$0, -16(%rbp)	;, method
	jne	.L82	;,
; src/parser.c:297:                 parser_error("Failed to parse class method", token);
	movq	-56(%rbp), %rax	; token, tmp138
	movq	%rax, %rsi	; tmp138,
	leaq	.LC31(%rip), %rax	;, tmp139
	movq	%rax, %rdi	; tmp139,
	call	parser_error@PLT	;
.L82:
; src/parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	-16(%rbp), %rax	; method, tmp140
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp140,
	movl	$0, %edi	;,
	call	create_class_member@PLT	;
	movq	%rax, %rdx	;, _11
; src/parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	-24(%rbp), %rax	; members, tmp141
	movq	%rdx, %rsi	; _11,
	movq	%rax, %rdi	; tmp141,
	call	list_append@PLT	;
; src/parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	jmp	.L83	;
.L81:
; src/parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	-48(%rbp), %rax	; token_ptr, tmp142
	movl	24(%rax), %eax	; token_ptr_26->type, _12
; src/parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	cmpl	$6, %eax	;, _12
	jne	.L84	;,
; src/parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	VAR_KEYWORD(%rip), %rdx	; VAR_KEYWORD, VAR_KEYWORD.35_13
	movq	-48(%rbp), %rax	; token_ptr, tmp143
	movq	(%rax), %rax	; token_ptr_26->lexeme, _14
	movq	%rdx, %rsi	; VAR_KEYWORD.35_13,
	movq	%rax, %rdi	; _14,
	call	string_equal@PLT	;
; src/parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	; _15
	je	.L84	;,
; src/parser.c:300:             token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp144
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp144,
	call	get_next_token@PLT	;
	movq	%rax, -56(%rbp)	; tmp145, token
; src/parser.c:301:             token_ptr = token;
	movq	-56(%rbp), %rax	; token, tmp146
	movq	%rax, -48(%rbp)	; tmp146, token_ptr
; src/parser.c:302:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	-88(%rbp), %rdx	; parser, tmp147
	movq	-40(%rbp), %rcx	; class_scope, tmp148
	movq	-72(%rbp), %rax	; lexer, tmp149
	movq	%rcx, %rsi	; tmp148,
	movq	%rax, %rdi	; tmp149,
	call	parse_variable	;
	movq	%rax, -8(%rbp)	; tmp150, variable
; src/parser.c:303:             if (variable == 0)
	cmpq	$0, -8(%rbp)	;, variable
	jne	.L85	;,
; src/parser.c:304:                 parser_error("Failed to parse class variable", token);
	movq	-56(%rbp), %rax	; token, tmp151
	movq	%rax, %rsi	; tmp151,
	leaq	.LC32(%rip), %rax	;, tmp152
	movq	%rax, %rdi	; tmp152,
	call	parser_error@PLT	;
.L85:
; src/parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	-8(%rbp), %rax	; variable, tmp153
	movq	%rax, %rdx	; tmp153,
	movl	$0, %esi	;,
	movl	$1, %edi	;,
	call	create_class_member@PLT	;
	movq	%rax, %rdx	;, _16
; src/parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	-24(%rbp), %rax	; members, tmp154
	movq	%rdx, %rsi	; _16,
	movq	%rax, %rdi	; tmp154,
	call	list_append@PLT	;
; src/parser.c:306:             token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp155
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp155,
	call	get_next_token@PLT	;
	movq	%rax, -56(%rbp)	; tmp156, token
; src/parser.c:307:             token_ptr = token;
	movq	-56(%rbp), %rax	; token, tmp157
	movq	%rax, -48(%rbp)	; tmp157, token_ptr
; src/parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	-48(%rbp), %rax	; token_ptr, tmp158
	movl	24(%rax), %eax	; token_ptr_81->type, _17
; src/parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, %eax	;, _17
	jne	.L86	;,
; src/parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	SEMICOLON_SYMBOL(%rip), %rdx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.36_18
	movq	-48(%rbp), %rax	; token_ptr, tmp159
	movq	(%rax), %rax	; token_ptr_81->lexeme, _19
	movq	%rdx, %rsi	; SEMICOLON_SYMBOL.36_18,
	movq	%rax, %rdi	; _19,
	call	string_equal@PLT	;
; src/parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; _20
	jne	.L89	;,
.L86:
; src/parser.c:309:                 parser_error("Expected ';' after class variable declaration", token);
	movq	-56(%rbp), %rax	; token, tmp160
	movq	%rax, %rsi	; tmp160,
	leaq	.LC33(%rip), %rax	;, tmp161
	movq	%rax, %rdi	; tmp161,
	call	parser_error@PLT	;
; src/parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	jmp	.L89	;
.L84:
; src/parser.c:311:             parser_error("Unexpected token in class member", token);
	movq	-56(%rbp), %rax	; token, tmp162
	movq	%rax, %rsi	; tmp162,
	leaq	.LC34(%rip), %rax	;, tmp163
	movq	%rax, %rdi	; tmp163,
	call	parser_error@PLT	;
	jmp	.L83	;
.L89:
; src/parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	nop	
.L83:
; src/parser.c:312:         token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp164
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp164,
	call	get_next_token@PLT	;
	movq	%rax, -56(%rbp)	; tmp165, token
; src/parser.c:313:         token_ptr = token;
	movq	-56(%rbp), %rax	; token, tmp166
	movq	%rax, -48(%rbp)	; tmp166, token_ptr
.L80:
; src/parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	-48(%rbp), %rax	; token_ptr, tmp167
	movl	24(%rax), %eax	; token_ptr_26->type, _21
; src/parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _21
	jne	.L88	;,
; src/parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rdx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.37_22
	movq	-48(%rbp), %rax	; token_ptr, tmp168
	movq	(%rax), %rax	; token_ptr_26->lexeme, _23
	movq	%rdx, %rsi	; R_BRACE_SYMBOL.37_22,
	movq	%rax, %rdi	; _23,
	call	string_equal@PLT	;
; src/parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; _24
	je	.L88	;,
; src/parser.c:315:     return create_class(name, members, class_scope);
	movq	-40(%rbp), %rdx	; class_scope, tmp169
	movq	-24(%rbp), %rcx	; members, tmp170
	movq	-32(%rbp), %rax	; name, tmp171
	movq	%rcx, %rsi	; tmp170,
	movq	%rax, %rdi	; tmp171,
	call	create_class@PLT	;
.L77:
; src/parser.c:316: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE10:
	.size	parse_class, .-parse_class
	.section	.rodata
.LC35:
	.string	"Expected variable type"
	.align 8
.LC36:
	.string	"Expected a type for variable declaration"
.LC37:
	.string	"Unknown variable type"
.LC38:
	.string	"Expected variable name"
	.align 8
.LC39:
	.string	"Failed to parse variable initializer"
	.text
	.type	parse_variable, @function
parse_variable:
.LFB11:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$80, %rsp	;,
	movq	%rdi, -56(%rbp)	; lexer, lexer
	movq	%rsi, -64(%rbp)	; now_scope, now_scope
	movq	%rdx, -72(%rbp)	; parser, parser
; src/parser.c:321:     Token* token = 0;
	movq	$0, -40(%rbp)	;, token
; src/parser.c:322:     Token* token_ptr = NULL;
	movq	$0, -32(%rbp)	;, token_ptr
; src/parser.c:323:     token = peek_current_token(lexer);
	movq	-56(%rbp), %rax	; lexer, tmp97
	movq	%rax, %rdi	; tmp97,
	call	peek_current_token@PLT	;
	movq	%rax, -40(%rbp)	; tmp98, token
; src/parser.c:324:     token_ptr = token;
	movq	-40(%rbp), %rax	; token, tmp99
	movq	%rax, -32(%rbp)	; tmp99, token_ptr
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	-32(%rbp), %rax	; token_ptr, tmp100
	movl	24(%rax), %eax	; token_ptr_28->type, _1
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	;, _1
	je	.L91	;,
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	-32(%rbp), %rax	; token_ptr, tmp101
	movl	24(%rax), %eax	; token_ptr_28->type, _2
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	;, _2
	jne	.L92	;,
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	-32(%rbp), %rax	; token_ptr, tmp102
	movq	(%rax), %rax	; token_ptr_28->lexeme, _3
	movq	%rax, %rdi	; _3,
	call	is_builtin_type@PLT	;
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	; _4
	jne	.L91	;,
.L92:
; src/parser.c:326:         parser_error("Expected variable type", token);
	movq	-40(%rbp), %rax	; token, tmp103
	movq	%rax, %rsi	; tmp103,
	leaq	.LC35(%rip), %rax	;, tmp104
	movq	%rax, %rdi	; tmp104,
	call	parser_error@PLT	;
; src/parser.c:327:         return NULL;
	movl	$0, %eax	;, _15
	jmp	.L93	;
.L91:
; src/parser.c:329:     Name* type = search(now_scope, token_ptr->lexeme);
	movq	-32(%rbp), %rax	; token_ptr, tmp105
	movq	(%rax), %rdx	; token_ptr_28->lexeme, _5
	movq	-64(%rbp), %rax	; now_scope, tmp106
	movq	%rdx, %rsi	; _5,
	movq	%rax, %rdi	; tmp106,
	call	search@PLT	;
	movq	%rax, -24(%rbp)	; tmp107, type
; src/parser.c:330:     if (type != 0) {
	cmpq	$0, -24(%rbp)	;, type
	je	.L94	;,
; src/parser.c:331:         Name* type_ptr = (type);
	movq	-24(%rbp), %rax	; type, tmp108
	movq	%rax, -16(%rbp)	; tmp108, type_ptr
; src/parser.c:332:         if (type_ptr->kind != NAME_TYPE && type_ptr->kind != NAME_CLASS)
	movq	-16(%rbp), %rax	; type_ptr, tmp109
	movl	24(%rax), %eax	; type_ptr_36->kind, _6
; src/parser.c:332:         if (type_ptr->kind != NAME_TYPE && type_ptr->kind != NAME_CLASS)
	testl	%eax, %eax	; _6
	je	.L95	;,
; src/parser.c:332:         if (type_ptr->kind != NAME_TYPE && type_ptr->kind != NAME_CLASS)
	movq	-16(%rbp), %rax	; type_ptr, tmp110
	movl	24(%rax), %eax	; type_ptr_36->kind, _7
; src/parser.c:332:         if (type_ptr->kind != NAME_TYPE && type_ptr->kind != NAME_CLASS)
	cmpl	$4, %eax	;, _7
	je	.L95	;,
; src/parser.c:333:             parser_error("Expected a type for variable declaration", token);
	movq	-40(%rbp), %rax	; token, tmp111
	movq	%rax, %rsi	; tmp111,
	leaq	.LC36(%rip), %rax	;, tmp112
	movq	%rax, %rdi	; tmp112,
	call	parser_error@PLT	;
	jmp	.L95	;
.L94:
; src/parser.c:335:         parser_error("Unknown variable type", token);
	movq	-40(%rbp), %rax	; token, tmp113
	movq	%rax, %rsi	; tmp113,
	leaq	.LC37(%rip), %rax	;, tmp114
	movq	%rax, %rdi	; tmp114,
	call	parser_error@PLT	;
.L95:
; src/parser.c:336:     token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp115
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp115,
	call	get_next_token@PLT	;
	movq	%rax, -40(%rbp)	; tmp116, token
; src/parser.c:337:     token_ptr = token;
	movq	-40(%rbp), %rax	; token, tmp117
	movq	%rax, -32(%rbp)	; tmp117, token_ptr
; src/parser.c:338:     if (token_ptr->type != IDENTIFIER)
	movq	-32(%rbp), %rax	; token_ptr, tmp118
	movl	24(%rax), %eax	; token_ptr_40->type, _8
; src/parser.c:338:     if (token_ptr->type != IDENTIFIER)
	cmpl	$1, %eax	;, _8
	je	.L96	;,
; src/parser.c:339:         parser_error("Expected variable name", token);
	movq	-40(%rbp), %rax	; token, tmp119
	movq	%rax, %rsi	; tmp119,
	leaq	.LC38(%rip), %rax	;, tmp120
	movq	%rax, %rdi	; tmp120,
	call	parser_error@PLT	;
.L96:
; src/parser.c:340:     Name* name = create_name(token_ptr->lexeme, NAME_VARIABLE, type, NULL, now_scope);
	movq	-32(%rbp), %rax	; token_ptr, tmp121
	movq	(%rax), %rax	; token_ptr_40->lexeme, _9
	movq	-64(%rbp), %rcx	; now_scope, tmp122
	movq	-24(%rbp), %rdx	; type, tmp123
	movq	%rcx, %r8	; tmp122,
	movl	$0, %ecx	;,
	movl	$1, %esi	;,
	movq	%rax, %rdi	; _9,
	call	create_name@PLT	;
	movq	%rax, -8(%rbp)	; tmp124, name
; src/parser.c:341:     Expression* value = 0;
	movq	$0, -48(%rbp)	;, value
; src/parser.c:342:     token = peek_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp125
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp125,
	call	peek_next_token@PLT	;
	movq	%rax, -40(%rbp)	; tmp126, token
; src/parser.c:343:     token_ptr = token;
	movq	-40(%rbp), %rax	; token, tmp127
	movq	%rax, -32(%rbp)	; tmp127, token_ptr
; src/parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	movq	-32(%rbp), %rax	; token_ptr, tmp128
	movl	24(%rax), %eax	; token_ptr_47->type, _10
; src/parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, %eax	;, _10
	jne	.L97	;,
; src/parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	movq	ASSIGN_SYMBOL(%rip), %rdx	; ASSIGN_SYMBOL, ASSIGN_SYMBOL.38_11
	movq	-32(%rbp), %rax	; token_ptr, tmp129
	movq	(%rax), %rax	; token_ptr_47->lexeme, _12
	movq	%rdx, %rsi	; ASSIGN_SYMBOL.38_11,
	movq	%rax, %rdi	; _12,
	call	string_equal@PLT	;
; src/parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	; _13
	je	.L97	;,
; src/parser.c:345:         token = get_next_token(lexer, true);  // consume '='
	movq	-56(%rbp), %rax	; lexer, tmp130
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp130,
	call	get_next_token@PLT	;
	movq	%rax, -40(%rbp)	; tmp131, token
; src/parser.c:346:         token_ptr = token;
	movq	-40(%rbp), %rax	; token, tmp132
	movq	%rax, -32(%rbp)	; tmp132, token_ptr
; src/parser.c:347:         token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp133
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp133,
	call	get_next_token@PLT	;
	movq	%rax, -40(%rbp)	; tmp134, token
; src/parser.c:348:         token_ptr = token;
	movq	-40(%rbp), %rax	; token, tmp135
	movq	%rax, -32(%rbp)	; tmp135, token_ptr
; src/parser.c:349:         value = parse_expression(lexer, now_scope, parser);
	movq	-72(%rbp), %rdx	; parser, tmp136
	movq	-64(%rbp), %rcx	; now_scope, tmp137
	movq	-56(%rbp), %rax	; lexer, tmp138
	movq	%rcx, %rsi	; tmp137,
	movq	%rax, %rdi	; tmp138,
	call	parse_expression	;
	movq	%rax, -48(%rbp)	; tmp139, value
; src/parser.c:350:         if (value == 0)
	cmpq	$0, -48(%rbp)	;, value
	jne	.L97	;,
; src/parser.c:351:             parser_error("Failed to parse variable initializer", token);
	movq	-40(%rbp), %rax	; token, tmp140
	movq	%rax, %rsi	; tmp140,
	leaq	.LC39(%rip), %rax	;, tmp141
	movq	%rax, %rdi	; tmp141,
	call	parser_error@PLT	;
.L97:
; src/parser.c:353:     return create_variable(type, name, value);
	movq	-48(%rbp), %rdx	; value, tmp142
	movq	-8(%rbp), %rcx	; name, tmp143
	movq	-24(%rbp), %rax	; type, tmp144
	movq	%rcx, %rsi	; tmp143,
	movq	%rax, %rdi	; tmp144,
	call	create_variable@PLT	;
.L93:
; src/parser.c:354: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE11:
	.size	parse_variable, .-parse_variable
	.section	.rodata
	.align 8
.LC40:
	.string	"Cannot use 'break' outside of a loop"
	.align 8
.LC41:
	.string	"Cannot use 'continue' outside of a loop"
.LC42:
	.string	"Failed to parse statement"
.LC43:
	.string	"Expected ';' after statement"
	.text
	.type	parse_statement, @function
parse_statement:
.LFB12:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$64, %rsp	;,
	movq	%rdi, -40(%rbp)	; lexer, lexer
	movq	%rsi, -48(%rbp)	; now_scope, now_scope
	movq	%rdx, -56(%rbp)	; parser, parser
; src/parser.c:359:     Token* token = 0;
	movq	$0, -16(%rbp)	;, token
; src/parser.c:360:     Token* token_ptr = NULL;
	movq	$0, -8(%rbp)	;, token_ptr
; src/parser.c:361:     token = peek_current_token(lexer);
	movq	-40(%rbp), %rax	; lexer, tmp119
	movq	%rax, %rdi	; tmp119,
	call	peek_current_token@PLT	;
	movq	%rax, -16(%rbp)	; tmp120, token
; src/parser.c:362:     token_ptr = token;
	movq	-16(%rbp), %rax	; token, tmp121
	movq	%rax, -8(%rbp)	; tmp121, token_ptr
; src/parser.c:363:     Statement* statement = 0;
	movq	$0, -24(%rbp)	;, statement
; src/parser.c:364:     if (token_ptr->type == KEYWORD) {
	movq	-8(%rbp), %rax	; token_ptr, tmp122
	movl	24(%rax), %eax	; token_ptr_49->type, _1
; src/parser.c:364:     if (token_ptr->type == KEYWORD) {
	cmpl	$6, %eax	;, _1
	jne	.L99	;,
; src/parser.c:365:         if (string_equal(token_ptr->lexeme, IF_KEYWORD))
	movq	IF_KEYWORD(%rip), %rdx	; IF_KEYWORD, IF_KEYWORD.39_2
	movq	-8(%rbp), %rax	; token_ptr, tmp123
	movq	(%rax), %rax	; token_ptr_49->lexeme, _3
	movq	%rdx, %rsi	; IF_KEYWORD.39_2,
	movq	%rax, %rdi	; _3,
	call	string_equal@PLT	;
; src/parser.c:365:         if (string_equal(token_ptr->lexeme, IF_KEYWORD))
	testb	%al, %al	; _4
	je	.L100	;,
; src/parser.c:366:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movq	-56(%rbp), %rdx	; parser, tmp124
	movq	-48(%rbp), %rcx	; now_scope, tmp125
	movq	-40(%rbp), %rax	; lexer, tmp126
	movq	%rcx, %rsi	; tmp125,
	movq	%rax, %rdi	; tmp126,
	call	parse_if	;
; src/parser.c:366:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _5,
	movl	$2, %edi	;,
	call	create_statement@PLT	;
; src/parser.c:366:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	jmp	.L101	;
.L100:
; src/parser.c:367:         else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
	movq	FOR_KEYWORD(%rip), %rdx	; FOR_KEYWORD, FOR_KEYWORD.40_6
	movq	-8(%rbp), %rax	; token_ptr, tmp127
	movq	(%rax), %rax	; token_ptr_49->lexeme, _7
	movq	%rdx, %rsi	; FOR_KEYWORD.40_6,
	movq	%rax, %rdi	; _7,
	call	string_equal@PLT	;
; src/parser.c:367:         else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
	testb	%al, %al	; _8
	je	.L102	;,
; src/parser.c:368:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movq	-56(%rbp), %rdx	; parser, tmp128
	movq	-48(%rbp), %rcx	; now_scope, tmp129
	movq	-40(%rbp), %rax	; lexer, tmp130
	movq	%rcx, %rsi	; tmp129,
	movq	%rax, %rdi	; tmp130,
	call	parse_for	;
; src/parser.c:368:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movq	%rax, %rcx	; _9,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$4, %edi	;,
	call	create_statement@PLT	;
; src/parser.c:368:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L101	;
.L102:
; src/parser.c:369:         else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
	movq	WHILE_KEYWORD(%rip), %rdx	; WHILE_KEYWORD, WHILE_KEYWORD.41_10
	movq	-8(%rbp), %rax	; token_ptr, tmp131
	movq	(%rax), %rax	; token_ptr_49->lexeme, _11
	movq	%rdx, %rsi	; WHILE_KEYWORD.41_10,
	movq	%rax, %rdi	; _11,
	call	string_equal@PLT	;
; src/parser.c:369:         else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
	testb	%al, %al	; _12
	je	.L103	;,
; src/parser.c:370:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movq	-56(%rbp), %rdx	; parser, tmp132
	movq	-48(%rbp), %rcx	; now_scope, tmp133
	movq	-40(%rbp), %rax	; lexer, tmp134
	movq	%rcx, %rsi	; tmp133,
	movq	%rax, %rdi	; tmp134,
	call	parse_while	;
; src/parser.c:370:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; _13,
	movl	$0, %esi	;,
	movl	$3, %edi	;,
	call	create_statement@PLT	;
; src/parser.c:370:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	jmp	.L101	;
.L103:
; src/parser.c:371:         else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	VAR_KEYWORD(%rip), %rdx	; VAR_KEYWORD, VAR_KEYWORD.42_14
	movq	-8(%rbp), %rax	; token_ptr, tmp135
	movq	(%rax), %rax	; token_ptr_49->lexeme, _15
	movq	%rdx, %rsi	; VAR_KEYWORD.42_14,
	movq	%rax, %rdi	; _15,
	call	string_equal@PLT	;
; src/parser.c:371:         else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	; _16
	je	.L104	;,
; src/parser.c:372:             get_next_token(lexer, true);
	movq	-40(%rbp), %rax	; lexer, tmp136
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp136,
	call	get_next_token@PLT	;
; src/parser.c:373:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	-56(%rbp), %rdx	; parser, tmp137
	movq	-48(%rbp), %rcx	; now_scope, tmp138
	movq	-40(%rbp), %rax	; lexer, tmp139
	movq	%rcx, %rsi	; tmp138,
	movq	%rax, %rdi	; tmp139,
	call	parse_variable	;
; src/parser.c:373:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rax, %r9	; _17,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$1, %edi	;,
	call	create_statement@PLT	;
	movq	%rax, -24(%rbp)	; tmp140, statement
	jmp	.L105	;
.L104:
; src/parser.c:374:         } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
	movq	RETURN_KEYWORD(%rip), %rdx	; RETURN_KEYWORD, RETURN_KEYWORD.43_18
	movq	-8(%rbp), %rax	; token_ptr, tmp141
	movq	(%rax), %rax	; token_ptr_49->lexeme, _19
	movq	%rdx, %rsi	; RETURN_KEYWORD.43_18,
	movq	%rax, %rdi	; _19,
	call	string_equal@PLT	;
; src/parser.c:374:         } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	; _20
	je	.L106	;,
; src/parser.c:375:             token = get_next_token(lexer, true);
	movq	-40(%rbp), %rax	; lexer, tmp142
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp142,
	call	get_next_token@PLT	;
	movq	%rax, -16(%rbp)	; tmp143, token
; src/parser.c:376:             token_ptr = token;
	movq	-16(%rbp), %rax	; token, tmp144
	movq	%rax, -8(%rbp)	; tmp144, token_ptr
; src/parser.c:377:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	-56(%rbp), %rdx	; parser, tmp145
	movq	-48(%rbp), %rcx	; now_scope, tmp146
	movq	-40(%rbp), %rax	; lexer, tmp147
	movq	%rcx, %rsi	; tmp146,
	movq	%rax, %rdi	; tmp147,
	call	parse_expression	;
; src/parser.c:377:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movl	$0, %r9d	;,
	movq	%rax, %r8	; _21,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$5, %edi	;,
	call	create_statement@PLT	;
	movq	%rax, -24(%rbp)	; tmp148, statement
	jmp	.L105	;
.L106:
; src/parser.c:378:         } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
	movq	BREAK_KEYWORD(%rip), %rdx	; BREAK_KEYWORD, BREAK_KEYWORD.44_22
	movq	-8(%rbp), %rax	; token_ptr, tmp149
	movq	(%rax), %rax	; token_ptr_49->lexeme, _23
	movq	%rdx, %rsi	; BREAK_KEYWORD.44_22,
	movq	%rax, %rdi	; _23,
	call	string_equal@PLT	;
; src/parser.c:378:         } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	; _24
	je	.L107	;,
; src/parser.c:379:             if (!(((parser))->in_loop))
	movq	-56(%rbp), %rax	; parser, tmp150
	movzbl	2(%rax), %eax	; parser_52(D)->in_loop, _25
; src/parser.c:379:             if (!(((parser))->in_loop))
	testb	%al, %al	; _25
	jne	.L108	;,
; src/parser.c:382:                 parser_error("Cannot use 'break' outside of a loop", token);
	movq	-16(%rbp), %rax	; token, tmp151
	movq	%rax, %rsi	; tmp151,
	leaq	.LC40(%rip), %rax	;, tmp152
	movq	%rax, %rdi	; tmp152,
	call	parser_error@PLT	;
; src/parser.c:383:                 return NULL;
	movl	$0, %eax	;, _37
	jmp	.L101	;
.L108:
; src/parser.c:385:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$6, %edi	;,
	call	create_statement@PLT	;
	movq	%rax, -24(%rbp)	; tmp153, statement
	jmp	.L105	;
.L107:
; src/parser.c:386:         } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
	movq	CONTINUE_KEYWORD(%rip), %rdx	; CONTINUE_KEYWORD, CONTINUE_KEYWORD.45_26
	movq	-8(%rbp), %rax	; token_ptr, tmp154
	movq	(%rax), %rax	; token_ptr_49->lexeme, _27
	movq	%rdx, %rsi	; CONTINUE_KEYWORD.45_26,
	movq	%rax, %rdi	; _27,
	call	string_equal@PLT	;
; src/parser.c:386:         } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	; _28
	je	.L109	;,
; src/parser.c:387:             if (!(((parser))->in_loop))
	movq	-56(%rbp), %rax	; parser, tmp155
	movzbl	2(%rax), %eax	; parser_52(D)->in_loop, _29
; src/parser.c:387:             if (!(((parser))->in_loop))
	testb	%al, %al	; _29
	jne	.L110	;,
; src/parser.c:390:                 parser_error("Cannot use 'continue' outside of a loop", token);
	movq	-16(%rbp), %rax	; token, tmp156
	movq	%rax, %rsi	; tmp156,
	leaq	.LC41(%rip), %rax	;, tmp157
	movq	%rax, %rdi	; tmp157,
	call	parser_error@PLT	;
; src/parser.c:391:                 return NULL;
	movl	$0, %eax	;, _37
	jmp	.L101	;
.L110:
; src/parser.c:393:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$7, %edi	;,
	call	create_statement@PLT	;
	movq	%rax, -24(%rbp)	; tmp158, statement
	jmp	.L105	;
.L109:
; src/parser.c:395:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	-56(%rbp), %rdx	; parser, tmp159
	movq	-48(%rbp), %rcx	; now_scope, tmp160
	movq	-40(%rbp), %rax	; lexer, tmp161
	movq	%rcx, %rsi	; tmp160,
	movq	%rax, %rdi	; tmp161,
	call	parse_expression	;
; src/parser.c:395:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movl	$0, %r9d	;,
	movq	%rax, %r8	; _30,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_statement@PLT	;
	movq	%rax, -24(%rbp)	; tmp162, statement
	jmp	.L105	;
.L99:
; src/parser.c:397:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	-56(%rbp), %rdx	; parser, tmp163
	movq	-48(%rbp), %rcx	; now_scope, tmp164
	movq	-40(%rbp), %rax	; lexer, tmp165
	movq	%rcx, %rsi	; tmp164,
	movq	%rax, %rdi	; tmp165,
	call	parse_expression	;
; src/parser.c:397:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movl	$0, %r9d	;,
	movq	%rax, %r8	; _31,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_statement@PLT	;
	movq	%rax, -24(%rbp)	; tmp166, statement
.L105:
; src/parser.c:398:     token = peek_current_token(lexer);
	movq	-40(%rbp), %rax	; lexer, tmp167
	movq	%rax, %rdi	; tmp167,
	call	peek_current_token@PLT	;
	movq	%rax, -16(%rbp)	; tmp168, token
; src/parser.c:399:     if (statement == 0)
	cmpq	$0, -24(%rbp)	;, statement
	jne	.L111	;,
; src/parser.c:400:         parser_error("Failed to parse statement", token);
	movq	-16(%rbp), %rax	; token, tmp169
	movq	%rax, %rsi	; tmp169,
	leaq	.LC42(%rip), %rax	;, tmp170
	movq	%rax, %rdi	; tmp170,
	call	parser_error@PLT	;
.L111:
; src/parser.c:401:     token = get_next_token(lexer, true);
	movq	-40(%rbp), %rax	; lexer, tmp171
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp171,
	call	get_next_token@PLT	;
	movq	%rax, -16(%rbp)	; tmp172, token
; src/parser.c:402:     token_ptr = token;
	movq	-16(%rbp), %rax	; token, tmp173
	movq	%rax, -8(%rbp)	; tmp173, token_ptr
; src/parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	-8(%rbp), %rax	; token_ptr, tmp174
	movl	24(%rax), %eax	; token_ptr_98->type, _32
; src/parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, %eax	;, _32
	jne	.L112	;,
; src/parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	SEMICOLON_SYMBOL(%rip), %rdx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.46_33
	movq	-8(%rbp), %rax	; token_ptr, tmp175
	movq	(%rax), %rax	; token_ptr_98->lexeme, _34
	movq	%rdx, %rsi	; SEMICOLON_SYMBOL.46_33,
	movq	%rax, %rdi	; _34,
	call	string_equal@PLT	;
; src/parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; _35
	jne	.L113	;,
.L112:
; src/parser.c:404:         parser_error("Expected ';' after statement", token);
	movq	-16(%rbp), %rax	; token, tmp176
	movq	%rax, %rsi	; tmp176,
	leaq	.LC43(%rip), %rax	;, tmp177
	movq	%rax, %rdi	; tmp177,
	call	parser_error@PLT	;
.L113:
; src/parser.c:405:     return statement;
	movq	-24(%rbp), %rax	; statement, _37
.L101:
; src/parser.c:406: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE12:
	.size	parse_statement, .-parse_statement
	.section	.rodata
.LC44:
	.string	"Expected '(' after 'if'"
.LC45:
	.string	"Failed to parse if condition"
	.align 8
.LC46:
	.string	"Expected ')' after if condition"
.LC47:
	.string	"Expected '{' to start if body"
	.align 8
.LC48:
	.string	"Failed to parse if body statement"
.LC49:
	.string	"Expected '(' after 'elif'"
	.align 8
.LC50:
	.string	"Failed to parse else-if condition"
	.align 8
.LC51:
	.string	"Expected ')' after else-if condition"
	.align 8
.LC52:
	.string	"Expected '{' to start else-if body"
	.align 8
.LC53:
	.string	"Failed to parse else-if body statement"
	.align 8
.LC54:
	.string	"Expected '{' to start else body"
	.align 8
.LC55:
	.string	"Failed to parse else body statement"
	.text
	.type	parse_if, @function
parse_if:
.LFB13:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	addq	$-128, %rsp	;,
	movq	%rdi, -104(%rbp)	; lexer, lexer
	movq	%rsi, -112(%rbp)	; now_scope, now_scope
	movq	%rdx, -120(%rbp)	; parser, parser
; src/parser.c:411:     Token* token = 0;
	movq	$0, -88(%rbp)	;, token
; src/parser.c:412:     Token* token_ptr = NULL;
	movq	$0, -80(%rbp)	;, token_ptr
; src/parser.c:413:     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp133
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp133,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp134, token
; src/parser.c:414:     token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp135
	movq	%rax, -80(%rbp)	; tmp135, token_ptr
; src/parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	-80(%rbp), %rax	; token_ptr, tmp136
	movl	24(%rax), %eax	; token_ptr_86->type, _1
; src/parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _1
	jne	.L115	;,
; src/parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rdx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.47_2
	movq	-80(%rbp), %rax	; token_ptr, tmp137
	movq	(%rax), %rax	; token_ptr_86->lexeme, _3
	movq	%rdx, %rsi	; L_PAREN_SYMBOL.47_2,
	movq	%rax, %rdi	; _3,
	call	string_equal@PLT	;
; src/parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; _4
	jne	.L116	;,
.L115:
; src/parser.c:416:         parser_error("Expected '(' after 'if'", token);
	movq	-88(%rbp), %rax	; token, tmp138
	movq	%rax, %rsi	; tmp138,
	leaq	.LC44(%rip), %rax	;, tmp139
	movq	%rax, %rdi	; tmp139,
	call	parser_error@PLT	;
; src/parser.c:417:         return NULL;
	movl	$0, %eax	;, _57
	jmp	.L117	;
.L116:
; src/parser.c:419:     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp140
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp140,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp141, token
; src/parser.c:420:     token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp142
	movq	%rax, -80(%rbp)	; tmp142, token_ptr
; src/parser.c:421:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	-120(%rbp), %rdx	; parser, tmp143
	movq	-112(%rbp), %rcx	; now_scope, tmp144
	movq	-104(%rbp), %rax	; lexer, tmp145
	movq	%rcx, %rsi	; tmp144,
	movq	%rax, %rdi	; tmp145,
	call	parse_expression	;
	movq	%rax, -72(%rbp)	; tmp146, condition
; src/parser.c:422:     if (condition == 0)
	cmpq	$0, -72(%rbp)	;, condition
	jne	.L118	;,
; src/parser.c:423:         parser_error("Failed to parse if condition", token);
	movq	-88(%rbp), %rax	; token, tmp147
	movq	%rax, %rsi	; tmp147,
	leaq	.LC45(%rip), %rax	;, tmp148
	movq	%rax, %rdi	; tmp148,
	call	parser_error@PLT	;
.L118:
; src/parser.c:424:     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp149
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp149,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp150, token
; src/parser.c:425:     token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp151
	movq	%rax, -80(%rbp)	; tmp151, token_ptr
; src/parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	-80(%rbp), %rax	; token_ptr, tmp152
	movl	24(%rax), %eax	; token_ptr_98->type, _5
; src/parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _5
	jne	.L119	;,
; src/parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.48_6
	movq	-80(%rbp), %rax	; token_ptr, tmp153
	movq	(%rax), %rax	; token_ptr_98->lexeme, _7
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.48_6,
	movq	%rax, %rdi	; _7,
	call	string_equal@PLT	;
; src/parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _8
	jne	.L120	;,
.L119:
; src/parser.c:427:         parser_error("Expected ')' after if condition", token);
	movq	-88(%rbp), %rax	; token, tmp154
	movq	%rax, %rsi	; tmp154,
	leaq	.LC46(%rip), %rax	;, tmp155
	movq	%rax, %rdi	; tmp155,
	call	parser_error@PLT	;
; src/parser.c:428:         return NULL;
	movl	$0, %eax	;, _57
	jmp	.L117	;
.L120:
; src/parser.c:430:     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp156
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp156,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp157, token
; src/parser.c:431:     token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp158
	movq	%rax, -80(%rbp)	; tmp158, token_ptr
; src/parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	-80(%rbp), %rax	; token_ptr, tmp159
	movl	24(%rax), %eax	; token_ptr_102->type, _9
; src/parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _9
	jne	.L121	;,
; src/parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rdx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.49_10
	movq	-80(%rbp), %rax	; token_ptr, tmp160
	movq	(%rax), %rax	; token_ptr_102->lexeme, _11
	movq	%rdx, %rsi	; L_BRACE_SYMBOL.49_10,
	movq	%rax, %rdi	; _11,
	call	string_equal@PLT	;
; src/parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; _12
	jne	.L122	;,
.L121:
; src/parser.c:433:         parser_error("Expected '{' to start if body", token);
	movq	-88(%rbp), %rax	; token, tmp161
	movq	%rax, %rsi	; tmp161,
	leaq	.LC47(%rip), %rax	;, tmp162
	movq	%rax, %rdi	; tmp162,
	call	parser_error@PLT	;
; src/parser.c:434:         return NULL;
	movl	$0, %eax	;, _57
	jmp	.L117	;
.L122:
; src/parser.c:436:     list(Statement*) body = create_list();
	call	create_list@PLT	;
	movq	%rax, -64(%rbp)	; tmp163, body
; src/parser.c:437:     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp164
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp164,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp165, token
; src/parser.c:438:     token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp166
	movq	%rax, -80(%rbp)	; tmp166, token_ptr
; src/parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L123	;
.L125:
; src/parser.c:440:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	-120(%rbp), %rdx	; parser, tmp167
	movq	-112(%rbp), %rcx	; now_scope, tmp168
	movq	-104(%rbp), %rax	; lexer, tmp169
	movq	%rcx, %rsi	; tmp168,
	movq	%rax, %rdi	; tmp169,
	call	parse_statement	;
	movq	%rax, -8(%rbp)	; tmp170, statement
; src/parser.c:441:         if (statement == 0)
	cmpq	$0, -8(%rbp)	;, statement
	jne	.L124	;,
; src/parser.c:442:             parser_error("Failed to parse if body statement", token);
	movq	-88(%rbp), %rax	; token, tmp171
	movq	%rax, %rsi	; tmp171,
	leaq	.LC48(%rip), %rax	;, tmp172
	movq	%rax, %rdi	; tmp172,
	call	parser_error@PLT	;
.L124:
; src/parser.c:443:         list_append(body, (pointer)statement);
	movq	-8(%rbp), %rdx	; statement, tmp173
	movq	-64(%rbp), %rax	; body, tmp174
	movq	%rdx, %rsi	; tmp173,
	movq	%rax, %rdi	; tmp174,
	call	list_append@PLT	;
; src/parser.c:444:         token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp175
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp175,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp176, token
; src/parser.c:445:         token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp177
	movq	%rax, -80(%rbp)	; tmp177, token_ptr
.L123:
; src/parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	-80(%rbp), %rax	; token_ptr, tmp178
	movl	24(%rax), %eax	; token_ptr_53->type, _13
; src/parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _13
	jne	.L125	;,
; src/parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rdx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.50_14
	movq	-80(%rbp), %rax	; token_ptr, tmp179
	movq	(%rax), %rax	; token_ptr_53->lexeme, _15
	movq	%rdx, %rsi	; R_BRACE_SYMBOL.50_14,
	movq	%rax, %rdi	; _15,
	call	string_equal@PLT	;
; src/parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; _16
	je	.L125	;,
; src/parser.c:447:     list(ElseIf*) else_if = create_list();
	call	create_list@PLT	;
	movq	%rax, -56(%rbp)	; tmp180, else_if
; src/parser.c:448:     list(Statement*) else_body = create_list();
	call	create_list@PLT	;
	movq	%rax, -48(%rbp)	; tmp181, else_body
; src/parser.c:449:     token = peek_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp182
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp182,
	call	peek_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp183, token
; src/parser.c:450:     token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp184
	movq	%rax, -80(%rbp)	; tmp184, token_ptr
; src/parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	jmp	.L126	;
.L138:
; src/parser.c:452:         token = get_next_token(lexer, true);  // consume 'elif'
	movq	-104(%rbp), %rax	; lexer, tmp185
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp185,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp186, token
; src/parser.c:453:         token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp187
	movq	%rax, -80(%rbp)	; tmp187, token_ptr
; src/parser.c:454:         token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp188
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp188,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp189, token
; src/parser.c:455:         token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp190
	movq	%rax, -80(%rbp)	; tmp190, token_ptr
; src/parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	-80(%rbp), %rax	; token_ptr, tmp191
	movl	24(%rax), %eax	; token_ptr_123->type, _17
; src/parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _17
	jne	.L127	;,
; src/parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rdx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.51_18
	movq	-80(%rbp), %rax	; token_ptr, tmp192
	movq	(%rax), %rax	; token_ptr_123->lexeme, _19
	movq	%rdx, %rsi	; L_PAREN_SYMBOL.51_18,
	movq	%rax, %rdi	; _19,
	call	string_equal@PLT	;
; src/parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; _20
	jne	.L128	;,
.L127:
; src/parser.c:457:             parser_error("Expected '(' after 'elif'", token);
	movq	-88(%rbp), %rax	; token, tmp193
	movq	%rax, %rsi	; tmp193,
	leaq	.LC49(%rip), %rax	;, tmp194
	movq	%rax, %rdi	; tmp194,
	call	parser_error@PLT	;
; src/parser.c:458:             return NULL;
	movl	$0, %eax	;, _57
	jmp	.L117	;
.L128:
; src/parser.c:460:         token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp195
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp195,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp196, token
; src/parser.c:461:         token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp197
	movq	%rax, -80(%rbp)	; tmp197, token_ptr
; src/parser.c:462:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	-120(%rbp), %rdx	; parser, tmp198
	movq	-112(%rbp), %rcx	; now_scope, tmp199
	movq	-104(%rbp), %rax	; lexer, tmp200
	movq	%rcx, %rsi	; tmp199,
	movq	%rax, %rdi	; tmp200,
	call	parse_expression	;
	movq	%rax, -40(%rbp)	; tmp201, elif_condition
; src/parser.c:463:         if (elif_condition == 0)
	cmpq	$0, -40(%rbp)	;, elif_condition
	jne	.L129	;,
; src/parser.c:464:             parser_error("Failed to parse else-if condition", token);
	movq	-88(%rbp), %rax	; token, tmp202
	movq	%rax, %rsi	; tmp202,
	leaq	.LC50(%rip), %rax	;, tmp203
	movq	%rax, %rdi	; tmp203,
	call	parser_error@PLT	;
.L129:
; src/parser.c:465:         token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp204
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp204,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp205, token
; src/parser.c:466:         token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp206
	movq	%rax, -80(%rbp)	; tmp206, token_ptr
; src/parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	-80(%rbp), %rax	; token_ptr, tmp207
	movl	24(%rax), %eax	; token_ptr_133->type, _21
; src/parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _21
	jne	.L130	;,
; src/parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.52_22
	movq	-80(%rbp), %rax	; token_ptr, tmp208
	movq	(%rax), %rax	; token_ptr_133->lexeme, _23
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.52_22,
	movq	%rax, %rdi	; _23,
	call	string_equal@PLT	;
; src/parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _24
	jne	.L131	;,
.L130:
; src/parser.c:468:             parser_error("Expected ')' after else-if condition", token);
	movq	-88(%rbp), %rax	; token, tmp209
	movq	%rax, %rsi	; tmp209,
	leaq	.LC51(%rip), %rax	;, tmp210
	movq	%rax, %rdi	; tmp210,
	call	parser_error@PLT	;
; src/parser.c:469:             return NULL;
	movl	$0, %eax	;, _57
	jmp	.L117	;
.L131:
; src/parser.c:471:         token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp211
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp211,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp212, token
; src/parser.c:472:         token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp213
	movq	%rax, -80(%rbp)	; tmp213, token_ptr
; src/parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	-80(%rbp), %rax	; token_ptr, tmp214
	movl	24(%rax), %eax	; token_ptr_137->type, _25
; src/parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _25
	jne	.L132	;,
; src/parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rdx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.53_26
	movq	-80(%rbp), %rax	; token_ptr, tmp215
	movq	(%rax), %rax	; token_ptr_137->lexeme, _27
	movq	%rdx, %rsi	; L_BRACE_SYMBOL.53_26,
	movq	%rax, %rdi	; _27,
	call	string_equal@PLT	;
; src/parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; _28
	jne	.L133	;,
.L132:
; src/parser.c:474:             parser_error("Expected '{' to start else-if body", token);
	movq	-88(%rbp), %rax	; token, tmp216
	movq	%rax, %rsi	; tmp216,
	leaq	.LC52(%rip), %rax	;, tmp217
	movq	%rax, %rdi	; tmp217,
	call	parser_error@PLT	;
; src/parser.c:475:             return NULL;
	movl	$0, %eax	;, _57
	jmp	.L117	;
.L133:
; src/parser.c:477:         list(Statement*) elif_body = create_list();
	call	create_list@PLT	;
	movq	%rax, -32(%rbp)	; tmp218, elif_body
; src/parser.c:478:         token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp219
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp219,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp220, token
; src/parser.c:479:         token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp221
	movq	%rax, -80(%rbp)	; tmp221, token_ptr
; src/parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L134	;
.L136:
; src/parser.c:481:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	-120(%rbp), %rdx	; parser, tmp222
	movq	-112(%rbp), %rcx	; now_scope, tmp223
	movq	-104(%rbp), %rax	; lexer, tmp224
	movq	%rcx, %rsi	; tmp223,
	movq	%rax, %rdi	; tmp224,
	call	parse_statement	;
	movq	%rax, -24(%rbp)	; tmp225, statement
; src/parser.c:482:             if (statement == 0)
	cmpq	$0, -24(%rbp)	;, statement
	jne	.L135	;,
; src/parser.c:483:                 parser_error("Failed to parse else-if body statement", token);
	movq	-88(%rbp), %rax	; token, tmp226
	movq	%rax, %rsi	; tmp226,
	leaq	.LC53(%rip), %rax	;, tmp227
	movq	%rax, %rdi	; tmp227,
	call	parser_error@PLT	;
.L135:
; src/parser.c:484:             list_append(elif_body, (pointer)statement);
	movq	-24(%rbp), %rdx	; statement, tmp228
	movq	-32(%rbp), %rax	; elif_body, tmp229
	movq	%rdx, %rsi	; tmp228,
	movq	%rax, %rdi	; tmp229,
	call	list_append@PLT	;
; src/parser.c:485:             token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp230
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp230,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp231, token
; src/parser.c:486:             token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp232
	movq	%rax, -80(%rbp)	; tmp232, token_ptr
.L134:
; src/parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	-80(%rbp), %rax	; token_ptr, tmp233
	movl	24(%rax), %eax	; token_ptr_54->type, _29
; src/parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _29
	jne	.L136	;,
; src/parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rdx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.54_30
	movq	-80(%rbp), %rax	; token_ptr, tmp234
	movq	(%rax), %rax	; token_ptr_54->lexeme, _31
	movq	%rdx, %rsi	; R_BRACE_SYMBOL.54_30,
	movq	%rax, %rdi	; _31,
	call	string_equal@PLT	;
; src/parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; _32
	je	.L136	;,
; src/parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	-32(%rbp), %rdx	; elif_body, tmp235
	movq	-40(%rbp), %rax	; elif_condition, tmp236
	movq	%rdx, %rsi	; tmp235,
	movq	%rax, %rdi	; tmp236,
	call	create_else_if@PLT	;
	movq	%rax, %rdx	;, _33
; src/parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	-56(%rbp), %rax	; else_if, tmp237
	movq	%rdx, %rsi	; _33,
	movq	%rax, %rdi	; tmp237,
	call	list_append@PLT	;
; src/parser.c:489:         token = peek_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp238
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp238,
	call	peek_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp239, token
; src/parser.c:490:         token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp240
	movq	%rax, -80(%rbp)	; tmp240, token_ptr
.L126:
; src/parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	movq	-80(%rbp), %rax	; token_ptr, tmp241
	movl	24(%rax), %eax	; token_ptr_55->type, _34
; src/parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, %eax	;, _34
	jne	.L137	;,
; src/parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	movq	ELIF_KEYWORD(%rip), %rdx	; ELIF_KEYWORD, ELIF_KEYWORD.55_35
	movq	-80(%rbp), %rax	; token_ptr, tmp242
	movq	(%rax), %rax	; token_ptr_55->lexeme, _36
	movq	%rdx, %rsi	; ELIF_KEYWORD.55_35,
	movq	%rax, %rdi	; _36,
	call	string_equal@PLT	;
; src/parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	; _37
	jne	.L138	;,
.L137:
; src/parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	movq	-80(%rbp), %rax	; token_ptr, tmp243
	movl	24(%rax), %eax	; token_ptr_55->type, _38
; src/parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, %eax	;, _38
	jne	.L139	;,
; src/parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	movq	ELSE_KEYWORD(%rip), %rdx	; ELSE_KEYWORD, ELSE_KEYWORD.56_39
	movq	-80(%rbp), %rax	; token_ptr, tmp244
	movq	(%rax), %rax	; token_ptr_55->lexeme, _40
	movq	%rdx, %rsi	; ELSE_KEYWORD.56_39,
	movq	%rax, %rdi	; _40,
	call	string_equal@PLT	;
; src/parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	; _41
	je	.L139	;,
; src/parser.c:493:         token = get_next_token(lexer, true);  // consume 'else'
	movq	-104(%rbp), %rax	; lexer, tmp245
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp245,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp246, token
; src/parser.c:494:         token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp247
	movq	%rax, -80(%rbp)	; tmp247, token_ptr
; src/parser.c:495:         token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp248
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp248,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp249, token
; src/parser.c:496:         token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp250
	movq	%rax, -80(%rbp)	; tmp250, token_ptr
; src/parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	-80(%rbp), %rax	; token_ptr, tmp251
	movl	24(%rax), %eax	; token_ptr_169->type, _42
; src/parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _42
	jne	.L140	;,
; src/parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rdx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.57_43
	movq	-80(%rbp), %rax	; token_ptr, tmp252
	movq	(%rax), %rax	; token_ptr_169->lexeme, _44
	movq	%rdx, %rsi	; L_BRACE_SYMBOL.57_43,
	movq	%rax, %rdi	; _44,
	call	string_equal@PLT	;
; src/parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; _45
	jne	.L141	;,
.L140:
; src/parser.c:498:             parser_error("Expected '{' to start else body", token);
	movq	-88(%rbp), %rax	; token, tmp253
	movq	%rax, %rsi	; tmp253,
	leaq	.LC54(%rip), %rax	;, tmp254
	movq	%rax, %rdi	; tmp254,
	call	parser_error@PLT	;
; src/parser.c:499:             return NULL;
	movl	$0, %eax	;, _57
	jmp	.L117	;
.L141:
; src/parser.c:501:         token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp255
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp255,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp256, token
; src/parser.c:502:         token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp257
	movq	%rax, -80(%rbp)	; tmp257, token_ptr
; src/parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L142	;
.L144:
; src/parser.c:504:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	-120(%rbp), %rdx	; parser, tmp258
	movq	-112(%rbp), %rcx	; now_scope, tmp259
	movq	-104(%rbp), %rax	; lexer, tmp260
	movq	%rcx, %rsi	; tmp259,
	movq	%rax, %rdi	; tmp260,
	call	parse_statement	;
	movq	%rax, -16(%rbp)	; tmp261, statement
; src/parser.c:505:             if (statement == 0)
	cmpq	$0, -16(%rbp)	;, statement
	jne	.L143	;,
; src/parser.c:506:                 parser_error("Failed to parse else body statement", token);
	movq	-88(%rbp), %rax	; token, tmp262
	movq	%rax, %rsi	; tmp262,
	leaq	.LC55(%rip), %rax	;, tmp263
	movq	%rax, %rdi	; tmp263,
	call	parser_error@PLT	;
.L143:
; src/parser.c:507:             list_append(else_body, (pointer)statement);
	movq	-16(%rbp), %rdx	; statement, tmp264
	movq	-48(%rbp), %rax	; else_body, tmp265
	movq	%rdx, %rsi	; tmp264,
	movq	%rax, %rdi	; tmp265,
	call	list_append@PLT	;
; src/parser.c:508:             token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp266
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp266,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp267, token
; src/parser.c:509:             token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp268
	movq	%rax, -80(%rbp)	; tmp268, token_ptr
.L142:
; src/parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	-80(%rbp), %rax	; token_ptr, tmp269
	movl	24(%rax), %eax	; token_ptr_56->type, _46
; src/parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _46
	jne	.L144	;,
; src/parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rdx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.58_47
	movq	-80(%rbp), %rax	; token_ptr, tmp270
	movq	(%rax), %rax	; token_ptr_56->lexeme, _48
	movq	%rdx, %rsi	; R_BRACE_SYMBOL.58_47,
	movq	%rax, %rdi	; _48,
	call	string_equal@PLT	;
; src/parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; _49
	je	.L144	;,
.L139:
; src/parser.c:512:     token = peek_current_token(lexer);
	movq	-104(%rbp), %rax	; lexer, tmp271
	movq	%rax, %rdi	; tmp271,
	call	peek_current_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp272, token
; src/parser.c:513:     token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp273
	movq	%rax, -80(%rbp)	; tmp273, token_ptr
; src/parser.c:514:     return create_if(condition, body, else_if, else_body);
	movq	-48(%rbp), %rcx	; else_body, tmp274
	movq	-56(%rbp), %rdx	; else_if, tmp275
	movq	-64(%rbp), %rsi	; body, tmp276
	movq	-72(%rbp), %rax	; condition, tmp277
	movq	%rax, %rdi	; tmp277,
	call	create_if@PLT	;
.L117:
; src/parser.c:515: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE13:
	.size	parse_if, .-parse_if
	.section	.rodata
.LC56:
	.string	"Expected '(' after 'for'"
	.align 8
.LC57:
	.string	"Failed to parse for loop initializer"
	.align 8
.LC58:
	.string	"Expected ';' after for loop initializer"
	.align 8
.LC59:
	.string	"Failed to parse for loop condition"
	.align 8
.LC60:
	.string	"Expected ';' after for loop condition"
	.align 8
.LC61:
	.string	"Failed to parse for loop increment"
	.align 8
.LC62:
	.string	"Expected ')' after for loop increment"
	.align 8
.LC63:
	.string	"Expected '{' to start for loop body"
	.align 8
.LC64:
	.string	"Failed to parse for loop body statement"
	.text
	.type	parse_for, @function
parse_for:
.LFB14:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$96, %rsp	;,
	movq	%rdi, -72(%rbp)	; lexer, lexer
	movq	%rsi, -80(%rbp)	; now_scope, now_scope
	movq	%rdx, -88(%rbp)	; parser, parser
; src/parser.c:520:     Token* token = 0;
	movq	$0, -56(%rbp)	;, token
; src/parser.c:521:     Token* token_ptr = NULL;
	movq	$0, -48(%rbp)	;, token_ptr
; src/parser.c:522:     token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp120
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp120,
	call	get_next_token@PLT	;
	movq	%rax, -56(%rbp)	; tmp121, token
; src/parser.c:523:     token_ptr = token;
	movq	-56(%rbp), %rax	; token, tmp122
	movq	%rax, -48(%rbp)	; tmp122, token_ptr
; src/parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	-48(%rbp), %rax	; token_ptr, tmp123
	movl	24(%rax), %eax	; token_ptr_73->type, _1
; src/parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _1
	jne	.L146	;,
; src/parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rdx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.59_2
	movq	-48(%rbp), %rax	; token_ptr, tmp124
	movq	(%rax), %rax	; token_ptr_73->lexeme, _3
	movq	%rdx, %rsi	; L_PAREN_SYMBOL.59_2,
	movq	%rax, %rdi	; _3,
	call	string_equal@PLT	;
; src/parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; _4
	jne	.L147	;,
.L146:
; src/parser.c:525:         parser_error("Expected '(' after 'for'", token);
	movq	-56(%rbp), %rax	; token, tmp125
	movq	%rax, %rsi	; tmp125,
	leaq	.LC56(%rip), %rax	;, tmp126
	movq	%rax, %rdi	; tmp126,
	call	parser_error@PLT	;
; src/parser.c:526:         return NULL;
	movl	$0, %eax	;, _48
	jmp	.L148	;
.L147:
; src/parser.c:528:     token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp127
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp127,
	call	get_next_token@PLT	;
	movq	%rax, -56(%rbp)	; tmp128, token
; src/parser.c:529:     token_ptr = token;
	movq	-56(%rbp), %rax	; token, tmp129
	movq	%rax, -48(%rbp)	; tmp129, token_ptr
; src/parser.c:530:     Variable* initializer = 0;
	movq	$0, -40(%rbp)	;, initializer
; src/parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	-48(%rbp), %rax	; token_ptr, tmp130
	movl	24(%rax), %eax	; token_ptr_77->type, _5
; src/parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	;, _5
	jne	.L149	;,
; src/parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	SEMICOLON_SYMBOL(%rip), %rdx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.60_6
	movq	-48(%rbp), %rax	; token_ptr, tmp131
	movq	(%rax), %rax	; token_ptr_77->lexeme, _7
	movq	%rdx, %rsi	; SEMICOLON_SYMBOL.60_6,
	movq	%rax, %rdi	; _7,
	call	string_equal@PLT	;
; src/parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; _8
	jne	.L150	;,
.L149:
; src/parser.c:532:         initializer = parse_variable(lexer, now_scope, parser);
	movq	-88(%rbp), %rdx	; parser, tmp132
	movq	-80(%rbp), %rcx	; now_scope, tmp133
	movq	-72(%rbp), %rax	; lexer, tmp134
	movq	%rcx, %rsi	; tmp133,
	movq	%rax, %rdi	; tmp134,
	call	parse_variable	;
	movq	%rax, -40(%rbp)	; tmp135, initializer
; src/parser.c:533:         if (initializer == 0)
	cmpq	$0, -40(%rbp)	;, initializer
	jne	.L151	;,
; src/parser.c:534:             parser_error("Failed to parse for loop initializer", token);
	movq	-56(%rbp), %rax	; token, tmp136
	movq	%rax, %rsi	; tmp136,
	leaq	.LC57(%rip), %rax	;, tmp137
	movq	%rax, %rdi	; tmp137,
	call	parser_error@PLT	;
.L151:
; src/parser.c:535:         token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp138
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp138,
	call	get_next_token@PLT	;
	movq	%rax, -56(%rbp)	; tmp139, token
; src/parser.c:536:         token_ptr = token;
	movq	-56(%rbp), %rax	; token, tmp140
	movq	%rax, -48(%rbp)	; tmp140, token_ptr
.L150:
; src/parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	-48(%rbp), %rax	; token_ptr, tmp141
	movl	24(%rax), %eax	; token_ptr_41->type, _9
; src/parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, %eax	;, _9
	jne	.L152	;,
; src/parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	SEMICOLON_SYMBOL(%rip), %rdx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.61_10
	movq	-48(%rbp), %rax	; token_ptr, tmp142
	movq	(%rax), %rax	; token_ptr_41->lexeme, _11
	movq	%rdx, %rsi	; SEMICOLON_SYMBOL.61_10,
	movq	%rax, %rdi	; _11,
	call	string_equal@PLT	;
; src/parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; _12
	jne	.L153	;,
.L152:
; src/parser.c:541:         parser_error("Expected ';' after for loop initializer", token);
	movq	-56(%rbp), %rax	; token, tmp143
	movq	%rax, %rsi	; tmp143,
	leaq	.LC58(%rip), %rax	;, tmp144
	movq	%rax, %rdi	; tmp144,
	call	parser_error@PLT	;
; src/parser.c:542:         return NULL;
	movl	$0, %eax	;, _48
	jmp	.L148	;
.L153:
; src/parser.c:544:     token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp145
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp145,
	call	get_next_token@PLT	;
	movq	%rax, -56(%rbp)	; tmp146, token
; src/parser.c:545:     token_ptr = token;
	movq	-56(%rbp), %rax	; token, tmp147
	movq	%rax, -48(%rbp)	; tmp147, token_ptr
; src/parser.c:546:     Expression* condition = 0;
	movq	$0, -32(%rbp)	;, condition
; src/parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	-48(%rbp), %rax	; token_ptr, tmp148
	movl	24(%rax), %eax	; token_ptr_91->type, _13
; src/parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	;, _13
	jne	.L154	;,
; src/parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	SEMICOLON_SYMBOL(%rip), %rdx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.62_14
	movq	-48(%rbp), %rax	; token_ptr, tmp149
	movq	(%rax), %rax	; token_ptr_91->lexeme, _15
	movq	%rdx, %rsi	; SEMICOLON_SYMBOL.62_14,
	movq	%rax, %rdi	; _15,
	call	string_equal@PLT	;
; src/parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; _16
	jne	.L155	;,
.L154:
; src/parser.c:548:         condition = parse_expression(lexer, now_scope, parser);
	movq	-88(%rbp), %rdx	; parser, tmp150
	movq	-80(%rbp), %rcx	; now_scope, tmp151
	movq	-72(%rbp), %rax	; lexer, tmp152
	movq	%rcx, %rsi	; tmp151,
	movq	%rax, %rdi	; tmp152,
	call	parse_expression	;
	movq	%rax, -32(%rbp)	; tmp153, condition
; src/parser.c:549:         if (condition == 0)
	cmpq	$0, -32(%rbp)	;, condition
	jne	.L156	;,
; src/parser.c:550:             parser_error("Failed to parse for loop condition", token);
	movq	-56(%rbp), %rax	; token, tmp154
	movq	%rax, %rsi	; tmp154,
	leaq	.LC59(%rip), %rax	;, tmp155
	movq	%rax, %rdi	; tmp155,
	call	parser_error@PLT	;
.L156:
; src/parser.c:551:         token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp156
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp156,
	call	get_next_token@PLT	;
	movq	%rax, -56(%rbp)	; tmp157, token
; src/parser.c:552:         token_ptr = token;
	movq	-56(%rbp), %rax	; token, tmp158
	movq	%rax, -48(%rbp)	; tmp158, token_ptr
.L155:
; src/parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	-48(%rbp), %rax	; token_ptr, tmp159
	movl	24(%rax), %eax	; token_ptr_42->type, _17
; src/parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, %eax	;, _17
	jne	.L157	;,
; src/parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	SEMICOLON_SYMBOL(%rip), %rdx	; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL.63_18
	movq	-48(%rbp), %rax	; token_ptr, tmp160
	movq	(%rax), %rax	; token_ptr_42->lexeme, _19
	movq	%rdx, %rsi	; SEMICOLON_SYMBOL.63_18,
	movq	%rax, %rdi	; _19,
	call	string_equal@PLT	;
; src/parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; _20
	jne	.L158	;,
.L157:
; src/parser.c:557:         parser_error("Expected ';' after for loop condition", token);
	movq	-56(%rbp), %rax	; token, tmp161
	movq	%rax, %rsi	; tmp161,
	leaq	.LC60(%rip), %rax	;, tmp162
	movq	%rax, %rdi	; tmp162,
	call	parser_error@PLT	;
; src/parser.c:558:         return NULL;
	movl	$0, %eax	;, _48
	jmp	.L148	;
.L158:
; src/parser.c:560:     token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp163
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp163,
	call	get_next_token@PLT	;
	movq	%rax, -56(%rbp)	; tmp164, token
; src/parser.c:561:     token_ptr = token;
	movq	-56(%rbp), %rax	; token, tmp165
	movq	%rax, -48(%rbp)	; tmp165, token_ptr
; src/parser.c:562:     Expression* increment = 0;
	movq	$0, -24(%rbp)	;, increment
; src/parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	-48(%rbp), %rax	; token_ptr, tmp166
	movl	24(%rax), %eax	; token_ptr_103->type, _21
; src/parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _21
	jne	.L159	;,
; src/parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.64_22
	movq	-48(%rbp), %rax	; token_ptr, tmp167
	movq	(%rax), %rax	; token_ptr_103->lexeme, _23
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.64_22,
	movq	%rax, %rdi	; _23,
	call	string_equal@PLT	;
; src/parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _24
	jne	.L160	;,
.L159:
; src/parser.c:564:         increment = parse_expression(lexer, now_scope, parser);
	movq	-88(%rbp), %rdx	; parser, tmp168
	movq	-80(%rbp), %rcx	; now_scope, tmp169
	movq	-72(%rbp), %rax	; lexer, tmp170
	movq	%rcx, %rsi	; tmp169,
	movq	%rax, %rdi	; tmp170,
	call	parse_expression	;
	movq	%rax, -24(%rbp)	; tmp171, increment
; src/parser.c:565:         if (increment == 0)
	cmpq	$0, -24(%rbp)	;, increment
	jne	.L161	;,
; src/parser.c:566:             parser_error("Failed to parse for loop increment", token);
	movq	-56(%rbp), %rax	; token, tmp172
	movq	%rax, %rsi	; tmp172,
	leaq	.LC61(%rip), %rax	;, tmp173
	movq	%rax, %rdi	; tmp173,
	call	parser_error@PLT	;
.L161:
; src/parser.c:567:         token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp174
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp174,
	call	get_next_token@PLT	;
	movq	%rax, -56(%rbp)	; tmp175, token
; src/parser.c:568:         token_ptr = token;
	movq	-56(%rbp), %rax	; token, tmp176
	movq	%rax, -48(%rbp)	; tmp176, token_ptr
.L160:
; src/parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	movq	-48(%rbp), %rax	; token_ptr, tmp177
	movl	24(%rax), %eax	; token_ptr_43->type, _25
; src/parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	cmpl	$5, %eax	;, _25
	jne	.L162	;,
; src/parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.65_26
	movq	-48(%rbp), %rax	; token_ptr, tmp178
	movq	(%rax), %rax	; token_ptr_43->lexeme, _27
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.65_26,
	movq	%rax, %rdi	; _27,
	call	string_equal@PLT	;
; src/parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	testb	%al, %al	; _28
	jne	.L163	;,
.L162:
; src/parser.c:573:         parser_error("Expected ')' after for loop increment", token);
	movq	-56(%rbp), %rax	; token, tmp179
	movq	%rax, %rsi	; tmp179,
	leaq	.LC62(%rip), %rax	;, tmp180
	movq	%rax, %rdi	; tmp180,
	call	parser_error@PLT	;
; src/parser.c:574:         return NULL;
	movl	$0, %eax	;, _48
	jmp	.L148	;
.L163:
; src/parser.c:576:     token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp181
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp181,
	call	get_next_token@PLT	;
	movq	%rax, -56(%rbp)	; tmp182, token
; src/parser.c:577:     token_ptr = token;
	movq	-56(%rbp), %rax	; token, tmp183
	movq	%rax, -48(%rbp)	; tmp183, token_ptr
; src/parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	-48(%rbp), %rax	; token_ptr, tmp184
	movl	24(%rax), %eax	; token_ptr_115->type, _29
; src/parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _29
	jne	.L164	;,
; src/parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rdx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.66_30
	movq	-48(%rbp), %rax	; token_ptr, tmp185
	movq	(%rax), %rax	; token_ptr_115->lexeme, _31
	movq	%rdx, %rsi	; L_BRACE_SYMBOL.66_30,
	movq	%rax, %rdi	; _31,
	call	string_equal@PLT	;
; src/parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; _32
	jne	.L165	;,
.L164:
; src/parser.c:579:         parser_error("Expected '{' to start for loop body", token);
	movq	-56(%rbp), %rax	; token, tmp186
	movq	%rax, %rsi	; tmp186,
	leaq	.LC63(%rip), %rax	;, tmp187
	movq	%rax, %rdi	; tmp187,
	call	parser_error@PLT	;
; src/parser.c:580:         return NULL;
	movl	$0, %eax	;, _48
	jmp	.L148	;
.L165:
; src/parser.c:582:     list(Statement*) body = create_list();
	call	create_list@PLT	;
	movq	%rax, -16(%rbp)	; tmp188, body
; src/parser.c:583:     ((parser))->in_loop = true;
	movq	-88(%rbp), %rax	; parser, tmp189
	movb	$1, 2(%rax)	;, parser_81(D)->in_loop
; src/parser.c:584:     token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp190
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp190,
	call	get_next_token@PLT	;
	movq	%rax, -56(%rbp)	; tmp191, token
; src/parser.c:585:     token_ptr = token;
	movq	-56(%rbp), %rax	; token, tmp192
	movq	%rax, -48(%rbp)	; tmp192, token_ptr
; src/parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L166	;
.L168:
; src/parser.c:587:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	-88(%rbp), %rdx	; parser, tmp193
	movq	-80(%rbp), %rcx	; now_scope, tmp194
	movq	-72(%rbp), %rax	; lexer, tmp195
	movq	%rcx, %rsi	; tmp194,
	movq	%rax, %rdi	; tmp195,
	call	parse_statement	;
	movq	%rax, -8(%rbp)	; tmp196, statement
; src/parser.c:588:         if (statement == 0)
	cmpq	$0, -8(%rbp)	;, statement
	jne	.L167	;,
; src/parser.c:589:             parser_error("Failed to parse for loop body statement", token);
	movq	-56(%rbp), %rax	; token, tmp197
	movq	%rax, %rsi	; tmp197,
	leaq	.LC64(%rip), %rax	;, tmp198
	movq	%rax, %rdi	; tmp198,
	call	parser_error@PLT	;
.L167:
; src/parser.c:590:         list_append(body, (pointer)statement);
	movq	-8(%rbp), %rdx	; statement, tmp199
	movq	-16(%rbp), %rax	; body, tmp200
	movq	%rdx, %rsi	; tmp199,
	movq	%rax, %rdi	; tmp200,
	call	list_append@PLT	;
; src/parser.c:591:         token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp201
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp201,
	call	get_next_token@PLT	;
	movq	%rax, -56(%rbp)	; tmp202, token
; src/parser.c:592:         token_ptr = token;
	movq	-56(%rbp), %rax	; token, tmp203
	movq	%rax, -48(%rbp)	; tmp203, token_ptr
.L166:
; src/parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	-48(%rbp), %rax	; token_ptr, tmp204
	movl	24(%rax), %eax	; token_ptr_44->type, _33
; src/parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _33
	jne	.L168	;,
; src/parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rdx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.67_34
	movq	-48(%rbp), %rax	; token_ptr, tmp205
	movq	(%rax), %rax	; token_ptr_44->lexeme, _35
	movq	%rdx, %rsi	; R_BRACE_SYMBOL.67_34,
	movq	%rax, %rdi	; _35,
	call	string_equal@PLT	;
; src/parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; _36
	je	.L168	;,
; src/parser.c:594:     ((parser))->in_loop = false;
	movq	-88(%rbp), %rax	; parser, tmp206
	movb	$0, 2(%rax)	;, parser_81(D)->in_loop
; src/parser.c:595:     return create_for(initializer, condition, increment, body);
	movq	-16(%rbp), %rcx	; body, tmp207
	movq	-24(%rbp), %rdx	; increment, tmp208
	movq	-32(%rbp), %rsi	; condition, tmp209
	movq	-40(%rbp), %rax	; initializer, tmp210
	movq	%rax, %rdi	; tmp210,
	call	create_for@PLT	;
.L148:
; src/parser.c:596: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE14:
	.size	parse_for, .-parse_for
	.section	.rodata
.LC65:
	.string	"Expected '(' after 'while'"
	.align 8
.LC66:
	.string	"Failed to parse while condition"
	.align 8
.LC67:
	.string	"Expected ')' after while condition"
	.align 8
.LC68:
	.string	"Expected '{' to start while body"
	.align 8
.LC69:
	.string	"Failed to parse while body statement"
	.text
	.type	parse_while, @function
parse_while:
.LFB15:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$80, %rsp	;,
	movq	%rdi, -56(%rbp)	; lexer, lexer
	movq	%rsi, -64(%rbp)	; now_scope, now_scope
	movq	%rdx, -72(%rbp)	; parser, parser
; src/parser.c:601:     Token* token = 0;
	movq	$0, -40(%rbp)	;, token
; src/parser.c:602:     Token* token_ptr = NULL;
	movq	$0, -32(%rbp)	;, token_ptr
; src/parser.c:603:     token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp100
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp100,
	call	get_next_token@PLT	;
	movq	%rax, -40(%rbp)	; tmp101, token
; src/parser.c:604:     token_ptr = token;
	movq	-40(%rbp), %rax	; token, tmp102
	movq	%rax, -32(%rbp)	; tmp102, token_ptr
; src/parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	-32(%rbp), %rax	; token_ptr, tmp103
	movl	24(%rax), %eax	; token_ptr_34->type, _1
; src/parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _1
	jne	.L170	;,
; src/parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rdx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.68_2
	movq	-32(%rbp), %rax	; token_ptr, tmp104
	movq	(%rax), %rax	; token_ptr_34->lexeme, _3
	movq	%rdx, %rsi	; L_PAREN_SYMBOL.68_2,
	movq	%rax, %rdi	; _3,
	call	string_equal@PLT	;
; src/parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; _4
	jne	.L171	;,
.L170:
; src/parser.c:606:         parser_error("Expected '(' after 'while'", token);
	movq	-40(%rbp), %rax	; token, tmp105
	movq	%rax, %rsi	; tmp105,
	leaq	.LC65(%rip), %rax	;, tmp106
	movq	%rax, %rdi	; tmp106,
	call	parser_error@PLT	;
; src/parser.c:607:         return NULL;
	movl	$0, %eax	;, _19
	jmp	.L172	;
.L171:
; src/parser.c:609:     token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp107
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp107,
	call	get_next_token@PLT	;
	movq	%rax, -40(%rbp)	; tmp108, token
; src/parser.c:610:     token_ptr = token;
	movq	-40(%rbp), %rax	; token, tmp109
	movq	%rax, -32(%rbp)	; tmp109, token_ptr
; src/parser.c:611:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	-72(%rbp), %rdx	; parser, tmp110
	movq	-64(%rbp), %rcx	; now_scope, tmp111
	movq	-56(%rbp), %rax	; lexer, tmp112
	movq	%rcx, %rsi	; tmp111,
	movq	%rax, %rdi	; tmp112,
	call	parse_expression	;
	movq	%rax, -24(%rbp)	; tmp113, condition
; src/parser.c:612:     if (condition == 0)
	cmpq	$0, -24(%rbp)	;, condition
	jne	.L173	;,
; src/parser.c:613:         parser_error("Failed to parse while condition", token);
	movq	-40(%rbp), %rax	; token, tmp114
	movq	%rax, %rsi	; tmp114,
	leaq	.LC66(%rip), %rax	;, tmp115
	movq	%rax, %rdi	; tmp115,
	call	parser_error@PLT	;
.L173:
; src/parser.c:614:     token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp116
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp116,
	call	get_next_token@PLT	;
	movq	%rax, -40(%rbp)	; tmp117, token
; src/parser.c:615:     token_ptr = token;
	movq	-40(%rbp), %rax	; token, tmp118
	movq	%rax, -32(%rbp)	; tmp118, token_ptr
; src/parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	-32(%rbp), %rax	; token_ptr, tmp119
	movl	24(%rax), %eax	; token_ptr_46->type, _5
; src/parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _5
	jne	.L174	;,
; src/parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.69_6
	movq	-32(%rbp), %rax	; token_ptr, tmp120
	movq	(%rax), %rax	; token_ptr_46->lexeme, _7
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.69_6,
	movq	%rax, %rdi	; _7,
	call	string_equal@PLT	;
; src/parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _8
	jne	.L175	;,
.L174:
; src/parser.c:617:         parser_error("Expected ')' after while condition", token);
	movq	-40(%rbp), %rax	; token, tmp121
	movq	%rax, %rsi	; tmp121,
	leaq	.LC67(%rip), %rax	;, tmp122
	movq	%rax, %rdi	; tmp122,
	call	parser_error@PLT	;
; src/parser.c:618:         return NULL;
	movl	$0, %eax	;, _19
	jmp	.L172	;
.L175:
; src/parser.c:620:     token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp123
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp123,
	call	get_next_token@PLT	;
	movq	%rax, -40(%rbp)	; tmp124, token
; src/parser.c:621:     token_ptr = token;
	movq	-40(%rbp), %rax	; token, tmp125
	movq	%rax, -32(%rbp)	; tmp125, token_ptr
; src/parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	-32(%rbp), %rax	; token_ptr, tmp126
	movl	24(%rax), %eax	; token_ptr_50->type, _9
; src/parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _9
	jne	.L176	;,
; src/parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rdx	; L_BRACE_SYMBOL, L_BRACE_SYMBOL.70_10
	movq	-32(%rbp), %rax	; token_ptr, tmp127
	movq	(%rax), %rax	; token_ptr_50->lexeme, _11
	movq	%rdx, %rsi	; L_BRACE_SYMBOL.70_10,
	movq	%rax, %rdi	; _11,
	call	string_equal@PLT	;
; src/parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; _12
	jne	.L177	;,
.L176:
; src/parser.c:623:         parser_error("Expected '{' to start while body", token);
	movq	-40(%rbp), %rax	; token, tmp128
	movq	%rax, %rsi	; tmp128,
	leaq	.LC68(%rip), %rax	;, tmp129
	movq	%rax, %rdi	; tmp129,
	call	parser_error@PLT	;
; src/parser.c:624:         return NULL;
	movl	$0, %eax	;, _19
	jmp	.L172	;
.L177:
; src/parser.c:626:     list(Statement*) body = create_list();
	call	create_list@PLT	;
	movq	%rax, -16(%rbp)	; tmp130, body
; src/parser.c:627:     ((parser))->in_loop = true;
	movq	-72(%rbp), %rax	; parser, tmp131
	movb	$1, 2(%rax)	;, parser_40(D)->in_loop
; src/parser.c:628:     token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp132
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp132,
	call	get_next_token@PLT	;
	movq	%rax, -40(%rbp)	; tmp133, token
; src/parser.c:629:     token_ptr = token;
	movq	-40(%rbp), %rax	; token, tmp134
	movq	%rax, -32(%rbp)	; tmp134, token_ptr
; src/parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L178	;
.L180:
; src/parser.c:631:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	-72(%rbp), %rdx	; parser, tmp135
	movq	-64(%rbp), %rcx	; now_scope, tmp136
	movq	-56(%rbp), %rax	; lexer, tmp137
	movq	%rcx, %rsi	; tmp136,
	movq	%rax, %rdi	; tmp137,
	call	parse_statement	;
	movq	%rax, -8(%rbp)	; tmp138, statement
; src/parser.c:632:         if (statement == 0)
	cmpq	$0, -8(%rbp)	;, statement
	jne	.L179	;,
; src/parser.c:633:             parser_error("Failed to parse while body statement", token);
	movq	-40(%rbp), %rax	; token, tmp139
	movq	%rax, %rsi	; tmp139,
	leaq	.LC69(%rip), %rax	;, tmp140
	movq	%rax, %rdi	; tmp140,
	call	parser_error@PLT	;
.L179:
; src/parser.c:634:         list_append(body, (pointer)statement);
	movq	-8(%rbp), %rdx	; statement, tmp141
	movq	-16(%rbp), %rax	; body, tmp142
	movq	%rdx, %rsi	; tmp141,
	movq	%rax, %rdi	; tmp142,
	call	list_append@PLT	;
; src/parser.c:635:         token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp143
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp143,
	call	get_next_token@PLT	;
	movq	%rax, -40(%rbp)	; tmp144, token
; src/parser.c:636:         token_ptr = token;
	movq	-40(%rbp), %rax	; token, tmp145
	movq	%rax, -32(%rbp)	; tmp145, token_ptr
.L178:
; src/parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	-32(%rbp), %rax	; token_ptr, tmp146
	movl	24(%rax), %eax	; token_ptr_18->type, _13
; src/parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _13
	jne	.L180	;,
; src/parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rdx	; R_BRACE_SYMBOL, R_BRACE_SYMBOL.71_14
	movq	-32(%rbp), %rax	; token_ptr, tmp147
	movq	(%rax), %rax	; token_ptr_18->lexeme, _15
	movq	%rdx, %rsi	; R_BRACE_SYMBOL.71_14,
	movq	%rax, %rdi	; _15,
	call	string_equal@PLT	;
; src/parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; _16
	je	.L180	;,
; src/parser.c:638:     ((parser))->in_loop = false;
	movq	-72(%rbp), %rax	; parser, tmp148
	movb	$0, 2(%rax)	;, parser_40(D)->in_loop
; src/parser.c:639:     return create_while(condition, body);
	movq	-16(%rbp), %rdx	; body, tmp149
	movq	-24(%rbp), %rax	; condition, tmp150
	movq	%rdx, %rsi	; tmp149,
	movq	%rax, %rdi	; tmp150,
	call	create_while@PLT	;
.L172:
; src/parser.c:640: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE15:
	.size	parse_while, .-parse_while
	.section	.rodata
.LC70:
	.string	"Failed to parse right operand"
	.text
	.type	parse_expr_prec, @function
parse_expr_prec:
.LFB16:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$96, %rsp	;,
	movq	%rdi, -56(%rbp)	; lexer, lexer
	movq	%rsi, -64(%rbp)	; expr_left, expr_left
	movl	%edx, -68(%rbp)	; min_prec, min_prec
	movq	%rcx, -80(%rbp)	; now_scope, now_scope
	movq	%r8, -88(%rbp)	; parser, parser
; src/parser.c:645:     Token* token = 0;
	movq	$0, -16(%rbp)	;, token
; src/parser.c:646:     Token* token_ptr = NULL;
	movq	$0, -32(%rbp)	;, token_ptr
; src/parser.c:647:     token = peek_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp88
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp88,
	call	peek_next_token@PLT	;
	movq	%rax, -16(%rbp)	; tmp89, token
; src/parser.c:648:     token_ptr = token;
	movq	-16(%rbp), %rax	; token, tmp90
	movq	%rax, -32(%rbp)	; tmp90, token_ptr
; src/parser.c:649:     while (token_ptr->type == SYMBOL) {
	jmp	.L182	;
.L190:
; src/parser.c:650:         OperatorType op = string_to_operator(token_ptr->lexeme);
	movq	-32(%rbp), %rax	; token_ptr, tmp91
	movq	(%rax), %rax	; token_ptr_7->lexeme, _1
	movq	%rax, %rdi	; _1,
	call	string_to_operator@PLT	;
	movl	%eax, -48(%rbp)	; tmp92, op
; src/parser.c:651:         int op_prec = operator_precedence(op);
	movl	-48(%rbp), %eax	; op, tmp93
	movl	%eax, %edi	; tmp93,
	call	operator_precedence@PLT	;
	movl	%eax, -44(%rbp)	; tmp94, op_prec
; src/parser.c:652:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, -48(%rbp)	;, op
	je	.L183	;,
; src/parser.c:652:         if (op == OP_NONE || op_prec < min_prec)
	movl	-44(%rbp), %eax	; op_prec, tmp95
	cmpl	-68(%rbp), %eax	; min_prec, tmp95
	jl	.L183	;,
; src/parser.c:654:         token = get_next_token(lexer, true);  // consume operator
	movq	-56(%rbp), %rax	; lexer, tmp96
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp96,
	call	get_next_token@PLT	;
	movq	%rax, -16(%rbp)	; tmp97, token
; src/parser.c:655:         token_ptr = token;
	movq	-16(%rbp), %rax	; token, tmp98
	movq	%rax, -32(%rbp)	; tmp98, token_ptr
; src/parser.c:656:         token = get_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp99
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp99,
	call	get_next_token@PLT	;
	movq	%rax, -16(%rbp)	; tmp100, token
; src/parser.c:657:         token_ptr = token;
	movq	-16(%rbp), %rax	; token, tmp101
	movq	%rax, -32(%rbp)	; tmp101, token_ptr
; src/parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	-88(%rbp), %rdx	; parser, tmp102
	movq	-80(%rbp), %rcx	; now_scope, tmp103
	movq	-56(%rbp), %rax	; lexer, tmp104
	movq	%rcx, %rsi	; tmp103,
	movq	%rax, %rdi	; tmp104,
	call	parse_primary	;
	movq	%rax, -8(%rbp)	; tmp105, right_primary
; src/parser.c:659:         if (right_primary == 0) {
	cmpq	$0, -8(%rbp)	;, right_primary
	jne	.L184	;,
; src/parser.c:660:             parser_error("Failed to parse right operand", token);
	movq	-16(%rbp), %rax	; token, tmp106
	movq	%rax, %rsi	; tmp106,
	leaq	.LC70(%rip), %rax	;, tmp107
	movq	%rax, %rdi	; tmp107,
	call	parser_error@PLT	;
; src/parser.c:661:             return NULL;
	movl	$0, %eax	;, _9
	jmp	.L185	;
.L184:
; src/parser.c:663:         Expression* right = create_expression(OP_NONE, NULL, right_primary, 0);
	movq	-8(%rbp), %rax	; right_primary, tmp108
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; tmp108,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	create_expression@PLT	;
	movq	%rax, -24(%rbp)	; tmp109, right
; src/parser.c:664:         token = peek_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp110
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp110,
	call	peek_next_token@PLT	;
	movq	%rax, -16(%rbp)	; tmp111, token
; src/parser.c:665:         token_ptr = token;
	movq	-16(%rbp), %rax	; token, tmp112
	movq	%rax, -32(%rbp)	; tmp112, token_ptr
; src/parser.c:666:         while (token_ptr->type == SYMBOL) {
	jmp	.L186	;
.L189:
; src/parser.c:667:             OperatorType next_op = string_to_operator(token_ptr->lexeme);
	movq	-32(%rbp), %rax	; token_ptr, tmp113
	movq	(%rax), %rax	; token_ptr_6->lexeme, _2
	movq	%rax, %rdi	; _2,
	call	string_to_operator@PLT	;
	movl	%eax, -40(%rbp)	; tmp114, next_op
; src/parser.c:668:             int next_prec = operator_precedence(next_op);
	movl	-40(%rbp), %eax	; next_op, tmp115
	movl	%eax, %edi	; tmp115,
	call	operator_precedence@PLT	;
	movl	%eax, -36(%rbp)	; tmp116, next_prec
; src/parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, -40(%rbp)	;, next_op
	je	.L187	;,
; src/parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	movl	-36(%rbp), %eax	; next_prec, tmp117
	cmpl	-44(%rbp), %eax	; op_prec, tmp117
	jle	.L187	;,
; src/parser.c:671:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	-88(%rbp), %rdi	; parser, tmp118
	movq	-80(%rbp), %rcx	; now_scope, tmp119
	movl	-36(%rbp), %edx	; next_prec, tmp120
	movq	-24(%rbp), %rsi	; right, tmp121
	movq	-56(%rbp), %rax	; lexer, tmp122
	movq	%rdi, %r8	; tmp118,
	movq	%rax, %rdi	; tmp122,
	call	parse_expr_prec	;
	movq	%rax, -24(%rbp)	; tmp123, right
; src/parser.c:672:             if (right == 0)
	cmpq	$0, -24(%rbp)	;, right
	jne	.L188	;,
; src/parser.c:673:                 return NULL;
	movl	$0, %eax	;, _9
	jmp	.L185	;
.L188:
; src/parser.c:674:             token = peek_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp124
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp124,
	call	peek_next_token@PLT	;
	movq	%rax, -16(%rbp)	; tmp125, token
; src/parser.c:675:             token_ptr = token;
	movq	-16(%rbp), %rax	; token, tmp126
	movq	%rax, -32(%rbp)	; tmp126, token_ptr
.L186:
; src/parser.c:666:         while (token_ptr->type == SYMBOL) {
	movq	-32(%rbp), %rax	; token_ptr, tmp127
	movl	24(%rax), %eax	; token_ptr_6->type, _3
; src/parser.c:666:         while (token_ptr->type == SYMBOL) {
	cmpl	$5, %eax	;, _3
	je	.L189	;,
.L187:
; src/parser.c:677:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	-24(%rbp), %rdx	; right, tmp128
	movq	-64(%rbp), %rsi	; expr_left, tmp129
	movl	-48(%rbp), %eax	; op, tmp130
	movq	%rdx, %rcx	; tmp128,
	movl	$0, %edx	;,
	movl	%eax, %edi	; tmp130,
	call	create_expression@PLT	;
	movq	%rax, -64(%rbp)	; tmp131, expr_left
; src/parser.c:678:         token = peek_next_token(lexer, true);
	movq	-56(%rbp), %rax	; lexer, tmp132
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp132,
	call	peek_next_token@PLT	;
	movq	%rax, -16(%rbp)	; tmp133, token
; src/parser.c:679:         token_ptr = token;
	movq	-16(%rbp), %rax	; token, tmp134
	movq	%rax, -32(%rbp)	; tmp134, token_ptr
.L182:
; src/parser.c:649:     while (token_ptr->type == SYMBOL) {
	movq	-32(%rbp), %rax	; token_ptr, tmp135
	movl	24(%rax), %eax	; token_ptr_7->type, _4
; src/parser.c:649:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, %eax	;, _4
	je	.L190	;,
.L183:
; src/parser.c:681:     token = peek_current_token(lexer);
	movq	-56(%rbp), %rax	; lexer, tmp136
	movq	%rax, %rdi	; tmp136,
	call	peek_current_token@PLT	;
	movq	%rax, -16(%rbp)	; tmp137, token
; src/parser.c:682:     token_ptr = token;
	movq	-16(%rbp), %rax	; token, tmp138
	movq	%rax, -32(%rbp)	; tmp138, token_ptr
; src/parser.c:683:     return expr_left;
	movq	-64(%rbp), %rax	; expr_left, _9
.L185:
; src/parser.c:684: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE16:
	.size	parse_expr_prec, .-parse_expr_prec
	.section	.rodata
	.align 8
.LC71:
	.string	"Failed to parse expression primary"
	.text
	.type	parse_expression, @function
parse_expression:
.LFB17:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; lexer, lexer
	movq	%rsi, -32(%rbp)	; now_scope, now_scope
	movq	%rdx, -40(%rbp)	; parser, parser
; src/parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	-40(%rbp), %rdx	; parser, tmp86
	movq	-32(%rbp), %rcx	; now_scope, tmp87
	movq	-24(%rbp), %rax	; lexer, tmp88
	movq	%rcx, %rsi	; tmp87,
	movq	%rax, %rdi	; tmp88,
	call	parse_primary	;
	movq	%rax, -8(%rbp)	; tmp89, left_primary
; src/parser.c:690:     if (left_primary == 0) {
	cmpq	$0, -8(%rbp)	;, left_primary
	jne	.L192	;,
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	-24(%rbp), %rax	; lexer, tmp90
	movq	%rax, %rdi	; tmp90,
	call	peek_current_token@PLT	;
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rsi	; _1,
	leaq	.LC71(%rip), %rax	;, tmp91
	movq	%rax, %rdi	; tmp91,
	call	parser_error@PLT	;
; src/parser.c:692:         return NULL;
	movl	$0, %eax	;, _3
	jmp	.L193	;
.L192:
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	-8(%rbp), %rax	; left_primary, tmp92
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; tmp92,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	create_expression@PLT	;
	movq	%rax, %rsi	;, _2
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	-40(%rbp), %rcx	; parser, tmp93
	movq	-32(%rbp), %rdx	; now_scope, tmp94
	movq	-24(%rbp), %rax	; lexer, tmp95
	movq	%rcx, %r8	; tmp93,
	movq	%rdx, %rcx	; tmp94,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp95,
	call	parse_expr_prec	;
.L193:
; src/parser.c:695: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE17:
	.size	parse_expression, .-parse_expression
	.section	.rodata
	.align 8
.LC72:
	.string	"Failed to parse parenthesized expression"
.LC73:
	.string	"Expected ')' after expression"
	.align 8
.LC74:
	.string	"Failed to parse operand of unary '!'"
	.align 8
.LC75:
	.string	"Failed to parse operand of unary '-'"
	.align 8
.LC76:
	.string	"Failed to parse variable access"
	.align 8
.LC77:
	.string	"Unexpected token in primary expression"
	.text
	.type	parse_primary, @function
parse_primary:
.LFB18:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$96, %rsp	;,
	movq	%rdi, -72(%rbp)	; lexer, lexer
	movq	%rsi, -80(%rbp)	; now_scope, now_scope
	movq	%rdx, -88(%rbp)	; parser, parser
; src/parser.c:700:     Token* token = 0;
	movq	$0, -16(%rbp)	;, token
; src/parser.c:701:     Token* token_ptr = NULL;
	movq	$0, -8(%rbp)	;, token_ptr
; src/parser.c:702:     token = peek_current_token(lexer);
	movq	-72(%rbp), %rax	; lexer, tmp117
	movq	%rax, %rdi	; tmp117,
	call	peek_current_token@PLT	;
	movq	%rax, -16(%rbp)	; tmp118, token
; src/parser.c:703:     token_ptr = token;
	movq	-16(%rbp), %rax	; token, tmp119
	movq	%rax, -8(%rbp)	; tmp119, token_ptr
; src/parser.c:705:     string str_value = NULL;
	movq	$0, -48(%rbp)	;, str_value
; src/parser.c:706:     Expression* expr_value = NULL;
	movq	$0, -40(%rbp)	;, expr_value
; src/parser.c:707:     Primary* prim_value = NULL;
	movq	$0, -32(%rbp)	;, prim_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	movq	$0, -24(%rbp)	;, variable_value
; src/parser.c:709:     if (token_ptr->type == INTEGER) {
	movq	-8(%rbp), %rax	; token_ptr, tmp120
	movl	24(%rax), %eax	; token_ptr_56->type, _1
; src/parser.c:709:     if (token_ptr->type == INTEGER) {
	cmpl	$2, %eax	;, _1
	jne	.L195	;,
; src/parser.c:710:         type = PRIM_INTEGER;
	movl	$0, -52(%rbp)	;, type
; src/parser.c:711:         str_value = token_ptr->lexeme;
	movq	-8(%rbp), %rax	; token_ptr, tmp121
	movq	(%rax), %rax	; token_ptr_56->lexeme, tmp122
	movq	%rax, -48(%rbp)	; tmp122, str_value
	jmp	.L196	;
.L195:
; src/parser.c:712:     } else if (token_ptr->type == FLOAT) {
	movq	-8(%rbp), %rax	; token_ptr, tmp123
	movl	24(%rax), %eax	; token_ptr_56->type, _2
; src/parser.c:712:     } else if (token_ptr->type == FLOAT) {
	cmpl	$3, %eax	;, _2
	jne	.L197	;,
; src/parser.c:713:         type = PRIM_FLOAT;
	movl	$1, -52(%rbp)	;, type
; src/parser.c:714:         str_value = token_ptr->lexeme;
	movq	-8(%rbp), %rax	; token_ptr, tmp124
	movq	(%rax), %rax	; token_ptr_56->lexeme, tmp125
	movq	%rax, -48(%rbp)	; tmp125, str_value
	jmp	.L196	;
.L197:
; src/parser.c:715:     } else if (token_ptr->type == STRING) {
	movq	-8(%rbp), %rax	; token_ptr, tmp126
	movl	24(%rax), %eax	; token_ptr_56->type, _3
; src/parser.c:715:     } else if (token_ptr->type == STRING) {
	cmpl	$4, %eax	;, _3
	jne	.L198	;,
; src/parser.c:716:         type = PRIM_STRING;
	movl	$2, -52(%rbp)	;, type
; src/parser.c:717:         str_value = token_ptr->lexeme;
	movq	-8(%rbp), %rax	; token_ptr, tmp127
	movq	(%rax), %rax	; token_ptr_56->lexeme, tmp128
	movq	%rax, -48(%rbp)	; tmp128, str_value
	jmp	.L196	;
.L198:
; src/parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	movq	-8(%rbp), %rax	; token_ptr, tmp129
	movl	24(%rax), %eax	; token_ptr_56->type, _4
; src/parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	;, _4
	jne	.L199	;,
; src/parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	movq	TRUE_KEYWORD(%rip), %rdx	; TRUE_KEYWORD, TRUE_KEYWORD.72_5
	movq	-8(%rbp), %rax	; token_ptr, tmp130
	movq	(%rax), %rax	; token_ptr_56->lexeme, _6
	movq	%rdx, %rsi	; TRUE_KEYWORD.72_5,
	movq	%rax, %rdi	; _6,
	call	string_equal@PLT	;
; src/parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	; _7
	je	.L199	;,
; src/parser.c:719:         type = PRIM_TRUE;
	movl	$3, -52(%rbp)	;, type
; src/parser.c:720:         str_value = token_ptr->lexeme;
	movq	-8(%rbp), %rax	; token_ptr, tmp131
	movq	(%rax), %rax	; token_ptr_56->lexeme, tmp132
	movq	%rax, -48(%rbp)	; tmp132, str_value
	jmp	.L196	;
.L199:
; src/parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	movq	-8(%rbp), %rax	; token_ptr, tmp133
	movl	24(%rax), %eax	; token_ptr_56->type, _8
; src/parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, %eax	;, _8
	jne	.L200	;,
; src/parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	movq	FALSE_KEYWORD(%rip), %rdx	; FALSE_KEYWORD, FALSE_KEYWORD.73_9
	movq	-8(%rbp), %rax	; token_ptr, tmp134
	movq	(%rax), %rax	; token_ptr_56->lexeme, _10
	movq	%rdx, %rsi	; FALSE_KEYWORD.73_9,
	movq	%rax, %rdi	; _10,
	call	string_equal@PLT	;
; src/parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	; _11
	je	.L200	;,
; src/parser.c:722:         type = PRIM_FALSE;
	movl	$4, -52(%rbp)	;, type
; src/parser.c:723:         str_value = token_ptr->lexeme;
	movq	-8(%rbp), %rax	; token_ptr, tmp135
	movq	(%rax), %rax	; token_ptr_56->lexeme, tmp136
	movq	%rax, -48(%rbp)	; tmp136, str_value
	jmp	.L196	;
.L200:
; src/parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	; token_ptr, tmp137
	movl	24(%rax), %eax	; token_ptr_56->type, _12
; src/parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _12
	jne	.L201	;,
; src/parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rdx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.74_13
	movq	-8(%rbp), %rax	; token_ptr, tmp138
	movq	(%rax), %rax	; token_ptr_56->lexeme, _14
	movq	%rdx, %rsi	; L_PAREN_SYMBOL.74_13,
	movq	%rax, %rdi	; _14,
	call	string_equal@PLT	;
; src/parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; _15
	je	.L201	;,
; src/parser.c:725:         type = PRIM_EXPRESSION;
	movl	$5, -52(%rbp)	;, type
; src/parser.c:726:         token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp139
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp139,
	call	get_next_token@PLT	;
	movq	%rax, -16(%rbp)	; tmp140, token
; src/parser.c:727:         token_ptr = token;
	movq	-16(%rbp), %rax	; token, tmp141
	movq	%rax, -8(%rbp)	; tmp141, token_ptr
; src/parser.c:728:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	-88(%rbp), %rdx	; parser, tmp142
	movq	-80(%rbp), %rcx	; now_scope, tmp143
	movq	-72(%rbp), %rax	; lexer, tmp144
	movq	%rcx, %rsi	; tmp143,
	movq	%rax, %rdi	; tmp144,
	call	parse_expression	;
	movq	%rax, -40(%rbp)	; tmp145, expr_value
; src/parser.c:729:         if (expr_value == NULL) {
	cmpq	$0, -40(%rbp)	;, expr_value
	jne	.L202	;,
; src/parser.c:730:             parser_error("Failed to parse parenthesized expression", token);
	movq	-16(%rbp), %rax	; token, tmp146
	movq	%rax, %rsi	; tmp146,
	leaq	.LC72(%rip), %rax	;, tmp147
	movq	%rax, %rdi	; tmp147,
	call	parser_error@PLT	;
; src/parser.c:731:             return NULL;
	movl	$0, %eax	;, _39
	jmp	.L203	;
.L202:
; src/parser.c:733:         token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp148
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp148,
	call	get_next_token@PLT	;
	movq	%rax, -16(%rbp)	; tmp149, token
; src/parser.c:734:         token_ptr = token;
	movq	-16(%rbp), %rax	; token, tmp150
	movq	%rax, -8(%rbp)	; tmp150, token_ptr
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	-8(%rbp), %rax	; token_ptr, tmp151
	movl	24(%rax), %eax	; token_ptr_78->type, _16
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _16
	jne	.L204	;,
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.75_17
	movq	-8(%rbp), %rax	; token_ptr, tmp152
	movq	(%rax), %rax	; token_ptr_78->lexeme, _18
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.75_17,
	movq	%rax, %rdi	; _18,
	call	string_equal@PLT	;
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _19
	jne	.L213	;,
.L204:
; src/parser.c:736:             parser_error("Expected ')' after expression", token);
	movq	-16(%rbp), %rax	; token, tmp153
	movq	%rax, %rsi	; tmp153,
	leaq	.LC73(%rip), %rax	;, tmp154
	movq	%rax, %rdi	; tmp154,
	call	parser_error@PLT	;
; src/parser.c:737:             return NULL;
	movl	$0, %eax	;, _39
	jmp	.L203	;
.L201:
; src/parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	movq	-8(%rbp), %rax	; token_ptr, tmp155
	movl	24(%rax), %eax	; token_ptr_56->type, _20
; src/parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	cmpl	$5, %eax	;, _20
	jne	.L206	;,
; src/parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	movq	NOT_SYMBOL(%rip), %rdx	; NOT_SYMBOL, NOT_SYMBOL.76_21
	movq	-8(%rbp), %rax	; token_ptr, tmp156
	movq	(%rax), %rax	; token_ptr_56->lexeme, _22
	movq	%rdx, %rsi	; NOT_SYMBOL.76_21,
	movq	%rax, %rdi	; _22,
	call	string_equal@PLT	;
; src/parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	; _23
	je	.L206	;,
; src/parser.c:740:         type = PRIM_NOT_OPERAND;
	movl	$6, -52(%rbp)	;, type
; src/parser.c:741:         token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp157
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp157,
	call	get_next_token@PLT	;
	movq	%rax, -16(%rbp)	; tmp158, token
; src/parser.c:742:         token_ptr = token;
	movq	-16(%rbp), %rax	; token, tmp159
	movq	%rax, -8(%rbp)	; tmp159, token_ptr
; src/parser.c:743:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	-88(%rbp), %rdx	; parser, tmp160
	movq	-80(%rbp), %rcx	; now_scope, tmp161
	movq	-72(%rbp), %rax	; lexer, tmp162
	movq	%rcx, %rsi	; tmp161,
	movq	%rax, %rdi	; tmp162,
	call	parse_primary	;
	movq	%rax, -32(%rbp)	; tmp163, prim_value
; src/parser.c:744:         if (prim_value == 0) {
	cmpq	$0, -32(%rbp)	;, prim_value
	jne	.L196	;,
; src/parser.c:745:             parser_error("Failed to parse operand of unary '!'", token);
	movq	-16(%rbp), %rax	; token, tmp164
	movq	%rax, %rsi	; tmp164,
	leaq	.LC74(%rip), %rax	;, tmp165
	movq	%rax, %rdi	; tmp165,
	call	parser_error@PLT	;
; src/parser.c:746:             return NULL;
	movl	$0, %eax	;, _39
	jmp	.L203	;
.L206:
; src/parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	movq	-8(%rbp), %rax	; token_ptr, tmp166
	movl	24(%rax), %eax	; token_ptr_56->type, _24
; src/parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	cmpl	$5, %eax	;, _24
	jne	.L208	;,
; src/parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	movq	SUB_SYMBOL(%rip), %rdx	; SUB_SYMBOL, SUB_SYMBOL.77_25
	movq	-8(%rbp), %rax	; token_ptr, tmp167
	movq	(%rax), %rax	; token_ptr_56->lexeme, _26
	movq	%rdx, %rsi	; SUB_SYMBOL.77_25,
	movq	%rax, %rdi	; _26,
	call	string_equal@PLT	;
; src/parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	; _27
	je	.L208	;,
; src/parser.c:749:         type = PRIM_NEG_OPERAND;
	movl	$7, -52(%rbp)	;, type
; src/parser.c:750:         token = get_next_token(lexer, true);
	movq	-72(%rbp), %rax	; lexer, tmp168
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp168,
	call	get_next_token@PLT	;
	movq	%rax, -16(%rbp)	; tmp169, token
; src/parser.c:751:         token_ptr = token;
	movq	-16(%rbp), %rax	; token, tmp170
	movq	%rax, -8(%rbp)	; tmp170, token_ptr
; src/parser.c:752:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	-88(%rbp), %rdx	; parser, tmp171
	movq	-80(%rbp), %rcx	; now_scope, tmp172
	movq	-72(%rbp), %rax	; lexer, tmp173
	movq	%rcx, %rsi	; tmp172,
	movq	%rax, %rdi	; tmp173,
	call	parse_primary	;
	movq	%rax, -32(%rbp)	; tmp174, prim_value
; src/parser.c:753:         if (prim_value == 0) {
	cmpq	$0, -32(%rbp)	;, prim_value
	jne	.L196	;,
; src/parser.c:754:             parser_error("Failed to parse operand of unary '-'", token);
	movq	-16(%rbp), %rax	; token, tmp175
	movq	%rax, %rsi	; tmp175,
	leaq	.LC75(%rip), %rax	;, tmp176
	movq	%rax, %rdi	; tmp176,
	call	parser_error@PLT	;
; src/parser.c:755:             return NULL;
	movl	$0, %eax	;, _39
	jmp	.L203	;
.L208:
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movq	-8(%rbp), %rax	; token_ptr, tmp177
	movl	24(%rax), %eax	; token_ptr_56->type, _28
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$1, %eax	;, _28
	je	.L210	;,
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movq	-8(%rbp), %rax	; token_ptr, tmp178
	movl	24(%rax), %eax	; token_ptr_56->type, _29
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$6, %eax	;, _29
	jne	.L211	;,
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movq	SELF_KEYWORD(%rip), %rdx	; SELF_KEYWORD, SELF_KEYWORD.78_30
	movq	-8(%rbp), %rax	; token_ptr, tmp179
	movq	(%rax), %rax	; token_ptr_56->lexeme, _31
	movq	%rdx, %rsi	; SELF_KEYWORD.78_30,
	movq	%rax, %rdi	; _31,
	call	string_equal@PLT	;
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	testb	%al, %al	; _32
	je	.L211	;,
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movq	-88(%rbp), %rax	; parser, tmp180
	movzbl	1(%rax), %eax	; parser_73(D)->in_method, _33
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	testb	%al, %al	; _33
	je	.L211	;,
.L210:
; src/parser.c:758:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, -52(%rbp)	;, type
; src/parser.c:759:         variable_value = parse_variable_access(lexer, now_scope, parser);
	movq	-88(%rbp), %rdx	; parser, tmp181
	movq	-80(%rbp), %rcx	; now_scope, tmp182
	movq	-72(%rbp), %rax	; lexer, tmp183
	movq	%rcx, %rsi	; tmp182,
	movq	%rax, %rdi	; tmp183,
	call	parse_variable_access	;
	movq	%rax, -24(%rbp)	; tmp184, variable_value
; src/parser.c:760:         if (variable_value == 0) {
	cmpq	$0, -24(%rbp)	;, variable_value
	jne	.L196	;,
; src/parser.c:761:             parser_error("Failed to parse variable access", token);
	movq	-16(%rbp), %rax	; token, tmp185
	movq	%rax, %rsi	; tmp185,
	leaq	.LC76(%rip), %rax	;, tmp186
	movq	%rax, %rdi	; tmp186,
	call	parser_error@PLT	;
; src/parser.c:762:             return NULL;
	movl	$0, %eax	;, _39
	jmp	.L203	;
.L211:
; src/parser.c:765:         parser_error("Unexpected token in primary expression", token);
	movq	-16(%rbp), %rax	; token, tmp187
	movq	%rax, %rsi	; tmp187,
	leaq	.LC77(%rip), %rax	;, tmp188
	movq	%rax, %rdi	; tmp188,
	call	parser_error@PLT	;
; src/parser.c:766:         return NULL;
	movl	$0, %eax	;, _39
	jmp	.L203	;
.L213:
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	nop	
.L196:
; src/parser.c:768:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	-24(%rbp), %rdi	; variable_value, tmp189
	movq	-32(%rbp), %rcx	; prim_value, tmp190
	movq	-40(%rbp), %rdx	; expr_value, tmp191
	movq	-48(%rbp), %rsi	; str_value, tmp192
	movl	-52(%rbp), %eax	; type, tmp193
	movq	%rdi, %r8	; tmp189,
	movl	%eax, %edi	; tmp193,
	call	create_primary@PLT	;
.L203:
; src/parser.c:769: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE18:
	.size	parse_primary, .-parse_primary
	.section	.rodata
	.align 8
.LC78:
	.string	"Expected variable name in variable access"
	.align 8
.LC79:
	.string	"Cannot call undefined variable"
	.align 8
.LC80:
	.string	"Cannot call non-function variable"
	.align 8
.LC81:
	.string	"Failed to parse function call argument"
	.align 8
.LC82:
	.string	"Expected ',' or ')' after function call argument"
	.align 8
.LC83:
	.string	"Failed to parse sequence index"
	.align 8
.LC84:
	.string	"Expected ']' after sequence index"
	.align 8
.LC85:
	.string	"Cannot access attribute without a valid scope"
	.align 8
.LC86:
	.string	"Expected attribute name after '.'"
.LC87:
	.string	"Unknown attribute name"
	.text
	.type	parse_variable_access, @function
parse_variable_access:
.LFB19:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	addq	$-128, %rsp	;,
	movq	%rdi, -104(%rbp)	; lexer, lexer
	movq	%rsi, -112(%rbp)	; now_scope, now_scope
	movq	%rdx, -120(%rbp)	; parser, parser
; src/parser.c:774:     Token* token = peek_current_token(lexer);
	movq	-104(%rbp), %rax	; lexer, tmp127
	movq	%rax, %rdi	; tmp127,
	call	peek_current_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp128, token
; src/parser.c:775:     Token* token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp129
	movq	%rax, -80(%rbp)	; tmp129, token_ptr
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	movq	-80(%rbp), %rax	; token_ptr, tmp130
	movl	24(%rax), %eax	; token_ptr_77->type, _1
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	;, _1
	je	.L215	;,
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	movq	-80(%rbp), %rax	; token_ptr, tmp131
	movl	24(%rax), %eax	; token_ptr_77->type, _2
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	;, _2
	jne	.L216	;,
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	movq	SELF_KEYWORD(%rip), %rdx	; SELF_KEYWORD, SELF_KEYWORD.79_3
	movq	-80(%rbp), %rax	; token_ptr, tmp132
	movq	(%rax), %rax	; token_ptr_77->lexeme, _4
	movq	%rdx, %rsi	; SELF_KEYWORD.79_3,
	movq	%rax, %rdi	; _4,
	call	string_equal@PLT	;
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	; _5
	jne	.L215	;,
.L216:
; src/parser.c:777:         parser_error("Expected variable name in variable access", token);
	movq	-88(%rbp), %rax	; token, tmp133
	movq	%rax, %rsi	; tmp133,
	leaq	.LC78(%rip), %rax	;, tmp134
	movq	%rax, %rdi	; tmp134,
	call	parser_error@PLT	;
; src/parser.c:778:         return NULL;
	movl	$0, %eax	;, _57
	jmp	.L217	;
.L215:
; src/parser.c:780:     Name* current_type = 0;
	movq	$0, -72(%rbp)	;, current_type
; src/parser.c:781:     Name* base_name = 0;
	movq	$0, -64(%rbp)	;, base_name
; src/parser.c:782:     Scope* var_scope = 0;
	movq	$0, -56(%rbp)	;, var_scope
; src/parser.c:783:     Name* base_name_ptr = NULL;
	movq	$0, -40(%rbp)	;, base_name_ptr
; src/parser.c:784:     base_name = search(now_scope, token_ptr->lexeme);
	movq	-80(%rbp), %rax	; token_ptr, tmp135
	movq	(%rax), %rdx	; token_ptr_77->lexeme, _6
	movq	-112(%rbp), %rax	; now_scope, tmp136
	movq	%rdx, %rsi	; _6,
	movq	%rax, %rdi	; tmp136,
	call	search@PLT	;
	movq	%rax, -64(%rbp)	; tmp137, base_name
; src/parser.c:785:     VariableAccess* base = create_variable_access(VAR_NAME, 0, base_name, NULL, NULL);
	movq	-64(%rbp), %rax	; base_name, tmp138
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; tmp138,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_variable_access@PLT	;
	movq	%rax, -48(%rbp)	; tmp139, base
; src/parser.c:786:     token = peek_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp140
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp140,
	call	peek_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp141, token
; src/parser.c:787:     token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp142
	movq	%rax, -80(%rbp)	; tmp142, token_ptr
; src/parser.c:788:     while (token_ptr->type == SYMBOL) {
	jmp	.L218	;
.L243:
; src/parser.c:789:         if (base_name != 0) {
	cmpq	$0, -64(%rbp)	;, base_name
	je	.L219	;,
; src/parser.c:790:             base_name_ptr = (base_name);
	movq	-64(%rbp), %rax	; base_name, tmp143
	movq	%rax, -40(%rbp)	; tmp143, base_name_ptr
; src/parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	movq	-40(%rbp), %rax	; base_name_ptr, tmp144
	movl	24(%rax), %eax	; base_name_ptr_93->kind, _7
; src/parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	cmpl	$1, %eax	;, _7
	je	.L220	;,
; src/parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	movq	-40(%rbp), %rax	; base_name_ptr, tmp145
	movl	24(%rax), %eax	; base_name_ptr_93->kind, _8
; src/parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	cmpl	$5, %eax	;, _8
	je	.L220	;,
; src/parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	movq	-40(%rbp), %rax	; base_name_ptr, tmp146
	movl	24(%rax), %eax	; base_name_ptr_93->kind, _9
; src/parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	cmpl	$2, %eax	;, _9
	je	.L220	;,
; src/parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	movq	-40(%rbp), %rax	; base_name_ptr, tmp147
	movl	24(%rax), %eax	; base_name_ptr_93->kind, _10
; src/parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	cmpl	$3, %eax	;, _10
	jne	.L221	;,
.L220:
; src/parser.c:792:                 current_type = base_name_ptr->info.type;
	movq	-40(%rbp), %rax	; base_name_ptr, tmp148
	movq	16(%rax), %rax	; base_name_ptr_93->info.type, tmp149
	movq	%rax, -72(%rbp)	; tmp149, current_type
	jmp	.L219	;
.L221:
; src/parser.c:793:             else if (base_name_ptr->kind == NAME_CLASS || base_name_ptr->kind == NAME_TYPE)
	movq	-40(%rbp), %rax	; base_name_ptr, tmp150
	movl	24(%rax), %eax	; base_name_ptr_93->kind, _11
; src/parser.c:793:             else if (base_name_ptr->kind == NAME_CLASS || base_name_ptr->kind == NAME_TYPE)
	cmpl	$4, %eax	;, _11
	je	.L222	;,
; src/parser.c:793:             else if (base_name_ptr->kind == NAME_CLASS || base_name_ptr->kind == NAME_TYPE)
	movq	-40(%rbp), %rax	; base_name_ptr, tmp151
	movl	24(%rax), %eax	; base_name_ptr_93->kind, _12
; src/parser.c:793:             else if (base_name_ptr->kind == NAME_CLASS || base_name_ptr->kind == NAME_TYPE)
	testl	%eax, %eax	; _12
	jne	.L219	;,
.L222:
; src/parser.c:794:                 current_type = base_name;
	movq	-64(%rbp), %rax	; base_name, tmp152
	movq	%rax, -72(%rbp)	; tmp152, current_type
.L219:
; src/parser.c:796:         if (var_scope == 0 && current_type != 0) {
	cmpq	$0, -56(%rbp)	;, var_scope
	jne	.L223	;,
; src/parser.c:796:         if (var_scope == 0 && current_type != 0) {
	cmpq	$0, -72(%rbp)	;, current_type
	je	.L223	;,
; src/parser.c:797:             Name* type_ptr = (current_type);
	movq	-72(%rbp), %rax	; current_type, tmp153
	movq	%rax, -32(%rbp)	; tmp153, type_ptr
; src/parser.c:798:             if (type_ptr->kind == NAME_CLASS)
	movq	-32(%rbp), %rax	; type_ptr, tmp154
	movl	24(%rax), %eax	; type_ptr_96->kind, _13
; src/parser.c:798:             if (type_ptr->kind == NAME_CLASS)
	cmpl	$4, %eax	;, _13
	jne	.L223	;,
; src/parser.c:799:                 var_scope = type_ptr->info.scope;
	movq	-32(%rbp), %rax	; type_ptr, tmp155
	movq	16(%rax), %rax	; type_ptr_96->info.scope, tmp156
	movq	%rax, -56(%rbp)	; tmp156, var_scope
.L223:
; src/parser.c:801:         if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rdx	; L_PAREN_SYMBOL, L_PAREN_SYMBOL.80_14
	movq	-80(%rbp), %rax	; token_ptr, tmp157
	movq	(%rax), %rax	; token_ptr_46->lexeme, _15
	movq	%rdx, %rsi	; L_PAREN_SYMBOL.80_14,
	movq	%rax, %rdi	; _15,
	call	string_equal@PLT	;
; src/parser.c:801:         if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; _16
	je	.L224	;,
; src/parser.c:802:             token = get_next_token(lexer, true);  // consume '('
	movq	-104(%rbp), %rax	; lexer, tmp158
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp158,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp159, token
; src/parser.c:803:             token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp160
	movq	%rax, -80(%rbp)	; tmp160, token_ptr
; src/parser.c:804:             if (base_name == 0)
	cmpq	$0, -64(%rbp)	;, base_name
	jne	.L225	;,
; src/parser.c:805:                 parser_error("Cannot call undefined variable", token);
	movq	-88(%rbp), %rax	; token, tmp161
	movq	%rax, %rsi	; tmp161,
	leaq	.LC79(%rip), %rax	;, tmp162
	movq	%rax, %rdi	; tmp162,
	call	parser_error@PLT	;
.L225:
; src/parser.c:806:             base_name_ptr = (base_name);
	movq	-64(%rbp), %rax	; base_name, tmp163
	movq	%rax, -40(%rbp)	; tmp163, base_name_ptr
; src/parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	movq	-40(%rbp), %rax	; base_name_ptr, tmp164
	movl	24(%rax), %eax	; base_name_ptr_141->kind, _17
; src/parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	cmpl	$2, %eax	;, _17
	je	.L226	;,
; src/parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	movq	-40(%rbp), %rax	; base_name_ptr, tmp165
	movl	24(%rax), %eax	; base_name_ptr_141->kind, _18
; src/parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	cmpl	$3, %eax	;, _18
	je	.L226	;,
; src/parser.c:808:                 parser_error("Cannot call non-function variable", token);
	movq	-88(%rbp), %rax	; token, tmp166
	movq	%rax, %rsi	; tmp166,
	leaq	.LC80(%rip), %rax	;, tmp167
	movq	%rax, %rdi	; tmp167,
	call	parser_error@PLT	;
.L226:
; src/parser.c:809:             token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp168
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp168,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp169, token
; src/parser.c:810:             token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp170
	movq	%rax, -80(%rbp)	; tmp170, token_ptr
; src/parser.c:811:             list(Expression*) args = create_list();
	call	create_list@PLT	;
	movq	%rax, -16(%rbp)	; tmp171, args
; src/parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L227	;
.L232:
; src/parser.c:813:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	-120(%rbp), %rdx	; parser, tmp172
	movq	-112(%rbp), %rcx	; now_scope, tmp173
	movq	-104(%rbp), %rax	; lexer, tmp174
	movq	%rcx, %rsi	; tmp173,
	movq	%rax, %rdi	; tmp174,
	call	parse_expression	;
	movq	%rax, -8(%rbp)	; tmp175, arg
; src/parser.c:814:                 if (arg == 0)
	cmpq	$0, -8(%rbp)	;, arg
	jne	.L228	;,
; src/parser.c:815:                     parser_error("Failed to parse function call argument", token);
	movq	-88(%rbp), %rax	; token, tmp176
	movq	%rax, %rsi	; tmp176,
	leaq	.LC81(%rip), %rax	;, tmp177
	movq	%rax, %rdi	; tmp177,
	call	parser_error@PLT	;
.L228:
; src/parser.c:816:                 list_append(args, (pointer)arg);
	movq	-8(%rbp), %rdx	; arg, tmp178
	movq	-16(%rbp), %rax	; args, tmp179
	movq	%rdx, %rsi	; tmp178,
	movq	%rax, %rdi	; tmp179,
	call	list_append@PLT	;
; src/parser.c:817:                 token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp180
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp180,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp181, token
; src/parser.c:818:                 token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp182
	movq	%rax, -80(%rbp)	; tmp182, token_ptr
; src/parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	-80(%rbp), %rax	; token_ptr, tmp183
	movl	24(%rax), %eax	; token_ptr_160->type, _19
; src/parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, %eax	;, _19
	jne	.L229	;,
; src/parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	COMMA_SYMBOL(%rip), %rdx	; COMMA_SYMBOL, COMMA_SYMBOL.81_20
	movq	-80(%rbp), %rax	; token_ptr, tmp184
	movq	(%rax), %rax	; token_ptr_160->lexeme, _21
	movq	%rdx, %rsi	; COMMA_SYMBOL.81_20,
	movq	%rax, %rdi	; _21,
	call	string_equal@PLT	;
; src/parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	; _22
	je	.L229	;,
; src/parser.c:820:                     token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp185
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp185,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp186, token
; src/parser.c:821:                     token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp187
	movq	%rax, -80(%rbp)	; tmp187, token_ptr
	jmp	.L227	;
.L229:
; src/parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	-80(%rbp), %rax	; token_ptr, tmp188
	movl	24(%rax), %eax	; token_ptr_160->type, _23
; src/parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _23
	jne	.L231	;,
; src/parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.82_24
	movq	-80(%rbp), %rax	; token_ptr, tmp189
	movq	(%rax), %rax	; token_ptr_160->lexeme, _25
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.82_24,
	movq	%rax, %rdi	; _25,
	call	string_equal@PLT	;
; src/parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _26
	jne	.L227	;,
.L231:
; src/parser.c:823:                     parser_error("Expected ',' or ')' after function call argument", token);
	movq	-88(%rbp), %rax	; token, tmp190
	movq	%rax, %rsi	; tmp190,
	leaq	.LC82(%rip), %rax	;, tmp191
	movq	%rax, %rdi	; tmp191,
	call	parser_error@PLT	;
; src/parser.c:824:                     return NULL;
	movl	$0, %eax	;, _57
	jmp	.L217	;
.L227:
; src/parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	-80(%rbp), %rax	; token_ptr, tmp192
	movl	24(%rax), %eax	; token_ptr_45->type, _27
; src/parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _27
	jne	.L232	;,
; src/parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rdx	; R_PAREN_SYMBOL, R_PAREN_SYMBOL.83_28
	movq	-80(%rbp), %rax	; token_ptr, tmp193
	movq	(%rax), %rax	; token_ptr_45->lexeme, _29
	movq	%rdx, %rsi	; R_PAREN_SYMBOL.83_28,
	movq	%rax, %rdi	; _29,
	call	string_equal@PLT	;
; src/parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; _30
	je	.L232	;,
; src/parser.c:827:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	-16(%rbp), %rdx	; args, tmp194
	movq	-48(%rbp), %rax	; base, tmp195
	movq	%rdx, %r8	; tmp194,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp195,
	movl	$1, %edi	;,
	call	create_variable_access@PLT	;
	movq	%rax, -48(%rbp)	; tmp196, base
; src/parser.c:828:             base_name = base_name_ptr->info.type;
	movq	-40(%rbp), %rax	; base_name_ptr, tmp197
	movq	16(%rax), %rax	; base_name_ptr_141->info.type, tmp198
	movq	%rax, -64(%rbp)	; tmp198, base_name
; src/parser.c:829:             current_type = 0;
	movq	$0, -72(%rbp)	;, current_type
; src/parser.c:830:             var_scope = 0;
	movq	$0, -56(%rbp)	;, var_scope
	jmp	.L233	;
.L224:
; src/parser.c:831:         } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
	movq	L_BRACKET_SYMBOL(%rip), %rdx	; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL.84_31
	movq	-80(%rbp), %rax	; token_ptr, tmp199
	movq	(%rax), %rax	; token_ptr_46->lexeme, _32
	movq	%rdx, %rsi	; L_BRACKET_SYMBOL.84_31,
	movq	%rax, %rdi	; _32,
	call	string_equal@PLT	;
; src/parser.c:831:         } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	; _33
	je	.L234	;,
; src/parser.c:832:             token = get_next_token(lexer, true);  // consume '['
	movq	-104(%rbp), %rax	; lexer, tmp200
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp200,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp201, token
; src/parser.c:833:             token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp202
	movq	%rax, -80(%rbp)	; tmp202, token_ptr
; src/parser.c:834:             token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp203
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp203,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp204, token
; src/parser.c:835:             token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp205
	movq	%rax, -80(%rbp)	; tmp205, token_ptr
; src/parser.c:836:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	-120(%rbp), %rdx	; parser, tmp206
	movq	-112(%rbp), %rcx	; now_scope, tmp207
	movq	-104(%rbp), %rax	; lexer, tmp208
	movq	%rcx, %rsi	; tmp207,
	movq	%rax, %rdi	; tmp208,
	call	parse_expression	;
	movq	%rax, -24(%rbp)	; tmp209, index
; src/parser.c:837:             if (index == 0)
	cmpq	$0, -24(%rbp)	;, index
	jne	.L235	;,
; src/parser.c:838:                 parser_error("Failed to parse sequence index", token);
	movq	-88(%rbp), %rax	; token, tmp210
	movq	%rax, %rsi	; tmp210,
	leaq	.LC83(%rip), %rax	;, tmp211
	movq	%rax, %rdi	; tmp211,
	call	parser_error@PLT	;
.L235:
; src/parser.c:839:             token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp212
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp212,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp213, token
; src/parser.c:840:             token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp214
	movq	%rax, -80(%rbp)	; tmp214, token_ptr
; src/parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	movq	-80(%rbp), %rax	; token_ptr, tmp215
	movl	24(%rax), %eax	; token_ptr_131->type, _34
; src/parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, %eax	;, _34
	jne	.L236	;,
; src/parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	movq	R_BRACKET_SYMBOL(%rip), %rdx	; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL.85_35
	movq	-80(%rbp), %rax	; token_ptr, tmp216
	movq	(%rax), %rax	; token_ptr_131->lexeme, _36
	movq	%rdx, %rsi	; R_BRACKET_SYMBOL.85_35,
	movq	%rax, %rdi	; _36,
	call	string_equal@PLT	;
; src/parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	testb	%al, %al	; _37
	jne	.L237	;,
.L236:
; src/parser.c:842:                 parser_error("Expected ']' after sequence index", token);
	movq	-88(%rbp), %rax	; token, tmp217
	movq	%rax, %rsi	; tmp217,
	leaq	.LC84(%rip), %rax	;, tmp218
	movq	%rax, %rdi	; tmp218,
	call	parser_error@PLT	;
; src/parser.c:843:                 return NULL;
	movl	$0, %eax	;, _57
	jmp	.L217	;
.L237:
; src/parser.c:845:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movq	-24(%rbp), %rdx	; index, tmp219
	movq	-48(%rbp), %rax	; base, tmp220
	movl	$0, %r8d	;,
	movq	%rdx, %rcx	; tmp219,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp220,
	movl	$3, %edi	;,
	call	create_variable_access@PLT	;
	movq	%rax, -48(%rbp)	; tmp221, base
	jmp	.L233	;
.L234:
; src/parser.c:846:         } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
	movq	DOT_SYMBOL(%rip), %rdx	; DOT_SYMBOL, DOT_SYMBOL.86_38
	movq	-80(%rbp), %rax	; token_ptr, tmp222
	movq	(%rax), %rax	; token_ptr_46->lexeme, _39
	movq	%rdx, %rsi	; DOT_SYMBOL.86_38,
	movq	%rax, %rdi	; _39,
	call	string_equal@PLT	;
; src/parser.c:846:         } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	; _40
	je	.L244	;,
; src/parser.c:847:             token = get_next_token(lexer, true);  // consume '.'
	movq	-104(%rbp), %rax	; lexer, tmp223
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp223,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp224, token
; src/parser.c:848:             token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp225
	movq	%rax, -80(%rbp)	; tmp225, token_ptr
; src/parser.c:849:             token = get_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp226
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp226,
	call	get_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp227, token
; src/parser.c:850:             token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp228
	movq	%rax, -80(%rbp)	; tmp228, token_ptr
; src/parser.c:851:             if (var_scope == 0) {
	cmpq	$0, -56(%rbp)	;, var_scope
	jne	.L239	;,
; src/parser.c:852:                 parser_error("Cannot access attribute without a valid scope", token);
	movq	-88(%rbp), %rax	; token, tmp229
	movq	%rax, %rsi	; tmp229,
	leaq	.LC85(%rip), %rax	;, tmp230
	movq	%rax, %rdi	; tmp230,
	call	parser_error@PLT	;
; src/parser.c:853:                 return NULL;
	movl	$0, %eax	;, _57
	jmp	.L217	;
.L239:
; src/parser.c:855:             if (token_ptr->type != IDENTIFIER) {
	movq	-80(%rbp), %rax	; token_ptr, tmp231
	movl	24(%rax), %eax	; token_ptr_106->type, _41
; src/parser.c:855:             if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, %eax	;, _41
	je	.L240	;,
; src/parser.c:856:                 parser_error("Expected attribute name after '.'", token);
	movq	-88(%rbp), %rax	; token, tmp232
	movq	%rax, %rsi	; tmp232,
	leaq	.LC86(%rip), %rax	;, tmp233
	movq	%rax, %rdi	; tmp233,
	call	parser_error@PLT	;
; src/parser.c:857:                 return NULL;
	movl	$0, %eax	;, _57
	jmp	.L217	;
.L240:
; src/parser.c:859:             base_name = search(var_scope, token_ptr->lexeme);
	movq	-80(%rbp), %rax	; token_ptr, tmp234
	movq	(%rax), %rdx	; token_ptr_106->lexeme, _42
	movq	-56(%rbp), %rax	; var_scope, tmp235
	movq	%rdx, %rsi	; _42,
	movq	%rax, %rdi	; tmp235,
	call	search@PLT	;
	movq	%rax, -64(%rbp)	; tmp236, base_name
; src/parser.c:860:             if (base_name == 0) {
	cmpq	$0, -64(%rbp)	;, base_name
	jne	.L241	;,
; src/parser.c:861:                 parser_error("Unknown attribute name", token);
	movq	-88(%rbp), %rax	; token, tmp237
	movq	%rax, %rsi	; tmp237,
	leaq	.LC87(%rip), %rax	;, tmp238
	movq	%rax, %rdi	; tmp238,
	call	parser_error@PLT	;
; src/parser.c:862:                 return NULL;
	movl	$0, %eax	;, _57
	jmp	.L217	;
.L241:
; src/parser.c:864:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	-64(%rbp), %rdx	; base_name, tmp239
	movq	-48(%rbp), %rax	; base, tmp240
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	%rax, %rsi	; tmp240,
	movl	$2, %edi	;,
	call	create_variable_access@PLT	;
	movq	%rax, -48(%rbp)	; tmp241, base
; src/parser.c:865:             current_type = 0;
	movq	$0, -72(%rbp)	;, current_type
; src/parser.c:866:             var_scope = 0;
	movq	$0, -56(%rbp)	;, var_scope
.L233:
; src/parser.c:869:         token = peek_next_token(lexer, true);
	movq	-104(%rbp), %rax	; lexer, tmp242
	movl	$1, %esi	;,
	movq	%rax, %rdi	; tmp242,
	call	peek_next_token@PLT	;
	movq	%rax, -88(%rbp)	; tmp243, token
; src/parser.c:870:         token_ptr = token;
	movq	-88(%rbp), %rax	; token, tmp244
	movq	%rax, -80(%rbp)	; tmp244, token_ptr
.L218:
; src/parser.c:788:     while (token_ptr->type == SYMBOL) {
	movq	-80(%rbp), %rax	; token_ptr, tmp245
	movl	24(%rax), %eax	; token_ptr_46->type, _43
; src/parser.c:788:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, %eax	;, _43
	je	.L243	;,
	jmp	.L242	;
.L244:
; src/parser.c:868:             break;
	nop	
.L242:
; src/parser.c:872:     return base;
	movq	-48(%rbp), %rax	; base, _57
.L217:
; src/parser.c:873: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE19:
	.size	parse_variable_access, .-parse_variable_access
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
