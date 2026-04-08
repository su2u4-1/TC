	.file	"parser.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Failed to parse right operand"
	.text
	.type	parse_expr_prec, @function
parse_expr_prec:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$40, %rsp	;,
	movq	%rdi, %r12	; tmp122, lexer
	movq	%rsi, 8(%rsp)	; tmp123, %sfp
	movl	%edx, 28(%rsp)	; tmp124, %sfp
	movq	%rcx, 16(%rsp)	; tmp125, %sfp
	movq	%r8, %r15	; tmp126, parser
; src/parser.c:650:     token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	call	*peek_next_token@GOTPCREL(%rip)	;
; src/parser.c:651:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;, token_26->type
	je	.L7	;,
	movq	8(%rsp), %rbp	; %sfp, <retval>
	jmp	.L2	;
.L15:
; src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	(%r15), %rdi	; parser_37(D)->source_file, parser_37(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp132, _6
; src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC0(%rip), %rdi	;, tmp115
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:662:             return NULL;
	jmp	.L1	;
.L13:
; src/parser.c:676:             token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r12, %rdi	; lexer,
	call	*peek_next_token@GOTPCREL(%rip)	;
; src/parser.c:666:         while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;, token_51->type
	jne	.L5	;,
.L6:
; src/parser.c:667:             OperatorType next_op = string_to_operator(token->lexeme);
	movq	(%rax), %rdi	; token_69->lexeme, token_69->lexeme
	call	*string_to_operator@GOTPCREL(%rip)	;
	movl	%eax, %ebx	; tmp135, next_op
; src/parser.c:668:             int next_prec = operator_precedence(next_op);
	movl	%eax, %edi	; next_op,
	call	*operator_precedence@GOTPCREL(%rip)	;
; src/parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %ebx	;, next_op
	je	.L5	;,
	cmpl	%eax, %r13d	; next_prec, op_prec
	jge	.L5	;,
; src/parser.c:671:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	%r15, %r8	; parser,
	movq	16(%rsp), %rcx	; %sfp,
	movl	%eax, %edx	; next_prec,
	movq	%rbp, %rsi	; <retval>,
	movq	%r12, %rdi	; lexer,
	call	parse_expr_prec	;
	movq	%rax, %rbp	; tmp137, <retval>
; src/parser.c:672:             if (right == NULL) {
	testq	%rax, %rax	; <retval>
	jne	.L13	;,
	jmp	.L1	;
.L5:
; src/parser.c:678:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rbp, %rcx	; <retval>,
	movl	$0, %edx	;,
	movq	8(%rsp), %rsi	; %sfp,
	movl	%r14d, %edi	; op,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp139, %sfp
; src/parser.c:679:         token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r12, %rdi	; lexer,
	call	*peek_next_token@GOTPCREL(%rip)	;
; src/parser.c:651:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;, token_55->type
	jne	.L14	;,
.L7:
; src/parser.c:652:         OperatorType op = string_to_operator(token->lexeme);
	movq	(%rax), %rdi	; token_70->lexeme, token_70->lexeme
	call	*string_to_operator@GOTPCREL(%rip)	;
	movl	%eax, %r14d	; tmp128, op
; src/parser.c:653:         int op_prec = operator_precedence(op);
	movl	%eax, %edi	; op,
	call	*operator_precedence@GOTPCREL(%rip)	;
	movl	%eax, %r13d	; tmp129, op_prec
; src/parser.c:654:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, %r14d	;, op
	je	.L9	;,
	movl	28(%rsp), %eax	; %sfp, min_prec
	cmpl	%eax, %r13d	; min_prec, op_prec
	jl	.L9	;,
; src/parser.c:656:         token = get_next_token(lexer, true);  // consume operator
	movl	$1, %esi	;,
	movq	%r12, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:657:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r12, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp130, token
; src/parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	%r15, %rdx	; parser,
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r12, %rdi	; lexer,
	call	parse_primary	;
	movq	%rax, %rbp	; tmp131, <retval>
; src/parser.c:659:         if (right_primary == NULL) {
	testq	%rax, %rax	; <retval>
	je	.L15	;,
; src/parser.c:664:         Expression* right = create_expression(OP_NONE, NULL, right_primary, NULL);
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; <retval>,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp133, <retval>
; src/parser.c:665:         token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r12, %rdi	; lexer,
	call	*peek_next_token@GOTPCREL(%rip)	;
; src/parser.c:666:         while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;, token_43->type
	je	.L6	;,
	jmp	.L5	;
.L14:
	movq	8(%rsp), %rbp	; %sfp, <retval>
	jmp	.L2	;
.L9:
	movq	8(%rsp), %rbp	; %sfp, <retval>
.L2:
; src/parser.c:681:     token = peek_current_token(lexer);
	movq	%r12, %rdi	; lexer,
	call	*peek_current_token@GOTPCREL(%rip)	;
.L1:
; src/parser.c:684: }
	movq	%rbp, %rax	; <retval>,
	addq	$40, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	parse_expr_prec, .-parse_expr_prec
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Failed to parse expression primary"
	.text
	.type	parse_expression, @function
parse_expression:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbp	; tmp93, lexer
	movq	%rsi, %r13	; tmp94, now_scope
	movq	%rdx, %r12	; tmp95, parser
; src/parser.c:687:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
	movq	%rax, %rbx	; tmp96, <retval>
; src/parser.c:688:     if (left_primary == NULL) {
	testq	%rax, %rax	; <retval>
	je	.L20	;,
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; <retval>,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp99, _4
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%r12, %r8	; parser,
	movq	%r13, %rcx	; now_scope,
	movl	$0, %edx	;,
	movq	%rbp, %rdi	; lexer,
	call	parse_expr_prec	;
	movq	%rax, %rbx	; tmp100, <retval>
.L16:
; src/parser.c:695: }
	movq	%rbx, %rax	; <retval>,
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L20:
; src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_10(D)->source_file, parser_10(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp97, _2
; src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbp, %rdi	; lexer,
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp98, _3
; src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%r12, %rdx	; _2,
	leaq	.LC1(%rip), %rdi	;, tmp91
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:691:         return NULL;
	jmp	.L16	;
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
	.type	parse_variable, @function
parse_variable:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
	movq	%rdi, %rbx	; tmp142, lexer
	movq	%rsi, %r13	; tmp143, now_scope
	movq	%rdx, %rbp	; tmp144, parser
; src/parser.c:369:     token = peek_current_token(lexer);
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp145, token
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	; token_38->type, _1
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	;, _1
	je	.L22	;,
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	;, _1
	jne	.L23	;,
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%r14), %rdi	; token_38->lexeme, token_38->lexeme
	call	*is_builtin_type@GOTPCREL(%rip)	;
; src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	; tmp146
	je	.L23	;,
.L22:
; src/parser.c:375:     Symbol* type = search_name(now_scope, token->lexeme);
	movq	(%r14), %rsi	; token_38->lexeme, token_38->lexeme
	movq	%r13, %rdi	; now_scope,
	call	*search_name@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp148, type
; src/parser.c:376:     if (type != NULL) {
	testq	%rax, %rax	; type
	je	.L25	;,
; src/parser.c:377:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	movl	32(%rax), %eax	; type_45->kind, _48
; src/parser.c:377:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	cmpl	$6, %eax	;, _48
	je	.L26	;,
	testl	%eax, %eax	; _48
	jne	.L35	;,
.L26:
; src/parser.c:381:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp151, token
; src/parser.c:382:     if (token->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	;, token_52->type
	jne	.L36	;,
.L27:
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movl	$3, %esi	;, iftmp.25_28
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	cmpb	$0, 10(%rbp)	;, parser_40(D)->in_class
	je	.L28	;,
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	cmpb	$1, 9(%rbp)	;, parser_40(D)->in_method
	sbbl	%esi, %esi	; iftmp.25_28
	andl	$2, %esi	;, iftmp.25_28
	addl	$3, %esi	;, iftmp.25_28
.L28:
; src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movq	(%r14), %rdi	; token_52->lexeme, token_52->lexeme
	movq	%r13, %rcx	; now_scope,
	movq	%r12, %rdx	; type,
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp153, name
; src/parser.c:386:     token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*peek_next_token@GOTPCREL(%rip)	;
; src/parser.c:385:     Expression* value = NULL;
	movl	$0, %r15d	;, value
; src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_58->type
	je	.L37	;,
.L29:
; src/parser.c:395:     return create_variable(type, name, value);
	movq	%r15, %rdx	; value,
	movq	%r14, %rsi	; name,
	movq	%r12, %rdi	; type,
	call	*create_variable@GOTPCREL(%rip)	;
.L21:
; src/parser.c:396: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L23:
; src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_40(D)->source_file, parser_40(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp147, _5
; src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%r14, %rsi	; token,
	leaq	.LC2(%rip), %rdi	;, tmp122
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:373:         return NULL;
	movl	$0, %eax	;, <retval>
	jmp	.L21	;
.L35:
; src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_40(D)->source_file, parser_40(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp149, _11
; src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%r14, %rsi	; token,
	leaq	.LC3(%rip), %rdi	;, tmp129
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L26	;
.L25:
; src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_40(D)->source_file, parser_40(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp150, _13
; src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%r14, %rsi	; token,
	leaq	.LC4(%rip), %rdi	;, tmp131
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L26	;
.L36:
; src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_40(D)->source_file, parser_40(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp152, _16
; src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%r14, %rsi	; token,
	leaq	.LC5(%rip), %rdi	;, tmp133
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L27	;
.L37:
; src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	movq	(%rax), %rdi	; token_58->lexeme, token_58->lexeme
	movq	ASSIGN_SYMBOL(%rip), %rsi	; ASSIGN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	; tmp155
	je	.L29	;,
; src/parser.c:388:         token = get_next_token(lexer, true);  // consume '='
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:389:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp156, %sfp
; src/parser.c:390:         value = parse_expression(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, %r15	; tmp157, value
; src/parser.c:391:         if (value == NULL)
	testq	%rax, %rax	; value
	jne	.L29	;,
; src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	0(%rbp), %rdi	; parser_40(D)->source_file, parser_40(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp158, _25
; src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC6(%rip), %rdi	;, tmp138
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L29	;
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
	.type	parse_primary, @function
parse_primary:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$40, %rsp	;,
	movq	%rdi, %rbp	; tmp297, lexer
	movq	%rsi, 8(%rsp)	; tmp298, %sfp
	movq	%rdx, %r13	; tmp299, parser
; src/parser.c:699:     token = peek_current_token(lexer);
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp300, token
; src/parser.c:705:     if (token->type == INTEGER) {
	movl	24(%rax), %eax	; token_61->type, _1
; src/parser.c:705:     if (token->type == INTEGER) {
	cmpl	$2, %eax	;, _1
	je	.L91	;,
; src/parser.c:708:     } else if (token->type == FLOAT) {
	cmpl	$3, %eax	;, _1
	je	.L92	;,
; src/parser.c:711:     } else if (token->type == STRING) {
	cmpl	$4, %eax	;, _1
	je	.L93	;,
; src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	;, _1
	je	.L94	;,
.L43:
; src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r12)	;, token_61->type
	je	.L95	;,
.L51:
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movl	24(%r12), %eax	; token_61->type, _33
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$1, %eax	;, _33
	je	.L52	;,
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$6, %eax	;, _33
	jne	.L53	;,
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	(%r12), %rdi	; token_61->lexeme, token_61->lexeme
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	testb	%al, %al	; tmp318
	je	.L53	;,
; src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpb	$0, 9(%r13)	;, parser_70(D)->in_method
	je	.L53	;,
.L52:
; src/parser.c:771:     Token* token = peek_current_token(lexer);
	movq	%rbp, %rdi	; lexer,
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp319, token
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movl	24(%rax), %eax	; token_106->type, _107
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	;, _107
	je	.L54	;,
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	;, _107
	jne	.L55	;,
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	(%rbx), %rdi	; token_106->lexeme, token_106->lexeme
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	; tmp320
	je	.L55	;,
.L54:
; src/parser.c:780:     base_name = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rsi	; token_106->lexeme, token_106->lexeme
	movq	8(%rsp), %rdi	; %sfp,
	call	*search_name@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp322, base_name
; src/parser.c:781:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; base_name,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, (%rsp)	; tmp323, %sfp
; src/parser.c:782:     token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	*peek_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp324, token
; src/parser.c:783:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;, token_116->type
	jne	.L57	;,
; src/parser.c:777:     Symbol* current_type = NULL;
	movl	$0, %r14d	;, class_name
; src/parser.c:779:     SymbolTable* var_scope = NULL;
	movq	$0, 16(%rsp)	;, %sfp
	jmp	.L80	;
.L91:
; src/parser.c:707:         str_value = token->lexeme;
	movq	(%r12), %rsi	; token_61->lexeme, str_value
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/parser.c:703:     Primary* prim_value = NULL;
	movl	$0, %ebp	;, prim_value
; src/parser.c:702:     Expression* expr_value = NULL;
	movl	$0, %ebx	;, <retval>
; src/parser.c:706:         type = PRIM_INTEGER;
	movl	$0, %r12d	;, type
.L40:
; src/parser.c:767:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	(%rsp), %r8	; %sfp,
	movq	%rbp, %rcx	; prim_value,
	movq	%rbx, %rdx	; <retval>,
	movl	%r12d, %edi	; type,
	call	*create_primary@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp363, <retval>
.L38:
; src/parser.c:768: }
	movq	%rbx, %rax	; <retval>,
	addq	$40, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L92:
; src/parser.c:710:         str_value = token->lexeme;
	movq	(%r12), %rsi	; token_61->lexeme, str_value
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/parser.c:703:     Primary* prim_value = NULL;
	movl	$0, %ebp	;, prim_value
; src/parser.c:702:     Expression* expr_value = NULL;
	movl	$0, %ebx	;, <retval>
; src/parser.c:709:         type = PRIM_FLOAT;
	movl	$1, %r12d	;, type
	jmp	.L40	;
.L93:
; src/parser.c:713:         str_value = token->lexeme;
	movq	(%r12), %rsi	; token_61->lexeme, str_value
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/parser.c:703:     Primary* prim_value = NULL;
	movl	$0, %ebp	;, prim_value
; src/parser.c:702:     Expression* expr_value = NULL;
	movl	$0, %ebx	;, <retval>
; src/parser.c:712:         type = PRIM_STRING;
	movl	$2, %r12d	;, type
	jmp	.L40	;
.L94:
; src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	movq	(%r12), %rdi	; token_61->lexeme, token_61->lexeme
	movq	TRUE_KEYWORD(%rip), %rsi	; TRUE_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	; tmp301
	je	.L44	;,
; src/parser.c:716:         str_value = token->lexeme;
	movq	(%r12), %rsi	; token_61->lexeme, str_value
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/parser.c:703:     Primary* prim_value = NULL;
	movl	$0, %ebp	;, prim_value
; src/parser.c:702:     Expression* expr_value = NULL;
	movl	$0, %ebx	;, <retval>
; src/parser.c:715:         type = PRIM_TRUE;
	movl	$3, %r12d	;, type
; src/parser.c:716:         str_value = token->lexeme;
	jmp	.L40	;
.L44:
; src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, 24(%r12)	;, token_61->type
	jne	.L43	;,
; src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movq	(%r12), %rdi	; token_61->lexeme, token_61->lexeme
	movq	FALSE_KEYWORD(%rip), %rsi	; FALSE_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	; tmp302
	je	.L43	;,
; src/parser.c:719:         str_value = token->lexeme;
	movq	(%r12), %rsi	; token_61->lexeme, str_value
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/parser.c:703:     Primary* prim_value = NULL;
	movl	$0, %ebp	;, prim_value
; src/parser.c:702:     Expression* expr_value = NULL;
	movl	$0, %ebx	;, <retval>
; src/parser.c:718:         type = PRIM_FALSE;
	movl	$4, %r12d	;, type
; src/parser.c:719:         str_value = token->lexeme;
	jmp	.L40	;
.L95:
; src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	(%r12), %rdi	; token_61->lexeme, token_61->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp303
	jne	.L96	;,
; src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	cmpl	$5, 24(%r12)	;, token_61->type
	jne	.L51	;,
; src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movq	(%r12), %rdi	; token_61->lexeme, token_61->lexeme
	movq	NOT_SYMBOL(%rip), %rsi	; NOT_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	; tmp310
	jne	.L97	;,
; src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	cmpl	$5, 24(%r12)	;, token_61->type
	jne	.L51	;,
; src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movq	(%r12), %rdi	; token_61->lexeme, token_61->lexeme
	movq	SUB_SYMBOL(%rip), %rsi	; SUB_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	; tmp314
	je	.L51	;,
; src/parser.c:746:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp315, token
; src/parser.c:747:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rbp, %rdi	; lexer,
	call	parse_primary	;
	movq	%rax, %rbp	; tmp316, prim_value
; src/parser.c:748:         if (prim_value == NULL) {
	testq	%rax, %rax	; prim_value
	je	.L98	;,
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/parser.c:702:     Expression* expr_value = NULL;
	movl	$0, %ebx	;, <retval>
; src/parser.c:701:     string str_value = NULL;
	movl	$0, %esi	;, str_value
; src/parser.c:745:         type = PRIM_NEG_OPERAND;
	movl	$7, %r12d	;, type
	jmp	.L40	;
.L96:
; src/parser.c:722:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp304, token
; src/parser.c:723:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rbp, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, %rbx	; tmp305, <retval>
; src/parser.c:724:         if (expr_value == NULL) {
	testq	%rax, %rax	; <retval>
	je	.L99	;,
; src/parser.c:729:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp307, token
; src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %r12d	; token_74->type, type
; src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %r12d	;, type
	jne	.L49	;,
; src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_74->lexeme, token_74->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp308
	je	.L49	;,
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/parser.c:703:     Primary* prim_value = NULL;
	movl	$0, %ebp	;, prim_value
; src/parser.c:701:     string str_value = NULL;
	movl	$0, %esi	;, str_value
	jmp	.L40	;
.L99:
; src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_70(D)->source_file, parser_70(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp306, _14
; src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC7(%rip), %rdi	;, tmp228
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:727:             return NULL;
	jmp	.L38	;
.L49:
; src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_70(D)->source_file, parser_70(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp309, _20
; src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC8(%rip), %rdi	;, tmp232
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:733:             return NULL;
	movl	$0, %ebx	;, <retval>
	jmp	.L38	;
.L97:
; src/parser.c:737:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp311, token
; src/parser.c:738:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rbp, %rdi	; lexer,
	call	parse_primary	;
	movq	%rax, %rbp	; tmp312, prim_value
; src/parser.c:739:         if (prim_value == NULL) {
	testq	%rax, %rax	; prim_value
	je	.L100	;,
; src/parser.c:704:     VariableAccess* variable_value = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/parser.c:702:     Expression* expr_value = NULL;
	movl	$0, %ebx	;, <retval>
; src/parser.c:701:     string str_value = NULL;
	movl	$0, %esi	;, str_value
; src/parser.c:736:         type = PRIM_NOT_OPERAND;
	movl	$6, %r12d	;, type
	jmp	.L40	;
.L100:
; src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_70(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp313, _26
; src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC9(%rip), %rdi	;, tmp235
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:742:             return NULL;
	movq	%rbp, %rbx	; prim_value, <retval>
	jmp	.L38	;
.L98:
; src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_70(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp317, _32
; src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC10(%rip), %rdi	;, tmp238
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:751:             return NULL;
	movq	%rbp, %rbx	; prim_value, <retval>
	jmp	.L38	;
.L55:
; src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_70(D)->source_file, parser_70(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp321, _112
; src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC11(%rip), %rdi	;, tmp244
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:775:         return NULL;
	jmp	.L81	;
.L59:
; src/parser.c:791:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rbx), %rdi	; token_309->lexeme, token_309->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:791:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp325
	jne	.L101	;,
; src/parser.c:824:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	movq	(%rbx), %rdi	; token_309->lexeme, token_309->lexeme
	movq	L_BRACKET_SYMBOL(%rip), %rsi	; L_BRACKET_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:824:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	; tmp343
	je	.L71	;,
; src/parser.c:825:             token = get_next_token(lexer, true);  // consume '['
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:826:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp344, token
; src/parser.c:827:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rbp, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, 24(%rsp)	; index, %sfp
; src/parser.c:828:             if (index == NULL)
	testq	%rax, %rax	; index
	je	.L102	;,
.L72:
; src/parser.c:830:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp347, token
; src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_184->type
	jne	.L73	;,
; src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	(%rax), %rdi	; token_184->lexeme, token_184->lexeme
	movq	R_BRACKET_SYMBOL(%rip), %rsi	; R_BRACKET_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	testb	%al, %al	; tmp348
	je	.L73	;,
; src/parser.c:836:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movl	$0, %r8d	;,
	movq	24(%rsp), %rcx	; %sfp,
	movl	$0, %edx	;,
	movq	(%rsp), %rsi	; %sfp,
	movl	$3, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, (%rsp)	; tmp350, %sfp
.L70:
; src/parser.c:872:         token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	*peek_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp360, token
; src/parser.c:783:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;, token_217->type
	jne	.L57	;,
.L80:
; src/parser.c:784:         if (base_name != NULL) {
	testq	%r15, %r15	; base_name
	je	.L58	;,
; src/parser.c:786:             if (base_name->type != NULL)  // subroutine or variable or attribute or parameter
	movq	(%r15), %r14	; base_name_307->type, class_name
; src/parser.c:785:             current_type = base_name;     // class or type
	testq	%r14, %r14	; class_name
	cmove	%r15, %r14	; class_name,, base_name, class_name
.L58:
; src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	cmpq	$0, 16(%rsp)	;, %sfp
	jne	.L59	;,
	testq	%r14, %r14	; class_name
	je	.L59	;,
	movq	$0, 16(%rsp)	;, %sfp
; src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r14)	;, current_type_121->kind
	jne	.L59	;,
; src/parser.c:790:             var_scope = current_type->ast_node.class->class_scope;
	movq	24(%r14), %rax	; current_type_121->ast_node.class, current_type_121->ast_node.class
	movq	16(%rax), %rax	; _125->class_scope, var_scope
	movq	%rax, 16(%rsp)	; var_scope, %sfp
	jmp	.L59	;
.L101:
; src/parser.c:792:             token = get_next_token(lexer, true);  // consume '('
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp326, token
; src/parser.c:793:             if (base_name == NULL)
	testq	%r15, %r15	; base_name
	je	.L103	;,
; src/parser.c:795:             else if (base_name->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%r15)	;, base_name_307->kind
	je	.L104	;,
.L63:
; src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	movl	32(%r15), %eax	; base_name_144->kind, tmp367
	subl	$1, %eax	;, tmp258
	cmpl	$1, %eax	;, tmp258
	ja	.L105	;,
.L62:
; src/parser.c:802:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp332, token
; src/parser.c:803:             list(Expression*) args = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, 16(%rsp)	; tmp333, %sfp
; src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L64	;
.L103:
; src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_70(D)->source_file, parser_70(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp327, _133
; src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC12(%rip), %rdi	;, tmp254
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L62	;
.L104:
; src/parser.c:796:                 string name = make_method_name(base_name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	8(%r15), %rdi	; base_name_307->name, base_name_307->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp328, name
; src/parser.c:797:                 base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
	movq	24(%r15), %rax	; base_name_307->ast_node.class, base_name_307->ast_node.class
	movq	16(%rax), %rdi	; _138->class_scope, _139
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp329, base_name
; src/parser.c:798:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; base_name,
	movq	(%rsp), %rsi	; %sfp,
	movl	$2, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, (%rsp)	; tmp330, %sfp
; src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	testq	%r15, %r15	; base_name
	jne	.L63	;,
	jmp	.L62	;
.L105:
; src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_70(D)->source_file, parser_70(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp331, _147
; src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC13(%rip), %rdi	;, tmp261
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L62	;
.L108:
; src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_70(D)->source_file, parser_70(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp335, _152
; src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC14(%rip), %rdi	;,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L65	;
.L109:
; src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	movq	(%rax), %rdi	; token_154->lexeme, token_154->lexeme
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	testb	%al, %al	; tmp337
	jne	.L106	;,
; src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_154->type
	jne	.L66	;,
; src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rbx), %rdi	; token_154->lexeme, token_154->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp339
	je	.L66	;,
.L64:
; src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_153->type
	je	.L107	;,
.L69:
; src/parser.c:805:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	8(%rsp), %rsi	; %sfp,
	movq	%rbp, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, %r14	; tmp334, arg
; src/parser.c:806:                 if (arg == NULL)
	testq	%rax, %rax	; arg
	je	.L108	;,
.L65:
; src/parser.c:808:                 list_append(args, (pointer)arg);
	movq	%r14, %rsi	; arg,
	movq	16(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:809:                 token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp336, token
; src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	cmpl	$5, 24(%rax)	;, token_154->type
	je	.L109	;,
.L66:
; src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_70(D)->source_file, parser_70(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp340, _165
; src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC15(%rip), %rdi	;, tmp269
	call	*parser_error@GOTPCREL(%rip)	;
.L81:
; src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_70(D)->source_file, parser_70(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp361, _39
; src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC21(%rip), %rdi	;, tmp291
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:759:             return NULL;
	movl	$0, %ebx	;, <retval>
	jmp	.L38	;
.L106:
; src/parser.c:811:                     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp338, token
; src/parser.c:811:                     token = get_next_token(lexer, true);
	jmp	.L64	;
.L107:
; src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rbx), %rdi	; token_153->lexeme, token_153->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp341
	je	.L69	;,
; src/parser.c:818:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	16(%rsp), %r8	; %sfp,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	(%rsp), %rsi	; %sfp,
	movl	$1, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, (%rsp)	; tmp342, %sfp
; src/parser.c:819:             base_name = base_name->type;
	movq	(%r15), %r15	; base_name_172->type, base_name
; src/parser.c:822:             if (base_name->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r15)	;, base_name_173->kind
	jne	.L86	;,
; src/parser.c:823:                 var_scope = base_name->ast_node.class->class_scope;
	movq	24(%r15), %rax	; base_name_173->ast_node.class, base_name_173->ast_node.class
	movq	16(%rax), %rax	; _175->class_scope, var_scope
	movq	%rax, 16(%rsp)	; var_scope, %sfp
; src/parser.c:820:             current_type = NULL;
	movl	$0, %r14d	;, class_name
	jmp	.L70	;
.L102:
; src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_70(D)->source_file, parser_70(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp346, _183
; src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC16(%rip), %rdi	;, tmp276
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L72	;
.L73:
; src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_70(D)->source_file, parser_70(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp349, _190
; src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC17(%rip), %rdi	;, tmp280
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:834:                 return NULL;
	jmp	.L81	;
.L71:
; src/parser.c:837:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	movq	(%rbx), %rdi	; token_309->lexeme, token_309->lexeme
	movq	DOT_SYMBOL(%rip), %rsi	; DOT_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:837:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	; tmp351
	je	.L57	;,
; src/parser.c:838:             token = get_next_token(lexer, true);  // consume '.'
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:839:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp352, token
; src/parser.c:840:             if (var_scope == NULL) {
	cmpq	$0, 16(%rsp)	;, %sfp
	je	.L110	;,
; src/parser.c:845:             if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_195->type
	jne	.L111	;,
; src/parser.c:850:             base_name = search_name(var_scope, token->lexeme);
	movq	(%rax), %rsi	; token_195->lexeme, token_195->lexeme
	movq	16(%rsp), %rdi	; %sfp,
	call	*search_name@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp355, base_name
; src/parser.c:851:             if (base_name == NULL) {
	testq	%rax, %rax	; base_name
	je	.L112	;,
.L77:
; src/parser.c:867:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	%r15, %rdx	; base_name,
	movq	(%rsp), %rsi	; %sfp,
	movl	$2, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, (%rsp)	; tmp359, %sfp
; src/parser.c:869:             var_scope = NULL;
	movq	$0, 16(%rsp)	;, %sfp
; src/parser.c:868:             current_type = NULL;
	movl	$0, %r14d	;, class_name
	jmp	.L70	;
.L110:
; src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_70(D)->source_file, parser_70(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp353, _198
; src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC18(%rip), %rdi	;, tmp284
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:843:                 return NULL;
	jmp	.L81	;
.L111:
; src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_70(D)->source_file, parser_70(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp354, _201
; src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC19(%rip), %rdi	;, tmp286
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:848:                 return NULL;
	jmp	.L81	;
.L112:
; src/parser.c:853:                 if (current_type != NULL) {
	testq	%r14, %r14	; class_name
	je	.L78	;,
; src/parser.c:854:                     if (current_type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r14)	;, current_type_121->kind
	jne	.L79	;,
; src/parser.c:855:                         class_name = current_type->name;
	movq	8(%r14), %r14	; current_type_121->name, class_name
.L78:
; src/parser.c:859:                 string name = make_method_name(class_name, token->lexeme);
	movq	(%rbx), %rsi	; token_195->lexeme, token_195->lexeme
	movq	%r14, %rdi	; class_name,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp356, name
; src/parser.c:860:                 base_name = search_name_use_strcmp(var_scope, name);
	movq	16(%rsp), %rdi	; %sfp,
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp357, base_name
; src/parser.c:862:             if (base_name == NULL) {
	testq	%rax, %rax	; base_name
	jne	.L77	;,
; src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_70(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp358, _214
; src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC20(%rip), %rdi	;, tmp289
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:865:                 return NULL;
	jmp	.L81	;
.L79:
; src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	movq	(%r14), %r14	; current_type_121->type, class_name
; src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	testq	%r14, %r14	; class_name
	je	.L78	;,
; src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r14)	;, _206->kind
	jne	.L87	;,
; src/parser.c:857:                         class_name = current_type->type->name;
	movq	8(%r14), %r14	; _206->name, class_name
	jmp	.L78	;
.L87:
; src/parser.c:852:                 string class_name = NULL;
	movq	%rax, %r14	; base_name, class_name
	jmp	.L78	;
.L86:
; src/parser.c:821:             var_scope = NULL;
	movq	$0, 16(%rsp)	;, %sfp
; src/parser.c:820:             current_type = NULL;
	movl	$0, %r14d	;, class_name
	jmp	.L70	;
.L57:
; src/parser.c:756:         if (variable_value == NULL) {
	cmpq	$0, (%rsp)	;, %sfp
	je	.L81	;,
; src/parser.c:703:     Primary* prim_value = NULL;
	movl	$0, %ebp	;, prim_value
; src/parser.c:702:     Expression* expr_value = NULL;
	movl	$0, %ebx	;, <retval>
; src/parser.c:701:     string str_value = NULL;
	movl	$0, %esi	;, str_value
; src/parser.c:754:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %r12d	;, type
	jmp	.L40	;
.L53:
; src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_70(D)->source_file, parser_70(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp362, _41
; src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC22(%rip), %rdi	;, tmp293
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:764:         return NULL;
	movl	$0, %ebx	;, <retval>
	jmp	.L38	;
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
	.type	parse_statement, @function
parse_statement:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$56, %rsp	;,
	movq	%rdi, %rbx	; tmp465, lexer
	movq	%rsi, %r13	; tmp466, now_scope
	movq	%rdx, %r12	; tmp467, parser
; src/parser.c:400:     token = peek_current_token(lexer);
	call	*peek_current_token@GOTPCREL(%rip)	;
; src/parser.c:402:     if (token->type == KEYWORD) {
	cmpl	$6, 24(%rax)	;, token_58->type
	je	.L197	;,
; src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, %r8	;, tmp597
; src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movl	$0, %r9d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp598, <retval>
.L183:
; src/parser.c:437:     token = peek_current_token(lexer);
	movq	%rbx, %rdi	; lexer,
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp599, token
; src/parser.c:438:     if (statement == NULL)
	testq	%rbp, %rbp	; <retval>
	je	.L198	;,
.L190:
; src/parser.c:440:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp601, token
; src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	;, token_108->type
	je	.L199	;,
.L191:
; src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp603, _47
; src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC52(%rip), %rdi	;, tmp455
	call	*parser_error@GOTPCREL(%rip)	;
.L113:
; src/parser.c:445: }
	movq	%rbp, %rax	; <retval>,
	addq	$56, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L197:
	movq	%rax, %rbp	; tmp468, token
; src/parser.c:403:         if (string_equal(token->lexeme, IF_KEYWORD))
	movq	(%rax), %rdi	; token_58->lexeme, token_58->lexeme
	movq	IF_KEYWORD(%rip), %rsi	; IF_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:403:         if (string_equal(token->lexeme, IF_KEYWORD))
	testb	%al, %al	; tmp469
	jne	.L200	;,
; src/parser.c:405:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	movq	0(%rbp), %rdi	; token_58->lexeme, token_58->lexeme
	movq	FOR_KEYWORD(%rip), %rsi	; FOR_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:405:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	testb	%al, %al	; tmp523
	jne	.L201	;,
; src/parser.c:407:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	movq	0(%rbp), %rdi	; token_58->lexeme, token_58->lexeme
	movq	WHILE_KEYWORD(%rip), %rsi	; WHILE_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:407:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	testb	%al, %al	; tmp559
	jne	.L202	;,
; src/parser.c:409:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	0(%rbp), %rdi	; token_58->lexeme, token_58->lexeme
	movq	VAR_KEYWORD(%rip), %rsi	; VAR_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:409:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	; tmp580
	je	.L182	;,
; src/parser.c:410:             get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:411:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_variable	;
	movq	%rax, %r9	;, tmp581
; src/parser.c:411:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$1, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp582, <retval>
	jmp	.L183	;
.L200:
; src/parser.c:449:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp470, token
; src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_112->type
	jne	.L116	;,
; src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_112->lexeme, token_112->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp471
	je	.L116	;,
; src/parser.c:455:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp473, token
; src/parser.c:456:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, 32(%rsp)	; condition, %sfp
; src/parser.c:457:     if (condition == NULL)
	testq	%rax, %rax	; condition
	je	.L203	;,
.L119:
; src/parser.c:459:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp476, token
; src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_123->type
	jne	.L120	;,
; src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_123->lexeme, token_123->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp477
	je	.L120	;,
; src/parser.c:465:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp479, token
; src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_130->type
	jne	.L122	;,
; src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_130->lexeme, token_130->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp480
	je	.L122	;,
; src/parser.c:471:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp482, %sfp
; src/parser.c:472:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp483, token
; src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	leaq	.LC27(%rip), %r15	;, tmp462
; src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L124	;
.L116:
; src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp472, _118
; src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC23(%rip), %rdi	;, tmp337
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:453:         return NULL;
	movl	$0, %esi	;, _215
.L118:
; src/parser.c:404:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$2, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp522, <retval>
; src/parser.c:404:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	jmp	.L113	;
.L203:
; src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp475, _122
; src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC24(%rip), %rdi	;, tmp339
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L119	;
.L120:
; src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp478, _129
; src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC25(%rip), %rdi	;, tmp343
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:463:         return NULL;
	movl	$0, %esi	;, _215
	jmp	.L118	;
.L122:
; src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp481, _136
; src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC26(%rip), %rdi	;, tmp347
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:469:         return NULL;
	movl	$0, %esi	;, _215
	jmp	.L118	;
.L126:
; src/parser.c:474:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %rbp	; tmp484, statement
; src/parser.c:475:         if (statement == NULL)
	testq	%rax, %rax	; statement
	je	.L204	;,
.L125:
; src/parser.c:477:         list_append(body, (pointer)statement);
	movq	%rbp, %rsi	; statement,
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:478:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp486, token
.L124:
; src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r14)	;, token_142->type
	jne	.L126	;,
; src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdi	; token_142->lexeme, token_142->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp487
	je	.L126	;,
; src/parser.c:480:     list(ElseIf*) else_if = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, 24(%rsp)	; tmp488, %sfp
; src/parser.c:481:     list(Statement*) else_body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, 40(%rsp)	; tmp489, %sfp
; src/parser.c:482:     token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*peek_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp490, token
; src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	;, token_150->type
	je	.L127	;,
	jmp	.L128	;
.L204:
; src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp485, _141
; src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%r14, %rsi	; token,
	movq	%r15, %rdi	; tmp462,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L125	;
.L129:
; src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp493, _157
; src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC28(%rip), %rdi	;, tmp355
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:489:             return NULL;
	movl	$0, %esi	;, _215
	jmp	.L118	;
.L207:
; src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp496, _161
; src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC29(%rip), %rdi	;,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L131	;
.L132:
; src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp499, _168
; src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC30(%rip), %rdi	;, tmp361
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:499:             return NULL;
	movl	$0, %esi	;, _215
	jmp	.L118	;
.L134:
; src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp502, _175
; src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC31(%rip), %rdi	;, tmp365
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:505:             return NULL;
	movl	$0, %esi	;, _215
	jmp	.L118	;
.L138:
; src/parser.c:510:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %r14	; tmp505, statement
; src/parser.c:511:             if (statement == NULL)
	testq	%rax, %rax	; statement
	je	.L205	;,
.L137:
; src/parser.c:513:             list_append(elif_body, (pointer)statement);
	movq	%r14, %rsi	; statement,
	movq	%r15, %rdi	; elif_body,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:514:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp507, token
.L136:
; src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_181->type
	jne	.L138	;,
; src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%rbp), %rdi	; token_181->lexeme, token_181->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp508
	je	.L138	;,
; src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%r15, %rsi	; elif_body,
	movq	16(%rsp), %rdi	; %sfp,
	call	*create_else_if@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp509, _187
; src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	24(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:517:         token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*peek_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp510, token
; src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	;, token_188->type
	jne	.L128	;,
.L127:
; src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	movq	0(%rbp), %rdi	; token_9->lexeme, token_9->lexeme
	movq	ELIF_KEYWORD(%rip), %rsi	; ELIF_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	; tmp511
	je	.L206	;,
; src/parser.c:484:         token = get_next_token(lexer, true);  // consume 'elif'
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:485:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp491, token
; src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_151->type
	jne	.L129	;,
; src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_151->lexeme, token_151->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp492
	je	.L129	;,
; src/parser.c:491:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp494, token
; src/parser.c:492:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, 16(%rsp)	; elif_condition, %sfp
; src/parser.c:493:         if (elif_condition == NULL)
	testq	%rax, %rax	; elif_condition
	je	.L207	;,
.L131:
; src/parser.c:495:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp497, token
; src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_162->type
	jne	.L132	;,
; src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_162->lexeme, token_162->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp498
	je	.L132	;,
; src/parser.c:501:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp500, token
; src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_169->type
	jne	.L134	;,
; src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_169->lexeme, token_169->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp501
	je	.L134	;,
; src/parser.c:507:         list(Statement*) elif_body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp503, elif_body
; src/parser.c:508:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp504, token
; src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L136	;
.L205:
; src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp506, _180
; src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC32(%rip), %rdi	;,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L137	;
.L206:
; src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, 24(%rbp)	;, token_9->type
	jne	.L128	;,
; src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	movq	0(%rbp), %rdi	; token_9->lexeme, token_9->lexeme
	movq	ELSE_KEYWORD(%rip), %rsi	; ELSE_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	; tmp512
	jne	.L208	;,
.L128:
; src/parser.c:536:     token = peek_current_token(lexer);
	movq	%rbx, %rdi	; lexer,
	call	*peek_current_token@GOTPCREL(%rip)	;
; src/parser.c:538:     return create_if(condition, body, else_if, else_body);
	movq	40(%rsp), %rcx	; %sfp,
	movq	24(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	32(%rsp), %rdi	; %sfp,
	call	*create_if@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp521, _215
	jmp	.L118	;
.L208:
; src/parser.c:520:         token = get_next_token(lexer, true);  // consume 'else'
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:521:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp513, token
; src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_198->type
	jne	.L140	;,
; src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_198->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp514
	je	.L140	;,
; src/parser.c:527:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp516, token
; src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	leaq	.LC34(%rip), %r15	;, tmp457
; src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L142	;
.L140:
; src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp515, _204
; src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC33(%rip), %rdi	;, tmp375
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:525:             return NULL;
	movl	$0, %esi	;, _215
	jmp	.L118	;
.L144:
; src/parser.c:529:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %r14	; tmp517, statement
; src/parser.c:530:             if (statement == NULL)
	testq	%rax, %rax	; statement
	je	.L209	;,
.L143:
; src/parser.c:532:             list_append(else_body, (pointer)statement);
	movq	%r14, %rsi	; statement,
	movq	40(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:533:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp519, token
.L142:
; src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_209->type
	jne	.L144	;,
; src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%rbp), %rdi	; token_209->lexeme, token_209->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp520
	je	.L144	;,
	jmp	.L128	;
.L209:
; src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp518, _208
; src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	movq	%r15, %rdi	; tmp457,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L143	;
.L201:
; src/parser.c:543:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp524, token
; src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_217->type
	jne	.L147	;,
; src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_217->lexeme, token_217->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp525
	je	.L147	;,
; src/parser.c:549:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp527, token
; src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_224->type
	je	.L210	;,
.L150:
; src/parser.c:552:         initializer = parse_variable(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_variable	;
	movq	%rax, 8(%rsp)	; initializer, %sfp
; src/parser.c:553:         if (initializer == NULL)
	testq	%rax, %rax	; initializer
	je	.L211	;,
.L152:
; src/parser.c:555:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp531, token
.L151:
; src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_233->type
	jne	.L153	;,
; src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	0(%rbp), %rdi	; token_233->lexeme, token_233->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp532
	je	.L153	;,
; src/parser.c:562:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp534, token
; src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_240->type
	je	.L212	;,
.L155:
; src/parser.c:565:         condition = parse_expression(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, 16(%rsp)	; condition, %sfp
; src/parser.c:566:         if (condition == NULL)
	testq	%rax, %rax	; condition
	je	.L213	;,
.L157:
; src/parser.c:568:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp538, token
.L156:
; src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_249->type
	jne	.L158	;,
; src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	0(%rbp), %rdi	; token_249->lexeme, token_249->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp539
	je	.L158	;,
; src/parser.c:575:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp541, token
; src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_256->type
	je	.L214	;,
.L160:
; src/parser.c:578:         increment = parse_expression(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, 24(%rsp)	; increment, %sfp
; src/parser.c:579:         if (increment == NULL)
	testq	%rax, %rax	; increment
	je	.L215	;,
.L162:
; src/parser.c:581:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp545, token
.L161:
; src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_265->type
	jne	.L163	;,
; src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%rbp), %rdi	; token_265->lexeme, token_265->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp546
	je	.L163	;,
; src/parser.c:588:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp548, token
; src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_272->type
	jne	.L165	;,
; src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_272->lexeme, token_272->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp549
	je	.L165	;,
; src/parser.c:594:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp551, body
; src/parser.c:595:     parser->in_loop = true;
	movb	$1, 11(%r12)	;, parser_60(D)->in_loop
; src/parser.c:596:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp552, token
; src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L167	;
.L147:
; src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp526, _223
; src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC35(%rip), %rdi	;, tmp384
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:547:         return NULL;
	movl	$0, %ecx	;, _293
.L149:
; src/parser.c:406:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$4, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp558, <retval>
; src/parser.c:406:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L113	;
.L210:
; src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rax), %rdi	; token_224->lexeme, token_224->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:550:     Variable* initializer = NULL;
	movq	$0, 8(%rsp)	;, %sfp
; src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp528
	jne	.L151	;,
	jmp	.L150	;
.L211:
; src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp530, _231
; src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC36(%rip), %rdi	;, tmp388
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L152	;
.L153:
; src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp533, _239
; src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC37(%rip), %rdi	;, tmp392
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:560:         return NULL;
	movl	$0, %ecx	;, _293
	jmp	.L149	;
.L212:
; src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rax), %rdi	; token_240->lexeme, token_240->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:563:     Expression* condition = NULL;
	movq	$0, 16(%rsp)	;, %sfp
; src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp535
	jne	.L156	;,
	jmp	.L155	;
.L213:
; src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp537, _247
; src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC38(%rip), %rdi	;, tmp396
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L157	;
.L158:
; src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp540, _255
; src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC39(%rip), %rdi	;, tmp400
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:573:         return NULL;
	movl	$0, %ecx	;, _293
	jmp	.L149	;
.L214:
; src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_256->lexeme, token_256->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:576:     Expression* increment = NULL;
	movq	$0, 24(%rsp)	;, %sfp
; src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp542
	jne	.L161	;,
	jmp	.L160	;
.L215:
; src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp544, _263
; src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC40(%rip), %rdi	;, tmp404
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L162	;
.L163:
; src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp547, _271
; src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC41(%rip), %rdi	;, tmp408
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:586:         return NULL;
	movl	$0, %ecx	;, _293
	jmp	.L149	;
.L165:
; src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp550, _278
; src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC42(%rip), %rdi	;, tmp412
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:592:         return NULL;
	movl	$0, %ecx	;, _293
	jmp	.L149	;
.L169:
; src/parser.c:598:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %rbp	; tmp553, statement
; src/parser.c:599:         if (statement == NULL)
	testq	%rax, %rax	; statement
	je	.L216	;,
.L168:
; src/parser.c:601:         list_append(body, (pointer)statement);
	movq	%rbp, %rsi	; statement,
	movq	%r15, %rdi	; body,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:602:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp555, token
.L167:
; src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r14)	;, token_284->type
	jne	.L169	;,
; src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdi	; token_284->lexeme, token_284->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp556
	je	.L169	;,
; src/parser.c:604:     parser->in_loop = false;
	movb	$0, 11(%r12)	;, parser_60(D)->in_loop
; src/parser.c:606:     return create_for(initializer, condition, increment, body);
	movq	%r15, %rcx	; body,
	movq	24(%rsp), %rdx	; %sfp,
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	call	*create_for@GOTPCREL(%rip)	;
	movq	%rax, %rcx	; tmp557, _293
	jmp	.L149	;
.L216:
; src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp554, _283
; src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%r14, %rsi	; token,
	leaq	.LC43(%rip), %rdi	;,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L168	;
.L202:
; src/parser.c:611:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp560, token
; src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_295->type
	jne	.L171	;,
; src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_295->lexeme, token_295->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp561
	je	.L171	;,
; src/parser.c:617:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp563, token
; src/parser.c:618:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, 8(%rsp)	; condition, %sfp
; src/parser.c:619:     if (condition == NULL)
	testq	%rax, %rax	; condition
	je	.L217	;,
.L174:
; src/parser.c:621:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp566, token
; src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_306->type
	jne	.L175	;,
; src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_306->lexeme, token_306->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp567
	je	.L175	;,
; src/parser.c:627:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp569, token
; src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_313->type
	jne	.L177	;,
; src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_313->lexeme, token_313->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp570
	je	.L177	;,
; src/parser.c:633:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp572, body
; src/parser.c:634:     parser->in_loop = true;
	movb	$1, 11(%r12)	;, parser_60(D)->in_loop
; src/parser.c:635:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp573, token
; src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L179	;
.L171:
; src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp562, _301
; src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC44(%rip), %rdi	;, tmp422
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:615:         return NULL;
	movl	$0, %edx	;, _331
.L173:
; src/parser.c:408:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %esi	;,
	movl	$3, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp579, <retval>
; src/parser.c:408:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	jmp	.L113	;
.L217:
; src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp565, _305
; src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC45(%rip), %rdi	;, tmp424
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L174	;
.L175:
; src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp568, _312
; src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC46(%rip), %rdi	;, tmp428
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:625:         return NULL;
	movl	$0, %edx	;, _331
	jmp	.L173	;
.L177:
; src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp571, _319
; src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC47(%rip), %rdi	;, tmp432
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:631:         return NULL;
	movl	$0, %edx	;, _331
	jmp	.L173	;
.L181:
; src/parser.c:637:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %rbp	; tmp574, statement
; src/parser.c:638:         if (statement == NULL)
	testq	%rax, %rax	; statement
	je	.L218	;,
.L180:
; src/parser.c:640:         list_append(body, (pointer)statement);
	movq	%rbp, %rsi	; statement,
	movq	%r15, %rdi	; body,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:641:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp576, token
.L179:
; src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r14)	;, token_325->type
	jne	.L181	;,
; src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdi	; token_325->lexeme, token_325->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp577
	je	.L181	;,
; src/parser.c:643:     parser->in_loop = false;
	movb	$0, 11(%r12)	;, parser_60(D)->in_loop
; src/parser.c:645:     return create_while(condition, body);
	movq	%r15, %rsi	; body,
	movq	8(%rsp), %rdi	; %sfp,
	call	*create_while@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp578, _331
	jmp	.L173	;
.L218:
; src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp575, _324
; src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%r14, %rsi	; token,
	leaq	.LC48(%rip), %rdi	;,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L180	;
.L182:
; src/parser.c:412:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	movq	0(%rbp), %rdi	; token_58->lexeme, token_58->lexeme
	movq	RETURN_KEYWORD(%rip), %rsi	; RETURN_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:412:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	; tmp583
	je	.L184	;,
; src/parser.c:413:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_83->type
	je	.L219	;,
.L185:
; src/parser.c:418:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, %r8	;, tmp587
; src/parser.c:418:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movl	$0, %r9d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp588, <retval>
	jmp	.L183	;
.L219:
; src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rax), %rdi	; token_83->lexeme, token_83->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp585
	je	.L185	;,
; src/parser.c:416:                 return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp586, <retval>
	jmp	.L113	;
.L184:
; src/parser.c:419:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	movq	0(%rbp), %rdi	; token_58->lexeme, token_58->lexeme
	movq	BREAK_KEYWORD(%rip), %rsi	; BREAK_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:419:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	; tmp589
	je	.L186	;,
; src/parser.c:420:             if (!parser->in_loop) {
	cmpb	$0, 11(%r12)	;, parser_60(D)->in_loop
	je	.L220	;,
; src/parser.c:425:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$6, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp591, <retval>
	jmp	.L183	;
.L220:
; src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp590, _31
; src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC49(%rip), %rdi	;, tmp446
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:423:                 return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L113	;
.L186:
; src/parser.c:426:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	movq	0(%rbp), %rdi	; token_58->lexeme, token_58->lexeme
	movq	CONTINUE_KEYWORD(%rip), %rsi	; CONTINUE_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:426:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	; tmp592
	je	.L188	;,
; src/parser.c:427:             if (!parser->in_loop) {
	cmpb	$0, 11(%r12)	;, parser_60(D)->in_loop
	je	.L221	;,
; src/parser.c:432:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$7, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp594, <retval>
	jmp	.L183	;
.L221:
; src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file,
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp593, _37
; src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC50(%rip), %rdi	;, tmp449
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:430:                 return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L113	;
.L188:
; src/parser.c:434:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, %r8	;, tmp595
; src/parser.c:434:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movl	$0, %r9d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp596, <retval>
	jmp	.L183	;
.L198:
; src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rdi	; parser_60(D)->source_file, parser_60(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp600, _41
; src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%r13, %rsi	; token,
	leaq	.LC51(%rip), %rdi	;, tmp451
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L190	;
.L199:
; src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	(%rax), %rdi	; token_108->lexeme, token_108->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; tmp602
	jne	.L113	;,
	jmp	.L191	;
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
.LC81:
	.string	"Failed to parse method body statement"
	.align 8
.LC82:
	.string	"Method missing return statement"
	.section	.rodata.str1.1
.LC83:
	.string	"Failed to parse class method"
	.section	.rodata.str1.8
	.align 8
.LC84:
	.string	"Failed to parse class variable"
	.align 8
.LC85:
	.string	"Unsupported type for class variable"
	.align 8
.LC86:
	.string	"Expected ';' after class variable declaration"
	.align 8
.LC87:
	.string	"Unexpected token in class member"
	.align 8
.LC88:
	.string	"Constructor name conflicts with existing member"
	.section	.rodata.str1.1
.LC89:
	.string	"0"
	.section	.rodata.str1.8
	.align 8
.LC90:
	.string	"Failed to parse class declaration"
	.align 8
.LC91:
	.string	"Unexpected token in code member"
	.text
	.globl	parse_code
	.type	parse_code, @function
parse_code:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$136, %rsp	;,
	movq	%rdi, %r14	; tmp641, lexer
	movq	%rsi, %rbx	; tmp642, now_scope
	movq	%rdx, %r13	; tmp643, parser
; src/parser.c:23:     if (builtin_scope == NULL) {
	cmpq	$0, builtin_scope(%rip)	;, builtin_scope
	je	.L341	;,
.L223:
; src/parser.c:32:         now_scope = builtin_scope;
	testq	%rbx, %rbx	; now_scope
	cmove	builtin_scope(%rip), %rbx	; builtin_scope,, now_scope
; src/parser.c:34:     list(CodeMember*) members = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, 32(%rsp)	; tmp650, %sfp
; src/parser.c:35:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	%rbx, %rdi	; now_scope,
	call	*create_symbol_table@GOTPCREL(%rip)	;
	movq	%rax, 24(%rsp)	; tmp651, %sfp
; src/parser.c:36:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r14, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	; token
	je	.L226	;,
	movq	%rax, 8(%rsp)	; token, %sfp
	movq	%r14, %r15	; lexer, lexer
	jmp	.L225	;
.L341:
; src/parser.c:24:         builtin_scope = create_symbol_table(NULL);
	movl	$0, %edi	;,
	call	*create_symbol_table@GOTPCREL(%rip)	;
	movq	%rax, %rcx	; tmp644, _2
; src/parser.c:24:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, builtin_scope(%rip)	; _2, builtin_scope
; src/parser.c:25:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movl	$0, %edx	;,
	movl	$6, %esi	;,
	movq	VOID_KEYWORD(%rip), %rdi	; VOID_KEYWORD,
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:25:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_void(%rip)	; tmp645, name_void
; src/parser.c:26:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rcx	; builtin_scope,
	movl	$0, %edx	;,
	movl	$6, %esi	;,
	movq	INT_KEYWORD(%rip), %rdi	; INT_KEYWORD,
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:26:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_int(%rip)	; tmp646, name_int
; src/parser.c:27:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rcx	; builtin_scope,
	movl	$0, %edx	;,
	movl	$6, %esi	;,
	movq	FLOAT_KEYWORD(%rip), %rdi	; FLOAT_KEYWORD,
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:27:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_float(%rip)	; tmp647, name_float
; src/parser.c:28:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rcx	; builtin_scope,
	movl	$0, %edx	;,
	movl	$6, %esi	;,
	movq	STRING_KEYWORD(%rip), %rdi	; STRING_KEYWORD,
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:28:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_string(%rip)	; tmp648, name_string
; src/parser.c:29:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %rcx	; builtin_scope,
	movl	$0, %edx	;,
	movl	$6, %esi	;,
	movq	BOOL_KEYWORD(%rip), %rdi	; BOOL_KEYWORD,
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:29:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_bool(%rip)	; tmp649, name_bool
	jmp	.L223	;
.L374:
; src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movq	8(%rsp), %rax	; %sfp, token
	movq	(%rax), %rdi	; token_587->lexeme, token_587->lexeme
	movq	IMPORT_KEYWORD(%rip), %rsi	; IMPORT_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %ebp	; tmp653, have_return
; src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	testb	%al, %al	; have_return
	jne	.L342	;,
; src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	8(%rsp), %rax	; %sfp, token
	cmpl	$6, 24(%rax)	;, token_587->type
	jne	.L264	;,
; src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	(%rax), %rdi	; token_587->lexeme, token_587->lexeme
	movq	FUNC_KEYWORD(%rip), %rsi	; FUNC_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
	movb	%al, 56(%rsp)	; _26, %sfp
; src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	testb	%al, %al	; _26
	jne	.L343	;,
; src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	8(%rsp), %rax	; %sfp, token
	cmpl	$6, 24(%rax)	;, token_587->type
	jne	.L264	;,
; src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	(%rax), %rdi	; token_587->lexeme, token_587->lexeme
	movq	CLASS_KEYWORD(%rip), %rsi	; CLASS_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	testb	%al, %al	; tmp709
	je	.L264	;,
; src/parser.c:264:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	24(%rsp), %rdi	; %sfp,
	call	*create_symbol_table@GOTPCREL(%rip)	;
	movq	%rax, 16(%rsp)	; tmp710, %sfp
; src/parser.c:265:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp711, token
; src/parser.c:266:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_216->type
	jne	.L344	;,
; src/parser.c:271:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rcx	; tmp713, class
	movq	%rax, 64(%rsp)	; class, %sfp
; src/parser.c:272:     class->class_scope = class_scope;
	movq	16(%rsp), %rax	; %sfp, class_scope
	movq	%rax, 16(%rcx)	; class_scope, class_220->class_scope
; src/parser.c:273:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	movq	(%rbx), %rdi	; token_216->lexeme, token_216->lexeme
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, 40(%rsp)	; tmp714, %sfp
; src/parser.c:274:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp715, token
; src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_223->type
	jne	.L267	;,
; src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_223->lexeme, token_223->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp716
	je	.L267	;,
; src/parser.c:280:     list(ClassMember*) members = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, 48(%rsp)	; tmp718, %sfp
; src/parser.c:281:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp719, token
; src/parser.c:282:     size_t size = 0;
	movq	$0, 80(%rsp)	;, %sfp
; src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L269	;
.L342:
; src/parser.c:63:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp654, token
; src/parser.c:64:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_101->type
	jne	.L345	;,
; src/parser.c:69:     string import_name = token->lexeme;
	movq	(%rax), %r12	; token_101->lexeme, import_name
; src/parser.c:71:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp656, token
; src/parser.c:70:     string source = NULL;
	movl	$0, %ebp	;, source
; src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	cmpl	$6, 24(%rax)	;, token_106->type
	je	.L346	;,
.L231:
; src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_117->type
	jne	.L233	;,
; src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rbx), %rdi	; token_117->lexeme, token_117->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp661
	je	.L233	;,
; src/parser.c:88:     name = parse_import_file(import_name, source, now_scope, parser->source_file);
	movq	0(%r13), %rcx	; parser_74(D)->source_file, parser_74(D)->source_file
	movq	24(%rsp), %rdx	; %sfp,
	movq	%rbp, %rsi	; source,
	movq	%r12, %rdi	; import_name,
	call	*parse_import_file@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp663, name
; src/parser.c:89:     if (name == NULL) {
	testq	%rax, %rax	; name
	je	.L347	;,
.L235:
; src/parser.c:94:     return create_import(name, source);
	movq	%rbp, %rsi	; source,
	call	*create_import@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp666, _132
; src/parser.c:40:             if (import == NULL)
	testq	%rax, %rax	; _132
	je	.L324	;,
.L236:
; src/parser.c:42:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %edi	;,
	call	*create_code_member@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp668, _22
; src/parser.c:42:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	32(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	jmp	.L237	;
.L345:
; src/parser.c:65:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp655, _104
; src/parser.c:65:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC53(%rip), %rdi	;, tmp463
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:67:         return NULL;
	jmp	.L324	;
.L346:
; src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	(%rax), %rdi	; token_106->lexeme, token_106->lexeme
	movq	FROM_KEYWORD(%rip), %rsi	; FROM_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	testb	%al, %al	; tmp657
	je	.L231	;,
; src/parser.c:73:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp658, token
; src/parser.c:74:         if (token->type != STRING) {
	cmpl	$4, 24(%rax)	;, token_111->type
	jne	.L348	;,
; src/parser.c:79:         source = token->lexeme;
	movq	(%rax), %rbp	; token_111->lexeme, source
; src/parser.c:80:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp660, token
	jmp	.L231	;
.L348:
; src/parser.c:75:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp659, _114
; src/parser.c:75:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC54(%rip), %rdi	;, tmp467
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:77:             return NULL;
	jmp	.L324	;
.L233:
; src/parser.c:83:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp662, _123
; src/parser.c:83:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC55(%rip), %rdi	;, tmp471
	call	*parser_error@GOTPCREL(%rip)	;
.L324:
; src/parser.c:41:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp667, _21
; src/parser.c:41:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC57(%rip), %rdi	;, tmp477
	call	*parser_error@GOTPCREL(%rip)	;
	movl	$0, %esi	;, _132
	jmp	.L236	;
.L347:
; src/parser.c:90:         parser_error("Failed to import module", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp664, _128
; src/parser.c:90:         parser_error("Failed to import module", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC56(%rip), %rdi	;, tmp474
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:91:         name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
	movq	24(%rsp), %rcx	; %sfp,
	movq	name_void(%rip), %rdx	; name_void,
	movl	$3, %esi	;,
	movq	%r12, %rdi	; import_name,
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp665, name
	jmp	.L235	;
.L343:
; src/parser.c:99:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	24(%rsp), %rdi	; %sfp,
	call	*create_symbol_table@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp670, function_scope
; src/parser.c:100:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp671, token
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	; token_135->type, _136
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	;, _136
	je	.L239	;,
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	;, _136
	jne	.L240	;,
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rbx), %rdi	; token_135->lexeme, token_135->lexeme
	call	*is_builtin_type@GOTPCREL(%rip)	;
; src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	; tmp672
	je	.L240	;,
.L239:
; src/parser.c:106:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rsi	; token_135->lexeme, token_135->lexeme
	movq	24(%rsp), %rdi	; %sfp,
	call	*search_name@GOTPCREL(%rip)	;
	movq	%rax, 16(%rsp)	; return_type, %sfp
; src/parser.c:107:     if (return_type == NULL) {
	testq	%rax, %rax	; return_type
	je	.L349	;,
; src/parser.c:112:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp676, token
; src/parser.c:113:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_145->type
	jne	.L350	;,
; src/parser.c:118:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rcx	; tmp678, function
	movq	%rax, 48(%rsp)	; function, %sfp
; src/parser.c:119:     function->function_scope = function_scope;
	movq	%r12, 32(%rax)	; function_scope, function_149->function_scope
; src/parser.c:120:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	(%rbx), %rdi	; token_145->lexeme, token_145->lexeme
	movq	16(%rsp), %rdx	; %sfp,
	movl	$1, %esi	;,
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, 56(%rsp)	; tmp679, %sfp
; src/parser.c:121:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp680, token
; src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_152->type
	jne	.L244	;,
; src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_152->lexeme, token_152->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp681
	je	.L244	;,
; src/parser.c:127:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp683, token
; src/parser.c:128:     list(Variable*) parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, 40(%rsp)	; tmp684, %sfp
; src/parser.c:132:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	leaq	.LC62(%rip), %r14	;, tmp632
; src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L246	;
.L240:
; src/parser.c:102:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp673, _140
; src/parser.c:102:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC58(%rip), %rdi	;, tmp482
	call	*parser_error@GOTPCREL(%rip)	;
.L325:
; src/parser.c:46:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp707, _28
; src/parser.c:46:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC69(%rip), %rdi	;, tmp518
	call	*parser_error@GOTPCREL(%rip)	;
	movl	$0, %edx	;, _211
	jmp	.L263	;
.L349:
; src/parser.c:108:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp675, _144
; src/parser.c:108:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC59(%rip), %rdi	;, tmp485
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:110:         return NULL;
	jmp	.L325	;
.L350:
; src/parser.c:114:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp677, _148
; src/parser.c:114:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC60(%rip), %rdi	;, tmp487
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:116:         return NULL;
	jmp	.L325	;
.L244:
; src/parser.c:123:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp682, _158
; src/parser.c:123:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC61(%rip), %rdi	;, tmp492
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:125:         return NULL;
	jmp	.L325	;
.L353:
; src/parser.c:132:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp686, _163
; src/parser.c:132:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	movq	%r14, %rdi	; tmp632,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L248	;
.L249:
; src/parser.c:136:             list_append(parameters, (pointer)parameter);
	movq	%rax, %rsi	; parameter,
	movq	40(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L248	;
.L354:
; src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	(%rax), %rdi	; token_168->lexeme, token_168->lexeme
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	; tmp689
	jne	.L351	;,
; src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_168->type
	jne	.L250	;,
; src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rbx), %rdi	; token_168->lexeme, token_168->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp691
	je	.L250	;,
.L246:
; src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_164->type
	je	.L352	;,
.L253:
; src/parser.c:130:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	%r12, %rsi	; function_scope,
	movq	%r15, %rdi	; lexer,
	call	parse_variable	;
; src/parser.c:131:         if (parameter == NULL)
	testq	%rax, %rax	; parameter
	je	.L353	;,
; src/parser.c:133:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	;, parameter_161->value
	je	.L249	;,
; src/parser.c:134:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp687, _167
; src/parser.c:134:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC63(%rip), %rdi	;,
	call	*parser_error@GOTPCREL(%rip)	;
.L248:
; src/parser.c:137:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp688, token
; src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_168->type
	je	.L354	;,
.L250:
; src/parser.c:141:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp692, _179
; src/parser.c:141:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC64(%rip), %rdi	;, tmp502
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:143:             return NULL;
	jmp	.L325	;
.L351:
; src/parser.c:139:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp690, token
; src/parser.c:139:             token = get_next_token(lexer, true);
	jmp	.L246	;
.L352:
; src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rbx), %rdi	; token_164->lexeme, token_164->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp693
	je	.L253	;,
; src/parser.c:146:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp694, token
; src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_184->type
	jne	.L254	;,
; src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_184->lexeme, token_184->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp695
	je	.L254	;,
; src/parser.c:152:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp697, body
; src/parser.c:153:     parser->in_function = true;
	movb	$1, 8(%r13)	;, parser_74(D)->in_function
; src/parser.c:155:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%r12, 64(%rsp)	; function_scope, %sfp
	movq	%rax, %r14	; token, token
; src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L256	;
.L254:
; src/parser.c:148:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp696, _190
; src/parser.c:148:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC65(%rip), %rdi	;, tmp508
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:150:         return NULL;
	jmp	.L325	;
.L260:
; src/parser.c:157:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	64(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %r12	; tmp699, statement
; src/parser.c:158:         if (statement == NULL)
	testq	%rax, %rax	; statement
	je	.L355	;,
; src/parser.c:160:         else if (have_return)
	testb	%bpl, %bpl	; have_return
	jne	.L356	;,
.L259:
; src/parser.c:163:             have_return = true;
	cmpl	$5, 8(%r12)	;, statement_193->type
	movl	$1, %eax	;, tmp915
	cmove	%eax, %ebp	; have_return,, tmp915, have_return
.L258:
; src/parser.c:164:         list_append(body, (pointer)statement);
	movq	%r12, %rsi	; statement,
	movq	%rbx, %rdi	; body,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:165:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp702, token
.L256:
; src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r14)	;, token_196->type
	jne	.L260	;,
; src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdi	; token_196->lexeme, token_196->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp703
	je	.L260	;,
; src/parser.c:167:     parser->in_function = false;
	movq	64(%rsp), %r12	; %sfp, function_scope
	movb	$0, 8(%r13)	;, parser_74(D)->in_function
; src/parser.c:168:     if (!have_return && return_type != name_void)
	testb	%bpl, %bpl	; have_return
	jne	.L261	;,
; src/parser.c:168:     if (!have_return && return_type != name_void)
	movq	16(%rsp), %rbp	; %sfp, return_type
	cmpq	name_void(%rip), %rbp	; name_void, return_type
	je	.L262	;,
; src/parser.c:169:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp704, _208
; src/parser.c:169:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%r14, %rsi	; token,
	leaq	.LC68(%rip), %rdi	;, tmp516
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:170:     if (!have_return && return_type == name_void)
	cmpq	name_void(%rip), %rbp	; name_void, return_type
	je	.L262	;,
.L261:
; src/parser.c:173:     return create_function_use_ptr(function, name, return_type, parameters, body, function_scope);
	movq	%r12, %r9	; function_scope,
	movq	%rbx, %r8	; body,
	movq	40(%rsp), %rcx	; %sfp,
	movq	16(%rsp), %rdx	; %sfp,
	movq	56(%rsp), %rsi	; %sfp,
	movq	48(%rsp), %rdi	; %sfp,
	call	*create_function_use_ptr@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp706, _211
; src/parser.c:45:             if (function == NULL)
	testq	%rax, %rax	; _211
	je	.L325	;,
.L263:
; src/parser.c:47:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movl	$0, %ecx	;,
	movl	$0, %esi	;,
	movl	$1, %edi	;,
	call	*create_code_member@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp708, _29
; src/parser.c:47:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	32(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	jmp	.L237	;
.L355:
; src/parser.c:159:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp700, _195
; src/parser.c:159:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%r14, %rsi	; token,
	leaq	.LC66(%rip), %rdi	;,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L258	;
.L356:
; src/parser.c:161:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp701, _199
; src/parser.c:161:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%r14, %rsi	; token,
	leaq	.LC67(%rip), %rdi	;,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L259	;
.L262:
; src/parser.c:171:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp705, _210
; src/parser.c:171:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	%rbx, %rdi	; body,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L261	;
.L344:
; src/parser.c:267:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp712, _219
; src/parser.c:267:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC70(%rip), %rdi	;, tmp522
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:269:         return NULL;
	jmp	.L326	;
.L267:
; src/parser.c:276:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp717, _229
; src/parser.c:276:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC71(%rip), %rdi	;, tmp527
	call	*parser_error@GOTPCREL(%rip)	;
.L326:
; src/parser.c:51:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp835, _35
; src/parser.c:51:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC90(%rip), %rdi	;, tmp614
	call	*parser_error@GOTPCREL(%rip)	;
	movl	$0, %ecx	;, _362
	jmp	.L322	;
.L310:
; src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, 24(%rbx)	;, token_232->type
	je	.L357	;,
.L270:
; src/parser.c:313:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp775, _273
; src/parser.c:313:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC87(%rip), %rdi	;,
	call	*parser_error@GOTPCREL(%rip)	;
.L301:
; src/parser.c:314:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp776, token
.L269:
; src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_232->type
	jne	.L310	;,
; src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%rbx), %rdi	; token_232->lexeme, token_232->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp777
	je	.L310	;,
; src/parser.c:316:     string init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
	movq	40(%rsp), %rax	; %sfp, name
	movq	8(%rax), %rdi	; name_222->name, name_222->name
	movq	DEFAULT_INIT_NAME(%rip), %rsi	; DEFAULT_INIT_NAME,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp778, init_name
; src/parser.c:317:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	movq	%rax, %rsi	; init_name,
	movq	16(%rsp), %rdi	; %sfp,
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, 56(%rsp)	; init, %sfp
; src/parser.c:318:     if (init == NULL) {
	testq	%rax, %rax	; init
	je	.L358	;,
.L311:
; src/parser.c:330:     if (init->kind != SYMBOL_METHOD)
	movq	56(%rsp), %rax	; %sfp, init
	cmpl	$2, 32(%rax)	;, init_298->kind
	jne	.L359	;,
.L312:
; src/parser.c:332:     string constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	40(%rsp), %rbp	; %sfp, name
	movq	8(%rbp), %rdi	; name_222->name, name_222->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp793, constructor_name
; src/parser.c:333:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp794, method
; src/parser.c:334:     method->method_scope = create_symbol_table(class_scope);
	movq	16(%rsp), %rdi	; %sfp,
	call	*create_symbol_table@GOTPCREL(%rip)	;
; src/parser.c:334:     method->method_scope = create_symbol_table(class_scope);
	movq	%rax, 32(%r12)	; tmp795, method_305->method_scope
; src/parser.c:335:     Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
	movq	%r12, %rcx	; method,
	movq	%rbp, %rdx	; name,
	movl	$2, %esi	;,
	movq	%rbx, %rdi	; constructor_name,
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, 96(%rsp)	; tmp796, %sfp
; src/parser.c:336:     list(Variable*) parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp797, parameters
; src/parser.c:337:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	32(%r12), %rcx	; method_305->method_scope, method_305->method_scope
	movq	%rbp, %rdx	; name,
	movl	$3, %esi	;,
	movq	SELF_KEYWORD(%rip), %rdi	; SELF_KEYWORD,
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, 88(%rsp)	; tmp798, %sfp
; src/parser.c:338:     list(Variable*) init_params = list_copy(init->ast_node.method->parameters);
	movq	56(%rsp), %rax	; %sfp, init
	movq	24(%rax), %rax	; init_298->ast_node.method, init_298->ast_node.method
	movq	16(%rax), %rdi	; _312->parameters, _312->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp799, init_params
.L314:
; src/parser.c:340:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	movq	%rbp, %rdi	; init_params,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp802, param
; src/parser.c:340:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	testq	%rax, %rax	; param
	je	.L360	;,
; src/parser.c:341:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	movq	8(%rbx), %rax	; param_316->name, param_316->name
	movq	8(%rax), %rdi	; _317->name, _317->name
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:341:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	testb	%al, %al	; tmp800
	jne	.L314	;,
; src/parser.c:342:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	8(%rbx), %rsi	; param_316->name, param_316->name
	movq	(%rbx), %rdi	; param_316->type, param_316->type
	movl	$0, %edx	;,
	call	*create_variable@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp801, _322
; src/parser.c:342:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	%r14, %rdi	; parameters,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L314	;
.L357:
; src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	(%rbx), %rdi	; token_232->lexeme, token_232->lexeme
	movq	METHOD_KEYWORD(%rip), %rsi	; METHOD_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	testb	%al, %al	; tmp720
	jne	.L361	;,
; src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	cmpl	$6, 24(%rbx)	;, token_232->type
	jne	.L270	;,
; src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	(%rbx), %rdi	; token_232->lexeme, token_232->lexeme
	movq	VAR_KEYWORD(%rip), %rsi	; VAR_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	; tmp766
	je	.L270	;,
; src/parser.c:290:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp767, token
; src/parser.c:291:             parser->in_class = true;
	movb	$1, 10(%r13)	;, parser_74(D)->in_class
; src/parser.c:292:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; lexer,
	call	parse_variable	;
	movq	%rax, %rbx	; tmp768, variable
; src/parser.c:293:             parser->in_class = false;
	movb	$0, 10(%r13)	;, parser_74(D)->in_class
; src/parser.c:294:             if (variable == NULL)
	testq	%rax, %rax	; variable
	je	.L362	;,
.L302:
; src/parser.c:296:             ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
	movq	%rbx, %rdx	; variable,
	movl	$0, %esi	;,
	movl	$1, %edi	;,
	call	*create_class_member@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp770, member
; src/parser.c:297:             list_append(members, (pointer)member);
	movq	%rax, %rsi	; member,
	movq	48(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:298:             if (member->type == CLASS_VARIABLE) {
	cmpl	$1, 8(%rbx)	;, member_249->type
	je	.L363	;,
.L303:
; src/parser.c:309:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp772, token
; src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	;, token_265->type
	je	.L364	;,
.L309:
; src/parser.c:311:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp774, _271
; src/parser.c:311:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC86(%rip), %rdi	;,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L301	;
.L361:
; src/parser.c:178:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	16(%rsp), %rdi	; %sfp,
	call	*create_symbol_table@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp721, method_scope
; src/parser.c:179:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	%rax, %rcx	; method_scope,
	movq	40(%rsp), %rdx	; %sfp,
	movl	$3, %esi	;,
	movq	SELF_KEYWORD(%rip), %rdi	; SELF_KEYWORD,
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp722, self
; src/parser.c:180:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp723, token
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	; token_369->type, _370
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	;, _370
	je	.L272	;,
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	;, _370
	jne	.L273	;,
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	0(%rbp), %rdi	; token_369->lexeme, token_369->lexeme
	call	*is_builtin_type@GOTPCREL(%rip)	;
; src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	; tmp724
	je	.L273	;,
.L272:
; src/parser.c:186:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	0(%rbp), %rsi	; token_369->lexeme, token_369->lexeme
	movq	16(%rsp), %rdi	; %sfp,
	call	*search_name@GOTPCREL(%rip)	;
	movq	%rax, 88(%rsp)	; return_type, %sfp
; src/parser.c:187:     if (return_type == NULL) {
	testq	%rax, %rax	; return_type
	je	.L365	;,
; src/parser.c:192:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp728, token
; src/parser.c:193:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_379->type
	jne	.L366	;,
; src/parser.c:198:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/parser.c:199:     method->method_scope = method_scope;
	movq	%rax, 104(%rsp)	; method, %sfp
	movq	%r14, 32(%rax)	; method_scope, method_383->method_scope
; src/parser.c:200:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	0(%rbp), %rsi	; token_379->lexeme, token_379->lexeme
	movq	40(%rsp), %rdx	; %sfp, name
	movq	8(%rdx), %rdi	; name_222->name, name_222->name
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp731, _386
; src/parser.c:200:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	104(%rsp), %rcx	; %sfp,
	movq	88(%rsp), %rdx	; %sfp,
	movl	$2, %esi	;,
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, 112(%rsp)	; tmp732, %sfp
; src/parser.c:201:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp733, token
; src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_388->type
	jne	.L277	;,
; src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_388->lexeme, token_388->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp734
	je	.L277	;,
; src/parser.c:207:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp736, token
; src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	cmpl	$6, 24(%rax)	;, token_395->type
	je	.L367	;,
.L279:
; src/parser.c:209:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp738, _401
; src/parser.c:209:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC76(%rip), %rdi	;, tmp548
	call	*parser_error@GOTPCREL(%rip)	;
.L280:
; src/parser.c:210:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp739, token
; src/parser.c:211:     list(Variable*) parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, 96(%rsp)	; tmp740, %sfp
; src/parser.c:212:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movl	$0, %edx	;,
	movq	%r12, %rsi	; self,
	movq	40(%rsp), %rdi	; %sfp,
	call	*create_variable@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp741, _404
; src/parser.c:212:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	96(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:225:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	leaq	.LC79(%rip), %r12	;, tmp636
; src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L281	;
.L273:
; src/parser.c:182:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp725, _374
; src/parser.c:182:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC72(%rip), %rdi	;, tmp533
	call	*parser_error@GOTPCREL(%rip)	;
.L327:
; src/parser.c:287:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp764, _239
; src/parser.c:287:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC83(%rip), %rdi	;, tmp574
	call	*parser_error@GOTPCREL(%rip)	;
	movl	$0, %esi	;, _455
	jmp	.L300	;
.L365:
; src/parser.c:188:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp727, _378
; src/parser.c:188:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC73(%rip), %rdi	;, tmp536
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:190:         return NULL;
	jmp	.L327	;
.L366:
; src/parser.c:194:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp729, _382
; src/parser.c:194:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC74(%rip), %rdi	;, tmp538
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:196:         return NULL;
	jmp	.L327	;
.L277:
; src/parser.c:203:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp735, _394
; src/parser.c:203:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC75(%rip), %rdi	;, tmp544
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:205:         return NULL;
	jmp	.L327	;
.L367:
; src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	(%rax), %rdi	; token_395->lexeme, token_395->lexeme
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	testb	%al, %al	; tmp737
	jne	.L280	;,
	jmp	.L279	;
.L283:
; src/parser.c:216:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, 24(%rbp)	;, token_405->type
	jne	.L286	;,
; src/parser.c:216:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	0(%rbp), %rdi	; token_405->lexeme, token_405->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:216:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	testb	%al, %al	; tmp745
	je	.L286	;,
.L287:
; src/parser.c:230:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp751, token
; src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_428->type
	jne	.L291	;,
; src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_428->lexeme, token_428->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp752
	je	.L291	;,
; src/parser.c:236:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, 72(%rsp)	; tmp754, %sfp
; src/parser.c:237:     parser->in_function = true;
	movb	$1, 8(%r13)	;, parser_74(D)->in_function
; src/parser.c:238:     parser->in_method = true;
	movb	$1, 9(%r13)	;, parser_74(D)->in_method
; src/parser.c:240:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp755, token
; src/parser.c:239:     bool have_return = false;
	movzbl	56(%rsp), %ebp	; %sfp, _26
	movq	%rbx, 120(%rsp)	; token, %sfp
; src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L293	;
.L368:
; src/parser.c:223:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp747, _419
; src/parser.c:223:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC78(%rip), %rdi	;,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L288	;
.L289:
; src/parser.c:227:             list_append(parameters, (pointer)parameter);
	movq	%rax, %rsi	; parameter,
	movq	96(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L288	;
.L369:
; src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%rbp), %rdi	; token_405->lexeme, token_405->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp750
	jne	.L287	;,
; src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_405->type
	jne	.L286	;,
; src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	0(%rbp), %rdi	; token_405->lexeme, token_405->lexeme
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	; tmp742
	je	.L283	;,
; src/parser.c:215:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp743, token
; src/parser.c:221:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	%r14, %rsi	; method_scope,
	movq	%r15, %rdi	; lexer,
	call	parse_variable	;
; src/parser.c:222:         if (parameter == NULL)
	testq	%rax, %rax	; parameter
	je	.L368	;,
; src/parser.c:224:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	;, parameter_411->value
	je	.L289	;,
; src/parser.c:225:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp748, _422
; src/parser.c:225:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	movq	%r12, %rdi	; tmp636,
	call	*parser_error@GOTPCREL(%rip)	;
.L288:
; src/parser.c:228:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp749, token
.L281:
; src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_405->type
	je	.L369	;,
.L286:
; src/parser.c:218:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp746, _417
; src/parser.c:218:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC77(%rip), %rdi	;, tmp554
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:219:             return NULL;
	jmp	.L327	;
.L291:
; src/parser.c:232:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp753, _434
; src/parser.c:232:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC80(%rip), %rdi	;, tmp564
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:234:         return NULL;
	jmp	.L327	;
.L297:
; src/parser.c:242:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	%r14, %rsi	; method_scope,
	movq	%r15, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %rbx	; tmp756, statement
; src/parser.c:243:         if (statement == NULL)
	testq	%rax, %rax	; statement
	je	.L370	;,
; src/parser.c:245:         else if (have_return)
	testb	%bpl, %bpl	; have_return
	jne	.L371	;,
.L296:
; src/parser.c:248:             have_return = true;
	cmpl	$5, 8(%rbx)	;, statement_437->type
	movl	$1, %eax	;, tmp916
	cmove	%eax, %ebp	; have_return,, tmp916, have_return
.L295:
; src/parser.c:249:         list_append(body, (pointer)statement);
	movq	%rbx, %rsi	; statement,
	movq	72(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:250:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp759, token
.L293:
; src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r12)	;, token_440->type
	jne	.L297	;,
; src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdi	; token_440->lexeme, token_440->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp760
	je	.L297	;,
; src/parser.c:252:     parser->in_function = false;
	movq	120(%rsp), %rbx	; %sfp, token
	movb	$0, 8(%r13)	;, parser_74(D)->in_function
; src/parser.c:253:     parser->in_method = false;
	movb	$0, 9(%r13)	;, parser_74(D)->in_method
; src/parser.c:254:     if (!have_return && return_type != name_void)
	testb	%bpl, %bpl	; have_return
	jne	.L298	;,
; src/parser.c:254:     if (!have_return && return_type != name_void)
	movq	88(%rsp), %rbp	; %sfp, return_type
	cmpq	name_void(%rip), %rbp	; name_void, return_type
	je	.L299	;,
; src/parser.c:255:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp761, _452
; src/parser.c:255:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC82(%rip), %rdi	;, tmp572
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:256:     if (!have_return && return_type == name_void)
	cmpq	name_void(%rip), %rbp	; name_void, return_type
	je	.L299	;,
.L298:
; src/parser.c:259:     return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
	movq	%r14, %r9	; method_scope,
	movq	72(%rsp), %r8	; %sfp,
	movq	96(%rsp), %rcx	; %sfp,
	movq	88(%rsp), %rdx	; %sfp,
	movq	112(%rsp), %rsi	; %sfp,
	movq	104(%rsp), %rdi	; %sfp,
	call	*create_method_use_ptr@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp763, _455
; src/parser.c:286:             if (method == NULL)
	testq	%rax, %rax	; _455
	je	.L327	;,
.L300:
; src/parser.c:288:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movl	$0, %edx	;,
	movl	$0, %edi	;,
	call	*create_class_member@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp765, _240
; src/parser.c:288:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	48(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	jmp	.L301	;
.L370:
; src/parser.c:244:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp757, _439
; src/parser.c:244:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC81(%rip), %rdi	;,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L295	;
.L371:
; src/parser.c:246:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp758, _443
; src/parser.c:246:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%r12, %rsi	; token,
	leaq	.LC67(%rip), %rdi	;,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L296	;
.L299:
; src/parser.c:257:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp762, _454
; src/parser.c:257:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	72(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L298	;
.L362:
; src/parser.c:295:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp769, _248
; src/parser.c:295:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC84(%rip), %rdi	;, tmp578
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L302	;
.L363:
; src/parser.c:299:                 Symbol* type = member->content.variable->type;
	movq	(%rbx), %rax	; member_249->content.variable, member_249->content.variable
	movq	(%rax), %rax	; _251->type, type
; src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	name_int(%rip), %rax	; name_int, type
	je	.L304	;,
; src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	name_float(%rip), %rax	; name_float, type
	je	.L304	;,
; src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	name_string(%rip), %rax	; name_string, type
	je	.L304	;,
; src/parser.c:302:                 else if (type == name_bool || type == name_void)
	cmpq	name_bool(%rip), %rax	; name_bool, type
	je	.L306	;,
; src/parser.c:302:                 else if (type == name_bool || type == name_void)
	cmpq	name_void(%rip), %rax	; name_void, type
	je	.L306	;,
; src/parser.c:304:                 else if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rax)	;, type_252->kind
	jne	.L308	;,
; src/parser.c:305:                     size += 8;  // pointer to object
	addq	$8, 80(%rsp)	;, %sfp
	jmp	.L303	;
.L304:
; src/parser.c:301:                     size += 8;
	addq	$8, 80(%rsp)	;, %sfp
	jmp	.L303	;
.L306:
; src/parser.c:303:                     size += 1;
	addq	$1, 80(%rsp)	;, %sfp
	jmp	.L303	;
.L308:
; src/parser.c:307:                     parser_error("Unsupported type for class variable", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp771, _264
; src/parser.c:307:                     parser_error("Unsupported type for class variable", token, get_full_path(parser->source_file));
	movq	%rbp, %rsi	; token,
	leaq	.LC85(%rip), %rdi	;, tmp581
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L303	;
.L364:
; src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	(%rax), %rdi	; token_265->lexeme, token_265->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; tmp773
	jne	.L301	;,
	jmp	.L309	;
.L358:
; src/parser.c:319:         Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp780, method
; src/parser.c:320:         method->method_scope = create_symbol_table(class_scope);
	movq	16(%rsp), %rdi	; %sfp,
	call	*create_symbol_table@GOTPCREL(%rip)	;
; src/parser.c:320:         method->method_scope = create_symbol_table(class_scope);
	movq	%rax, 32(%rbp)	; tmp781, method_283->method_scope
; src/parser.c:321:         init = create_symbol(init_name, SYMBOL_METHOD, name, method);
	movq	%rbp, %rcx	; method,
	movq	40(%rsp), %rdx	; %sfp,
	movl	$2, %esi	;,
	movq	%r12, %rdi	; init_name,
	call	*create_symbol@GOTPCREL(%rip)	;
	movq	%rax, 56(%rsp)	; tmp782, %sfp
; src/parser.c:322:         list(Variable*) parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp783, parameters
; src/parser.c:323:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	32(%rbp), %rcx	; method_283->method_scope, method_283->method_scope
	movq	40(%rsp), %r12	; %sfp, name
	movq	%r12, %rdx	; name,
	movl	$3, %esi	;,
	movq	SELF_KEYWORD(%rip), %rdi	; SELF_KEYWORD,
	call	*create_symbol@GOTPCREL(%rip)	;
; src/parser.c:324:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movl	$0, %edx	;,
	movq	%rax, 72(%rsp)	; self, %sfp
	movq	%rax, %rsi	; self,
	movq	%r12, 40(%rsp)	; name, %sfp
	movq	%r12, %rdi	; name,
	call	*create_variable@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp785, _290
; src/parser.c:324:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	%r14, %rdi	; parameters,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:325:         list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp786, body
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	72(%rsp), %rdx	; %sfp,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, %r8	;, tmp787
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp788, _293
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movl	$0, %ecx	;,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, %r8	;, tmp789
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movl	$0, %r9d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp790, _295
; src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%r12, %rdi	; body,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:327:         create_method_use_ptr(method, init, name, parameters, body, method->method_scope);
	movq	32(%rbp), %r9	; method_283->method_scope,
	movq	%r12, %r8	; body,
	movq	%r14, %rcx	; parameters,
	movq	40(%rsp), %rdx	; %sfp,
	movq	56(%rsp), %rsi	; %sfp,
	movq	%rbp, %rdi	; method,
	call	*create_method_use_ptr@GOTPCREL(%rip)	;
; src/parser.c:328:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movl	$0, %edx	;,
	movq	%rbp, %rsi	; method,
	movl	$0, %edi	;,
	call	*create_class_member@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp791, _297
; src/parser.c:328:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	48(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L311	;
.L359:
; src/parser.c:331:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp792, _301
; src/parser.c:331:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	%rbx, %rsi	; token,
	leaq	.LC88(%rip), %rdi	;, tmp596
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L312	;
.L360:
; src/parser.c:344:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp803, body
	movq	%rax, 72(%rsp)	; body, %sfp
; src/parser.c:345:     list(ClassMember*) ms = list_copy(members);
	movq	48(%rsp), %rdi	; %sfp,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp804, ms
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	88(%rsp), %rdx	; %sfp,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, %r8	;, tmp805
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp806, _326
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movl	$0, %ecx	;,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, %r8	;, tmp807
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movl	$0, %r9d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp808, _328
; src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rbx, %rdi	; body,
	call	*list_append@GOTPCREL(%rip)	;
.L317:
; src/parser.c:348:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	movq	%rbp, %rdi	; ms,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp818, mb
; src/parser.c:348:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	testq	%rax, %rax	; mb
	je	.L372	;,
; src/parser.c:349:         if (mb->type == CLASS_VARIABLE) {
	cmpl	$1, 8(%rbx)	;, mb_329->type
	jne	.L317	;,
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	(%rbx), %rax	; mb_329->content.variable, mb_329->content.variable
	movq	8(%rax), %rax	; _331->name, _332
	movq	%rax, 104(%rsp)	; _332, %sfp
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	88(%rsp), %rdx	; %sfp,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp809, _333
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	104(%rsp), %rdx	; %sfp,
	movl	$2, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, %r8	;, tmp810
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp811, _335
; src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movl	$0, %ecx	;,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, 104(%rsp)	; tmp812, %sfp
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	(%rbx), %rax	; mb_329->content.variable, mb_329->content.variable
	movq	16(%rax), %rcx	; _337->value, _338
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	testq	%rcx, %rcx	; _338
	je	.L373	;,
.L318:
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movl	$0, %edx	;,
	movq	104(%rsp), %rsi	; %sfp,
	movl	$13, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, %r8	;, tmp816
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movl	$0, %r9d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp817, _344
; src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	72(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L317	;
.L373:
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movl	$2, %esi	;,
	leaq	.LC89(%rip), %rdi	;, tmp610
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp813, _339
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp814, _340
; src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movl	$0, %ecx	;,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, %rcx	; tmp815, _338
	jmp	.L318	;
.L372:
; src/parser.c:355:     list(Expression*) args = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp819, args
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	88(%rsp), %rdx	; %sfp,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, %r8	;, tmp820
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp821, _347
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movl	$0, %ecx	;,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp822, _348
; src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	%rbx, %rdi	; args,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:357:     list(Variable*) params = list_copy(parameters);
	movq	%r14, %rdi	; parameters,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp823, params
; src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	jmp	.L320	;
.L321:
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	8(%rax), %rdx	; param_350->name, param_350->name
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, %r8	;, tmp824
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp825, _353
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movl	$0, %ecx	;,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp826, _354
; src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rbx, %rdi	; args,
	call	*list_append@GOTPCREL(%rip)	;
.L320:
; src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	movq	%rbp, %rdi	; params,
	call	*list_pop@GOTPCREL(%rip)	;
; src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	testq	%rax, %rax	; param
	jne	.L321	;,
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	56(%rsp), %rdx	; %sfp,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp828, _355
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rbx, %r8	; args,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$1, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, %r8	;, tmp829
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp830, _357
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movl	$0, %ecx	;,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, %r8	;, tmp831
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movl	$0, %r9d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$5, %edi	;,
	call	*create_statement@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp832, _359
; src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	72(%rsp), %rbx	; %sfp, body
	movq	%rbx, %rdi	; body,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:361:     create_method_use_ptr(method, constructor, name, parameters, body, method->method_scope);
	movq	32(%r12), %r9	; method_305->method_scope,
	movq	%rbx, %r8	; body,
	movq	%r14, %rcx	; parameters,
	movq	40(%rsp), %r14	; %sfp, name
	movq	%r14, %rdx	; name,
	movq	96(%rsp), %rsi	; %sfp,
	movq	%r12, %rdi	; method,
	call	*create_method_use_ptr@GOTPCREL(%rip)	;
; src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movl	$0, %edx	;,
	movq	%r12, %rsi	; method,
	movl	$0, %edi	;,
	call	*create_class_member@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp833, _361
; src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	48(%rsp), %rbx	; %sfp, members
	movq	%rbx, %rdi	; members,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:364:     return create_class_use_ptr(class, name, members, class_scope, size);
	movq	80(%rsp), %r8	; %sfp,
	movq	16(%rsp), %rcx	; %sfp,
	movq	%rbx, %rdx	; members,
	movq	%r14, %rsi	; name,
	movq	64(%rsp), %rdi	; %sfp,
	call	*create_class_use_ptr@GOTPCREL(%rip)	;
	movq	%rax, %rcx	; tmp834, _362
; src/parser.c:50:             if (class == NULL)
	testq	%rax, %rax	; _362
	je	.L326	;,
.L322:
; src/parser.c:52:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$2, %edi	;,
	call	*create_code_member@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp836, _36
; src/parser.c:52:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	32(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
.L237:
; src/parser.c:55:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; token, %sfp
; src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	; token
	je	.L226	;,
.L225:
; src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	movq	8(%rsp), %rax	; %sfp, token
	movl	24(%rax), %eax	; token_587->type, _39
; src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	testl	%eax, %eax	; _39
	je	.L226	;,
; src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	;, _39
	je	.L374	;,
.L264:
; src/parser.c:54:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	0(%r13), %rdi	; parser_74(D)->source_file, parser_74(D)->source_file
	call	*get_full_path@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp837, _38
; src/parser.c:54:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC91(%rip), %rdi	;,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L237	;
.L226:
; src/parser.c:58:     return create_code(members, global_scope);
	movq	24(%rsp), %rsi	; %sfp,
	movq	32(%rsp), %rdi	; %sfp,
	call	*create_code@GOTPCREL(%rip)	;
; src/parser.c:59: }
	addq	$136, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	parse_code, .-parse_code
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
