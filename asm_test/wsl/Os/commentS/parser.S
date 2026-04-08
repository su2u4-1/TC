	.file	"parser.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Failed to parse right operand"
	.text
	.type	parse_expr_prec, @function
parse_expr_prec:
	pushq	%r15	;
	movl	%edx, %r15d	; tmp121, min_prec
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%r8, %r12	; tmp123, parser
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp120, expr_left
; src/parser.c:650:     token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
; src/parser.c:647: static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, SymbolTable* now_scope, Parser* parser) {
	subq	$40, %rsp	;,
; src/parser.c:647: static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, SymbolTable* now_scope, Parser* parser) {
	movq	%rdi, 8(%rsp)	; tmp119, %sfp
	movq	%rcx, 24(%rsp)	; tmp122, %sfp
.L20:
; src/parser.c:679:         token = peek_next_token(lexer, true);
	call	*peek_next_token@GOTPCREL(%rip)	;
; src/parser.c:651:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;, token_15->type
	jne	.L14	;,
; src/parser.c:652:         OperatorType op = string_to_operator(token->lexeme);
	movq	(%rax), %rdi	; token_15->lexeme,
	call	*string_to_operator@GOTPCREL(%rip)	;
	movl	%eax, 20(%rsp)	; tmp125, %sfp
; src/parser.c:653:         int op_prec = operator_precedence(op);
	movl	%eax, %edi	; tmp125,
	call	*operator_precedence@GOTPCREL(%rip)	;
; src/parser.c:654:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, 20(%rsp)	;, %sfp
; src/parser.c:653:         int op_prec = operator_precedence(op);
	movl	%eax, %r13d	; tmp126, op_prec
; src/parser.c:654:         if (op == OP_NONE || op_prec < min_prec)
	je	.L14	;,
	cmpl	%r15d, %eax	; min_prec, op_prec
	jge	.L3	;,
.L14:
; src/parser.c:681:     token = peek_current_token(lexer);
	movq	8(%rsp), %rdi	; %sfp,
	call	*peek_current_token@GOTPCREL(%rip)	;
; src/parser.c:683:     return expr_left;
	jmp	.L1	;
.L3:
; src/parser.c:656:         token = get_next_token(lexer, true);  // consume operator
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:657:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	24(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r12, %rdx	; parser,
; src/parser.c:657:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp127, token
; src/parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
	movq	%rax, %rdx	; tmp128, right_primary
; src/parser.c:659:         if (right_primary == NULL) {
	testq	%rax, %rax	; right_primary
	jne	.L6	;,
; src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_38(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC0(%rip), %rdi	;, tmp113
; src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp129, _6
; src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:662:             return NULL;
	jmp	.L7	;
.L6:
; src/parser.c:664:         Expression* right = create_expression(OP_NONE, NULL, right_primary, NULL);
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp130, right
.L19:
; src/parser.c:676:             token = peek_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*peek_next_token@GOTPCREL(%rip)	;
; src/parser.c:666:         while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;, token_14->type
	jne	.L12	;,
; src/parser.c:667:             OperatorType next_op = string_to_operator(token->lexeme);
	movq	(%rax), %rdi	; token_14->lexeme,
	call	*string_to_operator@GOTPCREL(%rip)	;
	movl	%eax, %r14d	; tmp132, next_op
; src/parser.c:668:             int next_prec = operator_precedence(next_op);
	movl	%eax, %edi	; next_op,
	call	*operator_precedence@GOTPCREL(%rip)	;
	movl	%eax, %edx	; tmp133, next_prec
; src/parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %r14d	;, next_op
	je	.L12	;,
	cmpl	%eax, %r13d	; next_prec, op_prec
	jl	.L9	;,
.L12:
; src/parser.c:678:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rbx, %rsi	; <retval>,
	movl	20(%rsp), %edi	; %sfp,
	movq	%rbp, %rcx	; right,
	xorl	%edx, %edx	;
	call	*create_expression@GOTPCREL(%rip)	;
; src/parser.c:679:         token = peek_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:678:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rax, %rbx	; tmp134, <retval>
	jmp	.L20	;
.L9:
; src/parser.c:671:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	24(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; right,
	movq	%r12, %r8	; parser,
	call	parse_expr_prec	;
	movq	%rax, %rbp	; tmp136, right
; src/parser.c:672:             if (right == NULL) {
	testq	%rax, %rax	; right
	jne	.L19	;,
.L7:
; src/parser.c:662:             return NULL;
	xorl	%ebx, %ebx	; <retval>
.L1:
; src/parser.c:684: }
	addq	$40, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	parse_expr_prec, .-parse_expr_prec
	.section	.rodata.str1.1
.LC1:
	.string	"Failed to parse expression primary"
	.text
	.type	parse_expression, @function
parse_expression:
	pushq	%r12	;
	movq	%rsi, %r12	; tmp93, now_scope
	pushq	%rbp	;
	movq	%rdx, %rbp	; tmp94, parser
	pushq	%rbx	;
; src/parser.c:685: Expression* parse_expression(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
	movq	%rdi, %rbx	; tmp92, lexer
; src/parser.c:687:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
; src/parser.c:688:     if (left_primary == NULL) {
	testq	%rax, %rax	; <retval>
	je	.L26	;,
	movq	%rax, %rdx	; tmp95, <retval>
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbp, %r8	; parser,
	movq	%r12, %rcx	; now_scope,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rsi	; tmp98, _4
; src/parser.c:695: }
	popq	%rbx	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%edx, %edx	;
; src/parser.c:695: }
	popq	%rbp	;
	popq	%r12	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	jmp	parse_expr_prec	;
.L26:
; src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_10(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rdi	; lexer,
; src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rbp	; tmp96, _2
; src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	*peek_current_token@GOTPCREL(%rip)	;
; src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbp, %rdx	; _2,
	leaq	.LC1(%rip), %rdi	;, tmp90
; src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rsi	; tmp97, _3
; src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:695: }
	popq	%rbx	;
	xorl	%eax, %eax	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	parse_expression, .-parse_expression
	.section	.rodata.str1.1
.LC2:
	.string	"Expected variable type"
.LC3:
	.string	"Expected a type for variable declaration"
.LC4:
	.string	"Unknown variable type"
.LC5:
	.string	"Expected variable name"
.LC6:
	.string	"Failed to parse variable initializer"
	.text
	.type	parse_variable, @function
parse_variable:
	pushq	%r15	;
	pushq	%r14	;
	movq	%rsi, %r14	; tmp134, now_scope
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp133, lexer
	pushq	%rbx	;
	movq	%rdx, %rbx	; tmp135, parser
	pushq	%r8	;
; src/parser.c:369:     token = peek_current_token(lexer);
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp136, token
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	; token_39->type, _1
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	;, _1
	je	.L29	;,
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	;, _1
	jne	.L32	;,
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%r12), %rdi	; token_39->lexeme,
	call	*is_builtin_type@GOTPCREL(%rip)	;
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	; tmp138
	je	.L32	;,
.L29:
; src/parser.c:375:     Symbol* type = search_name(now_scope, token->lexeme);
	movq	(%r12), %rsi	; token_39->lexeme,
	movq	%r14, %rdi	; now_scope,
	call	*search_name@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp139, type
; src/parser.c:376:     if (type != NULL) {
	testq	%rax, %rax	; type
	je	.L33	;,
; src/parser.c:377:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	movl	32(%rax), %eax	; type_46->kind, _49
; src/parser.c:377:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	cmpl	$6, %eax	;, _49
	je	.L34	;,
	testl	%eax, %eax	; _49
	je	.L34	;,
; src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_41(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC3(%rip), %rdi	;, tmp125
; src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp140, _12
	jmp	.L60	;
.L33:
; src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_41(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC4(%rip), %rdi	;, tmp126
; src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp141, _14
.L60:
; src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L34:
; src/parser.c:381:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:382:     if (token->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	;, token_53->type
; src/parser.c:381:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp142, token
; src/parser.c:382:     if (token->type != IDENTIFIER)
	je	.L35	;,
; src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_41(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC5(%rip), %rdi	;, tmp127
; src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp143, _17
; src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L35:
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	cmpb	$0, 10(%rbx)	;, parser_41(D)->in_class
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movl	$3, %esi	;, iftmp.25_29
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	je	.L36	;,
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	cmpb	$1, 9(%rbx)	;, parser_41(D)->in_method
	sbbl	%esi, %esi	; iftmp.25_29
	andl	$2, %esi	;, iftmp.25_29
	addl	$3, %esi	;, iftmp.25_29
.L36:
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movq	(%r12), %rdi	; token_53->lexeme,
	movq	%r14, %rcx	; now_scope,
	movq	%r13, %rdx	; type,
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:386:     token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movq	%rax, %r12	; tmp144, name
; src/parser.c:386:     token = peek_next_token(lexer, true);
	call	*peek_next_token@GOTPCREL(%rip)	;
; src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_59->type
	je	.L37	;,
.L39:
; src/parser.c:385:     Expression* value = NULL;
	xorl	%ebp, %ebp	; value
	jmp	.L38	;
.L37:
; src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	movq	ASSIGN_SYMBOL(%rip), %rsi	; ASSIGN_SYMBOL,
	movq	(%rax), %rdi	; token_59->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	; tmp146
	je	.L39	;,
; src/parser.c:388:         token = get_next_token(lexer, true);  // consume '='
	movq	%rbp, %rdi	; lexer,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:389:         token = get_next_token(lexer, true);
	movq	%rbp, %rdi	; lexer,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:390:         value = parse_expression(lexer, now_scope, parser);
	movq	%rbp, %rdi	; lexer,
	movq	%rbx, %rdx	; parser,
	movq	%r14, %rsi	; now_scope,
; src/parser.c:389:         token = get_next_token(lexer, true);
	movq	%rax, %r15	; tmp147, token
; src/parser.c:390:         value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
	movq	%rax, %rbp	; tmp148, value
; src/parser.c:391:         if (value == NULL)
	testq	%rax, %rax	; value
	jne	.L38	;,
; src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_41(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	%r15, %rsi	; token,
	leaq	.LC6(%rip), %rdi	;, tmp129
; src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp149, _26
; src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L38:
; src/parser.c:396: }
	popq	%rcx	;
; src/parser.c:395:     return create_variable(type, name, value);
	movq	%rbp, %rdx	; value,
; src/parser.c:396: }
	popq	%rbx	;
; src/parser.c:395:     return create_variable(type, name, value);
	movq	%r12, %rsi	; name,
; src/parser.c:396: }
	popq	%rbp	;
; src/parser.c:395:     return create_variable(type, name, value);
	movq	%r13, %rdi	; type,
; src/parser.c:396: }
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/parser.c:395:     return create_variable(type, name, value);
	jmp	*create_variable@GOTPCREL(%rip)	;
.L32:
; src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_41(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC2(%rip), %rdi	;, tmp120
; src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp137, _6
; src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:396: }
	popq	%rdx	;
	xorl	%eax, %eax	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	parse_variable, .-parse_variable
	.section	.rodata.str1.1
.LC7:
	.string	"Failed to parse parenthesized expression"
.LC8:
	.string	"Expected ')' after expression"
.LC9:
	.string	"Failed to parse operand of unary '!'"
.LC10:
	.string	"Failed to parse operand of unary '-'"
.LC11:
	.string	"Expected variable name in variable access"
.LC12:
	.string	"Cannot call undefined variable"
.LC13:
	.string	"Cannot call non-function variable"
.LC14:
	.string	"Failed to parse function call argument"
.LC15:
	.string	"Expected ',' or ')' after function call argument"
.LC16:
	.string	"Failed to parse sequence index"
.LC17:
	.string	"Expected ']' after sequence index"
.LC18:
	.string	"Cannot access attribute without a valid scope"
.LC19:
	.string	"Expected attribute name after '.'"
.LC20:
	.string	"Unknown attribute name"
.LC21:
	.string	"Failed to parse variable access"
.LC22:
	.string	"Unexpected token in primary expression"
	.text
	.type	parse_primary, @function
parse_primary:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdx, %r12	; tmp267, parser
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$40, %rsp	;,
; src/parser.c:696: Primary* parse_primary(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
	movq	%rdi, (%rsp)	; tmp265, %sfp
	movq	%rsi, 16(%rsp)	; tmp266, %sfp
; src/parser.c:699:     token = peek_current_token(lexer);
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp268, token
; src/parser.c:705:     if (token->type == INTEGER) {
	movl	24(%rax), %eax	; token_62->type, _1
; src/parser.c:705:     if (token->type == INTEGER) {
	cmpl	$2, %eax	;, _1
	jne	.L62	;,
; src/parser.c:707:         str_value = token->lexeme;
	movq	0(%r13), %rsi	; token_62->lexeme, str_value
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%ebp, %ebp	; variable_value
; src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%eax, %eax	; prim_value
; src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	; expr_value
; src/parser.c:706:         type = PRIM_INTEGER;
	xorl	%r13d, %r13d	; type
	jmp	.L63	;
.L62:
; src/parser.c:708:     } else if (token->type == FLOAT) {
	cmpl	$3, %eax	;, _1
	jne	.L64	;,
; src/parser.c:710:         str_value = token->lexeme;
	movq	0(%r13), %rsi	; token_62->lexeme, str_value
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%ebp, %ebp	; variable_value
; src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%eax, %eax	; prim_value
; src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	; expr_value
; src/parser.c:709:         type = PRIM_FLOAT;
	movl	$1, %r13d	;, type
	jmp	.L63	;
.L64:
; src/parser.c:711:     } else if (token->type == STRING) {
	cmpl	$4, %eax	;, _1
	jne	.L65	;,
; src/parser.c:713:         str_value = token->lexeme;
	movq	0(%r13), %rsi	; token_62->lexeme, str_value
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%ebp, %ebp	; variable_value
; src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%eax, %eax	; prim_value
; src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	; expr_value
; src/parser.c:712:         type = PRIM_STRING;
	movl	$2, %r13d	;, type
	jmp	.L63	;
.L65:
; src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	;, _1
	jne	.L66	;,
; src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	movq	TRUE_KEYWORD(%rip), %rsi	; TRUE_KEYWORD,
	movq	0(%r13), %rdi	; token_62->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	; tmp269
	je	.L67	;,
; src/parser.c:716:         str_value = token->lexeme;
	movq	0(%r13), %rsi	; token_62->lexeme, str_value
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%ebp, %ebp	; variable_value
; src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%eax, %eax	; prim_value
; src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	; expr_value
; src/parser.c:715:         type = PRIM_TRUE;
	movl	$3, %r13d	;, type
; src/parser.c:716:         str_value = token->lexeme;
	jmp	.L63	;
.L67:
; src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, 24(%r13)	;, token_62->type
	jne	.L66	;,
; src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movq	FALSE_KEYWORD(%rip), %rsi	; FALSE_KEYWORD,
	movq	0(%r13), %rdi	; token_62->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	; tmp270
	je	.L66	;,
; src/parser.c:719:         str_value = token->lexeme;
	movq	0(%r13), %rsi	; token_62->lexeme, str_value
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%ebp, %ebp	; variable_value
; src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%eax, %eax	; prim_value
; src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	; expr_value
; src/parser.c:718:         type = PRIM_FALSE;
	movl	$4, %r13d	;, type
; src/parser.c:719:         str_value = token->lexeme;
	jmp	.L63	;
.L66:
; src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r13)	;, token_62->type
	jne	.L76	;,
; src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movq	0(%r13), %rdi	; token_62->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp271
	je	.L69	;,
; src/parser.c:722:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:723:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	16(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%r12, %rdx	; parser,
; src/parser.c:722:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp272, token
; src/parser.c:723:         expr_value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
	movq	%rax, %rbx	; tmp273, expr_value
; src/parser.c:724:         if (expr_value == NULL) {
	testq	%rax, %rax	; expr_value
	jne	.L70	;,
; src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC7(%rip), %rdi	;, tmp224
; src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp274, _15
	jmp	.L174	;
.L70:
; src/parser.c:729:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %r13d	; token_75->type, type
; src/parser.c:729:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp275, token
; src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %r13d	;, type
	je	.L72	;,
.L74:
; src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC8(%rip), %rdi	;, tmp225
; src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp276, _21
	jmp	.L174	;
.L72:
; src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_75->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp277
	je	.L74	;,
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%ebp, %ebp	; variable_value
; src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%eax, %eax	; prim_value
; src/parser.c:701:     string str_value = NULL;
	xorl	%esi, %esi	; str_value
	jmp	.L63	;
.L69:
; src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	cmpl	$5, 24(%r13)	;, token_62->type
	jne	.L76	;,
; src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movq	NOT_SYMBOL(%rip), %rsi	; NOT_SYMBOL,
	movq	0(%r13), %rdi	; token_62->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	; tmp278
	je	.L75	;,
; src/parser.c:737:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:738:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	16(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%r12, %rdx	; parser,
; src/parser.c:737:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp279, token
; src/parser.c:738:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
; src/parser.c:739:         if (prim_value == NULL) {
	testq	%rax, %rax	; prim_value
	jne	.L114	;,
; src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC9(%rip), %rdi	;, tmp228
; src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp281, _27
	jmp	.L174	;
.L75:
; src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	cmpl	$5, 24(%r13)	;, token_62->type
	jne	.L76	;,
; src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movq	SUB_SYMBOL(%rip), %rsi	; SUB_SYMBOL,
	movq	0(%r13), %rdi	; token_62->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	; tmp282
	je	.L76	;,
; src/parser.c:746:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:747:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	16(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%r12, %rdx	; parser,
; src/parser.c:746:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp283, token
; src/parser.c:747:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
; src/parser.c:748:         if (prim_value == NULL) {
	testq	%rax, %rax	; prim_value
	jne	.L115	;,
; src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC10(%rip), %rdi	;, tmp230
; src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp285, _33
	jmp	.L174	;
.L76:
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movl	24(%r13), %eax	; token_62->type, _34
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$1, %eax	;, _34
	je	.L80	;,
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$6, %eax	;, _34
	jne	.L79	;,
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	movq	0(%r13), %rdi	; token_62->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	testb	%al, %al	; tmp287
	je	.L79	;,
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpb	$0, 9(%r12)	;, parser_71(D)->in_method
	je	.L79	;,
.L80:
; src/parser.c:771:     Token* token = peek_current_token(lexer);
	movq	(%rsp), %rdi	; %sfp,
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp286, token
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movl	24(%rax), %eax	; token_107->type, _108
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	;, _108
	je	.L78	;,
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	;, _108
	je	.L81	;,
.L83:
; src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC11(%rip), %rdi	;, tmp232
; src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp288, _113
.L173:
; src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L82:
; src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%r13, %rsi	; token,
	leaq	.LC21(%rip), %rdi	;, tmp261
; src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp329, _40
.L174:
; src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:768: }
	addq	$40, %rsp	;,
	xorl	%eax, %eax	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L114:
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%ebp, %ebp	; variable_value
; src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	; expr_value
; src/parser.c:701:     string str_value = NULL;
	xorl	%esi, %esi	; str_value
; src/parser.c:736:         type = PRIM_NOT_OPERAND;
	movl	$6, %r13d	;, type
	jmp	.L63	;
.L115:
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%ebp, %ebp	; variable_value
; src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	; expr_value
; src/parser.c:701:     string str_value = NULL;
	xorl	%esi, %esi	; str_value
; src/parser.c:745:         type = PRIM_NEG_OPERAND;
	movl	$7, %r13d	;, type
.L63:
; src/parser.c:768: }
	addq	$40, %rsp	;,
; src/parser.c:767:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%rbp, %r8	; variable_value,
	movq	%rbx, %rdx	; expr_value,
	movl	%r13d, %edi	; type,
; src/parser.c:768: }
	popq	%rbx	;
; src/parser.c:767:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%rax, %rcx	; prim_value,
; src/parser.c:768: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/parser.c:767:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	jmp	*create_primary@GOTPCREL(%rip)	;
.L81:
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	movq	(%rbx), %rdi	; token_107->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	; tmp289
	je	.L83	;,
.L78:
; src/parser.c:780:     base_name = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rsi	; token_107->lexeme,
	movq	16(%rsp), %rdi	; %sfp,
; src/parser.c:777:     Symbol* current_type = NULL;
	xorl	%r14d, %r14d	; class_name
; src/parser.c:780:     base_name = search_name(now_scope, token->lexeme);
	call	*search_name@GOTPCREL(%rip)	;
; src/parser.c:781:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%r8d, %r8d	;
	xorl	%esi, %esi	;
	movq	%rax, %rdx	; base_name,
	xorl	%edi, %edi	;
; src/parser.c:780:     base_name = search_name(now_scope, token->lexeme);
	movq	%rax, %rbx	; tmp290, base_name
; src/parser.c:781:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:782:     token = peek_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:781:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	movq	%rax, %rbp	; tmp291, variable_value
; src/parser.c:782:     token = peek_next_token(lexer, true);
	call	*peek_next_token@GOTPCREL(%rip)	;
; src/parser.c:779:     SymbolTable* var_scope = NULL;
	xorl	%ecx, %ecx	;
	movq	%rcx, 8(%rsp)	;, %sfp
; src/parser.c:782:     token = peek_next_token(lexer, true);
	movq	%rax, %r15	; tmp292, token
; src/parser.c:783:     while (token->type == SYMBOL) {
	jmp	.L84	;
.L111:
; src/parser.c:784:         if (base_name != NULL) {
	testq	%rbx, %rbx	; base_name
	je	.L85	;,
; src/parser.c:786:             if (base_name->type != NULL)  // subroutine or variable or attribute or parameter
	movq	(%rbx), %r14	; base_name_118->type, class_name
; src/parser.c:785:             current_type = base_name;     // class or type
	testq	%r14, %r14	; class_name
	cmove	%rbx, %r14	; class_name,, base_name, class_name
.L85:
; src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	cmpq	$0, 8(%rsp)	;, %sfp
	je	.L175	;,
.L86:
; src/parser.c:791:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movq	(%r15), %rdi	; token_129->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:791:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp293
	jne	.L176	;,
; src/parser.c:824:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	movq	L_BRACKET_SYMBOL(%rip), %rsi	; L_BRACKET_SYMBOL,
	movq	(%r15), %rdi	; token_129->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:824:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	; tmp311
	je	.L101	;,
; src/parser.c:825:             token = get_next_token(lexer, true);  // consume '['
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:826:             token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:827:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	16(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%r12, %rdx	; parser,
; src/parser.c:826:             token = get_next_token(lexer, true);
	movq	%rax, %r15	; tmp312, token
; src/parser.c:827:             Expression* index = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
	movq	%rax, 24(%rsp)	; tmp313, %sfp
; src/parser.c:828:             if (index == NULL)
	testq	%rax, %rax	;
	jne	.L102	;,
; src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	%r15, %rsi	; token,
	leaq	.LC16(%rip), %rdi	;, tmp254
; src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp314, _185
; src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L102:
; src/parser.c:830:             token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_186->type
; src/parser.c:830:             token = get_next_token(lexer, true);
	movq	%rax, %r15	; tmp315, token
; src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	jne	.L104	;,
; src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	R_BRACKET_SYMBOL(%rip), %rsi	; R_BRACKET_SYMBOL,
	movq	(%rax), %rdi	; token_186->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	testb	%al, %al	; tmp317
	je	.L104	;,
; src/parser.c:836:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movq	%rbp, %rsi	; variable_value,
	movq	24(%rsp), %rcx	; %sfp,
	xorl	%r8d, %r8d	;
	xorl	%edx, %edx	;
	movl	$3, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp318, variable_value
.L100:
; src/parser.c:872:         token = peek_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*peek_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp328, token
.L84:
; src/parser.c:783:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%r15)	;, token_129->type
	je	.L111	;,
	jmp	.L112	;
.L175:
; src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	testq	%r14, %r14	; class_name
	je	.L86	;,
	xorl	%edx, %edx	;
; src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r14)	;, current_type_122->kind
	movq	%rdx, 8(%rsp)	;, %sfp
	jne	.L86	;,
; src/parser.c:790:             var_scope = current_type->ast_node.class->class_scope;
	movq	24(%r14), %rax	; current_type_122->ast_node.class, current_type_122->ast_node.class
	movq	16(%rax), %rax	; _126->class_scope, var_scope
	movq	%rax, 8(%rsp)	; var_scope, %sfp
	jmp	.L86	;
.L176:
; src/parser.c:792:             token = get_next_token(lexer, true);  // consume '('
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp294, token
; src/parser.c:793:             if (base_name == NULL)
	testq	%rbx, %rbx	; base_name
	jne	.L88	;,
; src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%r14, %rsi	; token,
	leaq	.LC12(%rip), %rdi	;, tmp240
; src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp295, _134
	jmp	.L170	;
.L88:
; src/parser.c:795:             else if (base_name->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rbx)	;, base_name_118->kind
	jne	.L90	;,
; src/parser.c:796:                 string name = make_method_name(base_name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	8(%rbx), %rdi	; base_name_118->name, base_name_118->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp296, name
; src/parser.c:797:                 base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
	movq	24(%rbx), %rax	; base_name_118->ast_node.class, base_name_118->ast_node.class
	movq	16(%rax), %rdi	; _139->class_scope, _140
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
; src/parser.c:798:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	%rbp, %rsi	; variable_value,
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
; src/parser.c:797:                 base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
	movq	%rax, %rbx	; tmp297, base_name
; src/parser.c:798:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	%rax, %rdx	; base_name,
	movl	$2, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp298, variable_value
; src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	testq	%rbx, %rbx	; base_name
	je	.L89	;,
.L90:
; src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	movl	32(%rbx), %eax	; base_name_145->kind, tmp334
	decl	%eax	; tmp244
	cmpl	$1, %eax	;, tmp244
	jbe	.L89	;,
; src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%r14, %rsi	; token,
	leaq	.LC13(%rip), %rdi	;, tmp246
; src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp299, _148
.L170:
; src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L89:
; src/parser.c:802:             token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp300, token
; src/parser.c:803:             list(Expression*) args = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp301, %sfp
.L93:
; src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r14)	;, token_154->type
	je	.L177	;,
.L99:
; src/parser.c:805:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	16(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%r12, %rdx	; parser,
	call	parse_expression	;
	movq	%rax, %r15	; tmp302, arg
; src/parser.c:806:                 if (arg == NULL)
	testq	%rax, %rax	; arg
	jne	.L94	;,
; src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%r14, %rsi	; token,
	leaq	.LC14(%rip), %rdi	;,
; src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp303, _153
; src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L94:
; src/parser.c:808:                 list_append(args, (pointer)arg);
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r15, %rsi	; arg,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:809:                 token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	cmpl	$5, 24(%rax)	;, token_155->type
; src/parser.c:809:                 token = get_next_token(lexer, true);
	movq	%rax, %r14	; tmp304, token
; src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	je	.L95	;,
.L98:
; src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%r14, %rsi	; token,
	leaq	.LC15(%rip), %rdi	;, tmp248
; src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp305, _166
	jmp	.L173	;
.L95:
; src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	movq	(%rax), %rdi	; token_155->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	testb	%al, %al	; tmp306
	je	.L96	;,
; src/parser.c:811:                     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp307, token
; src/parser.c:811:                     token = get_next_token(lexer, true);
	jmp	.L93	;
.L96:
; src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r14)	;, token_155->type
	jne	.L98	;,
; src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	(%r14), %rdi	; token_155->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp308
	jne	.L93	;,
	jmp	.L98	;
.L177:
; src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	(%r14), %rdi	; token_154->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp309
	je	.L99	;,
; src/parser.c:818:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; variable_value,
	movq	8(%rsp), %r8	; %sfp,
	movl	$1, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:819:             base_name = base_name->type;
	movq	(%rbx), %rbx	; base_name_174->type, base_name
; src/parser.c:818:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%rax, %rbp	; tmp310, variable_value
; src/parser.c:822:             if (base_name->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rbx)	;, base_name_175->kind
	jne	.L117	;,
; src/parser.c:823:                 var_scope = base_name->ast_node.class->class_scope;
	movq	24(%rbx), %rax	; base_name_175->ast_node.class, base_name_175->ast_node.class
	movq	16(%rax), %rax	; _177->class_scope, var_scope
	movq	%rax, 8(%rsp)	; var_scope, %sfp
	jmp	.L172	;
.L104:
; src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	%r15, %rsi	; token,
	leaq	.LC17(%rip), %rdi	;, tmp255
; src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp316, _192
	jmp	.L173	;
.L101:
; src/parser.c:837:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	movq	DOT_SYMBOL(%rip), %rsi	; DOT_SYMBOL,
	movq	(%r15), %rdi	; token_129->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:837:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	; tmp319
	jne	.L105	;,
.L112:
; src/parser.c:756:         if (variable_value == NULL) {
	testq	%rbp, %rbp	; variable_value
	je	.L82	;,
; src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%eax, %eax	; prim_value
; src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	; expr_value
; src/parser.c:701:     string str_value = NULL;
	xorl	%esi, %esi	; str_value
; src/parser.c:754:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %r13d	;, type
	jmp	.L63	;
.L105:
; src/parser.c:838:             token = get_next_token(lexer, true);  // consume '.'
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:839:             token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:840:             if (var_scope == NULL) {
	cmpq	$0, 8(%rsp)	;, %sfp
; src/parser.c:839:             token = get_next_token(lexer, true);
	movq	%rax, %r15	; tmp320, token
; src/parser.c:840:             if (var_scope == NULL) {
	jne	.L106	;,
; src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	%r15, %rsi	; token,
	leaq	.LC18(%rip), %rdi	;, tmp258
; src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp321, _201
	jmp	.L173	;
.L106:
; src/parser.c:845:             if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_198->type
	je	.L107	;,
; src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	%r15, %rsi	; token,
	leaq	.LC19(%rip), %rdi	;, tmp259
; src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp322, _205
	jmp	.L173	;
.L107:
; src/parser.c:850:             base_name = search_name(var_scope, token->lexeme);
	movq	(%rax), %rsi	; token_198->lexeme,
	movq	8(%rsp), %rdi	; %sfp,
	call	*search_name@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp323, base_name
; src/parser.c:851:             if (base_name == NULL) {
	testq	%rax, %rax	; base_name
	jne	.L108	;,
; src/parser.c:853:                 if (current_type != NULL) {
	testq	%r14, %r14	; class_name
	je	.L109	;,
; src/parser.c:854:                     if (current_type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r14)	;, current_type_122->kind
	je	.L171	;,
; src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	movq	(%r14), %r14	; current_type_122->type, class_name
; src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	testq	%r14, %r14	; class_name
	je	.L109	;,
; src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r14)	;, _211->kind
	jne	.L118	;,
.L171:
; src/parser.c:857:                         class_name = current_type->type->name;
	movq	8(%r14), %r14	;, class_name
	jmp	.L109	;
.L118:
; src/parser.c:852:                 string class_name = NULL;
	xorl	%r14d, %r14d	; class_name
.L109:
; src/parser.c:859:                 string name = make_method_name(class_name, token->lexeme);
	movq	(%r15), %rsi	; token_198->lexeme,
	movq	%r14, %rdi	; class_name,
	call	*make_method_name@GOTPCREL(%rip)	;
; src/parser.c:860:                 base_name = search_name_use_strcmp(var_scope, name);
	movq	8(%rsp), %rdi	; %sfp,
; src/parser.c:859:                 string name = make_method_name(class_name, token->lexeme);
	movq	%rax, %rsi	; tmp324, name
; src/parser.c:860:                 base_name = search_name_use_strcmp(var_scope, name);
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp325, base_name
; src/parser.c:862:             if (base_name == NULL) {
	testq	%rax, %rax	; base_name
	jne	.L108	;,
; src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	%r15, %rsi	; token,
	leaq	.LC20(%rip), %rdi	;, tmp260
; src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp326, _219
	jmp	.L173	;
.L108:
; src/parser.c:867:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	%rbp, %rsi	; variable_value,
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	movq	%rbx, %rdx	; base_name,
	movl	$2, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp327, variable_value
.L117:
; src/parser.c:821:             var_scope = NULL;
	xorl	%eax, %eax	;
	movq	%rax, 8(%rsp)	;, %sfp
.L172:
; src/parser.c:820:             current_type = NULL;
	xorl	%r14d, %r14d	; class_name
	jmp	.L100	;
.L79:
; src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%r13, %rsi	; token,
	leaq	.LC22(%rip), %rdi	;, tmp262
; src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp330, _42
	jmp	.L174	;
	.size	parse_primary, .-parse_primary
	.section	.rodata.str1.1
.LC23:
	.string	"Expected '(' after 'if'"
.LC24:
	.string	"Failed to parse if condition"
.LC25:
	.string	"Expected ')' after if condition"
.LC26:
	.string	"Expected '{' to start if body"
.LC27:
	.string	"Failed to parse if body statement"
.LC28:
	.string	"Expected '(' after 'elif'"
.LC29:
	.string	"Failed to parse else-if condition"
.LC30:
	.string	"Expected ')' after else-if condition"
.LC31:
	.string	"Expected '{' to start else-if body"
.LC32:
	.string	"Failed to parse else-if body statement"
.LC33:
	.string	"Expected '{' to start else body"
.LC34:
	.string	"Failed to parse else body statement"
.LC35:
	.string	"Expected '(' after 'for'"
.LC36:
	.string	"Failed to parse for loop initializer"
.LC37:
	.string	"Expected ';' after for loop initializer"
.LC38:
	.string	"Failed to parse for loop condition"
.LC39:
	.string	"Expected ';' after for loop condition"
.LC40:
	.string	"Failed to parse for loop increment"
.LC41:
	.string	"Expected ')' after for loop increment"
.LC42:
	.string	"Expected '{' to start for loop body"
.LC43:
	.string	"Failed to parse for loop body statement"
.LC44:
	.string	"Expected '(' after 'while'"
.LC45:
	.string	"Failed to parse while condition"
.LC46:
	.string	"Expected ')' after while condition"
.LC47:
	.string	"Expected '{' to start while body"
.LC48:
	.string	"Failed to parse while body statement"
.LC49:
	.string	"Cannot use 'break' outside of a loop"
.LC50:
	.string	"Cannot use 'continue' outside of a loop"
.LC51:
	.string	"Failed to parse statement"
.LC52:
	.string	"Expected ';' after statement"
	.text
	.type	parse_statement, @function
parse_statement:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdx, %rbx	; tmp404, parser
	subq	$56, %rsp	;,
; src/parser.c:397: Statement* parse_statement(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
	movq	%rdi, (%rsp)	; tmp402, %sfp
	movq	%rsi, 8(%rsp)	; tmp403, %sfp
; src/parser.c:400:     token = peek_current_token(lexer);
	call	*peek_current_token@GOTPCREL(%rip)	;
; src/parser.c:402:     if (token->type == KEYWORD) {
	cmpl	$6, 24(%rax)	;, token_60->type
	jne	.L179	;,
; src/parser.c:403:         if (string_equal(token->lexeme, IF_KEYWORD))
	movq	IF_KEYWORD(%rip), %rsi	; IF_KEYWORD,
	movq	(%rax), %rdi	; token_60->lexeme,
	movq	%rax, %rbp	; tmp405, token
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:403:         if (string_equal(token->lexeme, IF_KEYWORD))
	testb	%al, %al	; tmp406
	je	.L180	;,
; src/parser.c:449:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_114->type
; src/parser.c:449:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp407, token
; src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L181	;,
.L183:
; src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC23(%rip), %rdi	;, tmp332
; src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp408, _120
	jmp	.L353	;
.L181:
; src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_114->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp409
	je	.L183	;,
; src/parser.c:455:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:456:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
; src/parser.c:455:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp410, token
; src/parser.c:456:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
	movq	%rax, %r12	; tmp411, condition
; src/parser.c:457:     if (condition == NULL)
	testq	%rax, %rax	; condition
	jne	.L184	;,
; src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC24(%rip), %rdi	;, tmp334
; src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp412, _124
; src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L184:
; src/parser.c:459:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_125->type
; src/parser.c:459:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp413, token
; src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L185	;,
.L186:
; src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC25(%rip), %rdi	;, tmp335
; src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp414, _131
.L353:
; src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:453:         return NULL;
	xorl	%esi, %esi	; _222
	jmp	.L208	;
.L185:
; src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_125->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp415
	je	.L186	;,
; src/parser.c:465:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_132->type
; src/parser.c:465:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp416, token
; src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L187	;,
.L188:
; src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC26(%rip), %rdi	;, tmp337
; src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp417, _138
	jmp	.L353	;
.L187:
; src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_132->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp418
	je	.L188	;,
; src/parser.c:471:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:472:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	leaq	.LC27(%rip), %r13	;, tmp399
; src/parser.c:471:     list(Statement*) body = create_list();
	movq	%rax, 16(%rsp)	; tmp419, %sfp
; src/parser.c:472:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp420, token
.L189:
; src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_144->type
	je	.L360	;,
.L191:
; src/parser.c:474:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_statement	;
	movq	%rax, %r14	; tmp421, statement
; src/parser.c:475:         if (statement == NULL)
	testq	%rax, %rax	; statement
	jne	.L190	;,
; src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	movq	%r13, %rdi	; tmp399,
; src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp422, _143
; src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L190:
; src/parser.c:477:         list_append(body, (pointer)statement);
	movq	16(%rsp), %rdi	; %sfp,
	movq	%r14, %rsi	; statement,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:478:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp423, token
	jmp	.L189	;
.L360:
; src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	movq	0(%rbp), %rdi	; token_144->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp424
	je	.L191	;,
; src/parser.c:480:     list(ElseIf*) else_if = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, 24(%rsp)	; tmp425, %sfp
; src/parser.c:481:     list(Statement*) else_body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, 32(%rsp)	; tmp426, %sfp
.L352:
; src/parser.c:517:         token = peek_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*peek_next_token@GOTPCREL(%rip)	;
; src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	;, token_194->type
; src/parser.c:517:         token = peek_next_token(lexer, true);
	movq	%rax, %rbp	; tmp447, token
; src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	jne	.L204	;,
; src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	movq	ELIF_KEYWORD(%rip), %rsi	; ELIF_KEYWORD,
	movq	(%rax), %rdi	; token_194->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	; tmp448
	je	.L361	;,
; src/parser.c:484:         token = get_next_token(lexer, true);  // consume 'elif'
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:485:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_153->type
; src/parser.c:485:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp428, token
; src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L193	;,
.L194:
; src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC28(%rip), %rdi	;, tmp341
; src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp429, _159
	jmp	.L353	;
.L193:
; src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_153->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp430
	je	.L194	;,
; src/parser.c:491:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:492:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
; src/parser.c:491:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp431, token
; src/parser.c:492:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
	movq	%rax, %r13	; tmp432, elif_condition
; src/parser.c:493:         if (elif_condition == NULL)
	testq	%rax, %rax	; elif_condition
	jne	.L195	;,
; src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC29(%rip), %rdi	;,
; src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp433, _164
; src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L195:
; src/parser.c:495:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_165->type
; src/parser.c:495:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp434, token
; src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L196	;,
.L197:
; src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC30(%rip), %rdi	;, tmp344
; src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp435, _171
	jmp	.L353	;
.L196:
; src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_165->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp436
	je	.L197	;,
; src/parser.c:501:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_173->type
; src/parser.c:501:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp437, token
; src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L198	;,
.L199:
; src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC31(%rip), %rdi	;, tmp346
; src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp438, _179
	jmp	.L353	;
.L198:
; src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_173->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp439
	je	.L199	;,
; src/parser.c:507:         list(Statement*) elif_body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:508:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	leaq	.LC32(%rip), %r15	;, tmp397
; src/parser.c:507:         list(Statement*) elif_body = create_list();
	movq	%rax, 40(%rsp)	; tmp440, %sfp
; src/parser.c:508:         token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp441, token
.L200:
; src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_186->type
	je	.L362	;,
.L202:
; src/parser.c:510:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_statement	;
	movq	%rax, %r14	; tmp442, statement
; src/parser.c:511:             if (statement == NULL)
	testq	%rax, %rax	; statement
	jne	.L201	;,
; src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	movq	%r15, %rdi	; tmp397,
; src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp443, _185
; src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L201:
; src/parser.c:513:             list_append(elif_body, (pointer)statement);
	movq	40(%rsp), %rdi	; %sfp,
	movq	%r14, %rsi	; statement,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:514:             token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp444, token
	jmp	.L200	;
.L362:
; src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	movq	0(%rbp), %rdi	; token_186->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp445
	je	.L202	;,
; src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	40(%rsp), %rsi	; %sfp,
	movq	%r13, %rdi	; elif_condition,
	call	*create_else_if@GOTPCREL(%rip)	;
; src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	24(%rsp), %rdi	; %sfp,
; src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%rax, %rsi	; tmp446, _192
; src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L352	;
.L361:
; src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, 24(%rbp)	;, token_194->type
	jne	.L204	;,
; src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	movq	ELSE_KEYWORD(%rip), %rsi	; ELSE_KEYWORD,
	movq	0(%rbp), %rdi	; token_194->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	; tmp450
	jne	.L363	;,
.L204:
; src/parser.c:536:     token = peek_current_token(lexer);
	movq	(%rsp), %rdi	; %sfp,
	call	*peek_current_token@GOTPCREL(%rip)	;
; src/parser.c:538:     return create_if(condition, body, else_if, else_body);
	movq	16(%rsp), %rsi	; %sfp,
	movq	32(%rsp), %rcx	; %sfp,
	movq	%r12, %rdi	; condition,
	movq	24(%rsp), %rdx	; %sfp,
	call	*create_if@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp449, _222
	jmp	.L208	;
.L363:
; src/parser.c:520:         token = get_next_token(lexer, true);  // consume 'else'
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:521:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_204->type
; src/parser.c:521:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp451, token
; src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L209	;,
.L210:
; src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC33(%rip), %rdi	;, tmp352
; src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp452, _210
	jmp	.L353	;
.L209:
; src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_204->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp453
	je	.L210	;,
; src/parser.c:527:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	leaq	.LC34(%rip), %r13	;, tmp396
; src/parser.c:527:         token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp454, token
.L211:
; src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_215->type
	je	.L364	;,
.L213:
; src/parser.c:529:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_statement	;
	movq	%rax, %r14	; tmp455, statement
; src/parser.c:530:             if (statement == NULL)
	testq	%rax, %rax	; statement
	jne	.L212	;,
; src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	movq	%r13, %rdi	; tmp396,
; src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp456, _214
; src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L212:
; src/parser.c:532:             list_append(else_body, (pointer)statement);
	movq	32(%rsp), %rdi	; %sfp,
	movq	%r14, %rsi	; statement,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:533:             token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp457, token
	jmp	.L211	;
.L364:
; src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	movq	0(%rbp), %rdi	; token_215->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp458
	je	.L213	;,
	jmp	.L204	;
.L208:
; src/parser.c:404:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$2, %edi	;,
	jmp	.L359	;
.L180:
; src/parser.c:405:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	movq	FOR_KEYWORD(%rip), %rsi	; FOR_KEYWORD,
	movq	0(%rbp), %rdi	; token_60->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:405:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	testb	%al, %al	; tmp459
	je	.L214	;,
; src/parser.c:543:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_223->type
; src/parser.c:543:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp460, token
; src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L215	;,
.L217:
; src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC35(%rip), %rdi	;, tmp357
; src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp461, _229
	jmp	.L354	;
.L215:
; src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_223->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp462
	je	.L217	;,
; src/parser.c:549:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_230->type
; src/parser.c:549:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp463, token
; src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	je	.L218	;,
.L221:
; src/parser.c:552:         initializer = parse_variable(lexer, now_scope, parser);
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_variable	;
	movq	%rax, %r12	; tmp464, initializer
; src/parser.c:553:         if (initializer == NULL)
	testq	%rax, %rax	; initializer
	jne	.L220	;,
; src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC36(%rip), %rdi	;, tmp360
; src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp466, _237
; src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L220	;
.L218:
; src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	movq	(%rax), %rdi	; token_230->lexeme,
; src/parser.c:550:     Variable* initializer = NULL;
	xorl	%r12d, %r12d	; initializer
; src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp465
	jne	.L222	;,
	jmp	.L221	;
.L220:
; src/parser.c:555:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp467, token
.L222:
; src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_239->type
	je	.L223	;,
.L225:
; src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC37(%rip), %rdi	;, tmp361
; src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp468, _245
.L354:
; src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:547:         return NULL;
	xorl	%ecx, %ecx	; _300
	jmp	.L224	;
.L223:
; src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	movq	0(%rbp), %rdi	; token_239->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp469
	je	.L225	;,
; src/parser.c:562:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_246->type
; src/parser.c:562:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp470, token
; src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	je	.L226	;,
.L229:
; src/parser.c:565:         condition = parse_expression(lexer, now_scope, parser);
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_expression	;
	movq	%rax, %r13	; tmp471, condition
; src/parser.c:566:         if (condition == NULL)
	testq	%rax, %rax	; condition
	jne	.L228	;,
; src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC38(%rip), %rdi	;, tmp364
; src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp473, _253
; src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L228	;
.L226:
; src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	movq	(%rax), %rdi	; token_246->lexeme,
; src/parser.c:563:     Expression* condition = NULL;
	xorl	%r13d, %r13d	; condition
; src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp472
	jne	.L230	;,
	jmp	.L229	;
.L228:
; src/parser.c:568:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp474, token
.L230:
; src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_255->type
	je	.L231	;,
.L232:
; src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC39(%rip), %rdi	;, tmp365
; src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp475, _261
	jmp	.L354	;
.L231:
; src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	movq	0(%rbp), %rdi	; token_255->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp476
	je	.L232	;,
; src/parser.c:575:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_262->type
; src/parser.c:575:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp477, token
; src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L233	;,
.L236:
; src/parser.c:578:         increment = parse_expression(lexer, now_scope, parser);
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_expression	;
	movq	%rax, %r14	; tmp478, increment
; src/parser.c:579:         if (increment == NULL)
	testq	%rax, %rax	; increment
	jne	.L235	;,
; src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC40(%rip), %rdi	;, tmp368
; src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp480, _269
; src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L235	;
.L233:
; src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_262->lexeme,
; src/parser.c:576:     Expression* increment = NULL;
	xorl	%r14d, %r14d	; increment
; src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp479
	jne	.L237	;,
	jmp	.L236	;
.L235:
; src/parser.c:581:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp481, token
.L237:
; src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_271->type
	je	.L238	;,
.L239:
; src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC41(%rip), %rdi	;, tmp369
; src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp482, _277
	jmp	.L354	;
.L238:
; src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	0(%rbp), %rdi	; token_271->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp483
	je	.L239	;,
; src/parser.c:588:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_278->type
; src/parser.c:588:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp484, token
; src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L240	;,
.L241:
; src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC42(%rip), %rdi	;, tmp371
; src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp485, _284
	jmp	.L354	;
.L240:
; src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_278->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp486
	je	.L241	;,
; src/parser.c:594:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:595:     parser->in_loop = true;
	movb	$1, 11(%rbx)	;, parser_62(D)->in_loop
; src/parser.c:594:     list(Statement*) body = create_list();
	movq	%rax, 16(%rsp)	; tmp487, %sfp
.L355:
; src/parser.c:602:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_290->type
; src/parser.c:602:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp491, token
; src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	je	.L365	;,
.L244:
; src/parser.c:598:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_statement	;
	movq	%rax, %r15	; tmp489, statement
; src/parser.c:599:         if (statement == NULL)
	testq	%rax, %rax	; statement
	jne	.L243	;,
; src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC43(%rip), %rdi	;,
; src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp490, _289
; src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L243:
; src/parser.c:601:         list_append(body, (pointer)statement);
	movq	16(%rsp), %rdi	; %sfp,
	movq	%r15, %rsi	; statement,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L355	;
.L365:
; src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_290->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp492
	je	.L244	;,
; src/parser.c:606:     return create_for(initializer, condition, increment, body);
	movq	16(%rsp), %rcx	; %sfp,
; src/parser.c:604:     parser->in_loop = false;
	movb	$0, 11(%rbx)	;, parser_62(D)->in_loop
; src/parser.c:606:     return create_for(initializer, condition, increment, body);
	movq	%r14, %rdx	; increment,
	movq	%r13, %rsi	; condition,
	movq	%r12, %rdi	; initializer,
	call	*create_for@GOTPCREL(%rip)	;
	movq	%rax, %rcx	; tmp493, _300
.L224:
; src/parser.c:406:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$4, %edi	;,
	jmp	.L359	;
.L214:
; src/parser.c:407:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	movq	WHILE_KEYWORD(%rip), %rsi	; WHILE_KEYWORD,
	movq	0(%rbp), %rdi	; token_60->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:407:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	testb	%al, %al	; tmp494
	je	.L245	;,
; src/parser.c:611:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_301->type
; src/parser.c:611:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp495, token
; src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L246	;,
.L248:
; src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC44(%rip), %rdi	;, tmp376
; src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp496, _307
	jmp	.L356	;
.L246:
; src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_301->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp497
	je	.L248	;,
; src/parser.c:617:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:618:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
; src/parser.c:617:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp498, token
; src/parser.c:618:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
	movq	%rax, %r12	; tmp499, condition
; src/parser.c:619:     if (condition == NULL)
	testq	%rax, %rax	; condition
	jne	.L249	;,
; src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC45(%rip), %rdi	;, tmp378
; src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp500, _311
; src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L249:
; src/parser.c:621:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_312->type
; src/parser.c:621:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp501, token
; src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L250	;,
.L252:
; src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC46(%rip), %rdi	;, tmp379
; src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp502, _318
.L356:
; src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:615:         return NULL;
	xorl	%edx, %edx	; _338
	jmp	.L251	;
.L250:
; src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_312->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp503
	je	.L252	;,
; src/parser.c:627:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_319->type
; src/parser.c:627:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp504, token
; src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L253	;,
.L254:
; src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC47(%rip), %rdi	;, tmp381
; src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp505, _325
	jmp	.L356	;
.L253:
; src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_319->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp506
	je	.L254	;,
; src/parser.c:633:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:634:     parser->in_loop = true;
	movb	$1, 11(%rbx)	;, parser_62(D)->in_loop
; src/parser.c:635:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:633:     list(Statement*) body = create_list();
	movq	%rax, %r13	; tmp507, body
; src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	leaq	.LC48(%rip), %r14	;, tmp401
; src/parser.c:635:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp508, token
.L255:
; src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_331->type
	je	.L366	;,
.L257:
; src/parser.c:637:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_statement	;
	movq	%rax, %r15	; tmp509, statement
; src/parser.c:638:         if (statement == NULL)
	testq	%rax, %rax	; statement
	jne	.L256	;,
; src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	movq	%r14, %rdi	; tmp401,
; src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp510, _330
; src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L256:
; src/parser.c:640:         list_append(body, (pointer)statement);
	movq	%r15, %rsi	; statement,
	movq	%r13, %rdi	; body,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:641:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp511, token
	jmp	.L255	;
.L366:
; src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	movq	0(%rbp), %rdi	; token_331->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp512
	je	.L257	;,
; src/parser.c:643:     parser->in_loop = false;
	movb	$0, 11(%rbx)	;, parser_62(D)->in_loop
; src/parser.c:645:     return create_while(condition, body);
	movq	%r13, %rsi	; body,
	movq	%r12, %rdi	; condition,
	call	*create_while@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp513, _338
.L251:
; src/parser.c:408:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$3, %edi	;,
	jmp	.L359	;
.L245:
; src/parser.c:409:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	VAR_KEYWORD(%rip), %rsi	; VAR_KEYWORD,
	movq	0(%rbp), %rdi	; token_60->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:409:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	; tmp514
	je	.L258	;,
; src/parser.c:410:             get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:411:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_variable	;
; src/parser.c:411:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:411:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rax, %r9	;, tmp515
; src/parser.c:411:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	xorl	%esi, %esi	;
	movl	$1, %edi	;,
	jmp	.L358	;
.L258:
; src/parser.c:412:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	movq	RETURN_KEYWORD(%rip), %rsi	; RETURN_KEYWORD,
	movq	0(%rbp), %rdi	; token_60->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:412:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	; tmp517
	je	.L260	;,
; src/parser.c:413:             token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_85->type
	jne	.L261	;,
; src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	movq	(%rax), %rdi	; token_85->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp519
	je	.L261	;,
; src/parser.c:416:                 return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$5, %edi	;,
.L359:
; src/parser.c:445: }
	addq	$56, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/parser.c:416:                 return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	jmp	*create_statement@GOTPCREL(%rip)	;
.L261:
; src/parser.c:418:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_expression	;
; src/parser.c:418:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%r9d, %r9d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:418:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rax, %r8	;, tmp520
; src/parser.c:418:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%esi, %esi	;
	movl	$5, %edi	;,
	jmp	.L358	;
.L260:
; src/parser.c:419:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	movq	BREAK_KEYWORD(%rip), %rsi	; BREAK_KEYWORD,
	movq	0(%rbp), %rdi	; token_60->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:419:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	; tmp522
	je	.L262	;,
; src/parser.c:420:             if (!parser->in_loop) {
	cmpb	$0, 11(%rbx)	;, parser_62(D)->in_loop
	jne	.L263	;,
; src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC49(%rip), %rdi	;, tmp389
; src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp523, _31
	jmp	.L357	;
.L263:
; src/parser.c:425:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$6, %edi	;,
	jmp	.L358	;
.L262:
; src/parser.c:426:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	movq	CONTINUE_KEYWORD(%rip), %rsi	; CONTINUE_KEYWORD,
	movq	0(%rbp), %rdi	; token_60->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:426:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	; tmp525
	je	.L179	;,
; src/parser.c:427:             if (!parser->in_loop) {
	cmpb	$0, 11(%rbx)	;, parser_62(D)->in_loop
	jne	.L266	;,
; src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC50(%rip), %rdi	;, tmp391
; src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp526, _37
.L357:
; src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:423:                 return NULL;
	xorl	%ebp, %ebp	; <retval>
	jmp	.L178	;
.L266:
; src/parser.c:432:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$7, %edi	;,
	jmp	.L358	;
.L179:
; src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_expression	;
; src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%r9d, %r9d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rax, %r8	;, tmp530
; src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
.L358:
	call	*create_statement@GOTPCREL(%rip)	;
; src/parser.c:437:     token = peek_current_token(lexer);
	movq	(%rsp), %rdi	; %sfp,
; src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rax, %rbp	; tmp531, <retval>
; src/parser.c:437:     token = peek_current_token(lexer);
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp532, token
; src/parser.c:438:     if (statement == NULL)
	testq	%rbp, %rbp	; <retval>
	jne	.L268	;,
; src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC51(%rip), %rdi	;, tmp392
; src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp533, _41
; src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L268:
; src/parser.c:440:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	;, token_110->type
; src/parser.c:440:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp534, token
; src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	je	.L269	;,
.L271:
; src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC52(%rip), %rdi	;, tmp393
; src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp535, _47
; src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L178	;
.L269:
; src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	movq	(%rax), %rdi	; token_110->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; tmp536
	je	.L271	;,
.L178:
; src/parser.c:445: }
	addq	$56, %rsp	;,
	movq	%rbp, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	parse_statement, .-parse_statement
	.section	.rodata.str1.1
.LC53:
	.string	"Expected identifier after 'import'"
.LC54:
	.string	"Expected string literal after 'from'"
.LC55:
	.string	"Expected ';' at end of import statement"
.LC56:
	.string	"Failed to import module"
.LC57:
	.string	"Failed to parse import statement"
.LC58:
	.string	"Expected function return type after 'func'"
.LC59:
	.string	"Unknown function return type"
.LC60:
	.string	"Expected function name after return type"
.LC61:
	.string	"Expected '(' after function name"
.LC62:
	.string	"Failed to parse function parameter"
.LC63:
	.string	"Function parameters cannot have default values"
.LC64:
	.string	"Expected ',' or ')' after function parameter"
.LC65:
	.string	"Expected '{' to start function body"
.LC66:
	.string	"Failed to parse function body statement"
.LC67:
	.string	"Unreachable code after return statement"
.LC68:
	.string	"Function missing return statement"
.LC69:
	.string	"Failed to parse function declaration"
.LC70:
	.string	"Expected class name after 'class'"
.LC71:
	.string	"Expected '{' to start class body"
.LC72:
	.string	"Expected method return type after 'method'"
.LC73:
	.string	"Unknown return type for method"
.LC74:
	.string	"Expected method name after return type"
.LC75:
	.string	"Expected '(' after method name"
.LC76:
	.string	"Expected 'self' as first parameter of method"
.LC77:
	.string	"Expected ',' or ')' after method parameter"
.LC78:
	.string	"Failed to parse method parameter"
.LC79:
	.string	"Method parameters cannot have default values"
.LC80:
	.string	"Expected '{' to start method body"
.LC81:
	.string	"Failed to parse method body statement"
.LC82:
	.string	"Method missing return statement"
.LC83:
	.string	"Failed to parse class method"
.LC84:
	.string	"Failed to parse class variable"
.LC85:
	.string	"Unsupported type for class variable"
.LC86:
	.string	"Expected ';' after class variable declaration"
.LC87:
	.string	"Unexpected token in class member"
.LC88:
	.string	"Constructor name conflicts with existing member"
.LC89:
	.string	"0"
.LC90:
	.string	"Failed to parse class declaration"
.LC91:
	.string	"Unexpected token in code member"
	.text
	.globl	parse_code
	.type	parse_code, @function
parse_code:
	pushq	%r15	;
	pushq	%r14	;
	movq	%rdx, %r14	; tmp566, parser
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp565, now_scope
	subq	$120, %rsp	;,
; src/parser.c:23:     if (builtin_scope == NULL) {
	cmpq	$0, builtin_scope(%rip)	;, builtin_scope
; src/parser.c:21: Code* parse_code(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
	movq	%rdi, (%rsp)	; tmp564, %sfp
; src/parser.c:23:     if (builtin_scope == NULL) {
	jne	.L368	;,
; src/parser.c:24:         builtin_scope = create_symbol_table(NULL);
	xorl	%edi, %edi	;
	call	*create_symbol_table@GOTPCREL(%rip)	;
; src/parser.c:25:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	VOID_KEYWORD(%rip), %rdi	; VOID_KEYWORD,
	xorl	%edx, %edx	;
	movl	$6, %esi	;,
; src/parser.c:24:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, %rcx	; tmp567, _2
; src/parser.c:24:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, builtin_scope(%rip)	; _2, builtin_scope
; src/parser.c:25:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:26:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rcx	; builtin_scope,
	xorl	%edx, %edx	;
	movq	INT_KEYWORD(%rip), %rdi	; INT_KEYWORD,
	movl	$6, %esi	;,
; src/parser.c:25:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_void(%rip)	; tmp568, name_void
; src/parser.c:26:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:27:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rcx	; builtin_scope,
	xorl	%edx, %edx	;
	movq	FLOAT_KEYWORD(%rip), %rdi	; FLOAT_KEYWORD,
	movl	$6, %esi	;,
; src/parser.c:26:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_int(%rip)	; tmp569, name_int
; src/parser.c:27:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:28:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rcx	; builtin_scope,
	xorl	%edx, %edx	;
	movq	STRING_KEYWORD(%rip), %rdi	; STRING_KEYWORD,
	movl	$6, %esi	;,
; src/parser.c:27:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_float(%rip)	; tmp570, name_float
; src/parser.c:28:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:29:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rcx	; builtin_scope,
	xorl	%edx, %edx	;
	movq	BOOL_KEYWORD(%rip), %rdi	; BOOL_KEYWORD,
; src/parser.c:28:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_string(%rip)	; tmp571, name_string
; src/parser.c:29:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movl	$6, %esi	;,
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:29:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_bool(%rip)	; tmp572, name_bool
.L368:
; src/parser.c:31:     if (now_scope == NULL)
	testq	%rbx, %rbx	; now_scope
	jne	.L369	;,
; src/parser.c:32:         now_scope = builtin_scope;
	movq	builtin_scope(%rip), %rbx	; builtin_scope, now_scope
.L369:
; src/parser.c:34:     list(CodeMember*) members = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:35:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	%rbx, %rdi	; now_scope,
; src/parser.c:34:     list(CodeMember*) members = create_list();
	movq	%rax, 48(%rsp)	; tmp573, %sfp
; src/parser.c:35:     SymbolTable* global_scope = create_symbol_table(now_scope);
	call	*create_symbol_table@GOTPCREL(%rip)	;
	movq	%rax, 24(%rsp)	; tmp574, %sfp
.L383:
; src/parser.c:55:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp760, token
; src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	; token
	je	.L486	;,
; src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	movl	24(%rax), %eax	; token_41->type, _39
; src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	testl	%eax, %eax	; _39
	je	.L486	;,
; src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	;, _39
	jne	.L416	;,
; src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movq	IMPORT_KEYWORD(%rip), %rsi	; IMPORT_KEYWORD,
	movq	(%r15), %rdi	; token_41->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %r12d	; tmp576, have_return
; src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	testb	%al, %al	; have_return
	je	.L372	;,
; src/parser.c:63:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:64:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_101->type
; src/parser.c:63:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp577, token
; src/parser.c:64:     if (token->type != IDENTIFIER) {
	je	.L373	;,
; src/parser.c:65:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:65:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC53(%rip), %rdi	;, tmp461
; src/parser.c:65:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp578, _104
	jmp	.L564	;
.L373:
; src/parser.c:69:     string import_name = token->lexeme;
	movq	(%rax), %r12	; token_101->lexeme, import_name
; src/parser.c:71:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	cmpl	$6, 24(%rax)	;, token_106->type
; src/parser.c:71:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp579, token
; src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	jne	.L375	;,
; src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	FROM_KEYWORD(%rip), %rsi	; FROM_KEYWORD,
	movq	(%rax), %rdi	; token_106->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	testb	%al, %al	; tmp580
	jne	.L376	;,
.L375:
; src/parser.c:70:     string source = NULL;
	xorl	%ebp, %ebp	; source
	jmp	.L377	;
.L376:
; src/parser.c:73:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:74:         if (token->type != STRING) {
	cmpl	$4, 24(%rax)	;, token_111->type
; src/parser.c:73:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp581, token
; src/parser.c:74:         if (token->type != STRING) {
	je	.L378	;,
; src/parser.c:75:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:75:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC54(%rip), %rdi	;, tmp463
; src/parser.c:75:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp582, _114
.L564:
; src/parser.c:75:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L374	;
.L378:
; src/parser.c:79:         source = token->lexeme;
	movq	(%rax), %rbp	; token_111->lexeme, source
; src/parser.c:80:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp583, token
.L377:
; src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_117->type
	je	.L379	;,
.L380:
; src/parser.c:83:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:83:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC55(%rip), %rdi	;, tmp464
; src/parser.c:83:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp584, _123
	jmp	.L564	;
.L379:
; src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	movq	(%rbx), %rdi	; token_117->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp585
	je	.L380	;,
; src/parser.c:88:     name = parse_import_file(import_name, source, now_scope, parser->source_file);
	movq	(%r14), %rcx	; parser_74(D)->source_file,
	movq	24(%rsp), %rdx	; %sfp,
	movq	%rbp, %rsi	; source,
	movq	%r12, %rdi	; import_name,
	call	*parse_import_file@GOTPCREL(%rip)	;
; src/parser.c:89:     if (name == NULL) {
	testq	%rax, %rax	; name
	jne	.L381	;,
; src/parser.c:90:         parser_error("Failed to import module", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:90:         parser_error("Failed to import module", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC56(%rip), %rdi	;, tmp466
; src/parser.c:90:         parser_error("Failed to import module", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp587, _128
; src/parser.c:90:         parser_error("Failed to import module", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:91:         name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
	movq	24(%rsp), %rcx	; %sfp,
	movl	$3, %esi	;,
	movq	%r12, %rdi	; import_name,
	movq	name_void(%rip), %rdx	; name_void,
	call	*create_symbol@GOTPCREL(%rip)	;
.L381:
; src/parser.c:94:     return create_import(name, source);
	movq	%rbp, %rsi	; source,
	movq	%rax, %rdi	; name,
	call	*create_import@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp589, _132
; src/parser.c:40:             if (import == NULL)
	testq	%rax, %rax	; _132
	jne	.L382	;,
.L374:
; src/parser.c:41:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:41:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	%r15, %rsi	; token,
	leaq	.LC57(%rip), %rdi	;, tmp468
; src/parser.c:41:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp590, _21
; src/parser.c:41:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	xorl	%esi, %esi	; _132
.L382:
; src/parser.c:42:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%edi, %edi	;
	jmp	.L574	;
.L372:
; src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	cmpl	$6, 24(%r15)	;, token_41->type
	jne	.L416	;,
; src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	FUNC_KEYWORD(%rip), %rsi	; FUNC_KEYWORD,
	movq	(%r15), %rdi	; token_41->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	testb	%al, %al	; tmp592
	je	.L384	;,
; src/parser.c:99:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	24(%rsp), %rdi	; %sfp,
	call	*create_symbol_table@GOTPCREL(%rip)	;
; src/parser.c:100:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:99:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	%rax, 8(%rsp)	; tmp593, %sfp
; src/parser.c:100:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp594, token
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	; token_135->type, _136
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	;, _136
	je	.L385	;,
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	;, _136
	je	.L386	;,
.L388:
; src/parser.c:102:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:102:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC58(%rip), %rdi	;, tmp470
; src/parser.c:102:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp595, _140
	jmp	.L567	;
.L386:
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rbx), %rdi	; token_135->lexeme,
	call	*is_builtin_type@GOTPCREL(%rip)	;
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	; tmp596
	je	.L388	;,
.L385:
; src/parser.c:106:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rsi	; token_135->lexeme,
	movq	24(%rsp), %rdi	; %sfp,
	call	*search_name@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp597, return_type
; src/parser.c:107:     if (return_type == NULL) {
	testq	%rax, %rax	; return_type
	jne	.L389	;,
; src/parser.c:108:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:108:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC59(%rip), %rdi	;, tmp471
; src/parser.c:108:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp598, _144
	jmp	.L567	;
.L389:
; src/parser.c:112:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:113:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_145->type
; src/parser.c:112:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp599, token
; src/parser.c:113:     if (token->type != IDENTIFIER) {
	je	.L390	;,
; src/parser.c:114:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:114:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC60(%rip), %rdi	;, tmp472
; src/parser.c:114:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp600, _148
.L567:
; src/parser.c:114:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L387	;
.L390:
; src/parser.c:118:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/parser.c:119:     function->function_scope = function_scope;
	movq	8(%rsp), %rcx	; %sfp, function_scope
; src/parser.c:120:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	(%rbx), %rdi	; token_145->lexeme,
	movq	%rbp, %rdx	; return_type,
	movl	$1, %esi	;,
; src/parser.c:118:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movq	%rax, 16(%rsp)	; tmp601, %sfp
; src/parser.c:119:     function->function_scope = function_scope;
	movq	%rcx, 32(%rax)	; function_scope, function_149->function_scope
; src/parser.c:120:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	%rax, %rcx	; function,
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:121:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:120:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	%rax, 56(%rsp)	; tmp602, %sfp
; src/parser.c:121:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_152->type
; src/parser.c:121:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp603, token
; src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L391	;,
.L392:
; src/parser.c:123:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:123:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC61(%rip), %rdi	;, tmp473
; src/parser.c:123:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp604, _158
	jmp	.L567	;
.L391:
; src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_152->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp605
	je	.L392	;,
; src/parser.c:127:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:134:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	leaq	.LC63(%rip), %r13	;, tmp559
; src/parser.c:127:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp606, token
; src/parser.c:128:     list(Variable*) parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, 40(%rsp)	; tmp607, %sfp
.L393:
; src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_164->type
	je	.L575	;,
.L401:
; src/parser.c:130:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%r14, %rdx	; parser,
	call	parse_variable	;
	movq	%rax, %rsi	; tmp608, parameter
; src/parser.c:131:         if (parameter == NULL)
	testq	%rax, %rax	; parameter
	jne	.L394	;,
; src/parser.c:132:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:132:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC62(%rip), %rdi	;, tmp475
; src/parser.c:132:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp609, _163
	jmp	.L565	;
.L394:
; src/parser.c:133:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	;, parameter_161->value
	je	.L396	;,
; src/parser.c:134:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:134:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	movq	%r13, %rdi	; tmp559,
; src/parser.c:134:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp610, _167
.L565:
; src/parser.c:134:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L395	;
.L396:
; src/parser.c:136:             list_append(parameters, (pointer)parameter);
	movq	40(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
.L395:
; src/parser.c:137:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_168->type
; src/parser.c:137:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp611, token
; src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	je	.L397	;,
.L400:
; src/parser.c:141:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:141:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC64(%rip), %rdi	;, tmp477
; src/parser.c:141:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp612, _179
	jmp	.L567	;
.L397:
; src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	movq	(%rax), %rdi	; token_168->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	; tmp613
	je	.L398	;,
; src/parser.c:139:             token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp614, token
; src/parser.c:139:             token = get_next_token(lexer, true);
	jmp	.L393	;
.L398:
; src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_168->type
	jne	.L400	;,
; src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	(%rbx), %rdi	; token_168->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp615
	jne	.L393	;,
	jmp	.L400	;
.L575:
; src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	(%rbx), %rdi	; token_164->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp616
	je	.L401	;,
; src/parser.c:146:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_185->type
; src/parser.c:146:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp617, token
; src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L402	;,
.L403:
; src/parser.c:148:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:148:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC65(%rip), %rdi	;, tmp481
; src/parser.c:148:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp618, _191
	jmp	.L567	;
.L402:
; src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_185->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp619
	je	.L403	;,
; src/parser.c:152:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:153:     parser->in_function = true;
	movb	$1, 8(%r14)	;, parser_74(D)->in_function
; src/parser.c:152:     list(Statement*) body = create_list();
	movq	%rax, 32(%rsp)	; tmp620, %sfp
.L566:
; src/parser.c:165:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_197->type
; src/parser.c:165:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp625, token
; src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	je	.L576	;,
.L409:
; src/parser.c:157:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%r14, %rdx	; parser,
	call	parse_statement	;
	movq	%rax, %r13	; tmp622, statement
; src/parser.c:158:         if (statement == NULL)
	testq	%rax, %rax	; statement
	jne	.L405	;,
; src/parser.c:159:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:159:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC66(%rip), %rdi	;, tmp483
; src/parser.c:159:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp623, _196
; src/parser.c:159:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L408	;
.L405:
; src/parser.c:160:         else if (have_return)
	testb	%r12b, %r12b	; have_return
	je	.L407	;,
; src/parser.c:161:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:161:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC67(%rip), %rdi	;,
; src/parser.c:161:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp624, _200
; src/parser.c:161:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L407:
; src/parser.c:163:             have_return = true;
	cmpl	$5, 8(%r13)	;, statement_194->type
	movb	$1, %al	;, tmp551
	cmove	%eax, %r12d	; have_return,, tmp551, have_return
.L408:
; src/parser.c:164:         list_append(body, (pointer)statement);
	movq	32(%rsp), %rdi	; %sfp,
	movq	%r13, %rsi	; statement,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L566	;
.L576:
; src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_197->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp626
	je	.L409	;,
; src/parser.c:167:     parser->in_function = false;
	movb	$0, 8(%r14)	;, parser_74(D)->in_function
; src/parser.c:168:     if (!have_return && return_type != name_void)
	testb	%r12b, %r12b	; have_return
	jne	.L411	;,
; src/parser.c:168:     if (!have_return && return_type != name_void)
	cmpq	name_void(%rip), %rbp	; name_void, return_type
	jne	.L412	;,
.L413:
; src/parser.c:171:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	xorl	%esi, %esi	;
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
; src/parser.c:171:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	32(%rsp), %rdi	; %sfp,
; src/parser.c:171:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	%rax, %rsi	; tmp627, _213
; src/parser.c:171:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L411	;
.L412:
; src/parser.c:169:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:169:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC68(%rip), %rdi	;, tmp486
; src/parser.c:169:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp628, _210
; src/parser.c:169:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:170:     if (!have_return && return_type == name_void)
	cmpq	name_void(%rip), %rbp	; name_void, return_type
	je	.L413	;,
.L411:
; src/parser.c:173:     return create_function_use_ptr(function, name, return_type, parameters, body, function_scope);
	movq	%rbp, %rdx	; return_type,
	movq	8(%rsp), %r9	; %sfp,
	movq	32(%rsp), %r8	; %sfp,
	movq	40(%rsp), %rcx	; %sfp,
	movq	56(%rsp), %rsi	; %sfp,
	movq	16(%rsp), %rdi	; %sfp,
	call	*create_function_use_ptr@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp629, _214
; src/parser.c:45:             if (function == NULL)
	testq	%rax, %rax	; _214
	jne	.L415	;,
.L387:
; src/parser.c:46:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:46:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	%r15, %rsi	; token,
	leaq	.LC69(%rip), %rdi	;, tmp487
; src/parser.c:46:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp630, _28
; src/parser.c:46:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	xorl	%edx, %edx	; _214
.L415:
; src/parser.c:47:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$1, %edi	;,
	jmp	.L574	;
.L384:
; src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	cmpl	$6, 24(%r15)	;, token_41->type
	jne	.L416	;,
; src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	CLASS_KEYWORD(%rip), %rsi	; CLASS_KEYWORD,
	movq	(%r15), %rdi	; token_41->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	testb	%al, %al	; tmp632
	je	.L416	;,
; src/parser.c:264:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	24(%rsp), %rdi	; %sfp,
	call	*create_symbol_table@GOTPCREL(%rip)	;
; src/parser.c:265:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:264:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	%rax, 16(%rsp)	; tmp633, %sfp
; src/parser.c:265:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:266:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_219->type
; src/parser.c:265:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp634, token
; src/parser.c:266:     if (token->type != IDENTIFIER) {
	je	.L417	;,
; src/parser.c:267:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:267:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC70(%rip), %rdi	;, tmp489
; src/parser.c:267:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp635, _222
	jmp	.L573	;
.L417:
; src/parser.c:271:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/parser.c:272:     class->class_scope = class_scope;
	movq	16(%rsp), %rcx	; %sfp, class_scope
; src/parser.c:273:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	movq	(%rbx), %rdi	; token_219->lexeme,
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
; src/parser.c:271:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movq	%rax, 64(%rsp)	; tmp636, %sfp
; src/parser.c:272:     class->class_scope = class_scope;
	movq	%rcx, 16(%rax)	; class_scope, class_223->class_scope
; src/parser.c:273:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	movq	%rax, %rcx	; class,
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:274:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:273:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	movq	%rax, 8(%rsp)	; tmp637, %sfp
; src/parser.c:274:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_226->type
; src/parser.c:274:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp638, token
; src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L419	;,
.L420:
; src/parser.c:276:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:276:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC71(%rip), %rdi	;, tmp490
; src/parser.c:276:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp639, _232
.L573:
; src/parser.c:276:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L418	;
.L419:
; src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_226->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp640
	je	.L420	;,
; src/parser.c:280:     list(ClassMember*) members = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:281:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:280:     list(ClassMember*) members = create_list();
	movq	%rax, 32(%rsp)	; tmp641, %sfp
; src/parser.c:281:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp642, token
; src/parser.c:282:     size_t size = 0;
	xorl	%eax, %eax	;
	movq	%rax, 56(%rsp)	;, %sfp
.L421:
; src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_235->type
	je	.L577	;,
.L473:
; src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, 24(%rbx)	;, token_235->type
	jne	.L422	;,
; src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	METHOD_KEYWORD(%rip), %rsi	; METHOD_KEYWORD,
	movq	(%rbx), %rdi	; token_235->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	testb	%al, %al	; tmp643
	je	.L423	;,
; src/parser.c:178:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	16(%rsp), %rdi	; %sfp,
	call	*create_symbol_table@GOTPCREL(%rip)	;
; src/parser.c:179:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	8(%rsp), %rdx	; %sfp,
	movl	$3, %esi	;,
	movq	SELF_KEYWORD(%rip), %rdi	; SELF_KEYWORD,
	movq	%rax, %rcx	; tmp644,
; src/parser.c:178:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	%rax, 40(%rsp)	; tmp644, %sfp
; src/parser.c:179:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:180:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:179:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	%rax, %r13	; tmp645, self
; src/parser.c:180:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp646, token
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	; token_375->type, _376
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	;, _376
	je	.L424	;,
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	;, _376
	je	.L425	;,
.L427:
; src/parser.c:182:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:182:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC72(%rip), %rdi	;, tmp494
; src/parser.c:182:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp647, _380
	jmp	.L569	;
.L425:
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	0(%rbp), %rdi	; token_375->lexeme,
	call	*is_builtin_type@GOTPCREL(%rip)	;
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	; tmp648
	je	.L427	;,
.L424:
; src/parser.c:186:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	0(%rbp), %rsi	; token_375->lexeme,
	movq	16(%rsp), %rdi	; %sfp,
	call	*search_name@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp649, return_type
; src/parser.c:187:     if (return_type == NULL) {
	testq	%rax, %rax	; return_type
	jne	.L428	;,
; src/parser.c:188:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:188:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC73(%rip), %rdi	;, tmp495
; src/parser.c:188:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp650, _384
	jmp	.L569	;
.L428:
; src/parser.c:192:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:193:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_385->type
; src/parser.c:192:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp651, token
; src/parser.c:193:     if (token->type != IDENTIFIER) {
	je	.L429	;,
; src/parser.c:194:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:194:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC74(%rip), %rdi	;, tmp496
; src/parser.c:194:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp652, _388
.L569:
; src/parser.c:194:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L426	;
.L429:
; src/parser.c:198:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/parser.c:199:     method->method_scope = method_scope;
	movq	40(%rsp), %rcx	; %sfp, method_scope
; src/parser.c:200:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	0(%rbp), %rsi	; token_385->lexeme,
; src/parser.c:198:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movq	%rax, 72(%rsp)	; tmp653, %sfp
; src/parser.c:199:     method->method_scope = method_scope;
	movq	%rcx, 32(%rax)	; method_scope, method_389->method_scope
; src/parser.c:200:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	8(%rsp), %rax	; %sfp, name
	movq	8(%rax), %rdi	; name_225->name, name_225->name
	call	*make_method_name@GOTPCREL(%rip)	;
; src/parser.c:200:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	72(%rsp), %rcx	; %sfp,
	movq	%r12, %rdx	; return_type,
	movl	$2, %esi	;,
; src/parser.c:200:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	%rax, %rdi	; tmp654, _392
; src/parser.c:200:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:201:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:200:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	%rax, 104(%rsp)	; tmp655, %sfp
; src/parser.c:201:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_394->type
; src/parser.c:201:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp656, token
; src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L430	;,
.L431:
; src/parser.c:203:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:203:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC75(%rip), %rdi	;, tmp498
; src/parser.c:203:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp657, _400
	jmp	.L569	;
.L430:
; src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_394->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp658
	je	.L431	;,
; src/parser.c:207:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	cmpl	$6, 24(%rax)	;, token_401->type
; src/parser.c:207:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp659, token
; src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	je	.L432	;,
.L434:
; src/parser.c:209:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:209:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC76(%rip), %rdi	;, tmp500
; src/parser.c:209:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp660, _407
; src/parser.c:209:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L433	;
.L432:
; src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	movq	(%rax), %rdi	; token_401->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	testb	%al, %al	; tmp661
	je	.L434	;,
.L433:
; src/parser.c:210:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp662, token
; src/parser.c:211:     list(Variable*) parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:212:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	%r13, %rsi	; self,
	movq	8(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
; src/parser.c:211:     list(Variable*) parameters = create_list();
	movq	%rax, 80(%rsp)	; tmp663, %sfp
; src/parser.c:225:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	leaq	.LC79(%rip), %r13	;, tmp561
; src/parser.c:212:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	call	*create_variable@GOTPCREL(%rip)	;
; src/parser.c:212:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	80(%rsp), %rdi	; %sfp,
; src/parser.c:212:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	%rax, %rsi	; tmp664, _410
; src/parser.c:212:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	call	*list_append@GOTPCREL(%rip)	;
.L435:
; src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_411->type
	je	.L578	;,
.L441:
; src/parser.c:218:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:218:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC77(%rip), %rdi	;, tmp503
; src/parser.c:218:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp668, _424
	jmp	.L569	;
.L578:
; src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	0(%rbp), %rdi	; token_411->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp674
	jne	.L447	;,
; src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_411->type
	jne	.L441	;,
; src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	movq	0(%rbp), %rdi	; token_411->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	; tmp665
	je	.L437	;,
; src/parser.c:215:             token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:221:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	40(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%r14, %rdx	; parser,
; src/parser.c:215:             token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp666, token
; src/parser.c:221:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	call	parse_variable	;
	movq	%rax, %rsi	; tmp667, parameter
; src/parser.c:222:         if (parameter == NULL)
	testq	%rax, %rax	; parameter
	jne	.L561	;,
; src/parser.c:223:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:223:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC78(%rip), %rdi	;, tmp505
; src/parser.c:223:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp671, _426
	jmp	.L568	;
.L437:
; src/parser.c:216:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, 24(%rbp)	;, token_411->type
	jne	.L441	;,
; src/parser.c:216:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	0(%rbp), %rdi	; token_411->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:216:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	testb	%al, %al	; tmp669
	je	.L441	;,
.L447:
; src/parser.c:230:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_435->type
; src/parser.c:230:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp670, token
; src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L562	;,
	jmp	.L442	;
.L561:
; src/parser.c:224:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	;, parameter_417->value
	je	.L445	;,
; src/parser.c:225:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:225:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	movq	%r13, %rdi	; tmp561,
; src/parser.c:225:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp672, _429
.L568:
; src/parser.c:225:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L444	;
.L445:
; src/parser.c:227:             list_append(parameters, (pointer)parameter);
	movq	80(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
.L444:
; src/parser.c:228:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp673, token
	jmp	.L435	;
.L442:
; src/parser.c:232:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:232:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC80(%rip), %rdi	;, tmp508
; src/parser.c:232:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp675, _441
	jmp	.L569	;
.L562:
; src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_435->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp676
	je	.L442	;,
; src/parser.c:236:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:237:     parser->in_function = true;
	movw	$257, 8(%r14)	;, MEM <unsigned short> [(char *)parser_74(D) + 8B]
; src/parser.c:240:     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
; src/parser.c:239:     bool have_return = false;
	xorl	%r13d, %r13d	; have_return
; src/parser.c:236:     list(Statement*) body = create_list();
	movq	%rax, 88(%rsp)	; tmp677, %sfp
; src/parser.c:240:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp678, token
.L448:
; src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_447->type
	je	.L579	;,
.L453:
; src/parser.c:242:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	40(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	%r14, %rdx	; parser,
	call	parse_statement	;
	movq	%rax, 96(%rsp)	; tmp679, %sfp
; src/parser.c:243:         if (statement == NULL)
	testq	%rax, %rax	;
	jne	.L449	;,
; src/parser.c:244:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:244:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC81(%rip), %rdi	;, tmp510
; src/parser.c:244:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp680, _446
; src/parser.c:244:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L452	;
.L449:
; src/parser.c:245:         else if (have_return)
	testb	%r13b, %r13b	; have_return
	je	.L451	;,
; src/parser.c:246:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:246:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC67(%rip), %rdi	;,
; src/parser.c:246:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp681, _450
; src/parser.c:246:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L451:
; src/parser.c:248:             have_return = true;
	movq	96(%rsp), %rax	; %sfp, statement
	cmpl	$5, 8(%rax)	;, statement_444->type
	movb	$1, %al	;, tmp555
	cmove	%eax, %r13d	; have_return,, tmp555, have_return
.L452:
; src/parser.c:249:         list_append(body, (pointer)statement);
	movq	96(%rsp), %rsi	; %sfp,
	movq	88(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:250:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp682, token
	jmp	.L448	;
.L579:
; src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	movq	0(%rbp), %rdi	; token_447->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp683
	je	.L453	;,
; src/parser.c:252:     parser->in_function = false;
	movw	$0, 8(%r14)	;, MEM <unsigned short> [(char *)parser_74(D) + 8B]
; src/parser.c:254:     if (!have_return && return_type != name_void)
	testb	%r13b, %r13b	; have_return
	jne	.L455	;,
; src/parser.c:254:     if (!have_return && return_type != name_void)
	cmpq	name_void(%rip), %r12	; name_void, return_type
	jne	.L456	;,
.L457:
; src/parser.c:257:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	xorl	%esi, %esi	;
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
; src/parser.c:257:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	88(%rsp), %rdi	; %sfp,
; src/parser.c:257:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	%rax, %rsi	; tmp684, _463
; src/parser.c:257:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L455	;
.L456:
; src/parser.c:255:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:255:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC82(%rip), %rdi	;, tmp513
; src/parser.c:255:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp685, _460
; src/parser.c:255:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:256:     if (!have_return && return_type == name_void)
	cmpq	name_void(%rip), %r12	; name_void, return_type
	je	.L457	;,
.L455:
; src/parser.c:259:     return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
	movq	104(%rsp), %rsi	; %sfp,
	movq	40(%rsp), %r9	; %sfp,
	movq	%r12, %rdx	; return_type,
	movq	88(%rsp), %r8	; %sfp,
	movq	80(%rsp), %rcx	; %sfp,
	movq	72(%rsp), %rdi	; %sfp,
	call	*create_method_use_ptr@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp686, _464
; src/parser.c:286:             if (method == NULL)
	testq	%rax, %rax	; _464
	jne	.L459	;,
.L426:
; src/parser.c:287:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:287:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC83(%rip), %rdi	;, tmp514
; src/parser.c:287:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp687, _242
; src/parser.c:287:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	xorl	%esi, %esi	; _464
.L459:
; src/parser.c:288:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%edi, %edi	;
	xorl	%edx, %edx	;
	call	*create_class_member@GOTPCREL(%rip)	;
; src/parser.c:288:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	32(%rsp), %rdi	; %sfp,
; src/parser.c:288:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rsi	; tmp688, _243
; src/parser.c:288:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	jmp	.L470	;
.L423:
; src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	cmpl	$6, 24(%rbx)	;, token_235->type
	jne	.L422	;,
; src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	VAR_KEYWORD(%rip), %rsi	; VAR_KEYWORD,
	movq	(%rbx), %rdi	; token_235->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	; tmp689
	je	.L422	;,
; src/parser.c:290:             token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:291:             parser->in_class = true;
	movb	$1, 10(%r14)	;, parser_74(D)->in_class
; src/parser.c:292:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r14, %rdx	; parser,
	movq	(%rsp), %rdi	; %sfp,
; src/parser.c:290:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp690, token
; src/parser.c:292:             Variable* variable = parse_variable(lexer, class_scope, parser);
	call	parse_variable	;
; src/parser.c:293:             parser->in_class = false;
	movb	$0, 10(%r14)	;, parser_74(D)->in_class
; src/parser.c:292:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	%rax, %rbp	; tmp691, variable
; src/parser.c:294:             if (variable == NULL)
	testq	%rax, %rax	; variable
	jne	.L461	;,
; src/parser.c:295:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:295:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC84(%rip), %rdi	;, tmp516
; src/parser.c:295:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp692, _251
; src/parser.c:295:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L461:
; src/parser.c:296:             ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
	movq	%rbp, %rdx	; variable,
	xorl	%esi, %esi	;
	movl	$1, %edi	;,
	call	*create_class_member@GOTPCREL(%rip)	;
; src/parser.c:297:             list_append(members, (pointer)member);
	movq	32(%rsp), %rdi	; %sfp,
; src/parser.c:296:             ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
	movq	%rax, %rbp	; tmp693, member
; src/parser.c:297:             list_append(members, (pointer)member);
	movq	%rax, %rsi	; member,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:298:             if (member->type == CLASS_VARIABLE) {
	cmpl	$1, 8(%rbp)	;, member_252->type
	jne	.L465	;,
; src/parser.c:299:                 Symbol* type = member->content.variable->type;
	movq	0(%rbp), %rax	; member_252->content.variable, member_252->content.variable
	movq	(%rax), %rax	; _254->type, type
; src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	name_int(%rip), %rax	; name_int, type
	je	.L570	;,
; src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	name_float(%rip), %rax	; name_float, type
	je	.L570	;,
; src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	name_string(%rip), %rax	; name_string, type
	je	.L570	;,
; src/parser.c:302:                 else if (type == name_bool || type == name_void)
	cmpq	name_bool(%rip), %rax	; name_bool, type
	je	.L466	;,
; src/parser.c:302:                 else if (type == name_bool || type == name_void)
	cmpq	name_void(%rip), %rax	; name_void, type
	jne	.L467	;,
.L466:
; src/parser.c:303:                     size += 1;
	incq	56(%rsp)	; %sfp
	jmp	.L465	;
.L467:
; src/parser.c:304:                 else if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rax)	;, type_255->kind
	jne	.L468	;,
.L570:
; src/parser.c:305:                     size += 8;  // pointer to object
	addq	$8, 56(%rsp)	;, %sfp
	jmp	.L465	;
.L468:
; src/parser.c:307:                     parser_error("Unsupported type for class variable", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:307:                     parser_error("Unsupported type for class variable", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC85(%rip), %rdi	;, tmp518
; src/parser.c:307:                     parser_error("Unsupported type for class variable", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp694, _267
; src/parser.c:307:                     parser_error("Unsupported type for class variable", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L465:
; src/parser.c:309:             token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	;, token_268->type
; src/parser.c:309:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp695, token
; src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	je	.L469	;,
.L471:
; src/parser.c:311:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:311:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC86(%rip), %rdi	;, tmp519
; src/parser.c:311:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp696, _274
	jmp	.L571	;
.L469:
; src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	movq	(%rax), %rdi	; token_268->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; tmp697
	je	.L471	;,
	jmp	.L470	;
.L422:
; src/parser.c:313:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:313:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC87(%rip), %rdi	;,
; src/parser.c:313:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp698, _276
.L571:
; src/parser.c:313:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L470:
; src/parser.c:314:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp699, token
	jmp	.L421	;
.L577:
; src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	movq	(%rbx), %rdi	; token_235->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp700
	je	.L473	;,
; src/parser.c:316:     string init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
	movq	8(%rsp), %rax	; %sfp, name
	movq	DEFAULT_INIT_NAME(%rip), %rsi	; DEFAULT_INIT_NAME,
	movq	8(%rax), %rdi	; name_225->name, name_225->name
	call	*make_method_name@GOTPCREL(%rip)	;
; src/parser.c:317:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	movq	16(%rsp), %rdi	; %sfp,
; src/parser.c:316:     string init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
	movq	%rax, %r13	; tmp701, init_name
; src/parser.c:317:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	movq	%rax, %rsi	; init_name,
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp702, init
; src/parser.c:318:     if (init == NULL) {
	testq	%rax, %rax	; init
	jne	.L474	;,
; src/parser.c:319:         Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/parser.c:320:         method->method_scope = create_symbol_table(class_scope);
	movq	16(%rsp), %rdi	; %sfp,
; src/parser.c:319:         Method* method = (Method*)alloc_memory(sizeof(Method));
	movq	%rax, %r12	; tmp703, method
; src/parser.c:320:         method->method_scope = create_symbol_table(class_scope);
	call	*create_symbol_table@GOTPCREL(%rip)	;
; src/parser.c:321:         init = create_symbol(init_name, SYMBOL_METHOD, name, method);
	movq	%r13, %rdi	; init_name,
	movq	8(%rsp), %rdx	; %sfp,
	movq	%r12, %rcx	; method,
	movl	$2, %esi	;,
; src/parser.c:320:         method->method_scope = create_symbol_table(class_scope);
	movq	%rax, 32(%r12)	; tmp704, method_286->method_scope
; src/parser.c:321:         init = create_symbol(init_name, SYMBOL_METHOD, name, method);
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp705, init
; src/parser.c:322:         list(Variable*) parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:323:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	32(%r12), %rcx	; method_286->method_scope, method_286->method_scope
	movq	8(%rsp), %rdx	; %sfp,
	movl	$3, %esi	;,
	movq	SELF_KEYWORD(%rip), %rdi	; SELF_KEYWORD,
; src/parser.c:322:         list(Variable*) parameters = create_list();
	movq	%rax, 40(%rsp)	; tmp706, %sfp
; src/parser.c:323:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:324:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	xorl	%edx, %edx	;
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rax, %rsi	; tmp707,
; src/parser.c:323:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	%rax, 72(%rsp)	; tmp707, %sfp
; src/parser.c:324:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	call	*create_variable@GOTPCREL(%rip)	;
; src/parser.c:324:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	40(%rsp), %rdi	; %sfp,
; src/parser.c:324:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	%rax, %rsi	; tmp708, _293
; src/parser.c:324:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:325:         list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	72(%rsp), %rdx	; %sfp,
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
; src/parser.c:325:         list(Statement*) body = create_list();
	movq	%rax, %r13	; tmp709, body
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %r8	;, tmp710
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %rdx	; tmp711, _296
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	*create_expression@GOTPCREL(%rip)	;
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r9d, %r9d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %r8	;, tmp712
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%esi, %esi	;
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%r13, %rdi	; body,
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %rsi	; tmp713, _298
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:327:         create_method_use_ptr(method, init, name, parameters, body, method->method_scope);
	movq	32(%r12), %r9	; method_286->method_scope,
	movq	%r13, %r8	; body,
	movq	%rbp, %rsi	; init,
	movq	40(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rdx	; %sfp,
	movq	%r12, %rdi	; method,
	call	*create_method_use_ptr@GOTPCREL(%rip)	;
; src/parser.c:328:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%r12, %rsi	; method,
	xorl	%edi, %edi	;
	xorl	%edx, %edx	;
	call	*create_class_member@GOTPCREL(%rip)	;
; src/parser.c:328:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	32(%rsp), %rdi	; %sfp,
; src/parser.c:328:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rsi	; tmp714, _300
; src/parser.c:328:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	*list_append@GOTPCREL(%rip)	;
.L474:
; src/parser.c:330:     if (init->kind != SYMBOL_METHOD)
	cmpl	$2, 32(%rbp)	;, init_301->kind
	je	.L475	;,
; src/parser.c:331:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:331:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC88(%rip), %rdi	;, tmp528
; src/parser.c:331:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp715, _304
; src/parser.c:331:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L475:
; src/parser.c:332:     string constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	8(%rsp), %rax	; %sfp, name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
	movq	8(%rax), %rdi	; name_225->name, name_225->name
	call	*make_method_name@GOTPCREL(%rip)	;
; src/parser.c:333:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %edi	;,
; src/parser.c:332:     string constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	%rax, %r12	; tmp716, constructor_name
; src/parser.c:333:     Method* method = (Method*)alloc_memory(sizeof(Method));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/parser.c:334:     method->method_scope = create_symbol_table(class_scope);
	movq	16(%rsp), %rdi	; %sfp,
; src/parser.c:333:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movq	%rax, %rbx	; tmp717, method
; src/parser.c:334:     method->method_scope = create_symbol_table(class_scope);
	call	*create_symbol_table@GOTPCREL(%rip)	;
; src/parser.c:335:     Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
	movq	%r12, %rdi	; constructor_name,
	movq	8(%rsp), %rdx	; %sfp,
	movq	%rbx, %rcx	; method,
	movl	$2, %esi	;,
; src/parser.c:334:     method->method_scope = create_symbol_table(class_scope);
	movq	%rax, 32(%rbx)	; tmp718, method_309->method_scope
; src/parser.c:335:     Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, 88(%rsp)	; tmp719, %sfp
; src/parser.c:336:     list(Variable*) parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:337:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	32(%rbx), %rcx	; method_309->method_scope, method_309->method_scope
	movq	8(%rsp), %rdx	; %sfp,
	movl	$3, %esi	;,
	movq	SELF_KEYWORD(%rip), %rdi	; SELF_KEYWORD,
; src/parser.c:336:     list(Variable*) parameters = create_list();
	movq	%rax, 72(%rsp)	; tmp720, %sfp
; src/parser.c:337:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, 80(%rsp)	; tmp721, %sfp
; src/parser.c:338:     list(Variable*) init_params = list_copy(init->ast_node.method->parameters);
	movq	24(%rbp), %rax	; init_301->ast_node.method, init_301->ast_node.method
	movq	16(%rax), %rdi	; _316->parameters, _316->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp722, init_params
.L477:
; src/parser.c:340:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	movq	%r12, %rdi	; init_params,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp725, param
; src/parser.c:340:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	testq	%rax, %rax	; param
	je	.L580	;,
; src/parser.c:341:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	movq	8(%r13), %rax	; param_320->name, param_320->name
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	movq	8(%rax), %rdi	; _321->name, _321->name
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:341:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	testb	%al, %al	; tmp723
	jne	.L477	;,
; src/parser.c:342:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	8(%r13), %rsi	; param_320->name, param_320->name
	movq	0(%r13), %rdi	; param_320->type,
	xorl	%edx, %edx	;
	call	*create_variable@GOTPCREL(%rip)	;
; src/parser.c:342:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	72(%rsp), %rdi	; %sfp,
; src/parser.c:342:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	%rax, %rsi	; tmp724, _326
; src/parser.c:342:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L477	;
.L580:
; src/parser.c:344:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:345:     list(ClassMember*) ms = list_copy(members);
	movq	32(%rsp), %rdi	; %sfp,
; src/parser.c:344:     list(Statement*) body = create_list();
	movq	%rax, 40(%rsp)	; tmp726, %sfp
; src/parser.c:345:     list(ClassMember*) ms = list_copy(members);
	call	*list_copy@GOTPCREL(%rip)	;
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	80(%rsp), %rdx	; %sfp,
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
; src/parser.c:345:     list(ClassMember*) ms = list_copy(members);
	movq	%rax, 96(%rsp)	; tmp727, %sfp
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$8, %edi	;,
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %r8	;, tmp728
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %rdx	; tmp729, _330
.L572:
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	call	*create_expression@GOTPCREL(%rip)	;
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	xorl	%r9d, %r9d	;
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	%rax, %r8	;, tmp739
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	call	*create_statement@GOTPCREL(%rip)	;
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	40(%rsp), %rdi	; %sfp,
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	%rax, %rsi	; tmp740, _349
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	call	*list_append@GOTPCREL(%rip)	;
.L480:
; src/parser.c:348:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	movq	96(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp741, mb
; src/parser.c:348:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	testq	%rax, %rax	; mb
	je	.L581	;,
; src/parser.c:349:         if (mb->type == CLASS_VARIABLE) {
	cmpl	$1, 8(%r13)	;, mb_333->type
	jne	.L480	;,
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	0(%r13), %rax	; mb_333->content.variable, mb_333->content.variable
	movq	80(%rsp), %rdx	; %sfp,
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	movq	8(%rax), %r12	; _336->name, _337
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	movl	$2, %edi	;,
	movq	%r12, %rdx	; _337,
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	%rax, %rsi	; tmp732, _338
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	%rax, %r8	;, tmp733
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	%rax, %rdx	; tmp734, _340
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp735, left
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	0(%r13), %rax	; mb_333->content.variable, mb_333->content.variable
	movq	16(%rax), %rcx	; _342->value, _343
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	testq	%rcx, %rcx	; _343
	jne	.L481	;,
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movl	$2, %esi	;,
	leaq	.LC89(%rip), %rdi	;, tmp541
	call	*create_string@GOTPCREL(%rip)	;
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	%rax, %rsi	; tmp736, _344
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	xorl	%edi, %edi	;
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	%rax, %rdx	; tmp737, _345
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, %rcx	; tmp738, _343
.L481:
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	xorl	%edx, %edx	;
	movq	%r12, %rsi	; left,
	movl	$13, %edi	;,
	jmp	.L572	;
.L581:
; src/parser.c:355:     list(Expression*) args = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	80(%rsp), %rdx	; %sfp,
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
; src/parser.c:355:     list(Expression*) args = create_list();
	movq	%rax, %r12	; tmp742, args
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	%rax, %r8	;, tmp743
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	%rax, %rdx	; tmp744, _352
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	call	*create_expression@GOTPCREL(%rip)	;
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	%r12, %rdi	; args,
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	%rax, %rsi	; tmp745, _353
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:357:     list(Variable*) params = list_copy(parameters);
	movq	72(%rsp), %rdi	; %sfp,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp746, params
.L483:
; src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	movq	%r13, %rdi	; params,
	call	*list_pop@GOTPCREL(%rip)	;
; src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	testq	%rax, %rax	; param
	je	.L582	;,
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	movq	8(%rax), %rdx	; param_355->name, param_355->name
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rax, %r8	;, tmp747
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	xorl	%esi, %esi	;
	xorl	%ecx, %ecx	;
	movl	$19, %edi	;,
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rax, %rdx	; tmp748, _358
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	call	*create_expression@GOTPCREL(%rip)	;
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%r12, %rdi	; args,
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rax, %rsi	; tmp749, _359
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L483	;
.L582:
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	movq	%rbp, %rdx	; init,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%r12, %r8	; args,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %rsi	; tmp751, _360
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movl	$1, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %r8	;, tmp752
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %rdx	; tmp753, _362
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	call	*create_expression@GOTPCREL(%rip)	;
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%r9d, %r9d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %r8	;, tmp754
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%esi, %esi	;
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	40(%rsp), %rdi	; %sfp,
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %rsi	; tmp755, _364
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:361:     create_method_use_ptr(method, constructor, name, parameters, body, method->method_scope);
	movq	32(%rbx), %r9	; method_309->method_scope,
	movq	40(%rsp), %r8	; %sfp,
	movq	%rbx, %rdi	; method,
	movq	72(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rdx	; %sfp,
	movq	88(%rsp), %rsi	; %sfp,
	call	*create_method_use_ptr@GOTPCREL(%rip)	;
; src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%edx, %edx	;
	movq	%rbx, %rsi	; method,
	xorl	%edi, %edi	;
	call	*create_class_member@GOTPCREL(%rip)	;
; src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	32(%rsp), %rdi	; %sfp,
; src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rsi	; tmp756, _366
; src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:364:     return create_class_use_ptr(class, name, members, class_scope, size);
	movq	16(%rsp), %rcx	; %sfp,
	movq	56(%rsp), %r8	; %sfp,
	movq	32(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	64(%rsp), %rdi	; %sfp,
	call	*create_class_use_ptr@GOTPCREL(%rip)	;
	movq	%rax, %rcx	; tmp757, _368
; src/parser.c:50:             if (class == NULL)
	testq	%rax, %rax	; _368
	jne	.L485	;,
.L418:
; src/parser.c:51:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:51:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	%r15, %rsi	; token,
	leaq	.LC90(%rip), %rdi	;, tmp544
; src/parser.c:51:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp758, _35
; src/parser.c:51:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	xorl	%ecx, %ecx	; _368
.L485:
; src/parser.c:52:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$2, %edi	;,
.L574:
	call	*create_code_member@GOTPCREL(%rip)	;
; src/parser.c:52:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	48(%rsp), %rdi	; %sfp,
; src/parser.c:52:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	%rax, %rsi	; tmp759, _36
; src/parser.c:52:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	jmp	.L383	;
.L486:
; src/parser.c:58:     return create_code(members, global_scope);
	movq	24(%rsp), %rsi	; %sfp,
	movq	48(%rsp), %rdi	; %sfp,
; src/parser.c:59: }
	addq	$120, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/parser.c:58:     return create_code(members, global_scope);
	jmp	*create_code@GOTPCREL(%rip)	;
.L416:
; src/parser.c:54:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	(%r14), %rdi	; parser_74(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:54:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	%r15, %rsi	; token,
	leaq	.LC91(%rip), %rdi	;,
; src/parser.c:54:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp761, _38
; src/parser.c:54:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L383	;
	.size	parse_code, .-parse_code
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
