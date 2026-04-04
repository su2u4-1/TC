	.file	"parser.c"
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
 ; D:/TC/src/parser.c:650:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:647: static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, SymbolTable* now_scope, Parser* parser) {
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp124, lexer
	subq	$56, %rsp	 ;,
 ; D:/TC/src/parser.c:650:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:/TC/src/parser.c:651:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;,
	jne	.L2	 ;,
.L9:
 ; D:/TC/src/parser.c:652:         OperatorType op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_70->lexeme, token_70->lexeme
	call	string_to_operator	 ;
 ; D:/TC/src/parser.c:653:         int op_prec = operator_precedence(op);
	movl	%eax, %ecx	 ; op,
 ; D:/TC/src/parser.c:652:         OperatorType op = string_to_operator(token->lexeme);
	movl	%eax, %edi	 ; tmp129, op
 ; D:/TC/src/parser.c:653:         int op_prec = operator_precedence(op);
	call	operator_precedence	 ;
	movl	%eax, %esi	 ; tmp130, op_prec
 ; D:/TC/src/parser.c:654:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, %edi	 ;, op
	je	.L2	 ;,
	cmpl	%r14d, %eax	 ; min_prec, op_prec
	jl	.L2	 ;,
 ; D:/TC/src/parser.c:656:         token = get_next_token(lexer, true);  // consume operator
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:657:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	160(%rsp), %r8	 ; parser,
	movq	%r13, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:657:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp131, token
 ; D:/TC/src/parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp132, right_primary
 ; D:/TC/src/parser.c:659:         if (right_primary == NULL) {
	testq	%rax, %rax	 ; right_primary
	je	.L17	 ;,
 ; D:/TC/src/parser.c:664:         Expression* right = create_expression(OP_NONE, NULL, right_primary, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rbp	 ; tmp134, right
.L15:
 ; D:/TC/src/parser.c:665:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:/TC/src/parser.c:666:         while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;,
	jne	.L5	 ;,
 ; D:/TC/src/parser.c:667:             OperatorType next_op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_69->lexeme, token_69->lexeme
	call	string_to_operator	 ;
	movl	%eax, %r15d	 ; tmp136, next_op
 ; D:/TC/src/parser.c:668:             int next_prec = operator_precedence(next_op);
	movl	%eax, %ecx	 ; next_op,
	call	operator_precedence	 ;
 ; D:/TC/src/parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %r15d	 ;, next_op
	je	.L5	 ;,
	cmpl	%eax, %esi	 ; next_prec, op_prec
	jge	.L5	 ;,
 ; D:/TC/src/parser.c:671:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	160(%rsp), %rdx	 ; parser, tmp144
	movq	%r13, %r9	 ; now_scope,
	movl	%eax, %r8d	 ; next_prec,
	movq	%rbx, %rcx	 ; lexer,
	movq	%rdx, 32(%rsp)	 ; tmp144,
	movq	%rbp, %rdx	 ; right,
	call	parse_expr_prec	 ;
	movq	%rax, %rbp	 ; tmp138, right
 ; D:/TC/src/parser.c:672:             if (right == NULL) {
	testq	%rax, %rax	 ; right
	jne	.L15	 ;,
 ; D:/TC/src/parser.c:662:             return NULL;
	xorl	%r12d, %r12d	 ; <retval>
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L5:
 ; D:/TC/src/parser.c:678:         expr_left = create_expression(op, expr_left, NULL, right);
	xorl	%r8d, %r8d	 ;
	movq	%r12, %rdx	 ; expr_left,
	movq	%rbp, %r9	 ; right,
	movl	%edi, %ecx	 ; op,
	call	create_expression	 ;
 ; D:/TC/src/parser.c:679:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:678:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rax, %r12	 ; tmp140, expr_left
 ; D:/TC/src/parser.c:679:         token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:/TC/src/parser.c:651:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;,
	je	.L9	 ;,
.L2:
 ; D:/TC/src/parser.c:681:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
.L1:
 ; D:/TC/src/parser.c:684: }
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
 ; D:/TC/src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	160(%rsp), %rax	 ; parser, tmp143
 ; D:/TC/src/parser.c:662:             return NULL;
	xorl	%r12d, %r12d	 ; <retval>
 ; D:/TC/src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	(%rax), %rcx	 ; parser_38(D)->source_file, parser_38(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC0(%rip), %rcx	 ;, tmp117
 ; D:/TC/src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp133
 ; D:/TC/src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
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
 ; D:/TC/src/parser.c:687:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %rbx	 ; tmp96, <retval>
 ; D:/TC/src/parser.c:688:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L22	 ;,
 ; D:/TC/src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	movq	%rax, %r8	 ; <retval>,
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:/TC/src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rdi, 32(%rsp)	 ; parser,
	movq	%rbp, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp99, _4
 ; D:/TC/src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rbx	 ; tmp100, <retval>
.L18:
 ; D:/TC/src/parser.c:695: }
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
 ; D:/TC/src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_10(D)->source_file, parser_10(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rsi, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdi	 ; tmp97, _2
 ; D:/TC/src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:/TC/src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rdi, %r8	 ; _2,
	leaq	.LC1(%rip), %rcx	 ;, tmp91
 ; D:/TC/src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp98, _3
 ; D:/TC/src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:691:         return NULL;
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
	movq	%rdx, %r12	 ; tmp144, now_scope
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp145, parser
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp143, lexer
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:/TC/src/parser.c:369:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rbx	 ; tmp146, token
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_39->type, _1
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _1
	je	.L24	 ;,
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _1
	jne	.L27	 ;,
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rbx), %rcx	 ; token_39->lexeme, token_39->lexeme
	call	is_builtin_type	 ;
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp148
	je	.L27	 ;,
.L24:
 ; D:/TC/src/parser.c:375:     Symbol* type = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rdx	 ; token_39->lexeme, token_39->lexeme
	movq	%r12, %rcx	 ; now_scope,
	call	search_name	 ;
	movq	%rax, %rbp	 ; tmp149, type
 ; D:/TC/src/parser.c:376:     if (type != NULL) {
	testq	%rax, %rax	 ; type
	je	.L28	 ;,
 ; D:/TC/src/parser.c:377:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; type_46->kind, _49
 ; D:/TC/src/parser.c:377:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	cmpl	$6, %eax	 ;, _49
	je	.L29	 ;,
	testl	%eax, %eax	 ; _49
	jne	.L55	 ;,
.L29:
 ; D:/TC/src/parser.c:381:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:382:     if (token->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	 ;, token_53->type
 ; D:/TC/src/parser.c:381:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp152, token
 ; D:/TC/src/parser.c:382:     if (token->type != IDENTIFIER)
	jne	.L56	 ;,
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	cmpb	$0, 10(%rdi)	 ;, parser_41(D)->in_class
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movl	$3, %edx	 ;, iftmp.25_29
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	je	.L31	 ;,
.L57:
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	cmpb	$1, 9(%rdi)	 ;, parser_41(D)->in_method
	sbbl	%edx, %edx	 ; iftmp.25_29
	andl	$2, %edx	 ;, iftmp.25_29
	addl	$3, %edx	 ;, iftmp.25_29
.L31:
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movq	(%rbx), %rcx	 ; token_53->lexeme, token_53->lexeme
	movq	%r12, %r9	 ; now_scope,
	movq	%rbp, %r8	 ; type,
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:386:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movq	%rax, %rbx	 ; tmp154, name
 ; D:/TC/src/parser.c:386:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:/TC/src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_59->type
	je	.L32	 ;,
.L34:
 ; D:/TC/src/parser.c:385:     Expression* value = NULL;
	xorl	%esi, %esi	 ; value
.L33:
 ; D:/TC/src/parser.c:396: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/parser.c:395:     return create_variable(type, name, value);
	movq	%rsi, %r8	 ; value,
	movq	%rbx, %rdx	 ; name,
	movq	%rbp, %rcx	 ; type,
 ; D:/TC/src/parser.c:396: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
 ; D:/TC/src/parser.c:395:     return create_variable(type, name, value);
	jmp	create_variable	 ;
	.p2align 4,,10
	.p2align 3
.L56:
 ; D:/TC/src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_41(D)->source_file, parser_41(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC5(%rip), %rcx	 ;, tmp133
 ; D:/TC/src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp153
 ; D:/TC/src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	cmpb	$0, 10(%rdi)	 ;, parser_41(D)->in_class
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movl	$3, %edx	 ;, iftmp.25_29
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	je	.L31	 ;,
	jmp	.L57	 ;
	.p2align 4,,10
	.p2align 3
.L27:
 ; D:/TC/src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_41(D)->source_file, parser_41(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC2(%rip), %rcx	 ;, tmp121
 ; D:/TC/src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp147
 ; D:/TC/src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:396: }
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
.L55:
 ; D:/TC/src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_41(D)->source_file, parser_41(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC3(%rip), %rcx	 ;, tmp129
 ; D:/TC/src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp150
 ; D:/TC/src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L29	 ;
	.p2align 4,,10
	.p2align 3
.L32:
 ; D:/TC/src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx	 ;, tmp135
	movq	(%rax), %rcx	 ; token_59->lexeme, token_59->lexeme
	movq	(%rdx), %rdx	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	 ; tmp156
	je	.L34	 ;,
 ; D:/TC/src/parser.c:388:         token = get_next_token(lexer, true);  // consume '='
	movq	%rsi, %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:389:         token = get_next_token(lexer, true);
	movq	%rsi, %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:390:         value = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %rcx	 ; lexer,
	movq	%rdi, %r8	 ; parser,
	movq	%r12, %rdx	 ; now_scope,
 ; D:/TC/src/parser.c:389:         token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp157, token
 ; D:/TC/src/parser.c:390:         value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rsi	 ; tmp158, value
 ; D:/TC/src/parser.c:391:         if (value == NULL)
	testq	%rax, %rax	 ; value
	jne	.L33	 ;,
 ; D:/TC/src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_41(D)->source_file, parser_41(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC6(%rip), %rcx	 ;, tmp139
 ; D:/TC/src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp159
 ; D:/TC/src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L33	 ;
	.p2align 4,,10
	.p2align 3
.L28:
 ; D:/TC/src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_41(D)->source_file, parser_41(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC4(%rip), %rcx	 ;, tmp131
 ; D:/TC/src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp151
 ; D:/TC/src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
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
	movq	%rdx, %rbp	 ; tmp315, now_scope
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp316, parser
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp314, lexer
	subq	$88, %rsp	 ;,
 ; D:/TC/src/parser.c:699:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rsi	 ; tmp317, token
 ; D:/TC/src/parser.c:705:     if (token->type == INTEGER) {
	movl	24(%rax), %eax	 ; token_62->type, _1
 ; D:/TC/src/parser.c:705:     if (token->type == INTEGER) {
	cmpl	$2, %eax	 ;, _1
	je	.L180	 ;,
 ; D:/TC/src/parser.c:708:     } else if (token->type == FLOAT) {
	cmpl	$3, %eax	 ;, _1
	je	.L181	 ;,
 ; D:/TC/src/parser.c:711:     } else if (token->type == STRING) {
	cmpl	$4, %eax	 ;, _1
	je	.L182	 ;,
 ; D:/TC/src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _1
	je	.L183	 ;,
.L63:
 ; D:/TC/src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _1
	je	.L67	 ;,
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$1, %eax	 ;, _1
	je	.L69	 ;,
.L70:
 ; D:/TC/src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC22(%rip), %rcx	 ;, tmp305
 ; D:/TC/src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp379
 ; D:/TC/src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:727:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L58	 ;
	.p2align 4,,10
	.p2align 3
.L181:
 ; D:/TC/src/parser.c:710:         str_value = token->lexeme;
	movq	(%rsi), %rdx	 ; token_62->lexeme, str_value
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:/TC/src/parser.c:709:         type = PRIM_FLOAT;
	movl	$1, %ebx	 ;, type
.L60:
 ; D:/TC/src/parser.c:767:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%r10, 32(%rsp)	 ; variable_value,
	movl	%ebx, %ecx	 ; type,
	call	create_primary	 ;
.L58:
 ; D:/TC/src/parser.c:768: }
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
.L180:
 ; D:/TC/src/parser.c:707:         str_value = token->lexeme;
	movq	(%rsi), %rdx	 ; token_62->lexeme, str_value
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:/TC/src/parser.c:706:         type = PRIM_INTEGER;
	xorl	%ebx, %ebx	 ; type
	jmp	.L60	 ;
	.p2align 4,,10
	.p2align 3
.L182:
 ; D:/TC/src/parser.c:713:         str_value = token->lexeme;
	movq	(%rsi), %rdx	 ; token_62->lexeme, str_value
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:/TC/src/parser.c:712:         type = PRIM_STRING;
	movl	$2, %ebx	 ;, type
	jmp	.L60	 ;
	.p2align 4,,10
	.p2align 3
.L183:
 ; D:/TC/src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	movq	.refptr.TRUE_KEYWORD(%rip), %rax	 ;, tmp218
	movq	(%rsi), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%rax), %rdx	 ; TRUE_KEYWORD, TRUE_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	 ; tmp318
	jne	.L184	 ;,
 ; D:/TC/src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movl	24(%rsi), %eax	 ; token_62->type, _6
 ; D:/TC/src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _6
	jne	.L63	 ;,
 ; D:/TC/src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movq	.refptr.FALSE_KEYWORD(%rip), %rax	 ;, tmp221
	movq	(%rsi), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%rax), %rdx	 ; FALSE_KEYWORD, FALSE_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	 ; tmp319
	jne	.L66	 ;,
 ; D:/TC/src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movl	24(%rsi), %eax	 ; token_62->type, pretmp_53
 ; D:/TC/src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, pretmp_53
	jne	.L78	 ;,
	.p2align 4,,10
	.p2align 3
.L67:
 ; D:/TC/src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r11	 ;, tmp307
	movq	(%rsi), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%r11), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp320
	jne	.L185	 ;,
 ; D:/TC/src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movl	24(%rsi), %eax	 ; token_62->type, pretmp_53
 ; D:/TC/src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	cmpl	$5, %eax	 ;, pretmp_53
	jne	.L78	 ;,
 ; D:/TC/src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp234
	movq	(%rsi), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%rax), %rdx	 ; NOT_SYMBOL, NOT_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	 ; tmp327
	jne	.L186	 ;,
 ; D:/TC/src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movl	24(%rsi), %eax	 ; token_62->type, pretmp_53
 ; D:/TC/src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	cmpl	$5, %eax	 ;, pretmp_53
	jne	.L78	 ;,
 ; D:/TC/src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp238
	movq	(%rsi), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%rax), %rdx	 ; SUB_SYMBOL, SUB_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	 ; tmp331
	jne	.L79	 ;,
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movl	24(%rsi), %eax	 ; token_62->type, pretmp_53
.L78:
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$1, %eax	 ;, pretmp_53
	je	.L69	 ;,
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$6, %eax	 ;, pretmp_53
	jne	.L70	 ;,
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp242
	movq	(%rsi), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	testb	%al, %al	 ; tmp336
	je	.L70	 ;,
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpb	$0, 9(%rdi)	 ;, parser_71(D)->in_method
	je	.L70	 ;,
.L69:
 ; D:/TC/src/parser.c:771:     Token* token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %r12	 ; tmp335, token
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movl	24(%rax), %eax	 ; token_107->type, _108
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	 ;, _108
	je	.L82	 ;,
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	 ;, _108
	jne	.L85	 ;,
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp247
	movq	(%r12), %rcx	 ; token_107->lexeme, token_107->lexeme
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	 ; tmp338
	je	.L85	 ;,
.L82:
 ; D:/TC/src/parser.c:780:     base_name = search_name(now_scope, token->lexeme);
	movq	(%r12), %rdx	 ; token_107->lexeme, token_107->lexeme
	movq	%rbp, %rcx	 ; now_scope,
	call	search_name	 ;
 ; D:/TC/src/parser.c:781:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	$0, 32(%rsp)	 ;,
	movq	%rax, %r8	 ; base_name,
 ; D:/TC/src/parser.c:780:     base_name = search_name(now_scope, token->lexeme);
	movq	%rax, %r15	 ; tmp339, base_name
 ; D:/TC/src/parser.c:781:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:782:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:781:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	movq	%rax, 56(%rsp)	 ; variable_value, %sfp
 ; D:/TC/src/parser.c:782:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:/TC/src/parser.c:783:     while (token->type == SYMBOL) {
	movq	56(%rsp), %r10	 ; %sfp, variable_value
	cmpl	$5, 24(%rax)	 ;, token_117->type
 ; D:/TC/src/parser.c:782:     token = peek_next_token(lexer, true);
	movq	%rax, %r14	 ; tmp341, token
 ; D:/TC/src/parser.c:783:     while (token->type == SYMBOL) {
	jne	.L86	 ;,
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r11	 ;, tmp307
 ; D:/TC/src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	%r10, 64(%rsp)	 ; variable_value, %sfp
 ; D:/TC/src/parser.c:777:     Symbol* current_type = NULL;
	xorl	%r12d, %r12d	 ; class_name
 ; D:/TC/src/parser.c:779:     SymbolTable* var_scope = NULL;
	xorl	%r13d, %r13d	 ; var_scope
 ; D:/TC/src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	%rsi, 56(%rsp)	 ; token, %sfp
	movq	%r15, %rsi	 ; base_name, base_name
	movq	%r11, 72(%rsp)	 ; tmp307, %sfp
.L112:
 ; D:/TC/src/parser.c:784:         if (base_name != NULL) {
	testq	%rsi, %rsi	 ; base_name
	je	.L87	 ;,
 ; D:/TC/src/parser.c:786:             if (base_name->type != NULL)  // subroutine or variable or attribute or parameter
	movq	(%rsi), %r12	 ; base_name_220->type, class_name
 ; D:/TC/src/parser.c:785:             current_type = base_name;     // class or type
	testq	%r12, %r12	 ; class_name
	cmove	%rsi, %r12	 ; class_name,, base_name, class_name
.L87:
 ; D:/TC/src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	testq	%r13, %r13	 ; var_scope
	jne	.L88	 ;,
	testq	%r12, %r12	 ; class_name
	je	.L88	 ;,
 ; D:/TC/src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	movl	32(%r12), %r8d	 ; current_type_122->kind,
	testl	%r8d, %r8d	 ;
	jne	.L88	 ;,
 ; D:/TC/src/parser.c:790:             var_scope = current_type->ast_node.class->class_scope;
	movq	24(%r12), %rax	 ; current_type_122->ast_node.class, current_type_122->ast_node.class
	movq	16(%rax), %r13	 ; _126->class_scope, var_scope
.L88:
 ; D:/TC/src/parser.c:791:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	72(%rsp), %rax	 ; %sfp, tmp307
	movq	(%r14), %rcx	 ; token_237->lexeme, token_237->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:791:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp342
	jne	.L187	 ;,
 ; D:/TC/src/parser.c:824:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp403
	movq	(%r14), %rcx	 ; token_237->lexeme, token_237->lexeme
	movq	(%rax), %rdx	 ; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:824:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp360
	je	.L103	 ;,
 ; D:/TC/src/parser.c:825:             token = get_next_token(lexer, true);  // consume '['
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:826:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:827:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:826:             token = get_next_token(lexer, true);
	movq	%rax, %r15	 ; tmp361, token
 ; D:/TC/src/parser.c:827:             Expression* index = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %r14	 ; tmp362, index
 ; D:/TC/src/parser.c:828:             if (index == NULL)
	testq	%rax, %rax	 ; index
	je	.L188	 ;,
.L104:
 ; D:/TC/src/parser.c:830:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_186->type
 ; D:/TC/src/parser.c:830:             token = get_next_token(lexer, true);
	movq	%rax, %r15	 ; tmp364, token
 ; D:/TC/src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	jne	.L106	 ;,
 ; D:/TC/src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp404
	movq	(%r15), %rcx	 ; token_186->lexeme, token_186->lexeme
	movq	(%rax), %rdx	 ; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp366
	je	.L106	 ;,
 ; D:/TC/src/parser.c:836:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movq	64(%rsp), %rdx	 ; %sfp,
	movq	%r14, %r9	 ; index,
	xorl	%r8d, %r8d	 ;
	movl	$3, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_variable_access	 ;
	movq	%rax, 64(%rsp)	 ; tmp367, %sfp
.L102:
 ; D:/TC/src/parser.c:872:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:/TC/src/parser.c:783:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_223->type
 ; D:/TC/src/parser.c:872:         token = peek_next_token(lexer, true);
	movq	%rax, %r14	 ; tmp377, token
 ; D:/TC/src/parser.c:783:     while (token->type == SYMBOL) {
	je	.L112	 ;,
.L174:
	movq	56(%rsp), %rsi	 ; %sfp, token
	movq	64(%rsp), %r10	 ; %sfp, variable_value
.L86:
 ; D:/TC/src/parser.c:756:         if (variable_value == NULL) {
	testq	%r10, %r10	 ; variable_value
	je	.L84	 ;,
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:/TC/src/parser.c:701:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:/TC/src/parser.c:754:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %ebx	 ;, type
	jmp	.L60	 ;
	.p2align 4,,10
	.p2align 3
.L103:
 ; D:/TC/src/parser.c:837:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp405
	movq	(%r14), %rcx	 ; token_237->lexeme, token_237->lexeme
	movq	(%rax), %rdx	 ; DOT_SYMBOL, DOT_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:837:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	 ; tmp368
	je	.L174	 ;,
 ; D:/TC/src/parser.c:838:             token = get_next_token(lexer, true);  // consume '.'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:839:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r14	 ; tmp369, token
 ; D:/TC/src/parser.c:840:             if (var_scope == NULL) {
	testq	%r13, %r13	 ; var_scope
	je	.L189	 ;,
 ; D:/TC/src/parser.c:845:             if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_198->type
	jne	.L190	 ;,
 ; D:/TC/src/parser.c:850:             base_name = search_name(var_scope, token->lexeme);
	movq	(%rax), %rdx	 ; token_198->lexeme, token_198->lexeme
	movq	%r13, %rcx	 ; var_scope,
	call	search_name	 ;
	movq	%rax, %rsi	 ; tmp372, base_name
 ; D:/TC/src/parser.c:851:             if (base_name == NULL) {
	testq	%rax, %rax	 ; base_name
	je	.L191	 ;,
.L109:
 ; D:/TC/src/parser.c:867:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	64(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	movq	%rsi, %r8	 ; base_name,
	movl	$2, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
 ; D:/TC/src/parser.c:869:             var_scope = NULL;
	xorl	%r13d, %r13d	 ; var_scope
 ; D:/TC/src/parser.c:868:             current_type = NULL;
	xorl	%r12d, %r12d	 ; class_name
 ; D:/TC/src/parser.c:867:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	call	create_variable_access	 ;
	movq	%rax, 64(%rsp)	 ; tmp376, %sfp
	jmp	.L102	 ;
	.p2align 4,,10
	.p2align 3
.L187:
 ; D:/TC/src/parser.c:792:             token = get_next_token(lexer, true);  // consume '('
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp343, token
 ; D:/TC/src/parser.c:793:             if (base_name == NULL)
	testq	%rsi, %rsi	 ; base_name
	je	.L192	 ;,
 ; D:/TC/src/parser.c:795:             else if (base_name->kind == SYMBOL_CLASS) {
	movl	32(%rsi), %eax	 ; base_name_220->kind, _135
 ; D:/TC/src/parser.c:795:             else if (base_name->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	 ; _135
	je	.L193	 ;,
.L92:
 ; D:/TC/src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	subl	$1, %eax	 ;, tmp265
	cmpl	$1, %eax	 ;, tmp265
	ja	.L194	 ;,
.L91:
 ; D:/TC/src/parser.c:802:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp349, token
 ; D:/TC/src/parser.c:803:             list(Expression*) args = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r12	 ;, tmp308
 ; D:/TC/src/parser.c:803:             list(Expression*) args = create_list();
	movq	%rax, %r13	 ; tmp350, args
	.p2align 4,,10
	.p2align 3
.L95:
 ; D:/TC/src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r15)	 ;, token_154->type
	je	.L195	 ;,
.L101:
 ; D:/TC/src/parser.c:805:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %r14	 ; tmp351, arg
 ; D:/TC/src/parser.c:806:                 if (arg == NULL)
	testq	%rax, %rax	 ; arg
	je	.L196	 ;,
.L96:
 ; D:/TC/src/parser.c:808:                 list_append(args, (pointer)arg);
	movq	%r14, %rdx	 ; arg,
	movq	%r13, %rcx	 ; args,
	call	list_append	 ;
 ; D:/TC/src/parser.c:809:                 token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_155->type
 ; D:/TC/src/parser.c:809:                 token = get_next_token(lexer, true);
	movq	%rax, %r15	 ; tmp353, token
 ; D:/TC/src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	je	.L97	 ;,
.L100:
 ; D:/TC/src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	movq	56(%rsp), %rsi	 ; %sfp, token
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC15(%rip), %rcx	 ;, tmp271
 ; D:/TC/src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp354
 ; D:/TC/src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L84:
 ; D:/TC/src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC21(%rip), %rcx	 ;, tmp303
 ; D:/TC/src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp378
 ; D:/TC/src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:727:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L58	 ;
	.p2align 4,,10
	.p2align 3
.L195:
 ; D:/TC/src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%r15), %rcx	 ; token_154->lexeme, token_154->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp358
	je	.L101	 ;,
 ; D:/TC/src/parser.c:818:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%r13, 32(%rsp)	 ; args,
	movq	64(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:819:             base_name = base_name->type;
	movq	(%rsi), %rsi	 ; base_name_174->type, base_name
 ; D:/TC/src/parser.c:818:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%rax, 64(%rsp)	 ; tmp359, %sfp
 ; D:/TC/src/parser.c:822:             if (base_name->kind == SYMBOL_CLASS)
	movl	32(%rsi), %ecx	 ; base_name_175->kind,
	testl	%ecx, %ecx	 ;
	jne	.L116	 ;,
 ; D:/TC/src/parser.c:823:                 var_scope = base_name->ast_node.class->class_scope;
	movq	24(%rsi), %rax	 ; base_name_175->ast_node.class, base_name_175->ast_node.class
 ; D:/TC/src/parser.c:820:             current_type = NULL;
	xorl	%r12d, %r12d	 ; class_name
 ; D:/TC/src/parser.c:823:                 var_scope = base_name->ast_node.class->class_scope;
	movq	16(%rax), %r13	 ; _177->class_scope, var_scope
	jmp	.L102	 ;
	.p2align 4,,10
	.p2align 3
.L97:
 ; D:/TC/src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp402
	movq	(%r15), %rcx	 ; token_155->lexeme, token_155->lexeme
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	testb	%al, %al	 ; tmp355
	jne	.L197	 ;,
 ; D:/TC/src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r15)	 ;, token_155->type
	jne	.L100	 ;,
 ; D:/TC/src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%r15), %rcx	 ; token_155->lexeme, token_155->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp357
	jne	.L95	 ;,
	jmp	.L100	 ;
	.p2align 4,,10
	.p2align 3
.L196:
 ; D:/TC/src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC14(%rip), %rcx	 ;, tmp269
 ; D:/TC/src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp352
 ; D:/TC/src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L96	 ;
	.p2align 4,,10
	.p2align 3
.L197:
 ; D:/TC/src/parser.c:811:                     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp356, token
 ; D:/TC/src/parser.c:811:                     token = get_next_token(lexer, true);
	jmp	.L95	 ;
	.p2align 4,,10
	.p2align 3
.L191:
 ; D:/TC/src/parser.c:853:                 if (current_type != NULL) {
	testq	%r12, %r12	 ; class_name
	je	.L110	 ;,
 ; D:/TC/src/parser.c:854:                     if (current_type->kind == SYMBOL_CLASS)
	movl	32(%r12), %edx	 ; current_type_122->kind,
	testl	%edx, %edx	 ;
	je	.L178	 ;,
 ; D:/TC/src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	movq	(%r12), %r12	 ; current_type_122->type, class_name
 ; D:/TC/src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	testq	%r12, %r12	 ; class_name
	je	.L110	 ;,
 ; D:/TC/src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	movl	32(%r12), %eax	 ; _211->kind,
	testl	%eax, %eax	 ;
	je	.L178	 ;,
 ; D:/TC/src/parser.c:852:                 string class_name = NULL;
	xorl	%r12d, %r12d	 ; class_name
	.p2align 4,,10
	.p2align 3
.L110:
 ; D:/TC/src/parser.c:859:                 string name = make_method_name(class_name, token->lexeme);
	movq	(%r14), %rdx	 ; token_198->lexeme, token_198->lexeme
	movq	%r12, %rcx	 ; class_name,
	call	make_method_name	 ;
 ; D:/TC/src/parser.c:860:                 base_name = search_name_use_strcmp(var_scope, name);
	movq	%r13, %rcx	 ; var_scope,
 ; D:/TC/src/parser.c:859:                 string name = make_method_name(class_name, token->lexeme);
	movq	%rax, %rdx	 ; tmp373, name
 ; D:/TC/src/parser.c:860:                 base_name = search_name_use_strcmp(var_scope, name);
	call	search_name_use_strcmp	 ;
	movq	%rax, %rsi	 ; tmp374, base_name
 ; D:/TC/src/parser.c:862:             if (base_name == NULL) {
	testq	%rax, %rax	 ; base_name
	jne	.L109	 ;,
 ; D:/TC/src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	movq	56(%rsp), %rsi	 ; %sfp, token
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC20(%rip), %rcx	 ;, tmp301
 ; D:/TC/src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp375
 ; D:/TC/src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L84	 ;
	.p2align 4,,10
	.p2align 3
.L184:
 ; D:/TC/src/parser.c:716:         str_value = token->lexeme;
	movq	(%rsi), %rdx	 ; token_62->lexeme, str_value
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:/TC/src/parser.c:715:         type = PRIM_TRUE;
	movl	$3, %ebx	 ;, type
 ; D:/TC/src/parser.c:716:         str_value = token->lexeme;
	jmp	.L60	 ;
	.p2align 4,,10
	.p2align 3
.L66:
 ; D:/TC/src/parser.c:719:         str_value = token->lexeme;
	movq	(%rsi), %rdx	 ; token_62->lexeme, str_value
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:/TC/src/parser.c:718:         type = PRIM_FALSE;
	movl	$4, %ebx	 ;, type
 ; D:/TC/src/parser.c:719:         str_value = token->lexeme;
	jmp	.L60	 ;
	.p2align 4,,10
	.p2align 3
.L194:
 ; D:/TC/src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC13(%rip), %rcx	 ;, tmp267
 ; D:/TC/src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp348
 ; D:/TC/src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L91	 ;
	.p2align 4,,10
	.p2align 3
.L193:
 ; D:/TC/src/parser.c:796:                 string name = make_method_name(base_name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp261
	movq	8(%rsi), %rcx	 ; base_name_220->name, base_name_220->name
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp345, name
 ; D:/TC/src/parser.c:797:                 base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
	movq	24(%rsi), %rax	 ; base_name_220->ast_node.class, base_name_220->ast_node.class
	movq	16(%rax), %rcx	 ; _139->class_scope, _140
	call	search_name_use_strcmp	 ;
 ; D:/TC/src/parser.c:798:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	64(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	movq	$0, 32(%rsp)	 ;,
	movq	%rax, %r8	 ; base_name,
	movl	$2, %ecx	 ;,
 ; D:/TC/src/parser.c:797:                 base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
	movq	%rax, %rsi	 ; tmp346, base_name
 ; D:/TC/src/parser.c:798:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	call	create_variable_access	 ;
	movq	%rax, 64(%rsp)	 ; tmp347, %sfp
 ; D:/TC/src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	testq	%rsi, %rsi	 ; base_name
	je	.L91	 ;,
 ; D:/TC/src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	movl	32(%rsi), %eax	 ; base_name_141->kind, _135
	jmp	.L92	 ;
	.p2align 4,,10
	.p2align 3
.L85:
 ; D:/TC/src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC11(%rip), %rcx	 ;, tmp246
 ; D:/TC/src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp337
 ; D:/TC/src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L84	 ;
	.p2align 4,,10
	.p2align 3
.L178:
 ; D:/TC/src/parser.c:857:                         class_name = current_type->type->name;
	movq	8(%r12), %r12	 ;, class_name
	jmp	.L110	 ;
	.p2align 4,,10
	.p2align 3
.L188:
 ; D:/TC/src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC16(%rip), %rcx	 ;, tmp286
 ; D:/TC/src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp363
 ; D:/TC/src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L104	 ;
	.p2align 4,,10
	.p2align 3
.L185:
 ; D:/TC/src/parser.c:722:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:723:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:722:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp321, token
 ; D:/TC/src/parser.c:723:         expr_value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
 ; D:/TC/src/parser.c:724:         if (expr_value == NULL) {
	testq	%rax, %rax	 ; expr_value
	je	.L198	 ;,
 ; D:/TC/src/parser.c:729:         token = get_next_token(lexer, true);
	movq	%rbx, %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	movq	%rax, 56(%rsp)	 ; expr_value, %sfp
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	56(%rsp), %r8	 ; %sfp, expr_value
 ; D:/TC/src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %ebx	 ; token_75->type, type
 ; D:/TC/src/parser.c:729:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp324, token
 ; D:/TC/src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %ebx	 ;, type
	jne	.L76	 ;,
 ; D:/TC/src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp231
	movq	(%rsi), %rcx	 ; token_75->lexeme, token_75->lexeme
	movq	%r8, 56(%rsp)	 ; expr_value, %sfp
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp326
	je	.L76	 ;,
	movq	56(%rsp), %r8	 ; %sfp, expr_value
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:/TC/src/parser.c:701:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
	jmp	.L60	 ;
	.p2align 4,,10
	.p2align 3
.L186:
 ; D:/TC/src/parser.c:737:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:738:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:737:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp328, token
 ; D:/TC/src/parser.c:738:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp329, prim_value
 ; D:/TC/src/parser.c:739:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	je	.L199	 ;,
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:/TC/src/parser.c:701:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:/TC/src/parser.c:736:         type = PRIM_NOT_OPERAND;
	movl	$6, %ebx	 ;, type
	jmp	.L60	 ;
	.p2align 4,,10
	.p2align 3
.L79:
 ; D:/TC/src/parser.c:746:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:747:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:746:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp332, token
 ; D:/TC/src/parser.c:747:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp333, prim_value
 ; D:/TC/src/parser.c:748:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	je	.L200	 ;,
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:/TC/src/parser.c:701:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:/TC/src/parser.c:745:         type = PRIM_NEG_OPERAND;
	movl	$7, %ebx	 ;, type
	jmp	.L60	 ;
	.p2align 4,,10
	.p2align 3
.L192:
 ; D:/TC/src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC12(%rip), %rcx	 ;, tmp260
 ; D:/TC/src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp344
 ; D:/TC/src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L91	 ;
.L76:
 ; D:/TC/src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC8(%rip), %rcx	 ;, tmp230
 ; D:/TC/src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp325
 ; D:/TC/src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:727:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L58	 ;
.L116:
 ; D:/TC/src/parser.c:821:             var_scope = NULL;
	xorl	%r13d, %r13d	 ; var_scope
 ; D:/TC/src/parser.c:820:             current_type = NULL;
	xorl	%r12d, %r12d	 ; class_name
	jmp	.L102	 ;
.L106:
 ; D:/TC/src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	movq	56(%rsp), %rsi	 ; %sfp, token
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC17(%rip), %rcx	 ;, tmp288
 ; D:/TC/src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp365
 ; D:/TC/src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L84	 ;
.L189:
 ; D:/TC/src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	movq	56(%rsp), %rsi	 ; %sfp, token
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC18(%rip), %rcx	 ;, tmp296
 ; D:/TC/src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp370
 ; D:/TC/src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L84	 ;
.L190:
 ; D:/TC/src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	movq	56(%rsp), %rsi	 ; %sfp, token
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC19(%rip), %rcx	 ;, tmp298
 ; D:/TC/src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp371
 ; D:/TC/src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L84	 ;
.L198:
 ; D:/TC/src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC7(%rip), %rcx	 ;, tmp228
 ; D:/TC/src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp323
 ; D:/TC/src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:727:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L58	 ;
.L199:
 ; D:/TC/src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC9(%rip), %rcx	 ;, tmp237
 ; D:/TC/src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp330
 ; D:/TC/src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:727:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L58	 ;
.L200:
 ; D:/TC/src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC10(%rip), %rcx	 ;, tmp241
 ; D:/TC/src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp334
 ; D:/TC/src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:727:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L58	 ;
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
 ; D:/TC/src/parser.c:400:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
 ; D:/TC/src/parser.c:402:     if (token->type == KEYWORD) {
	cmpl	$6, 24(%rax)	 ;, token_60->type
	je	.L373	 ;,
.L202:
 ; D:/TC/src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
 ; D:/TC/src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	$0, 40(%rsp)	 ;,
	xorl	%ecx, %ecx	 ;
	movq	%rax, 32(%rsp)	 ; tmp636,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp637, <retval>
.L280:
 ; D:/TC/src/parser.c:437:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %rdi	 ; tmp638, token
 ; D:/TC/src/parser.c:438:     if (statement == NULL)
	testq	%rbp, %rbp	 ; <retval>
	je	.L374	 ;,
.L288:
 ; D:/TC/src/parser.c:440:     token = get_next_token(lexer, true);
	movq	%rbx, %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_110->type
 ; D:/TC/src/parser.c:440:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp640, token
 ; D:/TC/src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	je	.L289	 ;,
.L291:
 ; D:/TC/src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC52(%rip), %rcx	 ;, tmp485
 ; D:/TC/src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp641
 ; D:/TC/src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L201:
 ; D:/TC/src/parser.c:445: }
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
.L289:
 ; D:/TC/src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp486
	movq	(%rbx), %rcx	 ; token_110->lexeme, token_110->lexeme
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp642
	je	.L291	 ;,
	jmp	.L201	 ;
	.p2align 4,,10
	.p2align 3
.L373:
	movq	%rax, %rbp	 ; tmp507, token
 ; D:/TC/src/parser.c:403:         if (string_equal(token->lexeme, IF_KEYWORD))
	movq	.refptr.IF_KEYWORD(%rip), %rax	 ;, tmp332
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; IF_KEYWORD, IF_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/parser.c:403:         if (string_equal(token->lexeme, IF_KEYWORD))
	testb	%al, %al	 ; tmp508
	jne	.L375	 ;,
 ; D:/TC/src/parser.c:405:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	movq	.refptr.FOR_KEYWORD(%rip), %rax	 ;, tmp391
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; FOR_KEYWORD, FOR_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/parser.c:405:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	testb	%al, %al	 ; tmp562
	jne	.L376	 ;,
 ; D:/TC/src/parser.c:407:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	movq	.refptr.WHILE_KEYWORD(%rip), %rax	 ;, tmp439
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; WHILE_KEYWORD, WHILE_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/parser.c:407:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	testb	%al, %al	 ; tmp598
	jne	.L377	 ;,
 ; D:/TC/src/parser.c:409:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp464
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/parser.c:409:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; tmp619
	jne	.L378	 ;,
 ; D:/TC/src/parser.c:412:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	movq	.refptr.RETURN_KEYWORD(%rip), %rax	 ;, tmp467
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; RETURN_KEYWORD, RETURN_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/parser.c:412:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	 ; tmp622
	je	.L281	 ;,
 ; D:/TC/src/parser.c:413:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_85->type
	je	.L379	 ;,
.L282:
 ; D:/TC/src/parser.c:418:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
 ; D:/TC/src/parser.c:418:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	$0, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	movq	%rax, 32(%rsp)	 ; tmp626,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp627, <retval>
	jmp	.L280	 ;
	.p2align 4,,10
	.p2align 3
.L376:
 ; D:/TC/src/parser.c:543:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_223->type
 ; D:/TC/src/parser.c:543:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp563, token
 ; D:/TC/src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L238	 ;,
 ; D:/TC/src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp396
	movq	0(%rbp), %rcx	 ; token_223->lexeme, token_223->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp565
	je	.L238	 ;,
 ; D:/TC/src/parser.c:549:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_230->type
 ; D:/TC/src/parser.c:549:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp566, token
 ; D:/TC/src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	je	.L239	 ;,
.L242:
 ; D:/TC/src/parser.c:552:         initializer = parse_variable(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
	movq	%rax, %r12	 ; tmp567, initializer
 ; D:/TC/src/parser.c:553:         if (initializer == NULL)
	testq	%rax, %rax	 ; initializer
	je	.L380	 ;,
.L241:
 ; D:/TC/src/parser.c:555:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp570, token
.L243:
 ; D:/TC/src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_239->type
	jne	.L246	 ;,
 ; D:/TC/src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r14	 ;, tmp493
	movq	0(%rbp), %rcx	 ; token_239->lexeme, token_239->lexeme
	movq	(%r14), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp572
	je	.L246	 ;,
 ; D:/TC/src/parser.c:562:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_246->type
 ; D:/TC/src/parser.c:562:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp573, token
 ; D:/TC/src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	je	.L247	 ;,
.L250:
 ; D:/TC/src/parser.c:565:         condition = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %r13	 ; tmp574, condition
 ; D:/TC/src/parser.c:566:         if (condition == NULL)
	testq	%rax, %rax	 ; condition
	je	.L381	 ;,
.L249:
 ; D:/TC/src/parser.c:568:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp577, token
.L251:
 ; D:/TC/src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_255->type
	jne	.L253	 ;,
 ; D:/TC/src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r14), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	0(%rbp), %rcx	 ; token_255->lexeme, token_255->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp579
	je	.L253	 ;,
 ; D:/TC/src/parser.c:575:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_262->type
 ; D:/TC/src/parser.c:575:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp580, token
 ; D:/TC/src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L254	 ;,
.L257:
 ; D:/TC/src/parser.c:578:         increment = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, 56(%rsp)	 ; increment, %sfp
 ; D:/TC/src/parser.c:579:         if (increment == NULL)
	testq	%rax, %rax	 ; increment
	je	.L382	 ;,
.L256:
 ; D:/TC/src/parser.c:581:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp584, token
.L258:
 ; D:/TC/src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_271->type
	jne	.L260	 ;,
 ; D:/TC/src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp426
	movq	0(%rbp), %rcx	 ; token_271->lexeme, token_271->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp586
	je	.L260	 ;,
 ; D:/TC/src/parser.c:588:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_278->type
 ; D:/TC/src/parser.c:588:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp587, token
 ; D:/TC/src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L262	 ;,
 ; D:/TC/src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp431
	movq	0(%rbp), %rcx	 ; token_278->lexeme, token_278->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp589
	je	.L262	 ;,
 ; D:/TC/src/parser.c:594:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:595:     parser->in_loop = true;
	movb	$1, 11(%rsi)	 ;, parser_62(D)->in_loop
 ; D:/TC/src/parser.c:596:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:594:     list(Statement*) body = create_list();
	movq	%rax, %r15	 ; tmp590, body
 ; D:/TC/src/parser.c:596:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%r12, 64(%rsp)	 ; initializer, %sfp
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14	 ;, tmp491
	movq	%rax, %rbp	 ; tmp591, token
 ; D:/TC/src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L263	 ;
	.p2align 4,,10
	.p2align 3
.L264:
 ; D:/TC/src/parser.c:601:         list_append(body, (pointer)statement);
	movq	%r12, %rdx	 ; statement,
	movq	%r15, %rcx	 ; body,
	call	list_append	 ;
 ; D:/TC/src/parser.c:602:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp594, token
.L263:
 ; D:/TC/src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_290->type
	jne	.L265	 ;,
 ; D:/TC/src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_290->lexeme, token_290->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp595
	jne	.L383	 ;,
.L265:
 ; D:/TC/src/parser.c:598:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp592, statement
 ; D:/TC/src/parser.c:599:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L264	 ;,
 ; D:/TC/src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC43(%rip), %rcx	 ;,
 ; D:/TC/src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp593
 ; D:/TC/src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L264	 ;
	.p2align 4,,10
	.p2align 3
.L374:
 ; D:/TC/src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC51(%rip), %rcx	 ;, tmp483
 ; D:/TC/src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp639
 ; D:/TC/src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L288	 ;
	.p2align 4,,10
	.p2align 3
.L375:
 ; D:/TC/src/parser.c:449:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_114->type
 ; D:/TC/src/parser.c:449:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp509, token
 ; D:/TC/src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L206	 ;,
 ; D:/TC/src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r12	 ;, tmp494
	movq	(%rax), %rcx	 ; token_114->lexeme, token_114->lexeme
	movq	(%r12), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp511
	je	.L206	 ;,
 ; D:/TC/src/parser.c:455:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:456:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:455:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp512, token
 ; D:/TC/src/parser.c:456:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, 72(%rsp)	 ; condition, %sfp
 ; D:/TC/src/parser.c:457:     if (condition == NULL)
	testq	%rax, %rax	 ; condition
	je	.L384	 ;,
.L207:
 ; D:/TC/src/parser.c:459:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_125->type
 ; D:/TC/src/parser.c:459:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp515, token
 ; D:/TC/src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jne	.L209	 ;,
 ; D:/TC/src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp688
	movq	0(%rbp), %rcx	 ; token_125->lexeme, token_125->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp517
	je	.L209	 ;,
 ; D:/TC/src/parser.c:465:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_132->type
 ; D:/TC/src/parser.c:465:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp518, token
 ; D:/TC/src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L211	 ;,
 ; D:/TC/src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp689
	movq	0(%rbp), %rcx	 ; token_132->lexeme, token_132->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp520
	je	.L211	 ;,
 ; D:/TC/src/parser.c:471:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:472:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:471:     list(Statement*) body = create_list();
	movq	%rax, %r15	 ; tmp521, body
 ; D:/TC/src/parser.c:472:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14	 ;, tmp491
	movq	%rax, %rbp	 ; tmp522, token
 ; D:/TC/src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L212	 ;
	.p2align 4,,10
	.p2align 3
.L213:
 ; D:/TC/src/parser.c:477:         list_append(body, (pointer)statement);
	movq	%r13, %rdx	 ; statement,
	movq	%r15, %rcx	 ; body,
	call	list_append	 ;
 ; D:/TC/src/parser.c:478:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp525, token
.L212:
 ; D:/TC/src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_144->type
	jne	.L214	 ;,
 ; D:/TC/src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_144->lexeme, token_144->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp526
	jne	.L385	 ;,
.L214:
 ; D:/TC/src/parser.c:474:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r13	 ; tmp523, statement
 ; D:/TC/src/parser.c:475:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L213	 ;,
 ; D:/TC/src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC27(%rip), %rcx	 ;,
 ; D:/TC/src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp524
 ; D:/TC/src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L213	 ;
	.p2align 4,,10
	.p2align 3
.L206:
 ; D:/TC/src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC23(%rip), %rcx	 ;, tmp336
 ; D:/TC/src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp510
 ; D:/TC/src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L205:
 ; D:/TC/src/parser.c:453:         return NULL;
	xorl	%edx, %edx	 ; _221
.L216:
 ; D:/TC/src/parser.c:404:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$2, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp561, <retval>
 ; D:/TC/src/parser.c:404:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	jmp	.L201	 ;
	.p2align 4,,10
	.p2align 3
.L377:
 ; D:/TC/src/parser.c:611:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_301->type
 ; D:/TC/src/parser.c:611:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp599, token
 ; D:/TC/src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L269	 ;,
 ; D:/TC/src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp444
	movq	0(%rbp), %rcx	 ; token_301->lexeme, token_301->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp601
	je	.L269	 ;,
 ; D:/TC/src/parser.c:617:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:618:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:617:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp602, token
 ; D:/TC/src/parser.c:618:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %r13	 ; tmp603, condition
 ; D:/TC/src/parser.c:619:     if (condition == NULL)
	testq	%rax, %rax	 ; condition
	je	.L386	 ;,
.L270:
 ; D:/TC/src/parser.c:621:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_312->type
 ; D:/TC/src/parser.c:621:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp605, token
 ; D:/TC/src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jne	.L273	 ;,
 ; D:/TC/src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp451
	movq	0(%rbp), %rcx	 ; token_312->lexeme, token_312->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp607
	je	.L273	 ;,
 ; D:/TC/src/parser.c:627:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_319->type
 ; D:/TC/src/parser.c:627:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp608, token
 ; D:/TC/src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L275	 ;,
 ; D:/TC/src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp456
	movq	0(%rbp), %rcx	 ; token_319->lexeme, token_319->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp610
	je	.L275	 ;,
 ; D:/TC/src/parser.c:633:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:634:     parser->in_loop = true;
	movb	$1, 11(%rsi)	 ;, parser_62(D)->in_loop
 ; D:/TC/src/parser.c:635:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:633:     list(Statement*) body = create_list();
	movq	%rax, %r12	 ; tmp611, body
 ; D:/TC/src/parser.c:635:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14	 ;, tmp491
	movq	%rax, %rbp	 ; tmp612, token
 ; D:/TC/src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L276	 ;
	.p2align 4,,10
	.p2align 3
.L277:
 ; D:/TC/src/parser.c:640:         list_append(body, (pointer)statement);
	movq	%r15, %rdx	 ; statement,
	movq	%r12, %rcx	 ; body,
	call	list_append	 ;
 ; D:/TC/src/parser.c:641:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp615, token
.L276:
 ; D:/TC/src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_331->type
	jne	.L278	 ;,
 ; D:/TC/src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_331->lexeme, token_331->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp616
	jne	.L387	 ;,
.L278:
 ; D:/TC/src/parser.c:637:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r15	 ; tmp613, statement
 ; D:/TC/src/parser.c:638:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L277	 ;,
 ; D:/TC/src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC48(%rip), %rcx	 ;,
 ; D:/TC/src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp614
 ; D:/TC/src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L277	 ;
	.p2align 4,,10
	.p2align 3
.L378:
 ; D:/TC/src/parser.c:410:             get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:411:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; D:/TC/src/parser.c:411:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 40(%rsp)	 ; tmp620,
	movl	$1, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp621, <retval>
	jmp	.L280	 ;
	.p2align 4,,10
	.p2align 3
.L209:
 ; D:/TC/src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC25(%rip), %rcx	 ;, tmp343
 ; D:/TC/src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp516
 ; D:/TC/src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:463:         return NULL;
	jmp	.L205	 ;
	.p2align 4,,10
	.p2align 3
.L238:
 ; D:/TC/src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC35(%rip), %rcx	 ;, tmp395
 ; D:/TC/src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp564
 ; D:/TC/src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L237:
 ; D:/TC/src/parser.c:547:         return NULL;
	xorl	%r9d, %r9d	 ; _299
.L245:
 ; D:/TC/src/parser.c:406:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$4, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp597, <retval>
 ; D:/TC/src/parser.c:406:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L201	 ;
	.p2align 4,,10
	.p2align 3
.L269:
 ; D:/TC/src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC44(%rip), %rcx	 ;, tmp443
 ; D:/TC/src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp600
 ; D:/TC/src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L268:
 ; D:/TC/src/parser.c:615:         return NULL;
	xorl	%r8d, %r8d	 ; _337
.L272:
 ; D:/TC/src/parser.c:408:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$3, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp618, <retval>
 ; D:/TC/src/parser.c:408:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	jmp	.L201	 ;
.L384:
 ; D:/TC/src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC24(%rip), %rcx	 ;, tmp341
 ; D:/TC/src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp514
 ; D:/TC/src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L207	 ;
	.p2align 4,,10
	.p2align 3
.L281:
 ; D:/TC/src/parser.c:419:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	movq	.refptr.BREAK_KEYWORD(%rip), %rax	 ;, tmp473
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; BREAK_KEYWORD, BREAK_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/parser.c:419:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	 ; tmp628
	je	.L283	 ;,
 ; D:/TC/src/parser.c:420:             if (!parser->in_loop) {
	cmpb	$0, 11(%rsi)	 ;, parser_62(D)->in_loop
	je	.L388	 ;,
 ; D:/TC/src/parser.c:425:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$6, %ecx	 ;,
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp630, <retval>
	jmp	.L280	 ;
	.p2align 4,,10
	.p2align 3
.L246:
 ; D:/TC/src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC37(%rip), %rcx	 ;, tmp405
 ; D:/TC/src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp571
 ; D:/TC/src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:560:         return NULL;
	jmp	.L237	 ;
.L211:
 ; D:/TC/src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC26(%rip), %rcx	 ;, tmp348
 ; D:/TC/src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp519
 ; D:/TC/src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:469:         return NULL;
	jmp	.L205	 ;
.L385:
 ; D:/TC/src/parser.c:480:     list(ElseIf*) else_if = create_list();
	call	create_list	 ;
	movq	%rax, 64(%rsp)	 ; tmp527, %sfp
 ; D:/TC/src/parser.c:481:     list(Statement*) else_body = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:482:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:481:     list(Statement*) else_body = create_list();
	movq	%rax, 80(%rsp)	 ; tmp528, %sfp
 ; D:/TC/src/parser.c:482:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:/TC/src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_152->type
 ; D:/TC/src/parser.c:482:     token = peek_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp529, token
 ; D:/TC/src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	jne	.L227	 ;,
	movq	%r15, 88(%rsp)	 ; body, %sfp
	.p2align 4,,10
	.p2align 3
.L215:
 ; D:/TC/src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	movq	.refptr.ELIF_KEYWORD(%rip), %rax	 ;, tmp692
	movq	0(%rbp), %rcx	 ; token_54->lexeme, token_54->lexeme
	movq	(%rax), %rdx	 ; ELIF_KEYWORD, ELIF_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	 ; tmp551
	je	.L389	 ;,
 ; D:/TC/src/parser.c:484:         token = get_next_token(lexer, true);  // consume 'elif'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:485:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_153->type
 ; D:/TC/src/parser.c:485:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp531, token
 ; D:/TC/src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L218	 ;,
 ; D:/TC/src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	(%r12), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rax), %rcx	 ; token_153->lexeme, token_153->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp533
	je	.L218	 ;,
 ; D:/TC/src/parser.c:491:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:492:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:491:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp534, token
 ; D:/TC/src/parser.c:492:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %r15	 ; tmp535, elif_condition
 ; D:/TC/src/parser.c:493:         if (elif_condition == NULL)
	testq	%rax, %rax	 ; elif_condition
	je	.L390	 ;,
.L219:
 ; D:/TC/src/parser.c:495:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_165->type
 ; D:/TC/src/parser.c:495:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp537, token
 ; D:/TC/src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jne	.L221	 ;,
 ; D:/TC/src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp690
	movq	0(%rbp), %rcx	 ; token_165->lexeme, token_165->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp539
	je	.L221	 ;,
 ; D:/TC/src/parser.c:501:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_173->type
 ; D:/TC/src/parser.c:501:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp540, token
 ; D:/TC/src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L223	 ;,
 ; D:/TC/src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp691
	movq	0(%rbp), %rcx	 ; token_173->lexeme, token_173->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp542
	je	.L223	 ;,
 ; D:/TC/src/parser.c:507:         list(Statement*) elif_body = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:508:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:507:         list(Statement*) elif_body = create_list();
	movq	%rax, %r13	 ; tmp543, elif_body
 ; D:/TC/src/parser.c:508:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%r15, 56(%rsp)	 ; elif_condition, %sfp
	movq	%rax, %rbp	 ; tmp544, token
 ; D:/TC/src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L224	 ;
	.p2align 4,,10
	.p2align 3
.L225:
 ; D:/TC/src/parser.c:513:             list_append(elif_body, (pointer)statement);
	movq	%r15, %rdx	 ; statement,
	movq	%r13, %rcx	 ; elif_body,
	call	list_append	 ;
 ; D:/TC/src/parser.c:514:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp547, token
.L224:
 ; D:/TC/src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_186->type
	jne	.L226	 ;,
 ; D:/TC/src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_186->lexeme, token_186->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp548
	jne	.L391	 ;,
.L226:
 ; D:/TC/src/parser.c:510:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r15	 ; tmp545, statement
 ; D:/TC/src/parser.c:511:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L225	 ;,
 ; D:/TC/src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC32(%rip), %rcx	 ;,
 ; D:/TC/src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp546
 ; D:/TC/src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L225	 ;
	.p2align 4,,10
	.p2align 3
.L391:
 ; D:/TC/src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	56(%rsp), %r15	 ; %sfp, elif_condition
	movq	%r13, %rdx	 ; elif_body,
	movq	%r15, %rcx	 ; elif_condition,
	call	create_else_if	 ;
 ; D:/TC/src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	64(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%rax, %rdx	 ; tmp549, _192
 ; D:/TC/src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	call	list_append	 ;
 ; D:/TC/src/parser.c:517:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:/TC/src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_193->type
 ; D:/TC/src/parser.c:517:         token = peek_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp550, token
 ; D:/TC/src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	je	.L215	 ;,
	movq	88(%rsp), %r15	 ; %sfp, body
.L227:
 ; D:/TC/src/parser.c:536:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:/TC/src/parser.c:538:     return create_if(condition, body, else_if, else_body);
	movq	80(%rsp), %r9	 ; %sfp,
	movq	64(%rsp), %r8	 ; %sfp,
	movq	%r15, %rdx	 ; body,
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_if	 ;
	movq	%rax, %rdx	 ; tmp530, _221
	jmp	.L216	 ;
	.p2align 4,,10
	.p2align 3
.L390:
 ; D:/TC/src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC29(%rip), %rcx	 ;,
 ; D:/TC/src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp536
 ; D:/TC/src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L219	 ;
.L239:
 ; D:/TC/src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp399
	movq	0(%rbp), %rcx	 ; token_230->lexeme, token_230->lexeme
 ; D:/TC/src/parser.c:550:     Variable* initializer = NULL;
	xorl	%r12d, %r12d	 ; initializer
 ; D:/TC/src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp568
	jne	.L243	 ;,
	jmp	.L242	 ;
.L273:
 ; D:/TC/src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC46(%rip), %rcx	 ;, tmp450
 ; D:/TC/src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp606
 ; D:/TC/src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:625:         return NULL;
	jmp	.L268	 ;
.L253:
 ; D:/TC/src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC39(%rip), %rcx	 ;, tmp415
 ; D:/TC/src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp578
 ; D:/TC/src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:573:         return NULL;
	jmp	.L237	 ;
.L379:
 ; D:/TC/src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rdx	 ;, tmp470
	movq	(%rax), %rcx	 ; token_85->lexeme, token_85->lexeme
	movq	(%rdx), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp624
	je	.L282	 ;,
 ; D:/TC/src/parser.c:416:                 return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$5, %ecx	 ;,
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp625, <retval>
	jmp	.L201	 ;
.L283:
 ; D:/TC/src/parser.c:426:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax	 ;, tmp478
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; CONTINUE_KEYWORD, CONTINUE_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/parser.c:426:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	 ; tmp631
	je	.L202	 ;,
 ; D:/TC/src/parser.c:427:             if (!parser->in_loop) {
	cmpb	$0, 11(%rsi)	 ;, parser_62(D)->in_loop
	je	.L392	 ;,
 ; D:/TC/src/parser.c:432:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$7, %ecx	 ;,
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp633, <retval>
	jmp	.L280	 ;
.L247:
 ; D:/TC/src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r14), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rax), %rcx	 ; token_246->lexeme, token_246->lexeme
 ; D:/TC/src/parser.c:563:     Expression* condition = NULL;
	xorl	%r13d, %r13d	 ; condition
 ; D:/TC/src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	call	string_equal	 ;
 ; D:/TC/src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp575
	jne	.L251	 ;,
	jmp	.L250	 ;
.L275:
 ; D:/TC/src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC47(%rip), %rcx	 ;, tmp455
 ; D:/TC/src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp609
 ; D:/TC/src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:631:         return NULL;
	jmp	.L268	 ;
.L387:
 ; D:/TC/src/parser.c:643:     parser->in_loop = false;
	movb	$0, 11(%rsi)	 ;, parser_62(D)->in_loop
 ; D:/TC/src/parser.c:645:     return create_while(condition, body);
	movq	%r12, %rdx	 ; body,
	movq	%r13, %rcx	 ; condition,
	call	create_while	 ;
	movq	%rax, %r8	 ; tmp617, _337
	jmp	.L272	 ;
.L380:
 ; D:/TC/src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC36(%rip), %rcx	 ;, tmp403
 ; D:/TC/src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp569
 ; D:/TC/src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L241	 ;
.L260:
 ; D:/TC/src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC41(%rip), %rcx	 ;, tmp425
 ; D:/TC/src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp585
 ; D:/TC/src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:586:         return NULL;
	jmp	.L237	 ;
.L386:
 ; D:/TC/src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC45(%rip), %rcx	 ;, tmp448
 ; D:/TC/src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp604
 ; D:/TC/src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L270	 ;
.L218:
 ; D:/TC/src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC28(%rip), %rcx	 ;, tmp358
 ; D:/TC/src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp532
 ; D:/TC/src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:489:             return NULL;
	jmp	.L205	 ;
.L221:
 ; D:/TC/src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC30(%rip), %rcx	 ;, tmp365
 ; D:/TC/src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp538
 ; D:/TC/src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:499:             return NULL;
	jmp	.L205	 ;
.L223:
 ; D:/TC/src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC31(%rip), %rcx	 ;, tmp370
 ; D:/TC/src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp541
 ; D:/TC/src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:505:             return NULL;
	jmp	.L205	 ;
.L254:
 ; D:/TC/src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp419
	movq	0(%rbp), %rcx	 ; token_262->lexeme, token_262->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp582
	je	.L257	 ;,
 ; D:/TC/src/parser.c:576:     Expression* increment = NULL;
	movq	$0, 56(%rsp)	 ;, %sfp
	jmp	.L258	 ;
.L388:
 ; D:/TC/src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC49(%rip), %rcx	 ;, tmp477
 ; D:/TC/src/parser.c:423:                 return NULL;
	xorl	%ebp, %ebp	 ; <retval>
 ; D:/TC/src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp629
 ; D:/TC/src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L201	 ;
.L381:
 ; D:/TC/src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC38(%rip), %rcx	 ;, tmp413
 ; D:/TC/src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp576
 ; D:/TC/src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L249	 ;
.L262:
 ; D:/TC/src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC42(%rip), %rcx	 ;, tmp430
 ; D:/TC/src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp588
 ; D:/TC/src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:592:         return NULL;
	jmp	.L237	 ;
.L383:
 ; D:/TC/src/parser.c:604:     parser->in_loop = false;
	movq	64(%rsp), %r12	 ; %sfp, initializer
	movb	$0, 11(%rsi)	 ;, parser_62(D)->in_loop
 ; D:/TC/src/parser.c:606:     return create_for(initializer, condition, increment, body);
	movq	%r15, %r9	 ; body,
	movq	%r13, %rdx	 ; condition,
	movq	56(%rsp), %r8	 ; %sfp,
	movq	%r12, %rcx	 ; initializer,
	call	create_for	 ;
	movq	%rax, %r9	 ; tmp596, _299
	jmp	.L245	 ;
.L389:
 ; D:/TC/src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, 24(%rbp)	 ;, token_54->type
	movq	88(%rsp), %r15	 ; %sfp, body
	jne	.L227	 ;,
 ; D:/TC/src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	movq	.refptr.ELSE_KEYWORD(%rip), %rax	 ;, tmp382
	movq	0(%rbp), %rcx	 ; token_54->lexeme, token_54->lexeme
	movq	(%rax), %rdx	 ; ELSE_KEYWORD, ELSE_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	 ; tmp552
	je	.L227	 ;,
 ; D:/TC/src/parser.c:520:         token = get_next_token(lexer, true);  // consume 'else'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:521:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_204->type
 ; D:/TC/src/parser.c:521:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp553, token
 ; D:/TC/src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L230	 ;,
 ; D:/TC/src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp693
	movq	0(%rbp), %rcx	 ; token_204->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp555
	je	.L230	 ;,
 ; D:/TC/src/parser.c:527:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	leaq	.LC34(%rip), %r13	 ;, tmp496
 ; D:/TC/src/parser.c:527:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp556, token
 ; D:/TC/src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L231	 ;
	.p2align 4,,10
	.p2align 3
.L232:
 ; D:/TC/src/parser.c:532:             list_append(else_body, (pointer)statement);
	movq	80(%rsp), %rcx	 ; %sfp,
	movq	%r12, %rdx	 ; statement,
	call	list_append	 ;
 ; D:/TC/src/parser.c:533:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp559, token
.L231:
 ; D:/TC/src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_215->type
	jne	.L233	 ;,
 ; D:/TC/src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_215->lexeme, token_215->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp560
	jne	.L227	 ;,
.L233:
 ; D:/TC/src/parser.c:529:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp557, statement
 ; D:/TC/src/parser.c:530:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L232	 ;,
 ; D:/TC/src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	movq	%r13, %rcx	 ; tmp496,
 ; D:/TC/src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp558
 ; D:/TC/src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L232	 ;
.L382:
 ; D:/TC/src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC40(%rip), %rcx	 ;, tmp423
 ; D:/TC/src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp583
 ; D:/TC/src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L256	 ;
.L392:
 ; D:/TC/src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC50(%rip), %rcx	 ;, tmp481
 ; D:/TC/src/parser.c:423:                 return NULL;
	xorl	%ebp, %ebp	 ; <retval>
 ; D:/TC/src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp632
 ; D:/TC/src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L201	 ;
.L230:
 ; D:/TC/src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC33(%rip), %rcx	 ;, tmp385
 ; D:/TC/src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp554
 ; D:/TC/src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:525:             return NULL;
	jmp	.L205	 ;
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
	.ascii "[warning] Unsupported type for class variable '%s': %s\12\0"
	.align 8
.LC87:
	.ascii "Expected ';' after class variable declaration\0"
	.align 8
.LC88:
	.ascii "Unexpected token in class member\0"
	.align 8
.LC89:
	.ascii "Constructor name conflicts with existing member\0"
.LC90:
	.ascii "0\0"
	.align 8
.LC91:
	.ascii "Failed to parse class declaration\0"
	.align 8
.LC92:
	.ascii "Unexpected token in code member\0"
	.text
	.p2align 4
	.globl	parse_code
	.def	parse_code;	.scl	2;	.type	32;	.endef
parse_code:
	pushq	%r15	 ;
	pushq	%r14	 ;
	movq	%rcx, %r14	 ; tmp700, lexer
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp702, parser
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp701, now_scope
	subq	$184, %rsp	 ;,
 ; D:/TC/src/parser.c:24:     if (builtin_scope == NULL) {
	movq	.refptr.builtin_scope(%rip), %rsi	 ;, tmp672
 ; D:/TC/src/parser.c:24:     if (builtin_scope == NULL) {
	cmpq	$0, (%rsi)	 ;, builtin_scope
	je	.L593	 ;,
.L394:
 ; D:/TC/src/parser.c:32:     if (now_scope == NULL)
	testq	%rbx, %rbx	 ; now_scope
	je	.L594	 ;,
.L395:
 ; D:/TC/src/parser.c:35:     list(CodeMember*) members = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:36:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	%rbx, %rcx	 ; now_scope,
 ; D:/TC/src/parser.c:35:     list(CodeMember*) members = create_list();
	movq	%rax, 80(%rsp)	 ; tmp709, %sfp
 ; D:/TC/src/parser.c:36:     SymbolTable* global_scope = create_symbol_table(now_scope);
	call	create_symbol_table	 ;
 ; D:/TC/src/parser.c:37:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:36:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	%rax, 72(%rsp)	 ; tmp710, %sfp
 ; D:/TC/src/parser.c:37:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, 56(%rsp)	 ; token, %sfp
 ; D:/TC/src/parser.c:38:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L512	 ;,
	movq	%rdi, %r15	 ; parser, parser
	jmp	.L396	 ;
	.p2align 4,,10
	.p2align 3
.L441:
 ; D:/TC/src/parser.c:55:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:55:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC92(%rip), %rcx	 ;, tmp669
 ; D:/TC/src/parser.c:55:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp890
 ; D:/TC/src/parser.c:55:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L408:
 ; D:/TC/src/parser.c:56:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, 56(%rsp)	 ; token, %sfp
 ; D:/TC/src/parser.c:38:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L512	 ;,
.L396:
 ; D:/TC/src/parser.c:38:     while (token != NULL && token->type != EOF_TOKEN) {
	movq	56(%rsp), %rax	 ; %sfp, token
	movl	24(%rax), %eax	 ; token_365->type, _39
 ; D:/TC/src/parser.c:38:     while (token != NULL && token->type != EOF_TOKEN) {
	testl	%eax, %eax	 ; _39
	je	.L512	 ;,
 ; D:/TC/src/parser.c:39:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	 ;, _39
	jne	.L441	 ;,
 ; D:/TC/src/parser.c:39:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax	 ;, tmp944
	movq	(%rax), %rdx	 ; IMPORT_KEYWORD, IMPORT_KEYWORD
	movq	56(%rsp), %rax	 ; %sfp, token
	movq	(%rax), %rcx	 ; token_365->lexeme, token_365->lexeme
	call	string_equal	 ;
	movl	%eax, %esi	 ; tmp712, have_return
 ; D:/TC/src/parser.c:39:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	testb	%al, %al	 ; have_return
	jne	.L595	 ;,
 ; D:/TC/src/parser.c:44:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	56(%rsp), %rax	 ; %sfp, token
	cmpl	$6, 24(%rax)	 ;, token_365->type
	jne	.L441	 ;,
 ; D:/TC/src/parser.c:44:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	.refptr.FUNC_KEYWORD(%rip), %rdi	 ;, tmp947
	movq	(%rax), %rcx	 ; token_365->lexeme, token_365->lexeme
	movq	(%rdi), %rdx	 ; FUNC_KEYWORD, FUNC_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/parser.c:44:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	testb	%al, %al	 ; tmp728
	jne	.L596	 ;,
 ; D:/TC/src/parser.c:49:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	56(%rsp), %rax	 ; %sfp, token
	cmpl	$6, 24(%rax)	 ;, token_365->type
	jne	.L441	 ;,
 ; D:/TC/src/parser.c:49:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	.refptr.CLASS_KEYWORD(%rip), %rsi	 ;, tmp952
	movq	(%rax), %rcx	 ; token_365->lexeme, token_365->lexeme
	movq	(%rsi), %rdx	 ; CLASS_KEYWORD, CLASS_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/parser.c:49:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	testb	%al, %al	 ; tmp768
	je	.L441	 ;,
 ; D:/TC/src/parser.c:265:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:/TC/src/parser.c:266:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:265:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	%rax, 88(%rsp)	 ; tmp769, %sfp
 ; D:/TC/src/parser.c:266:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:267:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_219->type
 ; D:/TC/src/parser.c:266:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp770, token
 ; D:/TC/src/parser.c:267:     if (token->type != IDENTIFIER) {
	jne	.L597	 ;,
 ; D:/TC/src/parser.c:272:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/parser.c:274:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	movq	(%rbx), %rcx	 ; token_219->lexeme, token_219->lexeme
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
 ; D:/TC/src/parser.c:272:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movq	%rax, %r9	 ; tmp772, class
	movq	%rax, 112(%rsp)	 ; class, %sfp
 ; D:/TC/src/parser.c:273:     class->class_scope = class_scope;
	movq	88(%rsp), %rax	 ; %sfp, class_scope
	movq	%rax, 16(%r9)	 ; class_scope, class_223->class_scope
 ; D:/TC/src/parser.c:274:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:275:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:274:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	movq	%rax, 96(%rsp)	 ; tmp773, %sfp
 ; D:/TC/src/parser.c:275:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:276:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_226->type
 ; D:/TC/src/parser.c:275:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp774, token
 ; D:/TC/src/parser.c:276:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L445	 ;,
 ; D:/TC/src/parser.c:276:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp956
	movq	(%rbx), %rcx	 ; token_226->lexeme, token_226->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:276:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp776
	je	.L445	 ;,
 ; D:/TC/src/parser.c:281:     list(ClassMember*) members = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:282:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:314:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	leaq	.LC88(%rip), %rsi	 ;, tmp694
 ; D:/TC/src/parser.c:281:     list(ClassMember*) members = create_list();
	movq	%rax, 104(%rsp)	 ; tmp777, %sfp
 ; D:/TC/src/parser.c:282:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12	 ;, tmp670
 ; D:/TC/src/parser.c:283:     size_t size = 0;
	movq	$0, 120(%rsp)	 ;, %sfp
	movq	.refptr.SELF_KEYWORD(%rip), %rdi	 ;, tmp673
 ; D:/TC/src/parser.c:282:     token = get_next_token(lexer, true);
	movq	%rax, %r10	 ; tmp778, token
 ; D:/TC/src/parser.c:284:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L446	 ;
	.p2align 4,,10
	.p2align 3
.L498:
 ; D:/TC/src/parser.c:285:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	 ;, _281
	je	.L598	 ;,
.L447:
 ; D:/TC/src/parser.c:314:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:314:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	64(%rsp), %rdx	 ; %sfp,
	movq	%rsi, %rcx	 ; tmp694,
 ; D:/TC/src/parser.c:314:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp834
 ; D:/TC/src/parser.c:314:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L495:
 ; D:/TC/src/parser.c:315:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r10	 ; tmp835, token
.L446:
 ; D:/TC/src/parser.c:284:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movl	24(%r10), %eax	 ; token_235->type, _281
 ; D:/TC/src/parser.c:284:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _281
	jne	.L498	 ;,
 ; D:/TC/src/parser.c:284:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r10), %rcx	 ; token_235->lexeme, token_235->lexeme
	movq	(%r12), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	string_equal	 ;
 ; D:/TC/src/parser.c:284:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	64(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp836
	jne	.L499	 ;,
 ; D:/TC/src/parser.c:285:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movl	24(%r10), %eax	 ; token_235->type, _281
 ; D:/TC/src/parser.c:285:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	 ;, _281
	jne	.L447	 ;,
.L598:
 ; D:/TC/src/parser.c:285:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	.refptr.METHOD_KEYWORD(%rip), %rax	 ;, tmp958
	movq	(%r10), %rcx	 ; token_235->lexeme, token_235->lexeme
	movq	%r10, 64(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; METHOD_KEYWORD, METHOD_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/parser.c:285:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	64(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp779
	jne	.L599	 ;,
 ; D:/TC/src/parser.c:290:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	cmpl	$6, 24(%r10)	 ;, token_235->type
	jne	.L447	 ;,
 ; D:/TC/src/parser.c:290:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp972
	movq	(%r10), %rcx	 ; token_235->lexeme, token_235->lexeme
	movq	%r10, 64(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/parser.c:290:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	64(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp825
	je	.L447	 ;,
 ; D:/TC/src/parser.c:291:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:292:             parser->in_class = true;
	movb	$1, 10(%r15)	 ;, parser_74(D)->in_class
 ; D:/TC/src/parser.c:293:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	%r14, %rcx	 ; lexer,
	movq	88(%rsp), %rdx	 ; %sfp,
 ; D:/TC/src/parser.c:291:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp826, token
 ; D:/TC/src/parser.c:293:             Variable* variable = parse_variable(lexer, class_scope, parser);
	call	parse_variable	 ;
 ; D:/TC/src/parser.c:294:             parser->in_class = false;
	movb	$0, 10(%r15)	 ;, parser_74(D)->in_class
 ; D:/TC/src/parser.c:293:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	%rax, %rbp	 ; tmp827, variable
 ; D:/TC/src/parser.c:295:             if (variable == NULL)
	testq	%rax, %rax	 ; variable
	je	.L600	 ;,
.L486:
 ; D:/TC/src/parser.c:297:             ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
	xorl	%edx, %edx	 ;
	movq	%rbp, %r8	 ; variable,
	movl	$1, %ecx	 ;,
	call	create_class_member	 ;
 ; D:/TC/src/parser.c:298:             list_append(members, (pointer)member);
	movq	104(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:297:             ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
	movq	%rax, %rbx	 ; tmp829, member
 ; D:/TC/src/parser.c:298:             list_append(members, (pointer)member);
	movq	%rax, %rdx	 ; member,
	call	list_append	 ;
 ; D:/TC/src/parser.c:299:             if (member->type == CLASS_VARIABLE) {
	cmpl	$1, 8(%rbx)	 ;, member_252->type
	je	.L601	 ;,
.L490:
 ; D:/TC/src/parser.c:310:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:311:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_271->type
 ; D:/TC/src/parser.c:310:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp831, token
 ; D:/TC/src/parser.c:311:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	je	.L494	 ;,
.L496:
 ; D:/TC/src/parser.c:312:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:312:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC87(%rip), %rcx	 ;, tmp628
 ; D:/TC/src/parser.c:312:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp832
 ; D:/TC/src/parser.c:312:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L495	 ;
	.p2align 4,,10
	.p2align 3
.L512:
 ; D:/TC/src/parser.c:59:     return create_code(members, global_scope);
	movq	72(%rsp), %rdx	 ; %sfp,
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:60: }
	addq	$184, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:/TC/src/parser.c:59:     return create_code(members, global_scope);
	jmp	create_code	 ;
	.p2align 4,,10
	.p2align 3
.L595:
 ; D:/TC/src/parser.c:64:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:65:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_101->type
 ; D:/TC/src/parser.c:64:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp713, token
 ; D:/TC/src/parser.c:65:     if (token->type != IDENTIFIER) {
	jne	.L602	 ;,
 ; D:/TC/src/parser.c:72:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:70:     string import_name = token->lexeme;
	movq	(%rax), %rdi	 ; token_101->lexeme, import_name
 ; D:/TC/src/parser.c:71:     string source = NULL;
	xorl	%esi, %esi	 ; source
 ; D:/TC/src/parser.c:72:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp715, token
 ; D:/TC/src/parser.c:73:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movl	24(%rax), %eax	 ; token_106->type, _107
 ; D:/TC/src/parser.c:73:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	cmpl	$6, %eax	 ;, _107
	je	.L603	 ;,
.L401:
 ; D:/TC/src/parser.c:83:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	 ;, _107
	jne	.L405	 ;,
 ; D:/TC/src/parser.c:83:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp483
	movq	(%rbx), %rcx	 ; token_117->lexeme, token_117->lexeme
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:83:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp721
	je	.L405	 ;,
 ; D:/TC/src/parser.c:89:     name = parse_import_file(import_name, source, now_scope, parser->source_file);
	movq	(%r15), %r9	 ; parser_74(D)->source_file,
	movq	72(%rsp), %r8	 ; %sfp,
	movq	%rdi, %rcx	 ; import_name,
	movq	%rsi, %rdx	 ; source,
	call	parse_import_file	 ;
	movq	%rax, %rcx	 ; tmp722, name
 ; D:/TC/src/parser.c:90:     if (name == NULL) {
	testq	%rax, %rax	 ; name
	je	.L604	 ;,
.L406:
 ; D:/TC/src/parser.c:95:     return create_import(name, source);
	movq	%rsi, %rdx	 ; source,
	call	create_import	 ;
	movq	%rax, %rdx	 ; tmp725, _132
 ; D:/TC/src/parser.c:41:             if (import == NULL)
	testq	%rax, %rax	 ; _132
	je	.L400	 ;,
.L407:
 ; D:/TC/src/parser.c:43:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	xorl	%ecx, %ecx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	call	create_code_member	 ;
 ; D:/TC/src/parser.c:43:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:43:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	%rax, %rdx	 ; tmp727, _22
 ; D:/TC/src/parser.c:43:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	call	list_append	 ;
 ; D:/TC/src/parser.c:39:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	jmp	.L408	 ;
	.p2align 4,,10
	.p2align 3
.L596:
 ; D:/TC/src/parser.c:100:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:/TC/src/parser.c:101:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:100:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	%rax, %rdi	 ; tmp729, function_scope
 ; D:/TC/src/parser.c:101:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp730, token
 ; D:/TC/src/parser.c:102:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_135->type, _136
 ; D:/TC/src/parser.c:102:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _136
	je	.L410	 ;,
 ; D:/TC/src/parser.c:102:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _136
	jne	.L413	 ;,
 ; D:/TC/src/parser.c:102:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rbx), %rcx	 ; token_135->lexeme, token_135->lexeme
	call	is_builtin_type	 ;
 ; D:/TC/src/parser.c:102:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp732
	je	.L413	 ;,
.L410:
 ; D:/TC/src/parser.c:107:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rdx	 ; token_135->lexeme, token_135->lexeme
	movq	72(%rsp), %rcx	 ; %sfp,
	call	search_name	 ;
	movq	%rax, %rbp	 ; tmp733, return_type
 ; D:/TC/src/parser.c:108:     if (return_type == NULL) {
	testq	%rax, %rax	 ; return_type
	je	.L605	 ;,
 ; D:/TC/src/parser.c:113:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:114:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_145->type
 ; D:/TC/src/parser.c:113:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp735, token
 ; D:/TC/src/parser.c:114:     if (token->type != IDENTIFIER) {
	jne	.L606	 ;,
 ; D:/TC/src/parser.c:119:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/parser.c:121:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	(%rbx), %rcx	 ; token_145->lexeme, token_145->lexeme
	movq	%rbp, %r8	 ; return_type,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:120:     function->function_scope = function_scope;
	movq	%rdi, 32(%rax)	 ; function_scope, function_149->function_scope
 ; D:/TC/src/parser.c:119:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movq	%rax, %r9	 ; tmp737, function
	movq	%rax, 88(%rsp)	 ; function, %sfp
 ; D:/TC/src/parser.c:121:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:122:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:121:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	%rax, 96(%rsp)	 ; tmp738, %sfp
 ; D:/TC/src/parser.c:122:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:123:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_152->type
 ; D:/TC/src/parser.c:122:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp739, token
 ; D:/TC/src/parser.c:123:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L417	 ;,
 ; D:/TC/src/parser.c:123:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp507
	movq	(%rbx), %rcx	 ; token_152->lexeme, token_152->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:123:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp741
	je	.L417	 ;,
 ; D:/TC/src/parser.c:128:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp742, token
 ; D:/TC/src/parser.c:129:     list(Variable*) parameters = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:130:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r12	 ;, tmp685
 ; D:/TC/src/parser.c:139:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %r13	 ;, tmp686
 ; D:/TC/src/parser.c:129:     list(Variable*) parameters = create_list();
	movq	%rax, 64(%rsp)	 ; tmp743, %sfp
	.p2align 4,,10
	.p2align 3
.L418:
 ; D:/TC/src/parser.c:130:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_164->type
	je	.L607	 ;,
.L426:
 ; D:/TC/src/parser.c:131:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	%rdi, %rdx	 ; function_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; D:/TC/src/parser.c:132:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	je	.L608	 ;,
 ; D:/TC/src/parser.c:134:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_161->value
	je	.L421	 ;,
 ; D:/TC/src/parser.c:135:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:135:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC63(%rip), %rcx	 ;, tmp513
 ; D:/TC/src/parser.c:135:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp746
 ; D:/TC/src/parser.c:135:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L420:
 ; D:/TC/src/parser.c:138:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:139:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_168->type
 ; D:/TC/src/parser.c:138:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp747, token
 ; D:/TC/src/parser.c:139:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	je	.L422	 ;,
.L425:
 ; D:/TC/src/parser.c:142:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:142:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC64(%rip), %rcx	 ;, tmp515
 ; D:/TC/src/parser.c:142:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp748
 ; D:/TC/src/parser.c:142:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L412:
 ; D:/TC/src/parser.c:47:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:47:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC69(%rip), %rcx	 ;, tmp542
 ; D:/TC/src/parser.c:47:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp766
 ; D:/TC/src/parser.c:47:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%r8d, %r8d	 ; _214
.L440:
 ; D:/TC/src/parser.c:48:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	movl	$1, %ecx	 ;,
	call	create_code_member	 ;
 ; D:/TC/src/parser.c:48:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:48:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	%rax, %rdx	 ; tmp767, _29
 ; D:/TC/src/parser.c:48:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	call	list_append	 ;
 ; D:/TC/src/parser.c:44:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	jmp	.L408	 ;
	.p2align 4,,10
	.p2align 3
.L445:
 ; D:/TC/src/parser.c:277:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:277:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC71(%rip), %rcx	 ;, tmp550
 ; D:/TC/src/parser.c:277:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp775
 ; D:/TC/src/parser.c:277:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L443:
 ; D:/TC/src/parser.c:52:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:52:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC91(%rip), %rcx	 ;, tmp667
 ; D:/TC/src/parser.c:52:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp887
 ; D:/TC/src/parser.c:52:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%r9d, %r9d	 ; _364
.L511:
 ; D:/TC/src/parser.c:53:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	xorl	%edx, %edx	 ;
	xorl	%r8d, %r8d	 ;
	movl	$2, %ecx	 ;,
	call	create_code_member	 ;
 ; D:/TC/src/parser.c:53:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:53:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	%rax, %rdx	 ; tmp888, _36
 ; D:/TC/src/parser.c:53:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	call	list_append	 ;
 ; D:/TC/src/parser.c:49:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	jmp	.L408	 ;
	.p2align 4,,10
	.p2align 3
.L599:
 ; D:/TC/src/parser.c:179:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	88(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:/TC/src/parser.c:180:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	(%rdi), %rcx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	96(%rsp), %r8	 ; %sfp,
	movl	$3, %edx	 ;,
	movq	%rax, %r9	 ; method_scope,
 ; D:/TC/src/parser.c:179:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	%rax, %rbp	 ; tmp780, method_scope
 ; D:/TC/src/parser.c:180:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:181:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:180:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	%rax, %rbx	 ; tmp781, self
 ; D:/TC/src/parser.c:181:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:182:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	64(%rsp), %r10	 ; %sfp, token
 ; D:/TC/src/parser.c:181:     token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp782, token
 ; D:/TC/src/parser.c:182:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_371->type, _372
 ; D:/TC/src/parser.c:182:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _372
	je	.L449	 ;,
 ; D:/TC/src/parser.c:182:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _372
	jne	.L452	 ;,
 ; D:/TC/src/parser.c:182:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	0(%r13), %rcx	 ; token_371->lexeme, token_371->lexeme
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	is_builtin_type	 ;
 ; D:/TC/src/parser.c:182:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	64(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp784
	je	.L452	 ;,
.L449:
 ; D:/TC/src/parser.c:187:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	0(%r13), %rdx	 ; token_371->lexeme, token_371->lexeme
	movq	88(%rsp), %rcx	 ; %sfp,
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	search_name	 ;
 ; D:/TC/src/parser.c:188:     if (return_type == NULL) {
	movq	64(%rsp), %r10	 ; %sfp, token
	testq	%rax, %rax	 ; return_type
 ; D:/TC/src/parser.c:187:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	%rax, 136(%rsp)	 ; return_type, %sfp
 ; D:/TC/src/parser.c:188:     if (return_type == NULL) {
	je	.L609	 ;,
 ; D:/TC/src/parser.c:193:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:194:     if (token->type != IDENTIFIER) {
	movq	64(%rsp), %r10	 ; %sfp, token
	cmpl	$1, 24(%rax)	 ;, token_381->type
 ; D:/TC/src/parser.c:193:     token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp787, token
 ; D:/TC/src/parser.c:194:     if (token->type != IDENTIFIER) {
	jne	.L610	 ;,
 ; D:/TC/src/parser.c:199:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	alloc_memory	 ;
 ; D:/TC/src/parser.c:201:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	96(%rsp), %rcx	 ; %sfp, name
	movq	0(%r13), %rdx	 ; token_381->lexeme, token_381->lexeme
 ; D:/TC/src/parser.c:200:     method->method_scope = method_scope;
	movq	%rbp, 32(%rax)	 ; method_scope, method_385->method_scope
 ; D:/TC/src/parser.c:201:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	8(%rcx), %rcx	 ; name_225->name, name_225->name
 ; D:/TC/src/parser.c:200:     method->method_scope = method_scope;
	movq	%rax, 152(%rsp)	 ; method, %sfp
 ; D:/TC/src/parser.c:201:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	call	make_method_name	 ;
 ; D:/TC/src/parser.c:201:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	152(%rsp), %r9	 ; %sfp,
	movl	$2, %edx	 ;,
	movq	136(%rsp), %r8	 ; %sfp,
 ; D:/TC/src/parser.c:201:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	%rax, %rcx	 ; tmp790, _388
 ; D:/TC/src/parser.c:201:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:202:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:201:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	%rax, 160(%rsp)	 ; tmp791, %sfp
 ; D:/TC/src/parser.c:202:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:203:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	64(%rsp), %r10	 ; %sfp, token
	cmpl	$5, 24(%rax)	 ;, token_390->type
 ; D:/TC/src/parser.c:202:     token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp792, token
 ; D:/TC/src/parser.c:203:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L456	 ;,
 ; D:/TC/src/parser.c:203:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp571
	movq	0(%r13), %rcx	 ; token_390->lexeme, token_390->lexeme
	movq	%r10, 64(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:203:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	64(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp794
	je	.L456	 ;,
 ; D:/TC/src/parser.c:208:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:209:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	64(%rsp), %r10	 ; %sfp, token
	cmpl	$6, 24(%rax)	 ;, token_397->type
 ; D:/TC/src/parser.c:208:     token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp795, token
 ; D:/TC/src/parser.c:209:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	je	.L457	 ;,
.L459:
 ; D:/TC/src/parser.c:210:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:210:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC76(%rip), %rcx	 ;, tmp575
 ; D:/TC/src/parser.c:210:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp796
 ; D:/TC/src/parser.c:210:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	64(%rsp), %r10	 ; %sfp, token
.L458:
 ; D:/TC/src/parser.c:211:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp798, token
 ; D:/TC/src/parser.c:212:     list(Variable*) parameters = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:213:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	96(%rsp), %rcx	 ; %sfp,
	movq	%rbx, %rdx	 ; self,
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/parser.c:212:     list(Variable*) parameters = create_list();
	movq	%rax, 144(%rsp)	 ; tmp799, %sfp
	movq	%r13, %rbx	 ; token, token
	movq	%r12, %r13	 ; tmp670, tmp670
 ; D:/TC/src/parser.c:213:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	call	create_variable	 ;
 ; D:/TC/src/parser.c:213:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	144(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:213:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	%rax, %rdx	 ; tmp800, _406
 ; D:/TC/src/parser.c:213:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	call	list_append	 ;
	movq	64(%rsp), %r12	 ; %sfp, token
	.p2align 4,,10
	.p2align 3
.L460:
 ; D:/TC/src/parser.c:214:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_407->type
	je	.L611	 ;,
.L589:
	movq	%r12, %r10	 ; token, token
	movq	%r13, %r12	 ; tmp670, tmp670
	movq	%rbx, %r13	 ; token, token
.L464:
 ; D:/TC/src/parser.c:219:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:219:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC77(%rip), %rcx	 ;, tmp583
 ; D:/TC/src/parser.c:219:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp804
 ; D:/TC/src/parser.c:219:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	64(%rsp), %r10	 ; %sfp, token
	jmp	.L451	 ;
	.p2align 4,,10
	.p2align 3
.L594:
 ; D:/TC/src/parser.c:33:         now_scope = builtin_scope;
	movq	(%rsi), %rbx	 ; builtin_scope, now_scope
	jmp	.L395	 ;
	.p2align 4,,10
	.p2align 3
.L499:
 ; D:/TC/src/parser.c:317:     string init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
	movq	.refptr.DEFAULT_INIT_NAME(%rip), %rax	 ;, tmp637
	movq	%r10, 128(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; DEFAULT_INIT_NAME, DEFAULT_INIT_NAME
	movq	96(%rsp), %rax	 ; %sfp, name
	movq	8(%rax), %rcx	 ; name_225->name, name_225->name
	call	make_method_name	 ;
 ; D:/TC/src/parser.c:318:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	movq	88(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; init_name,
 ; D:/TC/src/parser.c:317:     string init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
	movq	%rax, %rbx	 ; tmp837, init_name
 ; D:/TC/src/parser.c:318:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	call	search_name_use_strcmp	 ;
 ; D:/TC/src/parser.c:319:     if (init == NULL) {
	movq	128(%rsp), %r10	 ; %sfp, token
	testq	%rax, %rax	 ; init
 ; D:/TC/src/parser.c:318:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	movq	%rax, 64(%rsp)	 ; init, %sfp
 ; D:/TC/src/parser.c:319:     if (init == NULL) {
	je	.L612	 ;,
.L500:
 ; D:/TC/src/parser.c:331:     if (init->kind != SYMBOL_METHOD)
	movq	64(%rsp), %rax	 ; %sfp, init
	movq	%r10, 128(%rsp)	 ; token, %sfp
	cmpl	$2, 32(%rax)	 ;, init_304->kind
	jne	.L613	 ;,
.L501:
 ; D:/TC/src/parser.c:333:     string constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	96(%rsp), %r13	 ; %sfp, name
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp646
	movq	8(%r13), %rcx	 ; name_225->name, name_225->name
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
	call	make_method_name	 ;
 ; D:/TC/src/parser.c:334:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
 ; D:/TC/src/parser.c:333:     string constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	%rax, %rbx	 ; tmp852, constructor_name
 ; D:/TC/src/parser.c:334:     Method* method = (Method*)alloc_memory(sizeof(Method));
	call	alloc_memory	 ;
 ; D:/TC/src/parser.c:335:     method->method_scope = create_symbol_table(class_scope);
	movq	88(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:334:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movq	%rax, %rbp	 ; tmp853, method
 ; D:/TC/src/parser.c:335:     method->method_scope = create_symbol_table(class_scope);
	call	create_symbol_table	 ;
 ; D:/TC/src/parser.c:336:     Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
	movq	%rbx, %rcx	 ; constructor_name,
	movq	%rbp, %r9	 ; method,
	movq	%r13, %r8	 ; name,
 ; D:/TC/src/parser.c:335:     method->method_scope = create_symbol_table(class_scope);
	movq	%rax, 32(%rbp)	 ; tmp854, method_312->method_scope
 ; D:/TC/src/parser.c:336:     Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
	movl	$2, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, 128(%rsp)	 ; tmp855, %sfp
 ; D:/TC/src/parser.c:337:     list(Variable*) parameters = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:338:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	32(%rbp), %r9	 ; method_312->method_scope,
	movq	(%rdi), %rcx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	%r13, %r8	 ; name,
	movl	$3, %edx	 ;,
 ; D:/TC/src/parser.c:337:     list(Variable*) parameters = create_list();
	movq	%rax, %rsi	 ; tmp856, parameters
 ; D:/TC/src/parser.c:338:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:339:     list_append(parameters, (pointer)create_variable(name, self, NULL));
	xorl	%r8d, %r8d	 ;
	movq	%r13, %rcx	 ; name,
 ; D:/TC/src/parser.c:338:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	%rax, %rdx	 ; tmp857, self
 ; D:/TC/src/parser.c:339:     list_append(parameters, (pointer)create_variable(name, self, NULL));
	call	create_variable	 ;
 ; D:/TC/src/parser.c:339:     list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	%rsi, %rcx	 ; parameters,
 ; D:/TC/src/parser.c:339:     list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	%rax, %rdx	 ; tmp858, _319
 ; D:/TC/src/parser.c:339:     list_append(parameters, (pointer)create_variable(name, self, NULL));
	call	list_append	 ;
 ; D:/TC/src/parser.c:340:     list(Variable*) init_params = list_copy(init->ast_node.method->parameters);
	movq	64(%rsp), %rax	 ; %sfp, init
	movq	24(%rax), %rax	 ; init_304->ast_node.method, init_304->ast_node.method
	movq	16(%rax), %rcx	 ; _320->parameters, _320->parameters
	call	list_copy	 ;
	movq	%rax, %rbx	 ; tmp859, init_params
	.p2align 4,,10
	.p2align 3
.L503:
 ; D:/TC/src/parser.c:342:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	movq	%rbx, %rcx	 ; init_params,
	call	list_pop	 ;
	movq	%rax, %r12	 ; tmp862, param
 ; D:/TC/src/parser.c:342:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	testq	%rax, %rax	 ; param
	je	.L614	 ;,
.L504:
 ; D:/TC/src/parser.c:343:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	movq	8(%r12), %rax	 ; param_324->name, param_324->name
	movq	(%rdi), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	8(%rax), %rcx	 ; _325->name, _325->name
	call	string_equal	 ;
 ; D:/TC/src/parser.c:343:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	testb	%al, %al	 ; tmp860
	jne	.L503	 ;,
 ; D:/TC/src/parser.c:344:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	8(%r12), %rdx	 ; param_324->name, param_324->name
	movq	(%r12), %rcx	 ; param_324->type, param_324->type
	xorl	%r8d, %r8d	 ;
	call	create_variable	 ;
 ; D:/TC/src/parser.c:344:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	%rsi, %rcx	 ; parameters,
 ; D:/TC/src/parser.c:344:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	%rax, %rdx	 ; tmp861, _330
 ; D:/TC/src/parser.c:344:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	call	list_append	 ;
 ; D:/TC/src/parser.c:342:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	movq	%rbx, %rcx	 ; init_params,
	call	list_pop	 ;
	movq	%rax, %r12	 ; tmp862, param
 ; D:/TC/src/parser.c:342:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	testq	%rax, %rax	 ; param
	jne	.L504	 ;,
.L614:
 ; D:/TC/src/parser.c:346:     list(statement*) body = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:347:     list(ClassMember*) ms = list_copy(members);
	movq	104(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:346:     list(statement*) body = create_list();
	movq	%rax, %r13	 ; tmp863, body
 ; D:/TC/src/parser.c:347:     list(ClassMember*) ms = list_copy(members);
	call	list_copy	 ;
	movq	%rax, %rbx	 ; tmp864, ms
 ; D:/TC/src/parser.c:349:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	jmp	.L506	 ;
	.p2align 4,,10
	.p2align 3
.L508:
 ; D:/TC/src/parser.c:350:         if (mb->type == CLASS_VARIABLE) {
	cmpl	$1, 8(%rdi)	 ;, mb_333->type
	je	.L615	 ;,
.L506:
 ; D:/TC/src/parser.c:349:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	movq	%rbx, %rcx	 ; ms,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp873, mb
 ; D:/TC/src/parser.c:349:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	testq	%rax, %rax	 ; mb
	jne	.L508	 ;,
 ; D:/TC/src/parser.c:356:     list(Expression*) args = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:357:     list(Variable*) params = list_copy(parameters);
	movq	%rsi, %rcx	 ; parameters,
 ; D:/TC/src/parser.c:356:     list(Expression*) args = create_list();
	movq	%rax, %r12	 ; tmp874, args
 ; D:/TC/src/parser.c:357:     list(Variable*) params = list_copy(parameters);
	call	list_copy	 ;
	movq	%rax, %rbx	 ; tmp875, params
 ; D:/TC/src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	jmp	.L509	 ;
	.p2align 4,,10
	.p2align 3
.L510:
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	8(%rax), %r8	 ; param_351->name, param_351->name
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	$0, 32(%rsp)	 ;,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp876,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	xorl	%r9d, %r9d	 ;
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rax, %r8	 ;, tmp877
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	call	create_expression	 ;
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%r12, %rcx	 ; args,
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rax, %rdx	 ; tmp878, _355
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	call	list_append	 ;
.L509:
 ; D:/TC/src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	movq	%rbx, %rcx	 ; params,
	call	list_pop	 ;
 ; D:/TC/src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	testq	%rax, %rax	 ; param
	jne	.L510	 ;,
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	$0, 32(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	64(%rsp), %r8	 ; %sfp,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%r12, 32(%rsp)	 ; args,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %rdx	 ; tmp880, _356
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp881,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %r8	 ;, tmp882
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	call	create_expression	 ;
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	$0, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	movq	%rax, 32(%rsp)	 ; tmp883,
	call	create_statement	 ;
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%r13, %rcx	 ; body,
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %rdx	 ; tmp884, _360
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	call	list_append	 ;
 ; D:/TC/src/parser.c:361:     create_method_use_ptr(method, constructor, name, parameters, body, method->method_scope);
	movq	32(%rbp), %rax	 ; method_312->method_scope, method_312->method_scope
	movq	%rsi, %r9	 ; parameters,
	movq	%rbp, %rcx	 ; method,
	movq	96(%rsp), %rsi	 ; %sfp, name
	movq	%r13, 32(%rsp)	 ; body,
	movq	%rax, 40(%rsp)	 ; method_312->method_scope,
	movq	128(%rsp), %rdx	 ; %sfp,
	movq	%rsi, %r8	 ; name,
	call	create_method_use_ptr	 ;
 ; D:/TC/src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; method,
	xorl	%ecx, %ecx	 ;
	call	create_class_member	 ;
 ; D:/TC/src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	104(%rsp), %rdi	 ; %sfp, members
 ; D:/TC/src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rdx	 ; tmp885, _362
 ; D:/TC/src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rdi, %rcx	 ; members,
	call	list_append	 ;
 ; D:/TC/src/parser.c:364:     return create_class_use_ptr(class, name, members, class_scope, size);
	movq	120(%rsp), %rax	 ; %sfp, size
	movq	%rdi, %r8	 ; members,
	movq	%rsi, %rdx	 ; name,
	movq	88(%rsp), %r9	 ; %sfp,
	movq	112(%rsp), %rcx	 ; %sfp,
	movq	%rax, 32(%rsp)	 ; size,
	call	create_class_use_ptr	 ;
	movq	%rax, %r9	 ; tmp886, _364
 ; D:/TC/src/parser.c:51:             if (class == NULL)
	testq	%rax, %rax	 ; _364
	jne	.L511	 ;,
	jmp	.L443	 ;
	.p2align 4,,10
	.p2align 3
.L615:
 ; D:/TC/src/parser.c:351:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
	movq	(%rdi), %rax	 ; mb_333->content.variable, mb_333->content.variable
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	8(%rax), %r8	 ; _336->name, _336->name
	movq	$0, 32(%rsp)	 ;,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:351:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp865,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:/TC/src/parser.c:351:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; D:/TC/src/parser.c:351:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
	movq	%rax, %r8	 ;, tmp866
 ; D:/TC/src/parser.c:351:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
	call	create_expression	 ;
	movq	%rax, %r12	 ; tmp867, left
 ; D:/TC/src/parser.c:352:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	(%rdi), %rax	 ; mb_333->content.variable, mb_333->content.variable
	movq	16(%rax), %r9	 ; _341->value, _342
 ; D:/TC/src/parser.c:352:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	testq	%r9, %r9	 ; _342
	je	.L616	 ;,
.L507:
 ; D:/TC/src/parser.c:353:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	xorl	%r8d, %r8d	 ;
	movq	%r12, %rdx	 ; left,
	movl	$13, %ecx	 ;,
	call	create_expression	 ;
 ; D:/TC/src/parser.c:353:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	xorl	%r9d, %r9d	 ;
	movq	$0, 40(%rsp)	 ;,
	xorl	%r8d, %r8d	 ;
	movq	%rax, 32(%rsp)	 ; tmp871,
	call	create_statement	 ;
 ; D:/TC/src/parser.c:353:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	%r13, %rcx	 ; body,
 ; D:/TC/src/parser.c:353:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	%rax, %rdx	 ; tmp872, _348
 ; D:/TC/src/parser.c:353:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	call	list_append	 ;
	jmp	.L506	 ;
	.p2align 4,,10
	.p2align 3
.L494:
 ; D:/TC/src/parser.c:311:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp629
	movq	(%rbx), %rcx	 ; token_271->lexeme, token_271->lexeme
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:311:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp833
	je	.L496	 ;,
	jmp	.L495	 ;
	.p2align 4,,10
	.p2align 3
.L601:
 ; D:/TC/src/parser.c:300:                 Symbol* type = member->content.variable->type;
	movq	(%rbx), %rdx	 ; member_252->content.variable, _254
 ; D:/TC/src/parser.c:301:                 if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %rcx	 ;, tmp619
 ; D:/TC/src/parser.c:300:                 Symbol* type = member->content.variable->type;
	movq	(%rdx), %rax	 ; _254->type, type
 ; D:/TC/src/parser.c:301:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rcx), %rax	 ; name_int, type
	je	.L592	 ;,
 ; D:/TC/src/parser.c:301:                 if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rcx	 ;, tmp620
 ; D:/TC/src/parser.c:301:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rcx), %rax	 ; name_float, type
	je	.L592	 ;,
 ; D:/TC/src/parser.c:301:                 if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rcx	 ;, tmp621
 ; D:/TC/src/parser.c:301:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rcx), %rax	 ; name_string, type
	je	.L592	 ;,
 ; D:/TC/src/parser.c:303:                 else if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rcx	 ;, tmp622
 ; D:/TC/src/parser.c:303:                 else if (type == name_bool || type == name_void)
	cmpq	(%rcx), %rax	 ; name_bool, type
	je	.L491	 ;,
 ; D:/TC/src/parser.c:303:                 else if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rcx	 ;, tmp623
 ; D:/TC/src/parser.c:303:                 else if (type == name_bool || type == name_void)
	cmpq	(%rcx), %rax	 ; name_void, type
	je	.L491	 ;,
 ; D:/TC/src/parser.c:305:                 else if (type->kind == SYMBOL_CLASS)
	movl	32(%rax), %ecx	 ; type_255->kind,
	testl	%ecx, %ecx	 ;
	je	.L592	 ;,
 ; D:/TC/src/parser.c:308:                     fprintf(stderr, "[warning] Unsupported type for class variable '%s': %s\n", member->content.variable->name->name, type->name);
	movq	8(%rax), %rbx	 ; type_255->name, _266
	movq	8(%rdx), %rax	 ; _254->name, _254->name
	movq	8(%rax), %rbp	 ; _267->name, _268
 ; D:/TC/src/parser.c:308:                     fprintf(stderr, "[warning] Unsupported type for class variable '%s': %s\n", member->content.variable->name->name, type->name);
	call	__getreent	 ;
 ; D:/TC/src/parser.c:308:                     fprintf(stderr, "[warning] Unsupported type for class variable '%s': %s\n", member->content.variable->name->name, type->name);
	movq	%rbx, %r9	 ; _266,
	leaq	.LC86(%rip), %rdx	 ;, tmp626
	movq	24(%rax), %rcx	 ; _269->_stderr, _269->_stderr
	movq	%rbp, %r8	 ; _268,
	call	fprintf	 ;
	jmp	.L490	 ;
	.p2align 4,,10
	.p2align 3
.L592:
 ; D:/TC/src/parser.c:306:                     size += 8;  // pointer to object
	addq	$8, 120(%rsp)	 ;, %sfp
	jmp	.L490	 ;
	.p2align 4,,10
	.p2align 3
.L597:
 ; D:/TC/src/parser.c:268:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:268:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC70(%rip), %rcx	 ;, tmp547
 ; D:/TC/src/parser.c:268:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp771
 ; D:/TC/src/parser.c:268:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L443	 ;
	.p2align 4,,10
	.p2align 3
.L602:
 ; D:/TC/src/parser.c:66:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:66:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC53(%rip), %rcx	 ;, tmp475
 ; D:/TC/src/parser.c:66:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp714
 ; D:/TC/src/parser.c:66:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L400:
 ; D:/TC/src/parser.c:42:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:42:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC57(%rip), %rcx	 ;, tmp492
 ; D:/TC/src/parser.c:42:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp726
 ; D:/TC/src/parser.c:42:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _132
	jmp	.L407	 ;
	.p2align 4,,10
	.p2align 3
.L613:
 ; D:/TC/src/parser.c:332:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:332:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	128(%rsp), %rdx	 ; %sfp,
	leaq	.LC89(%rip), %rcx	 ;, tmp645
 ; D:/TC/src/parser.c:332:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp851
 ; D:/TC/src/parser.c:332:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L501	 ;
	.p2align 4,,10
	.p2align 3
.L405:
 ; D:/TC/src/parser.c:84:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:84:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC55(%rip), %rcx	 ;, tmp482
 ; D:/TC/src/parser.c:84:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp720
 ; D:/TC/src/parser.c:84:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L400	 ;
	.p2align 4,,10
	.p2align 3
.L417:
 ; D:/TC/src/parser.c:124:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:124:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC61(%rip), %rcx	 ;, tmp506
 ; D:/TC/src/parser.c:124:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp740
 ; D:/TC/src/parser.c:124:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L412	 ;
	.p2align 4,,10
	.p2align 3
.L456:
 ; D:/TC/src/parser.c:204:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:204:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC75(%rip), %rcx	 ;, tmp570
 ; D:/TC/src/parser.c:204:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp793
 ; D:/TC/src/parser.c:204:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	64(%rsp), %r10	 ; %sfp, token
.L451:
 ; D:/TC/src/parser.c:288:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:288:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	64(%rsp), %rdx	 ; %sfp,
	leaq	.LC84(%rip), %rcx	 ;, tmp613
 ; D:/TC/src/parser.c:288:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp823
 ; D:/TC/src/parser.c:288:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _460
.L484:
 ; D:/TC/src/parser.c:289:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%ecx, %ecx	 ;
	xorl	%r8d, %r8d	 ;
	call	create_class_member	 ;
 ; D:/TC/src/parser.c:289:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	104(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:289:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rdx	 ; tmp824, _243
 ; D:/TC/src/parser.c:289:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	list_append	 ;
 ; D:/TC/src/parser.c:285:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	jmp	.L495	 ;
	.p2align 4,,10
	.p2align 3
.L607:
 ; D:/TC/src/parser.c:130:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_164->lexeme, token_164->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:130:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp752
	je	.L426	 ;,
 ; D:/TC/src/parser.c:147:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:148:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_185->type
 ; D:/TC/src/parser.c:147:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp753, token
 ; D:/TC/src/parser.c:148:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L428	 ;,
 ; D:/TC/src/parser.c:148:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp527
	movq	(%rbx), %rcx	 ; token_185->lexeme, token_185->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:148:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp755
	je	.L428	 ;,
 ; D:/TC/src/parser.c:153:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:154:     parser->in_function = true;
	movb	$1, 8(%r15)	 ;, parser_74(D)->in_function
 ; D:/TC/src/parser.c:156:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:153:     list(Statement*) body = create_list();
	movq	%rax, %r12	 ; tmp756, body
 ; D:/TC/src/parser.c:164:             have_return = true;
	movl	$1, %r13d	 ;, tmp682
 ; D:/TC/src/parser.c:156:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rbp, 112(%rsp)	 ; return_type, %sfp
	movq	%rax, %rbx	 ; tmp757, token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp670
	movq	%rax, %rbp	 ; tmp670, tmp670
 ; D:/TC/src/parser.c:157:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L429	 ;
	.p2align 4,,10
	.p2align 3
.L432:
 ; D:/TC/src/parser.c:164:             have_return = true;
	cmpl	$5, 8(%r9)	 ;, statement_194->type
	cmove	%r13d, %esi	 ; have_return,, tmp682, have_return
.L433:
 ; D:/TC/src/parser.c:165:         list_append(body, (pointer)statement);
	movq	%r9, %rdx	 ; statement,
	movq	%r12, %rcx	 ; body,
	call	list_append	 ;
 ; D:/TC/src/parser.c:166:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp761, token
.L429:
 ; D:/TC/src/parser.c:157:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_197->type
	jne	.L434	 ;,
 ; D:/TC/src/parser.c:157:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rbx), %rcx	 ; token_197->lexeme, token_197->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:157:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp762
	jne	.L617	 ;,
.L434:
 ; D:/TC/src/parser.c:158:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	%rdi, %rdx	 ; function_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r9	 ; tmp758, statement
 ; D:/TC/src/parser.c:159:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L618	 ;,
 ; D:/TC/src/parser.c:161:         else if (have_return)
	testb	%sil, %sil	 ; have_return
	je	.L432	 ;,
 ; D:/TC/src/parser.c:162:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%rax, 104(%rsp)	 ; statement, %sfp
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:162:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;,
 ; D:/TC/src/parser.c:162:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp760
 ; D:/TC/src/parser.c:162:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	104(%rsp), %r9	 ; %sfp, statement
	jmp	.L432	 ;
	.p2align 4,,10
	.p2align 3
.L421:
 ; D:/TC/src/parser.c:137:             list_append(parameters, (pointer)parameter);
	movq	64(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; parameter,
	call	list_append	 ;
	jmp	.L420	 ;
	.p2align 4,,10
	.p2align 3
.L422:
 ; D:/TC/src/parser.c:139:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	0(%r13), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	movq	(%rax), %rcx	 ; token_168->lexeme, token_168->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:139:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp749
	jne	.L619	 ;,
 ; D:/TC/src/parser.c:141:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_168->type
	jne	.L425	 ;,
 ; D:/TC/src/parser.c:141:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_168->lexeme, token_168->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:141:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp751
	jne	.L418	 ;,
	jmp	.L425	 ;
	.p2align 4,,10
	.p2align 3
.L611:
 ; D:/TC/src/parser.c:214:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp964
	movq	(%rbx), %rcx	 ; token_407->lexeme, token_407->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:214:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp810
	jne	.L620	 ;,
 ; D:/TC/src/parser.c:215:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_407->type
	jne	.L589	 ;,
 ; D:/TC/src/parser.c:215:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp962
	movq	(%rbx), %rcx	 ; token_407->lexeme, token_407->lexeme
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:215:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp801
	je	.L621	 ;,
 ; D:/TC/src/parser.c:216:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:222:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	%rbp, %rdx	 ; method_scope,
	movq	%r14, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:216:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp802, token
 ; D:/TC/src/parser.c:222:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	call	parse_variable	 ;
 ; D:/TC/src/parser.c:223:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	je	.L622	 ;,
 ; D:/TC/src/parser.c:225:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_413->value
	je	.L470	 ;,
 ; D:/TC/src/parser.c:226:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:226:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC79(%rip), %rcx	 ;,
 ; D:/TC/src/parser.c:226:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp808
 ; D:/TC/src/parser.c:226:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L469:
 ; D:/TC/src/parser.c:229:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp809, token
	jmp	.L460	 ;
	.p2align 4,,10
	.p2align 3
.L470:
 ; D:/TC/src/parser.c:228:             list_append(parameters, (pointer)parameter);
	movq	144(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; parameter,
	call	list_append	 ;
	jmp	.L469	 ;
	.p2align 4,,10
	.p2align 3
.L608:
 ; D:/TC/src/parser.c:133:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:133:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC62(%rip), %rcx	 ;, tmp511
 ; D:/TC/src/parser.c:133:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp745
 ; D:/TC/src/parser.c:133:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L420	 ;
	.p2align 4,,10
	.p2align 3
.L622:
 ; D:/TC/src/parser.c:224:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:224:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC78(%rip), %rcx	 ;, tmp588
 ; D:/TC/src/parser.c:224:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp807
 ; D:/TC/src/parser.c:224:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L469	 ;
	.p2align 4,,10
	.p2align 3
.L593:
 ; D:/TC/src/parser.c:25:         builtin_scope = create_symbol_table(NULL);
	xorl	%ecx, %ecx	 ;
	call	create_symbol_table	 ;
 ; D:/TC/src/parser.c:26:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	xorl	%r8d, %r8d	 ;
	movl	$6, %edx	 ;,
 ; D:/TC/src/parser.c:25:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, %r9	 ; tmp703, _2
 ; D:/TC/src/parser.c:25:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, (%rsi)	 ; _2, builtin_scope
 ; D:/TC/src/parser.c:26:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp447
	movq	(%rax), %rcx	 ; VOID_KEYWORD, VOID_KEYWORD
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:26:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp449
 ; D:/TC/src/parser.c:27:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/parser.c:26:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp704, name_void
 ; D:/TC/src/parser.c:27:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp452
	movl	$6, %edx	 ;,
	movq	(%rax), %rcx	 ; INT_KEYWORD, INT_KEYWORD
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:27:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp454
 ; D:/TC/src/parser.c:28:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/parser.c:27:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp705, name_int
 ; D:/TC/src/parser.c:28:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp457
	movl	$6, %edx	 ;,
	movq	(%rax), %rcx	 ; FLOAT_KEYWORD, FLOAT_KEYWORD
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:28:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp459
 ; D:/TC/src/parser.c:29:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/parser.c:28:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp706, name_float
 ; D:/TC/src/parser.c:29:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp462
	movl	$6, %edx	 ;,
	movq	(%rax), %rcx	 ; STRING_KEYWORD, STRING_KEYWORD
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:29:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp464
 ; D:/TC/src/parser.c:30:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/parser.c:29:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp707, name_string
 ; D:/TC/src/parser.c:30:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp467
	movl	$6, %edx	 ;,
	movq	(%rax), %rcx	 ; BOOL_KEYWORD, BOOL_KEYWORD
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:30:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp469
	movq	%rax, (%rdx)	 ; tmp708, name_bool
	jmp	.L394	 ;
	.p2align 4,,10
	.p2align 3
.L413:
 ; D:/TC/src/parser.c:103:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:103:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC58(%rip), %rcx	 ;, tmp497
 ; D:/TC/src/parser.c:103:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp731
 ; D:/TC/src/parser.c:103:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L412	 ;
	.p2align 4,,10
	.p2align 3
.L452:
 ; D:/TC/src/parser.c:183:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:183:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC72(%rip), %rcx	 ;, tmp560
 ; D:/TC/src/parser.c:183:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp783
 ; D:/TC/src/parser.c:183:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	64(%rsp), %r10	 ; %sfp, token
	jmp	.L451	 ;
	.p2align 4,,10
	.p2align 3
.L600:
 ; D:/TC/src/parser.c:296:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:296:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC85(%rip), %rcx	 ;, tmp618
 ; D:/TC/src/parser.c:296:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp828
 ; D:/TC/src/parser.c:296:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L486	 ;
	.p2align 4,,10
	.p2align 3
.L619:
 ; D:/TC/src/parser.c:140:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp750, token
 ; D:/TC/src/parser.c:140:             token = get_next_token(lexer, true);
	jmp	.L418	 ;
.L606:
 ; D:/TC/src/parser.c:115:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:115:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC60(%rip), %rcx	 ;, tmp503
 ; D:/TC/src/parser.c:115:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp736
 ; D:/TC/src/parser.c:115:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L412	 ;
.L610:
 ; D:/TC/src/parser.c:195:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:195:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC74(%rip), %rcx	 ;, tmp566
 ; D:/TC/src/parser.c:195:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp788
 ; D:/TC/src/parser.c:195:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	64(%rsp), %r10	 ; %sfp, token
	jmp	.L451	 ;
.L603:
 ; D:/TC/src/parser.c:73:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	.refptr.FROM_KEYWORD(%rip), %rax	 ;, tmp476
	movq	(%rbx), %rcx	 ; token_106->lexeme, token_106->lexeme
	movq	(%rax), %rdx	 ; FROM_KEYWORD, FROM_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/parser.c:73:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	testb	%al, %al	 ; tmp716
	jne	.L402	 ;,
.L591:
 ; D:/TC/src/parser.c:83:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movl	24(%rbx), %eax	 ;, _107
	jmp	.L401	 ;
.L621:
 ; D:/TC/src/parser.c:217:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, 24(%rbx)	 ;, token_407->type
	movq	%r12, %r10	 ; token, token
	movq	%r13, %r12	 ; tmp670, tmp670
	movq	%rbx, %r13	 ; token, token
	jne	.L464	 ;,
 ; D:/TC/src/parser.c:217:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp963
	movq	(%rbx), %rcx	 ; token_407->lexeme, token_407->lexeme
	movq	%r10, 64(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:217:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	64(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp805
	je	.L464	 ;,
.L472:
 ; D:/TC/src/parser.c:231:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:232:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	64(%rsp), %r10	 ; %sfp, token
	cmpl	$5, 24(%rax)	 ;, token_431->type
 ; D:/TC/src/parser.c:231:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp806, token
 ; D:/TC/src/parser.c:232:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L467	 ;,
 ; D:/TC/src/parser.c:232:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp965
	movq	(%rbx), %rcx	 ; token_431->lexeme, token_431->lexeme
	movq	%r10, 64(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:/TC/src/parser.c:232:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	64(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp812
	je	.L467	 ;,
	movq	%r10, 128(%rsp)	 ; token, %sfp
 ; D:/TC/src/parser.c:237:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:238:     parser->in_function = true;
	movl	$257, %r9d	 ;,
 ; D:/TC/src/parser.c:241:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:238:     parser->in_function = true;
	movw	%r9w, 8(%r15)	 ;, MEM <vector(2) char> [(char *)parser_74(D) + 8B]
 ; D:/TC/src/parser.c:237:     list(Statement*) body = create_list();
	movq	%rax, 64(%rsp)	 ; tmp813, %sfp
 ; D:/TC/src/parser.c:241:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	128(%rsp), %r10	 ; %sfp, token
 ; D:/TC/src/parser.c:240:     bool have_return = false;
	xorl	%r11d, %r11d	 ; have_return
	movq	%rbp, 128(%rsp)	 ; method_scope, %sfp
 ; D:/TC/src/parser.c:241:     token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp814, token
	movl	%r11d, %ebx	 ; have_return, have_return
	movq	%r10, 168(%rsp)	 ; token, %sfp
 ; D:/TC/src/parser.c:242:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L473	 ;
	.p2align 4,,10
	.p2align 3
.L476:
 ; D:/TC/src/parser.c:249:             have_return = true;
	cmpl	$5, 8(%rbp)	 ;, statement_440->type
	movl	$1, %eax	 ;, tmp966
	cmove	%eax, %ebx	 ; have_return,, tmp966, have_return
.L477:
 ; D:/TC/src/parser.c:250:         list_append(body, (pointer)statement);
	movq	64(%rsp), %rcx	 ; %sfp,
	movq	%rbp, %rdx	 ; statement,
	call	list_append	 ;
 ; D:/TC/src/parser.c:251:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp818, token
.L473:
 ; D:/TC/src/parser.c:242:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r13)	 ;, token_443->type
	jne	.L478	 ;,
 ; D:/TC/src/parser.c:242:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%r13), %rcx	 ; token_443->lexeme, token_443->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:242:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp819
	jne	.L623	 ;,
.L478:
 ; D:/TC/src/parser.c:243:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	128(%rsp), %rdx	 ; %sfp,
	movq	%r15, %r8	 ; parser,
	movq	%r14, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %rbp	 ; tmp815, statement
 ; D:/TC/src/parser.c:244:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L624	 ;,
 ; D:/TC/src/parser.c:246:         else if (have_return)
	testb	%bl, %bl	 ; have_return
	je	.L476	 ;,
 ; D:/TC/src/parser.c:247:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:247:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;,
 ; D:/TC/src/parser.c:247:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp817
 ; D:/TC/src/parser.c:247:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L476	 ;
.L612:
 ; D:/TC/src/parser.c:320:         Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/parser.c:321:         method->method_scope = create_symbol_table(class_scope);
	movq	88(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:320:         Method* method = (Method*)alloc_memory(sizeof(Method));
	movq	%rax, %rsi	 ; tmp839, method
 ; D:/TC/src/parser.c:321:         method->method_scope = create_symbol_table(class_scope);
	call	create_symbol_table	 ;
 ; D:/TC/src/parser.c:322:         init = create_symbol(init_name, SYMBOL_METHOD, name, method);
	movq	96(%rsp), %r13	 ; %sfp, name
	movq	%rbx, %rcx	 ; init_name,
	movq	%rsi, %r9	 ; method,
 ; D:/TC/src/parser.c:321:         method->method_scope = create_symbol_table(class_scope);
	movq	%rax, 32(%rsi)	 ; tmp840, method_289->method_scope
 ; D:/TC/src/parser.c:322:         init = create_symbol(init_name, SYMBOL_METHOD, name, method);
	movl	$2, %edx	 ;,
	movq	%r13, %r8	 ; name,
	call	create_symbol	 ;
	movq	%rax, 64(%rsp)	 ; tmp841, %sfp
 ; D:/TC/src/parser.c:323:         list(Variable*) parameters = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:324:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	32(%rsi), %r9	 ; method_289->method_scope,
	movq	(%rdi), %rcx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	%r13, %r8	 ; name,
	movl	$3, %edx	 ;,
 ; D:/TC/src/parser.c:323:         list(Variable*) parameters = create_list();
	movq	%rax, %rbp	 ; tmp842, parameters
 ; D:/TC/src/parser.c:324:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:325:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	xorl	%r8d, %r8d	 ;
	movq	%r13, %rcx	 ; name,
	movq	%rax, %rdx	 ; self,
 ; D:/TC/src/parser.c:324:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	%rax, %r12	 ; tmp843, self
 ; D:/TC/src/parser.c:325:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	call	create_variable	 ;
 ; D:/TC/src/parser.c:325:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	%rbp, %rcx	 ; parameters,
 ; D:/TC/src/parser.c:325:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	%rax, %rdx	 ; tmp844, _296
 ; D:/TC/src/parser.c:325:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	call	list_append	 ;
 ; D:/TC/src/parser.c:326:         list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	movq	%r12, %r8	 ; self,
	xorl	%edx, %edx	 ;
	movq	$0, 32(%rsp)	 ;,
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/parser.c:326:         list(Statement*) body = create_list();
	movq	%rax, %rbx	 ; tmp845, body
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp846,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %r8	 ;, tmp847
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	create_expression	 ;
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	$0, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	movq	%rax, 32(%rsp)	 ; tmp848,
	call	create_statement	 ;
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rbx, %rcx	 ; body,
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %rdx	 ; tmp849, _301
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	list_append	 ;
 ; D:/TC/src/parser.c:328:         create_method_use_ptr(method, init, name, parameters, body, method->method_scope);
	movq	32(%rsi), %rax	 ; method_289->method_scope, method_289->method_scope
	movq	%rbp, %r9	 ; parameters,
	movq	%r13, %r8	 ; name,
	movq	%rbx, 32(%rsp)	 ; body,
	movq	64(%rsp), %rdx	 ; %sfp,
	movq	%rsi, %rcx	 ; method,
	movq	%rax, 40(%rsp)	 ; method_289->method_scope,
	call	create_method_use_ptr	 ;
 ; D:/TC/src/parser.c:329:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; method,
	xorl	%ecx, %ecx	 ;
	call	create_class_member	 ;
 ; D:/TC/src/parser.c:329:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	104(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:329:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rdx	 ; tmp850, _303
 ; D:/TC/src/parser.c:329:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	list_append	 ;
	movq	128(%rsp), %r10	 ; %sfp, token
	jmp	.L500	 ;
.L467:
 ; D:/TC/src/parser.c:233:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:233:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC80(%rip), %rcx	 ;, tmp595
 ; D:/TC/src/parser.c:233:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp811
 ; D:/TC/src/parser.c:233:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	64(%rsp), %r10	 ; %sfp, token
	jmp	.L451	 ;
.L491:
 ; D:/TC/src/parser.c:304:                     size += 1;
	addq	$1, 120(%rsp)	 ;, %sfp
	jmp	.L490	 ;
	.p2align 4,,10
	.p2align 3
.L624:
 ; D:/TC/src/parser.c:245:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:245:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC82(%rip), %rcx	 ;,
 ; D:/TC/src/parser.c:245:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp816
 ; D:/TC/src/parser.c:245:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L477	 ;
.L616:
 ; D:/TC/src/parser.c:352:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movl	$2, %edx	 ;,
	leaq	.LC90(%rip), %rcx	 ;, tmp663
	call	create_string	 ;
 ; D:/TC/src/parser.c:352:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%ecx, %ecx	 ;
	movq	$0, 32(%rsp)	 ;,
 ; D:/TC/src/parser.c:352:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	%rax, %rdx	 ; tmp868, _343
 ; D:/TC/src/parser.c:352:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	call	create_primary	 ;
 ; D:/TC/src/parser.c:352:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; D:/TC/src/parser.c:352:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	%rax, %r8	 ;, tmp869
 ; D:/TC/src/parser.c:352:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	call	create_expression	 ;
	movq	%rax, %r9	 ; tmp870, _342
	jmp	.L507	 ;
.L457:
 ; D:/TC/src/parser.c:209:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	(%rdi), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	(%rax), %rcx	 ; token_397->lexeme, token_397->lexeme
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	string_equal	 ;
 ; D:/TC/src/parser.c:209:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	64(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp797
	je	.L459	 ;,
	jmp	.L458	 ;
.L623:
 ; D:/TC/src/parser.c:253:     parser->in_function = false;
	xorl	%r8d, %r8d	 ;
	movq	168(%rsp), %r10	 ; %sfp, token
	movq	128(%rsp), %rbp	 ; %sfp, method_scope
	movw	%r8w, 8(%r15)	 ;, MEM <vector(2) char> [(char *)parser_74(D) + 8B]
 ; D:/TC/src/parser.c:255:     if (!have_return && return_type != name_void)
	testb	%bl, %bl	 ; have_return
	jne	.L480	 ;,
 ; D:/TC/src/parser.c:255:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp967
	movq	136(%rsp), %rbx	 ; %sfp, return_type
	cmpq	(%rax), %rbx	 ; name_void, return_type
	je	.L482	 ;,
 ; D:/TC/src/parser.c:256:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 128(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:256:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC83(%rip), %rcx	 ;, tmp610
 ; D:/TC/src/parser.c:256:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp821
 ; D:/TC/src/parser.c:256:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:257:     if (!have_return && return_type == name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp969
	movq	136(%rsp), %rbx	 ; %sfp, return_type
	movq	128(%rsp), %r10	 ; %sfp, token
	cmpq	(%rax), %rbx	 ; name_void, return_type
	je	.L482	 ;,
.L480:
 ; D:/TC/src/parser.c:260:     return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
	movq	64(%rsp), %rax	 ; %sfp, body
	movq	%rbp, 40(%rsp)	 ; method_scope,
	movq	160(%rsp), %rdx	 ; %sfp,
	movq	144(%rsp), %r9	 ; %sfp,
	movq	%r10, 128(%rsp)	 ; token, %sfp
	movq	%rax, 32(%rsp)	 ; body,
	movq	136(%rsp), %r8	 ; %sfp,
	movq	152(%rsp), %rcx	 ; %sfp,
	call	create_method_use_ptr	 ;
 ; D:/TC/src/parser.c:287:             if (method == NULL)
	movq	128(%rsp), %r10	 ; %sfp, token
	testq	%rax, %rax	 ; _460
 ; D:/TC/src/parser.c:260:     return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
	movq	%rax, %rdx	 ; tmp822, _460
 ; D:/TC/src/parser.c:287:             if (method == NULL)
	jne	.L484	 ;,
	jmp	.L451	 ;
	.p2align 4,,10
	.p2align 3
.L604:
 ; D:/TC/src/parser.c:91:         fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
	call	__getreent	 ;
 ; D:/TC/src/parser.c:91:         fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
	movq	%rsi, %r9	 ; source,
	movq	%rdi, %r8	 ; import_name,
	leaq	.LC56(%rip), %rdx	 ;, tmp488
	movq	24(%rax), %rcx	 ; _127->_stderr, _127->_stderr
	call	fprintf	 ;
 ; D:/TC/src/parser.c:92:         name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
	movq	.refptr.name_void(%rip), %rax	 ;, tmp489
	movq	72(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rcx	 ; import_name,
	movl	$3, %edx	 ;,
	movq	(%rax), %r8	 ; name_void,
	call	create_symbol	 ;
	movq	%rax, %rcx	 ; tmp724, name
	jmp	.L406	 ;
.L605:
 ; D:/TC/src/parser.c:109:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:109:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC59(%rip), %rcx	 ;, tmp501
 ; D:/TC/src/parser.c:109:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp734
 ; D:/TC/src/parser.c:109:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L412	 ;
.L609:
 ; D:/TC/src/parser.c:189:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:189:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC73(%rip), %rcx	 ;, tmp564
 ; D:/TC/src/parser.c:189:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp786
 ; D:/TC/src/parser.c:189:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	64(%rsp), %r10	 ; %sfp, token
	jmp	.L451	 ;
.L402:
 ; D:/TC/src/parser.c:74:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:75:         if (token->type != STRING) {
	cmpl	$4, 24(%rax)	 ;, token_111->type
 ; D:/TC/src/parser.c:74:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp717, token
 ; D:/TC/src/parser.c:75:         if (token->type != STRING) {
	jne	.L625	 ;,
 ; D:/TC/src/parser.c:81:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:80:         source = token->lexeme;
	movq	(%rax), %rsi	 ; token_111->lexeme, source
 ; D:/TC/src/parser.c:81:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp719, token
	jmp	.L591	 ;
.L618:
 ; D:/TC/src/parser.c:160:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%rax, 104(%rsp)	 ; statement, %sfp
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:160:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC66(%rip), %rcx	 ;,
 ; D:/TC/src/parser.c:160:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp759
 ; D:/TC/src/parser.c:160:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	104(%rsp), %r9	 ; %sfp, statement
	jmp	.L433	 ;
.L620:
	movq	%r12, %r10	 ; token, token
	movq	%r13, %r12	 ; tmp670, tmp670
	jmp	.L472	 ;
.L617:
 ; D:/TC/src/parser.c:168:     parser->in_function = false;
	movb	$0, 8(%r15)	 ;, parser_74(D)->in_function
	movq	112(%rsp), %rbp	 ; %sfp, return_type
 ; D:/TC/src/parser.c:169:     if (!have_return && return_type != name_void)
	testb	%sil, %sil	 ; have_return
	jne	.L436	 ;,
 ; D:/TC/src/parser.c:169:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rsi	 ;, tmp537
 ; D:/TC/src/parser.c:169:     if (!have_return && return_type != name_void)
	cmpq	(%rsi), %rbp	 ; name_void, return_type
	je	.L438	 ;,
 ; D:/TC/src/parser.c:170:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:170:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC68(%rip), %rcx	 ;, tmp539
 ; D:/TC/src/parser.c:170:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp764
 ; D:/TC/src/parser.c:170:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:171:     if (!have_return && return_type == name_void)
	cmpq	(%rsi), %rbp	 ; name_void, return_type
	je	.L438	 ;,
.L436:
 ; D:/TC/src/parser.c:174:     return create_function_use_ptr(function, name, return_type, parameters, body, function_scope);
	movq	%rdi, 40(%rsp)	 ; function_scope,
	movq	64(%rsp), %r9	 ; %sfp,
	movq	%rbp, %r8	 ; return_type,
	movq	96(%rsp), %rdx	 ; %sfp,
	movq	88(%rsp), %rcx	 ; %sfp,
	movq	%r12, 32(%rsp)	 ; body,
	call	create_function_use_ptr	 ;
	movq	%rax, %r8	 ; tmp765, _214
 ; D:/TC/src/parser.c:46:             if (function == NULL)
	testq	%rax, %rax	 ; _214
	jne	.L440	 ;,
	jmp	.L412	 ;
	.p2align 4,,10
	.p2align 3
.L428:
 ; D:/TC/src/parser.c:149:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:149:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC65(%rip), %rcx	 ;, tmp526
 ; D:/TC/src/parser.c:149:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp754
 ; D:/TC/src/parser.c:149:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L412	 ;
.L625:
 ; D:/TC/src/parser.c:76:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:76:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC54(%rip), %rcx	 ;, tmp480
 ; D:/TC/src/parser.c:76:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp718
 ; D:/TC/src/parser.c:76:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L400	 ;
.L482:
 ; D:/TC/src/parser.c:258:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$5, %ecx	 ;,
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movq	%r10, 128(%rsp)	 ; token, %sfp
	call	create_statement	 ;
 ; D:/TC/src/parser.c:258:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	64(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:258:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	%rax, %rdx	 ; tmp820, _459
 ; D:/TC/src/parser.c:258:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	call	list_append	 ;
	movq	128(%rsp), %r10	 ; %sfp, token
	jmp	.L480	 ;
.L438:
 ; D:/TC/src/parser.c:172:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$5, %ecx	 ;,
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
 ; D:/TC/src/parser.c:172:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	%r12, %rcx	 ; body,
 ; D:/TC/src/parser.c:172:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	%rax, %rdx	 ; tmp763, _213
 ; D:/TC/src/parser.c:172:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	call	list_append	 ;
	jmp	.L436	 ;
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
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	create_code;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	create_method_use_ptr;	.scl	2;	.type	32;	.endef
	.def	create_class_use_ptr;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	create_function_use_ptr;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.DEFAULT_INIT_NAME, "dr"
	.globl	.refptr.DEFAULT_INIT_NAME
	.linkonce	discard
.refptr.DEFAULT_INIT_NAME:
	.quad	DEFAULT_INIT_NAME
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
	.section	.rdata$.refptr.DEFAULT_CONSTRUCTOR_NAME, "dr"
	.globl	.refptr.DEFAULT_CONSTRUCTOR_NAME
	.linkonce	discard
.refptr.DEFAULT_CONSTRUCTOR_NAME:
	.quad	DEFAULT_CONSTRUCTOR_NAME
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
