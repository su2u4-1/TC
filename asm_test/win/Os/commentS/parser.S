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
 ; D:\TC\src\parser.c:528:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:526: static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, SymbolTable* now_scope, Parser* parser) {
	subq	$56, %rsp	 ;,
 ; D:\TC\src\parser.c:526: static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, SymbolTable* now_scope, Parser* parser) {
	movq	%rcx, 128(%rsp)	 ; tmp119, lexer
	movq	160(%rsp), %r15	 ; parser, parser
.L20:
 ; D:\TC\src\parser.c:554:         token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:529:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_15->type
	jne	.L14	 ;,
 ; D:\TC\src\parser.c:530:         OperatorType op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_15->lexeme,
	call	string_to_operator	 ;
 ; D:\TC\src\parser.c:531:         int op_prec = operator_precedence(op);
	movl	%eax, %ecx	 ; op,
 ; D:\TC\src\parser.c:530:         OperatorType op = string_to_operator(token->lexeme);
	movl	%eax, %edi	 ; tmp124, op
 ; D:\TC\src\parser.c:531:         int op_prec = operator_precedence(op);
	call	operator_precedence	 ;
	movl	%eax, %r12d	 ; tmp125, op_prec
 ; D:\TC\src\parser.c:532:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, %edi	 ;, op
	je	.L14	 ;,
	cmpl	%r14d, %eax	 ; min_prec, op_prec
	jge	.L3	 ;,
.L14:
 ; D:\TC\src\parser.c:556:     token = peek_current_token(lexer);
	movq	128(%rsp), %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:557:     return expr_left;
	jmp	.L1	 ;
.L3:
 ; D:\TC\src\parser.c:534:         token = get_next_token(lexer, true);  // consume operator
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:535:         token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:536:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%r15, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
 ; D:\TC\src\parser.c:535:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp126, token
 ; D:\TC\src\parser.c:536:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp127, right_primary
 ; D:\TC\src\parser.c:537:         if (right_primary == NULL) {
	testq	%rax, %rax	 ; right_primary
	jne	.L6	 ;,
 ; D:\TC\src\parser.c:538:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_38(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:538:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC0(%rip), %rcx	 ;, tmp113
 ; D:\TC\src\parser.c:538:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp128
 ; D:\TC\src\parser.c:538:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:539:             return NULL;
	jmp	.L7	 ;
.L6:
 ; D:\TC\src\parser.c:541:         Expression* right = create_expression(OP_NONE, NULL, right_primary, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rsi	 ; tmp129, right
.L19:
 ; D:\TC\src\parser.c:551:             token = peek_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:543:         while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_14->type
	jne	.L12	 ;,
 ; D:\TC\src\parser.c:544:             OperatorType next_op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_14->lexeme,
	call	string_to_operator	 ;
 ; D:\TC\src\parser.c:545:             int next_prec = operator_precedence(next_op);
	movl	%eax, %ecx	 ; next_op,
 ; D:\TC\src\parser.c:544:             OperatorType next_op = string_to_operator(token->lexeme);
	movl	%eax, %r13d	 ; tmp131, next_op
 ; D:\TC\src\parser.c:545:             int next_prec = operator_precedence(next_op);
	call	operator_precedence	 ;
	movl	%eax, %r8d	 ; tmp132, next_prec
 ; D:\TC\src\parser.c:546:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %r13d	 ;, next_op
	je	.L12	 ;,
	cmpl	%eax, %r12d	 ; next_prec, op_prec
	jl	.L9	 ;,
.L12:
 ; D:\TC\src\parser.c:553:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rbx, %rdx	 ; <retval>,
	movl	%edi, %ecx	 ; op,
	movq	%rsi, %r9	 ; right,
	xorl	%r8d, %r8d	 ;
	call	create_expression	 ;
 ; D:\TC\src\parser.c:554:         token = peek_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:553:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rax, %rbx	 ; tmp133, <retval>
	jmp	.L20	 ;
.L9:
 ; D:\TC\src\parser.c:548:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	%r15, 32(%rsp)	 ; parser,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rsi, %rdx	 ; right,
	movq	%rbp, %r9	 ; now_scope,
	call	parse_expr_prec	 ;
	movq	%rax, %rsi	 ; tmp135, right
 ; D:\TC\src\parser.c:549:             if (right == NULL)
	testq	%rax, %rax	 ; right
	jne	.L19	 ;,
.L7:
 ; D:\TC\src\parser.c:539:             return NULL;
	xorl	%ebx, %ebx	 ; <retval>
.L1:
 ; D:\TC\src\parser.c:558: }
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
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %rbx	 ; tmp95, <retval>
 ; D:\TC\src\parser.c:561:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; <retval>
	jne	.L23	 ;,
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_10(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, 56(%rsp)	 ; _2, %sfp
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	56(%rsp), %r8	 ; %sfp, _2
	leaq	.LC1(%rip), %rcx	 ;, tmp90
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp97, _3
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:563:         return NULL;
	jmp	.L22	 ;
.L23:
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
	movq	%rax, %rdx	 ; tmp98, _4
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rbx	 ; tmp99, <retval>
.L22:
 ; D:\TC\src\parser.c:566: }
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
 ; D:\TC\src\parser.c:276:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rdi	 ; tmp131, token
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_36->type, _1
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _1
	je	.L27	 ;,
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _1
	jne	.L30	 ;,
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rdi), %rcx	 ; token_36->lexeme,
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp133
	je	.L30	 ;,
.L27:
 ; D:\TC\src\parser.c:281:     Symbol* type = search_name(now_scope, token->lexeme);
	movq	(%rdi), %rdx	 ; token_36->lexeme,
	movq	%r12, %rcx	 ; now_scope,
	call	search_name	 ;
	movq	%rax, %rbp	 ; tmp134, type
 ; D:\TC\src\parser.c:282:     if (type != NULL) {
	testq	%rax, %rax	 ; type
	je	.L31	 ;,
 ; D:\TC\src\parser.c:284:         if (type_ptr->kind != SYMBOL_TYPE && type_ptr->kind != SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; type_43->kind, _46
 ; D:\TC\src\parser.c:284:         if (type_ptr->kind != SYMBOL_TYPE && type_ptr->kind != SYMBOL_CLASS)
	cmpl	$5, %eax	 ;, _46
	je	.L32	 ;,
	testl	%eax, %eax	 ; _46
	je	.L32	 ;,
 ; D:\TC\src\parser.c:285:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_38(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:285:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC3(%rip), %rcx	 ;, tmp122
 ; D:\TC\src\parser.c:285:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp135
	jmp	.L55	 ;
.L31:
 ; D:\TC\src\parser.c:287:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_38(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:287:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC4(%rip), %rcx	 ;, tmp123
 ; D:\TC\src\parser.c:287:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp136
.L55:
 ; D:\TC\src\parser.c:287:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L32:
 ; D:\TC\src\parser.c:288:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:289:     if (token->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	 ;, token_50->type
 ; D:\TC\src\parser.c:288:     token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp137, token
 ; D:\TC\src\parser.c:289:     if (token->type != IDENTIFIER)
	je	.L33	 ;,
 ; D:\TC\src\parser.c:290:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_38(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:290:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC5(%rip), %rcx	 ;, tmp124
 ; D:\TC\src\parser.c:290:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp138
 ; D:\TC\src\parser.c:290:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L33:
 ; D:\TC\src\parser.c:291:     Symbol* name = create_symbol(token->lexeme, SYMBOL_VARIABLE, type, now_scope);
	movq	(%rdi), %rcx	 ; token_50->lexeme,
	movq	%r12, %r9	 ; now_scope,
	movq	%rbp, %r8	 ; type,
	movl	$2, %edx	 ;,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:293:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:291:     Symbol* name = create_symbol(token->lexeme, SYMBOL_VARIABLE, type, now_scope);
	movq	%rax, %rdi	 ; tmp139, name
 ; D:\TC\src\parser.c:293:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:294:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_56->type
	je	.L34	 ;,
.L36:
 ; D:\TC\src\parser.c:292:     Expression* value = NULL;
	xorl	%esi, %esi	 ; value
	jmp	.L35	 ;
.L34:
 ; D:\TC\src\parser.c:294:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx	 ;, tmp125
	movq	(%rax), %rcx	 ; token_56->lexeme,
	movq	(%rdx), %rdx	 ; ASSIGN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:294:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	 ; tmp141
	je	.L36	 ;,
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
	movq	%rbx, %r8	 ; parser,
	movq	%r12, %rdx	 ; now_scope,
 ; D:\TC\src\parser.c:296:         token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp142, token
 ; D:\TC\src\parser.c:297:         value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rsi	 ; tmp143, value
 ; D:\TC\src\parser.c:298:         if (value == NULL)
	testq	%rax, %rax	 ; value
	jne	.L35	 ;,
 ; D:\TC\src\parser.c:299:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_38(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:299:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC6(%rip), %rcx	 ;, tmp126
 ; D:\TC\src\parser.c:299:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp144
 ; D:\TC\src\parser.c:299:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L35:
 ; D:\TC\src\parser.c:302: }
	addq	$40, %rsp	 ;,
 ; D:\TC\src\parser.c:301:     return create_variable(type, name, value);
	movq	%rsi, %r8	 ; value,
	movq	%rdi, %rdx	 ; name,
	movq	%rbp, %rcx	 ; type,
 ; D:\TC\src\parser.c:302: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
 ; D:\TC\src\parser.c:301:     return create_variable(type, name, value);
	jmp	create_variable	 ;
.L30:
 ; D:\TC\src\parser.c:278:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_38(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:278:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC2(%rip), %rcx	 ;, tmp117
 ; D:\TC\src\parser.c:278:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp132
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
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp256, parser
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
 ; D:\TC\src\parser.c:567: Primary* parse_primary(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
	movq	%rcx, 128(%rsp)	 ; tmp254, lexer
	movq	%rdx, 136(%rsp)	 ; tmp255, now_scope
 ; D:\TC\src\parser.c:569:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rbp	 ; tmp257, token
 ; D:\TC\src\parser.c:575:     if (token->type == INTEGER) {
	movl	24(%rax), %eax	 ; token_62->type, _1
 ; D:\TC\src\parser.c:575:     if (token->type == INTEGER) {
	cmpl	$2, %eax	 ;, _1
	jne	.L57	 ;,
 ; D:\TC\src\parser.c:577:         str_value = token->lexeme;
	movq	0(%rbp), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	 ; variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%edi, %edi	 ; expr_value
 ; D:\TC\src\parser.c:576:         type = PRIM_INTEGER;
	xorl	%ebp, %ebp	 ; type
	jmp	.L58	 ;
.L57:
 ; D:\TC\src\parser.c:578:     } else if (token->type == FLOAT) {
	cmpl	$3, %eax	 ;, _1
	jne	.L59	 ;,
 ; D:\TC\src\parser.c:580:         str_value = token->lexeme;
	movq	0(%rbp), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	 ; variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%edi, %edi	 ; expr_value
 ; D:\TC\src\parser.c:579:         type = PRIM_FLOAT;
	movl	$1, %ebp	 ;, type
	jmp	.L58	 ;
.L59:
 ; D:\TC\src\parser.c:581:     } else if (token->type == STRING) {
	cmpl	$4, %eax	 ;, _1
	jne	.L60	 ;,
 ; D:\TC\src\parser.c:583:         str_value = token->lexeme;
	movq	0(%rbp), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	 ; variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%edi, %edi	 ; expr_value
 ; D:\TC\src\parser.c:582:         type = PRIM_STRING;
	movl	$2, %ebp	 ;, type
	jmp	.L58	 ;
.L60:
 ; D:\TC\src\parser.c:584:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _1
	jne	.L61	 ;,
 ; D:\TC\src\parser.c:584:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	movq	.refptr.TRUE_KEYWORD(%rip), %rax	 ;, tmp211
	movq	0(%rbp), %rcx	 ; token_62->lexeme,
	movq	(%rax), %rdx	 ; TRUE_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:584:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	 ; tmp258
	je	.L62	 ;,
 ; D:\TC\src\parser.c:586:         str_value = token->lexeme;
	movq	0(%rbp), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	 ; variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%edi, %edi	 ; expr_value
 ; D:\TC\src\parser.c:585:         type = PRIM_TRUE;
	movl	$3, %ebp	 ;, type
 ; D:\TC\src\parser.c:586:         str_value = token->lexeme;
	jmp	.L58	 ;
.L62:
 ; D:\TC\src\parser.c:587:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, 24(%rbp)	 ;, token_62->type
	jne	.L61	 ;,
 ; D:\TC\src\parser.c:587:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movq	.refptr.FALSE_KEYWORD(%rip), %rax	 ;, tmp212
	movq	0(%rbp), %rcx	 ; token_62->lexeme,
	movq	(%rax), %rdx	 ; FALSE_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:587:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	 ; tmp259
	je	.L61	 ;,
 ; D:\TC\src\parser.c:589:         str_value = token->lexeme;
	movq	0(%rbp), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	 ; variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%edi, %edi	 ; expr_value
 ; D:\TC\src\parser.c:588:         type = PRIM_FALSE;
	movl	$4, %ebp	 ;, type
 ; D:\TC\src\parser.c:589:         str_value = token->lexeme;
	jmp	.L58	 ;
.L61:
 ; D:\TC\src\parser.c:590:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_62->type
	jne	.L71	 ;,
 ; D:\TC\src\parser.c:590:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp213
	movq	0(%rbp), %rcx	 ; token_62->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:590:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp260
	je	.L64	 ;,
 ; D:\TC\src\parser.c:592:         token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:593:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	136(%rsp), %rdx	 ; now_scope,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rsi, %r8	 ; parser,
 ; D:\TC\src\parser.c:592:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp261, token
 ; D:\TC\src\parser.c:593:         expr_value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rdi	 ; tmp262, expr_value
 ; D:\TC\src\parser.c:594:         if (expr_value == NULL) {
	testq	%rax, %rax	 ; expr_value
	jne	.L65	 ;,
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC7(%rip), %rcx	 ;, tmp214
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp263
	jmp	.L154	 ;
.L65:
 ; D:\TC\src\parser.c:598:         token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %ebp	 ; token_75->type, type
 ; D:\TC\src\parser.c:598:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp264, token
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %ebp	 ;, type
	je	.L67	 ;,
.L69:
 ; D:\TC\src\parser.c:600:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:600:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC8(%rip), %rcx	 ;, tmp215
 ; D:\TC\src\parser.c:600:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp265
.L154:
 ; D:\TC\src\parser.c:600:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:596:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L56	 ;
.L67:
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp216
	movq	(%rbx), %rcx	 ; token_75->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp266
	je	.L69	 ;,
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	 ; variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:571:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
	jmp	.L58	 ;
.L64:
 ; D:\TC\src\parser.c:603:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_62->type
	jne	.L71	 ;,
 ; D:\TC\src\parser.c:603:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp217
	movq	0(%rbp), %rcx	 ; token_62->lexeme,
	movq	(%rax), %rdx	 ; NOT_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:603:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	 ; tmp267
	je	.L70	 ;,
 ; D:\TC\src\parser.c:605:         token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:606:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	136(%rsp), %rdx	 ; now_scope,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rsi, %r8	 ; parser,
 ; D:\TC\src\parser.c:605:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp268, token
 ; D:\TC\src\parser.c:606:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp269, prim_value
 ; D:\TC\src\parser.c:607:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	jne	.L106	 ;,
 ; D:\TC\src\parser.c:608:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:608:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC9(%rip), %rcx	 ;, tmp218
 ; D:\TC\src\parser.c:608:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp270
	jmp	.L154	 ;
.L70:
 ; D:\TC\src\parser.c:611:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_62->type
	jne	.L71	 ;,
 ; D:\TC\src\parser.c:611:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp219
	movq	0(%rbp), %rcx	 ; token_62->lexeme,
	movq	(%rax), %rdx	 ; SUB_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:611:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	 ; tmp271
	je	.L71	 ;,
 ; D:\TC\src\parser.c:613:         token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:614:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	136(%rsp), %rdx	 ; now_scope,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rsi, %r8	 ; parser,
 ; D:\TC\src\parser.c:613:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp272, token
 ; D:\TC\src\parser.c:614:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp273, prim_value
 ; D:\TC\src\parser.c:615:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	jne	.L107	 ;,
 ; D:\TC\src\parser.c:616:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:616:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC10(%rip), %rcx	 ;, tmp220
 ; D:\TC\src\parser.c:616:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp274
	jmp	.L154	 ;
.L106:
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	 ; variable_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%edi, %edi	 ; expr_value
 ; D:\TC\src\parser.c:571:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:604:         type = PRIM_NOT_OPERAND;
	movl	$6, %ebp	 ;, type
	jmp	.L58	 ;
.L107:
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	 ; variable_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%edi, %edi	 ; expr_value
 ; D:\TC\src\parser.c:571:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:612:         type = PRIM_NEG_OPERAND;
	movl	$7, %ebp	 ;, type
.L58:
 ; D:\TC\src\parser.c:630:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%rbx, 32(%rsp)	 ; variable_value,
	movq	%rdi, %r8	 ; expr_value,
	movl	%ebp, %ecx	 ; type,
	call	create_primary	 ;
	jmp	.L56	 ;
.L71:
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movl	24(%rbp), %eax	 ; token_62->type, _34
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$1, %eax	 ;, _34
	jne	.L152	 ;,
.L75:
 ; D:\TC\src\parser.c:633:     Token* token = peek_current_token(lexer);
	movq	128(%rsp), %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %rbx	 ; tmp275, token
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movl	24(%rax), %eax	 ; token_107->type, _108
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	 ;, _108
	jne	.L72	 ;,
	jmp	.L73	 ;
.L152:
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$6, %eax	 ;, _34
	jne	.L74	 ;,
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp221
	movq	0(%rbp), %rcx	 ; token_62->lexeme,
	movq	(%rax), %rdx	 ; SELF_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	testb	%al, %al	 ; tmp276
	je	.L74	 ;,
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpb	$0, 9(%rsi)	 ;, parser_71(D)->in_method
	jne	.L75	 ;,
	jmp	.L74	 ;
.L72:
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	 ;, _108
	je	.L76	 ;,
.L78:
 ; D:\TC\src\parser.c:635:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:635:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC11(%rip), %rcx	 ;, tmp222
 ; D:\TC\src\parser.c:635:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp277
	jmp	.L157	 ;
.L76:
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp223
	movq	(%rbx), %rcx	 ; token_107->lexeme,
	movq	(%rax), %rdx	 ; SELF_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	 ; tmp278
	je	.L78	 ;,
.L73:
 ; D:\TC\src\parser.c:641:     base_name = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rdx	 ; token_107->lexeme,
	movq	136(%rsp), %rcx	 ; now_scope,
 ; D:\TC\src\parser.c:640:     SymbolTable* var_scope = NULL;
	xorl	%r13d, %r13d	 ; var_scope
 ; D:\TC\src\parser.c:638:     Symbol* current_type = NULL;
	xorl	%r12d, %r12d	 ; current_type
 ; D:\TC\src\parser.c:641:     base_name = search_name(now_scope, token->lexeme);
	call	search_name	 ;
 ; D:\TC\src\parser.c:642:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	xorl	%r8d, %r8d	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movq	%r8, 32(%rsp)	 ;,
	xorl	%ecx, %ecx	 ;
	movq	%rax, %r8	 ; base_name,
 ; D:\TC\src\parser.c:641:     base_name = search_name(now_scope, token->lexeme);
	movq	%rax, %rdi	 ; tmp279, base_name
 ; D:\TC\src\parser.c:642:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:643:     token = peek_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:642:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	movq	%rax, %rbx	 ; tmp280, variable_value
 ; D:\TC\src\parser.c:643:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
	movq	%rax, %r14	 ; tmp281, token
 ; D:\TC\src\parser.c:644:     while (token->type == SYMBOL) {
	jmp	.L79	 ;
.L83:
 ; D:\TC\src\parser.c:656:             else if (base_name->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rdi)	 ;, base_name_118->kind
	jne	.L85	 ;,
 ; D:\TC\src\parser.c:657:                 base_name = search_name(base_name->scope, CONSTRUCTOR_NAME);
	movq	.refptr.CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp230
	movq	8(%rdi), %rcx	 ; base_name_118->scope, _136
	movq	(%rax), %rdx	 ; CONSTRUCTOR_NAME,
	call	search_name	 ;
 ; D:\TC\src\parser.c:658:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %rdx	 ; variable_value,
	xorl	%r9d, %r9d	 ;
	movq	%rcx, 32(%rsp)	 ;,
	movq	%rax, %r8	 ; base_name,
	movl	$2, %ecx	 ;,
 ; D:\TC\src\parser.c:657:                 base_name = search_name(base_name->scope, CONSTRUCTOR_NAME);
	movq	%rax, %rdi	 ; tmp285, base_name
 ; D:\TC\src\parser.c:658:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	call	create_variable_access	 ;
	movq	%rax, %rbx	 ; tmp286, variable_value
 ; D:\TC\src\parser.c:660:             if (base_name != NULL && base_name->kind != SYMBOL_SUBROUTINE)
	testq	%rdi, %rdi	 ; base_name
	jne	.L85	 ;,
.L84:
 ; D:\TC\src\parser.c:662:             token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:667:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	leaq	.LC14(%rip), %r14	 ;, tmp249
 ; D:\TC\src\parser.c:662:             token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp288, token
 ; D:\TC\src\parser.c:663:             list(Expression*) args = create_list();
	call	create_list	 ;
	movq	%rax, %r13	 ; tmp289, args
.L87:
 ; D:\TC\src\parser.c:664:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_150->type
	je	.L158	 ;,
.L93:
 ; D:\TC\src\parser.c:665:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	136(%rsp), %rdx	 ; now_scope,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rsi, %r8	 ; parser,
	call	parse_expression	 ;
	movq	%rax, %r15	 ; tmp290, arg
 ; D:\TC\src\parser.c:666:                 if (arg == NULL)
	testq	%rax, %rax	 ; arg
	jne	.L88	 ;,
 ; D:\TC\src\parser.c:667:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:667:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	movq	%r14, %rcx	 ; tmp249,
 ; D:\TC\src\parser.c:667:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp291
 ; D:\TC\src\parser.c:667:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L88:
 ; D:\TC\src\parser.c:668:                 list_append(args, (pointer)arg);
	movq	%r15, %rdx	 ; arg,
	movq	%r13, %rcx	 ; args,
	call	list_append	 ;
 ; D:\TC\src\parser.c:669:                 token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:670:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_151->type
 ; D:\TC\src\parser.c:669:                 token = get_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp292, token
 ; D:\TC\src\parser.c:670:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	je	.L89	 ;,
.L92:
 ; D:\TC\src\parser.c:673:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:673:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC15(%rip), %rcx	 ;, tmp233
 ; D:\TC\src\parser.c:673:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp293
.L157:
 ; D:\TC\src\parser.c:691:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L77	 ;
.L103:
 ; D:\TC\src\parser.c:645:         if (base_name != NULL) {
	testq	%rdi, %rdi	 ; base_name
	je	.L80	 ;,
 ; D:\TC\src\parser.c:647:             if (base_name->type != NULL)  // subroutine or variable or attribute or parameter
	movq	(%rdi), %r12	 ; base_name_118->type, current_type
 ; D:\TC\src\parser.c:646:             current_type = base_name;     // class or type
	testq	%r12, %r12	 ; current_type
	cmove	%rdi, %r12	 ; current_type,, base_name, current_type
.L80:
 ; D:\TC\src\parser.c:650:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	testq	%r13, %r13	 ; var_scope
	je	.L159	 ;,
.L81:
 ; D:\TC\src\parser.c:652:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp319
	movq	(%r14), %rcx	 ; token_128->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:652:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp282
	jne	.L160	 ;,
 ; D:\TC\src\parser.c:683:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp322
	movq	(%r14), %rcx	 ; token_128->lexeme,
	movq	(%rax), %rdx	 ; L_BRACKET_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:683:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp299
	je	.L95	 ;,
 ; D:\TC\src\parser.c:684:             token = get_next_token(lexer, true);  // consume '['
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:685:             token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:686:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	136(%rsp), %rdx	 ; now_scope,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rsi, %r8	 ; parser,
 ; D:\TC\src\parser.c:685:             token = get_next_token(lexer, true);
	movq	%rax, %r14	 ; tmp300, token
 ; D:\TC\src\parser.c:686:             Expression* index = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %r15	 ; tmp301, index
 ; D:\TC\src\parser.c:687:             if (index == NULL)
	testq	%rax, %rax	 ; index
	jne	.L96	 ;,
 ; D:\TC\src\parser.c:688:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:688:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC16(%rip), %rcx	 ;, tmp238
 ; D:\TC\src\parser.c:688:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp302
 ; D:\TC\src\parser.c:688:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L96:
 ; D:\TC\src\parser.c:689:             token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_181->type
 ; D:\TC\src\parser.c:689:             token = get_next_token(lexer, true);
	movq	%rax, %r14	 ; tmp303, token
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	jne	.L98	 ;,
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp240
	movq	(%r14), %rcx	 ; token_181->lexeme,
	movq	(%rax), %rdx	 ; R_BRACKET_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp305
	je	.L98	 ;,
 ; D:\TC\src\parser.c:694:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	xorl	%edx, %edx	 ;
	movq	%r15, %r9	 ; index,
	xorl	%r8d, %r8d	 ;
	movl	$3, %ecx	 ;,
	movq	%rdx, 32(%rsp)	 ;,
	movq	%rbx, %rdx	 ; variable_value,
	call	create_variable_access	 ;
	movq	%rax, %rbx	 ; tmp306, variable_value
.L94:
 ; D:\TC\src\parser.c:716:         token = peek_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	peek_next_token	 ;
	movq	%rax, %r14	 ; tmp314, token
.L79:
 ; D:\TC\src\parser.c:644:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%r14)	 ;, token_128->type
	je	.L103	 ;,
	jmp	.L104	 ;
.L159:
 ; D:\TC\src\parser.c:650:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	testq	%r12, %r12	 ; current_type
	je	.L81	 ;,
 ; D:\TC\src\parser.c:650:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r12)	 ;, current_type_122->kind
	jne	.L81	 ;,
 ; D:\TC\src\parser.c:651:             var_scope = current_type->scope;
	movq	8(%r12), %r13	 ; current_type_122->scope, var_scope
	jmp	.L81	 ;
.L160:
 ; D:\TC\src\parser.c:653:             token = get_next_token(lexer, true);  // consume '('
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp283, token
 ; D:\TC\src\parser.c:654:             if (base_name == NULL)
	testq	%rdi, %rdi	 ; base_name
	jne	.L83	 ;,
 ; D:\TC\src\parser.c:655:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:655:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC12(%rip), %rcx	 ;, tmp229
 ; D:\TC\src\parser.c:655:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp284
	jmp	.L155	 ;
.L85:
 ; D:\TC\src\parser.c:660:             if (base_name != NULL && base_name->kind != SYMBOL_SUBROUTINE)
	cmpl	$1, 32(%rdi)	 ;, base_name_141->kind
	je	.L84	 ;,
 ; D:\TC\src\parser.c:661:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:661:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC13(%rip), %rcx	 ;, tmp231
 ; D:\TC\src\parser.c:661:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp287
.L155:
 ; D:\TC\src\parser.c:661:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L84	 ;
.L89:
 ; D:\TC\src\parser.c:670:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp320
	movq	(%r12), %rcx	 ; token_151->lexeme,
	movq	(%rax), %rdx	 ; COMMA_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:670:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	testb	%al, %al	 ; tmp294
	je	.L90	 ;,
 ; D:\TC\src\parser.c:671:                     token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp295, token
 ; D:\TC\src\parser.c:671:                     token = get_next_token(lexer, true);
	jmp	.L87	 ;
.L90:
 ; D:\TC\src\parser.c:672:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_151->type
	jne	.L92	 ;,
 ; D:\TC\src\parser.c:672:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp235
	movq	(%r12), %rcx	 ; token_151->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:672:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp296
	jne	.L87	 ;,
	jmp	.L92	 ;
.L158:
 ; D:\TC\src\parser.c:664:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp321
	movq	(%r12), %rcx	 ; token_150->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:664:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp297
	je	.L93	 ;,
 ; D:\TC\src\parser.c:677:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%r13, 32(%rsp)	 ; args,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rdx	 ; variable_value,
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:678:             base_name = base_name->type;
	movq	(%rdi), %rdi	 ; base_name_170->type, base_name
 ; D:\TC\src\parser.c:677:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%rax, %rbx	 ; tmp298, variable_value
 ; D:\TC\src\parser.c:681:             if (base_name->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rdi)	 ;, base_name_171->kind
	jne	.L109	 ;,
 ; D:\TC\src\parser.c:682:                 var_scope = base_name->scope;
	movq	8(%rdi), %r13	 ; base_name_171->scope, var_scope
	jmp	.L156	 ;
.L98:
 ; D:\TC\src\parser.c:691:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:691:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC17(%rip), %rcx	 ;, tmp239
 ; D:\TC\src\parser.c:691:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp304
	jmp	.L157	 ;
.L95:
 ; D:\TC\src\parser.c:695:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp323
	movq	(%r14), %rcx	 ; token_128->lexeme,
	movq	(%rax), %rdx	 ; DOT_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:695:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	 ; tmp307
	jne	.L99	 ;,
.L104:
 ; D:\TC\src\parser.c:622:         if (variable_value == NULL) {
	testq	%rbx, %rbx	 ; variable_value
	je	.L77	 ;,
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%edi, %edi	 ; expr_value
 ; D:\TC\src\parser.c:571:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:620:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %ebp	 ;, type
	jmp	.L58	 ;
.L99:
 ; D:\TC\src\parser.c:696:             token = get_next_token(lexer, true);  // consume '.'
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:697:             token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp308, token
 ; D:\TC\src\parser.c:698:             if (var_scope == NULL) {
	testq	%r13, %r13	 ; var_scope
	jne	.L100	 ;,
 ; D:\TC\src\parser.c:699:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:699:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC18(%rip), %rcx	 ;, tmp242
 ; D:\TC\src\parser.c:699:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp309
	jmp	.L157	 ;
.L100:
 ; D:\TC\src\parser.c:702:             if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_193->type
	je	.L101	 ;,
 ; D:\TC\src\parser.c:703:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:703:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC19(%rip), %rcx	 ;, tmp243
 ; D:\TC\src\parser.c:703:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp310
	jmp	.L157	 ;
.L101:
 ; D:\TC\src\parser.c:706:             base_name = search_name(var_scope, token->lexeme);
	movq	(%rax), %rdx	 ; token_193->lexeme,
	movq	%r13, %rcx	 ; var_scope,
	call	search_name	 ;
	movq	%rax, %rdi	 ; tmp311, base_name
 ; D:\TC\src\parser.c:707:             if (base_name == NULL) {
	testq	%rax, %rax	 ; base_name
	jne	.L102	 ;,
 ; D:\TC\src\parser.c:708:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:708:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC20(%rip), %rcx	 ;, tmp244
 ; D:\TC\src\parser.c:708:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp312
	jmp	.L157	 ;
.L102:
 ; D:\TC\src\parser.c:711:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	xorl	%eax, %eax	 ;
	movq	%rbx, %rdx	 ; variable_value,
	xorl	%r9d, %r9d	 ;
	movq	%rdi, %r8	 ; base_name,
	movq	%rax, 32(%rsp)	 ;,
	movl	$2, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, %rbx	 ; tmp313, variable_value
.L109:
 ; D:\TC\src\parser.c:680:             var_scope = NULL;
	xorl	%r13d, %r13d	 ; var_scope
.L156:
 ; D:\TC\src\parser.c:679:             current_type = NULL;
	xorl	%r12d, %r12d	 ; current_type
	jmp	.L94	 ;
.L77:
 ; D:\TC\src\parser.c:623:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:623:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC21(%rip), %rcx	 ;, tmp245
 ; D:\TC\src\parser.c:623:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp315
	jmp	.L154	 ;
.L74:
 ; D:\TC\src\parser.c:627:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:627:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC22(%rip), %rcx	 ;, tmp246
 ; D:\TC\src\parser.c:627:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp316
	jmp	.L154	 ;
.L56:
 ; D:\TC\src\parser.c:631: }
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
 ; D:\TC\src\parser.c:303: Statement* parse_statement(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
	movq	%rcx, 160(%rsp)	 ; tmp413, lexer
	movq	%rdx, 168(%rsp)	 ; tmp414, now_scope
 ; D:\TC\src\parser.c:305:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:307:     if (token->type == KEYWORD) {
	cmpl	$6, 24(%rax)	 ;, token_60->type
	jne	.L162	 ;,
	movq	%rax, %rsi	 ; tmp416, token
 ; D:\TC\src\parser.c:308:         if (string_equal(token->lexeme, IF_KEYWORD))
	movq	.refptr.IF_KEYWORD(%rip), %rax	 ;, tmp331
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; IF_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:308:         if (string_equal(token->lexeme, IF_KEYWORD))
	testb	%al, %al	 ; tmp417
	je	.L163	 ;,
 ; D:\TC\src\parser.c:348:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:349:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_114->type
 ; D:\TC\src\parser.c:348:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp418, token
 ; D:\TC\src\parser.c:349:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L164	 ;,
.L166:
 ; D:\TC\src\parser.c:350:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:350:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC23(%rip), %rcx	 ;, tmp332
 ; D:\TC\src\parser.c:350:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp419
	jmp	.L336	 ;
.L164:
 ; D:\TC\src\parser.c:349:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp553
	movq	(%rsi), %rcx	 ; token_114->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:349:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp420
	je	.L166	 ;,
 ; D:\TC\src\parser.c:353:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:354:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
 ; D:\TC\src\parser.c:353:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp421, token
 ; D:\TC\src\parser.c:354:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rdi	 ; tmp422, condition
 ; D:\TC\src\parser.c:355:     if (condition == NULL)
	testq	%rax, %rax	 ; condition
	jne	.L167	 ;,
 ; D:\TC\src\parser.c:356:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:356:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC24(%rip), %rcx	 ;, tmp334
 ; D:\TC\src\parser.c:356:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp423
 ; D:\TC\src\parser.c:356:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L167:
 ; D:\TC\src\parser.c:357:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:358:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_125->type
 ; D:\TC\src\parser.c:357:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp424, token
 ; D:\TC\src\parser.c:358:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L168	 ;,
.L169:
 ; D:\TC\src\parser.c:359:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:359:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC25(%rip), %rcx	 ;, tmp335
 ; D:\TC\src\parser.c:359:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp425
.L336:
 ; D:\TC\src\parser.c:359:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:351:         return NULL;
	xorl	%edx, %edx	 ; _222
	jmp	.L191	 ;
.L168:
 ; D:\TC\src\parser.c:358:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp554
	movq	(%rsi), %rcx	 ; token_125->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:358:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp426
	je	.L169	 ;,
 ; D:\TC\src\parser.c:362:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:363:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_132->type
 ; D:\TC\src\parser.c:362:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp427, token
 ; D:\TC\src\parser.c:363:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L170	 ;,
.L171:
 ; D:\TC\src\parser.c:364:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:364:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC26(%rip), %rcx	 ;, tmp337
 ; D:\TC\src\parser.c:364:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp428
	jmp	.L336	 ;
.L170:
 ; D:\TC\src\parser.c:363:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %r14	 ;, tmp338
	movq	(%rax), %rcx	 ; token_132->lexeme,
	movq	(%r14), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:363:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp429
	je	.L171	 ;,
 ; D:\TC\src\parser.c:367:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:368:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:372:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	leaq	.LC27(%rip), %rbp	 ;, tmp408
 ; D:\TC\src\parser.c:367:     list(Statement*) body = create_list();
	movq	%rax, 56(%rsp)	 ; tmp430, %sfp
 ; D:\TC\src\parser.c:368:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12	 ;, tmp407
 ; D:\TC\src\parser.c:368:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp431, token
.L172:
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_144->type
	je	.L342	 ;,
.L174:
 ; D:\TC\src\parser.c:370:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %r13	 ; tmp432, statement
 ; D:\TC\src\parser.c:371:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L173	 ;,
 ; D:\TC\src\parser.c:372:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:372:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%rbp, %rcx	 ; tmp408,
 ; D:\TC\src\parser.c:372:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp433
 ; D:\TC\src\parser.c:372:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L173:
 ; D:\TC\src\parser.c:373:         list_append(body, (pointer)statement);
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%r13, %rdx	 ; statement,
	call	list_append	 ;
 ; D:\TC\src\parser.c:374:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp434, token
	jmp	.L172	 ;
.L342:
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_BRACE_SYMBOL,
	movq	(%rsi), %rcx	 ; token_144->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp435
	je	.L174	 ;,
 ; D:\TC\src\parser.c:376:     list(ElseIf*) else_if = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:405:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	leaq	.LC32(%rip), %r15	 ;, tmp405
 ; D:\TC\src\parser.c:376:     list(ElseIf*) else_if = create_list();
	movq	%rax, 64(%rsp)	 ; tmp436, %sfp
 ; D:\TC\src\parser.c:377:     list(Statement*) else_body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:378:     token = peek_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:377:     list(Statement*) else_body = create_list();
	movq	%rax, 72(%rsp)	 ; tmp437, %sfp
 ; D:\TC\src\parser.c:378:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
	movq	%rax, %rsi	 ; tmp438, token
.L175:
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rsi)	 ;, token_194->type
	jne	.L187	 ;,
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	movq	.refptr.ELIF_KEYWORD(%rip), %rax	 ;, tmp558
	movq	(%rsi), %rcx	 ; token_194->lexeme,
	movq	(%rax), %rdx	 ; ELIF_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	 ; tmp459
	je	.L343	 ;,
 ; D:\TC\src\parser.c:380:         token = get_next_token(lexer, true);  // consume 'elif'
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:381:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:382:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_153->type
 ; D:\TC\src\parser.c:381:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp439, token
 ; D:\TC\src\parser.c:382:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L176	 ;,
.L177:
 ; D:\TC\src\parser.c:383:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:383:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC28(%rip), %rcx	 ;, tmp341
 ; D:\TC\src\parser.c:383:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp440
	jmp	.L336	 ;
.L176:
 ; D:\TC\src\parser.c:382:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp555
	movq	(%rsi), %rcx	 ; token_153->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:382:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp441
	je	.L177	 ;,
 ; D:\TC\src\parser.c:386:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:387:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
 ; D:\TC\src\parser.c:386:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp442, token
 ; D:\TC\src\parser.c:387:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %r12	 ; tmp443, elif_condition
 ; D:\TC\src\parser.c:388:         if (elif_condition == NULL)
	testq	%rax, %rax	 ; elif_condition
	jne	.L178	 ;,
 ; D:\TC\src\parser.c:389:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:389:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC29(%rip), %rcx	 ;, tmp343
 ; D:\TC\src\parser.c:389:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp444
 ; D:\TC\src\parser.c:389:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L178:
 ; D:\TC\src\parser.c:390:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:391:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_165->type
 ; D:\TC\src\parser.c:390:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp445, token
 ; D:\TC\src\parser.c:391:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L179	 ;,
.L180:
 ; D:\TC\src\parser.c:392:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:392:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC30(%rip), %rcx	 ;, tmp344
 ; D:\TC\src\parser.c:392:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp446
	jmp	.L336	 ;
.L179:
 ; D:\TC\src\parser.c:391:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp556
	movq	(%rsi), %rcx	 ; token_165->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:391:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp447
	je	.L180	 ;,
 ; D:\TC\src\parser.c:395:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:396:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_173->type
 ; D:\TC\src\parser.c:395:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp448, token
 ; D:\TC\src\parser.c:396:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L181	 ;,
.L182:
 ; D:\TC\src\parser.c:397:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:397:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC31(%rip), %rcx	 ;, tmp346
 ; D:\TC\src\parser.c:397:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp449
	jmp	.L336	 ;
.L181:
 ; D:\TC\src\parser.c:396:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; L_BRACE_SYMBOL,
	movq	(%rax), %rcx	 ; token_173->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:396:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp450
	je	.L182	 ;,
 ; D:\TC\src\parser.c:400:         list(Statement*) elif_body = create_list();
	call	create_list	 ;
	movq	%rax, %r13	 ; tmp451, elif_body
.L335:
 ; D:\TC\src\parser.c:407:             token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_186->type
 ; D:\TC\src\parser.c:407:             token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp455, token
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	je	.L344	 ;,
.L185:
 ; D:\TC\src\parser.c:403:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %rbp	 ; tmp453, statement
 ; D:\TC\src\parser.c:404:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L184	 ;,
 ; D:\TC\src\parser.c:405:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:405:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r15, %rcx	 ; tmp405,
 ; D:\TC\src\parser.c:405:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp454
 ; D:\TC\src\parser.c:405:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L184:
 ; D:\TC\src\parser.c:406:             list_append(elif_body, (pointer)statement);
	movq	%rbp, %rdx	 ; statement,
	movq	%r13, %rcx	 ; elif_body,
	call	list_append	 ;
	jmp	.L335	 ;
.L344:
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp557
	movq	(%rsi), %rcx	 ; token_186->lexeme,
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp456
	je	.L185	 ;,
 ; D:\TC\src\parser.c:409:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%r13, %rdx	 ; elif_body,
	movq	%r12, %rcx	 ; elif_condition,
	call	create_else_if	 ;
 ; D:\TC\src\parser.c:409:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	64(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:409:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%rax, %rdx	 ; tmp457, _192
 ; D:\TC\src\parser.c:409:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	call	list_append	 ;
 ; D:\TC\src\parser.c:410:         token = peek_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	peek_next_token	 ;
	movq	%rax, %rsi	 ; tmp458, token
	jmp	.L175	 ;
.L343:
 ; D:\TC\src\parser.c:412:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, 24(%rsi)	 ;, token_194->type
	jne	.L187	 ;,
 ; D:\TC\src\parser.c:412:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	movq	.refptr.ELSE_KEYWORD(%rip), %rax	 ;, tmp351
	movq	(%rsi), %rcx	 ; token_194->lexeme,
	movq	(%rax), %rdx	 ; ELSE_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:412:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	 ; tmp461
	jne	.L345	 ;,
.L187:
 ; D:\TC\src\parser.c:428:     token = peek_current_token(lexer);
	movq	160(%rsp), %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:429:     return create_if(condition, body, else_if, else_body);
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	72(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rcx	 ; condition,
	movq	64(%rsp), %r8	 ; %sfp,
	call	create_if	 ;
	movq	%rax, %rdx	 ; tmp460, _222
	jmp	.L191	 ;
.L345:
 ; D:\TC\src\parser.c:413:         token = get_next_token(lexer, true);  // consume 'else'
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:414:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:415:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_204->type
 ; D:\TC\src\parser.c:414:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp462, token
 ; D:\TC\src\parser.c:415:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L192	 ;,
.L193:
 ; D:\TC\src\parser.c:416:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:416:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC33(%rip), %rcx	 ;, tmp352
 ; D:\TC\src\parser.c:416:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp463
	jmp	.L336	 ;
.L192:
 ; D:\TC\src\parser.c:415:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; L_BRACE_SYMBOL,
	movq	(%rax), %rcx	 ; token_204->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:415:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp464
	je	.L193	 ;,
 ; D:\TC\src\parser.c:419:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:423:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	leaq	.LC34(%rip), %r12	 ;, tmp401
 ; D:\TC\src\parser.c:419:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r13	 ;, tmp400
 ; D:\TC\src\parser.c:419:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp465, token
.L194:
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_215->type
	je	.L346	 ;,
.L196:
 ; D:\TC\src\parser.c:421:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %r14	 ; tmp466, statement
 ; D:\TC\src\parser.c:422:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L195	 ;,
 ; D:\TC\src\parser.c:423:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:423:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r12, %rcx	 ; tmp401,
 ; D:\TC\src\parser.c:423:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp467
 ; D:\TC\src\parser.c:423:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L195:
 ; D:\TC\src\parser.c:424:             list_append(else_body, (pointer)statement);
	movq	72(%rsp), %rcx	 ; %sfp,
	movq	%r14, %rdx	 ; statement,
	call	list_append	 ;
 ; D:\TC\src\parser.c:425:             token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp468, token
	jmp	.L194	 ;
.L346:
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%r13), %rdx	 ; R_BRACE_SYMBOL,
	movq	(%rsi), %rcx	 ; token_215->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp469
	je	.L196	 ;,
	jmp	.L187	 ;
.L191:
 ; D:\TC\src\parser.c:309:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	xorl	%edi, %edi	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$2, %ecx	 ;,
	movq	%rdi, 40(%rsp)	 ;,
	movq	%rdi, 32(%rsp)	 ;,
	jmp	.L341	 ;
.L163:
 ; D:\TC\src\parser.c:310:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	movq	.refptr.FOR_KEYWORD(%rip), %rax	 ;, tmp356
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; FOR_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:310:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	testb	%al, %al	 ; tmp471
	je	.L198	 ;,
 ; D:\TC\src\parser.c:433:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:434:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_223->type
 ; D:\TC\src\parser.c:433:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp472, token
 ; D:\TC\src\parser.c:434:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L199	 ;,
.L201:
 ; D:\TC\src\parser.c:435:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:435:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC35(%rip), %rcx	 ;, tmp357
 ; D:\TC\src\parser.c:435:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp473
	jmp	.L337	 ;
.L199:
 ; D:\TC\src\parser.c:434:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp358
	movq	(%rsi), %rcx	 ; token_223->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:434:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp474
	je	.L201	 ;,
 ; D:\TC\src\parser.c:438:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_230->type
 ; D:\TC\src\parser.c:438:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp475, token
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	je	.L202	 ;,
.L205:
 ; D:\TC\src\parser.c:441:         initializer = parse_variable(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_variable	 ;
	movq	%rax, %rdi	 ; tmp476, initializer
 ; D:\TC\src\parser.c:442:         if (initializer == NULL)
	testq	%rax, %rax	 ; initializer
	jne	.L204	 ;,
 ; D:\TC\src\parser.c:443:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:443:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC36(%rip), %rcx	 ;, tmp360
 ; D:\TC\src\parser.c:443:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp478
 ; D:\TC\src\parser.c:443:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L204	 ;
.L202:
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp359
	movq	(%rsi), %rcx	 ; token_230->lexeme,
 ; D:\TC\src\parser.c:439:     Variable* initializer = NULL;
	xorl	%edi, %edi	 ; initializer
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp477
	jne	.L206	 ;,
	jmp	.L205	 ;
.L204:
 ; D:\TC\src\parser.c:444:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp479, token
.L206:
 ; D:\TC\src\parser.c:446:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_239->type
	je	.L207	 ;,
.L209:
 ; D:\TC\src\parser.c:447:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:447:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC37(%rip), %rcx	 ;, tmp361
 ; D:\TC\src\parser.c:447:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp480
.L337:
 ; D:\TC\src\parser.c:447:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:436:         return NULL;
	xorl	%r9d, %r9d	 ; _300
	jmp	.L208	 ;
.L207:
 ; D:\TC\src\parser.c:446:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r12	 ;, tmp362
	movq	(%rsi), %rcx	 ; token_239->lexeme,
	movq	(%r12), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:446:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp481
	je	.L209	 ;,
 ; D:\TC\src\parser.c:450:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_246->type
 ; D:\TC\src\parser.c:450:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp482, token
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	je	.L210	 ;,
.L213:
 ; D:\TC\src\parser.c:453:         condition = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_expression	 ;
	movq	%rax, %rbp	 ; tmp483, condition
 ; D:\TC\src\parser.c:454:         if (condition == NULL)
	testq	%rax, %rax	 ; condition
	jne	.L212	 ;,
 ; D:\TC\src\parser.c:455:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:455:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC38(%rip), %rcx	 ;, tmp364
 ; D:\TC\src\parser.c:455:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp485
 ; D:\TC\src\parser.c:455:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L212	 ;
.L210:
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r12), %rdx	 ; SEMICOLON_SYMBOL,
	movq	(%rax), %rcx	 ; token_246->lexeme,
 ; D:\TC\src\parser.c:451:     Expression* condition = NULL;
	xorl	%ebp, %ebp	 ; condition
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	call	string_equal	 ;
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp484
	jne	.L214	 ;,
	jmp	.L213	 ;
.L212:
 ; D:\TC\src\parser.c:456:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp486, token
.L214:
 ; D:\TC\src\parser.c:458:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_255->type
	je	.L215	 ;,
.L216:
 ; D:\TC\src\parser.c:459:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:459:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC39(%rip), %rcx	 ;, tmp365
 ; D:\TC\src\parser.c:459:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp487
	jmp	.L337	 ;
.L215:
 ; D:\TC\src\parser.c:458:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r12), %rdx	 ; SEMICOLON_SYMBOL,
	movq	(%rsi), %rcx	 ; token_255->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:458:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp488
	je	.L216	 ;,
 ; D:\TC\src\parser.c:462:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:464:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_262->type
 ; D:\TC\src\parser.c:462:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp489, token
 ; D:\TC\src\parser.c:464:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L217	 ;,
.L220:
 ; D:\TC\src\parser.c:465:         increment = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_expression	 ;
	movq	%rax, %r12	 ; tmp490, increment
 ; D:\TC\src\parser.c:466:         if (increment == NULL)
	testq	%rax, %rax	 ; increment
	jne	.L219	 ;,
 ; D:\TC\src\parser.c:467:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:467:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC40(%rip), %rcx	 ;, tmp368
 ; D:\TC\src\parser.c:467:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp492
 ; D:\TC\src\parser.c:467:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L219	 ;
.L217:
 ; D:\TC\src\parser.c:464:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp367
	movq	(%rsi), %rcx	 ; token_262->lexeme,
 ; D:\TC\src\parser.c:463:     Expression* increment = NULL;
	xorl	%r12d, %r12d	 ; increment
 ; D:\TC\src\parser.c:464:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:464:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp491
	jne	.L221	 ;,
	jmp	.L220	 ;
.L219:
 ; D:\TC\src\parser.c:468:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp493, token
.L221:
 ; D:\TC\src\parser.c:470:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_271->type
	je	.L222	 ;,
.L223:
 ; D:\TC\src\parser.c:471:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:471:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC41(%rip), %rcx	 ;, tmp369
 ; D:\TC\src\parser.c:471:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp494
	jmp	.L337	 ;
.L222:
 ; D:\TC\src\parser.c:470:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp370
	movq	(%rsi), %rcx	 ; token_271->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:470:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp495
	je	.L223	 ;,
 ; D:\TC\src\parser.c:474:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:475:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_278->type
 ; D:\TC\src\parser.c:474:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp496, token
 ; D:\TC\src\parser.c:475:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L224	 ;,
.L225:
 ; D:\TC\src\parser.c:476:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:476:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC42(%rip), %rcx	 ;, tmp371
 ; D:\TC\src\parser.c:476:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp497
	jmp	.L337	 ;
.L224:
 ; D:\TC\src\parser.c:475:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp372
	movq	(%rsi), %rcx	 ; token_278->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:475:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp498
	je	.L225	 ;,
 ; D:\TC\src\parser.c:479:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:480:     parser->in_loop = true;
	movb	$1, 10(%rbx)	 ;, parser_62(D)->in_loop
 ; D:\TC\src\parser.c:481:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:479:     list(Statement*) body = create_list();
	movq	%rax, %r13	 ; tmp499, body
 ; D:\TC\src\parser.c:485:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	leaq	.LC43(%rip), %r14	 ;, tmp410
 ; D:\TC\src\parser.c:481:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp500, token
.L226:
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_290->type
	je	.L347	 ;,
.L228:
 ; D:\TC\src\parser.c:483:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %r15	 ; tmp501, statement
 ; D:\TC\src\parser.c:484:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L227	 ;,
 ; D:\TC\src\parser.c:485:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:485:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r14, %rcx	 ; tmp410,
 ; D:\TC\src\parser.c:485:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp502
 ; D:\TC\src\parser.c:485:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L227:
 ; D:\TC\src\parser.c:486:         list_append(body, (pointer)statement);
	movq	%r15, %rdx	 ; statement,
	movq	%r13, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:487:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp503, token
	jmp	.L226	 ;
.L347:
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp559
	movq	(%rsi), %rcx	 ; token_290->lexeme,
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp504
	je	.L228	 ;,
 ; D:\TC\src\parser.c:489:     parser->in_loop = false;
	movb	$0, 10(%rbx)	 ;, parser_62(D)->in_loop
 ; D:\TC\src\parser.c:490:     return create_for(initializer, condition, increment, body);
	movq	%r13, %r9	 ; body,
	movq	%r12, %r8	 ; increment,
	movq	%rbp, %rdx	 ; condition,
	movq	%rdi, %rcx	 ; initializer,
	call	create_for	 ;
	movq	%rax, %r9	 ; tmp505, _300
.L208:
 ; D:\TC\src\parser.c:311:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	xorl	%esi, %esi	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$4, %ecx	 ;,
	movq	%rsi, 40(%rsp)	 ;,
	movq	%rsi, 32(%rsp)	 ;,
.L341:
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp506, <retval>
 ; D:\TC\src\parser.c:311:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L161	 ;
.L198:
 ; D:\TC\src\parser.c:312:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	movq	.refptr.WHILE_KEYWORD(%rip), %rax	 ;, tmp375
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; WHILE_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:312:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	testb	%al, %al	 ; tmp507
	je	.L229	 ;,
 ; D:\TC\src\parser.c:494:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:495:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_301->type
 ; D:\TC\src\parser.c:494:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp508, token
 ; D:\TC\src\parser.c:495:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L230	 ;,
.L232:
 ; D:\TC\src\parser.c:496:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:496:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC44(%rip), %rcx	 ;, tmp376
 ; D:\TC\src\parser.c:496:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp509
	jmp	.L338	 ;
.L230:
 ; D:\TC\src\parser.c:495:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp377
	movq	(%rsi), %rcx	 ; token_301->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:495:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp510
	je	.L232	 ;,
 ; D:\TC\src\parser.c:499:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:500:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
 ; D:\TC\src\parser.c:499:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp511, token
 ; D:\TC\src\parser.c:500:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rdi	 ; tmp512, condition
 ; D:\TC\src\parser.c:501:     if (condition == NULL)
	testq	%rax, %rax	 ; condition
	jne	.L233	 ;,
 ; D:\TC\src\parser.c:502:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:502:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC45(%rip), %rcx	 ;, tmp378
 ; D:\TC\src\parser.c:502:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp513
 ; D:\TC\src\parser.c:502:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L233:
 ; D:\TC\src\parser.c:503:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:504:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_312->type
 ; D:\TC\src\parser.c:503:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp514, token
 ; D:\TC\src\parser.c:504:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L234	 ;,
.L236:
 ; D:\TC\src\parser.c:505:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:505:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC46(%rip), %rcx	 ;, tmp379
 ; D:\TC\src\parser.c:505:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp515
.L338:
 ; D:\TC\src\parser.c:505:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:497:         return NULL;
	xorl	%r8d, %r8d	 ; _338
	jmp	.L235	 ;
.L234:
 ; D:\TC\src\parser.c:504:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp380
	movq	(%rsi), %rcx	 ; token_312->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:504:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp516
	je	.L236	 ;,
 ; D:\TC\src\parser.c:508:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:509:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_319->type
 ; D:\TC\src\parser.c:508:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp517, token
 ; D:\TC\src\parser.c:509:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L237	 ;,
.L238:
 ; D:\TC\src\parser.c:510:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:510:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC47(%rip), %rcx	 ;, tmp381
 ; D:\TC\src\parser.c:510:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp518
	jmp	.L338	 ;
.L237:
 ; D:\TC\src\parser.c:509:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp382
	movq	(%rsi), %rcx	 ; token_319->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:509:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp519
	je	.L238	 ;,
 ; D:\TC\src\parser.c:513:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:514:     parser->in_loop = true;
	movb	$1, 10(%rbx)	 ;, parser_62(D)->in_loop
 ; D:\TC\src\parser.c:515:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:513:     list(Statement*) body = create_list();
	movq	%rax, %rbp	 ; tmp520, body
 ; D:\TC\src\parser.c:519:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	leaq	.LC48(%rip), %r13	 ;, tmp412
 ; D:\TC\src\parser.c:515:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12	 ;, tmp411
 ; D:\TC\src\parser.c:515:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp521, token
.L239:
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_331->type
	je	.L348	 ;,
.L241:
 ; D:\TC\src\parser.c:517:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %r14	 ; tmp522, statement
 ; D:\TC\src\parser.c:518:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L240	 ;,
 ; D:\TC\src\parser.c:519:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:519:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r13, %rcx	 ; tmp412,
 ; D:\TC\src\parser.c:519:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp523
 ; D:\TC\src\parser.c:519:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L240:
 ; D:\TC\src\parser.c:520:         list_append(body, (pointer)statement);
	movq	%r14, %rdx	 ; statement,
	movq	%rbp, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:521:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp524, token
	jmp	.L239	 ;
.L348:
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_BRACE_SYMBOL,
	movq	(%rsi), %rcx	 ; token_331->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp525
	je	.L241	 ;,
 ; D:\TC\src\parser.c:523:     parser->in_loop = false;
	movb	$0, 10(%rbx)	 ;, parser_62(D)->in_loop
 ; D:\TC\src\parser.c:524:     return create_while(condition, body);
	movq	%rbp, %rdx	 ; body,
	movq	%rdi, %rcx	 ; condition,
	call	create_while	 ;
	movq	%rax, %r8	 ; tmp526, _338
.L235:
 ; D:\TC\src\parser.c:313:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	xorl	%ebx, %ebx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$3, %ecx	 ;,
	movq	%rbx, 40(%rsp)	 ;,
	movq	%rbx, 32(%rsp)	 ;,
	jmp	.L341	 ;
.L229:
 ; D:\TC\src\parser.c:314:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp385
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; VAR_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:314:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; tmp528
	je	.L242	 ;,
 ; D:\TC\src\parser.c:315:             get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:316:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:316:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	xorl	%r11d, %r11d	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rax, 40(%rsp)	 ; tmp529,
	xorl	%edx, %edx	 ;
	movl	$1, %ecx	 ;,
	movq	%r11, 32(%rsp)	 ;,
	jmp	.L340	 ;
.L242:
 ; D:\TC\src\parser.c:317:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	movq	.refptr.RETURN_KEYWORD(%rip), %rax	 ;, tmp386
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; RETURN_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:317:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	 ; tmp531
	je	.L244	 ;,
 ; D:\TC\src\parser.c:318:             token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:319:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_85->type
	jne	.L245	 ;,
 ; D:\TC\src\parser.c:319:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rdx	 ;, tmp387
	movq	(%rax), %rcx	 ; token_85->lexeme,
	movq	(%rdx), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:319:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp533
	je	.L245	 ;,
 ; D:\TC\src\parser.c:320:                 return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r10d, %r10d	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%r10, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	movq	%r10, 32(%rsp)	 ;,
	jmp	.L341	 ;
.L245:
 ; D:\TC\src\parser.c:321:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:321:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%r9, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	xorl	%r9d, %r9d	 ;
	movq	%rax, 32(%rsp)	 ; tmp535,
	jmp	.L340	 ;
.L244:
 ; D:\TC\src\parser.c:322:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	movq	.refptr.BREAK_KEYWORD(%rip), %rax	 ;, tmp388
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; BREAK_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:322:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	 ; tmp537
	je	.L246	 ;,
 ; D:\TC\src\parser.c:323:             if (!parser->in_loop) {
	cmpb	$0, 10(%rbx)	 ;, parser_62(D)->in_loop
	jne	.L247	 ;,
 ; D:\TC\src\parser.c:324:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:324:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC49(%rip), %rcx	 ;, tmp389
 ; D:\TC\src\parser.c:324:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp538
	jmp	.L339	 ;
.L247:
 ; D:\TC\src\parser.c:327:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r8d, %r8d	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$6, %ecx	 ;,
	movq	%r8, 40(%rsp)	 ;,
	movq	%r8, 32(%rsp)	 ;,
	xorl	%r8d, %r8d	 ;
	jmp	.L340	 ;
.L246:
 ; D:\TC\src\parser.c:328:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax	 ;, tmp390
	movq	(%rsi), %rcx	 ; token_60->lexeme,
	movq	(%rax), %rdx	 ; CONTINUE_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:328:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	 ; tmp540
	je	.L162	 ;,
 ; D:\TC\src\parser.c:329:             if (!parser->in_loop) {
	cmpb	$0, 10(%rbx)	 ;, parser_62(D)->in_loop
	jne	.L250	 ;,
 ; D:\TC\src\parser.c:330:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:330:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC50(%rip), %rcx	 ;, tmp391
 ; D:\TC\src\parser.c:330:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp541
.L339:
 ; D:\TC\src\parser.c:330:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:325:                 return NULL;
	xorl	%esi, %esi	 ; <retval>
	jmp	.L161	 ;
.L250:
 ; D:\TC\src\parser.c:333:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%ecx, %ecx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rcx, 40(%rsp)	 ;,
	movq	%rcx, 32(%rsp)	 ;,
	movl	$7, %ecx	 ;,
	jmp	.L340	 ;
.L162:
 ; D:\TC\src\parser.c:337:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:337:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rax, 32(%rsp)	 ; tmp545,
	xorl	%ecx, %ecx	 ;
	movq	%rdx, 40(%rsp)	 ;,
	xorl	%edx, %edx	 ;
.L340:
	call	create_statement	 ;
 ; D:\TC\src\parser.c:338:     token = peek_current_token(lexer);
	movq	160(%rsp), %rcx	 ; lexer,
 ; D:\TC\src\parser.c:337:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rax, %rsi	 ; tmp546, <retval>
 ; D:\TC\src\parser.c:338:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rdi	 ; tmp547, token
 ; D:\TC\src\parser.c:339:     if (statement == NULL)
	testq	%rsi, %rsi	 ; <retval>
	jne	.L251	 ;,
 ; D:\TC\src\parser.c:340:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:340:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC51(%rip), %rcx	 ;, tmp392
 ; D:\TC\src\parser.c:340:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp548
 ; D:\TC\src\parser.c:340:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L251:
 ; D:\TC\src\parser.c:341:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:342:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_110->type
 ; D:\TC\src\parser.c:341:     token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp549, token
 ; D:\TC\src\parser.c:342:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	je	.L252	 ;,
.L254:
 ; D:\TC\src\parser.c:343:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:343:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC52(%rip), %rcx	 ;, tmp393
 ; D:\TC\src\parser.c:343:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp550
 ; D:\TC\src\parser.c:343:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L161	 ;
.L252:
 ; D:\TC\src\parser.c:342:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp394
	movq	(%rdi), %rcx	 ; token_110->lexeme,
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:342:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp551
	je	.L254	 ;,
.L161:
 ; D:\TC\src\parser.c:345: }
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
	.ascii "Expected ';' after class variable declaration\0"
.LC86:
	.ascii "Unexpected token in class member\0"
.LC87:
	.ascii "Constructor name conflicts with existing member\0"
.LC88:
	.ascii "Failed to parse class declaration\0"
.LC89:
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
	movq	%rdx, %rdi	 ; tmp471, now_scope
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%r8, %rbx	 ; tmp472, parser
	subq	$136, %rsp	 ;,
 ; D:\TC\src\parser.c:21:     if (builtin_scope == NULL) {
	movq	.refptr.builtin_scope(%rip), %rsi	 ;, tmp358
 ; D:\TC\src\parser.c:20: Code* parse_code(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
	movq	%rcx, 56(%rsp)	 ; tmp470, %sfp
 ; D:\TC\src\parser.c:21:     if (builtin_scope == NULL) {
	cmpq	$0, (%rsi)	 ;, builtin_scope
	jne	.L350	 ;,
 ; D:\TC\src\parser.c:22:         builtin_scope = create_symbol_table(NULL);
	xorl	%ecx, %ecx	 ;
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:23:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	xorl	%r8d, %r8d	 ;
	movl	$5, %edx	 ;,
 ; D:\TC\src\parser.c:22:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, %r9	 ; tmp473, _2
 ; D:\TC\src\parser.c:22:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, (%rsi)	 ; _2, builtin_scope
 ; D:\TC\src\parser.c:23:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp360
	movq	(%rax), %rcx	 ; VOID_KEYWORD,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:23:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp361
 ; D:\TC\src\parser.c:24:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:23:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp474, name_void
 ; D:\TC\src\parser.c:24:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp363
	movl	$5, %edx	 ;,
	movq	(%rax), %rcx	 ; INT_KEYWORD,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:24:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp364
 ; D:\TC\src\parser.c:25:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:24:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp475, name_int
 ; D:\TC\src\parser.c:25:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp366
	movl	$5, %edx	 ;,
	movq	(%rax), %rcx	 ; FLOAT_KEYWORD,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:25:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp367
 ; D:\TC\src\parser.c:26:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:25:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp476, name_float
 ; D:\TC\src\parser.c:26:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp369
	movl	$5, %edx	 ;,
	movq	(%rax), %rcx	 ; STRING_KEYWORD,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:26:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp370
 ; D:\TC\src\parser.c:27:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:26:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp477, name_string
 ; D:\TC\src\parser.c:27:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp372
	movl	$5, %edx	 ;,
	movq	(%rax), %rcx	 ; BOOL_KEYWORD,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:27:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp373
	movq	%rax, (%rdx)	 ; tmp478, name_bool
.L350:
 ; D:\TC\src\parser.c:29:     if (now_scope == NULL)
	testq	%rdi, %rdi	 ; now_scope
	jne	.L351	 ;,
 ; D:\TC\src\parser.c:30:         now_scope = builtin_scope;
	movq	(%rsi), %rdi	 ; builtin_scope, now_scope
.L351:
 ; D:\TC\src\parser.c:32:     list(CodeMember*) members = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:33:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	%rdi, %rcx	 ; now_scope,
 ; D:\TC\src\parser.c:32:     list(CodeMember*) members = create_list();
	movq	%rax, 80(%rsp)	 ; tmp479, %sfp
 ; D:\TC\src\parser.c:33:     SymbolTable* global_scope = create_symbol_table(now_scope);
	call	create_symbol_table	 ;
	movq	%rax, 72(%rsp)	 ; tmp480, %sfp
.L365:
 ; D:\TC\src\parser.c:53:         token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp607, token
 ; D:\TC\src\parser.c:35:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L442	 ;,
 ; D:\TC\src\parser.c:35:     while (token != NULL && token->type != EOF_TOKEN) {
	movl	24(%rax), %eax	 ; token_41->type, _39
 ; D:\TC\src\parser.c:35:     while (token != NULL && token->type != EOF_TOKEN) {
	testl	%eax, %eax	 ; _39
	je	.L442	 ;,
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	 ;, _39
	jne	.L394	 ;,
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax	 ;, tmp610
	movq	0(%r13), %rcx	 ; token_41->lexeme,
	movq	(%rax), %rdx	 ; IMPORT_KEYWORD,
	call	string_equal	 ;
	movl	%eax, %edi	 ; tmp482, have_return
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	testb	%al, %al	 ; have_return
	je	.L354	 ;,
 ; D:\TC\src\parser.c:59:     token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:60:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_101->type
 ; D:\TC\src\parser.c:59:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp483, token
 ; D:\TC\src\parser.c:60:     if (token->type != IDENTIFIER) {
	je	.L355	 ;,
 ; D:\TC\src\parser.c:61:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:61:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC53(%rip), %rcx	 ;, tmp376
 ; D:\TC\src\parser.c:61:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp484
	jmp	.L518	 ;
.L355:
 ; D:\TC\src\parser.c:66:     token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:64:     string import_name = token->lexeme;
	movq	(%rax), %rdi	 ; token_101->lexeme, import_name
 ; D:\TC\src\parser.c:66:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_106->type
 ; D:\TC\src\parser.c:66:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp485, token
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	jne	.L357	 ;,
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	.refptr.FROM_KEYWORD(%rip), %rax	 ;, tmp377
	movq	0(%rbp), %rcx	 ; token_106->lexeme,
	movq	(%rax), %rdx	 ; FROM_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	testb	%al, %al	 ; tmp486
	jne	.L358	 ;,
.L357:
 ; D:\TC\src\parser.c:65:     string source = NULL;
	xorl	%esi, %esi	 ; source
	jmp	.L359	 ;
.L358:
 ; D:\TC\src\parser.c:68:         token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:69:         if (token->type != STRING) {
	cmpl	$4, 24(%rax)	 ;, token_111->type
 ; D:\TC\src\parser.c:68:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp487, token
 ; D:\TC\src\parser.c:69:         if (token->type != STRING) {
	je	.L360	 ;,
 ; D:\TC\src\parser.c:70:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:70:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC54(%rip), %rcx	 ;, tmp378
 ; D:\TC\src\parser.c:70:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp488
.L518:
 ; D:\TC\src\parser.c:70:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L356	 ;
.L360:
 ; D:\TC\src\parser.c:74:         token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:73:         source = token->lexeme;
	movq	(%rax), %rsi	 ; token_111->lexeme, source
 ; D:\TC\src\parser.c:74:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp489, token
.L359:
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_117->type
	je	.L361	 ;,
.L362:
 ; D:\TC\src\parser.c:77:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:77:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC55(%rip), %rcx	 ;, tmp379
 ; D:\TC\src\parser.c:77:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp490
	jmp	.L518	 ;
.L361:
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp380
	movq	0(%rbp), %rcx	 ; token_117->lexeme,
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp491
	je	.L362	 ;,
 ; D:\TC\src\parser.c:81:     name = parse_import_file(import_name, source, now_scope, parser->source_file);
	movq	(%rbx), %r9	 ; parser_74(D)->source_file,
	movq	72(%rsp), %r8	 ; %sfp,
	movq	%rsi, %rdx	 ; source,
	movq	%rdi, %rcx	 ; import_name,
	call	parse_import_file	 ;
 ; D:\TC\src\parser.c:82:     if (name == NULL) {
	testq	%rax, %rax	 ; name
	jne	.L363	 ;,
 ; D:\TC\src\parser.c:83:         fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
	call	__getreent	 ;
 ; D:\TC\src\parser.c:83:         fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
	movq	%rsi, %r9	 ; source,
	movq	%rdi, %r8	 ; import_name,
	leaq	.LC56(%rip), %rdx	 ;, tmp382
	movq	24(%rax), %rcx	 ; _127->_stderr, _127->_stderr
	call	fprintf	 ;
 ; D:\TC\src\parser.c:84:         name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
	movq	.refptr.name_void(%rip), %rax	 ;, tmp383
	movq	72(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rcx	 ; import_name,
	movl	$2, %edx	 ;,
	movq	(%rax), %r8	 ; name_void,
	call	create_symbol	 ;
.L363:
 ; D:\TC\src\parser.c:86:     return create_import(name, source);
	movq	%rsi, %rdx	 ; source,
	movq	%rax, %rcx	 ; name,
	call	create_import	 ;
	movq	%rax, %rdx	 ; tmp495, _132
 ; D:\TC\src\parser.c:38:             if (import == NULL)
	testq	%rax, %rax	 ; _132
	jne	.L364	 ;,
.L356:
 ; D:\TC\src\parser.c:39:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:39:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC57(%rip), %rcx	 ;, tmp384
 ; D:\TC\src\parser.c:39:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp496
 ; D:\TC\src\parser.c:39:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _132
.L364:
 ; D:\TC\src\parser.c:40:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%ecx, %ecx	 ;
	jmp	.L525	 ;
.L354:
 ; D:\TC\src\parser.c:41:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	cmpl	$6, 24(%r13)	 ;, token_41->type
	jne	.L394	 ;,
 ; D:\TC\src\parser.c:41:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	.refptr.FUNC_KEYWORD(%rip), %rax	 ;, tmp611
	movq	0(%r13), %rcx	 ; token_41->lexeme,
	movq	(%rax), %rdx	 ; FUNC_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:41:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	testb	%al, %al	 ; tmp498
	je	.L366	 ;,
 ; D:\TC\src\parser.c:90:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:91:     token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:90:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	%rax, %r15	 ; tmp499, function_scope
 ; D:\TC\src\parser.c:91:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp500, token
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_135->type, _136
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _136
	je	.L367	 ;,
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _136
	je	.L368	 ;,
.L370:
 ; D:\TC\src\parser.c:93:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:93:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC58(%rip), %rcx	 ;, tmp386
 ; D:\TC\src\parser.c:93:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp501
	jmp	.L520	 ;
.L368:
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rsi), %rcx	 ; token_135->lexeme,
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp502
	je	.L370	 ;,
.L367:
 ; D:\TC\src\parser.c:96:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%rsi), %rdx	 ; token_135->lexeme,
	movq	72(%rsp), %rcx	 ; %sfp,
	call	search_name	 ;
	movq	%rax, %rbp	 ; tmp503, return_type
 ; D:\TC\src\parser.c:97:     if (return_type == NULL) {
	testq	%rax, %rax	 ; return_type
	jne	.L371	 ;,
 ; D:\TC\src\parser.c:98:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:98:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC59(%rip), %rcx	 ;, tmp387
 ; D:\TC\src\parser.c:98:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp504
	jmp	.L520	 ;
.L371:
 ; D:\TC\src\parser.c:101:     token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:102:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_145->type
 ; D:\TC\src\parser.c:101:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp505, token
 ; D:\TC\src\parser.c:102:     if (token->type != IDENTIFIER) {
	je	.L372	 ;,
 ; D:\TC\src\parser.c:103:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:103:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC60(%rip), %rcx	 ;, tmp388
 ; D:\TC\src\parser.c:103:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp506
.L520:
 ; D:\TC\src\parser.c:103:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L369	 ;
.L372:
 ; D:\TC\src\parser.c:106:     Symbol* name = create_symbol(token->lexeme, SYMBOL_SUBROUTINE, return_type, function_scope);
	movq	(%rax), %rcx	 ; token_145->lexeme,
	movq	%r15, %r9	 ; function_scope,
	movq	%rbp, %r8	 ; return_type,
	movl	$1, %edx	 ;,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:107:     token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:106:     Symbol* name = create_symbol(token->lexeme, SYMBOL_SUBROUTINE, return_type, function_scope);
	movq	%rax, 96(%rsp)	 ; tmp507, %sfp
 ; D:\TC\src\parser.c:107:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:108:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_151->type
 ; D:\TC\src\parser.c:107:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp508, token
 ; D:\TC\src\parser.c:108:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L373	 ;,
.L374:
 ; D:\TC\src\parser.c:109:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:109:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC61(%rip), %rcx	 ;, tmp389
 ; D:\TC\src\parser.c:109:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp509
	jmp	.L520	 ;
.L373:
 ; D:\TC\src\parser.c:108:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp390
	movq	(%rsi), %rcx	 ; token_151->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:108:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp510
	je	.L374	 ;,
 ; D:\TC\src\parser.c:112:     token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:119:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	leaq	.LC63(%rip), %r14	 ;, tmp456
 ; D:\TC\src\parser.c:117:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	leaq	.LC62(%rip), %r12	 ;, tmp457
 ; D:\TC\src\parser.c:112:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp511, token
 ; D:\TC\src\parser.c:113:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rax, 64(%rsp)	 ; tmp512, %sfp
.L375:
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_163->type
	je	.L526	 ;,
.L383:
 ; D:\TC\src\parser.c:115:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%r15, %rdx	 ; function_scope,
	movq	%rbx, %r8	 ; parser,
	call	parse_variable	 ;
	movq	%rax, %rdx	 ; tmp513, parameter
 ; D:\TC\src\parser.c:116:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L376	 ;,
 ; D:\TC\src\parser.c:117:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:117:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r12, %rcx	 ; tmp457,
 ; D:\TC\src\parser.c:117:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp514
	jmp	.L519	 ;
.L376:
 ; D:\TC\src\parser.c:118:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_160->value
	je	.L378	 ;,
 ; D:\TC\src\parser.c:119:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:119:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r14, %rcx	 ; tmp456,
 ; D:\TC\src\parser.c:119:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp515
.L519:
 ; D:\TC\src\parser.c:119:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L377	 ;
.L378:
 ; D:\TC\src\parser.c:121:             list_append(parameters, (pointer)parameter);
	movq	64(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
.L377:
 ; D:\TC\src\parser.c:122:         token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_167->type
 ; D:\TC\src\parser.c:122:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp516, token
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	je	.L379	 ;,
.L382:
 ; D:\TC\src\parser.c:126:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:126:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC64(%rip), %rcx	 ;, tmp393
 ; D:\TC\src\parser.c:126:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp517
	jmp	.L520	 ;
.L379:
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp394
	movq	(%rsi), %rcx	 ; token_167->lexeme,
	movq	(%rax), %rdx	 ; COMMA_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp518
	je	.L380	 ;,
 ; D:\TC\src\parser.c:124:             token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp519, token
 ; D:\TC\src\parser.c:124:             token = get_next_token(lexer, true);
	jmp	.L375	 ;
.L380:
 ; D:\TC\src\parser.c:125:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_167->type
	jne	.L382	 ;,
 ; D:\TC\src\parser.c:125:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp395
	movq	(%rsi), %rcx	 ; token_167->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:125:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp520
	jne	.L375	 ;,
	jmp	.L382	 ;
.L526:
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp612
	movq	(%rsi), %rcx	 ; token_163->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp521
	je	.L383	 ;,
 ; D:\TC\src\parser.c:130:     token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:131:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_184->type
 ; D:\TC\src\parser.c:130:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp522, token
 ; D:\TC\src\parser.c:131:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L384	 ;,
.L385:
 ; D:\TC\src\parser.c:132:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:132:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC65(%rip), %rcx	 ;, tmp397
 ; D:\TC\src\parser.c:132:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp523
	jmp	.L520	 ;
.L384:
 ; D:\TC\src\parser.c:131:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp398
	movq	(%rsi), %rcx	 ; token_184->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:131:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp524
	je	.L385	 ;,
 ; D:\TC\src\parser.c:135:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:136:     parser->in_function = true;
	movb	$1, 8(%rbx)	 ;, parser_74(D)->in_function
 ; D:\TC\src\parser.c:138:     token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:135:     list(Statement*) body = create_list();
	movq	%rax, 88(%rsp)	 ; tmp525, %sfp
 ; D:\TC\src\parser.c:144:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	leaq	.LC67(%rip), %r14	 ;, tmp453
 ; D:\TC\src\parser.c:138:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp526, token
.L386:
 ; D:\TC\src\parser.c:139:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_196->type
	je	.L527	 ;,
.L391:
 ; D:\TC\src\parser.c:140:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%rbx, %r8	 ; parser,
	movq	%r15, %rdx	 ; function_scope,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp527, statement
 ; D:\TC\src\parser.c:141:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L387	 ;,
 ; D:\TC\src\parser.c:142:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:142:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC66(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:142:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp528
 ; D:\TC\src\parser.c:142:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L390	 ;
.L387:
 ; D:\TC\src\parser.c:143:         else if (have_return)
	testb	%dil, %dil	 ; have_return
	je	.L389	 ;,
 ; D:\TC\src\parser.c:144:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:144:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r14, %rcx	 ; tmp453,
 ; D:\TC\src\parser.c:144:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp529
 ; D:\TC\src\parser.c:144:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L389:
 ; D:\TC\src\parser.c:146:             have_return = true;
	cmpl	$5, 8(%r12)	 ;, statement_193->type
	movb	$1, %al	 ;, tmp447
	cmove	%eax, %edi	 ; have_return,, tmp447, have_return
.L390:
 ; D:\TC\src\parser.c:147:         list_append(body, (pointer)statement);
	movq	88(%rsp), %rcx	 ; %sfp,
	movq	%r12, %rdx	 ; statement,
	call	list_append	 ;
 ; D:\TC\src\parser.c:148:         token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp530, token
	jmp	.L386	 ;
.L527:
 ; D:\TC\src\parser.c:139:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp613
	movq	(%rsi), %rcx	 ; token_196->lexeme,
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:139:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp531
	je	.L391	 ;,
 ; D:\TC\src\parser.c:150:     parser->in_function = false;
	movb	$0, 8(%rbx)	 ;, parser_74(D)->in_function
 ; D:\TC\src\parser.c:151:     if (!have_return && return_type != name_void)
	testb	%dil, %dil	 ; have_return
	jne	.L392	 ;,
 ; D:\TC\src\parser.c:151:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp402
 ; D:\TC\src\parser.c:151:     if (!have_return && return_type != name_void)
	cmpq	(%rax), %rbp	 ; name_void, return_type
	je	.L392	 ;,
 ; D:\TC\src\parser.c:152:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:152:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC68(%rip), %rcx	 ;, tmp403
 ; D:\TC\src\parser.c:152:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp532
 ; D:\TC\src\parser.c:152:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L392:
 ; D:\TC\src\parser.c:153:     return create_function(name, return_type, parameters, body, function_scope);
	movq	%r15, 32(%rsp)	 ; function_scope,
	movq	64(%rsp), %r8	 ; %sfp,
	movq	%rbp, %rdx	 ; return_type,
	movq	88(%rsp), %r9	 ; %sfp,
	movq	96(%rsp), %rcx	 ; %sfp,
	call	create_function	 ;
	movq	%rax, %r8	 ; tmp533, _211
 ; D:\TC\src\parser.c:43:             if (function == NULL)
	testq	%rax, %rax	 ; _211
	jne	.L393	 ;,
.L369:
 ; D:\TC\src\parser.c:44:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:44:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC69(%rip), %rcx	 ;, tmp404
 ; D:\TC\src\parser.c:44:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp534
 ; D:\TC\src\parser.c:44:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%r8d, %r8d	 ; _211
.L393:
 ; D:\TC\src\parser.c:45:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$1, %ecx	 ;,
	jmp	.L525	 ;
.L366:
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	cmpl	$6, 24(%r13)	 ;, token_41->type
	jne	.L394	 ;,
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	.refptr.CLASS_KEYWORD(%rip), %rax	 ;, tmp405
	movq	0(%r13), %rcx	 ; token_41->lexeme,
	movq	(%rax), %rdx	 ; CLASS_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	testb	%al, %al	 ; tmp536
	je	.L394	 ;,
 ; D:\TC\src\parser.c:232:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:233:     token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:232:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	%rax, 64(%rsp)	 ; tmp537, %sfp
 ; D:\TC\src\parser.c:233:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:234:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_216->type
 ; D:\TC\src\parser.c:233:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp538, token
 ; D:\TC\src\parser.c:234:     if (token->type != IDENTIFIER) {
	je	.L395	 ;,
 ; D:\TC\src\parser.c:235:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:235:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC70(%rip), %rcx	 ;, tmp406
 ; D:\TC\src\parser.c:235:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp539
	jmp	.L524	 ;
.L395:
 ; D:\TC\src\parser.c:238:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class_scope);
	movq	64(%rsp), %r9	 ; %sfp,
	movq	(%rax), %rcx	 ; token_216->lexeme,
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:239:     token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:238:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class_scope);
	movq	%rax, 88(%rsp)	 ; tmp540, %sfp
 ; D:\TC\src\parser.c:239:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:240:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_222->type
 ; D:\TC\src\parser.c:239:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp541, token
 ; D:\TC\src\parser.c:240:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L397	 ;,
.L398:
 ; D:\TC\src\parser.c:241:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:241:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC71(%rip), %rcx	 ;, tmp407
 ; D:\TC\src\parser.c:241:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp542
.L524:
 ; D:\TC\src\parser.c:241:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L396	 ;
.L397:
 ; D:\TC\src\parser.c:240:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp408
	movq	(%rsi), %rcx	 ; token_222->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:240:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp543
	je	.L398	 ;,
 ; D:\TC\src\parser.c:244:     list(ClassMember*) members = create_list();
	call	create_list	 ;
	movq	%rax, 96(%rsp)	 ; tmp544, %sfp
.L434:
 ; D:\TC\src\parser.c:263:         token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_231->type
 ; D:\TC\src\parser.c:263:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp598, token
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	je	.L528	 ;,
.L438:
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, 24(%rsi)	 ;, token_231->type
	jne	.L400	 ;,
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	.refptr.METHOD_KEYWORD(%rip), %rax	 ;, tmp614
	movq	(%rsi), %rcx	 ; token_231->lexeme,
	movq	(%rax), %rdx	 ; METHOD_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	testb	%al, %al	 ; tmp546
	je	.L401	 ;,
 ; D:\TC\src\parser.c:157:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:158:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	88(%rsp), %r8	 ; %sfp,
	movl	$2, %edx	 ;,
	movq	%rax, %r9	 ; method_scope,
 ; D:\TC\src\parser.c:157:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	%rax, %r15	 ; tmp547, method_scope
 ; D:\TC\src\parser.c:158:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp410
	movq	(%rax), %rcx	 ; SELF_KEYWORD,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:159:     token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:158:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	%rax, %rbp	 ; tmp548, self
 ; D:\TC\src\parser.c:159:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp549, token
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_278->type, _279
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _279
	je	.L402	 ;,
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _279
	je	.L403	 ;,
.L405:
 ; D:\TC\src\parser.c:161:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:161:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC72(%rip), %rcx	 ;, tmp411
 ; D:\TC\src\parser.c:161:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp550
	jmp	.L522	 ;
.L403:
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rdi), %rcx	 ; token_278->lexeme,
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp551
	je	.L405	 ;,
.L402:
 ; D:\TC\src\parser.c:164:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%rdi), %rdx	 ; token_278->lexeme,
	movq	64(%rsp), %rcx	 ; %sfp,
	call	search_name	 ;
	movq	%rax, %r14	 ; tmp552, return_type
 ; D:\TC\src\parser.c:165:     if (return_type == NULL) {
	testq	%rax, %rax	 ; return_type
	jne	.L406	 ;,
 ; D:\TC\src\parser.c:166:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:166:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC73(%rip), %rcx	 ;, tmp412
 ; D:\TC\src\parser.c:166:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp553
	jmp	.L522	 ;
.L406:
 ; D:\TC\src\parser.c:169:     token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:170:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_288->type
 ; D:\TC\src\parser.c:169:     token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp554, token
 ; D:\TC\src\parser.c:170:     if (token->type != IDENTIFIER) {
	je	.L407	 ;,
 ; D:\TC\src\parser.c:171:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:171:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC74(%rip), %rcx	 ;, tmp413
 ; D:\TC\src\parser.c:171:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp555
.L522:
 ; D:\TC\src\parser.c:171:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L404	 ;
.L407:
 ; D:\TC\src\parser.c:174:     Symbol* name = create_symbol(token->lexeme, SYMBOL_SUBROUTINE, return_type, method_scope);
	movq	(%rax), %rcx	 ; token_288->lexeme,
	movq	%r15, %r9	 ; method_scope,
	movq	%r14, %r8	 ; return_type,
	movl	$1, %edx	 ;,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:175:     token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:174:     Symbol* name = create_symbol(token->lexeme, SYMBOL_SUBROUTINE, return_type, method_scope);
	movq	%rax, 120(%rsp)	 ; tmp556, %sfp
 ; D:\TC\src\parser.c:175:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:176:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_294->type
 ; D:\TC\src\parser.c:175:     token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp557, token
 ; D:\TC\src\parser.c:176:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	je	.L408	 ;,
.L409:
 ; D:\TC\src\parser.c:177:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:177:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC75(%rip), %rcx	 ;, tmp414
 ; D:\TC\src\parser.c:177:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp558
	jmp	.L522	 ;
.L408:
 ; D:\TC\src\parser.c:176:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp415
	movq	(%rdi), %rcx	 ; token_294->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:176:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp559
	je	.L409	 ;,
 ; D:\TC\src\parser.c:180:     token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:181:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	cmpl	$6, 24(%rax)	 ;, token_301->type
 ; D:\TC\src\parser.c:180:     token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp560, token
 ; D:\TC\src\parser.c:181:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	je	.L410	 ;,
.L412:
 ; D:\TC\src\parser.c:182:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:182:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC76(%rip), %rcx	 ;, tmp416
 ; D:\TC\src\parser.c:182:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp561
 ; D:\TC\src\parser.c:182:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L411	 ;
.L410:
 ; D:\TC\src\parser.c:181:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp417
	movq	(%rdi), %rcx	 ; token_301->lexeme,
	movq	(%rax), %rdx	 ; SELF_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:181:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	testb	%al, %al	 ; tmp562
	je	.L412	 ;,
.L411:
 ; D:\TC\src\parser.c:183:     token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:198:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	leaq	.LC79(%rip), %r12	 ;, tmp463
 ; D:\TC\src\parser.c:183:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp563, token
 ; D:\TC\src\parser.c:184:     list(Variable*) parameters = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:185:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	88(%rsp), %rcx	 ; %sfp,
	movq	%rbp, %rdx	 ; self,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:184:     list(Variable*) parameters = create_list();
	movq	%rax, 104(%rsp)	 ; tmp564, %sfp
 ; D:\TC\src\parser.c:185:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	call	create_variable	 ;
 ; D:\TC\src\parser.c:185:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	104(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:185:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	%rax, %rdx	 ; tmp565, _310
 ; D:\TC\src\parser.c:185:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:186:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rbp	 ;, tmp461
.L413:
 ; D:\TC\src\parser.c:186:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rdi)	 ;, token_311->type
	je	.L529	 ;,
.L419:
 ; D:\TC\src\parser.c:191:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:191:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC77(%rip), %rcx	 ;, tmp419
 ; D:\TC\src\parser.c:191:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp569
	jmp	.L522	 ;
.L529:
 ; D:\TC\src\parser.c:186:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_PAREN_SYMBOL,
	movq	(%rdi), %rcx	 ; token_311->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:186:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp575
	jne	.L425	 ;,
 ; D:\TC\src\parser.c:187:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rdi)	 ;, token_311->type
	jne	.L419	 ;,
 ; D:\TC\src\parser.c:187:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp615
	movq	(%rdi), %rcx	 ; token_311->lexeme,
	movq	(%rax), %rdx	 ; COMMA_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:187:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp566
	je	.L415	 ;,
 ; D:\TC\src\parser.c:188:             token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:194:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%r15, %rdx	 ; method_scope,
	movq	%rbx, %r8	 ; parser,
 ; D:\TC\src\parser.c:188:             token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp567, token
 ; D:\TC\src\parser.c:194:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	call	parse_variable	 ;
	movq	%rax, %rdx	 ; tmp568, parameter
 ; D:\TC\src\parser.c:195:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L515	 ;,
 ; D:\TC\src\parser.c:196:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:196:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC78(%rip), %rcx	 ;, tmp421
 ; D:\TC\src\parser.c:196:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp572
	jmp	.L521	 ;
.L415:
 ; D:\TC\src\parser.c:189:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, 24(%rdi)	 ;, token_311->type
	jne	.L419	 ;,
 ; D:\TC\src\parser.c:189:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	0(%rbp), %rdx	 ; R_PAREN_SYMBOL,
	movq	(%rdi), %rcx	 ; token_311->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:189:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	testb	%al, %al	 ; tmp570
	je	.L419	 ;,
.L425:
 ; D:\TC\src\parser.c:203:     token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:204:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_335->type
 ; D:\TC\src\parser.c:203:     token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp571, token
 ; D:\TC\src\parser.c:204:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	je	.L516	 ;,
	jmp	.L420	 ;
.L515:
 ; D:\TC\src\parser.c:197:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_317->value
	je	.L423	 ;,
 ; D:\TC\src\parser.c:198:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:198:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	movq	%r12, %rcx	 ; tmp463,
 ; D:\TC\src\parser.c:198:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp573
.L521:
 ; D:\TC\src\parser.c:198:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L422	 ;
.L423:
 ; D:\TC\src\parser.c:200:             list_append(parameters, (pointer)parameter);
	movq	104(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
.L422:
 ; D:\TC\src\parser.c:201:         token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp574, token
	jmp	.L413	 ;
.L420:
 ; D:\TC\src\parser.c:205:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:205:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC80(%rip), %rcx	 ;, tmp424
 ; D:\TC\src\parser.c:205:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp576
	jmp	.L522	 ;
.L516:
 ; D:\TC\src\parser.c:204:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp425
	movq	(%rdi), %rcx	 ; token_335->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:204:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp577
	je	.L420	 ;,
 ; D:\TC\src\parser.c:208:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:209:     parser->in_function = true;
	movw	$257, 8(%rbx)	 ;, MEM <unsigned short> [(char *)parser_74(D) + 8B]
 ; D:\TC\src\parser.c:212:     token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:211:     bool have_return = false;
	xorl	%r12d, %r12d	 ; have_return
 ; D:\TC\src\parser.c:212:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:208:     list(Statement*) body = create_list();
	movq	%rax, 112(%rsp)	 ; tmp578, %sfp
 ; D:\TC\src\parser.c:212:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp579, token
.L426:
 ; D:\TC\src\parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rdi)	 ;, token_347->type
	je	.L530	 ;,
.L431:
 ; D:\TC\src\parser.c:214:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%rbx, %r8	 ; parser,
	movq	%r15, %rdx	 ; method_scope,
	call	parse_statement	 ;
	movq	%rax, %rbp	 ; tmp580, statement
 ; D:\TC\src\parser.c:215:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L427	 ;,
 ; D:\TC\src\parser.c:216:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:216:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC81(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:216:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp581
 ; D:\TC\src\parser.c:216:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L430	 ;
.L427:
 ; D:\TC\src\parser.c:217:         else if (have_return)
	testb	%r12b, %r12b	 ; have_return
	je	.L429	 ;,
 ; D:\TC\src\parser.c:218:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:218:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:218:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp582
 ; D:\TC\src\parser.c:218:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L429:
 ; D:\TC\src\parser.c:220:             have_return = true;
	cmpl	$5, 8(%rbp)	 ;, statement_344->type
	movb	$1, %al	 ;, tmp451
	cmove	%eax, %r12d	 ; have_return,, tmp451, have_return
.L430:
 ; D:\TC\src\parser.c:221:         list_append(body, (pointer)statement);
	movq	112(%rsp), %rcx	 ; %sfp,
	movq	%rbp, %rdx	 ; statement,
	call	list_append	 ;
 ; D:\TC\src\parser.c:222:         token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp583, token
	jmp	.L426	 ;
.L530:
 ; D:\TC\src\parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp616
	movq	(%rdi), %rcx	 ; token_347->lexeme,
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp584
	je	.L431	 ;,
 ; D:\TC\src\parser.c:224:     parser->in_function = false;
	movw	$0, 8(%rbx)	 ;, MEM <unsigned short> [(char *)parser_74(D) + 8B]
 ; D:\TC\src\parser.c:226:     if (!have_return && return_type != name_void)
	testb	%r12b, %r12b	 ; have_return
	jne	.L432	 ;,
 ; D:\TC\src\parser.c:226:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp429
 ; D:\TC\src\parser.c:226:     if (!have_return && return_type != name_void)
	cmpq	(%rax), %r14	 ; name_void, return_type
	je	.L432	 ;,
 ; D:\TC\src\parser.c:227:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:227:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC82(%rip), %rcx	 ;, tmp430
 ; D:\TC\src\parser.c:227:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp585
 ; D:\TC\src\parser.c:227:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L432:
 ; D:\TC\src\parser.c:228:     return create_method(name, return_type, parameters, body, method_scope);
	movq	%r15, 32(%rsp)	 ; method_scope,
	movq	112(%rsp), %r9	 ; %sfp,
	movq	%r14, %rdx	 ; return_type,
	movq	104(%rsp), %r8	 ; %sfp,
	movq	120(%rsp), %rcx	 ; %sfp,
	call	create_method	 ;
	movq	%rax, %rdx	 ; tmp586, _362
 ; D:\TC\src\parser.c:249:             if (method == NULL)
	testq	%rax, %rax	 ; _362
	jne	.L433	 ;,
.L404:
 ; D:\TC\src\parser.c:250:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:250:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC83(%rip), %rcx	 ;, tmp431
 ; D:\TC\src\parser.c:250:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp587
 ; D:\TC\src\parser.c:250:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _362
.L433:
 ; D:\TC\src\parser.c:251:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%ecx, %ecx	 ;
	xorl	%r8d, %r8d	 ;
	call	create_class_member	 ;
 ; D:\TC\src\parser.c:251:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	96(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:251:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rdx	 ; tmp588, _239
 ; D:\TC\src\parser.c:251:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	jmp	.L434	 ;
.L401:
 ; D:\TC\src\parser.c:252:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	cmpl	$6, 24(%rsi)	 ;, token_231->type
	jne	.L400	 ;,
 ; D:\TC\src\parser.c:252:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp432
	movq	(%rsi), %rcx	 ; token_231->lexeme,
	movq	(%rax), %rdx	 ; VAR_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:252:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; tmp589
	je	.L400	 ;,
 ; D:\TC\src\parser.c:253:             token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:254:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	64(%rsp), %rdx	 ; %sfp,
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%rbx, %r8	 ; parser,
 ; D:\TC\src\parser.c:253:             token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp590, token
 ; D:\TC\src\parser.c:254:             Variable* variable = parse_variable(lexer, class_scope, parser);
	call	parse_variable	 ;
	movq	%rax, %rdi	 ; tmp591, variable
 ; D:\TC\src\parser.c:255:             if (variable == NULL)
	testq	%rax, %rax	 ; variable
	jne	.L435	 ;,
 ; D:\TC\src\parser.c:256:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:256:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC84(%rip), %rcx	 ;, tmp433
 ; D:\TC\src\parser.c:256:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp592
 ; D:\TC\src\parser.c:256:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L435:
 ; D:\TC\src\parser.c:257:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	%rdi, %r8	 ; variable,
	xorl	%edx, %edx	 ;
	movl	$1, %ecx	 ;,
	call	create_class_member	 ;
 ; D:\TC\src\parser.c:257:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	96(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:257:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	%rax, %rdx	 ; tmp593, _248
 ; D:\TC\src\parser.c:257:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	call	list_append	 ;
 ; D:\TC\src\parser.c:258:             token = get_next_token(lexer, true);
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:259:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_249->type
 ; D:\TC\src\parser.c:258:             token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp594, token
 ; D:\TC\src\parser.c:259:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	je	.L436	 ;,
.L437:
 ; D:\TC\src\parser.c:260:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:260:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC85(%rip), %rcx	 ;, tmp434
 ; D:\TC\src\parser.c:260:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp595
	jmp	.L523	 ;
.L436:
 ; D:\TC\src\parser.c:259:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp435
	movq	(%rsi), %rcx	 ; token_249->lexeme,
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:259:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp596
	je	.L437	 ;,
	jmp	.L434	 ;
.L400:
 ; D:\TC\src\parser.c:262:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:262:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC86(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:262:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp597
.L523:
 ; D:\TC\src\parser.c:262:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L434	 ;
.L528:
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp617
	movq	(%rsi), %rcx	 ; token_231->lexeme,
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp599
	je	.L438	 ;,
 ; D:\TC\src\parser.c:265:     Symbol* constructor = search_name(class_scope, CONSTRUCTOR_NAME);
	movq	.refptr.CONSTRUCTOR_NAME(%rip), %rdi	 ;, tmp438
	movq	64(%rsp), %rcx	 ; %sfp,
	movq	(%rdi), %rdx	 ; CONSTRUCTOR_NAME,
	call	search_name	 ;
 ; D:\TC\src\parser.c:266:     if (constructor == NULL) {
	testq	%rax, %rax	 ; constructor
	jne	.L439	 ;,
 ; D:\TC\src\parser.c:267:         SymbolTable* constructor_scope = create_symbol_table(class_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:268:         constructor = create_symbol(CONSTRUCTOR_NAME, SYMBOL_SUBROUTINE, name, constructor_scope);
	movq	88(%rsp), %r8	 ; %sfp,
	movq	(%rdi), %rcx	 ; CONSTRUCTOR_NAME,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:267:         SymbolTable* constructor_scope = create_symbol_table(class_scope);
	movq	%rax, %r9	 ;, tmp601
 ; D:\TC\src\parser.c:268:         constructor = create_symbol(CONSTRUCTOR_NAME, SYMBOL_SUBROUTINE, name, constructor_scope);
	call	create_symbol	 ;
.L439:
 ; D:\TC\src\parser.c:270:     if (constructor->kind != SYMBOL_SUBROUTINE)
	cmpl	$1, 32(%rax)	 ;, constructor_268->kind
	je	.L440	 ;,
 ; D:\TC\src\parser.c:271:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:271:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC87(%rip), %rcx	 ;, tmp440
 ; D:\TC\src\parser.c:271:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp603
 ; D:\TC\src\parser.c:271:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L440:
 ; D:\TC\src\parser.c:272:     return create_class(name, members, class_scope);
	movq	64(%rsp), %r8	 ; %sfp,
	movq	96(%rsp), %rdx	 ; %sfp,
	movq	88(%rsp), %rcx	 ; %sfp,
	call	create_class	 ;
	movq	%rax, %r9	 ; tmp604, _273
 ; D:\TC\src\parser.c:48:             if (class_ == NULL)
	testq	%rax, %rax	 ; _273
	jne	.L441	 ;,
.L396:
 ; D:\TC\src\parser.c:49:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:49:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC88(%rip), %rcx	 ;, tmp441
 ; D:\TC\src\parser.c:49:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp605
 ; D:\TC\src\parser.c:49:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%r9d, %r9d	 ; _273
.L441:
 ; D:\TC\src\parser.c:50:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$2, %ecx	 ;,
.L525:
	call	create_code_member	 ;
 ; D:\TC\src\parser.c:50:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:50:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	%rax, %rdx	 ; tmp606, _36
 ; D:\TC\src\parser.c:50:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	call	list_append	 ;
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	jmp	.L365	 ;
.L442:
 ; D:\TC\src\parser.c:55:     return create_code(members, global_scope);
	movq	72(%rsp), %rdx	 ; %sfp,
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:56: }
	addq	$136, %rsp	 ;,
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
.L394:
 ; D:\TC\src\parser.c:52:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	(%rbx), %rcx	 ; parser_74(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:52:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC89(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:52:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp608
 ; D:\TC\src\parser.c:52:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L365	 ;
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
	.def	create_function;	.scl	2;	.type	32;	.endef
	.def	create_method;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	create_class;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	create_code;	.scl	2;	.type	32;	.endef
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
