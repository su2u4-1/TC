	.file	"parser.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Failed to parse right operand\0"
	.text
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
parse_expr_prec:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp122, lexer
	movq	%rdx, %r13	 ; tmp123, expr_left
	movl	%r8d, %r15d	 ; tmp124, min_prec
	movq	%r9, %r14	 ; tmp125, now_scope
 ; D:/TC/src/parser.c:650:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	call	peek_next_token	 ;
 ; D:/TC/src/parser.c:651:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_26->type
	je	.L7	 ;,
	movq	%r13, %rsi	 ; expr_left, <retval>
	jmp	.L2	 ;
.L15:
 ; D:/TC/src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	160(%rsp), %rax	 ; parser, tmp141
	movq	(%rax), %rcx	 ; parser_37(D)->source_file, parser_37(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp131
 ; D:/TC/src/parser.c:660:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC0(%rip), %rcx	 ;, tmp115
	call	parser_error	 ;
 ; D:/TC/src/parser.c:662:             return NULL;
	jmp	.L1	 ;
.L13:
 ; D:/TC/src/parser.c:676:             token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:/TC/src/parser.c:666:         while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_51->type
	jne	.L5	 ;,
.L6:
 ; D:/TC/src/parser.c:667:             OperatorType next_op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_69->lexeme, token_69->lexeme
	call	string_to_operator	 ;
	movl	%eax, %ebx	 ; tmp134, next_op
 ; D:/TC/src/parser.c:668:             int next_prec = operator_precedence(next_op);
	movl	%eax, %ecx	 ; next_op,
	call	operator_precedence	 ;
 ; D:/TC/src/parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %ebx	 ;, next_op
	je	.L5	 ;,
	cmpl	%eax, %ebp	 ; next_prec, op_prec
	jge	.L5	 ;,
 ; D:/TC/src/parser.c:671:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	160(%rsp), %rdx	 ; parser, tmp142
	movq	%rdx, 32(%rsp)	 ; tmp142,
	movq	%r14, %r9	 ; now_scope,
	movl	%eax, %r8d	 ; next_prec,
	movq	%rsi, %rdx	 ; <retval>,
	movq	%rdi, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rsi	 ; tmp136, <retval>
 ; D:/TC/src/parser.c:672:             if (right == NULL) {
	testq	%rax, %rax	 ; <retval>
	jne	.L13	 ;,
	jmp	.L1	 ;
.L5:
 ; D:/TC/src/parser.c:678:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rsi, %r9	 ; <retval>,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; expr_left,
	movl	%r12d, %ecx	 ; op,
	call	create_expression	 ;
	movq	%rax, %r13	 ; tmp138, expr_left
 ; D:/TC/src/parser.c:679:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:/TC/src/parser.c:651:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_55->type
	jne	.L14	 ;,
.L7:
 ; D:/TC/src/parser.c:652:         OperatorType op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_70->lexeme, token_70->lexeme
	call	string_to_operator	 ;
	movl	%eax, %r12d	 ; tmp127, op
 ; D:/TC/src/parser.c:653:         int op_prec = operator_precedence(op);
	movl	%eax, %ecx	 ; op,
	call	operator_precedence	 ;
	movl	%eax, %ebp	 ; tmp128, op_prec
 ; D:/TC/src/parser.c:654:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, %r12d	 ;, op
	je	.L9	 ;,
	cmpl	%r15d, %eax	 ; min_prec, op_prec
	jl	.L9	 ;,
 ; D:/TC/src/parser.c:656:         token = get_next_token(lexer, true);  // consume operator
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:657:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp129, token
 ; D:/TC/src/parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	160(%rsp), %r8	 ; parser,
	movq	%r14, %rdx	 ; now_scope,
	movq	%rdi, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %rsi	 ; tmp130, <retval>
 ; D:/TC/src/parser.c:659:         if (right_primary == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L15	 ;,
 ; D:/TC/src/parser.c:664:         Expression* right = create_expression(OP_NONE, NULL, right_primary, NULL);
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; <retval>,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rsi	 ; tmp132, <retval>
 ; D:/TC/src/parser.c:665:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:/TC/src/parser.c:666:         while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_43->type
	je	.L6	 ;,
	jmp	.L5	 ;
.L14:
	movq	%r13, %rsi	 ; expr_left, <retval>
	jmp	.L2	 ;
.L9:
	movq	%r13, %rsi	 ; expr_left, <retval>
.L2:
 ; D:/TC/src/parser.c:681:     token = peek_current_token(lexer);
	movq	%rdi, %rcx	 ; lexer,
	call	peek_current_token	 ;
.L1:
 ; D:/TC/src/parser.c:684: }
	movq	%rsi, %rax	 ; <retval>,
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
	.align 8
.LC1:
	.ascii "Failed to parse expression primary\0"
	.text
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp93, lexer
	movq	%rdx, %rbp	 ; tmp94, now_scope
	movq	%r8, %rdi	 ; tmp95, parser
 ; D:/TC/src/parser.c:687:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %rbx	 ; tmp96, <retval>
 ; D:/TC/src/parser.c:688:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L20	 ;,
 ; D:/TC/src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; <retval>,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rdx	 ; tmp99, _4
 ; D:/TC/src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rdi, 32(%rsp)	 ; parser,
	movq	%rbp, %r9	 ; now_scope,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rbx	 ; tmp100, <retval>
.L16:
 ; D:/TC/src/parser.c:695: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L20:
 ; D:/TC/src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_10(D)->source_file, parser_10(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %rdi	 ; tmp97, _2
 ; D:/TC/src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rsi, %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %rdx	 ; tmp98, _3
 ; D:/TC/src/parser.c:689:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rdi, %r8	 ; _2,
	leaq	.LC1(%rip), %rcx	 ;, tmp91
	call	parser_error	 ;
 ; D:/TC/src/parser.c:691:         return NULL;
	jmp	.L16	 ;
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
	.def	parse_variable;	.scl	3;	.type	32;	.endef
parse_variable:
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp143, lexer
	movq	%rdx, %r12	 ; tmp144, now_scope
	movq	%r8, %rdi	 ; tmp145, parser
 ; D:/TC/src/parser.c:369:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rbx	 ; tmp146, token
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_38->type, _1
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _1
	je	.L22	 ;,
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _1
	jne	.L23	 ;,
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rbx), %rcx	 ; token_38->lexeme, token_38->lexeme
	call	is_builtin_type	 ;
 ; D:/TC/src/parser.c:370:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp147
	je	.L23	 ;,
.L22:
 ; D:/TC/src/parser.c:375:     Symbol* type = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rdx	 ; token_38->lexeme, token_38->lexeme
	movq	%r12, %rcx	 ; now_scope,
	call	search_name	 ;
	movq	%rax, %rbp	 ; tmp149, type
 ; D:/TC/src/parser.c:376:     if (type != NULL) {
	testq	%rax, %rax	 ; type
	je	.L25	 ;,
 ; D:/TC/src/parser.c:377:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; type_45->kind, _48
 ; D:/TC/src/parser.c:377:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	cmpl	$6, %eax	 ;, _48
	je	.L26	 ;,
	testl	%eax, %eax	 ; _48
	jne	.L35	 ;,
.L26:
 ; D:/TC/src/parser.c:381:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp152, token
 ; D:/TC/src/parser.c:382:     if (token->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	 ;, token_52->type
	jne	.L36	 ;,
.L27:
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movl	$3, %edx	 ;, iftmp.25_28
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	cmpb	$0, 10(%rdi)	 ;, parser_40(D)->in_class
	je	.L28	 ;,
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	cmpb	$1, 9(%rdi)	 ;, parser_40(D)->in_method
	sbbl	%edx, %edx	 ; iftmp.25_28
	andl	$2, %edx	 ;, iftmp.25_28
	addl	$3, %edx	 ;, iftmp.25_28
.L28:
 ; D:/TC/src/parser.c:384:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movq	(%rbx), %rcx	 ; token_52->lexeme, token_52->lexeme
	movq	%r12, %r9	 ; now_scope,
	movq	%rbp, %r8	 ; type,
	call	create_symbol	 ;
	movq	%rax, %rbx	 ; tmp154, name
 ; D:/TC/src/parser.c:386:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:/TC/src/parser.c:385:     Expression* value = NULL;
	movl	$0, %r13d	 ;, value
 ; D:/TC/src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_58->type
	je	.L37	 ;,
.L29:
 ; D:/TC/src/parser.c:395:     return create_variable(type, name, value);
	movq	%r13, %r8	 ; value,
	movq	%rbx, %rdx	 ; name,
	movq	%rbp, %rcx	 ; type,
	call	create_variable	 ;
.L21:
 ; D:/TC/src/parser.c:396: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
.L23:
 ; D:/TC/src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_40(D)->source_file, parser_40(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp148
 ; D:/TC/src/parser.c:371:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC2(%rip), %rcx	 ;, tmp122
	call	parser_error	 ;
 ; D:/TC/src/parser.c:373:         return NULL;
	movl	$0, %eax	 ;, <retval>
	jmp	.L21	 ;
.L35:
 ; D:/TC/src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_40(D)->source_file, parser_40(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp150
 ; D:/TC/src/parser.c:378:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC3(%rip), %rcx	 ;, tmp129
	call	parser_error	 ;
	jmp	.L26	 ;
.L25:
 ; D:/TC/src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_40(D)->source_file, parser_40(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp151
 ; D:/TC/src/parser.c:380:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC4(%rip), %rcx	 ;, tmp131
	call	parser_error	 ;
	jmp	.L26	 ;
.L36:
 ; D:/TC/src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_40(D)->source_file, parser_40(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp153
 ; D:/TC/src/parser.c:383:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC5(%rip), %rcx	 ;, tmp133
	call	parser_error	 ;
	jmp	.L27	 ;
.L37:
 ; D:/TC/src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx	 ;, tmp135
	movq	(%rdx), %rdx	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL
	movq	(%rax), %rcx	 ; token_58->lexeme, token_58->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:387:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	 ; tmp156
	je	.L29	 ;,
 ; D:/TC/src/parser.c:388:         token = get_next_token(lexer, true);  // consume '='
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:389:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r14	 ; tmp157, token
 ; D:/TC/src/parser.c:390:         value = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%r12, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %r13	 ; tmp158, value
 ; D:/TC/src/parser.c:391:         if (value == NULL)
	testq	%rax, %rax	 ; value
	jne	.L29	 ;,
 ; D:/TC/src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_40(D)->source_file, parser_40(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp159
 ; D:/TC/src/parser.c:392:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC6(%rip), %rcx	 ;, tmp139
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
	.def	parse_primary;	.scl	3;	.type	32;	.endef
parse_primary:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$72, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp316, lexer
	movq	%rdx, 152(%rsp)	 ; tmp317, now_scope
	movq	%r8, %r15	 ; tmp318, parser
 ; D:/TC/src/parser.c:699:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rdi	 ; tmp319, token
 ; D:/TC/src/parser.c:705:     if (token->type == INTEGER) {
	movl	24(%rax), %eax	 ; token_61->type, _1
 ; D:/TC/src/parser.c:705:     if (token->type == INTEGER) {
	cmpl	$2, %eax	 ;, _1
	je	.L92	 ;,
 ; D:/TC/src/parser.c:708:     } else if (token->type == FLOAT) {
	cmpl	$3, %eax	 ;, _1
	je	.L93	 ;,
 ; D:/TC/src/parser.c:711:     } else if (token->type == STRING) {
	cmpl	$4, %eax	 ;, _1
	je	.L94	 ;,
 ; D:/TC/src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _1
	je	.L95	 ;,
.L43:
 ; D:/TC/src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rdi)	 ;, token_61->type
	je	.L96	 ;,
.L51:
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movl	24(%rdi), %eax	 ; token_61->type, _33
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$1, %eax	 ;, _33
	je	.L52	 ;,
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$6, %eax	 ;, _33
	jne	.L53	 ;,
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp245
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	(%rdi), %rcx	 ; token_61->lexeme, token_61->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	testb	%al, %al	 ; tmp337
	je	.L53	 ;,
 ; D:/TC/src/parser.c:753:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpb	$0, 9(%r15)	 ;, parser_70(D)->in_method
	je	.L53	 ;,
.L52:
 ; D:/TC/src/parser.c:771:     Token* token = peek_current_token(lexer);
	movq	%rsi, %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %rbx	 ; tmp338, token
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movl	24(%rax), %eax	 ; token_106->type, _107
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	 ;, _107
	je	.L54	 ;,
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	 ;, _107
	jne	.L55	 ;,
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp248
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	(%rbx), %rcx	 ; token_106->lexeme, token_106->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:772:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	 ; tmp339
	je	.L55	 ;,
.L54:
 ; D:/TC/src/parser.c:780:     base_name = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rdx	 ; token_106->lexeme, token_106->lexeme
	movq	152(%rsp), %rcx	 ; now_scope,
	call	search_name	 ;
	movq	%rax, %r14	 ; tmp341, base_name
 ; D:/TC/src/parser.c:781:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; base_name,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, %rbp	 ; tmp342, variable_value
 ; D:/TC/src/parser.c:782:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	peek_next_token	 ;
	movq	%rax, %r13	 ; tmp343, token
 ; D:/TC/src/parser.c:783:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_116->type
	jne	.L57	 ;,
 ; D:/TC/src/parser.c:777:     Symbol* current_type = NULL;
	movl	$0, %ebx	 ;, class_name
 ; D:/TC/src/parser.c:779:     SymbolTable* var_scope = NULL;
	movl	$0, %r12d	 ;, var_scope
 ; D:/TC/src/parser.c:837:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	movq	%rdi, 56(%rsp)	 ; token, %sfp
	movq	%rbp, 48(%rsp)	 ; variable_value, %sfp
	movq	152(%rsp), %rdi	 ; now_scope, now_scope
	jmp	.L80	 ;
.L92:
 ; D:/TC/src/parser.c:707:         str_value = token->lexeme;
	movq	(%rdi), %rdx	 ; token_61->lexeme, str_value
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:/TC/src/parser.c:706:         type = PRIM_INTEGER;
	movl	$0, %edi	 ;, type
.L40:
 ; D:/TC/src/parser.c:767:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%rbp, 32(%rsp)	 ; variable_value,
	movq	%rsi, %r9	 ; prim_value,
	movq	%rbx, %r8	 ; <retval>,
	movl	%edi, %ecx	 ; type,
	call	create_primary	 ;
	movq	%rax, %rbx	 ; tmp382, <retval>
.L38:
 ; D:/TC/src/parser.c:768: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
.L93:
 ; D:/TC/src/parser.c:710:         str_value = token->lexeme;
	movq	(%rdi), %rdx	 ; token_61->lexeme, str_value
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:/TC/src/parser.c:709:         type = PRIM_FLOAT;
	movl	$1, %edi	 ;, type
	jmp	.L40	 ;
.L94:
 ; D:/TC/src/parser.c:713:         str_value = token->lexeme;
	movq	(%rdi), %rdx	 ; token_61->lexeme, str_value
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:/TC/src/parser.c:712:         type = PRIM_STRING;
	movl	$2, %edi	 ;, type
	jmp	.L40	 ;
.L95:
 ; D:/TC/src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	movq	.refptr.TRUE_KEYWORD(%rip), %rax	 ;, tmp221
	movq	(%rax), %rdx	 ; TRUE_KEYWORD, TRUE_KEYWORD
	movq	(%rdi), %rcx	 ; token_61->lexeme, token_61->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:714:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	 ; tmp320
	je	.L44	 ;,
 ; D:/TC/src/parser.c:716:         str_value = token->lexeme;
	movq	(%rdi), %rdx	 ; token_61->lexeme, str_value
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:/TC/src/parser.c:715:         type = PRIM_TRUE;
	movl	$3, %edi	 ;, type
 ; D:/TC/src/parser.c:716:         str_value = token->lexeme;
	jmp	.L40	 ;
.L44:
 ; D:/TC/src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, 24(%rdi)	 ;, token_61->type
	jne	.L43	 ;,
 ; D:/TC/src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movq	.refptr.FALSE_KEYWORD(%rip), %rax	 ;, tmp224
	movq	(%rax), %rdx	 ; FALSE_KEYWORD, FALSE_KEYWORD
	movq	(%rdi), %rcx	 ; token_61->lexeme, token_61->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:717:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	 ; tmp321
	je	.L43	 ;,
 ; D:/TC/src/parser.c:719:         str_value = token->lexeme;
	movq	(%rdi), %rdx	 ; token_61->lexeme, str_value
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:/TC/src/parser.c:718:         type = PRIM_FALSE;
	movl	$4, %edi	 ;, type
 ; D:/TC/src/parser.c:719:         str_value = token->lexeme;
	jmp	.L40	 ;
.L96:
 ; D:/TC/src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp227
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rdi), %rcx	 ; token_61->lexeme, token_61->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:720:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp322
	jne	.L97	 ;,
 ; D:/TC/src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	cmpl	$5, 24(%rdi)	 ;, token_61->type
	jne	.L51	 ;,
 ; D:/TC/src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp237
	movq	(%rax), %rdx	 ; NOT_SYMBOL, NOT_SYMBOL
	movq	(%rdi), %rcx	 ; token_61->lexeme, token_61->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:735:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	 ; tmp329
	jne	.L98	 ;,
 ; D:/TC/src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	cmpl	$5, 24(%rdi)	 ;, token_61->type
	jne	.L51	 ;,
 ; D:/TC/src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp241
	movq	(%rax), %rdx	 ; SUB_SYMBOL, SUB_SYMBOL
	movq	(%rdi), %rcx	 ; token_61->lexeme, token_61->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:744:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	 ; tmp333
	je	.L51	 ;,
 ; D:/TC/src/parser.c:746:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp334, token
 ; D:/TC/src/parser.c:747:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	152(%rsp), %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %rsi	 ; tmp335, prim_value
 ; D:/TC/src/parser.c:748:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	je	.L99	 ;,
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:/TC/src/parser.c:701:     string str_value = NULL;
	movl	$0, %edx	 ;, str_value
 ; D:/TC/src/parser.c:745:         type = PRIM_NEG_OPERAND;
	movl	$7, %edi	 ;, type
	jmp	.L40	 ;
.L97:
 ; D:/TC/src/parser.c:722:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp323, token
 ; D:/TC/src/parser.c:723:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	152(%rsp), %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %rbx	 ; tmp324, <retval>
 ; D:/TC/src/parser.c:724:         if (expr_value == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L100	 ;,
 ; D:/TC/src/parser.c:729:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp326, token
 ; D:/TC/src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %edi	 ; token_74->type, type
 ; D:/TC/src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %edi	 ;, type
	jne	.L49	 ;,
 ; D:/TC/src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp232
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_74->lexeme, token_74->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:730:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp327
	je	.L49	 ;,
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:/TC/src/parser.c:701:     string str_value = NULL;
	movl	$0, %edx	 ;, str_value
	jmp	.L40	 ;
.L100:
 ; D:/TC/src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp325
 ; D:/TC/src/parser.c:725:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC7(%rip), %rcx	 ;, tmp231
	call	parser_error	 ;
 ; D:/TC/src/parser.c:727:             return NULL;
	jmp	.L38	 ;
.L49:
 ; D:/TC/src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp328
 ; D:/TC/src/parser.c:731:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC8(%rip), %rcx	 ;, tmp236
	call	parser_error	 ;
 ; D:/TC/src/parser.c:733:             return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L38	 ;
.L98:
 ; D:/TC/src/parser.c:737:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp330, token
 ; D:/TC/src/parser.c:738:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	152(%rsp), %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %rsi	 ; tmp331, prim_value
 ; D:/TC/src/parser.c:739:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	je	.L101	 ;,
 ; D:/TC/src/parser.c:704:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:/TC/src/parser.c:701:     string str_value = NULL;
	movl	$0, %edx	 ;, str_value
 ; D:/TC/src/parser.c:736:         type = PRIM_NOT_OPERAND;
	movl	$6, %edi	 ;, type
	jmp	.L40	 ;
.L101:
 ; D:/TC/src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file,
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp332
 ; D:/TC/src/parser.c:740:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC9(%rip), %rcx	 ;, tmp240
	call	parser_error	 ;
 ; D:/TC/src/parser.c:742:             return NULL;
	movq	%rsi, %rbx	 ; prim_value, <retval>
	jmp	.L38	 ;
.L99:
 ; D:/TC/src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file,
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp336
 ; D:/TC/src/parser.c:749:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC10(%rip), %rcx	 ;, tmp244
	call	parser_error	 ;
 ; D:/TC/src/parser.c:751:             return NULL;
	movq	%rsi, %rbx	 ; prim_value, <retval>
	jmp	.L38	 ;
.L55:
 ; D:/TC/src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp340
 ; D:/TC/src/parser.c:773:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC11(%rip), %rcx	 ;, tmp252
	call	parser_error	 ;
 ; D:/TC/src/parser.c:775:         return NULL;
	jmp	.L81	 ;
.L59:
 ; D:/TC/src/parser.c:791:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp402
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	0(%r13), %rcx	 ; token_309->lexeme, token_309->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:791:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp344
	jne	.L102	 ;,
 ; D:/TC/src/parser.c:824:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp406
	movq	(%rax), %rdx	 ; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL
	movq	0(%r13), %rcx	 ; token_309->lexeme, token_309->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:824:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp362
	je	.L71	 ;,
 ; D:/TC/src/parser.c:825:             token = get_next_token(lexer, true);  // consume '['
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:826:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp363, token
 ; D:/TC/src/parser.c:827:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %rbp	 ; tmp364, index
 ; D:/TC/src/parser.c:828:             if (index == NULL)
	testq	%rax, %rax	 ; index
	je	.L103	 ;,
.L72:
 ; D:/TC/src/parser.c:830:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp366, token
 ; D:/TC/src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_184->type
	jne	.L73	 ;,
 ; D:/TC/src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp291
	movq	(%rax), %rdx	 ; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL
	movq	0(%r13), %rcx	 ; token_184->lexeme, token_184->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:831:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp367
	je	.L73	 ;,
 ; D:/TC/src/parser.c:836:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movq	$0, 32(%rsp)	 ;,
	movq	%rbp, %r9	 ; index,
	movl	$0, %r8d	 ;,
	movq	48(%rsp), %rdx	 ; %sfp,
	movl	$3, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, 48(%rsp)	 ; tmp369, %sfp
.L70:
 ; D:/TC/src/parser.c:872:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	peek_next_token	 ;
	movq	%rax, %r13	 ; tmp379, token
 ; D:/TC/src/parser.c:783:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_217->type
	jne	.L104	 ;,
.L80:
 ; D:/TC/src/parser.c:784:         if (base_name != NULL) {
	testq	%r14, %r14	 ; base_name
	je	.L58	 ;,
 ; D:/TC/src/parser.c:786:             if (base_name->type != NULL)  // subroutine or variable or attribute or parameter
	movq	(%r14), %rbx	 ; base_name_307->type, class_name
 ; D:/TC/src/parser.c:785:             current_type = base_name;     // class or type
	testq	%rbx, %rbx	 ; class_name
	cmove	%r14, %rbx	 ; class_name,, base_name, class_name
.L58:
 ; D:/TC/src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	testq	%r12, %r12	 ; var_scope
	jne	.L59	 ;,
	testq	%rbx, %rbx	 ; class_name
	je	.L59	 ;,
 ; D:/TC/src/parser.c:789:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rbx)	 ;, current_type_121->kind
	jne	.L59	 ;,
 ; D:/TC/src/parser.c:790:             var_scope = current_type->ast_node.class->class_scope;
	movq	24(%rbx), %rax	 ; current_type_121->ast_node.class, current_type_121->ast_node.class
	movq	16(%rax), %r12	 ; _125->class_scope, var_scope
	jmp	.L59	 ;
.L102:
 ; D:/TC/src/parser.c:792:             token = get_next_token(lexer, true);  // consume '('
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp345, token
 ; D:/TC/src/parser.c:793:             if (base_name == NULL)
	testq	%r14, %r14	 ; base_name
	je	.L105	 ;,
 ; D:/TC/src/parser.c:795:             else if (base_name->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%r14)	 ;, base_name_307->kind
	je	.L106	 ;,
.L63:
 ; D:/TC/src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	movl	32(%r14), %eax	 ; base_name_144->kind, tmp403
	subl	$1, %eax	 ;, tmp268
	cmpl	$1, %eax	 ;, tmp268
	ja	.L107	 ;,
.L62:
 ; D:/TC/src/parser.c:802:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp351, token
 ; D:/TC/src/parser.c:803:             list(Expression*) args = create_list();
	call	create_list	 ;
	movq	%rax, %r12	 ; tmp352, args
 ; D:/TC/src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r13	 ;, tmp313
 ; D:/TC/src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L64	 ;
.L105:
 ; D:/TC/src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp346
 ; D:/TC/src/parser.c:794:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC12(%rip), %rcx	 ;, tmp263
	call	parser_error	 ;
	jmp	.L62	 ;
.L106:
 ; D:/TC/src/parser.c:796:                 string name = make_method_name(base_name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp264
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
	movq	8(%r14), %rcx	 ; base_name_307->name, base_name_307->name
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp347, name
 ; D:/TC/src/parser.c:797:                 base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
	movq	24(%r14), %rax	 ; base_name_307->ast_node.class, base_name_307->ast_node.class
	movq	16(%rax), %rcx	 ; _138->class_scope, _139
	call	search_name_use_strcmp	 ;
	movq	%rax, %r14	 ; tmp348, base_name
 ; D:/TC/src/parser.c:798:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; base_name,
	movq	48(%rsp), %rdx	 ; %sfp,
	movl	$2, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, 48(%rsp)	 ; tmp349, %sfp
 ; D:/TC/src/parser.c:800:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	testq	%r14, %r14	 ; base_name
	jne	.L63	 ;,
	jmp	.L62	 ;
.L107:
 ; D:/TC/src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp350
 ; D:/TC/src/parser.c:801:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC13(%rip), %rcx	 ;, tmp271
	call	parser_error	 ;
	jmp	.L62	 ;
.L110:
 ; D:/TC/src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp354
 ; D:/TC/src/parser.c:807:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC14(%rip), %rcx	 ;, tmp273
	call	parser_error	 ;
	jmp	.L65	 ;
.L111:
 ; D:/TC/src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp404
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	movq	(%rbx), %rcx	 ; token_154->lexeme, token_154->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	testb	%al, %al	 ; tmp356
	jne	.L108	 ;,
 ; D:/TC/src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_154->type
	jne	.L66	 ;,
 ; D:/TC/src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%r13), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_154->lexeme, token_154->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:812:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp358
	je	.L66	 ;,
.L64:
 ; D:/TC/src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_153->type
	je	.L109	 ;,
.L69:
 ; D:/TC/src/parser.c:805:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %rbp	 ; tmp353, arg
 ; D:/TC/src/parser.c:806:                 if (arg == NULL)
	testq	%rax, %rax	 ; arg
	je	.L110	 ;,
.L65:
 ; D:/TC/src/parser.c:808:                 list_append(args, (pointer)arg);
	movq	%rbp, %rdx	 ; arg,
	movq	%r12, %rcx	 ; args,
	call	list_append	 ;
 ; D:/TC/src/parser.c:809:                 token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp355, token
 ; D:/TC/src/parser.c:810:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_154->type
	je	.L111	 ;,
.L66:
 ; D:/TC/src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdi	 ; %sfp, token
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp359
 ; D:/TC/src/parser.c:813:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC15(%rip), %rcx	 ;, tmp281
	call	parser_error	 ;
.L81:
 ; D:/TC/src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp380
 ; D:/TC/src/parser.c:757:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC21(%rip), %rcx	 ;, tmp307
	call	parser_error	 ;
 ; D:/TC/src/parser.c:759:             return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L38	 ;
.L108:
 ; D:/TC/src/parser.c:811:                     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp357, token
 ; D:/TC/src/parser.c:811:                     token = get_next_token(lexer, true);
	jmp	.L64	 ;
.L109:
 ; D:/TC/src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp405
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_153->lexeme, token_153->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:804:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp360
	je	.L69	 ;,
 ; D:/TC/src/parser.c:818:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%r12, 32(%rsp)	 ; args,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	48(%rsp), %rdx	 ; %sfp,
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, 48(%rsp)	 ; tmp361, %sfp
 ; D:/TC/src/parser.c:819:             base_name = base_name->type;
	movq	(%r14), %r14	 ; base_name_172->type, base_name
 ; D:/TC/src/parser.c:822:             if (base_name->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r14)	 ;, base_name_173->kind
	jne	.L86	 ;,
 ; D:/TC/src/parser.c:823:                 var_scope = base_name->ast_node.class->class_scope;
	movq	24(%r14), %rax	 ; base_name_173->ast_node.class, base_name_173->ast_node.class
	movq	16(%rax), %r12	 ; _175->class_scope, var_scope
 ; D:/TC/src/parser.c:820:             current_type = NULL;
	movl	$0, %ebx	 ;, class_name
	jmp	.L70	 ;
.L103:
 ; D:/TC/src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp365
 ; D:/TC/src/parser.c:829:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC16(%rip), %rcx	 ;, tmp290
	call	parser_error	 ;
	jmp	.L72	 ;
.L73:
 ; D:/TC/src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdi	 ; %sfp, token
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp368
 ; D:/TC/src/parser.c:832:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC17(%rip), %rcx	 ;, tmp295
	call	parser_error	 ;
 ; D:/TC/src/parser.c:834:                 return NULL;
	jmp	.L81	 ;
.L71:
 ; D:/TC/src/parser.c:837:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp407
	movq	(%rax), %rdx	 ; DOT_SYMBOL, DOT_SYMBOL
	movq	0(%r13), %rcx	 ; token_309->lexeme, token_309->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:837:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	 ; tmp370
	je	.L90	 ;,
 ; D:/TC/src/parser.c:838:             token = get_next_token(lexer, true);  // consume '.'
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:839:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp371, token
 ; D:/TC/src/parser.c:840:             if (var_scope == NULL) {
	testq	%r12, %r12	 ; var_scope
	je	.L112	 ;,
 ; D:/TC/src/parser.c:845:             if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_195->type
	jne	.L113	 ;,
 ; D:/TC/src/parser.c:850:             base_name = search_name(var_scope, token->lexeme);
	movq	(%rax), %rdx	 ; token_195->lexeme, token_195->lexeme
	movq	%r12, %rcx	 ; var_scope,
	call	search_name	 ;
	movq	%rax, %r14	 ; tmp374, base_name
 ; D:/TC/src/parser.c:851:             if (base_name == NULL) {
	testq	%rax, %rax	 ; base_name
	je	.L114	 ;,
.L77:
 ; D:/TC/src/parser.c:867:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%r14, %r8	 ; base_name,
	movq	48(%rsp), %rdx	 ; %sfp,
	movl	$2, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, 48(%rsp)	 ; tmp378, %sfp
 ; D:/TC/src/parser.c:869:             var_scope = NULL;
	movl	$0, %r12d	 ;, var_scope
 ; D:/TC/src/parser.c:868:             current_type = NULL;
	movl	$0, %ebx	 ;, class_name
	jmp	.L70	 ;
.L112:
 ; D:/TC/src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdi	 ; %sfp, token
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp372
 ; D:/TC/src/parser.c:841:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC18(%rip), %rcx	 ;, tmp300
	call	parser_error	 ;
 ; D:/TC/src/parser.c:843:                 return NULL;
	jmp	.L81	 ;
.L113:
 ; D:/TC/src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdi	 ; %sfp, token
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp373
 ; D:/TC/src/parser.c:846:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC19(%rip), %rcx	 ;, tmp302
	call	parser_error	 ;
 ; D:/TC/src/parser.c:848:                 return NULL;
	jmp	.L81	 ;
.L114:
 ; D:/TC/src/parser.c:853:                 if (current_type != NULL) {
	testq	%rbx, %rbx	 ; class_name
	je	.L78	 ;,
 ; D:/TC/src/parser.c:854:                     if (current_type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rbx)	 ;, current_type_121->kind
	jne	.L79	 ;,
 ; D:/TC/src/parser.c:855:                         class_name = current_type->name;
	movq	8(%rbx), %rbx	 ; current_type_121->name, class_name
.L78:
 ; D:/TC/src/parser.c:859:                 string name = make_method_name(class_name, token->lexeme);
	movq	0(%r13), %rdx	 ; token_195->lexeme, token_195->lexeme
	movq	%rbx, %rcx	 ; class_name,
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp375, name
 ; D:/TC/src/parser.c:860:                 base_name = search_name_use_strcmp(var_scope, name);
	movq	%r12, %rcx	 ; var_scope,
	call	search_name_use_strcmp	 ;
	movq	%rax, %r14	 ; tmp376, base_name
 ; D:/TC/src/parser.c:862:             if (base_name == NULL) {
	testq	%rax, %rax	 ; base_name
	jne	.L77	 ;,
 ; D:/TC/src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdi	 ; %sfp, token
	movq	(%r15), %rcx	 ; parser_70(D)->source_file,
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp377
 ; D:/TC/src/parser.c:863:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC20(%rip), %rcx	 ;, tmp305
	call	parser_error	 ;
 ; D:/TC/src/parser.c:865:                 return NULL;
	jmp	.L81	 ;
.L79:
 ; D:/TC/src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	movq	(%rbx), %rbx	 ; current_type_121->type, class_name
 ; D:/TC/src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	testq	%rbx, %rbx	 ; class_name
	je	.L78	 ;,
 ; D:/TC/src/parser.c:856:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rbx)	 ;, _206->kind
	jne	.L87	 ;,
 ; D:/TC/src/parser.c:857:                         class_name = current_type->type->name;
	movq	8(%rbx), %rbx	 ; _206->name, class_name
	jmp	.L78	 ;
.L87:
 ; D:/TC/src/parser.c:852:                 string class_name = NULL;
	movq	%rax, %rbx	 ; base_name, class_name
	jmp	.L78	 ;
.L86:
 ; D:/TC/src/parser.c:821:             var_scope = NULL;
	movl	$0, %r12d	 ;, var_scope
 ; D:/TC/src/parser.c:820:             current_type = NULL;
	movl	$0, %ebx	 ;, class_name
	jmp	.L70	 ;
.L104:
	movq	56(%rsp), %rdi	 ; %sfp, token
	movq	48(%rsp), %rbp	 ; %sfp, variable_value
.L57:
 ; D:/TC/src/parser.c:756:         if (variable_value == NULL) {
	testq	%rbp, %rbp	 ; variable_value
	je	.L81	 ;,
 ; D:/TC/src/parser.c:703:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:/TC/src/parser.c:702:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:/TC/src/parser.c:701:     string str_value = NULL;
	movl	$0, %edx	 ;, str_value
 ; D:/TC/src/parser.c:754:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %edi	 ;, type
	jmp	.L40	 ;
.L90:
	movq	56(%rsp), %rdi	 ; %sfp, token
	movq	48(%rsp), %rbp	 ; %sfp, variable_value
	jmp	.L57	 ;
.L53:
 ; D:/TC/src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp381
 ; D:/TC/src/parser.c:762:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC22(%rip), %rcx	 ;, tmp309
	call	parser_error	 ;
 ; D:/TC/src/parser.c:764:         return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L38	 ;
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
	subq	$104, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp502, lexer
	movq	%rdx, %rbp	 ; tmp503, now_scope
	movq	%r8, %rdi	 ; tmp504, parser
 ; D:/TC/src/parser.c:400:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
 ; D:/TC/src/parser.c:402:     if (token->type == KEYWORD) {
	cmpl	$6, 24(%rax)	 ;, token_58->type
	je	.L200	 ;,
 ; D:/TC/src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
 ; D:/TC/src/parser.c:436:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp634,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp635, <retval>
.L185:
 ; D:/TC/src/parser.c:437:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %rsi	 ; tmp636, token
 ; D:/TC/src/parser.c:438:     if (statement == NULL)
	testq	%rbp, %rbp	 ; <retval>
	je	.L201	 ;,
.L192:
 ; D:/TC/src/parser.c:440:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp638, token
 ; D:/TC/src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_108->type
	je	.L202	 ;,
.L193:
 ; D:/TC/src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp640
 ; D:/TC/src/parser.c:442:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC52(%rip), %rcx	 ;, tmp488
	call	parser_error	 ;
.L115:
 ; D:/TC/src/parser.c:445: }
	movq	%rbp, %rax	 ; <retval>,
	addq	$104, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
.L200:
	movq	%rax, %rsi	 ; tmp505, token
 ; D:/TC/src/parser.c:403:         if (string_equal(token->lexeme, IF_KEYWORD))
	movq	.refptr.IF_KEYWORD(%rip), %rax	 ;, tmp332
	movq	(%rax), %rdx	 ; IF_KEYWORD, IF_KEYWORD
	movq	(%rsi), %rcx	 ; token_58->lexeme, token_58->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:403:         if (string_equal(token->lexeme, IF_KEYWORD))
	testb	%al, %al	 ; tmp506
	jne	.L203	 ;,
 ; D:/TC/src/parser.c:405:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	movq	.refptr.FOR_KEYWORD(%rip), %rax	 ;, tmp391
	movq	(%rax), %rdx	 ; FOR_KEYWORD, FOR_KEYWORD
	movq	(%rsi), %rcx	 ; token_58->lexeme, token_58->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:405:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	testb	%al, %al	 ; tmp560
	jne	.L204	 ;,
 ; D:/TC/src/parser.c:407:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	movq	.refptr.WHILE_KEYWORD(%rip), %rax	 ;, tmp439
	movq	(%rax), %rdx	 ; WHILE_KEYWORD, WHILE_KEYWORD
	movq	(%rsi), %rcx	 ; token_58->lexeme, token_58->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:407:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	testb	%al, %al	 ; tmp596
	jne	.L205	 ;,
 ; D:/TC/src/parser.c:409:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp464
	movq	(%rax), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD
	movq	(%rsi), %rcx	 ; token_58->lexeme, token_58->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:409:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; tmp617
	je	.L184	 ;,
 ; D:/TC/src/parser.c:410:             get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:411:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; D:/TC/src/parser.c:411:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rax, 40(%rsp)	 ; tmp618,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp619, <retval>
	jmp	.L185	 ;
.L203:
 ; D:/TC/src/parser.c:449:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp507, token
 ; D:/TC/src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_112->type
	jne	.L118	 ;,
 ; D:/TC/src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp335
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_112->lexeme, token_112->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:450:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp508
	je	.L118	 ;,
 ; D:/TC/src/parser.c:455:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp510, token
 ; D:/TC/src/parser.c:456:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, 72(%rsp)	 ; condition, %sfp
 ; D:/TC/src/parser.c:457:     if (condition == NULL)
	testq	%rax, %rax	 ; condition
	je	.L206	 ;,
.L121:
 ; D:/TC/src/parser.c:459:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp513, token
 ; D:/TC/src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_123->type
	jne	.L122	 ;,
 ; D:/TC/src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp342
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_123->lexeme, token_123->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:460:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp514
	je	.L122	 ;,
 ; D:/TC/src/parser.c:465:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp516, token
 ; D:/TC/src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_130->type
	jne	.L124	 ;,
 ; D:/TC/src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp347
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%rsi), %rcx	 ; token_130->lexeme, token_130->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:466:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp517
	je	.L124	 ;,
 ; D:/TC/src/parser.c:471:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, %r15	 ; tmp519, body
 ; D:/TC/src/parser.c:472:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp520, token
 ; D:/TC/src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r13	 ;, tmp496
 ; D:/TC/src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	leaq	.LC27(%rip), %r14	 ;, tmp497
 ; D:/TC/src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L126	 ;
.L118:
 ; D:/TC/src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp509
 ; D:/TC/src/parser.c:451:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC23(%rip), %rcx	 ;, tmp339
	call	parser_error	 ;
 ; D:/TC/src/parser.c:453:         return NULL;
	movl	$0, %edx	 ;, _215
.L120:
 ; D:/TC/src/parser.c:404:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$2, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp559, <retval>
 ; D:/TC/src/parser.c:404:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	jmp	.L115	 ;
.L206:
 ; D:/TC/src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp512
 ; D:/TC/src/parser.c:458:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC24(%rip), %rcx	 ;, tmp341
	call	parser_error	 ;
	jmp	.L121	 ;
.L122:
 ; D:/TC/src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp515
 ; D:/TC/src/parser.c:461:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC25(%rip), %rcx	 ;, tmp346
	call	parser_error	 ;
 ; D:/TC/src/parser.c:463:         return NULL;
	movl	$0, %edx	 ;, _215
	jmp	.L120	 ;
.L124:
 ; D:/TC/src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp518
 ; D:/TC/src/parser.c:467:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC26(%rip), %rcx	 ;, tmp351
	call	parser_error	 ;
 ; D:/TC/src/parser.c:469:         return NULL;
	movl	$0, %edx	 ;, _215
	jmp	.L120	 ;
.L128:
 ; D:/TC/src/parser.c:474:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %rsi	 ; tmp521, statement
 ; D:/TC/src/parser.c:475:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L207	 ;,
.L127:
 ; D:/TC/src/parser.c:477:         list_append(body, (pointer)statement);
	movq	%rsi, %rdx	 ; statement,
	movq	%r15, %rcx	 ; body,
	call	list_append	 ;
 ; D:/TC/src/parser.c:478:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp523, token
.L126:
 ; D:/TC/src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_142->type
	jne	.L128	 ;,
 ; D:/TC/src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%r13), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%r12), %rcx	 ; token_142->lexeme, token_142->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:473:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp524
	je	.L128	 ;,
 ; D:/TC/src/parser.c:480:     list(ElseIf*) else_if = create_list();
	call	create_list	 ;
	movq	%rax, 64(%rsp)	 ; tmp525, %sfp
 ; D:/TC/src/parser.c:481:     list(Statement*) else_body = create_list();
	call	create_list	 ;
	movq	%rax, 80(%rsp)	 ; tmp526, %sfp
 ; D:/TC/src/parser.c:482:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
	movq	%rax, %rsi	 ; tmp527, token
 ; D:/TC/src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_150->type
	jne	.L130	 ;,
 ; D:/TC/src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14	 ;, tmp494
	movq	%r15, 88(%rsp)	 ; body, %sfp
	jmp	.L129	 ;
.L207:
 ; D:/TC/src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp522
 ; D:/TC/src/parser.c:476:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	movq	%r14, %rcx	 ; tmp497,
	call	parser_error	 ;
	jmp	.L127	 ;
.L131:
 ; D:/TC/src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp530
 ; D:/TC/src/parser.c:487:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC28(%rip), %rcx	 ;, tmp361
	call	parser_error	 ;
 ; D:/TC/src/parser.c:489:             return NULL;
	movl	$0, %edx	 ;, _215
	jmp	.L120	 ;
.L210:
 ; D:/TC/src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp533
 ; D:/TC/src/parser.c:494:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC29(%rip), %rcx	 ;, tmp363
	call	parser_error	 ;
	jmp	.L133	 ;
.L134:
 ; D:/TC/src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp536
 ; D:/TC/src/parser.c:497:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC30(%rip), %rcx	 ;, tmp368
	call	parser_error	 ;
 ; D:/TC/src/parser.c:499:             return NULL;
	movl	$0, %edx	 ;, _215
	jmp	.L120	 ;
.L136:
 ; D:/TC/src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp539
 ; D:/TC/src/parser.c:503:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC31(%rip), %rcx	 ;, tmp373
	call	parser_error	 ;
 ; D:/TC/src/parser.c:505:             return NULL;
	movl	$0, %edx	 ;, _215
	jmp	.L120	 ;
.L140:
 ; D:/TC/src/parser.c:510:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp542, statement
 ; D:/TC/src/parser.c:511:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L208	 ;,
.L139:
 ; D:/TC/src/parser.c:513:             list_append(elif_body, (pointer)statement);
	movq	%r12, %rdx	 ; statement,
	movq	%r13, %rcx	 ; elif_body,
	call	list_append	 ;
 ; D:/TC/src/parser.c:514:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp544, token
.L138:
 ; D:/TC/src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_181->type
	jne	.L140	 ;,
 ; D:/TC/src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rsi), %rcx	 ; token_181->lexeme, token_181->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp545
	je	.L140	 ;,
 ; D:/TC/src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%r13, %rdx	 ; elif_body,
	movq	56(%rsp), %rcx	 ; %sfp,
	call	create_else_if	 ;
	movq	%rax, %rdx	 ; tmp546, _187
 ; D:/TC/src/parser.c:516:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	64(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:/TC/src/parser.c:517:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
	movq	%rax, %rsi	 ; tmp547, token
 ; D:/TC/src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_188->type
	jne	.L198	 ;,
.L129:
 ; D:/TC/src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	movq	.refptr.ELIF_KEYWORD(%rip), %rax	 ;, tmp680
	movq	(%rax), %rdx	 ; ELIF_KEYWORD, ELIF_KEYWORD
	movq	(%rsi), %rcx	 ; token_9->lexeme, token_9->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:483:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	 ; tmp548
	je	.L209	 ;,
 ; D:/TC/src/parser.c:484:         token = get_next_token(lexer, true);  // consume 'elif'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:485:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp528, token
 ; D:/TC/src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_151->type
	jne	.L131	 ;,
 ; D:/TC/src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp357
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_151->lexeme, token_151->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:486:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp529
	je	.L131	 ;,
 ; D:/TC/src/parser.c:491:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp531, token
 ; D:/TC/src/parser.c:492:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, 56(%rsp)	 ; elif_condition, %sfp
 ; D:/TC/src/parser.c:493:         if (elif_condition == NULL)
	testq	%rax, %rax	 ; elif_condition
	je	.L210	 ;,
.L133:
 ; D:/TC/src/parser.c:495:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp534, token
 ; D:/TC/src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_162->type
	jne	.L134	 ;,
 ; D:/TC/src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp364
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_162->lexeme, token_162->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:496:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp535
	je	.L134	 ;,
 ; D:/TC/src/parser.c:501:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp537, token
 ; D:/TC/src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_169->type
	jne	.L136	 ;,
 ; D:/TC/src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp369
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%rsi), %rcx	 ; token_169->lexeme, token_169->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:502:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp538
	je	.L136	 ;,
 ; D:/TC/src/parser.c:507:         list(Statement*) elif_body = create_list();
	call	create_list	 ;
	movq	%rax, %r13	 ; tmp540, elif_body
 ; D:/TC/src/parser.c:508:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp541, token
 ; D:/TC/src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	leaq	.LC32(%rip), %r15	 ;, tmp493
 ; D:/TC/src/parser.c:509:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L138	 ;
.L208:
 ; D:/TC/src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp543
 ; D:/TC/src/parser.c:512:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r15, %rcx	 ; tmp493,
	call	parser_error	 ;
	jmp	.L139	 ;
.L209:
 ; D:/TC/src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	movq	88(%rsp), %r15	 ; %sfp, body
	cmpl	$6, 24(%rsi)	 ;, token_9->type
	jne	.L130	 ;,
 ; D:/TC/src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	movq	.refptr.ELSE_KEYWORD(%rip), %rax	 ;, tmp382
	movq	(%rax), %rdx	 ; ELSE_KEYWORD, ELSE_KEYWORD
	movq	(%rsi), %rcx	 ; token_9->lexeme, token_9->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:519:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	 ; tmp549
	je	.L130	 ;,
 ; D:/TC/src/parser.c:520:         token = get_next_token(lexer, true);  // consume 'else'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:521:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp550, token
 ; D:/TC/src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_198->type
	jne	.L142	 ;,
 ; D:/TC/src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp385
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	movq	(%rsi), %rcx	 ; token_198->lexeme,
	call	string_equal	 ;
 ; D:/TC/src/parser.c:522:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp551
	je	.L142	 ;,
 ; D:/TC/src/parser.c:527:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp553, token
 ; D:/TC/src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14	 ;, tmp490
 ; D:/TC/src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	leaq	.LC34(%rip), %r13	 ;, tmp491
 ; D:/TC/src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L144	 ;
.L142:
 ; D:/TC/src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file,
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp552
 ; D:/TC/src/parser.c:523:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC33(%rip), %rcx	 ;, tmp386
	call	parser_error	 ;
 ; D:/TC/src/parser.c:525:             return NULL;
	movl	$0, %edx	 ;, _215
	jmp	.L120	 ;
.L146:
 ; D:/TC/src/parser.c:529:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp554, statement
 ; D:/TC/src/parser.c:530:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L211	 ;,
.L145:
 ; D:/TC/src/parser.c:532:             list_append(else_body, (pointer)statement);
	movq	%r12, %rdx	 ; statement,
	movq	80(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:/TC/src/parser.c:533:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp556, token
.L144:
 ; D:/TC/src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_209->type
	jne	.L146	 ;,
 ; D:/TC/src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rsi), %rcx	 ; token_209->lexeme, token_209->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:528:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp557
	je	.L146	 ;,
	jmp	.L130	 ;
.L211:
 ; D:/TC/src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file,
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp555
 ; D:/TC/src/parser.c:531:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r13, %rcx	 ; tmp491,
	call	parser_error	 ;
	jmp	.L145	 ;
.L198:
	movq	88(%rsp), %r15	 ; %sfp, body
.L130:
 ; D:/TC/src/parser.c:536:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:/TC/src/parser.c:538:     return create_if(condition, body, else_if, else_body);
	movq	80(%rsp), %r9	 ; %sfp,
	movq	64(%rsp), %r8	 ; %sfp,
	movq	%r15, %rdx	 ; body,
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_if	 ;
	movq	%rax, %rdx	 ; tmp558, _215
	jmp	.L120	 ;
.L204:
 ; D:/TC/src/parser.c:543:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp561, token
 ; D:/TC/src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_217->type
	jne	.L149	 ;,
 ; D:/TC/src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp394
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_217->lexeme, token_217->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:544:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp562
	je	.L149	 ;,
 ; D:/TC/src/parser.c:549:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp564, token
 ; D:/TC/src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_224->type
	je	.L212	 ;,
.L152:
 ; D:/TC/src/parser.c:552:         initializer = parse_variable(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
	movq	%rax, %r13	 ; tmp566, initializer
 ; D:/TC/src/parser.c:553:         if (initializer == NULL)
	testq	%rax, %rax	 ; initializer
	je	.L213	 ;,
.L154:
 ; D:/TC/src/parser.c:555:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp568, token
.L153:
 ; D:/TC/src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_233->type
	jne	.L155	 ;,
 ; D:/TC/src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp404
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rsi), %rcx	 ; token_233->lexeme, token_233->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:557:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp569
	je	.L155	 ;,
 ; D:/TC/src/parser.c:562:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp571, token
 ; D:/TC/src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_240->type
	je	.L214	 ;,
.L157:
 ; D:/TC/src/parser.c:565:         condition = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %rsi	 ; tmp573, condition
 ; D:/TC/src/parser.c:566:         if (condition == NULL)
	testq	%rax, %rax	 ; condition
	je	.L215	 ;,
.L159:
 ; D:/TC/src/parser.c:568:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp575, token
.L158:
 ; D:/TC/src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_249->type
	jne	.L160	 ;,
 ; D:/TC/src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp414
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%r12), %rcx	 ; token_249->lexeme, token_249->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:570:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp576
	je	.L160	 ;,
 ; D:/TC/src/parser.c:575:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp578, token
 ; D:/TC/src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_256->type
	je	.L216	 ;,
.L162:
 ; D:/TC/src/parser.c:578:         increment = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, 56(%rsp)	 ; increment, %sfp
 ; D:/TC/src/parser.c:579:         if (increment == NULL)
	testq	%rax, %rax	 ; increment
	je	.L217	 ;,
.L164:
 ; D:/TC/src/parser.c:581:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp582, token
.L163:
 ; D:/TC/src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_265->type
	jne	.L165	 ;,
 ; D:/TC/src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp424
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%r12), %rcx	 ; token_265->lexeme, token_265->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:583:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp583
	je	.L165	 ;,
 ; D:/TC/src/parser.c:588:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp585, token
 ; D:/TC/src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_272->type
	jne	.L167	 ;,
 ; D:/TC/src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp429
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%r12), %rcx	 ; token_272->lexeme, token_272->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:589:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp586
	je	.L167	 ;,
 ; D:/TC/src/parser.c:594:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, %r14	 ; tmp588, body
 ; D:/TC/src/parser.c:595:     parser->in_loop = true;
	movb	$1, 11(%rdi)	 ;, parser_60(D)->in_loop
 ; D:/TC/src/parser.c:596:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp589, token
 ; D:/TC/src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r15	 ;, tmp498
	movq	%r13, 64(%rsp)	 ; initializer, %sfp
 ; D:/TC/src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L169	 ;
.L149:
 ; D:/TC/src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp563
 ; D:/TC/src/parser.c:545:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC35(%rip), %rcx	 ;, tmp398
	call	parser_error	 ;
 ; D:/TC/src/parser.c:547:         return NULL;
	movl	$0, %r9d	 ;, _293
.L151:
 ; D:/TC/src/parser.c:406:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$4, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp595, <retval>
 ; D:/TC/src/parser.c:406:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L115	 ;
.L212:
 ; D:/TC/src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp399
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rsi), %rcx	 ; token_224->lexeme, token_224->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:550:     Variable* initializer = NULL;
	movl	$0, %r13d	 ;, initializer
 ; D:/TC/src/parser.c:551:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp565
	jne	.L153	 ;,
	jmp	.L152	 ;
.L213:
 ; D:/TC/src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp567
 ; D:/TC/src/parser.c:554:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC36(%rip), %rcx	 ;, tmp403
	call	parser_error	 ;
	jmp	.L154	 ;
.L155:
 ; D:/TC/src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp570
 ; D:/TC/src/parser.c:558:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC37(%rip), %rcx	 ;, tmp408
	call	parser_error	 ;
 ; D:/TC/src/parser.c:560:         return NULL;
	movl	$0, %r9d	 ;, _293
	jmp	.L151	 ;
.L214:
 ; D:/TC/src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp409
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%r12), %rcx	 ; token_240->lexeme, token_240->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:563:     Expression* condition = NULL;
	movl	$0, %esi	 ;, condition
 ; D:/TC/src/parser.c:564:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp572
	jne	.L158	 ;,
	jmp	.L157	 ;
.L215:
 ; D:/TC/src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp574
 ; D:/TC/src/parser.c:567:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC38(%rip), %rcx	 ;, tmp413
	call	parser_error	 ;
	jmp	.L159	 ;
.L160:
 ; D:/TC/src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp577
 ; D:/TC/src/parser.c:571:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC39(%rip), %rcx	 ;, tmp418
	call	parser_error	 ;
 ; D:/TC/src/parser.c:573:         return NULL;
	movl	$0, %r9d	 ;, _293
	jmp	.L151	 ;
.L216:
 ; D:/TC/src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp419
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%r12), %rcx	 ; token_256->lexeme, token_256->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:576:     Expression* increment = NULL;
	movq	$0, 56(%rsp)	 ;, %sfp
 ; D:/TC/src/parser.c:577:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp579
	jne	.L163	 ;,
	jmp	.L162	 ;
.L217:
 ; D:/TC/src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp581
 ; D:/TC/src/parser.c:580:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC40(%rip), %rcx	 ;, tmp423
	call	parser_error	 ;
	jmp	.L164	 ;
.L165:
 ; D:/TC/src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp584
 ; D:/TC/src/parser.c:584:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC41(%rip), %rcx	 ;, tmp428
	call	parser_error	 ;
 ; D:/TC/src/parser.c:586:         return NULL;
	movl	$0, %r9d	 ;, _293
	jmp	.L151	 ;
.L167:
 ; D:/TC/src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp587
 ; D:/TC/src/parser.c:590:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC42(%rip), %rcx	 ;, tmp433
	call	parser_error	 ;
 ; D:/TC/src/parser.c:592:         return NULL;
	movl	$0, %r9d	 ;, _293
	jmp	.L151	 ;
.L171:
 ; D:/TC/src/parser.c:598:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r13	 ; tmp590, statement
 ; D:/TC/src/parser.c:599:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L218	 ;,
.L170:
 ; D:/TC/src/parser.c:601:         list_append(body, (pointer)statement);
	movq	%r13, %rdx	 ; statement,
	movq	%r14, %rcx	 ; body,
	call	list_append	 ;
 ; D:/TC/src/parser.c:602:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp592, token
.L169:
 ; D:/TC/src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_284->type
	jne	.L171	 ;,
 ; D:/TC/src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r15), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%r12), %rcx	 ; token_284->lexeme, token_284->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:597:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp593
	je	.L171	 ;,
 ; D:/TC/src/parser.c:604:     parser->in_loop = false;
	movq	64(%rsp), %r13	 ; %sfp, initializer
	movb	$0, 11(%rdi)	 ;, parser_60(D)->in_loop
 ; D:/TC/src/parser.c:606:     return create_for(initializer, condition, increment, body);
	movq	%r14, %r9	 ; body,
	movq	56(%rsp), %r8	 ; %sfp,
	movq	%rsi, %rdx	 ; condition,
	movq	%r13, %rcx	 ; initializer,
	call	create_for	 ;
	movq	%rax, %r9	 ; tmp594, _293
	jmp	.L151	 ;
.L218:
 ; D:/TC/src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp591
 ; D:/TC/src/parser.c:600:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC43(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L170	 ;
.L205:
 ; D:/TC/src/parser.c:611:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp597, token
 ; D:/TC/src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_295->type
	jne	.L173	 ;,
 ; D:/TC/src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp442
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_295->lexeme, token_295->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:612:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp598
	je	.L173	 ;,
 ; D:/TC/src/parser.c:617:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp600, token
 ; D:/TC/src/parser.c:618:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %r14	 ; tmp601, condition
 ; D:/TC/src/parser.c:619:     if (condition == NULL)
	testq	%rax, %rax	 ; condition
	je	.L219	 ;,
.L176:
 ; D:/TC/src/parser.c:621:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp603, token
 ; D:/TC/src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_306->type
	jne	.L177	 ;,
 ; D:/TC/src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp449
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_306->lexeme, token_306->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:622:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp604
	je	.L177	 ;,
 ; D:/TC/src/parser.c:627:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp606, token
 ; D:/TC/src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_313->type
	jne	.L179	 ;,
 ; D:/TC/src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp454
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%rsi), %rcx	 ; token_313->lexeme, token_313->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:628:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp607
	je	.L179	 ;,
 ; D:/TC/src/parser.c:633:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, %r13	 ; tmp609, body
 ; D:/TC/src/parser.c:634:     parser->in_loop = true;
	movb	$1, 11(%rdi)	 ;, parser_60(D)->in_loop
 ; D:/TC/src/parser.c:635:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp610, token
 ; D:/TC/src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r15	 ;, tmp500
 ; D:/TC/src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L181	 ;
.L173:
 ; D:/TC/src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp599
 ; D:/TC/src/parser.c:613:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC44(%rip), %rcx	 ;, tmp446
	call	parser_error	 ;
 ; D:/TC/src/parser.c:615:         return NULL;
	movl	$0, %r8d	 ;, _331
.L175:
 ; D:/TC/src/parser.c:408:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$3, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp616, <retval>
 ; D:/TC/src/parser.c:408:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	jmp	.L115	 ;
.L219:
 ; D:/TC/src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp602
 ; D:/TC/src/parser.c:620:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC45(%rip), %rcx	 ;, tmp448
	call	parser_error	 ;
	jmp	.L176	 ;
.L177:
 ; D:/TC/src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp605
 ; D:/TC/src/parser.c:623:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC46(%rip), %rcx	 ;, tmp453
	call	parser_error	 ;
 ; D:/TC/src/parser.c:625:         return NULL;
	movl	$0, %r8d	 ;, _331
	jmp	.L175	 ;
.L179:
 ; D:/TC/src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp608
 ; D:/TC/src/parser.c:629:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC47(%rip), %rcx	 ;, tmp458
	call	parser_error	 ;
 ; D:/TC/src/parser.c:631:         return NULL;
	movl	$0, %r8d	 ;, _331
	jmp	.L175	 ;
.L183:
 ; D:/TC/src/parser.c:637:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %rsi	 ; tmp611, statement
 ; D:/TC/src/parser.c:638:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L220	 ;,
.L182:
 ; D:/TC/src/parser.c:640:         list_append(body, (pointer)statement);
	movq	%rsi, %rdx	 ; statement,
	movq	%r13, %rcx	 ; body,
	call	list_append	 ;
 ; D:/TC/src/parser.c:641:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp613, token
.L181:
 ; D:/TC/src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_325->type
	jne	.L183	 ;,
 ; D:/TC/src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r15), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%r12), %rcx	 ; token_325->lexeme, token_325->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:636:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp614
	je	.L183	 ;,
 ; D:/TC/src/parser.c:643:     parser->in_loop = false;
	movb	$0, 11(%rdi)	 ;, parser_60(D)->in_loop
 ; D:/TC/src/parser.c:645:     return create_while(condition, body);
	movq	%r13, %rdx	 ; body,
	movq	%r14, %rcx	 ; condition,
	call	create_while	 ;
	movq	%rax, %r8	 ; tmp615, _331
	jmp	.L175	 ;
.L220:
 ; D:/TC/src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp612
 ; D:/TC/src/parser.c:639:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC48(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L182	 ;
.L184:
 ; D:/TC/src/parser.c:412:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	movq	.refptr.RETURN_KEYWORD(%rip), %rax	 ;, tmp467
	movq	(%rax), %rdx	 ; RETURN_KEYWORD, RETURN_KEYWORD
	movq	(%rsi), %rcx	 ; token_58->lexeme, token_58->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:412:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	 ; tmp620
	je	.L186	 ;,
 ; D:/TC/src/parser.c:413:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_83->type
	je	.L221	 ;,
.L187:
 ; D:/TC/src/parser.c:418:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
 ; D:/TC/src/parser.c:418:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp624,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp625, <retval>
	jmp	.L185	 ;
.L221:
 ; D:/TC/src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rdx	 ;, tmp470
	movq	(%rdx), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rax), %rcx	 ; token_83->lexeme, token_83->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:414:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp622
	je	.L187	 ;,
 ; D:/TC/src/parser.c:416:                 return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp623, <retval>
	jmp	.L115	 ;
.L186:
 ; D:/TC/src/parser.c:419:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	movq	.refptr.BREAK_KEYWORD(%rip), %rax	 ;, tmp473
	movq	(%rax), %rdx	 ; BREAK_KEYWORD, BREAK_KEYWORD
	movq	(%rsi), %rcx	 ; token_58->lexeme, token_58->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:419:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	 ; tmp626
	je	.L188	 ;,
 ; D:/TC/src/parser.c:420:             if (!parser->in_loop) {
	cmpb	$0, 11(%rdi)	 ;, parser_60(D)->in_loop
	je	.L222	 ;,
 ; D:/TC/src/parser.c:425:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$6, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp628, <retval>
	jmp	.L185	 ;
.L222:
 ; D:/TC/src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp627
 ; D:/TC/src/parser.c:421:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC49(%rip), %rcx	 ;, tmp477
	call	parser_error	 ;
 ; D:/TC/src/parser.c:423:                 return NULL;
	movl	$0, %ebp	 ;, <retval>
	jmp	.L115	 ;
.L188:
 ; D:/TC/src/parser.c:426:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax	 ;, tmp478
	movq	(%rax), %rdx	 ; CONTINUE_KEYWORD, CONTINUE_KEYWORD
	movq	(%rsi), %rcx	 ; token_58->lexeme, token_58->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:426:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	 ; tmp629
	je	.L190	 ;,
 ; D:/TC/src/parser.c:427:             if (!parser->in_loop) {
	cmpb	$0, 11(%rdi)	 ;, parser_60(D)->in_loop
	je	.L223	 ;,
 ; D:/TC/src/parser.c:432:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$7, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp631, <retval>
	jmp	.L185	 ;
.L223:
 ; D:/TC/src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file,
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp630
 ; D:/TC/src/parser.c:428:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC50(%rip), %rcx	 ;, tmp481
	call	parser_error	 ;
 ; D:/TC/src/parser.c:430:                 return NULL;
	movl	$0, %ebp	 ;, <retval>
	jmp	.L115	 ;
.L190:
 ; D:/TC/src/parser.c:434:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
 ; D:/TC/src/parser.c:434:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp632,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp633, <retval>
	jmp	.L185	 ;
.L201:
 ; D:/TC/src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp637
 ; D:/TC/src/parser.c:439:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC51(%rip), %rcx	 ;, tmp483
	call	parser_error	 ;
	jmp	.L192	 ;
.L202:
 ; D:/TC/src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp484
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rbx), %rcx	 ; token_108->lexeme, token_108->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:441:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp639
	jne	.L115	 ;,
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
.LC56:
	.ascii "Failed to import module\0"
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
.LC81:
	.ascii "Failed to parse method body statement\0"
	.align 8
.LC82:
	.ascii "Method missing return statement\0"
.LC83:
	.ascii "Failed to parse class method\0"
	.align 8
.LC84:
	.ascii "Failed to parse class variable\0"
	.align 8
.LC85:
	.ascii "Unsupported type for class variable\0"
	.align 8
.LC86:
	.ascii "Expected ';' after class variable declaration\0"
	.align 8
.LC87:
	.ascii "Unexpected token in class member\0"
	.align 8
.LC88:
	.ascii "Constructor name conflicts with existing member\0"
.LC89:
	.ascii "0\0"
	.align 8
.LC90:
	.ascii "Failed to parse class declaration\0"
	.align 8
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
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$184, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp702, lexer
	movq	%rdx, %rbx	 ; tmp703, now_scope
	movq	%r8, %r15	 ; tmp704, parser
 ; D:/TC/src/parser.c:23:     if (builtin_scope == NULL) {
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp451
 ; D:/TC/src/parser.c:23:     if (builtin_scope == NULL) {
	cmpq	$0, (%rax)	 ;, builtin_scope
	je	.L342	 ;,
.L225:
 ; D:/TC/src/parser.c:31:     if (now_scope == NULL)
	testq	%rbx, %rbx	 ; now_scope
	je	.L343	 ;,
.L226:
 ; D:/TC/src/parser.c:34:     list(CodeMember*) members = create_list();
	call	create_list	 ;
	movq	%rax, 80(%rsp)	 ; tmp711, %sfp
 ; D:/TC/src/parser.c:35:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	%rbx, %rcx	 ; now_scope,
	call	create_symbol_table	 ;
	movq	%rax, 72(%rsp)	 ; tmp712, %sfp
 ; D:/TC/src/parser.c:36:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L228	 ;,
	movq	%rax, 56(%rsp)	 ; token, %sfp
	movq	%rdi, %r14	 ; lexer, lexer
	jmp	.L227	 ;
.L342:
 ; D:/TC/src/parser.c:24:         builtin_scope = create_symbol_table(NULL);
	movl	$0, %ecx	 ;,
	call	create_symbol_table	 ;
	movq	%rax, %r9	 ; tmp705, _2
 ; D:/TC/src/parser.c:24:         builtin_scope = create_symbol_table(NULL);
	movq	.refptr.builtin_scope(%rip), %rsi	 ;, tmp452
	movq	%rax, (%rsi)	 ; _2, builtin_scope
 ; D:/TC/src/parser.c:25:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp453
	movq	(%rax), %rcx	 ; VOID_KEYWORD, VOID_KEYWORD
	movl	$0, %r8d	 ;,
	movl	$6, %edx	 ;,
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:25:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp455
	movq	%rax, (%rdx)	 ; tmp706, name_void
 ; D:/TC/src/parser.c:26:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp458
	movq	(%rax), %rcx	 ; INT_KEYWORD, INT_KEYWORD
	movq	(%rsi), %r9	 ; builtin_scope,
	movl	$0, %r8d	 ;,
	movl	$6, %edx	 ;,
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:26:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp460
	movq	%rax, (%rdx)	 ; tmp707, name_int
 ; D:/TC/src/parser.c:27:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp463
	movq	(%rax), %rcx	 ; FLOAT_KEYWORD, FLOAT_KEYWORD
	movq	(%rsi), %r9	 ; builtin_scope,
	movl	$0, %r8d	 ;,
	movl	$6, %edx	 ;,
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:27:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp465
	movq	%rax, (%rdx)	 ; tmp708, name_float
 ; D:/TC/src/parser.c:28:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp468
	movq	(%rax), %rcx	 ; STRING_KEYWORD, STRING_KEYWORD
	movq	(%rsi), %r9	 ; builtin_scope,
	movl	$0, %r8d	 ;,
	movl	$6, %edx	 ;,
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:28:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp470
	movq	%rax, (%rdx)	 ; tmp709, name_string
 ; D:/TC/src/parser.c:29:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp473
	movq	(%rax), %rcx	 ; BOOL_KEYWORD, BOOL_KEYWORD
	movq	(%rsi), %r9	 ; builtin_scope,
	movl	$0, %r8d	 ;,
	movl	$6, %edx	 ;,
	call	create_symbol	 ;
 ; D:/TC/src/parser.c:29:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp475
	movq	%rax, (%rdx)	 ; tmp710, name_bool
	jmp	.L225	 ;
.L343:
 ; D:/TC/src/parser.c:32:         now_scope = builtin_scope;
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp476
	movq	(%rax), %rbx	 ; builtin_scope, now_scope
	jmp	.L226	 ;
.L376:
 ; D:/TC/src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax	 ;, tmp953
	movq	(%rax), %rdx	 ; IMPORT_KEYWORD, IMPORT_KEYWORD
	movq	56(%rsp), %rax	 ; %sfp, token
	movq	(%rax), %rcx	 ; token_587->lexeme, token_587->lexeme
	call	string_equal	 ;
	movl	%eax, %esi	 ; tmp714, have_return
 ; D:/TC/src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	testb	%al, %al	 ; have_return
	jne	.L344	 ;,
 ; D:/TC/src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	56(%rsp), %rax	 ; %sfp, token
	cmpl	$6, 24(%rax)	 ;, token_587->type
	jne	.L266	 ;,
 ; D:/TC/src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	.refptr.FUNC_KEYWORD(%rip), %rdi	 ;, tmp956
	movq	(%rdi), %rdx	 ; FUNC_KEYWORD, FUNC_KEYWORD
	movq	(%rax), %rcx	 ; token_587->lexeme, token_587->lexeme
	call	string_equal	 ;
	movb	%al, 104(%rsp)	 ; _26, %sfp
 ; D:/TC/src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	testb	%al, %al	 ; _26
	jne	.L345	 ;,
 ; D:/TC/src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	56(%rsp), %rax	 ; %sfp, token
	cmpl	$6, 24(%rax)	 ;, token_587->type
	jne	.L266	 ;,
 ; D:/TC/src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	.refptr.CLASS_KEYWORD(%rip), %rdi	 ;, tmp966
	movq	(%rdi), %rdx	 ; CLASS_KEYWORD, CLASS_KEYWORD
	movq	(%rax), %rcx	 ; token_587->lexeme, token_587->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:48:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	testb	%al, %al	 ; tmp770
	je	.L266	 ;,
 ; D:/TC/src/parser.c:264:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
	movq	%rax, 64(%rsp)	 ; tmp771, %sfp
 ; D:/TC/src/parser.c:265:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp772, token
 ; D:/TC/src/parser.c:266:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_216->type
	jne	.L346	 ;,
 ; D:/TC/src/parser.c:271:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %r9	 ; tmp774, class
	movq	%rax, 112(%rsp)	 ; class, %sfp
 ; D:/TC/src/parser.c:272:     class->class_scope = class_scope;
	movq	64(%rsp), %rax	 ; %sfp, class_scope
	movq	%rax, 16(%r9)	 ; class_scope, class_220->class_scope
 ; D:/TC/src/parser.c:273:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	movq	(%rbx), %rcx	 ; token_216->lexeme, token_216->lexeme
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, 88(%rsp)	 ; tmp775, %sfp
 ; D:/TC/src/parser.c:274:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp776, token
 ; D:/TC/src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_223->type
	jne	.L269	 ;,
 ; D:/TC/src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp555
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%rbx), %rcx	 ; token_223->lexeme, token_223->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:275:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp777
	je	.L269	 ;,
 ; D:/TC/src/parser.c:280:     list(ClassMember*) members = create_list();
	call	create_list	 ;
	movq	%rax, 96(%rsp)	 ; tmp779, %sfp
 ; D:/TC/src/parser.c:281:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:/TC/src/parser.c:282:     size_t size = 0;
	movq	$0, 120(%rsp)	 ;, %sfp
 ; D:/TC/src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rdi	 ;, tmp696
 ; D:/TC/src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rbp	 ;, tmp698
	movq	%rax, %rbx	 ; token, token
 ; D:/TC/src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L271	 ;
.L344:
 ; D:/TC/src/parser.c:63:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp715, token
 ; D:/TC/src/parser.c:64:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_101->type
	jne	.L347	 ;,
 ; D:/TC/src/parser.c:69:     string import_name = token->lexeme;
	movq	(%rax), %rdi	 ; token_101->lexeme, import_name
 ; D:/TC/src/parser.c:71:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp717, token
 ; D:/TC/src/parser.c:70:     string source = NULL;
	movl	$0, %esi	 ;, source
 ; D:/TC/src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_106->type
	je	.L348	 ;,
.L233:
 ; D:/TC/src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_117->type
	jne	.L235	 ;,
 ; D:/TC/src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp487
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rbx), %rcx	 ; token_117->lexeme, token_117->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:82:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp722
	je	.L235	 ;,
 ; D:/TC/src/parser.c:88:     name = parse_import_file(import_name, source, now_scope, parser->source_file);
	movq	(%r15), %r9	 ; parser_74(D)->source_file,
	movq	72(%rsp), %r8	 ; %sfp,
	movq	%rsi, %rdx	 ; source,
	movq	%rdi, %rcx	 ; import_name,
	call	parse_import_file	 ;
	movq	%rax, %rcx	 ; tmp724, name
 ; D:/TC/src/parser.c:89:     if (name == NULL) {
	testq	%rax, %rax	 ; name
	je	.L349	 ;,
.L237:
 ; D:/TC/src/parser.c:94:     return create_import(name, source);
	movq	%rsi, %rdx	 ; source,
	call	create_import	 ;
	movq	%rax, %rdx	 ; tmp727, _132
 ; D:/TC/src/parser.c:40:             if (import == NULL)
	testq	%rax, %rax	 ; _132
	je	.L326	 ;,
.L238:
 ; D:/TC/src/parser.c:42:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ; tmp729, _22
 ; D:/TC/src/parser.c:42:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	80(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:/TC/src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	jmp	.L239	 ;
.L347:
 ; D:/TC/src/parser.c:65:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp716
 ; D:/TC/src/parser.c:65:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC53(%rip), %rcx	 ;, tmp481
	call	parser_error	 ;
 ; D:/TC/src/parser.c:67:         return NULL;
	jmp	.L326	 ;
.L348:
 ; D:/TC/src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	.refptr.FROM_KEYWORD(%rip), %rax	 ;, tmp482
	movq	(%rax), %rdx	 ; FROM_KEYWORD, FROM_KEYWORD
	movq	(%rbx), %rcx	 ; token_106->lexeme, token_106->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:72:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	testb	%al, %al	 ; tmp718
	je	.L233	 ;,
 ; D:/TC/src/parser.c:73:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp719, token
 ; D:/TC/src/parser.c:74:         if (token->type != STRING) {
	cmpl	$4, 24(%rax)	 ;, token_111->type
	jne	.L350	 ;,
 ; D:/TC/src/parser.c:79:         source = token->lexeme;
	movq	(%rax), %rsi	 ; token_111->lexeme, source
 ; D:/TC/src/parser.c:80:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp721, token
	jmp	.L233	 ;
.L350:
 ; D:/TC/src/parser.c:75:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp720
 ; D:/TC/src/parser.c:75:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC54(%rip), %rcx	 ;, tmp486
	call	parser_error	 ;
 ; D:/TC/src/parser.c:77:             return NULL;
	jmp	.L326	 ;
.L235:
 ; D:/TC/src/parser.c:83:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp723
 ; D:/TC/src/parser.c:83:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC55(%rip), %rcx	 ;, tmp491
	call	parser_error	 ;
.L326:
 ; D:/TC/src/parser.c:41:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp728
 ; D:/TC/src/parser.c:41:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC57(%rip), %rcx	 ;, tmp498
	call	parser_error	 ;
	movl	$0, %edx	 ;, _132
	jmp	.L238	 ;
.L349:
 ; D:/TC/src/parser.c:90:         parser_error("Failed to import module", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp725
 ; D:/TC/src/parser.c:90:         parser_error("Failed to import module", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC56(%rip), %rcx	 ;, tmp494
	call	parser_error	 ;
 ; D:/TC/src/parser.c:91:         name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
	movq	72(%rsp), %r9	 ; %sfp,
	movq	.refptr.name_void(%rip), %rax	 ;, tmp495
	movq	(%rax), %r8	 ; name_void,
	movl	$3, %edx	 ;,
	movq	%rdi, %rcx	 ; import_name,
	call	create_symbol	 ;
	movq	%rax, %rcx	 ; tmp726, name
	jmp	.L237	 ;
.L345:
 ; D:/TC/src/parser.c:99:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
	movq	%rax, %rdi	 ; tmp731, function_scope
 ; D:/TC/src/parser.c:100:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp732, token
 ; D:/TC/src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_135->type, _136
 ; D:/TC/src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _136
	je	.L241	 ;,
 ; D:/TC/src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _136
	jne	.L242	 ;,
 ; D:/TC/src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rbx), %rcx	 ; token_135->lexeme, token_135->lexeme
	call	is_builtin_type	 ;
 ; D:/TC/src/parser.c:101:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp733
	je	.L242	 ;,
.L241:
 ; D:/TC/src/parser.c:106:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rdx	 ; token_135->lexeme, token_135->lexeme
	movq	72(%rsp), %rcx	 ; %sfp,
	call	search_name	 ;
	movq	%rax, 64(%rsp)	 ; return_type, %sfp
 ; D:/TC/src/parser.c:107:     if (return_type == NULL) {
	testq	%rax, %rax	 ; return_type
	je	.L351	 ;,
 ; D:/TC/src/parser.c:112:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp737, token
 ; D:/TC/src/parser.c:113:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_145->type
	jne	.L352	 ;,
 ; D:/TC/src/parser.c:118:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %r9	 ; tmp739, function
	movq	%rax, 88(%rsp)	 ; function, %sfp
 ; D:/TC/src/parser.c:119:     function->function_scope = function_scope;
	movq	%rdi, 32(%rax)	 ; function_scope, function_149->function_scope
 ; D:/TC/src/parser.c:120:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	(%rbx), %rcx	 ; token_145->lexeme, token_145->lexeme
	movq	64(%rsp), %r8	 ; %sfp,
	movl	$1, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, 96(%rsp)	 ; tmp740, %sfp
 ; D:/TC/src/parser.c:121:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp741, token
 ; D:/TC/src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_152->type
	jne	.L246	 ;,
 ; D:/TC/src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp511
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_152->lexeme, token_152->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:122:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp742
	je	.L246	 ;,
 ; D:/TC/src/parser.c:127:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp744, token
 ; D:/TC/src/parser.c:128:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rax, %r13	 ; tmp745, parameters
 ; D:/TC/src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r12	 ;, tmp685
 ; D:/TC/src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	%r12, %rbp	 ; tmp685, tmp687
 ; D:/TC/src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L248	 ;
.L242:
 ; D:/TC/src/parser.c:102:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp734
 ; D:/TC/src/parser.c:102:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC58(%rip), %rcx	 ;, tmp504
	call	parser_error	 ;
.L327:
 ; D:/TC/src/parser.c:46:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp768
 ; D:/TC/src/parser.c:46:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC69(%rip), %rcx	 ;, tmp548
	call	parser_error	 ;
	movl	$0, %r8d	 ;, _211
	jmp	.L265	 ;
.L351:
 ; D:/TC/src/parser.c:108:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp736
 ; D:/TC/src/parser.c:108:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC59(%rip), %rcx	 ;, tmp507
	call	parser_error	 ;
 ; D:/TC/src/parser.c:110:         return NULL;
	jmp	.L327	 ;
.L352:
 ; D:/TC/src/parser.c:114:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp738
 ; D:/TC/src/parser.c:114:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC60(%rip), %rcx	 ;, tmp509
	call	parser_error	 ;
 ; D:/TC/src/parser.c:116:         return NULL;
	jmp	.L327	 ;
.L246:
 ; D:/TC/src/parser.c:123:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp743
 ; D:/TC/src/parser.c:123:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC61(%rip), %rcx	 ;, tmp515
	call	parser_error	 ;
 ; D:/TC/src/parser.c:125:         return NULL;
	jmp	.L327	 ;
.L355:
 ; D:/TC/src/parser.c:132:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp747
 ; D:/TC/src/parser.c:132:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC62(%rip), %rcx	 ;, tmp517
	call	parser_error	 ;
	jmp	.L250	 ;
.L251:
 ; D:/TC/src/parser.c:136:             list_append(parameters, (pointer)parameter);
	movq	%rax, %rdx	 ; parameter,
	movq	%r13, %rcx	 ; parameters,
	call	list_append	 ;
	jmp	.L250	 ;
.L356:
 ; D:/TC/src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp961
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	movq	(%rbx), %rcx	 ; token_168->lexeme, token_168->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp750
	jne	.L353	 ;,
 ; D:/TC/src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_168->type
	jne	.L252	 ;,
 ; D:/TC/src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_168->lexeme, token_168->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:140:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp752
	je	.L252	 ;,
.L248:
 ; D:/TC/src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_164->type
	je	.L354	 ;,
.L255:
 ; D:/TC/src/parser.c:130:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	%rdi, %rdx	 ; function_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; D:/TC/src/parser.c:131:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	je	.L355	 ;,
 ; D:/TC/src/parser.c:133:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_161->value
	je	.L251	 ;,
 ; D:/TC/src/parser.c:134:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp748
 ; D:/TC/src/parser.c:134:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC63(%rip), %rcx	 ;, tmp519
	call	parser_error	 ;
.L250:
 ; D:/TC/src/parser.c:137:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp749, token
 ; D:/TC/src/parser.c:138:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_168->type
	je	.L356	 ;,
.L252:
 ; D:/TC/src/parser.c:141:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp753
 ; D:/TC/src/parser.c:141:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC64(%rip), %rcx	 ;, tmp527
	call	parser_error	 ;
 ; D:/TC/src/parser.c:143:             return NULL;
	jmp	.L327	 ;
.L353:
 ; D:/TC/src/parser.c:139:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp751, token
 ; D:/TC/src/parser.c:139:             token = get_next_token(lexer, true);
	jmp	.L248	 ;
.L354:
 ; D:/TC/src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_164->lexeme, token_164->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:129:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp754
	je	.L255	 ;,
 ; D:/TC/src/parser.c:146:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp755, token
 ; D:/TC/src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_184->type
	jne	.L256	 ;,
 ; D:/TC/src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp531
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%rbx), %rcx	 ; token_184->lexeme, token_184->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:147:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp756
	je	.L256	 ;,
 ; D:/TC/src/parser.c:152:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, %rbp	 ; tmp758, body
 ; D:/TC/src/parser.c:153:     parser->in_function = true;
	movb	$1, 8(%r15)	 ;, parser_74(D)->in_function
 ; D:/TC/src/parser.c:155:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp759, token
 ; D:/TC/src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L258	 ;
.L256:
 ; D:/TC/src/parser.c:148:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp757
 ; D:/TC/src/parser.c:148:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC65(%rip), %rcx	 ;, tmp535
	call	parser_error	 ;
 ; D:/TC/src/parser.c:150:         return NULL;
	jmp	.L327	 ;
.L262:
 ; D:/TC/src/parser.c:157:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	%rdi, %rdx	 ; function_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %rbx	 ; tmp760, statement
 ; D:/TC/src/parser.c:158:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L357	 ;,
 ; D:/TC/src/parser.c:160:         else if (have_return)
	testb	%sil, %sil	 ; have_return
	jne	.L358	 ;,
.L261:
 ; D:/TC/src/parser.c:163:             have_return = true;
	cmpl	$5, 8(%rbx)	 ;, statement_193->type
	movl	$1, %eax	 ;, tmp677
	cmove	%eax, %esi	 ; have_return,, tmp677, have_return
.L260:
 ; D:/TC/src/parser.c:164:         list_append(body, (pointer)statement);
	movq	%rbx, %rdx	 ; statement,
	movq	%rbp, %rcx	 ; body,
	call	list_append	 ;
 ; D:/TC/src/parser.c:165:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp763, token
.L258:
 ; D:/TC/src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_196->type
	jne	.L262	 ;,
 ; D:/TC/src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp962
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%r12), %rcx	 ; token_196->lexeme, token_196->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:156:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp764
	je	.L262	 ;,
 ; D:/TC/src/parser.c:167:     parser->in_function = false;
	movb	$0, 8(%r15)	 ;, parser_74(D)->in_function
 ; D:/TC/src/parser.c:168:     if (!have_return && return_type != name_void)
	testb	%sil, %sil	 ; have_return
	jne	.L263	 ;,
 ; D:/TC/src/parser.c:168:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp543
 ; D:/TC/src/parser.c:168:     if (!have_return && return_type != name_void)
	movq	64(%rsp), %rsi	 ; %sfp, return_type
	cmpq	(%rax), %rsi	 ; name_void, return_type
	je	.L264	 ;,
 ; D:/TC/src/parser.c:169:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp765
 ; D:/TC/src/parser.c:169:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC68(%rip), %rcx	 ;, tmp545
	call	parser_error	 ;
 ; D:/TC/src/parser.c:170:     if (!have_return && return_type == name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp546
 ; D:/TC/src/parser.c:170:     if (!have_return && return_type == name_void)
	cmpq	(%rax), %rsi	 ; name_void, return_type
	je	.L264	 ;,
.L263:
 ; D:/TC/src/parser.c:173:     return create_function_use_ptr(function, name, return_type, parameters, body, function_scope);
	movq	%rdi, 40(%rsp)	 ; function_scope,
	movq	%rbp, 32(%rsp)	 ; body,
	movq	%r13, %r9	 ; parameters,
	movq	64(%rsp), %r8	 ; %sfp,
	movq	96(%rsp), %rdx	 ; %sfp,
	movq	88(%rsp), %rcx	 ; %sfp,
	call	create_function_use_ptr	 ;
	movq	%rax, %r8	 ; tmp767, _211
 ; D:/TC/src/parser.c:45:             if (function == NULL)
	testq	%rax, %rax	 ; _211
	je	.L327	 ;,
.L265:
 ; D:/TC/src/parser.c:47:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ; tmp769, _29
 ; D:/TC/src/parser.c:47:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	80(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:/TC/src/parser.c:43:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	jmp	.L239	 ;
.L357:
 ; D:/TC/src/parser.c:159:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp761
 ; D:/TC/src/parser.c:159:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC66(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L260	 ;
.L358:
 ; D:/TC/src/parser.c:161:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp762
 ; D:/TC/src/parser.c:161:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L261	 ;
.L264:
 ; D:/TC/src/parser.c:171:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdx	 ; tmp766, _210
 ; D:/TC/src/parser.c:171:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	%rbp, %rcx	 ; body,
	call	list_append	 ;
	jmp	.L263	 ;
.L346:
 ; D:/TC/src/parser.c:267:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp773
 ; D:/TC/src/parser.c:267:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC70(%rip), %rcx	 ;, tmp553
	call	parser_error	 ;
 ; D:/TC/src/parser.c:269:         return NULL;
	jmp	.L328	 ;
.L269:
 ; D:/TC/src/parser.c:276:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp778
 ; D:/TC/src/parser.c:276:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC71(%rip), %rcx	 ;, tmp559
	call	parser_error	 ;
.L328:
 ; D:/TC/src/parser.c:51:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp896
 ; D:/TC/src/parser.c:51:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC90(%rip), %rcx	 ;, tmp670
	call	parser_error	 ;
	movl	$0, %r9d	 ;, _362
	jmp	.L324	 ;
.L312:
 ; D:/TC/src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, 24(%rbx)	 ;, token_232->type
	je	.L359	 ;,
.L272:
 ; D:/TC/src/parser.c:313:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp836
 ; D:/TC/src/parser.c:313:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC87(%rip), %rcx	 ;, tmp637
	call	parser_error	 ;
.L303:
 ; D:/TC/src/parser.c:314:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp837, token
.L271:
 ; D:/TC/src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_232->type
	jne	.L312	 ;,
 ; D:/TC/src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%rdi), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rbx), %rcx	 ; token_232->lexeme, token_232->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:283:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp838
	je	.L312	 ;,
 ; D:/TC/src/parser.c:316:     string init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
	movq	%rbx, 104(%rsp)	 ; token, %sfp
	movq	.refptr.DEFAULT_INIT_NAME(%rip), %rax	 ;, tmp641
	movq	(%rax), %rdx	 ; DEFAULT_INIT_NAME, DEFAULT_INIT_NAME
	movq	88(%rsp), %rax	 ; %sfp, name
	movq	8(%rax), %rcx	 ; name_222->name, name_222->name
	call	make_method_name	 ;
	movq	%rax, %rbx	 ; tmp839, init_name
 ; D:/TC/src/parser.c:317:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	movq	%rax, %rdx	 ; init_name,
	movq	64(%rsp), %rcx	 ; %sfp,
	call	search_name_use_strcmp	 ;
	movq	%rax, %r13	 ; tmp840, init
 ; D:/TC/src/parser.c:318:     if (init == NULL) {
	testq	%rax, %rax	 ; init
	je	.L360	 ;,
.L313:
 ; D:/TC/src/parser.c:330:     if (init->kind != SYMBOL_METHOD)
	cmpl	$2, 32(%r13)	 ;, init_298->kind
	jne	.L361	 ;,
.L314:
 ; D:/TC/src/parser.c:332:     string constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp650
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
	movq	88(%rsp), %rsi	 ; %sfp, name
	movq	8(%rsi), %rcx	 ; name_222->name, name_222->name
	call	make_method_name	 ;
	movq	%rax, %rbx	 ; tmp854, constructor_name
 ; D:/TC/src/parser.c:333:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rdi	 ; tmp855, method
 ; D:/TC/src/parser.c:334:     method->method_scope = create_symbol_table(class_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:/TC/src/parser.c:334:     method->method_scope = create_symbol_table(class_scope);
	movq	%rax, 32(%rdi)	 ; tmp856, method_305->method_scope
 ; D:/TC/src/parser.c:335:     Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
	movq	%rdi, %r9	 ; method,
	movq	%rsi, %r8	 ; name,
	movl	$2, %edx	 ;,
	movq	%rbx, %rcx	 ; constructor_name,
	call	create_symbol	 ;
	movq	%rax, 128(%rsp)	 ; tmp857, %sfp
 ; D:/TC/src/parser.c:336:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rax, %rbp	 ; tmp858, parameters
 ; D:/TC/src/parser.c:337:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp654
	movq	(%rax), %rcx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	32(%rdi), %r9	 ; method_305->method_scope,
	movq	%rsi, %r8	 ; name,
	movl	$3, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, 104(%rsp)	 ; tmp859, %sfp
 ; D:/TC/src/parser.c:338:     list(Variable*) init_params = list_copy(init->ast_node.method->parameters);
	movq	24(%r13), %rax	 ; init_298->ast_node.method, init_298->ast_node.method
	movq	16(%rax), %rcx	 ; _312->parameters, _312->parameters
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp860, init_params
 ; D:/TC/src/parser.c:341:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	movq	.refptr.SELF_KEYWORD(%rip), %r12	 ;, tmp688
.L316:
 ; D:/TC/src/parser.c:340:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	movq	%rsi, %rcx	 ; init_params,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp863, param
 ; D:/TC/src/parser.c:340:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	testq	%rax, %rax	 ; param
	je	.L362	 ;,
 ; D:/TC/src/parser.c:341:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	movq	(%r12), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	8(%rbx), %rax	 ; param_316->name, param_316->name
	movq	8(%rax), %rcx	 ; _317->name, _317->name
	call	string_equal	 ;
 ; D:/TC/src/parser.c:341:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	testb	%al, %al	 ; tmp861
	jne	.L316	 ;,
 ; D:/TC/src/parser.c:342:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	8(%rbx), %rdx	 ; param_316->name, param_316->name
	movq	(%rbx), %rcx	 ; param_316->type, param_316->type
	movl	$0, %r8d	 ;,
	call	create_variable	 ;
	movq	%rax, %rdx	 ; tmp862, _322
 ; D:/TC/src/parser.c:342:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	%rbp, %rcx	 ; parameters,
	call	list_append	 ;
	jmp	.L316	 ;
.L359:
 ; D:/TC/src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	.refptr.METHOD_KEYWORD(%rip), %rax	 ;, tmp970
	movq	(%rax), %rdx	 ; METHOD_KEYWORD, METHOD_KEYWORD
	movq	(%rbx), %rcx	 ; token_232->lexeme, token_232->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	testb	%al, %al	 ; tmp781
	jne	.L363	 ;,
 ; D:/TC/src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	cmpl	$6, 24(%rbx)	 ;, token_232->type
	jne	.L272	 ;,
 ; D:/TC/src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	0(%rbp), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD
	movq	(%rbx), %rcx	 ; token_232->lexeme, token_232->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:289:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; tmp827
	je	.L272	 ;,
 ; D:/TC/src/parser.c:290:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp828, token
 ; D:/TC/src/parser.c:291:             parser->in_class = true;
	movb	$1, 10(%r15)	 ;, parser_74(D)->in_class
 ; D:/TC/src/parser.c:292:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	64(%rsp), %rdx	 ; %sfp,
	movq	%r14, %rcx	 ; lexer,
	call	parse_variable	 ;
	movq	%rax, %rbx	 ; tmp829, variable
 ; D:/TC/src/parser.c:293:             parser->in_class = false;
	movb	$0, 10(%r15)	 ;, parser_74(D)->in_class
 ; D:/TC/src/parser.c:294:             if (variable == NULL)
	testq	%rax, %rax	 ; variable
	je	.L364	 ;,
.L304:
 ; D:/TC/src/parser.c:296:             ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
	movq	%rbx, %r8	 ; variable,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_class_member	 ;
	movq	%rax, %rbx	 ; tmp831, member
 ; D:/TC/src/parser.c:297:             list_append(members, (pointer)member);
	movq	%rax, %rdx	 ; member,
	movq	96(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:/TC/src/parser.c:298:             if (member->type == CLASS_VARIABLE) {
	cmpl	$1, 8(%rbx)	 ;, member_249->type
	je	.L365	 ;,
.L305:
 ; D:/TC/src/parser.c:309:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp833, token
 ; D:/TC/src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_265->type
	je	.L366	 ;,
.L311:
 ; D:/TC/src/parser.c:311:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp835
 ; D:/TC/src/parser.c:311:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC86(%rip), %rcx	 ;, tmp635
	call	parser_error	 ;
	jmp	.L303	 ;
.L363:
 ; D:/TC/src/parser.c:178:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
	movq	%rax, %r13	 ; tmp782, method_scope
 ; D:/TC/src/parser.c:179:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp563
	movq	(%rax), %rcx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	%r13, %r9	 ; method_scope,
	movq	88(%rsp), %r8	 ; %sfp,
	movl	$3, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, %r12	 ; tmp783, self
 ; D:/TC/src/parser.c:180:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp784, token
 ; D:/TC/src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_369->type, _370
 ; D:/TC/src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _370
	je	.L274	 ;,
 ; D:/TC/src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _370
	jne	.L275	 ;,
 ; D:/TC/src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rsi), %rcx	 ; token_369->lexeme, token_369->lexeme
	call	is_builtin_type	 ;
 ; D:/TC/src/parser.c:181:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp785
	je	.L275	 ;,
.L274:
 ; D:/TC/src/parser.c:186:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%rsi), %rdx	 ; token_369->lexeme, token_369->lexeme
	movq	64(%rsp), %rcx	 ; %sfp,
	call	search_name	 ;
	movq	%rax, 136(%rsp)	 ; return_type, %sfp
 ; D:/TC/src/parser.c:187:     if (return_type == NULL) {
	testq	%rax, %rax	 ; return_type
	je	.L367	 ;,
 ; D:/TC/src/parser.c:192:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp789, token
 ; D:/TC/src/parser.c:193:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_379->type
	jne	.L368	 ;,
 ; D:/TC/src/parser.c:198:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/parser.c:199:     method->method_scope = method_scope;
	movq	%rax, 152(%rsp)	 ; method, %sfp
	movq	%r13, 32(%rax)	 ; method_scope, method_383->method_scope
 ; D:/TC/src/parser.c:200:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	(%rsi), %rdx	 ; token_379->lexeme, token_379->lexeme
	movq	88(%rsp), %rsi	 ; %sfp, name
	movq	8(%rsi), %rcx	 ; name_222->name, name_222->name
	call	make_method_name	 ;
	movq	%rax, %rcx	 ; tmp792, _386
 ; D:/TC/src/parser.c:200:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	152(%rsp), %r9	 ; %sfp,
	movq	136(%rsp), %r8	 ; %sfp,
	movl	$2, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, 160(%rsp)	 ; tmp793, %sfp
 ; D:/TC/src/parser.c:201:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp794, token
 ; D:/TC/src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_388->type
	jne	.L279	 ;,
 ; D:/TC/src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp575
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_388->lexeme, token_388->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:202:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp795
	je	.L279	 ;,
 ; D:/TC/src/parser.c:207:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp797, token
 ; D:/TC/src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	cmpl	$6, 24(%rax)	 ;, token_395->type
	je	.L369	 ;,
.L281:
 ; D:/TC/src/parser.c:209:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp799
 ; D:/TC/src/parser.c:209:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC76(%rip), %rcx	 ;, tmp584
	call	parser_error	 ;
.L282:
 ; D:/TC/src/parser.c:210:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp800, token
 ; D:/TC/src/parser.c:211:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rax, 144(%rsp)	 ; tmp801, %sfp
 ; D:/TC/src/parser.c:212:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movl	$0, %r8d	 ;,
	movq	%r12, %rdx	 ; self,
	movq	88(%rsp), %rcx	 ; %sfp,
	call	create_variable	 ;
	movq	%rax, %rdx	 ; tmp802, _404
 ; D:/TC/src/parser.c:212:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	144(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:/TC/src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %r12	 ;, tmp694
 ; D:/TC/src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L283	 ;
.L275:
 ; D:/TC/src/parser.c:182:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp786
 ; D:/TC/src/parser.c:182:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC72(%rip), %rcx	 ;, tmp567
	call	parser_error	 ;
.L329:
 ; D:/TC/src/parser.c:287:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp825
 ; D:/TC/src/parser.c:287:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC83(%rip), %rcx	 ;, tmp617
	call	parser_error	 ;
	movl	$0, %edx	 ;, _455
	jmp	.L302	 ;
.L367:
 ; D:/TC/src/parser.c:188:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp788
 ; D:/TC/src/parser.c:188:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC73(%rip), %rcx	 ;, tmp570
	call	parser_error	 ;
 ; D:/TC/src/parser.c:190:         return NULL;
	jmp	.L329	 ;
.L368:
 ; D:/TC/src/parser.c:194:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp790
 ; D:/TC/src/parser.c:194:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC74(%rip), %rcx	 ;, tmp572
	call	parser_error	 ;
 ; D:/TC/src/parser.c:196:         return NULL;
	jmp	.L329	 ;
.L279:
 ; D:/TC/src/parser.c:203:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp796
 ; D:/TC/src/parser.c:203:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC75(%rip), %rcx	 ;, tmp579
	call	parser_error	 ;
 ; D:/TC/src/parser.c:205:         return NULL;
	jmp	.L329	 ;
.L369:
 ; D:/TC/src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp580
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	(%rsi), %rcx	 ; token_395->lexeme, token_395->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:208:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	testb	%al, %al	 ; tmp798
	jne	.L282	 ;,
	jmp	.L281	 ;
.L285:
 ; D:/TC/src/parser.c:216:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, 24(%rsi)	 ;, token_405->type
	jne	.L288	 ;,
 ; D:/TC/src/parser.c:216:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp588
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_405->lexeme, token_405->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:216:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	testb	%al, %al	 ; tmp806
	je	.L288	 ;,
.L289:
 ; D:/TC/src/parser.c:230:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp812, token
 ; D:/TC/src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_428->type
	jne	.L293	 ;,
 ; D:/TC/src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp600
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%rsi), %rcx	 ; token_428->lexeme, token_428->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:231:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp813
	je	.L293	 ;,
 ; D:/TC/src/parser.c:236:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, 128(%rsp)	 ; tmp815, %sfp
 ; D:/TC/src/parser.c:237:     parser->in_function = true;
	movb	$1, 8(%r15)	 ;, parser_74(D)->in_function
 ; D:/TC/src/parser.c:238:     parser->in_method = true;
	movb	$1, 9(%r15)	 ;, parser_74(D)->in_method
 ; D:/TC/src/parser.c:240:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp816, token
 ; D:/TC/src/parser.c:239:     bool have_return = false;
	movzbl	104(%rsp), %esi	 ; %sfp, _26
	movq	%rbx, 168(%rsp)	 ; token, %sfp
 ; D:/TC/src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L295	 ;
.L370:
 ; D:/TC/src/parser.c:223:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp808
 ; D:/TC/src/parser.c:223:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC78(%rip), %rcx	 ;, tmp594
	call	parser_error	 ;
	jmp	.L290	 ;
.L291:
 ; D:/TC/src/parser.c:227:             list_append(parameters, (pointer)parameter);
	movq	%rax, %rdx	 ; parameter,
	movq	144(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
	jmp	.L290	 ;
.L371:
 ; D:/TC/src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp974
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_405->lexeme, token_405->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp811
	jne	.L289	 ;,
 ; D:/TC/src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_405->type
	jne	.L288	 ;,
 ; D:/TC/src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	(%r12), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	movq	(%rsi), %rcx	 ; token_405->lexeme, token_405->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:214:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp803
	je	.L285	 ;,
 ; D:/TC/src/parser.c:215:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp804, token
 ; D:/TC/src/parser.c:221:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	%r13, %rdx	 ; method_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; D:/TC/src/parser.c:222:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	je	.L370	 ;,
 ; D:/TC/src/parser.c:224:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_411->value
	je	.L291	 ;,
 ; D:/TC/src/parser.c:225:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp809
 ; D:/TC/src/parser.c:225:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC79(%rip), %rcx	 ;,
	call	parser_error	 ;
.L290:
 ; D:/TC/src/parser.c:228:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp810, token
.L283:
 ; D:/TC/src/parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_405->type
	je	.L371	 ;,
.L288:
 ; D:/TC/src/parser.c:218:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp807
 ; D:/TC/src/parser.c:218:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC77(%rip), %rcx	 ;, tmp592
	call	parser_error	 ;
 ; D:/TC/src/parser.c:219:             return NULL;
	jmp	.L329	 ;
.L293:
 ; D:/TC/src/parser.c:232:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp814
 ; D:/TC/src/parser.c:232:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC80(%rip), %rcx	 ;, tmp604
	call	parser_error	 ;
 ; D:/TC/src/parser.c:234:         return NULL;
	jmp	.L329	 ;
.L299:
 ; D:/TC/src/parser.c:242:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	%r13, %rdx	 ; method_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %rbx	 ; tmp817, statement
 ; D:/TC/src/parser.c:243:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L372	 ;,
 ; D:/TC/src/parser.c:245:         else if (have_return)
	testb	%sil, %sil	 ; have_return
	jne	.L373	 ;,
.L298:
 ; D:/TC/src/parser.c:248:             have_return = true;
	cmpl	$5, 8(%rbx)	 ;, statement_437->type
	movl	$1, %eax	 ;, tmp681
	cmove	%eax, %esi	 ; have_return,, tmp681, have_return
.L297:
 ; D:/TC/src/parser.c:249:         list_append(body, (pointer)statement);
	movq	%rbx, %rdx	 ; statement,
	movq	128(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:/TC/src/parser.c:250:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp820, token
.L295:
 ; D:/TC/src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_440->type
	jne	.L299	 ;,
 ; D:/TC/src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp976
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%r12), %rcx	 ; token_440->lexeme, token_440->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:241:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp821
	je	.L299	 ;,
 ; D:/TC/src/parser.c:252:     parser->in_function = false;
	movq	168(%rsp), %rbx	 ; %sfp, token
	movb	$0, 8(%r15)	 ;, parser_74(D)->in_function
 ; D:/TC/src/parser.c:253:     parser->in_method = false;
	movb	$0, 9(%r15)	 ;, parser_74(D)->in_method
 ; D:/TC/src/parser.c:254:     if (!have_return && return_type != name_void)
	testb	%sil, %sil	 ; have_return
	jne	.L300	 ;,
 ; D:/TC/src/parser.c:254:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp612
 ; D:/TC/src/parser.c:254:     if (!have_return && return_type != name_void)
	movq	136(%rsp), %rsi	 ; %sfp, return_type
	cmpq	(%rax), %rsi	 ; name_void, return_type
	je	.L301	 ;,
 ; D:/TC/src/parser.c:255:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp822
 ; D:/TC/src/parser.c:255:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC82(%rip), %rcx	 ;, tmp614
	call	parser_error	 ;
 ; D:/TC/src/parser.c:256:     if (!have_return && return_type == name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp615
 ; D:/TC/src/parser.c:256:     if (!have_return && return_type == name_void)
	cmpq	(%rax), %rsi	 ; name_void, return_type
	je	.L301	 ;,
.L300:
 ; D:/TC/src/parser.c:259:     return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
	movq	%r13, 40(%rsp)	 ; method_scope,
	movq	128(%rsp), %rax	 ; %sfp, body
	movq	%rax, 32(%rsp)	 ; body,
	movq	144(%rsp), %r9	 ; %sfp,
	movq	136(%rsp), %r8	 ; %sfp,
	movq	160(%rsp), %rdx	 ; %sfp,
	movq	152(%rsp), %rcx	 ; %sfp,
	call	create_method_use_ptr	 ;
	movq	%rax, %rdx	 ; tmp824, _455
 ; D:/TC/src/parser.c:286:             if (method == NULL)
	testq	%rax, %rax	 ; _455
	je	.L329	 ;,
.L302:
 ; D:/TC/src/parser.c:288:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movl	$0, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_class_member	 ;
	movq	%rax, %rdx	 ; tmp826, _240
 ; D:/TC/src/parser.c:288:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	96(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:/TC/src/parser.c:284:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	jmp	.L303	 ;
.L372:
 ; D:/TC/src/parser.c:244:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp818
 ; D:/TC/src/parser.c:244:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC81(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L297	 ;
.L373:
 ; D:/TC/src/parser.c:246:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp819
 ; D:/TC/src/parser.c:246:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L298	 ;
.L301:
 ; D:/TC/src/parser.c:257:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdx	 ; tmp823, _454
 ; D:/TC/src/parser.c:257:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	128(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
	jmp	.L300	 ;
.L364:
 ; D:/TC/src/parser.c:295:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp830
 ; D:/TC/src/parser.c:295:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC84(%rip), %rcx	 ;, tmp622
	call	parser_error	 ;
	jmp	.L304	 ;
.L365:
 ; D:/TC/src/parser.c:299:                 Symbol* type = member->content.variable->type;
	movq	(%rbx), %rax	 ; member_249->content.variable, member_249->content.variable
	movq	(%rax), %rax	 ; _251->type, type
 ; D:/TC/src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp624
 ; D:/TC/src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rdx), %rax	 ; name_int, type
	je	.L306	 ;,
 ; D:/TC/src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp625
 ; D:/TC/src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rdx), %rax	 ; name_float, type
	je	.L306	 ;,
 ; D:/TC/src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp626
 ; D:/TC/src/parser.c:300:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rdx), %rax	 ; name_string, type
	je	.L306	 ;,
 ; D:/TC/src/parser.c:302:                 else if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp627
 ; D:/TC/src/parser.c:302:                 else if (type == name_bool || type == name_void)
	cmpq	(%rdx), %rax	 ; name_bool, type
	je	.L308	 ;,
 ; D:/TC/src/parser.c:302:                 else if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp628
 ; D:/TC/src/parser.c:302:                 else if (type == name_bool || type == name_void)
	cmpq	(%rdx), %rax	 ; name_void, type
	je	.L308	 ;,
 ; D:/TC/src/parser.c:304:                 else if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rax)	 ;, type_252->kind
	jne	.L310	 ;,
 ; D:/TC/src/parser.c:305:                     size += 8;  // pointer to object
	addq	$8, 120(%rsp)	 ;, %sfp
	jmp	.L305	 ;
.L306:
 ; D:/TC/src/parser.c:301:                     size += 8;
	addq	$8, 120(%rsp)	 ;, %sfp
	jmp	.L305	 ;
.L308:
 ; D:/TC/src/parser.c:303:                     size += 1;
	addq	$1, 120(%rsp)	 ;, %sfp
	jmp	.L305	 ;
.L310:
 ; D:/TC/src/parser.c:307:                     parser_error("Unsupported type for class variable", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp832
 ; D:/TC/src/parser.c:307:                     parser_error("Unsupported type for class variable", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC85(%rip), %rcx	 ;, tmp630
	call	parser_error	 ;
	jmp	.L305	 ;
.L366:
 ; D:/TC/src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp631
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rbx), %rcx	 ; token_265->lexeme, token_265->lexeme
	call	string_equal	 ;
 ; D:/TC/src/parser.c:310:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp834
	jne	.L303	 ;,
	jmp	.L311	 ;
.L360:
 ; D:/TC/src/parser.c:319:         Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp841, method
 ; D:/TC/src/parser.c:320:         method->method_scope = create_symbol_table(class_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:/TC/src/parser.c:320:         method->method_scope = create_symbol_table(class_scope);
	movq	%rax, 32(%rsi)	 ; tmp842, method_283->method_scope
 ; D:/TC/src/parser.c:321:         init = create_symbol(init_name, SYMBOL_METHOD, name, method);
	movq	%rsi, %r9	 ; method,
	movq	88(%rsp), %r12	 ; %sfp, name
	movq	%r12, %r8	 ; name,
	movl	$2, %edx	 ;,
	movq	%rbx, %rcx	 ; init_name,
	call	create_symbol	 ;
	movq	%rax, %r13	 ; tmp843, init
 ; D:/TC/src/parser.c:322:         list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rax, %rdi	 ; tmp844, parameters
 ; D:/TC/src/parser.c:323:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp645
	movq	(%rax), %rcx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	32(%rsi), %r9	 ; method_283->method_scope,
	movq	%r12, %r8	 ; name,
	movl	$3, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, %rbp	 ; tmp845, self
 ; D:/TC/src/parser.c:324:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; self,
	movq	%r12, %rcx	 ; name,
	call	create_variable	 ;
	movq	%rax, %rdx	 ; tmp846, _290
 ; D:/TC/src/parser.c:324:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	%rdi, %rcx	 ; parameters,
	call	list_append	 ;
 ; D:/TC/src/parser.c:325:         list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, %rbx	 ; tmp847, body
 ; D:/TC/src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rbp, %r8	 ; self,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, 32(%rsp)	 ; tmp848,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
	movq	%rax, %r8	 ;, tmp849
 ; D:/TC/src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:/TC/src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp850,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdx	 ; tmp851, _295
 ; D:/TC/src/parser.c:326:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rbx, %rcx	 ; body,
	call	list_append	 ;
 ; D:/TC/src/parser.c:327:         create_method_use_ptr(method, init, name, parameters, body, method->method_scope);
	movq	32(%rsi), %rax	 ; method_283->method_scope, method_283->method_scope
	movq	%rax, 40(%rsp)	 ; method_283->method_scope,
	movq	%rbx, 32(%rsp)	 ; body,
	movq	%rdi, %r9	 ; parameters,
	movq	%r12, %r8	 ; name,
	movq	%r13, %rdx	 ; init,
	movq	%rsi, %rcx	 ; method,
	call	create_method_use_ptr	 ;
 ; D:/TC/src/parser.c:328:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; method,
	movl	$0, %ecx	 ;,
	call	create_class_member	 ;
	movq	%rax, %rdx	 ; tmp852, _297
 ; D:/TC/src/parser.c:328:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	96(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
	jmp	.L313	 ;
.L361:
 ; D:/TC/src/parser.c:331:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp853
 ; D:/TC/src/parser.c:331:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	104(%rsp), %rdx	 ; %sfp,
	leaq	.LC88(%rip), %rcx	 ;, tmp649
	call	parser_error	 ;
	jmp	.L314	 ;
.L362:
 ; D:/TC/src/parser.c:344:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, %r12	 ; tmp864, body
 ; D:/TC/src/parser.c:345:     list(ClassMember*) ms = list_copy(members);
	movq	96(%rsp), %rcx	 ; %sfp,
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp865, ms
 ; D:/TC/src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	104(%rsp), %r8	 ; %sfp,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, 32(%rsp)	 ; tmp866,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
	movq	%rax, %r8	 ;, tmp867
 ; D:/TC/src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:/TC/src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp868,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdx	 ; tmp869, _328
 ; D:/TC/src/parser.c:347:     list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%r12, %rcx	 ; body,
	call	list_append	 ;
.L319:
 ; D:/TC/src/parser.c:348:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	movq	%rsi, %rcx	 ; ms,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp879, mb
 ; D:/TC/src/parser.c:348:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	testq	%rax, %rax	 ; mb
	je	.L374	 ;,
 ; D:/TC/src/parser.c:349:         if (mb->type == CLASS_VARIABLE) {
	cmpl	$1, 8(%rbx)	 ;, mb_329->type
	jne	.L319	 ;,
 ; D:/TC/src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	(%rbx), %rax	 ; mb_329->content.variable, mb_329->content.variable
	movq	8(%rax), %rax	 ; _331->name, _332
	movq	%rax, 136(%rsp)	 ; _332, %sfp
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	104(%rsp), %r8	 ; %sfp,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, %rdx	 ; tmp870, _333
 ; D:/TC/src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	136(%rsp), %r8	 ; %sfp,
	movl	$2, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	%rax, 32(%rsp)	 ; tmp871,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
	movq	%rax, %r8	 ;, tmp872
 ; D:/TC/src/parser.c:350:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, 136(%rsp)	 ; tmp873, %sfp
 ; D:/TC/src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	(%rbx), %rax	 ; mb_329->content.variable, mb_329->content.variable
	movq	16(%rax), %r9	 ; _337->value, _338
 ; D:/TC/src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	testq	%r9, %r9	 ; _338
	je	.L375	 ;,
.L320:
 ; D:/TC/src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movl	$0, %r8d	 ;,
	movq	136(%rsp), %rdx	 ; %sfp,
	movl	$13, %ecx	 ;,
	call	create_expression	 ;
 ; D:/TC/src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp877,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdx	 ; tmp878, _344
 ; D:/TC/src/parser.c:352:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	%r12, %rcx	 ; body,
	call	list_append	 ;
	jmp	.L319	 ;
.L375:
 ; D:/TC/src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movl	$2, %edx	 ;,
	leaq	.LC89(%rip), %rcx	 ;, tmp666
	call	create_string	 ;
	movq	%rax, %rdx	 ; tmp874, _339
 ; D:/TC/src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_primary	 ;
	movq	%rax, %r8	 ;, tmp875
 ; D:/TC/src/parser.c:351:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %r9	 ; tmp876, _338
	jmp	.L320	 ;
.L374:
 ; D:/TC/src/parser.c:355:     list(Expression*) args = create_list();
	call	create_list	 ;
	movq	%rax, %rbx	 ; tmp880, args
 ; D:/TC/src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	104(%rsp), %r8	 ; %sfp,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	%rax, 32(%rsp)	 ; tmp881,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
	movq	%rax, %r8	 ;, tmp882
 ; D:/TC/src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rdx	 ; tmp883, _348
 ; D:/TC/src/parser.c:356:     list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	%rbx, %rcx	 ; args,
	call	list_append	 ;
 ; D:/TC/src/parser.c:357:     list(Variable*) params = list_copy(parameters);
	movq	%rbp, %rcx	 ; parameters,
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp884, params
 ; D:/TC/src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	jmp	.L322	 ;
.L323:
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	8(%rax), %r8	 ; param_350->name, param_350->name
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rax, 32(%rsp)	 ; tmp885,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
	movq	%rax, %r8	 ;, tmp886
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rdx	 ; tmp887, _354
 ; D:/TC/src/parser.c:359:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rbx, %rcx	 ; args,
	call	list_append	 ;
.L322:
 ; D:/TC/src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	movq	%rsi, %rcx	 ; params,
	call	list_pop	 ;
 ; D:/TC/src/parser.c:358:     while ((param = (Variable*)list_pop(params)) != NULL)
	testq	%rax, %rax	 ; param
	jne	.L323	 ;,
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%r13, %r8	 ; init,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, %rdx	 ; tmp889, _355
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rbx, 32(%rsp)	 ; args,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, 32(%rsp)	 ; tmp890,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
	movq	%rax, %r8	 ;, tmp891
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp892,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdx	 ; tmp893, _359
 ; D:/TC/src/parser.c:360:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%r12, %rcx	 ; body,
	call	list_append	 ;
 ; D:/TC/src/parser.c:361:     create_method_use_ptr(method, constructor, name, parameters, body, method->method_scope);
	movq	32(%rdi), %rax	 ; method_305->method_scope, method_305->method_scope
	movq	%rax, 40(%rsp)	 ; method_305->method_scope,
	movq	%r12, 32(%rsp)	 ; body,
	movq	%rbp, %r9	 ; parameters,
	movq	88(%rsp), %rsi	 ; %sfp, name
	movq	%rsi, %r8	 ; name,
	movq	128(%rsp), %rdx	 ; %sfp,
	movq	%rdi, %rcx	 ; method,
	call	create_method_use_ptr	 ;
 ; D:/TC/src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; method,
	movl	$0, %ecx	 ;,
	call	create_class_member	 ;
	movq	%rax, %rdx	 ; tmp894, _361
 ; D:/TC/src/parser.c:362:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	96(%rsp), %rdi	 ; %sfp, members
	movq	%rdi, %rcx	 ; members,
	call	list_append	 ;
 ; D:/TC/src/parser.c:364:     return create_class_use_ptr(class, name, members, class_scope, size);
	movq	120(%rsp), %rax	 ; %sfp, size
	movq	%rax, 32(%rsp)	 ; size,
	movq	64(%rsp), %r9	 ; %sfp,
	movq	%rdi, %r8	 ; members,
	movq	%rsi, %rdx	 ; name,
	movq	112(%rsp), %rcx	 ; %sfp,
	call	create_class_use_ptr	 ;
	movq	%rax, %r9	 ; tmp895, _362
 ; D:/TC/src/parser.c:50:             if (class == NULL)
	testq	%rax, %rax	 ; _362
	je	.L328	 ;,
.L324:
 ; D:/TC/src/parser.c:52:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$2, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ; tmp897, _36
 ; D:/TC/src/parser.c:52:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	80(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
.L239:
 ; D:/TC/src/parser.c:55:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, 56(%rsp)	 ; token, %sfp
 ; D:/TC/src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L228	 ;,
.L227:
 ; D:/TC/src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	movq	56(%rsp), %rax	 ; %sfp, token
	movl	24(%rax), %eax	 ; token_587->type, _39
 ; D:/TC/src/parser.c:37:     while (token != NULL && token->type != EOF_TOKEN) {
	testl	%eax, %eax	 ; _39
	je	.L228	 ;,
 ; D:/TC/src/parser.c:38:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	 ;, _39
	je	.L376	 ;,
.L266:
 ; D:/TC/src/parser.c:54:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp898
 ; D:/TC/src/parser.c:54:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC91(%rip), %rcx	 ;, tmp672
	call	parser_error	 ;
	jmp	.L239	 ;
.L228:
 ; D:/TC/src/parser.c:58:     return create_code(members, global_scope);
	movq	72(%rsp), %rdx	 ; %sfp,
	movq	80(%rsp), %rcx	 ; %sfp,
	call	create_code	 ;
 ; D:/TC/src/parser.c:59: }
	addq	$184, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
	.ident	"GCC: (GNU) 13.2.0"
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	search_name;	.scl	2;	.type	32;	.endef
	.def	create_symbol;	.scl	2;	.type	32;	.endef
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	create_function_use_ptr;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	create_method_use_ptr;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	create_class_use_ptr;	.scl	2;	.type	32;	.endef
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
