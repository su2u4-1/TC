	.file	"parser.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Failed to parse right operand\0"
	.text
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
parse_expr_prec:
	pushq	%r15	 ;
	pushq	%r14	 ;
	movl	%r8d, %r14d	 ; tmp121, min_prec
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%r9, %rbp	 ; tmp122, now_scope
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp120, expr_left
 ; D:/TC/src/parser.c:650:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:647: static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, SymbolTable* now_scope, Parser* parser) {
	subq	$56, %rsp	 ;,
 ; D:/TC/src/parser.c:647: static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, SymbolTable* now_scope, Parser* parser) {
	movq	%rcx, 128(%rsp)	 ; tmp119, lexer
	movq	160(%rsp), %r15	 ; parser, parser
.L20:
 ; D:/TC/src/parser.c:679:         token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:/TC/src/parser.c:651:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_15->type
	jne	.L14	 ;,
 ; D:/TC/src/parser.c:652:         OperatorType op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_15->lexeme,
	call	string_to_operator	 ;
 ; D:/TC/src/parser.c:653:         int op_prec = operator_precedence(op);
	movl	%eax, %ecx	 ; op,
 ; D:/TC/src/parser.c:652:         OperatorType op = string_to_operator(token->lexeme);
	movl	%eax, %edi	 ; tmp124, op
 ; D:/TC/src/parser.c:653:         int op_prec = operator_precedence(op);
	call	operator_precedence	 ;
	movl	%eax, %r12d	 ; tmp125, op_prec
 ; D:/TC/src/parser.c:654:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, %edi	 ;, op
	je	.L14	 ;,
	cmpl	%r14d, %eax	 ; min_prec, op_prec
	jge	.L3	 ;,
.L14:
 ; D:/TC/src/parser.c:681:     token = peek_current_token(lexer);
	movq	128(%rsp), %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:/TC/src/parser.c:683:     return expr_left;
	jmp	.L1	 ;
.L3:
 ; D:/TC/src/parser.c:656:         token = get_next_token(lexer, true);  // consume operator
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:657:         token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%r15, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
 ; D:/TC/src/parser.c:657:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp126, token
 ; D:/TC/src/parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp127, right_primary
 ; D:/TC/src/parser.c:659:         if (right_primary == NULL) {
	testq	%rax, %rax	 ; right_primary
	jne	.L6	 ;,
 ; D:/TC/src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_38(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC0(%rip), %rcx	 ;, tmp113
 ; D:/TC/src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp128
 ; D:/TC/src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:662:             return NULL;
	jmp	.L7	 ;
.L6:
 ; D:/TC/src/parser.c:664:         Expression* right = create_expression(OP_NONE, NULL, right_primary, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rsi	 ; tmp129, right
.L19:
 ; D:/TC/src/parser.c:676:             token = peek_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	peek_next_token	 ;
 ; D:/TC/src/parser.c:666:         while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_14->type
	jne	.L12	 ;,
 ; D:/TC/src/parser.c:667:             OperatorType next_op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_14->lexeme,
	call	string_to_operator	 ;
 ; D:/TC/src/parser.c:668:             int next_prec = operator_precedence(next_op);
	movl	%eax, %ecx	 ; next_op,
 ; D:/TC/src/parser.c:667:             OperatorType next_op = string_to_operator(token->lexeme);
	movl	%eax, %r13d	 ; tmp131, next_op
 ; D:/TC/src/parser.c:668:             int next_prec = operator_precedence(next_op);
	call	operator_precedence	 ;
	movl	%eax, %r8d	 ; tmp132, next_prec
 ; D:/TC/src/parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %r13d	 ;, next_op
	je	.L12	 ;,
	cmpl	%eax, %r12d	 ; next_prec, op_prec
	jl	.L9	 ;,
.L12:
 ; D:/TC/src/parser.c:678:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rbx, %rdx	 ; <retval>,
	movl	%edi, %ecx	 ; op,
	movq	%rsi, %r9	 ; right,
	xorl	%r8d, %r8d	 ;
	call	create_expression	 ;
 ; D:/TC/src/parser.c:679:         token = peek_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:678:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rax, %rbx	 ; tmp133, <retval>
	jmp	.L20	 ;
.L9:
 ; D:/TC/src/parser.c:671:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	%r15, 32(%rsp)	 ; parser,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rsi, %rdx	 ; right,
	movq	%rbp, %r9	 ; now_scope,
	call	parse_expr_prec	 ;
	movq	%rax, %rsi	 ; tmp135, right
 ; D:/TC/src/parser.c:672:             if (right == NULL) {
	testq	%rax, %rax	 ; right
	jne	.L19	 ;,
.L7:
 ; D:/TC/src/parser.c:662:             return NULL;
	xorl	%ebx, %ebx	 ; <retval>
.L1:
 ; D:/TC/src/parser.c:684: }
	addq	$56, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
	.section .rdata,"dr"
.LC1:
	.ascii "Failed to parse expression primary\0"
	.text
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%rbp	 ;
	movq	%rdx, %rbp	 ; tmp93, now_scope
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp94, parser
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp92, lexer
	pushq	%rbx	 ;
	subq	$72, %rsp	 ;,
 ; D:/TC/src/parser.c:687:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %rbx	 ; tmp95, <retval>
 ; D:/TC/src/parser.c:688:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; <retval>
	jne	.L23	 ;,
 ; D:/TC/src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_10(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rsi, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, 56(%rsp)	 ; _2, %sfp
 ; D:/TC/src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:/TC/src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	56(%rsp), %r8	 ; %sfp, _2
	leaq	.LC1(%rip), %rcx	 ;, tmp90
 ; D:/TC/src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp97, _3
 ; D:/TC/src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:691:         return NULL;
	jmp	.L22	 ;
.L23:
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
	movq	%rax, %rdx	 ; tmp98, _4
 ; D:/TC/src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rbx	 ; tmp99, <retval>
.L22:
 ; D:/TC/src/parser.c:695: }
	addq	$72, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC2:
	.ascii "Expected variable type\0"
.LC3:
	.ascii "Expected a type for variable declaration\0"
.LC4:
	.ascii "Unknown variable type\0"
.LC5:
	.ascii "Expected variable name\0"
.LC6:
	.ascii "Failed to parse variable initializer\0"
	.text
	.def	parse_variable;	.scl	3;	.type	32;	.endef
parse_variable:
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%rdx, %r12	 ; tmp134, now_scope
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp133, lexer
	pushq	%rbx	 ;
	movq	%r8, %rbx	 ; tmp135, parser
	subq	$40, %rsp	 ;,
 ; D:/TC/src/parser.c:369:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rdi	 ; tmp136, token
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_39->type, _1
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _1
	je	.L27	 ;,
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _1
	jne	.L30	 ;,
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rdi), %rcx	 ; token_39->lexeme,
	call	is_builtin_type	 ;
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp138
	je	.L30	 ;,
.L27:
 ; D:/TC/src/parser.c:375:     Symbol* type = search_name(now_scope, token->lexeme);
	movq	(%rdi), %rdx	 ; token_39->lexeme,
	movq	%r12, %rcx	 ; now_scope,
	call	search_name	 ;
	movq	%rax, %rbp	 ; tmp139, type
 ; D:/TC/src/parser.c:376:     if (type != NULL) {
	testq	%rax, %rax	 ; type
	je	.L31	 ;,
 ; D:/TC/src/parser.c:377:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; type_46->kind, _49
 ; D:/TC/src/parser.c:377:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	cmpl	$6, %eax	 ;, _49
	je	.L32	 ;,
	testl	%eax, %eax	 ; _49
	je	.L32	 ;,
 ; D:/TC/src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_41(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC3(%rip), %rcx	 ;, tmp125
 ; D:/TC/src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp140
	jmp	.L58	 ;
.L31:
 ; D:/TC/src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_41(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC4(%rip), %rcx	 ;, tmp126
 ; D:/TC/src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp141
.L58:
 ; D:/TC/src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L32:
 ; D:/TC/src/parser.c:381:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:382:     if (token->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	 ;, token_53->type
 ; D:/TC/src/parser.c:381:     token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp142, token
 ; D:/TC/src/parser.c:382:     if (token->type != IDENTIFIER)
	je	.L33	 ;,
 ; D:/TC/src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_41(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC5(%rip), %rcx	 ;, tmp127
 ; D:/TC/src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp143
 ; D:/TC/src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L33:
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	cmpb	$0, 10(%rbx)	 ;, parser_41(D)->in_class
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movl	$3, %edx	 ;, iftmp.25_29
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	je	.L34	 ;,
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	cmpb	$1, 9(%rbx)	 ;, parser_41(D)->in_method
	sbbl	%edx, %edx	 ; iftmp.25_29
	andl	$2, %edx	 ;, iftmp.25_29
	addl	$3, %edx	 ;, iftmp.25_29
.L34:
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movq	(%rdi), %rcx	 ; token_53->lexeme,
	movq	%r12, %r9	 ; now_scope,
	movq	%rbp, %r8	 ; type,
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:386:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movq	%rax, %rdi	 ; tmp144, name
 ; D:/TC/src/parser.c:386:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:/TC/src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_59->type
	je	.L35	 ;,
.L37:
 ; D:/TC/src/parser.c:385:     Expression* value = NULL;
	xorl	%esi, %esi	 ; value
	jmp	.L36	 ;
.L35:
 ; D:/TC/src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx	 ;, tmp128
	movq	(%rax), %rcx	 ; token_59->lexeme,
	movq	(%rdx), %rdx	 ; ASSIGN_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	 ; tmp146
	je	.L37	 ;,
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
	movq	%rbx, %r8	 ; parser,
	movq	%r12, %rdx	 ; now_scope,
 ; D:/TC/src/parser.c:389:         token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp147, token
 ; D:/TC/src/parser.c:390:         value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rsi	 ; tmp148, value
 ; D:/TC/src/parser.c:391:         if (value == NULL)
	testq	%rax, %rax	 ; value
	jne	.L36	 ;,
 ; D:/TC/src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_41(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC6(%rip), %rcx	 ;, tmp129
 ; D:/TC/src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp149
 ; D:/TC/src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L36:
 ; D:/TC/src/parser.c:396: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/parser.c:395:     return create_variable(type, name, value);
	movq	%rsi, %r8	 ; value,
	movq	%rdi, %rdx	 ; name,
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
.L30:
 ; D:/TC/src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_41(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC2(%rip), %rcx	 ;, tmp120
 ; D:/TC/src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp137
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
	.section .rdata,"dr"
.LC7:
	.ascii "Failed to parse parenthesized expression\0"
.LC8:
	.ascii "Expected ')' after expression\0"
.LC9:
	.ascii "Failed to parse operand of unary '!'\0"
.LC10:
	.ascii "Failed to parse operand of unary '-'\0"
.LC11:
	.ascii "Expected variable name in variable access\0"
.LC12:
	.ascii "Cannot call undefined variable\0"
.LC13:
	.ascii "Cannot call non-function variable\0"
.LC14:
	.ascii "Failed to parse function call argument\0"
.LC15:
	.ascii "Expected ',' or ')' after function call argument\0"
.LC16:
	.ascii "Failed to parse sequence index\0"
.LC17:
	.ascii "Expected ']' after sequence index\0"
.LC18:
	.ascii "Cannot access attribute without a valid scope\0"
.LC19:
	.ascii "Expected attribute name after '.'\0"
.LC20:
	.ascii "Unknown attribute name\0"
.LC21:
	.ascii "Failed to parse variable access\0"
.LC22:
	.ascii "Unexpected token in primary expression\0"
	.text
	.def	parse_primary;	.scl	3;	.type	32;	.endef
parse_primary:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp272, parser
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
 ; D:/TC/src/parser.c:696: Primary* parse_primary(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
	movq	%rcx, 128(%rsp)	 ; tmp270, lexer
	movq	%rdx, 136(%rsp)	 ; tmp271, now_scope
 ; D:/TC/src/parser.c:699:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rbp	 ; tmp273, token
 ; D:/TC/src/parser.c:705:     if (token->type == INTEGER) {
	movl	24(%rax), %eax	 ; token_62->type, _1
 ; D:/TC/src/parser.c:705:     if (token->type == INTEGER) {
	cmpl	$2, %eax	 ;, _1
	jne	.L60	 ;,
 ; D:/TC/src/parser.c:707:         str_value = token->lexeme;
	movq	0(%rbp), %rdx	 ; token_62->lexeme, str_value
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	 ; expr_value
 ; D:/TC/src/parser.c:706:         type = PRIM_INTEGER;
	xorl	%ebp, %ebp	 ; type
	jmp	.L61	 ;
.L60:
 ; D:/TC/src/parser.c:708:     } else if (token->type == FLOAT) {
	cmpl	$3, %eax	 ;, _1
	jne	.L62	 ;,
 ; D:/TC/src/parser.c:710:         str_value = token->lexeme;
	movq	0(%rbp), %rdx	 ; token_62->lexeme, str_value
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	 ; expr_value
 ; D:/TC/src/parser.c:709:         type = PRIM_FLOAT;
	movl	$1, %ebp	 ;, type
	jmp	.L61	 ;
.L62:
 ; D:/TC/src/parser.c:711:     } else if (token->type == STRING) {
	cmpl	$4, %eax	 ;, _1
	jne	.L63	 ;,
 ; D:/TC/src/parser.c:713:         str_value = token->lexeme;
	movq	0(%rbp), %rdx	 ; token_62->lexeme, str_value
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	 ; expr_value
 ; D:/TC/src/parser.c:712:         type = PRIM_STRING;
	movl	$2, %ebp	 ;, type
	jmp	.L61	 ;
.L63:
 ; D:/TC/src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _1
	jne	.L64	 ;,
 ; D:/TC/src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	movq	.refptr.TRUE_KEYWORD(%rip), %rax	 ;, tmp221
	movq	0(%rbp), %rcx	 ; token_62->lexeme,
	movq	(%rax), %rdx	 ; TRUE_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	 ; tmp274
	je	.L65	 ;,
 ; D:/TC/src/parser.c:716:         str_value = token->lexeme;
	movq	0(%rbp), %rdx	 ; token_62->lexeme, str_value
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	 ; expr_value
 ; D:/TC/src/parser.c:715:         type = PRIM_TRUE;
	movl	$3, %ebp	 ;, type
 ; D:/TC/src/parser.c:716:         str_value = token->lexeme;
	jmp	.L61	 ;
.L65:
 ; D:/TC/src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, 24(%rbp)	 ;, token_62->type
	jne	.L64	 ;,
 ; D:/TC/src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movq	.refptr.FALSE_KEYWORD(%rip), %rax	 ;, tmp222
	movq	0(%rbp), %rcx	 ; token_62->lexeme,
	movq	(%rax), %rdx	 ; FALSE_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	 ; tmp275
	je	.L64	 ;,
 ; D:/TC/src/parser.c:719:         str_value = token->lexeme;
	movq	0(%rbp), %rdx	 ; token_62->lexeme, str_value
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	 ; expr_value
 ; D:/TC/src/parser.c:718:         type = PRIM_FALSE;
	movl	$4, %ebp	 ;, type
 ; D:/TC/src/parser.c:719:         str_value = token->lexeme;
	jmp	.L61	 ;
.L64:
 ; D:/TC/src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_62->type
	jne	.L74	 ;,
 ; D:/TC/src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp223
	movq	0(%rbp), %rcx	 ; token_62->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp276
	je	.L67	 ;,
 ; D:/TC/src/parser.c:722:         token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:723:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	136(%rsp), %rdx	 ; now_scope,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rdi, %r8	 ; parser,
 ; D:/TC/src/parser.c:722:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp277, token
 ; D:/TC/src/parser.c:723:         expr_value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rbx	 ; tmp278, expr_value
 ; D:/TC/src/parser.c:724:         if (expr_value == NULL) {
	testq	%rax, %rax	 ; expr_value
	jne	.L68	 ;,
 ; D:/TC/src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC7(%rip), %rcx	 ;, tmp224
 ; D:/TC/src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp279
	jmp	.L167	 ;
.L68:
 ; D:/TC/src/parser.c:729:         token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %ebp	 ; token_75->type, type
 ; D:/TC/src/parser.c:729:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp280, token
 ; D:/TC/src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %ebp	 ;, type
	je	.L70	 ;,
.L72:
 ; D:/TC/src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC8(%rip), %rcx	 ;, tmp225
 ; D:/TC/src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp281
.L167:
 ; D:/TC/src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:727:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L59	 ;
.L70:
 ; D:/TC/src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp226
	movq	(%rsi), %rcx	 ; token_75->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp282
	je	.L72	 ;,
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:/TC/src/parser.c:701:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
	jmp	.L61	 ;
.L67:
 ; D:/TC/src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_62->type
	jne	.L74	 ;,
 ; D:/TC/src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp227
	movq	0(%rbp), %rcx	 ; token_62->lexeme,
	movq	(%rax), %rdx	 ; NOT_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	 ; tmp283
	je	.L73	 ;,
 ; D:/TC/src/parser.c:737:         token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:738:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	136(%rsp), %rdx	 ; now_scope,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rdi, %r8	 ; parser,
 ; D:/TC/src/parser.c:737:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp284, token
 ; D:/TC/src/parser.c:738:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp285, prim_value
 ; D:/TC/src/parser.c:739:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	jne	.L112	 ;,
 ; D:/TC/src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC9(%rip), %rcx	 ;, tmp228
 ; D:/TC/src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp286
	jmp	.L167	 ;
.L73:
 ; D:/TC/src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_62->type
	jne	.L74	 ;,
 ; D:/TC/src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp229
	movq	0(%rbp), %rcx	 ; token_62->lexeme,
	movq	(%rax), %rdx	 ; SUB_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	 ; tmp287
	je	.L74	 ;,
 ; D:/TC/src/parser.c:746:         token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:747:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	136(%rsp), %rdx	 ; now_scope,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rdi, %r8	 ; parser,
 ; D:/TC/src/parser.c:746:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp288, token
 ; D:/TC/src/parser.c:747:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp289, prim_value
 ; D:/TC/src/parser.c:748:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	jne	.L113	 ;,
 ; D:/TC/src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC10(%rip), %rcx	 ;, tmp230
 ; D:/TC/src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp290
	jmp	.L167	 ;
.L112:
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	 ; expr_value
 ; D:/TC/src/parser.c:701:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:/TC/src/parser.c:736:         type = PRIM_NOT_OPERAND;
	movl	$6, %ebp	 ;, type
	jmp	.L61	 ;
.L113:
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	 ; expr_value
 ; D:/TC/src/parser.c:701:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:/TC/src/parser.c:745:         type = PRIM_NEG_OPERAND;
	movl	$7, %ebp	 ;, type
.L61:
 ; D:/TC/src/parser.c:767:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%rsi, 32(%rsp)	 ; variable_value,
	movq	%rbx, %r8	 ; expr_value,
	movl	%ebp, %ecx	 ; type,
	call	create_primary	 ;
	jmp	.L59	 ;
.L74:
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movl	24(%rbp), %eax	 ; token_62->type, _34
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$1, %eax	 ;, _34
	jne	.L165	 ;,
.L78:
 ; D:/TC/src/parser.c:771:     Token* token = peek_current_token(lexer);
	movq	128(%rsp), %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %rbx	 ; tmp291, token
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movl	24(%rax), %eax	 ; token_107->type, _108
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	 ;, _108
	jne	.L75	 ;,
	jmp	.L76	 ;
.L165:
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$6, %eax	 ;, _34
	jne	.L77	 ;,
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp231
	movq	0(%rbp), %rcx	 ; token_62->lexeme,
	movq	(%rax), %rdx	 ; SELF_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	testb	%al, %al	 ; tmp292
	je	.L77	 ;,
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpb	$0, 9(%rdi)	 ;, parser_71(D)->in_method
	jne	.L78	 ;,
	jmp	.L77	 ;
.L75:
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	 ;, _108
	je	.L79	 ;,
.L81:
 ; D:/TC/src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC11(%rip), %rcx	 ;, tmp232
 ; D:/TC/src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp293
	jmp	.L171	 ;
.L79:
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp233
	movq	(%rbx), %rcx	 ; token_107->lexeme,
	movq	(%rax), %rdx	 ; SELF_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	 ; tmp294
	je	.L81	 ;,
.L76:
 ; D:/TC/src/parser.c:780:     base_name = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rdx	 ; token_107->lexeme,
	movq	136(%rsp), %rcx	 ; now_scope,
 ; D:/TC/src/parser.c:779:     SymbolTable* var_scope = NULL;
	xorl	%r12d, %r12d	 ; var_scope
 ; D:/TC/src/parser.c:777:     Symbol* current_type = NULL;
	xorl	%r13d, %r13d	 ; class_name
 ; D:/TC/src/parser.c:780:     base_name = search_name(now_scope, token->lexeme);
	call	search_name	 ;
 ; D:/TC/src/parser.c:781:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	xorl	%r8d, %r8d	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movq	%r8, 32(%rsp)	 ;,
	xorl	%ecx, %ecx	 ;
	movq	%rax, %r8	 ; base_name,
 ; D:/TC/src/parser.c:780:     base_name = search_name(now_scope, token->lexeme);
	movq	%rax, %rbx	 ; tmp295, base_name
 ; D:/TC/src/parser.c:781:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:782:     token = peek_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:781:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	movq	%rax, %rsi	 ; tmp296, variable_value
 ; D:/TC/src/parser.c:782:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
	movq	%rax, %r14	 ; tmp297, token
 ; D:/TC/src/parser.c:783:     while (token->type == SYMBOL) {
	jmp	.L82	 ;
.L86:
 ; D:/TC/src/parser.c:795:             else if (base_name->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rbx)	 ;, base_name_118->kind
	jne	.L88	 ;,
 ; D:/TC/src/parser.c:796:                 string name = make_method_name(base_name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp241
	movq	8(%rbx), %rcx	 ; base_name_118->name, base_name_118->name
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME,
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp301, name
 ; D:/TC/src/parser.c:797:                 base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
	movq	24(%rbx), %rax	 ; base_name_118->ast_node.class, base_name_118->ast_node.class
	movq	16(%rax), %rcx	 ; _139->class_scope, _140
	call	search_name_use_strcmp	 ;
 ; D:/TC/src/parser.c:798:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	xorl	%ecx, %ecx	 ;
	movq	%rsi, %rdx	 ; variable_value,
	xorl	%r9d, %r9d	 ;
	movq	%rcx, 32(%rsp)	 ;,
	movq	%rax, %r8	 ; base_name,
	movl	$2, %ecx	 ;,
 ; D:/TC/src/parser.c:797:                 base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
	movq	%rax, %rbx	 ; tmp302, base_name
 ; D:/TC/src/parser.c:798:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	call	create_variable_access	 ;
	movq	%rax, %rsi	 ; tmp303, variable_value
 ; D:/TC/src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	testq	%rbx, %rbx	 ; base_name
	jne	.L88	 ;,
.L87:
 ; D:/TC/src/parser.c:802:             token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	leaq	.LC14(%rip), %r15	 ;, tmp265
 ; D:/TC/src/parser.c:802:             token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp305, token
 ; D:/TC/src/parser.c:803:             list(Expression*) args = create_list();
	call	create_list	 ;
	movq	%rax, %r14	 ; tmp306, args
.L91:
 ; D:/TC/src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_154->type
	je	.L172	 ;,
.L97:
 ; D:/TC/src/parser.c:805:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	136(%rsp), %rdx	 ; now_scope,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rdi, %r8	 ; parser,
	call	parse_expression	 ;
	movq	%rax, %r13	 ; tmp307, arg
 ; D:/TC/src/parser.c:806:                 if (arg == NULL)
	testq	%rax, %rax	 ; arg
	jne	.L92	 ;,
 ; D:/TC/src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	movq	%r15, %rcx	 ; tmp265,
 ; D:/TC/src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp308
 ; D:/TC/src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L92:
 ; D:/TC/src/parser.c:808:                 list_append(args, (pointer)arg);
	movq	%r13, %rdx	 ; arg,
	movq	%r14, %rcx	 ; args,
	call	list_append	 ;
 ; D:/TC/src/parser.c:809:                 token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_155->type
 ; D:/TC/src/parser.c:809:                 token = get_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp309, token
 ; D:/TC/src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	je	.L93	 ;,
.L96:
 ; D:/TC/src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC15(%rip), %rcx	 ;, tmp248
 ; D:/TC/src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp310
.L171:
 ; D:/TC/src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L80	 ;
.L109:
 ; D:/TC/src/parser.c:784:         if (base_name != NULL) {
	testq	%rbx, %rbx	 ; base_name
	je	.L83	 ;,
 ; D:/TC/src/parser.c:786:             if (base_name->type != NULL)  // subroutine or variable or attribute or parameter
	movq	(%rbx), %r13	 ; base_name_118->type, class_name
 ; D:/TC/src/parser.c:785:             current_type = base_name;     // class or type
	testq	%r13, %r13	 ; class_name
	cmove	%rbx, %r13	 ; class_name,, base_name, class_name
.L83:
 ; D:/TC/src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	testq	%r12, %r12	 ; var_scope
	je	.L173	 ;,
.L84:
 ; D:/TC/src/parser.c:791:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp338
	movq	(%r14), %rcx	 ; token_129->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:791:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp298
	jne	.L174	 ;,
 ; D:/TC/src/parser.c:824:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp342
	movq	(%r14), %rcx	 ; token_129->lexeme,
	movq	(%rax), %rdx	 ; L_BRACKET_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:824:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp316
	je	.L99	 ;,
 ; D:/TC/src/parser.c:825:             token = get_next_token(lexer, true);  // consume '['
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:826:             token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:827:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	136(%rsp), %rdx	 ; now_scope,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rdi, %r8	 ; parser,
 ; D:/TC/src/parser.c:826:             token = get_next_token(lexer, true);
	movq	%rax, %r14	 ; tmp317, token
 ; D:/TC/src/parser.c:827:             Expression* index = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %r15	 ; tmp318, index
 ; D:/TC/src/parser.c:828:             if (index == NULL)
	testq	%rax, %rax	 ; index
	jne	.L100	 ;,
 ; D:/TC/src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC16(%rip), %rcx	 ;, tmp254
 ; D:/TC/src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp319
 ; D:/TC/src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L100:
 ; D:/TC/src/parser.c:830:             token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_186->type
 ; D:/TC/src/parser.c:830:             token = get_next_token(lexer, true);
	movq	%rax, %r14	 ; tmp320, token
 ; D:/TC/src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	jne	.L102	 ;,
 ; D:/TC/src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp256
	movq	(%r14), %rcx	 ; token_186->lexeme,
	movq	(%rax), %rdx	 ; R_BRACKET_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp322
	je	.L102	 ;,
 ; D:/TC/src/parser.c:836:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	xorl	%edx, %edx	 ;
	movq	%r15, %r9	 ; index,
	xorl	%r8d, %r8d	 ;
	movl	$3, %ecx	 ;,
	movq	%rdx, 32(%rsp)	 ;,
	movq	%rsi, %rdx	 ; variable_value,
	call	create_variable_access	 ;
	movq	%rax, %rsi	 ; tmp323, variable_value
.L98:
 ; D:/TC/src/parser.c:872:         token = peek_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	peek_next_token	 ;
	movq	%rax, %r14	 ; tmp333, token
.L82:
 ; D:/TC/src/parser.c:783:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%r14)	 ;, token_129->type
	je	.L109	 ;,
	jmp	.L110	 ;
.L173:
 ; D:/TC/src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	testq	%r13, %r13	 ; class_name
	je	.L84	 ;,
 ; D:/TC/src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r13)	 ;, current_type_122->kind
	jne	.L84	 ;,
 ; D:/TC/src/parser.c:790:             var_scope = current_type->ast_node.class->class_scope;
	movq	24(%r13), %rax	 ; current_type_122->ast_node.class, current_type_122->ast_node.class
	movq	16(%rax), %r12	 ; _126->class_scope, var_scope
	jmp	.L84	 ;
.L174:
 ; D:/TC/src/parser.c:792:             token = get_next_token(lexer, true);  // consume '('
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp299, token
 ; D:/TC/src/parser.c:793:             if (base_name == NULL)
	testq	%rbx, %rbx	 ; base_name
	jne	.L86	 ;,
 ; D:/TC/src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC12(%rip), %rcx	 ;, tmp240
 ; D:/TC/src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp300
	jmp	.L168	 ;
.L88:
 ; D:/TC/src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	movl	32(%rbx), %eax	 ; base_name_145->kind, tmp339
	decl	%eax	 ; tmp244
	cmpl	$1, %eax	 ;, tmp244
	jbe	.L87	 ;,
 ; D:/TC/src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC13(%rip), %rcx	 ;, tmp246
 ; D:/TC/src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp304
.L168:
 ; D:/TC/src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L87	 ;
.L93:
 ; D:/TC/src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp340
	movq	(%r12), %rcx	 ; token_155->lexeme,
	movq	(%rax), %rdx	 ; COMMA_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	testb	%al, %al	 ; tmp311
	je	.L94	 ;,
 ; D:/TC/src/parser.c:811:                     token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp312, token
 ; D:/TC/src/parser.c:811:                     token = get_next_token(lexer, true);
	jmp	.L91	 ;
.L94:
 ; D:/TC/src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_155->type
	jne	.L96	 ;,
 ; D:/TC/src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp250
	movq	(%r12), %rcx	 ; token_155->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp313
	jne	.L91	 ;,
	jmp	.L96	 ;
.L172:
 ; D:/TC/src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp341
	movq	(%r12), %rcx	 ; token_154->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp314
	je	.L97	 ;,
 ; D:/TC/src/parser.c:818:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%r14, 32(%rsp)	 ; args,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; variable_value,
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:819:             base_name = base_name->type;
	movq	(%rbx), %rbx	 ; base_name_174->type, base_name
 ; D:/TC/src/parser.c:818:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%rax, %rsi	 ; tmp315, variable_value
 ; D:/TC/src/parser.c:822:             if (base_name->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rbx)	 ;, base_name_175->kind
	jne	.L115	 ;,
 ; D:/TC/src/parser.c:823:                 var_scope = base_name->ast_node.class->class_scope;
	movq	24(%rbx), %rax	 ; base_name_175->ast_node.class, base_name_175->ast_node.class
	movq	16(%rax), %r12	 ; _177->class_scope, var_scope
	jmp	.L170	 ;
.L102:
 ; D:/TC/src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC17(%rip), %rcx	 ;, tmp255
 ; D:/TC/src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp321
	jmp	.L171	 ;
.L99:
 ; D:/TC/src/parser.c:837:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp343
	movq	(%r14), %rcx	 ; token_129->lexeme,
	movq	(%rax), %rdx	 ; DOT_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:837:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	 ; tmp324
	jne	.L103	 ;,
.L110:
 ; D:/TC/src/parser.c:756:         if (variable_value == NULL) {
	testq	%rsi, %rsi	 ; variable_value
	je	.L80	 ;,
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	 ; expr_value
 ; D:/TC/src/parser.c:701:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:/TC/src/parser.c:754:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %ebp	 ;, type
	jmp	.L61	 ;
.L103:
 ; D:/TC/src/parser.c:838:             token = get_next_token(lexer, true);  // consume '.'
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:839:             token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r14	 ; tmp325, token
 ; D:/TC/src/parser.c:840:             if (var_scope == NULL) {
	testq	%r12, %r12	 ; var_scope
	jne	.L104	 ;,
 ; D:/TC/src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC18(%rip), %rcx	 ;, tmp258
 ; D:/TC/src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp326
	jmp	.L171	 ;
.L104:
 ; D:/TC/src/parser.c:845:             if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_198->type
	je	.L105	 ;,
 ; D:/TC/src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC19(%rip), %rcx	 ;, tmp259
 ; D:/TC/src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp327
	jmp	.L171	 ;
.L105:
 ; D:/TC/src/parser.c:850:             base_name = search_name(var_scope, token->lexeme);
	movq	(%rax), %rdx	 ; token_198->lexeme,
	movq	%r12, %rcx	 ; var_scope,
	call	search_name	 ;
	movq	%rax, %rbx	 ; tmp328, base_name
 ; D:/TC/src/parser.c:851:             if (base_name == NULL) {
	testq	%rax, %rax	 ; base_name
	jne	.L106	 ;,
 ; D:/TC/src/parser.c:853:                 if (current_type != NULL) {
	testq	%r13, %r13	 ; class_name
	je	.L107	 ;,
 ; D:/TC/src/parser.c:854:                     if (current_type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r13)	 ;, current_type_122->kind
	je	.L169	 ;,
 ; D:/TC/src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	movq	0(%r13), %r13	 ; current_type_122->type, class_name
 ; D:/TC/src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	testq	%r13, %r13	 ; class_name
	je	.L107	 ;,
 ; D:/TC/src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r13)	 ;, _211->kind
	jne	.L116	 ;,
.L169:
 ; D:/TC/src/parser.c:857:                         class_name = current_type->type->name;
	movq	8(%r13), %r13	 ;, class_name
	jmp	.L107	 ;
.L116:
 ; D:/TC/src/parser.c:852:                 string class_name = NULL;
	xorl	%r13d, %r13d	 ; class_name
.L107:
 ; D:/TC/src/parser.c:859:                 string name = make_method_name(class_name, token->lexeme);
	movq	(%r14), %rdx	 ; token_198->lexeme,
	movq	%r13, %rcx	 ; class_name,
	call	make_method_name	 ;
 ; D:/TC/src/parser.c:860:                 base_name = search_name_use_strcmp(var_scope, name);
	movq	%r12, %rcx	 ; var_scope,
 ; D:/TC/src/parser.c:859:                 string name = make_method_name(class_name, token->lexeme);
	movq	%rax, %rdx	 ; tmp329, name
 ; D:/TC/src/parser.c:860:                 base_name = search_name_use_strcmp(var_scope, name);
	call	search_name_use_strcmp	 ;
	movq	%rax, %rbx	 ; tmp330, base_name
 ; D:/TC/src/parser.c:862:             if (base_name == NULL) {
	testq	%rax, %rax	 ; base_name
	jne	.L106	 ;,
 ; D:/TC/src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC20(%rip), %rcx	 ;, tmp260
 ; D:/TC/src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp331
	jmp	.L171	 ;
.L106:
 ; D:/TC/src/parser.c:867:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	xorl	%eax, %eax	 ;
	movq	%rsi, %rdx	 ; variable_value,
	xorl	%r9d, %r9d	 ;
	movq	%rbx, %r8	 ; base_name,
	movq	%rax, 32(%rsp)	 ;,
	movl	$2, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, %rsi	 ; tmp332, variable_value
.L115:
 ; D:/TC/src/parser.c:821:             var_scope = NULL;
	xorl	%r12d, %r12d	 ; var_scope
.L170:
 ; D:/TC/src/parser.c:820:             current_type = NULL;
	xorl	%r13d, %r13d	 ; class_name
	jmp	.L98	 ;
.L80:
 ; D:/TC/src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC21(%rip), %rcx	 ;, tmp261
 ; D:/TC/src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp334
	jmp	.L167	 ;
.L77:
 ; D:/TC/src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC22(%rip), %rcx	 ;, tmp262
 ; D:/TC/src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp335
	jmp	.L167	 ;
.L59:
 ; D:/TC/src/parser.c:768: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
	.section .rdata,"dr"
.LC23:
	.ascii "Expected '(' after 'if'\0"
.LC24:
	.ascii "Failed to parse if condition\0"
.LC25:
	.ascii "Expected ')' after if condition\0"
.LC26:
	.ascii "Expected '{' to start if body\0"
.LC27:
	.ascii "Failed to parse if body statement\0"
.LC28:
	.ascii "Expected '(' after 'elif'\0"
.LC29:
	.ascii "Failed to parse else-if condition\0"
.LC30:
	.ascii "Expected ')' after else-if condition\0"
.LC31:
	.ascii "Expected '{' to start else-if body\0"
.LC32:
	.ascii "Failed to parse else-if body statement\0"
.LC33:
	.ascii "Expected '{' to start else body\0"
.LC34:
	.ascii "Failed to parse else body statement\0"
.LC35:
	.ascii "Expected '(' after 'for'\0"
.LC36:
	.ascii "Failed to parse for loop initializer\0"
.LC37:
	.ascii "Expected ';' after for loop initializer\0"
.LC38:
	.ascii "Failed to parse for loop condition\0"
.LC39:
	.ascii "Expected ';' after for loop condition\0"
.LC40:
	.ascii "Failed to parse for loop increment\0"
.LC41:
	.ascii "Expected ')' after for loop increment\0"
.LC42:
	.ascii "Expected '{' to start for loop body\0"
.LC43:
	.ascii "Failed to parse for loop body statement\0"
.LC44:
	.ascii "Expected '(' after 'while'\0"
.LC45:
	.ascii "Failed to parse while condition\0"
.LC46:
	.ascii "Expected ')' after while condition\0"
.LC47:
	.ascii "Expected '{' to start while body\0"
.LC48:
	.ascii "Failed to parse while body statement\0"
.LC49:
	.ascii "Cannot use 'break' outside of a loop\0"
.LC50:
	.ascii "Cannot use 'continue' outside of a loop\0"
.LC51:
	.ascii "Failed to parse statement\0"
.LC52:
	.ascii "Expected ';' after statement\0"
	.text
	.def	parse_statement;	.scl	3;	.type	32;	.endef
parse_statement:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%r8, %rbx	 ; tmp415, parser
	subq	$88, %rsp	 ;,
 ; D:/TC/src/parser.c:397: Statement* parse_statement(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
	movq	%rcx, 160(%rsp)	 ; tmp413, lexer
	movq	%rdx, 168(%rsp)	 ; tmp414, now_scope
 ; D:/TC/src/parser.c:400:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
 ; D:/TC/src/parser.c:402:     if (token->type == KEYWORD) {
	cmpl	$6, 24(%rax)	 ;, token_60->type
	jne	.L176	 ;,
	movq	%rax, %rsi	 ; tmp416, token
 ; D:/TC/src/parser.c:403:         if (string_equal(token->lexeme, IF_KEYWORD))
	movq	.refptr.IF_KEYWORD(%rip), %rax	 ;, tmp331
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; IF_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:403:         if (string_equal(token->lexeme, IF_KEYWORD))
	testb	%al, %al	 ; tmp417
	je	.L177	 ;,
 ; D:/TC/src/parser.c:449:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_114->type
 ; D:/TC/src/parser.c:449:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp418, token
 ; D:/TC/src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L178	 ;,
.L180:
 ; D:/TC/src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC23(%rip), %rcx	 ;, tmp332
 ; D:/TC/src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp419
	jmp	.L350	 ;
.L178:
 ; D:/TC/src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp553
	movq	(%rsi), %rcx	 ; token_114->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp420
	je	.L180	 ;,
 ; D:/TC/src/parser.c:455:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:456:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
 ; D:/TC/src/parser.c:455:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp421, token
 ; D:/TC/src/parser.c:456:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rdi	 ; tmp422, condition
 ; D:/TC/src/parser.c:457:     if (condition == NULL)
	testq	%rax, %rax	 ; condition
	jne	.L181	 ;,
 ; D:/TC/src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC24(%rip), %rcx	 ;, tmp334
 ; D:/TC/src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp423
 ; D:/TC/src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L181:
 ; D:/TC/src/parser.c:459:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_125->type
 ; D:/TC/src/parser.c:459:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp424, token
 ; D:/TC/src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L182	 ;,
.L183:
 ; D:/TC/src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC25(%rip), %rcx	 ;, tmp335
 ; D:/TC/src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp425
.L350:
 ; D:/TC/src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:453:         return NULL;
	xorl	%edx, %edx	 ; _222
	jmp	.L205	 ;
.L182:
 ; D:/TC/src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp554
	movq	(%rsi), %rcx	 ; token_125->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp426
	je	.L183	 ;,
 ; D:/TC/src/parser.c:465:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_132->type
 ; D:/TC/src/parser.c:465:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp427, token
 ; D:/TC/src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L184	 ;,
.L185:
 ; D:/TC/src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC26(%rip), %rcx	 ;, tmp337
 ; D:/TC/src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp428
	jmp	.L350	 ;
.L184:
 ; D:/TC/src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %r14	 ;, tmp338
	movq	(%rax), %rcx	 ; token_132->lexeme,
	movq	(%r14), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp429
	je	.L185	 ;,
 ; D:/TC/src/parser.c:471:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:472:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	leaq	.LC27(%rip), %rbp	 ;, tmp408
 ; D:/TC/src/parser.c:471:     list(Statement*) body = create_list();
	movq	%rax, 56(%rsp)	 ; tmp430, %sfp
 ; D:/TC/src/parser.c:472:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12	 ;, tmp407
 ; D:/TC/src/parser.c:472:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp431, token
.L186:
 ; D:/TC/src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_144->type
	je	.L356	 ;,
.L188:
 ; D:/TC/src/parser.c:474:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %r13	 ; tmp432, statement
 ; D:/TC/src/parser.c:475:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L187	 ;,
 ; D:/TC/src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%rbp, %rcx	 ; tmp408,
 ; D:/TC/src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp433
 ; D:/TC/src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L187:
 ; D:/TC/src/parser.c:477:         list_append(body, (pointer)statement);
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%r13, %rdx	 ; statement,
	call	list_append	 ;
 ; D:/TC/src/parser.c:478:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp434, token
	jmp	.L186	 ;
.L356:
 ; D:/TC/src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_BRACE_SYMBOL,
	movq	(%rsi), %rcx	 ; token_144->lexeme,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp435
	je	.L188	 ;,
 ; D:/TC/src/parser.c:480:     list(ElseIf*) else_if = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	leaq	.LC32(%rip), %r15	 ;, tmp405
 ; D:/TC/src/parser.c:480:     list(ElseIf*) else_if = create_list();
	movq	%rax, 64(%rsp)	 ; tmp436, %sfp
 ; D:/TC/src/parser.c:481:     list(Statement*) else_body = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:482:     token = peek_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:481:     list(Statement*) else_body = create_list();
	movq	%rax, 72(%rsp)	 ; tmp437, %sfp
 ; D:/TC/src/parser.c:482:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
	movq	%rax, %rsi	 ; tmp438, token
.L189:
 ; D:/TC/src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rsi)	 ;, token_194->type
	jne	.L201	 ;,
 ; D:/TC/src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	movq	.refptr.ELIF_KEYWORD(%rip), %rax	 ;, tmp558
	movq	(%rsi), %rcx	 ; token_194->lexeme,
	movq	(%rax), %rdx	 ; ELIF_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	 ; tmp459
	je	.L357	 ;,
 ; D:/TC/src/parser.c:484:         token = get_next_token(lexer, true);  // consume 'elif'
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:485:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_153->type
 ; D:/TC/src/parser.c:485:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp439, token
 ; D:/TC/src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L190	 ;,
.L191:
 ; D:/TC/src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC28(%rip), %rcx	 ;, tmp341
 ; D:/TC/src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp440
	jmp	.L350	 ;
.L190:
 ; D:/TC/src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp555
	movq	(%rsi), %rcx	 ; token_153->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp441
	je	.L191	 ;,
 ; D:/TC/src/parser.c:491:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:492:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
 ; D:/TC/src/parser.c:491:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp442, token
 ; D:/TC/src/parser.c:492:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %r12	 ; tmp443, elif_condition
 ; D:/TC/src/parser.c:493:         if (elif_condition == NULL)
	testq	%rax, %rax	 ; elif_condition
	jne	.L192	 ;,
 ; D:/TC/src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC29(%rip), %rcx	 ;, tmp343
 ; D:/TC/src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp444
 ; D:/TC/src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L192:
 ; D:/TC/src/parser.c:495:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_165->type
 ; D:/TC/src/parser.c:495:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp445, token
 ; D:/TC/src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L193	 ;,
.L194:
 ; D:/TC/src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC30(%rip), %rcx	 ;, tmp344
 ; D:/TC/src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp446
	jmp	.L350	 ;
.L193:
 ; D:/TC/src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp556
	movq	(%rsi), %rcx	 ; token_165->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp447
	je	.L194	 ;,
 ; D:/TC/src/parser.c:501:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_173->type
 ; D:/TC/src/parser.c:501:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp448, token
 ; D:/TC/src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L195	 ;,
.L196:
 ; D:/TC/src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC31(%rip), %rcx	 ;, tmp346
 ; D:/TC/src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp449
	jmp	.L350	 ;
.L195:
 ; D:/TC/src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; L_BRACE_SYMBOL,
	movq	(%rax), %rcx	 ; token_173->lexeme,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp450
	je	.L196	 ;,
 ; D:/TC/src/parser.c:507:         list(Statement*) elif_body = create_list();
	call	create_list	 ;
	movq	%rax, %r13	 ; tmp451, elif_body
.L349:
 ; D:/TC/src/parser.c:514:             token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_186->type
 ; D:/TC/src/parser.c:514:             token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp455, token
 ; D:/TC/src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	je	.L358	 ;,
.L199:
 ; D:/TC/src/parser.c:510:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %rbp	 ; tmp453, statement
 ; D:/TC/src/parser.c:511:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L198	 ;,
 ; D:/TC/src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r15, %rcx	 ; tmp405,
 ; D:/TC/src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp454
 ; D:/TC/src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L198:
 ; D:/TC/src/parser.c:513:             list_append(elif_body, (pointer)statement);
	movq	%rbp, %rdx	 ; statement,
	movq	%r13, %rcx	 ; elif_body,
	call	list_append	 ;
	jmp	.L349	 ;
.L358:
 ; D:/TC/src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp557
	movq	(%rsi), %rcx	 ; token_186->lexeme,
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp456
	je	.L199	 ;,
 ; D:/TC/src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%r13, %rdx	 ; elif_body,
	movq	%r12, %rcx	 ; elif_condition,
	call	create_else_if	 ;
 ; D:/TC/src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	64(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%rax, %rdx	 ; tmp457, _192
 ; D:/TC/src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	call	list_append	 ;
 ; D:/TC/src/parser.c:517:         token = peek_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	peek_next_token	 ;
	movq	%rax, %rsi	 ; tmp458, token
	jmp	.L189	 ;
.L357:
 ; D:/TC/src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, 24(%rsi)	 ;, token_194->type
	jne	.L201	 ;,
 ; D:/TC/src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	movq	.refptr.ELSE_KEYWORD(%rip), %rax	 ;, tmp351
	movq	(%rsi), %rcx	 ; token_194->lexeme,
	movq	(%rax), %rdx	 ; ELSE_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	 ; tmp461
	jne	.L359	 ;,
.L201:
 ; D:/TC/src/parser.c:536:     token = peek_current_token(lexer);
	movq	160(%rsp), %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:/TC/src/parser.c:538:     return create_if(condition, body, else_if, else_body);
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	72(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rcx	 ; condition,
	movq	64(%rsp), %r8	 ; %sfp,
	call	create_if	 ;
	movq	%rax, %rdx	 ; tmp460, _222
	jmp	.L205	 ;
.L359:
 ; D:/TC/src/parser.c:520:         token = get_next_token(lexer, true);  // consume 'else'
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:521:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_204->type
 ; D:/TC/src/parser.c:521:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp462, token
 ; D:/TC/src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L206	 ;,
.L207:
 ; D:/TC/src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC33(%rip), %rcx	 ;, tmp352
 ; D:/TC/src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp463
	jmp	.L350	 ;
.L206:
 ; D:/TC/src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; L_BRACE_SYMBOL,
	movq	(%rax), %rcx	 ; token_204->lexeme,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp464
	je	.L207	 ;,
 ; D:/TC/src/parser.c:527:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	leaq	.LC34(%rip), %r12	 ;, tmp401
 ; D:/TC/src/parser.c:527:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r13	 ;, tmp400
 ; D:/TC/src/parser.c:527:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp465, token
.L208:
 ; D:/TC/src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_215->type
	je	.L360	 ;,
.L210:
 ; D:/TC/src/parser.c:529:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %r14	 ; tmp466, statement
 ; D:/TC/src/parser.c:530:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L209	 ;,
 ; D:/TC/src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r12, %rcx	 ; tmp401,
 ; D:/TC/src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp467
 ; D:/TC/src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L209:
 ; D:/TC/src/parser.c:532:             list_append(else_body, (pointer)statement);
	movq	72(%rsp), %rcx	 ; %sfp,
	movq	%r14, %rdx	 ; statement,
	call	list_append	 ;
 ; D:/TC/src/parser.c:533:             token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp468, token
	jmp	.L208	 ;
.L360:
 ; D:/TC/src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%r13), %rdx	 ; R_BRACE_SYMBOL,
	movq	(%rsi), %rcx	 ; token_215->lexeme,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp469
	je	.L210	 ;,
	jmp	.L201	 ;
.L205:
 ; D:/TC/src/parser.c:404:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	xorl	%edi, %edi	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$2, %ecx	 ;,
	movq	%rdi, 40(%rsp)	 ;,
	movq	%rdi, 32(%rsp)	 ;,
	jmp	.L355	 ;
.L177:
 ; D:/TC/src/parser.c:405:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	movq	.refptr.FOR_KEYWORD(%rip), %rax	 ;, tmp356
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; FOR_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:405:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	testb	%al, %al	 ; tmp471
	je	.L212	 ;,
 ; D:/TC/src/parser.c:543:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_223->type
 ; D:/TC/src/parser.c:543:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp472, token
 ; D:/TC/src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L213	 ;,
.L215:
 ; D:/TC/src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC35(%rip), %rcx	 ;, tmp357
 ; D:/TC/src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp473
	jmp	.L351	 ;
.L213:
 ; D:/TC/src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp358
	movq	(%rsi), %rcx	 ; token_223->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp474
	je	.L215	 ;,
 ; D:/TC/src/parser.c:549:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_230->type
 ; D:/TC/src/parser.c:549:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp475, token
 ; D:/TC/src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	je	.L216	 ;,
.L219:
 ; D:/TC/src/parser.c:552:         initializer = parse_variable(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_variable	 ;
	movq	%rax, %rdi	 ; tmp476, initializer
 ; D:/TC/src/parser.c:553:         if (initializer == NULL)
	testq	%rax, %rax	 ; initializer
	jne	.L218	 ;,
 ; D:/TC/src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC36(%rip), %rcx	 ;, tmp360
 ; D:/TC/src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp478
 ; D:/TC/src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L218	 ;
.L216:
 ; D:/TC/src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp359
	movq	(%rsi), %rcx	 ; token_230->lexeme,
 ; D:/TC/src/parser.c:550:     Variable* initializer = NULL;
	xorl	%edi, %edi	 ; initializer
 ; D:/TC/src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp477
	jne	.L220	 ;,
	jmp	.L219	 ;
.L218:
 ; D:/TC/src/parser.c:555:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp479, token
.L220:
 ; D:/TC/src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_239->type
	je	.L221	 ;,
.L223:
 ; D:/TC/src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC37(%rip), %rcx	 ;, tmp361
 ; D:/TC/src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp480
.L351:
 ; D:/TC/src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:547:         return NULL;
	xorl	%r9d, %r9d	 ; _300
	jmp	.L222	 ;
.L221:
 ; D:/TC/src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r12	 ;, tmp362
	movq	(%rsi), %rcx	 ; token_239->lexeme,
	movq	(%r12), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp481
	je	.L223	 ;,
 ; D:/TC/src/parser.c:562:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_246->type
 ; D:/TC/src/parser.c:562:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp482, token
 ; D:/TC/src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	je	.L224	 ;,
.L227:
 ; D:/TC/src/parser.c:565:         condition = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_expression	 ;
	movq	%rax, %rbp	 ; tmp483, condition
 ; D:/TC/src/parser.c:566:         if (condition == NULL)
	testq	%rax, %rax	 ; condition
	jne	.L226	 ;,
 ; D:/TC/src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC38(%rip), %rcx	 ;, tmp364
 ; D:/TC/src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp485
 ; D:/TC/src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L226	 ;
.L224:
 ; D:/TC/src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r12), %rdx	 ; SEMICOLON_SYMBOL,
	movq	(%rax), %rcx	 ; token_246->lexeme,
 ; D:/TC/src/parser.c:563:     Expression* condition = NULL;
	xorl	%ebp, %ebp	 ; condition
 ; D:/TC/src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	call	string_equal	 ;
 ; D:/TC/src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp484
	jne	.L228	 ;,
	jmp	.L227	 ;
.L226:
 ; D:/TC/src/parser.c:568:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp486, token
.L228:
 ; D:/TC/src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_255->type
	je	.L229	 ;,
.L230:
 ; D:/TC/src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC39(%rip), %rcx	 ;, tmp365
 ; D:/TC/src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp487
	jmp	.L351	 ;
.L229:
 ; D:/TC/src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r12), %rdx	 ; SEMICOLON_SYMBOL,
	movq	(%rsi), %rcx	 ; token_255->lexeme,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp488
	je	.L230	 ;,
 ; D:/TC/src/parser.c:575:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_262->type
 ; D:/TC/src/parser.c:575:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp489, token
 ; D:/TC/src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L231	 ;,
.L234:
 ; D:/TC/src/parser.c:578:         increment = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_expression	 ;
	movq	%rax, %r12	 ; tmp490, increment
 ; D:/TC/src/parser.c:579:         if (increment == NULL)
	testq	%rax, %rax	 ; increment
	jne	.L233	 ;,
 ; D:/TC/src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC40(%rip), %rcx	 ;, tmp368
 ; D:/TC/src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp492
 ; D:/TC/src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L233	 ;
.L231:
 ; D:/TC/src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp367
	movq	(%rsi), %rcx	 ; token_262->lexeme,
 ; D:/TC/src/parser.c:576:     Expression* increment = NULL;
	xorl	%r12d, %r12d	 ; increment
 ; D:/TC/src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp491
	jne	.L235	 ;,
	jmp	.L234	 ;
.L233:
 ; D:/TC/src/parser.c:581:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp493, token
.L235:
 ; D:/TC/src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_271->type
	je	.L236	 ;,
.L237:
 ; D:/TC/src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC41(%rip), %rcx	 ;, tmp369
 ; D:/TC/src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp494
	jmp	.L351	 ;
.L236:
 ; D:/TC/src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp370
	movq	(%rsi), %rcx	 ; token_271->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp495
	je	.L237	 ;,
 ; D:/TC/src/parser.c:588:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_278->type
 ; D:/TC/src/parser.c:588:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp496, token
 ; D:/TC/src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L238	 ;,
.L239:
 ; D:/TC/src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC42(%rip), %rcx	 ;, tmp371
 ; D:/TC/src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp497
	jmp	.L351	 ;
.L238:
 ; D:/TC/src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp372
	movq	(%rsi), %rcx	 ; token_278->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp498
	je	.L239	 ;,
 ; D:/TC/src/parser.c:594:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:595:     parser->in_loop = true;
	movb	$1, 11(%rbx)	 ;, parser_62(D)->in_loop
 ; D:/TC/src/parser.c:596:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:594:     list(Statement*) body = create_list();
	movq	%rax, %r13	 ; tmp499, body
 ; D:/TC/src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	leaq	.LC43(%rip), %r14	 ;, tmp410
 ; D:/TC/src/parser.c:596:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp500, token
.L240:
 ; D:/TC/src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_290->type
	je	.L361	 ;,
.L242:
 ; D:/TC/src/parser.c:598:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %r15	 ; tmp501, statement
 ; D:/TC/src/parser.c:599:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L241	 ;,
 ; D:/TC/src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r14, %rcx	 ; tmp410,
 ; D:/TC/src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp502
 ; D:/TC/src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L241:
 ; D:/TC/src/parser.c:601:         list_append(body, (pointer)statement);
	movq	%r15, %rdx	 ; statement,
	movq	%r13, %rcx	 ; body,
	call	list_append	 ;
 ; D:/TC/src/parser.c:602:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp503, token
	jmp	.L240	 ;
.L361:
 ; D:/TC/src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp559
	movq	(%rsi), %rcx	 ; token_290->lexeme,
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp504
	je	.L242	 ;,
 ; D:/TC/src/parser.c:604:     parser->in_loop = false;
	movb	$0, 11(%rbx)	 ;, parser_62(D)->in_loop
 ; D:/TC/src/parser.c:606:     return create_for(initializer, condition, increment, body);
	movq	%r13, %r9	 ; body,
	movq	%r12, %r8	 ; increment,
	movq	%rbp, %rdx	 ; condition,
	movq	%rdi, %rcx	 ; initializer,
	call	create_for	 ;
	movq	%rax, %r9	 ; tmp505, _300
.L222:
 ; D:/TC/src/parser.c:406:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	xorl	%esi, %esi	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$4, %ecx	 ;,
	movq	%rsi, 40(%rsp)	 ;,
	movq	%rsi, 32(%rsp)	 ;,
.L355:
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp506, <retval>
 ; D:/TC/src/parser.c:406:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L175	 ;
.L212:
 ; D:/TC/src/parser.c:407:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	movq	.refptr.WHILE_KEYWORD(%rip), %rax	 ;, tmp375
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; WHILE_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:407:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	testb	%al, %al	 ; tmp507
	je	.L243	 ;,
 ; D:/TC/src/parser.c:611:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_301->type
 ; D:/TC/src/parser.c:611:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp508, token
 ; D:/TC/src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L244	 ;,
.L246:
 ; D:/TC/src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC44(%rip), %rcx	 ;, tmp376
 ; D:/TC/src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp509
	jmp	.L352	 ;
.L244:
 ; D:/TC/src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp377
	movq	(%rsi), %rcx	 ; token_301->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp510
	je	.L246	 ;,
 ; D:/TC/src/parser.c:617:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:618:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
 ; D:/TC/src/parser.c:617:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp511, token
 ; D:/TC/src/parser.c:618:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rdi	 ; tmp512, condition
 ; D:/TC/src/parser.c:619:     if (condition == NULL)
	testq	%rax, %rax	 ; condition
	jne	.L247	 ;,
 ; D:/TC/src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC45(%rip), %rcx	 ;, tmp378
 ; D:/TC/src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp513
 ; D:/TC/src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L247:
 ; D:/TC/src/parser.c:621:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_312->type
 ; D:/TC/src/parser.c:621:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp514, token
 ; D:/TC/src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L248	 ;,
.L250:
 ; D:/TC/src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC46(%rip), %rcx	 ;, tmp379
 ; D:/TC/src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp515
.L352:
 ; D:/TC/src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:615:         return NULL;
	xorl	%r8d, %r8d	 ; _338
	jmp	.L249	 ;
.L248:
 ; D:/TC/src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp380
	movq	(%rsi), %rcx	 ; token_312->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp516
	je	.L250	 ;,
 ; D:/TC/src/parser.c:627:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_319->type
 ; D:/TC/src/parser.c:627:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp517, token
 ; D:/TC/src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L251	 ;,
.L252:
 ; D:/TC/src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC47(%rip), %rcx	 ;, tmp381
 ; D:/TC/src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp518
	jmp	.L352	 ;
.L251:
 ; D:/TC/src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp382
	movq	(%rsi), %rcx	 ; token_319->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp519
	je	.L252	 ;,
 ; D:/TC/src/parser.c:633:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:634:     parser->in_loop = true;
	movb	$1, 11(%rbx)	 ;, parser_62(D)->in_loop
 ; D:/TC/src/parser.c:635:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:633:     list(Statement*) body = create_list();
	movq	%rax, %rbp	 ; tmp520, body
 ; D:/TC/src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	leaq	.LC48(%rip), %r13	 ;, tmp412
 ; D:/TC/src/parser.c:635:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12	 ;, tmp411
 ; D:/TC/src/parser.c:635:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp521, token
.L253:
 ; D:/TC/src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_331->type
	je	.L362	 ;,
.L255:
 ; D:/TC/src/parser.c:637:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %r14	 ; tmp522, statement
 ; D:/TC/src/parser.c:638:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L254	 ;,
 ; D:/TC/src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r13, %rcx	 ; tmp412,
 ; D:/TC/src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp523
 ; D:/TC/src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L254:
 ; D:/TC/src/parser.c:640:         list_append(body, (pointer)statement);
	movq	%r14, %rdx	 ; statement,
	movq	%rbp, %rcx	 ; body,
	call	list_append	 ;
 ; D:/TC/src/parser.c:641:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp524, token
	jmp	.L253	 ;
.L362:
 ; D:/TC/src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_BRACE_SYMBOL,
	movq	(%rsi), %rcx	 ; token_331->lexeme,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp525
	je	.L255	 ;,
 ; D:/TC/src/parser.c:643:     parser->in_loop = false;
	movb	$0, 11(%rbx)	 ;, parser_62(D)->in_loop
 ; D:/TC/src/parser.c:645:     return create_while(condition, body);
	movq	%rbp, %rdx	 ; body,
	movq	%rdi, %rcx	 ; condition,
	call	create_while	 ;
	movq	%rax, %r8	 ; tmp526, _338
.L249:
 ; D:/TC/src/parser.c:408:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	xorl	%ebx, %ebx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$3, %ecx	 ;,
	movq	%rbx, 40(%rsp)	 ;,
	movq	%rbx, 32(%rsp)	 ;,
	jmp	.L355	 ;
.L243:
 ; D:/TC/src/parser.c:409:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp385
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; VAR_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:409:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; tmp528
	je	.L256	 ;,
 ; D:/TC/src/parser.c:410:             get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:411:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_variable	 ;
 ; D:/TC/src/parser.c:411:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	xorl	%r11d, %r11d	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rax, 40(%rsp)	 ; tmp529,
	xorl	%edx, %edx	 ;
	movl	$1, %ecx	 ;,
	movq	%r11, 32(%rsp)	 ;,
	jmp	.L354	 ;
.L256:
 ; D:/TC/src/parser.c:412:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	movq	.refptr.RETURN_KEYWORD(%rip), %rax	 ;, tmp386
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; RETURN_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:412:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	 ; tmp531
	je	.L258	 ;,
 ; D:/TC/src/parser.c:413:             token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_85->type
	jne	.L259	 ;,
 ; D:/TC/src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rdx	 ;, tmp387
	movq	(%rax), %rcx	 ; token_85->lexeme,
	movq	(%rdx), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp533
	je	.L259	 ;,
 ; D:/TC/src/parser.c:416:                 return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r10d, %r10d	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%r10, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	movq	%r10, 32(%rsp)	 ;,
	jmp	.L355	 ;
.L259:
 ; D:/TC/src/parser.c:418:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_expression	 ;
 ; D:/TC/src/parser.c:418:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%r9, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	xorl	%r9d, %r9d	 ;
	movq	%rax, 32(%rsp)	 ; tmp535,
	jmp	.L354	 ;
.L258:
 ; D:/TC/src/parser.c:419:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	movq	.refptr.BREAK_KEYWORD(%rip), %rax	 ;, tmp388
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; BREAK_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:419:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	 ; tmp537
	je	.L260	 ;,
 ; D:/TC/src/parser.c:420:             if (!parser->in_loop) {
	cmpb	$0, 11(%rbx)	 ;, parser_62(D)->in_loop
	jne	.L261	 ;,
 ; D:/TC/src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC49(%rip), %rcx	 ;, tmp389
 ; D:/TC/src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp538
	jmp	.L353	 ;
.L261:
 ; D:/TC/src/parser.c:425:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r8d, %r8d	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$6, %ecx	 ;,
	movq	%r8, 40(%rsp)	 ;,
	movq	%r8, 32(%rsp)	 ;,
	xorl	%r8d, %r8d	 ;
	jmp	.L354	 ;
.L260:
 ; D:/TC/src/parser.c:426:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax	 ;, tmp390
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; CONTINUE_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:426:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	 ; tmp540
	je	.L176	 ;,
 ; D:/TC/src/parser.c:427:             if (!parser->in_loop) {
	cmpb	$0, 11(%rbx)	 ;, parser_62(D)->in_loop
	jne	.L264	 ;,
 ; D:/TC/src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC50(%rip), %rcx	 ;, tmp391
 ; D:/TC/src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp541
.L353:
 ; D:/TC/src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:423:                 return NULL;
	xorl	%esi, %esi	 ; <retval>
	jmp	.L175	 ;
.L264:
 ; D:/TC/src/parser.c:432:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%ecx, %ecx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rcx, 40(%rsp)	 ;,
	movq	%rcx, 32(%rsp)	 ;,
	movl	$7, %ecx	 ;,
	jmp	.L354	 ;
.L176:
 ; D:/TC/src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_expression	 ;
 ; D:/TC/src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rax, 32(%rsp)	 ; tmp545,
	xorl	%ecx, %ecx	 ;
	movq	%rdx, 40(%rsp)	 ;,
	xorl	%edx, %edx	 ;
.L354:
	call	create_statement	 ;
 ; D:/TC/src/parser.c:437:     token = peek_current_token(lexer);
	movq	160(%rsp), %rcx	 ; lexer,
 ; D:/TC/src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rax, %rsi	 ; tmp546, <retval>
 ; D:/TC/src/parser.c:437:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rdi	 ; tmp547, token
 ; D:/TC/src/parser.c:438:     if (statement == NULL)
	testq	%rsi, %rsi	 ; <retval>
	jne	.L265	 ;,
 ; D:/TC/src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC51(%rip), %rcx	 ;, tmp392
 ; D:/TC/src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp548
 ; D:/TC/src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L265:
 ; D:/TC/src/parser.c:440:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_110->type
 ; D:/TC/src/parser.c:440:     token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp549, token
 ; D:/TC/src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	je	.L266	 ;,
.L268:
 ; D:/TC/src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC52(%rip), %rcx	 ;, tmp393
 ; D:/TC/src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp550
 ; D:/TC/src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L175	 ;
.L266:
 ; D:/TC/src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp394
	movq	(%rdi), %rcx	 ; token_110->lexeme,
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp551
	je	.L268	 ;,
.L175:
 ; D:/TC/src/parser.c:445: }
	addq	$88, %rsp	 ;,
	movq	%rsi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
	.section .rdata,"dr"
.LC53:
	.ascii "Expected identifier after 'import'\0"
.LC54:
	.ascii "Expected string literal after 'from'\0"
.LC55:
	.ascii "Expected ';' at end of import statement\0"
.LC56:
	.ascii "Failed to import module '%s' from source '%s'\12\0"
.LC57:
	.ascii "Failed to parse import statement\0"
.LC58:
	.ascii "Expected function return type after 'func'\0"
.LC59:
	.ascii "Unknown function return type\0"
.LC60:
	.ascii "Expected function name after return type\0"
.LC61:
	.ascii "Expected '(' after function name\0"
.LC62:
	.ascii "Failed to parse function parameter\0"
.LC63:
	.ascii "Function parameters cannot have default values\0"
.LC64:
	.ascii "Expected ',' or ')' after function parameter\0"
.LC65:
	.ascii "Expected '{' to start function body\0"
.LC66:
	.ascii "Failed to parse function body statement\0"
.LC67:
	.ascii "Unreachable code after return statement\0"
.LC68:
	.ascii "Function missing return statement\0"
.LC69:
	.ascii "Failed to parse function declaration\0"
.LC70:
	.ascii "Expected class name after 'class'\0"
.LC71:
	.ascii "Expected '{' to start class body\0"
.LC72:
	.ascii "Expected method return type after 'method'\0"
.LC73:
	.ascii "Unknown return type for method\0"
.LC74:
	.ascii "Expected method name after return type\0"
.LC75:
	.ascii "Expected '(' after method name\0"
.LC76:
	.ascii "Expected 'self' as first parameter of method\0"
.LC77:
	.ascii "Expected ',' or ')' after method parameter\0"
.LC78:
	.ascii "Failed to parse method parameter\0"
.LC79:
	.ascii "Method parameters cannot have default values\0"
.LC80:
	.ascii "Expected '{' to start method body\0"
.LC81:
	.ascii "Failed to parse method body statement\0"
.LC82:
	.ascii "Method missing return statement\0"
.LC83:
	.ascii "Failed to parse class method\0"
.LC84:
	.ascii "Failed to parse class variable\0"
.LC85:
	.ascii "[warning] Unsupported type for class variable '%s': %s\12\0"
.LC86:
	.ascii "Expected ';' after class variable declaration\0"
.LC87:
	.ascii "Unexpected token in class member\0"
.LC88:
	.ascii "Constructor name conflicts with existing member\0"
.LC89:
	.ascii "0\0"
.LC90:
	.ascii "Failed to parse class declaration\0"
.LC91:
	.ascii "Unexpected token in code member\0"
	.text
	.globl	parse_code
	.def	parse_code;	.scl	2;	.type	32;	.endef
parse_code:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp592, now_scope
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%r8, %rbx	 ; tmp593, parser
	subq	$152, %rsp	 ;,
 ; D:/TC/src/parser.c:24:     if (builtin_scope == NULL) {
	movq	.refptr.builtin_scope(%rip), %rsi	 ;, tmp447
 ; D:/TC/src/parser.c:22: Code* parse_code(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
	movq	%rcx, 48(%rsp)	 ; tmp591, %sfp
 ; D:/TC/src/parser.c:24:     if (builtin_scope == NULL) {
	cmpq	$0, (%rsi)	 ;, builtin_scope
	jne	.L364	 ;,
 ; D:/TC/src/parser.c:25:         builtin_scope = create_symbol_table(NULL);
	xorl	%ecx, %ecx	 ;
	call	create_symbol_table	 ;
 ; D:/TC/src/parser.c:26:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	xorl	%r8d, %r8d	 ;
	movl	$6, %edx	 ;,
 ; D:/TC/src/parser.c:25:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, %r9	 ; tmp594, _2
 ; D:/TC/src/parser.c:25:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, (%rsi)	 ; _2, builtin_scope
 ; D:/TC/src/parser.c:26:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp449
	movq	(%rax), %rcx	 ; VOID_KEYWORD,
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:26:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp450
 ; D:/TC/src/parser.c:27:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/parser.c:26:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp595, name_void
 ; D:/TC/src/parser.c:27:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp452
	movl	$6, %edx	 ;,
	movq	(%rax), %rcx	 ; INT_KEYWORD,
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:27:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp453
 ; D:/TC/src/parser.c:28:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/parser.c:27:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp596, name_int
 ; D:/TC/src/parser.c:28:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp455
	movl	$6, %edx	 ;,
	movq	(%rax), %rcx	 ; FLOAT_KEYWORD,
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:28:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp456
 ; D:/TC/src/parser.c:29:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/parser.c:28:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp597, name_float
 ; D:/TC/src/parser.c:29:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp458
	movl	$6, %edx	 ;,
	movq	(%rax), %rcx	 ; STRING_KEYWORD,
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:29:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp459
 ; D:/TC/src/parser.c:30:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/parser.c:29:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp598, name_string
 ; D:/TC/src/parser.c:30:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp461
	movl	$6, %edx	 ;,
	movq	(%rax), %rcx	 ; BOOL_KEYWORD,
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:30:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp462
	movq	%rax, (%rdx)	 ; tmp599, name_bool
.L364:
 ; D:/TC/src/parser.c:32:     if (now_scope == NULL)
	testq	%rdi, %rdi	 ; now_scope
	jne	.L365	 ;,
 ; D:/TC/src/parser.c:33:         now_scope = builtin_scope;
	movq	(%rsi), %rdi	 ; builtin_scope, now_scope
.L365:
 ; D:/TC/src/parser.c:35:     list(CodeMember*) members = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:36:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	%rdi, %rcx	 ; now_scope,
 ; D:/TC/src/parser.c:35:     list(CodeMember*) members = create_list();
	movq	%rax, 96(%rsp)	 ; tmp600, %sfp
 ; D:/TC/src/parser.c:36:     SymbolTable* global_scope = create_symbol_table(now_scope);
	call	create_symbol_table	 ;
	movq	%rax, 72(%rsp)	 ; tmp601, %sfp
.L379:
 ; D:/TC/src/parser.c:56:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp780, token
 ; D:/TC/src/parser.c:38:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L482	 ;,
 ; D:/TC/src/parser.c:38:     while (token != NULL && token->type != EOF_TOKEN) {
	movl	24(%rax), %eax	 ; token_41->type, _39
 ; D:/TC/src/parser.c:38:     while (token != NULL && token->type != EOF_TOKEN) {
	testl	%eax, %eax	 ; _39
	je	.L482	 ;,
 ; D:/TC/src/parser.c:39:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	 ;, _39
	jne	.L412	 ;,
 ; D:/TC/src/parser.c:39:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax	 ;, tmp783
	movq	(%r15), %rcx	 ; token_41->lexeme,
	movq	(%rax), %rdx	 ; IMPORT_KEYWORD,
	call	string_equal	 ;
	movl	%eax, %ebp	 ; tmp603, have_return
 ; D:/TC/src/parser.c:39:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	testb	%al, %al	 ; have_return
	je	.L368	 ;,
 ; D:/TC/src/parser.c:64:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:65:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_101->type
 ; D:/TC/src/parser.c:64:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp604, token
 ; D:/TC/src/parser.c:65:     if (token->type != IDENTIFIER) {
	je	.L369	 ;,
 ; D:/TC/src/parser.c:66:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:66:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC53(%rip), %rcx	 ;, tmp465
 ; D:/TC/src/parser.c:66:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp605
	jmp	.L560	 ;
.L369:
 ; D:/TC/src/parser.c:72:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:70:     string import_name = token->lexeme;
	movq	(%rax), %rdi	 ; token_101->lexeme, import_name
 ; D:/TC/src/parser.c:72:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:73:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_106->type
 ; D:/TC/src/parser.c:72:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp606, token
 ; D:/TC/src/parser.c:73:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	jne	.L371	 ;,
 ; D:/TC/src/parser.c:73:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	.refptr.FROM_KEYWORD(%rip), %rax	 ;, tmp466
	movq	0(%rbp), %rcx	 ; token_106->lexeme,
	movq	(%rax), %rdx	 ; FROM_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:73:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	testb	%al, %al	 ; tmp607
	jne	.L372	 ;,
.L371:
 ; D:/TC/src/parser.c:71:     string source = NULL;
	xorl	%esi, %esi	 ; source
	jmp	.L373	 ;
.L372:
 ; D:/TC/src/parser.c:74:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:75:         if (token->type != STRING) {
	cmpl	$4, 24(%rax)	 ;, token_111->type
 ; D:/TC/src/parser.c:74:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp608, token
 ; D:/TC/src/parser.c:75:         if (token->type != STRING) {
	je	.L374	 ;,
 ; D:/TC/src/parser.c:76:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:76:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC54(%rip), %rcx	 ;, tmp467
 ; D:/TC/src/parser.c:76:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp609
.L560:
 ; D:/TC/src/parser.c:76:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L370	 ;
.L374:
 ; D:/TC/src/parser.c:81:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:80:         source = token->lexeme;
	movq	(%rax), %rsi	 ; token_111->lexeme, source
 ; D:/TC/src/parser.c:81:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp610, token
.L373:
 ; D:/TC/src/parser.c:83:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_117->type
	je	.L375	 ;,
.L376:
 ; D:/TC/src/parser.c:84:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:84:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC55(%rip), %rcx	 ;, tmp468
 ; D:/TC/src/parser.c:84:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp611
	jmp	.L560	 ;
.L375:
 ; D:/TC/src/parser.c:83:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp469
	movq	0(%rbp), %rcx	 ; token_117->lexeme,
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:83:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp612
	je	.L376	 ;,
 ; D:/TC/src/parser.c:89:     name = parse_import_file(import_name, source, now_scope, parser->source_file);
	movq	(%rbx), %r9	 ; parser_74(D)->source_file,
	movq	72(%rsp), %r8	 ; %sfp,
	movq	%rsi, %rdx	 ; source,
	movq	%rdi, %rcx	 ; import_name,
	call	parse_import_file	 ;
 ; D:/TC/src/parser.c:90:     if (name == NULL) {
	testq	%rax, %rax	 ; name
	jne	.L377	 ;,
 ; D:/TC/src/parser.c:91:         fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
	call	__getreent	 ;
 ; D:/TC/src/parser.c:91:         fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
	movq	%rsi, %r9	 ; source,
	movq	%rdi, %r8	 ; import_name,
	leaq	.LC56(%rip), %rdx	 ;, tmp471
	movq	24(%rax), %rcx	 ; _127->_stderr, _127->_stderr
	call	fprintf	 ;
 ; D:/TC/src/parser.c:92:         name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
	movq	.refptr.name_void(%rip), %rax	 ;, tmp472
	movq	72(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rcx	 ; import_name,
	movl	$3, %edx	 ;,
	movq	(%rax), %r8	 ; name_void,
	call	create_symbol	 ;
.L377:
 ; D:/TC/src/parser.c:95:     return create_import(name, source);
	movq	%rsi, %rdx	 ; source,
	movq	%rax, %rcx	 ; name,
	call	create_import	 ;
	movq	%rax, %rdx	 ; tmp616, _132
 ; D:/TC/src/parser.c:41:             if (import == NULL)
	testq	%rax, %rax	 ; _132
	jne	.L378	 ;,
.L370:
 ; D:/TC/src/parser.c:42:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:42:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC57(%rip), %rcx	 ;, tmp473
 ; D:/TC/src/parser.c:42:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp617
 ; D:/TC/src/parser.c:42:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _132
.L378:
 ; D:/TC/src/parser.c:43:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%ecx, %ecx	 ;
	jmp	.L569	 ;
.L368:
 ; D:/TC/src/parser.c:44:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	cmpl	$6, 24(%r15)	 ;, token_41->type
	jne	.L412	 ;,
 ; D:/TC/src/parser.c:44:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	.refptr.FUNC_KEYWORD(%rip), %rax	 ;, tmp784
	movq	(%r15), %rcx	 ; token_41->lexeme,
	movq	(%rax), %rdx	 ; FUNC_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:44:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	testb	%al, %al	 ; tmp619
	je	.L380	 ;,
 ; D:/TC/src/parser.c:100:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:/TC/src/parser.c:101:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:100:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	%rax, %r14	 ; tmp620, function_scope
 ; D:/TC/src/parser.c:101:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp621, token
 ; D:/TC/src/parser.c:102:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_135->type, _136
 ; D:/TC/src/parser.c:102:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _136
	je	.L381	 ;,
 ; D:/TC/src/parser.c:102:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _136
	je	.L382	 ;,
.L384:
 ; D:/TC/src/parser.c:103:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:103:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC58(%rip), %rcx	 ;, tmp475
 ; D:/TC/src/parser.c:103:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp622
	jmp	.L563	 ;
.L382:
 ; D:/TC/src/parser.c:102:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rsi), %rcx	 ; token_135->lexeme,
	call	is_builtin_type	 ;
 ; D:/TC/src/parser.c:102:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp623
	je	.L384	 ;,
.L381:
 ; D:/TC/src/parser.c:107:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%rsi), %rdx	 ; token_135->lexeme,
	movq	72(%rsp), %rcx	 ; %sfp,
	call	search_name	 ;
	movq	%rax, %rdi	 ; tmp624, return_type
 ; D:/TC/src/parser.c:108:     if (return_type == NULL) {
	testq	%rax, %rax	 ; return_type
	jne	.L385	 ;,
 ; D:/TC/src/parser.c:109:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:109:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC59(%rip), %rcx	 ;, tmp476
 ; D:/TC/src/parser.c:109:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp625
	jmp	.L563	 ;
.L385:
 ; D:/TC/src/parser.c:113:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:114:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_145->type
 ; D:/TC/src/parser.c:113:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp626, token
 ; D:/TC/src/parser.c:114:     if (token->type != IDENTIFIER) {
	je	.L386	 ;,
 ; D:/TC/src/parser.c:115:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:115:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC60(%rip), %rcx	 ;, tmp477
 ; D:/TC/src/parser.c:115:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp627
.L563:
 ; D:/TC/src/parser.c:115:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L383	 ;
.L386:
 ; D:/TC/src/parser.c:119:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/parser.c:121:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	(%rsi), %rcx	 ; token_145->lexeme,
	movq	%rdi, %r8	 ; return_type,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:120:     function->function_scope = function_scope;
	movq	%r14, 32(%rax)	 ; function_scope, function_149->function_scope
 ; D:/TC/src/parser.c:121:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	%rax, %r9	 ; function,
 ; D:/TC/src/parser.c:119:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movq	%rax, 56(%rsp)	 ; tmp628, %sfp
 ; D:/TC/src/parser.c:121:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:122:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:121:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	%rax, 80(%rsp)	 ; tmp629, %sfp
 ; D:/TC/src/parser.c:122:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:123:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_152->type
 ; D:/TC/src/parser.c:122:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp630, token
 ; D:/TC/src/parser.c:123:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L387	 ;,
.L388:
 ; D:/TC/src/parser.c:124:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:124:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC61(%rip), %rcx	 ;, tmp478
 ; D:/TC/src/parser.c:124:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp631
	jmp	.L563	 ;
.L387:
 ; D:/TC/src/parser.c:123:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp479
	movq	(%rsi), %rcx	 ; token_152->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:123:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp632
	je	.L388	 ;,
 ; D:/TC/src/parser.c:128:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:135:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	leaq	.LC63(%rip), %r12	 ;, tmp575
 ; D:/TC/src/parser.c:133:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	leaq	.LC62(%rip), %r13	 ;, tmp576
 ; D:/TC/src/parser.c:128:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp633, token
 ; D:/TC/src/parser.c:129:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rax, 64(%rsp)	 ; tmp634, %sfp
.L389:
 ; D:/TC/src/parser.c:130:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_164->type
	je	.L570	 ;,
.L397:
 ; D:/TC/src/parser.c:131:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	48(%rsp), %rcx	 ; %sfp,
	movq	%r14, %rdx	 ; function_scope,
	movq	%rbx, %r8	 ; parser,
	call	parse_variable	 ;
	movq	%rax, %rdx	 ; tmp635, parameter
 ; D:/TC/src/parser.c:132:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L390	 ;,
 ; D:/TC/src/parser.c:133:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:133:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r13, %rcx	 ; tmp576,
 ; D:/TC/src/parser.c:133:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp636
	jmp	.L561	 ;
.L390:
 ; D:/TC/src/parser.c:134:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_161->value
	je	.L392	 ;,
 ; D:/TC/src/parser.c:135:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:135:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r12, %rcx	 ; tmp575,
 ; D:/TC/src/parser.c:135:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp637
.L561:
 ; D:/TC/src/parser.c:135:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L391	 ;
.L392:
 ; D:/TC/src/parser.c:137:             list_append(parameters, (pointer)parameter);
	movq	64(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
.L391:
 ; D:/TC/src/parser.c:138:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:139:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_168->type
 ; D:/TC/src/parser.c:138:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp638, token
 ; D:/TC/src/parser.c:139:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	je	.L393	 ;,
.L396:
 ; D:/TC/src/parser.c:142:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:142:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC64(%rip), %rcx	 ;, tmp482
 ; D:/TC/src/parser.c:142:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp639
	jmp	.L563	 ;
.L393:
 ; D:/TC/src/parser.c:139:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp483
	movq	(%rsi), %rcx	 ; token_168->lexeme,
	movq	(%rax), %rdx	 ; COMMA_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:139:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp640
	je	.L394	 ;,
 ; D:/TC/src/parser.c:140:             token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp641, token
 ; D:/TC/src/parser.c:140:             token = get_next_token(lexer, true);
	jmp	.L389	 ;
.L394:
 ; D:/TC/src/parser.c:141:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_168->type
	jne	.L396	 ;,
 ; D:/TC/src/parser.c:141:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp484
	movq	(%rsi), %rcx	 ; token_168->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:141:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp642
	jne	.L389	 ;,
	jmp	.L396	 ;
.L570:
 ; D:/TC/src/parser.c:130:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp786
	movq	(%rsi), %rcx	 ; token_164->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:130:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp643
	je	.L397	 ;,
 ; D:/TC/src/parser.c:147:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:148:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_185->type
 ; D:/TC/src/parser.c:147:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp644, token
 ; D:/TC/src/parser.c:148:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L398	 ;,
.L399:
 ; D:/TC/src/parser.c:149:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:149:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC65(%rip), %rcx	 ;, tmp486
 ; D:/TC/src/parser.c:149:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp645
	jmp	.L563	 ;
.L398:
 ; D:/TC/src/parser.c:148:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp487
	movq	(%rsi), %rcx	 ; token_185->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:148:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp646
	je	.L399	 ;,
 ; D:/TC/src/parser.c:153:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:154:     parser->in_function = true;
	movb	$1, 8(%rbx)	 ;, parser_74(D)->in_function
 ; D:/TC/src/parser.c:153:     list(Statement*) body = create_list();
	movq	%rax, %r12	 ; tmp647, body
.L562:
 ; D:/TC/src/parser.c:166:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:157:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_197->type
 ; D:/TC/src/parser.c:166:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp652, token
 ; D:/TC/src/parser.c:157:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	je	.L571	 ;,
.L405:
 ; D:/TC/src/parser.c:158:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	48(%rsp), %rcx	 ; %sfp,
	movq	%rbx, %r8	 ; parser,
	movq	%r14, %rdx	 ; function_scope,
	call	parse_statement	 ;
	movq	%rax, %r13	 ; tmp649, statement
 ; D:/TC/src/parser.c:159:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L401	 ;,
 ; D:/TC/src/parser.c:160:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:160:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC66(%rip), %rcx	 ;,
 ; D:/TC/src/parser.c:160:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp650
 ; D:/TC/src/parser.c:160:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L404	 ;
.L401:
 ; D:/TC/src/parser.c:161:         else if (have_return)
	testb	%bpl, %bpl	 ; have_return
	je	.L403	 ;,
 ; D:/TC/src/parser.c:162:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:162:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;,
 ; D:/TC/src/parser.c:162:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp651
 ; D:/TC/src/parser.c:162:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L403:
 ; D:/TC/src/parser.c:164:             have_return = true;
	cmpl	$5, 8(%r13)	 ;, statement_194->type
	movb	$1, %al	 ;, tmp566
	cmove	%eax, %ebp	 ; have_return,, tmp566, have_return
.L404:
 ; D:/TC/src/parser.c:165:         list_append(body, (pointer)statement);
	movq	%r13, %rdx	 ; statement,
	movq	%r12, %rcx	 ; body,
	call	list_append	 ;
	jmp	.L562	 ;
.L571:
 ; D:/TC/src/parser.c:157:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp787
	movq	(%rsi), %rcx	 ; token_197->lexeme,
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:157:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp653
	je	.L405	 ;,
 ; D:/TC/src/parser.c:168:     parser->in_function = false;
	movb	$0, 8(%rbx)	 ;, parser_74(D)->in_function
 ; D:/TC/src/parser.c:169:     if (!have_return && return_type != name_void)
	testb	%bpl, %bpl	 ; have_return
	jne	.L407	 ;,
 ; D:/TC/src/parser.c:169:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rbp	 ;, tmp491
 ; D:/TC/src/parser.c:169:     if (!have_return && return_type != name_void)
	cmpq	0(%rbp), %rdi	 ; name_void, return_type
	jne	.L408	 ;,
.L409:
 ; D:/TC/src/parser.c:172:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	xorl	%eax, %eax	 ;
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rax, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	movq	%rax, 32(%rsp)	 ;,
	call	create_statement	 ;
 ; D:/TC/src/parser.c:172:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	%r12, %rcx	 ; body,
 ; D:/TC/src/parser.c:172:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	%rax, %rdx	 ; tmp654, _213
 ; D:/TC/src/parser.c:172:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	call	list_append	 ;
	jmp	.L407	 ;
.L408:
 ; D:/TC/src/parser.c:170:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:170:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC68(%rip), %rcx	 ;, tmp492
 ; D:/TC/src/parser.c:170:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp655
 ; D:/TC/src/parser.c:170:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:171:     if (!have_return && return_type == name_void)
	cmpq	0(%rbp), %rdi	 ; name_void, return_type
	je	.L409	 ;,
.L407:
 ; D:/TC/src/parser.c:174:     return create_function_use_ptr(function, name, return_type, parameters, body, function_scope);
	movq	%r14, 40(%rsp)	 ; function_scope,
	movq	64(%rsp), %r9	 ; %sfp,
	movq	%rdi, %r8	 ; return_type,
	movq	80(%rsp), %rdx	 ; %sfp,
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%r12, 32(%rsp)	 ; body,
	call	create_function_use_ptr	 ;
	movq	%rax, %r8	 ; tmp656, _214
 ; D:/TC/src/parser.c:46:             if (function == NULL)
	testq	%rax, %rax	 ; _214
	jne	.L411	 ;,
.L383:
 ; D:/TC/src/parser.c:47:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:47:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC69(%rip), %rcx	 ;, tmp494
 ; D:/TC/src/parser.c:47:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp657
 ; D:/TC/src/parser.c:47:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%r8d, %r8d	 ; _214
.L411:
 ; D:/TC/src/parser.c:48:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$1, %ecx	 ;,
	jmp	.L569	 ;
.L380:
 ; D:/TC/src/parser.c:49:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	cmpl	$6, 24(%r15)	 ;, token_41->type
	jne	.L412	 ;,
 ; D:/TC/src/parser.c:49:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	.refptr.CLASS_KEYWORD(%rip), %rax	 ;, tmp495
	movq	(%r15), %rcx	 ; token_41->lexeme,
	movq	(%rax), %rdx	 ; CLASS_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:49:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	testb	%al, %al	 ; tmp659
	je	.L412	 ;,
 ; D:/TC/src/parser.c:265:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:/TC/src/parser.c:266:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:265:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	%rax, 64(%rsp)	 ; tmp660, %sfp
 ; D:/TC/src/parser.c:266:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:267:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_219->type
 ; D:/TC/src/parser.c:266:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp661, token
 ; D:/TC/src/parser.c:267:     if (token->type != IDENTIFIER) {
	je	.L413	 ;,
 ; D:/TC/src/parser.c:268:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:268:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC70(%rip), %rcx	 ;, tmp496
 ; D:/TC/src/parser.c:268:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp662
	jmp	.L568	 ;
.L413:
 ; D:/TC/src/parser.c:272:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/parser.c:273:     class->class_scope = class_scope;
	movq	64(%rsp), %rdi	 ; %sfp, class_scope
 ; D:/TC/src/parser.c:274:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	movq	(%rsi), %rcx	 ; token_219->lexeme,
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, %r9	 ; class,
 ; D:/TC/src/parser.c:272:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movq	%rax, 112(%rsp)	 ; tmp663, %sfp
 ; D:/TC/src/parser.c:273:     class->class_scope = class_scope;
	movq	%rdi, 16(%rax)	 ; class_scope, class_223->class_scope
 ; D:/TC/src/parser.c:274:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:275:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:274:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	movq	%rax, 56(%rsp)	 ; tmp664, %sfp
 ; D:/TC/src/parser.c:275:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:276:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_226->type
 ; D:/TC/src/parser.c:275:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp665, token
 ; D:/TC/src/parser.c:276:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L415	 ;,
.L416:
 ; D:/TC/src/parser.c:277:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:277:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC71(%rip), %rcx	 ;, tmp497
 ; D:/TC/src/parser.c:277:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp666
.L568:
 ; D:/TC/src/parser.c:277:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L414	 ;
.L415:
 ; D:/TC/src/parser.c:276:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp498
	movq	(%rsi), %rcx	 ; token_226->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:276:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp667
	je	.L416	 ;,
 ; D:/TC/src/parser.c:281:     list(ClassMember*) members = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:282:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:281:     list(ClassMember*) members = create_list();
	movq	%rax, 80(%rsp)	 ; tmp668, %sfp
 ; D:/TC/src/parser.c:282:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %r14	 ; tmp669, token
 ; D:/TC/src/parser.c:283:     size_t size = 0;
	xorl	%eax, %eax	 ;
	movq	%rax, 104(%rsp)	 ;, %sfp
.L417:
 ; D:/TC/src/parser.c:284:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r14)	 ;, token_235->type
	je	.L572	 ;,
.L469:
 ; D:/TC/src/parser.c:285:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, 24(%r14)	 ;, token_235->type
	jne	.L418	 ;,
 ; D:/TC/src/parser.c:285:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	.refptr.METHOD_KEYWORD(%rip), %rax	 ;, tmp790
	movq	(%r14), %rcx	 ; token_235->lexeme,
	movq	(%rax), %rdx	 ; METHOD_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:285:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	testb	%al, %al	 ; tmp670
	je	.L419	 ;,
 ; D:/TC/src/parser.c:179:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:/TC/src/parser.c:180:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	56(%rsp), %r8	 ; %sfp,
	movl	$3, %edx	 ;,
	movq	%rax, %r9	 ; tmp671,
 ; D:/TC/src/parser.c:179:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	%rax, 88(%rsp)	 ; tmp671, %sfp
 ; D:/TC/src/parser.c:180:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp500
	movq	(%rax), %rcx	 ; SELF_KEYWORD,
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:181:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:180:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	%rax, %rbp	 ; tmp672, self
 ; D:/TC/src/parser.c:181:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp673, token
 ; D:/TC/src/parser.c:182:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_371->type, _372
 ; D:/TC/src/parser.c:182:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _372
	je	.L420	 ;,
 ; D:/TC/src/parser.c:182:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _372
	je	.L421	 ;,
.L423:
 ; D:/TC/src/parser.c:183:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:183:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC72(%rip), %rcx	 ;, tmp501
 ; D:/TC/src/parser.c:183:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp674
	jmp	.L565	 ;
.L421:
 ; D:/TC/src/parser.c:182:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rsi), %rcx	 ; token_371->lexeme,
	call	is_builtin_type	 ;
 ; D:/TC/src/parser.c:182:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp675
	je	.L423	 ;,
.L420:
 ; D:/TC/src/parser.c:187:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%rsi), %rdx	 ; token_371->lexeme,
	movq	64(%rsp), %rcx	 ; %sfp,
	call	search_name	 ;
	movq	%rax, %rdi	 ; tmp676, return_type
 ; D:/TC/src/parser.c:188:     if (return_type == NULL) {
	testq	%rax, %rax	 ; return_type
	jne	.L424	 ;,
 ; D:/TC/src/parser.c:189:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:189:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC73(%rip), %rcx	 ;, tmp502
 ; D:/TC/src/parser.c:189:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp677
	jmp	.L565	 ;
.L424:
 ; D:/TC/src/parser.c:193:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:194:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_381->type
 ; D:/TC/src/parser.c:193:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp678, token
 ; D:/TC/src/parser.c:194:     if (token->type != IDENTIFIER) {
	je	.L425	 ;,
 ; D:/TC/src/parser.c:195:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:195:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC74(%rip), %rcx	 ;, tmp503
 ; D:/TC/src/parser.c:195:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp679
.L565:
 ; D:/TC/src/parser.c:195:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L422	 ;
.L425:
 ; D:/TC/src/parser.c:199:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/parser.c:200:     method->method_scope = method_scope;
	movq	88(%rsp), %rdx	 ; %sfp, method_scope
 ; D:/TC/src/parser.c:199:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movq	%rax, 120(%rsp)	 ; tmp680, %sfp
 ; D:/TC/src/parser.c:200:     method->method_scope = method_scope;
	movq	%rdx, 32(%rax)	 ; method_scope, method_385->method_scope
 ; D:/TC/src/parser.c:201:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	56(%rsp), %rax	 ; %sfp, name
	movq	(%rsi), %rdx	 ; token_381->lexeme,
	movq	8(%rax), %rcx	 ; name_225->name, name_225->name
	call	make_method_name	 ;
 ; D:/TC/src/parser.c:201:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	120(%rsp), %r9	 ; %sfp,
	movq	%rdi, %r8	 ; return_type,
	movl	$2, %edx	 ;,
 ; D:/TC/src/parser.c:201:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	%rax, %rcx	 ; tmp681, _388
 ; D:/TC/src/parser.c:201:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:202:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:201:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	%rax, 136(%rsp)	 ; tmp682, %sfp
 ; D:/TC/src/parser.c:202:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:203:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_390->type
 ; D:/TC/src/parser.c:202:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp683, token
 ; D:/TC/src/parser.c:203:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L426	 ;,
.L427:
 ; D:/TC/src/parser.c:204:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:204:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC75(%rip), %rcx	 ;, tmp505
 ; D:/TC/src/parser.c:204:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp684
	jmp	.L565	 ;
.L426:
 ; D:/TC/src/parser.c:203:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp506
	movq	(%rsi), %rcx	 ; token_390->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:203:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp685
	je	.L427	 ;,
 ; D:/TC/src/parser.c:208:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:209:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	cmpl	$6, 24(%rax)	 ;, token_397->type
 ; D:/TC/src/parser.c:208:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp686, token
 ; D:/TC/src/parser.c:209:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	je	.L428	 ;,
.L430:
 ; D:/TC/src/parser.c:210:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:210:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC76(%rip), %rcx	 ;, tmp507
 ; D:/TC/src/parser.c:210:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp687
 ; D:/TC/src/parser.c:210:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L429	 ;
.L428:
 ; D:/TC/src/parser.c:209:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp508
	movq	(%rsi), %rcx	 ; token_397->lexeme,
	movq	(%rax), %rdx	 ; SELF_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:209:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	testb	%al, %al	 ; tmp688
	je	.L430	 ;,
.L429:
 ; D:/TC/src/parser.c:211:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:226:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	leaq	.LC79(%rip), %r12	 ;, tmp584
 ; D:/TC/src/parser.c:211:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp689, token
 ; D:/TC/src/parser.c:212:     list(Variable*) parameters = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:213:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%rbp, %rdx	 ; self,
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/parser.c:212:     list(Variable*) parameters = create_list();
	movq	%rax, 128(%rsp)	 ; tmp690, %sfp
 ; D:/TC/src/parser.c:213:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	call	create_variable	 ;
 ; D:/TC/src/parser.c:213:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	128(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:213:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	%rax, %rdx	 ; tmp691, _406
 ; D:/TC/src/parser.c:213:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	call	list_append	 ;
 ; D:/TC/src/parser.c:214:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rbp	 ;, tmp582
 ; D:/TC/src/parser.c:215:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %r13	 ;, tmp583
.L431:
 ; D:/TC/src/parser.c:214:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_407->type
	je	.L573	 ;,
.L437:
 ; D:/TC/src/parser.c:219:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:219:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC77(%rip), %rcx	 ;, tmp510
 ; D:/TC/src/parser.c:219:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp695
	jmp	.L565	 ;
.L573:
 ; D:/TC/src/parser.c:214:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_PAREN_SYMBOL,
	movq	(%rsi), %rcx	 ; token_407->lexeme,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:214:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp701
	jne	.L443	 ;,
 ; D:/TC/src/parser.c:215:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_407->type
	jne	.L437	 ;,
 ; D:/TC/src/parser.c:215:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	0(%r13), %rdx	 ; COMMA_SYMBOL,
	movq	(%rsi), %rcx	 ; token_407->lexeme,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:215:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp692
	je	.L433	 ;,
 ; D:/TC/src/parser.c:216:             token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:222:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	88(%rsp), %rdx	 ; %sfp,
	movq	48(%rsp), %rcx	 ; %sfp,
	movq	%rbx, %r8	 ; parser,
 ; D:/TC/src/parser.c:216:             token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp693, token
 ; D:/TC/src/parser.c:222:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	call	parse_variable	 ;
	movq	%rax, %rdx	 ; tmp694, parameter
 ; D:/TC/src/parser.c:223:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L557	 ;,
 ; D:/TC/src/parser.c:224:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:224:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC78(%rip), %rcx	 ;, tmp512
 ; D:/TC/src/parser.c:224:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp698
	jmp	.L564	 ;
.L433:
 ; D:/TC/src/parser.c:217:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, 24(%rsi)	 ;, token_407->type
	jne	.L437	 ;,
 ; D:/TC/src/parser.c:217:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	0(%rbp), %rdx	 ; R_PAREN_SYMBOL,
	movq	(%rsi), %rcx	 ; token_407->lexeme,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:217:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	testb	%al, %al	 ; tmp696
	je	.L437	 ;,
.L443:
 ; D:/TC/src/parser.c:231:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:232:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_431->type
 ; D:/TC/src/parser.c:231:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp697, token
 ; D:/TC/src/parser.c:232:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L558	 ;,
	jmp	.L438	 ;
.L557:
 ; D:/TC/src/parser.c:225:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_413->value
	je	.L441	 ;,
 ; D:/TC/src/parser.c:226:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:226:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r12, %rcx	 ; tmp584,
 ; D:/TC/src/parser.c:226:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp699
.L564:
 ; D:/TC/src/parser.c:226:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L440	 ;
.L441:
 ; D:/TC/src/parser.c:228:             list_append(parameters, (pointer)parameter);
	movq	128(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
.L440:
 ; D:/TC/src/parser.c:229:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp700, token
	jmp	.L431	 ;
.L438:
 ; D:/TC/src/parser.c:233:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:233:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC80(%rip), %rcx	 ;, tmp515
 ; D:/TC/src/parser.c:233:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp702
	jmp	.L565	 ;
.L558:
 ; D:/TC/src/parser.c:232:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp516
	movq	(%rsi), %rcx	 ; token_431->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:232:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp703
	je	.L438	 ;,
 ; D:/TC/src/parser.c:237:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:238:     parser->in_function = true;
	movw	$257, 8(%rbx)	 ;, MEM <unsigned short> [(char *)parser_74(D) + 8B]
 ; D:/TC/src/parser.c:241:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:240:     bool have_return = false;
	xorl	%r13d, %r13d	 ; have_return
 ; D:/TC/src/parser.c:241:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
 ; D:/TC/src/parser.c:237:     list(Statement*) body = create_list();
	movq	%rax, %rbp	 ; tmp704, body
 ; D:/TC/src/parser.c:241:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp705, token
.L444:
 ; D:/TC/src/parser.c:242:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_443->type
	je	.L574	 ;,
.L449:
 ; D:/TC/src/parser.c:243:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	88(%rsp), %rdx	 ; %sfp,
	movq	48(%rsp), %rcx	 ; %sfp,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp706, statement
 ; D:/TC/src/parser.c:244:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L445	 ;,
 ; D:/TC/src/parser.c:245:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:245:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC81(%rip), %rcx	 ;,
 ; D:/TC/src/parser.c:245:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp707
 ; D:/TC/src/parser.c:245:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L448	 ;
.L445:
 ; D:/TC/src/parser.c:246:         else if (have_return)
	testb	%r13b, %r13b	 ; have_return
	je	.L447	 ;,
 ; D:/TC/src/parser.c:247:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:247:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;,
 ; D:/TC/src/parser.c:247:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp708
 ; D:/TC/src/parser.c:247:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L447:
 ; D:/TC/src/parser.c:249:             have_return = true;
	cmpl	$5, 8(%r12)	 ;, statement_440->type
	movb	$1, %al	 ;, tmp570
	cmove	%eax, %r13d	 ; have_return,, tmp570, have_return
.L448:
 ; D:/TC/src/parser.c:250:         list_append(body, (pointer)statement);
	movq	%r12, %rdx	 ; statement,
	movq	%rbp, %rcx	 ; body,
	call	list_append	 ;
 ; D:/TC/src/parser.c:251:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp709, token
	jmp	.L444	 ;
.L574:
 ; D:/TC/src/parser.c:242:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp794
	movq	(%rsi), %rcx	 ; token_443->lexeme,
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:242:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp710
	je	.L449	 ;,
 ; D:/TC/src/parser.c:253:     parser->in_function = false;
	movw	$0, 8(%rbx)	 ;, MEM <unsigned short> [(char *)parser_74(D) + 8B]
 ; D:/TC/src/parser.c:255:     if (!have_return && return_type != name_void)
	testb	%r13b, %r13b	 ; have_return
	jne	.L451	 ;,
 ; D:/TC/src/parser.c:255:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %r12	 ;, tmp520
 ; D:/TC/src/parser.c:255:     if (!have_return && return_type != name_void)
	cmpq	(%r12), %rdi	 ; name_void, return_type
	jne	.L452	 ;,
.L453:
 ; D:/TC/src/parser.c:258:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	xorl	%eax, %eax	 ;
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rax, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	movq	%rax, 32(%rsp)	 ;,
	call	create_statement	 ;
 ; D:/TC/src/parser.c:258:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	%rbp, %rcx	 ; body,
 ; D:/TC/src/parser.c:258:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	%rax, %rdx	 ; tmp711, _459
 ; D:/TC/src/parser.c:258:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	call	list_append	 ;
	jmp	.L451	 ;
.L452:
 ; D:/TC/src/parser.c:256:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:256:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC82(%rip), %rcx	 ;, tmp521
 ; D:/TC/src/parser.c:256:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp712
 ; D:/TC/src/parser.c:256:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:/TC/src/parser.c:257:     if (!have_return && return_type == name_void)
	cmpq	(%r12), %rdi	 ; name_void, return_type
	je	.L453	 ;,
.L451:
 ; D:/TC/src/parser.c:260:     return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
	movq	88(%rsp), %rax	 ; %sfp, method_scope
	movq	%rbp, 32(%rsp)	 ; body,
	movq	%rdi, %r8	 ; return_type,
	movq	136(%rsp), %rdx	 ; %sfp,
	movq	128(%rsp), %r9	 ; %sfp,
	movq	%rax, 40(%rsp)	 ; method_scope,
	movq	120(%rsp), %rcx	 ; %sfp,
	call	create_method_use_ptr	 ;
	movq	%rax, %rdx	 ; tmp713, _460
 ; D:/TC/src/parser.c:287:             if (method == NULL)
	testq	%rax, %rax	 ; _460
	jne	.L455	 ;,
.L422:
 ; D:/TC/src/parser.c:288:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:288:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC83(%rip), %rcx	 ;, tmp523
 ; D:/TC/src/parser.c:288:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp714
 ; D:/TC/src/parser.c:288:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _460
.L455:
 ; D:/TC/src/parser.c:289:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%ecx, %ecx	 ;
	xorl	%r8d, %r8d	 ;
	call	create_class_member	 ;
 ; D:/TC/src/parser.c:289:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:289:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rdx	 ; tmp715, _243
 ; D:/TC/src/parser.c:289:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	list_append	 ;
 ; D:/TC/src/parser.c:285:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	jmp	.L466	 ;
.L419:
 ; D:/TC/src/parser.c:290:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	cmpl	$6, 24(%r14)	 ;, token_235->type
	jne	.L418	 ;,
 ; D:/TC/src/parser.c:290:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp524
	movq	(%r14), %rcx	 ; token_235->lexeme,
	movq	(%rax), %rdx	 ; VAR_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:290:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; tmp716
	je	.L418	 ;,
 ; D:/TC/src/parser.c:291:             token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:292:             parser->in_class = true;
	movb	$1, 10(%rbx)	 ;, parser_74(D)->in_class
 ; D:/TC/src/parser.c:293:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	64(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %r8	 ; parser,
	movq	48(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:291:             token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp717, token
 ; D:/TC/src/parser.c:293:             Variable* variable = parse_variable(lexer, class_scope, parser);
	call	parse_variable	 ;
 ; D:/TC/src/parser.c:294:             parser->in_class = false;
	movb	$0, 10(%rbx)	 ;, parser_74(D)->in_class
 ; D:/TC/src/parser.c:293:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	%rax, %rdi	 ; tmp718, variable
 ; D:/TC/src/parser.c:295:             if (variable == NULL)
	testq	%rax, %rax	 ; variable
	jne	.L457	 ;,
 ; D:/TC/src/parser.c:296:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:296:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC84(%rip), %rcx	 ;, tmp525
 ; D:/TC/src/parser.c:296:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp719
 ; D:/TC/src/parser.c:296:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L457:
 ; D:/TC/src/parser.c:297:             ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
	xorl	%edx, %edx	 ;
	movq	%rdi, %r8	 ; variable,
	movl	$1, %ecx	 ;,
	call	create_class_member	 ;
 ; D:/TC/src/parser.c:298:             list_append(members, (pointer)member);
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:297:             ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
	movq	%rax, %rsi	 ; tmp720, member
 ; D:/TC/src/parser.c:298:             list_append(members, (pointer)member);
	movq	%rax, %rdx	 ; member,
	call	list_append	 ;
 ; D:/TC/src/parser.c:299:             if (member->type == CLASS_VARIABLE) {
	cmpl	$1, 8(%rsi)	 ;, member_252->type
	jne	.L461	 ;,
 ; D:/TC/src/parser.c:300:                 Symbol* type = member->content.variable->type;
	movq	(%rsi), %rdx	 ; member_252->content.variable, _254
 ; D:/TC/src/parser.c:301:                 if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %rcx	 ;, tmp526
 ; D:/TC/src/parser.c:300:                 Symbol* type = member->content.variable->type;
	movq	(%rdx), %rax	 ; _254->type, type
 ; D:/TC/src/parser.c:301:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rcx), %rax	 ; name_int, type
	je	.L566	 ;,
 ; D:/TC/src/parser.c:301:                 if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rcx	 ;, tmp527
 ; D:/TC/src/parser.c:301:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rcx), %rax	 ; name_float, type
	je	.L566	 ;,
 ; D:/TC/src/parser.c:301:                 if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rcx	 ;, tmp528
 ; D:/TC/src/parser.c:301:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rcx), %rax	 ; name_string, type
	je	.L566	 ;,
 ; D:/TC/src/parser.c:303:                 else if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rcx	 ;, tmp529
 ; D:/TC/src/parser.c:303:                 else if (type == name_bool || type == name_void)
	cmpq	(%rcx), %rax	 ; name_bool, type
	je	.L462	 ;,
 ; D:/TC/src/parser.c:303:                 else if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rcx	 ;, tmp530
 ; D:/TC/src/parser.c:303:                 else if (type == name_bool || type == name_void)
	cmpq	(%rcx), %rax	 ; name_void, type
	jne	.L463	 ;,
.L462:
 ; D:/TC/src/parser.c:304:                     size += 1;
	incq	104(%rsp)	 ; %sfp
	jmp	.L461	 ;
.L463:
 ; D:/TC/src/parser.c:305:                 else if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rax)	 ;, type_255->kind
	jne	.L464	 ;,
.L566:
 ; D:/TC/src/parser.c:306:                     size += 8;  // pointer to object
	addq	$8, 104(%rsp)	 ;, %sfp
	jmp	.L461	 ;
.L464:
 ; D:/TC/src/parser.c:308:                     fprintf(stderr, "[warning] Unsupported type for class variable '%s': %s\n", member->content.variable->name->name, type->name);
	movq	8(%rax), %r9	 ; type_255->name, _266
	movq	8(%rdx), %rax	 ; _254->name, _254->name
	movq	8(%rax), %r8	 ; _267->name, _268
	movq	%r9, 120(%rsp)	 ; _266, %sfp
	movq	%r8, 88(%rsp)	 ; _268, %sfp
 ; D:/TC/src/parser.c:308:                     fprintf(stderr, "[warning] Unsupported type for class variable '%s': %s\n", member->content.variable->name->name, type->name);
	call	__getreent	 ;
 ; D:/TC/src/parser.c:308:                     fprintf(stderr, "[warning] Unsupported type for class variable '%s': %s\n", member->content.variable->name->name, type->name);
	movq	120(%rsp), %r9	 ; %sfp, _266
	movq	88(%rsp), %r8	 ; %sfp, _268
	leaq	.LC85(%rip), %rdx	 ;, tmp533
	movq	24(%rax), %rcx	 ; _269->_stderr, _269->_stderr
	call	fprintf	 ;
.L461:
 ; D:/TC/src/parser.c:310:             token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:311:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_271->type
 ; D:/TC/src/parser.c:310:             token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp722, token
 ; D:/TC/src/parser.c:311:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	je	.L465	 ;,
.L467:
 ; D:/TC/src/parser.c:312:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:312:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC86(%rip), %rcx	 ;, tmp534
 ; D:/TC/src/parser.c:312:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp723
	jmp	.L567	 ;
.L465:
 ; D:/TC/src/parser.c:311:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp535
	movq	(%rsi), %rcx	 ; token_271->lexeme,
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:311:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp724
	je	.L467	 ;,
	jmp	.L466	 ;
.L418:
 ; D:/TC/src/parser.c:314:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:314:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC87(%rip), %rcx	 ;,
 ; D:/TC/src/parser.c:314:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp725
.L567:
 ; D:/TC/src/parser.c:314:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L466:
 ; D:/TC/src/parser.c:315:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r14	 ; tmp726, token
	jmp	.L417	 ;
.L572:
 ; D:/TC/src/parser.c:284:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp799
	movq	(%r14), %rcx	 ; token_235->lexeme,
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:284:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp727
	je	.L469	 ;,
 ; D:/TC/src/parser.c:317:     string init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
	movq	56(%rsp), %rax	 ; %sfp, name
	movq	8(%rax), %rcx	 ; name_225->name, name_225->name
	movq	.refptr.DEFAULT_INIT_NAME(%rip), %rax	 ;, tmp538
	movq	(%rax), %rdx	 ; DEFAULT_INIT_NAME,
	call	make_method_name	 ;
 ; D:/TC/src/parser.c:318:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	movq	64(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; init_name,
 ; D:/TC/src/parser.c:317:     string init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
	movq	%rax, %rbp	 ; tmp728, init_name
 ; D:/TC/src/parser.c:318:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	call	search_name_use_strcmp	 ;
	movq	%rax, %rsi	 ; tmp729, init
 ; D:/TC/src/parser.c:319:     if (init == NULL) {
	testq	%rax, %rax	 ; init
	jne	.L470	 ;,
 ; D:/TC/src/parser.c:320:         Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/parser.c:321:         method->method_scope = create_symbol_table(class_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:320:         Method* method = (Method*)alloc_memory(sizeof(Method));
	movq	%rax, %rdi	 ; tmp730, method
 ; D:/TC/src/parser.c:321:         method->method_scope = create_symbol_table(class_scope);
	call	create_symbol_table	 ;
 ; D:/TC/src/parser.c:322:         init = create_symbol(init_name, SYMBOL_METHOD, name, method);
	movq	56(%rsp), %r8	 ; %sfp,
	movq	%rbp, %rcx	 ; init_name,
	movq	%rdi, %r9	 ; method,
 ; D:/TC/src/parser.c:321:         method->method_scope = create_symbol_table(class_scope);
	movq	%rax, 32(%rdi)	 ; tmp731, method_289->method_scope
 ; D:/TC/src/parser.c:322:         init = create_symbol(init_name, SYMBOL_METHOD, name, method);
	movl	$2, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, %rsi	 ; tmp732, init
 ; D:/TC/src/parser.c:323:         list(Variable*) parameters = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:324:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	32(%rdi), %r9	 ; method_289->method_scope,
	movq	56(%rsp), %r8	 ; %sfp,
	movl	$3, %edx	 ;,
 ; D:/TC/src/parser.c:323:         list(Variable*) parameters = create_list();
	movq	%rax, %rbp	 ; tmp733, parameters
 ; D:/TC/src/parser.c:324:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp541
	movq	(%rax), %rcx	 ; SELF_KEYWORD,
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:325:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	56(%rsp), %rcx	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rax, %rdx	 ; self,
 ; D:/TC/src/parser.c:324:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	%rax, %r13	 ; tmp734, self
 ; D:/TC/src/parser.c:325:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	call	create_variable	 ;
 ; D:/TC/src/parser.c:325:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	%rbp, %rcx	 ; parameters,
 ; D:/TC/src/parser.c:325:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	%rax, %rdx	 ; tmp735, _296
 ; D:/TC/src/parser.c:325:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	call	list_append	 ;
 ; D:/TC/src/parser.c:326:         list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r11d, %r11d	 ;
	movq	%r13, %r8	 ; self,
	xorl	%r9d, %r9d	 ;
	movq	%r11, 32(%rsp)	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/parser.c:326:         list(Statement*) body = create_list();
	movq	%rax, %r12	 ; tmp736, body
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r13d, %r13d	 ;
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp737,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %r8	 ;, tmp738
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	create_expression	 ;
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%r13, 40(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rax, 32(%rsp)	 ; tmp739,
	xorl	%edx, %edx	 ;
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%r12, %rcx	 ; body,
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %rdx	 ; tmp740, _301
 ; D:/TC/src/parser.c:327:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	list_append	 ;
 ; D:/TC/src/parser.c:328:         create_method_use_ptr(method, init, name, parameters, body, method->method_scope);
	movq	32(%rdi), %rax	 ; method_289->method_scope, method_289->method_scope
	movq	%rbp, %r9	 ; parameters,
	movq	%rsi, %rdx	 ; init,
	movq	%r12, 32(%rsp)	 ; body,
	movq	56(%rsp), %r8	 ; %sfp,
	movq	%rdi, %rcx	 ; method,
	movq	%rax, 40(%rsp)	 ; method_289->method_scope,
	call	create_method_use_ptr	 ;
 ; D:/TC/src/parser.c:329:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rdi, %rdx	 ; method,
	xorl	%ecx, %ecx	 ;
	xorl	%r8d, %r8d	 ;
	call	create_class_member	 ;
 ; D:/TC/src/parser.c:329:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:329:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rdx	 ; tmp741, _303
 ; D:/TC/src/parser.c:329:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	list_append	 ;
.L470:
 ; D:/TC/src/parser.c:331:     if (init->kind != SYMBOL_METHOD)
	cmpl	$2, 32(%rsi)	 ;, init_304->kind
	je	.L471	 ;,
 ; D:/TC/src/parser.c:332:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:332:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC88(%rip), %rcx	 ;, tmp543
 ; D:/TC/src/parser.c:332:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp742
 ; D:/TC/src/parser.c:332:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L471:
 ; D:/TC/src/parser.c:333:     string constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	56(%rsp), %rax	 ; %sfp, name
	movq	8(%rax), %rcx	 ; name_225->name, name_225->name
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp544
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME,
	call	make_method_name	 ;
 ; D:/TC/src/parser.c:334:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
 ; D:/TC/src/parser.c:333:     string constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	%rax, %rbp	 ; tmp743, constructor_name
 ; D:/TC/src/parser.c:334:     Method* method = (Method*)alloc_memory(sizeof(Method));
	call	alloc_memory	 ;
 ; D:/TC/src/parser.c:335:     method->method_scope = create_symbol_table(class_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:334:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movq	%rax, %rdi	 ; tmp744, method
 ; D:/TC/src/parser.c:335:     method->method_scope = create_symbol_table(class_scope);
	call	create_symbol_table	 ;
 ; D:/TC/src/parser.c:336:     Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
	movq	56(%rsp), %r8	 ; %sfp,
	movq	%rdi, %r9	 ; method,
	movq	%rbp, %rcx	 ; constructor_name,
 ; D:/TC/src/parser.c:335:     method->method_scope = create_symbol_table(class_scope);
	movq	%rax, 32(%rdi)	 ; tmp745, method_312->method_scope
 ; D:/TC/src/parser.c:336:     Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
	movl	$2, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, 120(%rsp)	 ; tmp746, %sfp
 ; D:/TC/src/parser.c:337:     list(Variable*) parameters = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:338:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %r13	 ;, tmp547
	movq	32(%rdi), %r9	 ; method_312->method_scope,
	movl	$3, %edx	 ;,
	movq	56(%rsp), %r8	 ; %sfp,
 ; D:/TC/src/parser.c:337:     list(Variable*) parameters = create_list();
	movq	%rax, 88(%rsp)	 ; tmp747, %sfp
 ; D:/TC/src/parser.c:338:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	0(%r13), %rcx	 ; SELF_KEYWORD,
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:339:     list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	56(%rsp), %rcx	 ; %sfp,
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/parser.c:338:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	%rax, %rdx	 ; tmp748, self
 ; D:/TC/src/parser.c:339:     list_append(parameters, (pointer)create_variable(name, self, NULL));
	call	create_variable	 ;
 ; D:/TC/src/parser.c:339:     list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	88(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:339:     list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	%rax, %rdx	 ; tmp749, _319
 ; D:/TC/src/parser.c:339:     list_append(parameters, (pointer)create_variable(name, self, NULL));
	call	list_append	 ;
 ; D:/TC/src/parser.c:340:     list(Variable*) init_params = list_copy(init->ast_node.method->parameters);
	movq	24(%rsi), %rax	 ; init_304->ast_node.method, init_304->ast_node.method
	movq	16(%rax), %rcx	 ; _320->parameters, _320->parameters
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp750, init_params
.L473:
 ; D:/TC/src/parser.c:342:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	movq	%r12, %rcx	 ; init_params,
	call	list_pop	 ;
	movq	%rax, %r14	 ; tmp753, param
 ; D:/TC/src/parser.c:342:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	testq	%rax, %rax	 ; param
	je	.L575	 ;,
 ; D:/TC/src/parser.c:343:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	movq	8(%r14), %rax	 ; param_324->name, param_324->name
	movq	0(%r13), %rdx	 ; SELF_KEYWORD,
	movq	8(%rax), %rcx	 ; _325->name, _325->name
	call	string_equal	 ;
 ; D:/TC/src/parser.c:343:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	testb	%al, %al	 ; tmp751
	jne	.L473	 ;,
 ; D:/TC/src/parser.c:344:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	8(%r14), %rdx	 ; param_324->name, param_324->name
	movq	(%r14), %rcx	 ; param_324->type,
	xorl	%r8d, %r8d	 ;
	call	create_variable	 ;
 ; D:/TC/src/parser.c:344:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	88(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:344:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	%rax, %rdx	 ; tmp752, _330
 ; D:/TC/src/parser.c:344:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	call	list_append	 ;
	jmp	.L473	 ;
.L575:
 ; D:/TC/src/parser.c:346:     list(statement*) body = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:347:     list(ClassMember*) ms = list_copy(members);
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:346:     list(statement*) body = create_list();
	movq	%rax, %r12	 ; tmp754, body
 ; D:/TC/src/parser.c:347:     list(ClassMember*) ms = list_copy(members);
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp755, ms
.L476:
 ; D:/TC/src/parser.c:349:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	movq	%r13, %rcx	 ; ms,
	call	list_pop	 ;
	movq	%rax, %rbp	 ; tmp764, mb
 ; D:/TC/src/parser.c:349:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	testq	%rax, %rax	 ; mb
	je	.L576	 ;,
 ; D:/TC/src/parser.c:350:         if (mb->type == CLASS_VARIABLE) {
	cmpl	$1, 8(%rbp)	 ;, mb_333->type
	jne	.L476	 ;,
 ; D:/TC/src/parser.c:351:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
	movq	0(%rbp), %rax	 ; mb_333->content.variable, mb_333->content.variable
	xorl	%r10d, %r10d	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	8(%rax), %r8	 ; _336->name, _336->name
	movq	%r10, 32(%rsp)	 ;,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:351:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp756,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:/TC/src/parser.c:351:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; D:/TC/src/parser.c:351:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
	movq	%rax, %r8	 ;, tmp757
 ; D:/TC/src/parser.c:351:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
	call	create_expression	 ;
	movq	%rax, %r14	 ; tmp758, left
 ; D:/TC/src/parser.c:352:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	0(%rbp), %rax	 ; mb_333->content.variable, mb_333->content.variable
	movq	16(%rax), %r9	 ; _341->value, _342
 ; D:/TC/src/parser.c:352:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	testq	%r9, %r9	 ; _342
	jne	.L477	 ;,
 ; D:/TC/src/parser.c:352:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movl	$2, %edx	 ;,
	leaq	.LC89(%rip), %rcx	 ;, tmp557
	call	create_string	 ;
 ; D:/TC/src/parser.c:352:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%ecx, %ecx	 ;
	movq	%r9, 32(%rsp)	 ;,
 ; D:/TC/src/parser.c:352:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	%rax, %rdx	 ; tmp759, _343
 ; D:/TC/src/parser.c:352:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	xorl	%r9d, %r9d	 ;
	call	create_primary	 ;
 ; D:/TC/src/parser.c:352:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; D:/TC/src/parser.c:352:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	%rax, %r8	 ;, tmp760
 ; D:/TC/src/parser.c:352:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	call	create_expression	 ;
	movq	%rax, %r9	 ; tmp761, _342
.L477:
 ; D:/TC/src/parser.c:353:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	xorl	%r8d, %r8d	 ;
	movq	%r14, %rdx	 ; left,
	movl	$13, %ecx	 ;,
	call	create_expression	 ;
 ; D:/TC/src/parser.c:353:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%r8, 40(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rax, 32(%rsp)	 ; tmp762,
	call	create_statement	 ;
 ; D:/TC/src/parser.c:353:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	%r12, %rcx	 ; body,
 ; D:/TC/src/parser.c:353:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	%rax, %rdx	 ; tmp763, _348
 ; D:/TC/src/parser.c:353:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	call	list_append	 ;
	jmp	.L476	 ;
.L576:
 ; D:/TC/src/parser.c:356:     list(Expression*) args = create_list();
	call	create_list	 ;
 ; D:/TC/src/parser.c:357:     list(Variable*) params = list_copy(parameters);
	movq	88(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:356:     list(Expression*) args = create_list();
	movq	%rax, %r13	 ; tmp765, args
 ; D:/TC/src/parser.c:357:     list(Variable*) params = list_copy(parameters);
	call	list_copy	 ;
	movq	%rax, %r14	 ; tmp766, params
.L479:
 ; D:/TC/src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	movq	%r14, %rcx	 ; params,
	call	list_pop	 ;
 ; D:/TC/src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	testq	%rax, %rax	 ; param
	je	.L577	 ;,
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	xorl	%ecx, %ecx	 ;
	movq	8(%rax), %r8	 ; param_351->name, param_351->name
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movq	%rcx, 32(%rsp)	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp767,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	movl	$19, %ecx	 ;,
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rax, %r8	 ;, tmp768
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	call	create_expression	 ;
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%r13, %rcx	 ; args,
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rax, %rdx	 ; tmp769, _355
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	call	list_append	 ;
	jmp	.L479	 ;
.L577:
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%eax, %eax	 ;
	xorl	%r9d, %r9d	 ;
	movq	%rsi, %r8	 ; init,
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%r13, 32(%rsp)	 ; args,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %rdx	 ; tmp771, _356
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp772,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %r8	 ;, tmp773
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	call	create_expression	 ;
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rdx, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp774,
	call	create_statement	 ;
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%r12, %rcx	 ; body,
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %rdx	 ; tmp775, _360
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	call	list_append	 ;
 ; D:/TC/src/parser.c:361:     create_method_use_ptr(method, constructor, name, parameters, body, method->method_scope);
	movq	32(%rdi), %rax	 ; method_312->method_scope, method_312->method_scope
	movq	%r12, 32(%rsp)	 ; body,
	movq	%rdi, %rcx	 ; method,
	movq	88(%rsp), %r9	 ; %sfp,
	movq	56(%rsp), %r8	 ; %sfp,
	movq	%rax, 40(%rsp)	 ; method_312->method_scope,
	movq	120(%rsp), %rdx	 ; %sfp,
	call	create_method_use_ptr	 ;
 ; D:/TC/src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; method,
	xorl	%ecx, %ecx	 ;
	call	create_class_member	 ;
 ; D:/TC/src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rdx	 ; tmp776, _362
 ; D:/TC/src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	list_append	 ;
 ; D:/TC/src/parser.c:364:     return create_class_use_ptr(class, name, members, class_scope, size);
	movq	104(%rsp), %rax	 ; %sfp, size
	movq	64(%rsp), %r9	 ; %sfp,
	movq	80(%rsp), %r8	 ; %sfp,
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	%rax, 32(%rsp)	 ; size,
	movq	112(%rsp), %rcx	 ; %sfp,
	call	create_class_use_ptr	 ;
	movq	%rax, %r9	 ; tmp777, _364
 ; D:/TC/src/parser.c:51:             if (class == NULL)
	testq	%rax, %rax	 ; _364
	jne	.L481	 ;,
.L414:
 ; D:/TC/src/parser.c:52:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:52:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC90(%rip), %rcx	 ;, tmp560
 ; D:/TC/src/parser.c:52:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp778
 ; D:/TC/src/parser.c:52:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%r9d, %r9d	 ; _364
.L481:
 ; D:/TC/src/parser.c:53:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$2, %ecx	 ;,
.L569:
	call	create_code_member	 ;
 ; D:/TC/src/parser.c:53:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	96(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:53:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	%rax, %rdx	 ; tmp779, _36
 ; D:/TC/src/parser.c:53:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	call	list_append	 ;
 ; D:/TC/src/parser.c:49:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	jmp	.L379	 ;
.L482:
 ; D:/TC/src/parser.c:59:     return create_code(members, global_scope);
	movq	72(%rsp), %rdx	 ; %sfp,
	movq	96(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/parser.c:60: }
	addq	$152, %rsp	 ;,
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
.L412:
 ; D:/TC/src/parser.c:55:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:/TC/src/parser.c:55:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC91(%rip), %rcx	 ;,
 ; D:/TC/src/parser.c:55:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp781
 ; D:/TC/src/parser.c:55:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L379	 ;
	.ident	"GCC: (GNU) 13.2.0"
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	search_name;	.scl	2;	.type	32;	.endef
	.def	create_symbol;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_function_use_ptr;	.scl	2;	.type	32;	.endef
	.def	create_method_use_ptr;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	create_class_use_ptr;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	create_code;	.scl	2;	.type	32;	.endef
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
