	.file	"parser.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Failed to parse right operand"
	.text
	.p2align 4
	.type	parse_expr_prec, @function
parse_expr_prec:
	pushq	%r15	;
	movq	%r8, %r15	; tmp128, parser
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp124, lexer
	subq	$40, %rsp	;,
; src/parser.c:647: static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, SymbolTable* now_scope, Parser* parser) {
	movq	%rsi, 8(%rsp)	; tmp125, %sfp
; src/parser.c:650:     token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
; src/parser.c:647: static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, SymbolTable* now_scope, Parser* parser) {
	movl	%edx, 28(%rsp)	; tmp126, %sfp
	movq	%rcx, 16(%rsp)	; tmp127, %sfp
; src/parser.c:650:     token = peek_next_token(lexer, true);
	call	*peek_next_token@GOTPCREL(%rip)	;
; src/parser.c:651:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;,
	jne	.L11	;,
.L9:
; src/parser.c:652:         OperatorType op = string_to_operator(token->lexeme);
	movq	(%rax), %rdi	; token_70->lexeme, token_70->lexeme
	call	*string_to_operator@GOTPCREL(%rip)	;
	movl	%eax, %r12d	; tmp130, op
; src/parser.c:653:         int op_prec = operator_precedence(op);
	movl	%eax, %edi	; op,
	call	*operator_precedence@GOTPCREL(%rip)	;
	movl	%eax, %ebp	; tmp131, op_prec
; src/parser.c:654:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, %r12d	;, op
	je	.L11	;,
	movl	28(%rsp), %eax	; %sfp, min_prec
	cmpl	%eax, %ebp	; min_prec, op_prec
	jl	.L11	;,
; src/parser.c:656:         token = get_next_token(lexer, true);  // consume operator
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:657:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r15, %rdx	; parser,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:657:         token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp132, token
; src/parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
	movq	%rax, %rdx	; tmp133, right_primary
; src/parser.c:659:         if (right_primary == NULL) {
	testq	%rax, %rax	; right_primary
	je	.L17	;,
; src/parser.c:664:         Expression* right = create_expression(OP_NONE, NULL, right_primary, NULL);
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp135, right
.L15:
; src/parser.c:665:         token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*peek_next_token@GOTPCREL(%rip)	;
; src/parser.c:666:         while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;,
	jne	.L5	;,
; src/parser.c:667:             OperatorType next_op = string_to_operator(token->lexeme);
	movq	(%rax), %rdi	; token_69->lexeme, token_69->lexeme
	call	*string_to_operator@GOTPCREL(%rip)	;
	movl	%eax, %r14d	; tmp137, next_op
; src/parser.c:668:             int next_prec = operator_precedence(next_op);
	movl	%eax, %edi	; next_op,
	call	*operator_precedence@GOTPCREL(%rip)	;
; src/parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %r14d	;, next_op
	je	.L5	;,
	cmpl	%eax, %ebp	; next_prec, op_prec
	jge	.L5	;,
; src/parser.c:671:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	%r13, %rsi	; right,
	movq	%r15, %r8	; parser,
	movl	%eax, %edx	; next_prec,
	movq	%rbx, %rdi	; lexer,
	call	parse_expr_prec	;
	movq	%rax, %r13	; tmp139, right
; src/parser.c:672:             if (right == NULL) {
	testq	%rax, %rax	; right
	jne	.L15	;,
; src/parser.c:662:             return NULL;
	xorl	%r14d, %r14d	; <retval>
	jmp	.L1	;
	.p2align 4,,10
	.p2align 3
.L5:
; src/parser.c:678:         expr_left = create_expression(op, expr_left, NULL, right);
	xorl	%edx, %edx	;
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r13, %rcx	; right,
	movl	%r12d, %edi	; op,
	call	*create_expression@GOTPCREL(%rip)	;
; src/parser.c:679:         token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:678:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rax, 8(%rsp)	; tmp141, %sfp
; src/parser.c:679:         token = peek_next_token(lexer, true);
	call	*peek_next_token@GOTPCREL(%rip)	;
; src/parser.c:651:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;,
	je	.L9	;,
.L11:
	movq	8(%rsp), %r14	; %sfp, <retval>
; src/parser.c:681:     token = peek_current_token(lexer);
	movq	%rbx, %rdi	; lexer,
	call	*peek_current_token@GOTPCREL(%rip)	;
.L1:
; src/parser.c:684: }
	addq	$40, %rsp	;,
	movq	%r14, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L17:
; src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	(%r15), %rdi	; parser_38(D)->source_file, parser_38(D)->source_file
; src/parser.c:662:             return NULL;
	xorl	%r14d, %r14d	; <retval>
; src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%r13, %rsi	; token,
	leaq	.LC0(%rip), %rdi	;, tmp117
; src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp134, _6
; src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L1	;
	.size	parse_expr_prec, .-parse_expr_prec
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Failed to parse expression primary"
	.text
	.p2align 4
	.type	parse_expression, @function
parse_expression:
	pushq	%r12	;
	movq	%rsi, %r12	; tmp94, now_scope
	pushq	%rbp	;
	movq	%rdx, %rbp	; tmp95, parser
	pushq	%rbx	;
; src/parser.c:685: Expression* parse_expression(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
	movq	%rdi, %rbx	; tmp93, lexer
; src/parser.c:687:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
; src/parser.c:688:     if (left_primary == NULL) {
	testq	%rax, %rax	; <retval>
	je	.L22	;,
	movq	%rax, %rdx	; tmp96, <retval>
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
	movq	%rax, %rsi	; tmp99, _4
; src/parser.c:695: }
	popq	%rbx	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%edx, %edx	;
; src/parser.c:695: }
	popq	%rbp	;
	popq	%r12	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	jmp	parse_expr_prec	;
	.p2align 4,,10
	.p2align 3
.L22:
; src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_10(D)->source_file, parser_10(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rdi	; lexer,
; src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rbp	; tmp97, _2
; src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	*peek_current_token@GOTPCREL(%rip)	;
; src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbp, %rdx	; _2,
	leaq	.LC1(%rip), %rdi	;, tmp91
; src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rsi	; tmp98, _3
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
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"Expected a type for variable declaration"
	.section	.rodata.str1.1
.LC4:
	.string	"Unknown variable type"
.LC5:
	.string	"Expected variable name"
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"Failed to parse variable initializer"
	.text
	.p2align 4
	.type	parse_variable, @function
parse_variable:
	pushq	%r15	;
	pushq	%r14	;
	movq	%rsi, %r14	; tmp143, now_scope
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdx, %r12	; tmp144, parser
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp142, lexer
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/parser.c:369:     token = peek_current_token(lexer);
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp145, token
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	; token_39->type, _1
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	;, _1
	je	.L25	;,
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	;, _1
	jne	.L28	;,
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rbx), %rdi	; token_39->lexeme, token_39->lexeme
	call	*is_builtin_type@GOTPCREL(%rip)	;
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	; tmp147
	je	.L28	;,
.L25:
; src/parser.c:375:     Symbol* type = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rsi	; token_39->lexeme, token_39->lexeme
	movq	%r14, %rdi	; now_scope,
	call	*search_name@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp148, type
; src/parser.c:376:     if (type != NULL) {
	testq	%rax, %rax	; type
	je	.L29	;,
; src/parser.c:377:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	movl	32(%rax), %eax	; type_46->kind, _49
; src/parser.c:377:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	cmpl	$6, %eax	;, _49
	je	.L30	;,
	testl	%eax, %eax	; _49
	jne	.L56	;,
.L30:
; src/parser.c:381:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:382:     if (token->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	;, token_53->type
; src/parser.c:381:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp151, token
; src/parser.c:382:     if (token->type != IDENTIFIER)
	jne	.L57	;,
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	cmpb	$0, 10(%r12)	;, parser_41(D)->in_class
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movl	$3, %esi	;, iftmp.25_29
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	je	.L32	;,
.L58:
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	cmpb	$1, 9(%r12)	;, parser_41(D)->in_method
	sbbl	%esi, %esi	; iftmp.25_29
	andl	$2, %esi	;, iftmp.25_29
	addl	$3, %esi	;, iftmp.25_29
.L32:
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movq	(%rbx), %rdi	; token_53->lexeme, token_53->lexeme
	movq	%r14, %rcx	; now_scope,
	movq	%r13, %rdx	; type,
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:386:     token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movq	%rax, %rbx	; tmp153, name
; src/parser.c:386:     token = peek_next_token(lexer, true);
	call	*peek_next_token@GOTPCREL(%rip)	;
; src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_59->type
	je	.L33	;,
.L35:
; src/parser.c:385:     Expression* value = NULL;
	xorl	%ebp, %ebp	; value
.L34:
; src/parser.c:396: }
	addq	$8, %rsp	;,
; src/parser.c:395:     return create_variable(type, name, value);
	movq	%rbp, %rdx	; value,
	movq	%rbx, %rsi	; name,
	movq	%r13, %rdi	; type,
; src/parser.c:396: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/parser.c:395:     return create_variable(type, name, value);
	jmp	*create_variable@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L57:
; src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_41(D)->source_file, parser_41(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC5(%rip), %rdi	;, tmp133
; src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp152, _17
; src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	cmpb	$0, 10(%r12)	;, parser_41(D)->in_class
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movl	$3, %esi	;, iftmp.25_29
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	je	.L32	;,
	jmp	.L58	;
	.p2align 4,,10
	.p2align 3
.L28:
; src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_41(D)->source_file, parser_41(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC2(%rip), %rdi	;, tmp121
; src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp146, _6
; src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:396: }
	addq	$8, %rsp	;,
	xorl	%eax, %eax	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L56:
; src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_41(D)->source_file, parser_41(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC3(%rip), %rdi	;, tmp129
; src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp149, _12
; src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L30	;
	.p2align 4,,10
	.p2align 3
.L33:
; src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	movq	(%rax), %rdi	; token_59->lexeme, token_59->lexeme
	movq	ASSIGN_SYMBOL(%rip), %rsi	; ASSIGN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	; tmp155
	je	.L35	;,
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
	movq	%r12, %rdx	; parser,
	movq	%r14, %rsi	; now_scope,
; src/parser.c:389:         token = get_next_token(lexer, true);
	movq	%rax, %r15	; tmp156, token
; src/parser.c:390:         value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
	movq	%rax, %rbp	; tmp157, value
; src/parser.c:391:         if (value == NULL)
	testq	%rax, %rax	; value
	jne	.L34	;,
; src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_41(D)->source_file, parser_41(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	%r15, %rsi	; token,
	leaq	.LC6(%rip), %rdi	;, tmp138
; src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp158, _26
; src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L34	;
	.p2align 4,,10
	.p2align 3
.L29:
; src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_41(D)->source_file, parser_41(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC4(%rip), %rdi	;, tmp131
; src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp150, _14
; src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L30	;
	.size	parse_variable, .-parse_variable
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Failed to parse parenthesized expression"
	.section	.rodata.str1.1
.LC8:
	.string	"Expected ')' after expression"
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Failed to parse operand of unary '!'"
	.align 8
.LC10:
	.string	"Failed to parse operand of unary '-'"
	.align 8
.LC11:
	.string	"Expected variable name in variable access"
	.align 8
.LC12:
	.string	"Cannot call undefined variable"
	.align 8
.LC13:
	.string	"Cannot call non-function variable"
	.align 8
.LC14:
	.string	"Failed to parse function call argument"
	.align 8
.LC15:
	.string	"Expected ',' or ')' after function call argument"
	.align 8
.LC16:
	.string	"Failed to parse sequence index"
	.align 8
.LC17:
	.string	"Expected ']' after sequence index"
	.align 8
.LC18:
	.string	"Cannot access attribute without a valid scope"
	.align 8
.LC19:
	.string	"Expected attribute name after '.'"
	.section	.rodata.str1.1
.LC20:
	.string	"Unknown attribute name"
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"Failed to parse variable access"
	.align 8
.LC22:
	.string	"Unexpected token in primary expression"
	.text
	.p2align 4
	.type	parse_primary, @function
parse_primary:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	movq	%rsi, %r13	; tmp294, now_scope
	pushq	%r12	;
	movq	%rdx, %r12	; tmp295, parser
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp293, lexer
	subq	$40, %rsp	;,
; src/parser.c:699:     token = peek_current_token(lexer);
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp296, token
; src/parser.c:705:     if (token->type == INTEGER) {
	movl	24(%rax), %eax	; token_62->type, _1
; src/parser.c:705:     if (token->type == INTEGER) {
	cmpl	$2, %eax	;, _1
	je	.L180	;,
; src/parser.c:708:     } else if (token->type == FLOAT) {
	cmpl	$3, %eax	;, _1
	je	.L181	;,
; src/parser.c:711:     } else if (token->type == STRING) {
	cmpl	$4, %eax	;, _1
	je	.L182	;,
; src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	;, _1
	je	.L183	;,
.L64:
; src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _1
	je	.L68	;,
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$1, %eax	;, _1
	je	.L70	;,
.L71:
; src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file, parser_71(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC22(%rip), %rdi	;, tmp289
; src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp358, _42
; src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L76:
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
	.p2align 4,,10
	.p2align 3
.L181:
; src/parser.c:710:         str_value = token->lexeme;
	movq	0(%rbp), %rsi	; token_62->lexeme, str_value
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%r14d, %r14d	; variable_value
; src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:709:         type = PRIM_FLOAT;
	movl	$1, %ebx	;, type
.L61:
; src/parser.c:768: }
	addq	$40, %rsp	;,
; src/parser.c:767:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%r14, %r8	; variable_value,
	movl	%ebx, %edi	; type,
; src/parser.c:768: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/parser.c:767:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	jmp	*create_primary@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L180:
; src/parser.c:707:         str_value = token->lexeme;
	movq	0(%rbp), %rsi	; token_62->lexeme, str_value
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%r14d, %r14d	; variable_value
; src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:706:         type = PRIM_INTEGER;
	xorl	%ebx, %ebx	; type
	jmp	.L61	;
	.p2align 4,,10
	.p2align 3
.L182:
; src/parser.c:713:         str_value = token->lexeme;
	movq	0(%rbp), %rsi	; token_62->lexeme, str_value
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%r14d, %r14d	; variable_value
; src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:712:         type = PRIM_STRING;
	movl	$2, %ebx	;, type
	jmp	.L61	;
	.p2align 4,,10
	.p2align 3
.L183:
; src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	movq	0(%rbp), %rdi	; token_62->lexeme, token_62->lexeme
	movq	TRUE_KEYWORD(%rip), %rsi	; TRUE_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	; tmp297
	jne	.L184	;,
; src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movl	24(%rbp), %eax	; token_62->type, _6
; src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, %eax	;, _6
	jne	.L64	;,
; src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movq	0(%rbp), %rdi	; token_62->lexeme, token_62->lexeme
	movq	FALSE_KEYWORD(%rip), %rsi	; FALSE_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	; tmp298
	jne	.L67	;,
; src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movl	24(%rbp), %eax	; token_62->type, pretmp_53
; src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, pretmp_53
	jne	.L79	;,
	.p2align 4,,10
	.p2align 3
.L68:
; src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	0(%rbp), %rdi	; token_62->lexeme, token_62->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp299
	jne	.L185	;,
; src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movl	24(%rbp), %eax	; token_62->type, pretmp_53
; src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	cmpl	$5, %eax	;, pretmp_53
	jne	.L79	;,
; src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movq	0(%rbp), %rdi	; token_62->lexeme, token_62->lexeme
	movq	NOT_SYMBOL(%rip), %rsi	; NOT_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	; tmp306
	jne	.L186	;,
; src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movl	24(%rbp), %eax	; token_62->type, pretmp_53
; src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	cmpl	$5, %eax	;, pretmp_53
	jne	.L79	;,
; src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movq	0(%rbp), %rdi	; token_62->lexeme, token_62->lexeme
	movq	SUB_SYMBOL(%rip), %rsi	; SUB_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	; tmp310
	jne	.L80	;,
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movl	24(%rbp), %eax	; token_62->type, pretmp_53
.L79:
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$1, %eax	;, pretmp_53
	je	.L70	;,
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$6, %eax	;, pretmp_53
	jne	.L71	;,
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	0(%rbp), %rdi	; token_62->lexeme, token_62->lexeme
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	testb	%al, %al	; tmp315
	je	.L71	;,
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpb	$0, 9(%r12)	;, parser_71(D)->in_method
	je	.L71	;,
.L70:
; src/parser.c:771:     Token* token = peek_current_token(lexer);
	movq	%rbx, %rdi	; lexer,
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp314, token
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movl	24(%rax), %eax	; token_107->type, _108
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	;, _108
	je	.L83	;,
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	;, _108
	jne	.L86	;,
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	(%r14), %rdi	; token_107->lexeme, token_107->lexeme
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	; tmp317
	je	.L86	;,
.L83:
; src/parser.c:780:     base_name = search_name(now_scope, token->lexeme);
	movq	(%r14), %rsi	; token_107->lexeme, token_107->lexeme
	movq	%r13, %rdi	; now_scope,
	call	*search_name@GOTPCREL(%rip)	;
; src/parser.c:781:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movq	%rax, %rdx	; base_name,
	xorl	%edi, %edi	;
; src/parser.c:780:     base_name = search_name(now_scope, token->lexeme);
	movq	%rax, 8(%rsp)	; base_name, %sfp
; src/parser.c:781:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:782:     token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:781:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	movq	%rax, %r14	; tmp319, variable_value
; src/parser.c:782:     token = peek_next_token(lexer, true);
	call	*peek_next_token@GOTPCREL(%rip)	;
; src/parser.c:783:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;, token_117->type
; src/parser.c:782:     token = peek_next_token(lexer, true);
	movq	%rax, %rdx	; tmp320, token
; src/parser.c:783:     while (token->type == SYMBOL) {
	jne	.L87	;,
; src/parser.c:779:     SymbolTable* var_scope = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/parser.c:777:     Symbol* current_type = NULL;
	xorl	%r15d, %r15d	; class_name
.L113:
; src/parser.c:784:         if (base_name != NULL) {
	movq	8(%rsp), %rax	; %sfp, base_name
	testq	%rax, %rax	; base_name
	je	.L88	;,
; src/parser.c:786:             if (base_name->type != NULL)  // subroutine or variable or attribute or parameter
	movq	(%rax), %r15	; base_name_220->type, class_name
; src/parser.c:785:             current_type = base_name;     // class or type
	testq	%r15, %r15	; class_name
	cmove	%rax, %r15	; class_name,, base_name, class_name
.L88:
; src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	cmpq	$0, (%rsp)	;, %sfp
	jne	.L89	;,
	testq	%r15, %r15	; class_name
	je	.L89	;,
; src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	movl	32(%r15), %esi	; current_type_122->kind,
	movq	$0, (%rsp)	;, %sfp
	testl	%esi, %esi	;
	jne	.L89	;,
; src/parser.c:790:             var_scope = current_type->ast_node.class->class_scope;
	movq	24(%r15), %rax	; current_type_122->ast_node.class, current_type_122->ast_node.class
	movq	16(%rax), %rax	; _126->class_scope, var_scope
	movq	%rax, (%rsp)	; var_scope, %sfp
.L89:
; src/parser.c:791:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rdx), %rdi	; token_237->lexeme, token_237->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movq	%rdx, 16(%rsp)	; token, %sfp
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:791:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	16(%rsp), %rdx	; %sfp, token
	testb	%al, %al	; tmp321
	jne	.L187	;,
; src/parser.c:824:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	movq	(%rdx), %rdi	; token_237->lexeme, token_237->lexeme
	movq	L_BRACKET_SYMBOL(%rip), %rsi	; L_BRACKET_SYMBOL,
	movq	%rdx, 16(%rsp)	; token, %sfp
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:824:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	movq	16(%rsp), %rdx	; %sfp, token
	testb	%al, %al	; tmp339
	je	.L104	;,
; src/parser.c:825:             token = get_next_token(lexer, true);  // consume '['
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:826:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:827:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:826:             token = get_next_token(lexer, true);
	movq	%rax, 24(%rsp)	; tmp340, %sfp
; src/parser.c:827:             Expression* index = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
	movq	%rax, 16(%rsp)	; index, %sfp
; src/parser.c:828:             if (index == NULL)
	testq	%rax, %rax	; index
	je	.L188	;,
.L105:
; src/parser.c:830:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_186->type
; src/parser.c:830:             token = get_next_token(lexer, true);
	movq	%rax, %rcx	; tmp343, token
; src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	jne	.L107	;,
; src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	(%rax), %rdi	; token_186->lexeme, token_186->lexeme
	movq	R_BRACKET_SYMBOL(%rip), %rsi	; R_BRACKET_SYMBOL,
	movq	%rax, 24(%rsp)	; token, %sfp
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	24(%rsp), %rcx	; %sfp, token
	testb	%al, %al	; tmp345
	je	.L107	;,
; src/parser.c:836:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movq	%r14, %rsi	; variable_value,
	movq	16(%rsp), %rcx	; %sfp,
	xorl	%r8d, %r8d	;
	xorl	%edx, %edx	;
	movl	$3, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp346, variable_value
.L103:
; src/parser.c:872:         token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*peek_next_token@GOTPCREL(%rip)	;
; src/parser.c:783:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;, token_223->type
; src/parser.c:872:         token = peek_next_token(lexer, true);
	movq	%rax, %rdx	; tmp356, token
; src/parser.c:783:     while (token->type == SYMBOL) {
	je	.L113	;,
.L87:
; src/parser.c:756:         if (variable_value == NULL) {
	testq	%r14, %r14	; variable_value
	je	.L85	;,
; src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:701:     string str_value = NULL;
	xorl	%esi, %esi	; str_value
; src/parser.c:754:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %ebx	;, type
	jmp	.L61	;
	.p2align 4,,10
	.p2align 3
.L104:
; src/parser.c:837:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	movq	(%rdx), %rdi	; token_237->lexeme, token_237->lexeme
	movq	DOT_SYMBOL(%rip), %rsi	; DOT_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:837:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	; tmp347
	je	.L87	;,
; src/parser.c:838:             token = get_next_token(lexer, true);  // consume '.'
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:839:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:840:             if (var_scope == NULL) {
	cmpq	$0, (%rsp)	;, %sfp
	je	.L189	;,
; src/parser.c:845:             if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_198->type
	jne	.L190	;,
; src/parser.c:850:             base_name = search_name(var_scope, token->lexeme);
	movq	(%rax), %rsi	; token_198->lexeme, token_198->lexeme
	movq	(%rsp), %rdi	; %sfp,
	movq	%rax, 16(%rsp)	; token, %sfp
	call	*search_name@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; base_name, %sfp
; src/parser.c:851:             if (base_name == NULL) {
	testq	%rax, %rax	; base_name
	je	.L191	;,
.L110:
; src/parser.c:867:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	%r14, %rsi	; variable_value,
	movq	8(%rsp), %rdx	; %sfp,
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	movl	$2, %edi	;,
; src/parser.c:868:             current_type = NULL;
	xorl	%r15d, %r15d	; class_name
; src/parser.c:867:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:869:             var_scope = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/parser.c:867:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	%rax, %r14	; tmp355, variable_value
	jmp	.L103	;
	.p2align 4,,10
	.p2align 3
.L187:
; src/parser.c:792:             token = get_next_token(lexer, true);  // consume '('
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:793:             if (base_name == NULL)
	cmpq	$0, 8(%rsp)	;, %sfp
; src/parser.c:792:             token = get_next_token(lexer, true);  // consume '('
	movq	%rax, %r15	; tmp322, token
; src/parser.c:793:             if (base_name == NULL)
	je	.L192	;,
; src/parser.c:795:             else if (base_name->kind == SYMBOL_CLASS) {
	movq	8(%rsp), %rax	; %sfp, base_name
	movl	32(%rax), %eax	; base_name_220->kind, _135
; src/parser.c:795:             else if (base_name->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	; _135
	je	.L193	;,
.L93:
; src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	subl	$1, %eax	;, tmp255
	cmpl	$1, %eax	;, tmp255
	ja	.L194	;,
.L92:
; src/parser.c:802:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp328, token
; src/parser.c:803:             list(Expression*) args = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, (%rsp)	; tmp329, %sfp
	.p2align 4,,10
	.p2align 3
.L96:
; src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r15)	;, token_154->type
	je	.L195	;,
.L102:
; src/parser.c:805:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, %r8	; tmp330, arg
; src/parser.c:806:                 if (arg == NULL)
	testq	%rax, %rax	; arg
	je	.L196	;,
.L97:
; src/parser.c:808:                 list_append(args, (pointer)arg);
	movq	%r8, %rsi	; arg,
	movq	(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:809:                 token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	cmpl	$5, 24(%rax)	;, token_155->type
; src/parser.c:809:                 token = get_next_token(lexer, true);
	movq	%rax, %r15	; tmp332, token
; src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	je	.L98	;,
.L101:
; src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file, parser_71(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%r15, %rsi	; token,
	leaq	.LC15(%rip), %rdi	;, tmp261
; src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp333, _166
; src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L85:
; src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file, parser_71(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC21(%rip), %rdi	;, tmp287
; src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp357, _40
; src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:759:             return NULL;
	jmp	.L76	;
	.p2align 4,,10
	.p2align 3
.L195:
; src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%r15), %rdi	; token_154->lexeme, token_154->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp337
	je	.L102	;,
; src/parser.c:818:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	xorl	%ecx, %ecx	;
	movq	%r14, %rsi	; variable_value,
	movq	(%rsp), %r8	; %sfp,
	xorl	%edx, %edx	;
	movl	$1, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp338, variable_value
; src/parser.c:819:             base_name = base_name->type;
	movq	8(%rsp), %rax	; %sfp, base_name
	movq	(%rax), %rax	; base_name_174->type, base_name
; src/parser.c:822:             if (base_name->kind == SYMBOL_CLASS)
	movl	32(%rax), %ecx	; base_name_175->kind,
; src/parser.c:819:             base_name = base_name->type;
	movq	%rax, 8(%rsp)	; base_name, %sfp
; src/parser.c:822:             if (base_name->kind == SYMBOL_CLASS)
	testl	%ecx, %ecx	;
	jne	.L117	;,
; src/parser.c:823:                 var_scope = base_name->ast_node.class->class_scope;
	movq	24(%rax), %rax	; base_name_175->ast_node.class, base_name_175->ast_node.class
; src/parser.c:820:             current_type = NULL;
	xorl	%r15d, %r15d	; class_name
; src/parser.c:823:                 var_scope = base_name->ast_node.class->class_scope;
	movq	16(%rax), %rax	; _177->class_scope, var_scope
	movq	%rax, (%rsp)	; var_scope, %sfp
	jmp	.L103	;
	.p2align 4,,10
	.p2align 3
.L98:
; src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	movq	(%rax), %rdi	; token_155->lexeme, token_155->lexeme
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	testb	%al, %al	; tmp334
	jne	.L197	;,
; src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r15)	;, token_155->type
	jne	.L101	;,
; src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%r15), %rdi	; token_155->lexeme, token_155->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp336
	jne	.L96	;,
	jmp	.L101	;
	.p2align 4,,10
	.p2align 3
.L196:
; src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file, parser_71(D)->source_file
	movq	%rax, 16(%rsp)	; arg, %sfp
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%r15, %rsi	; token,
	leaq	.LC14(%rip), %rdi	;,
; src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp331, _153
; src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	movq	16(%rsp), %r8	; %sfp, arg
	jmp	.L97	;
	.p2align 4,,10
	.p2align 3
.L197:
; src/parser.c:811:                     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp335, token
; src/parser.c:811:                     token = get_next_token(lexer, true);
	jmp	.L96	;
	.p2align 4,,10
	.p2align 3
.L191:
; src/parser.c:853:                 if (current_type != NULL) {
	testq	%r15, %r15	; class_name
	movq	16(%rsp), %rcx	; %sfp, token
	je	.L111	;,
; src/parser.c:854:                     if (current_type->kind == SYMBOL_CLASS)
	movl	32(%r15), %edx	; current_type_122->kind,
	testl	%edx, %edx	;
	je	.L178	;,
; src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	movq	(%r15), %r15	; current_type_122->type, class_name
; src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	testq	%r15, %r15	; class_name
	je	.L111	;,
; src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	movl	32(%r15), %eax	; _211->kind,
	testl	%eax, %eax	;
	je	.L178	;,
; src/parser.c:852:                 string class_name = NULL;
	xorl	%r15d, %r15d	; class_name
	.p2align 4,,10
	.p2align 3
.L111:
; src/parser.c:859:                 string name = make_method_name(class_name, token->lexeme);
	movq	(%rcx), %rsi	; token_198->lexeme, token_198->lexeme
	movq	%rcx, 16(%rsp)	; token, %sfp
	movq	%r15, %rdi	; class_name,
	call	*make_method_name@GOTPCREL(%rip)	;
; src/parser.c:860:                 base_name = search_name_use_strcmp(var_scope, name);
	movq	(%rsp), %rdi	; %sfp,
; src/parser.c:859:                 string name = make_method_name(class_name, token->lexeme);
	movq	%rax, %rsi	; tmp352, name
; src/parser.c:860:                 base_name = search_name_use_strcmp(var_scope, name);
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
; src/parser.c:862:             if (base_name == NULL) {
	movq	16(%rsp), %rcx	; %sfp, token
	testq	%rax, %rax	; base_name
; src/parser.c:860:                 base_name = search_name_use_strcmp(var_scope, name);
	movq	%rax, 8(%rsp)	; base_name, %sfp
; src/parser.c:862:             if (base_name == NULL) {
	jne	.L110	;,
; src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file,
	movq	%rcx, (%rsp)	; token, %sfp
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC20(%rip), %rdi	;, tmp285
; src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp354, _219
; src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L85	;
	.p2align 4,,10
	.p2align 3
.L184:
; src/parser.c:716:         str_value = token->lexeme;
	movq	0(%rbp), %rsi	; token_62->lexeme, str_value
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%r14d, %r14d	; variable_value
; src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:715:         type = PRIM_TRUE;
	movl	$3, %ebx	;, type
; src/parser.c:716:         str_value = token->lexeme;
	jmp	.L61	;
	.p2align 4,,10
	.p2align 3
.L67:
; src/parser.c:719:         str_value = token->lexeme;
	movq	0(%rbp), %rsi	; token_62->lexeme, str_value
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%r14d, %r14d	; variable_value
; src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:718:         type = PRIM_FALSE;
	movl	$4, %ebx	;, type
; src/parser.c:719:         str_value = token->lexeme;
	jmp	.L61	;
	.p2align 4,,10
	.p2align 3
.L194:
; src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file, parser_71(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%r15, %rsi	; token,
	leaq	.LC13(%rip), %rdi	;, tmp257
; src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp327, _148
; src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L92	;
	.p2align 4,,10
	.p2align 3
.L193:
; src/parser.c:796:                 string name = make_method_name(base_name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	8(%rsp), %rax	; %sfp, base_name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
	movq	8(%rax), %rdi	; base_name_220->name, base_name_220->name
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp324, name
; src/parser.c:797:                 base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
	movq	8(%rsp), %rax	; %sfp, base_name
	movq	24(%rax), %rax	; base_name_220->ast_node.class, base_name_220->ast_node.class
	movq	16(%rax), %rdi	; _139->class_scope, _140
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
; src/parser.c:798:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	%r14, %rsi	; variable_value,
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	movq	%rax, 8(%rsp)	; base_name, %sfp
	movq	%rax, %rdx	; base_name,
	movl	$2, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp326, variable_value
; src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	movq	8(%rsp), %rax	; %sfp, base_name
	testq	%rax, %rax	; base_name
	je	.L92	;,
; src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	movl	32(%rax), %eax	; base_name_141->kind, _135
	jmp	.L93	;
	.p2align 4,,10
	.p2align 3
.L86:
; src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file, parser_71(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%r14, %rsi	; token,
	leaq	.LC11(%rip), %rdi	;, tmp239
; src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp316, _113
; src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L85	;
	.p2align 4,,10
	.p2align 3
.L178:
; src/parser.c:857:                         class_name = current_type->type->name;
	movq	8(%r15), %r15	;, class_name
	jmp	.L111	;
	.p2align 4,,10
	.p2align 3
.L188:
; src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file, parser_71(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	24(%rsp), %rsi	; %sfp,
	leaq	.LC16(%rip), %rdi	;, tmp272
; src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp342, _185
; src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L105	;
	.p2align 4,,10
	.p2align 3
.L185:
; src/parser.c:722:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:723:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:722:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp300, token
; src/parser.c:723:         expr_value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
; src/parser.c:724:         if (expr_value == NULL) {
	testq	%rax, %rax	; expr_value
	je	.L198	;,
; src/parser.c:729:         token = get_next_token(lexer, true);
	movq	%rbx, %rdi	; lexer,
	movq	%rax, (%rsp)	; expr_value, %sfp
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rsp), %rdx	; %sfp, expr_value
; src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %ebx	; token_75->type, type
; src/parser.c:729:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp303, token
; src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %ebx	;, type
	jne	.L77	;,
; src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_75->lexeme, token_75->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	%rdx, (%rsp)	; expr_value, %sfp
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp305
	je	.L77	;,
	movq	(%rsp), %rdx	; %sfp, expr_value
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%r14d, %r14d	; variable_value
; src/parser.c:703:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:701:     string str_value = NULL;
	xorl	%esi, %esi	; str_value
	jmp	.L61	;
	.p2align 4,,10
	.p2align 3
.L186:
; src/parser.c:737:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:738:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:737:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp307, token
; src/parser.c:738:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
	movq	%rax, %rcx	; tmp308, prim_value
; src/parser.c:739:         if (prim_value == NULL) {
	testq	%rax, %rax	; prim_value
	je	.L199	;,
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%r14d, %r14d	; variable_value
; src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:701:     string str_value = NULL;
	xorl	%esi, %esi	; str_value
; src/parser.c:736:         type = PRIM_NOT_OPERAND;
	movl	$6, %ebx	;, type
	jmp	.L61	;
	.p2align 4,,10
	.p2align 3
.L80:
; src/parser.c:746:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:747:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:746:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp311, token
; src/parser.c:747:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
	movq	%rax, %rcx	; tmp312, prim_value
; src/parser.c:748:         if (prim_value == NULL) {
	testq	%rax, %rax	; prim_value
	je	.L200	;,
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	xorl	%r14d, %r14d	; variable_value
; src/parser.c:702:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:701:     string str_value = NULL;
	xorl	%esi, %esi	; str_value
; src/parser.c:745:         type = PRIM_NEG_OPERAND;
	movl	$7, %ebx	;, type
	jmp	.L61	;
	.p2align 4,,10
	.p2align 3
.L192:
; src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file, parser_71(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%r15, %rsi	; token,
	leaq	.LC12(%rip), %rdi	;, tmp251
; src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp323, _134
; src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L92	;
.L77:
; src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file, parser_71(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC8(%rip), %rdi	;, tmp227
; src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp304, _21
; src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:733:             return NULL;
	jmp	.L76	;
.L117:
; src/parser.c:821:             var_scope = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/parser.c:820:             current_type = NULL;
	xorl	%r15d, %r15d	; class_name
	jmp	.L103	;
.L107:
; src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file, parser_71(D)->source_file
	movq	%rcx, (%rsp)	; token, %sfp
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC17(%rip), %rdi	;, tmp274
; src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp344, _192
; src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L85	;
.L189:
; src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file, parser_71(D)->source_file
	movq	%rax, (%rsp)	; token, %sfp
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC18(%rip), %rdi	;, tmp280
; src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp349, _201
; src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L85	;
.L190:
; src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file, parser_71(D)->source_file
	movq	%rax, (%rsp)	; token, %sfp
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC19(%rip), %rdi	;, tmp282
; src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp350, _205
; src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L85	;
.L198:
; src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file, parser_71(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC7(%rip), %rdi	;, tmp225
; src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp302, _15
; src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:727:             return NULL;
	jmp	.L76	;
.L199:
; src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC9(%rip), %rdi	;, tmp232
; src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp309, _27
; src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:742:             return NULL;
	jmp	.L76	;
.L200:
; src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_71(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC10(%rip), %rdi	;, tmp235
; src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp313, _33
; src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:751:             return NULL;
	jmp	.L76	;
	.size	parse_primary, .-parse_primary
	.section	.rodata.str1.1
.LC23:
	.string	"Expected '(' after 'if'"
.LC24:
	.string	"Failed to parse if condition"
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"Expected ')' after if condition"
	.section	.rodata.str1.1
.LC26:
	.string	"Expected '{' to start if body"
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"Failed to parse if body statement"
	.section	.rodata.str1.1
.LC28:
	.string	"Expected '(' after 'elif'"
	.section	.rodata.str1.8
	.align 8
.LC29:
	.string	"Failed to parse else-if condition"
	.align 8
.LC30:
	.string	"Expected ')' after else-if condition"
	.align 8
.LC31:
	.string	"Expected '{' to start else-if body"
	.align 8
.LC32:
	.string	"Failed to parse else-if body statement"
	.align 8
.LC33:
	.string	"Expected '{' to start else body"
	.align 8
.LC34:
	.string	"Failed to parse else body statement"
	.section	.rodata.str1.1
.LC35:
	.string	"Expected '(' after 'for'"
	.section	.rodata.str1.8
	.align 8
.LC36:
	.string	"Failed to parse for loop initializer"
	.align 8
.LC37:
	.string	"Expected ';' after for loop initializer"
	.align 8
.LC38:
	.string	"Failed to parse for loop condition"
	.align 8
.LC39:
	.string	"Expected ';' after for loop condition"
	.align 8
.LC40:
	.string	"Failed to parse for loop increment"
	.align 8
.LC41:
	.string	"Expected ')' after for loop increment"
	.align 8
.LC42:
	.string	"Expected '{' to start for loop body"
	.align 8
.LC43:
	.string	"Failed to parse for loop body statement"
	.section	.rodata.str1.1
.LC44:
	.string	"Expected '(' after 'while'"
	.section	.rodata.str1.8
	.align 8
.LC45:
	.string	"Failed to parse while condition"
	.align 8
.LC46:
	.string	"Expected ')' after while condition"
	.align 8
.LC47:
	.string	"Expected '{' to start while body"
	.align 8
.LC48:
	.string	"Failed to parse while body statement"
	.align 8
.LC49:
	.string	"Cannot use 'break' outside of a loop"
	.align 8
.LC50:
	.string	"Cannot use 'continue' outside of a loop"
	.section	.rodata.str1.1
.LC51:
	.string	"Failed to parse statement"
.LC52:
	.string	"Expected ';' after statement"
	.text
	.p2align 4
	.type	parse_statement, @function
parse_statement:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	movq	%rsi, %r13	; tmp466, now_scope
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdx, %rbp	; tmp467, parser
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp465, lexer
	subq	$56, %rsp	;,
; src/parser.c:400:     token = peek_current_token(lexer);
	call	*peek_current_token@GOTPCREL(%rip)	;
; src/parser.c:402:     if (token->type == KEYWORD) {
	cmpl	$6, 24(%rax)	;, token_60->type
	je	.L374	;,
.L202:
; src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rbp, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
; src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%r9d, %r9d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rax, %r8	;, tmp593
; src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp594, <retval>
.L279:
; src/parser.c:437:     token = peek_current_token(lexer);
	movq	%rbx, %rdi	; lexer,
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp595, token
; src/parser.c:438:     if (statement == NULL)
	testq	%r12, %r12	; <retval>
	je	.L375	;,
.L288:
; src/parser.c:440:     token = get_next_token(lexer, true);
	movq	%rbx, %rdi	; lexer,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	;, token_110->type
; src/parser.c:440:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp597, token
; src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	je	.L289	;,
.L291:
; src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC52(%rip), %rdi	;, tmp453
; src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp598, _47
; src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L201:
; src/parser.c:445: }
	addq	$56, %rsp	;,
	movq	%r12, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L289:
; src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	(%rax), %rdi	; token_110->lexeme, token_110->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; tmp599
	je	.L291	;,
	jmp	.L201	;
	.p2align 4,,10
	.p2align 3
.L374:
; src/parser.c:403:         if (string_equal(token->lexeme, IF_KEYWORD))
	movq	(%rax), %rdi	; token_60->lexeme, token_60->lexeme
	movq	IF_KEYWORD(%rip), %rsi	; IF_KEYWORD,
	movq	%rax, %r12	; tmp468, token
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:403:         if (string_equal(token->lexeme, IF_KEYWORD))
	testb	%al, %al	; tmp469
	jne	.L376	;,
; src/parser.c:405:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	movq	(%r12), %rdi	; token_60->lexeme, token_60->lexeme
	movq	FOR_KEYWORD(%rip), %rsi	; FOR_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:405:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	testb	%al, %al	; tmp522
	jne	.L377	;,
; src/parser.c:407:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	movq	(%r12), %rdi	; token_60->lexeme, token_60->lexeme
	movq	WHILE_KEYWORD(%rip), %rsi	; WHILE_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:407:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	testb	%al, %al	; tmp557
	jne	.L378	;,
; src/parser.c:409:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	(%r12), %rdi	; token_60->lexeme, token_60->lexeme
	movq	VAR_KEYWORD(%rip), %rsi	; VAR_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:409:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	; tmp577
	jne	.L379	;,
; src/parser.c:412:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	movq	(%r12), %rdi	; token_60->lexeme, token_60->lexeme
	movq	RETURN_KEYWORD(%rip), %rsi	; RETURN_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:412:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	; tmp580
	je	.L280	;,
; src/parser.c:413:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_85->type
	je	.L380	;,
.L281:
; src/parser.c:418:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rbp, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
; src/parser.c:418:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%r9d, %r9d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:418:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rax, %r8	;, tmp583
; src/parser.c:418:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%esi, %esi	;
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp584, <retval>
	jmp	.L279	;
	.p2align 4,,10
	.p2align 3
.L377:
; src/parser.c:543:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_223->type
; src/parser.c:543:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp523, token
; src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L237	;,
; src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_223->lexeme, token_223->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp525
	je	.L237	;,
; src/parser.c:549:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_230->type
; src/parser.c:549:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp526, token
; src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	je	.L238	;,
.L241:
; src/parser.c:552:         initializer = parse_variable(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_variable	;
	movq	%rax, %r14	; tmp527, initializer
; src/parser.c:553:         if (initializer == NULL)
	testq	%rax, %rax	; initializer
	je	.L381	;,
.L240:
; src/parser.c:555:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp530, token
.L242:
; src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%r12)	;, token_239->type
	jne	.L245	;,
; src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r12), %rdi	; token_239->lexeme, token_239->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp532
	je	.L245	;,
; src/parser.c:562:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_246->type
; src/parser.c:562:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp533, token
; src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	je	.L246	;,
.L249:
; src/parser.c:565:         condition = parse_expression(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, 8(%rsp)	; condition, %sfp
; src/parser.c:566:         if (condition == NULL)
	testq	%rax, %rax	; condition
	je	.L382	;,
.L248:
; src/parser.c:568:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp537, token
.L250:
; src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%r12)	;, token_255->type
	jne	.L252	;,
; src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r12), %rdi	; token_255->lexeme, token_255->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp539
	je	.L252	;,
; src/parser.c:575:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_262->type
; src/parser.c:575:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp540, token
; src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L253	;,
.L256:
; src/parser.c:578:         increment = parse_expression(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, 24(%rsp)	; increment, %sfp
; src/parser.c:579:         if (increment == NULL)
	testq	%rax, %rax	; increment
	je	.L383	;,
.L255:
; src/parser.c:581:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp544, token
.L257:
; src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r12)	;, token_271->type
	jne	.L259	;,
; src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%r12), %rdi	; token_271->lexeme, token_271->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp546
	je	.L259	;,
; src/parser.c:588:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_278->type
; src/parser.c:588:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp547, token
; src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L261	;,
; src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_278->lexeme, token_278->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp549
	je	.L261	;,
; src/parser.c:594:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:595:     parser->in_loop = true;
	movb	$1, 11(%rbp)	;, parser_62(D)->in_loop
; src/parser.c:596:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:594:     list(Statement*) body = create_list();
	movq	%rax, %r15	; tmp550, body
; src/parser.c:596:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp551, token
; src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L262	;
	.p2align 4,,10
	.p2align 3
.L263:
; src/parser.c:601:         list_append(body, (pointer)statement);
	movq	%rcx, %rsi	; statement,
	movq	%r15, %rdi	; body,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:602:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp554, token
.L262:
; src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r12)	;, token_290->type
	jne	.L264	;,
; src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdi	; token_290->lexeme, token_290->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp555
	jne	.L384	;,
.L264:
; src/parser.c:598:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %rcx	; tmp552, statement
; src/parser.c:599:         if (statement == NULL)
	testq	%rax, %rax	; statement
	jne	.L263	;,
; src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	movq	%rax, 16(%rsp)	; statement, %sfp
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC43(%rip), %rdi	;,
; src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp553, _289
; src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	movq	16(%rsp), %rcx	; %sfp, statement
	jmp	.L263	;
	.p2align 4,,10
	.p2align 3
.L375:
; src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%r13, %rsi	; token,
	leaq	.LC51(%rip), %rdi	;, tmp451
; src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp596, _41
; src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L288	;
	.p2align 4,,10
	.p2align 3
.L376:
; src/parser.c:449:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_114->type
; src/parser.c:449:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp470, token
; src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L206	;,
; src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_114->lexeme, token_114->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp472
	je	.L206	;,
; src/parser.c:455:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:456:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:455:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp473, token
; src/parser.c:456:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
	movq	%rax, 32(%rsp)	; condition, %sfp
; src/parser.c:457:     if (condition == NULL)
	testq	%rax, %rax	; condition
	je	.L385	;,
.L207:
; src/parser.c:459:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_125->type
; src/parser.c:459:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp476, token
; src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jne	.L209	;,
; src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_125->lexeme, token_125->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp478
	je	.L209	;,
; src/parser.c:465:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_132->type
; src/parser.c:465:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp479, token
; src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L211	;,
; src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_132->lexeme, token_132->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp481
	je	.L211	;,
; src/parser.c:471:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:472:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	leaq	.LC27(%rip), %r14	;, tmp462
; src/parser.c:471:     list(Statement*) body = create_list();
	movq	%rax, 8(%rsp)	; tmp482, %sfp
; src/parser.c:472:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp483, token
; src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L212	;
	.p2align 4,,10
	.p2align 3
.L213:
; src/parser.c:477:         list_append(body, (pointer)statement);
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r15, %rsi	; statement,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:478:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp486, token
.L212:
; src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r12)	;, token_144->type
	jne	.L214	;,
; src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdi	; token_144->lexeme, token_144->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp487
	jne	.L386	;,
.L214:
; src/parser.c:474:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %r15	; tmp484, statement
; src/parser.c:475:         if (statement == NULL)
	testq	%rax, %rax	; statement
	jne	.L213	;,
; src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	movq	%r14, %rdi	; tmp462,
; src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp485, _143
; src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L213	;
	.p2align 4,,10
	.p2align 3
.L206:
; src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC23(%rip), %rdi	;, tmp335
; src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp471, _120
; src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L205:
; src/parser.c:453:         return NULL;
	xorl	%esi, %esi	; _221
.L216:
; src/parser.c:404:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$2, %edi	;,
.L373:
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
	.p2align 4,,10
	.p2align 3
.L378:
; src/parser.c:611:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_301->type
; src/parser.c:611:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp558, token
; src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L268	;,
; src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_301->lexeme, token_301->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp560
	je	.L268	;,
; src/parser.c:617:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:618:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:617:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp561, token
; src/parser.c:618:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
	movq	%rax, %r15	; tmp562, condition
; src/parser.c:619:     if (condition == NULL)
	testq	%rax, %rax	; condition
	je	.L387	;,
.L269:
; src/parser.c:621:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_312->type
; src/parser.c:621:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp564, token
; src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jne	.L272	;,
; src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_312->lexeme, token_312->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp566
	je	.L272	;,
; src/parser.c:627:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_319->type
; src/parser.c:627:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp567, token
; src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L274	;,
; src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_319->lexeme, token_319->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp569
	je	.L274	;,
; src/parser.c:633:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:634:     parser->in_loop = true;
	movb	$1, 11(%rbp)	;, parser_62(D)->in_loop
; src/parser.c:635:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:633:     list(Statement*) body = create_list();
	movq	%rax, %r14	; tmp570, body
; src/parser.c:635:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp571, token
; src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L275	;
	.p2align 4,,10
	.p2align 3
.L276:
; src/parser.c:640:         list_append(body, (pointer)statement);
	movq	%rcx, %rsi	; statement,
	movq	%r14, %rdi	; body,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:641:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp574, token
.L275:
; src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r12)	;, token_331->type
	jne	.L277	;,
; src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdi	; token_331->lexeme, token_331->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp575
	jne	.L388	;,
.L277:
; src/parser.c:637:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %rcx	; tmp572, statement
; src/parser.c:638:         if (statement == NULL)
	testq	%rax, %rax	; statement
	jne	.L276	;,
; src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	movq	%rax, 8(%rsp)	; statement, %sfp
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC48(%rip), %rdi	;,
; src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp573, _330
; src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	movq	8(%rsp), %rcx	; %sfp, statement
	jmp	.L276	;
	.p2align 4,,10
	.p2align 3
.L379:
; src/parser.c:410:             get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:411:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rbp, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_variable	;
; src/parser.c:411:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:411:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rax, %r9	;, tmp578
; src/parser.c:411:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	xorl	%esi, %esi	;
	movl	$1, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp579, <retval>
	jmp	.L279	;
	.p2align 4,,10
	.p2align 3
.L209:
; src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC25(%rip), %rdi	;, tmp341
; src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp477, _131
; src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:463:         return NULL;
	jmp	.L205	;
	.p2align 4,,10
	.p2align 3
.L237:
; src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC35(%rip), %rdi	;, tmp382
; src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp524, _229
; src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L236:
; src/parser.c:547:         return NULL;
	xorl	%ecx, %ecx	; _299
.L244:
; src/parser.c:406:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$4, %edi	;,
	jmp	.L373	;
	.p2align 4,,10
	.p2align 3
.L268:
; src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC44(%rip), %rdi	;, tmp420
; src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp559, _307
; src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L267:
; src/parser.c:615:         return NULL;
	xorl	%edx, %edx	; _337
.L271:
; src/parser.c:408:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$3, %edi	;,
	jmp	.L373	;
.L385:
; src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC24(%rip), %rdi	;, tmp339
; src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp475, _124
; src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L207	;
	.p2align 4,,10
	.p2align 3
.L280:
; src/parser.c:419:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	movq	(%r12), %rdi	; token_60->lexeme, token_60->lexeme
	movq	BREAK_KEYWORD(%rip), %rsi	; BREAK_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:419:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	; tmp585
	je	.L282	;,
; src/parser.c:420:             if (!parser->in_loop) {
	cmpb	$0, 11(%rbp)	;, parser_62(D)->in_loop
	je	.L389	;,
; src/parser.c:425:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$6, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp587, <retval>
	jmp	.L279	;
	.p2align 4,,10
	.p2align 3
.L245:
; src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC37(%rip), %rdi	;, tmp390
; src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp531, _245
; src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:560:         return NULL;
	jmp	.L236	;
.L211:
; src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC26(%rip), %rdi	;, tmp345
; src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp480, _138
; src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:469:         return NULL;
	jmp	.L205	;
.L386:
; src/parser.c:480:     list(ElseIf*) else_if = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, 24(%rsp)	; tmp488, %sfp
; src/parser.c:481:     list(Statement*) else_body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, 40(%rsp)	; tmp489, %sfp
	.p2align 4,,10
	.p2align 3
.L372:
; src/parser.c:482:     token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*peek_next_token@GOTPCREL(%rip)	;
; src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	;,
; src/parser.c:482:     token = peek_next_token(lexer, true);
	movq	%rax, %r12	; tmp490, token
; src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	jne	.L227	;,
; src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	movq	(%rax), %rdi	; token_54->lexeme, token_54->lexeme
	movq	ELIF_KEYWORD(%rip), %rsi	; ELIF_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	; tmp512
	je	.L390	;,
; src/parser.c:484:         token = get_next_token(lexer, true);  // consume 'elif'
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:485:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_153->type
; src/parser.c:485:         token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp492, token
; src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L218	;,
; src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_153->lexeme, token_153->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp494
	je	.L218	;,
; src/parser.c:491:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:492:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:491:         token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp495, token
; src/parser.c:492:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
	movq	%rax, 16(%rsp)	; elif_condition, %sfp
; src/parser.c:493:         if (elif_condition == NULL)
	testq	%rax, %rax	; elif_condition
	je	.L391	;,
.L219:
; src/parser.c:495:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_165->type
; src/parser.c:495:         token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp498, token
; src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jne	.L221	;,
; src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_165->lexeme, token_165->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp500
	je	.L221	;,
; src/parser.c:501:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_173->type
; src/parser.c:501:         token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp501, token
; src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L223	;,
; src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_173->lexeme, token_173->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp503
	je	.L223	;,
; src/parser.c:507:         list(Statement*) elif_body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:508:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:507:         list(Statement*) elif_body = create_list();
	movq	%rax, %r14	; tmp504, elif_body
; src/parser.c:508:         token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp505, token
; src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L224	;
	.p2align 4,,10
	.p2align 3
.L225:
; src/parser.c:513:             list_append(elif_body, (pointer)statement);
	movq	%r15, %rsi	; statement,
	movq	%r14, %rdi	; elif_body,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:514:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp508, token
.L224:
; src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r12)	;, token_186->type
	jne	.L226	;,
; src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdi	; token_186->lexeme, token_186->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp509
	jne	.L392	;,
.L226:
; src/parser.c:510:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %r15	; tmp506, statement
; src/parser.c:511:             if (statement == NULL)
	testq	%rax, %rax	; statement
	jne	.L225	;,
; src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC32(%rip), %rdi	;,
; src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp507, _185
; src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L225	;
	.p2align 4,,10
	.p2align 3
.L392:
; src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	16(%rsp), %rdi	; %sfp,
	movq	%r14, %rsi	; elif_body,
	call	*create_else_if@GOTPCREL(%rip)	;
; src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	24(%rsp), %rdi	; %sfp,
; src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%rax, %rsi	; tmp510, _192
; src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L372	;
	.p2align 4,,10
	.p2align 3
.L391:
; src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC29(%rip), %rdi	;,
; src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp497, _164
; src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L219	;
.L238:
; src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rax), %rdi	; token_230->lexeme, token_230->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
; src/parser.c:550:     Variable* initializer = NULL;
	xorl	%r14d, %r14d	; initializer
; src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp528
	jne	.L242	;,
	jmp	.L241	;
.L272:
; src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC46(%rip), %rdi	;, tmp426
; src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp565, _318
; src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:625:         return NULL;
	jmp	.L267	;
.L252:
; src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC39(%rip), %rdi	;, tmp398
; src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp538, _261
; src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:573:         return NULL;
	jmp	.L236	;
.L380:
; src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rax), %rdi	; token_85->lexeme, token_85->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp582
	je	.L281	;,
; src/parser.c:416:                 return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$5, %edi	;,
	jmp	.L373	;
.L282:
; src/parser.c:426:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	movq	(%r12), %rdi	; token_60->lexeme, token_60->lexeme
	movq	CONTINUE_KEYWORD(%rip), %rsi	; CONTINUE_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:426:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	; tmp588
	je	.L202	;,
; src/parser.c:427:             if (!parser->in_loop) {
	cmpb	$0, 11(%rbp)	;, parser_62(D)->in_loop
	je	.L393	;,
; src/parser.c:432:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$7, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp590, <retval>
	jmp	.L279	;
.L246:
; src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rax), %rdi	; token_246->lexeme, token_246->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp535
	je	.L249	;,
; src/parser.c:563:     Expression* condition = NULL;
	movq	$0, 8(%rsp)	;, %sfp
	jmp	.L250	;
.L274:
; src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC47(%rip), %rdi	;, tmp430
; src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp568, _325
; src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:631:         return NULL;
	jmp	.L267	;
.L388:
; src/parser.c:643:     parser->in_loop = false;
	movb	$0, 11(%rbp)	;, parser_62(D)->in_loop
; src/parser.c:645:     return create_while(condition, body);
	movq	%r14, %rsi	; body,
	movq	%r15, %rdi	; condition,
	call	*create_while@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp576, _337
	jmp	.L271	;
.L381:
; src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC36(%rip), %rdi	;, tmp388
; src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp529, _237
; src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L240	;
.L259:
; src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC41(%rip), %rdi	;, tmp406
; src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp545, _277
; src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:586:         return NULL;
	jmp	.L236	;
.L387:
; src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC45(%rip), %rdi	;, tmp424
; src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp563, _311
; src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L269	;
.L227:
; src/parser.c:536:     token = peek_current_token(lexer);
	movq	%rbx, %rdi	; lexer,
	call	*peek_current_token@GOTPCREL(%rip)	;
; src/parser.c:538:     return create_if(condition, body, else_if, else_body);
	movq	8(%rsp), %rsi	; %sfp,
	movq	40(%rsp), %rcx	; %sfp,
	movq	24(%rsp), %rdx	; %sfp,
	movq	32(%rsp), %rdi	; %sfp,
	call	*create_if@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp491, _221
	jmp	.L216	;
.L218:
; src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC28(%rip), %rdi	;, tmp353
; src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp493, _159
; src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:489:             return NULL;
	jmp	.L205	;
.L221:
; src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC30(%rip), %rdi	;, tmp359
; src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp499, _171
; src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:499:             return NULL;
	jmp	.L205	;
.L223:
; src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC31(%rip), %rdi	;, tmp363
; src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp502, _179
; src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:505:             return NULL;
	jmp	.L205	;
.L253:
; src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_262->lexeme, token_262->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp542
	je	.L256	;,
; src/parser.c:576:     Expression* increment = NULL;
	movq	$0, 24(%rsp)	;, %sfp
	jmp	.L257	;
.L389:
; src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC49(%rip), %rdi	;, tmp446
; src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp586, _31
; src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L284:
; src/parser.c:423:                 return NULL;
	xorl	%r12d, %r12d	; <retval>
	jmp	.L201	;
.L382:
; src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC38(%rip), %rdi	;, tmp396
; src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp536, _253
; src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L248	;
.L384:
; src/parser.c:606:     return create_for(initializer, condition, increment, body);
	movq	%r15, %rcx	; body,
; src/parser.c:604:     parser->in_loop = false;
	movb	$0, 11(%rbp)	;, parser_62(D)->in_loop
; src/parser.c:606:     return create_for(initializer, condition, increment, body);
	movq	24(%rsp), %rdx	; %sfp,
	movq	%r14, %rdi	; initializer,
	movq	8(%rsp), %rsi	; %sfp,
	call	*create_for@GOTPCREL(%rip)	;
	movq	%rax, %rcx	; tmp556, _299
	jmp	.L244	;
.L261:
; src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC42(%rip), %rdi	;, tmp410
; src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp548, _284
; src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:592:         return NULL;
	jmp	.L236	;
.L390:
; src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, 24(%r12)	;, token_54->type
	jne	.L227	;,
; src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	movq	(%r12), %rdi	; token_54->lexeme, token_54->lexeme
	movq	ELSE_KEYWORD(%rip), %rsi	; ELSE_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	; tmp513
	je	.L227	;,
; src/parser.c:520:         token = get_next_token(lexer, true);  // consume 'else'
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:521:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_204->type
; src/parser.c:521:         token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp514, token
; src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L230	;,
; src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_204->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp516
	je	.L230	;,
; src/parser.c:527:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	leaq	.LC34(%rip), %r15	;, tmp457
; src/parser.c:527:         token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp517, token
; src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L231	;
	.p2align 4,,10
	.p2align 3
.L232:
; src/parser.c:532:             list_append(else_body, (pointer)statement);
	movq	40(%rsp), %rdi	; %sfp,
	movq	%r14, %rsi	; statement,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:533:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp520, token
.L231:
; src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r12)	;, token_215->type
	jne	.L233	;,
; src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdi	; token_215->lexeme, token_215->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp521
	jne	.L227	;,
.L233:
; src/parser.c:529:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %r14	; tmp518, statement
; src/parser.c:530:             if (statement == NULL)
	testq	%rax, %rax	; statement
	jne	.L232	;,
; src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	movq	%r15, %rdi	; tmp457,
; src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp519, _214
; src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L232	;
.L383:
; src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file, parser_62(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC40(%rip), %rdi	;, tmp404
; src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp543, _269
; src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L255	;
.L393:
; src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC50(%rip), %rdi	;, tmp449
; src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp589, _37
; src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:430:                 return NULL;
	jmp	.L284	;
.L230:
; src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_62(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC33(%rip), %rdi	;, tmp374
; src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp515, _210
; src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:525:             return NULL;
	jmp	.L205	;
	.size	parse_statement, .-parse_statement
	.section	.rodata.str1.8
	.align 8
.LC53:
	.string	"Expected identifier after 'import'"
	.align 8
.LC54:
	.string	"Expected string literal after 'from'"
	.align 8
.LC55:
	.string	"Expected ';' at end of import statement"
	.section	.rodata.str1.1
.LC56:
	.string	"Failed to import module"
	.section	.rodata.str1.8
	.align 8
.LC57:
	.string	"Failed to parse import statement"
	.align 8
.LC58:
	.string	"Expected function return type after 'func'"
	.section	.rodata.str1.1
.LC59:
	.string	"Unknown function return type"
	.section	.rodata.str1.8
	.align 8
.LC60:
	.string	"Expected function name after return type"
	.align 8
.LC61:
	.string	"Expected '(' after function name"
	.align 8
.LC62:
	.string	"Failed to parse function parameter"
	.align 8
.LC63:
	.string	"Function parameters cannot have default values"
	.align 8
.LC64:
	.string	"Expected ',' or ')' after function parameter"
	.align 8
.LC65:
	.string	"Expected '{' to start function body"
	.align 8
.LC66:
	.string	"Failed to parse function body statement"
	.align 8
.LC67:
	.string	"Unreachable code after return statement"
	.align 8
.LC68:
	.string	"Function missing return statement"
	.align 8
.LC69:
	.string	"Failed to parse function declaration"
	.align 8
.LC70:
	.string	"Expected class name after 'class'"
	.align 8
.LC71:
	.string	"Expected '{' to start class body"
	.align 8
.LC72:
	.string	"Expected method return type after 'method'"
	.align 8
.LC73:
	.string	"Unknown return type for method"
	.align 8
.LC74:
	.string	"Expected method name after return type"
	.align 8
.LC75:
	.string	"Expected '(' after method name"
	.align 8
.LC76:
	.string	"Expected 'self' as first parameter of method"
	.align 8
.LC77:
	.string	"Expected ',' or ')' after method parameter"
	.align 8
.LC78:
	.string	"Failed to parse method parameter"
	.align 8
.LC79:
	.string	"Method parameters cannot have default values"
	.align 8
.LC80:
	.string	"Expected '{' to start method body"
	.align 8
.LC82:
	.string	"Failed to parse method body statement"
	.align 8
.LC83:
	.string	"Method missing return statement"
	.section	.rodata.str1.1
.LC84:
	.string	"Failed to parse class method"
	.section	.rodata.str1.8
	.align 8
.LC85:
	.string	"Failed to parse class variable"
	.align 8
.LC86:
	.string	"Unsupported type for class variable"
	.align 8
.LC87:
	.string	"Expected ';' after class variable declaration"
	.align 8
.LC88:
	.string	"Unexpected token in class member"
	.align 8
.LC89:
	.string	"Constructor name conflicts with existing member"
	.section	.rodata.str1.1
.LC90:
	.string	"0"
	.section	.rodata.str1.8
	.align 8
.LC91:
	.string	"Failed to parse class declaration"
	.align 8
.LC92:
	.string	"Unexpected token in code member"
	.text
	.p2align 4
	.globl	parse_code
	.type	parse_code, @function
parse_code:
	pushq	%r15	;
	movq	%rdi, %r15	; tmp641, lexer
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdx, %rbp	; tmp643, parser
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp642, now_scope
	subq	$120, %rsp	;,
; src/parser.c:23:     if (builtin_scope == NULL) {
	cmpq	$0, builtin_scope(%rip)	;, builtin_scope
	je	.L596	;,
.L395:
; src/parser.c:32:         now_scope = builtin_scope;
	testq	%rbx, %rbx	; now_scope
	cmove	builtin_scope(%rip), %rbx	; builtin_scope,, now_scope
	movq	%rbp, %r13	; parser, parser
; src/parser.c:34:     list(CodeMember*) members = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, 24(%rsp)	; tmp650, %sfp
; src/parser.c:35:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	%rbx, %rdi	; now_scope,
	call	*create_symbol_table@GOTPCREL(%rip)	;
; src/parser.c:36:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
; src/parser.c:35:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	%rax, 16(%rsp)	; tmp651, %sfp
; src/parser.c:36:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, (%rsp)	; token, %sfp
; src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	; token
	jne	.L397	;,
	jmp	.L513	;
	.p2align 4,,10
	.p2align 3
.L442:
; src/parser.c:54:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:54:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC92(%rip), %rdi	;,
; src/parser.c:54:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp838, _38
; src/parser.c:54:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L409:
; src/parser.c:55:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, (%rsp)	; token, %sfp
; src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	; token
	je	.L513	;,
.L397:
; src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	movq	(%rsp), %rax	; %sfp, token
	movl	24(%rax), %eax	; token_369->type, _39
; src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	testl	%eax, %eax	; _39
	je	.L513	;,
; src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	;, _39
	jne	.L442	;,
; src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movq	(%rsp), %rax	; %sfp, token
	movq	IMPORT_KEYWORD(%rip), %rsi	; IMPORT_KEYWORD,
	movq	(%rax), %rdi	; token_369->lexeme, token_369->lexeme
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %ebp	; tmp653, have_return
; src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	testb	%al, %al	; have_return
	jne	.L597	;,
; src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	(%rsp), %rax	; %sfp, token
	cmpl	$6, 24(%rax)	;, token_369->type
	jne	.L442	;,
; src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	(%rax), %rdi	; token_369->lexeme, token_369->lexeme
	movq	FUNC_KEYWORD(%rip), %rsi	; FUNC_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	testb	%al, %al	; tmp669
	jne	.L598	;,
; src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	(%rsp), %rax	; %sfp, token
	cmpl	$6, 24(%rax)	;, token_369->type
	jne	.L442	;,
; src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	(%rax), %rdi	; token_369->lexeme, token_369->lexeme
	movq	CLASS_KEYWORD(%rip), %rsi	; CLASS_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	testb	%al, %al	; tmp709
	je	.L442	;,
; src/parser.c:264:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	16(%rsp), %rdi	; %sfp,
	call	*create_symbol_table@GOTPCREL(%rip)	;
; src/parser.c:265:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
; src/parser.c:264:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	%rax, 32(%rsp)	; tmp710, %sfp
; src/parser.c:265:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:266:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_219->type
; src/parser.c:265:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp711, token
; src/parser.c:266:     if (token->type != IDENTIFIER) {
	jne	.L599	;,
; src/parser.c:271:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/parser.c:273:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	movq	(%rbx), %rdi	; token_219->lexeme, token_219->lexeme
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
; src/parser.c:271:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movq	%rax, %rcx	; tmp713, class
	movq	%rax, 64(%rsp)	; class, %sfp
; src/parser.c:272:     class->class_scope = class_scope;
	movq	32(%rsp), %rax	; %sfp, class_scope
	movq	%rax, 16(%rcx)	; class_scope, class_223->class_scope
; src/parser.c:273:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:274:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
; src/parser.c:273:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	movq	%rax, 40(%rsp)	; tmp714, %sfp
; src/parser.c:274:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_226->type
; src/parser.c:274:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp715, token
; src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L446	;,
; src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_226->lexeme, token_226->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp717
	je	.L446	;,
; src/parser.c:280:     list(ClassMember*) members = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:281:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
; src/parser.c:280:     list(ClassMember*) members = create_list();
	movq	%rax, 48(%rsp)	; tmp718, %sfp
; src/parser.c:281:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:282:     size_t size = 0;
	movq	$0, 72(%rsp)	;, %sfp
; src/parser.c:281:     token = get_next_token(lexer, true);
	movq	%rax, %r10	; tmp719, token
; src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L447	;
	.p2align 4,,10
	.p2align 3
.L499:
; src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	;, _278
	je	.L600	;,
.L448:
; src/parser.c:313:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 8(%rsp)	; token, %sfp
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:313:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC88(%rip), %rdi	;,
; src/parser.c:313:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp775, _276
; src/parser.c:313:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L496:
; src/parser.c:314:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r10	; tmp776, token
.L447:
; src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movl	24(%r10), %eax	; token_235->type, _278
; src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, _278
	jne	.L499	;,
; src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r10), %rdi	; token_235->lexeme, token_235->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	movq	%r10, 8(%rsp)	; token, %sfp
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	8(%rsp), %r10	; %sfp, token
	testb	%al, %al	; tmp777
	jne	.L500	;,
; src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movl	24(%r10), %eax	; token_235->type, _278
; src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	;, _278
	jne	.L448	;,
.L600:
; src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	(%r10), %rdi	; token_235->lexeme, token_235->lexeme
	movq	METHOD_KEYWORD(%rip), %rsi	; METHOD_KEYWORD,
	movq	%r10, 8(%rsp)	; token, %sfp
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	8(%rsp), %r10	; %sfp, token
	testb	%al, %al	; tmp720
	jne	.L601	;,
; src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	cmpl	$6, 24(%r10)	;, token_235->type
	jne	.L448	;,
; src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	(%r10), %rdi	; token_235->lexeme, token_235->lexeme
	movq	VAR_KEYWORD(%rip), %rsi	; VAR_KEYWORD,
	movq	%r10, 8(%rsp)	; token, %sfp
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	8(%rsp), %r10	; %sfp, token
	testb	%al, %al	; tmp766
	je	.L448	;,
; src/parser.c:290:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:291:             parser->in_class = true;
	movb	$1, 10(%r13)	;, parser_74(D)->in_class
; src/parser.c:292:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	%r15, %rdi	; lexer,
	movq	32(%rsp), %rsi	; %sfp,
; src/parser.c:290:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp767, token
; src/parser.c:292:             Variable* variable = parse_variable(lexer, class_scope, parser);
	call	parse_variable	;
; src/parser.c:293:             parser->in_class = false;
	movb	$0, 10(%r13)	;, parser_74(D)->in_class
; src/parser.c:292:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	%rax, %rbp	; tmp768, variable
; src/parser.c:294:             if (variable == NULL)
	testq	%rax, %rax	; variable
	je	.L602	;,
.L487:
; src/parser.c:296:             ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
	movq	%rbp, %rdx	; variable,
	xorl	%esi, %esi	;
	movl	$1, %edi	;,
	call	*create_class_member@GOTPCREL(%rip)	;
; src/parser.c:297:             list_append(members, (pointer)member);
	movq	48(%rsp), %rdi	; %sfp,
; src/parser.c:296:             ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
	movq	%rax, %rbp	; tmp770, member
; src/parser.c:297:             list_append(members, (pointer)member);
	movq	%rax, %rsi	; member,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:298:             if (member->type == CLASS_VARIABLE) {
	cmpl	$1, 8(%rbp)	;, member_252->type
	je	.L603	;,
.L491:
; src/parser.c:309:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	;, token_268->type
; src/parser.c:309:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp772, token
; src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	je	.L495	;,
.L497:
; src/parser.c:311:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:311:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC87(%rip), %rdi	;,
; src/parser.c:311:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp773, _274
; src/parser.c:311:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L496	;
	.p2align 4,,10
	.p2align 3
.L513:
; src/parser.c:58:     return create_code(members, global_scope);
	movq	16(%rsp), %rsi	; %sfp,
	movq	24(%rsp), %rdi	; %sfp,
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
	.p2align 4,,10
	.p2align 3
.L597:
; src/parser.c:63:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:64:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_101->type
; src/parser.c:63:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp654, token
; src/parser.c:64:     if (token->type != IDENTIFIER) {
	jne	.L604	;,
; src/parser.c:69:     string import_name = token->lexeme;
	movq	(%rax), %rbp	; token_101->lexeme, import_name
; src/parser.c:71:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
; src/parser.c:70:     string source = NULL;
	xorl	%ebx, %ebx	; source
; src/parser.c:71:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp656, token
; src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movl	24(%rax), %eax	; token_106->type, _107
; src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	cmpl	$6, %eax	;, _107
	je	.L605	;,
.L402:
; src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	;, _107
	jne	.L406	;,
; src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r12), %rdi	; token_117->lexeme, token_117->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp662
	je	.L406	;,
; src/parser.c:88:     name = parse_import_file(import_name, source, now_scope, parser->source_file);
	movq	%rbp, %rdi	; import_name,
	movq	0(%r13), %rcx	; parser_74(D)->source_file, parser_74(D)->source_file
	movq	16(%rsp), %rdx	; %sfp,
	movq	%rbx, %rsi	; source,
	call	*parse_import_file@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp663, name
; src/parser.c:89:     if (name == NULL) {
	testq	%rax, %rax	; name
	je	.L606	;,
.L407:
; src/parser.c:94:     return create_import(name, source);
	movq	%rbx, %rsi	; source,
	call	*create_import@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp666, _132
; src/parser.c:40:             if (import == NULL)
	testq	%rax, %rax	; _132
	je	.L401	;,
.L408:
; src/parser.c:42:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	xorl	%edi, %edi	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	call	*create_code_member@GOTPCREL(%rip)	;
; src/parser.c:42:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	24(%rsp), %rdi	; %sfp,
; src/parser.c:42:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	%rax, %rsi	; tmp668, _22
; src/parser.c:42:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	jmp	.L409	;
	.p2align 4,,10
	.p2align 3
.L598:
; src/parser.c:99:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	16(%rsp), %rdi	; %sfp,
	call	*create_symbol_table@GOTPCREL(%rip)	;
; src/parser.c:100:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
; src/parser.c:99:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	%rax, %r12	; tmp670, function_scope
; src/parser.c:100:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp671, token
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	; token_135->type, _136
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	;, _136
	je	.L411	;,
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	;, _136
	jne	.L414	;,
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rbx), %rdi	; token_135->lexeme, token_135->lexeme
	call	*is_builtin_type@GOTPCREL(%rip)	;
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	; tmp673
	je	.L414	;,
.L411:
; src/parser.c:106:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rsi	; token_135->lexeme, token_135->lexeme
	movq	16(%rsp), %rdi	; %sfp,
	call	*search_name@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; return_type, %sfp
; src/parser.c:107:     if (return_type == NULL) {
	testq	%rax, %rax	; return_type
	je	.L607	;,
; src/parser.c:112:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:113:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_145->type
; src/parser.c:112:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp676, token
; src/parser.c:113:     if (token->type != IDENTIFIER) {
	jne	.L608	;,
; src/parser.c:118:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/parser.c:120:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	(%rbx), %rdi	; token_145->lexeme, token_145->lexeme
	movq	8(%rsp), %rdx	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:118:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movq	%rax, %rcx	; tmp678, function
	movq	%rax, 40(%rsp)	; function, %sfp
; src/parser.c:119:     function->function_scope = function_scope;
	movq	%r12, 32(%rax)	; function_scope, function_149->function_scope
; src/parser.c:120:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:121:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
; src/parser.c:120:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	%rax, 48(%rsp)	; tmp679, %sfp
; src/parser.c:121:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_152->type
; src/parser.c:121:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp680, token
; src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L418	;,
; src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_152->lexeme, token_152->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp682
	je	.L418	;,
; src/parser.c:127:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
; src/parser.c:134:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	leaq	.LC63(%rip), %r14	;, tmp630
; src/parser.c:127:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp683, token
; src/parser.c:128:     list(Variable*) parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, 32(%rsp)	; tmp684, %sfp
	.p2align 4,,10
	.p2align 3
.L419:
; src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_164->type
	je	.L609	;,
.L427:
; src/parser.c:130:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	%r12, %rsi	; function_scope,
	movq	%r15, %rdi	; lexer,
	call	parse_variable	;
; src/parser.c:131:         if (parameter == NULL)
	testq	%rax, %rax	; parameter
	je	.L610	;,
; src/parser.c:133:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	;, parameter_161->value
	je	.L422	;,
; src/parser.c:134:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:134:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	movq	%r14, %rdi	; tmp630,
; src/parser.c:134:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp687, _167
; src/parser.c:134:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L421:
; src/parser.c:137:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_168->type
; src/parser.c:137:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp688, token
; src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	je	.L423	;,
.L426:
; src/parser.c:141:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:141:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC64(%rip), %rdi	;,
; src/parser.c:141:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp689, _179
; src/parser.c:141:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L413:
; src/parser.c:46:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:46:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC69(%rip), %rdi	;, tmp516
; src/parser.c:46:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp707, _28
; src/parser.c:46:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	xorl	%edx, %edx	; _214
.L441:
; src/parser.c:47:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	xorl	%esi, %esi	;
	xorl	%ecx, %ecx	;
	movl	$1, %edi	;,
	call	*create_code_member@GOTPCREL(%rip)	;
; src/parser.c:47:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	24(%rsp), %rdi	; %sfp,
; src/parser.c:47:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	%rax, %rsi	; tmp708, _29
; src/parser.c:47:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	jmp	.L409	;
	.p2align 4,,10
	.p2align 3
.L446:
; src/parser.c:276:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:276:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC71(%rip), %rdi	;, tmp523
; src/parser.c:276:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp716, _232
; src/parser.c:276:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L444:
; src/parser.c:51:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:51:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC91(%rip), %rdi	;, tmp614
; src/parser.c:51:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp835, _35
; src/parser.c:51:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	xorl	%ecx, %ecx	; _368
.L512:
; src/parser.c:52:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	xorl	%esi, %esi	;
	xorl	%edx, %edx	;
	movl	$2, %edi	;,
	call	*create_code_member@GOTPCREL(%rip)	;
; src/parser.c:52:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	24(%rsp), %rdi	; %sfp,
; src/parser.c:52:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	%rax, %rsi	; tmp836, _36
; src/parser.c:52:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	jmp	.L409	;
	.p2align 4,,10
	.p2align 3
.L601:
; src/parser.c:178:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	32(%rsp), %rdi	; %sfp,
	call	*create_symbol_table@GOTPCREL(%rip)	;
; src/parser.c:179:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	40(%rsp), %rdx	; %sfp,
	movl	$3, %esi	;,
	movq	SELF_KEYWORD(%rip), %rdi	; SELF_KEYWORD,
	movq	%rax, %rcx	; method_scope,
; src/parser.c:178:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	%rax, %rbp	; tmp721, method_scope
; src/parser.c:179:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:180:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
; src/parser.c:179:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	%rax, %r14	; tmp722, self
; src/parser.c:180:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	8(%rsp), %r10	; %sfp, token
; src/parser.c:180:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp723, token
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	; token_375->type, _376
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	;, _376
	je	.L450	;,
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	;, _376
	jne	.L453	;,
	movq	%r10, 8(%rsp)	; token, %sfp
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%r12), %rdi	; token_375->lexeme, token_375->lexeme
	call	*is_builtin_type@GOTPCREL(%rip)	;
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	8(%rsp), %r10	; %sfp, token
	testb	%al, %al	; tmp725
	je	.L453	;,
.L450:
; src/parser.c:186:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%r12), %rsi	; token_375->lexeme, token_375->lexeme
	movq	32(%rsp), %rdi	; %sfp,
	movq	%r10, 8(%rsp)	; token, %sfp
	call	*search_name@GOTPCREL(%rip)	;
; src/parser.c:187:     if (return_type == NULL) {
	movq	8(%rsp), %r10	; %sfp, token
	testq	%rax, %rax	; return_type
; src/parser.c:186:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	%rax, 56(%rsp)	; return_type, %sfp
; src/parser.c:187:     if (return_type == NULL) {
	je	.L611	;,
	movq	%r10, 8(%rsp)	; token, %sfp
; src/parser.c:192:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:193:     if (token->type != IDENTIFIER) {
	movq	8(%rsp), %r10	; %sfp, token
	cmpl	$1, 24(%rax)	;, token_385->type
; src/parser.c:192:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp728, token
; src/parser.c:193:     if (token->type != IDENTIFIER) {
	jne	.L612	;,
	movq	%r10, 8(%rsp)	; token, %sfp
; src/parser.c:198:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/parser.c:200:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	(%r12), %rsi	; token_385->lexeme, token_385->lexeme
; src/parser.c:198:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movq	%rax, 88(%rsp)	; method, %sfp
	movq	%rax, %rbx	; tmp730, method
; src/parser.c:199:     method->method_scope = method_scope;
	movq	%rbp, 32(%rax)	; method_scope, method_389->method_scope
; src/parser.c:200:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	40(%rsp), %rax	; %sfp, name
	movq	8(%rax), %rdi	; name_225->name, name_225->name
	call	*make_method_name@GOTPCREL(%rip)	;
; src/parser.c:200:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	56(%rsp), %rdx	; %sfp,
	movq	%rbx, %rcx	; method,
	movl	$2, %esi	;,
; src/parser.c:200:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	%rax, %rdi	; tmp731, _392
; src/parser.c:200:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:201:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
; src/parser.c:200:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	%rax, 96(%rsp)	; tmp732, %sfp
; src/parser.c:201:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	8(%rsp), %r10	; %sfp, token
	cmpl	$5, 24(%rax)	;, token_394->type
; src/parser.c:201:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp733, token
; src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L457	;,
; src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_394->lexeme, token_394->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movq	%r10, 8(%rsp)	; token, %sfp
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	8(%rsp), %r10	; %sfp, token
	testb	%al, %al	; tmp735
	je	.L457	;,
; src/parser.c:207:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	8(%rsp), %r10	; %sfp, token
	cmpl	$6, 24(%rax)	;, token_401->type
; src/parser.c:207:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp736, token
; src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	je	.L458	;,
.L460:
	movq	%r10, 8(%rsp)	; token, %sfp
; src/parser.c:209:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:209:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC76(%rip), %rdi	;, tmp544
; src/parser.c:209:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp737, _407
; src/parser.c:209:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	movq	8(%rsp), %r10	; %sfp, token
.L459:
	movq	%r10, 104(%rsp)	; token, %sfp
; src/parser.c:210:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp739, token
; src/parser.c:211:     list(Variable*) parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:212:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	%r14, %rsi	; self,
	movq	40(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
; src/parser.c:211:     list(Variable*) parameters = create_list();
	movq	%rax, %r12	; tmp740, parameters
	movq	%rax, 80(%rsp)	; parameters, %sfp
; src/parser.c:223:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	leaq	.LC78(%rip), %r14	;, tmp636
; src/parser.c:212:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	call	*create_variable@GOTPCREL(%rip)	;
; src/parser.c:212:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	%r12, %rdi	; parameters,
; src/parser.c:225:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	leaq	.LC79(%rip), %r12	;, tmp635
; src/parser.c:212:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	%rax, %rsi	; tmp741, _410
; src/parser.c:212:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	call	*list_append@GOTPCREL(%rip)	;
	movq	%rbp, 8(%rsp)	; method_scope, %sfp
	movq	104(%rsp), %rbp	; %sfp, token
	.p2align 4,,10
	.p2align 3
.L461:
; src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_411->type
	je	.L613	;,
.L591:
	movq	%rbp, %r10	; token, token
.L465:
	movq	%r10, 8(%rsp)	; token, %sfp
; src/parser.c:218:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:218:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC77(%rip), %rdi	;, tmp550
; src/parser.c:218:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp745, _424
; src/parser.c:218:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	movq	8(%rsp), %r10	; %sfp, token
	jmp	.L452	;
	.p2align 4,,10
	.p2align 3
.L500:
; src/parser.c:316:     string init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
	movq	40(%rsp), %rax	; %sfp, name
	movq	%r10, 8(%rsp)	; token, %sfp
	movq	DEFAULT_INIT_NAME(%rip), %rsi	; DEFAULT_INIT_NAME,
	movq	8(%rax), %rdi	; name_225->name, name_225->name
	call	*make_method_name@GOTPCREL(%rip)	;
; src/parser.c:317:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	movq	32(%rsp), %rdi	; %sfp,
; src/parser.c:316:     string init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
	movq	%rax, %rbx	; tmp778, init_name
; src/parser.c:317:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	movq	%rax, %rsi	; init_name,
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
; src/parser.c:318:     if (init == NULL) {
	movq	8(%rsp), %r10	; %sfp, token
	testq	%rax, %rax	; init
; src/parser.c:317:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	movq	%rax, 56(%rsp)	; init, %sfp
; src/parser.c:318:     if (init == NULL) {
	je	.L614	;,
.L501:
; src/parser.c:330:     if (init->kind != SYMBOL_METHOD)
	movq	56(%rsp), %rax	; %sfp, init
	movq	%r10, 8(%rsp)	; token, %sfp
	cmpl	$2, 32(%rax)	;, init_301->kind
	jne	.L615	;,
.L502:
; src/parser.c:332:     string constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	40(%rsp), %r12	; %sfp, name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
	movq	8(%r12), %rdi	; name_225->name, name_225->name
	call	*make_method_name@GOTPCREL(%rip)	;
; src/parser.c:333:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %edi	;,
; src/parser.c:332:     string constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	%rax, %rbx	; tmp793, constructor_name
; src/parser.c:333:     Method* method = (Method*)alloc_memory(sizeof(Method));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/parser.c:334:     method->method_scope = create_symbol_table(class_scope);
	movq	32(%rsp), %rdi	; %sfp,
; src/parser.c:333:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movq	%rax, %rbp	; tmp794, method
; src/parser.c:334:     method->method_scope = create_symbol_table(class_scope);
	call	*create_symbol_table@GOTPCREL(%rip)	;
; src/parser.c:335:     Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
	movq	%r12, %rdx	; name,
	movq	%rbp, %rcx	; method,
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; constructor_name,
; src/parser.c:334:     method->method_scope = create_symbol_table(class_scope);
	movq	%rax, 32(%rbp)	; tmp795, method_309->method_scope
; src/parser.c:335:     Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, 80(%rsp)	; tmp796, %sfp
; src/parser.c:336:     list(Variable*) parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:337:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	%r12, %rdx	; name,
	movq	32(%rbp), %rcx	; method_309->method_scope, method_309->method_scope
	movq	SELF_KEYWORD(%rip), %rdi	; SELF_KEYWORD,
	movl	$3, %esi	;,
; src/parser.c:336:     list(Variable*) parameters = create_list();
	movq	%rax, %r14	; tmp797, parameters
; src/parser.c:337:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp798, self
; src/parser.c:338:     list(Variable*) init_params = list_copy(init->ast_node.method->parameters);
	movq	56(%rsp), %rax	; %sfp, init
	movq	24(%rax), %rax	; init_301->ast_node.method, init_301->ast_node.method
	movq	16(%rax), %rdi	; _316->parameters, _316->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp799, %sfp
	.p2align 4,,10
	.p2align 3
.L504:
; src/parser.c:340:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp802, param
; src/parser.c:340:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	testq	%rax, %rax	; param
	je	.L616	;,
; src/parser.c:341:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	movq	8(%rbx), %rax	; param_320->name, param_320->name
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	movq	8(%rax), %rdi	; _321->name, _321->name
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:341:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	testb	%al, %al	; tmp800
	jne	.L504	;,
; src/parser.c:342:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	8(%rbx), %rsi	; param_320->name, param_320->name
	movq	(%rbx), %rdi	; param_320->type, param_320->type
	xorl	%edx, %edx	;
	call	*create_variable@GOTPCREL(%rip)	;
; src/parser.c:342:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	%r14, %rdi	; parameters,
; src/parser.c:342:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	%rax, %rsi	; tmp801, _326
; src/parser.c:342:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L504	;
	.p2align 4,,10
	.p2align 3
.L616:
; src/parser.c:344:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:345:     list(ClassMember*) ms = list_copy(members);
	movq	48(%rsp), %rdi	; %sfp,
; src/parser.c:344:     list(Statement*) body = create_list();
	movq	%rax, 8(%rsp)	; tmp803, %sfp
; src/parser.c:345:     list(ClassMember*) ms = list_copy(members);
	call	*list_copy@GOTPCREL(%rip)	;
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	movq	%r12, %rdx	; self,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
; src/parser.c:345:     list(ClassMember*) ms = list_copy(members);
	movq	%rax, %rbx	; tmp804, ms
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$8, %edi	;,
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %r8	;, tmp805
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %rdx	; tmp806, _330
.L595:
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	call	*create_expression@GOTPCREL(%rip)	;
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	xorl	%r9d, %r9d	;
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	%rax, %r8	;, tmp816
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	call	*create_statement@GOTPCREL(%rip)	;
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	8(%rsp), %rdi	; %sfp,
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	%rax, %rsi	; tmp817, _349
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L507	;
	.p2align 4,,10
	.p2align 3
.L509:
; src/parser.c:349:         if (mb->type == CLASS_VARIABLE) {
	cmpl	$1, 8(%r9)	;, mb_333->type
	je	.L617	;,
.L507:
; src/parser.c:348:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	movq	%rbx, %rdi	; ms,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r9	; tmp818, mb
; src/parser.c:348:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	testq	%rax, %rax	; mb
	jne	.L509	;,
; src/parser.c:355:     list(Expression*) args = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	%r12, %rdx	; self,
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
; src/parser.c:355:     list(Expression*) args = create_list();
	movq	%rax, %rbx	; tmp819, args
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	%rax, %r8	;, tmp820
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	%rax, %rdx	; tmp821, _352
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	call	*create_expression@GOTPCREL(%rip)	;
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	%rbx, %rdi	; args,
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	%rax, %rsi	; tmp822, _353
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:357:     list(Variable*) params = list_copy(parameters);
	movq	%r14, %rdi	; parameters,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp823, params
; src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	jmp	.L510	;
	.p2align 4,,10
	.p2align 3
.L511:
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	8(%rax), %rdx	; param_355->name, param_355->name
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rax, %r8	;, tmp824
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
	xorl	%ecx, %ecx	;
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rax, %rdx	; tmp825, _358
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	call	*create_expression@GOTPCREL(%rip)	;
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rbx, %rdi	; args,
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rax, %rsi	; tmp826, _359
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	call	*list_append@GOTPCREL(%rip)	;
.L510:
; src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	movq	%r12, %rdi	; params,
	call	*list_pop@GOTPCREL(%rip)	;
; src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	testq	%rax, %rax	; param
	jne	.L511	;,
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	56(%rsp), %rdx	; %sfp,
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rbx, %r8	; args,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %rsi	; tmp828, _360
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movl	$1, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %r8	;, tmp829
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %rdx	; tmp830, _362
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	call	*create_expression@GOTPCREL(%rip)	;
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%r9d, %r9d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %r8	;, tmp831
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%esi, %esi	;
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	8(%rsp), %rbx	; %sfp, body
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %rsi	; tmp832, _364
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rbx, %rdi	; body,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:361:     create_method_use_ptr(method, constructor, name, parameters, body, method->method_scope);
	movq	%r14, %rcx	; parameters,
	movq	40(%rsp), %r14	; %sfp, name
	movq	%rbx, %r8	; body,
	movq	32(%rbp), %r9	; method_309->method_scope,
	movq	80(%rsp), %rsi	; %sfp,
	movq	%rbp, %rdi	; method,
	movq	%r14, %rdx	; name,
	call	*create_method_use_ptr@GOTPCREL(%rip)	;
; src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; method,
	xorl	%edi, %edi	;
	call	*create_class_member@GOTPCREL(%rip)	;
; src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	48(%rsp), %rbx	; %sfp, members
; src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rsi	; tmp833, _366
; src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rbx, %rdi	; members,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:364:     return create_class_use_ptr(class, name, members, class_scope, size);
	movq	32(%rsp), %rcx	; %sfp,
	movq	%rbx, %rdx	; members,
	movq	%r14, %rsi	; name,
	movq	72(%rsp), %r8	; %sfp,
	movq	64(%rsp), %rdi	; %sfp,
	call	*create_class_use_ptr@GOTPCREL(%rip)	;
	movq	%rax, %rcx	; tmp834, _368
; src/parser.c:50:             if (class == NULL)
	testq	%rax, %rax	; _368
	jne	.L512	;,
	jmp	.L444	;
	.p2align 4,,10
	.p2align 3
.L617:
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	(%r9), %rax	; mb_333->content.variable, mb_333->content.variable
	movq	%r9, 96(%rsp)	; mb, %sfp
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	movq	%r12, %rdx	; self,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	movq	8(%rax), %rax	; _336->name, _337
	movq	%rax, 88(%rsp)	; _337, %sfp
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	88(%rsp), %rdx	; %sfp,
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	%rax, %rsi	; tmp809, _338
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movl	$2, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	%rax, %r8	;, tmp810
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	%rax, %rdx	; tmp811, _340
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	call	*create_expression@GOTPCREL(%rip)	;
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	96(%rsp), %r9	; %sfp, mb
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	%rax, %r10	; tmp812, left
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	(%r9), %rax	; mb_333->content.variable, mb_333->content.variable
	movq	16(%rax), %rcx	; _342->value, _343
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	testq	%rcx, %rcx	; _343
	je	.L618	;,
.L508:
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	xorl	%edx, %edx	;
	movq	%r10, %rsi	; left,
	movl	$13, %edi	;,
	jmp	.L595	;
	.p2align 4,,10
	.p2align 3
.L495:
; src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	(%rax), %rdi	; token_268->lexeme, token_268->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; tmp774
	je	.L497	;,
	jmp	.L496	;
	.p2align 4,,10
	.p2align 3
.L603:
; src/parser.c:299:                 Symbol* type = member->content.variable->type;
	movq	0(%rbp), %rax	; member_252->content.variable, member_252->content.variable
	movq	(%rax), %rax	; _254->type, type
; src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	name_int(%rip), %rax	; name_int, type
	je	.L594	;,
; src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	name_float(%rip), %rax	; name_float, type
	je	.L594	;,
; src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	name_string(%rip), %rax	; name_string, type
	je	.L594	;,
; src/parser.c:302:                 else if (type == name_bool || type == name_void)
	cmpq	name_bool(%rip), %rax	; name_bool, type
	je	.L492	;,
; src/parser.c:302:                 else if (type == name_bool || type == name_void)
	cmpq	name_void(%rip), %rax	; name_void, type
	je	.L492	;,
; src/parser.c:304:                 else if (type->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	; type_255->kind,
	testl	%eax, %eax	;
	je	.L594	;,
; src/parser.c:307:                     parser_error("Unsupported type for class variable", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:307:                     parser_error("Unsupported type for class variable", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC86(%rip), %rdi	;, tmp581
; src/parser.c:307:                     parser_error("Unsupported type for class variable", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp771, _267
; src/parser.c:307:                     parser_error("Unsupported type for class variable", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L491	;
	.p2align 4,,10
	.p2align 3
.L594:
; src/parser.c:305:                     size += 8;  // pointer to object
	addq	$8, 72(%rsp)	;, %sfp
	jmp	.L491	;
	.p2align 4,,10
	.p2align 3
.L599:
; src/parser.c:267:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:267:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC70(%rip), %rdi	;, tmp520
; src/parser.c:267:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp712, _222
; src/parser.c:267:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L444	;
	.p2align 4,,10
	.p2align 3
.L604:
; src/parser.c:65:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:65:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC53(%rip), %rdi	;, tmp461
; src/parser.c:65:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp655, _104
; src/parser.c:65:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L401:
; src/parser.c:41:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:41:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	(%rsp), %rsi	; %sfp,
	leaq	.LC57(%rip), %rdi	;, tmp475
; src/parser.c:41:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp667, _21
; src/parser.c:41:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	xorl	%esi, %esi	; _132
	jmp	.L408	;
	.p2align 4,,10
	.p2align 3
.L615:
; src/parser.c:331:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:331:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC89(%rip), %rdi	;, tmp596
; src/parser.c:331:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp792, _304
; src/parser.c:331:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L502	;
	.p2align 4,,10
	.p2align 3
.L406:
; src/parser.c:83:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:83:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC55(%rip), %rdi	;, tmp467
; src/parser.c:83:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp661, _123
; src/parser.c:83:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L401	;
	.p2align 4,,10
	.p2align 3
.L418:
; src/parser.c:123:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:123:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC61(%rip), %rdi	;, tmp488
; src/parser.c:123:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp681, _158
; src/parser.c:123:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L413	;
	.p2align 4,,10
	.p2align 3
.L457:
	movq	%r10, 8(%rsp)	; token, %sfp
; src/parser.c:203:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:203:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC75(%rip), %rdi	;, tmp540
; src/parser.c:203:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp734, _400
; src/parser.c:203:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	movq	8(%rsp), %r10	; %sfp, token
.L452:
	movq	%r10, 8(%rsp)	; token, %sfp
; src/parser.c:287:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:287:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC84(%rip), %rdi	;, tmp574
; src/parser.c:287:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp764, _242
; src/parser.c:287:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	xorl	%esi, %esi	; _464
.L485:
; src/parser.c:288:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%edi, %edi	;
	xorl	%edx, %edx	;
	call	*create_class_member@GOTPCREL(%rip)	;
; src/parser.c:288:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	48(%rsp), %rdi	; %sfp,
; src/parser.c:288:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rsi	; tmp765, _243
; src/parser.c:288:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	jmp	.L496	;
	.p2align 4,,10
	.p2align 3
.L609:
; src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rbx), %rdi	; token_164->lexeme, token_164->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp693
	je	.L427	;,
; src/parser.c:146:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_185->type
; src/parser.c:146:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp694, token
; src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L429	;,
; src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_185->lexeme, token_185->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp696
	je	.L429	;,
; src/parser.c:152:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:153:     parser->in_function = true;
	movb	$1, 8(%r13)	;, parser_74(D)->in_function
; src/parser.c:155:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
; src/parser.c:152:     list(Statement*) body = create_list();
	movq	%rax, 56(%rsp)	; tmp697, %sfp
; src/parser.c:155:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp698, token
; src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L430	;
	.p2align 4,,10
	.p2align 3
.L433:
; src/parser.c:163:             have_return = true;
	cmpl	$5, 8(%r14)	;, statement_194->type
	movl	$1, %eax	;, tmp889
	cmove	%eax, %ebp	; have_return,, tmp889, have_return
.L434:
; src/parser.c:164:         list_append(body, (pointer)statement);
	movq	56(%rsp), %rdi	; %sfp,
	movq	%r14, %rsi	; statement,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:165:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp702, token
.L430:
; src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_197->type
	jne	.L435	;,
; src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%rbx), %rdi	; token_197->lexeme, token_197->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp703
	jne	.L619	;,
.L435:
; src/parser.c:157:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	%r12, %rsi	; function_scope,
	movq	%r15, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %r14	; tmp699, statement
; src/parser.c:158:         if (statement == NULL)
	testq	%rax, %rax	; statement
	je	.L620	;,
; src/parser.c:160:         else if (have_return)
	testb	%bpl, %bpl	; have_return
	je	.L433	;,
; src/parser.c:161:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:161:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC67(%rip), %rdi	;,
; src/parser.c:161:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp701, _200
; src/parser.c:161:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L433	;
	.p2align 4,,10
	.p2align 3
.L422:
; src/parser.c:136:             list_append(parameters, (pointer)parameter);
	movq	32(%rsp), %rdi	; %sfp,
	movq	%rax, %rsi	; parameter,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L421	;
	.p2align 4,,10
	.p2align 3
.L423:
; src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	(%rax), %rdi	; token_168->lexeme, token_168->lexeme
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	; tmp690
	jne	.L621	;,
; src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_168->type
	jne	.L426	;,
; src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rbx), %rdi	; token_168->lexeme, token_168->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp692
	jne	.L419	;,
	jmp	.L426	;
	.p2align 4,,10
	.p2align 3
.L613:
; src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rbx), %rdi	; token_411->lexeme, token_411->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp751
	jne	.L622	;,
; src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_411->type
	jne	.L591	;,
; src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	(%rbx), %rdi	; token_411->lexeme, token_411->lexeme
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	; tmp742
	je	.L623	;,
; src/parser.c:215:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:221:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	8(%rsp), %rsi	; %sfp,
	movq	%r13, %rdx	; parser,
	movq	%r15, %rdi	; lexer,
; src/parser.c:215:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp743, token
; src/parser.c:221:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	call	parse_variable	;
; src/parser.c:222:         if (parameter == NULL)
	testq	%rax, %rax	; parameter
	je	.L624	;,
; src/parser.c:224:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	;, parameter_417->value
	je	.L471	;,
; src/parser.c:225:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:225:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	movq	%r12, %rdi	; tmp635,
; src/parser.c:225:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp749, _429
; src/parser.c:225:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
.L470:
; src/parser.c:228:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp750, token
	jmp	.L461	;
	.p2align 4,,10
	.p2align 3
.L471:
; src/parser.c:227:             list_append(parameters, (pointer)parameter);
	movq	80(%rsp), %rdi	; %sfp,
	movq	%rax, %rsi	; parameter,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L470	;
	.p2align 4,,10
	.p2align 3
.L610:
; src/parser.c:132:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:132:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC62(%rip), %rdi	;,
; src/parser.c:132:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp686, _163
; src/parser.c:132:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L421	;
	.p2align 4,,10
	.p2align 3
.L624:
; src/parser.c:223:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:223:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	movq	%r14, %rdi	; tmp636,
; src/parser.c:223:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp748, _426
; src/parser.c:223:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L470	;
	.p2align 4,,10
	.p2align 3
.L596:
; src/parser.c:24:         builtin_scope = create_symbol_table(NULL);
	xorl	%edi, %edi	;
	call	*create_symbol_table@GOTPCREL(%rip)	;
; src/parser.c:25:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	VOID_KEYWORD(%rip), %rdi	; VOID_KEYWORD,
	xorl	%edx, %edx	;
	movl	$6, %esi	;,
; src/parser.c:24:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, %rcx	; tmp644, _2
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
	movq	%rax, name_void(%rip)	; tmp645, name_void
; src/parser.c:26:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:27:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rcx	; builtin_scope,
	xorl	%edx, %edx	;
	movq	FLOAT_KEYWORD(%rip), %rdi	; FLOAT_KEYWORD,
	movl	$6, %esi	;,
; src/parser.c:26:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_int(%rip)	; tmp646, name_int
; src/parser.c:27:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:28:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rcx	; builtin_scope,
	xorl	%edx, %edx	;
	movq	STRING_KEYWORD(%rip), %rdi	; STRING_KEYWORD,
	movl	$6, %esi	;,
; src/parser.c:27:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_float(%rip)	; tmp647, name_float
; src/parser.c:28:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:29:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rcx	; builtin_scope,
	xorl	%edx, %edx	;
	movq	BOOL_KEYWORD(%rip), %rdi	; BOOL_KEYWORD,
; src/parser.c:28:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_string(%rip)	; tmp648, name_string
; src/parser.c:29:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movl	$6, %esi	;,
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:29:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_bool(%rip)	; tmp649, name_bool
	jmp	.L395	;
	.p2align 4,,10
	.p2align 3
.L414:
; src/parser.c:102:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:102:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC58(%rip), %rdi	;, tmp479
; src/parser.c:102:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp672, _140
; src/parser.c:102:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L413	;
	.p2align 4,,10
	.p2align 3
.L453:
	movq	%r10, 8(%rsp)	; token, %sfp
; src/parser.c:182:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:182:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC72(%rip), %rdi	;, tmp530
; src/parser.c:182:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp724, _380
; src/parser.c:182:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	movq	8(%rsp), %r10	; %sfp, token
	jmp	.L452	;
	.p2align 4,,10
	.p2align 3
.L602:
; src/parser.c:295:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:295:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC85(%rip), %rdi	;, tmp578
; src/parser.c:295:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp769, _251
; src/parser.c:295:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L487	;
	.p2align 4,,10
	.p2align 3
.L621:
; src/parser.c:139:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp691, token
; src/parser.c:139:             token = get_next_token(lexer, true);
	jmp	.L419	;
.L608:
; src/parser.c:114:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:114:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC60(%rip), %rdi	;, tmp485
; src/parser.c:114:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp677, _148
; src/parser.c:114:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L413	;
.L612:
; src/parser.c:194:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:194:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC74(%rip), %rdi	;, tmp536
; src/parser.c:194:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp729, _388
; src/parser.c:194:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	movq	8(%rsp), %r10	; %sfp, token
	jmp	.L452	;
.L605:
; src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	(%r12), %rdi	; token_106->lexeme, token_106->lexeme
	movq	FROM_KEYWORD(%rip), %rsi	; FROM_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	testb	%al, %al	; tmp657
	jne	.L403	;,
.L593:
; src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movl	24(%r12), %eax	;, _107
	jmp	.L402	;
.L623:
; src/parser.c:216:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, 24(%rbx)	;, token_411->type
	movq	%rbp, %r10	; token, token
	movq	8(%rsp), %rbp	; %sfp, method_scope
	jne	.L465	;,
; src/parser.c:216:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	(%rbx), %rdi	; token_411->lexeme, token_411->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	%r10, 8(%rsp)	; token, %sfp
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:216:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	8(%rsp), %r10	; %sfp, token
	testb	%al, %al	; tmp746
	je	.L465	;,
.L473:
	movq	%r10, 8(%rsp)	; token, %sfp
; src/parser.c:230:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	8(%rsp), %r10	; %sfp, token
	cmpl	$5, 24(%rax)	;, token_435->type
; src/parser.c:230:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp747, token
; src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L468	;,
; src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_435->lexeme, token_435->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	%r10, 8(%rsp)	; token, %sfp
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	8(%rsp), %r10	; %sfp, token
	testb	%al, %al	; tmp753
	je	.L468	;,
	movq	%r10, 104(%rsp)	; token, %sfp
; src/parser.c:239:     bool have_return = false;
	xorl	%r12d, %r12d	; have_return
; src/parser.c:236:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:237:     parser->in_function = true;
	movl	$257, %ecx	;,
; src/parser.c:240:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
; src/parser.c:236:     list(Statement*) body = create_list();
	movq	%rax, 8(%rsp)	; tmp754, %sfp
; src/parser.c:237:     parser->in_function = true;
	movw	%cx, 8(%r13)	;, MEM <vector(2) char> [(char *)parser_74(D) + 8B]
; src/parser.c:240:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp755, token
; src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L474	;
	.p2align 4,,10
	.p2align 3
.L477:
; src/parser.c:248:             have_return = true;
	cmpl	$5, 8(%r14)	;, statement_444->type
	movl	$1, %eax	;, tmp899
	cmove	%eax, %r12d	; have_return,, tmp899, have_return
.L478:
; src/parser.c:249:         list_append(body, (pointer)statement);
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r14, %rsi	; statement,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:250:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp759, token
.L474:
; src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_447->type
	jne	.L479	;,
; src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%rbx), %rdi	; token_447->lexeme, token_447->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp760
	jne	.L625	;,
.L479:
; src/parser.c:242:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	%rbp, %rsi	; method_scope,
	movq	%r15, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %r14	; tmp756, statement
; src/parser.c:243:         if (statement == NULL)
	testq	%rax, %rax	; statement
	je	.L626	;,
; src/parser.c:245:         else if (have_return)
	testb	%r12b, %r12b	; have_return
	je	.L477	;,
; src/parser.c:246:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:246:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC67(%rip), %rdi	;,
; src/parser.c:246:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp758, _450
; src/parser.c:246:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L477	;
.L614:
; src/parser.c:319:         Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/parser.c:320:         method->method_scope = create_symbol_table(class_scope);
	movq	32(%rsp), %rdi	; %sfp,
; src/parser.c:319:         Method* method = (Method*)alloc_memory(sizeof(Method));
	movq	%rax, %rbp	; tmp780, method
; src/parser.c:320:         method->method_scope = create_symbol_table(class_scope);
	call	*create_symbol_table@GOTPCREL(%rip)	;
; src/parser.c:321:         init = create_symbol(init_name, SYMBOL_METHOD, name, method);
	movq	40(%rsp), %r14	; %sfp, name
	movq	%rbx, %rdi	; init_name,
	movq	%rbp, %rcx	; method,
	movl	$2, %esi	;,
; src/parser.c:320:         method->method_scope = create_symbol_table(class_scope);
	movq	%rax, 32(%rbp)	; tmp781, method_286->method_scope
; src/parser.c:321:         init = create_symbol(init_name, SYMBOL_METHOD, name, method);
	movq	%r14, %rdx	; name,
; src/parser.c:323:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	%r14, %rbx	; name, name
; src/parser.c:321:         init = create_symbol(init_name, SYMBOL_METHOD, name, method);
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, 56(%rsp)	; tmp782, %sfp
; src/parser.c:322:         list(Variable*) parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:323:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	32(%rbp), %rcx	; method_286->method_scope, method_286->method_scope
	movq	%r14, %rdx	; name,
	movq	SELF_KEYWORD(%rip), %rdi	; SELF_KEYWORD,
; src/parser.c:322:         list(Variable*) parameters = create_list();
	movq	%rax, %r12	; tmp783, parameters
; src/parser.c:323:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movl	$3, %esi	;,
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:324:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	xorl	%edx, %edx	;
	movq	%rbx, %rdi	; name,
	movq	%rbx, 40(%rsp)	; name, %sfp
; src/parser.c:323:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	%rax, %r14	; tmp784, self
; src/parser.c:324:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	%rax, %rsi	; self,
	call	*create_variable@GOTPCREL(%rip)	;
; src/parser.c:324:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	%r12, %rdi	; parameters,
; src/parser.c:324:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	%rax, %rsi	; tmp785, _293
; src/parser.c:324:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:325:         list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	movq	%r14, %rdx	; self,
; src/parser.c:325:         list(Statement*) body = create_list();
	movq	%rax, %rbx	; tmp786, body
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %r8	;, tmp787
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %rdx	; tmp788, _296
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	*create_expression@GOTPCREL(%rip)	;
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r9d, %r9d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %r8	;, tmp789
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%esi, %esi	;
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rbx, %rdi	; body,
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %rsi	; tmp790, _298
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:327:         create_method_use_ptr(method, init, name, parameters, body, method->method_scope);
	movq	32(%rbp), %r9	; method_286->method_scope,
	movq	%rbx, %r8	; body,
	movq	%r12, %rcx	; parameters,
	movq	40(%rsp), %rdx	; %sfp,
	movq	56(%rsp), %rsi	; %sfp,
	movq	%rbp, %rdi	; method,
	call	*create_method_use_ptr@GOTPCREL(%rip)	;
; src/parser.c:328:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; method,
	xorl	%edi, %edi	;
	call	*create_class_member@GOTPCREL(%rip)	;
; src/parser.c:328:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	48(%rsp), %rdi	; %sfp,
; src/parser.c:328:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rsi	; tmp791, _300
; src/parser.c:328:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	*list_append@GOTPCREL(%rip)	;
	movq	8(%rsp), %r10	; %sfp, token
	jmp	.L501	;
.L468:
	movq	%r10, 8(%rsp)	; token, %sfp
; src/parser.c:232:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:232:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC80(%rip), %rdi	;, tmp560
; src/parser.c:232:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp752, _441
; src/parser.c:232:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	movq	8(%rsp), %r10	; %sfp, token
	jmp	.L452	;
.L492:
; src/parser.c:303:                     size += 1;
	addq	$1, 72(%rsp)	;, %sfp
	jmp	.L491	;
	.p2align 4,,10
	.p2align 3
.L626:
; src/parser.c:244:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:244:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC82(%rip), %rdi	;,
; src/parser.c:244:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp757, _446
; src/parser.c:244:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L478	;
.L618:
	movq	%r10, 88(%rsp)	; left, %sfp
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movl	$2, %esi	;,
	leaq	.LC90(%rip), %rdi	;, tmp610
	call	*create_string@GOTPCREL(%rip)	;
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	%rax, %rsi	; tmp813, _344
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	xorl	%edi, %edi	;
	call	*create_primary@GOTPCREL(%rip)	;
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	%rax, %rdx	; tmp814, _345
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	call	*create_expression@GOTPCREL(%rip)	;
	movq	88(%rsp), %r10	; %sfp, left
	movq	%rax, %rcx	; tmp815, _343
	jmp	.L508	;
.L458:
; src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	(%rax), %rdi	; token_401->lexeme, token_401->lexeme
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	movq	%r10, 8(%rsp)	; token, %sfp
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	8(%rsp), %r10	; %sfp, token
	testb	%al, %al	; tmp738
	je	.L460	;,
	jmp	.L459	;
.L625:
; src/parser.c:252:     parser->in_function = false;
	xorl	%edx, %edx	;
	movq	104(%rsp), %r10	; %sfp, token
	movw	%dx, 8(%r13)	;, MEM <vector(2) char> [(char *)parser_74(D) + 8B]
; src/parser.c:254:     if (!have_return && return_type != name_void)
	testb	%r12b, %r12b	; have_return
	jne	.L481	;,
; src/parser.c:254:     if (!have_return && return_type != name_void)
	movq	56(%rsp), %rax	; %sfp, return_type
	cmpq	name_void(%rip), %rax	; name_void, return_type
	je	.L483	;,
	movq	%r10, 104(%rsp)	; token, %sfp
; src/parser.c:255:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:255:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC83(%rip), %rdi	;, tmp572
; src/parser.c:255:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp762, _460
; src/parser.c:255:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:256:     if (!have_return && return_type == name_void)
	movq	56(%rsp), %rax	; %sfp, return_type
	movq	104(%rsp), %r10	; %sfp, token
	cmpq	name_void(%rip), %rax	; name_void, return_type
	je	.L483	;,
.L481:
	movq	%r10, 104(%rsp)	; token, %sfp
; src/parser.c:259:     return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
	movq	96(%rsp), %rsi	; %sfp,
	movq	%rbp, %r9	; method_scope,
	movq	8(%rsp), %r8	; %sfp,
	movq	80(%rsp), %rcx	; %sfp,
	movq	56(%rsp), %rdx	; %sfp,
	movq	88(%rsp), %rdi	; %sfp,
	call	*create_method_use_ptr@GOTPCREL(%rip)	;
; src/parser.c:286:             if (method == NULL)
	movq	104(%rsp), %r10	; %sfp, token
	testq	%rax, %rax	; _464
; src/parser.c:259:     return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
	movq	%rax, %rsi	; tmp763, _464
; src/parser.c:286:             if (method == NULL)
	jne	.L485	;,
	jmp	.L452	;
	.p2align 4,,10
	.p2align 3
.L606:
; src/parser.c:90:         parser_error("Failed to import module", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:90:         parser_error("Failed to import module", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC56(%rip), %rdi	;, tmp472
; src/parser.c:90:         parser_error("Failed to import module", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp664, _128
; src/parser.c:90:         parser_error("Failed to import module", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:91:         name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
	movq	%rbp, %rdi	; import_name,
	movq	16(%rsp), %rcx	; %sfp,
	movq	name_void(%rip), %rdx	; name_void,
	movl	$3, %esi	;,
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp665, name
	jmp	.L407	;
.L607:
; src/parser.c:108:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:108:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC59(%rip), %rdi	;, tmp483
; src/parser.c:108:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp675, _144
; src/parser.c:108:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L413	;
.L611:
; src/parser.c:188:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:188:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC73(%rip), %rdi	;, tmp534
; src/parser.c:188:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp727, _384
; src/parser.c:188:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	movq	8(%rsp), %r10	; %sfp, token
	jmp	.L452	;
.L403:
; src/parser.c:73:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:74:         if (token->type != STRING) {
	cmpl	$4, 24(%rax)	;, token_111->type
; src/parser.c:73:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp658, token
; src/parser.c:74:         if (token->type != STRING) {
	jne	.L627	;,
; src/parser.c:79:         source = token->lexeme;
	movq	(%rax), %rbx	; token_111->lexeme, source
; src/parser.c:80:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp660, token
	jmp	.L593	;
.L620:
; src/parser.c:159:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:159:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC66(%rip), %rdi	;,
; src/parser.c:159:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp700, _196
; src/parser.c:159:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L434	;
.L622:
	movq	%rbp, %r10	; token, token
	movq	8(%rsp), %rbp	; %sfp, method_scope
	jmp	.L473	;
.L619:
; src/parser.c:167:     parser->in_function = false;
	movb	$0, 8(%r13)	;, parser_74(D)->in_function
; src/parser.c:168:     if (!have_return && return_type != name_void)
	testb	%bpl, %bpl	; have_return
	jne	.L437	;,
; src/parser.c:168:     if (!have_return && return_type != name_void)
	movq	8(%rsp), %rax	; %sfp, return_type
	cmpq	name_void(%rip), %rax	; name_void, return_type
	je	.L439	;,
; src/parser.c:169:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:169:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC68(%rip), %rdi	;, tmp514
; src/parser.c:169:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp705, _210
; src/parser.c:169:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:170:     if (!have_return && return_type == name_void)
	movq	8(%rsp), %rax	; %sfp, return_type
	cmpq	name_void(%rip), %rax	; name_void, return_type
	je	.L439	;,
.L437:
; src/parser.c:173:     return create_function_use_ptr(function, name, return_type, parameters, body, function_scope);
	movq	8(%rsp), %rdx	; %sfp,
	movq	56(%rsp), %r8	; %sfp,
	movq	%r12, %r9	; function_scope,
	movq	32(%rsp), %rcx	; %sfp,
	movq	48(%rsp), %rsi	; %sfp,
	movq	40(%rsp), %rdi	; %sfp,
	call	*create_function_use_ptr@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp706, _214
; src/parser.c:45:             if (function == NULL)
	testq	%rax, %rax	; _214
	jne	.L441	;,
	jmp	.L413	;
	.p2align 4,,10
	.p2align 3
.L429:
; src/parser.c:148:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:148:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC65(%rip), %rdi	;, tmp504
; src/parser.c:148:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp695, _191
; src/parser.c:148:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L413	;
.L627:
; src/parser.c:75:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
; src/parser.c:75:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC54(%rip), %rdi	;, tmp465
; src/parser.c:75:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rax, %rdx	; tmp659, _114
; src/parser.c:75:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L401	;
.L483:
	movq	%r10, 104(%rsp)	; token, %sfp
; src/parser.c:257:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
; src/parser.c:257:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	8(%rsp), %rdi	; %sfp,
; src/parser.c:257:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	%rax, %rsi	; tmp761, _463
; src/parser.c:257:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	call	*list_append@GOTPCREL(%rip)	;
	movq	104(%rsp), %r10	; %sfp, token
	jmp	.L481	;
.L439:
; src/parser.c:171:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	xorl	%esi, %esi	;
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
; src/parser.c:171:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	56(%rsp), %rdi	; %sfp,
; src/parser.c:171:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	%rax, %rsi	; tmp704, _213
; src/parser.c:171:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L437	;
	.size	parse_code, .-parse_code
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
