	.file	"D:\\TC\\src\\parser.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Failed to parse right operand\0"
	.text
	.p2align 4
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
parse_expr_prec:
	pushq	%r15	 ;
	pushq	%r14	 ;
	movl	%r8d, %r14d	 ; tmp126, min_prec
	pushq	%r13	 ;
	movq	%r9, %r13	 ; tmp127, now_scope
	pushq	%r12	 ;
	movq	%rdx, %r12	 ; tmp125, expr_left
 ; D:\TC\src\parser.c:528:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:526: static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, SymbolTable* now_scope, Parser* parser) {
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp124, lexer
	subq	$56, %rsp	 ;,
 ; D:\TC\src\parser.c:528:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:529:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;,
	jne	.L2	 ;,
.L9:
 ; D:\TC\src\parser.c:530:         OperatorType op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_70->lexeme, token_70->lexeme
	call	string_to_operator	 ;
 ; D:\TC\src\parser.c:531:         int op_prec = operator_precedence(op);
	movl	%eax, %ecx	 ; op,
 ; D:\TC\src\parser.c:530:         OperatorType op = string_to_operator(token->lexeme);
	movl	%eax, %edi	 ; tmp129, op
 ; D:\TC\src\parser.c:531:         int op_prec = operator_precedence(op);
	call	operator_precedence	 ;
	movl	%eax, %esi	 ; tmp130, op_prec
 ; D:\TC\src\parser.c:532:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, %edi	 ;, op
	je	.L2	 ;,
	cmpl	%r14d, %eax	 ; min_prec, op_prec
	jl	.L2	 ;,
 ; D:\TC\src\parser.c:534:         token = get_next_token(lexer, true);  // consume operator
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:535:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:536:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	160(%rsp), %r8	 ; parser,
	movq	%r13, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:535:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp131, token
 ; D:\TC\src\parser.c:536:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp132, right_primary
 ; D:\TC\src\parser.c:537:         if (right_primary == NULL) {
	testq	%rax, %rax	 ; right_primary
	je	.L17	 ;,
 ; D:\TC\src\parser.c:541:         Expression* right = create_expression(OP_NONE, NULL, right_primary, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rbp	 ; tmp134, right
.L15:
 ; D:\TC\src\parser.c:542:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:543:         while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;,
	jne	.L5	 ;,
 ; D:\TC\src\parser.c:544:             OperatorType next_op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_69->lexeme, token_69->lexeme
	call	string_to_operator	 ;
	movl	%eax, %r15d	 ; tmp136, next_op
 ; D:\TC\src\parser.c:545:             int next_prec = operator_precedence(next_op);
	movl	%eax, %ecx	 ; next_op,
	call	operator_precedence	 ;
 ; D:\TC\src\parser.c:546:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %r15d	 ;, next_op
	je	.L5	 ;,
	cmpl	%eax, %esi	 ; next_prec, op_prec
	jge	.L5	 ;,
 ; D:\TC\src\parser.c:548:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	160(%rsp), %rdx	 ; parser, tmp144
	movq	%r13, %r9	 ; now_scope,
	movl	%eax, %r8d	 ; next_prec,
	movq	%rbx, %rcx	 ; lexer,
	movq	%rdx, 32(%rsp)	 ; tmp144,
	movq	%rbp, %rdx	 ; right,
	call	parse_expr_prec	 ;
	movq	%rax, %rbp	 ; tmp138, right
 ; D:\TC\src\parser.c:549:             if (right == NULL)
	testq	%rax, %rax	 ; right
	jne	.L15	 ;,
 ; D:\TC\src\parser.c:539:             return NULL;
	xorl	%r12d, %r12d	 ; <retval>
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L5:
 ; D:\TC\src\parser.c:553:         expr_left = create_expression(op, expr_left, NULL, right);
	xorl	%r8d, %r8d	 ;
	movq	%r12, %rdx	 ; expr_left,
	movq	%rbp, %r9	 ; right,
	movl	%edi, %ecx	 ; op,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:554:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:553:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rax, %r12	 ; tmp140, expr_left
 ; D:\TC\src\parser.c:554:         token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:529:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;,
	je	.L9	 ;,
.L2:
 ; D:\TC\src\parser.c:556:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
.L1:
 ; D:\TC\src\parser.c:558: }
	addq	$56, %rsp	 ;,
	movq	%r12, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L17:
 ; D:\TC\src\parser.c:538:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	160(%rsp), %rax	 ; parser, tmp143
 ; D:\TC\src\parser.c:539:             return NULL;
	xorl	%r12d, %r12d	 ; <retval>
 ; D:\TC\src\parser.c:538:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	(%rax), %rcx	 ; parser_38(D)->source_file, parser_38(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:538:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC0(%rip), %rcx	 ;, tmp117
 ; D:\TC\src\parser.c:538:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp133
 ; D:\TC\src\parser.c:538:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L1	 ;
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "Failed to parse expression primary\0"
	.text
	.p2align 4
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%rbp	 ;
	movq	%rdx, %rbp	 ; tmp94, now_scope
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp95, parser
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp93, lexer
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %rbx	 ; tmp96, <retval>
 ; D:\TC\src\parser.c:561:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L22	 ;,
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	movq	%rax, %r8	 ; <retval>,
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rdi, 32(%rsp)	 ; parser,
	movq	%rbp, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp99, _4
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rbx	 ; tmp100, <retval>
.L18:
 ; D:\TC\src\parser.c:566: }
	addq	$56, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L22:
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_10(D)->source_file, parser_10(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdi	 ; tmp97, _2
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rdi, %r8	 ; _2,
	leaq	.LC1(%rip), %rcx	 ;, tmp91
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp98, _3
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:563:         return NULL;
	jmp	.L18	 ;
	.section .rdata,"dr"
.LC2:
	.ascii "Expected variable type\0"
	.align 8
.LC3:
	.ascii "Expected a type for variable declaration\0"
.LC4:
	.ascii "Unknown variable type\0"
.LC5:
	.ascii "Expected variable name\0"
	.align 8
.LC6:
	.ascii "Failed to parse variable initializer\0"
	.text
	.p2align 4
	.def	parse_variable;	.scl	3;	.type	32;	.endef
parse_variable:
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%r8, %r12	 ; tmp140, parser
	pushq	%rbp	 ;
	movq	%rdx, %rbp	 ; tmp139, now_scope
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp138, lexer
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:\TC\src\parser.c:276:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rbx	 ; tmp141, token
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_36->type, _1
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _1
	je	.L24	 ;,
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _1
	jne	.L27	 ;,
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rbx), %rcx	 ; token_36->lexeme, token_36->lexeme
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp143
	je	.L27	 ;,
.L24:
 ; D:\TC\src\parser.c:281:     Symbol* type = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rdx	 ; token_36->lexeme, token_36->lexeme
	movq	%rbp, %rcx	 ; now_scope,
	call	search_name	 ;
	movq	%rax, %rdi	 ; tmp144, type
 ; D:\TC\src\parser.c:282:     if (type != NULL) {
	testq	%rax, %rax	 ; type
	je	.L28	 ;,
 ; D:\TC\src\parser.c:284:         if (type_ptr->kind != SYMBOL_TYPE && type_ptr->kind != SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; type_43->kind, _46
 ; D:\TC\src\parser.c:284:         if (type_ptr->kind != SYMBOL_TYPE && type_ptr->kind != SYMBOL_CLASS)
	cmpl	$5, %eax	 ;, _46
	je	.L29	 ;,
	testl	%eax, %eax	 ; _46
	jne	.L52	 ;,
.L29:
 ; D:\TC\src\parser.c:288:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:289:     if (token->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	 ;, token_50->type
 ; D:\TC\src\parser.c:288:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp147, token
 ; D:\TC\src\parser.c:289:     if (token->type != IDENTIFIER)
	jne	.L53	 ;,
.L30:
 ; D:\TC\src\parser.c:291:     Symbol* name = create_symbol(token->lexeme, SYMBOL_VARIABLE, type, now_scope);
	movq	(%rbx), %rcx	 ; token_50->lexeme, token_50->lexeme
	movq	%rbp, %r9	 ; now_scope,
	movq	%rdi, %r8	 ; type,
	movl	$2, %edx	 ;,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:293:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:291:     Symbol* name = create_symbol(token->lexeme, SYMBOL_VARIABLE, type, now_scope);
	movq	%rax, %rbx	 ; tmp149, name
 ; D:\TC\src\parser.c:293:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:294:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_56->type
	je	.L31	 ;,
.L33:
 ; D:\TC\src\parser.c:292:     Expression* value = NULL;
	xorl	%esi, %esi	 ; value
.L32:
 ; D:\TC\src\parser.c:302: }
	addq	$40, %rsp	 ;,
 ; D:\TC\src\parser.c:301:     return create_variable(type, name, value);
	movq	%rsi, %r8	 ; value,
	movq	%rbx, %rdx	 ; name,
	movq	%rdi, %rcx	 ; type,
 ; D:\TC\src\parser.c:302: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
 ; D:\TC\src\parser.c:301:     return create_variable(type, name, value);
	jmp	create_variable	 ;
	.p2align 4,,10
	.p2align 3
.L53:
 ; D:\TC\src\parser.c:290:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_38(D)->source_file, parser_38(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:290:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC5(%rip), %rcx	 ;, tmp130
 ; D:\TC\src\parser.c:290:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp148
 ; D:\TC\src\parser.c:290:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L30	 ;
	.p2align 4,,10
	.p2align 3
.L27:
 ; D:\TC\src\parser.c:278:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_38(D)->source_file, parser_38(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:278:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC2(%rip), %rcx	 ;, tmp118
 ; D:\TC\src\parser.c:278:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp142
 ; D:\TC\src\parser.c:278:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:302: }
	addq	$40, %rsp	 ;,
	xorl	%eax, %eax	 ;
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L52:
 ; D:\TC\src\parser.c:285:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_38(D)->source_file, parser_38(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:285:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC3(%rip), %rcx	 ;, tmp126
 ; D:\TC\src\parser.c:285:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp145
 ; D:\TC\src\parser.c:285:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L29	 ;
	.p2align 4,,10
	.p2align 3
.L31:
 ; D:\TC\src\parser.c:294:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx	 ;, tmp132
	movq	(%rax), %rcx	 ; token_56->lexeme, token_56->lexeme
	movq	(%rdx), %rdx	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:294:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	 ; tmp151
	je	.L33	 ;,
 ; D:\TC\src\parser.c:295:         token = get_next_token(lexer, true);  // consume '='
	movq	%rsi, %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:296:         token = get_next_token(lexer, true);
	movq	%rsi, %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:297:         value = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %rcx	 ; lexer,
	movq	%r12, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
 ; D:\TC\src\parser.c:296:         token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp152, token
 ; D:\TC\src\parser.c:297:         value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rsi	 ; tmp153, value
 ; D:\TC\src\parser.c:298:         if (value == NULL)
	testq	%rax, %rax	 ; value
	jne	.L32	 ;,
 ; D:\TC\src\parser.c:299:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_38(D)->source_file, parser_38(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:299:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC6(%rip), %rcx	 ;, tmp136
 ; D:\TC\src\parser.c:299:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp154
 ; D:\TC\src\parser.c:299:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L32	 ;
	.p2align 4,,10
	.p2align 3
.L28:
 ; D:\TC\src\parser.c:287:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_38(D)->source_file, parser_38(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:287:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC4(%rip), %rcx	 ;, tmp128
 ; D:\TC\src\parser.c:287:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp146
 ; D:\TC\src\parser.c:287:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L29	 ;
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "Failed to parse parenthesized expression\0"
.LC8:
	.ascii "Expected ')' after expression\0"
	.align 8
.LC9:
	.ascii "Failed to parse operand of unary '!'\0"
	.align 8
.LC10:
	.ascii "Failed to parse operand of unary '-'\0"
	.align 8
.LC11:
	.ascii "Expected variable name in variable access\0"
	.align 8
.LC12:
	.ascii "Cannot call undefined variable\0"
	.align 8
.LC13:
	.ascii "Cannot call non-function variable\0"
	.align 8
.LC14:
	.ascii "Failed to parse function call argument\0"
	.align 8
.LC15:
	.ascii "Expected ',' or ')' after function call argument\0"
	.align 8
.LC16:
	.ascii "Failed to parse sequence index\0"
	.align 8
.LC17:
	.ascii "Expected ']' after sequence index\0"
	.align 8
.LC18:
	.ascii "Cannot access attribute without a valid scope\0"
	.align 8
.LC19:
	.ascii "Expected attribute name after '.'\0"
.LC20:
	.ascii "Unknown attribute name\0"
	.align 8
.LC21:
	.ascii "Failed to parse variable access\0"
	.align 8
.LC22:
	.ascii "Unexpected token in primary expression\0"
	.text
	.p2align 4
	.def	parse_primary;	.scl	3;	.type	32;	.endef
parse_primary:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp300, now_scope
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp301, parser
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp299, lexer
	subq	$88, %rsp	 ;,
 ; D:\TC\src\parser.c:569:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %r14	 ; tmp302, token
 ; D:\TC\src\parser.c:575:     if (token->type == INTEGER) {
	movl	24(%rax), %eax	 ; token_62->type, _1
 ; D:\TC\src\parser.c:575:     if (token->type == INTEGER) {
	cmpl	$2, %eax	 ;, _1
	je	.L168	 ;,
 ; D:\TC\src\parser.c:578:     } else if (token->type == FLOAT) {
	cmpl	$3, %eax	 ;, _1
	je	.L169	 ;,
 ; D:\TC\src\parser.c:581:     } else if (token->type == STRING) {
	cmpl	$4, %eax	 ;, _1
	je	.L170	 ;,
 ; D:\TC\src\parser.c:584:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _1
	je	.L171	 ;,
.L59:
 ; D:\TC\src\parser.c:590:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _1
	je	.L63	 ;,
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$1, %eax	 ;, _1
	je	.L65	 ;,
.L66:
 ; D:\TC\src\parser.c:627:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:627:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC22(%rip), %rcx	 ;, tmp290
 ; D:\TC\src\parser.c:627:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp361
 ; D:\TC\src\parser.c:627:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:596:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L54	 ;
	.p2align 4,,10
	.p2align 3
.L169:
 ; D:\TC\src\parser.c:580:         str_value = token->lexeme;
	movq	(%r14), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:579:         type = PRIM_FLOAT;
	movl	$1, %ebx	 ;, type
.L56:
 ; D:\TC\src\parser.c:630:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%r10, 32(%rsp)	 ; variable_value,
	movl	%ebx, %ecx	 ; type,
	call	create_primary	 ;
.L54:
 ; D:\TC\src\parser.c:631: }
	addq	$88, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L168:
 ; D:\TC\src\parser.c:577:         str_value = token->lexeme;
	movq	(%r14), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:576:         type = PRIM_INTEGER;
	xorl	%ebx, %ebx	 ; type
	jmp	.L56	 ;
	.p2align 4,,10
	.p2align 3
.L170:
 ; D:\TC\src\parser.c:583:         str_value = token->lexeme;
	movq	(%r14), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:582:         type = PRIM_STRING;
	movl	$2, %ebx	 ;, type
	jmp	.L56	 ;
	.p2align 4,,10
	.p2align 3
.L171:
 ; D:\TC\src\parser.c:584:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	movq	.refptr.TRUE_KEYWORD(%rip), %rax	 ;, tmp208
	movq	(%r14), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%rax), %rdx	 ; TRUE_KEYWORD, TRUE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:584:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	 ; tmp303
	jne	.L172	 ;,
 ; D:\TC\src\parser.c:587:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movl	24(%r14), %eax	 ; token_62->type, _6
 ; D:\TC\src\parser.c:587:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _6
	jne	.L59	 ;,
 ; D:\TC\src\parser.c:587:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movq	.refptr.FALSE_KEYWORD(%rip), %rax	 ;, tmp211
	movq	(%r14), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%rax), %rdx	 ; FALSE_KEYWORD, FALSE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:587:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	 ; tmp304
	jne	.L62	 ;,
 ; D:\TC\src\parser.c:590:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movl	24(%r14), %eax	 ; token_62->type, pretmp_52
 ; D:\TC\src\parser.c:590:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, pretmp_52
	jne	.L74	 ;,
	.p2align 4,,10
	.p2align 3
.L63:
 ; D:\TC\src\parser.c:590:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r11	 ;, tmp292
	movq	(%r14), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%r11), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:590:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp305
	jne	.L173	 ;,
 ; D:\TC\src\parser.c:603:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movl	24(%r14), %eax	 ; token_62->type, pretmp_52
 ; D:\TC\src\parser.c:603:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	cmpl	$5, %eax	 ;, pretmp_52
	jne	.L74	 ;,
 ; D:\TC\src\parser.c:603:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp224
	movq	(%r14), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%rax), %rdx	 ; NOT_SYMBOL, NOT_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:603:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	 ; tmp312
	jne	.L174	 ;,
 ; D:\TC\src\parser.c:611:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movl	24(%r14), %eax	 ; token_62->type, pretmp_52
 ; D:\TC\src\parser.c:611:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	cmpl	$5, %eax	 ;, pretmp_52
	jne	.L74	 ;,
 ; D:\TC\src\parser.c:611:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp228
	movq	(%r14), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%rax), %rdx	 ; SUB_SYMBOL, SUB_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:611:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	 ; tmp316
	jne	.L75	 ;,
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movl	24(%r14), %eax	 ; token_62->type, pretmp_52
.L74:
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$1, %eax	 ;, pretmp_52
	je	.L65	 ;,
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$6, %eax	 ;, pretmp_52
	jne	.L66	 ;,
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp232
	movq	(%r14), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	testb	%al, %al	 ; tmp321
	je	.L66	 ;,
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpb	$0, 9(%rsi)	 ;, parser_71(D)->in_method
	je	.L66	 ;,
.L65:
 ; D:\TC\src\parser.c:633:     Token* token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %rbp	 ; tmp320, token
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movl	24(%rax), %eax	 ; token_107->type, _108
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	 ;, _108
	je	.L78	 ;,
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	 ;, _108
	jne	.L81	 ;,
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp237
	movq	0(%rbp), %rcx	 ; token_107->lexeme, token_107->lexeme
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	 ; tmp323
	je	.L81	 ;,
.L78:
 ; D:\TC\src\parser.c:641:     base_name = search_name(now_scope, token->lexeme);
	movq	0(%rbp), %rdx	 ; token_107->lexeme, token_107->lexeme
	movq	%rdi, %rcx	 ; now_scope,
	call	search_name	 ;
 ; D:\TC\src\parser.c:642:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	$0, 32(%rsp)	 ;,
	movq	%rax, %r8	 ; base_name,
 ; D:\TC\src\parser.c:641:     base_name = search_name(now_scope, token->lexeme);
	movq	%rax, %rbp	 ; tmp324, base_name
 ; D:\TC\src\parser.c:642:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:643:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:642:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	movq	%rax, 56(%rsp)	 ; variable_value, %sfp
 ; D:\TC\src\parser.c:643:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:644:     while (token->type == SYMBOL) {
	movq	56(%rsp), %r10	 ; %sfp, variable_value
	cmpl	$5, 24(%rax)	 ;, token_117->type
 ; D:\TC\src\parser.c:643:     token = peek_next_token(lexer, true);
	movq	%rax, %r15	 ; tmp326, token
 ; D:\TC\src\parser.c:644:     while (token->type == SYMBOL) {
	jne	.L82	 ;,
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r11	 ;, tmp292
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	%r10, 64(%rsp)	 ; variable_value, %sfp
 ; D:\TC\src\parser.c:638:     Symbol* current_type = NULL;
	xorl	%r12d, %r12d	 ; current_type
 ; D:\TC\src\parser.c:640:     SymbolTable* var_scope = NULL;
	xorl	%r13d, %r13d	 ; var_scope
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	%r14, 56(%rsp)	 ; token, %sfp
	movq	%rdi, %r14	 ; now_scope, now_scope
	movq	%r11, 72(%rsp)	 ; tmp292, %sfp
.L105:
 ; D:\TC\src\parser.c:645:         if (base_name != NULL) {
	testq	%rbp, %rbp	 ; base_name
	je	.L83	 ;,
 ; D:\TC\src\parser.c:647:             if (base_name->type != NULL)  // subroutine or variable or attribute or parameter
	movq	0(%rbp), %r12	 ; base_name_201->type, current_type
 ; D:\TC\src\parser.c:646:             current_type = base_name;     // class or type
	testq	%r12, %r12	 ; current_type
	cmove	%rbp, %r12	 ; current_type,, base_name, current_type
.L83:
 ; D:\TC\src\parser.c:650:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	testq	%r13, %r13	 ; var_scope
	jne	.L84	 ;,
	testq	%r12, %r12	 ; current_type
	je	.L84	 ;,
 ; D:\TC\src\parser.c:650:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	movl	32(%r12), %edx	 ; current_type_122->kind,
	testl	%edx, %edx	 ;
	jne	.L84	 ;,
 ; D:\TC\src\parser.c:651:             var_scope = current_type->scope;
	movq	8(%r12), %r13	 ; current_type_122->scope, var_scope
.L84:
 ; D:\TC\src\parser.c:652:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	72(%rsp), %rax	 ; %sfp, tmp292
	movq	(%r15), %rcx	 ; token_206->lexeme, token_206->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:652:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp327
	jne	.L175	 ;,
 ; D:\TC\src\parser.c:683:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp385
	movq	(%r15), %rcx	 ; token_206->lexeme, token_206->lexeme
	movq	(%rax), %rdx	 ; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:683:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp344
	je	.L98	 ;,
 ; D:\TC\src\parser.c:684:             token = get_next_token(lexer, true);  // consume '['
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:685:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:686:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%r14, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:685:             token = get_next_token(lexer, true);
	movq	%rax, %r15	 ; tmp345, token
 ; D:\TC\src\parser.c:686:             Expression* index = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rdi	 ; tmp346, index
 ; D:\TC\src\parser.c:687:             if (index == NULL)
	testq	%rax, %rax	 ; index
	je	.L176	 ;,
.L99:
 ; D:\TC\src\parser.c:689:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_181->type
 ; D:\TC\src\parser.c:689:             token = get_next_token(lexer, true);
	movq	%rax, %r15	 ; tmp348, token
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	jne	.L101	 ;,
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp386
	movq	(%r15), %rcx	 ; token_181->lexeme, token_181->lexeme
	movq	(%rax), %rdx	 ; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp350
	je	.L101	 ;,
 ; D:\TC\src\parser.c:694:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movq	64(%rsp), %rdx	 ; %sfp,
	movq	%rdi, %r9	 ; index,
	xorl	%r8d, %r8d	 ;
	movl	$3, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_variable_access	 ;
	movq	%rax, 64(%rsp)	 ; tmp351, %sfp
.L97:
 ; D:\TC\src\parser.c:716:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:644:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_208->type
 ; D:\TC\src\parser.c:716:         token = peek_next_token(lexer, true);
	movq	%rax, %r15	 ; tmp359, token
 ; D:\TC\src\parser.c:644:     while (token->type == SYMBOL) {
	je	.L105	 ;,
.L163:
	movq	56(%rsp), %r14	 ; %sfp, token
	movq	64(%rsp), %r10	 ; %sfp, variable_value
.L82:
 ; D:\TC\src\parser.c:622:         if (variable_value == NULL) {
	testq	%r10, %r10	 ; variable_value
	je	.L80	 ;,
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:571:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:620:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %ebx	 ;, type
	jmp	.L56	 ;
	.p2align 4,,10
	.p2align 3
.L98:
 ; D:\TC\src\parser.c:695:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp387
	movq	(%r15), %rcx	 ; token_206->lexeme, token_206->lexeme
	movq	(%rax), %rdx	 ; DOT_SYMBOL, DOT_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:695:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	 ; tmp352
	je	.L163	 ;,
 ; D:\TC\src\parser.c:696:             token = get_next_token(lexer, true);  // consume '.'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:697:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp353, token
 ; D:\TC\src\parser.c:698:             if (var_scope == NULL) {
	testq	%r13, %r13	 ; var_scope
	je	.L177	 ;,
 ; D:\TC\src\parser.c:702:             if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_193->type
	jne	.L178	 ;,
 ; D:\TC\src\parser.c:706:             base_name = search_name(var_scope, token->lexeme);
	movq	(%rax), %rdx	 ; token_193->lexeme, token_193->lexeme
	movq	%r13, %rcx	 ; var_scope,
	call	search_name	 ;
	movq	%rax, %rbp	 ; tmp356, base_name
 ; D:\TC\src\parser.c:707:             if (base_name == NULL) {
	testq	%rax, %rax	 ; base_name
	je	.L179	 ;,
 ; D:\TC\src\parser.c:711:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	64(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	movq	%rax, %r8	 ; base_name,
	movl	$2, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
 ; D:\TC\src\parser.c:713:             var_scope = NULL;
	xorl	%r13d, %r13d	 ; var_scope
 ; D:\TC\src\parser.c:712:             current_type = NULL;
	xorl	%r12d, %r12d	 ; current_type
 ; D:\TC\src\parser.c:711:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	call	create_variable_access	 ;
	movq	%rax, 64(%rsp)	 ; tmp358, %sfp
	jmp	.L97	 ;
	.p2align 4,,10
	.p2align 3
.L175:
 ; D:\TC\src\parser.c:653:             token = get_next_token(lexer, true);  // consume '('
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp328, token
 ; D:\TC\src\parser.c:654:             if (base_name == NULL)
	testq	%rbp, %rbp	 ; base_name
	je	.L180	 ;,
 ; D:\TC\src\parser.c:656:             else if (base_name->kind == SYMBOL_CLASS) {
	movl	32(%rbp), %eax	 ; base_name_201->kind, _134
 ; D:\TC\src\parser.c:656:             else if (base_name->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	 ; _134
	je	.L181	 ;,
.L88:
 ; D:\TC\src\parser.c:660:             if (base_name != NULL && base_name->kind != SYMBOL_SUBROUTINE)
	cmpl	$1, %eax	 ;, _134
	jne	.L182	 ;,
.L87:
 ; D:\TC\src\parser.c:662:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp333, token
 ; D:\TC\src\parser.c:663:             list(Expression*) args = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:664:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rdi	 ;, tmp293
 ; D:\TC\src\parser.c:663:             list(Expression*) args = create_list();
	movq	%rax, %r12	 ; tmp334, args
	.p2align 4,,10
	.p2align 3
.L90:
 ; D:\TC\src\parser.c:664:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r15)	 ;, token_150->type
	je	.L183	 ;,
.L96:
 ; D:\TC\src\parser.c:665:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%r14, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %r13	 ; tmp335, arg
 ; D:\TC\src\parser.c:666:                 if (arg == NULL)
	testq	%rax, %rax	 ; arg
	je	.L184	 ;,
.L91:
 ; D:\TC\src\parser.c:668:                 list_append(args, (pointer)arg);
	movq	%r13, %rdx	 ; arg,
	movq	%r12, %rcx	 ; args,
	call	list_append	 ;
 ; D:\TC\src\parser.c:669:                 token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:670:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_151->type
 ; D:\TC\src\parser.c:669:                 token = get_next_token(lexer, true);
	movq	%rax, %r15	 ; tmp337, token
 ; D:\TC\src\parser.c:670:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	je	.L92	 ;,
.L95:
 ; D:\TC\src\parser.c:673:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	movq	56(%rsp), %r14	 ; %sfp, token
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:673:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC15(%rip), %rcx	 ;, tmp257
 ; D:\TC\src\parser.c:673:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp338
 ; D:\TC\src\parser.c:673:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L80:
 ; D:\TC\src\parser.c:623:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:623:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC21(%rip), %rcx	 ;, tmp288
 ; D:\TC\src\parser.c:623:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp360
 ; D:\TC\src\parser.c:623:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:596:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L54	 ;
	.p2align 4,,10
	.p2align 3
.L183:
 ; D:\TC\src\parser.c:664:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rdi), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%r15), %rcx	 ; token_150->lexeme, token_150->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:664:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp342
	je	.L96	 ;,
 ; D:\TC\src\parser.c:677:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%r12, 32(%rsp)	 ; args,
	movq	64(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:678:             base_name = base_name->type;
	movq	0(%rbp), %rbp	 ; base_name_170->type, base_name
 ; D:\TC\src\parser.c:677:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%rax, 64(%rsp)	 ; tmp343, %sfp
 ; D:\TC\src\parser.c:681:             if (base_name->kind == SYMBOL_CLASS)
	movl	32(%rbp), %eax	 ; base_name_171->kind,
	testl	%eax, %eax	 ;
	jne	.L109	 ;,
 ; D:\TC\src\parser.c:682:                 var_scope = base_name->scope;
	movq	8(%rbp), %r13	 ; base_name_171->scope, var_scope
 ; D:\TC\src\parser.c:679:             current_type = NULL;
	xorl	%r12d, %r12d	 ; current_type
	jmp	.L97	 ;
	.p2align 4,,10
	.p2align 3
.L92:
 ; D:\TC\src\parser.c:670:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp384
	movq	(%r15), %rcx	 ; token_151->lexeme, token_151->lexeme
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:670:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	testb	%al, %al	 ; tmp339
	jne	.L185	 ;,
 ; D:\TC\src\parser.c:672:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r15)	 ;, token_151->type
	jne	.L95	 ;,
 ; D:\TC\src\parser.c:672:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rdi), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%r15), %rcx	 ; token_151->lexeme, token_151->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:672:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp341
	jne	.L90	 ;,
	jmp	.L95	 ;
	.p2align 4,,10
	.p2align 3
.L184:
 ; D:\TC\src\parser.c:667:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:667:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC14(%rip), %rcx	 ;, tmp255
 ; D:\TC\src\parser.c:667:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp336
 ; D:\TC\src\parser.c:667:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L91	 ;
	.p2align 4,,10
	.p2align 3
.L185:
 ; D:\TC\src\parser.c:671:                     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp340, token
 ; D:\TC\src\parser.c:671:                     token = get_next_token(lexer, true);
	jmp	.L90	 ;
	.p2align 4,,10
	.p2align 3
.L182:
 ; D:\TC\src\parser.c:661:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:661:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC13(%rip), %rcx	 ;, tmp253
 ; D:\TC\src\parser.c:661:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp332
 ; D:\TC\src\parser.c:661:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L87	 ;
	.p2align 4,,10
	.p2align 3
.L172:
 ; D:\TC\src\parser.c:586:         str_value = token->lexeme;
	movq	(%r14), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:585:         type = PRIM_TRUE;
	movl	$3, %ebx	 ;, type
 ; D:\TC\src\parser.c:586:         str_value = token->lexeme;
	jmp	.L56	 ;
	.p2align 4,,10
	.p2align 3
.L62:
 ; D:\TC\src\parser.c:589:         str_value = token->lexeme;
	movq	(%r14), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:588:         type = PRIM_FALSE;
	movl	$4, %ebx	 ;, type
 ; D:\TC\src\parser.c:589:         str_value = token->lexeme;
	jmp	.L56	 ;
	.p2align 4,,10
	.p2align 3
.L181:
 ; D:\TC\src\parser.c:657:                 base_name = search_name(base_name->scope, CONSTRUCTOR_NAME);
	movq	.refptr.CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp250
	movq	8(%rbp), %rcx	 ; base_name_201->scope, _136
	movq	(%rax), %rdx	 ; CONSTRUCTOR_NAME, CONSTRUCTOR_NAME
	call	search_name	 ;
 ; D:\TC\src\parser.c:658:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	64(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	movq	$0, 32(%rsp)	 ;,
	movq	%rax, %r8	 ; base_name,
	movl	$2, %ecx	 ;,
 ; D:\TC\src\parser.c:657:                 base_name = search_name(base_name->scope, CONSTRUCTOR_NAME);
	movq	%rax, %rbp	 ; tmp330, base_name
 ; D:\TC\src\parser.c:658:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	call	create_variable_access	 ;
	movq	%rax, 64(%rsp)	 ; tmp331, %sfp
 ; D:\TC\src\parser.c:660:             if (base_name != NULL && base_name->kind != SYMBOL_SUBROUTINE)
	testq	%rbp, %rbp	 ; base_name
	je	.L87	 ;,
 ; D:\TC\src\parser.c:660:             if (base_name != NULL && base_name->kind != SYMBOL_SUBROUTINE)
	movl	32(%rbp), %eax	 ; base_name_137->kind, _134
	jmp	.L88	 ;
	.p2align 4,,10
	.p2align 3
.L81:
 ; D:\TC\src\parser.c:635:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:635:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC11(%rip), %rcx	 ;, tmp236
 ; D:\TC\src\parser.c:635:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp322
 ; D:\TC\src\parser.c:635:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L80	 ;
	.p2align 4,,10
	.p2align 3
.L176:
 ; D:\TC\src\parser.c:688:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:688:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC16(%rip), %rcx	 ;, tmp271
 ; D:\TC\src\parser.c:688:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp347
 ; D:\TC\src\parser.c:688:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L99	 ;
	.p2align 4,,10
	.p2align 3
.L173:
 ; D:\TC\src\parser.c:592:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:593:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:592:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp306, token
 ; D:\TC\src\parser.c:593:         expr_value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:594:         if (expr_value == NULL) {
	testq	%rax, %rax	 ; expr_value
	je	.L186	 ;,
 ; D:\TC\src\parser.c:598:         token = get_next_token(lexer, true);
	movq	%rbx, %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	movq	%rax, 56(%rsp)	 ; expr_value, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	56(%rsp), %r8	 ; %sfp, expr_value
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %ebx	 ; token_75->type, type
 ; D:\TC\src\parser.c:598:         token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp309, token
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %ebx	 ;, type
	jne	.L72	 ;,
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp221
	movq	(%rdi), %rcx	 ; token_75->lexeme, token_75->lexeme
	movq	%r8, 56(%rsp)	 ; expr_value, %sfp
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp311
	je	.L72	 ;,
	movq	56(%rsp), %r8	 ; %sfp, expr_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:571:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
	jmp	.L56	 ;
	.p2align 4,,10
	.p2align 3
.L174:
 ; D:\TC\src\parser.c:605:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:606:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:605:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp313, token
 ; D:\TC\src\parser.c:606:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp314, prim_value
 ; D:\TC\src\parser.c:607:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	je	.L187	 ;,
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:571:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:604:         type = PRIM_NOT_OPERAND;
	movl	$6, %ebx	 ;, type
	jmp	.L56	 ;
	.p2align 4,,10
	.p2align 3
.L75:
 ; D:\TC\src\parser.c:613:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:614:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:613:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp317, token
 ; D:\TC\src\parser.c:614:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp318, prim_value
 ; D:\TC\src\parser.c:615:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	je	.L188	 ;,
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:571:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:612:         type = PRIM_NEG_OPERAND;
	movl	$7, %ebx	 ;, type
	jmp	.L56	 ;
	.p2align 4,,10
	.p2align 3
.L180:
 ; D:\TC\src\parser.c:655:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:655:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC12(%rip), %rcx	 ;, tmp249
 ; D:\TC\src\parser.c:655:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp329
 ; D:\TC\src\parser.c:655:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L87	 ;
.L72:
 ; D:\TC\src\parser.c:600:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:600:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC8(%rip), %rcx	 ;, tmp220
 ; D:\TC\src\parser.c:600:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp310
 ; D:\TC\src\parser.c:600:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:596:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L54	 ;
.L109:
 ; D:\TC\src\parser.c:680:             var_scope = NULL;
	xorl	%r13d, %r13d	 ; var_scope
 ; D:\TC\src\parser.c:679:             current_type = NULL;
	xorl	%r12d, %r12d	 ; current_type
	jmp	.L97	 ;
.L101:
 ; D:\TC\src\parser.c:691:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	movq	56(%rsp), %r14	 ; %sfp, token
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:691:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC17(%rip), %rcx	 ;, tmp273
 ; D:\TC\src\parser.c:691:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp349
 ; D:\TC\src\parser.c:691:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L80	 ;
.L178:
 ; D:\TC\src\parser.c:703:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	movq	56(%rsp), %r14	 ; %sfp, token
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:703:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC19(%rip), %rcx	 ;, tmp283
 ; D:\TC\src\parser.c:703:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp355
 ; D:\TC\src\parser.c:703:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L80	 ;
.L177:
 ; D:\TC\src\parser.c:699:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	movq	56(%rsp), %r14	 ; %sfp, token
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:699:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC18(%rip), %rcx	 ;, tmp281
 ; D:\TC\src\parser.c:699:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp354
 ; D:\TC\src\parser.c:699:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L80	 ;
.L179:
 ; D:\TC\src\parser.c:708:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	movq	56(%rsp), %r14	 ; %sfp, token
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:708:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC20(%rip), %rcx	 ;, tmp286
 ; D:\TC\src\parser.c:708:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp357
 ; D:\TC\src\parser.c:708:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L80	 ;
.L186:
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC7(%rip), %rcx	 ;, tmp218
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp308
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:596:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L54	 ;
.L188:
 ; D:\TC\src\parser.c:616:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:616:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC10(%rip), %rcx	 ;, tmp231
 ; D:\TC\src\parser.c:616:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp319
 ; D:\TC\src\parser.c:616:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:596:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L54	 ;
.L187:
 ; D:\TC\src\parser.c:608:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:608:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC9(%rip), %rcx	 ;, tmp227
 ; D:\TC\src\parser.c:608:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp315
 ; D:\TC\src\parser.c:608:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:596:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L54	 ;
	.section .rdata,"dr"
.LC23:
	.ascii "Expected '(' after 'if'\0"
.LC24:
	.ascii "Failed to parse if condition\0"
	.align 8
.LC25:
	.ascii "Expected ')' after if condition\0"
.LC26:
	.ascii "Expected '{' to start if body\0"
	.align 8
.LC27:
	.ascii "Failed to parse if body statement\0"
.LC28:
	.ascii "Expected '(' after 'elif'\0"
	.align 8
.LC29:
	.ascii "Failed to parse else-if condition\0"
	.align 8
.LC30:
	.ascii "Expected ')' after else-if condition\0"
	.align 8
.LC31:
	.ascii "Expected '{' to start else-if body\0"
	.align 8
.LC32:
	.ascii "Failed to parse else-if body statement\0"
	.align 8
.LC33:
	.ascii "Expected '{' to start else body\0"
	.align 8
.LC34:
	.ascii "Failed to parse else body statement\0"
.LC35:
	.ascii "Expected '(' after 'for'\0"
	.align 8
.LC36:
	.ascii "Failed to parse for loop initializer\0"
	.align 8
.LC37:
	.ascii "Expected ';' after for loop initializer\0"
	.align 8
.LC38:
	.ascii "Failed to parse for loop condition\0"
	.align 8
.LC39:
	.ascii "Expected ';' after for loop condition\0"
	.align 8
.LC40:
	.ascii "Failed to parse for loop increment\0"
	.align 8
.LC41:
	.ascii "Expected ')' after for loop increment\0"
	.align 8
.LC42:
	.ascii "Expected '{' to start for loop body\0"
	.align 8
.LC43:
	.ascii "Failed to parse for loop body statement\0"
.LC44:
	.ascii "Expected '(' after 'while'\0"
	.align 8
.LC45:
	.ascii "Failed to parse while condition\0"
	.align 8
.LC46:
	.ascii "Expected ')' after while condition\0"
	.align 8
.LC47:
	.ascii "Expected '{' to start while body\0"
	.align 8
.LC48:
	.ascii "Failed to parse while body statement\0"
	.align 8
.LC49:
	.ascii "Cannot use 'break' outside of a loop\0"
	.align 8
.LC50:
	.ascii "Cannot use 'continue' outside of a loop\0"
.LC51:
	.ascii "Failed to parse statement\0"
.LC52:
	.ascii "Expected ';' after statement\0"
	.text
	.p2align 4
	.def	parse_statement;	.scl	3;	.type	32;	.endef
parse_statement:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp505, now_scope
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp506, parser
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp504, lexer
	subq	$104, %rsp	 ;,
 ; D:\TC\src\parser.c:305:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:307:     if (token->type == KEYWORD) {
	cmpl	$6, 24(%rax)	 ;, token_60->type
	je	.L361	 ;,
.L190:
 ; D:\TC\src\parser.c:337:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:337:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	$0, 40(%rsp)	 ;,
	xorl	%ecx, %ecx	 ;
	movq	%rax, 32(%rsp)	 ; tmp636,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp637, <retval>
.L268:
 ; D:\TC\src\parser.c:338:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %rdi	 ; tmp638, token
 ; D:\TC\src\parser.c:339:     if (statement == NULL)
	testq	%rbp, %rbp	 ; <retval>
	je	.L362	 ;,
.L276:
 ; D:\TC\src\parser.c:341:     token = get_next_token(lexer, true);
	movq	%rbx, %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:342:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_110->type
 ; D:\TC\src\parser.c:341:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp640, token
 ; D:\TC\src\parser.c:342:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	je	.L277	 ;,
.L279:
 ; D:\TC\src\parser.c:343:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:343:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC52(%rip), %rcx	 ;, tmp485
 ; D:\TC\src\parser.c:343:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp641
 ; D:\TC\src\parser.c:343:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L189:
 ; D:\TC\src\parser.c:345: }
	addq	$104, %rsp	 ;,
	movq	%rbp, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L277:
 ; D:\TC\src\parser.c:342:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp486
	movq	(%rbx), %rcx	 ; token_110->lexeme, token_110->lexeme
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:342:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp642
	je	.L279	 ;,
	jmp	.L189	 ;
	.p2align 4,,10
	.p2align 3
.L361:
	movq	%rax, %rbp	 ; tmp507, token
 ; D:\TC\src\parser.c:308:         if (string_equal(token->lexeme, IF_KEYWORD))
	movq	.refptr.IF_KEYWORD(%rip), %rax	 ;, tmp332
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; IF_KEYWORD, IF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:308:         if (string_equal(token->lexeme, IF_KEYWORD))
	testb	%al, %al	 ; tmp508
	jne	.L363	 ;,
 ; D:\TC\src\parser.c:310:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	movq	.refptr.FOR_KEYWORD(%rip), %rax	 ;, tmp391
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; FOR_KEYWORD, FOR_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:310:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	testb	%al, %al	 ; tmp562
	jne	.L364	 ;,
 ; D:\TC\src\parser.c:312:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	movq	.refptr.WHILE_KEYWORD(%rip), %rax	 ;, tmp439
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; WHILE_KEYWORD, WHILE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:312:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	testb	%al, %al	 ; tmp598
	jne	.L365	 ;,
 ; D:\TC\src\parser.c:314:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp464
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:314:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; tmp619
	jne	.L366	 ;,
 ; D:\TC\src\parser.c:317:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	movq	.refptr.RETURN_KEYWORD(%rip), %rax	 ;, tmp467
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; RETURN_KEYWORD, RETURN_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:317:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	 ; tmp622
	je	.L269	 ;,
 ; D:\TC\src\parser.c:318:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:319:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_85->type
	je	.L367	 ;,
.L270:
 ; D:\TC\src\parser.c:321:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:321:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	$0, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	movq	%rax, 32(%rsp)	 ; tmp626,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp627, <retval>
	jmp	.L268	 ;
	.p2align 4,,10
	.p2align 3
.L364:
 ; D:\TC\src\parser.c:433:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:434:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_223->type
 ; D:\TC\src\parser.c:433:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp563, token
 ; D:\TC\src\parser.c:434:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L226	 ;,
 ; D:\TC\src\parser.c:434:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp396
	movq	0(%rbp), %rcx	 ; token_223->lexeme, token_223->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:434:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp565
	je	.L226	 ;,
 ; D:\TC\src\parser.c:438:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_230->type
 ; D:\TC\src\parser.c:438:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp566, token
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	je	.L227	 ;,
.L230:
 ; D:\TC\src\parser.c:441:         initializer = parse_variable(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
	movq	%rax, %r12	 ; tmp567, initializer
 ; D:\TC\src\parser.c:442:         if (initializer == NULL)
	testq	%rax, %rax	 ; initializer
	je	.L368	 ;,
.L229:
 ; D:\TC\src\parser.c:444:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp570, token
.L231:
 ; D:\TC\src\parser.c:446:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_239->type
	jne	.L234	 ;,
 ; D:\TC\src\parser.c:446:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r14	 ;, tmp493
	movq	0(%rbp), %rcx	 ; token_239->lexeme, token_239->lexeme
	movq	(%r14), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:446:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp572
	je	.L234	 ;,
 ; D:\TC\src\parser.c:450:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_246->type
 ; D:\TC\src\parser.c:450:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp573, token
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	je	.L235	 ;,
.L238:
 ; D:\TC\src\parser.c:453:         condition = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %r13	 ; tmp574, condition
 ; D:\TC\src\parser.c:454:         if (condition == NULL)
	testq	%rax, %rax	 ; condition
	je	.L369	 ;,
.L237:
 ; D:\TC\src\parser.c:456:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp577, token
.L239:
 ; D:\TC\src\parser.c:458:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_255->type
	jne	.L241	 ;,
 ; D:\TC\src\parser.c:458:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r14), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	0(%rbp), %rcx	 ; token_255->lexeme, token_255->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:458:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp579
	je	.L241	 ;,
 ; D:\TC\src\parser.c:462:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:464:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_262->type
 ; D:\TC\src\parser.c:462:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp580, token
 ; D:\TC\src\parser.c:464:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L242	 ;,
.L245:
 ; D:\TC\src\parser.c:465:         increment = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, 56(%rsp)	 ; increment, %sfp
 ; D:\TC\src\parser.c:466:         if (increment == NULL)
	testq	%rax, %rax	 ; increment
	je	.L370	 ;,
.L244:
 ; D:\TC\src\parser.c:468:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp584, token
.L246:
 ; D:\TC\src\parser.c:470:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_271->type
	jne	.L248	 ;,
 ; D:\TC\src\parser.c:470:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp426
	movq	0(%rbp), %rcx	 ; token_271->lexeme, token_271->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:470:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp586
	je	.L248	 ;,
 ; D:\TC\src\parser.c:474:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:475:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_278->type
 ; D:\TC\src\parser.c:474:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp587, token
 ; D:\TC\src\parser.c:475:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L250	 ;,
 ; D:\TC\src\parser.c:475:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp431
	movq	0(%rbp), %rcx	 ; token_278->lexeme, token_278->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:475:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp589
	je	.L250	 ;,
 ; D:\TC\src\parser.c:479:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:480:     parser->in_loop = true;
	movb	$1, 10(%rsi)	 ;, parser_62(D)->in_loop
 ; D:\TC\src\parser.c:481:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:479:     list(Statement*) body = create_list();
	movq	%rax, %r15	 ; tmp590, body
 ; D:\TC\src\parser.c:481:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%r12, 64(%rsp)	 ; initializer, %sfp
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14	 ;, tmp491
	movq	%rax, %rbp	 ; tmp591, token
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L251	 ;
	.p2align 4,,10
	.p2align 3
.L252:
 ; D:\TC\src\parser.c:486:         list_append(body, (pointer)statement);
	movq	%r12, %rdx	 ; statement,
	movq	%r15, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:487:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp594, token
.L251:
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_290->type
	jne	.L253	 ;,
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_290->lexeme, token_290->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp595
	jne	.L371	 ;,
.L253:
 ; D:\TC\src\parser.c:483:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp592, statement
 ; D:\TC\src\parser.c:484:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L252	 ;,
 ; D:\TC\src\parser.c:485:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:485:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC43(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:485:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp593
 ; D:\TC\src\parser.c:485:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L252	 ;
	.p2align 4,,10
	.p2align 3
.L362:
 ; D:\TC\src\parser.c:340:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:340:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC51(%rip), %rcx	 ;, tmp483
 ; D:\TC\src\parser.c:340:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp639
 ; D:\TC\src\parser.c:340:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L276	 ;
	.p2align 4,,10
	.p2align 3
.L363:
 ; D:\TC\src\parser.c:348:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:349:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_114->type
 ; D:\TC\src\parser.c:348:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp509, token
 ; D:\TC\src\parser.c:349:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L194	 ;,
 ; D:\TC\src\parser.c:349:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r12	 ;, tmp494
	movq	(%rax), %rcx	 ; token_114->lexeme, token_114->lexeme
	movq	(%r12), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:349:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp511
	je	.L194	 ;,
 ; D:\TC\src\parser.c:353:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:354:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:353:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp512, token
 ; D:\TC\src\parser.c:354:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, 72(%rsp)	 ; condition, %sfp
 ; D:\TC\src\parser.c:355:     if (condition == NULL)
	testq	%rax, %rax	 ; condition
	je	.L372	 ;,
.L195:
 ; D:\TC\src\parser.c:357:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:358:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_125->type
 ; D:\TC\src\parser.c:357:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp515, token
 ; D:\TC\src\parser.c:358:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jne	.L197	 ;,
 ; D:\TC\src\parser.c:358:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp688
	movq	0(%rbp), %rcx	 ; token_125->lexeme, token_125->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:358:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp517
	je	.L197	 ;,
 ; D:\TC\src\parser.c:362:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:363:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_132->type
 ; D:\TC\src\parser.c:362:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp518, token
 ; D:\TC\src\parser.c:363:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L199	 ;,
 ; D:\TC\src\parser.c:363:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp689
	movq	0(%rbp), %rcx	 ; token_132->lexeme, token_132->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:363:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp520
	je	.L199	 ;,
 ; D:\TC\src\parser.c:367:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:368:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:367:     list(Statement*) body = create_list();
	movq	%rax, %r15	 ; tmp521, body
 ; D:\TC\src\parser.c:368:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14	 ;, tmp491
	movq	%rax, %rbp	 ; tmp522, token
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L200	 ;
	.p2align 4,,10
	.p2align 3
.L201:
 ; D:\TC\src\parser.c:373:         list_append(body, (pointer)statement);
	movq	%r13, %rdx	 ; statement,
	movq	%r15, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:374:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp525, token
.L200:
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_144->type
	jne	.L202	 ;,
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_144->lexeme, token_144->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp526
	jne	.L373	 ;,
.L202:
 ; D:\TC\src\parser.c:370:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r13	 ; tmp523, statement
 ; D:\TC\src\parser.c:371:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L201	 ;,
 ; D:\TC\src\parser.c:372:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:372:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC27(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:372:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp524
 ; D:\TC\src\parser.c:372:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L201	 ;
	.p2align 4,,10
	.p2align 3
.L194:
 ; D:\TC\src\parser.c:350:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:350:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC23(%rip), %rcx	 ;, tmp336
 ; D:\TC\src\parser.c:350:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp510
 ; D:\TC\src\parser.c:350:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L193:
 ; D:\TC\src\parser.c:351:         return NULL;
	xorl	%edx, %edx	 ; _221
.L204:
 ; D:\TC\src\parser.c:309:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$2, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp561, <retval>
 ; D:\TC\src\parser.c:309:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	jmp	.L189	 ;
	.p2align 4,,10
	.p2align 3
.L365:
 ; D:\TC\src\parser.c:494:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:495:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_301->type
 ; D:\TC\src\parser.c:494:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp599, token
 ; D:\TC\src\parser.c:495:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L257	 ;,
 ; D:\TC\src\parser.c:495:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp444
	movq	0(%rbp), %rcx	 ; token_301->lexeme, token_301->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:495:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp601
	je	.L257	 ;,
 ; D:\TC\src\parser.c:499:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:500:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:499:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp602, token
 ; D:\TC\src\parser.c:500:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %r13	 ; tmp603, condition
 ; D:\TC\src\parser.c:501:     if (condition == NULL)
	testq	%rax, %rax	 ; condition
	je	.L374	 ;,
.L258:
 ; D:\TC\src\parser.c:503:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:504:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_312->type
 ; D:\TC\src\parser.c:503:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp605, token
 ; D:\TC\src\parser.c:504:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jne	.L261	 ;,
 ; D:\TC\src\parser.c:504:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp451
	movq	0(%rbp), %rcx	 ; token_312->lexeme, token_312->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:504:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp607
	je	.L261	 ;,
 ; D:\TC\src\parser.c:508:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:509:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_319->type
 ; D:\TC\src\parser.c:508:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp608, token
 ; D:\TC\src\parser.c:509:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L263	 ;,
 ; D:\TC\src\parser.c:509:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp456
	movq	0(%rbp), %rcx	 ; token_319->lexeme, token_319->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:509:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp610
	je	.L263	 ;,
 ; D:\TC\src\parser.c:513:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:514:     parser->in_loop = true;
	movb	$1, 10(%rsi)	 ;, parser_62(D)->in_loop
 ; D:\TC\src\parser.c:515:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:513:     list(Statement*) body = create_list();
	movq	%rax, %r12	 ; tmp611, body
 ; D:\TC\src\parser.c:515:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14	 ;, tmp491
	movq	%rax, %rbp	 ; tmp612, token
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L264	 ;
	.p2align 4,,10
	.p2align 3
.L265:
 ; D:\TC\src\parser.c:520:         list_append(body, (pointer)statement);
	movq	%r15, %rdx	 ; statement,
	movq	%r12, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:521:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp615, token
.L264:
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_331->type
	jne	.L266	 ;,
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_331->lexeme, token_331->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp616
	jne	.L375	 ;,
.L266:
 ; D:\TC\src\parser.c:517:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r15	 ; tmp613, statement
 ; D:\TC\src\parser.c:518:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L265	 ;,
 ; D:\TC\src\parser.c:519:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:519:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC48(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:519:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp614
 ; D:\TC\src\parser.c:519:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L265	 ;
	.p2align 4,,10
	.p2align 3
.L366:
 ; D:\TC\src\parser.c:315:             get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:316:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:316:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 40(%rsp)	 ; tmp620,
	movl	$1, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp621, <retval>
	jmp	.L268	 ;
	.p2align 4,,10
	.p2align 3
.L197:
 ; D:\TC\src\parser.c:359:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:359:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC25(%rip), %rcx	 ;, tmp343
 ; D:\TC\src\parser.c:359:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp516
 ; D:\TC\src\parser.c:359:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:360:         return NULL;
	jmp	.L193	 ;
	.p2align 4,,10
	.p2align 3
.L226:
 ; D:\TC\src\parser.c:435:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:435:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC35(%rip), %rcx	 ;, tmp395
 ; D:\TC\src\parser.c:435:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp564
 ; D:\TC\src\parser.c:435:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L225:
 ; D:\TC\src\parser.c:436:         return NULL;
	xorl	%r9d, %r9d	 ; _299
.L233:
 ; D:\TC\src\parser.c:311:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$4, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp597, <retval>
 ; D:\TC\src\parser.c:311:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L189	 ;
	.p2align 4,,10
	.p2align 3
.L257:
 ; D:\TC\src\parser.c:496:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:496:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC44(%rip), %rcx	 ;, tmp443
 ; D:\TC\src\parser.c:496:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp600
 ; D:\TC\src\parser.c:496:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L256:
 ; D:\TC\src\parser.c:497:         return NULL;
	xorl	%r8d, %r8d	 ; _337
.L260:
 ; D:\TC\src\parser.c:313:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$3, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp618, <retval>
 ; D:\TC\src\parser.c:313:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	jmp	.L189	 ;
.L372:
 ; D:\TC\src\parser.c:356:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:356:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC24(%rip), %rcx	 ;, tmp341
 ; D:\TC\src\parser.c:356:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp514
 ; D:\TC\src\parser.c:356:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L195	 ;
	.p2align 4,,10
	.p2align 3
.L269:
 ; D:\TC\src\parser.c:322:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	movq	.refptr.BREAK_KEYWORD(%rip), %rax	 ;, tmp473
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; BREAK_KEYWORD, BREAK_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:322:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	 ; tmp628
	je	.L271	 ;,
 ; D:\TC\src\parser.c:323:             if (!parser->in_loop) {
	cmpb	$0, 10(%rsi)	 ;, parser_62(D)->in_loop
	je	.L376	 ;,
 ; D:\TC\src\parser.c:327:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$6, %ecx	 ;,
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp630, <retval>
	jmp	.L268	 ;
	.p2align 4,,10
	.p2align 3
.L234:
 ; D:\TC\src\parser.c:447:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:447:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC37(%rip), %rcx	 ;, tmp405
 ; D:\TC\src\parser.c:447:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp571
 ; D:\TC\src\parser.c:447:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:448:         return NULL;
	jmp	.L225	 ;
.L199:
 ; D:\TC\src\parser.c:364:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:364:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC26(%rip), %rcx	 ;, tmp348
 ; D:\TC\src\parser.c:364:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp519
 ; D:\TC\src\parser.c:364:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:365:         return NULL;
	jmp	.L193	 ;
.L373:
 ; D:\TC\src\parser.c:376:     list(ElseIf*) else_if = create_list();
	call	create_list	 ;
	movq	%rax, 64(%rsp)	 ; tmp527, %sfp
 ; D:\TC\src\parser.c:377:     list(Statement*) else_body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:378:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:377:     list(Statement*) else_body = create_list();
	movq	%rax, 80(%rsp)	 ; tmp528, %sfp
 ; D:\TC\src\parser.c:378:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_152->type
 ; D:\TC\src\parser.c:378:     token = peek_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp529, token
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	jne	.L215	 ;,
	movq	%r15, 88(%rsp)	 ; body, %sfp
	.p2align 4,,10
	.p2align 3
.L203:
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	movq	.refptr.ELIF_KEYWORD(%rip), %rax	 ;, tmp692
	movq	0(%rbp), %rcx	 ; token_54->lexeme, token_54->lexeme
	movq	(%rax), %rdx	 ; ELIF_KEYWORD, ELIF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	 ; tmp551
	je	.L377	 ;,
 ; D:\TC\src\parser.c:380:         token = get_next_token(lexer, true);  // consume 'elif'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:381:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:382:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_153->type
 ; D:\TC\src\parser.c:381:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp531, token
 ; D:\TC\src\parser.c:382:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L206	 ;,
 ; D:\TC\src\parser.c:382:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	(%r12), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rax), %rcx	 ; token_153->lexeme, token_153->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:382:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp533
	je	.L206	 ;,
 ; D:\TC\src\parser.c:386:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:387:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:386:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp534, token
 ; D:\TC\src\parser.c:387:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %r15	 ; tmp535, elif_condition
 ; D:\TC\src\parser.c:388:         if (elif_condition == NULL)
	testq	%rax, %rax	 ; elif_condition
	je	.L378	 ;,
.L207:
 ; D:\TC\src\parser.c:390:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:391:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_165->type
 ; D:\TC\src\parser.c:390:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp537, token
 ; D:\TC\src\parser.c:391:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jne	.L209	 ;,
 ; D:\TC\src\parser.c:391:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp690
	movq	0(%rbp), %rcx	 ; token_165->lexeme, token_165->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:391:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp539
	je	.L209	 ;,
 ; D:\TC\src\parser.c:395:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:396:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_173->type
 ; D:\TC\src\parser.c:395:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp540, token
 ; D:\TC\src\parser.c:396:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L211	 ;,
 ; D:\TC\src\parser.c:396:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp691
	movq	0(%rbp), %rcx	 ; token_173->lexeme, token_173->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:396:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp542
	je	.L211	 ;,
 ; D:\TC\src\parser.c:400:         list(Statement*) elif_body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:401:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:400:         list(Statement*) elif_body = create_list();
	movq	%rax, %r13	 ; tmp543, elif_body
 ; D:\TC\src\parser.c:401:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%r15, 56(%rsp)	 ; elif_condition, %sfp
	movq	%rax, %rbp	 ; tmp544, token
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L212	 ;
	.p2align 4,,10
	.p2align 3
.L213:
 ; D:\TC\src\parser.c:406:             list_append(elif_body, (pointer)statement);
	movq	%r15, %rdx	 ; statement,
	movq	%r13, %rcx	 ; elif_body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:407:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp547, token
.L212:
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_186->type
	jne	.L214	 ;,
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_186->lexeme, token_186->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp548
	jne	.L379	 ;,
.L214:
 ; D:\TC\src\parser.c:403:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r15	 ; tmp545, statement
 ; D:\TC\src\parser.c:404:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L213	 ;,
 ; D:\TC\src\parser.c:405:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:405:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC32(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:405:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp546
 ; D:\TC\src\parser.c:405:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L213	 ;
	.p2align 4,,10
	.p2align 3
.L379:
 ; D:\TC\src\parser.c:409:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	56(%rsp), %r15	 ; %sfp, elif_condition
	movq	%r13, %rdx	 ; elif_body,
	movq	%r15, %rcx	 ; elif_condition,
	call	create_else_if	 ;
 ; D:\TC\src\parser.c:409:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	64(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:409:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%rax, %rdx	 ; tmp549, _192
 ; D:\TC\src\parser.c:409:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	call	list_append	 ;
 ; D:\TC\src\parser.c:410:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_193->type
 ; D:\TC\src\parser.c:410:         token = peek_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp550, token
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	je	.L203	 ;,
	movq	88(%rsp), %r15	 ; %sfp, body
.L215:
 ; D:\TC\src\parser.c:428:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:429:     return create_if(condition, body, else_if, else_body);
	movq	80(%rsp), %r9	 ; %sfp,
	movq	64(%rsp), %r8	 ; %sfp,
	movq	%r15, %rdx	 ; body,
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_if	 ;
	movq	%rax, %rdx	 ; tmp530, _221
	jmp	.L204	 ;
	.p2align 4,,10
	.p2align 3
.L378:
 ; D:\TC\src\parser.c:389:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:389:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC29(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:389:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp536
 ; D:\TC\src\parser.c:389:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L207	 ;
.L227:
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp399
	movq	0(%rbp), %rcx	 ; token_230->lexeme, token_230->lexeme
 ; D:\TC\src\parser.c:439:     Variable* initializer = NULL;
	xorl	%r12d, %r12d	 ; initializer
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp568
	jne	.L231	 ;,
	jmp	.L230	 ;
.L261:
 ; D:\TC\src\parser.c:505:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:505:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC46(%rip), %rcx	 ;, tmp450
 ; D:\TC\src\parser.c:505:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp606
 ; D:\TC\src\parser.c:505:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:506:         return NULL;
	jmp	.L256	 ;
.L241:
 ; D:\TC\src\parser.c:459:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:459:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC39(%rip), %rcx	 ;, tmp415
 ; D:\TC\src\parser.c:459:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp578
 ; D:\TC\src\parser.c:459:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:460:         return NULL;
	jmp	.L225	 ;
.L367:
 ; D:\TC\src\parser.c:319:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rdx	 ;, tmp470
	movq	(%rax), %rcx	 ; token_85->lexeme, token_85->lexeme
	movq	(%rdx), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:319:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp624
	je	.L270	 ;,
 ; D:\TC\src\parser.c:320:                 return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$5, %ecx	 ;,
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp625, <retval>
	jmp	.L189	 ;
.L271:
 ; D:\TC\src\parser.c:328:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax	 ;, tmp478
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; CONTINUE_KEYWORD, CONTINUE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:328:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	 ; tmp631
	je	.L190	 ;,
 ; D:\TC\src\parser.c:329:             if (!parser->in_loop) {
	cmpb	$0, 10(%rsi)	 ;, parser_62(D)->in_loop
	je	.L380	 ;,
 ; D:\TC\src\parser.c:333:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$7, %ecx	 ;,
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp633, <retval>
	jmp	.L268	 ;
.L235:
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r14), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rax), %rcx	 ; token_246->lexeme, token_246->lexeme
 ; D:\TC\src\parser.c:451:     Expression* condition = NULL;
	xorl	%r13d, %r13d	 ; condition
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	call	string_equal	 ;
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp575
	jne	.L239	 ;,
	jmp	.L238	 ;
.L263:
 ; D:\TC\src\parser.c:510:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:510:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC47(%rip), %rcx	 ;, tmp455
 ; D:\TC\src\parser.c:510:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp609
 ; D:\TC\src\parser.c:510:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:511:         return NULL;
	jmp	.L256	 ;
.L375:
 ; D:\TC\src\parser.c:523:     parser->in_loop = false;
	movb	$0, 10(%rsi)	 ;, parser_62(D)->in_loop
 ; D:\TC\src\parser.c:524:     return create_while(condition, body);
	movq	%r12, %rdx	 ; body,
	movq	%r13, %rcx	 ; condition,
	call	create_while	 ;
	movq	%rax, %r8	 ; tmp617, _337
	jmp	.L260	 ;
.L368:
 ; D:\TC\src\parser.c:443:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:443:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC36(%rip), %rcx	 ;, tmp403
 ; D:\TC\src\parser.c:443:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp569
 ; D:\TC\src\parser.c:443:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L229	 ;
.L248:
 ; D:\TC\src\parser.c:471:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:471:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC41(%rip), %rcx	 ;, tmp425
 ; D:\TC\src\parser.c:471:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp585
 ; D:\TC\src\parser.c:471:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:472:         return NULL;
	jmp	.L225	 ;
.L374:
 ; D:\TC\src\parser.c:502:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:502:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC45(%rip), %rcx	 ;, tmp448
 ; D:\TC\src\parser.c:502:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp604
 ; D:\TC\src\parser.c:502:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L258	 ;
.L206:
 ; D:\TC\src\parser.c:383:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:383:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC28(%rip), %rcx	 ;, tmp358
 ; D:\TC\src\parser.c:383:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp532
 ; D:\TC\src\parser.c:383:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:384:             return NULL;
	jmp	.L193	 ;
.L209:
 ; D:\TC\src\parser.c:392:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:392:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC30(%rip), %rcx	 ;, tmp365
 ; D:\TC\src\parser.c:392:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp538
 ; D:\TC\src\parser.c:392:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:393:             return NULL;
	jmp	.L193	 ;
.L211:
 ; D:\TC\src\parser.c:397:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:397:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC31(%rip), %rcx	 ;, tmp370
 ; D:\TC\src\parser.c:397:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp541
 ; D:\TC\src\parser.c:397:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:398:             return NULL;
	jmp	.L193	 ;
.L242:
 ; D:\TC\src\parser.c:464:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp419
	movq	0(%rbp), %rcx	 ; token_262->lexeme, token_262->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:464:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp582
	je	.L245	 ;,
 ; D:\TC\src\parser.c:463:     Expression* increment = NULL;
	movq	$0, 56(%rsp)	 ;, %sfp
	jmp	.L246	 ;
.L376:
 ; D:\TC\src\parser.c:324:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:324:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC49(%rip), %rcx	 ;, tmp477
 ; D:\TC\src\parser.c:325:                 return NULL;
	xorl	%ebp, %ebp	 ; <retval>
 ; D:\TC\src\parser.c:324:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp629
 ; D:\TC\src\parser.c:324:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L189	 ;
.L369:
 ; D:\TC\src\parser.c:455:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:455:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC38(%rip), %rcx	 ;, tmp413
 ; D:\TC\src\parser.c:455:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp576
 ; D:\TC\src\parser.c:455:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L237	 ;
.L250:
 ; D:\TC\src\parser.c:476:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:476:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC42(%rip), %rcx	 ;, tmp430
 ; D:\TC\src\parser.c:476:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp588
 ; D:\TC\src\parser.c:476:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:477:         return NULL;
	jmp	.L225	 ;
.L371:
 ; D:\TC\src\parser.c:489:     parser->in_loop = false;
	movq	64(%rsp), %r12	 ; %sfp, initializer
	movb	$0, 10(%rsi)	 ;, parser_62(D)->in_loop
 ; D:\TC\src\parser.c:490:     return create_for(initializer, condition, increment, body);
	movq	%r15, %r9	 ; body,
	movq	%r13, %rdx	 ; condition,
	movq	56(%rsp), %r8	 ; %sfp,
	movq	%r12, %rcx	 ; initializer,
	call	create_for	 ;
	movq	%rax, %r9	 ; tmp596, _299
	jmp	.L233	 ;
.L377:
 ; D:\TC\src\parser.c:412:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, 24(%rbp)	 ;, token_54->type
	movq	88(%rsp), %r15	 ; %sfp, body
	jne	.L215	 ;,
 ; D:\TC\src\parser.c:412:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	movq	.refptr.ELSE_KEYWORD(%rip), %rax	 ;, tmp382
	movq	0(%rbp), %rcx	 ; token_54->lexeme, token_54->lexeme
	movq	(%rax), %rdx	 ; ELSE_KEYWORD, ELSE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:412:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	 ; tmp552
	je	.L215	 ;,
 ; D:\TC\src\parser.c:413:         token = get_next_token(lexer, true);  // consume 'else'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:414:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:415:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_204->type
 ; D:\TC\src\parser.c:414:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp553, token
 ; D:\TC\src\parser.c:415:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L218	 ;,
 ; D:\TC\src\parser.c:415:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp693
	movq	0(%rbp), %rcx	 ; token_204->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:415:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp555
	je	.L218	 ;,
 ; D:\TC\src\parser.c:419:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:423:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	leaq	.LC34(%rip), %r13	 ;, tmp496
 ; D:\TC\src\parser.c:419:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp556, token
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L219	 ;
	.p2align 4,,10
	.p2align 3
.L220:
 ; D:\TC\src\parser.c:424:             list_append(else_body, (pointer)statement);
	movq	80(%rsp), %rcx	 ; %sfp,
	movq	%r12, %rdx	 ; statement,
	call	list_append	 ;
 ; D:\TC\src\parser.c:425:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp559, token
.L219:
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_215->type
	jne	.L221	 ;,
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_215->lexeme, token_215->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp560
	jne	.L215	 ;,
.L221:
 ; D:\TC\src\parser.c:421:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp557, statement
 ; D:\TC\src\parser.c:422:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L220	 ;,
 ; D:\TC\src\parser.c:423:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:423:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	movq	%r13, %rcx	 ; tmp496,
 ; D:\TC\src\parser.c:423:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp558
 ; D:\TC\src\parser.c:423:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L220	 ;
.L370:
 ; D:\TC\src\parser.c:467:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:467:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC40(%rip), %rcx	 ;, tmp423
 ; D:\TC\src\parser.c:467:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp583
 ; D:\TC\src\parser.c:467:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L244	 ;
.L380:
 ; D:\TC\src\parser.c:330:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:330:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC50(%rip), %rcx	 ;, tmp481
 ; D:\TC\src\parser.c:325:                 return NULL;
	xorl	%ebp, %ebp	 ; <retval>
 ; D:\TC\src\parser.c:330:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp632
 ; D:\TC\src\parser.c:330:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L189	 ;
.L218:
 ; D:\TC\src\parser.c:416:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:416:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC33(%rip), %rcx	 ;, tmp385
 ; D:\TC\src\parser.c:416:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp554
 ; D:\TC\src\parser.c:416:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:417:             return NULL;
	jmp	.L193	 ;
	.section .rdata,"dr"
	.align 8
.LC53:
	.ascii "Expected identifier after 'import'\0"
	.align 8
.LC54:
	.ascii "Expected string literal after 'from'\0"
	.align 8
.LC55:
	.ascii "Expected ';' at end of import statement\0"
	.align 8
.LC56:
	.ascii "Failed to import module '%s' from source '%s'\12\0"
	.align 8
.LC57:
	.ascii "Failed to parse import statement\0"
	.align 8
.LC58:
	.ascii "Expected function return type after 'func'\0"
.LC59:
	.ascii "Unknown function return type\0"
	.align 8
.LC60:
	.ascii "Expected function name after return type\0"
	.align 8
.LC61:
	.ascii "Expected '(' after function name\0"
	.align 8
.LC62:
	.ascii "Failed to parse function parameter\0"
	.align 8
.LC63:
	.ascii "Function parameters cannot have default values\0"
	.align 8
.LC64:
	.ascii "Expected ',' or ')' after function parameter\0"
	.align 8
.LC65:
	.ascii "Expected '{' to start function body\0"
	.align 8
.LC66:
	.ascii "Failed to parse function body statement\0"
	.align 8
.LC67:
	.ascii "Unreachable code after return statement\0"
	.align 8
.LC68:
	.ascii "Function missing return statement\0"
	.align 8
.LC69:
	.ascii "Failed to parse function declaration\0"
	.align 8
.LC70:
	.ascii "Expected class name after 'class'\0"
	.align 8
.LC71:
	.ascii "Expected '{' to start class body\0"
	.align 8
.LC72:
	.ascii "Expected method return type after 'method'\0"
	.align 8
.LC73:
	.ascii "Unknown return type for method\0"
	.align 8
.LC74:
	.ascii "Expected method name after return type\0"
	.align 8
.LC75:
	.ascii "Expected '(' after method name\0"
	.align 8
.LC76:
	.ascii "Expected 'self' as first parameter of method\0"
	.align 8
.LC77:
	.ascii "Expected ',' or ')' after method parameter\0"
	.align 8
.LC78:
	.ascii "Failed to parse method parameter\0"
	.align 8
.LC79:
	.ascii "Method parameters cannot have default values\0"
	.align 8
.LC80:
	.ascii "Expected '{' to start method body\0"
	.align 8
.LC82:
	.ascii "Failed to parse method body statement\0"
	.align 8
.LC83:
	.ascii "Method missing return statement\0"
.LC84:
	.ascii "Failed to parse class method\0"
	.align 8
.LC85:
	.ascii "Failed to parse class variable\0"
	.align 8
.LC86:
	.ascii "Expected ';' after class variable declaration\0"
	.align 8
.LC87:
	.ascii "Unexpected token in class member\0"
	.align 8
.LC88:
	.ascii "Constructor name conflicts with existing member\0"
	.align 8
.LC89:
	.ascii "Failed to parse class declaration\0"
	.align 8
.LC90:
	.ascii "Unexpected token in code member\0"
	.text
	.p2align 4
	.globl	parse_code
	.def	parse_code;	.scl	2;	.type	32;	.endef
parse_code:
	pushq	%r15	 ;
	pushq	%r14	 ;
	movq	%r8, %r14	 ; tmp579, parser
	pushq	%r13	 ;
	movq	%rcx, %r13	 ; tmp577, lexer
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp578, now_scope
	subq	$152, %rsp	 ;,
 ; D:\TC\src\parser.c:21:     if (builtin_scope == NULL) {
	movq	.refptr.builtin_scope(%rip), %rsi	 ;, tmp548
 ; D:\TC\src\parser.c:21:     if (builtin_scope == NULL) {
	cmpq	$0, (%rsi)	 ;, builtin_scope
	je	.L551	 ;,
.L382:
 ; D:\TC\src\parser.c:29:     if (now_scope == NULL)
	testq	%rbx, %rbx	 ; now_scope
	je	.L552	 ;,
.L383:
 ; D:\TC\src\parser.c:32:     list(CodeMember*) members = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:33:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	%rbx, %rcx	 ; now_scope,
 ; D:\TC\src\parser.c:32:     list(CodeMember*) members = create_list();
	movq	%rax, 72(%rsp)	 ; tmp586, %sfp
 ; D:\TC\src\parser.c:33:     SymbolTable* global_scope = create_symbol_table(now_scope);
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:34:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:33:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	%rax, 64(%rsp)	 ; tmp587, %sfp
 ; D:\TC\src\parser.c:34:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %r11	 ; tmp588, token
 ; D:\TC\src\parser.c:35:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L474	 ;,
	movq	%r14, %r12	 ; parser, parser
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	.refptr.CLASS_KEYWORD(%rip), %r15	 ;, tmp576
	movq	%r13, %r14	 ; lexer, lexer
	jmp	.L384	 ;
	.p2align 4,,10
	.p2align 3
.L425:
 ; D:\TC\src\parser.c:52:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:52:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC90(%rip), %rcx	 ;, tmp546
 ; D:\TC\src\parser.c:52:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp715
 ; D:\TC\src\parser.c:52:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L396:
 ; D:\TC\src\parser.c:53:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r11	 ; tmp714, token
 ; D:\TC\src\parser.c:35:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L474	 ;,
.L384:
 ; D:\TC\src\parser.c:35:     while (token != NULL && token->type != EOF_TOKEN) {
	movl	24(%r11), %eax	 ; token_274->type, _39
 ; D:\TC\src\parser.c:35:     while (token != NULL && token->type != EOF_TOKEN) {
	testl	%eax, %eax	 ; _39
	je	.L474	 ;,
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	 ;, _39
	jne	.L425	 ;,
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax	 ;, tmp751
	movq	(%r11), %rcx	 ; token_274->lexeme, token_274->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; IMPORT_KEYWORD, IMPORT_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; have_return
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movl	%eax, %esi	 ; tmp589, have_return
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	jne	.L553	 ;,
 ; D:\TC\src\parser.c:41:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	cmpl	$6, 24(%r11)	 ;, token_274->type
	jne	.L425	 ;,
 ; D:\TC\src\parser.c:41:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	.refptr.FUNC_KEYWORD(%rip), %rax	 ;, tmp752
	movq	(%r11), %rcx	 ; token_274->lexeme, token_274->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; FUNC_KEYWORD, FUNC_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:41:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp605
	jne	.L554	 ;,
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	cmpl	$6, 24(%r11)	 ;, token_274->type
	jne	.L425	 ;,
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	(%r11), %rcx	 ; token_274->lexeme, token_274->lexeme
	movq	(%r15), %rdx	 ; CLASS_KEYWORD, CLASS_KEYWORD
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	string_equal	 ;
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp643
	je	.L425	 ;,
 ; D:\TC\src\parser.c:232:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:233:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:232:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	%rax, 80(%rsp)	 ; tmp644, %sfp
 ; D:\TC\src\parser.c:233:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:234:     if (token->type != IDENTIFIER) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$1, 24(%rax)	 ;, token_216->type
 ; D:\TC\src\parser.c:233:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp645, token
 ; D:\TC\src\parser.c:234:     if (token->type != IDENTIFIER) {
	jne	.L555	 ;,
 ; D:\TC\src\parser.c:238:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class_scope);
	movq	(%rax), %rcx	 ; token_216->lexeme, token_216->lexeme
	movq	80(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:239:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:238:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class_scope);
	movq	%rax, 96(%rsp)	 ; tmp647, %sfp
 ; D:\TC\src\parser.c:239:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:240:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$5, 24(%rax)	 ;, token_222->type
 ; D:\TC\src\parser.c:239:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp648, token
 ; D:\TC\src\parser.c:240:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L429	 ;,
 ; D:\TC\src\parser.c:240:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp756
	movq	(%rbx), %rcx	 ; token_222->lexeme, token_222->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:240:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp650
	je	.L429	 ;,
 ; D:\TC\src\parser.c:244:     list(ClassMember*) members = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:245:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:244:     list(ClassMember*) members = create_list();
	movq	%rax, 88(%rsp)	 ; tmp651, %sfp
 ; D:\TC\src\parser.c:245:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rdi	 ;, tmp549
	movq	%rax, %r10	 ; tmp652, token
	movq	%r11, 112(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L430	 ;
	.p2align 4,,10
	.p2align 3
.L469:
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	 ;, prephitmp_76
	je	.L556	 ;,
.L431:
 ; D:\TC\src\parser.c:262:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:262:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC87(%rip), %rcx	 ;, tmp533
 ; D:\TC\src\parser.c:262:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp704
 ; D:\TC\src\parser.c:262:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L465:
 ; D:\TC\src\parser.c:263:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r10	 ; tmp705, token
.L430:
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movl	24(%r10), %eax	 ; token_231->type, prephitmp_76
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, prephitmp_76
	jne	.L469	 ;,
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r10), %rcx	 ; token_231->lexeme, token_231->lexeme
	movq	(%rdi), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	string_equal	 ;
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp706
	jne	.L470	 ;,
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movl	24(%r10), %eax	 ; token_231->type, prephitmp_76
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	 ;, prephitmp_76
	jne	.L431	 ;,
.L556:
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	.refptr.METHOD_KEYWORD(%rip), %rax	 ;, tmp758
	movq	(%r10), %rcx	 ; token_231->lexeme, token_231->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; METHOD_KEYWORD, METHOD_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp653
	jne	.L557	 ;,
 ; D:\TC\src\parser.c:252:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	cmpl	$6, 24(%r10)	 ;, token_231->type
	jne	.L431	 ;,
 ; D:\TC\src\parser.c:252:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp767
	movq	(%r10), %rcx	 ; token_231->lexeme, token_231->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:252:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp696
	je	.L431	 ;,
 ; D:\TC\src\parser.c:253:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:254:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	80(%rsp), %rdx	 ; %sfp,
	movq	%r12, %r8	 ; parser,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:253:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp697, token
 ; D:\TC\src\parser.c:254:             Variable* variable = parse_variable(lexer, class_scope, parser);
	call	parse_variable	 ;
	movq	%rax, %rsi	 ; tmp698, variable
 ; D:\TC\src\parser.c:255:             if (variable == NULL)
	testq	%rax, %rax	 ; variable
	je	.L558	 ;,
.L466:
 ; D:\TC\src\parser.c:257:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	%rsi, %r8	 ; variable,
	xorl	%edx, %edx	 ;
	movl	$1, %ecx	 ;,
	call	create_class_member	 ;
 ; D:\TC\src\parser.c:257:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	88(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:257:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	%rax, %rdx	 ; tmp700, _248
 ; D:\TC\src\parser.c:257:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	call	list_append	 ;
 ; D:\TC\src\parser.c:258:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:259:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_249->type
 ; D:\TC\src\parser.c:258:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp701, token
 ; D:\TC\src\parser.c:259:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	je	.L467	 ;,
.L468:
 ; D:\TC\src\parser.c:260:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:260:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC86(%rip), %rcx	 ;, tmp528
 ; D:\TC\src\parser.c:260:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp702
 ; D:\TC\src\parser.c:260:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L465	 ;
	.p2align 4,,10
	.p2align 3
.L474:
 ; D:\TC\src\parser.c:55:     return create_code(members, global_scope);
	movq	64(%rsp), %rdx	 ; %sfp,
	movq	72(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:56: }
	addq	$152, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\parser.c:55:     return create_code(members, global_scope);
	jmp	create_code	 ;
	.p2align 4,,10
	.p2align 3
.L553:
 ; D:\TC\src\parser.c:59:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:60:     if (token->type != IDENTIFIER) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$1, 24(%rax)	 ;, token_101->type
 ; D:\TC\src\parser.c:59:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp590, token
 ; D:\TC\src\parser.c:60:     if (token->type != IDENTIFIER) {
	jne	.L559	 ;,
 ; D:\TC\src\parser.c:66:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r11, 56(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:64:     string import_name = token->lexeme;
	movq	(%rax), %rdi	 ; token_101->lexeme, import_name
 ; D:\TC\src\parser.c:66:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:65:     string source = NULL;
	xorl	%esi, %esi	 ; source
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	56(%rsp), %r11	 ; %sfp, token
 ; D:\TC\src\parser.c:66:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp592, token
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movl	24(%rax), %eax	 ; token_106->type, _107
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	cmpl	$6, %eax	 ;, _107
	je	.L560	 ;,
.L389:
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	 ;, _107
	jne	.L393	 ;,
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp394
	movq	(%rbx), %rcx	 ; token_117->lexeme, token_117->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp598
	je	.L393	 ;,
 ; D:\TC\src\parser.c:81:     name = parse_import_file(import_name, source, now_scope, parser->source_file);
	movq	(%r12), %r9	 ; parser_74(D)->source_file,
	movq	64(%rsp), %r8	 ; %sfp,
	movq	%rdi, %rcx	 ; import_name,
	movq	%rsi, %rdx	 ; source,
	call	parse_import_file	 ;
 ; D:\TC\src\parser.c:82:     if (name == NULL) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testq	%rax, %rax	 ; name
 ; D:\TC\src\parser.c:81:     name = parse_import_file(import_name, source, now_scope, parser->source_file);
	movq	%rax, %rcx	 ; tmp599, name
 ; D:\TC\src\parser.c:82:     if (name == NULL) {
	je	.L561	 ;,
.L394:
 ; D:\TC\src\parser.c:86:     return create_import(name, source);
	movq	%rsi, %rdx	 ; source,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	create_import	 ;
 ; D:\TC\src\parser.c:38:             if (import == NULL)
	movq	56(%rsp), %r11	 ; %sfp, token
	testq	%rax, %rax	 ; _132
 ; D:\TC\src\parser.c:86:     return create_import(name, source);
	movq	%rax, %rdx	 ; tmp602, _132
 ; D:\TC\src\parser.c:38:             if (import == NULL)
	je	.L388	 ;,
.L395:
 ; D:\TC\src\parser.c:40:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	xorl	%ecx, %ecx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	call	create_code_member	 ;
 ; D:\TC\src\parser.c:40:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	72(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:40:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	%rax, %rdx	 ; tmp604, _22
 ; D:\TC\src\parser.c:40:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	jmp	.L396	 ;
	.p2align 4,,10
	.p2align 3
.L554:
 ; D:\TC\src\parser.c:90:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:91:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:90:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	%rax, %rdi	 ; tmp606, function_scope
 ; D:\TC\src\parser.c:91:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	56(%rsp), %r11	 ; %sfp, token
 ; D:\TC\src\parser.c:91:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp607, token
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_135->type, _136
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _136
	je	.L398	 ;,
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _136
	jne	.L401	 ;,
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rbx), %rcx	 ; token_135->lexeme, token_135->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp609
	je	.L401	 ;,
.L398:
 ; D:\TC\src\parser.c:96:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rdx	 ; token_135->lexeme, token_135->lexeme
	movq	64(%rsp), %rcx	 ; %sfp,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	search_name	 ;
 ; D:\TC\src\parser.c:97:     if (return_type == NULL) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testq	%rax, %rax	 ; return_type
 ; D:\TC\src\parser.c:96:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	%rax, 80(%rsp)	 ; return_type, %sfp
 ; D:\TC\src\parser.c:97:     if (return_type == NULL) {
	je	.L562	 ;,
 ; D:\TC\src\parser.c:101:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:102:     if (token->type != IDENTIFIER) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$1, 24(%rax)	 ;, token_145->type
 ; D:\TC\src\parser.c:101:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp612, token
 ; D:\TC\src\parser.c:102:     if (token->type != IDENTIFIER) {
	jne	.L563	 ;,
 ; D:\TC\src\parser.c:106:     Symbol* name = create_symbol(token->lexeme, SYMBOL_SUBROUTINE, return_type, function_scope);
	movq	(%rax), %rcx	 ; token_145->lexeme, token_145->lexeme
	movq	80(%rsp), %r8	 ; %sfp,
	movq	%rdi, %r9	 ; function_scope,
	movl	$1, %edx	 ;,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:107:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:106:     Symbol* name = create_symbol(token->lexeme, SYMBOL_SUBROUTINE, return_type, function_scope);
	movq	%rax, 88(%rsp)	 ; tmp614, %sfp
 ; D:\TC\src\parser.c:107:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:108:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$5, 24(%rax)	 ;, token_151->type
 ; D:\TC\src\parser.c:107:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp615, token
 ; D:\TC\src\parser.c:108:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L405	 ;,
 ; D:\TC\src\parser.c:108:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp418
	movq	(%rbx), %rcx	 ; token_151->lexeme, token_151->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:108:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp617
	je	.L405	 ;,
 ; D:\TC\src\parser.c:112:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r11, 96(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp618, token
 ; D:\TC\src\parser.c:113:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movb	%sil, 104(%rsp)	 ; have_return, %sfp
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rbp	 ;, tmp562
 ; D:\TC\src\parser.c:113:     list(Variable*) parameters = create_list();
	movq	%rax, 56(%rsp)	 ; tmp619, %sfp
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %r13	 ;, tmp563
	movq	96(%rsp), %rsi	 ; %sfp, token
	.p2align 4,,10
	.p2align 3
.L406:
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_163->type
	je	.L564	 ;,
.L414:
 ; D:\TC\src\parser.c:115:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	%r12, %r8	 ; parser,
	movq	%rdi, %rdx	 ; function_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:116:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	je	.L565	 ;,
 ; D:\TC\src\parser.c:118:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_160->value
	je	.L409	 ;,
 ; D:\TC\src\parser.c:119:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:119:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC63(%rip), %rcx	 ;, tmp424
 ; D:\TC\src\parser.c:119:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp622
 ; D:\TC\src\parser.c:119:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L408:
 ; D:\TC\src\parser.c:122:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_167->type
 ; D:\TC\src\parser.c:122:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp623, token
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	je	.L410	 ;,
.L413:
 ; D:\TC\src\parser.c:126:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%rsi, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:126:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC64(%rip), %rcx	 ;, tmp426
 ; D:\TC\src\parser.c:126:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp624
 ; D:\TC\src\parser.c:126:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
.L400:
 ; D:\TC\src\parser.c:44:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:44:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC69(%rip), %rcx	 ;, tmp452
 ; D:\TC\src\parser.c:44:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp641
 ; D:\TC\src\parser.c:44:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%r8d, %r8d	 ; _211
.L424:
 ; D:\TC\src\parser.c:45:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	movl	$1, %ecx	 ;,
	call	create_code_member	 ;
 ; D:\TC\src\parser.c:45:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	72(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:45:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	%rax, %rdx	 ; tmp642, _29
 ; D:\TC\src\parser.c:45:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:41:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	jmp	.L396	 ;
	.p2align 4,,10
	.p2align 3
.L429:
 ; D:\TC\src\parser.c:241:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:241:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC71(%rip), %rcx	 ;, tmp460
 ; D:\TC\src\parser.c:241:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp649
 ; D:\TC\src\parser.c:241:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
.L427:
 ; D:\TC\src\parser.c:49:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:49:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC89(%rip), %rcx	 ;, tmp544
 ; D:\TC\src\parser.c:49:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp712
 ; D:\TC\src\parser.c:49:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%r9d, %r9d	 ; _273
.L473:
 ; D:\TC\src\parser.c:50:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	xorl	%edx, %edx	 ;
	xorl	%r8d, %r8d	 ;
	movl	$2, %ecx	 ;,
	call	create_code_member	 ;
 ; D:\TC\src\parser.c:50:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	72(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:50:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	%rax, %rdx	 ; tmp713, _36
 ; D:\TC\src\parser.c:50:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	call	list_append	 ;
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	jmp	.L396	 ;
	.p2align 4,,10
	.p2align 3
.L557:
 ; D:\TC\src\parser.c:157:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	80(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:158:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	96(%rsp), %r8	 ; %sfp,
	movl	$2, %edx	 ;,
 ; D:\TC\src\parser.c:157:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	%rax, %rsi	 ; tmp654, method_scope
 ; D:\TC\src\parser.c:158:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp759
	movq	%rsi, %r9	 ; method_scope,
	movq	(%rax), %rcx	 ; SELF_KEYWORD, SELF_KEYWORD
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:159:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:158:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	%rax, %r13	 ; tmp655, self
 ; D:\TC\src\parser.c:159:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	56(%rsp), %r10	 ; %sfp, token
 ; D:\TC\src\parser.c:159:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp656, token
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_278->type, _279
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _279
	je	.L433	 ;,
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _279
	jne	.L436	 ;,
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	0(%rbp), %rcx	 ; token_278->lexeme, token_278->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp658
	je	.L436	 ;,
.L433:
 ; D:\TC\src\parser.c:164:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	0(%rbp), %rdx	 ; token_278->lexeme, token_278->lexeme
	movq	80(%rsp), %rcx	 ; %sfp,
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	search_name	 ;
 ; D:\TC\src\parser.c:165:     if (return_type == NULL) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testq	%rax, %rax	 ; return_type
 ; D:\TC\src\parser.c:164:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	%rax, 104(%rsp)	 ; return_type, %sfp
 ; D:\TC\src\parser.c:165:     if (return_type == NULL) {
	je	.L566	 ;,
 ; D:\TC\src\parser.c:169:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:170:     if (token->type != IDENTIFIER) {
	movq	56(%rsp), %r10	 ; %sfp, token
	cmpl	$1, 24(%rax)	 ;, token_288->type
 ; D:\TC\src\parser.c:169:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp661, token
 ; D:\TC\src\parser.c:170:     if (token->type != IDENTIFIER) {
	jne	.L567	 ;,
 ; D:\TC\src\parser.c:174:     Symbol* name = create_symbol(token->lexeme, SYMBOL_SUBROUTINE, return_type, method_scope);
	movq	(%rax), %rcx	 ; token_288->lexeme, token_288->lexeme
	movq	104(%rsp), %r8	 ; %sfp,
	movq	%rsi, %r9	 ; method_scope,
	movl	$1, %edx	 ;,
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:175:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:174:     Symbol* name = create_symbol(token->lexeme, SYMBOL_SUBROUTINE, return_type, method_scope);
	movq	%rax, 128(%rsp)	 ; tmp663, %sfp
 ; D:\TC\src\parser.c:175:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:176:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	cmpl	$5, 24(%rax)	 ;, token_294->type
 ; D:\TC\src\parser.c:175:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp664, token
 ; D:\TC\src\parser.c:176:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L440	 ;,
 ; D:\TC\src\parser.c:176:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp480
	movq	0(%rbp), %rcx	 ; token_294->lexeme, token_294->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:176:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp666
	je	.L440	 ;,
 ; D:\TC\src\parser.c:180:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:181:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	56(%rsp), %r10	 ; %sfp, token
	cmpl	$6, 24(%rax)	 ;, token_301->type
 ; D:\TC\src\parser.c:180:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp667, token
 ; D:\TC\src\parser.c:181:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	je	.L441	 ;,
.L443:
 ; D:\TC\src\parser.c:182:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:182:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC76(%rip), %rcx	 ;, tmp484
 ; D:\TC\src\parser.c:182:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp668
 ; D:\TC\src\parser.c:182:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
.L442:
 ; D:\TC\src\parser.c:183:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r10, 136(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp670, token
 ; D:\TC\src\parser.c:184:     list(Variable*) parameters = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:185:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	96(%rsp), %rcx	 ; %sfp,
	movq	%r13, %rdx	 ; self,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:184:     list(Variable*) parameters = create_list();
	movq	%rax, %rbp	 ; tmp671, parameters
	movq	%rax, 120(%rsp)	 ; parameters, %sfp
 ; D:\TC\src\parser.c:198:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	leaq	.LC79(%rip), %r13	 ;, tmp570
 ; D:\TC\src\parser.c:185:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	call	create_variable	 ;
 ; D:\TC\src\parser.c:185:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	%rbp, %rcx	 ; parameters,
 ; D:\TC\src\parser.c:185:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	%rax, %rdx	 ; tmp672, _310
 ; D:\TC\src\parser.c:185:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	call	list_append	 ;
	movq	%rsi, 56(%rsp)	 ; method_scope, %sfp
 ; D:\TC\src\parser.c:187:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rbp	 ;, tmp569
	movq	136(%rsp), %rsi	 ; %sfp, token
	.p2align 4,,10
	.p2align 3
.L444:
 ; D:\TC\src\parser.c:186:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_311->type
	je	.L568	 ;,
.L549:
	movq	%rsi, %r10	 ; token, token
.L448:
 ; D:\TC\src\parser.c:191:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:191:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC77(%rip), %rcx	 ;, tmp492
 ; D:\TC\src\parser.c:191:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp676
 ; D:\TC\src\parser.c:191:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L435	 ;
	.p2align 4,,10
	.p2align 3
.L552:
 ; D:\TC\src\parser.c:30:         now_scope = builtin_scope;
	movq	(%rsi), %rbx	 ; builtin_scope, now_scope
	jmp	.L383	 ;
	.p2align 4,,10
	.p2align 3
.L470:
 ; D:\TC\src\parser.c:265:     Symbol* constructor = search_name(class_scope, CONSTRUCTOR_NAME);
	movq	112(%rsp), %r11	 ; %sfp, token
	movq	80(%rsp), %rcx	 ; %sfp,
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	.refptr.CONSTRUCTOR_NAME(%rip), %rbx	 ;, tmp537
	movq	%r11, 104(%rsp)	 ; token, %sfp
	movq	(%rbx), %rdx	 ; CONSTRUCTOR_NAME, CONSTRUCTOR_NAME
	call	search_name	 ;
 ; D:\TC\src\parser.c:266:     if (constructor == NULL) {
	movq	56(%rsp), %r10	 ; %sfp, token
	movq	104(%rsp), %r11	 ; %sfp, token
	testq	%rax, %rax	 ; constructor
	je	.L569	 ;,
.L471:
 ; D:\TC\src\parser.c:270:     if (constructor->kind != SYMBOL_SUBROUTINE)
	cmpl	$1, 32(%rax)	 ;, constructor_268->kind
	movq	%r10, 56(%rsp)	 ; token, %sfp
	jne	.L570	 ;,
.L472:
 ; D:\TC\src\parser.c:272:     return create_class(name, members, class_scope);
	movq	80(%rsp), %r8	 ; %sfp,
	movq	88(%rsp), %rdx	 ; %sfp,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	96(%rsp), %rcx	 ; %sfp,
	call	create_class	 ;
 ; D:\TC\src\parser.c:48:             if (class_ == NULL)
	movq	56(%rsp), %r11	 ; %sfp, token
	testq	%rax, %rax	 ; _273
 ; D:\TC\src\parser.c:272:     return create_class(name, members, class_scope);
	movq	%rax, %r9	 ; tmp711, _273
 ; D:\TC\src\parser.c:48:             if (class_ == NULL)
	jne	.L473	 ;,
	jmp	.L427	 ;
	.p2align 4,,10
	.p2align 3
.L467:
 ; D:\TC\src\parser.c:259:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp529
	movq	(%rbx), %rcx	 ; token_249->lexeme, token_249->lexeme
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:259:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp703
	je	.L468	 ;,
	jmp	.L465	 ;
	.p2align 4,,10
	.p2align 3
.L555:
 ; D:\TC\src\parser.c:235:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:235:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC70(%rip), %rcx	 ;, tmp457
 ; D:\TC\src\parser.c:235:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp646
 ; D:\TC\src\parser.c:235:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L427	 ;
	.p2align 4,,10
	.p2align 3
.L559:
 ; D:\TC\src\parser.c:61:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:61:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC53(%rip), %rcx	 ;, tmp386
 ; D:\TC\src\parser.c:61:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp591
 ; D:\TC\src\parser.c:61:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
.L388:
 ; D:\TC\src\parser.c:39:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:39:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC57(%rip), %rcx	 ;, tmp403
 ; D:\TC\src\parser.c:39:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp603
 ; D:\TC\src\parser.c:39:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _132
	jmp	.L395	 ;
	.p2align 4,,10
	.p2align 3
.L570:
 ; D:\TC\src\parser.c:271:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 104(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:271:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC88(%rip), %rcx	 ;, tmp542
 ; D:\TC\src\parser.c:271:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp710
 ; D:\TC\src\parser.c:271:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	104(%rsp), %r11	 ; %sfp, token
	jmp	.L472	 ;
	.p2align 4,,10
	.p2align 3
.L393:
 ; D:\TC\src\parser.c:77:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:77:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC55(%rip), %rcx	 ;, tmp393
 ; D:\TC\src\parser.c:77:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp597
 ; D:\TC\src\parser.c:77:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L388	 ;
	.p2align 4,,10
	.p2align 3
.L405:
 ; D:\TC\src\parser.c:109:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:109:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC61(%rip), %rcx	 ;, tmp417
 ; D:\TC\src\parser.c:109:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp616
 ; D:\TC\src\parser.c:109:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L400	 ;
	.p2align 4,,10
	.p2align 3
.L440:
 ; D:\TC\src\parser.c:177:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:177:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC75(%rip), %rcx	 ;, tmp479
 ; D:\TC\src\parser.c:177:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp665
 ; D:\TC\src\parser.c:177:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
.L435:
 ; D:\TC\src\parser.c:250:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:250:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC84(%rip), %rcx	 ;, tmp521
 ; D:\TC\src\parser.c:250:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp694
 ; D:\TC\src\parser.c:250:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _362
.L464:
 ; D:\TC\src\parser.c:251:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%ecx, %ecx	 ;
	xorl	%r8d, %r8d	 ;
	call	create_class_member	 ;
 ; D:\TC\src\parser.c:251:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	88(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:251:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rdx	 ; tmp695, _239
 ; D:\TC\src\parser.c:251:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	jmp	.L465	 ;
	.p2align 4,,10
	.p2align 3
.L564:
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_163->lexeme, token_163->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp628
	je	.L414	 ;,
 ; D:\TC\src\parser.c:130:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%rsi, 96(%rsp)	 ; token, %sfp
	movzbl	104(%rsp), %esi	 ; %sfp, have_return
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:131:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	96(%rsp), %r11	 ; %sfp, token
	cmpl	$5, 24(%rax)	 ;, token_184->type
 ; D:\TC\src\parser.c:130:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp629, token
 ; D:\TC\src\parser.c:131:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L416	 ;,
 ; D:\TC\src\parser.c:131:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp438
	movq	(%rbx), %rcx	 ; token_184->lexeme, token_184->lexeme
	movq	%r11, 96(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:131:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	96(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp631
	je	.L416	 ;,
	movq	%r11, 104(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:146:             have_return = true;
	movl	$1, %r13d	 ;, tmp559
 ; D:\TC\src\parser.c:135:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:136:     parser->in_function = true;
	movb	$1, 8(%r12)	 ;, parser_74(D)->in_function
 ; D:\TC\src\parser.c:138:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:135:     list(Statement*) body = create_list();
	movq	%rax, 96(%rsp)	 ; tmp632, %sfp
 ; D:\TC\src\parser.c:138:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	104(%rsp), %r11	 ; %sfp, token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rbp	 ;, tmp549
	movq	%rax, %rbx	 ; tmp633, token
	movq	%r11, 112(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:139:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L417	 ;
	.p2align 4,,10
	.p2align 3
.L420:
 ; D:\TC\src\parser.c:146:             have_return = true;
	cmpl	$5, 8(%r9)	 ;, statement_193->type
	cmove	%r13d, %esi	 ; have_return,, tmp559, have_return
.L421:
 ; D:\TC\src\parser.c:147:         list_append(body, (pointer)statement);
	movq	96(%rsp), %rcx	 ; %sfp,
	movq	%r9, %rdx	 ; statement,
	call	list_append	 ;
 ; D:\TC\src\parser.c:148:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp637, token
.L417:
 ; D:\TC\src\parser.c:139:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_196->type
	jne	.L422	 ;,
 ; D:\TC\src\parser.c:139:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rbx), %rcx	 ; token_196->lexeme, token_196->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:139:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp638
	jne	.L571	 ;,
.L422:
 ; D:\TC\src\parser.c:140:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	%r12, %r8	 ; parser,
	movq	%rdi, %rdx	 ; function_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r9	 ; tmp634, statement
 ; D:\TC\src\parser.c:141:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L572	 ;,
 ; D:\TC\src\parser.c:143:         else if (have_return)
	testb	%sil, %sil	 ; have_return
	je	.L420	 ;,
 ; D:\TC\src\parser.c:144:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%rax, 104(%rsp)	 ; statement, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:144:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:144:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp636
 ; D:\TC\src\parser.c:144:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	104(%rsp), %r9	 ; %sfp, statement
	jmp	.L420	 ;
	.p2align 4,,10
	.p2align 3
.L409:
 ; D:\TC\src\parser.c:121:             list_append(parameters, (pointer)parameter);
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; parameter,
	call	list_append	 ;
	jmp	.L408	 ;
	.p2align 4,,10
	.p2align 3
.L410:
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	0(%r13), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	movq	(%rax), %rcx	 ; token_167->lexeme, token_167->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp625
	jne	.L573	 ;,
 ; D:\TC\src\parser.c:125:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_167->type
	jne	.L413	 ;,
 ; D:\TC\src\parser.c:125:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_167->lexeme, token_167->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:125:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp627
	jne	.L406	 ;,
	jmp	.L413	 ;
	.p2align 4,,10
	.p2align 3
.L568:
 ; D:\TC\src\parser.c:186:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp763
	movq	(%rbx), %rcx	 ; token_311->lexeme, token_311->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:186:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp682
	jne	.L574	 ;,
 ; D:\TC\src\parser.c:187:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_311->type
	jne	.L549	 ;,
 ; D:\TC\src\parser.c:187:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	movq	(%rbx), %rcx	 ; token_311->lexeme, token_311->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:187:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp673
	je	.L575	 ;,
 ; D:\TC\src\parser.c:188:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:194:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	%r12, %r8	 ; parser,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:188:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp674, token
 ; D:\TC\src\parser.c:194:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:195:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	je	.L576	 ;,
 ; D:\TC\src\parser.c:197:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_317->value
	je	.L454	 ;,
 ; D:\TC\src\parser.c:198:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:198:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	movq	%r13, %rcx	 ; tmp570,
 ; D:\TC\src\parser.c:198:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp680
 ; D:\TC\src\parser.c:198:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L453:
 ; D:\TC\src\parser.c:201:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp681, token
	jmp	.L444	 ;
	.p2align 4,,10
	.p2align 3
.L454:
 ; D:\TC\src\parser.c:200:             list_append(parameters, (pointer)parameter);
	movq	120(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; parameter,
	call	list_append	 ;
	jmp	.L453	 ;
	.p2align 4,,10
	.p2align 3
.L565:
 ; D:\TC\src\parser.c:117:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:117:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC62(%rip), %rcx	 ;, tmp422
 ; D:\TC\src\parser.c:117:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp621
 ; D:\TC\src\parser.c:117:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L408	 ;
	.p2align 4,,10
	.p2align 3
.L576:
 ; D:\TC\src\parser.c:196:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:196:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC78(%rip), %rcx	 ;, tmp497
 ; D:\TC\src\parser.c:196:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp679
 ; D:\TC\src\parser.c:196:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L453	 ;
	.p2align 4,,10
	.p2align 3
.L551:
 ; D:\TC\src\parser.c:22:         builtin_scope = create_symbol_table(NULL);
	xorl	%ecx, %ecx	 ;
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:23:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	xorl	%r8d, %r8d	 ;
	movl	$5, %edx	 ;,
 ; D:\TC\src\parser.c:22:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, %r9	 ; tmp580, _2
 ; D:\TC\src\parser.c:22:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, (%rsi)	 ; _2, builtin_scope
 ; D:\TC\src\parser.c:23:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp358
	movq	(%rax), %rcx	 ; VOID_KEYWORD, VOID_KEYWORD
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:23:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp360
 ; D:\TC\src\parser.c:24:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:23:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp581, name_void
 ; D:\TC\src\parser.c:24:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp363
	movl	$5, %edx	 ;,
	movq	(%rax), %rcx	 ; INT_KEYWORD, INT_KEYWORD
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:24:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp365
 ; D:\TC\src\parser.c:25:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:24:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp582, name_int
 ; D:\TC\src\parser.c:25:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp368
	movl	$5, %edx	 ;,
	movq	(%rax), %rcx	 ; FLOAT_KEYWORD, FLOAT_KEYWORD
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:25:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp370
 ; D:\TC\src\parser.c:26:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:25:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp583, name_float
 ; D:\TC\src\parser.c:26:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp373
	movl	$5, %edx	 ;,
	movq	(%rax), %rcx	 ; STRING_KEYWORD, STRING_KEYWORD
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:26:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp375
 ; D:\TC\src\parser.c:27:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:26:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp584, name_string
 ; D:\TC\src\parser.c:27:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp378
	movl	$5, %edx	 ;,
	movq	(%rax), %rcx	 ; BOOL_KEYWORD, BOOL_KEYWORD
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:27:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp380
	movq	%rax, (%rdx)	 ; tmp585, name_bool
	jmp	.L382	 ;
	.p2align 4,,10
	.p2align 3
.L401:
 ; D:\TC\src\parser.c:93:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:93:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC58(%rip), %rcx	 ;, tmp408
 ; D:\TC\src\parser.c:93:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp608
 ; D:\TC\src\parser.c:93:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L400	 ;
	.p2align 4,,10
	.p2align 3
.L436:
 ; D:\TC\src\parser.c:161:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:161:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC72(%rip), %rcx	 ;, tmp470
 ; D:\TC\src\parser.c:161:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp657
 ; D:\TC\src\parser.c:161:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L435	 ;
	.p2align 4,,10
	.p2align 3
.L558:
 ; D:\TC\src\parser.c:256:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:256:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC85(%rip), %rcx	 ;, tmp526
 ; D:\TC\src\parser.c:256:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp699
 ; D:\TC\src\parser.c:256:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L466	 ;
	.p2align 4,,10
	.p2align 3
.L573:
 ; D:\TC\src\parser.c:124:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp626, token
 ; D:\TC\src\parser.c:124:             token = get_next_token(lexer, true);
	jmp	.L406	 ;
.L563:
 ; D:\TC\src\parser.c:103:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:103:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC60(%rip), %rcx	 ;, tmp414
 ; D:\TC\src\parser.c:103:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp613
 ; D:\TC\src\parser.c:103:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L400	 ;
.L567:
 ; D:\TC\src\parser.c:171:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:171:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC74(%rip), %rcx	 ;, tmp476
 ; D:\TC\src\parser.c:171:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp662
 ; D:\TC\src\parser.c:171:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L435	 ;
.L560:
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	.refptr.FROM_KEYWORD(%rip), %rax	 ;, tmp387
	movq	(%rbx), %rcx	 ; token_106->lexeme, token_106->lexeme
	movq	(%rax), %rdx	 ; FROM_KEYWORD, FROM_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp593
	jne	.L390	 ;,
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movl	24(%rbx), %eax	 ; token_106->type, _107
	jmp	.L389	 ;
.L575:
 ; D:\TC\src\parser.c:189:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, 24(%rbx)	 ;, token_311->type
	movq	%rsi, %r10	 ; token, token
	movq	56(%rsp), %rsi	 ; %sfp, method_scope
	jne	.L448	 ;,
 ; D:\TC\src\parser.c:189:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp762
	movq	(%rbx), %rcx	 ; token_311->lexeme, token_311->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:189:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp677
	je	.L448	 ;,
.L456:
 ; D:\TC\src\parser.c:203:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:204:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	cmpl	$5, 24(%rax)	 ;, token_335->type
 ; D:\TC\src\parser.c:203:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp678, token
 ; D:\TC\src\parser.c:204:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L451	 ;,
 ; D:\TC\src\parser.c:204:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp764
	movq	(%rbx), %rcx	 ; token_335->lexeme, token_335->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:204:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp684
	je	.L451	 ;,
	movq	%r10, 136(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:211:     bool have_return = false;
	xorl	%ebp, %ebp	 ; have_return
 ; D:\TC\src\parser.c:208:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:209:     parser->in_function = true;
	movl	$257, %edx	 ;,
 ; D:\TC\src\parser.c:212:     token = get_next_token(lexer, true);
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:209:     parser->in_function = true;
	movw	%dx, 8(%r12)	 ;, MEM <vector(2) char> [(char *)parser_74(D) + 8B]
 ; D:\TC\src\parser.c:212:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:208:     list(Statement*) body = create_list();
	movq	%rax, 56(%rsp)	 ; tmp685, %sfp
 ; D:\TC\src\parser.c:212:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp686, token
 ; D:\TC\src\parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L457	 ;
	.p2align 4,,10
	.p2align 3
.L460:
 ; D:\TC\src\parser.c:220:             have_return = true;
	cmpl	$5, 8(%r13)	 ;, statement_344->type
	movl	$1, %eax	 ;, tmp765
	cmove	%eax, %ebp	 ; have_return,, tmp765, have_return
.L461:
 ; D:\TC\src\parser.c:221:         list_append(body, (pointer)statement);
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%r13, %rdx	 ; statement,
	call	list_append	 ;
 ; D:\TC\src\parser.c:222:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp690, token
.L457:
 ; D:\TC\src\parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_347->type
	jne	.L462	 ;,
 ; D:\TC\src\parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%rdi), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rbx), %rcx	 ; token_347->lexeme, token_347->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp691
	jne	.L577	 ;,
.L462:
 ; D:\TC\src\parser.c:214:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	%r12, %r8	 ; parser,
	movq	%rsi, %rdx	 ; method_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r13	 ; tmp687, statement
 ; D:\TC\src\parser.c:215:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L578	 ;,
 ; D:\TC\src\parser.c:217:         else if (have_return)
	testb	%bpl, %bpl	 ; have_return
	je	.L460	 ;,
 ; D:\TC\src\parser.c:218:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:218:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:218:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp689
 ; D:\TC\src\parser.c:218:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L460	 ;
.L569:
 ; D:\TC\src\parser.c:267:         SymbolTable* constructor_scope = create_symbol_table(class_scope);
	movq	80(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:268:         constructor = create_symbol(CONSTRUCTOR_NAME, SYMBOL_SUBROUTINE, name, constructor_scope);
	movq	(%rbx), %rcx	 ; CONSTRUCTOR_NAME, CONSTRUCTOR_NAME
	movq	96(%rsp), %r8	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:267:         SymbolTable* constructor_scope = create_symbol_table(class_scope);
	movq	%rax, %r9	 ;, tmp708
 ; D:\TC\src\parser.c:268:         constructor = create_symbol(CONSTRUCTOR_NAME, SYMBOL_SUBROUTINE, name, constructor_scope);
	call	create_symbol	 ;
	movq	104(%rsp), %r11	 ; %sfp, token
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L471	 ;
.L451:
 ; D:\TC\src\parser.c:205:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:205:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC80(%rip), %rcx	 ;, tmp504
 ; D:\TC\src\parser.c:205:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp683
 ; D:\TC\src\parser.c:205:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L435	 ;
	.p2align 4,,10
	.p2align 3
.L578:
 ; D:\TC\src\parser.c:216:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:216:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC82(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:216:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp688
 ; D:\TC\src\parser.c:216:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L461	 ;
.L441:
 ; D:\TC\src\parser.c:181:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp761
	movq	0(%rbp), %rcx	 ; token_301->lexeme, token_301->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:181:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp669
	je	.L443	 ;,
	jmp	.L442	 ;
.L561:
 ; D:\TC\src\parser.c:83:         fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
	call	__getreent	 ;
 ; D:\TC\src\parser.c:83:         fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
	movq	%rsi, %r9	 ; source,
	movq	%rdi, %r8	 ; import_name,
	leaq	.LC56(%rip), %rdx	 ;, tmp399
	movq	24(%rax), %rcx	 ; _127->_stderr, _127->_stderr
	call	fprintf	 ;
 ; D:\TC\src\parser.c:84:         name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
	movq	.refptr.name_void(%rip), %rax	 ;, tmp400
	movq	64(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rcx	 ; import_name,
	movl	$2, %edx	 ;,
	movq	(%rax), %r8	 ; name_void,
	call	create_symbol	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	movq	%rax, %rcx	 ; tmp601, name
	jmp	.L394	 ;
.L577:
 ; D:\TC\src\parser.c:224:     parser->in_function = false;
	xorl	%eax, %eax	 ;
	movq	136(%rsp), %r10	 ; %sfp, token
	movw	%ax, 8(%r12)	 ;, MEM <vector(2) char> [(char *)parser_74(D) + 8B]
 ; D:\TC\src\parser.c:226:     if (!have_return && return_type != name_void)
	testb	%bpl, %bpl	 ; have_return
	jne	.L463	 ;,
 ; D:\TC\src\parser.c:226:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp517
 ; D:\TC\src\parser.c:226:     if (!have_return && return_type != name_void)
	movq	104(%rsp), %rdx	 ; %sfp, return_type
	cmpq	(%rax), %rdx	 ; name_void, return_type
	je	.L463	 ;,
 ; D:\TC\src\parser.c:227:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:227:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC83(%rip), %rcx	 ;, tmp519
 ; D:\TC\src\parser.c:227:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp692
 ; D:\TC\src\parser.c:227:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	136(%rsp), %r10	 ; %sfp, token
.L463:
 ; D:\TC\src\parser.c:228:     return create_method(name, return_type, parameters, body, method_scope);
	movq	104(%rsp), %rdx	 ; %sfp,
	movq	56(%rsp), %r9	 ; %sfp,
	movq	%rsi, 32(%rsp)	 ; method_scope,
	movq	120(%rsp), %r8	 ; %sfp,
	movq	128(%rsp), %rcx	 ; %sfp,
	movq	%r10, 136(%rsp)	 ; token, %sfp
	call	create_method	 ;
 ; D:\TC\src\parser.c:249:             if (method == NULL)
	movq	136(%rsp), %r10	 ; %sfp, token
	testq	%rax, %rax	 ; _362
 ; D:\TC\src\parser.c:228:     return create_method(name, return_type, parameters, body, method_scope);
	movq	%rax, %rdx	 ; tmp693, _362
 ; D:\TC\src\parser.c:249:             if (method == NULL)
	jne	.L464	 ;,
	jmp	.L435	 ;
	.p2align 4,,10
	.p2align 3
.L562:
 ; D:\TC\src\parser.c:98:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:98:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC59(%rip), %rcx	 ;, tmp412
 ; D:\TC\src\parser.c:98:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp611
 ; D:\TC\src\parser.c:98:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L400	 ;
.L566:
 ; D:\TC\src\parser.c:166:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:166:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC73(%rip), %rcx	 ;, tmp474
 ; D:\TC\src\parser.c:166:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp660
 ; D:\TC\src\parser.c:166:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L435	 ;
.L572:
 ; D:\TC\src\parser.c:142:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%rax, 104(%rsp)	 ; statement, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:142:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC66(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:142:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp635
 ; D:\TC\src\parser.c:142:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	104(%rsp), %r9	 ; %sfp, statement
	jmp	.L421	 ;
.L390:
 ; D:\TC\src\parser.c:68:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:69:         if (token->type != STRING) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$4, 24(%rax)	 ;, token_111->type
 ; D:\TC\src\parser.c:68:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp594, token
 ; D:\TC\src\parser.c:69:         if (token->type != STRING) {
	jne	.L579	 ;,
 ; D:\TC\src\parser.c:74:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r11, 56(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:73:         source = token->lexeme;
	movq	(%rax), %rsi	 ; token_111->lexeme, source
 ; D:\TC\src\parser.c:74:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
 ; D:\TC\src\parser.c:74:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp596, token
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movl	24(%rax), %eax	 ; token_116->type, _107
	jmp	.L389	 ;
.L574:
	movq	%rsi, %r10	 ; token, token
	movq	56(%rsp), %rsi	 ; %sfp, method_scope
	jmp	.L456	 ;
.L416:
 ; D:\TC\src\parser.c:132:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:132:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC65(%rip), %rcx	 ;, tmp437
 ; D:\TC\src\parser.c:132:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp630
 ; D:\TC\src\parser.c:132:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L400	 ;
.L571:
 ; D:\TC\src\parser.c:150:     parser->in_function = false;
	movb	$0, 8(%r12)	 ;, parser_74(D)->in_function
	movq	112(%rsp), %r11	 ; %sfp, token
 ; D:\TC\src\parser.c:151:     if (!have_return && return_type != name_void)
	testb	%sil, %sil	 ; have_return
	jne	.L423	 ;,
 ; D:\TC\src\parser.c:151:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp448
 ; D:\TC\src\parser.c:151:     if (!have_return && return_type != name_void)
	movq	80(%rsp), %rsi	 ; %sfp, return_type
	cmpq	(%rax), %rsi	 ; name_void, return_type
	je	.L423	 ;,
 ; D:\TC\src\parser.c:152:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 104(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:152:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC68(%rip), %rcx	 ;, tmp450
 ; D:\TC\src\parser.c:152:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp639
 ; D:\TC\src\parser.c:152:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	104(%rsp), %r11	 ; %sfp, token
.L423:
 ; D:\TC\src\parser.c:153:     return create_function(name, return_type, parameters, body, function_scope);
	movq	56(%rsp), %r8	 ; %sfp,
	movq	96(%rsp), %r9	 ; %sfp,
	movq	%rdi, 32(%rsp)	 ; function_scope,
	movq	80(%rsp), %rdx	 ; %sfp,
	movq	88(%rsp), %rcx	 ; %sfp,
	movq	%r11, 104(%rsp)	 ; token, %sfp
	call	create_function	 ;
 ; D:\TC\src\parser.c:43:             if (function == NULL)
	movq	104(%rsp), %r11	 ; %sfp, token
	testq	%rax, %rax	 ; _211
 ; D:\TC\src\parser.c:153:     return create_function(name, return_type, parameters, body, function_scope);
	movq	%rax, %r8	 ; tmp640, _211
 ; D:\TC\src\parser.c:43:             if (function == NULL)
	jne	.L424	 ;,
	jmp	.L400	 ;
	.p2align 4,,10
	.p2align 3
.L579:
 ; D:\TC\src\parser.c:70:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:70:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC54(%rip), %rcx	 ;, tmp391
 ; D:\TC\src\parser.c:70:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp595
 ; D:\TC\src\parser.c:70:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L388	 ;
	.ident	"GCC: (GNU) 13.2.0"
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	search_name;	.scl	2;	.type	32;	.endef
	.def	create_symbol;	.scl	2;	.type	32;	.endef
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	create_code;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	create_class;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	create_method;	.scl	2;	.type	32;	.endef
	.def	create_function;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.METHOD_KEYWORD, "dr"
	.globl	.refptr.METHOD_KEYWORD
	.linkonce	discard
.refptr.METHOD_KEYWORD:
	.quad	METHOD_KEYWORD
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
	.section	.rdata$.refptr.FROM_KEYWORD, "dr"
	.globl	.refptr.FROM_KEYWORD
	.linkonce	discard
.refptr.FROM_KEYWORD:
	.quad	FROM_KEYWORD
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
	.section	.rdata$.refptr.VAR_KEYWORD, "dr"
	.globl	.refptr.VAR_KEYWORD
	.linkonce	discard
.refptr.VAR_KEYWORD:
	.quad	VAR_KEYWORD
	.section	.rdata$.refptr.WHILE_KEYWORD, "dr"
	.globl	.refptr.WHILE_KEYWORD
	.linkonce	discard
.refptr.WHILE_KEYWORD:
	.quad	WHILE_KEYWORD
	.section	.rdata$.refptr.SEMICOLON_SYMBOL, "dr"
	.globl	.refptr.SEMICOLON_SYMBOL
	.linkonce	discard
.refptr.SEMICOLON_SYMBOL:
	.quad	SEMICOLON_SYMBOL
	.section	.rdata$.refptr.FOR_KEYWORD, "dr"
	.globl	.refptr.FOR_KEYWORD
	.linkonce	discard
.refptr.FOR_KEYWORD:
	.quad	FOR_KEYWORD
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
	.section	.rdata$.refptr.IF_KEYWORD, "dr"
	.globl	.refptr.IF_KEYWORD
	.linkonce	discard
.refptr.IF_KEYWORD:
	.quad	IF_KEYWORD
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
	.section	.rdata$.refptr.COMMA_SYMBOL, "dr"
	.globl	.refptr.COMMA_SYMBOL
	.linkonce	discard
.refptr.COMMA_SYMBOL:
	.quad	COMMA_SYMBOL
	.section	.rdata$.refptr.CONSTRUCTOR_NAME, "dr"
	.globl	.refptr.CONSTRUCTOR_NAME
	.linkonce	discard
.refptr.CONSTRUCTOR_NAME:
	.quad	CONSTRUCTOR_NAME
	.section	.rdata$.refptr.SELF_KEYWORD, "dr"
	.globl	.refptr.SELF_KEYWORD
	.linkonce	discard
.refptr.SELF_KEYWORD:
	.quad	SELF_KEYWORD
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
	.section	.rdata$.refptr.R_PAREN_SYMBOL, "dr"
	.globl	.refptr.R_PAREN_SYMBOL
	.linkonce	discard
.refptr.R_PAREN_SYMBOL:
	.quad	R_PAREN_SYMBOL
	.section	.rdata$.refptr.L_PAREN_SYMBOL, "dr"
	.globl	.refptr.L_PAREN_SYMBOL
	.linkonce	discard
.refptr.L_PAREN_SYMBOL:
	.quad	L_PAREN_SYMBOL
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
	.section	.rdata$.refptr.ASSIGN_SYMBOL, "dr"
	.globl	.refptr.ASSIGN_SYMBOL
	.linkonce	discard
.refptr.ASSIGN_SYMBOL:
	.quad	ASSIGN_SYMBOL
