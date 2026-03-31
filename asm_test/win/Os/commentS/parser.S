	.file	"D:\\TC\\src\\parser.c"
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
 ; D:\TC\src\parser.c:645:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:642: static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, SymbolTable* now_scope, Parser* parser) {
	subq	$56, %rsp	 ;,
 ; D:\TC\src\parser.c:642: static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, SymbolTable* now_scope, Parser* parser) {
	movq	%rcx, 128(%rsp)	 ; tmp119, lexer
	movq	160(%rsp), %r15	 ; parser, parser
.L20:
 ; D:\TC\src\parser.c:674:         token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:646:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_15->type
	jne	.L14	 ;,
 ; D:\TC\src\parser.c:647:         OperatorType op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_15->lexeme,
	call	string_to_operator	 ;
 ; D:\TC\src\parser.c:648:         int op_prec = operator_precedence(op);
	movl	%eax, %ecx	 ; op,
 ; D:\TC\src\parser.c:647:         OperatorType op = string_to_operator(token->lexeme);
	movl	%eax, %edi	 ; tmp124, op
 ; D:\TC\src\parser.c:648:         int op_prec = operator_precedence(op);
	call	operator_precedence	 ;
	movl	%eax, %r12d	 ; tmp125, op_prec
 ; D:\TC\src\parser.c:649:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, %edi	 ;, op
	je	.L14	 ;,
	cmpl	%r14d, %eax	 ; min_prec, op_prec
	jge	.L3	 ;,
.L14:
 ; D:\TC\src\parser.c:676:     token = peek_current_token(lexer);
	movq	128(%rsp), %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:678:     return expr_left;
	jmp	.L1	 ;
.L3:
 ; D:\TC\src\parser.c:651:         token = get_next_token(lexer, true);  // consume operator
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:652:         token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:653:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%r15, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
 ; D:\TC\src\parser.c:652:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp126, token
 ; D:\TC\src\parser.c:653:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp127, right_primary
 ; D:\TC\src\parser.c:654:         if (right_primary == NULL) {
	testq	%rax, %rax	 ; right_primary
	jne	.L6	 ;,
 ; D:\TC\src\parser.c:655:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_38(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:655:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC0(%rip), %rcx	 ;, tmp113
 ; D:\TC\src\parser.c:655:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp128
 ; D:\TC\src\parser.c:655:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:657:             return NULL;
	jmp	.L7	 ;
.L6:
 ; D:\TC\src\parser.c:659:         Expression* right = create_expression(OP_NONE, NULL, right_primary, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rsi	 ; tmp129, right
.L19:
 ; D:\TC\src\parser.c:671:             token = peek_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:661:         while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_14->type
	jne	.L12	 ;,
 ; D:\TC\src\parser.c:662:             OperatorType next_op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_14->lexeme,
	call	string_to_operator	 ;
 ; D:\TC\src\parser.c:663:             int next_prec = operator_precedence(next_op);
	movl	%eax, %ecx	 ; next_op,
 ; D:\TC\src\parser.c:662:             OperatorType next_op = string_to_operator(token->lexeme);
	movl	%eax, %r13d	 ; tmp131, next_op
 ; D:\TC\src\parser.c:663:             int next_prec = operator_precedence(next_op);
	call	operator_precedence	 ;
	movl	%eax, %r8d	 ; tmp132, next_prec
 ; D:\TC\src\parser.c:664:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %r13d	 ;, next_op
	je	.L12	 ;,
	cmpl	%eax, %r12d	 ; next_prec, op_prec
	jl	.L9	 ;,
.L12:
 ; D:\TC\src\parser.c:673:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rbx, %rdx	 ; <retval>,
	movl	%edi, %ecx	 ; op,
	movq	%rsi, %r9	 ; right,
	xorl	%r8d, %r8d	 ;
	call	create_expression	 ;
 ; D:\TC\src\parser.c:674:         token = peek_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:673:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rax, %rbx	 ; tmp133, <retval>
	jmp	.L20	 ;
.L9:
 ; D:\TC\src\parser.c:666:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	%r15, 32(%rsp)	 ; parser,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rsi, %rdx	 ; right,
	movq	%rbp, %r9	 ; now_scope,
	call	parse_expr_prec	 ;
	movq	%rax, %rsi	 ; tmp135, right
 ; D:\TC\src\parser.c:667:             if (right == NULL) {
	testq	%rax, %rax	 ; right
	jne	.L19	 ;,
.L7:
 ; D:\TC\src\parser.c:657:             return NULL;
	xorl	%ebx, %ebx	 ; <retval>
.L1:
 ; D:\TC\src\parser.c:679: }
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
 ; D:\TC\src\parser.c:682:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %rbx	 ; tmp95, <retval>
 ; D:\TC\src\parser.c:683:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; <retval>
	jne	.L23	 ;,
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_10(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, 56(%rsp)	 ; _2, %sfp
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	56(%rsp), %r8	 ; %sfp, _2
	leaq	.LC1(%rip), %rcx	 ;, tmp90
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp97, _3
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:686:         return NULL;
	jmp	.L22	 ;
.L23:
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	movq	%rax, %r8	 ; <retval>,
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rdi, 32(%rsp)	 ; parser,
	movq	%rbp, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp98, _4
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rbx	 ; tmp99, <retval>
.L22:
 ; D:\TC\src\parser.c:690: }
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
	movq	%rdx, %r12	 ; tmp129, now_scope
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp128, lexer
	pushq	%rbx	 ;
	movq	%r8, %rbx	 ; tmp130, parser
	subq	$40, %rsp	 ;,
 ; D:\TC\src\parser.c:363:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rdi	 ; tmp131, token
 ; D:\TC\src\parser.c:364:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_36->type, _1
 ; D:\TC\src\parser.c:364:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _1
	je	.L27	 ;,
 ; D:\TC\src\parser.c:364:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _1
	jne	.L30	 ;,
 ; D:\TC\src\parser.c:364:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rdi), %rcx	 ; token_36->lexeme,
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:364:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp133
	je	.L30	 ;,
.L27:
 ; D:\TC\src\parser.c:369:     Symbol* type = search_name(now_scope, token->lexeme);
	movq	(%rdi), %rdx	 ; token_36->lexeme,
	movq	%r12, %rcx	 ; now_scope,
	call	search_name	 ;
	movq	%rax, %rbp	 ; tmp134, type
 ; D:\TC\src\parser.c:370:     if (type != NULL) {
	testq	%rax, %rax	 ; type
	je	.L31	 ;,
 ; D:\TC\src\parser.c:372:         if (type_ptr->kind != SYMBOL_TYPE && type_ptr->kind != SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; type_43->kind, _46
 ; D:\TC\src\parser.c:372:         if (type_ptr->kind != SYMBOL_TYPE && type_ptr->kind != SYMBOL_CLASS)
	cmpl	$6, %eax	 ;, _46
	je	.L32	 ;,
	testl	%eax, %eax	 ; _46
	je	.L32	 ;,
 ; D:\TC\src\parser.c:373:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_38(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:373:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC3(%rip), %rcx	 ;, tmp122
 ; D:\TC\src\parser.c:373:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp135
	jmp	.L55	 ;
.L31:
 ; D:\TC\src\parser.c:375:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_38(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:375:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC4(%rip), %rcx	 ;, tmp123
 ; D:\TC\src\parser.c:375:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp136
.L55:
 ; D:\TC\src\parser.c:375:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L32:
 ; D:\TC\src\parser.c:376:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:377:     if (token->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	 ;, token_50->type
 ; D:\TC\src\parser.c:376:     token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp137, token
 ; D:\TC\src\parser.c:377:     if (token->type != IDENTIFIER)
	je	.L33	 ;,
 ; D:\TC\src\parser.c:378:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_38(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:378:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC5(%rip), %rcx	 ;, tmp124
 ; D:\TC\src\parser.c:378:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp138
 ; D:\TC\src\parser.c:378:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L33:
 ; D:\TC\src\parser.c:379:     Symbol* name = create_symbol(token->lexeme, SYMBOL_VARIABLE, type, now_scope);
	movq	(%rdi), %rcx	 ; token_50->lexeme,
	movq	%r12, %r9	 ; now_scope,
	movq	%rbp, %r8	 ; type,
	movl	$3, %edx	 ;,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:381:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:379:     Symbol* name = create_symbol(token->lexeme, SYMBOL_VARIABLE, type, now_scope);
	movq	%rax, %rdi	 ; tmp139, name
 ; D:\TC\src\parser.c:381:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:382:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_56->type
	je	.L34	 ;,
.L36:
 ; D:\TC\src\parser.c:380:     Expression* value = NULL;
	xorl	%esi, %esi	 ; value
	jmp	.L35	 ;
.L34:
 ; D:\TC\src\parser.c:382:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx	 ;, tmp125
	movq	(%rax), %rcx	 ; token_56->lexeme,
	movq	(%rdx), %rdx	 ; ASSIGN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:382:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	 ; tmp141
	je	.L36	 ;,
 ; D:\TC\src\parser.c:383:         token = get_next_token(lexer, true);  // consume '='
	movq	%rsi, %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:384:         token = get_next_token(lexer, true);
	movq	%rsi, %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:385:         value = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	movq	%r12, %rdx	 ; now_scope,
 ; D:\TC\src\parser.c:384:         token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp142, token
 ; D:\TC\src\parser.c:385:         value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rsi	 ; tmp143, value
 ; D:\TC\src\parser.c:386:         if (value == NULL)
	testq	%rax, %rax	 ; value
	jne	.L35	 ;,
 ; D:\TC\src\parser.c:387:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_38(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:387:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC6(%rip), %rcx	 ;, tmp126
 ; D:\TC\src\parser.c:387:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp144
 ; D:\TC\src\parser.c:387:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L35:
 ; D:\TC\src\parser.c:391: }
	addq	$40, %rsp	 ;,
 ; D:\TC\src\parser.c:390:     return create_variable(type, name, value);
	movq	%rsi, %r8	 ; value,
	movq	%rdi, %rdx	 ; name,
	movq	%rbp, %rcx	 ; type,
 ; D:\TC\src\parser.c:391: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
 ; D:\TC\src\parser.c:390:     return create_variable(type, name, value);
	jmp	create_variable	 ;
.L30:
 ; D:\TC\src\parser.c:365:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_38(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:365:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC2(%rip), %rcx	 ;, tmp117
 ; D:\TC\src\parser.c:365:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp132
 ; D:\TC\src\parser.c:365:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:391: }
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
 ; D:\TC\src\parser.c:691: Primary* parse_primary(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
	movq	%rcx, 128(%rsp)	 ; tmp270, lexer
	movq	%rdx, 136(%rsp)	 ; tmp271, now_scope
 ; D:\TC\src\parser.c:694:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rbp	 ; tmp273, token
 ; D:\TC\src\parser.c:700:     if (token->type == INTEGER) {
	movl	24(%rax), %eax	 ; token_62->type, _1
 ; D:\TC\src\parser.c:700:     if (token->type == INTEGER) {
	cmpl	$2, %eax	 ;, _1
	jne	.L57	 ;,
 ; D:\TC\src\parser.c:702:         str_value = token->lexeme;
	movq	0(%rbp), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:699:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; D:\TC\src\parser.c:698:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:697:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	 ; expr_value
 ; D:\TC\src\parser.c:701:         type = PRIM_INTEGER;
	xorl	%ebp, %ebp	 ; type
	jmp	.L58	 ;
.L57:
 ; D:\TC\src\parser.c:703:     } else if (token->type == FLOAT) {
	cmpl	$3, %eax	 ;, _1
	jne	.L59	 ;,
 ; D:\TC\src\parser.c:705:         str_value = token->lexeme;
	movq	0(%rbp), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:699:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; D:\TC\src\parser.c:698:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:697:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	 ; expr_value
 ; D:\TC\src\parser.c:704:         type = PRIM_FLOAT;
	movl	$1, %ebp	 ;, type
	jmp	.L58	 ;
.L59:
 ; D:\TC\src\parser.c:706:     } else if (token->type == STRING) {
	cmpl	$4, %eax	 ;, _1
	jne	.L60	 ;,
 ; D:\TC\src\parser.c:708:         str_value = token->lexeme;
	movq	0(%rbp), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:699:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; D:\TC\src\parser.c:698:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:697:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	 ; expr_value
 ; D:\TC\src\parser.c:707:         type = PRIM_STRING;
	movl	$2, %ebp	 ;, type
	jmp	.L58	 ;
.L60:
 ; D:\TC\src\parser.c:709:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _1
	jne	.L61	 ;,
 ; D:\TC\src\parser.c:709:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	movq	.refptr.TRUE_KEYWORD(%rip), %rax	 ;, tmp221
	movq	0(%rbp), %rcx	 ; token_62->lexeme,
	movq	(%rax), %rdx	 ; TRUE_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:709:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	 ; tmp274
	je	.L62	 ;,
 ; D:\TC\src\parser.c:711:         str_value = token->lexeme;
	movq	0(%rbp), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:699:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; D:\TC\src\parser.c:698:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:697:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	 ; expr_value
 ; D:\TC\src\parser.c:710:         type = PRIM_TRUE;
	movl	$3, %ebp	 ;, type
 ; D:\TC\src\parser.c:711:         str_value = token->lexeme;
	jmp	.L58	 ;
.L62:
 ; D:\TC\src\parser.c:712:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, 24(%rbp)	 ;, token_62->type
	jne	.L61	 ;,
 ; D:\TC\src\parser.c:712:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movq	.refptr.FALSE_KEYWORD(%rip), %rax	 ;, tmp222
	movq	0(%rbp), %rcx	 ; token_62->lexeme,
	movq	(%rax), %rdx	 ; FALSE_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:712:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	 ; tmp275
	je	.L61	 ;,
 ; D:\TC\src\parser.c:714:         str_value = token->lexeme;
	movq	0(%rbp), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:699:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; D:\TC\src\parser.c:698:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:697:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	 ; expr_value
 ; D:\TC\src\parser.c:713:         type = PRIM_FALSE;
	movl	$4, %ebp	 ;, type
 ; D:\TC\src\parser.c:714:         str_value = token->lexeme;
	jmp	.L58	 ;
.L61:
 ; D:\TC\src\parser.c:715:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_62->type
	jne	.L71	 ;,
 ; D:\TC\src\parser.c:715:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp223
	movq	0(%rbp), %rcx	 ; token_62->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:715:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp276
	je	.L64	 ;,
 ; D:\TC\src\parser.c:717:         token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:718:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	136(%rsp), %rdx	 ; now_scope,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rdi, %r8	 ; parser,
 ; D:\TC\src\parser.c:717:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp277, token
 ; D:\TC\src\parser.c:718:         expr_value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rbx	 ; tmp278, expr_value
 ; D:\TC\src\parser.c:719:         if (expr_value == NULL) {
	testq	%rax, %rax	 ; expr_value
	jne	.L65	 ;,
 ; D:\TC\src\parser.c:720:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:720:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC7(%rip), %rcx	 ;, tmp224
 ; D:\TC\src\parser.c:720:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp279
	jmp	.L164	 ;
.L65:
 ; D:\TC\src\parser.c:724:         token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:725:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %ebp	 ; token_75->type, type
 ; D:\TC\src\parser.c:724:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp280, token
 ; D:\TC\src\parser.c:725:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %ebp	 ;, type
	je	.L67	 ;,
.L69:
 ; D:\TC\src\parser.c:726:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:726:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC8(%rip), %rcx	 ;, tmp225
 ; D:\TC\src\parser.c:726:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp281
.L164:
 ; D:\TC\src\parser.c:726:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:722:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L56	 ;
.L67:
 ; D:\TC\src\parser.c:725:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp226
	movq	(%rsi), %rcx	 ; token_75->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:725:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp282
	je	.L69	 ;,
 ; D:\TC\src\parser.c:699:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; D:\TC\src\parser.c:698:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:696:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
	jmp	.L58	 ;
.L64:
 ; D:\TC\src\parser.c:730:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_62->type
	jne	.L71	 ;,
 ; D:\TC\src\parser.c:730:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp227
	movq	0(%rbp), %rcx	 ; token_62->lexeme,
	movq	(%rax), %rdx	 ; NOT_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:730:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	 ; tmp283
	je	.L70	 ;,
 ; D:\TC\src\parser.c:732:         token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:733:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	136(%rsp), %rdx	 ; now_scope,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rdi, %r8	 ; parser,
 ; D:\TC\src\parser.c:732:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp284, token
 ; D:\TC\src\parser.c:733:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp285, prim_value
 ; D:\TC\src\parser.c:734:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	jne	.L109	 ;,
 ; D:\TC\src\parser.c:735:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:735:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC9(%rip), %rcx	 ;, tmp228
 ; D:\TC\src\parser.c:735:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp286
	jmp	.L164	 ;
.L70:
 ; D:\TC\src\parser.c:739:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_62->type
	jne	.L71	 ;,
 ; D:\TC\src\parser.c:739:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp229
	movq	0(%rbp), %rcx	 ; token_62->lexeme,
	movq	(%rax), %rdx	 ; SUB_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:739:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	 ; tmp287
	je	.L71	 ;,
 ; D:\TC\src\parser.c:741:         token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:742:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	136(%rsp), %rdx	 ; now_scope,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rdi, %r8	 ; parser,
 ; D:\TC\src\parser.c:741:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp288, token
 ; D:\TC\src\parser.c:742:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp289, prim_value
 ; D:\TC\src\parser.c:743:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	jne	.L110	 ;,
 ; D:\TC\src\parser.c:744:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:744:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC10(%rip), %rcx	 ;, tmp230
 ; D:\TC\src\parser.c:744:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp290
	jmp	.L164	 ;
.L109:
 ; D:\TC\src\parser.c:699:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; D:\TC\src\parser.c:697:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	 ; expr_value
 ; D:\TC\src\parser.c:696:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:731:         type = PRIM_NOT_OPERAND;
	movl	$6, %ebp	 ;, type
	jmp	.L58	 ;
.L110:
 ; D:\TC\src\parser.c:699:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; D:\TC\src\parser.c:697:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	 ; expr_value
 ; D:\TC\src\parser.c:696:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:740:         type = PRIM_NEG_OPERAND;
	movl	$7, %ebp	 ;, type
.L58:
 ; D:\TC\src\parser.c:762:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%rsi, 32(%rsp)	 ; variable_value,
	movq	%rbx, %r8	 ; expr_value,
	movl	%ebp, %ecx	 ; type,
	call	create_primary	 ;
	jmp	.L56	 ;
.L71:
 ; D:\TC\src\parser.c:748:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movl	24(%rbp), %eax	 ; token_62->type, _34
 ; D:\TC\src\parser.c:748:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$1, %eax	 ;, _34
	jne	.L162	 ;,
.L75:
 ; D:\TC\src\parser.c:766:     Token* token = peek_current_token(lexer);
	movq	128(%rsp), %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %rbx	 ; tmp291, token
 ; D:\TC\src\parser.c:767:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movl	24(%rax), %eax	 ; token_107->type, _108
 ; D:\TC\src\parser.c:767:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	 ;, _108
	jne	.L72	 ;,
	jmp	.L73	 ;
.L162:
 ; D:\TC\src\parser.c:748:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$6, %eax	 ;, _34
	jne	.L74	 ;,
 ; D:\TC\src\parser.c:748:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp231
	movq	0(%rbp), %rcx	 ; token_62->lexeme,
	movq	(%rax), %rdx	 ; SELF_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:748:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	testb	%al, %al	 ; tmp292
	je	.L74	 ;,
 ; D:\TC\src\parser.c:748:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpb	$0, 9(%rdi)	 ;, parser_71(D)->in_method
	jne	.L75	 ;,
	jmp	.L74	 ;
.L72:
 ; D:\TC\src\parser.c:767:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	 ;, _108
	je	.L76	 ;,
.L78:
 ; D:\TC\src\parser.c:768:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:768:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC11(%rip), %rcx	 ;, tmp232
 ; D:\TC\src\parser.c:768:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp293
	jmp	.L168	 ;
.L76:
 ; D:\TC\src\parser.c:767:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp233
	movq	(%rbx), %rcx	 ; token_107->lexeme,
	movq	(%rax), %rdx	 ; SELF_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:767:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	 ; tmp294
	je	.L78	 ;,
.L73:
 ; D:\TC\src\parser.c:775:     base_name = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rdx	 ; token_107->lexeme,
	movq	136(%rsp), %rcx	 ; now_scope,
 ; D:\TC\src\parser.c:774:     SymbolTable* var_scope = NULL;
	xorl	%r12d, %r12d	 ; var_scope
 ; D:\TC\src\parser.c:772:     Symbol* current_type = NULL;
	xorl	%r13d, %r13d	 ; class_name
 ; D:\TC\src\parser.c:775:     base_name = search_name(now_scope, token->lexeme);
	call	search_name	 ;
 ; D:\TC\src\parser.c:776:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	xorl	%r8d, %r8d	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movq	%r8, 32(%rsp)	 ;,
	xorl	%ecx, %ecx	 ;
	movq	%rax, %r8	 ; base_name,
 ; D:\TC\src\parser.c:775:     base_name = search_name(now_scope, token->lexeme);
	movq	%rax, %rbx	 ; tmp295, base_name
 ; D:\TC\src\parser.c:776:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:777:     token = peek_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:776:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	movq	%rax, %rsi	 ; tmp296, variable_value
 ; D:\TC\src\parser.c:777:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
	movq	%rax, %r14	 ; tmp297, token
 ; D:\TC\src\parser.c:778:     while (token->type == SYMBOL) {
	jmp	.L79	 ;
.L83:
 ; D:\TC\src\parser.c:790:             else if (base_name->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rbx)	 ;, base_name_118->kind
	jne	.L85	 ;,
 ; D:\TC\src\parser.c:791:                 string name = make_method_name(base_name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp241
	movq	8(%rbx), %rcx	 ; base_name_118->name, base_name_118->name
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME,
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp301, name
 ; D:\TC\src\parser.c:792:                 base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
	movq	24(%rbx), %rax	 ; base_name_118->ast_node.class, base_name_118->ast_node.class
	movq	16(%rax), %rcx	 ; _139->class_scope, _140
	call	search_name_use_strcmp	 ;
 ; D:\TC\src\parser.c:793:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	xorl	%ecx, %ecx	 ;
	movq	%rsi, %rdx	 ; variable_value,
	xorl	%r9d, %r9d	 ;
	movq	%rcx, 32(%rsp)	 ;,
	movq	%rax, %r8	 ; base_name,
	movl	$2, %ecx	 ;,
 ; D:\TC\src\parser.c:792:                 base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
	movq	%rax, %rbx	 ; tmp302, base_name
 ; D:\TC\src\parser.c:793:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	call	create_variable_access	 ;
	movq	%rax, %rsi	 ; tmp303, variable_value
 ; D:\TC\src\parser.c:795:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	testq	%rbx, %rbx	 ; base_name
	jne	.L85	 ;,
.L84:
 ; D:\TC\src\parser.c:797:             token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:802:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	leaq	.LC14(%rip), %r15	 ;, tmp265
 ; D:\TC\src\parser.c:797:             token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp305, token
 ; D:\TC\src\parser.c:798:             list(Expression*) args = create_list();
	call	create_list	 ;
	movq	%rax, %r14	 ; tmp306, args
.L88:
 ; D:\TC\src\parser.c:799:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_154->type
	je	.L169	 ;,
.L94:
 ; D:\TC\src\parser.c:800:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	136(%rsp), %rdx	 ; now_scope,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rdi, %r8	 ; parser,
	call	parse_expression	 ;
	movq	%rax, %r13	 ; tmp307, arg
 ; D:\TC\src\parser.c:801:                 if (arg == NULL)
	testq	%rax, %rax	 ; arg
	jne	.L89	 ;,
 ; D:\TC\src\parser.c:802:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:802:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	movq	%r15, %rcx	 ; tmp265,
 ; D:\TC\src\parser.c:802:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp308
 ; D:\TC\src\parser.c:802:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L89:
 ; D:\TC\src\parser.c:803:                 list_append(args, (pointer)arg);
	movq	%r13, %rdx	 ; arg,
	movq	%r14, %rcx	 ; args,
	call	list_append	 ;
 ; D:\TC\src\parser.c:804:                 token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:805:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_155->type
 ; D:\TC\src\parser.c:804:                 token = get_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp309, token
 ; D:\TC\src\parser.c:805:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	je	.L90	 ;,
.L93:
 ; D:\TC\src\parser.c:808:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:808:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC15(%rip), %rcx	 ;, tmp248
 ; D:\TC\src\parser.c:808:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp310
.L168:
 ; D:\TC\src\parser.c:827:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L77	 ;
.L106:
 ; D:\TC\src\parser.c:779:         if (base_name != NULL) {
	testq	%rbx, %rbx	 ; base_name
	je	.L80	 ;,
 ; D:\TC\src\parser.c:781:             if (base_name->type != NULL)  // subroutine or variable or attribute or parameter
	movq	(%rbx), %r13	 ; base_name_118->type, class_name
 ; D:\TC\src\parser.c:780:             current_type = base_name;     // class or type
	testq	%r13, %r13	 ; class_name
	cmove	%rbx, %r13	 ; class_name,, base_name, class_name
.L80:
 ; D:\TC\src\parser.c:784:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	testq	%r12, %r12	 ; var_scope
	je	.L170	 ;,
.L81:
 ; D:\TC\src\parser.c:786:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp338
	movq	(%r14), %rcx	 ; token_129->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:786:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp298
	jne	.L171	 ;,
 ; D:\TC\src\parser.c:819:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp342
	movq	(%r14), %rcx	 ; token_129->lexeme,
	movq	(%rax), %rdx	 ; L_BRACKET_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:819:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp316
	je	.L96	 ;,
 ; D:\TC\src\parser.c:820:             token = get_next_token(lexer, true);  // consume '['
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:821:             token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:822:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	136(%rsp), %rdx	 ; now_scope,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rdi, %r8	 ; parser,
 ; D:\TC\src\parser.c:821:             token = get_next_token(lexer, true);
	movq	%rax, %r14	 ; tmp317, token
 ; D:\TC\src\parser.c:822:             Expression* index = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %r15	 ; tmp318, index
 ; D:\TC\src\parser.c:823:             if (index == NULL)
	testq	%rax, %rax	 ; index
	jne	.L97	 ;,
 ; D:\TC\src\parser.c:824:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:824:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC16(%rip), %rcx	 ;, tmp254
 ; D:\TC\src\parser.c:824:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp319
 ; D:\TC\src\parser.c:824:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L97:
 ; D:\TC\src\parser.c:825:             token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:826:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_186->type
 ; D:\TC\src\parser.c:825:             token = get_next_token(lexer, true);
	movq	%rax, %r14	 ; tmp320, token
 ; D:\TC\src\parser.c:826:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	jne	.L99	 ;,
 ; D:\TC\src\parser.c:826:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp256
	movq	(%r14), %rcx	 ; token_186->lexeme,
	movq	(%rax), %rdx	 ; R_BRACKET_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:826:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp322
	je	.L99	 ;,
 ; D:\TC\src\parser.c:831:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	xorl	%edx, %edx	 ;
	movq	%r15, %r9	 ; index,
	xorl	%r8d, %r8d	 ;
	movl	$3, %ecx	 ;,
	movq	%rdx, 32(%rsp)	 ;,
	movq	%rsi, %rdx	 ; variable_value,
	call	create_variable_access	 ;
	movq	%rax, %rsi	 ; tmp323, variable_value
.L95:
 ; D:\TC\src\parser.c:867:         token = peek_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	peek_next_token	 ;
	movq	%rax, %r14	 ; tmp333, token
.L79:
 ; D:\TC\src\parser.c:778:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%r14)	 ;, token_129->type
	je	.L106	 ;,
	jmp	.L107	 ;
.L170:
 ; D:\TC\src\parser.c:784:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	testq	%r13, %r13	 ; class_name
	je	.L81	 ;,
 ; D:\TC\src\parser.c:784:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r13)	 ;, current_type_122->kind
	jne	.L81	 ;,
 ; D:\TC\src\parser.c:785:             var_scope = current_type->ast_node.class->class_scope;
	movq	24(%r13), %rax	 ; current_type_122->ast_node.class, current_type_122->ast_node.class
	movq	16(%rax), %r12	 ; _126->class_scope, var_scope
	jmp	.L81	 ;
.L171:
 ; D:\TC\src\parser.c:787:             token = get_next_token(lexer, true);  // consume '('
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp299, token
 ; D:\TC\src\parser.c:788:             if (base_name == NULL)
	testq	%rbx, %rbx	 ; base_name
	jne	.L83	 ;,
 ; D:\TC\src\parser.c:789:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:789:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC12(%rip), %rcx	 ;, tmp240
 ; D:\TC\src\parser.c:789:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp300
	jmp	.L165	 ;
.L85:
 ; D:\TC\src\parser.c:795:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	movl	32(%rbx), %eax	 ; base_name_145->kind, tmp339
	decl	%eax	 ; tmp244
	cmpl	$1, %eax	 ;, tmp244
	jbe	.L84	 ;,
 ; D:\TC\src\parser.c:796:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:796:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC13(%rip), %rcx	 ;, tmp246
 ; D:\TC\src\parser.c:796:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp304
.L165:
 ; D:\TC\src\parser.c:796:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L84	 ;
.L90:
 ; D:\TC\src\parser.c:805:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp340
	movq	(%r12), %rcx	 ; token_155->lexeme,
	movq	(%rax), %rdx	 ; COMMA_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:805:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	testb	%al, %al	 ; tmp311
	je	.L91	 ;,
 ; D:\TC\src\parser.c:806:                     token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp312, token
 ; D:\TC\src\parser.c:806:                     token = get_next_token(lexer, true);
	jmp	.L88	 ;
.L91:
 ; D:\TC\src\parser.c:807:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_155->type
	jne	.L93	 ;,
 ; D:\TC\src\parser.c:807:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp250
	movq	(%r12), %rcx	 ; token_155->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:807:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp313
	jne	.L88	 ;,
	jmp	.L93	 ;
.L169:
 ; D:\TC\src\parser.c:799:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp341
	movq	(%r12), %rcx	 ; token_154->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:799:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp314
	je	.L94	 ;,
 ; D:\TC\src\parser.c:813:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%r14, 32(%rsp)	 ; args,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; variable_value,
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:814:             base_name = base_name->type;
	movq	(%rbx), %rbx	 ; base_name_174->type, base_name
 ; D:\TC\src\parser.c:813:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%rax, %rsi	 ; tmp315, variable_value
 ; D:\TC\src\parser.c:817:             if (base_name->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rbx)	 ;, base_name_175->kind
	jne	.L112	 ;,
 ; D:\TC\src\parser.c:818:                 var_scope = base_name->ast_node.class->class_scope;
	movq	24(%rbx), %rax	 ; base_name_175->ast_node.class, base_name_175->ast_node.class
	movq	16(%rax), %r12	 ; _177->class_scope, var_scope
	jmp	.L167	 ;
.L99:
 ; D:\TC\src\parser.c:827:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:827:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC17(%rip), %rcx	 ;, tmp255
 ; D:\TC\src\parser.c:827:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp321
	jmp	.L168	 ;
.L96:
 ; D:\TC\src\parser.c:832:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp343
	movq	(%r14), %rcx	 ; token_129->lexeme,
	movq	(%rax), %rdx	 ; DOT_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:832:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	 ; tmp324
	jne	.L100	 ;,
.L107:
 ; D:\TC\src\parser.c:751:         if (variable_value == NULL) {
	testq	%rsi, %rsi	 ; variable_value
	je	.L77	 ;,
 ; D:\TC\src\parser.c:698:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:697:     Expression* expr_value = NULL;
	xorl	%ebx, %ebx	 ; expr_value
 ; D:\TC\src\parser.c:696:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:749:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %ebp	 ;, type
	jmp	.L58	 ;
.L100:
 ; D:\TC\src\parser.c:833:             token = get_next_token(lexer, true);  // consume '.'
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:834:             token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r14	 ; tmp325, token
 ; D:\TC\src\parser.c:835:             if (var_scope == NULL) {
	testq	%r12, %r12	 ; var_scope
	jne	.L101	 ;,
 ; D:\TC\src\parser.c:836:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:836:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC18(%rip), %rcx	 ;, tmp258
 ; D:\TC\src\parser.c:836:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp326
	jmp	.L168	 ;
.L101:
 ; D:\TC\src\parser.c:840:             if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_198->type
	je	.L102	 ;,
 ; D:\TC\src\parser.c:841:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:841:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC19(%rip), %rcx	 ;, tmp259
 ; D:\TC\src\parser.c:841:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp327
	jmp	.L168	 ;
.L102:
 ; D:\TC\src\parser.c:845:             base_name = search_name(var_scope, token->lexeme);
	movq	(%rax), %rdx	 ; token_198->lexeme,
	movq	%r12, %rcx	 ; var_scope,
	call	search_name	 ;
	movq	%rax, %rbx	 ; tmp328, base_name
 ; D:\TC\src\parser.c:846:             if (base_name == NULL) {
	testq	%rax, %rax	 ; base_name
	jne	.L103	 ;,
 ; D:\TC\src\parser.c:848:                 if (current_type != NULL) {
	testq	%r13, %r13	 ; class_name
	je	.L104	 ;,
 ; D:\TC\src\parser.c:849:                     if (current_type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r13)	 ;, current_type_122->kind
	je	.L166	 ;,
 ; D:\TC\src\parser.c:851:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	movq	0(%r13), %r13	 ; current_type_122->type, class_name
 ; D:\TC\src\parser.c:851:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	testq	%r13, %r13	 ; class_name
	je	.L104	 ;,
 ; D:\TC\src\parser.c:851:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r13)	 ;, _211->kind
	jne	.L113	 ;,
.L166:
 ; D:\TC\src\parser.c:852:                         class_name = current_type->type->name;
	movq	8(%r13), %r13	 ;, class_name
	jmp	.L104	 ;
.L113:
 ; D:\TC\src\parser.c:847:                 string class_name = NULL;
	xorl	%r13d, %r13d	 ; class_name
.L104:
 ; D:\TC\src\parser.c:854:                 string name = make_method_name(class_name, token->lexeme);
	movq	(%r14), %rdx	 ; token_198->lexeme,
	movq	%r13, %rcx	 ; class_name,
	call	make_method_name	 ;
 ; D:\TC\src\parser.c:855:                 base_name = search_name_use_strcmp(var_scope, name);
	movq	%r12, %rcx	 ; var_scope,
 ; D:\TC\src\parser.c:854:                 string name = make_method_name(class_name, token->lexeme);
	movq	%rax, %rdx	 ; tmp329, name
 ; D:\TC\src\parser.c:855:                 base_name = search_name_use_strcmp(var_scope, name);
	call	search_name_use_strcmp	 ;
	movq	%rax, %rbx	 ; tmp330, base_name
 ; D:\TC\src\parser.c:857:             if (base_name == NULL) {
	testq	%rax, %rax	 ; base_name
	jne	.L103	 ;,
 ; D:\TC\src\parser.c:858:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:858:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC20(%rip), %rcx	 ;, tmp260
 ; D:\TC\src\parser.c:858:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp331
	jmp	.L168	 ;
.L103:
 ; D:\TC\src\parser.c:862:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	xorl	%eax, %eax	 ;
	movq	%rsi, %rdx	 ; variable_value,
	xorl	%r9d, %r9d	 ;
	movq	%rbx, %r8	 ; base_name,
	movq	%rax, 32(%rsp)	 ;,
	movl	$2, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, %rsi	 ; tmp332, variable_value
.L112:
 ; D:\TC\src\parser.c:816:             var_scope = NULL;
	xorl	%r12d, %r12d	 ; var_scope
.L167:
 ; D:\TC\src\parser.c:815:             current_type = NULL;
	xorl	%r13d, %r13d	 ; class_name
	jmp	.L95	 ;
.L77:
 ; D:\TC\src\parser.c:752:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:752:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC21(%rip), %rcx	 ;, tmp261
 ; D:\TC\src\parser.c:752:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp334
	jmp	.L164	 ;
.L74:
 ; D:\TC\src\parser.c:757:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:757:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC22(%rip), %rcx	 ;, tmp262
 ; D:\TC\src\parser.c:757:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp335
	jmp	.L164	 ;
.L56:
 ; D:\TC\src\parser.c:763: }
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
 ; D:\TC\src\parser.c:392: Statement* parse_statement(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
	movq	%rcx, 160(%rsp)	 ; tmp413, lexer
	movq	%rdx, 168(%rsp)	 ; tmp414, now_scope
 ; D:\TC\src\parser.c:395:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:397:     if (token->type == KEYWORD) {
	cmpl	$6, 24(%rax)	 ;, token_60->type
	jne	.L173	 ;,
	movq	%rax, %rsi	 ; tmp416, token
 ; D:\TC\src\parser.c:398:         if (string_equal(token->lexeme, IF_KEYWORD))
	movq	.refptr.IF_KEYWORD(%rip), %rax	 ;, tmp331
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; IF_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:398:         if (string_equal(token->lexeme, IF_KEYWORD))
	testb	%al, %al	 ; tmp417
	je	.L174	 ;,
 ; D:\TC\src\parser.c:444:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:445:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_114->type
 ; D:\TC\src\parser.c:444:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp418, token
 ; D:\TC\src\parser.c:445:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L175	 ;,
.L177:
 ; D:\TC\src\parser.c:446:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:446:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC23(%rip), %rcx	 ;, tmp332
 ; D:\TC\src\parser.c:446:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp419
	jmp	.L347	 ;
.L175:
 ; D:\TC\src\parser.c:445:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp553
	movq	(%rsi), %rcx	 ; token_114->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:445:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp420
	je	.L177	 ;,
 ; D:\TC\src\parser.c:450:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:451:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
 ; D:\TC\src\parser.c:450:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp421, token
 ; D:\TC\src\parser.c:451:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rdi	 ; tmp422, condition
 ; D:\TC\src\parser.c:452:     if (condition == NULL)
	testq	%rax, %rax	 ; condition
	jne	.L178	 ;,
 ; D:\TC\src\parser.c:453:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:453:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC24(%rip), %rcx	 ;, tmp334
 ; D:\TC\src\parser.c:453:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp423
 ; D:\TC\src\parser.c:453:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L178:
 ; D:\TC\src\parser.c:454:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:455:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_125->type
 ; D:\TC\src\parser.c:454:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp424, token
 ; D:\TC\src\parser.c:455:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L179	 ;,
.L180:
 ; D:\TC\src\parser.c:456:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:456:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC25(%rip), %rcx	 ;, tmp335
 ; D:\TC\src\parser.c:456:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp425
.L347:
 ; D:\TC\src\parser.c:456:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:448:         return NULL;
	xorl	%edx, %edx	 ; _222
	jmp	.L202	 ;
.L179:
 ; D:\TC\src\parser.c:455:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp554
	movq	(%rsi), %rcx	 ; token_125->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:455:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp426
	je	.L180	 ;,
 ; D:\TC\src\parser.c:460:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:461:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_132->type
 ; D:\TC\src\parser.c:460:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp427, token
 ; D:\TC\src\parser.c:461:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L181	 ;,
.L182:
 ; D:\TC\src\parser.c:462:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:462:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC26(%rip), %rcx	 ;, tmp337
 ; D:\TC\src\parser.c:462:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp428
	jmp	.L347	 ;
.L181:
 ; D:\TC\src\parser.c:461:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %r14	 ;, tmp338
	movq	(%rax), %rcx	 ; token_132->lexeme,
	movq	(%r14), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:461:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp429
	je	.L182	 ;,
 ; D:\TC\src\parser.c:466:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:467:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:471:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	leaq	.LC27(%rip), %rbp	 ;, tmp408
 ; D:\TC\src\parser.c:466:     list(Statement*) body = create_list();
	movq	%rax, 56(%rsp)	 ; tmp430, %sfp
 ; D:\TC\src\parser.c:467:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:468:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12	 ;, tmp407
 ; D:\TC\src\parser.c:467:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp431, token
.L183:
 ; D:\TC\src\parser.c:468:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_144->type
	je	.L353	 ;,
.L185:
 ; D:\TC\src\parser.c:469:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %r13	 ; tmp432, statement
 ; D:\TC\src\parser.c:470:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L184	 ;,
 ; D:\TC\src\parser.c:471:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:471:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%rbp, %rcx	 ; tmp408,
 ; D:\TC\src\parser.c:471:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp433
 ; D:\TC\src\parser.c:471:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L184:
 ; D:\TC\src\parser.c:472:         list_append(body, (pointer)statement);
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%r13, %rdx	 ; statement,
	call	list_append	 ;
 ; D:\TC\src\parser.c:473:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp434, token
	jmp	.L183	 ;
.L353:
 ; D:\TC\src\parser.c:468:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_BRACE_SYMBOL,
	movq	(%rsi), %rcx	 ; token_144->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:468:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp435
	je	.L185	 ;,
 ; D:\TC\src\parser.c:475:     list(ElseIf*) else_if = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:507:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	leaq	.LC32(%rip), %r15	 ;, tmp405
 ; D:\TC\src\parser.c:475:     list(ElseIf*) else_if = create_list();
	movq	%rax, 64(%rsp)	 ; tmp436, %sfp
 ; D:\TC\src\parser.c:476:     list(Statement*) else_body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:477:     token = peek_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:476:     list(Statement*) else_body = create_list();
	movq	%rax, 72(%rsp)	 ; tmp437, %sfp
 ; D:\TC\src\parser.c:477:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
	movq	%rax, %rsi	 ; tmp438, token
.L186:
 ; D:\TC\src\parser.c:478:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rsi)	 ;, token_194->type
	jne	.L198	 ;,
 ; D:\TC\src\parser.c:478:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	movq	.refptr.ELIF_KEYWORD(%rip), %rax	 ;, tmp558
	movq	(%rsi), %rcx	 ; token_194->lexeme,
	movq	(%rax), %rdx	 ; ELIF_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:478:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	 ; tmp459
	je	.L354	 ;,
 ; D:\TC\src\parser.c:479:         token = get_next_token(lexer, true);  // consume 'elif'
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:480:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:481:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_153->type
 ; D:\TC\src\parser.c:480:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp439, token
 ; D:\TC\src\parser.c:481:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L187	 ;,
.L188:
 ; D:\TC\src\parser.c:482:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:482:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC28(%rip), %rcx	 ;, tmp341
 ; D:\TC\src\parser.c:482:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp440
	jmp	.L347	 ;
.L187:
 ; D:\TC\src\parser.c:481:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp555
	movq	(%rsi), %rcx	 ; token_153->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:481:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp441
	je	.L188	 ;,
 ; D:\TC\src\parser.c:486:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:487:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
 ; D:\TC\src\parser.c:486:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp442, token
 ; D:\TC\src\parser.c:487:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %r12	 ; tmp443, elif_condition
 ; D:\TC\src\parser.c:488:         if (elif_condition == NULL)
	testq	%rax, %rax	 ; elif_condition
	jne	.L189	 ;,
 ; D:\TC\src\parser.c:489:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:489:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC29(%rip), %rcx	 ;, tmp343
 ; D:\TC\src\parser.c:489:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp444
 ; D:\TC\src\parser.c:489:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L189:
 ; D:\TC\src\parser.c:490:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:491:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_165->type
 ; D:\TC\src\parser.c:490:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp445, token
 ; D:\TC\src\parser.c:491:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L190	 ;,
.L191:
 ; D:\TC\src\parser.c:492:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:492:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC30(%rip), %rcx	 ;, tmp344
 ; D:\TC\src\parser.c:492:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp446
	jmp	.L347	 ;
.L190:
 ; D:\TC\src\parser.c:491:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp556
	movq	(%rsi), %rcx	 ; token_165->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:491:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp447
	je	.L191	 ;,
 ; D:\TC\src\parser.c:496:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:497:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_173->type
 ; D:\TC\src\parser.c:496:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp448, token
 ; D:\TC\src\parser.c:497:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L192	 ;,
.L193:
 ; D:\TC\src\parser.c:498:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:498:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC31(%rip), %rcx	 ;, tmp346
 ; D:\TC\src\parser.c:498:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp449
	jmp	.L347	 ;
.L192:
 ; D:\TC\src\parser.c:497:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; L_BRACE_SYMBOL,
	movq	(%rax), %rcx	 ; token_173->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:497:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp450
	je	.L193	 ;,
 ; D:\TC\src\parser.c:502:         list(Statement*) elif_body = create_list();
	call	create_list	 ;
	movq	%rax, %r13	 ; tmp451, elif_body
.L346:
 ; D:\TC\src\parser.c:509:             token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:504:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_186->type
 ; D:\TC\src\parser.c:509:             token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp455, token
 ; D:\TC\src\parser.c:504:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	je	.L355	 ;,
.L196:
 ; D:\TC\src\parser.c:505:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %rbp	 ; tmp453, statement
 ; D:\TC\src\parser.c:506:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L195	 ;,
 ; D:\TC\src\parser.c:507:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:507:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r15, %rcx	 ; tmp405,
 ; D:\TC\src\parser.c:507:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp454
 ; D:\TC\src\parser.c:507:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L195:
 ; D:\TC\src\parser.c:508:             list_append(elif_body, (pointer)statement);
	movq	%rbp, %rdx	 ; statement,
	movq	%r13, %rcx	 ; elif_body,
	call	list_append	 ;
	jmp	.L346	 ;
.L355:
 ; D:\TC\src\parser.c:504:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp557
	movq	(%rsi), %rcx	 ; token_186->lexeme,
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:504:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp456
	je	.L196	 ;,
 ; D:\TC\src\parser.c:511:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%r13, %rdx	 ; elif_body,
	movq	%r12, %rcx	 ; elif_condition,
	call	create_else_if	 ;
 ; D:\TC\src\parser.c:511:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	64(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:511:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%rax, %rdx	 ; tmp457, _192
 ; D:\TC\src\parser.c:511:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	call	list_append	 ;
 ; D:\TC\src\parser.c:512:         token = peek_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	peek_next_token	 ;
	movq	%rax, %rsi	 ; tmp458, token
	jmp	.L186	 ;
.L354:
 ; D:\TC\src\parser.c:514:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, 24(%rsi)	 ;, token_194->type
	jne	.L198	 ;,
 ; D:\TC\src\parser.c:514:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	movq	.refptr.ELSE_KEYWORD(%rip), %rax	 ;, tmp351
	movq	(%rsi), %rcx	 ; token_194->lexeme,
	movq	(%rax), %rdx	 ; ELSE_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:514:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	 ; tmp461
	jne	.L356	 ;,
.L198:
 ; D:\TC\src\parser.c:531:     token = peek_current_token(lexer);
	movq	160(%rsp), %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:533:     return create_if(condition, body, else_if, else_body);
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	72(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rcx	 ; condition,
	movq	64(%rsp), %r8	 ; %sfp,
	call	create_if	 ;
	movq	%rax, %rdx	 ; tmp460, _222
	jmp	.L202	 ;
.L356:
 ; D:\TC\src\parser.c:515:         token = get_next_token(lexer, true);  // consume 'else'
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:516:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:517:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_204->type
 ; D:\TC\src\parser.c:516:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp462, token
 ; D:\TC\src\parser.c:517:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L203	 ;,
.L204:
 ; D:\TC\src\parser.c:518:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:518:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC33(%rip), %rcx	 ;, tmp352
 ; D:\TC\src\parser.c:518:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp463
	jmp	.L347	 ;
.L203:
 ; D:\TC\src\parser.c:517:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; L_BRACE_SYMBOL,
	movq	(%rax), %rcx	 ; token_204->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:517:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp464
	je	.L204	 ;,
 ; D:\TC\src\parser.c:522:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:526:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	leaq	.LC34(%rip), %r12	 ;, tmp401
 ; D:\TC\src\parser.c:522:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:523:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r13	 ;, tmp400
 ; D:\TC\src\parser.c:522:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp465, token
.L205:
 ; D:\TC\src\parser.c:523:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_215->type
	je	.L357	 ;,
.L207:
 ; D:\TC\src\parser.c:524:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %r14	 ; tmp466, statement
 ; D:\TC\src\parser.c:525:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L206	 ;,
 ; D:\TC\src\parser.c:526:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:526:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r12, %rcx	 ; tmp401,
 ; D:\TC\src\parser.c:526:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp467
 ; D:\TC\src\parser.c:526:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L206:
 ; D:\TC\src\parser.c:527:             list_append(else_body, (pointer)statement);
	movq	72(%rsp), %rcx	 ; %sfp,
	movq	%r14, %rdx	 ; statement,
	call	list_append	 ;
 ; D:\TC\src\parser.c:528:             token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp468, token
	jmp	.L205	 ;
.L357:
 ; D:\TC\src\parser.c:523:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%r13), %rdx	 ; R_BRACE_SYMBOL,
	movq	(%rsi), %rcx	 ; token_215->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:523:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp469
	je	.L207	 ;,
	jmp	.L198	 ;
.L202:
 ; D:\TC\src\parser.c:399:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	xorl	%edi, %edi	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$2, %ecx	 ;,
	movq	%rdi, 40(%rsp)	 ;,
	movq	%rdi, 32(%rsp)	 ;,
	jmp	.L352	 ;
.L174:
 ; D:\TC\src\parser.c:400:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	movq	.refptr.FOR_KEYWORD(%rip), %rax	 ;, tmp356
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; FOR_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:400:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	testb	%al, %al	 ; tmp471
	je	.L209	 ;,
 ; D:\TC\src\parser.c:538:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:539:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_223->type
 ; D:\TC\src\parser.c:538:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp472, token
 ; D:\TC\src\parser.c:539:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L210	 ;,
.L212:
 ; D:\TC\src\parser.c:540:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:540:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC35(%rip), %rcx	 ;, tmp357
 ; D:\TC\src\parser.c:540:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp473
	jmp	.L348	 ;
.L210:
 ; D:\TC\src\parser.c:539:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp358
	movq	(%rsi), %rcx	 ; token_223->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:539:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp474
	je	.L212	 ;,
 ; D:\TC\src\parser.c:544:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:546:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_230->type
 ; D:\TC\src\parser.c:544:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp475, token
 ; D:\TC\src\parser.c:546:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	je	.L213	 ;,
.L216:
 ; D:\TC\src\parser.c:547:         initializer = parse_variable(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_variable	 ;
	movq	%rax, %rdi	 ; tmp476, initializer
 ; D:\TC\src\parser.c:548:         if (initializer == NULL)
	testq	%rax, %rax	 ; initializer
	jne	.L215	 ;,
 ; D:\TC\src\parser.c:549:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:549:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC36(%rip), %rcx	 ;, tmp360
 ; D:\TC\src\parser.c:549:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp478
 ; D:\TC\src\parser.c:549:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L215	 ;
.L213:
 ; D:\TC\src\parser.c:546:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp359
	movq	(%rsi), %rcx	 ; token_230->lexeme,
 ; D:\TC\src\parser.c:545:     Variable* initializer = NULL;
	xorl	%edi, %edi	 ; initializer
 ; D:\TC\src\parser.c:546:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:546:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp477
	jne	.L217	 ;,
	jmp	.L216	 ;
.L215:
 ; D:\TC\src\parser.c:550:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp479, token
.L217:
 ; D:\TC\src\parser.c:552:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_239->type
	je	.L218	 ;,
.L220:
 ; D:\TC\src\parser.c:553:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:553:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC37(%rip), %rcx	 ;, tmp361
 ; D:\TC\src\parser.c:553:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp480
.L348:
 ; D:\TC\src\parser.c:553:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:542:         return NULL;
	xorl	%r9d, %r9d	 ; _300
	jmp	.L219	 ;
.L218:
 ; D:\TC\src\parser.c:552:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r12	 ;, tmp362
	movq	(%rsi), %rcx	 ; token_239->lexeme,
	movq	(%r12), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:552:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp481
	je	.L220	 ;,
 ; D:\TC\src\parser.c:557:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:559:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_246->type
 ; D:\TC\src\parser.c:557:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp482, token
 ; D:\TC\src\parser.c:559:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	je	.L221	 ;,
.L224:
 ; D:\TC\src\parser.c:560:         condition = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_expression	 ;
	movq	%rax, %rbp	 ; tmp483, condition
 ; D:\TC\src\parser.c:561:         if (condition == NULL)
	testq	%rax, %rax	 ; condition
	jne	.L223	 ;,
 ; D:\TC\src\parser.c:562:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:562:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC38(%rip), %rcx	 ;, tmp364
 ; D:\TC\src\parser.c:562:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp485
 ; D:\TC\src\parser.c:562:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L223	 ;
.L221:
 ; D:\TC\src\parser.c:559:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r12), %rdx	 ; SEMICOLON_SYMBOL,
	movq	(%rax), %rcx	 ; token_246->lexeme,
 ; D:\TC\src\parser.c:558:     Expression* condition = NULL;
	xorl	%ebp, %ebp	 ; condition
 ; D:\TC\src\parser.c:559:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	call	string_equal	 ;
 ; D:\TC\src\parser.c:559:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp484
	jne	.L225	 ;,
	jmp	.L224	 ;
.L223:
 ; D:\TC\src\parser.c:563:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp486, token
.L225:
 ; D:\TC\src\parser.c:565:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_255->type
	je	.L226	 ;,
.L227:
 ; D:\TC\src\parser.c:566:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:566:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC39(%rip), %rcx	 ;, tmp365
 ; D:\TC\src\parser.c:566:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp487
	jmp	.L348	 ;
.L226:
 ; D:\TC\src\parser.c:565:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r12), %rdx	 ; SEMICOLON_SYMBOL,
	movq	(%rsi), %rcx	 ; token_255->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:565:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp488
	je	.L227	 ;,
 ; D:\TC\src\parser.c:570:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:572:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_262->type
 ; D:\TC\src\parser.c:570:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp489, token
 ; D:\TC\src\parser.c:572:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L228	 ;,
.L231:
 ; D:\TC\src\parser.c:573:         increment = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_expression	 ;
	movq	%rax, %r12	 ; tmp490, increment
 ; D:\TC\src\parser.c:574:         if (increment == NULL)
	testq	%rax, %rax	 ; increment
	jne	.L230	 ;,
 ; D:\TC\src\parser.c:575:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:575:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC40(%rip), %rcx	 ;, tmp368
 ; D:\TC\src\parser.c:575:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp492
 ; D:\TC\src\parser.c:575:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L230	 ;
.L228:
 ; D:\TC\src\parser.c:572:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp367
	movq	(%rsi), %rcx	 ; token_262->lexeme,
 ; D:\TC\src\parser.c:571:     Expression* increment = NULL;
	xorl	%r12d, %r12d	 ; increment
 ; D:\TC\src\parser.c:572:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:572:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp491
	jne	.L232	 ;,
	jmp	.L231	 ;
.L230:
 ; D:\TC\src\parser.c:576:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp493, token
.L232:
 ; D:\TC\src\parser.c:578:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_271->type
	je	.L233	 ;,
.L234:
 ; D:\TC\src\parser.c:579:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:579:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC41(%rip), %rcx	 ;, tmp369
 ; D:\TC\src\parser.c:579:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp494
	jmp	.L348	 ;
.L233:
 ; D:\TC\src\parser.c:578:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp370
	movq	(%rsi), %rcx	 ; token_271->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:578:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp495
	je	.L234	 ;,
 ; D:\TC\src\parser.c:583:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:584:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_278->type
 ; D:\TC\src\parser.c:583:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp496, token
 ; D:\TC\src\parser.c:584:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L235	 ;,
.L236:
 ; D:\TC\src\parser.c:585:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:585:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC42(%rip), %rcx	 ;, tmp371
 ; D:\TC\src\parser.c:585:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp497
	jmp	.L348	 ;
.L235:
 ; D:\TC\src\parser.c:584:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp372
	movq	(%rsi), %rcx	 ; token_278->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:584:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp498
	je	.L236	 ;,
 ; D:\TC\src\parser.c:589:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:590:     parser->in_loop = true;
	movb	$1, 10(%rbx)	 ;, parser_62(D)->in_loop
 ; D:\TC\src\parser.c:591:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:589:     list(Statement*) body = create_list();
	movq	%rax, %r13	 ; tmp499, body
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	leaq	.LC43(%rip), %r14	 ;, tmp410
 ; D:\TC\src\parser.c:591:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp500, token
.L237:
 ; D:\TC\src\parser.c:592:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_290->type
	je	.L358	 ;,
.L239:
 ; D:\TC\src\parser.c:593:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %r15	 ; tmp501, statement
 ; D:\TC\src\parser.c:594:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L238	 ;,
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r14, %rcx	 ; tmp410,
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp502
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L238:
 ; D:\TC\src\parser.c:596:         list_append(body, (pointer)statement);
	movq	%r15, %rdx	 ; statement,
	movq	%r13, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:597:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp503, token
	jmp	.L237	 ;
.L358:
 ; D:\TC\src\parser.c:592:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp559
	movq	(%rsi), %rcx	 ; token_290->lexeme,
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:592:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp504
	je	.L239	 ;,
 ; D:\TC\src\parser.c:599:     parser->in_loop = false;
	movb	$0, 10(%rbx)	 ;, parser_62(D)->in_loop
 ; D:\TC\src\parser.c:601:     return create_for(initializer, condition, increment, body);
	movq	%r13, %r9	 ; body,
	movq	%r12, %r8	 ; increment,
	movq	%rbp, %rdx	 ; condition,
	movq	%rdi, %rcx	 ; initializer,
	call	create_for	 ;
	movq	%rax, %r9	 ; tmp505, _300
.L219:
 ; D:\TC\src\parser.c:401:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	xorl	%esi, %esi	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$4, %ecx	 ;,
	movq	%rsi, 40(%rsp)	 ;,
	movq	%rsi, 32(%rsp)	 ;,
.L352:
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp506, <retval>
 ; D:\TC\src\parser.c:401:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L172	 ;
.L209:
 ; D:\TC\src\parser.c:402:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	movq	.refptr.WHILE_KEYWORD(%rip), %rax	 ;, tmp375
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; WHILE_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:402:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	testb	%al, %al	 ; tmp507
	je	.L240	 ;,
 ; D:\TC\src\parser.c:606:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:607:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_301->type
 ; D:\TC\src\parser.c:606:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp508, token
 ; D:\TC\src\parser.c:607:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L241	 ;,
.L243:
 ; D:\TC\src\parser.c:608:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:608:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC44(%rip), %rcx	 ;, tmp376
 ; D:\TC\src\parser.c:608:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp509
	jmp	.L349	 ;
.L241:
 ; D:\TC\src\parser.c:607:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp377
	movq	(%rsi), %rcx	 ; token_301->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:607:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp510
	je	.L243	 ;,
 ; D:\TC\src\parser.c:612:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:613:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
 ; D:\TC\src\parser.c:612:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp511, token
 ; D:\TC\src\parser.c:613:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rdi	 ; tmp512, condition
 ; D:\TC\src\parser.c:614:     if (condition == NULL)
	testq	%rax, %rax	 ; condition
	jne	.L244	 ;,
 ; D:\TC\src\parser.c:615:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:615:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC45(%rip), %rcx	 ;, tmp378
 ; D:\TC\src\parser.c:615:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp513
 ; D:\TC\src\parser.c:615:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L244:
 ; D:\TC\src\parser.c:616:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:617:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_312->type
 ; D:\TC\src\parser.c:616:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp514, token
 ; D:\TC\src\parser.c:617:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L245	 ;,
.L247:
 ; D:\TC\src\parser.c:618:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:618:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC46(%rip), %rcx	 ;, tmp379
 ; D:\TC\src\parser.c:618:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp515
.L349:
 ; D:\TC\src\parser.c:618:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:610:         return NULL;
	xorl	%r8d, %r8d	 ; _338
	jmp	.L246	 ;
.L245:
 ; D:\TC\src\parser.c:617:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp380
	movq	(%rsi), %rcx	 ; token_312->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:617:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp516
	je	.L247	 ;,
 ; D:\TC\src\parser.c:622:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:623:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_319->type
 ; D:\TC\src\parser.c:622:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp517, token
 ; D:\TC\src\parser.c:623:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L248	 ;,
.L249:
 ; D:\TC\src\parser.c:624:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:624:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC47(%rip), %rcx	 ;, tmp381
 ; D:\TC\src\parser.c:624:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp518
	jmp	.L349	 ;
.L248:
 ; D:\TC\src\parser.c:623:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp382
	movq	(%rsi), %rcx	 ; token_319->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:623:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp519
	je	.L249	 ;,
 ; D:\TC\src\parser.c:628:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:629:     parser->in_loop = true;
	movb	$1, 10(%rbx)	 ;, parser_62(D)->in_loop
 ; D:\TC\src\parser.c:630:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:628:     list(Statement*) body = create_list();
	movq	%rax, %rbp	 ; tmp520, body
 ; D:\TC\src\parser.c:634:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	leaq	.LC48(%rip), %r13	 ;, tmp412
 ; D:\TC\src\parser.c:630:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:631:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12	 ;, tmp411
 ; D:\TC\src\parser.c:630:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp521, token
.L250:
 ; D:\TC\src\parser.c:631:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_331->type
	je	.L359	 ;,
.L252:
 ; D:\TC\src\parser.c:632:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %r14	 ; tmp522, statement
 ; D:\TC\src\parser.c:633:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L251	 ;,
 ; D:\TC\src\parser.c:634:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:634:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r13, %rcx	 ; tmp412,
 ; D:\TC\src\parser.c:634:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp523
 ; D:\TC\src\parser.c:634:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L251:
 ; D:\TC\src\parser.c:635:         list_append(body, (pointer)statement);
	movq	%r14, %rdx	 ; statement,
	movq	%rbp, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:636:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp524, token
	jmp	.L250	 ;
.L359:
 ; D:\TC\src\parser.c:631:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_BRACE_SYMBOL,
	movq	(%rsi), %rcx	 ; token_331->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:631:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp525
	je	.L252	 ;,
 ; D:\TC\src\parser.c:638:     parser->in_loop = false;
	movb	$0, 10(%rbx)	 ;, parser_62(D)->in_loop
 ; D:\TC\src\parser.c:640:     return create_while(condition, body);
	movq	%rbp, %rdx	 ; body,
	movq	%rdi, %rcx	 ; condition,
	call	create_while	 ;
	movq	%rax, %r8	 ; tmp526, _338
.L246:
 ; D:\TC\src\parser.c:403:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	xorl	%ebx, %ebx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$3, %ecx	 ;,
	movq	%rbx, 40(%rsp)	 ;,
	movq	%rbx, 32(%rsp)	 ;,
	jmp	.L352	 ;
.L240:
 ; D:\TC\src\parser.c:404:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp385
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; VAR_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:404:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; tmp528
	je	.L253	 ;,
 ; D:\TC\src\parser.c:405:             get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:406:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:406:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	xorl	%r11d, %r11d	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rax, 40(%rsp)	 ; tmp529,
	xorl	%edx, %edx	 ;
	movl	$1, %ecx	 ;,
	movq	%r11, 32(%rsp)	 ;,
	jmp	.L351	 ;
.L253:
 ; D:\TC\src\parser.c:407:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	movq	.refptr.RETURN_KEYWORD(%rip), %rax	 ;, tmp386
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; RETURN_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:407:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	 ; tmp531
	je	.L255	 ;,
 ; D:\TC\src\parser.c:408:             token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:409:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_85->type
	jne	.L256	 ;,
 ; D:\TC\src\parser.c:409:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rdx	 ;, tmp387
	movq	(%rax), %rcx	 ; token_85->lexeme,
	movq	(%rdx), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:409:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp533
	je	.L256	 ;,
 ; D:\TC\src\parser.c:411:                 return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r10d, %r10d	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%r10, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	movq	%r10, 32(%rsp)	 ;,
	jmp	.L352	 ;
.L256:
 ; D:\TC\src\parser.c:413:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:413:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%r9, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	xorl	%r9d, %r9d	 ;
	movq	%rax, 32(%rsp)	 ; tmp535,
	jmp	.L351	 ;
.L255:
 ; D:\TC\src\parser.c:414:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	movq	.refptr.BREAK_KEYWORD(%rip), %rax	 ;, tmp388
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; BREAK_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:414:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	 ; tmp537
	je	.L257	 ;,
 ; D:\TC\src\parser.c:415:             if (!parser->in_loop) {
	cmpb	$0, 10(%rbx)	 ;, parser_62(D)->in_loop
	jne	.L258	 ;,
 ; D:\TC\src\parser.c:416:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:416:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC49(%rip), %rcx	 ;, tmp389
 ; D:\TC\src\parser.c:416:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp538
	jmp	.L350	 ;
.L258:
 ; D:\TC\src\parser.c:420:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r8d, %r8d	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$6, %ecx	 ;,
	movq	%r8, 40(%rsp)	 ;,
	movq	%r8, 32(%rsp)	 ;,
	xorl	%r8d, %r8d	 ;
	jmp	.L351	 ;
.L257:
 ; D:\TC\src\parser.c:421:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax	 ;, tmp390
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; CONTINUE_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:421:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	 ; tmp540
	je	.L173	 ;,
 ; D:\TC\src\parser.c:422:             if (!parser->in_loop) {
	cmpb	$0, 10(%rbx)	 ;, parser_62(D)->in_loop
	jne	.L261	 ;,
 ; D:\TC\src\parser.c:423:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:423:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC50(%rip), %rcx	 ;, tmp391
 ; D:\TC\src\parser.c:423:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp541
.L350:
 ; D:\TC\src\parser.c:423:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:418:                 return NULL;
	xorl	%esi, %esi	 ; <retval>
	jmp	.L172	 ;
.L261:
 ; D:\TC\src\parser.c:427:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%ecx, %ecx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rcx, 40(%rsp)	 ;,
	movq	%rcx, 32(%rsp)	 ;,
	movl	$7, %ecx	 ;,
	jmp	.L351	 ;
.L173:
 ; D:\TC\src\parser.c:431:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:431:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rax, 32(%rsp)	 ; tmp545,
	xorl	%ecx, %ecx	 ;
	movq	%rdx, 40(%rsp)	 ;,
	xorl	%edx, %edx	 ;
.L351:
	call	create_statement	 ;
 ; D:\TC\src\parser.c:432:     token = peek_current_token(lexer);
	movq	160(%rsp), %rcx	 ; lexer,
 ; D:\TC\src\parser.c:431:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rax, %rsi	 ; tmp546, <retval>
 ; D:\TC\src\parser.c:432:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rdi	 ; tmp547, token
 ; D:\TC\src\parser.c:433:     if (statement == NULL)
	testq	%rsi, %rsi	 ; <retval>
	jne	.L262	 ;,
 ; D:\TC\src\parser.c:434:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:434:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC51(%rip), %rcx	 ;, tmp392
 ; D:\TC\src\parser.c:434:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp548
 ; D:\TC\src\parser.c:434:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L262:
 ; D:\TC\src\parser.c:435:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:436:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_110->type
 ; D:\TC\src\parser.c:435:     token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp549, token
 ; D:\TC\src\parser.c:436:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	je	.L263	 ;,
.L265:
 ; D:\TC\src\parser.c:437:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:437:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC52(%rip), %rcx	 ;, tmp393
 ; D:\TC\src\parser.c:437:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp550
 ; D:\TC\src\parser.c:437:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L172	 ;
.L263:
 ; D:\TC\src\parser.c:436:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp394
	movq	(%rdi), %rcx	 ; token_110->lexeme,
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:436:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp551
	je	.L265	 ;,
.L172:
 ; D:\TC\src\parser.c:440: }
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
	movq	%rdx, %rdi	 ; tmp586, now_scope
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%r8, %rbx	 ; tmp587, parser
	subq	$152, %rsp	 ;,
 ; D:\TC\src\parser.c:24:     if (builtin_scope == NULL) {
	movq	.refptr.builtin_scope(%rip), %rsi	 ;, tmp443
 ; D:\TC\src\parser.c:22: Code* parse_code(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
	movq	%rcx, 48(%rsp)	 ; tmp585, %sfp
 ; D:\TC\src\parser.c:24:     if (builtin_scope == NULL) {
	cmpq	$0, (%rsi)	 ;, builtin_scope
	jne	.L361	 ;,
 ; D:\TC\src\parser.c:25:         builtin_scope = create_symbol_table(NULL);
	xorl	%ecx, %ecx	 ;
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:26:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	xorl	%r8d, %r8d	 ;
	movl	$6, %edx	 ;,
 ; D:\TC\src\parser.c:25:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, %r9	 ; tmp588, _2
 ; D:\TC\src\parser.c:25:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, (%rsi)	 ; _2, builtin_scope
 ; D:\TC\src\parser.c:26:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp445
	movq	(%rax), %rcx	 ; VOID_KEYWORD,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:26:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp446
 ; D:\TC\src\parser.c:27:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:26:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp589, name_void
 ; D:\TC\src\parser.c:27:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp448
	movl	$6, %edx	 ;,
	movq	(%rax), %rcx	 ; INT_KEYWORD,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:27:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp449
 ; D:\TC\src\parser.c:28:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:27:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp590, name_int
 ; D:\TC\src\parser.c:28:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp451
	movl	$6, %edx	 ;,
	movq	(%rax), %rcx	 ; FLOAT_KEYWORD,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:28:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp452
 ; D:\TC\src\parser.c:29:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:28:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp591, name_float
 ; D:\TC\src\parser.c:29:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp454
	movl	$6, %edx	 ;,
	movq	(%rax), %rcx	 ; STRING_KEYWORD,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:29:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp455
 ; D:\TC\src\parser.c:30:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:29:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp592, name_string
 ; D:\TC\src\parser.c:30:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp457
	movl	$6, %edx	 ;,
	movq	(%rax), %rcx	 ; BOOL_KEYWORD,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:30:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp458
	movq	%rax, (%rdx)	 ; tmp593, name_bool
.L361:
 ; D:\TC\src\parser.c:32:     if (now_scope == NULL)
	testq	%rdi, %rdi	 ; now_scope
	jne	.L362	 ;,
 ; D:\TC\src\parser.c:33:         now_scope = builtin_scope;
	movq	(%rsi), %rdi	 ; builtin_scope, now_scope
.L362:
 ; D:\TC\src\parser.c:35:     list(CodeMember*) members = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:36:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	%rdi, %rcx	 ; now_scope,
 ; D:\TC\src\parser.c:35:     list(CodeMember*) members = create_list();
	movq	%rax, 96(%rsp)	 ; tmp594, %sfp
 ; D:\TC\src\parser.c:36:     SymbolTable* global_scope = create_symbol_table(now_scope);
	call	create_symbol_table	 ;
	movq	%rax, 72(%rsp)	 ; tmp595, %sfp
.L376:
 ; D:\TC\src\parser.c:56:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp772, token
 ; D:\TC\src\parser.c:38:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L471	 ;,
 ; D:\TC\src\parser.c:38:     while (token != NULL && token->type != EOF_TOKEN) {
	movl	24(%rax), %eax	 ; token_41->type, _39
 ; D:\TC\src\parser.c:38:     while (token != NULL && token->type != EOF_TOKEN) {
	testl	%eax, %eax	 ; _39
	je	.L471	 ;,
 ; D:\TC\src\parser.c:39:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	 ;, _39
	jne	.L405	 ;,
 ; D:\TC\src\parser.c:39:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax	 ;, tmp775
	movq	(%r15), %rcx	 ; token_41->lexeme,
	movq	(%rax), %rdx	 ; IMPORT_KEYWORD,
	call	string_equal	 ;
	movl	%eax, %edi	 ; tmp597, have_return
 ; D:\TC\src\parser.c:39:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	testb	%al, %al	 ; have_return
	je	.L365	 ;,
 ; D:\TC\src\parser.c:64:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:65:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_101->type
 ; D:\TC\src\parser.c:64:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp598, token
 ; D:\TC\src\parser.c:65:     if (token->type != IDENTIFIER) {
	je	.L366	 ;,
 ; D:\TC\src\parser.c:66:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:66:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC53(%rip), %rcx	 ;, tmp461
 ; D:\TC\src\parser.c:66:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp599
	jmp	.L549	 ;
.L366:
 ; D:\TC\src\parser.c:72:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:70:     string import_name = token->lexeme;
	movq	(%rax), %rdi	 ; token_101->lexeme, import_name
 ; D:\TC\src\parser.c:72:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:73:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_106->type
 ; D:\TC\src\parser.c:72:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp600, token
 ; D:\TC\src\parser.c:73:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	jne	.L368	 ;,
 ; D:\TC\src\parser.c:73:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	.refptr.FROM_KEYWORD(%rip), %rax	 ;, tmp462
	movq	0(%rbp), %rcx	 ; token_106->lexeme,
	movq	(%rax), %rdx	 ; FROM_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:73:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	testb	%al, %al	 ; tmp601
	jne	.L369	 ;,
.L368:
 ; D:\TC\src\parser.c:71:     string source = NULL;
	xorl	%esi, %esi	 ; source
	jmp	.L370	 ;
.L369:
 ; D:\TC\src\parser.c:74:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:75:         if (token->type != STRING) {
	cmpl	$4, 24(%rax)	 ;, token_111->type
 ; D:\TC\src\parser.c:74:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp602, token
 ; D:\TC\src\parser.c:75:         if (token->type != STRING) {
	je	.L371	 ;,
 ; D:\TC\src\parser.c:76:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:76:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC54(%rip), %rcx	 ;, tmp463
 ; D:\TC\src\parser.c:76:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp603
.L549:
 ; D:\TC\src\parser.c:76:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L367	 ;
.L371:
 ; D:\TC\src\parser.c:81:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:80:         source = token->lexeme;
	movq	(%rax), %rsi	 ; token_111->lexeme, source
 ; D:\TC\src\parser.c:81:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp604, token
.L370:
 ; D:\TC\src\parser.c:83:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_117->type
	je	.L372	 ;,
.L373:
 ; D:\TC\src\parser.c:84:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:84:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC55(%rip), %rcx	 ;, tmp464
 ; D:\TC\src\parser.c:84:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp605
	jmp	.L549	 ;
.L372:
 ; D:\TC\src\parser.c:83:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp465
	movq	0(%rbp), %rcx	 ; token_117->lexeme,
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:83:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp606
	je	.L373	 ;,
 ; D:\TC\src\parser.c:89:     name = parse_import_file(import_name, source, now_scope, parser->source_file);
	movq	(%rbx), %r9	 ; parser_74(D)->source_file,
	movq	72(%rsp), %r8	 ; %sfp,
	movq	%rsi, %rdx	 ; source,
	movq	%rdi, %rcx	 ; import_name,
	call	parse_import_file	 ;
 ; D:\TC\src\parser.c:90:     if (name == NULL) {
	testq	%rax, %rax	 ; name
	jne	.L374	 ;,
 ; D:\TC\src\parser.c:91:         fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
	call	__getreent	 ;
 ; D:\TC\src\parser.c:91:         fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
	movq	%rsi, %r9	 ; source,
	movq	%rdi, %r8	 ; import_name,
	leaq	.LC56(%rip), %rdx	 ;, tmp467
	movq	24(%rax), %rcx	 ; _127->_stderr, _127->_stderr
	call	fprintf	 ;
 ; D:\TC\src\parser.c:92:         name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
	movq	.refptr.name_void(%rip), %rax	 ;, tmp468
	movq	72(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rcx	 ; import_name,
	movl	$3, %edx	 ;,
	movq	(%rax), %r8	 ; name_void,
	call	create_symbol	 ;
.L374:
 ; D:\TC\src\parser.c:95:     return create_import(name, source);
	movq	%rsi, %rdx	 ; source,
	movq	%rax, %rcx	 ; name,
	call	create_import	 ;
	movq	%rax, %rdx	 ; tmp610, _132
 ; D:\TC\src\parser.c:41:             if (import == NULL)
	testq	%rax, %rax	 ; _132
	jne	.L375	 ;,
.L367:
 ; D:\TC\src\parser.c:42:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:42:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC57(%rip), %rcx	 ;, tmp469
 ; D:\TC\src\parser.c:42:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp611
 ; D:\TC\src\parser.c:42:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _132
.L375:
 ; D:\TC\src\parser.c:43:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%ecx, %ecx	 ;
	jmp	.L558	 ;
.L365:
 ; D:\TC\src\parser.c:44:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	cmpl	$6, 24(%r15)	 ;, token_41->type
	jne	.L405	 ;,
 ; D:\TC\src\parser.c:44:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	.refptr.FUNC_KEYWORD(%rip), %rax	 ;, tmp776
	movq	(%r15), %rcx	 ; token_41->lexeme,
	movq	(%rax), %rdx	 ; FUNC_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:44:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	testb	%al, %al	 ; tmp613
	je	.L377	 ;,
 ; D:\TC\src\parser.c:100:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:101:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:100:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	%rax, %r12	 ; tmp614, function_scope
 ; D:\TC\src\parser.c:101:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp615, token
 ; D:\TC\src\parser.c:102:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_135->type, _136
 ; D:\TC\src\parser.c:102:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _136
	je	.L378	 ;,
 ; D:\TC\src\parser.c:102:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _136
	je	.L379	 ;,
.L381:
 ; D:\TC\src\parser.c:103:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:103:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC58(%rip), %rcx	 ;, tmp471
 ; D:\TC\src\parser.c:103:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp616
	jmp	.L552	 ;
.L379:
 ; D:\TC\src\parser.c:102:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rsi), %rcx	 ; token_135->lexeme,
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:102:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp617
	je	.L381	 ;,
.L378:
 ; D:\TC\src\parser.c:107:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%rsi), %rdx	 ; token_135->lexeme,
	movq	72(%rsp), %rcx	 ; %sfp,
	call	search_name	 ;
	movq	%rax, %rbp	 ; tmp618, return_type
 ; D:\TC\src\parser.c:108:     if (return_type == NULL) {
	testq	%rax, %rax	 ; return_type
	jne	.L382	 ;,
 ; D:\TC\src\parser.c:109:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:109:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC59(%rip), %rcx	 ;, tmp472
 ; D:\TC\src\parser.c:109:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp619
	jmp	.L552	 ;
.L382:
 ; D:\TC\src\parser.c:113:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:114:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_145->type
 ; D:\TC\src\parser.c:113:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp620, token
 ; D:\TC\src\parser.c:114:     if (token->type != IDENTIFIER) {
	je	.L383	 ;,
 ; D:\TC\src\parser.c:115:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:115:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC60(%rip), %rcx	 ;, tmp473
 ; D:\TC\src\parser.c:115:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp621
.L552:
 ; D:\TC\src\parser.c:115:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L380	 ;
.L383:
 ; D:\TC\src\parser.c:119:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\parser.c:121:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	(%rsi), %rcx	 ; token_145->lexeme,
	movq	%rbp, %r8	 ; return_type,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:120:     function->function_scope = function_scope;
	movq	%r12, 32(%rax)	 ; function_scope, function_149->function_scope
 ; D:\TC\src\parser.c:121:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	%rax, %r9	 ; function,
 ; D:\TC\src\parser.c:119:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movq	%rax, 56(%rsp)	 ; tmp622, %sfp
 ; D:\TC\src\parser.c:121:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:122:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:121:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	%rax, 80(%rsp)	 ; tmp623, %sfp
 ; D:\TC\src\parser.c:122:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:123:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_152->type
 ; D:\TC\src\parser.c:122:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp624, token
 ; D:\TC\src\parser.c:123:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L384	 ;,
.L385:
 ; D:\TC\src\parser.c:124:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:124:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC61(%rip), %rcx	 ;, tmp474
 ; D:\TC\src\parser.c:124:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp625
	jmp	.L552	 ;
.L384:
 ; D:\TC\src\parser.c:123:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp475
	movq	(%rsi), %rcx	 ; token_152->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:123:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp626
	je	.L385	 ;,
 ; D:\TC\src\parser.c:128:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:135:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	leaq	.LC63(%rip), %r13	 ;, tmp569
 ; D:\TC\src\parser.c:133:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	leaq	.LC62(%rip), %r14	 ;, tmp570
 ; D:\TC\src\parser.c:128:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp627, token
 ; D:\TC\src\parser.c:129:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rax, 64(%rsp)	 ; tmp628, %sfp
.L386:
 ; D:\TC\src\parser.c:130:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_164->type
	je	.L559	 ;,
.L394:
 ; D:\TC\src\parser.c:131:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	48(%rsp), %rcx	 ; %sfp,
	movq	%r12, %rdx	 ; function_scope,
	movq	%rbx, %r8	 ; parser,
	call	parse_variable	 ;
	movq	%rax, %rdx	 ; tmp629, parameter
 ; D:\TC\src\parser.c:132:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L387	 ;,
 ; D:\TC\src\parser.c:133:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:133:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r14, %rcx	 ; tmp570,
 ; D:\TC\src\parser.c:133:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp630
	jmp	.L550	 ;
.L387:
 ; D:\TC\src\parser.c:134:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_161->value
	je	.L389	 ;,
 ; D:\TC\src\parser.c:135:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:135:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r13, %rcx	 ; tmp569,
 ; D:\TC\src\parser.c:135:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp631
.L550:
 ; D:\TC\src\parser.c:135:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L388	 ;
.L389:
 ; D:\TC\src\parser.c:137:             list_append(parameters, (pointer)parameter);
	movq	64(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
.L388:
 ; D:\TC\src\parser.c:138:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:139:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_168->type
 ; D:\TC\src\parser.c:138:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp632, token
 ; D:\TC\src\parser.c:139:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	je	.L390	 ;,
.L393:
 ; D:\TC\src\parser.c:142:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:142:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC64(%rip), %rcx	 ;, tmp478
 ; D:\TC\src\parser.c:142:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp633
	jmp	.L552	 ;
.L390:
 ; D:\TC\src\parser.c:139:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp479
	movq	(%rsi), %rcx	 ; token_168->lexeme,
	movq	(%rax), %rdx	 ; COMMA_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:139:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp634
	je	.L391	 ;,
 ; D:\TC\src\parser.c:140:             token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp635, token
 ; D:\TC\src\parser.c:140:             token = get_next_token(lexer, true);
	jmp	.L386	 ;
.L391:
 ; D:\TC\src\parser.c:141:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_168->type
	jne	.L393	 ;,
 ; D:\TC\src\parser.c:141:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp480
	movq	(%rsi), %rcx	 ; token_168->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:141:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp636
	jne	.L386	 ;,
	jmp	.L393	 ;
.L559:
 ; D:\TC\src\parser.c:130:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp778
	movq	(%rsi), %rcx	 ; token_164->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:130:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp637
	je	.L394	 ;,
 ; D:\TC\src\parser.c:147:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:148:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_185->type
 ; D:\TC\src\parser.c:147:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp638, token
 ; D:\TC\src\parser.c:148:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L395	 ;,
.L396:
 ; D:\TC\src\parser.c:149:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:149:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC65(%rip), %rcx	 ;, tmp482
 ; D:\TC\src\parser.c:149:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp639
	jmp	.L552	 ;
.L395:
 ; D:\TC\src\parser.c:148:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp483
	movq	(%rsi), %rcx	 ; token_185->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:148:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp640
	je	.L396	 ;,
 ; D:\TC\src\parser.c:153:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:154:     parser->in_function = true;
	movb	$1, 8(%rbx)	 ;, parser_74(D)->in_function
 ; D:\TC\src\parser.c:153:     list(Statement*) body = create_list();
	movq	%rax, %r14	 ; tmp641, body
.L551:
 ; D:\TC\src\parser.c:166:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:157:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_197->type
 ; D:\TC\src\parser.c:166:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp646, token
 ; D:\TC\src\parser.c:157:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	je	.L560	 ;,
.L402:
 ; D:\TC\src\parser.c:158:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	48(%rsp), %rcx	 ; %sfp,
	movq	%rbx, %r8	 ; parser,
	movq	%r12, %rdx	 ; function_scope,
	call	parse_statement	 ;
	movq	%rax, %r13	 ; tmp643, statement
 ; D:\TC\src\parser.c:159:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L398	 ;,
 ; D:\TC\src\parser.c:160:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:160:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC66(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:160:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp644
 ; D:\TC\src\parser.c:160:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L401	 ;
.L398:
 ; D:\TC\src\parser.c:161:         else if (have_return)
	testb	%dil, %dil	 ; have_return
	je	.L400	 ;,
 ; D:\TC\src\parser.c:162:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:162:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:162:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp645
 ; D:\TC\src\parser.c:162:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L400:
 ; D:\TC\src\parser.c:164:             have_return = true;
	cmpl	$5, 8(%r13)	 ;, statement_194->type
	movb	$1, %al	 ;, tmp560
	cmove	%eax, %edi	 ; have_return,, tmp560, have_return
.L401:
 ; D:\TC\src\parser.c:165:         list_append(body, (pointer)statement);
	movq	%r13, %rdx	 ; statement,
	movq	%r14, %rcx	 ; body,
	call	list_append	 ;
	jmp	.L551	 ;
.L560:
 ; D:\TC\src\parser.c:157:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp779
	movq	(%rsi), %rcx	 ; token_197->lexeme,
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:157:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp647
	je	.L402	 ;,
 ; D:\TC\src\parser.c:168:     parser->in_function = false;
	movb	$0, 8(%rbx)	 ;, parser_74(D)->in_function
 ; D:\TC\src\parser.c:169:     if (!have_return && return_type != name_void)
	testb	%dil, %dil	 ; have_return
	jne	.L403	 ;,
 ; D:\TC\src\parser.c:169:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp487
 ; D:\TC\src\parser.c:169:     if (!have_return && return_type != name_void)
	cmpq	(%rax), %rbp	 ; name_void, return_type
	je	.L403	 ;,
 ; D:\TC\src\parser.c:170:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:170:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC68(%rip), %rcx	 ;, tmp488
 ; D:\TC\src\parser.c:170:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp648
 ; D:\TC\src\parser.c:170:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L403:
 ; D:\TC\src\parser.c:172:     return create_function_use_ptr(function, name, return_type, parameters, body, function_scope);
	movq	%r12, 40(%rsp)	 ; function_scope,
	movq	64(%rsp), %r9	 ; %sfp,
	movq	%rbp, %r8	 ; return_type,
	movq	80(%rsp), %rdx	 ; %sfp,
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%r14, 32(%rsp)	 ; body,
	call	create_function_use_ptr	 ;
	movq	%rax, %r8	 ; tmp649, _212
 ; D:\TC\src\parser.c:46:             if (function == NULL)
	testq	%rax, %rax	 ; _212
	jne	.L404	 ;,
.L380:
 ; D:\TC\src\parser.c:47:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:47:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC69(%rip), %rcx	 ;, tmp489
 ; D:\TC\src\parser.c:47:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp650
 ; D:\TC\src\parser.c:47:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%r8d, %r8d	 ; _212
.L404:
 ; D:\TC\src\parser.c:48:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$1, %ecx	 ;,
	jmp	.L558	 ;
.L377:
 ; D:\TC\src\parser.c:49:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	cmpl	$6, 24(%r15)	 ;, token_41->type
	jne	.L405	 ;,
 ; D:\TC\src\parser.c:49:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	.refptr.CLASS_KEYWORD(%rip), %rax	 ;, tmp490
	movq	(%r15), %rcx	 ; token_41->lexeme,
	movq	(%rax), %rdx	 ; CLASS_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:49:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	testb	%al, %al	 ; tmp652
	je	.L405	 ;,
 ; D:\TC\src\parser.c:261:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:262:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:261:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	%rax, 64(%rsp)	 ; tmp653, %sfp
 ; D:\TC\src\parser.c:262:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:263:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_217->type
 ; D:\TC\src\parser.c:262:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp654, token
 ; D:\TC\src\parser.c:263:     if (token->type != IDENTIFIER) {
	je	.L406	 ;,
 ; D:\TC\src\parser.c:264:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:264:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC70(%rip), %rcx	 ;, tmp491
 ; D:\TC\src\parser.c:264:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp655
	jmp	.L557	 ;
.L406:
 ; D:\TC\src\parser.c:268:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\parser.c:269:     class->class_scope = class_scope;
	movq	64(%rsp), %rdi	 ; %sfp, class_scope
 ; D:\TC\src\parser.c:270:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	movq	(%rsi), %rcx	 ; token_217->lexeme,
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, %r9	 ; class,
 ; D:\TC\src\parser.c:268:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movq	%rax, 112(%rsp)	 ; tmp656, %sfp
 ; D:\TC\src\parser.c:269:     class->class_scope = class_scope;
	movq	%rdi, 16(%rax)	 ; class_scope, class_221->class_scope
 ; D:\TC\src\parser.c:270:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:271:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:270:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	movq	%rax, 56(%rsp)	 ; tmp657, %sfp
 ; D:\TC\src\parser.c:271:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:272:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_224->type
 ; D:\TC\src\parser.c:271:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp658, token
 ; D:\TC\src\parser.c:272:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L408	 ;,
.L409:
 ; D:\TC\src\parser.c:273:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:273:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC71(%rip), %rcx	 ;, tmp492
 ; D:\TC\src\parser.c:273:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp659
.L557:
 ; D:\TC\src\parser.c:273:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L407	 ;
.L408:
 ; D:\TC\src\parser.c:272:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp493
	movq	(%rsi), %rcx	 ; token_224->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:272:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp660
	je	.L409	 ;,
 ; D:\TC\src\parser.c:277:     list(ClassMember*) members = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:278:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:277:     list(ClassMember*) members = create_list();
	movq	%rax, 80(%rsp)	 ; tmp661, %sfp
 ; D:\TC\src\parser.c:278:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %r14	 ; tmp662, token
 ; D:\TC\src\parser.c:279:     size_t size = 0;
	xorl	%eax, %eax	 ;
	movq	%rax, 104(%rsp)	 ;, %sfp
.L410:
 ; D:\TC\src\parser.c:280:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r14)	 ;, token_233->type
	je	.L561	 ;,
.L458:
 ; D:\TC\src\parser.c:281:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, 24(%r14)	 ;, token_233->type
	jne	.L411	 ;,
 ; D:\TC\src\parser.c:281:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	.refptr.METHOD_KEYWORD(%rip), %rax	 ;, tmp782
	movq	(%r14), %rcx	 ; token_233->lexeme,
	movq	(%rax), %rdx	 ; METHOD_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:281:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	testb	%al, %al	 ; tmp663
	je	.L412	 ;,
 ; D:\TC\src\parser.c:177:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:178:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	56(%rsp), %r8	 ; %sfp,
	movl	$3, %edx	 ;,
	movq	%rax, %r9	 ; tmp664,
 ; D:\TC\src\parser.c:177:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	%rax, 88(%rsp)	 ; tmp664, %sfp
 ; D:\TC\src\parser.c:178:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp495
	movq	(%rax), %rcx	 ; SELF_KEYWORD,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:179:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:178:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	%rax, %rbp	 ; tmp665, self
 ; D:\TC\src\parser.c:179:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp666, token
 ; D:\TC\src\parser.c:180:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_369->type, _370
 ; D:\TC\src\parser.c:180:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _370
	je	.L413	 ;,
 ; D:\TC\src\parser.c:180:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _370
	je	.L414	 ;,
.L416:
 ; D:\TC\src\parser.c:181:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:181:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC72(%rip), %rcx	 ;, tmp496
 ; D:\TC\src\parser.c:181:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp667
	jmp	.L554	 ;
.L414:
 ; D:\TC\src\parser.c:180:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rsi), %rcx	 ; token_369->lexeme,
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:180:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp668
	je	.L416	 ;,
.L413:
 ; D:\TC\src\parser.c:185:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%rsi), %rdx	 ; token_369->lexeme,
	movq	64(%rsp), %rcx	 ; %sfp,
	call	search_name	 ;
	movq	%rax, %rdi	 ; tmp669, return_type
 ; D:\TC\src\parser.c:186:     if (return_type == NULL) {
	testq	%rax, %rax	 ; return_type
	jne	.L417	 ;,
 ; D:\TC\src\parser.c:187:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:187:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC73(%rip), %rcx	 ;, tmp497
 ; D:\TC\src\parser.c:187:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp670
	jmp	.L554	 ;
.L417:
 ; D:\TC\src\parser.c:191:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:192:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_379->type
 ; D:\TC\src\parser.c:191:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp671, token
 ; D:\TC\src\parser.c:192:     if (token->type != IDENTIFIER) {
	je	.L418	 ;,
 ; D:\TC\src\parser.c:193:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:193:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC74(%rip), %rcx	 ;, tmp498
 ; D:\TC\src\parser.c:193:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp672
.L554:
 ; D:\TC\src\parser.c:193:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L415	 ;
.L418:
 ; D:\TC\src\parser.c:197:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\parser.c:198:     method->method_scope = method_scope;
	movq	88(%rsp), %rdx	 ; %sfp, method_scope
 ; D:\TC\src\parser.c:197:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movq	%rax, 120(%rsp)	 ; tmp673, %sfp
 ; D:\TC\src\parser.c:198:     method->method_scope = method_scope;
	movq	%rdx, 32(%rax)	 ; method_scope, method_383->method_scope
 ; D:\TC\src\parser.c:199:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	56(%rsp), %rax	 ; %sfp, name
	movq	(%rsi), %rdx	 ; token_379->lexeme,
	movq	8(%rax), %rcx	 ; name_223->name, name_223->name
	call	make_method_name	 ;
 ; D:\TC\src\parser.c:199:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	120(%rsp), %r9	 ; %sfp,
	movq	%rdi, %r8	 ; return_type,
	movl	$2, %edx	 ;,
 ; D:\TC\src\parser.c:199:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	%rax, %rcx	 ; tmp674, _386
 ; D:\TC\src\parser.c:199:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:200:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:199:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	%rax, 136(%rsp)	 ; tmp675, %sfp
 ; D:\TC\src\parser.c:200:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:201:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_388->type
 ; D:\TC\src\parser.c:200:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp676, token
 ; D:\TC\src\parser.c:201:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L419	 ;,
.L420:
 ; D:\TC\src\parser.c:202:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:202:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC75(%rip), %rcx	 ;, tmp500
 ; D:\TC\src\parser.c:202:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp677
	jmp	.L554	 ;
.L419:
 ; D:\TC\src\parser.c:201:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp501
	movq	(%rsi), %rcx	 ; token_388->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:201:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp678
	je	.L420	 ;,
 ; D:\TC\src\parser.c:206:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:207:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	cmpl	$6, 24(%rax)	 ;, token_395->type
 ; D:\TC\src\parser.c:206:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp679, token
 ; D:\TC\src\parser.c:207:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	je	.L421	 ;,
.L423:
 ; D:\TC\src\parser.c:208:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:208:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC76(%rip), %rcx	 ;, tmp502
 ; D:\TC\src\parser.c:208:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp680
 ; D:\TC\src\parser.c:208:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L422	 ;
.L421:
 ; D:\TC\src\parser.c:207:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp503
	movq	(%rsi), %rcx	 ; token_395->lexeme,
	movq	(%rax), %rdx	 ; SELF_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:207:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	testb	%al, %al	 ; tmp681
	je	.L423	 ;,
.L422:
 ; D:\TC\src\parser.c:209:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:224:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	leaq	.LC79(%rip), %r12	 ;, tmp578
 ; D:\TC\src\parser.c:209:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp682, token
 ; D:\TC\src\parser.c:210:     list(Variable*) parameters = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:211:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%rbp, %rdx	 ; self,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:210:     list(Variable*) parameters = create_list();
	movq	%rax, 128(%rsp)	 ; tmp683, %sfp
 ; D:\TC\src\parser.c:211:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	call	create_variable	 ;
 ; D:\TC\src\parser.c:211:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	128(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:211:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	%rax, %rdx	 ; tmp684, _404
 ; D:\TC\src\parser.c:211:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:212:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rbp	 ;, tmp576
 ; D:\TC\src\parser.c:213:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %r13	 ;, tmp577
.L424:
 ; D:\TC\src\parser.c:212:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_405->type
	je	.L562	 ;,
.L430:
 ; D:\TC\src\parser.c:217:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:217:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC77(%rip), %rcx	 ;, tmp505
 ; D:\TC\src\parser.c:217:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp688
	jmp	.L554	 ;
.L562:
 ; D:\TC\src\parser.c:212:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_PAREN_SYMBOL,
	movq	(%rsi), %rcx	 ; token_405->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:212:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp694
	jne	.L436	 ;,
 ; D:\TC\src\parser.c:213:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_405->type
	jne	.L430	 ;,
 ; D:\TC\src\parser.c:213:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	0(%r13), %rdx	 ; COMMA_SYMBOL,
	movq	(%rsi), %rcx	 ; token_405->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:213:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp685
	je	.L426	 ;,
 ; D:\TC\src\parser.c:214:             token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:220:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	88(%rsp), %rdx	 ; %sfp,
	movq	48(%rsp), %rcx	 ; %sfp,
	movq	%rbx, %r8	 ; parser,
 ; D:\TC\src\parser.c:214:             token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp686, token
 ; D:\TC\src\parser.c:220:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	call	parse_variable	 ;
	movq	%rax, %rdx	 ; tmp687, parameter
 ; D:\TC\src\parser.c:221:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L546	 ;,
 ; D:\TC\src\parser.c:222:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:222:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC78(%rip), %rcx	 ;, tmp507
 ; D:\TC\src\parser.c:222:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp691
	jmp	.L553	 ;
.L426:
 ; D:\TC\src\parser.c:215:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, 24(%rsi)	 ;, token_405->type
	jne	.L430	 ;,
 ; D:\TC\src\parser.c:215:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	0(%rbp), %rdx	 ; R_PAREN_SYMBOL,
	movq	(%rsi), %rcx	 ; token_405->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:215:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	testb	%al, %al	 ; tmp689
	je	.L430	 ;,
.L436:
 ; D:\TC\src\parser.c:229:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:230:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_429->type
 ; D:\TC\src\parser.c:229:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp690, token
 ; D:\TC\src\parser.c:230:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L547	 ;,
	jmp	.L431	 ;
.L546:
 ; D:\TC\src\parser.c:223:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_411->value
	je	.L434	 ;,
 ; D:\TC\src\parser.c:224:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:224:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r12, %rcx	 ; tmp578,
 ; D:\TC\src\parser.c:224:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp692
.L553:
 ; D:\TC\src\parser.c:224:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L433	 ;
.L434:
 ; D:\TC\src\parser.c:226:             list_append(parameters, (pointer)parameter);
	movq	128(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
.L433:
 ; D:\TC\src\parser.c:227:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp693, token
	jmp	.L424	 ;
.L431:
 ; D:\TC\src\parser.c:231:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:231:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC80(%rip), %rcx	 ;, tmp510
 ; D:\TC\src\parser.c:231:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp695
	jmp	.L554	 ;
.L547:
 ; D:\TC\src\parser.c:230:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp511
	movq	(%rsi), %rcx	 ; token_429->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:230:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp696
	je	.L431	 ;,
 ; D:\TC\src\parser.c:235:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:236:     parser->in_function = true;
	movw	$257, 8(%rbx)	 ;, MEM <unsigned short> [(char *)parser_74(D) + 8B]
 ; D:\TC\src\parser.c:239:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:238:     bool have_return = false;
	xorl	%r13d, %r13d	 ; have_return
 ; D:\TC\src\parser.c:239:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:235:     list(Statement*) body = create_list();
	movq	%rax, %r12	 ; tmp697, body
 ; D:\TC\src\parser.c:239:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp698, token
.L437:
 ; D:\TC\src\parser.c:240:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_441->type
	je	.L563	 ;,
.L442:
 ; D:\TC\src\parser.c:241:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	88(%rsp), %rdx	 ; %sfp,
	movq	48(%rsp), %rcx	 ; %sfp,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %rbp	 ; tmp699, statement
 ; D:\TC\src\parser.c:242:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L438	 ;,
 ; D:\TC\src\parser.c:243:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:243:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC81(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:243:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp700
 ; D:\TC\src\parser.c:243:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L441	 ;
.L438:
 ; D:\TC\src\parser.c:244:         else if (have_return)
	testb	%r13b, %r13b	 ; have_return
	je	.L440	 ;,
 ; D:\TC\src\parser.c:245:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:245:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:245:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp701
 ; D:\TC\src\parser.c:245:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L440:
 ; D:\TC\src\parser.c:247:             have_return = true;
	cmpl	$5, 8(%rbp)	 ;, statement_438->type
	movb	$1, %al	 ;, tmp564
	cmove	%eax, %r13d	 ; have_return,, tmp564, have_return
.L441:
 ; D:\TC\src\parser.c:248:         list_append(body, (pointer)statement);
	movq	%rbp, %rdx	 ; statement,
	movq	%r12, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:249:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp702, token
	jmp	.L437	 ;
.L563:
 ; D:\TC\src\parser.c:240:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp786
	movq	(%rsi), %rcx	 ; token_441->lexeme,
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:240:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp703
	je	.L442	 ;,
 ; D:\TC\src\parser.c:251:     parser->in_function = false;
	movw	$0, 8(%rbx)	 ;, MEM <unsigned short> [(char *)parser_74(D) + 8B]
 ; D:\TC\src\parser.c:253:     if (!have_return && return_type != name_void)
	testb	%r13b, %r13b	 ; have_return
	jne	.L443	 ;,
 ; D:\TC\src\parser.c:253:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp515
 ; D:\TC\src\parser.c:253:     if (!have_return && return_type != name_void)
	cmpq	(%rax), %rdi	 ; name_void, return_type
	je	.L443	 ;,
 ; D:\TC\src\parser.c:254:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:254:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC82(%rip), %rcx	 ;, tmp516
 ; D:\TC\src\parser.c:254:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp704
 ; D:\TC\src\parser.c:254:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L443:
 ; D:\TC\src\parser.c:256:     return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
	movq	88(%rsp), %rax	 ; %sfp, method_scope
	movq	%r12, 32(%rsp)	 ; body,
	movq	%rdi, %r8	 ; return_type,
	movq	136(%rsp), %rdx	 ; %sfp,
	movq	128(%rsp), %r9	 ; %sfp,
	movq	%rax, 40(%rsp)	 ; method_scope,
	movq	120(%rsp), %rcx	 ; %sfp,
	call	create_method_use_ptr	 ;
	movq	%rax, %rdx	 ; tmp705, _456
 ; D:\TC\src\parser.c:283:             if (method == NULL)
	testq	%rax, %rax	 ; _456
	jne	.L444	 ;,
.L415:
 ; D:\TC\src\parser.c:284:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:284:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC83(%rip), %rcx	 ;, tmp517
 ; D:\TC\src\parser.c:284:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp706
 ; D:\TC\src\parser.c:284:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _456
.L444:
 ; D:\TC\src\parser.c:285:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%ecx, %ecx	 ;
	xorl	%r8d, %r8d	 ;
	call	create_class_member	 ;
 ; D:\TC\src\parser.c:285:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:285:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rdx	 ; tmp707, _241
 ; D:\TC\src\parser.c:285:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:281:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	jmp	.L455	 ;
.L412:
 ; D:\TC\src\parser.c:286:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	cmpl	$6, 24(%r14)	 ;, token_233->type
	jne	.L411	 ;,
 ; D:\TC\src\parser.c:286:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp518
	movq	(%r14), %rcx	 ; token_233->lexeme,
	movq	(%rax), %rdx	 ; VAR_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:286:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; tmp708
	je	.L411	 ;,
 ; D:\TC\src\parser.c:287:             token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:288:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	64(%rsp), %rdx	 ; %sfp,
	movq	48(%rsp), %rcx	 ; %sfp,
	movq	%rbx, %r8	 ; parser,
 ; D:\TC\src\parser.c:287:             token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp709, token
 ; D:\TC\src\parser.c:288:             Variable* variable = parse_variable(lexer, class_scope, parser);
	call	parse_variable	 ;
	movq	%rax, %rdi	 ; tmp710, variable
 ; D:\TC\src\parser.c:289:             if (variable == NULL)
	testq	%rax, %rax	 ; variable
	jne	.L446	 ;,
 ; D:\TC\src\parser.c:290:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:290:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC84(%rip), %rcx	 ;, tmp519
 ; D:\TC\src\parser.c:290:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp711
 ; D:\TC\src\parser.c:290:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L446:
 ; D:\TC\src\parser.c:291:             ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
	xorl	%edx, %edx	 ;
	movq	%rdi, %r8	 ; variable,
	movl	$1, %ecx	 ;,
	call	create_class_member	 ;
 ; D:\TC\src\parser.c:292:             list_append(members, (pointer)member);
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:291:             ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
	movq	%rax, %rsi	 ; tmp712, member
 ; D:\TC\src\parser.c:292:             list_append(members, (pointer)member);
	movq	%rax, %rdx	 ; member,
	call	list_append	 ;
 ; D:\TC\src\parser.c:293:             if (member->type == CLASS_VARIABLE) {
	cmpl	$1, 8(%rsi)	 ;, member_250->type
	jne	.L450	 ;,
 ; D:\TC\src\parser.c:294:                 Symbol* type = member->content.variable->type;
	movq	(%rsi), %rdx	 ; member_250->content.variable, _252
 ; D:\TC\src\parser.c:295:                 if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %rcx	 ;, tmp520
 ; D:\TC\src\parser.c:294:                 Symbol* type = member->content.variable->type;
	movq	(%rdx), %rax	 ; _252->type, type
 ; D:\TC\src\parser.c:295:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rcx), %rax	 ; name_int, type
	je	.L555	 ;,
 ; D:\TC\src\parser.c:295:                 if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rcx	 ;, tmp521
 ; D:\TC\src\parser.c:295:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rcx), %rax	 ; name_float, type
	je	.L555	 ;,
 ; D:\TC\src\parser.c:295:                 if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rcx	 ;, tmp522
 ; D:\TC\src\parser.c:295:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rcx), %rax	 ; name_string, type
	je	.L555	 ;,
 ; D:\TC\src\parser.c:297:                 else if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rcx	 ;, tmp523
 ; D:\TC\src\parser.c:297:                 else if (type == name_bool || type == name_void)
	cmpq	(%rcx), %rax	 ; name_bool, type
	je	.L451	 ;,
 ; D:\TC\src\parser.c:297:                 else if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rcx	 ;, tmp524
 ; D:\TC\src\parser.c:297:                 else if (type == name_bool || type == name_void)
	cmpq	(%rcx), %rax	 ; name_void, type
	jne	.L452	 ;,
.L451:
 ; D:\TC\src\parser.c:298:                     size += 1;
	incq	104(%rsp)	 ; %sfp
	jmp	.L450	 ;
.L452:
 ; D:\TC\src\parser.c:299:                 else if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rax)	 ;, type_253->kind
	jne	.L453	 ;,
.L555:
 ; D:\TC\src\parser.c:300:                     size += 8;  // pointer to object
	addq	$8, 104(%rsp)	 ;, %sfp
	jmp	.L450	 ;
.L453:
 ; D:\TC\src\parser.c:302:                     fprintf(stderr, "[warning] Unsupported type for class variable '%s': %s\n", member->content.variable->name->name, type->name);
	movq	8(%rax), %r9	 ; type_253->name, _264
	movq	8(%rdx), %rax	 ; _252->name, _252->name
	movq	8(%rax), %r8	 ; _265->name, _266
	movq	%r9, 120(%rsp)	 ; _264, %sfp
	movq	%r8, 88(%rsp)	 ; _266, %sfp
 ; D:\TC\src\parser.c:302:                     fprintf(stderr, "[warning] Unsupported type for class variable '%s': %s\n", member->content.variable->name->name, type->name);
	call	__getreent	 ;
 ; D:\TC\src\parser.c:302:                     fprintf(stderr, "[warning] Unsupported type for class variable '%s': %s\n", member->content.variable->name->name, type->name);
	movq	120(%rsp), %r9	 ; %sfp, _264
	movq	88(%rsp), %r8	 ; %sfp, _266
	leaq	.LC85(%rip), %rdx	 ;, tmp527
	movq	24(%rax), %rcx	 ; _267->_stderr, _267->_stderr
	call	fprintf	 ;
.L450:
 ; D:\TC\src\parser.c:304:             token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:305:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_269->type
 ; D:\TC\src\parser.c:304:             token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp714, token
 ; D:\TC\src\parser.c:305:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	je	.L454	 ;,
.L456:
 ; D:\TC\src\parser.c:306:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:306:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC86(%rip), %rcx	 ;, tmp528
 ; D:\TC\src\parser.c:306:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp715
	jmp	.L556	 ;
.L454:
 ; D:\TC\src\parser.c:305:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp529
	movq	(%rsi), %rcx	 ; token_269->lexeme,
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:305:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp716
	je	.L456	 ;,
	jmp	.L455	 ;
.L411:
 ; D:\TC\src\parser.c:308:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:308:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC87(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:308:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp717
.L556:
 ; D:\TC\src\parser.c:308:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L455:
 ; D:\TC\src\parser.c:309:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r14	 ; tmp718, token
	jmp	.L410	 ;
.L561:
 ; D:\TC\src\parser.c:280:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp791
	movq	(%r14), %rcx	 ; token_233->lexeme,
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:280:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp719
	je	.L458	 ;,
 ; D:\TC\src\parser.c:311:     string init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
	movq	56(%rsp), %rax	 ; %sfp, name
	movq	8(%rax), %rcx	 ; name_223->name, name_223->name
	movq	.refptr.DEFAULT_INIT_NAME(%rip), %rax	 ;, tmp532
	movq	(%rax), %rdx	 ; DEFAULT_INIT_NAME,
	call	make_method_name	 ;
 ; D:\TC\src\parser.c:312:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	movq	64(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; init_name,
 ; D:\TC\src\parser.c:311:     string init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
	movq	%rax, %rbp	 ; tmp720, init_name
 ; D:\TC\src\parser.c:312:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	call	search_name_use_strcmp	 ;
	movq	%rax, %rsi	 ; tmp721, init
 ; D:\TC\src\parser.c:313:     if (init == NULL) {
	testq	%rax, %rax	 ; init
	jne	.L459	 ;,
 ; D:\TC\src\parser.c:314:         Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\parser.c:315:         method->method_scope = create_symbol_table(class_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:314:         Method* method = (Method*)alloc_memory(sizeof(Method));
	movq	%rax, %rdi	 ; tmp722, method
 ; D:\TC\src\parser.c:315:         method->method_scope = create_symbol_table(class_scope);
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:316:         init = create_symbol(init_name, SYMBOL_METHOD, name, method);
	movq	56(%rsp), %r8	 ; %sfp,
	movq	%rbp, %rcx	 ; init_name,
	movq	%rdi, %r9	 ; method,
 ; D:\TC\src\parser.c:315:         method->method_scope = create_symbol_table(class_scope);
	movq	%rax, 32(%rdi)	 ; tmp723, method_287->method_scope
 ; D:\TC\src\parser.c:316:         init = create_symbol(init_name, SYMBOL_METHOD, name, method);
	movl	$2, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, %rsi	 ; tmp724, init
 ; D:\TC\src\parser.c:317:         list(Variable*) parameters = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:318:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	32(%rdi), %r9	 ; method_287->method_scope,
	movq	56(%rsp), %r8	 ; %sfp,
	movl	$3, %edx	 ;,
 ; D:\TC\src\parser.c:317:         list(Variable*) parameters = create_list();
	movq	%rax, %rbp	 ; tmp725, parameters
 ; D:\TC\src\parser.c:318:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp535
	movq	(%rax), %rcx	 ; SELF_KEYWORD,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:319:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	56(%rsp), %rcx	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rax, %rdx	 ; self,
 ; D:\TC\src\parser.c:318:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	%rax, %r13	 ; tmp726, self
 ; D:\TC\src\parser.c:319:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	call	create_variable	 ;
 ; D:\TC\src\parser.c:319:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	%rbp, %rcx	 ; parameters,
 ; D:\TC\src\parser.c:319:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	%rax, %rdx	 ; tmp727, _294
 ; D:\TC\src\parser.c:319:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:320:         list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r11d, %r11d	 ;
	movq	%r13, %r8	 ; self,
	xorl	%r9d, %r9d	 ;
	movq	%r11, 32(%rsp)	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
 ; D:\TC\src\parser.c:320:         list(Statement*) body = create_list();
	movq	%rax, %r12	 ; tmp728, body
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r13d, %r13d	 ;
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp729,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %r8	 ;, tmp730
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	create_expression	 ;
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%r13, 40(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rax, 32(%rsp)	 ; tmp731,
	xorl	%edx, %edx	 ;
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%r12, %rcx	 ; body,
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %rdx	 ; tmp732, _299
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:322:         create_method_use_ptr(method, init, name, parameters, body, method->method_scope);
	movq	32(%rdi), %rax	 ; method_287->method_scope, method_287->method_scope
	movq	%rbp, %r9	 ; parameters,
	movq	%rsi, %rdx	 ; init,
	movq	%r12, 32(%rsp)	 ; body,
	movq	56(%rsp), %r8	 ; %sfp,
	movq	%rdi, %rcx	 ; method,
	movq	%rax, 40(%rsp)	 ; method_287->method_scope,
	call	create_method_use_ptr	 ;
 ; D:\TC\src\parser.c:323:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rdi, %rdx	 ; method,
	xorl	%ecx, %ecx	 ;
	xorl	%r8d, %r8d	 ;
	call	create_class_member	 ;
 ; D:\TC\src\parser.c:323:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:323:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rdx	 ; tmp733, _301
 ; D:\TC\src\parser.c:323:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	list_append	 ;
.L459:
 ; D:\TC\src\parser.c:325:     if (init->kind != SYMBOL_METHOD)
	cmpl	$2, 32(%rsi)	 ;, init_302->kind
	je	.L460	 ;,
 ; D:\TC\src\parser.c:326:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:326:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC88(%rip), %rcx	 ;, tmp537
 ; D:\TC\src\parser.c:326:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp734
 ; D:\TC\src\parser.c:326:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L460:
 ; D:\TC\src\parser.c:327:     string constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	56(%rsp), %rax	 ; %sfp, name
	movq	8(%rax), %rcx	 ; name_223->name, name_223->name
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp538
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME,
	call	make_method_name	 ;
 ; D:\TC\src\parser.c:328:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
 ; D:\TC\src\parser.c:327:     string constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	%rax, %rbp	 ; tmp735, constructor_name
 ; D:\TC\src\parser.c:328:     Method* method = (Method*)alloc_memory(sizeof(Method));
	call	alloc_memory	 ;
 ; D:\TC\src\parser.c:329:     method->method_scope = create_symbol_table(class_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:328:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movq	%rax, %rdi	 ; tmp736, method
 ; D:\TC\src\parser.c:329:     method->method_scope = create_symbol_table(class_scope);
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:330:     Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
	movq	56(%rsp), %r8	 ; %sfp,
	movq	%rdi, %r9	 ; method,
	movq	%rbp, %rcx	 ; constructor_name,
 ; D:\TC\src\parser.c:329:     method->method_scope = create_symbol_table(class_scope);
	movq	%rax, 32(%rdi)	 ; tmp737, method_310->method_scope
 ; D:\TC\src\parser.c:330:     Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
	movl	$2, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, 120(%rsp)	 ; tmp738, %sfp
 ; D:\TC\src\parser.c:331:     list(Variable*) parameters = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:332:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %r13	 ;, tmp541
	movq	32(%rdi), %r9	 ; method_310->method_scope,
	movl	$3, %edx	 ;,
	movq	56(%rsp), %r8	 ; %sfp,
 ; D:\TC\src\parser.c:331:     list(Variable*) parameters = create_list();
	movq	%rax, 88(%rsp)	 ; tmp739, %sfp
 ; D:\TC\src\parser.c:332:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	0(%r13), %rcx	 ; SELF_KEYWORD,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:333:     list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	56(%rsp), %rcx	 ; %sfp,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:332:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	%rax, %rdx	 ; tmp740, self
 ; D:\TC\src\parser.c:333:     list_append(parameters, (pointer)create_variable(name, self, NULL));
	call	create_variable	 ;
 ; D:\TC\src\parser.c:333:     list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	88(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:333:     list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	%rax, %rdx	 ; tmp741, _317
 ; D:\TC\src\parser.c:333:     list_append(parameters, (pointer)create_variable(name, self, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:334:     list(Variable*) init_params = list_copy(init->ast_node.method->parameters);
	movq	24(%rsi), %rax	 ; init_302->ast_node.method, init_302->ast_node.method
	movq	16(%rax), %rcx	 ; _318->parameters, _318->parameters
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp742, init_params
.L462:
 ; D:\TC\src\parser.c:336:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	movq	%r12, %rcx	 ; init_params,
	call	list_pop	 ;
	movq	%rax, %r14	 ; tmp745, param
 ; D:\TC\src\parser.c:336:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	testq	%rax, %rax	 ; param
	je	.L564	 ;,
 ; D:\TC\src\parser.c:337:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	movq	8(%r14), %rax	 ; param_322->name, param_322->name
	movq	0(%r13), %rdx	 ; SELF_KEYWORD,
	movq	8(%rax), %rcx	 ; _323->name, _323->name
	call	string_equal	 ;
 ; D:\TC\src\parser.c:337:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	testb	%al, %al	 ; tmp743
	jne	.L462	 ;,
 ; D:\TC\src\parser.c:338:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	8(%r14), %rdx	 ; param_322->name, param_322->name
	movq	(%r14), %rcx	 ; param_322->type,
	xorl	%r8d, %r8d	 ;
	call	create_variable	 ;
 ; D:\TC\src\parser.c:338:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	88(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:338:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	%rax, %rdx	 ; tmp744, _328
 ; D:\TC\src\parser.c:338:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	call	list_append	 ;
	jmp	.L462	 ;
.L564:
 ; D:\TC\src\parser.c:340:     list(statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:341:     list(ClassMember*) ms = list_copy(members);
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:340:     list(statement*) body = create_list();
	movq	%rax, %r12	 ; tmp746, body
 ; D:\TC\src\parser.c:341:     list(ClassMember*) ms = list_copy(members);
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp747, ms
.L465:
 ; D:\TC\src\parser.c:343:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	movq	%r13, %rcx	 ; ms,
	call	list_pop	 ;
	movq	%rax, %rbp	 ; tmp756, mb
 ; D:\TC\src\parser.c:343:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	testq	%rax, %rax	 ; mb
	je	.L565	 ;,
 ; D:\TC\src\parser.c:344:         if (mb->type == CLASS_VARIABLE) {
	cmpl	$1, 8(%rbp)	 ;, mb_331->type
	jne	.L465	 ;,
 ; D:\TC\src\parser.c:345:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
	movq	0(%rbp), %rax	 ; mb_331->content.variable, mb_331->content.variable
	xorl	%r10d, %r10d	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	8(%rax), %r8	 ; _334->name, _334->name
	movq	%r10, 32(%rsp)	 ;,
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:345:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp748,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:\TC\src\parser.c:345:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; D:\TC\src\parser.c:345:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
	movq	%rax, %r8	 ;, tmp749
 ; D:\TC\src\parser.c:345:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
	call	create_expression	 ;
	movq	%rax, %r14	 ; tmp750, left
 ; D:\TC\src\parser.c:346:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	0(%rbp), %rax	 ; mb_331->content.variable, mb_331->content.variable
	movq	16(%rax), %r9	 ; _339->value, _340
 ; D:\TC\src\parser.c:346:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	testq	%r9, %r9	 ; _340
	jne	.L466	 ;,
 ; D:\TC\src\parser.c:346:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movl	$2, %edx	 ;,
	leaq	.LC89(%rip), %rcx	 ;, tmp551
	call	create_string	 ;
 ; D:\TC\src\parser.c:346:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%ecx, %ecx	 ;
	movq	%r9, 32(%rsp)	 ;,
 ; D:\TC\src\parser.c:346:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	%rax, %rdx	 ; tmp751, _341
 ; D:\TC\src\parser.c:346:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	xorl	%r9d, %r9d	 ;
	call	create_primary	 ;
 ; D:\TC\src\parser.c:346:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; D:\TC\src\parser.c:346:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	%rax, %r8	 ;, tmp752
 ; D:\TC\src\parser.c:346:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	call	create_expression	 ;
	movq	%rax, %r9	 ; tmp753, _340
.L466:
 ; D:\TC\src\parser.c:347:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	xorl	%r8d, %r8d	 ;
	movq	%r14, %rdx	 ; left,
	movl	$13, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:347:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%r8, 40(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rax, 32(%rsp)	 ; tmp754,
	call	create_statement	 ;
 ; D:\TC\src\parser.c:347:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	%r12, %rcx	 ; body,
 ; D:\TC\src\parser.c:347:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	%rax, %rdx	 ; tmp755, _346
 ; D:\TC\src\parser.c:347:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	call	list_append	 ;
	jmp	.L465	 ;
.L565:
 ; D:\TC\src\parser.c:350:     list(Expression*) args = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:351:     list(Variable*) params = list_copy(parameters);
	movq	88(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:350:     list(Expression*) args = create_list();
	movq	%rax, %r13	 ; tmp757, args
 ; D:\TC\src\parser.c:351:     list(Variable*) params = list_copy(parameters);
	call	list_copy	 ;
	movq	%rax, %r14	 ; tmp758, params
.L468:
 ; D:\TC\src\parser.c:352:     while ((param = (Variable*)list_pop(params)) != NULL)
	movq	%r14, %rcx	 ; params,
	call	list_pop	 ;
 ; D:\TC\src\parser.c:352:     while ((param = (Variable*)list_pop(params)) != NULL)
	testq	%rax, %rax	 ; param
	je	.L566	 ;,
 ; D:\TC\src\parser.c:353:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	xorl	%ecx, %ecx	 ;
	movq	8(%rax), %r8	 ; param_349->name, param_349->name
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movq	%rcx, 32(%rsp)	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:353:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp759,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:\TC\src\parser.c:353:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	movl	$19, %ecx	 ;,
 ; D:\TC\src\parser.c:353:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rax, %r8	 ;, tmp760
 ; D:\TC\src\parser.c:353:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	call	create_expression	 ;
 ; D:\TC\src\parser.c:353:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%r13, %rcx	 ; args,
 ; D:\TC\src\parser.c:353:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rax, %rdx	 ; tmp761, _353
 ; D:\TC\src\parser.c:353:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	call	list_append	 ;
	jmp	.L468	 ;
.L566:
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%eax, %eax	 ;
	xorl	%r9d, %r9d	 ;
	movq	%rsi, %r8	 ; init,
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%r13, 32(%rsp)	 ; args,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %rdx	 ; tmp763, _354
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp764,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %r8	 ;, tmp765
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	call	create_expression	 ;
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rdx, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp766,
	call	create_statement	 ;
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%r12, %rcx	 ; body,
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %rdx	 ; tmp767, _358
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:355:     create_method_use_ptr(method, constructor, name, parameters, body, method->method_scope);
	movq	32(%rdi), %rax	 ; method_310->method_scope, method_310->method_scope
	movq	%r12, 32(%rsp)	 ; body,
	movq	%rdi, %rcx	 ; method,
	movq	88(%rsp), %r9	 ; %sfp,
	movq	56(%rsp), %r8	 ; %sfp,
	movq	%rax, 40(%rsp)	 ; method_310->method_scope,
	movq	120(%rsp), %rdx	 ; %sfp,
	call	create_method_use_ptr	 ;
 ; D:\TC\src\parser.c:356:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; method,
	xorl	%ecx, %ecx	 ;
	call	create_class_member	 ;
 ; D:\TC\src\parser.c:356:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:356:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rdx	 ; tmp768, _360
 ; D:\TC\src\parser.c:356:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:358:     return create_class_use_ptr(class, name, members, class_scope, size);
	movq	104(%rsp), %rax	 ; %sfp, size
	movq	64(%rsp), %r9	 ; %sfp,
	movq	80(%rsp), %r8	 ; %sfp,
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	%rax, 32(%rsp)	 ; size,
	movq	112(%rsp), %rcx	 ; %sfp,
	call	create_class_use_ptr	 ;
	movq	%rax, %r9	 ; tmp769, _362
 ; D:\TC\src\parser.c:51:             if (class == NULL)
	testq	%rax, %rax	 ; _362
	jne	.L470	 ;,
.L407:
 ; D:\TC\src\parser.c:52:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:52:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC90(%rip), %rcx	 ;, tmp554
 ; D:\TC\src\parser.c:52:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp770
 ; D:\TC\src\parser.c:52:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%r9d, %r9d	 ; _362
.L470:
 ; D:\TC\src\parser.c:53:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$2, %ecx	 ;,
.L558:
	call	create_code_member	 ;
 ; D:\TC\src\parser.c:53:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	96(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:53:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	%rax, %rdx	 ; tmp771, _36
 ; D:\TC\src\parser.c:53:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	call	list_append	 ;
 ; D:\TC\src\parser.c:49:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	jmp	.L376	 ;
.L471:
 ; D:\TC\src\parser.c:59:     return create_code(members, global_scope);
	movq	72(%rsp), %rdx	 ; %sfp,
	movq	96(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:60: }
	addq	$152, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\parser.c:59:     return create_code(members, global_scope);
	jmp	create_code	 ;
.L405:
 ; D:\TC\src\parser.c:55:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:55:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC91(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:55:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp773
 ; D:\TC\src\parser.c:55:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L376	 ;
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
