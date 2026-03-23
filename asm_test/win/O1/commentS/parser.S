	.file	"D:\\TC\\src\\parser.c"
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
 ; D:\TC\src\parser.c:528:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:529:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_26->type
	je	.L7	 ;,
	movq	%r13, %rsi	 ; expr_left, <retval>
	jmp	.L2	 ;
.L15:
 ; D:\TC\src\parser.c:538:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	160(%rsp), %rax	 ; parser, tmp141
	movq	(%rax), %rcx	 ; parser_37(D)->source_file, parser_37(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp131
 ; D:\TC\src\parser.c:538:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC0(%rip), %rcx	 ;, tmp115
	call	parser_error	 ;
 ; D:\TC\src\parser.c:539:             return NULL;
	jmp	.L1	 ;
.L13:
 ; D:\TC\src\parser.c:551:             token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:543:         while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_51->type
	jne	.L5	 ;,
.L6:
 ; D:\TC\src\parser.c:544:             OperatorType next_op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_69->lexeme, token_69->lexeme
	call	string_to_operator	 ;
	movl	%eax, %ebx	 ; tmp134, next_op
 ; D:\TC\src\parser.c:545:             int next_prec = operator_precedence(next_op);
	movl	%eax, %ecx	 ; next_op,
	call	operator_precedence	 ;
 ; D:\TC\src\parser.c:546:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %ebx	 ;, next_op
	je	.L5	 ;,
	cmpl	%eax, %ebp	 ; next_prec, op_prec
	jge	.L5	 ;,
 ; D:\TC\src\parser.c:548:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	160(%rsp), %rdx	 ; parser, tmp142
	movq	%rdx, 32(%rsp)	 ; tmp142,
	movq	%r14, %r9	 ; now_scope,
	movl	%eax, %r8d	 ; next_prec,
	movq	%rsi, %rdx	 ; <retval>,
	movq	%rdi, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rsi	 ; tmp136, <retval>
 ; D:\TC\src\parser.c:549:             if (right == NULL)
	testq	%rax, %rax	 ; <retval>
	jne	.L13	 ;,
	jmp	.L1	 ;
.L5:
 ; D:\TC\src\parser.c:553:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rsi, %r9	 ; <retval>,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; expr_left,
	movl	%r12d, %ecx	 ; op,
	call	create_expression	 ;
	movq	%rax, %r13	 ; tmp138, expr_left
 ; D:\TC\src\parser.c:554:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:529:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_55->type
	jne	.L14	 ;,
.L7:
 ; D:\TC\src\parser.c:530:         OperatorType op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_70->lexeme, token_70->lexeme
	call	string_to_operator	 ;
	movl	%eax, %r12d	 ; tmp127, op
 ; D:\TC\src\parser.c:531:         int op_prec = operator_precedence(op);
	movl	%eax, %ecx	 ; op,
	call	operator_precedence	 ;
	movl	%eax, %ebp	 ; tmp128, op_prec
 ; D:\TC\src\parser.c:532:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, %r12d	 ;, op
	je	.L9	 ;,
	cmpl	%r15d, %eax	 ; min_prec, op_prec
	jl	.L9	 ;,
 ; D:\TC\src\parser.c:534:         token = get_next_token(lexer, true);  // consume operator
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:535:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp129, token
 ; D:\TC\src\parser.c:536:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	160(%rsp), %r8	 ; parser,
	movq	%r14, %rdx	 ; now_scope,
	movq	%rdi, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %rsi	 ; tmp130, <retval>
 ; D:\TC\src\parser.c:537:         if (right_primary == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L15	 ;,
 ; D:\TC\src\parser.c:541:         Expression* right = create_expression(OP_NONE, NULL, right_primary, NULL);
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; <retval>,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rsi	 ; tmp132, <retval>
 ; D:\TC\src\parser.c:542:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:543:         while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_43->type
	je	.L6	 ;,
	jmp	.L5	 ;
.L14:
	movq	%r13, %rsi	 ; expr_left, <retval>
	jmp	.L2	 ;
.L9:
	movq	%r13, %rsi	 ; expr_left, <retval>
.L2:
 ; D:\TC\src\parser.c:556:     token = peek_current_token(lexer);
	movq	%rdi, %rcx	 ; lexer,
	call	peek_current_token	 ;
.L1:
 ; D:\TC\src\parser.c:558: }
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
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %rbx	 ; tmp96, <retval>
 ; D:\TC\src\parser.c:561:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L20	 ;,
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; <retval>,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rdx	 ; tmp99, _4
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rdi, 32(%rsp)	 ; parser,
	movq	%rbp, %r9	 ; now_scope,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rbx	 ; tmp100, <retval>
.L16:
 ; D:\TC\src\parser.c:566: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L20:
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_10(D)->source_file, parser_10(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %rdi	 ; tmp97, _2
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rsi, %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %rdx	 ; tmp98, _3
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rdi, %r8	 ; _2,
	leaq	.LC1(%rip), %rcx	 ;, tmp91
	call	parser_error	 ;
 ; D:\TC\src\parser.c:563:         return NULL;
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
	movq	%rcx, %rsi	 ; tmp138, lexer
	movq	%rdx, %rbp	 ; tmp139, now_scope
	movq	%r8, %r12	 ; tmp140, parser
 ; D:\TC\src\parser.c:276:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rbx	 ; tmp141, token
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_35->type, _1
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _1
	je	.L22	 ;,
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _1
	jne	.L23	 ;,
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rbx), %rcx	 ; token_35->lexeme, token_35->lexeme
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp142
	je	.L23	 ;,
.L22:
 ; D:\TC\src\parser.c:281:     Symbol* type = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rdx	 ; token_35->lexeme, token_35->lexeme
	movq	%rbp, %rcx	 ; now_scope,
	call	search_name	 ;
	movq	%rax, %rdi	 ; tmp144, type
 ; D:\TC\src\parser.c:282:     if (type != NULL) {
	testq	%rax, %rax	 ; type
	je	.L25	 ;,
 ; D:\TC\src\parser.c:284:         if (type_ptr->kind != SYMBOL_TYPE && type_ptr->kind != SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; type_42->kind, _45
 ; D:\TC\src\parser.c:284:         if (type_ptr->kind != SYMBOL_TYPE && type_ptr->kind != SYMBOL_CLASS)
	cmpl	$5, %eax	 ;, _45
	je	.L26	 ;,
	testl	%eax, %eax	 ; _45
	jne	.L32	 ;,
.L26:
 ; D:\TC\src\parser.c:288:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp147, token
 ; D:\TC\src\parser.c:289:     if (token->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	 ;, token_49->type
	jne	.L33	 ;,
.L27:
 ; D:\TC\src\parser.c:291:     Symbol* name = create_symbol(token->lexeme, SYMBOL_VARIABLE, type, now_scope);
	movq	(%rbx), %rcx	 ; token_49->lexeme, token_49->lexeme
	movq	%rbp, %r9	 ; now_scope,
	movq	%rdi, %r8	 ; type,
	movl	$2, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, %rbx	 ; tmp149, name
 ; D:\TC\src\parser.c:293:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:292:     Expression* value = NULL;
	movl	$0, %r13d	 ;, value
 ; D:\TC\src\parser.c:294:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_55->type
	je	.L34	 ;,
.L28:
 ; D:\TC\src\parser.c:301:     return create_variable(type, name, value);
	movq	%r13, %r8	 ; value,
	movq	%rbx, %rdx	 ; name,
	movq	%rdi, %rcx	 ; type,
	call	create_variable	 ;
.L21:
 ; D:\TC\src\parser.c:302: }
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
 ; D:\TC\src\parser.c:278:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_37(D)->source_file, parser_37(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp143
 ; D:\TC\src\parser.c:278:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC2(%rip), %rcx	 ;, tmp119
	call	parser_error	 ;
 ; D:\TC\src\parser.c:279:         return NULL;
	movl	$0, %eax	 ;, <retval>
	jmp	.L21	 ;
.L32:
 ; D:\TC\src\parser.c:285:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_37(D)->source_file, parser_37(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp145
 ; D:\TC\src\parser.c:285:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC3(%rip), %rcx	 ;, tmp126
	call	parser_error	 ;
	jmp	.L26	 ;
.L25:
 ; D:\TC\src\parser.c:287:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_37(D)->source_file, parser_37(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp146
 ; D:\TC\src\parser.c:287:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC4(%rip), %rcx	 ;, tmp128
	call	parser_error	 ;
	jmp	.L26	 ;
.L33:
 ; D:\TC\src\parser.c:290:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_37(D)->source_file, parser_37(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp148
 ; D:\TC\src\parser.c:290:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC5(%rip), %rcx	 ;, tmp130
	call	parser_error	 ;
	jmp	.L27	 ;
.L34:
 ; D:\TC\src\parser.c:294:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx	 ;, tmp132
	movq	(%rdx), %rdx	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL
	movq	(%rax), %rcx	 ; token_55->lexeme, token_55->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:294:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	 ; tmp151
	je	.L28	 ;,
 ; D:\TC\src\parser.c:295:         token = get_next_token(lexer, true);  // consume '='
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:296:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r14	 ; tmp152, token
 ; D:\TC\src\parser.c:297:         value = parse_expression(lexer, now_scope, parser);
	movq	%r12, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %r13	 ; tmp153, value
 ; D:\TC\src\parser.c:298:         if (value == NULL)
	testq	%rax, %rax	 ; value
	jne	.L28	 ;,
 ; D:\TC\src\parser.c:299:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_37(D)->source_file, parser_37(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp154
 ; D:\TC\src\parser.c:299:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC6(%rip), %rcx	 ;, tmp136
	call	parser_error	 ;
	jmp	.L28	 ;
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
	movq	%rcx, %rsi	 ; tmp300, lexer
	movq	%rdx, %r14	 ; tmp301, now_scope
	movq	%r8, %r15	 ; tmp302, parser
 ; D:\TC\src\parser.c:569:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rdi	 ; tmp303, token
 ; D:\TC\src\parser.c:575:     if (token->type == INTEGER) {
	movl	24(%rax), %eax	 ; token_61->type, _1
 ; D:\TC\src\parser.c:575:     if (token->type == INTEGER) {
	cmpl	$2, %eax	 ;, _1
	je	.L86	 ;,
 ; D:\TC\src\parser.c:578:     } else if (token->type == FLOAT) {
	cmpl	$3, %eax	 ;, _1
	je	.L87	 ;,
 ; D:\TC\src\parser.c:581:     } else if (token->type == STRING) {
	cmpl	$4, %eax	 ;, _1
	je	.L88	 ;,
 ; D:\TC\src\parser.c:584:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _1
	je	.L89	 ;,
.L40:
 ; D:\TC\src\parser.c:590:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rdi)	 ;, token_61->type
	je	.L90	 ;,
.L48:
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movl	24(%rdi), %eax	 ; token_61->type, _33
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$1, %eax	 ;, _33
	je	.L49	 ;,
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$6, %eax	 ;, _33
	jne	.L50	 ;,
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp235
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	(%rdi), %rcx	 ; token_61->lexeme, token_61->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	testb	%al, %al	 ; tmp321
	je	.L50	 ;,
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpb	$0, 9(%r15)	 ;, parser_70(D)->in_method
	je	.L50	 ;,
.L49:
 ; D:\TC\src\parser.c:633:     Token* token = peek_current_token(lexer);
	movq	%rsi, %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %rbx	 ; tmp322, token
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movl	24(%rax), %eax	 ; token_106->type, _107
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	 ;, _107
	je	.L51	 ;,
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	 ;, _107
	jne	.L52	 ;,
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp238
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	(%rbx), %rcx	 ; token_106->lexeme, token_106->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	 ; tmp323
	je	.L52	 ;,
.L51:
 ; D:\TC\src\parser.c:641:     base_name = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rdx	 ; token_106->lexeme, token_106->lexeme
	movq	%r14, %rcx	 ; now_scope,
	call	search_name	 ;
 ; D:\TC\src\parser.c:642:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, 48(%rsp)	 ; base_name, %sfp
	movq	%rax, %r8	 ; base_name,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, %rbp	 ; tmp326, variable_value
 ; D:\TC\src\parser.c:643:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	peek_next_token	 ;
	movq	%rax, %r13	 ; tmp327, token
 ; D:\TC\src\parser.c:644:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_116->type
	jne	.L54	 ;,
 ; D:\TC\src\parser.c:638:     Symbol* current_type = NULL;
	movl	$0, %ebx	 ;, current_type
 ; D:\TC\src\parser.c:640:     SymbolTable* var_scope = NULL;
	movl	$0, %r12d	 ;, var_scope
 ; D:\TC\src\parser.c:695:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	movq	%rdi, 56(%rsp)	 ; token, %sfp
	movq	48(%rsp), %rdi	 ; %sfp, base_name
	movq	%rbp, 48(%rsp)	 ; variable_value, %sfp
	jmp	.L75	 ;
.L86:
 ; D:\TC\src\parser.c:577:         str_value = token->lexeme;
	movq	(%rdi), %rdx	 ; token_61->lexeme, str_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:\TC\src\parser.c:576:         type = PRIM_INTEGER;
	movl	$0, %edi	 ;, type
.L37:
 ; D:\TC\src\parser.c:630:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%rbp, 32(%rsp)	 ; variable_value,
	movq	%rsi, %r9	 ; prim_value,
	movq	%rbx, %r8	 ; <retval>,
	movl	%edi, %ecx	 ; type,
	call	create_primary	 ;
	movq	%rax, %rbx	 ; tmp363, <retval>
.L35:
 ; D:\TC\src\parser.c:631: }
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
.L87:
 ; D:\TC\src\parser.c:580:         str_value = token->lexeme;
	movq	(%rdi), %rdx	 ; token_61->lexeme, str_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:\TC\src\parser.c:579:         type = PRIM_FLOAT;
	movl	$1, %edi	 ;, type
	jmp	.L37	 ;
.L88:
 ; D:\TC\src\parser.c:583:         str_value = token->lexeme;
	movq	(%rdi), %rdx	 ; token_61->lexeme, str_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:\TC\src\parser.c:582:         type = PRIM_STRING;
	movl	$2, %edi	 ;, type
	jmp	.L37	 ;
.L89:
 ; D:\TC\src\parser.c:584:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	movq	.refptr.TRUE_KEYWORD(%rip), %rax	 ;, tmp211
	movq	(%rax), %rdx	 ; TRUE_KEYWORD, TRUE_KEYWORD
	movq	(%rdi), %rcx	 ; token_61->lexeme, token_61->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:584:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	 ; tmp304
	je	.L41	 ;,
 ; D:\TC\src\parser.c:586:         str_value = token->lexeme;
	movq	(%rdi), %rdx	 ; token_61->lexeme, str_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:\TC\src\parser.c:585:         type = PRIM_TRUE;
	movl	$3, %edi	 ;, type
 ; D:\TC\src\parser.c:586:         str_value = token->lexeme;
	jmp	.L37	 ;
.L41:
 ; D:\TC\src\parser.c:587:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, 24(%rdi)	 ;, token_61->type
	jne	.L40	 ;,
 ; D:\TC\src\parser.c:587:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movq	.refptr.FALSE_KEYWORD(%rip), %rax	 ;, tmp214
	movq	(%rax), %rdx	 ; FALSE_KEYWORD, FALSE_KEYWORD
	movq	(%rdi), %rcx	 ; token_61->lexeme, token_61->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:587:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	 ; tmp305
	je	.L40	 ;,
 ; D:\TC\src\parser.c:589:         str_value = token->lexeme;
	movq	(%rdi), %rdx	 ; token_61->lexeme, str_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:\TC\src\parser.c:588:         type = PRIM_FALSE;
	movl	$4, %edi	 ;, type
 ; D:\TC\src\parser.c:589:         str_value = token->lexeme;
	jmp	.L37	 ;
.L90:
 ; D:\TC\src\parser.c:590:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp217
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rdi), %rcx	 ; token_61->lexeme, token_61->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:590:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp306
	jne	.L91	 ;,
 ; D:\TC\src\parser.c:603:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	cmpl	$5, 24(%rdi)	 ;, token_61->type
	jne	.L48	 ;,
 ; D:\TC\src\parser.c:603:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp227
	movq	(%rax), %rdx	 ; NOT_SYMBOL, NOT_SYMBOL
	movq	(%rdi), %rcx	 ; token_61->lexeme, token_61->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:603:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	 ; tmp313
	jne	.L92	 ;,
 ; D:\TC\src\parser.c:611:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	cmpl	$5, 24(%rdi)	 ;, token_61->type
	jne	.L48	 ;,
 ; D:\TC\src\parser.c:611:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp231
	movq	(%rax), %rdx	 ; SUB_SYMBOL, SUB_SYMBOL
	movq	(%rdi), %rcx	 ; token_61->lexeme, token_61->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:611:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	 ; tmp317
	je	.L48	 ;,
 ; D:\TC\src\parser.c:613:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp318, token
 ; D:\TC\src\parser.c:614:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	%r14, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %rsi	 ; tmp319, prim_value
 ; D:\TC\src\parser.c:615:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	je	.L93	 ;,
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:\TC\src\parser.c:571:     string str_value = NULL;
	movl	$0, %edx	 ;, str_value
 ; D:\TC\src\parser.c:612:         type = PRIM_NEG_OPERAND;
	movl	$7, %edi	 ;, type
	jmp	.L37	 ;
.L91:
 ; D:\TC\src\parser.c:592:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp307, token
 ; D:\TC\src\parser.c:593:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	%r14, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %rbx	 ; tmp308, <retval>
 ; D:\TC\src\parser.c:594:         if (expr_value == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L94	 ;,
 ; D:\TC\src\parser.c:598:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp310, token
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %edi	 ; token_74->type, type
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %edi	 ;, type
	jne	.L46	 ;,
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp222
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_74->lexeme, token_74->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp311
	je	.L46	 ;,
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:\TC\src\parser.c:571:     string str_value = NULL;
	movl	$0, %edx	 ;, str_value
	jmp	.L37	 ;
.L94:
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp309
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC7(%rip), %rcx	 ;, tmp221
	call	parser_error	 ;
 ; D:\TC\src\parser.c:596:             return NULL;
	jmp	.L35	 ;
.L46:
 ; D:\TC\src\parser.c:600:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp312
 ; D:\TC\src\parser.c:600:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC8(%rip), %rcx	 ;, tmp226
	call	parser_error	 ;
 ; D:\TC\src\parser.c:601:             return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L35	 ;
.L92:
 ; D:\TC\src\parser.c:605:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp314, token
 ; D:\TC\src\parser.c:606:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	%r14, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %rsi	 ; tmp315, prim_value
 ; D:\TC\src\parser.c:607:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	je	.L95	 ;,
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:\TC\src\parser.c:571:     string str_value = NULL;
	movl	$0, %edx	 ;, str_value
 ; D:\TC\src\parser.c:604:         type = PRIM_NOT_OPERAND;
	movl	$6, %edi	 ;, type
	jmp	.L37	 ;
.L95:
 ; D:\TC\src\parser.c:608:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file,
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp316
 ; D:\TC\src\parser.c:608:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC9(%rip), %rcx	 ;, tmp230
	call	parser_error	 ;
 ; D:\TC\src\parser.c:609:             return NULL;
	movq	%rsi, %rbx	 ; prim_value, <retval>
	jmp	.L35	 ;
.L93:
 ; D:\TC\src\parser.c:616:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file,
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp320
 ; D:\TC\src\parser.c:616:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC10(%rip), %rcx	 ;, tmp234
	call	parser_error	 ;
 ; D:\TC\src\parser.c:617:             return NULL;
	movq	%rsi, %rbx	 ; prim_value, <retval>
	jmp	.L35	 ;
.L52:
 ; D:\TC\src\parser.c:635:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp324
 ; D:\TC\src\parser.c:635:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC11(%rip), %rcx	 ;, tmp242
	call	parser_error	 ;
 ; D:\TC\src\parser.c:636:         return NULL;
	jmp	.L76	 ;
.L56:
 ; D:\TC\src\parser.c:652:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp383
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	0(%r13), %rcx	 ; token_288->lexeme, token_288->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:652:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp328
	jne	.L96	 ;,
 ; D:\TC\src\parser.c:683:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp386
	movq	(%rax), %rdx	 ; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL
	movq	0(%r13), %rcx	 ; token_288->lexeme, token_288->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:683:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp345
	je	.L68	 ;,
 ; D:\TC\src\parser.c:684:             token = get_next_token(lexer, true);  // consume '['
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:685:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp346, token
 ; D:\TC\src\parser.c:686:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	%r14, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %rbp	 ; tmp347, index
 ; D:\TC\src\parser.c:687:             if (index == NULL)
	testq	%rax, %rax	 ; index
	je	.L97	 ;,
.L69:
 ; D:\TC\src\parser.c:689:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp349, token
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_179->type
	jne	.L70	 ;,
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp275
	movq	(%rax), %rdx	 ; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL
	movq	0(%r13), %rcx	 ; token_179->lexeme, token_179->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp350
	je	.L70	 ;,
 ; D:\TC\src\parser.c:694:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movq	$0, 32(%rsp)	 ;,
	movq	%rbp, %r9	 ; index,
	movl	$0, %r8d	 ;,
	movq	48(%rsp), %rdx	 ; %sfp,
	movl	$3, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, 48(%rsp)	 ; tmp352, %sfp
.L67:
 ; D:\TC\src\parser.c:716:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	peek_next_token	 ;
	movq	%rax, %r13	 ; tmp360, token
 ; D:\TC\src\parser.c:644:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_202->type
	jne	.L98	 ;,
.L75:
 ; D:\TC\src\parser.c:645:         if (base_name != NULL) {
	testq	%rdi, %rdi	 ; base_name
	je	.L55	 ;,
 ; D:\TC\src\parser.c:647:             if (base_name->type != NULL)  // subroutine or variable or attribute or parameter
	movq	(%rdi), %rbx	 ; base_name_286->type, current_type
 ; D:\TC\src\parser.c:646:             current_type = base_name;     // class or type
	testq	%rbx, %rbx	 ; current_type
	cmove	%rdi, %rbx	 ; current_type,, base_name, current_type
.L55:
 ; D:\TC\src\parser.c:650:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	testq	%r12, %r12	 ; var_scope
	jne	.L56	 ;,
	testq	%rbx, %rbx	 ; current_type
	je	.L56	 ;,
 ; D:\TC\src\parser.c:650:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rbx)	 ;, current_type_121->kind
	jne	.L56	 ;,
 ; D:\TC\src\parser.c:651:             var_scope = current_type->scope;
	movq	8(%rbx), %r12	 ; current_type_121->scope, var_scope
	jmp	.L56	 ;
.L96:
 ; D:\TC\src\parser.c:653:             token = get_next_token(lexer, true);  // consume '('
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp329, token
 ; D:\TC\src\parser.c:654:             if (base_name == NULL)
	testq	%rdi, %rdi	 ; base_name
	je	.L99	 ;,
 ; D:\TC\src\parser.c:656:             else if (base_name->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rdi)	 ;, base_name_286->kind
	je	.L100	 ;,
.L60:
 ; D:\TC\src\parser.c:660:             if (base_name != NULL && base_name->kind != SYMBOL_SUBROUTINE)
	cmpl	$1, 32(%rdi)	 ;, base_name_140->kind
	jne	.L101	 ;,
.L59:
 ; D:\TC\src\parser.c:662:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp334, token
 ; D:\TC\src\parser.c:663:             list(Expression*) args = create_list();
	call	create_list	 ;
	movq	%rax, %r12	 ; tmp335, args
 ; D:\TC\src\parser.c:672:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r13	 ;, tmp297
 ; D:\TC\src\parser.c:664:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L61	 ;
.L99:
 ; D:\TC\src\parser.c:655:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp330
 ; D:\TC\src\parser.c:655:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC12(%rip), %rcx	 ;, tmp252
	call	parser_error	 ;
	jmp	.L59	 ;
.L100:
 ; D:\TC\src\parser.c:657:                 base_name = search_name(base_name->scope, CONSTRUCTOR_NAME);
	movq	8(%rdi), %rcx	 ; base_name_286->scope, _135
	movq	.refptr.CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp253
	movq	(%rax), %rdx	 ; CONSTRUCTOR_NAME, CONSTRUCTOR_NAME
	call	search_name	 ;
	movq	%rax, %rdi	 ; tmp331, base_name
 ; D:\TC\src\parser.c:658:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; base_name,
	movq	48(%rsp), %rdx	 ; %sfp,
	movl	$2, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, 48(%rsp)	 ; tmp332, %sfp
 ; D:\TC\src\parser.c:660:             if (base_name != NULL && base_name->kind != SYMBOL_SUBROUTINE)
	testq	%rdi, %rdi	 ; base_name
	jne	.L60	 ;,
	jmp	.L59	 ;
.L101:
 ; D:\TC\src\parser.c:661:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp333
 ; D:\TC\src\parser.c:661:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC13(%rip), %rcx	 ;, tmp256
	call	parser_error	 ;
	jmp	.L59	 ;
.L104:
 ; D:\TC\src\parser.c:667:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp337
 ; D:\TC\src\parser.c:667:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC14(%rip), %rcx	 ;, tmp258
	call	parser_error	 ;
	jmp	.L62	 ;
.L105:
 ; D:\TC\src\parser.c:670:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp384
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	movq	(%rbx), %rcx	 ; token_150->lexeme, token_150->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:670:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	testb	%al, %al	 ; tmp339
	jne	.L102	 ;,
 ; D:\TC\src\parser.c:672:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_150->type
	jne	.L63	 ;,
 ; D:\TC\src\parser.c:672:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%r13), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_150->lexeme, token_150->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:672:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp341
	je	.L63	 ;,
.L61:
 ; D:\TC\src\parser.c:664:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_149->type
	je	.L103	 ;,
.L66:
 ; D:\TC\src\parser.c:665:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	%r14, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %rbp	 ; tmp336, arg
 ; D:\TC\src\parser.c:666:                 if (arg == NULL)
	testq	%rax, %rax	 ; arg
	je	.L104	 ;,
.L62:
 ; D:\TC\src\parser.c:668:                 list_append(args, (pointer)arg);
	movq	%rbp, %rdx	 ; arg,
	movq	%r12, %rcx	 ; args,
	call	list_append	 ;
 ; D:\TC\src\parser.c:669:                 token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp338, token
 ; D:\TC\src\parser.c:670:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_150->type
	je	.L105	 ;,
.L63:
 ; D:\TC\src\parser.c:673:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdi	 ; %sfp, token
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp342
 ; D:\TC\src\parser.c:673:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC15(%rip), %rcx	 ;, tmp266
	call	parser_error	 ;
.L76:
 ; D:\TC\src\parser.c:623:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp361
 ; D:\TC\src\parser.c:623:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC21(%rip), %rcx	 ;, tmp291
	call	parser_error	 ;
 ; D:\TC\src\parser.c:624:             return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L35	 ;
.L102:
 ; D:\TC\src\parser.c:671:                     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp340, token
 ; D:\TC\src\parser.c:671:                     token = get_next_token(lexer, true);
	jmp	.L61	 ;
.L103:
 ; D:\TC\src\parser.c:664:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp385
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_149->lexeme, token_149->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:664:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp343
	je	.L66	 ;,
 ; D:\TC\src\parser.c:677:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%r12, 32(%rsp)	 ; args,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	48(%rsp), %rdx	 ; %sfp,
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, 48(%rsp)	 ; tmp344, %sfp
 ; D:\TC\src\parser.c:678:             base_name = base_name->type;
	movq	(%rdi), %rdi	 ; base_name_168->type, base_name
 ; D:\TC\src\parser.c:681:             if (base_name->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rdi)	 ;, base_name_169->kind
	jne	.L81	 ;,
 ; D:\TC\src\parser.c:682:                 var_scope = base_name->scope;
	movq	8(%rdi), %r12	 ; base_name_169->scope, var_scope
 ; D:\TC\src\parser.c:679:             current_type = NULL;
	movl	$0, %ebx	 ;, current_type
	jmp	.L67	 ;
.L97:
 ; D:\TC\src\parser.c:688:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp348
 ; D:\TC\src\parser.c:688:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC16(%rip), %rcx	 ;, tmp274
	call	parser_error	 ;
	jmp	.L69	 ;
.L70:
 ; D:\TC\src\parser.c:691:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdi	 ; %sfp, token
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp351
 ; D:\TC\src\parser.c:691:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC17(%rip), %rcx	 ;, tmp279
	call	parser_error	 ;
 ; D:\TC\src\parser.c:692:                 return NULL;
	jmp	.L76	 ;
.L68:
 ; D:\TC\src\parser.c:695:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp387
	movq	(%rax), %rdx	 ; DOT_SYMBOL, DOT_SYMBOL
	movq	0(%r13), %rcx	 ; token_288->lexeme, token_288->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:695:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	 ; tmp353
	je	.L84	 ;,
 ; D:\TC\src\parser.c:696:             token = get_next_token(lexer, true);  // consume '.'
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:697:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp354, token
 ; D:\TC\src\parser.c:698:             if (var_scope == NULL) {
	testq	%r12, %r12	 ; var_scope
	je	.L106	 ;,
 ; D:\TC\src\parser.c:702:             if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_190->type
	jne	.L107	 ;,
 ; D:\TC\src\parser.c:706:             base_name = search_name(var_scope, token->lexeme);
	movq	(%rax), %rdx	 ; token_190->lexeme, token_190->lexeme
	movq	%r12, %rcx	 ; var_scope,
	call	search_name	 ;
	movq	%rax, %rdi	 ; tmp357, base_name
 ; D:\TC\src\parser.c:707:             if (base_name == NULL) {
	testq	%rax, %rax	 ; base_name
	je	.L108	 ;,
 ; D:\TC\src\parser.c:711:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; base_name,
	movq	48(%rsp), %rdx	 ; %sfp,
	movl	$2, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, 48(%rsp)	 ; tmp359, %sfp
 ; D:\TC\src\parser.c:713:             var_scope = NULL;
	movl	$0, %r12d	 ;, var_scope
 ; D:\TC\src\parser.c:712:             current_type = NULL;
	movl	$0, %ebx	 ;, current_type
	jmp	.L67	 ;
.L106:
 ; D:\TC\src\parser.c:699:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdi	 ; %sfp, token
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp355
 ; D:\TC\src\parser.c:699:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC18(%rip), %rcx	 ;, tmp284
	call	parser_error	 ;
 ; D:\TC\src\parser.c:700:                 return NULL;
	jmp	.L76	 ;
.L107:
 ; D:\TC\src\parser.c:703:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdi	 ; %sfp, token
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp356
 ; D:\TC\src\parser.c:703:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC19(%rip), %rcx	 ;, tmp286
	call	parser_error	 ;
 ; D:\TC\src\parser.c:704:                 return NULL;
	jmp	.L76	 ;
.L108:
 ; D:\TC\src\parser.c:708:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdi	 ; %sfp, token
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp358
 ; D:\TC\src\parser.c:708:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC20(%rip), %rcx	 ;, tmp289
	call	parser_error	 ;
 ; D:\TC\src\parser.c:709:                 return NULL;
	jmp	.L76	 ;
.L81:
 ; D:\TC\src\parser.c:680:             var_scope = NULL;
	movl	$0, %r12d	 ;, var_scope
 ; D:\TC\src\parser.c:679:             current_type = NULL;
	movl	$0, %ebx	 ;, current_type
	jmp	.L67	 ;
.L98:
	movq	56(%rsp), %rdi	 ; %sfp, token
	movq	48(%rsp), %rbp	 ; %sfp, variable_value
.L54:
 ; D:\TC\src\parser.c:622:         if (variable_value == NULL) {
	testq	%rbp, %rbp	 ; variable_value
	je	.L76	 ;,
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:\TC\src\parser.c:571:     string str_value = NULL;
	movl	$0, %edx	 ;, str_value
 ; D:\TC\src\parser.c:620:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %edi	 ;, type
	jmp	.L37	 ;
.L84:
	movq	56(%rsp), %rdi	 ; %sfp, token
	movq	48(%rsp), %rbp	 ; %sfp, variable_value
	jmp	.L54	 ;
.L50:
 ; D:\TC\src\parser.c:627:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_70(D)->source_file, parser_70(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp362
 ; D:\TC\src\parser.c:627:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC22(%rip), %rcx	 ;, tmp293
	call	parser_error	 ;
 ; D:\TC\src\parser.c:628:         return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L35	 ;
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
 ; D:\TC\src\parser.c:305:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:307:     if (token->type == KEYWORD) {
	cmpl	$6, 24(%rax)	 ;, token_58->type
	je	.L194	 ;,
 ; D:\TC\src\parser.c:337:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:337:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp634,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp635, <retval>
.L179:
 ; D:\TC\src\parser.c:338:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %rsi	 ; tmp636, token
 ; D:\TC\src\parser.c:339:     if (statement == NULL)
	testq	%rbp, %rbp	 ; <retval>
	je	.L195	 ;,
.L186:
 ; D:\TC\src\parser.c:341:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp638, token
 ; D:\TC\src\parser.c:342:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_108->type
	je	.L196	 ;,
.L187:
 ; D:\TC\src\parser.c:343:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp640
 ; D:\TC\src\parser.c:343:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC52(%rip), %rcx	 ;, tmp488
	call	parser_error	 ;
.L109:
 ; D:\TC\src\parser.c:345: }
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
.L194:
	movq	%rax, %rsi	 ; tmp505, token
 ; D:\TC\src\parser.c:308:         if (string_equal(token->lexeme, IF_KEYWORD))
	movq	.refptr.IF_KEYWORD(%rip), %rax	 ;, tmp332
	movq	(%rax), %rdx	 ; IF_KEYWORD, IF_KEYWORD
	movq	(%rsi), %rcx	 ; token_58->lexeme, token_58->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:308:         if (string_equal(token->lexeme, IF_KEYWORD))
	testb	%al, %al	 ; tmp506
	jne	.L197	 ;,
 ; D:\TC\src\parser.c:310:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	movq	.refptr.FOR_KEYWORD(%rip), %rax	 ;, tmp391
	movq	(%rax), %rdx	 ; FOR_KEYWORD, FOR_KEYWORD
	movq	(%rsi), %rcx	 ; token_58->lexeme, token_58->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:310:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	testb	%al, %al	 ; tmp560
	jne	.L198	 ;,
 ; D:\TC\src\parser.c:312:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	movq	.refptr.WHILE_KEYWORD(%rip), %rax	 ;, tmp439
	movq	(%rax), %rdx	 ; WHILE_KEYWORD, WHILE_KEYWORD
	movq	(%rsi), %rcx	 ; token_58->lexeme, token_58->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:312:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	testb	%al, %al	 ; tmp596
	jne	.L199	 ;,
 ; D:\TC\src\parser.c:314:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp464
	movq	(%rax), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD
	movq	(%rsi), %rcx	 ; token_58->lexeme, token_58->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:314:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; tmp617
	je	.L178	 ;,
 ; D:\TC\src\parser.c:315:             get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:316:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:316:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rax, 40(%rsp)	 ; tmp618,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp619, <retval>
	jmp	.L179	 ;
.L197:
 ; D:\TC\src\parser.c:348:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp507, token
 ; D:\TC\src\parser.c:349:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_112->type
	jne	.L112	 ;,
 ; D:\TC\src\parser.c:349:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp335
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_112->lexeme, token_112->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:349:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp508
	je	.L112	 ;,
 ; D:\TC\src\parser.c:353:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp510, token
 ; D:\TC\src\parser.c:354:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, 72(%rsp)	 ; condition, %sfp
 ; D:\TC\src\parser.c:355:     if (condition == NULL)
	testq	%rax, %rax	 ; condition
	je	.L200	 ;,
.L115:
 ; D:\TC\src\parser.c:357:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp513, token
 ; D:\TC\src\parser.c:358:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_123->type
	jne	.L116	 ;,
 ; D:\TC\src\parser.c:358:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp342
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_123->lexeme, token_123->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:358:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp514
	je	.L116	 ;,
 ; D:\TC\src\parser.c:362:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp516, token
 ; D:\TC\src\parser.c:363:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_130->type
	jne	.L118	 ;,
 ; D:\TC\src\parser.c:363:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp347
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%rsi), %rcx	 ; token_130->lexeme, token_130->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:363:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp517
	je	.L118	 ;,
 ; D:\TC\src\parser.c:367:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, %r15	 ; tmp519, body
 ; D:\TC\src\parser.c:368:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp520, token
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r13	 ;, tmp496
 ; D:\TC\src\parser.c:372:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	leaq	.LC27(%rip), %r14	 ;, tmp497
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L120	 ;
.L112:
 ; D:\TC\src\parser.c:350:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp509
 ; D:\TC\src\parser.c:350:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC23(%rip), %rcx	 ;, tmp339
	call	parser_error	 ;
 ; D:\TC\src\parser.c:351:         return NULL;
	movl	$0, %edx	 ;, _215
.L114:
 ; D:\TC\src\parser.c:309:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$2, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp559, <retval>
 ; D:\TC\src\parser.c:309:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	jmp	.L109	 ;
.L200:
 ; D:\TC\src\parser.c:356:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp512
 ; D:\TC\src\parser.c:356:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC24(%rip), %rcx	 ;, tmp341
	call	parser_error	 ;
	jmp	.L115	 ;
.L116:
 ; D:\TC\src\parser.c:359:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp515
 ; D:\TC\src\parser.c:359:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC25(%rip), %rcx	 ;, tmp346
	call	parser_error	 ;
 ; D:\TC\src\parser.c:360:         return NULL;
	movl	$0, %edx	 ;, _215
	jmp	.L114	 ;
.L118:
 ; D:\TC\src\parser.c:364:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp518
 ; D:\TC\src\parser.c:364:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC26(%rip), %rcx	 ;, tmp351
	call	parser_error	 ;
 ; D:\TC\src\parser.c:365:         return NULL;
	movl	$0, %edx	 ;, _215
	jmp	.L114	 ;
.L122:
 ; D:\TC\src\parser.c:370:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %rsi	 ; tmp521, statement
 ; D:\TC\src\parser.c:371:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L201	 ;,
.L121:
 ; D:\TC\src\parser.c:373:         list_append(body, (pointer)statement);
	movq	%rsi, %rdx	 ; statement,
	movq	%r15, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:374:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp523, token
.L120:
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_142->type
	jne	.L122	 ;,
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%r13), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%r12), %rcx	 ; token_142->lexeme, token_142->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp524
	je	.L122	 ;,
 ; D:\TC\src\parser.c:376:     list(ElseIf*) else_if = create_list();
	call	create_list	 ;
	movq	%rax, 64(%rsp)	 ; tmp525, %sfp
 ; D:\TC\src\parser.c:377:     list(Statement*) else_body = create_list();
	call	create_list	 ;
	movq	%rax, 80(%rsp)	 ; tmp526, %sfp
 ; D:\TC\src\parser.c:378:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
	movq	%rax, %rsi	 ; tmp527, token
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_150->type
	jne	.L124	 ;,
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14	 ;, tmp494
	movq	%r15, 88(%rsp)	 ; body, %sfp
	jmp	.L123	 ;
.L201:
 ; D:\TC\src\parser.c:372:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp522
 ; D:\TC\src\parser.c:372:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	movq	%r14, %rcx	 ; tmp497,
	call	parser_error	 ;
	jmp	.L121	 ;
.L125:
 ; D:\TC\src\parser.c:383:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp530
 ; D:\TC\src\parser.c:383:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC28(%rip), %rcx	 ;, tmp361
	call	parser_error	 ;
 ; D:\TC\src\parser.c:384:             return NULL;
	movl	$0, %edx	 ;, _215
	jmp	.L114	 ;
.L204:
 ; D:\TC\src\parser.c:389:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp533
 ; D:\TC\src\parser.c:389:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC29(%rip), %rcx	 ;, tmp363
	call	parser_error	 ;
	jmp	.L127	 ;
.L128:
 ; D:\TC\src\parser.c:392:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp536
 ; D:\TC\src\parser.c:392:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC30(%rip), %rcx	 ;, tmp368
	call	parser_error	 ;
 ; D:\TC\src\parser.c:393:             return NULL;
	movl	$0, %edx	 ;, _215
	jmp	.L114	 ;
.L130:
 ; D:\TC\src\parser.c:397:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp539
 ; D:\TC\src\parser.c:397:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC31(%rip), %rcx	 ;, tmp373
	call	parser_error	 ;
 ; D:\TC\src\parser.c:398:             return NULL;
	movl	$0, %edx	 ;, _215
	jmp	.L114	 ;
.L134:
 ; D:\TC\src\parser.c:403:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp542, statement
 ; D:\TC\src\parser.c:404:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L202	 ;,
.L133:
 ; D:\TC\src\parser.c:406:             list_append(elif_body, (pointer)statement);
	movq	%r12, %rdx	 ; statement,
	movq	%r13, %rcx	 ; elif_body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:407:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp544, token
.L132:
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_181->type
	jne	.L134	 ;,
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rsi), %rcx	 ; token_181->lexeme, token_181->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp545
	je	.L134	 ;,
 ; D:\TC\src\parser.c:409:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%r13, %rdx	 ; elif_body,
	movq	56(%rsp), %rcx	 ; %sfp,
	call	create_else_if	 ;
	movq	%rax, %rdx	 ; tmp546, _187
 ; D:\TC\src\parser.c:409:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	64(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:\TC\src\parser.c:410:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
	movq	%rax, %rsi	 ; tmp547, token
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_188->type
	jne	.L192	 ;,
.L123:
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	movq	.refptr.ELIF_KEYWORD(%rip), %rax	 ;, tmp680
	movq	(%rax), %rdx	 ; ELIF_KEYWORD, ELIF_KEYWORD
	movq	(%rsi), %rcx	 ; token_9->lexeme, token_9->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	 ; tmp548
	je	.L203	 ;,
 ; D:\TC\src\parser.c:380:         token = get_next_token(lexer, true);  // consume 'elif'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:381:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp528, token
 ; D:\TC\src\parser.c:382:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_151->type
	jne	.L125	 ;,
 ; D:\TC\src\parser.c:382:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp357
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_151->lexeme, token_151->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:382:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp529
	je	.L125	 ;,
 ; D:\TC\src\parser.c:386:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp531, token
 ; D:\TC\src\parser.c:387:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, 56(%rsp)	 ; elif_condition, %sfp
 ; D:\TC\src\parser.c:388:         if (elif_condition == NULL)
	testq	%rax, %rax	 ; elif_condition
	je	.L204	 ;,
.L127:
 ; D:\TC\src\parser.c:390:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp534, token
 ; D:\TC\src\parser.c:391:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_162->type
	jne	.L128	 ;,
 ; D:\TC\src\parser.c:391:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp364
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_162->lexeme, token_162->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:391:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp535
	je	.L128	 ;,
 ; D:\TC\src\parser.c:395:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp537, token
 ; D:\TC\src\parser.c:396:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_169->type
	jne	.L130	 ;,
 ; D:\TC\src\parser.c:396:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp369
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%rsi), %rcx	 ; token_169->lexeme, token_169->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:396:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp538
	je	.L130	 ;,
 ; D:\TC\src\parser.c:400:         list(Statement*) elif_body = create_list();
	call	create_list	 ;
	movq	%rax, %r13	 ; tmp540, elif_body
 ; D:\TC\src\parser.c:401:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp541, token
 ; D:\TC\src\parser.c:405:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	leaq	.LC32(%rip), %r15	 ;, tmp493
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L132	 ;
.L202:
 ; D:\TC\src\parser.c:405:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp543
 ; D:\TC\src\parser.c:405:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r15, %rcx	 ; tmp493,
	call	parser_error	 ;
	jmp	.L133	 ;
.L203:
 ; D:\TC\src\parser.c:412:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	movq	88(%rsp), %r15	 ; %sfp, body
	cmpl	$6, 24(%rsi)	 ;, token_9->type
	jne	.L124	 ;,
 ; D:\TC\src\parser.c:412:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	movq	.refptr.ELSE_KEYWORD(%rip), %rax	 ;, tmp382
	movq	(%rax), %rdx	 ; ELSE_KEYWORD, ELSE_KEYWORD
	movq	(%rsi), %rcx	 ; token_9->lexeme, token_9->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:412:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	 ; tmp549
	je	.L124	 ;,
 ; D:\TC\src\parser.c:413:         token = get_next_token(lexer, true);  // consume 'else'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:414:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp550, token
 ; D:\TC\src\parser.c:415:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_198->type
	jne	.L136	 ;,
 ; D:\TC\src\parser.c:415:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp385
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	movq	(%rsi), %rcx	 ; token_198->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:415:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp551
	je	.L136	 ;,
 ; D:\TC\src\parser.c:419:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp553, token
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14	 ;, tmp490
 ; D:\TC\src\parser.c:423:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	leaq	.LC34(%rip), %r13	 ;, tmp491
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L138	 ;
.L136:
 ; D:\TC\src\parser.c:416:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file,
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp552
 ; D:\TC\src\parser.c:416:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC33(%rip), %rcx	 ;, tmp386
	call	parser_error	 ;
 ; D:\TC\src\parser.c:417:             return NULL;
	movl	$0, %edx	 ;, _215
	jmp	.L114	 ;
.L140:
 ; D:\TC\src\parser.c:421:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp554, statement
 ; D:\TC\src\parser.c:422:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L205	 ;,
.L139:
 ; D:\TC\src\parser.c:424:             list_append(else_body, (pointer)statement);
	movq	%r12, %rdx	 ; statement,
	movq	80(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:\TC\src\parser.c:425:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp556, token
.L138:
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_209->type
	jne	.L140	 ;,
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rsi), %rcx	 ; token_209->lexeme, token_209->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp557
	je	.L140	 ;,
	jmp	.L124	 ;
.L205:
 ; D:\TC\src\parser.c:423:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file,
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp555
 ; D:\TC\src\parser.c:423:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%r13, %rcx	 ; tmp491,
	call	parser_error	 ;
	jmp	.L139	 ;
.L192:
	movq	88(%rsp), %r15	 ; %sfp, body
.L124:
 ; D:\TC\src\parser.c:428:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:429:     return create_if(condition, body, else_if, else_body);
	movq	80(%rsp), %r9	 ; %sfp,
	movq	64(%rsp), %r8	 ; %sfp,
	movq	%r15, %rdx	 ; body,
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_if	 ;
	movq	%rax, %rdx	 ; tmp558, _215
	jmp	.L114	 ;
.L198:
 ; D:\TC\src\parser.c:433:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp561, token
 ; D:\TC\src\parser.c:434:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_217->type
	jne	.L143	 ;,
 ; D:\TC\src\parser.c:434:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp394
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_217->lexeme, token_217->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:434:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp562
	je	.L143	 ;,
 ; D:\TC\src\parser.c:438:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp564, token
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_224->type
	je	.L206	 ;,
.L146:
 ; D:\TC\src\parser.c:441:         initializer = parse_variable(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
	movq	%rax, %r13	 ; tmp566, initializer
 ; D:\TC\src\parser.c:442:         if (initializer == NULL)
	testq	%rax, %rax	 ; initializer
	je	.L207	 ;,
.L148:
 ; D:\TC\src\parser.c:444:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp568, token
.L147:
 ; D:\TC\src\parser.c:446:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_233->type
	jne	.L149	 ;,
 ; D:\TC\src\parser.c:446:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp404
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rsi), %rcx	 ; token_233->lexeme, token_233->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:446:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp569
	je	.L149	 ;,
 ; D:\TC\src\parser.c:450:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp571, token
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_240->type
	je	.L208	 ;,
.L151:
 ; D:\TC\src\parser.c:453:         condition = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %rsi	 ; tmp573, condition
 ; D:\TC\src\parser.c:454:         if (condition == NULL)
	testq	%rax, %rax	 ; condition
	je	.L209	 ;,
.L153:
 ; D:\TC\src\parser.c:456:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp575, token
.L152:
 ; D:\TC\src\parser.c:458:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_249->type
	jne	.L154	 ;,
 ; D:\TC\src\parser.c:458:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp414
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%r12), %rcx	 ; token_249->lexeme, token_249->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:458:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp576
	je	.L154	 ;,
 ; D:\TC\src\parser.c:462:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp578, token
 ; D:\TC\src\parser.c:464:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_256->type
	je	.L210	 ;,
.L156:
 ; D:\TC\src\parser.c:465:         increment = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, 56(%rsp)	 ; increment, %sfp
 ; D:\TC\src\parser.c:466:         if (increment == NULL)
	testq	%rax, %rax	 ; increment
	je	.L211	 ;,
.L158:
 ; D:\TC\src\parser.c:468:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp582, token
.L157:
 ; D:\TC\src\parser.c:470:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_265->type
	jne	.L159	 ;,
 ; D:\TC\src\parser.c:470:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp424
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%r12), %rcx	 ; token_265->lexeme, token_265->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:470:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp583
	je	.L159	 ;,
 ; D:\TC\src\parser.c:474:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp585, token
 ; D:\TC\src\parser.c:475:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_272->type
	jne	.L161	 ;,
 ; D:\TC\src\parser.c:475:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp429
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%r12), %rcx	 ; token_272->lexeme, token_272->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:475:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp586
	je	.L161	 ;,
 ; D:\TC\src\parser.c:479:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, %r14	 ; tmp588, body
 ; D:\TC\src\parser.c:480:     parser->in_loop = true;
	movb	$1, 10(%rdi)	 ;, parser_60(D)->in_loop
 ; D:\TC\src\parser.c:481:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp589, token
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r15	 ;, tmp498
	movq	%r13, 64(%rsp)	 ; initializer, %sfp
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L163	 ;
.L143:
 ; D:\TC\src\parser.c:435:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp563
 ; D:\TC\src\parser.c:435:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC35(%rip), %rcx	 ;, tmp398
	call	parser_error	 ;
 ; D:\TC\src\parser.c:436:         return NULL;
	movl	$0, %r9d	 ;, _293
.L145:
 ; D:\TC\src\parser.c:311:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$4, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp595, <retval>
 ; D:\TC\src\parser.c:311:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L109	 ;
.L206:
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp399
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rsi), %rcx	 ; token_224->lexeme, token_224->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:439:     Variable* initializer = NULL;
	movl	$0, %r13d	 ;, initializer
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp565
	jne	.L147	 ;,
	jmp	.L146	 ;
.L207:
 ; D:\TC\src\parser.c:443:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp567
 ; D:\TC\src\parser.c:443:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC36(%rip), %rcx	 ;, tmp403
	call	parser_error	 ;
	jmp	.L148	 ;
.L149:
 ; D:\TC\src\parser.c:447:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp570
 ; D:\TC\src\parser.c:447:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC37(%rip), %rcx	 ;, tmp408
	call	parser_error	 ;
 ; D:\TC\src\parser.c:448:         return NULL;
	movl	$0, %r9d	 ;, _293
	jmp	.L145	 ;
.L208:
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp409
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%r12), %rcx	 ; token_240->lexeme, token_240->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:451:     Expression* condition = NULL;
	movl	$0, %esi	 ;, condition
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp572
	jne	.L152	 ;,
	jmp	.L151	 ;
.L209:
 ; D:\TC\src\parser.c:455:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp574
 ; D:\TC\src\parser.c:455:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC38(%rip), %rcx	 ;, tmp413
	call	parser_error	 ;
	jmp	.L153	 ;
.L154:
 ; D:\TC\src\parser.c:459:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp577
 ; D:\TC\src\parser.c:459:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC39(%rip), %rcx	 ;, tmp418
	call	parser_error	 ;
 ; D:\TC\src\parser.c:460:         return NULL;
	movl	$0, %r9d	 ;, _293
	jmp	.L145	 ;
.L210:
 ; D:\TC\src\parser.c:464:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp419
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%r12), %rcx	 ; token_256->lexeme, token_256->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:463:     Expression* increment = NULL;
	movq	$0, 56(%rsp)	 ;, %sfp
 ; D:\TC\src\parser.c:464:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp579
	jne	.L157	 ;,
	jmp	.L156	 ;
.L211:
 ; D:\TC\src\parser.c:467:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp581
 ; D:\TC\src\parser.c:467:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC40(%rip), %rcx	 ;, tmp423
	call	parser_error	 ;
	jmp	.L158	 ;
.L159:
 ; D:\TC\src\parser.c:471:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp584
 ; D:\TC\src\parser.c:471:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC41(%rip), %rcx	 ;, tmp428
	call	parser_error	 ;
 ; D:\TC\src\parser.c:472:         return NULL;
	movl	$0, %r9d	 ;, _293
	jmp	.L145	 ;
.L161:
 ; D:\TC\src\parser.c:476:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp587
 ; D:\TC\src\parser.c:476:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC42(%rip), %rcx	 ;, tmp433
	call	parser_error	 ;
 ; D:\TC\src\parser.c:477:         return NULL;
	movl	$0, %r9d	 ;, _293
	jmp	.L145	 ;
.L165:
 ; D:\TC\src\parser.c:483:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r13	 ; tmp590, statement
 ; D:\TC\src\parser.c:484:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L212	 ;,
.L164:
 ; D:\TC\src\parser.c:486:         list_append(body, (pointer)statement);
	movq	%r13, %rdx	 ; statement,
	movq	%r14, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:487:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp592, token
.L163:
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_284->type
	jne	.L165	 ;,
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r15), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%r12), %rcx	 ; token_284->lexeme, token_284->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp593
	je	.L165	 ;,
 ; D:\TC\src\parser.c:489:     parser->in_loop = false;
	movq	64(%rsp), %r13	 ; %sfp, initializer
	movb	$0, 10(%rdi)	 ;, parser_60(D)->in_loop
 ; D:\TC\src\parser.c:490:     return create_for(initializer, condition, increment, body);
	movq	%r14, %r9	 ; body,
	movq	56(%rsp), %r8	 ; %sfp,
	movq	%rsi, %rdx	 ; condition,
	movq	%r13, %rcx	 ; initializer,
	call	create_for	 ;
	movq	%rax, %r9	 ; tmp594, _293
	jmp	.L145	 ;
.L212:
 ; D:\TC\src\parser.c:485:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp591
 ; D:\TC\src\parser.c:485:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC43(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L164	 ;
.L199:
 ; D:\TC\src\parser.c:494:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp597, token
 ; D:\TC\src\parser.c:495:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_295->type
	jne	.L167	 ;,
 ; D:\TC\src\parser.c:495:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp442
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_295->lexeme, token_295->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:495:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp598
	je	.L167	 ;,
 ; D:\TC\src\parser.c:499:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp600, token
 ; D:\TC\src\parser.c:500:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %r14	 ; tmp601, condition
 ; D:\TC\src\parser.c:501:     if (condition == NULL)
	testq	%rax, %rax	 ; condition
	je	.L213	 ;,
.L170:
 ; D:\TC\src\parser.c:503:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp603, token
 ; D:\TC\src\parser.c:504:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_306->type
	jne	.L171	 ;,
 ; D:\TC\src\parser.c:504:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp449
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_306->lexeme, token_306->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:504:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp604
	je	.L171	 ;,
 ; D:\TC\src\parser.c:508:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp606, token
 ; D:\TC\src\parser.c:509:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_313->type
	jne	.L173	 ;,
 ; D:\TC\src\parser.c:509:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp454
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%rsi), %rcx	 ; token_313->lexeme, token_313->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:509:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp607
	je	.L173	 ;,
 ; D:\TC\src\parser.c:513:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, %r13	 ; tmp609, body
 ; D:\TC\src\parser.c:514:     parser->in_loop = true;
	movb	$1, 10(%rdi)	 ;, parser_60(D)->in_loop
 ; D:\TC\src\parser.c:515:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp610, token
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r15	 ;, tmp500
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L175	 ;
.L167:
 ; D:\TC\src\parser.c:496:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp599
 ; D:\TC\src\parser.c:496:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC44(%rip), %rcx	 ;, tmp446
	call	parser_error	 ;
 ; D:\TC\src\parser.c:497:         return NULL;
	movl	$0, %r8d	 ;, _331
.L169:
 ; D:\TC\src\parser.c:313:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$3, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp616, <retval>
 ; D:\TC\src\parser.c:313:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	jmp	.L109	 ;
.L213:
 ; D:\TC\src\parser.c:502:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp602
 ; D:\TC\src\parser.c:502:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC45(%rip), %rcx	 ;, tmp448
	call	parser_error	 ;
	jmp	.L170	 ;
.L171:
 ; D:\TC\src\parser.c:505:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp605
 ; D:\TC\src\parser.c:505:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC46(%rip), %rcx	 ;, tmp453
	call	parser_error	 ;
 ; D:\TC\src\parser.c:506:         return NULL;
	movl	$0, %r8d	 ;, _331
	jmp	.L169	 ;
.L173:
 ; D:\TC\src\parser.c:510:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp608
 ; D:\TC\src\parser.c:510:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC47(%rip), %rcx	 ;, tmp458
	call	parser_error	 ;
 ; D:\TC\src\parser.c:511:         return NULL;
	movl	$0, %r8d	 ;, _331
	jmp	.L169	 ;
.L177:
 ; D:\TC\src\parser.c:517:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %rsi	 ; tmp611, statement
 ; D:\TC\src\parser.c:518:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L214	 ;,
.L176:
 ; D:\TC\src\parser.c:520:         list_append(body, (pointer)statement);
	movq	%rsi, %rdx	 ; statement,
	movq	%r13, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:521:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp613, token
.L175:
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_325->type
	jne	.L177	 ;,
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r15), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%r12), %rcx	 ; token_325->lexeme, token_325->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp614
	je	.L177	 ;,
 ; D:\TC\src\parser.c:523:     parser->in_loop = false;
	movb	$0, 10(%rdi)	 ;, parser_60(D)->in_loop
 ; D:\TC\src\parser.c:524:     return create_while(condition, body);
	movq	%r13, %rdx	 ; body,
	movq	%r14, %rcx	 ; condition,
	call	create_while	 ;
	movq	%rax, %r8	 ; tmp615, _331
	jmp	.L169	 ;
.L214:
 ; D:\TC\src\parser.c:519:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp612
 ; D:\TC\src\parser.c:519:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%r12, %rdx	 ; token,
	leaq	.LC48(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L176	 ;
.L178:
 ; D:\TC\src\parser.c:317:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	movq	.refptr.RETURN_KEYWORD(%rip), %rax	 ;, tmp467
	movq	(%rax), %rdx	 ; RETURN_KEYWORD, RETURN_KEYWORD
	movq	(%rsi), %rcx	 ; token_58->lexeme, token_58->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:317:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	 ; tmp620
	je	.L180	 ;,
 ; D:\TC\src\parser.c:318:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:319:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_83->type
	je	.L215	 ;,
.L181:
 ; D:\TC\src\parser.c:321:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:321:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp624,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp625, <retval>
	jmp	.L179	 ;
.L215:
 ; D:\TC\src\parser.c:319:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rdx	 ;, tmp470
	movq	(%rdx), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rax), %rcx	 ; token_83->lexeme, token_83->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:319:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp622
	je	.L181	 ;,
 ; D:\TC\src\parser.c:320:                 return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp623, <retval>
	jmp	.L109	 ;
.L180:
 ; D:\TC\src\parser.c:322:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	movq	.refptr.BREAK_KEYWORD(%rip), %rax	 ;, tmp473
	movq	(%rax), %rdx	 ; BREAK_KEYWORD, BREAK_KEYWORD
	movq	(%rsi), %rcx	 ; token_58->lexeme, token_58->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:322:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	 ; tmp626
	je	.L182	 ;,
 ; D:\TC\src\parser.c:323:             if (!parser->in_loop) {
	cmpb	$0, 10(%rdi)	 ;, parser_60(D)->in_loop
	je	.L216	 ;,
 ; D:\TC\src\parser.c:327:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$6, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp628, <retval>
	jmp	.L179	 ;
.L216:
 ; D:\TC\src\parser.c:324:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp627
 ; D:\TC\src\parser.c:324:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC49(%rip), %rcx	 ;, tmp477
	call	parser_error	 ;
 ; D:\TC\src\parser.c:325:                 return NULL;
	movl	$0, %ebp	 ;, <retval>
	jmp	.L109	 ;
.L182:
 ; D:\TC\src\parser.c:328:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax	 ;, tmp478
	movq	(%rax), %rdx	 ; CONTINUE_KEYWORD, CONTINUE_KEYWORD
	movq	(%rsi), %rcx	 ; token_58->lexeme, token_58->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:328:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	 ; tmp629
	je	.L184	 ;,
 ; D:\TC\src\parser.c:329:             if (!parser->in_loop) {
	cmpb	$0, 10(%rdi)	 ;, parser_60(D)->in_loop
	je	.L217	 ;,
 ; D:\TC\src\parser.c:333:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$7, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp631, <retval>
	jmp	.L179	 ;
.L217:
 ; D:\TC\src\parser.c:330:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file,
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp630
 ; D:\TC\src\parser.c:330:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC50(%rip), %rcx	 ;, tmp481
	call	parser_error	 ;
 ; D:\TC\src\parser.c:331:                 return NULL;
	movl	$0, %ebp	 ;, <retval>
	jmp	.L109	 ;
.L184:
 ; D:\TC\src\parser.c:335:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:335:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp632,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp633, <retval>
	jmp	.L179	 ;
.L195:
 ; D:\TC\src\parser.c:340:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_60(D)->source_file, parser_60(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp637
 ; D:\TC\src\parser.c:340:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC51(%rip), %rcx	 ;, tmp483
	call	parser_error	 ;
	jmp	.L186	 ;
.L196:
 ; D:\TC\src\parser.c:342:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp484
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rbx), %rcx	 ; token_108->lexeme, token_108->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:342:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp639
	jne	.L109	 ;,
	jmp	.L187	 ;
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
	.ascii "Expected ';' after class variable declaration\0"
	.align 8
.LC86:
	.ascii "Unexpected token in class member\0"
	.align 8
.LC87:
	.ascii "Constructor name conflicts with existing member\0"
	.align 8
.LC88:
	.ascii "Failed to parse class declaration\0"
	.align 8
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
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$152, %rsp	 ;,
	movq	%rcx, %r15	 ; tmp574, lexer
	movq	%rdx, %rbx	 ; tmp575, now_scope
	movq	%r8, %r14	 ; tmp576, parser
 ; D:\TC\src\parser.c:21:     if (builtin_scope == NULL) {
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp358
 ; D:\TC\src\parser.c:21:     if (builtin_scope == NULL) {
	cmpq	$0, (%rax)	 ;, builtin_scope
	je	.L317	 ;,
.L219:
 ; D:\TC\src\parser.c:29:     if (now_scope == NULL)
	testq	%rbx, %rbx	 ; now_scope
	je	.L318	 ;,
.L220:
 ; D:\TC\src\parser.c:32:     list(CodeMember*) members = create_list();
	call	create_list	 ;
	movq	%rax, 64(%rsp)	 ; tmp583, %sfp
 ; D:\TC\src\parser.c:33:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	%rbx, %rcx	 ; now_scope,
	call	create_symbol_table	 ;
	movq	%rax, 56(%rsp)	 ; tmp584, %sfp
 ; D:\TC\src\parser.c:34:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r15, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:35:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L222	 ;,
	movq	%r15, %r13	 ; lexer, lexer
	movq	%rax, %r15	 ; token, token
	jmp	.L221	 ;
.L317:
 ; D:\TC\src\parser.c:22:         builtin_scope = create_symbol_table(NULL);
	movl	$0, %ecx	 ;,
	call	create_symbol_table	 ;
	movq	%rax, %r9	 ; tmp577, _2
 ; D:\TC\src\parser.c:22:         builtin_scope = create_symbol_table(NULL);
	movq	.refptr.builtin_scope(%rip), %rsi	 ;, tmp359
	movq	%rax, (%rsi)	 ; _2, builtin_scope
 ; D:\TC\src\parser.c:23:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp360
	movq	(%rax), %rcx	 ; VOID_KEYWORD, VOID_KEYWORD
	movl	$0, %r8d	 ;,
	movl	$5, %edx	 ;,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:23:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp362
	movq	%rax, (%rdx)	 ; tmp578, name_void
 ; D:\TC\src\parser.c:24:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp365
	movq	(%rax), %rcx	 ; INT_KEYWORD, INT_KEYWORD
	movq	(%rsi), %r9	 ; builtin_scope,
	movl	$0, %r8d	 ;,
	movl	$5, %edx	 ;,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:24:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp367
	movq	%rax, (%rdx)	 ; tmp579, name_int
 ; D:\TC\src\parser.c:25:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp370
	movq	(%rax), %rcx	 ; FLOAT_KEYWORD, FLOAT_KEYWORD
	movq	(%rsi), %r9	 ; builtin_scope,
	movl	$0, %r8d	 ;,
	movl	$5, %edx	 ;,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:25:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp372
	movq	%rax, (%rdx)	 ; tmp580, name_float
 ; D:\TC\src\parser.c:26:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp375
	movq	(%rax), %rcx	 ; STRING_KEYWORD, STRING_KEYWORD
	movq	(%rsi), %r9	 ; builtin_scope,
	movl	$0, %r8d	 ;,
	movl	$5, %edx	 ;,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:26:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp377
	movq	%rax, (%rdx)	 ; tmp581, name_string
 ; D:\TC\src\parser.c:27:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp380
	movq	(%rax), %rcx	 ; BOOL_KEYWORD, BOOL_KEYWORD
	movq	(%rsi), %r9	 ; builtin_scope,
	movl	$0, %r8d	 ;,
	movl	$5, %edx	 ;,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:27:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp382
	movq	%rax, (%rdx)	 ; tmp582, name_bool
	jmp	.L219	 ;
.L318:
 ; D:\TC\src\parser.c:30:         now_scope = builtin_scope;
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp383
	movq	(%rax), %rbx	 ; builtin_scope, now_scope
	jmp	.L220	 ;
.L337:
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax	 ;, tmp747
	movq	(%rax), %rdx	 ; IMPORT_KEYWORD, IMPORT_KEYWORD
	movq	(%r15), %rcx	 ; token_474->lexeme, token_474->lexeme
	call	string_equal	 ;
	movl	%eax, %esi	 ; tmp586, have_return
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	testb	%al, %al	 ; have_return
	jne	.L319	 ;,
 ; D:\TC\src\parser.c:41:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	cmpl	$6, 24(%r15)	 ;, token_474->type
	jne	.L259	 ;,
 ; D:\TC\src\parser.c:41:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	.refptr.FUNC_KEYWORD(%rip), %rax	 ;, tmp748
	movq	(%rax), %rdx	 ; FUNC_KEYWORD, FUNC_KEYWORD
	movq	(%r15), %rcx	 ; token_474->lexeme, token_474->lexeme
	call	string_equal	 ;
	movb	%al, 95(%rsp)	 ; _26, %sfp
 ; D:\TC\src\parser.c:41:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	testb	%al, %al	 ; _26
	jne	.L320	 ;,
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	cmpl	$6, 24(%r15)	 ;, token_474->type
	jne	.L259	 ;,
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	.refptr.CLASS_KEYWORD(%rip), %rax	 ;, tmp754
	movq	(%rax), %rdx	 ; CLASS_KEYWORD, CLASS_KEYWORD
	movq	(%r15), %rcx	 ; token_474->lexeme, token_474->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	testb	%al, %al	 ; tmp640
	je	.L259	 ;,
 ; D:\TC\src\parser.c:232:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	56(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
	movq	%rax, 48(%rsp)	 ; tmp641, %sfp
 ; D:\TC\src\parser.c:233:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp642, token
 ; D:\TC\src\parser.c:234:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_213->type
	jne	.L321	 ;,
 ; D:\TC\src\parser.c:238:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class_scope);
	movq	(%rax), %rcx	 ; token_213->lexeme, token_213->lexeme
	movq	48(%rsp), %r9	 ; %sfp,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, 80(%rsp)	 ; tmp644, %sfp
 ; D:\TC\src\parser.c:239:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp645, token
 ; D:\TC\src\parser.c:240:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_219->type
	jne	.L262	 ;,
 ; D:\TC\src\parser.c:240:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp461
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%rbx), %rcx	 ; token_219->lexeme, token_219->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:240:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp646
	je	.L262	 ;,
 ; D:\TC\src\parser.c:244:     list(ClassMember*) members = create_list();
	call	create_list	 ;
	movq	%rax, 72(%rsp)	 ; tmp648, %sfp
 ; D:\TC\src\parser.c:245:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12	 ;, tmp568
	movq	%r15, 120(%rsp)	 ; token, %sfp
	movq	%rax, %rbx	 ; token, token
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L264	 ;
.L319:
 ; D:\TC\src\parser.c:59:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp587, token
 ; D:\TC\src\parser.c:60:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_101->type
	jne	.L322	 ;,
 ; D:\TC\src\parser.c:64:     string import_name = token->lexeme;
	movq	(%rax), %rdi	 ; token_101->lexeme, import_name
 ; D:\TC\src\parser.c:66:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp589, token
 ; D:\TC\src\parser.c:65:     string source = NULL;
	movl	$0, %esi	 ;, source
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_106->type
	je	.L323	 ;,
.L227:
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_117->type
	jne	.L229	 ;,
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp394
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rbx), %rcx	 ; token_117->lexeme, token_117->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp594
	je	.L229	 ;,
 ; D:\TC\src\parser.c:81:     name = parse_import_file(import_name, source, now_scope, parser->source_file);
	movq	(%r14), %r9	 ; parser_74(D)->source_file,
	movq	56(%rsp), %r8	 ; %sfp,
	movq	%rsi, %rdx	 ; source,
	movq	%rdi, %rcx	 ; import_name,
	call	parse_import_file	 ;
	movq	%rax, %rcx	 ; tmp596, name
 ; D:\TC\src\parser.c:82:     if (name == NULL) {
	testq	%rax, %rax	 ; name
	je	.L324	 ;,
.L231:
 ; D:\TC\src\parser.c:86:     return create_import(name, source);
	movq	%rsi, %rdx	 ; source,
	call	create_import	 ;
	movq	%rax, %rdx	 ; tmp599, _132
 ; D:\TC\src\parser.c:38:             if (import == NULL)
	testq	%rax, %rax	 ; _132
	je	.L303	 ;,
.L232:
 ; D:\TC\src\parser.c:40:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ; tmp601, _22
 ; D:\TC\src\parser.c:40:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	64(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	jmp	.L233	 ;
.L322:
 ; D:\TC\src\parser.c:61:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp588
 ; D:\TC\src\parser.c:61:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC53(%rip), %rcx	 ;, tmp388
	call	parser_error	 ;
 ; D:\TC\src\parser.c:62:         return NULL;
	jmp	.L303	 ;
.L323:
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	.refptr.FROM_KEYWORD(%rip), %rax	 ;, tmp389
	movq	(%rax), %rdx	 ; FROM_KEYWORD, FROM_KEYWORD
	movq	(%rbx), %rcx	 ; token_106->lexeme, token_106->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	testb	%al, %al	 ; tmp590
	je	.L227	 ;,
 ; D:\TC\src\parser.c:68:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp591, token
 ; D:\TC\src\parser.c:69:         if (token->type != STRING) {
	cmpl	$4, 24(%rax)	 ;, token_111->type
	jne	.L325	 ;,
 ; D:\TC\src\parser.c:73:         source = token->lexeme;
	movq	(%rax), %rsi	 ; token_111->lexeme, source
 ; D:\TC\src\parser.c:74:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp593, token
	jmp	.L227	 ;
.L325:
 ; D:\TC\src\parser.c:70:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp592
 ; D:\TC\src\parser.c:70:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC54(%rip), %rcx	 ;, tmp393
	call	parser_error	 ;
 ; D:\TC\src\parser.c:71:             return NULL;
	jmp	.L303	 ;
.L229:
 ; D:\TC\src\parser.c:77:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp595
 ; D:\TC\src\parser.c:77:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC55(%rip), %rcx	 ;, tmp398
	call	parser_error	 ;
.L303:
 ; D:\TC\src\parser.c:39:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp600
 ; D:\TC\src\parser.c:39:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC57(%rip), %rcx	 ;, tmp405
	call	parser_error	 ;
	movl	$0, %edx	 ;, _132
	jmp	.L232	 ;
.L324:
 ; D:\TC\src\parser.c:83:         fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
	call	__getreent	 ;
 ; D:\TC\src\parser.c:83:         fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
	movq	24(%rax), %rcx	 ; _127->_stderr, _127->_stderr
	movq	%rsi, %r9	 ; source,
	movq	%rdi, %r8	 ; import_name,
	leaq	.LC56(%rip), %rdx	 ;, tmp401
	call	fprintf	 ;
 ; D:\TC\src\parser.c:84:         name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
	movq	56(%rsp), %r9	 ; %sfp,
	movq	.refptr.name_void(%rip), %rax	 ;, tmp402
	movq	(%rax), %r8	 ; name_void,
	movl	$2, %edx	 ;,
	movq	%rdi, %rcx	 ; import_name,
	call	create_symbol	 ;
	movq	%rax, %rcx	 ; tmp598, name
	jmp	.L231	 ;
.L320:
 ; D:\TC\src\parser.c:90:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	56(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
	movq	%rax, %rdi	 ; tmp603, function_scope
 ; D:\TC\src\parser.c:91:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp604, token
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_135->type, _136
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _136
	je	.L235	 ;,
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _136
	jne	.L236	 ;,
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rbx), %rcx	 ; token_135->lexeme, token_135->lexeme
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp605
	je	.L236	 ;,
.L235:
 ; D:\TC\src\parser.c:96:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rdx	 ; token_135->lexeme, token_135->lexeme
	movq	56(%rsp), %rcx	 ; %sfp,
	call	search_name	 ;
	movq	%rax, 48(%rsp)	 ; return_type, %sfp
 ; D:\TC\src\parser.c:97:     if (return_type == NULL) {
	testq	%rax, %rax	 ; return_type
	je	.L326	 ;,
 ; D:\TC\src\parser.c:101:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp609, token
 ; D:\TC\src\parser.c:102:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_145->type
	jne	.L327	 ;,
 ; D:\TC\src\parser.c:106:     Symbol* name = create_symbol(token->lexeme, SYMBOL_SUBROUTINE, return_type, function_scope);
	movq	(%rax), %rcx	 ; token_145->lexeme, token_145->lexeme
	movq	%rdi, %r9	 ; function_scope,
	movq	48(%rsp), %r8	 ; %sfp,
	movl	$1, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, 80(%rsp)	 ; tmp611, %sfp
 ; D:\TC\src\parser.c:107:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp612, token
 ; D:\TC\src\parser.c:108:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_151->type
	jne	.L240	 ;,
 ; D:\TC\src\parser.c:108:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp418
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_151->lexeme, token_151->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:108:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp613
	je	.L240	 ;,
 ; D:\TC\src\parser.c:112:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp615, token
 ; D:\TC\src\parser.c:113:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rax, 72(%rsp)	 ; tmp616, %sfp
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r12	 ;, tmp559
 ; D:\TC\src\parser.c:125:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	%r12, %rbp	 ; tmp559, tmp561
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L242	 ;
.L236:
 ; D:\TC\src\parser.c:93:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp606
 ; D:\TC\src\parser.c:93:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC58(%rip), %rcx	 ;, tmp411
	call	parser_error	 ;
.L304:
 ; D:\TC\src\parser.c:44:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp638
 ; D:\TC\src\parser.c:44:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC69(%rip), %rcx	 ;, tmp454
	call	parser_error	 ;
	movl	$0, %r8d	 ;, _208
	jmp	.L258	 ;
.L326:
 ; D:\TC\src\parser.c:98:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp608
 ; D:\TC\src\parser.c:98:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC59(%rip), %rcx	 ;, tmp414
	call	parser_error	 ;
 ; D:\TC\src\parser.c:99:         return NULL;
	jmp	.L304	 ;
.L327:
 ; D:\TC\src\parser.c:103:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp610
 ; D:\TC\src\parser.c:103:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC60(%rip), %rcx	 ;, tmp416
	call	parser_error	 ;
 ; D:\TC\src\parser.c:104:         return NULL;
	jmp	.L304	 ;
.L240:
 ; D:\TC\src\parser.c:109:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp614
 ; D:\TC\src\parser.c:109:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC61(%rip), %rcx	 ;, tmp422
	call	parser_error	 ;
 ; D:\TC\src\parser.c:110:         return NULL;
	jmp	.L304	 ;
.L330:
 ; D:\TC\src\parser.c:117:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp618
 ; D:\TC\src\parser.c:117:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC62(%rip), %rcx	 ;, tmp424
	call	parser_error	 ;
	jmp	.L244	 ;
.L245:
 ; D:\TC\src\parser.c:121:             list_append(parameters, (pointer)parameter);
	movq	%rax, %rdx	 ; parameter,
	movq	72(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
	jmp	.L244	 ;
.L331:
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp751
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	movq	(%rbx), %rcx	 ; token_167->lexeme, token_167->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp621
	jne	.L328	 ;,
 ; D:\TC\src\parser.c:125:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_167->type
	jne	.L246	 ;,
 ; D:\TC\src\parser.c:125:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_167->lexeme, token_167->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:125:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp623
	je	.L246	 ;,
.L242:
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_163->type
	je	.L329	 ;,
.L249:
 ; D:\TC\src\parser.c:115:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	%r14, %r8	 ; parser,
	movq	%rdi, %rdx	 ; function_scope,
	movq	%r13, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:116:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	je	.L330	 ;,
 ; D:\TC\src\parser.c:118:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_160->value
	je	.L245	 ;,
 ; D:\TC\src\parser.c:119:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp619
 ; D:\TC\src\parser.c:119:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC63(%rip), %rcx	 ;, tmp426
	call	parser_error	 ;
.L244:
 ; D:\TC\src\parser.c:122:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp620, token
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_167->type
	je	.L331	 ;,
.L246:
 ; D:\TC\src\parser.c:126:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp624
 ; D:\TC\src\parser.c:126:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC64(%rip), %rcx	 ;, tmp434
	call	parser_error	 ;
 ; D:\TC\src\parser.c:127:             return NULL;
	jmp	.L304	 ;
.L328:
 ; D:\TC\src\parser.c:124:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp622, token
 ; D:\TC\src\parser.c:124:             token = get_next_token(lexer, true);
	jmp	.L242	 ;
.L329:
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_163->lexeme, token_163->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp625
	je	.L249	 ;,
 ; D:\TC\src\parser.c:130:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp626, token
 ; D:\TC\src\parser.c:131:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_183->type
	jne	.L250	 ;,
 ; D:\TC\src\parser.c:131:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp438
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%rbx), %rcx	 ; token_183->lexeme, token_183->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:131:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp627
	je	.L250	 ;,
 ; D:\TC\src\parser.c:135:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, %r12	 ; tmp629, body
 ; D:\TC\src\parser.c:136:     parser->in_function = true;
	movb	$1, 8(%r14)	 ;, parser_74(D)->in_function
 ; D:\TC\src\parser.c:138:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp630, token
 ; D:\TC\src\parser.c:139:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L252	 ;
.L250:
 ; D:\TC\src\parser.c:132:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp628
 ; D:\TC\src\parser.c:132:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC65(%rip), %rcx	 ;, tmp442
	call	parser_error	 ;
 ; D:\TC\src\parser.c:133:         return NULL;
	jmp	.L304	 ;
.L256:
 ; D:\TC\src\parser.c:140:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	%r14, %r8	 ; parser,
	movq	%rdi, %rdx	 ; function_scope,
	movq	%r13, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %rbx	 ; tmp631, statement
 ; D:\TC\src\parser.c:141:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L332	 ;,
 ; D:\TC\src\parser.c:143:         else if (have_return)
	testb	%sil, %sil	 ; have_return
	jne	.L333	 ;,
.L255:
 ; D:\TC\src\parser.c:146:             have_return = true;
	cmpl	$5, 8(%rbx)	 ;, statement_192->type
	movl	$1, %eax	 ;, tmp551
	cmove	%eax, %esi	 ; have_return,, tmp551, have_return
.L254:
 ; D:\TC\src\parser.c:147:         list_append(body, (pointer)statement);
	movq	%rbx, %rdx	 ; statement,
	movq	%r12, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:148:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp634, token
.L252:
 ; D:\TC\src\parser.c:139:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_195->type
	jne	.L256	 ;,
 ; D:\TC\src\parser.c:139:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp752
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_195->lexeme, token_195->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:139:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp635
	je	.L256	 ;,
 ; D:\TC\src\parser.c:150:     parser->in_function = false;
	movb	$0, 8(%r14)	 ;, parser_74(D)->in_function
 ; D:\TC\src\parser.c:151:     if (!have_return && return_type != name_void)
	testb	%sil, %sil	 ; have_return
	jne	.L257	 ;,
 ; D:\TC\src\parser.c:151:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp450
 ; D:\TC\src\parser.c:151:     if (!have_return && return_type != name_void)
	movq	48(%rsp), %rsi	 ; %sfp, return_type
	cmpq	(%rax), %rsi	 ; name_void, return_type
	je	.L257	 ;,
 ; D:\TC\src\parser.c:152:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp636
 ; D:\TC\src\parser.c:152:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC68(%rip), %rcx	 ;, tmp452
	call	parser_error	 ;
.L257:
 ; D:\TC\src\parser.c:153:     return create_function(name, return_type, parameters, body, function_scope);
	movq	%rdi, 32(%rsp)	 ; function_scope,
	movq	%r12, %r9	 ; body,
	movq	72(%rsp), %r8	 ; %sfp,
	movq	48(%rsp), %rdx	 ; %sfp,
	movq	80(%rsp), %rcx	 ; %sfp,
	call	create_function	 ;
	movq	%rax, %r8	 ; tmp637, _208
 ; D:\TC\src\parser.c:43:             if (function == NULL)
	testq	%rax, %rax	 ; _208
	je	.L304	 ;,
.L258:
 ; D:\TC\src\parser.c:45:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ; tmp639, _29
 ; D:\TC\src\parser.c:45:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	64(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:\TC\src\parser.c:41:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	jmp	.L233	 ;
.L332:
 ; D:\TC\src\parser.c:142:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp632
 ; D:\TC\src\parser.c:142:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC66(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L254	 ;
.L333:
 ; D:\TC\src\parser.c:144:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp633
 ; D:\TC\src\parser.c:144:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L255	 ;
.L321:
 ; D:\TC\src\parser.c:235:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp643
 ; D:\TC\src\parser.c:235:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC70(%rip), %rcx	 ;, tmp459
	call	parser_error	 ;
 ; D:\TC\src\parser.c:236:         return NULL;
	jmp	.L305	 ;
.L262:
 ; D:\TC\src\parser.c:241:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp647
 ; D:\TC\src\parser.c:241:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC71(%rip), %rcx	 ;, tmp465
	call	parser_error	 ;
.L305:
 ; D:\TC\src\parser.c:49:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp709
 ; D:\TC\src\parser.c:49:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC88(%rip), %rcx	 ;, tmp544
	call	parser_error	 ;
	movl	$0, %r9d	 ;, _269
	jmp	.L301	 ;
.L298:
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, 24(%rbx)	 ;, token_228->type
	je	.L334	 ;,
.L265:
 ; D:\TC\src\parser.c:262:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp701
 ; D:\TC\src\parser.c:262:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC86(%rip), %rcx	 ;, tmp533
	call	parser_error	 ;
.L295:
 ; D:\TC\src\parser.c:263:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp702, token
.L264:
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_228->type
	jne	.L298	 ;,
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rbx), %rcx	 ; token_228->lexeme, token_228->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp703
	je	.L298	 ;,
 ; D:\TC\src\parser.c:265:     Symbol* constructor = search_name(class_scope, CONSTRUCTOR_NAME);
	movq	120(%rsp), %r15	 ; %sfp, token
	movq	%rbx, %rdi	 ; token, token
	movq	.refptr.CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp537
	movq	(%rax), %rdx	 ; CONSTRUCTOR_NAME, CONSTRUCTOR_NAME
	movq	48(%rsp), %rcx	 ; %sfp,
	call	search_name	 ;
 ; D:\TC\src\parser.c:266:     if (constructor == NULL) {
	testq	%rax, %rax	 ; constructor
	je	.L335	 ;,
.L299:
 ; D:\TC\src\parser.c:270:     if (constructor->kind != SYMBOL_SUBROUTINE)
	cmpl	$1, 32(%rax)	 ;, constructor_265->kind
	jne	.L336	 ;,
.L300:
 ; D:\TC\src\parser.c:272:     return create_class(name, members, class_scope);
	movq	48(%rsp), %r8	 ; %sfp,
	movq	72(%rsp), %rdx	 ; %sfp,
	movq	80(%rsp), %rcx	 ; %sfp,
	call	create_class	 ;
	movq	%rax, %r9	 ; tmp708, _269
 ; D:\TC\src\parser.c:48:             if (class_ == NULL)
	testq	%rax, %rax	 ; _269
	je	.L305	 ;,
.L301:
 ; D:\TC\src\parser.c:50:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$2, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ; tmp710, _36
 ; D:\TC\src\parser.c:50:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	64(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
.L233:
 ; D:\TC\src\parser.c:53:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp712, token
 ; D:\TC\src\parser.c:35:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L222	 ;,
.L221:
 ; D:\TC\src\parser.c:35:     while (token != NULL && token->type != EOF_TOKEN) {
	movl	24(%r15), %eax	 ; token_474->type, _39
 ; D:\TC\src\parser.c:35:     while (token != NULL && token->type != EOF_TOKEN) {
	testl	%eax, %eax	 ; _39
	je	.L222	 ;,
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	 ;, _39
	je	.L337	 ;,
.L259:
 ; D:\TC\src\parser.c:52:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp711
 ; D:\TC\src\parser.c:52:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC89(%rip), %rcx	 ;, tmp546
	call	parser_error	 ;
	jmp	.L233	 ;
.L334:
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	.refptr.METHOD_KEYWORD(%rip), %rax	 ;, tmp755
	movq	(%rax), %rdx	 ; METHOD_KEYWORD, METHOD_KEYWORD
	movq	(%rbx), %rcx	 ; token_228->lexeme, token_228->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	testb	%al, %al	 ; tmp650
	jne	.L338	 ;,
 ; D:\TC\src\parser.c:252:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	cmpl	$6, 24(%rbx)	 ;, token_228->type
	jne	.L265	 ;,
 ; D:\TC\src\parser.c:252:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp760
	movq	(%rax), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD
	movq	(%rbx), %rcx	 ; token_228->lexeme, token_228->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:252:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; tmp693
	je	.L265	 ;,
 ; D:\TC\src\parser.c:253:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp694, token
 ; D:\TC\src\parser.c:254:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	%r14, %r8	 ; parser,
	movq	48(%rsp), %rdx	 ; %sfp,
	movq	%r13, %rcx	 ; lexer,
	call	parse_variable	 ;
	movq	%rax, %rbx	 ; tmp695, variable
 ; D:\TC\src\parser.c:255:             if (variable == NULL)
	testq	%rax, %rax	 ; variable
	je	.L339	 ;,
.L296:
 ; D:\TC\src\parser.c:257:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	%rbx, %r8	 ; variable,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_class_member	 ;
	movq	%rax, %rdx	 ; tmp697, _245
 ; D:\TC\src\parser.c:257:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	72(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:\TC\src\parser.c:258:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp698, token
 ; D:\TC\src\parser.c:259:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_246->type
	je	.L340	 ;,
.L297:
 ; D:\TC\src\parser.c:260:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp700
 ; D:\TC\src\parser.c:260:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC85(%rip), %rcx	 ;, tmp531
	call	parser_error	 ;
	jmp	.L295	 ;
.L338:
 ; D:\TC\src\parser.c:157:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	48(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
	movq	%rax, %r15	 ; tmp651, method_scope
 ; D:\TC\src\parser.c:158:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp469
	movq	(%rax), %rcx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	%r15, %r9	 ; method_scope,
	movq	80(%rsp), %r8	 ; %sfp,
	movl	$2, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, %rdi	 ; tmp652, self
 ; D:\TC\src\parser.c:159:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp653, token
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_274->type, _275
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _275
	je	.L267	 ;,
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _275
	jne	.L268	 ;,
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rsi), %rcx	 ; token_274->lexeme, token_274->lexeme
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp654
	je	.L268	 ;,
.L267:
 ; D:\TC\src\parser.c:164:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%rsi), %rdx	 ; token_274->lexeme, token_274->lexeme
	movq	48(%rsp), %rcx	 ; %sfp,
	call	search_name	 ;
	movq	%rax, 96(%rsp)	 ; return_type, %sfp
 ; D:\TC\src\parser.c:165:     if (return_type == NULL) {
	testq	%rax, %rax	 ; return_type
	je	.L341	 ;,
 ; D:\TC\src\parser.c:169:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp658, token
 ; D:\TC\src\parser.c:170:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_284->type
	jne	.L342	 ;,
 ; D:\TC\src\parser.c:174:     Symbol* name = create_symbol(token->lexeme, SYMBOL_SUBROUTINE, return_type, method_scope);
	movq	(%rax), %rcx	 ; token_284->lexeme, token_284->lexeme
	movq	%r15, %r9	 ; method_scope,
	movq	96(%rsp), %r8	 ; %sfp,
	movl	$1, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, 112(%rsp)	 ; tmp660, %sfp
 ; D:\TC\src\parser.c:175:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp661, token
 ; D:\TC\src\parser.c:176:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_290->type
	jne	.L272	 ;,
 ; D:\TC\src\parser.c:176:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp480
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_290->lexeme, token_290->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:176:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp662
	je	.L272	 ;,
 ; D:\TC\src\parser.c:180:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp664, token
 ; D:\TC\src\parser.c:181:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	cmpl	$6, 24(%rax)	 ;, token_297->type
	je	.L343	 ;,
.L274:
 ; D:\TC\src\parser.c:182:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp666
 ; D:\TC\src\parser.c:182:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC76(%rip), %rcx	 ;, tmp489
	call	parser_error	 ;
.L275:
 ; D:\TC\src\parser.c:183:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp667, token
 ; D:\TC\src\parser.c:184:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rax, %rbp	 ; tmp668, parameters
	movq	%rax, 104(%rsp)	 ; parameters, %sfp
 ; D:\TC\src\parser.c:185:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; self,
	movq	80(%rsp), %rcx	 ; %sfp,
	call	create_variable	 ;
	movq	%rax, %rdx	 ; tmp669, _306
 ; D:\TC\src\parser.c:185:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	%rbp, %rcx	 ; parameters,
	call	list_append	 ;
 ; D:\TC\src\parser.c:187:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rdi	 ;, tmp566
 ; D:\TC\src\parser.c:198:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	leaq	.LC79(%rip), %rbp	 ;, tmp567
 ; D:\TC\src\parser.c:186:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L276	 ;
.L268:
 ; D:\TC\src\parser.c:161:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp655
 ; D:\TC\src\parser.c:161:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC72(%rip), %rcx	 ;, tmp473
	call	parser_error	 ;
.L306:
 ; D:\TC\src\parser.c:250:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp691
 ; D:\TC\src\parser.c:250:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC83(%rip), %rcx	 ;, tmp521
	call	parser_error	 ;
	movl	$0, %edx	 ;, _355
	jmp	.L294	 ;
.L341:
 ; D:\TC\src\parser.c:166:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp657
 ; D:\TC\src\parser.c:166:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC73(%rip), %rcx	 ;, tmp476
	call	parser_error	 ;
 ; D:\TC\src\parser.c:167:         return NULL;
	jmp	.L306	 ;
.L342:
 ; D:\TC\src\parser.c:171:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp659
 ; D:\TC\src\parser.c:171:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC74(%rip), %rcx	 ;, tmp478
	call	parser_error	 ;
 ; D:\TC\src\parser.c:172:         return NULL;
	jmp	.L306	 ;
.L272:
 ; D:\TC\src\parser.c:177:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp663
 ; D:\TC\src\parser.c:177:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC75(%rip), %rcx	 ;, tmp484
	call	parser_error	 ;
 ; D:\TC\src\parser.c:178:         return NULL;
	jmp	.L306	 ;
.L343:
 ; D:\TC\src\parser.c:181:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp485
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	(%rsi), %rcx	 ; token_297->lexeme, token_297->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:181:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	testb	%al, %al	 ; tmp665
	jne	.L275	 ;,
	jmp	.L274	 ;
.L278:
 ; D:\TC\src\parser.c:189:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, 24(%rsi)	 ;, token_307->type
	jne	.L281	 ;,
 ; D:\TC\src\parser.c:189:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp493
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_307->lexeme, token_307->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:189:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	testb	%al, %al	 ; tmp673
	je	.L281	 ;,
.L282:
 ; D:\TC\src\parser.c:203:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp679, token
 ; D:\TC\src\parser.c:204:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_330->type
	jne	.L286	 ;,
 ; D:\TC\src\parser.c:204:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp505
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%rsi), %rcx	 ; token_330->lexeme, token_330->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:204:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp680
	je	.L286	 ;,
 ; D:\TC\src\parser.c:208:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, %rsi	 ; tmp682, body
	movq	%rax, 128(%rsp)	 ; body, %sfp
 ; D:\TC\src\parser.c:209:     parser->in_function = true;
	movb	$1, 8(%r14)	 ;, parser_74(D)->in_function
 ; D:\TC\src\parser.c:210:     parser->in_method = true;
	movb	$1, 9(%r14)	 ;, parser_74(D)->in_method
 ; D:\TC\src\parser.c:212:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp683, token
 ; D:\TC\src\parser.c:211:     bool have_return = false;
	movzbl	95(%rsp), %ebp	 ; %sfp, have_return
	movq	%rbx, 136(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L288	 ;
.L344:
 ; D:\TC\src\parser.c:196:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp675
 ; D:\TC\src\parser.c:196:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC78(%rip), %rcx	 ;, tmp499
	call	parser_error	 ;
	jmp	.L283	 ;
.L284:
 ; D:\TC\src\parser.c:200:             list_append(parameters, (pointer)parameter);
	movq	%rax, %rdx	 ; parameter,
	movq	104(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
	jmp	.L283	 ;
.L345:
 ; D:\TC\src\parser.c:186:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp757
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_307->lexeme, token_307->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:186:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp678
	jne	.L282	 ;,
 ; D:\TC\src\parser.c:187:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_307->type
	jne	.L281	 ;,
 ; D:\TC\src\parser.c:187:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	(%rdi), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	movq	(%rsi), %rcx	 ; token_307->lexeme, token_307->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:187:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp670
	je	.L278	 ;,
 ; D:\TC\src\parser.c:188:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp671, token
 ; D:\TC\src\parser.c:194:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	%r14, %r8	 ; parser,
	movq	%r15, %rdx	 ; method_scope,
	movq	%r13, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:195:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	je	.L344	 ;,
 ; D:\TC\src\parser.c:197:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_313->value
	je	.L284	 ;,
 ; D:\TC\src\parser.c:198:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp676
 ; D:\TC\src\parser.c:198:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	movq	%rbp, %rcx	 ; tmp567,
	call	parser_error	 ;
.L283:
 ; D:\TC\src\parser.c:201:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp677, token
.L276:
 ; D:\TC\src\parser.c:186:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_307->type
	je	.L345	 ;,
.L281:
 ; D:\TC\src\parser.c:191:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp674
 ; D:\TC\src\parser.c:191:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC77(%rip), %rcx	 ;, tmp497
	call	parser_error	 ;
 ; D:\TC\src\parser.c:192:             return NULL;
	jmp	.L306	 ;
.L286:
 ; D:\TC\src\parser.c:205:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp681
 ; D:\TC\src\parser.c:205:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC80(%rip), %rcx	 ;, tmp509
	call	parser_error	 ;
 ; D:\TC\src\parser.c:206:         return NULL;
	jmp	.L306	 ;
.L292:
 ; D:\TC\src\parser.c:214:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	%r14, %r8	 ; parser,
	movq	%r15, %rdx	 ; method_scope,
	movq	%r13, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %rbx	 ; tmp684, statement
 ; D:\TC\src\parser.c:215:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L346	 ;,
 ; D:\TC\src\parser.c:217:         else if (have_return)
	testb	%bpl, %bpl	 ; have_return
	jne	.L347	 ;,
.L291:
 ; D:\TC\src\parser.c:220:             have_return = true;
	cmpl	$5, 8(%rbx)	 ;, statement_339->type
	movl	$1, %eax	 ;, tmp555
	cmove	%eax, %ebp	 ; have_return,, tmp555, have_return
.L290:
 ; D:\TC\src\parser.c:221:         list_append(body, (pointer)statement);
	movq	%rbx, %rdx	 ; statement,
	movq	%rsi, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:222:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp687, token
.L288:
 ; D:\TC\src\parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rdi)	 ;, token_342->type
	jne	.L292	 ;,
 ; D:\TC\src\parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp758
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rdi), %rcx	 ; token_342->lexeme, token_342->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp688
	je	.L292	 ;,
 ; D:\TC\src\parser.c:224:     parser->in_function = false;
	movq	136(%rsp), %rbx	 ; %sfp, token
	movb	$0, 8(%r14)	 ;, parser_74(D)->in_function
 ; D:\TC\src\parser.c:225:     parser->in_method = false;
	movb	$0, 9(%r14)	 ;, parser_74(D)->in_method
 ; D:\TC\src\parser.c:226:     if (!have_return && return_type != name_void)
	testb	%bpl, %bpl	 ; have_return
	jne	.L293	 ;,
 ; D:\TC\src\parser.c:226:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp517
 ; D:\TC\src\parser.c:226:     if (!have_return && return_type != name_void)
	movq	96(%rsp), %rsi	 ; %sfp, return_type
	cmpq	(%rax), %rsi	 ; name_void, return_type
	je	.L293	 ;,
 ; D:\TC\src\parser.c:227:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp689
 ; D:\TC\src\parser.c:227:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC82(%rip), %rcx	 ;, tmp519
	call	parser_error	 ;
.L293:
 ; D:\TC\src\parser.c:228:     return create_method(name, return_type, parameters, body, method_scope);
	movq	%r15, 32(%rsp)	 ; method_scope,
	movq	128(%rsp), %r9	 ; %sfp,
	movq	104(%rsp), %r8	 ; %sfp,
	movq	96(%rsp), %rdx	 ; %sfp,
	movq	112(%rsp), %rcx	 ; %sfp,
	call	create_method	 ;
	movq	%rax, %rdx	 ; tmp690, _355
 ; D:\TC\src\parser.c:249:             if (method == NULL)
	testq	%rax, %rax	 ; _355
	je	.L306	 ;,
.L294:
 ; D:\TC\src\parser.c:251:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movl	$0, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_class_member	 ;
	movq	%rax, %rdx	 ; tmp692, _236
 ; D:\TC\src\parser.c:251:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	72(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	jmp	.L295	 ;
.L346:
 ; D:\TC\src\parser.c:216:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp685
 ; D:\TC\src\parser.c:216:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC81(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L290	 ;
.L347:
 ; D:\TC\src\parser.c:218:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp686
 ; D:\TC\src\parser.c:218:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L291	 ;
.L339:
 ; D:\TC\src\parser.c:256:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp696
 ; D:\TC\src\parser.c:256:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC84(%rip), %rcx	 ;, tmp526
	call	parser_error	 ;
	jmp	.L296	 ;
.L340:
 ; D:\TC\src\parser.c:259:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp527
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rbx), %rcx	 ; token_246->lexeme, token_246->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:259:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp699
	jne	.L295	 ;,
	jmp	.L297	 ;
.L335:
 ; D:\TC\src\parser.c:267:         SymbolTable* constructor_scope = create_symbol_table(class_scope);
	movq	48(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
	movq	%rax, %r9	 ;, tmp705
 ; D:\TC\src\parser.c:268:         constructor = create_symbol(CONSTRUCTOR_NAME, SYMBOL_SUBROUTINE, name, constructor_scope);
	movq	.refptr.CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp539
	movq	(%rax), %rcx	 ; CONSTRUCTOR_NAME, CONSTRUCTOR_NAME
	movq	80(%rsp), %r8	 ; %sfp,
	movl	$1, %edx	 ;,
	call	create_symbol	 ;
	jmp	.L299	 ;
.L336:
 ; D:\TC\src\parser.c:271:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	(%r14), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
	movq	%rax, %r8	 ;, tmp707
 ; D:\TC\src\parser.c:271:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC87(%rip), %rcx	 ;, tmp542
	call	parser_error	 ;
	jmp	.L300	 ;
.L222:
 ; D:\TC\src\parser.c:55:     return create_code(members, global_scope);
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	64(%rsp), %rcx	 ; %sfp,
	call	create_code	 ;
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
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	create_function;	.scl	2;	.type	32;	.endef
	.def	create_class;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	create_method;	.scl	2;	.type	32;	.endef
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
