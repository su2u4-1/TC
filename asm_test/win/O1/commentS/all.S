	.file	"all.c"
 ; GNU C17 (Rev6, Built by MSYS2 project) version 13.2.0 (x86_64-w64-mingw32)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.def	list_pop;	.scl	3;	.type	32;	.endef
list_pop:
 ; ./asm_test/win/i/all.c:1045:     if (list == NULL || list->head == NULL)
	testq	%rcx, %rcx	 ; list
	je	.L4	 ;,
 ; ./asm_test/win/i/all.c:1045:     if (list == NULL || list->head == NULL)
	movq	(%rcx), %rax	 ; list_6(D)->head, <retval>
 ; ./asm_test/win/i/all.c:1045:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	 ; <retval>
	je	.L1	 ;,
 ; ./asm_test/win/i/all.c:1048:     list->head = head_node->next;
	movq	(%rax), %rdx	 ; _1->next, _2
 ; ./asm_test/win/i/all.c:1048:     list->head = head_node->next;
	movq	%rdx, (%rcx)	 ; _2, list_6(D)->head
 ; ./asm_test/win/i/all.c:1049:     if (list->head == NULL)
	testq	%rdx, %rdx	 ; _2
	je	.L5	 ;,
.L3:
 ; ./asm_test/win/i/all.c:1051:     return head_node->content;
	movq	8(%rax), %rax	 ; _1->content, <retval>
	ret	
.L5:
 ; ./asm_test/win/i/all.c:1050:         list->tail = NULL;
	movq	$0, 8(%rcx)	 ;, list_6(D)->tail
	jmp	.L3	 ;
.L4:
 ; ./asm_test/win/i/all.c:1046:         return NULL;
	movq	%rcx, %rax	 ; list, <retval>
.L1:
 ; ./asm_test/win/i/all.c:1052: }
	ret	
	.def	list_pop_back;	.scl	3;	.type	32;	.endef
list_pop_back:
 ; ./asm_test/win/i/all.c:1054:     if (list == NULL || list->head == NULL)
	testq	%rcx, %rcx	 ; list
	je	.L9	 ;,
 ; ./asm_test/win/i/all.c:1054:     if (list == NULL || list->head == NULL)
	movq	(%rcx), %rax	 ; list_7(D)->head, <retval>
 ; ./asm_test/win/i/all.c:1054:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	 ; <retval>
	je	.L6	 ;,
 ; ./asm_test/win/i/all.c:1056:     if (list->head == list->tail) {
	movq	8(%rcx), %rdx	 ; list_7(D)->tail, _2
 ; ./asm_test/win/i/all.c:1056:     if (list->head == list->tail) {
	cmpq	%rdx, %rax	 ; _2, <retval>
	je	.L12	 ;,
.L8:
	movq	%rax, %r8	 ; <retval>, current
 ; ./asm_test/win/i/all.c:1063:     while (current->next != list->tail)
	movq	(%rax), %rax	 ; current_4->next, <retval>
 ; ./asm_test/win/i/all.c:1063:     while (current->next != list->tail)
	cmpq	%rax, %rdx	 ; <retval>, _2
	jne	.L8	 ;,
 ; ./asm_test/win/i/all.c:1065:     size_t* content = list->tail->content;
	movq	8(%rdx), %rax	 ; _2->content, <retval>
 ; ./asm_test/win/i/all.c:1066:     current->next = NULL;
	movq	$0, (%r8)	 ;, current_15->next
 ; ./asm_test/win/i/all.c:1067:     list->tail = current;
	movq	%r8, 8(%rcx)	 ; current, list_7(D)->tail
 ; ./asm_test/win/i/all.c:1068:     return content;
	ret	
.L12:
 ; ./asm_test/win/i/all.c:1057:         size_t* content = list->head->content;
	movq	8(%rax), %rax	 ; _1->content, <retval>
 ; ./asm_test/win/i/all.c:1058:         list->head = NULL;
	movq	$0, (%rcx)	 ;, list_7(D)->head
 ; ./asm_test/win/i/all.c:1059:         list->tail = NULL;
	movq	$0, 8(%rcx)	 ;, list_7(D)->tail
 ; ./asm_test/win/i/all.c:1060:         return content;
	ret	
.L9:
 ; ./asm_test/win/i/all.c:1055:         return NULL;
	movq	%rcx, %rax	 ; list, <retval>
.L6:
 ; ./asm_test/win/i/all.c:1069: }
	ret	
	.def	search_name;	.scl	3;	.type	32;	.endef
search_name:
 ; ./asm_test/win/i/all.c:1132:     while (scope != NULL) {
	testq	%rcx, %rcx	 ; scope
	je	.L18	 ;,
.L17:
 ; ./asm_test/win/i/all.c:1134:         Node* current = names->head;
	movq	8(%rcx), %rax	 ; scope_15->symbols, scope_15->symbols
	movq	(%rax), %rax	 ; names_7->head, current
 ; ./asm_test/win/i/all.c:1135:         while (current != NULL) {
	testq	%rax, %rax	 ; current
	je	.L15	 ;,
.L16:
 ; ./asm_test/win/i/all.c:1136:             Symbol* current_name = (Symbol*)current->content;
	movq	8(%rax), %r8	 ; current_16->content, <retval>
 ; ./asm_test/win/i/all.c:1137:             if (current_name->name == name)
	cmpq	%rdx, 8(%r8)	 ; name, current_name_10->name
	je	.L13	 ;,
 ; ./asm_test/win/i/all.c:1139:             current = current->next;
	movq	(%rax), %rax	 ; current_16->next, current
 ; ./asm_test/win/i/all.c:1135:         while (current != NULL) {
	testq	%rax, %rax	 ; current
	jne	.L16	 ;,
.L15:
 ; ./asm_test/win/i/all.c:1141:         scope = scope->parent;
	movq	(%rcx), %rcx	 ; scope_15->parent, scope
 ; ./asm_test/win/i/all.c:1132:     while (scope != NULL) {
	testq	%rcx, %rcx	 ; scope
	jne	.L17	 ;,
 ; ./asm_test/win/i/all.c:1143:     return NULL;
	movq	%rcx, %r8	 ; scope, <retval>
	jmp	.L13	 ;
.L18:
	movq	%rcx, %r8	 ; scope, <retval>
.L13:
 ; ./asm_test/win/i/all.c:1144: }
	movq	%r8, %rax	 ; <retval>,
	ret	
	.def	string_to_operator;	.scl	3;	.type	32;	.endef
string_to_operator:
 ; ./asm_test/win/i/all.c:1198:     if (str == symbolList[18]) return OP_ASSIGN;
	cmpq	%rcx, 144+symbolList(%rip)	 ; str, symbolList[18]
	je	.L23	 ;,
 ; ./asm_test/win/i/all.c:1199:     else if (str == symbolList[23]) return OP_ADD_ASSIGN;
	cmpq	%rcx, 184+symbolList(%rip)	 ; str, symbolList[23]
	je	.L24	 ;,
 ; ./asm_test/win/i/all.c:1200:     else if (str == symbolList[24]) return OP_SUB_ASSIGN;
	cmpq	%rcx, 192+symbolList(%rip)	 ; str, symbolList[24]
	je	.L25	 ;,
 ; ./asm_test/win/i/all.c:1201:     else if (str == symbolList[25]) return OP_MUL_ASSIGN;
	cmpq	%rcx, 200+symbolList(%rip)	 ; str, symbolList[25]
	je	.L26	 ;,
 ; ./asm_test/win/i/all.c:1202:     else if (str == symbolList[26]) return OP_DIV_ASSIGN;
	cmpq	%rcx, 208+symbolList(%rip)	 ; str, symbolList[26]
	je	.L27	 ;,
 ; ./asm_test/win/i/all.c:1203:     else if (str == symbolList[27]) return OP_MOD_ASSIGN;
	cmpq	%rcx, 216+symbolList(%rip)	 ; str, symbolList[27]
	je	.L28	 ;,
 ; ./asm_test/win/i/all.c:1204:     else if (str == symbolList[28]) return OP_AND;
	cmpq	%rcx, 224+symbolList(%rip)	 ; str, symbolList[28]
	je	.L29	 ;,
 ; ./asm_test/win/i/all.c:1205:     else if (str == symbolList[29]) return OP_OR;
	cmpq	%rcx, 232+symbolList(%rip)	 ; str, symbolList[29]
	je	.L30	 ;,
 ; ./asm_test/win/i/all.c:1206:     else if (str == symbolList[19]) return OP_EQ;
	cmpq	%rcx, 152+symbolList(%rip)	 ; str, symbolList[19]
	je	.L31	 ;,
 ; ./asm_test/win/i/all.c:1207:     else if (str == symbolList[20]) return OP_NE;
	cmpq	%rcx, 160+symbolList(%rip)	 ; str, symbolList[20]
	je	.L32	 ;,
 ; ./asm_test/win/i/all.c:1208:     else if (str == symbolList[16]) return OP_LT;
	cmpq	%rcx, 128+symbolList(%rip)	 ; str, symbolList[16]
	je	.L33	 ;,
 ; ./asm_test/win/i/all.c:1209:     else if (str == symbolList[17]) return OP_GT;
	cmpq	%rcx, 136+symbolList(%rip)	 ; str, symbolList[17]
	je	.L34	 ;,
 ; ./asm_test/win/i/all.c:1210:     else if (str == symbolList[21]) return OP_LE;
	cmpq	%rcx, 168+symbolList(%rip)	 ; str, symbolList[21]
	je	.L35	 ;,
 ; ./asm_test/win/i/all.c:1211:     else if (str == symbolList[22]) return OP_GE;
	cmpq	%rcx, 176+symbolList(%rip)	 ; str, symbolList[22]
	je	.L36	 ;,
 ; ./asm_test/win/i/all.c:1212:     else if (str == symbolList[11]) return OP_ADD;
	cmpq	%rcx, 88+symbolList(%rip)	 ; str, symbolList[11]
	je	.L37	 ;,
 ; ./asm_test/win/i/all.c:1213:     else if (str == symbolList[12]) return OP_SUB;
	cmpq	%rcx, 96+symbolList(%rip)	 ; str, symbolList[12]
	je	.L38	 ;,
 ; ./asm_test/win/i/all.c:1214:     else if (str == symbolList[13]) return OP_MUL;
	cmpq	%rcx, 104+symbolList(%rip)	 ; str, symbolList[13]
	je	.L39	 ;,
 ; ./asm_test/win/i/all.c:1215:     else if (str == symbolList[14]) return OP_DIV;
	cmpq	%rcx, 112+symbolList(%rip)	 ; str, symbolList[14]
	je	.L40	 ;,
 ; ./asm_test/win/i/all.c:1216:     else if (str == symbolList[15]) return OP_MOD;
	cmpq	%rcx, 120+symbolList(%rip)	 ; str, symbolList[15]
	movl	$19, %eax	 ;, tmp127
	movl	$4, %edx	 ;, tmp128
	cmove	%edx, %eax	 ; tmp127,, tmp128, <retval>
	ret	
.L23:
 ; ./asm_test/win/i/all.c:1198:     if (str == symbolList[18]) return OP_ASSIGN;
	movl	$13, %eax	 ;, <retval>
	ret	
.L24:
 ; ./asm_test/win/i/all.c:1199:     else if (str == symbolList[23]) return OP_ADD_ASSIGN;
	movl	$14, %eax	 ;, <retval>
	ret	
.L25:
 ; ./asm_test/win/i/all.c:1200:     else if (str == symbolList[24]) return OP_SUB_ASSIGN;
	movl	$15, %eax	 ;, <retval>
	ret	
.L26:
 ; ./asm_test/win/i/all.c:1201:     else if (str == symbolList[25]) return OP_MUL_ASSIGN;
	movl	$16, %eax	 ;, <retval>
	ret	
.L27:
 ; ./asm_test/win/i/all.c:1202:     else if (str == symbolList[26]) return OP_DIV_ASSIGN;
	movl	$17, %eax	 ;, <retval>
	ret	
.L28:
 ; ./asm_test/win/i/all.c:1203:     else if (str == symbolList[27]) return OP_MOD_ASSIGN;
	movl	$18, %eax	 ;, <retval>
	ret	
.L29:
 ; ./asm_test/win/i/all.c:1204:     else if (str == symbolList[28]) return OP_AND;
	movl	$11, %eax	 ;, <retval>
	ret	
.L30:
 ; ./asm_test/win/i/all.c:1205:     else if (str == symbolList[29]) return OP_OR;
	movl	$12, %eax	 ;, <retval>
	ret	
.L31:
 ; ./asm_test/win/i/all.c:1206:     else if (str == symbolList[19]) return OP_EQ;
	movl	$5, %eax	 ;, <retval>
	ret	
.L32:
 ; ./asm_test/win/i/all.c:1207:     else if (str == symbolList[20]) return OP_NE;
	movl	$6, %eax	 ;, <retval>
	ret	
.L33:
 ; ./asm_test/win/i/all.c:1208:     else if (str == symbolList[16]) return OP_LT;
	movl	$7, %eax	 ;, <retval>
	ret	
.L34:
 ; ./asm_test/win/i/all.c:1209:     else if (str == symbolList[17]) return OP_GT;
	movl	$8, %eax	 ;, <retval>
	ret	
.L35:
 ; ./asm_test/win/i/all.c:1210:     else if (str == symbolList[21]) return OP_LE;
	movl	$9, %eax	 ;, <retval>
	ret	
.L36:
 ; ./asm_test/win/i/all.c:1211:     else if (str == symbolList[22]) return OP_GE;
	movl	$10, %eax	 ;, <retval>
	ret	
.L37:
 ; ./asm_test/win/i/all.c:1212:     else if (str == symbolList[11]) return OP_ADD;
	movl	$0, %eax	 ;, <retval>
	ret	
.L38:
 ; ./asm_test/win/i/all.c:1213:     else if (str == symbolList[12]) return OP_SUB;
	movl	$1, %eax	 ;, <retval>
	ret	
.L39:
 ; ./asm_test/win/i/all.c:1214:     else if (str == symbolList[13]) return OP_MUL;
	movl	$2, %eax	 ;, <retval>
	ret	
.L40:
 ; ./asm_test/win/i/all.c:1215:     else if (str == symbolList[14]) return OP_DIV;
	movl	$3, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:1218: }
	ret	
	.def	operator_precedence;	.scl	3;	.type	32;	.endef
operator_precedence:
 ; ./asm_test/win/i/all.c:1220:     switch (op) {
	cmpl	$18, %ecx	 ;, op
	ja	.L43	 ;,
	movl	%ecx, %ecx	 ; op, op
	leaq	.L45(%rip), %rdx	 ;, tmp85
	movslq	(%rdx,%rcx,4), %rax	 ;, tmp87
	addq	%rdx, %rax	 ; tmp85, tmp88
	jmp	*%rax	 ; tmp88
	.section .rdata,"dr"
	.align 4
.L45:
	.long	.L49-.L45
	.long	.L49-.L45
	.long	.L48-.L45
	.long	.L48-.L45
	.long	.L48-.L45
	.long	.L47-.L45
	.long	.L47-.L45
	.long	.L47-.L45
	.long	.L47-.L45
	.long	.L47-.L45
	.long	.L47-.L45
	.long	.L50-.L45
	.long	.L50-.L45
	.long	.L44-.L45
	.long	.L44-.L45
	.long	.L44-.L45
	.long	.L44-.L45
	.long	.L44-.L45
	.long	.L44-.L45
	.text
.L44:
 ; ./asm_test/win/i/all.c:1227:             return 1;
	movl	$1, %eax	 ;, <retval>
	ret	
.L47:
 ; ./asm_test/win/i/all.c:1237:             return 3;
	movl	$3, %eax	 ;, <retval>
	ret	
.L49:
 ; ./asm_test/win/i/all.c:1240:             return 4;
	movl	$4, %eax	 ;, <retval>
	ret	
.L48:
 ; ./asm_test/win/i/all.c:1244:             return 5;
	movl	$5, %eax	 ;, <retval>
	ret	
.L43:
 ; ./asm_test/win/i/all.c:1247:             return 0;
	movl	$0, %eax	 ;, <retval>
	ret	
.L50:
 ; ./asm_test/win/i/all.c:1220:     switch (op) {
	movl	$2, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:1249: }
	ret	
	.def	get_current_char;	.scl	3;	.type	32;	.endef
get_current_char:
 ; ./asm_test/win/i/all.c:1299:     if (lexer->position >= lexer->length)
	movq	16(%rcx), %rax	 ; lexer_11(D)->position, _1
 ; ./asm_test/win/i/all.c:1300:         return '\0';
	movl	$0, %edx	 ;, <retval>
 ; ./asm_test/win/i/all.c:1299:     if (lexer->position >= lexer->length)
	cmpq	24(%rcx), %rax	 ; lexer_11(D)->length, _1
	jnb	.L51	 ;,
 ; ./asm_test/win/i/all.c:1301:     lexer->column++;
	addq	$1, 40(%rcx)	 ;, lexer_11(D)->column
 ; ./asm_test/win/i/all.c:1302:     return lexer->source[lexer->position++];
	movq	8(%rcx), %rdx	 ; lexer_11(D)->source, _5
 ; ./asm_test/win/i/all.c:1302:     return lexer->source[lexer->position++];
	leaq	1(%rax), %r8	 ;, tmp91
	movq	%r8, 16(%rcx)	 ; tmp91, lexer_11(D)->position
 ; ./asm_test/win/i/all.c:1302:     return lexer->source[lexer->position++];
	movzbl	(%rdx,%rax), %edx	 ; *_7, <retval>
.L51:
 ; ./asm_test/win/i/all.c:1303: }
	movl	%edx, %eax	 ; <retval>,
	ret	
	.section .rdata,"dr"
.LC0:
	.ascii "\342\224\202   \0"
.LC1:
	.ascii "    \0"
.LC2:
	.ascii "\342\224\224\342\224\200\342\224\200 \0"
.LC3:
	.ascii "\342\224\234\342\224\200\342\224\200 \0"
	.text
	.def	indention;	.scl	3;	.type	32;	.endef
indention:
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbp	 ; tmp135, out
	movq	%rdx, %rsi	 ; tmp136, indent
	movl	%r8d, %r14d	 ; tmp137, is_last
	movq	%r9, %rdi	 ; tmp138, indent_has_next
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	testb	%r8b, %r8b	 ; is_last
	jne	.L55	 ;,
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	shrq	$3, %rdx	 ;, tmp116
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	movl	%esi, %ecx	 ; indent, tmp117
	andl	$7, %ecx	 ;, tmp117
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	movl	$1, %eax	 ;, tmp119
	sall	%cl, %eax	 ; tmp117, tmp118
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	orb	(%r9,%rdx), %al	 ; *_2, iftmp.86_27
.L56:
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	movq	%rsi, %rdx	 ; indent, tmp125
	shrq	$3, %rdx	 ;, tmp125
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	movb	%al, (%rdi,%rdx)	 ; iftmp.86_27, *_17
 ; ./asm_test/win/i/all.c:1147:     for (size_t i = 1; i < indent; ++i)
	cmpq	$1, %rsi	 ;, indent
	jbe	.L57	 ;,
 ; ./asm_test/win/i/all.c:1147:     for (size_t i = 1; i < indent; ++i)
	movl	$1, %ebx	 ;, i
 ; ./asm_test/win/i/all.c:1148:         fprintf(out, (indent_has_next[i / 8] & (1 << (i % 8))) != 0 ? "│   " : "    ");
	leaq	.LC1(%rip), %r13	 ;, tmp131
	leaq	.LC0(%rip), %r12	 ;, tmp132
.L59:
 ; ./asm_test/win/i/all.c:1148:         fprintf(out, (indent_has_next[i / 8] & (1 << (i % 8))) != 0 ? "│   " : "    ");
	movq	%rbx, %rax	 ; i, tmp126
	shrq	$3, %rax	 ;, tmp126
 ; ./asm_test/win/i/all.c:1148:         fprintf(out, (indent_has_next[i / 8] & (1 << (i % 8))) != 0 ? "│   " : "    ");
	movsbl	(%rdi,%rax), %eax	 ; *_19, *_19
 ; ./asm_test/win/i/all.c:1148:         fprintf(out, (indent_has_next[i / 8] & (1 << (i % 8))) != 0 ? "│   " : "    ");
	movl	%ebx, %ecx	 ; i, tmp128
	andl	$7, %ecx	 ;, tmp128
 ; ./asm_test/win/i/all.c:1148:         fprintf(out, (indent_has_next[i / 8] & (1 << (i % 8))) != 0 ? "│   " : "    ");
	sarl	%cl, %eax	 ; tmp128, tmp129
 ; ./asm_test/win/i/all.c:1148:         fprintf(out, (indent_has_next[i / 8] & (1 << (i % 8))) != 0 ? "│   " : "    ");
	testb	$1, %al	 ;, tmp129
	movq	%r12, %rdx	 ; tmp132, iftmp.87_28
	cmove	%r13, %rdx	 ; tmp131,, iftmp.87_28
 ; ./asm_test/win/i/all.c:1148:         fprintf(out, (indent_has_next[i / 8] & (1 << (i % 8))) != 0 ? "│   " : "    ");
	movq	%rbp, %rcx	 ; out,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1147:     for (size_t i = 1; i < indent; ++i)
	addq	$1, %rbx	 ;, i
 ; ./asm_test/win/i/all.c:1147:     for (size_t i = 1; i < indent; ++i)
	cmpq	%rbx, %rsi	 ; i, indent
	jne	.L59	 ;,
.L60:
 ; ./asm_test/win/i/all.c:1150:         fprintf(out, is_last ? "└── " : "├── ");
	testb	%r14b, %r14b	 ; is_last
	leaq	.LC3(%rip), %rdx	 ;, tmp133
	leaq	.LC2(%rip), %rax	 ;, tmp134
	cmovne	%rax, %rdx	 ; tmp133,, tmp134, iftmp.88_29
 ; ./asm_test/win/i/all.c:1150:         fprintf(out, is_last ? "└── " : "├── ");
	movq	%rbp, %rcx	 ; out,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1151: }
	jmp	.L54	 ;
.L55:
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	shrq	$3, %rdx	 ;, tmp120
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	movl	%esi, %ecx	 ; indent, tmp121
	andl	$7, %ecx	 ;, tmp121
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	movl	$1, %eax	 ;, tmp123
	sall	%cl, %eax	 ; tmp121, tmp122
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	notl	%eax	 ; tmp124
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	andb	(%r9,%rdx), %al	 ; *_9, iftmp.86_27
	jmp	.L56	 ;
.L57:
 ; ./asm_test/win/i/all.c:1149:     if (indent > 0)
	testq	%rsi, %rsi	 ; indent
	jne	.L60	 ;,
.L54:
 ; ./asm_test/win/i/all.c:1151: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "[Warning] Unsupported type for size lookup: %s\12\0"
	.text
	.def	get_type_size;	.scl	3;	.type	32;	.endef
get_type_size:
 ; ./asm_test/win/i/all.c:3153:         result = 0;
	movl	$0, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:3152:     if (type == NULL)
	testq	%rcx, %rcx	 ; type
	je	.L77	 ;,
 ; ./asm_test/win/i/all.c:3154:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, name_int(%rip)	 ; type, name_int
	je	.L71	 ;,
 ; ./asm_test/win/i/all.c:3154:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, name_float(%rip)	 ; type, name_float
	je	.L72	 ;,
 ; ./asm_test/win/i/all.c:3154:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, name_string(%rip)	 ; type, name_string
	je	.L73	 ;,
 ; ./asm_test/win/i/all.c:3157:         result = 1;
	movl	$1, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:3156:     else if (type == name_bool || type == name_void)
	cmpq	%rcx, name_bool(%rip)	 ; type, name_bool
	je	.L77	 ;,
 ; ./asm_test/win/i/all.c:3156:     else if (type == name_bool || type == name_void)
	cmpq	%rcx, name_void(%rip)	 ; type, name_void
	je	.L77	 ;,
 ; ./asm_test/win/i/all.c:3158:     else if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rcx)	 ;, type_12(D)->kind
	jne	.L69	 ;,
 ; ./asm_test/win/i/all.c:3159:         result = type->ast_node.class->size;
	movq	24(%rcx), %rax	 ; type_12(D)->ast_node.class, type_12(D)->ast_node.class
	movq	24(%rax), %rax	 ; _7->size, <retval>
	ret	
.L69:
 ; ./asm_test/win/i/all.c:3150: size_t get_type_size(Symbol* type) {
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3161:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	movq	8(%rcx), %rbx	 ; type_12(D)->name, _8
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp98, _9
 ; ./asm_test/win/i/all.c:3161:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	movq	%rbx, %r8	 ; _8,
	leaq	.LC4(%rip), %rdx	 ;, tmp95
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3151:     size_t result = 8;
	movl	$8, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:3163: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
.L71:
 ; ./asm_test/win/i/all.c:3155:         result = 8;
	movl	$8, %eax	 ;, <retval>
	ret	
.L72:
	movl	$8, %eax	 ;, <retval>
	ret	
.L73:
	movl	$8, %eax	 ;, <retval>
	ret	
.L77:
 ; ./asm_test/win/i/all.c:3163: }
	ret	
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.text
	.def	create_method_use_ptr;	.scl	3;	.type	32;	.endef
create_method_use_ptr:
	subq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:714:     if (name == NULL || return_type == NULL) {
	testq	%rdx, %rdx	 ; name
	je	.L83	 ;,
	testq	%r8, %r8	 ; return_type
	je	.L83	 ;,
 ; ./asm_test/win/i/all.c:718:     method->name = name;
	movq	%rdx, (%rcx)	 ; name, method_10(D)->name
 ; ./asm_test/win/i/all.c:719:     method->return_type = return_type;
	movq	%r8, 8(%rcx)	 ; return_type, method_10(D)->return_type
 ; ./asm_test/win/i/all.c:720:     method->parameters = parameters;
	movq	%r9, 16(%rcx)	 ; parameters, method_10(D)->parameters
 ; ./asm_test/win/i/all.c:721:     method->body = body;
	movq	80(%rsp), %rax	 ; body, body
	movq	%rax, 24(%rcx)	 ; body, method_10(D)->body
 ; ./asm_test/win/i/all.c:722:     method->method_scope = method_scope;
	movq	88(%rsp), %rax	 ; method_scope, method_scope
	movq	%rax, 32(%rcx)	 ; method_scope, method_10(D)->method_scope
 ; ./asm_test/win/i/all.c:723:     return method;
	movq	%rcx, %rax	 ; method, <retval>
.L79:
 ; ./asm_test/win/i/all.c:724: }
	addq	$40, %rsp	 ;,
	ret	
.L83:
 ; ./asm_test/win/i/all.c:715:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp104
 ; ./asm_test/win/i/all.c:715:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	movl	$51, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp98
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:716:         return NULL;
	movl	$0, %eax	 ;, <retval>
	jmp	.L79	 ;
	.section .rdata,"dr"
.LC6:
	.ascii "Name: \"NULL\"\12\0"
.LC7:
	.ascii "name: \"%s\"\12\0"
.LC8:
	.ascii "id: %zu\12\0"
.LC9:
	.ascii "kind: \"type\"\12\0"
.LC10:
	.ascii "kind: \"variable\"\12\0"
.LC11:
	.ascii "type\12\0"
.LC12:
	.ascii "kind: \"function\"\12\0"
.LC13:
	.ascii "return_type\12\0"
.LC14:
	.ascii "kind: \"method\"\12\0"
.LC15:
	.ascii "kind: \"class\"\12\0"
.LC16:
	.ascii "kind: \"attribute\"\12\0"
.LC17:
	.ascii "kind: \"parameter\"\12\0"
.LC18:
	.ascii "kind: \"unknown_NameType\"\12\0"
	.text
	.def	output_name;	.scl	3;	.type	32;	.endef
output_name:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rdx, %rbx	 ; tmp134, outfile
	movq	%r8, %rdi	 ; tmp135, indent
	movq	%r9, %rbp	 ; tmp136, indent_has_next
 ; ./asm_test/win/i/all.c:1917:     if (name == NULL) {
	testq	%rcx, %rcx	 ; name
	je	.L98	 ;,
	movq	%rcx, %rsi	 ; tmp133, name
 ; ./asm_test/win/i/all.c:1922:     indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1923:     fprintf(outfile, "name: \"%s\"\n", name->name);
	movq	8(%rsi), %r8	 ; name_15(D)->name,
	leaq	.LC7(%rip), %rdx	 ;, tmp101
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1924:     indention(outfile, indent, 0, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1925:     fprintf(outfile, "id: %zu\n", name->id);
	movq	16(%rsi), %r8	 ; name_15(D)->id,
	leaq	.LC8(%rip), %rdx	 ;, tmp103
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1926:     switch (name->kind) {
	cmpl	$6, 32(%rsi)	 ;, name_15(D)->kind
	ja	.L88	 ;,
	movl	32(%rsi), %eax	 ; name_15(D)->kind, name_15(D)->kind
	leaq	.L90(%rip), %rdx	 ;, tmp105
	movslq	(%rdx,%rax,4), %rax	 ;, tmp107
	addq	%rdx, %rax	 ; tmp105, tmp108
	jmp	*%rax	 ; tmp108
	.section .rdata,"dr"
	.align 4
.L90:
	.long	.L96-.L90
	.long	.L95-.L90
	.long	.L94-.L90
	.long	.L93-.L90
	.long	.L92-.L90
	.long	.L91-.L90
	.long	.L89-.L90
	.text
.L98:
 ; ./asm_test/win/i/all.c:1918:         indention(outfile, indent, 1, indent_has_next);
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1919:         fprintf(outfile, "Name: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC6(%rip), %rcx	 ;, tmp99
	call	fwrite	 ;
.L85:
 ; ./asm_test/win/i/all.c:1975: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L89:
 ; ./asm_test/win/i/all.c:1928:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1929:             fprintf(outfile, "kind: \"type\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC9(%rip), %rcx	 ;, tmp110
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1930:             break;
	jmp	.L85	 ;
.L93:
 ; ./asm_test/win/i/all.c:1932:             indention(outfile, indent, 0, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1933:             fprintf(outfile, "kind: \"variable\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rcx	 ;, tmp111
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1934:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1935:             fprintf(outfile, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rcx	 ;, tmp112
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1936:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; name_15(D)->type, name_15(D)->type
	movq	%rbp, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1937:             break;
	jmp	.L85	 ;
.L95:
 ; ./asm_test/win/i/all.c:1939:             indention(outfile, indent, 0, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1940:             fprintf(outfile, "kind: \"function\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC12(%rip), %rcx	 ;, tmp115
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1941:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1942:             fprintf(outfile, "return_type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC13(%rip), %rcx	 ;, tmp116
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1943:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; name_15(D)->type, name_15(D)->type
	movq	%rbp, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1944:             break;
	jmp	.L85	 ;
.L94:
 ; ./asm_test/win/i/all.c:1946:             indention(outfile, indent, 0, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1947:             fprintf(outfile, "kind: \"method\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC14(%rip), %rcx	 ;, tmp119
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1948:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1949:             fprintf(outfile, "return_type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC13(%rip), %rcx	 ;, tmp120
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1950:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; name_15(D)->type, name_15(D)->type
	movq	%rbp, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1951:             break;
	jmp	.L85	 ;
.L96:
 ; ./asm_test/win/i/all.c:1953:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1954:             fprintf(outfile, "kind: \"class\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rcx	 ;, tmp123
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1955:             break;
	jmp	.L85	 ;
.L91:
 ; ./asm_test/win/i/all.c:1957:             indention(outfile, indent, 0, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1958:             fprintf(outfile, "kind: \"attribute\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rcx	 ;, tmp124
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1959:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1960:             fprintf(outfile, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rcx	 ;, tmp125
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1961:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; name_15(D)->type, name_15(D)->type
	movq	%rbp, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1962:             break;
	jmp	.L85	 ;
.L92:
 ; ./asm_test/win/i/all.c:1964:             indention(outfile, indent, 0, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1965:             fprintf(outfile, "kind: \"parameter\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rcx	 ;, tmp128
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1966:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1967:             fprintf(outfile, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rcx	 ;, tmp129
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1968:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; name_15(D)->type, name_15(D)->type
	movq	%rbp, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1969:             break;
	jmp	.L85	 ;
.L88:
 ; ./asm_test/win/i/all.c:1971:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1972:             fprintf(outfile, "kind: \"unknown_NameType\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$25, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp132
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1973:             break;
	jmp	.L85	 ;
	.section .rdata,"dr"
	.align 8
.LC19:
	.ascii "Fatal: Cannot allocate memory\12\0"
	.text
	.def	create_memory_block;	.scl	3;	.type	32;	.endef
create_memory_block:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp91, size
 ; ./asm_test/win/i/all.c:603:     MemoryBlock* new_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movl	$32, %ecx	 ;,
	call	malloc	 ;
 ; ./asm_test/win/i/all.c:604:     if (new_memory == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L102	 ;,
	movq	%rax, %rbx	 ; tmp92, <retval>
 ; ./asm_test/win/i/all.c:609:     new_memory->block = (size_t*)malloc(size);
	movq	%rsi, %rcx	 ; size,
	call	malloc	 ;
 ; ./asm_test/win/i/all.c:609:     new_memory->block = (size_t*)malloc(size);
	movq	%rax, 24(%rbx)	 ; tmp94, new_memory_5->block
 ; ./asm_test/win/i/all.c:610:     new_memory->size = size;
	movq	%rsi, (%rbx)	 ; size, new_memory_5->size
 ; ./asm_test/win/i/all.c:611:     new_memory->used = 0;
	movq	$0, 8(%rbx)	 ;, new_memory_5->used
 ; ./asm_test/win/i/all.c:612:     new_memory->next = NULL;
	movq	$0, 16(%rbx)	 ;, new_memory_5->next
 ; ./asm_test/win/i/all.c:614: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
.L102:
 ; ./asm_test/win/i/all.c:605:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp93
 ; ./asm_test/win/i/all.c:605:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movl	$30, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rcx	 ;, tmp88
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:606:         initialized = 0;
	movb	$0, initialized(%rip)	 ;, initialized
 ; ./asm_test/win/i/all.c:607:         exit(1);
	movl	$1, %ecx	 ;,
	call	exit	 ;
	.def	increase_memory_size;	.scl	3;	.type	32;	.endef
increase_memory_size:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movl	%ecx, %esi	 ; tmp109, for_struct
 ; ./asm_test/win/i/all.c:530:     MemoryBlock* new_block = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movl	$32, %ecx	 ;,
	call	malloc	 ;
 ; ./asm_test/win/i/all.c:531:     if (new_block == NULL) {
	testq	%rax, %rax	 ; new_block
	je	.L111	 ;,
	movq	%rax, %rbx	 ; tmp110, new_block
 ; ./asm_test/win/i/all.c:543:     new_block->block = (size_t*)malloc(1024);
	movl	$1024, %ecx	 ;,
	call	malloc	 ;
 ; ./asm_test/win/i/all.c:543:     new_block->block = (size_t*)malloc(1024);
	movq	%rax, 24(%rbx)	 ; tmp112, new_block_21->block
 ; ./asm_test/win/i/all.c:544:     new_block->size = 1024;
	movq	$1024, (%rbx)	 ;, new_block_21->size
 ; ./asm_test/win/i/all.c:545:     new_block->used = 0;
	movq	$0, 8(%rbx)	 ;, new_block_21->used
 ; ./asm_test/win/i/all.c:546:     new_block->next = NULL;
	movq	$0, 16(%rbx)	 ;, new_block_21->next
 ; ./asm_test/win/i/all.c:547:     if (for_struct) {
	testb	%sil, %sil	 ; for_struct
	je	.L107	 ;,
 ; ./asm_test/win/i/all.c:548:         struct_memory_used += struct_memory->used;
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory.13_4
 ; ./asm_test/win/i/all.c:548:         struct_memory_used += struct_memory->used;
	movq	8(%rax), %rdx	 ; struct_memory.13_4->used, struct_memory.13_4->used
	addq	%rdx, struct_memory_used(%rip)	 ; struct_memory.13_4->used, struct_memory_used
 ; ./asm_test/win/i/all.c:549:         new_block->next = struct_memory;
	movq	%rax, 16(%rbx)	 ; struct_memory.13_4, new_block_21->next
 ; ./asm_test/win/i/all.c:550:         struct_memory = new_block;
	movq	%rbx, struct_memory(%rip)	 ; new_block, struct_memory
 ; ./asm_test/win/i/all.c:551:         struct_memory_count += 1024;
	addq	$1024, struct_memory_count(%rip)	 ;, struct_memory_count
.L103:
 ; ./asm_test/win/i/all.c:558: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
.L111:
 ; ./asm_test/win/i/all.c:532:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp111
 ; ./asm_test/win/i/all.c:532:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movl	$30, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rcx	 ;, tmp104
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:533:         MemoryBlock* current = string_memory;
	movq	string_memory(%rip), %rbx	 ; string_memory, next
 ; ./asm_test/win/i/all.c:534:         while (current != NULL) {
	testq	%rbx, %rbx	 ; next
	je	.L105	 ;,
.L106:
	movq	%rbx, %rsi	 ; next, current
 ; ./asm_test/win/i/all.c:535:             MemoryBlock* next = current->next;
	movq	16(%rbx), %rbx	 ; current_46->next, next
 ; ./asm_test/win/i/all.c:536:             free(current->block);
	movq	24(%rsi), %rcx	 ; current_17->block, current_17->block
	call	free	 ;
 ; ./asm_test/win/i/all.c:537:             free(current);
	movq	%rsi, %rcx	 ; current,
	call	free	 ;
 ; ./asm_test/win/i/all.c:534:         while (current != NULL) {
	testq	%rbx, %rbx	 ; next
	jne	.L106	 ;,
.L105:
 ; ./asm_test/win/i/all.c:540:         initialized = 0;
	movb	$0, initialized(%rip)	 ;, initialized
 ; ./asm_test/win/i/all.c:541:         exit(1);
	movl	$1, %ecx	 ;,
	call	exit	 ;
.L107:
 ; ./asm_test/win/i/all.c:553:         string_memory_used += string_memory->used;
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory.17_10
 ; ./asm_test/win/i/all.c:553:         string_memory_used += string_memory->used;
	movq	8(%rax), %rdx	 ; string_memory.17_10->used, string_memory.17_10->used
	addq	%rdx, string_memory_used(%rip)	 ; string_memory.17_10->used, string_memory_used
 ; ./asm_test/win/i/all.c:554:         new_block->next = string_memory;
	movq	%rax, 16(%rbx)	 ; string_memory.17_10, new_block_21->next
 ; ./asm_test/win/i/all.c:555:         string_memory = new_block;
	movq	%rbx, string_memory(%rip)	 ; new_block, string_memory
 ; ./asm_test/win/i/all.c:556:         string_memory_count += 1024;
	addq	$1024, string_memory_count(%rip)	 ;, string_memory_count
 ; ./asm_test/win/i/all.c:558: }
	jmp	.L103	 ;
	.section .rdata,"dr"
	.align 8
.LC20:
	.ascii "Fatal: Memory allocation is not aligned, used: %zu bytes\12\0"
	.text
	.def	alloc_memory;	.scl	3;	.type	32;	.endef
alloc_memory:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp109, size
 ; ./asm_test/win/i/all.c:634:     if (!initialized) init();
	cmpb	$0, initialized(%rip)	 ;, initialized
	je	.L117	 ;,
.L113:
 ; ./asm_test/win/i/all.c:635:     size = (size + sizeof(size_t) - 1) & ~(sizeof(size_t) - 1);
	addq	$7, %rbx	 ;, _2
 ; ./asm_test/win/i/all.c:635:     size = (size + sizeof(size_t) - 1) & ~(sizeof(size_t) - 1);
	andq	$-8, %rbx	 ;, size
 ; ./asm_test/win/i/all.c:636:     if (struct_memory->used + size >= struct_memory->size)
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory.22_3
 ; ./asm_test/win/i/all.c:636:     if (struct_memory->used + size >= struct_memory->size)
	movq	%rbx, %rdx	 ; size, tmp100
	addq	8(%rax), %rdx	 ; struct_memory.22_3->used, tmp100
 ; ./asm_test/win/i/all.c:636:     if (struct_memory->used + size >= struct_memory->size)
	cmpq	(%rax), %rdx	 ; struct_memory.22_3->size, tmp100
	jnb	.L118	 ;,
.L114:
 ; ./asm_test/win/i/all.c:638:     if (struct_memory->used % sizeof(size_t) != 0) {
	movq	struct_memory(%rip), %rdx	 ; struct_memory, struct_memory.24_7
	movq	8(%rdx), %rsi	 ; struct_memory.24_7->used, _8
 ; ./asm_test/win/i/all.c:638:     if (struct_memory->used % sizeof(size_t) != 0) {
	testb	$7, %sil	 ;, _8
	jne	.L119	 ;,
 ; ./asm_test/win/i/all.c:643:     size_t* ptr = struct_memory->block + (struct_memory->used / sizeof(size_t));
	movq	%rsi, %rax	 ; _8, tmp105
	andq	$-8, %rax	 ;, tmp105
 ; ./asm_test/win/i/all.c:643:     size_t* ptr = struct_memory->block + (struct_memory->used / sizeof(size_t));
	addq	24(%rdx), %rax	 ; struct_memory.24_7->block, <retval>
 ; ./asm_test/win/i/all.c:644:     struct_memory->used += size;
	addq	%rbx, %rsi	 ; size, tmp107
	movq	%rsi, 8(%rdx)	 ; tmp107, struct_memory.24_7->used
 ; ./asm_test/win/i/all.c:645:     ++memoryBlockCount;
	addq	$1, memoryBlockCount(%rip)	 ;, memoryBlockCount
 ; ./asm_test/win/i/all.c:647: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
.L117:
 ; ./asm_test/win/i/all.c:634:     if (!initialized) init();
	call	init	 ;
	jmp	.L113	 ;
.L118:
 ; ./asm_test/win/i/all.c:637:         increase_memory_size(1);
	movl	$1, %ecx	 ;,
	call	increase_memory_size	 ;
	jmp	.L114	 ;
.L119:
 ; ./asm_test/win/i/all.c:639:         fprintf(stderr, "Fatal: Memory allocation is not aligned, used: %zu bytes\n", struct_memory->used);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp110, _10
 ; ./asm_test/win/i/all.c:639:         fprintf(stderr, "Fatal: Memory allocation is not aligned, used: %zu bytes\n", struct_memory->used);
	movq	%rsi, %r8	 ; _8,
	leaq	.LC20(%rip), %rdx	 ;, tmp104
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:640:         initialized = 0;
	movb	$0, initialized(%rip)	 ;, initialized
 ; ./asm_test/win/i/all.c:641:         exit(1);
	movl	$1, %ecx	 ;,
	call	exit	 ;
	.section .rdata,"dr"
	.align 8
.LC21:
	.ascii "Info: Allocate big memory block of size %zu bytes\12\0"
	.text
	.def	create_string_check;	.scl	3;	.type	32;	.endef
create_string_check:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbp	 ; tmp130, data
	movq	%rdx, %rsi	 ; tmp131, length
	movl	%r8d, %ebx	 ; tmp132, check
 ; ./asm_test/win/i/all.c:571:     if (!initialized) init();
	cmpb	$0, initialized(%rip)	 ;, initialized
	je	.L133	 ;,
.L121:
 ; ./asm_test/win/i/all.c:572:     if (data == NULL || length == 0) return 0;
	testq	%rbp, %rbp	 ; data
	je	.L129	 ;,
	testq	%rsi, %rsi	 ; length
	je	.L129	 ;,
 ; ./asm_test/win/i/all.c:573:     if (check) {
	testb	%bl, %bl	 ; check
	je	.L123	 ;,
 ; ./asm_test/win/i/all.c:574:         StringList* current = all_string_list;
	movq	all_string_list(%rip), %rbx	 ; all_string_list, current
 ; ./asm_test/win/i/all.c:576:         while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	je	.L123	 ;,
 ; ./asm_test/win/i/all.c:575:         char* existing = NULL;
	movl	$0, %edi	 ;, <retval>
	jmp	.L125	 ;
.L133:
 ; ./asm_test/win/i/all.c:571:     if (!initialized) init();
	call	init	 ;
	jmp	.L121	 ;
.L124:
 ; ./asm_test/win/i/all.c:579:             current = current->next;
	movq	16(%rbx), %rbx	 ; current_39->next, current
 ; ./asm_test/win/i/all.c:576:         while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	je	.L134	 ;,
.L125:
 ; ./asm_test/win/i/all.c:577:             if (current->length == length && current->str != NULL && strncmp(current->str, data, length) == 0)
	cmpq	%rsi, 8(%rbx)	 ; length, current_39->length
	jne	.L124	 ;,
 ; ./asm_test/win/i/all.c:577:             if (current->length == length && current->str != NULL && strncmp(current->str, data, length) == 0)
	movq	(%rbx), %r12	 ; current_39->str, _6
 ; ./asm_test/win/i/all.c:577:             if (current->length == length && current->str != NULL && strncmp(current->str, data, length) == 0)
	testq	%r12, %r12	 ; _6
	je	.L124	 ;,
 ; ./asm_test/win/i/all.c:577:             if (current->length == length && current->str != NULL && strncmp(current->str, data, length) == 0)
	movq	%rsi, %r8	 ; length,
	movq	%rbp, %rdx	 ; data,
	movq	%r12, %rcx	 ; _6,
	call	strncmp	 ;
 ; ./asm_test/win/i/all.c:578:                 existing = current->str;
	testl	%eax, %eax	 ; tmp133
	cmove	%r12, %rdi	 ; <retval>,, _6, <retval>
	jmp	.L124	 ;
.L134:
 ; ./asm_test/win/i/all.c:581:         if (existing != NULL)
	testq	%rdi, %rdi	 ; <retval>
	jne	.L120	 ;,
.L123:
 ; ./asm_test/win/i/all.c:585:     if (length >= 1024 - 1)
	cmpq	$1022, %rsi	 ;, length
	ja	.L135	 ;,
 ; ./asm_test/win/i/all.c:588:         if (string_memory->used + length >= string_memory->size)
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory.4_9
 ; ./asm_test/win/i/all.c:588:         if (string_memory->used + length >= string_memory->size)
	movq	%rsi, %rdx	 ; length, tmp123
	addq	8(%rax), %rdx	 ; string_memory.4_9->used, tmp123
 ; ./asm_test/win/i/all.c:588:         if (string_memory->used + length >= string_memory->size)
	cmpq	(%rax), %rdx	 ; string_memory.4_9->size, tmp123
	jnb	.L136	 ;,
.L128:
 ; ./asm_test/win/i/all.c:590:         str = (char*)string_memory->block + string_memory->used;
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory.6_13
 ; ./asm_test/win/i/all.c:590:         str = (char*)string_memory->block + string_memory->used;
	movq	8(%rax), %rdx	 ; string_memory.6_13->used, _15
 ; ./asm_test/win/i/all.c:590:         str = (char*)string_memory->block + string_memory->used;
	movq	%rdx, %rdi	 ; _15, <retval>
	addq	24(%rax), %rdi	 ; string_memory.6_13->block, <retval>
 ; ./asm_test/win/i/all.c:591:         string_memory->used += length + 1;
	leaq	1(%rdx,%rsi), %rdx	 ;, tmp127
	movq	%rdx, 8(%rax)	 ; tmp127, string_memory.6_13->used
.L127:
 ; ./asm_test/win/i/all.c:593:     strncpy(str, data, length);
	movq	%rsi, %r8	 ; length,
	movq	%rbp, %rdx	 ; data,
	movq	%rdi, %rcx	 ; <retval>,
	call	strncpy	 ;
 ; ./asm_test/win/i/all.c:594:     str[length] = '\0';
	movb	$0, (%rdi,%rsi)	 ;, *_18
 ; ./asm_test/win/i/all.c:595:     StringList* new_str = (StringList*)alloc_memory(sizeof(StringList));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:596:     new_str->str = str;
	movq	%rdi, (%rax)	 ; <retval>, new_str_44->str
 ; ./asm_test/win/i/all.c:597:     new_str->length = length;
	movq	%rsi, 8(%rax)	 ; length, new_str_44->length
 ; ./asm_test/win/i/all.c:598:     new_str->next = all_string_list;
	movq	all_string_list(%rip), %rdx	 ; all_string_list, all_string_list
	movq	%rdx, 16(%rax)	 ; all_string_list, new_str_44->next
 ; ./asm_test/win/i/all.c:599:     all_string_list = new_str;
	movq	%rax, all_string_list(%rip)	 ; new_str, all_string_list
.L120:
 ; ./asm_test/win/i/all.c:601: }
	movq	%rdi, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L135:
 ; ./asm_test/win/i/all.c:586:         str = alloc_big_memory(length + 1);
	leaq	1(%rsi), %rbx	 ;, _8
 ; ./asm_test/win/i/all.c:560:     string_memory_count += size;
	addq	%rbx, string_memory_count(%rip)	 ; _8, string_memory_count
 ; ./asm_test/win/i/all.c:561:     string_memory_used += size;
	addq	%rbx, string_memory_used(%rip)	 ; _8, string_memory_used
 ; ./asm_test/win/i/all.c:562:     char* block = (char*)malloc(size);
	movq	%rbx, %rcx	 ; _8,
	call	malloc	 ;
	movq	%rax, %rdi	 ; tmp134, <retval>
 ; ./asm_test/win/i/all.c:563:     fprintf(stderr, "Info: Allocate big memory block of size %zu bytes\n", size);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp135, _54
 ; ./asm_test/win/i/all.c:563:     fprintf(stderr, "Info: Allocate big memory block of size %zu bytes\n", size);
	movq	%rbx, %r8	 ; _8,
	leaq	.LC21(%rip), %rdx	 ;, tmp120
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:564:     if (block == NULL) {
	testq	%rdi, %rdi	 ; <retval>
	jne	.L127	 ;,
 ; ./asm_test/win/i/all.c:565:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp136
 ; ./asm_test/win/i/all.c:565:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movl	$30, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rcx	 ;, tmp122
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:566:         exit(1);
	movl	$1, %ecx	 ;,
	call	exit	 ;
.L136:
 ; ./asm_test/win/i/all.c:589:             increase_memory_size(0);
	movl	$0, %ecx	 ;,
	call	increase_memory_size	 ;
	jmp	.L128	 ;
.L129:
 ; ./asm_test/win/i/all.c:572:     if (data == NULL || length == 0) return 0;
	movl	$0, %edi	 ;, <retval>
	jmp	.L120	 ;
	.section .rdata,"dr"
.LC22:
	.ascii "init\0"
.LC23:
	.ascii "$constructor\0"
	.text
	.def	init;	.scl	3;	.type	32;	.endef
init:
 ; ./asm_test/win/i/all.c:616:     if (initialized) return;
	cmpb	$0, initialized(%rip)	 ;, initialized
	jne	.L146	 ;,
 ; ./asm_test/win/i/all.c:615: void init(void) {
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:617:     if (struct_memory == NULL) {
	cmpq	$0, struct_memory(%rip)	 ;, struct_memory
	je	.L149	 ;,
.L139:
 ; ./asm_test/win/i/all.c:621:     if (string_memory == NULL) {
	cmpq	$0, string_memory(%rip)	 ;, string_memory
	je	.L150	 ;,
.L140:
 ; ./asm_test/win/i/all.c:625:     initialized = 1;
	movb	$1, initialized(%rip)	 ;, initialized
 ; ./asm_test/win/i/all.c:626:     for (size_t i = 0; i < 22; ++i)
	movl	$0, %ebx	 ;, i
 ; ./asm_test/win/i/all.c:627:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), 0);
	leaq	keywordStrings(%rip), %rbp	 ;, tmp97
 ; ./asm_test/win/i/all.c:627:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), 0);
	leaq	keywordList(%rip), %rdi	 ;, tmp101
.L141:
 ; ./asm_test/win/i/all.c:627:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), 0);
	movq	0(%rbp,%rbx,8), %rsi	 ; MEM[(char * *)&keywordStrings + i_43 * 8], _6
 ; ./asm_test/win/i/all.c:627:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), 0);
	movq	%rsi, %rcx	 ; _6,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp111, tmp99
 ; ./asm_test/win/i/all.c:627:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), 0);
	movl	$0, %r8d	 ;,
	movq	%rsi, %rcx	 ; _6,
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:627:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), 0);
	movq	%rax, (%rdi,%rbx,8)	 ; tmp112, MEM[(char * *)&keywordList + i_43 * 8]
 ; ./asm_test/win/i/all.c:626:     for (size_t i = 0; i < 22; ++i)
	addq	$1, %rbx	 ;, i
 ; ./asm_test/win/i/all.c:626:     for (size_t i = 0; i < 22; ++i)
	cmpq	$22, %rbx	 ;, i
	jne	.L141	 ;,
 ; ./asm_test/win/i/all.c:628:     for (size_t i = 0; i < 30; ++i)
	movl	$0, %ebx	 ;, i
 ; ./asm_test/win/i/all.c:629:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), 0);
	leaq	symbolStrings(%rip), %rbp	 ;, tmp102
 ; ./asm_test/win/i/all.c:629:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), 0);
	leaq	symbolList(%rip), %rdi	 ;, tmp106
.L142:
 ; ./asm_test/win/i/all.c:629:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), 0);
	movq	0(%rbp,%rbx,8), %rsi	 ; MEM[(char * *)&symbolStrings + i_44 * 8], _9
 ; ./asm_test/win/i/all.c:629:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), 0);
	movq	%rsi, %rcx	 ; _9,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp113, tmp104
 ; ./asm_test/win/i/all.c:629:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), 0);
	movl	$0, %r8d	 ;,
	movq	%rsi, %rcx	 ; _9,
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:629:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), 0);
	movq	%rax, (%rdi,%rbx,8)	 ; tmp114, MEM[(char * *)&symbolList + i_44 * 8]
 ; ./asm_test/win/i/all.c:628:     for (size_t i = 0; i < 30; ++i)
	addq	$1, %rbx	 ;, i
 ; ./asm_test/win/i/all.c:628:     for (size_t i = 0; i < 30; ++i)
	cmpq	$30, %rbx	 ;, i
	jne	.L142	 ;,
 ; ./asm_test/win/i/all.c:630:     DEFAULT_INIT_NAME = create_string_check("init", 4, 0);
	movl	$0, %r8d	 ;,
	movl	$4, %edx	 ;,
	leaq	.LC22(%rip), %rcx	 ;, tmp107
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:630:     DEFAULT_INIT_NAME = create_string_check("init", 4, 0);
	movq	%rax, DEFAULT_INIT_NAME(%rip)	 ; tmp115, DEFAULT_INIT_NAME
 ; ./asm_test/win/i/all.c:631:     DEFAULT_CONSTRUCTOR_NAME = create_string_check("$constructor", 13, 0);
	movl	$0, %r8d	 ;,
	movl	$13, %edx	 ;,
	leaq	.LC23(%rip), %rcx	 ;, tmp108
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:631:     DEFAULT_CONSTRUCTOR_NAME = create_string_check("$constructor", 13, 0);
	movq	%rax, DEFAULT_CONSTRUCTOR_NAME(%rip)	 ; tmp116, DEFAULT_CONSTRUCTOR_NAME
 ; ./asm_test/win/i/all.c:632: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L149:
 ; ./asm_test/win/i/all.c:618:         struct_memory = create_memory_block(1024);
	movl	$1024, %ecx	 ;,
	call	create_memory_block	 ;
 ; ./asm_test/win/i/all.c:618:         struct_memory = create_memory_block(1024);
	movq	%rax, struct_memory(%rip)	 ; tmp109, struct_memory
 ; ./asm_test/win/i/all.c:619:         struct_memory_count = 1024;
	movq	$1024, struct_memory_count(%rip)	 ;, struct_memory_count
	jmp	.L139	 ;
.L150:
 ; ./asm_test/win/i/all.c:622:         string_memory = create_memory_block(1024);
	movl	$1024, %ecx	 ;,
	call	create_memory_block	 ;
 ; ./asm_test/win/i/all.c:622:         string_memory = create_memory_block(1024);
	movq	%rax, string_memory(%rip)	 ; tmp110, string_memory
 ; ./asm_test/win/i/all.c:623:         string_memory_count = 1024;
	movq	$1024, string_memory_count(%rip)	 ;, string_memory_count
	jmp	.L140	 ;
.L146:
	ret	
	.def	create_lexer;	.scl	3;	.type	32;	.endef
create_lexer:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp87, source
	movq	%rdx, %rsi	 ; tmp88, length
	movq	%r8, %rbx	 ; tmp89, filename
 ; ./asm_test/win/i/all.c:1276:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$88, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:1277:     lexer->source = source;
	movq	%rdi, 8(%rax)	 ; source, lexer_3->source
 ; ./asm_test/win/i/all.c:1278:     lexer->position = 0;
	movq	$0, 16(%rax)	 ;, lexer_3->position
 ; ./asm_test/win/i/all.c:1279:     lexer->length = length;
	movq	%rsi, 24(%rax)	 ; length, lexer_3->length
 ; ./asm_test/win/i/all.c:1280:     lexer->line = 0;
	movq	$0, 32(%rax)	 ;, lexer_3->line
 ; ./asm_test/win/i/all.c:1281:     lexer->column = 0;
	movq	$0, 40(%rax)	 ;, lexer_3->column
 ; ./asm_test/win/i/all.c:1282:     lexer->peeked_token = NULL;
	movq	$0, 48(%rax)	 ;, lexer_3->peeked_token
 ; ./asm_test/win/i/all.c:1283:     lexer->peeked_position = 0;
	movq	$0, 56(%rax)	 ;, lexer_3->peeked_position
 ; ./asm_test/win/i/all.c:1284:     lexer->peeked_line = 0;
	movq	$0, 64(%rax)	 ;, lexer_3->peeked_line
 ; ./asm_test/win/i/all.c:1285:     lexer->peeked_column = 0;
	movq	$0, 72(%rax)	 ;, lexer_3->peeked_column
 ; ./asm_test/win/i/all.c:1286:     lexer->current_token = NULL;
	movq	$0, 80(%rax)	 ;, lexer_3->current_token
 ; ./asm_test/win/i/all.c:1287:     lexer->filename = filename;
	movq	%rbx, (%rax)	 ; filename, lexer_3->filename
 ; ./asm_test/win/i/all.c:1289: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.def	create_token;	.scl	3;	.type	32;	.endef
create_token:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movl	%ecx, %ebp	 ; tmp88, type
	movq	%rdx, %rdi	 ; tmp89, lexeme
	movq	%r8, %rsi	 ; tmp90, line
	movq	%r9, %rbx	 ; tmp91, column
 ; ./asm_test/win/i/all.c:1291:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:1292:     token->type = type;
	movl	%ebp, 24(%rax)	 ; type, token_3->type
 ; ./asm_test/win/i/all.c:1293:     token->lexeme = lexeme;
	movq	%rdi, (%rax)	 ; lexeme, token_3->lexeme
 ; ./asm_test/win/i/all.c:1294:     token->line = line;
	movq	%rsi, 8(%rax)	 ; line, token_3->line
 ; ./asm_test/win/i/all.c:1295:     token->column = column;
	movq	%rbx, 16(%rax)	 ; column, token_3->column
 ; ./asm_test/win/i/all.c:1297: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.def	create_list;	.scl	3;	.type	32;	.endef
create_list:
	subq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1011:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:1012:     new_list->head = NULL;
	movq	$0, (%rax)	 ;, new_list_3->head
 ; ./asm_test/win/i/all.c:1013:     new_list->tail = NULL;
	movq	$0, 8(%rax)	 ;, new_list_3->tail
 ; ./asm_test/win/i/all.c:1015: }
	addq	$40, %rsp	 ;,
	ret	
	.def	list_copy;	.scl	3;	.type	32;	.endef
list_copy:
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp87, original
 ; ./asm_test/win/i/all.c:1037:     if (original == NULL)
	testq	%rcx, %rcx	 ; original
	je	.L159	 ;,
 ; ./asm_test/win/i/all.c:1039:     List* new_list = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:1040:     new_list->head = original->head;
	movq	(%rbx), %rdx	 ; original_5(D)->head, _1
 ; ./asm_test/win/i/all.c:1040:     new_list->head = original->head;
	movq	%rdx, (%rax)	 ; _1, new_list_8->head
 ; ./asm_test/win/i/all.c:1041:     new_list->tail = original->tail;
	movq	8(%rbx), %rdx	 ; original_5(D)->tail, _2
 ; ./asm_test/win/i/all.c:1041:     new_list->tail = original->tail;
	movq	%rdx, 8(%rax)	 ; _2, new_list_8->tail
.L157:
 ; ./asm_test/win/i/all.c:1043: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
.L159:
 ; ./asm_test/win/i/all.c:1038:         return NULL;
	movq	%rcx, %rax	 ; original, <retval>
	jmp	.L157	 ;
	.section .rdata,"dr"
.LC24:
	.ascii "type: \"name\"\12\0"
.LC25:
	.ascii "name\12\0"
.LC26:
	.ascii "type: \"function_call\"\12\0"
.LC27:
	.ascii "function\12\0"
.LC28:
	.ascii "arguments\12\0"
.LC29:
	.ascii "arguments[%d]\12\0"
.LC30:
	.ascii "type: \"get sequence_element\"\12\0"
.LC31:
	.ascii "sequence\12\0"
.LC32:
	.ascii "index\12\0"
.LC33:
	.ascii "type: \"get_attribute\"\12\0"
.LC34:
	.ascii "object\12\0"
.LC35:
	.ascii "attribute_name\12\0"
	.align 8
.LC36:
	.ascii "unknown_VariableAccessType: %u\12\0"
	.text
	.def	output_variable_access;	.scl	3;	.type	32;	.endef
output_variable_access:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp128, variable_access
	movq	%rdx, %rbx	 ; tmp129, outfile
	movq	%r8, %rbp	 ; tmp130, indent
	movq	%r9, %rsi	 ; tmp131, indent_has_next
 ; ./asm_test/win/i/all.c:1865:     switch (variable_access->type) {
	movl	16(%rcx), %eax	 ; variable_access_19(D)->type, _1
 ; ./asm_test/win/i/all.c:1865:     switch (variable_access->type) {
	cmpl	$2, %eax	 ;, _1
	je	.L162	 ;,
	ja	.L163	 ;,
	testl	%eax, %eax	 ; _1
	je	.L174	 ;,
 ; ./asm_test/win/i/all.c:1874:             args = list_copy(variable_access->content.args);
	movq	8(%rcx), %rcx	 ; variable_access_19(D)->content.args, variable_access_19(D)->content.args
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp132, args
 ; ./asm_test/win/i/all.c:1875:             indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1876:             fprintf(outfile, "type: \"function_call\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$22, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC26(%rip), %rcx	 ;, tmp108
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1877:             indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1878:             fprintf(outfile, "function\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC27(%rip), %rcx	 ;, tmp109
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1879:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %r14	 ;, _5
	movq	(%rdi), %rcx	 ; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r14, %r8	 ; _5,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; ./asm_test/win/i/all.c:1880:             indention(outfile, indent, 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1881:             fprintf(outfile, "arguments\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC28(%rip), %rcx	 ;, tmp111
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1883:             index = -1;
	movl	$-1, %r12d	 ;, index
 ; ./asm_test/win/i/all.c:1886:                 fprintf(outfile, "arguments[%d]\n", ++index);
	leaq	.LC29(%rip), %r15	 ;, tmp126
 ; ./asm_test/win/i/all.c:1887:                 output_expression(arg, outfile, indent + 2, indent_has_next);
	addq	$2, %rbp	 ;, tmp127
 ; ./asm_test/win/i/all.c:1884:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	jmp	.L169	 ;
.L163:
 ; ./asm_test/win/i/all.c:1865:     switch (variable_access->type) {
	cmpl	$3, %eax	 ;, _1
	jne	.L175	 ;,
 ; ./asm_test/win/i/all.c:1891:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1892:             fprintf(outfile, "type: \"get sequence_element\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$29, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC30(%rip), %rcx	 ;, tmp114
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1893:             indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1894:             fprintf(outfile, "sequence\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC31(%rip), %rcx	 ;, tmp115
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1895:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %r12	 ;, _8
	movq	(%rdi), %rcx	 ; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _8,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; ./asm_test/win/i/all.c:1896:             indention(outfile, indent, 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1897:             fprintf(outfile, "index\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC32(%rip), %rcx	 ;, tmp117
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1898:             output_expression(variable_access->content.index, outfile, indent + 1, indent_has_next);
	movq	8(%rdi), %rcx	 ; variable_access_19(D)->content.index, variable_access_19(D)->content.index
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _8,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; ./asm_test/win/i/all.c:1899:             break;
	jmp	.L161	 ;
.L174:
 ; ./asm_test/win/i/all.c:1867:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1868:             fprintf(outfile, "type: \"name\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC24(%rip), %rcx	 ;, tmp103
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1869:             indention(outfile, indent, 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1870:             fprintf(outfile, "name\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC25(%rip), %rcx	 ;, tmp104
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1871:             output_name(variable_access->content.name, outfile, indent + 1, indent_has_next);
	movq	8(%rdi), %rcx	 ; variable_access_19(D)->content.name, variable_access_19(D)->content.name
	movq	%rsi, %r9	 ; indent_has_next,
	leaq	1(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
.L161:
 ; ./asm_test/win/i/all.c:1915: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
.L170:
 ; ./asm_test/win/i/all.c:1885:                 indention(outfile, indent + 1, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r14, %rdx	 ; _5,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1886:                 fprintf(outfile, "arguments[%d]\n", ++index);
	addl	$1, %r12d	 ;, index
	movl	%r12d, %r8d	 ; index,
	movq	%r15, %rdx	 ; tmp126,
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1887:                 output_expression(arg, outfile, indent + 2, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %r8	 ; tmp127,
	movq	%rbx, %rdx	 ; outfile,
	movq	%rdi, %rcx	 ; arg,
	call	output_expression	 ;
.L169:
 ; ./asm_test/win/i/all.c:1884:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	movq	%r13, %rcx	 ; args,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp133, arg
 ; ./asm_test/win/i/all.c:1884:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg
	jne	.L170	 ;,
	jmp	.L161	 ;
.L162:
 ; ./asm_test/win/i/all.c:1901:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1902:             fprintf(outfile, "type: \"get_attribute\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$22, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC33(%rip), %rcx	 ;, tmp119
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1903:             indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1904:             fprintf(outfile, "object\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC34(%rip), %rcx	 ;, tmp120
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1905:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %r12	 ;, _11
	movq	(%rdi), %rcx	 ; variable_access_19(D)->base, variable_access_19(D)->base
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _11,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; ./asm_test/win/i/all.c:1906:             indention(outfile, indent, 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1907:             fprintf(outfile, "attribute_name\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC35(%rip), %rcx	 ;, tmp122
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1908:             output_name(variable_access->content.attr_name, outfile, indent + 1, indent_has_next);
	movq	8(%rdi), %rcx	 ; variable_access_19(D)->content.attr_name, variable_access_19(D)->content.attr_name
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _11,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1909:             break;
	jmp	.L161	 ;
.L175:
 ; ./asm_test/win/i/all.c:1911:             indention(outfile, indent, 1, indent_has_next);
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1912:             fprintf(outfile, "unknown_VariableAccessType: %u\n", variable_access->type);
	movl	16(%rdi), %r8d	 ; variable_access_19(D)->type,
	leaq	.LC36(%rip), %rdx	 ;, tmp125
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1915: }
	jmp	.L161	 ;
	.section .rdata,"dr"
.LC37:
	.ascii "type: \"integer\"\12\0"
.LC38:
	.ascii "value: %s\12\0"
.LC39:
	.ascii "type: \"float\"\12\0"
.LC40:
	.ascii "type: \"string\"\12\0"
.LC41:
	.ascii "value: \"%s\"\12\0"
.LC42:
	.ascii "type: \"boolean\"\12\0"
.LC43:
	.ascii "value: \"true\"\12\0"
.LC44:
	.ascii "value: \"false\"\12\0"
.LC45:
	.ascii "type: \"expression\"\12\0"
.LC46:
	.ascii "value\12\0"
.LC47:
	.ascii "type: \"!\"\12\0"
.LC48:
	.ascii "type: \"-\"\12\0"
.LC49:
	.ascii "type: \"variable\"\12\0"
.LC50:
	.ascii "unknown_PrimaryType: %u\12\0"
	.text
	.def	output_primary;	.scl	3;	.type	32;	.endef
output_primary:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp136, primary
	movq	%rdx, %rbx	 ; tmp137, outfile
	movq	%r8, %rdi	 ; tmp138, indent
	movq	%r9, %rbp	 ; tmp139, indent_has_next
 ; ./asm_test/win/i/all.c:1797:     switch (primary->type) {
	cmpl	$8, 8(%rcx)	 ;, primary_16(D)->type
	ja	.L177	 ;,
	movl	8(%rcx), %eax	 ; primary_16(D)->type, primary_16(D)->type
	leaq	.L179(%rip), %rdx	 ;, tmp100
	movslq	(%rdx,%rax,4), %rax	 ;, tmp102
	addq	%rdx, %rax	 ; tmp100, tmp103
	jmp	*%rax	 ; tmp103
	.section .rdata,"dr"
	.align 4
.L179:
	.long	.L187-.L179
	.long	.L186-.L179
	.long	.L185-.L179
	.long	.L184-.L179
	.long	.L183-.L179
	.long	.L182-.L179
	.long	.L181-.L179
	.long	.L180-.L179
	.long	.L178-.L179
	.text
.L187:
 ; ./asm_test/win/i/all.c:1799:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1800:             fprintf(outfile, "type: \"integer\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC37(%rip), %rcx	 ;, tmp105
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1801:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1802:             fprintf(outfile, "value: %s\n", primary->value.literal_value);
	movq	(%rsi), %r8	 ; primary_16(D)->value.literal_value,
	leaq	.LC38(%rip), %rdx	 ;, tmp107
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
.L176:
 ; ./asm_test/win/i/all.c:1861: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L186:
 ; ./asm_test/win/i/all.c:1805:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1806:             fprintf(outfile, "type: \"float\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC39(%rip), %rcx	 ;, tmp108
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1807:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1808:             fprintf(outfile, "value: %s\n", primary->value.literal_value);
	movq	(%rsi), %r8	 ; primary_16(D)->value.literal_value,
	leaq	.LC38(%rip), %rdx	 ;, tmp110
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1809:             break;
	jmp	.L176	 ;
.L185:
 ; ./asm_test/win/i/all.c:1811:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1812:             fprintf(outfile, "type: \"string\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC40(%rip), %rcx	 ;, tmp111
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1813:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1814:             fprintf(outfile, "value: \"%s\"\n", primary->value.literal_value);
	movq	(%rsi), %r8	 ; primary_16(D)->value.literal_value,
	leaq	.LC41(%rip), %rdx	 ;, tmp113
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1815:             break;
	jmp	.L176	 ;
.L184:
 ; ./asm_test/win/i/all.c:1817:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1818:             fprintf(outfile, "type: \"boolean\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC42(%rip), %rcx	 ;, tmp114
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1819:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1820:             fprintf(outfile, "value: \"true\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC43(%rip), %rcx	 ;, tmp115
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1821:             break;
	jmp	.L176	 ;
.L183:
 ; ./asm_test/win/i/all.c:1823:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1824:             fprintf(outfile, "type: \"boolean\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC42(%rip), %rcx	 ;, tmp116
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1825:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1826:             fprintf(outfile, "value: \"false\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC44(%rip), %rcx	 ;, tmp117
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1827:             break;
	jmp	.L176	 ;
.L182:
 ; ./asm_test/win/i/all.c:1829:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1830:             fprintf(outfile, "type: \"expression\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$19, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC45(%rip), %rcx	 ;, tmp118
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1831:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1832:             fprintf(outfile, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC46(%rip), %rcx	 ;, tmp119
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1833:             output_expression(primary->value.expr, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; primary_16(D)->value.expr, primary_16(D)->value.expr
	movq	%rbp, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; ./asm_test/win/i/all.c:1834:             break;
	jmp	.L176	 ;
.L181:
 ; ./asm_test/win/i/all.c:1836:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1837:             fprintf(outfile, "type: \"!\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rcx	 ;, tmp122
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1838:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1839:             fprintf(outfile, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC46(%rip), %rcx	 ;, tmp123
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1840:             output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; primary_16(D)->value.operand, primary_16(D)->value.operand
	movq	%rbp, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_primary	 ;
 ; ./asm_test/win/i/all.c:1841:             break;
	jmp	.L176	 ;
.L180:
 ; ./asm_test/win/i/all.c:1843:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1844:             fprintf(outfile, "type: \"-\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rcx	 ;, tmp126
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1845:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1846:             fprintf(outfile, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC46(%rip), %rcx	 ;, tmp127
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1847:             output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; primary_16(D)->value.operand, primary_16(D)->value.operand
	movq	%rbp, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_primary	 ;
 ; ./asm_test/win/i/all.c:1848:             break;
	jmp	.L176	 ;
.L178:
 ; ./asm_test/win/i/all.c:1850:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1851:             fprintf(outfile, "type: \"variable\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC49(%rip), %rcx	 ;, tmp130
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1852:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1853:             fprintf(outfile, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC46(%rip), %rcx	 ;, tmp131
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1854:             output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; primary_16(D)->value.var, primary_16(D)->value.var
	movq	%rbp, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; ./asm_test/win/i/all.c:1855:             break;
	jmp	.L176	 ;
.L177:
 ; ./asm_test/win/i/all.c:1857:             indention(outfile, indent, 1, indent_has_next);
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1858:             fprintf(outfile, "unknown_PrimaryType: %u\n", primary->type);
	movl	8(%rsi), %r8d	 ; primary_16(D)->type,
	leaq	.LC50(%rip), %rdx	 ;, tmp135
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1861: }
	jmp	.L176	 ;
	.section .rdata,"dr"
.LC51:
	.ascii "UNKNOWN_OPERATOR\0"
.LC52:
	.ascii "primary\12\0"
.LC53:
	.ascii "operator: \"%s\"\12\0"
.LC54:
	.ascii "left\12\0"
.LC55:
	.ascii "right\12\0"
	.text
	.def	output_expression;	.scl	3;	.type	32;	.endef
output_expression:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbp	 ; tmp127, expression
	movq	%rdx, %rbx	 ; tmp128, outfile
	movq	%r8, %rdi	 ; tmp129, indent
	movq	%r9, %rsi	 ; tmp130, indent_has_next
 ; ./asm_test/win/i/all.c:1780:     if (expression->operator == OP_NONE) {
	movl	24(%rcx), %eax	 ; expression_10(D)->operator, _1
 ; ./asm_test/win/i/all.c:1780:     if (expression->operator == OP_NONE) {
	cmpl	$19, %eax	 ;, _1
	je	.L218	 ;,
 ; ./asm_test/win/i/all.c:1251:     switch (op) {
	cmpl	$18, %eax	 ;, _1
	ja	.L215	 ;,
	movl	%eax, %eax	 ; _1, _1
	leaq	.L195(%rip), %rdx	 ;, tmp97
	movslq	(%rdx,%rax,4), %rax	 ;, tmp99
	addq	%rdx, %rax	 ; tmp97, tmp100
	jmp	*%rax	 ; tmp100
	.section .rdata,"dr"
	.align 4
.L195:
	.long	.L213-.L195
	.long	.L212-.L195
	.long	.L211-.L195
	.long	.L210-.L195
	.long	.L209-.L195
	.long	.L208-.L195
	.long	.L207-.L195
	.long	.L206-.L195
	.long	.L205-.L195
	.long	.L204-.L195
	.long	.L203-.L195
	.long	.L202-.L195
	.long	.L201-.L195
	.long	.L200-.L195
	.long	.L199-.L195
	.long	.L198-.L195
	.long	.L197-.L195
	.long	.L196-.L195
	.long	.L194-.L195
	.text
.L218:
 ; ./asm_test/win/i/all.c:1781:         indention(outfile, indent, 1, indent_has_next);
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1782:         fprintf(outfile, "primary\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC52(%rip), %rcx	 ;, tmp93
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1783:         output_primary(expression->prim_left, outfile, indent + 1, indent_has_next);
	movq	8(%rbp), %rcx	 ; expression_10(D)->prim_left, expression_10(D)->prim_left
	movq	%rsi, %r9	 ; indent_has_next,
	leaq	1(%rdi), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_primary	 ;
	jmp	.L190	 ;
.L200:
 ; ./asm_test/win/i/all.c:1252:         case OP_ASSIGN: return symbolList[18];
	movq	144+symbolList(%rip), %r12	 ; symbolList[18], iftmp.85_7
.L193:
 ; ./asm_test/win/i/all.c:1786:         indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1787:         fprintf(outfile, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	testq	%r12, %r12	 ; iftmp.85_7
 ; ./asm_test/win/i/all.c:1787:         fprintf(outfile, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	leaq	.LC51(%rip), %r8	 ;, tmp126
	cmovne	%r12, %r8	 ; iftmp.85_7,,
	leaq	.LC53(%rip), %rdx	 ;, tmp121
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1788:         indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1789:         fprintf(outfile, "left\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC54(%rip), %rcx	 ;, tmp122
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1790:         output_expression(expression->expr_left, outfile, indent + 1, indent_has_next);
	leaq	1(%rdi), %r12	 ;, _4
	movq	0(%rbp), %rcx	 ; expression_10(D)->expr_left, expression_10(D)->expr_left
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _4,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; ./asm_test/win/i/all.c:1791:         indention(outfile, indent, 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1792:         fprintf(outfile, "right\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC55(%rip), %rcx	 ;, tmp124
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1793:         output_expression(expression->right, outfile, indent + 1, indent_has_next);
	movq	16(%rbp), %rcx	 ; expression_10(D)->right, expression_10(D)->right
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _4,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
.L190:
 ; ./asm_test/win/i/all.c:1795: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L199:
 ; ./asm_test/win/i/all.c:1253:         case OP_ADD_ASSIGN: return symbolList[23];
	movq	184+symbolList(%rip), %r12	 ; symbolList[23], iftmp.85_7
	jmp	.L193	 ;
.L198:
 ; ./asm_test/win/i/all.c:1254:         case OP_SUB_ASSIGN: return symbolList[24];
	movq	192+symbolList(%rip), %r12	 ; symbolList[24], iftmp.85_7
	jmp	.L193	 ;
.L197:
 ; ./asm_test/win/i/all.c:1255:         case OP_MUL_ASSIGN: return symbolList[25];
	movq	200+symbolList(%rip), %r12	 ; symbolList[25], iftmp.85_7
	jmp	.L193	 ;
.L196:
 ; ./asm_test/win/i/all.c:1256:         case OP_DIV_ASSIGN: return symbolList[26];
	movq	208+symbolList(%rip), %r12	 ; symbolList[26], iftmp.85_7
	jmp	.L193	 ;
.L194:
 ; ./asm_test/win/i/all.c:1257:         case OP_MOD_ASSIGN: return symbolList[27];
	movq	216+symbolList(%rip), %r12	 ; symbolList[27], iftmp.85_7
	jmp	.L193	 ;
.L202:
 ; ./asm_test/win/i/all.c:1258:         case OP_AND: return symbolList[28];
	movq	224+symbolList(%rip), %r12	 ; symbolList[28], iftmp.85_7
	jmp	.L193	 ;
.L201:
 ; ./asm_test/win/i/all.c:1259:         case OP_OR: return symbolList[29];
	movq	232+symbolList(%rip), %r12	 ; symbolList[29], iftmp.85_7
	jmp	.L193	 ;
.L208:
 ; ./asm_test/win/i/all.c:1260:         case OP_EQ: return symbolList[19];
	movq	152+symbolList(%rip), %r12	 ; symbolList[19], iftmp.85_7
	jmp	.L193	 ;
.L207:
 ; ./asm_test/win/i/all.c:1261:         case OP_NE: return symbolList[20];
	movq	160+symbolList(%rip), %r12	 ; symbolList[20], iftmp.85_7
	jmp	.L193	 ;
.L206:
 ; ./asm_test/win/i/all.c:1262:         case OP_LT: return symbolList[16];
	movq	128+symbolList(%rip), %r12	 ; symbolList[16], iftmp.85_7
	jmp	.L193	 ;
.L205:
 ; ./asm_test/win/i/all.c:1263:         case OP_GT: return symbolList[17];
	movq	136+symbolList(%rip), %r12	 ; symbolList[17], iftmp.85_7
	jmp	.L193	 ;
.L204:
 ; ./asm_test/win/i/all.c:1264:         case OP_LE: return symbolList[21];
	movq	168+symbolList(%rip), %r12	 ; symbolList[21], iftmp.85_7
	jmp	.L193	 ;
.L203:
 ; ./asm_test/win/i/all.c:1265:         case OP_GE: return symbolList[22];
	movq	176+symbolList(%rip), %r12	 ; symbolList[22], iftmp.85_7
	jmp	.L193	 ;
.L213:
 ; ./asm_test/win/i/all.c:1266:         case OP_ADD: return symbolList[11];
	movq	88+symbolList(%rip), %r12	 ; symbolList[11], iftmp.85_7
	jmp	.L193	 ;
.L212:
 ; ./asm_test/win/i/all.c:1267:         case OP_SUB: return symbolList[12];
	movq	96+symbolList(%rip), %r12	 ; symbolList[12], iftmp.85_7
	jmp	.L193	 ;
.L211:
 ; ./asm_test/win/i/all.c:1268:         case OP_MUL: return symbolList[13];
	movq	104+symbolList(%rip), %r12	 ; symbolList[13], iftmp.85_7
	jmp	.L193	 ;
.L210:
 ; ./asm_test/win/i/all.c:1269:         case OP_DIV: return symbolList[14];
	movq	112+symbolList(%rip), %r12	 ; symbolList[14], iftmp.85_7
	jmp	.L193	 ;
.L209:
 ; ./asm_test/win/i/all.c:1270:         case OP_MOD: return symbolList[15];
	movq	120+symbolList(%rip), %r12	 ; symbolList[15], iftmp.85_7
	jmp	.L193	 ;
.L215:
 ; ./asm_test/win/i/all.c:1251:     switch (op) {
	movl	$0, %r12d	 ;, iftmp.85_7
	jmp	.L193	 ;
	.section .rdata,"dr"
.LC56:
	.ascii "value: \"NULL\"\12\0"
	.text
	.def	output_variable;	.scl	3;	.type	32;	.endef
output_variable:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbp	 ; tmp98, variable
	movq	%rdx, %rbx	 ; tmp99, outfile
	movq	%r8, %rdi	 ; tmp100, indent
	movq	%r9, %rsi	 ; tmp101, indent_has_next
 ; ./asm_test/win/i/all.c:1632:     indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1633:     fprintf(outfile, "type\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rcx	 ;, tmp91
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1634:     output_name(variable->type, outfile, indent + 1, indent_has_next);
	leaq	1(%rdi), %r12	 ;, _1
	movq	0(%rbp), %rcx	 ; variable_13(D)->type, variable_13(D)->type
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1635:     indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1636:     fprintf(outfile, "name\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC25(%rip), %rcx	 ;, tmp93
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1637:     output_name(variable->name, outfile, indent + 1, indent_has_next);
	movq	8(%rbp), %rcx	 ; variable_13(D)->name, variable_13(D)->name
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1638:     if (variable->value != NULL) {
	cmpq	$0, 16(%rbp)	 ;, variable_13(D)->value
	je	.L220	 ;,
 ; ./asm_test/win/i/all.c:1639:         indention(outfile, indent, 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1640:         fprintf(outfile, "value\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC46(%rip), %rcx	 ;, tmp95
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1641:         output_expression(variable->value, outfile, indent + 1, indent_has_next);
	movq	16(%rbp), %rcx	 ; variable_13(D)->value, variable_13(D)->value
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
.L219:
 ; ./asm_test/win/i/all.c:1646: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L220:
 ; ./asm_test/win/i/all.c:1643:         indention(outfile, indent, 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1644:         fprintf(outfile, "value: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC56(%rip), %rcx	 ;, tmp97
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1646: }
	jmp	.L219	 ;
	.section .rdata,"dr"
.LC57:
	.ascii "if_statement\12\0"
.LC58:
	.ascii "condition\12\0"
.LC59:
	.ascii "body\12\0"
.LC60:
	.ascii "else_if\12\0"
.LC61:
	.ascii "else_body\12\0"
.LC62:
	.ascii "for_statement\12\0"
.LC63:
	.ascii "initializer\12\0"
.LC64:
	.ascii "initializer: \"NULL\"\12\0"
.LC65:
	.ascii "condition: \"NULL\"\12\0"
.LC66:
	.ascii "increment\12\0"
.LC67:
	.ascii "increment: \"NULL\"\12\0"
.LC68:
	.ascii "while_statement\12\0"
	.align 8
.LC69:
	.ascii "variable_declaration_statement\12\0"
.LC70:
	.ascii "return_statement: \"NULL\"\12\0"
.LC71:
	.ascii "return_statement\12\0"
.LC72:
	.ascii "break_statement: \"NULL\"\12\0"
.LC73:
	.ascii "continue_statement: \"NULL\"\12\0"
.LC74:
	.ascii "expression_statement: \"NULL\"\12\0"
.LC75:
	.ascii "expression_statement\12\0"
.LC76:
	.ascii "unknown_StatementType: %u\12\0"
	.text
	.def	output_statement;	.scl	3;	.type	32;	.endef
output_statement:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp195, statement
	movq	%rdx, %rbx	 ; tmp196, outfile
	movq	%r8, %rbp	 ; tmp197, indent
	movq	%r9, %rsi	 ; tmp198, indent_has_next
 ; ./asm_test/win/i/all.c:1648:     switch (statement->type) {
	cmpl	$7, 8(%rcx)	 ;, statement_19(D)->type
	ja	.L224	 ;,
	movl	8(%rcx), %eax	 ; statement_19(D)->type, statement_19(D)->type
	leaq	.L226(%rip), %rdx	 ;, tmp137
	movslq	(%rdx,%rax,4), %rax	 ;, tmp139
	addq	%rdx, %rax	 ; tmp137, tmp140
	jmp	*%rax	 ; tmp140
	.section .rdata,"dr"
	.align 4
.L226:
	.long	.L233-.L226
	.long	.L232-.L226
	.long	.L231-.L226
	.long	.L230-.L226
	.long	.L229-.L226
	.long	.L228-.L226
	.long	.L227-.L226
	.long	.L225-.L226
	.text
.L231:
 ; ./asm_test/win/i/all.c:1650:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1651:             fprintf(outfile, "if_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC57(%rip), %rcx	 ;, tmp142
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1652:             output_if(statement->stmt.if_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %r15	 ;, _2
	movq	%r15, 40(%rsp)	 ; _2, %sfp
	movq	(%rdi), %r12	 ; statement_19(D)->stmt.if_stmt, _3
 ; ./asm_test/win/i/all.c:1704:     List* body = list_copy(if_->body);
	movq	8(%r12), %rcx	 ; _3->body, _3->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp199, body
 ; ./asm_test/win/i/all.c:1705:     List* else_if_list = list_copy(if_->else_if);
	movq	16(%r12), %rcx	 ; _3->else_if, _3->else_if
	call	list_copy	 ;
	movq	%rax, %r14	 ; tmp200, else_if_list
 ; ./asm_test/win/i/all.c:1706:     List* else_body = list_copy(if_->else_body);
	movq	24(%r12), %rcx	 ; _3->else_body, _3->else_body
	call	list_copy	 ;
	movq	%rax, 32(%rsp)	 ; tmp201, %sfp
 ; ./asm_test/win/i/all.c:1707:     indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r15, %rdx	 ; _2,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1708:     fprintf(outfile, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC58(%rip), %rcx	 ;, tmp146
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1709:     output_expression(if_->condition, outfile, indent + 1, indent_has_next);
	leaq	2(%rbp), %r13	 ;, _57
	movq	(%r12), %rcx	 ; _3->condition, _3->condition
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r13, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; ./asm_test/win/i/all.c:1710:     indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r15, %rdx	 ; _2,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1711:     fprintf(outfile, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC59(%rip), %rcx	 ;, tmp148
	call	fwrite	 ;
.L234:
 ; ./asm_test/win/i/all.c:1713:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp202, statement
 ; ./asm_test/win/i/all.c:1713:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L256	 ;,
 ; ./asm_test/win/i/all.c:1714:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r13, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L234	 ;
.L256:
 ; ./asm_test/win/i/all.c:1715:     indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1716:     fprintf(outfile, "else_if\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC60(%rip), %rcx	 ;, tmp149
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1728:     fprintf(outfile, "condition\n");
	leaq	.LC58(%rip), %r15	 ;, tmp191
 ; ./asm_test/win/i/all.c:1729:     output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
	addq	$3, %rbp	 ;, _64
.L236:
 ; ./asm_test/win/i/all.c:1718:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	movq	%r14, %rcx	 ; else_if_list,
	call	list_pop	 ;
	movq	%rax, %r12	 ; tmp205, else_if
 ; ./asm_test/win/i/all.c:1718:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	testq	%rax, %rax	 ; else_if
	je	.L257	 ;,
 ; ./asm_test/win/i/all.c:1726:     List* body = list_copy(else_if->body);
	movq	8(%r12), %rcx	 ; else_if_60->body, else_if_60->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp203, body
 ; ./asm_test/win/i/all.c:1727:     indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _57,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1728:     fprintf(outfile, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%r15, %rcx	 ; tmp191,
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1729:     output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
	movq	(%r12), %rcx	 ; else_if_60->condition, else_if_60->condition
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %r8	 ; _64,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; ./asm_test/win/i/all.c:1730:     indention(outfile, indent, 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%r13, %rdx	 ; _57,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1731:     fprintf(outfile, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC59(%rip), %rcx	 ;,
	call	fwrite	 ;
.L237:
 ; ./asm_test/win/i/all.c:1733:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
 ; ./asm_test/win/i/all.c:1733:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L236	 ;,
 ; ./asm_test/win/i/all.c:1734:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %r8	 ; _64,
	movq	%rbx, %rdx	 ; outfile,
	movq	%rax, %rcx	 ; statement,
	call	output_statement	 ;
	jmp	.L237	 ;
.L257:
 ; ./asm_test/win/i/all.c:1720:     indention(outfile, indent, 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1721:     fprintf(outfile, "else_body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC61(%rip), %rcx	 ;, tmp154
	call	fwrite	 ;
.L240:
 ; ./asm_test/win/i/all.c:1722:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	movq	32(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp206, statement
 ; ./asm_test/win/i/all.c:1722:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L223	 ;,
 ; ./asm_test/win/i/all.c:1723:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r13, %r8	 ; _57,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L240	 ;
.L229:
 ; ./asm_test/win/i/all.c:1655:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1656:             fprintf(outfile, "for_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC62(%rip), %rcx	 ;, tmp155
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1657:             output_for(statement->stmt.for_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %r13	 ;, _4
	movq	(%rdi), %r12	 ; statement_19(D)->stmt.for_stmt, _5
 ; ./asm_test/win/i/all.c:1737:     List* body = list_copy(for_->body);
	movq	24(%r12), %rcx	 ; _5->body, _5->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp207, body
 ; ./asm_test/win/i/all.c:1738:     if (for_->initializer != NULL) {
	cmpq	$0, (%r12)	 ;, _5->initializer
	je	.L243	 ;,
 ; ./asm_test/win/i/all.c:1739:         indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1740:         fprintf(outfile, "initializer\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC63(%rip), %rcx	 ;, tmp157
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1741:         output_variable(for_->initializer, outfile, indent + 1, indent_has_next);
	movq	(%r12), %rcx	 ; _5->initializer, _5->initializer
	movq	%rsi, %r9	 ; indent_has_next,
	leaq	2(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable	 ;
.L244:
 ; ./asm_test/win/i/all.c:1746:     if (for_->condition != NULL) {
	cmpq	$0, 8(%r12)	 ;, _5->condition
	je	.L245	 ;,
 ; ./asm_test/win/i/all.c:1747:         indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1748:         fprintf(outfile, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC58(%rip), %rcx	 ;, tmp161
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1749:         output_expression(for_->condition, outfile, indent + 1, indent_has_next);
	movq	8(%r12), %rcx	 ; _5->condition, _5->condition
	movq	%rsi, %r9	 ; indent_has_next,
	leaq	2(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
.L246:
 ; ./asm_test/win/i/all.c:1754:     if (for_->increment != NULL) {
	cmpq	$0, 16(%r12)	 ;, _5->increment
	je	.L247	 ;,
 ; ./asm_test/win/i/all.c:1755:         indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1756:         fprintf(outfile, "increment\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC66(%rip), %rcx	 ;, tmp165
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1757:         output_expression(for_->increment, outfile, indent + 1, indent_has_next);
	movq	16(%r12), %rcx	 ; _5->increment, _5->increment
	movq	%rsi, %r9	 ; indent_has_next,
	leaq	2(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
.L248:
 ; ./asm_test/win/i/all.c:1762:     indention(outfile, indent, 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1763:     fprintf(outfile, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC59(%rip), %rcx	 ;, tmp169
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1766:         output_statement(statement, outfile, indent + 1, indent_has_next);
	addq	$2, %rbp	 ;, tmp194
.L249:
 ; ./asm_test/win/i/all.c:1765:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp208, statement
 ; ./asm_test/win/i/all.c:1765:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L223	 ;,
 ; ./asm_test/win/i/all.c:1766:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %r8	 ; tmp194,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L249	 ;
.L243:
 ; ./asm_test/win/i/all.c:1743:         indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1744:         fprintf(outfile, "initializer: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$20, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC64(%rip), %rcx	 ;, tmp160
	call	fwrite	 ;
	jmp	.L244	 ;
.L245:
 ; ./asm_test/win/i/all.c:1751:         indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1752:         fprintf(outfile, "condition: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC65(%rip), %rcx	 ;, tmp164
	call	fwrite	 ;
	jmp	.L246	 ;
.L247:
 ; ./asm_test/win/i/all.c:1759:         indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; _4,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1760:         fprintf(outfile, "increment: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC67(%rip), %rcx	 ;, tmp168
	call	fwrite	 ;
	jmp	.L248	 ;
.L230:
 ; ./asm_test/win/i/all.c:1660:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1661:             fprintf(outfile, "while_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC68(%rip), %rcx	 ;, tmp171
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1662:             output_while(statement->stmt.while_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %r12	 ;, _6
	movq	(%rdi), %r13	 ; statement_19(D)->stmt.while_stmt, _7
 ; ./asm_test/win/i/all.c:1769:     List* body = list_copy(while_->body);
	movq	8(%r13), %rcx	 ; _7->body, _7->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp209, body
 ; ./asm_test/win/i/all.c:1770:     indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$0, %r8d	 ;,
	movq	%r12, %rdx	 ; _6,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1771:     fprintf(outfile, "condition\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC58(%rip), %rcx	 ;, tmp173
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1772:     output_expression(while_->condition, outfile, indent + 1, indent_has_next);
	addq	$2, %rbp	 ;, _82
	movq	0(%r13), %rcx	 ; _7->condition, _7->condition
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %r8	 ; _82,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; ./asm_test/win/i/all.c:1773:     indention(outfile, indent, 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%r12, %rdx	 ; _6,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1774:     fprintf(outfile, "body\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC59(%rip), %rcx	 ;, tmp175
	call	fwrite	 ;
.L251:
 ; ./asm_test/win/i/all.c:1776:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rdi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp210, statement
 ; ./asm_test/win/i/all.c:1776:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L223	 ;,
 ; ./asm_test/win/i/all.c:1777:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %r8	 ; _82,
	movq	%rbx, %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L251	 ;
.L232:
 ; ./asm_test/win/i/all.c:1665:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1666:             fprintf(outfile, "variable_declaration_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC69(%rip), %rcx	 ;, tmp176
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1667:             output_variable(statement->stmt.var, outfile, indent + 1, indent_has_next);
	movq	(%rdi), %rcx	 ; statement_19(D)->stmt.var, statement_19(D)->stmt.var
	movq	%rsi, %r9	 ; indent_has_next,
	leaq	1(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable	 ;
.L223:
 ; ./asm_test/win/i/all.c:1702: }
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
.L228:
 ; ./asm_test/win/i/all.c:1670:             if (statement->stmt.expr == NULL) {
	cmpq	$0, (%rcx)	 ;, statement_19(D)->stmt.expr
	je	.L258	 ;,
 ; ./asm_test/win/i/all.c:1675:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1676:             fprintf(outfile, "return_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC71(%rip), %rcx	 ;, tmp180
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1677:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	movq	(%rdi), %rcx	 ; statement_19(D)->stmt.expr, statement_19(D)->stmt.expr
	movq	%rsi, %r9	 ; indent_has_next,
	leaq	1(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; ./asm_test/win/i/all.c:1678:             break;
	jmp	.L223	 ;
.L258:
 ; ./asm_test/win/i/all.c:1671:                 indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1672:                 fprintf(outfile, "return_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$25, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC70(%rip), %rcx	 ;, tmp179
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1673:                 return;
	jmp	.L223	 ;
.L227:
 ; ./asm_test/win/i/all.c:1680:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1681:             fprintf(outfile, "break_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$24, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC72(%rip), %rcx	 ;, tmp183
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1682:             break;
	jmp	.L223	 ;
.L225:
 ; ./asm_test/win/i/all.c:1684:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1685:             fprintf(outfile, "continue_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$27, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC73(%rip), %rcx	 ;, tmp184
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1686:             break;
	jmp	.L223	 ;
.L233:
 ; ./asm_test/win/i/all.c:1688:             if (statement->stmt.expr == NULL) {
	cmpq	$0, (%rcx)	 ;, statement_19(D)->stmt.expr
	je	.L259	 ;,
 ; ./asm_test/win/i/all.c:1693:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1694:             fprintf(outfile, "expression_statement\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$21, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC75(%rip), %rcx	 ;, tmp186
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1695:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	movq	(%rdi), %rcx	 ; statement_19(D)->stmt.expr, statement_19(D)->stmt.expr
	movq	%rsi, %r9	 ; indent_has_next,
	leaq	1(%rbp), %r8	 ;,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; ./asm_test/win/i/all.c:1696:             break;
	jmp	.L223	 ;
.L259:
 ; ./asm_test/win/i/all.c:1689:                 indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1690:                 fprintf(outfile, "expression_statement: \"NULL\"\n");
	movq	%rbx, %r9	 ; outfile,
	movl	$29, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC74(%rip), %rcx	 ;, tmp185
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1691:                 return;
	jmp	.L223	 ;
.L224:
 ; ./asm_test/win/i/all.c:1698:             indention(outfile, indent, 0, indent_has_next);
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1699:             fprintf(outfile, "unknown_StatementType: %u\n", statement->type);
	movl	8(%rdi), %r8d	 ; statement_19(D)->type,
	leaq	.LC76(%rip), %rdx	 ;, tmp190
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1700:             break;
	jmp	.L223	 ;
	.def	create_symbol_table;	.scl	3;	.type	32;	.endef
create_symbol_table:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp86, parent
 ; ./asm_test/win/i/all.c:1112:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp87, <retval>
 ; ./asm_test/win/i/all.c:1113:     new_scope->parent = parent;
	movq	%rsi, (%rax)	 ; parent, new_scope_4->parent
 ; ./asm_test/win/i/all.c:1114:     new_scope->symbols = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:1114:     new_scope->symbols = create_list();
	movq	%rax, 8(%rbx)	 ; tmp88, new_scope_4->symbols
 ; ./asm_test/win/i/all.c:1116: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.section .rdata,"dr"
.LC77:
	.ascii "true\0"
.LC78:
	.ascii "false\0"
	.align 8
.LC79:
	.ascii "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\12\0"
	.align 8
.LC80:
	.ascii "Error creating variable access: content is NULL\12\0"
	.align 8
.LC81:
	.ascii "Error creating variable access: unknown type %u\12\0"
	.text
	.def	create_variable_access;	.scl	3;	.type	32;	.endef
create_variable_access:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movl	%ecx, %ebx	 ; tmp137, type
	movq	%rdx, %rsi	 ; tmp138, base
 ; ./asm_test/win/i/all.c:868:     if ((base == NULL) != (type == VAR_NAME)) {
	testl	%ecx, %ecx	 ; type
	sete	%r12b	 ;, _2
	testq	%rdx, %rdx	 ; base
	sete	%al	 ;, tmp112
 ; ./asm_test/win/i/all.c:868:     if ((base == NULL) != (type == VAR_NAME)) {
	cmpb	%r12b, %al	 ; _2, tmp112
	jne	.L275	 ;,
	movq	%r8, %rbp	 ; tmp139, name_content
	movq	%r9, %rdi	 ; tmp140, expr_content
 ; ./asm_test/win/i/all.c:872:     VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:873:     variable_access->type = type;
	movl	%ebx, 16(%rax)	 ; type, variable_access_28->type
 ; ./asm_test/win/i/all.c:874:     variable_access->base = base;
	movq	%rsi, (%rax)	 ; base, variable_access_28->base
 ; ./asm_test/win/i/all.c:875:     if (type == VAR_NAME && name_content != NULL)
	testq	%rbp, %rbp	 ; name_content
	setne	%dl	 ;, _4
 ; ./asm_test/win/i/all.c:875:     if (type == VAR_NAME && name_content != NULL)
	testb	%r12b, %r12b	 ; _2
	je	.L267	 ;,
	testb	%dl, %dl	 ; _4
	je	.L267	 ;,
 ; ./asm_test/win/i/all.c:876:         variable_access->content.name = name_content;
	movq	%rbp, 8(%rax)	 ; name_content, variable_access_28->content.name
	jmp	.L262	 ;
.L275:
 ; ./asm_test/win/i/all.c:869:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	testl	%ecx, %ecx	 ; type
	leaq	.LC78(%rip), %rdi	 ;, tmp133
	leaq	.LC77(%rip), %rax	 ;, tmp134
	cmove	%rax, %rdi	 ; tmp133,, tmp134, iftmp.68_19
 ; ./asm_test/win/i/all.c:869:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	testq	%rdx, %rdx	 ; base
	leaq	.LC78(%rip), %rbx	 ;, tmp135
	cmove	%rax, %rbx	 ; tmp135,, tmp136, iftmp.69_20
 ; ./asm_test/win/i/all.c:869:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp141, _3
 ; ./asm_test/win/i/all.c:869:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	%rdi, %r9	 ; iftmp.68_19,
	movq	%rbx, %r8	 ; iftmp.69_20,
	leaq	.LC79(%rip), %rdx	 ;, tmp114
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:870:         return NULL;
	movl	$0, %eax	 ;, <retval>
.L262:
 ; ./asm_test/win/i/all.c:891: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L267:
 ; ./asm_test/win/i/all.c:877:     else if (type == VAR_FUNC_CALL && args_content != NULL)
	cmpl	$1, %ebx	 ;, type
	jne	.L268	 ;,
	cmpq	$0, 112(%rsp)	 ;, args_content
	je	.L268	 ;,
 ; ./asm_test/win/i/all.c:878:         variable_access->content.args = args_content;
	movq	112(%rsp), %rdi	 ; args_content, tmp147
	movq	%rdi, 8(%rax)	 ; tmp147, variable_access_28->content.args
	jmp	.L262	 ;
.L268:
 ; ./asm_test/win/i/all.c:879:     else if (type == VAR_GET_SEQ && expr_content != NULL)
	cmpl	$3, %ebx	 ;, type
	jne	.L269	 ;,
	testq	%rdi, %rdi	 ; expr_content
	je	.L269	 ;,
 ; ./asm_test/win/i/all.c:880:         variable_access->content.index = expr_content;
	movq	%rdi, 8(%rax)	 ; expr_content, variable_access_28->content.index
	jmp	.L262	 ;
.L269:
 ; ./asm_test/win/i/all.c:881:     else if (type == VAR_GET_ATTR && name_content != NULL)
	cmpl	$2, %ebx	 ;, type
	jne	.L270	 ;,
	testb	%dl, %dl	 ; _4
	je	.L270	 ;,
 ; ./asm_test/win/i/all.c:882:         variable_access->content.attr_name = name_content;
	movq	%rbp, 8(%rax)	 ; name_content, variable_access_28->content.attr_name
	jmp	.L262	 ;
.L270:
 ; ./asm_test/win/i/all.c:884:         if (name_content == NULL && expr_content == NULL && args_content == NULL)
	orq	112(%rsp), %rdi	 ; args_content, expr_content
	movq	%rdi, %r9	 ; expr_content, tmp126
	orq	%rbp, %r9	 ; name_content, tmp145
	je	.L276	 ;,
 ; ./asm_test/win/i/all.c:887:             fprintf(stderr, "Error creating variable access: unknown type %u\n", type);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp144, _18
 ; ./asm_test/win/i/all.c:887:             fprintf(stderr, "Error creating variable access: unknown type %u\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC81(%rip), %rdx	 ;, tmp131
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:888:         return NULL;
	movl	$0, %eax	 ;, <retval>
	jmp	.L262	 ;
.L276:
 ; ./asm_test/win/i/all.c:885:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp143
 ; ./asm_test/win/i/all.c:885:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	movl	$48, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC80(%rip), %rcx	 ;, tmp129
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:888:         return NULL;
	movl	$0, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:885:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	jmp	.L262	 ;
	.section .rdata,"dr"
	.align 8
.LC82:
	.ascii "Error creating primary: value is NULL\12\0"
	.align 8
.LC83:
	.ascii "Error creating primary: unknown type %u\12\0"
	.text
	.def	create_primary;	.scl	3;	.type	32;	.endef
create_primary:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movl	%ecx, %ebx	 ; tmp135, type
	movq	%rdx, %rsi	 ; tmp136, str_value
	movq	%r8, %rbp	 ; tmp137, expr_value
	movq	%r9, %rdi	 ; tmp138, prim_value
 ; ./asm_test/win/i/all.c:848:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:849:     primary->type = type;
	movl	%ebx, 8(%rax)	 ; type, primary_24->type
 ; ./asm_test/win/i/all.c:850:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpl	$4, %ebx	 ;, type
	ja	.L278	 ;,
	testq	%rsi, %rsi	 ; str_value
	je	.L278	 ;,
 ; ./asm_test/win/i/all.c:851:         primary->value.literal_value = str_value;
	movq	%rsi, (%rax)	 ; str_value, primary_24->value.literal_value
.L277:
 ; ./asm_test/win/i/all.c:866: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L278:
 ; ./asm_test/win/i/all.c:852:     else if (type == PRIM_EXPRESSION && expr_value != NULL)
	cmpl	$5, %ebx	 ;, type
	jne	.L280	 ;,
	testq	%rbp, %rbp	 ; expr_value
	je	.L280	 ;,
 ; ./asm_test/win/i/all.c:853:         primary->value.expr = expr_value;
	movq	%rbp, (%rax)	 ; expr_value, primary_24->value.expr
	jmp	.L277	 ;
.L280:
 ; ./asm_test/win/i/all.c:854:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	leal	-6(%rbx), %edx	 ;, tmp118
 ; ./asm_test/win/i/all.c:854:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	cmpl	$1, %edx	 ;, tmp118
	ja	.L281	 ;,
	testq	%rdi, %rdi	 ; prim_value
	jne	.L285	 ;,
.L281:
 ; ./asm_test/win/i/all.c:856:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != NULL)
	cmpl	$8, %ebx	 ;, type
	jne	.L282	 ;,
	cmpq	$0, 112(%rsp)	 ;, variable_value
	je	.L282	 ;,
 ; ./asm_test/win/i/all.c:857:         primary->value.var = variable_value;
	movq	112(%rsp), %rdi	 ; variable_value, tmp144
	movq	%rdi, (%rax)	 ; tmp144, primary_24->value.var
	jmp	.L277	 ;
.L285:
 ; ./asm_test/win/i/all.c:855:         primary->value.operand = prim_value;
	movq	%rdi, (%rax)	 ; prim_value, primary_24->value.operand
	jmp	.L277	 ;
.L282:
 ; ./asm_test/win/i/all.c:859:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	movq	%rdi, %rax	 ; prim_value, prim_value
	orq	112(%rsp), %rax	 ; variable_value, prim_value
	movq	%rbp, %r8	 ; expr_value, expr_value
	orq	%rax, %r8	 ; tmp127, expr_value
	orq	%rsi, %r8	 ; str_value, tmp142
	jne	.L283	 ;,
 ; ./asm_test/win/i/all.c:860:             fprintf(stderr, "Error creating primary: value is NULL\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp140
 ; ./asm_test/win/i/all.c:860:             fprintf(stderr, "Error creating primary: value is NULL\n");
	movl	$38, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC82(%rip), %rcx	 ;, tmp131
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:863:         return NULL;
	movl	$0, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:860:             fprintf(stderr, "Error creating primary: value is NULL\n");
	jmp	.L277	 ;
.L283:
 ; ./asm_test/win/i/all.c:862:             fprintf(stderr, "Error creating primary: unknown type %u\n", type);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp141, _18
 ; ./asm_test/win/i/all.c:862:             fprintf(stderr, "Error creating primary: unknown type %u\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC83(%rip), %rdx	 ;, tmp133
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:863:         return NULL;
	movl	$0, %eax	 ;, <retval>
	jmp	.L277	 ;
	.section .rdata,"dr"
	.align 8
.LC84:
	.ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\12\0"
	.align 8
.LC85:
	.ascii "Error creating expression: both expr_left and prim_left are NULL\12\0"
	.text
	.def	create_expression;	.scl	3;	.type	32;	.endef
create_expression:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
	movl	%ecx, %ebx	 ; tmp120, operator
	movq	%rdx, %rsi	 ; tmp121, expr_left
	movq	%r8, %rbp	 ; tmp122, prim_left
	movq	%r9, %rdi	 ; tmp123, right
 ; ./asm_test/win/i/all.c:826:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpl	$19, %ecx	 ;, operator
	sete	%dl	 ;, tmp99
	testq	%r9, %r9	 ; right
	sete	%al	 ;, tmp101
 ; ./asm_test/win/i/all.c:826:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpb	%al, %dl	 ; tmp101, tmp99
	jne	.L287	 ;,
 ; ./asm_test/win/i/all.c:826:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	movq	%r8, %rax	 ; prim_left, tmp127
	orq	%rsi, %rax	 ; expr_left, tmp127
	je	.L305	 ;,
 ; ./asm_test/win/i/all.c:834:     Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:835:     expression->operator = operator;
	movl	%ebx, 24(%rax)	 ; operator, expression_21->operator
 ; ./asm_test/win/i/all.c:836:     if (expr_left != NULL)
	testq	%rsi, %rsi	 ; expr_left
	je	.L295	 ;,
 ; ./asm_test/win/i/all.c:837:         expression->expr_left = expr_left;
	movq	%rsi, (%rax)	 ; expr_left, expression_21->expr_left
.L296:
 ; ./asm_test/win/i/all.c:844:     expression->right = right;
	movq	%rdi, 16(%rax)	 ; right, expression_21->right
 ; ./asm_test/win/i/all.c:845:     return expression;
	jmp	.L286	 ;
.L287:
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%r9, %r9	 ; right
	leaq	.LC77(%rip), %rdi	 ;, tmp108
	leaq	.LC78(%rip), %rax	 ;, tmp109
	cmovne	%rax, %rdi	 ; tmp108,, tmp109, iftmp.70_4
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%r8, %r8	 ; prim_left
	movq	%rax, %rbp	 ;, tmp118
	leaq	.LC77(%rip), %rax	 ;, tmp119
	cmove	%rax, %rbp	 ; tmp118,, tmp119, iftmp.71_3
.L291:
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%rsi, %rsi	 ; expr_left
	leaq	.LC78(%rip), %rsi	 ;, tmp110
	leaq	.LC77(%rip), %rax	 ;, tmp111
	cmove	%rax, %rsi	 ; tmp110,, tmp111, iftmp.72_10
.L292:
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmpl	$19, %ebx	 ;, operator
	leaq	.LC78(%rip), %rbx	 ;, tmp112
	leaq	.LC77(%rip), %rax	 ;, tmp113
	cmove	%rax, %rbx	 ; tmp112,, tmp113, iftmp.73_11
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp124, _6
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rdi, 40(%rsp)	 ; iftmp.70_4,
	movq	%rbp, 32(%rsp)	 ; iftmp.71_3,
	movq	%rsi, %r9	 ; iftmp.72_10,
	movq	%rbx, %r8	 ; iftmp.73_11,
	leaq	.LC84(%rip), %rdx	 ;, tmp104
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:832:         return NULL;
	movl	$0, %eax	 ;, <retval>
.L286:
 ; ./asm_test/win/i/all.c:846: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L302:
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC77(%rip), %rdi	 ;, iftmp.70_4
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rdi, %rbp	 ; iftmp.70_4, iftmp.71_3
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rdi, %rsi	 ; iftmp.70_4, iftmp.72_10
	jmp	.L292	 ;
.L295:
 ; ./asm_test/win/i/all.c:838:     else if (prim_left != NULL)
	testq	%rbp, %rbp	 ; prim_left
	je	.L297	 ;,
 ; ./asm_test/win/i/all.c:839:         expression->prim_left = prim_left;
	movq	%rbp, 8(%rax)	 ; prim_left, expression_21->prim_left
	jmp	.L296	 ;
.L297:
 ; ./asm_test/win/i/all.c:841:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp126
 ; ./asm_test/win/i/all.c:841:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	movl	$65, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC85(%rip), %rcx	 ;, tmp106
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:842:         return NULL;
	movq	%rbp, %rax	 ; prim_left, <retval>
	jmp	.L286	 ;
.L305:
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%r9, %r9	 ; right
	je	.L302	 ;,
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC78(%rip), %rdi	 ;, iftmp.70_4
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC77(%rip), %rbp	 ;, iftmp.71_3
	jmp	.L291	 ;
	.section .rdata,"dr"
	.align 8
.LC86:
	.ascii "Error creating variable: type or name is NULL\12\0"
	.text
	.def	create_variable;	.scl	3;	.type	32;	.endef
create_variable:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; ./asm_test/win/i/all.c:753:     if (type == NULL || name == NULL) {
	testq	%rcx, %rcx	 ; type
	je	.L310	 ;,
	movq	%rcx, %rbx	 ; tmp97, type
	movq	%rdx, %rsi	 ; tmp98, name
	movq	%r8, %rdi	 ; tmp99, value
	testq	%rdx, %rdx	 ; name
	je	.L310	 ;,
 ; ./asm_test/win/i/all.c:757:     Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:758:     variable->type = type;
	movq	%rbx, (%rax)	 ; type, variable_11->type
 ; ./asm_test/win/i/all.c:759:     variable->name = name;
	movq	%rsi, 8(%rax)	 ; name, variable_11->name
 ; ./asm_test/win/i/all.c:760:     variable->value = value;
	movq	%rdi, 16(%rax)	 ; value, variable_11->value
.L306:
 ; ./asm_test/win/i/all.c:762: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
.L310:
 ; ./asm_test/win/i/all.c:754:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp100
 ; ./asm_test/win/i/all.c:754:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	movl	$46, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC86(%rip), %rcx	 ;, tmp95
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:755:         return NULL;
	movl	$0, %eax	 ;, <retval>
	jmp	.L306	 ;
	.section .rdata,"dr"
	.align 8
.LC87:
	.ascii "Error creating statement: content is NULL\12\0"
	.align 8
.LC88:
	.ascii "Error creating statement: unknown type %u\12\0"
	.text
	.def	create_statement;	.scl	3;	.type	32;	.endef
create_statement:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movl	%ecx, %ebx	 ; tmp146, type
	movq	%rdx, %rsi	 ; tmp147, if_stmt
	movq	%r8, %rbp	 ; tmp148, while_stmt
	movq	%r9, %rdi	 ; tmp149, for_stmt
	movq	112(%rsp), %r12	 ; expr, expr
 ; ./asm_test/win/i/all.c:764:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:765:     statement->type = type;
	movl	%ebx, 8(%rax)	 ; type, statement_30->type
 ; ./asm_test/win/i/all.c:766:     if (type == EXPRESSION_STATEMENT && expr != NULL)
	testl	%ebx, %ebx	 ; type
	jne	.L313	 ;,
	testq	%r12, %r12	 ; expr
	je	.L313	 ;,
 ; ./asm_test/win/i/all.c:767:         statement->stmt.expr = expr;
	movq	%r12, (%rax)	 ; expr, statement_30->stmt.expr
.L312:
 ; ./asm_test/win/i/all.c:788: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L313:
 ; ./asm_test/win/i/all.c:768:     else if (type == VARIABLE_STATEMENT && var_stmt != NULL)
	cmpl	$1, %ebx	 ;, type
	jne	.L315	 ;,
	cmpq	$0, 120(%rsp)	 ;, var_stmt
	je	.L315	 ;,
 ; ./asm_test/win/i/all.c:769:         statement->stmt.var = var_stmt;
	movq	120(%rsp), %rdi	 ; var_stmt, tmp155
	movq	%rdi, (%rax)	 ; tmp155, statement_30->stmt.var
	jmp	.L312	 ;
.L315:
 ; ./asm_test/win/i/all.c:770:     else if (type == IF_STATEMENT && if_stmt != NULL)
	cmpl	$2, %ebx	 ;, type
	jne	.L316	 ;,
	testq	%rsi, %rsi	 ; if_stmt
	je	.L316	 ;,
 ; ./asm_test/win/i/all.c:771:         statement->stmt.if_stmt = if_stmt;
	movq	%rsi, (%rax)	 ; if_stmt, statement_30->stmt.if_stmt
	jmp	.L312	 ;
.L316:
 ; ./asm_test/win/i/all.c:772:     else if (type == WHILE_STATEMENT && while_stmt != NULL)
	cmpl	$3, %ebx	 ;, type
	jne	.L317	 ;,
	testq	%rbp, %rbp	 ; while_stmt
	je	.L317	 ;,
 ; ./asm_test/win/i/all.c:773:         statement->stmt.while_stmt = while_stmt;
	movq	%rbp, (%rax)	 ; while_stmt, statement_30->stmt.while_stmt
	jmp	.L312	 ;
.L317:
 ; ./asm_test/win/i/all.c:774:     else if (type == FOR_STATEMENT && for_stmt != NULL)
	cmpl	$4, %ebx	 ;, type
	jne	.L318	 ;,
	testq	%rdi, %rdi	 ; for_stmt
	je	.L318	 ;,
 ; ./asm_test/win/i/all.c:775:         statement->stmt.for_stmt = for_stmt;
	movq	%rdi, (%rax)	 ; for_stmt, statement_30->stmt.for_stmt
	jmp	.L312	 ;
.L318:
 ; ./asm_test/win/i/all.c:776:     else if (type == RETURN_STATEMENT)
	cmpl	$5, %ebx	 ;, type
	je	.L323	 ;,
 ; ./asm_test/win/i/all.c:778:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	leal	-6(%rbx), %edx	 ;, tmp136
 ; ./asm_test/win/i/all.c:778:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$1, %edx	 ;, tmp136
	ja	.L320	 ;,
 ; ./asm_test/win/i/all.c:779:         statement->stmt.expr = NULL;
	movq	$0, (%rax)	 ;, statement_30->stmt.expr
	jmp	.L312	 ;
.L323:
 ; ./asm_test/win/i/all.c:777:         statement->stmt.return_expr = expr;
	movq	%r12, (%rax)	 ; expr, statement_30->stmt.return_expr
	jmp	.L312	 ;
.L320:
 ; ./asm_test/win/i/all.c:781:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	orq	%rbp, %rdi	 ; while_stmt, for_stmt
	orq	%rdi, %rsi	 ; tmp137, tmp138
	movq	%rsi, %rax	 ; tmp138, tmp138
	orq	120(%rsp), %rax	 ; var_stmt, tmp138
	orq	%r12, %rax	 ; expr, tmp153
	je	.L324	 ;,
 ; ./asm_test/win/i/all.c:784:             fprintf(stderr, "Error creating statement: unknown type %u\n", type);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp152, _24
 ; ./asm_test/win/i/all.c:784:             fprintf(stderr, "Error creating statement: unknown type %u\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC88(%rip), %rdx	 ;, tmp144
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:785:         return NULL;
	movl	$0, %eax	 ;, <retval>
	jmp	.L312	 ;
.L324:
 ; ./asm_test/win/i/all.c:782:             fprintf(stderr, "Error creating statement: content is NULL\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp151
 ; ./asm_test/win/i/all.c:782:             fprintf(stderr, "Error creating statement: content is NULL\n");
	movl	$42, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC87(%rip), %rcx	 ;, tmp142
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:785:         return NULL;
	movl	$0, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:782:             fprintf(stderr, "Error creating statement: content is NULL\n");
	jmp	.L312	 ;
	.section .rdata,"dr"
	.align 8
.LC89:
	.ascii "Error creating class member: content is NULL\12\0"
	.align 8
.LC90:
	.ascii "Error creating class member: unknown type %u\12\0"
	.text
	.def	create_class_member;	.scl	3;	.type	32;	.endef
create_class_member:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movl	%ecx, %ebx	 ; tmp111, type
	movq	%rdx, %rsi	 ; tmp112, method_content
	movq	%r8, %rdi	 ; tmp113, variable_content
 ; ./asm_test/win/i/all.c:726:     ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:727:     class_member->type = type;
	movl	%ebx, 8(%rax)	 ; type, class_member_17->type
 ; ./asm_test/win/i/all.c:728:     if (type == CLASS_METHOD && method_content != NULL)
	testl	%ebx, %ebx	 ; type
	jne	.L326	 ;,
	testq	%rsi, %rsi	 ; method_content
	je	.L326	 ;,
 ; ./asm_test/win/i/all.c:729:         class_member->content.method = method_content;
	movq	%rsi, (%rax)	 ; method_content, class_member_17->content.method
.L325:
 ; ./asm_test/win/i/all.c:740: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
.L326:
 ; ./asm_test/win/i/all.c:730:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	cmpl	$1, %ebx	 ;, type
	jne	.L328	 ;,
	testq	%rdi, %rdi	 ; variable_content
	je	.L328	 ;,
 ; ./asm_test/win/i/all.c:731:         class_member->content.variable = variable_content;
	movq	%rdi, (%rax)	 ; variable_content, class_member_17->content.variable
	jmp	.L325	 ;
.L328:
 ; ./asm_test/win/i/all.c:733:         if (method_content == NULL && variable_content == NULL)
	orq	%rsi, %rdi	 ; method_content, variable_content
	jne	.L329	 ;,
 ; ./asm_test/win/i/all.c:734:             fprintf(stderr, "Error creating class member: content is NULL\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp115
 ; ./asm_test/win/i/all.c:734:             fprintf(stderr, "Error creating class member: content is NULL\n");
	movl	$45, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC89(%rip), %rcx	 ;, tmp107
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:737:         return NULL;
	movl	$0, %eax	 ;, <retval>
	jmp	.L325	 ;
.L329:
 ; ./asm_test/win/i/all.c:736:             fprintf(stderr, "Error creating class member: unknown type %u\n", type);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp116, _11
 ; ./asm_test/win/i/all.c:736:             fprintf(stderr, "Error creating class member: unknown type %u\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC90(%rip), %rdx	 ;, tmp109
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:737:         return NULL;
	movl	$0, %eax	 ;, <retval>
	jmp	.L325	 ;
	.section .rdata,"dr"
	.align 8
.LC91:
	.ascii "Error creating code member: content is NULL\12\0"
	.align 8
.LC92:
	.ascii "Error creating code member: unknown type %u\12\0"
	.text
	.def	create_code_member;	.scl	3;	.type	32;	.endef
create_code_member:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movl	%ecx, %esi	 ; tmp122, type
	movq	%rdx, %rdi	 ; tmp123, import_content
	movq	%r8, %r12	 ; tmp124, function_content
	movq	%r9, %rbp	 ; tmp125, class_content
 ; ./asm_test/win/i/all.c:671:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp126, <retval>
 ; ./asm_test/win/i/all.c:672:     code_member->type = type;
	movl	%esi, 8(%rax)	 ; type, code_member_18->type
 ; ./asm_test/win/i/all.c:673:     if (type == CODE_IMPORT && import_content != NULL)
	testl	%esi, %esi	 ; type
	jne	.L332	 ;,
	testq	%rdi, %rdi	 ; import_content
	je	.L332	 ;,
 ; ./asm_test/win/i/all.c:674:         code_member->content.import = import_content;
	movq	%rdi, (%rax)	 ; import_content, code_member_18->content.import
.L331:
 ; ./asm_test/win/i/all.c:684: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L332:
 ; ./asm_test/win/i/all.c:675:     else if (type == CODE_FUNCTION && function_content != NULL)
	cmpl	$1, %esi	 ;, type
	jne	.L334	 ;,
	testq	%r12, %r12	 ; function_content
	je	.L334	 ;,
 ; ./asm_test/win/i/all.c:676:         code_member->content.function = function_content;
	movq	%r12, (%rbx)	 ; function_content, code_member_18->content.function
	jmp	.L331	 ;
.L334:
 ; ./asm_test/win/i/all.c:677:     else if (type == CODE_CLASS && class_content != NULL)
	cmpl	$2, %esi	 ;, type
	jne	.L335	 ;,
	testq	%rbp, %rbp	 ; class_content
	je	.L335	 ;,
 ; ./asm_test/win/i/all.c:678:         code_member->content.class = class_content;
	movq	%rbp, (%rbx)	 ; class_content, code_member_18->content.class
	jmp	.L331	 ;
.L335:
 ; ./asm_test/win/i/all.c:679:     else if (import_content == NULL && function_content == NULL && class_content == NULL)
	movq	%rbp, %r9	 ; class_content, class_content
	orq	%r12, %r9	 ; function_content, class_content
	orq	%rdi, %r9	 ; import_content, tmp129
	je	.L338	 ;,
 ; ./asm_test/win/i/all.c:682:         fprintf(stderr, "Error creating code member: unknown type %u\n", type);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp128, _14
 ; ./asm_test/win/i/all.c:682:         fprintf(stderr, "Error creating code member: unknown type %u\n", type);
	movl	%esi, %r8d	 ; type,
	leaq	.LC92(%rip), %rdx	 ;, tmp120
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:683:     return code_member;
	jmp	.L331	 ;
.L338:
 ; ./asm_test/win/i/all.c:680:         fprintf(stderr, "Error creating code member: content is NULL\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp127
 ; ./asm_test/win/i/all.c:680:         fprintf(stderr, "Error creating code member: content is NULL\n");
	movl	$44, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC91(%rip), %rcx	 ;, tmp118
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:680:         fprintf(stderr, "Error creating code member: content is NULL\n");
	jmp	.L331	 ;
	.section .rdata,"dr"
	.align 8
.LC93:
	.ascii "Error: list_append received NULL list\12\0"
	.text
	.def	list_append;	.scl	3;	.type	32;	.endef
list_append:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1023:     if (list == NULL) {
	testq	%rcx, %rcx	 ; list
	je	.L344	 ;,
	movq	%rcx, %rbx	 ; tmp90, list
	movq	%rdx, %rsi	 ; tmp91, item
 ; ./asm_test/win/i/all.c:1017:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:1018:     new_node->next = NULL;
	movq	$0, (%rax)	 ;, new_node_16->next
 ; ./asm_test/win/i/all.c:1019:     new_node->content = content;
	movq	%rsi, 8(%rax)	 ; item, new_node_16->content
 ; ./asm_test/win/i/all.c:1028:     if (list->head == NULL) {
	cmpq	$0, (%rbx)	 ;, list_5(D)->head
	je	.L345	 ;,
 ; ./asm_test/win/i/all.c:1032:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	 ; list_5(D)->tail, _3
 ; ./asm_test/win/i/all.c:1032:         list->tail->next = new_node;
	movq	%rax, (%rdx)	 ; new_node, _3->next
 ; ./asm_test/win/i/all.c:1033:         list->tail = new_node;
	movq	%rax, 8(%rbx)	 ; new_node, list_5(D)->tail
.L339:
 ; ./asm_test/win/i/all.c:1035: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
.L344:
 ; ./asm_test/win/i/all.c:1024:         fprintf(stderr, "Error: list_append received NULL list\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp92
 ; ./asm_test/win/i/all.c:1024:         fprintf(stderr, "Error: list_append received NULL list\n");
	movl	$38, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC93(%rip), %rcx	 ;, tmp89
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1025:         return;
	jmp	.L339	 ;
.L345:
 ; ./asm_test/win/i/all.c:1029:         list->head = new_node;
	movq	%rax, (%rbx)	 ; new_node, list_5(D)->head
 ; ./asm_test/win/i/all.c:1030:         list->tail = new_node;
	movq	%rax, 8(%rbx)	 ; new_node, list_5(D)->tail
	jmp	.L339	 ;
	.section .rdata,"dr"
	.align 8
.LC94:
	.ascii "[Warning] Creating symbol with unknown SymbolType: %u\12\0"
	.align 8
.LC95:
	.ascii "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\12\0"
	.align 8
.LC96:
	.ascii "[Warning] Creating symbol with unknown SymbolType for ast_node assignment: %u\12\0"
	.align 8
.LC97:
	.ascii "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\12\0"
	.text
	.def	create_symbol;	.scl	3;	.type	32;	.endef
create_symbol:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp123, name
	movl	%edx, %ebx	 ; tmp124, kind
	movq	%r8, %r12	 ; tmp125, type
	movq	%r9, %rbp	 ; tmp126, ast_node
 ; ./asm_test/win/i/all.c:1073:     switch (kind) {
	cmpl	$2, %edx	 ;, kind
	je	.L347	 ;,
	ja	.L348	 ;,
	testl	%edx, %edx	 ; kind
	je	.L367	 ;,
 ; ./asm_test/win/i/all.c:1075:         case SYMBOL_FUNCTION: scope = ((Function*)ast_node)->function_scope->parent; break;
	movq	32(%r9), %rax	 ; MEM[(struct Function *)ast_node_22(D)].function_scope, MEM[(struct Function *)ast_node_22(D)].function_scope
	movq	(%rax), %r13	 ; _2->parent, scope
 ; ./asm_test/win/i/all.c:1075:         case SYMBOL_FUNCTION: scope = ((Function*)ast_node)->function_scope->parent; break;
	jmp	.L352	 ;
.L348:
 ; ./asm_test/win/i/all.c:1073:     switch (kind) {
	leal	-3(%rdx), %eax	 ;, tmp106
	movq	%r9, %r13	 ; ast_node, scope
	cmpl	$3, %eax	 ;, tmp106
	jbe	.L352	 ;,
 ; ./asm_test/win/i/all.c:1082:             fprintf(stderr, "[Warning] Creating symbol with unknown SymbolType: %u\n", kind);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp127, _4
 ; ./asm_test/win/i/all.c:1082:             fprintf(stderr, "[Warning] Creating symbol with unknown SymbolType: %u\n", kind);
	movl	%ebx, %r8d	 ; kind,
	leaq	.LC94(%rip), %rdx	 ;, tmp111
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1072:     SymbolTable* scope = NULL;
	movl	$0, %r13d	 ;, scope
 ; ./asm_test/win/i/all.c:1083:             break;
	jmp	.L352	 ;
.L367:
 ; ./asm_test/win/i/all.c:1074:         case SYMBOL_CLASS: scope = ((Class*)ast_node)->class_scope->parent; break;
	movq	16(%r9), %rax	 ; MEM[(struct Class *)ast_node_22(D)].class_scope, MEM[(struct Class *)ast_node_22(D)].class_scope
	movq	(%rax), %r13	 ; _1->parent, scope
.L352:
 ; ./asm_test/win/i/all.c:1085:     Symbol* result = search_name(scope, name);
	movq	%rdi, %rdx	 ; name,
	movq	%r13, %rcx	 ; scope,
	call	search_name	 ;
 ; ./asm_test/win/i/all.c:1086:     if (result != NULL)
	testq	%rax, %rax	 ; result
	je	.L353	 ;,
 ; ./asm_test/win/i/all.c:1087:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	movq	id_counter.0(%rip), %rdx	 ; id_counter, tmp134
	leaq	1(%rdx), %rsi	 ;, _6
	movq	16(%rax), %r14	 ; result_30->id, _7
 ; ./asm_test/win/i/all.c:1087:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	movl	32(%rax), %r15d	 ; result_30->kind, _8
 ; ./asm_test/win/i/all.c:1087:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp129, _9
 ; ./asm_test/win/i/all.c:1087:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	movq	%rsi, 40(%rsp)	 ; _6,
	movq	%r14, 32(%rsp)	 ; _7,
	movl	%r15d, %r9d	 ; _8,
	movq	%rdi, %r8	 ; name,
	leaq	.LC95(%rip), %rdx	 ;, tmp114
	call	fprintf	 ;
.L353:
 ; ./asm_test/win/i/all.c:1088:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp130, <retval>
 ; ./asm_test/win/i/all.c:1089:     new_name->name = name;
	movq	%rdi, 8(%rax)	 ; name, new_name_34->name
 ; ./asm_test/win/i/all.c:1090:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	 ; id_counter, tmp135
	addq	$1, %rax	 ;, _11
 ; ./asm_test/win/i/all.c:1090:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	 ; _11, id_counter
	movq	%rax, 16(%rsi)	 ; _11, new_name_34->id
 ; ./asm_test/win/i/all.c:1091:     new_name->kind = kind;
	movl	%ebx, 32(%rsi)	 ; kind, new_name_34->kind
 ; ./asm_test/win/i/all.c:1092:     new_name->type = type;
	movq	%r12, (%rsi)	 ; type, new_name_34->type
 ; ./asm_test/win/i/all.c:1093:     switch (kind) {
	cmpl	$2, %ebx	 ;, kind
	je	.L354	 ;,
	ja	.L355	 ;,
	testl	%ebx, %ebx	 ; kind
	je	.L368	 ;,
 ; ./asm_test/win/i/all.c:1095:         case SYMBOL_FUNCTION: new_name->ast_node.function = (Function*)ast_node; break;
	movq	%rbp, 24(%rsi)	 ; ast_node, new_name_34->ast_node.function
 ; ./asm_test/win/i/all.c:1095:         case SYMBOL_FUNCTION: new_name->ast_node.function = (Function*)ast_node; break;
	jmp	.L360	 ;
.L347:
 ; ./asm_test/win/i/all.c:1076:         case SYMBOL_METHOD: scope = ((Method*)ast_node)->method_scope->parent; break;
	movq	32(%r9), %rax	 ; MEM[(struct Method *)ast_node_22(D)].method_scope, MEM[(struct Method *)ast_node_22(D)].method_scope
	movq	(%rax), %r13	 ; _3->parent, scope
 ; ./asm_test/win/i/all.c:1076:         case SYMBOL_METHOD: scope = ((Method*)ast_node)->method_scope->parent; break;
	jmp	.L352	 ;
.L355:
 ; ./asm_test/win/i/all.c:1093:     switch (kind) {
	leal	-3(%rbx), %eax	 ;, tmp116
	cmpl	$3, %eax	 ;, tmp116
	ja	.L369	 ;,
 ; ./asm_test/win/i/all.c:1100:         case SYMBOL_TYPE: new_name->ast_node.scope = (SymbolTable*)ast_node; break;
	movq	%rbp, 24(%rsi)	 ; ast_node, new_name_34->ast_node.scope
 ; ./asm_test/win/i/all.c:1100:         case SYMBOL_TYPE: new_name->ast_node.scope = (SymbolTable*)ast_node; break;
	jmp	.L360	 ;
.L368:
 ; ./asm_test/win/i/all.c:1094:         case SYMBOL_CLASS: new_name->ast_node.class = (Class*)ast_node; break;
	movq	%rbp, 24(%rsi)	 ; ast_node, new_name_34->ast_node.class
.L360:
 ; ./asm_test/win/i/all.c:1105:     if (scope == NULL)
	testq	%r13, %r13	 ; scope
	je	.L370	 ;,
 ; ./asm_test/win/i/all.c:1108:         list_append(scope->symbols, (size_t*)new_name);
	movq	8(%r13), %rcx	 ; scope_16->symbols, scope_16->symbols
	movq	%rsi, %rdx	 ; <retval>,
	call	list_append	 ;
.L346:
 ; ./asm_test/win/i/all.c:1110: }
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
.L354:
 ; ./asm_test/win/i/all.c:1096:         case SYMBOL_METHOD: new_name->ast_node.method = (Method*)ast_node; break;
	movq	%rbp, 24(%rsi)	 ; ast_node, new_name_34->ast_node.method
 ; ./asm_test/win/i/all.c:1096:         case SYMBOL_METHOD: new_name->ast_node.method = (Method*)ast_node; break;
	jmp	.L360	 ;
.L369:
 ; ./asm_test/win/i/all.c:1102:             fprintf(stderr, "[Warning] Creating symbol with unknown SymbolType for ast_node assignment: %u\n", kind);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp131, _12
 ; ./asm_test/win/i/all.c:1102:             fprintf(stderr, "[Warning] Creating symbol with unknown SymbolType for ast_node assignment: %u\n", kind);
	movl	%ebx, %r8d	 ; kind,
	leaq	.LC96(%rip), %rdx	 ;, tmp118
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1103:             break;
	jmp	.L360	 ;
.L370:
 ; ./asm_test/win/i/all.c:1106:         fprintf(stderr, "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n", name, kind, new_name->id);
	movq	16(%rsi), %rbp	 ; new_name_34->id, _13
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp132, _14
 ; ./asm_test/win/i/all.c:1106:         fprintf(stderr, "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n", name, kind, new_name->id);
	movq	%rbp, 32(%rsp)	 ; _13,
	movl	%ebx, %r9d	 ; kind,
	movq	%rdi, %r8	 ; name,
	leaq	.LC97(%rip), %rdx	 ;, tmp120
	call	fprintf	 ;
	jmp	.L346	 ;
	.def	create_subroutine;	.scl	3;	.type	32;	.endef
create_subroutine:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp89, name
	movq	%rdx, %rsi	 ; tmp90, return_type
 ; ./asm_test/win/i/all.c:3213:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp91, <retval>
 ; ./asm_test/win/i/all.c:3214:     subroutine->name = name;
	movq	%rdi, (%rax)	 ; name, subroutine_6->name
 ; ./asm_test/win/i/all.c:3215:     subroutine->return_type = return_type;
	movq	%rsi, 8(%rax)	 ; return_type, subroutine_6->return_type
 ; ./asm_test/win/i/all.c:3216:     subroutine->parameters = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:3216:     subroutine->parameters = create_list();
	movq	%rax, 16(%rbx)	 ; tmp92, subroutine_6->parameters
 ; ./asm_test/win/i/all.c:3217:     subroutine->local_vars = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:3217:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rbx)	 ; tmp93, subroutine_6->local_vars
 ; ./asm_test/win/i/all.c:3218:     subroutine->blocks = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:3218:     subroutine->blocks = create_list();
	movq	%rax, 32(%rbx)	 ; tmp94, subroutine_6->blocks
 ; ./asm_test/win/i/all.c:3220: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.def	create_block;	.scl	3;	.type	32;	.endef
create_block:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp86, label
 ; ./asm_test/win/i/all.c:3222:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp87, <retval>
 ; ./asm_test/win/i/all.c:3223:     block->label = label;
	movq	%rsi, (%rax)	 ; label, block_4->label
 ; ./asm_test/win/i/all.c:3224:     block->instructions = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:3224:     block->instructions = create_list();
	movq	%rax, 8(%rbx)	 ; tmp88, block_4->instructions
 ; ./asm_test/win/i/all.c:3226: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC98:
	.ascii "[Warning] Unsupported argument type for create_arg: %d\12\0"
	.text
	.def	create_arg;	.scl	3;	.type	32;	.endef
create_arg:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movl	%ecx, %esi	 ; tmp110, kind
	movq	%rdx, %rdi	 ; tmp111, value
 ; ./asm_test/win/i/all.c:3332:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp112, <retval>
 ; ./asm_test/win/i/all.c:3333:     arg->kind = kind;
	movl	%esi, 16(%rax)	 ; kind, arg_15->kind
 ; ./asm_test/win/i/all.c:3334:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_15->type
 ; ./asm_test/win/i/all.c:3335:     switch (kind) {
	cmpl	$8, %esi	 ;, kind
	ja	.L376	 ;,
	movl	%esi, %esi	 ; kind, kind
	leaq	.L378(%rip), %rdx	 ;, tmp97
	movslq	(%rdx,%rsi,4), %rax	 ;, tmp99
	addq	%rdx, %rax	 ; tmp97, tmp100
	jmp	*%rax	 ; tmp100
	.section .rdata,"dr"
	.align 4
.L378:
	.long	.L385-.L378
	.long	.L384-.L378
	.long	.L383-.L378
	.long	.L382-.L378
	.long	.L381-.L378
	.long	.L380-.L378
	.long	.L379-.L378
	.long	.L377-.L378
	.long	.L377-.L378
	.text
.L385:
 ; ./asm_test/win/i/all.c:3337:             arg->value.variable = (Var*)value;
	movq	%rdi, (%rbx)	 ; value, arg_15->value.variable
 ; ./asm_test/win/i/all.c:3338:             arg->type = arg->value.variable->type;
	movq	16(%rdi), %rax	 ; MEM[(struct Var *)value_19(D)].type, _1
 ; ./asm_test/win/i/all.c:3338:             arg->type = arg->value.variable->type;
	movq	%rax, 8(%rbx)	 ; _1, arg_15->type
.L386:
 ; ./asm_test/win/i/all.c:3373:     arg->is_get = 0;
	movb	$0, 20(%rbx)	 ;, arg_15->is_get
 ; ./asm_test/win/i/all.c:3375: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
.L384:
 ; ./asm_test/win/i/all.c:3341:             arg->value.int_value = *(long long*)value;
	movq	(%rdi), %rax	 ; MEM[(long long int *)value_19(D)], _2
 ; ./asm_test/win/i/all.c:3341:             arg->value.int_value = *(long long*)value;
	movq	%rax, (%rbx)	 ; _2, arg_15->value.int_value
 ; ./asm_test/win/i/all.c:3342:             arg->type = name_int;
	movq	name_int(%rip), %rax	 ; name_int, name_int
	movq	%rax, 8(%rbx)	 ; name_int, arg_15->type
 ; ./asm_test/win/i/all.c:3343:             break;
	jmp	.L386	 ;
.L383:
 ; ./asm_test/win/i/all.c:3345:             arg->value.float_value = *(double*)value;
	movsd	(%rdi), %xmm0	 ; MEM[(double *)value_19(D)], _4
 ; ./asm_test/win/i/all.c:3345:             arg->value.float_value = *(double*)value;
	movsd	%xmm0, (%rbx)	 ; _4, arg_15->value.float_value
 ; ./asm_test/win/i/all.c:3346:             arg->type = name_float;
	movq	name_float(%rip), %rax	 ; name_float, name_float
	movq	%rax, 8(%rbx)	 ; name_float, arg_15->type
 ; ./asm_test/win/i/all.c:3347:             break;
	jmp	.L386	 ;
.L382:
 ; ./asm_test/win/i/all.c:3349:             arg->value.string_value = (char*)value;
	movq	%rdi, (%rbx)	 ; value, arg_15->value.string_value
 ; ./asm_test/win/i/all.c:3350:             arg->type = name_string;
	movq	name_string(%rip), %rax	 ; name_string, name_string
	movq	%rax, 8(%rbx)	 ; name_string, arg_15->type
 ; ./asm_test/win/i/all.c:3351:             break;
	jmp	.L386	 ;
.L381:
 ; ./asm_test/win/i/all.c:3353:             arg->value.bool_value = *(char*)value;
	movzbl	(%rdi), %eax	 ; MEM[(char *)value_19(D)], _7
 ; ./asm_test/win/i/all.c:3353:             arg->value.bool_value = *(char*)value;
	movb	%al, (%rbx)	 ; _7, arg_15->value.bool_value
 ; ./asm_test/win/i/all.c:3354:             arg->type = name_bool;
	movq	name_bool(%rip), %rax	 ; name_bool, name_bool
	movq	%rax, 8(%rbx)	 ; name_bool, arg_15->type
 ; ./asm_test/win/i/all.c:3355:             break;
	jmp	.L386	 ;
.L380:
 ; ./asm_test/win/i/all.c:3357:             arg->value.string_value = NULL;
	movq	$0, (%rbx)	 ;, arg_15->value.string_value
 ; ./asm_test/win/i/all.c:3358:             arg->type = name_void;
	movq	name_void(%rip), %rax	 ; name_void, name_void
	movq	%rax, 8(%rbx)	 ; name_void, arg_15->type
 ; ./asm_test/win/i/all.c:3359:             break;
	jmp	.L386	 ;
.L379:
 ; ./asm_test/win/i/all.c:3361:             arg->value.label = (Var*)value;
	movq	%rdi, (%rbx)	 ; value, arg_15->value.label
 ; ./asm_test/win/i/all.c:3362:             break;
	jmp	.L386	 ;
.L377:
 ; ./asm_test/win/i/all.c:3365:             arg->value.subroutine = (Var*)value;
	movq	%rdi, (%rbx)	 ; value, arg_15->value.subroutine
 ; ./asm_test/win/i/all.c:3366:             arg->type = arg->value.subroutine->type;
	movq	16(%rdi), %rax	 ; MEM[(struct Var *)value_19(D)].type, _10
 ; ./asm_test/win/i/all.c:3366:             arg->type = arg->value.subroutine->type;
	movq	%rax, 8(%rbx)	 ; _10, arg_15->type
 ; ./asm_test/win/i/all.c:3367:             break;
	jmp	.L386	 ;
.L376:
 ; ./asm_test/win/i/all.c:3370:             fprintf(stderr, "[Warning] Unsupported argument type for create_arg: %d\n", kind);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp113, _11
 ; ./asm_test/win/i/all.c:3370:             fprintf(stderr, "[Warning] Unsupported argument type for create_arg: %d\n", kind);
	movl	%esi, %r8d	 ; kind,
	leaq	.LC98(%rip), %rdx	 ;, tmp108
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3371:             break;
	jmp	.L386	 ;
	.def	create_instruction;	.scl	3;	.type	32;	.endef
create_instruction:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movl	%ecx, %ebp	 ; tmp88, type
	movq	%rdx, %rdi	 ; tmp89, arg1
	movq	%r8, %rsi	 ; tmp90, arg2
	movq	%r9, %rbx	 ; tmp91, arg3
 ; ./asm_test/win/i/all.c:3324:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:3325:     inst->type = type;
	movl	%ebp, 24(%rax)	 ; type, inst_3->type
 ; ./asm_test/win/i/all.c:3326:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; arg1, inst_3->arg1
 ; ./asm_test/win/i/all.c:3327:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; arg2, inst_3->arg2
 ; ./asm_test/win/i/all.c:3328:     inst->arg3 = arg3;
	movq	%rbx, 16(%rax)	 ; arg3, inst_3->arg3
 ; ./asm_test/win/i/all.c:3330: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC99:
	.ascii "\0"
.LC100:
	.ascii "%s/%s\0"
	.text
	.def	absolute_path;	.scl	3;	.type	32;	.endef
absolute_path:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp159, path
	movq	%rdx, %rdi	 ; tmp160, base_path
 ; ./asm_test/win/i/all.c:3867:     path = create_string_check(path, strlen(path), 0);
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp161, tmp128
 ; ./asm_test/win/i/all.c:3867:     path = create_string_check(path, strlen(path), 0);
	movl	$0, %r8d	 ;,
	movq	%rbx, %rcx	 ; path,
	call	create_string_check	 ;
	movq	%rax, %rbx	 ; tmp162, <retval>
 ; ./asm_test/win/i/all.c:3868:     size_t path_len = strlen(path);
	movq	%rax, %rcx	 ; <retval>,
	call	strlen	 ;
	movq	%rax, %rsi	 ; tmp131, path_len
 ; ./asm_test/win/i/all.c:3869:     for (size_t i = 0; i < path_len; i++) {
	testq	%rax, %rax	 ; tmp131
	je	.L391	 ;,
 ; ./asm_test/win/i/all.c:3869:     for (size_t i = 0; i < path_len; i++) {
	movl	$0, %edx	 ;, i
	jmp	.L398	 ;
.L414:
 ; ./asm_test/win/i/all.c:3870:         if (path[i] == '\\') path[i] = '/';
	movb	$47, (%rcx)	 ;, *_2
 ; ./asm_test/win/i/all.c:3871:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rdx	 ;, i
	jbe	.L411	 ;,
.L393:
 ; ./asm_test/win/i/all.c:3871:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-1(%rbx,%rdx), %rcx	 ;, _6
 ; ./asm_test/win/i/all.c:3871:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$46, (%rcx)	 ;, *_6
	je	.L412	 ;,
.L397:
 ; ./asm_test/win/i/all.c:3876:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	(%rbx,%rdx), %rcx	 ;, _14
 ; ./asm_test/win/i/all.c:3876:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, (%rcx)	 ;, *_14
	jne	.L396	 ;,
.L406:
 ; ./asm_test/win/i/all.c:3876:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	-1(%rdx), %rbp	 ;, _16
 ; ./asm_test/win/i/all.c:3876:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, -1(%rbx,%rdx)	 ;, *_17
	jne	.L396	 ;,
 ; ./asm_test/win/i/all.c:3877:             memmove(path + i, path + i + 1, path_len - i);
	leaq	1(%rbx,%rdx), %rax	 ;, tmp145
 ; ./asm_test/win/i/all.c:3877:             memmove(path + i, path + i + 1, path_len - i);
	movq	%rsi, %r8	 ; path_len, tmp171
	subq	%rdx, %r8	 ; i, tmp171
	movq	%rax, %rdx	 ; tmp145,
	call	memmove	 ;
 ; ./asm_test/win/i/all.c:3878:             path_len--;
	subq	$1, %rsi	 ;, path_len
 ; ./asm_test/win/i/all.c:3879:             i--;
	movq	%rbp, %rdx	 ; _16, i
	jmp	.L396	 ;
.L412:
 ; ./asm_test/win/i/all.c:3871:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-2(%rdx), %rbp	 ;, _8
 ; ./asm_test/win/i/all.c:3871:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, -2(%rbx,%rdx)	 ;, *_9
	jne	.L397	 ;,
 ; ./asm_test/win/i/all.c:3872:             memmove(path + i - 1, path + i + 1, path_len - i);
	leaq	1(%rbx,%rdx), %rax	 ;, tmp139
 ; ./asm_test/win/i/all.c:3872:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	%rsi, %r8	 ; path_len, tmp170
	subq	%rdx, %r8	 ; i, tmp170
	movq	%rax, %rdx	 ; tmp139,
	call	memmove	 ;
 ; ./asm_test/win/i/all.c:3873:             path_len -= 2;
	subq	$2, %rsi	 ;, path_len
 ; ./asm_test/win/i/all.c:3874:             i -= 2;
	movq	%rbp, %rdx	 ; _8, i
.L395:
 ; ./asm_test/win/i/all.c:3876:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	testq	%rdx, %rdx	 ; i
	jne	.L397	 ;,
.L396:
 ; ./asm_test/win/i/all.c:3869:     for (size_t i = 0; i < path_len; i++) {
	addq	$1, %rdx	 ;, i
 ; ./asm_test/win/i/all.c:3869:     for (size_t i = 0; i < path_len; i++) {
	cmpq	%rsi, %rdx	 ; path_len, i
	jnb	.L413	 ;,
.L398:
 ; ./asm_test/win/i/all.c:3870:         if (path[i] == '\\') path[i] = '/';
	leaq	(%rbx,%rdx), %rcx	 ;, _2
	movzbl	(%rcx), %eax	 ; *_2, _3
 ; ./asm_test/win/i/all.c:3870:         if (path[i] == '\\') path[i] = '/';
	cmpb	$92, %al	 ;, _3
	je	.L414	 ;,
 ; ./asm_test/win/i/all.c:3871:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rdx	 ;, i
	jbe	.L395	 ;,
 ; ./asm_test/win/i/all.c:3871:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, %al	 ;, _3
	jne	.L396	 ;,
	jmp	.L393	 ;
.L413:
 ; ./asm_test/win/i/all.c:3882:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpq	$2, %rsi	 ;, path_len
	jbe	.L399	 ;,
 ; ./asm_test/win/i/all.c:3882:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpb	$47, (%rbx)	 ;, *path_53
	je	.L415	 ;,
 ; ./asm_test/win/i/all.c:3887:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	movzbl	(%rbx), %eax	 ; *path_53, tmp173
	subl	$65, %eax	 ;, tmp157
 ; ./asm_test/win/i/all.c:3887:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpb	$25, %al	 ;, tmp157
	ja	.L391	 ;,
.L405:
 ; ./asm_test/win/i/all.c:3887:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpb	$58, 1(%rbx)	 ;, MEM[(char *)path_53 + 1B]
	jne	.L391	 ;,
	jmp	.L390	 ;
.L415:
 ; ./asm_test/win/i/all.c:3882:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	movzbl	1(%rbx), %eax	 ; MEM[(char *)path_53 + 1B], _24
	leal	-97(%rax), %edx	 ;, tmp146
 ; ./asm_test/win/i/all.c:3882:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpb	$25, %dl	 ;, tmp146
	ja	.L401	 ;,
 ; ./asm_test/win/i/all.c:3882:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpb	$47, 2(%rbx)	 ;, MEM[(char *)path_53 + 2B]
	je	.L416	 ;,
.L401:
 ; ./asm_test/win/i/all.c:3889:     if (path_len > 0 && path[0] == '/')
	cmpb	$47, (%rbx)	 ;, *path_53
	je	.L390	 ;,
	jmp	.L391	 ;
.L416:
 ; ./asm_test/win/i/all.c:3883:         path[0] = (path[1] >= 'a' && path[1] <= 'z') ? (path[1] - ('a' - 'A')) : path[1];
	subl	$32, %eax	 ;, tmp147
	movb	%al, (%rbx)	 ; tmp147, *path_53
 ; ./asm_test/win/i/all.c:3884:         path[1] = ':';
	movb	$58, 1(%rbx)	 ;, MEM[(char *)path_53 + 1B]
 ; ./asm_test/win/i/all.c:3885:         return path;
	jmp	.L390	 ;
.L399:
 ; ./asm_test/win/i/all.c:3887:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	je	.L417	 ;,
 ; ./asm_test/win/i/all.c:3889:     if (path_len > 0 && path[0] == '/')
	testq	%rsi, %rsi	 ; path_len
	jne	.L401	 ;,
.L391:
 ; ./asm_test/win/i/all.c:3891:     if (base_path == NULL)
	testq	%rdi, %rdi	 ; base_path
	je	.L418	 ;,
.L404:
 ; ./asm_test/win/i/all.c:3895:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	movq	%rdi, %rcx	 ; base_path,
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:3895:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	leaq	2(%rsi,%rax), %rbp	 ;, total_len
 ; ./asm_test/win/i/all.c:3896:     char* abs_path = create_string_check("", total_len, 0);
	movl	$0, %r8d	 ;,
	movq	%rbp, %rdx	 ; total_len,
	leaq	.LC99(%rip), %rcx	 ;, tmp154
	call	create_string_check	 ;
	movq	%rax, %rsi	 ; tmp166, abs_path
 ; ./asm_test/win/i/all.c:3897:     sprintf(abs_path, "%s/%s", base_path, path);
	movq	%rbx, %r9	 ; <retval>,
	movq	%rdi, %r8	 ; base_path,
	leaq	.LC100(%rip), %rdx	 ;, tmp155
	movq	%rax, %rcx	 ; abs_path,
	call	sprintf	 ;
 ; ./asm_test/win/i/all.c:3898:     return absolute_path(create_string_check(abs_path, total_len, 1), NULL);
	movl	$1, %r8d	 ;,
	movq	%rbp, %rdx	 ; total_len,
	movq	%rsi, %rcx	 ; abs_path,
	call	create_string_check	 ;
	movq	%rax, %rcx	 ; tmp167, _37
 ; ./asm_test/win/i/all.c:3898:     return absolute_path(create_string_check(abs_path, total_len, 1), NULL);
	movl	$0, %edx	 ;,
	call	absolute_path	 ;
	movq	%rax, %rbx	 ; tmp168, <retval>
.L390:
 ; ./asm_test/win/i/all.c:3899: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L417:
 ; ./asm_test/win/i/all.c:3887:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	movzbl	(%rbx), %eax	 ; *path_53, tmp172
	subl	$65, %eax	 ;, tmp148
 ; ./asm_test/win/i/all.c:3887:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpb	$25, %al	 ;, tmp148
	jbe	.L405	 ;,
	jmp	.L401	 ;
.L418:
 ; ./asm_test/win/i/all.c:3892:         base_path = getcwd(NULL, 0);
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	getcwd	 ;
	movq	%rax, %rdi	 ; tmp164, base_path
 ; ./asm_test/win/i/all.c:3893:     if (base_path == NULL)
	testq	%rax, %rax	 ; base_path
	jne	.L404	 ;,
	jmp	.L390	 ;
.L411:
 ; ./asm_test/win/i/all.c:3876:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	testq	%rdx, %rdx	 ; i
	je	.L396	 ;,
 ; ./asm_test/win/i/all.c:3876:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	(%rbx,%rdx), %rcx	 ;, _14
	jmp	.L406	 ;
	.section .rdata,"dr"
.LC101:
	.ascii "%zu/%zu bytes\0"
	.align 8
.LC102:
	.ascii "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu\0"
	.text
	.def	get_info;	.scl	3;	.type	32;	.endef
get_info:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$64, %rsp	 ;,
 ; ./asm_test/win/i/all.c:657:     StringList* current = all_string_list;
	movq	all_string_list(%rip), %rax	 ; all_string_list, current
 ; ./asm_test/win/i/all.c:658:     while (current != NULL) {
	testq	%rax, %rax	 ; current
	je	.L422	 ;,
 ; ./asm_test/win/i/all.c:656:     size_t stringCount = 0;
	movl	$0, %ebx	 ;, stringCount
.L421:
 ; ./asm_test/win/i/all.c:659:         stringCount++;
	addq	$1, %rbx	 ;, stringCount
 ; ./asm_test/win/i/all.c:660:         current = current->next;
	movq	16(%rax), %rax	 ; current_31->next, current
 ; ./asm_test/win/i/all.c:658:     while (current != NULL) {
	testq	%rax, %rax	 ; current
	jne	.L421	 ;,
.L420:
 ; ./asm_test/win/i/all.c:662:     char* struct_memory_used_str = create_string_check("", 48, 0);
	movl	$0, %r8d	 ;,
	movl	$48, %edx	 ;,
	leaq	.LC99(%rip), %rsi	 ;, tmp98
	movq	%rsi, %rcx	 ; tmp98,
	call	create_string_check	 ;
	movq	%rax, %rdi	 ; tmp116, struct_memory_used_str
 ; ./asm_test/win/i/all.c:663:     sprintf(struct_memory_used_str, "%zu/%zu bytes", struct_memory_used + struct_memory->used, struct_memory_count);
	movq	struct_memory_count(%rip), %r9	 ; struct_memory_count,
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory
	movq	struct_memory_used(%rip), %r8	 ; struct_memory_used, struct_memory_used
	addq	8(%rax), %r8	 ; struct_memory.46_2->used,
	leaq	.LC101(%rip), %r12	 ;, tmp104
	movq	%r12, %rdx	 ; tmp104,
	movq	%rdi, %rcx	 ; struct_memory_used_str,
	call	sprintf	 ;
 ; ./asm_test/win/i/all.c:664:     char* string_memory_used_str = create_string_check("", 48, 0);
	movl	$0, %r8d	 ;,
	movl	$48, %edx	 ;,
	movq	%rsi, %rcx	 ; tmp98,
	call	create_string_check	 ;
	movq	%rax, %rbp	 ; tmp117, string_memory_used_str
 ; ./asm_test/win/i/all.c:665:     sprintf(string_memory_used_str, "%zu/%zu bytes", string_memory_used + string_memory->used, string_memory_count);
	movq	string_memory_count(%rip), %r9	 ; string_memory_count,
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory
	movq	string_memory_used(%rip), %r8	 ; string_memory_used, string_memory_used
	addq	8(%rax), %r8	 ; string_memory.49_7->used,
	movq	%r12, %rdx	 ; tmp104,
	movq	%rbp, %rcx	 ; string_memory_used_str,
	call	sprintf	 ;
 ; ./asm_test/win/i/all.c:666:     char* info = (char*)create_string_check("", 240, 0);
	movl	$0, %r8d	 ;,
	movl	$240, %edx	 ;,
	movq	%rsi, %rcx	 ; tmp98,
	call	create_string_check	 ;
	movq	%rax, %rsi	 ; tmp118, <retval>
 ; ./asm_test/win/i/all.c:667:     sprintf(info, "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu", 2, struct_memory_used_str, string_memory_used_str, stringCount, memoryBlockCount);
	movq	memoryBlockCount(%rip), %rax	 ; memoryBlockCount, memoryBlockCount
	movq	%rax, 48(%rsp)	 ; memoryBlockCount,
	movq	%rbx, 40(%rsp)	 ; stringCount,
	movq	%rbp, 32(%rsp)	 ; string_memory_used_str,
	movq	%rdi, %r9	 ; struct_memory_used_str,
	movl	$2, %r8d	 ;,
	leaq	.LC102(%rip), %rdx	 ;, tmp114
	movq	%rsi, %rcx	 ; <retval>,
	call	sprintf	 ;
 ; ./asm_test/win/i/all.c:669: }
	movq	%rsi, %rax	 ; <retval>,
	addq	$64, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L422:
 ; ./asm_test/win/i/all.c:656:     size_t stringCount = 0;
	movl	$0, %ebx	 ;, stringCount
	jmp	.L420	 ;
	.section .rdata,"dr"
.LC103:
	.ascii "%s.%s\0"
	.text
	.def	make_method_name;	.scl	3;	.type	32;	.endef
make_method_name:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp100, class_name
	movq	%rdx, %rdi	 ; tmp101, method_name
 ; ./asm_test/win/i/all.c:1193:     char* name = create_string_check("", strlen(class_name) + strlen(method_name) + 2, 1);
	call	strlen	 ;
	movq	%rax, %rbx	 ; tmp102, tmp90
 ; ./asm_test/win/i/all.c:1193:     char* name = create_string_check("", strlen(class_name) + strlen(method_name) + 2, 1);
	movq	%rdi, %rcx	 ; method_name,
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:1193:     char* name = create_string_check("", strlen(class_name) + strlen(method_name) + 2, 1);
	leaq	2(%rbx,%rax), %rdx	 ;, tmp96
	movl	$1, %r8d	 ;,
	leaq	.LC99(%rip), %rcx	 ;, tmp97
	call	create_string_check	 ;
	movq	%rax, %rbx	 ; tmp104, <retval>
 ; ./asm_test/win/i/all.c:1194:     sprintf(name, "%s.%s", class_name, method_name);
	movq	%rdi, %r9	 ; method_name,
	movq	%rsi, %r8	 ; class_name,
	leaq	.LC103(%rip), %rdx	 ;, tmp98
	movq	%rax, %rcx	 ; <retval>,
	call	sprintf	 ;
 ; ./asm_test/win/i/all.c:1196: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.section .rdata,"dr"
.LC104:
	.ascii "$%d-error\0"
.LC105:
	.ascii "$%c%zu\0"
	.text
	.def	create_var;	.scl	3;	.type	32;	.endef
create_var:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp161, original_name
	movq	%rdx, %r12	 ; tmp162, type
	movl	%r8d, %ebp	 ; tmp163, kind
	movq	%r9, %rdi	 ; tmp164, status
 ; ./asm_test/win/i/all.c:3272:     if (original_name != NULL) {
	testq	%rcx, %rcx	 ; original_name
	je	.L428	 ;,
 ; ./asm_test/win/i/all.c:3273:         Class* current_class = NULL;
	movl	$0, %r14d	 ;, current_class
 ; ./asm_test/win/i/all.c:3274:         if (type->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rdx)	 ;, type_33(D)->kind
	jne	.L429	 ;,
 ; ./asm_test/win/i/all.c:3275:             current_class = status->current_class;
	movq	24(%r9), %r14	 ; status_34(D)->current_class, current_class
 ; ./asm_test/win/i/all.c:3276:             status->current_class = type->ast_node.class;
	movq	24(%rdx), %rax	 ; type_33(D)->ast_node.class, _2
 ; ./asm_test/win/i/all.c:3276:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%r9)	 ; _2, status_34(D)->current_class
.L429:
 ; ./asm_test/win/i/all.c:3228:     if (status->current_subroutine != NULL && status->current_subroutine->local_vars != NULL && status->current_subroutine->local_vars->head != NULL && status->current_subroutine->local_vars->tail != NULL) {
	movq	8(%rdi), %rax	 ; status_34(D)->current_subroutine, _56
 ; ./asm_test/win/i/all.c:3228:     if (status->current_subroutine != NULL && status->current_subroutine->local_vars != NULL && status->current_subroutine->local_vars->head != NULL && status->current_subroutine->local_vars->tail != NULL) {
	testq	%rax, %rax	 ; _56
	je	.L430	 ;,
 ; ./asm_test/win/i/all.c:3228:     if (status->current_subroutine != NULL && status->current_subroutine->local_vars != NULL && status->current_subroutine->local_vars->head != NULL && status->current_subroutine->local_vars->tail != NULL) {
	movq	24(%rax), %rcx	 ; _56->local_vars, _57
 ; ./asm_test/win/i/all.c:3228:     if (status->current_subroutine != NULL && status->current_subroutine->local_vars != NULL && status->current_subroutine->local_vars->head != NULL && status->current_subroutine->local_vars->tail != NULL) {
	testq	%rcx, %rcx	 ; _57
	je	.L431	 ;,
 ; ./asm_test/win/i/all.c:3228:     if (status->current_subroutine != NULL && status->current_subroutine->local_vars != NULL && status->current_subroutine->local_vars->head != NULL && status->current_subroutine->local_vars->tail != NULL) {
	cmpq	$0, (%rcx)	 ;, _57->head
	je	.L431	 ;,
 ; ./asm_test/win/i/all.c:3228:     if (status->current_subroutine != NULL && status->current_subroutine->local_vars != NULL && status->current_subroutine->local_vars->head != NULL && status->current_subroutine->local_vars->tail != NULL) {
	cmpq	$0, 8(%rcx)	 ;, _57->tail
	je	.L431	 ;,
 ; ./asm_test/win/i/all.c:3229:         List* vars = list_copy(status->current_subroutine->local_vars);
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp165, vars
.L432:
 ; ./asm_test/win/i/all.c:3231:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r13, %rcx	 ; vars,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp166, <retval>
 ; ./asm_test/win/i/all.c:3231:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L463	 ;,
 ; ./asm_test/win/i/all.c:3232:             if (var->original_name == original_name) {
	cmpq	(%rbx), %rsi	 ; var_61->original_name, original_name
	jne	.L432	 ;,
	jmp	.L433	 ;
.L463:
 ; ./asm_test/win/i/all.c:3237:     if (status->current_subroutine != NULL && status->current_subroutine->parameters != NULL && status->current_subroutine->parameters->head != NULL && status->current_subroutine->parameters->tail != NULL) {
	movq	8(%rdi), %rax	 ; status_34(D)->current_subroutine, _56
 ; ./asm_test/win/i/all.c:3237:     if (status->current_subroutine != NULL && status->current_subroutine->parameters != NULL && status->current_subroutine->parameters->head != NULL && status->current_subroutine->parameters->tail != NULL) {
	testq	%rax, %rax	 ; _56
	je	.L430	 ;,
.L431:
 ; ./asm_test/win/i/all.c:3237:     if (status->current_subroutine != NULL && status->current_subroutine->parameters != NULL && status->current_subroutine->parameters->head != NULL && status->current_subroutine->parameters->tail != NULL) {
	movq	16(%rax), %rcx	 ; _128->parameters, _64
 ; ./asm_test/win/i/all.c:3237:     if (status->current_subroutine != NULL && status->current_subroutine->parameters != NULL && status->current_subroutine->parameters->head != NULL && status->current_subroutine->parameters->tail != NULL) {
	testq	%rcx, %rcx	 ; _64
	je	.L430	 ;,
 ; ./asm_test/win/i/all.c:3237:     if (status->current_subroutine != NULL && status->current_subroutine->parameters != NULL && status->current_subroutine->parameters->head != NULL && status->current_subroutine->parameters->tail != NULL) {
	cmpq	$0, (%rcx)	 ;, _64->head
	je	.L430	 ;,
 ; ./asm_test/win/i/all.c:3237:     if (status->current_subroutine != NULL && status->current_subroutine->parameters != NULL && status->current_subroutine->parameters->head != NULL && status->current_subroutine->parameters->tail != NULL) {
	cmpq	$0, 8(%rcx)	 ;, _64->tail
	je	.L430	 ;,
 ; ./asm_test/win/i/all.c:3238:         List* vars = list_copy(status->current_subroutine->parameters);
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp167, vars
.L435:
 ; ./asm_test/win/i/all.c:3240:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r13, %rcx	 ; vars,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp168, <retval>
 ; ./asm_test/win/i/all.c:3240:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L430	 ;,
 ; ./asm_test/win/i/all.c:3241:             if (var->original_name == original_name) {
	cmpq	(%rbx), %rsi	 ; var_68->original_name, original_name
	jne	.L435	 ;,
	jmp	.L433	 ;
.L430:
 ; ./asm_test/win/i/all.c:3246:     if (status->current_class != NULL && status->tac->attribute_tables != NULL && status->tac->attribute_tables->head != NULL && status->tac->attribute_tables->tail != NULL) {
	cmpq	$0, 24(%rdi)	 ;, status_34(D)->current_class
	je	.L437	 ;,
 ; ./asm_test/win/i/all.c:3246:     if (status->current_class != NULL && status->tac->attribute_tables != NULL && status->tac->attribute_tables->head != NULL && status->tac->attribute_tables->tail != NULL) {
	movq	(%rdi), %rax	 ; status_34(D)->tac, status_34(D)->tac
	movq	(%rax), %rcx	 ; _71->attribute_tables, _72
 ; ./asm_test/win/i/all.c:3246:     if (status->current_class != NULL && status->tac->attribute_tables != NULL && status->tac->attribute_tables->head != NULL && status->tac->attribute_tables->tail != NULL) {
	testq	%rcx, %rcx	 ; _72
	je	.L437	 ;,
 ; ./asm_test/win/i/all.c:3246:     if (status->current_class != NULL && status->tac->attribute_tables != NULL && status->tac->attribute_tables->head != NULL && status->tac->attribute_tables->tail != NULL) {
	cmpq	$0, (%rcx)	 ;, _72->head
	je	.L437	 ;,
 ; ./asm_test/win/i/all.c:3246:     if (status->current_class != NULL && status->tac->attribute_tables != NULL && status->tac->attribute_tables->head != NULL && status->tac->attribute_tables->tail != NULL) {
	cmpq	$0, 8(%rcx)	 ;, _72->tail
	je	.L437	 ;,
 ; ./asm_test/win/i/all.c:3247:         List* tables = list_copy(status->tac->attribute_tables);
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp169, tables
.L438:
 ; ./asm_test/win/i/all.c:3249:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	movq	%r13, %rcx	 ; tables,
	call	list_pop	 ;
 ; ./asm_test/win/i/all.c:3249:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	testq	%rax, %rax	 ; table
	je	.L437	 ;,
 ; ./asm_test/win/i/all.c:3250:             if (table->name == status->current_class->name && table->attributes != NULL && table->attributes->head != NULL && table->attributes->tail != NULL) {
	movq	24(%rdi), %rdx	 ; status_34(D)->current_class, status_34(D)->current_class
 ; ./asm_test/win/i/all.c:3250:             if (table->name == status->current_class->name && table->attributes != NULL && table->attributes->head != NULL && table->attributes->tail != NULL) {
	movq	(%rdx), %rdx	 ; _78->name, tmp179
	cmpq	%rdx, 8(%rax)	 ; tmp179, table_76->name
	jne	.L438	 ;,
 ; ./asm_test/win/i/all.c:3250:             if (table->name == status->current_class->name && table->attributes != NULL && table->attributes->head != NULL && table->attributes->tail != NULL) {
	movq	(%rax), %rcx	 ; table_76->attributes, _80
 ; ./asm_test/win/i/all.c:3250:             if (table->name == status->current_class->name && table->attributes != NULL && table->attributes->head != NULL && table->attributes->tail != NULL) {
	testq	%rcx, %rcx	 ; _80
	je	.L438	 ;,
 ; ./asm_test/win/i/all.c:3250:             if (table->name == status->current_class->name && table->attributes != NULL && table->attributes->head != NULL && table->attributes->tail != NULL) {
	cmpq	$0, (%rcx)	 ;, _80->head
	je	.L438	 ;,
 ; ./asm_test/win/i/all.c:3250:             if (table->name == status->current_class->name && table->attributes != NULL && table->attributes->head != NULL && table->attributes->tail != NULL) {
	cmpq	$0, 8(%rcx)	 ;, _80->tail
	je	.L438	 ;,
 ; ./asm_test/win/i/all.c:3251:                 List* attributes = list_copy(table->attributes);
	call	list_copy	 ;
	movq	%rax, %r15	 ; tmp170, attributes
.L440:
 ; ./asm_test/win/i/all.c:3253:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	movq	%r15, %rcx	 ; attributes,
	call	list_pop	 ;
 ; ./asm_test/win/i/all.c:3253:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	testq	%rax, %rax	 ; attr
	je	.L438	 ;,
 ; ./asm_test/win/i/all.c:3254:                     if (attr->var->original_name == original_name) {
	movq	(%rax), %rbx	 ; attr_84->var, <retval>
 ; ./asm_test/win/i/all.c:3254:                     if (attr->var->original_name == original_name) {
	cmpq	(%rbx), %rsi	 ; _85->original_name, original_name
	jne	.L440	 ;,
	jmp	.L433	 ;
.L437:
 ; ./asm_test/win/i/all.c:3260:     if (status->tac->global_vars != NULL && status->tac->global_vars->head != NULL && status->tac->global_vars->tail != NULL) {
	movq	(%rdi), %rax	 ; status_34(D)->tac, status_34(D)->tac
	movq	16(%rax), %rcx	 ; _87->global_vars, _88
 ; ./asm_test/win/i/all.c:3260:     if (status->tac->global_vars != NULL && status->tac->global_vars->head != NULL && status->tac->global_vars->tail != NULL) {
	testq	%rcx, %rcx	 ; _88
	je	.L443	 ;,
 ; ./asm_test/win/i/all.c:3260:     if (status->tac->global_vars != NULL && status->tac->global_vars->head != NULL && status->tac->global_vars->tail != NULL) {
	cmpq	$0, (%rcx)	 ;, _88->head
	je	.L443	 ;,
 ; ./asm_test/win/i/all.c:3260:     if (status->tac->global_vars != NULL && status->tac->global_vars->head != NULL && status->tac->global_vars->tail != NULL) {
	cmpq	$0, 8(%rcx)	 ;, _88->tail
	je	.L443	 ;,
 ; ./asm_test/win/i/all.c:3261:         List* vars = list_copy(status->tac->global_vars);
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp173, vars
.L444:
 ; ./asm_test/win/i/all.c:3263:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r13, %rcx	 ; vars,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp174, <retval>
 ; ./asm_test/win/i/all.c:3263:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L443	 ;,
 ; ./asm_test/win/i/all.c:3264:             if (var->original_name == original_name) {
	cmpq	(%rbx), %rsi	 ; var_92->original_name, original_name
	jne	.L444	 ;,
.L433:
 ; ./asm_test/win/i/all.c:3279:         if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r12)	 ;, type_33(D)->kind
	je	.L459	 ;,
	jmp	.L427	 ;
.L461:
	movl	$0, %ebx	 ;, <retval>
.L459:
 ; ./asm_test/win/i/all.c:3280:             status->current_class = current_class;
	movq	%r14, 24(%rdi)	 ; current_class, status_34(D)->current_class
 ; ./asm_test/win/i/all.c:3281:         if (var != NULL) {
	testq	%rbx, %rbx	 ; <retval>
	jne	.L427	 ;,
	jmp	.L428	 ;
.L447:
 ; ./asm_test/win/i/all.c:3289:         case VAR_ATTR: id = status->attr_count++; break;
	movq	48(%rdi), %rsi	 ; status_34(D)->attr_count, id
 ; ./asm_test/win/i/all.c:3289:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp140
	movq	%rax, 48(%rdi)	 ; tmp140, status_34(D)->attr_count
.L448:
 ; ./asm_test/win/i/all.c:3297:     var->name = create_string_check("", 32, 1);
	movl	$1, %r8d	 ;,
	movl	$32, %edx	 ;,
	leaq	.LC99(%rip), %rcx	 ;, tmp146
	call	create_string_check	 ;
	movq	%rax, %rcx	 ; tmp175, _16
 ; ./asm_test/win/i/all.c:3297:     var->name = create_string_check("", 32, 1);
	movq	%rax, 8(%rbx)	 ; _16, var_120->name
 ; ./asm_test/win/i/all.c:3298:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, id
	je	.L457	 ;,
 ; ./asm_test/win/i/all.c:3301:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; id,
	movl	%ebp, %r8d	 ; kind,
	leaq	.LC105(%rip), %rdx	 ;, tmp148
	call	sprintf	 ;
.L455:
 ; ./asm_test/win/i/all.c:3302:     var->type = type;
	movq	%r12, 16(%rbx)	 ; type, var_120->type
 ; ./asm_test/win/i/all.c:3303:     if (kind == VAR_TEMP || kind == VAR_VAR)
	andl	$-3, %ebp	 ;, tmp149
 ; ./asm_test/win/i/all.c:3303:     if (kind == VAR_TEMP || kind == VAR_VAR)
	cmpl	$116, %ebp	 ;, tmp149
	je	.L464	 ;,
.L427:
 ; ./asm_test/win/i/all.c:3306: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
.L449:
 ; ./asm_test/win/i/all.c:3290:         case VAR_PARAM: id = status->param_count++; break;
	movq	56(%rdi), %rsi	 ; status_34(D)->param_count, id
 ; ./asm_test/win/i/all.c:3290:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp141
	movq	%rax, 56(%rdi)	 ; tmp141, status_34(D)->param_count
 ; ./asm_test/win/i/all.c:3290:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L448	 ;
.L450:
 ; ./asm_test/win/i/all.c:3291:         case VAR_VAR: id = status->var_count++; break;
	movq	64(%rdi), %rsi	 ; status_34(D)->var_count, id
 ; ./asm_test/win/i/all.c:3291:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp142
	movq	%rax, 64(%rdi)	 ; tmp142, status_34(D)->var_count
 ; ./asm_test/win/i/all.c:3291:         case VAR_VAR: id = status->var_count++; break;
	jmp	.L448	 ;
.L451:
 ; ./asm_test/win/i/all.c:3292:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rdi), %rsi	 ; status_34(D)->temp_count, id
 ; ./asm_test/win/i/all.c:3292:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp143
	movq	%rax, 72(%rdi)	 ; tmp143, status_34(D)->temp_count
 ; ./asm_test/win/i/all.c:3292:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L448	 ;
.L452:
 ; ./asm_test/win/i/all.c:3293:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rdi), %rsi	 ; status_34(D)->block_count, id
 ; ./asm_test/win/i/all.c:3293:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp144
	movq	%rax, 80(%rdi)	 ; tmp144, status_34(D)->block_count
 ; ./asm_test/win/i/all.c:3293:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L448	 ;
.L453:
 ; ./asm_test/win/i/all.c:3294:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	88(%rdi), %rsi	 ; status_34(D)->subroutine_count, id
 ; ./asm_test/win/i/all.c:3294:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp145
	movq	%rax, 88(%rdi)	 ; tmp145, status_34(D)->subroutine_count
 ; ./asm_test/win/i/all.c:3294:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	jmp	.L448	 ;
.L464:
 ; ./asm_test/win/i/all.c:3304:         list_append(status->current_subroutine->local_vars, (size_t*)var);
	movq	8(%rdi), %rax	 ; status_34(D)->current_subroutine, status_34(D)->current_subroutine
	movq	24(%rax), %rcx	 ; _20->local_vars, _20->local_vars
	movq	%rbx, %rdx	 ; <retval>,
	call	list_append	 ;
	jmp	.L427	 ;
.L456:
 ; ./asm_test/win/i/all.c:3297:     var->name = create_string_check("", 32, 1);
	movl	$1, %r8d	 ;,
	movl	$32, %edx	 ;,
	leaq	.LC99(%rip), %rcx	 ;, tmp153
	call	create_string_check	 ;
	movq	%rax, %rcx	 ; tmp176, _16
 ; ./asm_test/win/i/all.c:3297:     var->name = create_string_check("", 32, 1);
	movq	%rax, 8(%rbx)	 ; _16, var_120->name
.L457:
 ; ./asm_test/win/i/all.c:3299:         sprintf(var->name, "$%d-error", kind);
	movl	%ebp, %r8d	 ; kind,
	leaq	.LC104(%rip), %rdx	 ;, tmp147
	call	sprintf	 ;
	jmp	.L455	 ;
.L443:
 ; ./asm_test/win/i/all.c:3279:         if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r12)	 ;, type_33(D)->kind
	je	.L461	 ;,
.L428:
 ; ./asm_test/win/i/all.c:3285:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp177, <retval>
 ; ./asm_test/win/i/all.c:3286:     var->original_name = original_name;
	movq	%rsi, (%rax)	 ; original_name, var_120->original_name
 ; ./asm_test/win/i/all.c:3288:     switch (kind) {
	leal	-97(%rbp), %eax	 ;, tmp154
	cmpl	$21, %eax	 ;, tmp154
	ja	.L456	 ;,
	movl	%eax, %eax	 ; tmp154, tmp155
	leaq	.L458(%rip), %rdx	 ;, tmp156
	movslq	(%rdx,%rax,4), %rax	 ;, tmp158
	addq	%rdx, %rax	 ; tmp156, tmp159
	jmp	*%rax	 ; tmp159
	.section .rdata,"dr"
	.align 4
.L458:
	.long	.L447-.L458
	.long	.L452-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L453-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L449-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L456-.L458
	.long	.L451-.L458
	.long	.L456-.L458
	.long	.L450-.L458
	.text
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp96, arg
 ; ./asm_test/win/i/all.c:3377:     if (arg == NULL) {
	testq	%rcx, %rcx	 ; arg
	je	.L466	 ;,
	movq	%rdx, %rsi	 ; tmp97, status
 ; ./asm_test/win/i/all.c:3380:     if (arg->is_get) {
	cmpb	$0, 20(%rcx)	 ;, arg_9(D)->is_get
	jne	.L468	 ;,
.L466:
 ; ./asm_test/win/i/all.c:3386: }
	movq	%rbx, %rax	 ; arg,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
.L468:
 ; ./asm_test/win/i/all.c:3381:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rcx), %rdx	 ; arg_9(D)->type, arg_9(D)->type
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp98, _3
 ; ./asm_test/win/i/all.c:3381:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdi	 ; tmp99, temp
 ; ./asm_test/win/i/all.c:3382:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_LOAD, temp, arg, NULL));
	movl	$0, %r9d	 ;,
	movq	%rbx, %r8	 ; arg,
	movq	%rax, %rdx	 ; temp,
	movl	$23, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp100, _4
 ; ./asm_test/win/i/all.c:3382:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rsi), %rax	 ; status_11(D)->current_block, status_11(D)->current_block
	movq	8(%rax), %rcx	 ; _5->instructions, _5->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3383:         return temp;
	movq	%rdi, %rbx	 ; temp, arg
	jmp	.L466	 ;
	.def	search_name_use_strcmp;	.scl	3;	.type	32;	.endef
search_name_use_strcmp:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rbp	 ; tmp93, scope
	movq	%rdx, %rdi	 ; tmp94, name
 ; ./asm_test/win/i/all.c:1118:     while (scope != NULL) {
	testq	%rcx, %rcx	 ; scope
	je	.L474	 ;,
.L473:
 ; ./asm_test/win/i/all.c:1120:         Node* current = names->head;
	movq	8(%rbp), %rax	 ; scope_16->symbols, scope_16->symbols
	movq	(%rax), %rbx	 ; names_8->head, current
 ; ./asm_test/win/i/all.c:1121:         while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	je	.L471	 ;,
.L472:
 ; ./asm_test/win/i/all.c:1122:             Symbol* current_name = (Symbol*)current->content;
	movq	8(%rbx), %rsi	 ; current_17->content, <retval>
 ; ./asm_test/win/i/all.c:1123:             if (strcmp(current_name->name, name) == 0)
	movq	8(%rsi), %rcx	 ; current_name_11->name, current_name_11->name
	movq	%rdi, %rdx	 ; name,
	call	strcmp	 ;
 ; ./asm_test/win/i/all.c:1123:             if (strcmp(current_name->name, name) == 0)
	testl	%eax, %eax	 ; tmp95
	je	.L469	 ;,
 ; ./asm_test/win/i/all.c:1125:             current = current->next;
	movq	(%rbx), %rbx	 ; current_17->next, current
 ; ./asm_test/win/i/all.c:1121:         while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	jne	.L472	 ;,
.L471:
 ; ./asm_test/win/i/all.c:1127:         scope = scope->parent;
	movq	0(%rbp), %rbp	 ; scope_16->parent, scope
 ; ./asm_test/win/i/all.c:1118:     while (scope != NULL) {
	testq	%rbp, %rbp	 ; scope
	jne	.L473	 ;,
 ; ./asm_test/win/i/all.c:1129:     return NULL;
	movq	%rbp, %rsi	 ; scope, <retval>
	jmp	.L469	 ;
.L474:
	movq	%rcx, %rsi	 ; scope, <retval>
.L469:
 ; ./asm_test/win/i/all.c:1130: }
	movq	%rsi, %rax	 ; <retval>,
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC106:
	.ascii "/\0"
	.align 8
.LC107:
	.ascii "Warning: Path component too long, truncating to %zu characters\12\0"
.LC108:
	.ascii ".\0"
.LC109:
	.ascii "..\0"
	.text
	.def	create_file;	.scl	3;	.type	32;	.endef
create_file:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	andq	$-16, %rsp	 ;,
	subq	$304, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp214, path
 ; ./asm_test/win/i/all.c:3861:     File* file = (File*)alloc_memory(sizeof(File));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %r14	 ; tmp215, <retval>
 ; ./asm_test/win/i/all.c:3862:     file->path = absolute_path(path, NULL);
	movl	$0, %edx	 ;,
	movq	%rbx, %rcx	 ; path,
	call	absolute_path	 ;
	movq	%rax, %rcx	 ; tmp216, _1
 ; ./asm_test/win/i/all.c:3862:     file->path = absolute_path(path, NULL);
	movq	%rax, 24(%r14)	 ; _1, file_4->path
 ; ./asm_test/win/i/all.c:3950:     size_t path_len = strlen(file->path);
	call	strlen	 ;
	movq	%rax, %rdi	 ; tmp217, tmp145
 ; ./asm_test/win/i/all.c:3951:     char* path_copy = create_string_check("", path_len + 1, 0);
	leaq	1(%rax), %rdx	 ;, tmp147
	movl	$0, %r8d	 ;,
	leaq	.LC99(%rip), %rcx	 ;, tmp148
	call	create_string_check	 ;
	movq	%rax, %r13	 ; tmp218, path_copy
 ; ./asm_test/win/i/all.c:3952:     strcpy(path_copy, file->path);
	movq	24(%r14), %rdx	 ; file_4->path, file_4->path
	movq	%rax, %rcx	 ; path_copy,
	call	strcpy	 ;
 ; ./asm_test/win/i/all.c:3956:     if (path_len > 0 && path_copy[0] == '/') {
	testq	%rdi, %rdi	 ; tmp145
	je	.L500	 ;,
 ; ./asm_test/win/i/all.c:3955:     size_t start = 0;
	movl	$0, %ebx	 ;, start
 ; ./asm_test/win/i/all.c:3953:     StrNode* dirs_head = NULL;
	movq	$0, 40(%rsp)	 ;, %sfp
 ; ./asm_test/win/i/all.c:3956:     if (path_len > 0 && path_copy[0] == '/') {
	cmpb	$47, 0(%r13)	 ;, *path_copy_12
	jne	.L479	 ;,
 ; ./asm_test/win/i/all.c:3957:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp219, node
	movq	%rax, 40(%rsp)	 ; node, %sfp
 ; ./asm_test/win/i/all.c:3958:         node->dir = create_string_check("/", 1, 1);
	movl	$1, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC106(%rip), %rcx	 ;, tmp150
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3958:         node->dir = create_string_check("/", 1, 1);
	movq	%rax, (%rsi)	 ; tmp220, node_15->dir
 ; ./asm_test/win/i/all.c:3959:         node->next = 0;
	movq	$0, 8(%rsi)	 ;, node_15->next
 ; ./asm_test/win/i/all.c:3962:         start = 1;
	movl	$1, %ebx	 ;, start
	jmp	.L479	 ;
.L513:
 ; ./asm_test/win/i/all.c:3970:                     fprintf(stderr, "Warning: Path component too long, truncating to %zu characters\n", comp_len);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp221, _22
 ; ./asm_test/win/i/all.c:3970:                     fprintf(stderr, "Warning: Path component too long, truncating to %zu characters\n", comp_len);
	movq	%r15, %r8	 ; comp_len,
	leaq	.LC107(%rip), %rdx	 ;, tmp152
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3971:                     comp_len = 256 - 1;
	movl	$255, %r15d	 ;, comp_len
	jmp	.L483	 ;
.L502:
 ; ./asm_test/win/i/all.c:3986:                             StrNode* prev = dirs_head;
	movq	%rsi, %rax	 ; node, prev
	jmp	.L487	 ;
.L503:
 ; ./asm_test/win/i/all.c:3988:                                 prev = prev->next;
	movq	%rdx, %rax	 ; _37, prev
.L487:
 ; ./asm_test/win/i/all.c:3987:                             while (prev != NULL && prev->next != dirs_tail)
	testq	%rax, %rax	 ; prev
	je	.L482	 ;,
 ; ./asm_test/win/i/all.c:3987:                             while (prev != NULL && prev->next != dirs_tail)
	movq	8(%rax), %rdx	 ; prev_36->next, _37
 ; ./asm_test/win/i/all.c:3987:                             while (prev != NULL && prev->next != dirs_tail)
	movq	40(%rsp), %rcx	 ; %sfp, node
	cmpq	%rcx, %rdx	 ; node, _37
	jne	.L503	 ;,
 ; ./asm_test/win/i/all.c:3990:                                 prev->next = 0;
	movq	$0, 8(%rax)	 ;, prev_36->next
 ; ./asm_test/win/i/all.c:3991:                                 dirs_tail = prev;
	movq	%rax, 40(%rsp)	 ; prev, %sfp
	jmp	.L482	 ;
.L486:
 ; ./asm_test/win/i/all.c:3994:                     } else if (dirs_head == NULL) {
	testq	%rsi, %rsi	 ; node
	jne	.L482	 ;,
 ; ./asm_test/win/i/all.c:3995:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp227, node
 ; ./asm_test/win/i/all.c:3996:                         node->dir = create_string_check("..", 2, 1);
	movl	$1, %r8d	 ;,
	movl	$2, %edx	 ;,
	leaq	.LC109(%rip), %rcx	 ;, tmp172
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3996:                         node->dir = create_string_check("..", 2, 1);
	movq	%rax, (%rsi)	 ; tmp228, node_38->dir
 ; ./asm_test/win/i/all.c:3997:                         node->next = 0;
	movq	$0, 8(%rsi)	 ;, node_38->next
 ; ./asm_test/win/i/all.c:3999:                         dirs_tail = node;
	movq	%rsi, 40(%rsp)	 ; node, %sfp
	jmp	.L482	 ;
.L485:
 ; ./asm_test/win/i/all.c:4001:                 } else if (strlen(component) > 0) {
	cmpb	$0, 48(%rsp)	 ;, MEM[(const char *)&component]
	jne	.L511	 ;,
.L482:
 ; ./asm_test/win/i/all.c:4011:             start = i + 1;
	leaq	1(%rbx), %r12	 ;, start
.L481:
 ; ./asm_test/win/i/all.c:4013:         i++;
	leaq	1(%rbx), %rax	 ;, i
 ; ./asm_test/win/i/all.c:3965:     while (i <= path_len) {
	cmpq	%rbx, %rdi	 ; start, tmp145
	je	.L512	 ;,
	movq	%rax, %rbx	 ; i, start
.L490:
 ; ./asm_test/win/i/all.c:3966:         if (i == path_len || path_copy[i] == '/') {
	cmpq	%rbx, %rdi	 ; start, tmp145
	je	.L480	 ;,
 ; ./asm_test/win/i/all.c:3966:         if (i == path_len || path_copy[i] == '/') {
	cmpb	$47, 0(%r13,%rbx)	 ;, MEM[(char *)path_copy_12 + i_151 * 1]
	jne	.L481	 ;,
.L480:
 ; ./asm_test/win/i/all.c:3967:             if (i > start) {
	cmpq	%rbx, %r12	 ; start, start
	jnb	.L482	 ;,
 ; ./asm_test/win/i/all.c:3968:                 size_t comp_len = i - start;
	movq	%rbx, %r15	 ; start, comp_len
	subq	%r12, %r15	 ; start, comp_len
 ; ./asm_test/win/i/all.c:3969:                 if (comp_len >= 256) {
	cmpq	$255, %r15	 ;, comp_len
	ja	.L513	 ;,
.L483:
 ; ./asm_test/win/i/all.c:3974:                 strncpy(component, path_copy + start, comp_len);
	leaq	0(%r13,%r12), %rdx	 ;, tmp153
 ; ./asm_test/win/i/all.c:3974:                 strncpy(component, path_copy + start, comp_len);
	movq	%r15, %r8	 ; comp_len,
	movq	32(%rsp), %r12	 ; %sfp, tmp211
	movq	%r12, %rcx	 ; tmp211,
	call	strncpy	 ;
 ; ./asm_test/win/i/all.c:3975:                 component[comp_len] = '\0';
	movb	$0, 48(%rsp,%r15)	 ;, component[comp_len_24]
 ; ./asm_test/win/i/all.c:3976:                 if (strcmp(component, ".") == 0) {
	leaq	.LC108(%rip), %rdx	 ;,
	movq	%r12, %rcx	 ; tmp211,
	call	strcmp	 ;
 ; ./asm_test/win/i/all.c:3976:                 if (strcmp(component, ".") == 0) {
	testl	%eax, %eax	 ; tmp222
	je	.L482	 ;,
 ; ./asm_test/win/i/all.c:3977:                 } else if (strcmp(component, "..") == 0) {
	leaq	.LC109(%rip), %rdx	 ;,
	movq	%r12, %rcx	 ; tmp211,
	call	strcmp	 ;
 ; ./asm_test/win/i/all.c:3977:                 } else if (strcmp(component, "..") == 0) {
	testl	%eax, %eax	 ; tmp223
	jne	.L485	 ;,
 ; ./asm_test/win/i/all.c:3978:                     if (dirs_tail != NULL && dirs_tail != dirs_head) {
	movq	40(%rsp), %r15	 ; %sfp, node
	testq	%r15, %r15	 ; node
	je	.L486	 ;,
	cmpq	%rsi, %r15	 ; node, node
	je	.L486	 ;,
 ; ./asm_test/win/i/all.c:3979:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	movq	(%r15), %rcx	 ; dirs_tail_153->dir, dirs_tail_153->dir
	leaq	.LC109(%rip), %rdx	 ;, tmp170
	call	strcmp	 ;
 ; ./asm_test/win/i/all.c:3979:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	testl	%eax, %eax	 ; tmp224
	jne	.L502	 ;,
 ; ./asm_test/win/i/all.c:3980:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %r12	 ; tmp225, node
 ; ./asm_test/win/i/all.c:3981:                             node->dir = create_string_check("..", 2, 1);
	movl	$1, %r8d	 ;,
	movl	$2, %edx	 ;,
	leaq	.LC109(%rip), %rcx	 ;, tmp171
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3981:                             node->dir = create_string_check("..", 2, 1);
	movq	%rax, (%r12)	 ; tmp226, node_34->dir
 ; ./asm_test/win/i/all.c:3982:                             node->next = 0;
	movq	$0, 8(%r12)	 ;, node_34->next
 ; ./asm_test/win/i/all.c:3983:                             dirs_tail->next = node;
	movq	%r12, 8(%r15)	 ; node, dirs_tail_153->next
 ; ./asm_test/win/i/all.c:3984:                             dirs_tail = node;
	movq	%r12, 40(%rsp)	 ; node, %sfp
	jmp	.L482	 ;
.L511:
 ; ./asm_test/win/i/all.c:4002:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %r12	 ; tmp229, node
 ; ./asm_test/win/i/all.c:4003:                     node->dir = create_string_check(component, comp_len, 1);
	leaq	48(%rsp), %rcx	 ;, tmp173
	movl	$1, %r8d	 ;,
	movq	%r15, %rdx	 ; comp_len,
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:4003:                     node->dir = create_string_check(component, comp_len, 1);
	movq	%rax, (%r12)	 ; tmp230, node_41->dir
 ; ./asm_test/win/i/all.c:4004:                     node->next = 0;
	movq	$0, 8(%r12)	 ;, node_41->next
 ; ./asm_test/win/i/all.c:4005:                     if (dirs_tail != NULL)
	movq	40(%rsp), %rax	 ; %sfp, node
	testq	%rax, %rax	 ; node
	je	.L489	 ;,
 ; ./asm_test/win/i/all.c:4006:                         dirs_tail->next = node;
	movq	%r12, 8(%rax)	 ; node, dirs_tail_153->next
.L489:
 ; ./asm_test/win/i/all.c:4008:                     if (dirs_head == NULL) dirs_head = node;
	testq	%rsi, %rsi	 ; node
	je	.L504	 ;,
 ; ./asm_test/win/i/all.c:4007:                     dirs_tail = node;
	movq	%r12, 40(%rsp)	 ; node, %sfp
	jmp	.L482	 ;
.L504:
	movq	%r12, 40(%rsp)	 ; node, %sfp
 ; ./asm_test/win/i/all.c:4008:                     if (dirs_head == NULL) dirs_head = node;
	movq	%r12, %rsi	 ; node, node
	jmp	.L482	 ;
.L512:
 ; ./asm_test/win/i/all.c:4015:     file->dirs = dirs_head;
	movq	%rsi, (%r14)	 ; node, file_4->dirs
 ; ./asm_test/win/i/all.c:4016:     if (dirs_tail != NULL) {
	movq	40(%rsp), %rax	 ; %sfp, node
	testq	%rax, %rax	 ; node
	je	.L491	 ;,
 ; ./asm_test/win/i/all.c:4017:         char* dot = strrchr(dirs_tail->dir, '.');
	movq	(%rax), %rdi	 ; dirs_tail_86->dir, _45
 ; ./asm_test/win/i/all.c:4017:         char* dot = strrchr(dirs_tail->dir, '.');
	movl	$46, %edx	 ;,
	movq	%rdi, %rcx	 ; _45,
	call	strrchr	 ;
	movq	%rax, %rbx	 ; tmp231, dot
 ; ./asm_test/win/i/all.c:4018:         if (dot != NULL && dot != dirs_tail->dir) {
	testq	%rax, %rax	 ; dot
	je	.L492	 ;,
	cmpq	%rax, %rdi	 ; dot, _45
	je	.L492	 ;,
 ; ./asm_test/win/i/all.c:4019:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	%rax, %rdx	 ; dot, name_len
	subq	%rdi, %rdx	 ; _45, name_len
 ; ./asm_test/win/i/all.c:4020:             file->name = create_string_check(dirs_tail->dir, name_len, 1);
	movl	$1, %r8d	 ;,
	movq	%rdi, %rcx	 ; _45,
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:4020:             file->name = create_string_check(dirs_tail->dir, name_len, 1);
	movq	%rax, 16(%r14)	 ; tmp232, file_4->name
 ; ./asm_test/win/i/all.c:4021:             file->extension = create_string_check(dot, strlen(dot), 1);
	movq	%rbx, %rcx	 ; dot,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp233, tmp180
 ; ./asm_test/win/i/all.c:4021:             file->extension = create_string_check(dot, strlen(dot), 1);
	movl	$1, %r8d	 ;,
	movq	%rbx, %rcx	 ; dot,
	call	create_string_check	 ;
	movq	%rax, 40(%rsp)	 ; tmp234, %sfp
 ; ./asm_test/win/i/all.c:4018:         if (dot != NULL && dot != dirs_tail->dir) {
	jmp	.L493	 ;
.L492:
 ; ./asm_test/win/i/all.c:4023:             file->name = dirs_tail->dir;
	movq	%rdi, 16(%r14)	 ; _45, file_4->name
	movq	$0, 40(%rsp)	 ;, %sfp
.L493:
 ; ./asm_test/win/i/all.c:4021:             file->extension = create_string_check(dot, strlen(dot), 1);
	movq	40(%rsp), %rax	 ; %sfp, node
	movq	%rax, 8(%r14)	 ; node, file_4->extension
 ; ./asm_test/win/i/all.c:4033:     while (current != NULL) {
	testq	%rsi, %rsi	 ; node
	je	.L494	 ;,
 ; ./asm_test/win/i/all.c:4031:     StrNode* current = dirs_head;
	movq	%rsi, %rbx	 ; node, current
 ; ./asm_test/win/i/all.c:4032:     size_t node_count = 0;
	movl	$0, %edi	 ;, node_count
 ; ./asm_test/win/i/all.c:4030:     size_t full_path_len = 0;
	movl	$0, %r12d	 ;, full_path_len
.L495:
 ; ./asm_test/win/i/all.c:4034:         full_path_len += strlen(current->dir);
	movq	(%rbx), %rcx	 ; current_157->dir, current_157->dir
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:4034:         full_path_len += strlen(current->dir);
	addq	%rax, %r12	 ; tmp235, full_path_len
	movq	%rdi, %rax	 ; node_count, node_count
 ; ./asm_test/win/i/all.c:4035:         node_count++;
	addq	$1, %rdi	 ;, node_count
 ; ./asm_test/win/i/all.c:4036:         current = current->next;
	movq	8(%rbx), %rbx	 ; current_157->next, current
 ; ./asm_test/win/i/all.c:4033:     while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	jne	.L495	 ;,
 ; ./asm_test/win/i/all.c:4039:         full_path_len += (node_count - 1);
	addq	%r12, %rax	 ; full_path_len, tmp204
	cmpq	$1, %rdi	 ;, node_count
	cmova	%rax, %r12	 ; tmp204,, full_path_len
 ; ./asm_test/win/i/all.c:4040:     char* full_path = create_string_check("", full_path_len + 1, 0);
	leaq	1(%r12), %rdx	 ;, tmp200
	movl	$0, %r8d	 ;,
	leaq	.LC99(%rip), %rcx	 ;, tmp201
	call	create_string_check	 ;
	movq	%rax, %rbx	 ; tmp236, full_path
 ; ./asm_test/win/i/all.c:4041:     full_path[0] = '\0';
	movb	$0, (%rax)	 ;, *full_path_52
	movl	$1, %eax	 ;, is_first
 ; ./asm_test/win/i/all.c:4045:         if (!is_first && strcmp(current->dir, "/") != 0) {
	leaq	.LC106(%rip), %r12	 ;, tmp209
	movl	$0, %edi	 ;, is_first
	jmp	.L498	 ;
.L491:
 ; ./asm_test/win/i/all.c:4027:         file->name = NULL;
	movq	$0, 16(%r14)	 ;, file_4->name
	jmp	.L493	 ;
.L497:
 ; ./asm_test/win/i/all.c:4050:         strcat(full_path, current->dir);
	movq	(%rsi), %rdx	 ; current_163->dir, current_163->dir
	movq	%rbx, %rcx	 ; full_path,
	call	strcat	 ;
 ; ./asm_test/win/i/all.c:4052:         current = current->next;
	movq	8(%rsi), %rsi	 ; current_163->next, node
	movl	%edi, %eax	 ; is_first, is_first
 ; ./asm_test/win/i/all.c:4044:     while (current != NULL) {
	testq	%rsi, %rsi	 ; node
	je	.L499	 ;,
.L498:
 ; ./asm_test/win/i/all.c:4045:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testb	%al, %al	 ; is_first
	jne	.L497	 ;,
 ; ./asm_test/win/i/all.c:4045:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	(%rsi), %rcx	 ; current_163->dir, current_163->dir
	movq	%r12, %rdx	 ; tmp209,
	call	strcmp	 ;
 ; ./asm_test/win/i/all.c:4045:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testl	%eax, %eax	 ; tmp237
	je	.L497	 ;,
 ; ./asm_test/win/i/all.c:4046:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$0, (%rbx)	 ;, MEM[(const char *)full_path_52]
	je	.L497	 ;,
 ; ./asm_test/win/i/all.c:4046:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	movq	%rbx, %rcx	 ; full_path,
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:4046:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$47, -1(%rbx,%rax)	 ;, *_72
	je	.L497	 ;,
 ; ./asm_test/win/i/all.c:4047:                 strcat(full_path, "/");
	movw	$47, (%rbx,%rax)	 ;, MEM <char[1:2]> [(void *)_74]
	jmp	.L497	 ;
.L494:
 ; ./asm_test/win/i/all.c:4040:     char* full_path = create_string_check("", full_path_len + 1, 0);
	movl	$0, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC99(%rip), %rcx	 ;, tmp199
	call	create_string_check	 ;
	movq	%rax, %rbx	 ; tmp241, full_path
 ; ./asm_test/win/i/all.c:4041:     full_path[0] = '\0';
	movb	$0, (%rax)	 ;, *full_path_130
.L499:
 ; ./asm_test/win/i/all.c:4054:     file->path = create_string_check(full_path, strlen(full_path), 1);
	movq	%rbx, %rcx	 ; full_path,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp239, tmp196
 ; ./asm_test/win/i/all.c:4054:     file->path = create_string_check(full_path, strlen(full_path), 1);
	movl	$1, %r8d	 ;,
	movq	%rbx, %rcx	 ; full_path,
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:4054:     file->path = create_string_check(full_path, strlen(full_path), 1);
	movq	%rax, 24(%r14)	 ; tmp240, file_4->path
 ; ./asm_test/win/i/all.c:3865: }
	movq	%r14, %rax	 ; <retval>,
	leaq	-56(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	popq	%rbp	 ;
	ret	
.L500:
 ; ./asm_test/win/i/all.c:3955:     size_t start = 0;
	movq	%rdi, %rbx	 ; tmp145, start
 ; ./asm_test/win/i/all.c:3953:     StrNode* dirs_head = NULL;
	movq	$0, 40(%rsp)	 ;, %sfp
.L479:
	movq	40(%rsp), %rsi	 ; %sfp, node
	movq	%rbx, %r12	 ; start, start
 ; ./asm_test/win/i/all.c:3974:                 strncpy(component, path_copy + start, comp_len);
	leaq	48(%rsp), %rax	 ;, tmp211
	movq	%rax, 32(%rsp)	 ; tmp211, %sfp
	jmp	.L490	 ;
	.def	get_file_dir;	.scl	3;	.type	32;	.endef
get_file_dir:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3901:     if (path->dirs == NULL) return 0;
	movq	(%rcx), %rax	 ; path_31(D)->dirs, _1
 ; ./asm_test/win/i/all.c:3901:     if (path->dirs == NULL) return 0;
	testq	%rax, %rax	 ; _1
	je	.L522	 ;,
	movq	%rcx, %rbp	 ; tmp130, path
 ; ./asm_test/win/i/all.c:3903:     size_t node_count = 0;
	movl	$0, %edi	 ;, node_count
 ; ./asm_test/win/i/all.c:3902:     size_t total_len = 0;
	movl	$0, %esi	 ;, total_len
	jmp	.L517	 ;
.L525:
 ; ./asm_test/win/i/all.c:3907:             size_t dir_len = strlen(current->dir);
	movq	(%rax), %rcx	 ; current_57->dir, current_57->dir
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:3908:             total_len += dir_len;
	addq	%rax, %rsi	 ; tmp131, total_len
 ; ./asm_test/win/i/all.c:3909:             node_count++;
	addq	$1, %rdi	 ;, node_count
	movq	%rbx, %rax	 ; <retval>, _1
.L517:
 ; ./asm_test/win/i/all.c:3906:         if (current->next != NULL) {
	movq	8(%rax), %rbx	 ; current_57->next, <retval>
 ; ./asm_test/win/i/all.c:3906:         if (current->next != NULL) {
	testq	%rbx, %rbx	 ; <retval>
	jne	.L525	 ;,
 ; ./asm_test/win/i/all.c:3913:     if (node_count == 0) return NULL;
	testq	%rdi, %rdi	 ; node_count
	je	.L514	 ;,
 ; ./asm_test/win/i/all.c:3915:         total_len += node_count - 1;
	leaq	-1(%rsi,%rdi), %rax	 ;, tmp125
	cmpq	$1, %rdi	 ;, node_count
	cmova	%rax, %rsi	 ; tmp125,, total_len
 ; ./asm_test/win/i/all.c:3916:     char* dir_path = create_string_check("", total_len + 1, 0);
	leaq	1(%rsi), %rdx	 ;, tmp109
	movl	$0, %r8d	 ;,
	leaq	.LC99(%rip), %rcx	 ;, tmp110
	call	create_string_check	 ;
	movq	%rax, %rsi	 ; tmp132, dir_path
 ; ./asm_test/win/i/all.c:3917:     dir_path[0] = '\0';
	movb	$0, (%rax)	 ;, *dir_path_35
 ; ./asm_test/win/i/all.c:3918:     current = path->dirs;
	movq	0(%rbp), %rbx	 ; path_31(D)->dirs, current
 ; ./asm_test/win/i/all.c:3920:     while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	je	.L519	 ;,
 ; ./asm_test/win/i/all.c:3919:     char first = 1;
	movl	$1, %eax	 ;, first
 ; ./asm_test/win/i/all.c:3922:             if (!first && strcmp(current->dir, "/") != 0)
	leaq	.LC106(%rip), %rbp	 ;, tmp128
	movl	$0, %edi	 ;, first
	jmp	.L521	 ;
.L520:
 ; ./asm_test/win/i/all.c:3925:             strcat(dir_path, current->dir);
	movq	(%rbx), %rdx	 ; current_58->dir, current_58->dir
	movq	%rsi, %rcx	 ; dir_path,
	call	strcat	 ;
 ; ./asm_test/win/i/all.c:3928:         current = current->next;
	movq	8(%rbx), %rbx	 ; current_58->next, current
	movl	%edi, %eax	 ; first, first
 ; ./asm_test/win/i/all.c:3920:     while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	je	.L519	 ;,
.L521:
 ; ./asm_test/win/i/all.c:3921:         if (current->next != NULL) {
	cmpq	$0, 8(%rbx)	 ;, current_58->next
	je	.L519	 ;,
 ; ./asm_test/win/i/all.c:3922:             if (!first && strcmp(current->dir, "/") != 0)
	testb	%al, %al	 ; first
	jne	.L520	 ;,
 ; ./asm_test/win/i/all.c:3922:             if (!first && strcmp(current->dir, "/") != 0)
	movq	(%rbx), %rcx	 ; current_58->dir, current_58->dir
	movq	%rbp, %rdx	 ; tmp128,
	call	strcmp	 ;
 ; ./asm_test/win/i/all.c:3922:             if (!first && strcmp(current->dir, "/") != 0)
	testl	%eax, %eax	 ; tmp133
	je	.L520	 ;,
 ; ./asm_test/win/i/all.c:3923:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$0, (%rsi)	 ;, MEM[(const char *)dir_path_35]
	je	.L520	 ;,
 ; ./asm_test/win/i/all.c:3923:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	movq	%rsi, %rcx	 ; dir_path,
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:3923:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$47, -1(%rsi,%rax)	 ;, *_12
	je	.L520	 ;,
 ; ./asm_test/win/i/all.c:3924:                     strcat(dir_path, "/");
	movw	$47, (%rsi,%rax)	 ;, MEM <char[1:2]> [(void *)_40]
	jmp	.L520	 ;
.L519:
 ; ./asm_test/win/i/all.c:3930:     return create_string_check(dir_path, strlen(dir_path), 1);
	movq	%rsi, %rcx	 ; dir_path,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp135, tmp121
 ; ./asm_test/win/i/all.c:3930:     return create_string_check(dir_path, strlen(dir_path), 1);
	movl	$1, %r8d	 ;,
	movq	%rsi, %rcx	 ; dir_path,
	call	create_string_check	 ;
	movq	%rax, %rbx	 ; tmp136, <retval>
.L514:
 ; ./asm_test/win/i/all.c:3931: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L522:
 ; ./asm_test/win/i/all.c:3901:     if (path->dirs == NULL) return 0;
	movq	%rax, %rbx	 ; _1, <retval>
	jmp	.L514	 ;
	.section .rdata,"dr"
.LC110:
	.ascii "%s/%s%s\0"
.LC111:
	.ascii "%s%s\0"
	.text
	.def	rebuild_full_path;	.scl	3;	.type	32;	.endef
rebuild_full_path:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp133, file
 ; ./asm_test/win/i/all.c:3933:     char* dir = get_file_dir(file);
	call	get_file_dir	 ;
	movq	%rax, %rsi	 ; tmp134, dir
 ; ./asm_test/win/i/all.c:3934:     char* dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	 ; dir
	leaq	.LC99(%rip), %rbp	 ;, tmp132
	cmovne	%rax, %rbp	 ; dir,, iftmp.89_14
 ; ./asm_test/win/i/all.c:3935:     char* ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rbx), %r12	 ; file_18(D)->extension, _1
 ; ./asm_test/win/i/all.c:3935:     char* ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%r12, %r12	 ; _1
	je	.L537	 ;,
 ; ./asm_test/win/i/all.c:3936:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%rbp, %rcx	 ; iftmp.89_14,
	call	strlen	 ;
	movq	%rax, %rdi	 ; tmp138, tmp114
 ; ./asm_test/win/i/all.c:3936:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rcx	 ; file_18(D)->name, file_18(D)->name
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:3936:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%rdi,%rax), %rdi	 ;, path_len
 ; ./asm_test/win/i/all.c:3937:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	movq	%r12, %rcx	 ; _1,
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:3937:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	leaq	(%rax,%rdi), %rdx	 ;, path_len
.L532:
 ; ./asm_test/win/i/all.c:3938:     char* new_path = create_string_check("", path_len + 1, 0);
	addq	$1, %rdx	 ;, tmp104
	movl	$0, %r8d	 ;,
	leaq	.LC99(%rip), %rcx	 ;, tmp105
	call	create_string_check	 ;
	movq	%rax, %rdi	 ; tmp135, new_path
 ; ./asm_test/win/i/all.c:3939:     if (dir != NULL && strlen(dir_cstr) > 0)
	testq	%rsi, %rsi	 ; dir
	je	.L530	 ;,
 ; ./asm_test/win/i/all.c:3939:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpb	$0, 0(%rbp)	 ;, MEM[(const char *)iftmp.89_14]
	jne	.L538	 ;,
.L530:
 ; ./asm_test/win/i/all.c:3942:         sprintf(new_path, "%s%s", file->name, ext_cstr);
	movq	%r12, %r9	 ; _1,
	movq	16(%rbx), %r8	 ; file_18(D)->name,
	leaq	.LC111(%rip), %rdx	 ;, tmp109
	movq	%rdi, %rcx	 ; new_path,
	call	sprintf	 ;
.L531:
 ; ./asm_test/win/i/all.c:3943:     file->path = create_string_check(new_path, strlen(new_path), 1);
	movq	%rdi, %rcx	 ; new_path,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp136, tmp111
 ; ./asm_test/win/i/all.c:3943:     file->path = create_string_check(new_path, strlen(new_path), 1);
	movl	$1, %r8d	 ;,
	movq	%rdi, %rcx	 ; new_path,
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3943:     file->path = create_string_check(new_path, strlen(new_path), 1);
	movq	%rax, 24(%rbx)	 ; tmp137, file_18(D)->path
 ; ./asm_test/win/i/all.c:3944: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L538:
 ; ./asm_test/win/i/all.c:3940:         sprintf(new_path, "%s/%s%s", dir_cstr, file->name, ext_cstr);
	movq	%r12, 32(%rsp)	 ; _1,
	movq	16(%rbx), %r9	 ; file_18(D)->name,
	movq	%rbp, %r8	 ; iftmp.89_14,
	leaq	.LC110(%rip), %rdx	 ;, tmp107
	movq	%rax, %rcx	 ; new_path,
	call	sprintf	 ;
	jmp	.L531	 ;
.L537:
 ; ./asm_test/win/i/all.c:3936:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%rbp, %rcx	 ; iftmp.89_14,
	call	strlen	 ;
	movq	%rax, %rdi	 ; tmp141, tmp125
 ; ./asm_test/win/i/all.c:3936:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rcx	 ; file_18(D)->name, file_18(D)->name
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:3936:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%rdi,%rax), %rdx	 ;, path_len
 ; ./asm_test/win/i/all.c:3935:     char* ext_cstr = file->extension != NULL ? file->extension : "";
	leaq	.LC99(%rip), %r12	 ;, _1
	jmp	.L532	 ;
	.def	read_source;	.scl	3;	.type	32;	.endef
read_source:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp105, file
	movq	%rdx, %rsi	 ; tmp106, length
 ; ./asm_test/win/i/all.c:893:     fseek(file, 0, SEEK_END);
	movl	$2, %r8d	 ;,
	movl	$0, %edx	 ;,
	call	fseek	 ;
 ; ./asm_test/win/i/all.c:894:     *length = (size_t)ftell(file);
	movq	%rdi, %rcx	 ; file,
	call	ftell	 ;
 ; ./asm_test/win/i/all.c:894:     *length = (size_t)ftell(file);
	cltq
	movq	%rax, (%rsi)	 ; _1, *length_19(D)
 ; ./asm_test/win/i/all.c:895:     fseek(file, 0, SEEK_SET);
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movq	%rdi, %rcx	 ; file,
	call	fseek	 ;
 ; ./asm_test/win/i/all.c:896:     char* source = create_string_check("", *length + 1, 0);
	movq	(%rsi), %rax	 ; *length_19(D), tmp112
	leaq	1(%rax), %rdx	 ;, tmp97
	movl	$0, %r8d	 ;,
	leaq	.LC99(%rip), %rcx	 ;, tmp99
	call	create_string_check	 ;
	movq	%rax, %rbx	 ; tmp108, <retval>
 ; ./asm_test/win/i/all.c:897:     size_t bytes_read = fread(source, 1, *length, file);
	movq	%rdi, %r9	 ; file,
	movq	(%rsi), %r8	 ; *length_19(D),
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; <retval>,
	call	fread	 ;
 ; ./asm_test/win/i/all.c:898:     source[bytes_read] = '\0';
	movb	$0, (%rbx,%rax)	 ;, *_6
 ; ./asm_test/win/i/all.c:899:     *length = bytes_read;
	movq	%rax, (%rsi)	 ; bytes_read, *length_19(D)
 ; ./asm_test/win/i/all.c:900:     for (size_t i = 0; i < *length; ++i) {
	testq	%rax, %rax	 ; bytes_read
	je	.L539	 ;,
 ; ./asm_test/win/i/all.c:900:     for (size_t i = 0; i < *length; ++i) {
	movl	$0, %eax	 ;, i
	jmp	.L542	 ;
.L541:
 ; ./asm_test/win/i/all.c:900:     for (size_t i = 0; i < *length; ++i) {
	addq	$1, %rax	 ;, i
 ; ./asm_test/win/i/all.c:900:     for (size_t i = 0; i < *length; ++i) {
	cmpq	(%rsi), %rax	 ; *length_19(D), i
	jnb	.L539	 ;,
.L542:
 ; ./asm_test/win/i/all.c:901:         if (source[i] == '\r' || source[i] == '\t')
	movzbl	(%rbx,%rax), %edx	 ; MEM[(char *)source_23 + i_34 * 1], tmp101
	andl	$-5, %edx	 ;, tmp101
 ; ./asm_test/win/i/all.c:901:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$9, %dl	 ;, tmp101
	jne	.L541	 ;,
 ; ./asm_test/win/i/all.c:902:             source[i] = ' ';
	movb	$32, (%rbx,%rax)	 ;, MEM[(char *)source_23 + i_34 * 1]
	jmp	.L541	 ;
.L539:
 ; ./asm_test/win/i/all.c:905: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC113:
	.ascii "[Warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC114:
	.ascii "[Warning] Unsupported primary type for tac_primary: %d\12\0"
	.text
	.def	tac_primary;	.scl	3;	.type	32;	.endef
tac_primary:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3707:     switch (primary->type) {
	movl	8(%rcx), %ebx	 ; primary_36(D)->type, _1
 ; ./asm_test/win/i/all.c:3707:     switch (primary->type) {
	cmpl	$8, %ebx	 ;, _1
	ja	.L546	 ;,
	movq	%rdx, %rsi	 ; tmp149, status
	movl	%ebx, %ebx	 ; _1, _1
	leaq	.L548(%rip), %r8	 ;, tmp118
	movslq	(%r8,%rbx,4), %rax	 ;, tmp120
	addq	%r8, %rax	 ; tmp118, tmp121
	jmp	*%rax	 ; tmp121
	.section .rdata,"dr"
	.align 4
.L548:
	.long	.L556-.L548
	.long	.L555-.L548
	.long	.L554-.L548
	.long	.L553-.L548
	.long	.L552-.L548
	.long	.L551-.L548
	.long	.L550-.L548
	.long	.L549-.L548
	.long	.L547-.L548
	.text
.L556:
 ; ./asm_test/win/i/all.c:3709:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rcx), %rcx	 ; primary_36(D)->value.literal_value, primary_36(D)->value.literal_value
	movl	$10, %r8d	 ;,
	movl	$0, %edx	 ;,
	call	strtoll	 ;
 ; ./asm_test/win/i/all.c:3709:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, 40(%rsp)	 ; tmp150, MEM[(long long int *)_93]
 ; ./asm_test/win/i/all.c:3710:             return create_arg(ARG_INT, &t);
	leaq	40(%rsp), %rdx	 ;, tmp124
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp151, <retval>
.L545:
 ; ./asm_test/win/i/all.c:3758: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
.L555:
 ; ./asm_test/win/i/all.c:3713:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rcx), %rcx	 ; primary_36(D)->value.literal_value, primary_36(D)->value.literal_value
	movl	$0, %edx	 ;,
	call	strtod	 ;
 ; ./asm_test/win/i/all.c:3713:             double t = strtod(primary->value.literal_value, NULL);
	movsd	%xmm0, 40(%rsp)	 ; tmp152, MEM[(double *)_93]
 ; ./asm_test/win/i/all.c:3714:             return create_arg(ARG_FLOAT, &t);
	leaq	40(%rsp), %rdx	 ;, tmp126
	movl	$2, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp153, <retval>
	jmp	.L545	 ;
.L554:
 ; ./asm_test/win/i/all.c:3717:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rcx), %rdx	 ; primary_36(D)->value.literal_value, primary_36(D)->value.literal_value
	movl	$3, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp154, <retval>
	jmp	.L545	 ;
.L553:
 ; ./asm_test/win/i/all.c:3719:             char t = 1;
	movb	$1, 40(%rsp)	 ;, MEM[(char *)_93]
 ; ./asm_test/win/i/all.c:3720:             return create_arg(ARG_BOOL, &t);
	leaq	40(%rsp), %rdx	 ;, tmp128
	movl	$4, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp155, <retval>
	jmp	.L545	 ;
.L552:
 ; ./asm_test/win/i/all.c:3723:             char t = 0;
	movb	$0, 40(%rsp)	 ;, MEM[(char *)_93]
 ; ./asm_test/win/i/all.c:3724:             return create_arg(ARG_BOOL, &t);
	leaq	40(%rsp), %rdx	 ;, tmp129
	movl	$4, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp156, <retval>
	jmp	.L545	 ;
.L551:
 ; ./asm_test/win/i/all.c:3727:             return tac_expression(primary->value.expr, status);
	movq	(%rcx), %rcx	 ; primary_36(D)->value.expr, primary_36(D)->value.expr
	call	tac_expression	 ;
	movq	%rax, %rbx	 ; tmp157, <retval>
	jmp	.L545	 ;
.L550:
 ; ./asm_test/win/i/all.c:3729:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_36(D)->value.operand, primary_36(D)->value.operand
	call	tac_primary	 ;
	movq	%rax, %rcx	 ; tmp158, _9
 ; ./asm_test/win/i/all.c:3729:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rsi, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rdi	 ; tmp159, operand
 ; ./asm_test/win/i/all.c:3730:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movq	name_bool(%rip), %rdx	 ; name_bool,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp160, _11
 ; ./asm_test/win/i/all.c:3730:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp161, <retval>
 ; ./asm_test/win/i/all.c:3731:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	movl	$0, %r9d	 ;,
	movq	%rdi, %r8	 ; operand,
	movq	%rax, %rdx	 ; <retval>,
	movl	$13, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp162, inst
 ; ./asm_test/win/i/all.c:3732:             list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rsi), %rax	 ; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rcx	 ; _12->instructions, _12->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3733:             return temp;
	jmp	.L545	 ;
.L549:
 ; ./asm_test/win/i/all.c:3736:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_36(D)->value.operand, primary_36(D)->value.operand
	call	tac_primary	 ;
	movq	%rax, %rcx	 ; tmp163, _15
 ; ./asm_test/win/i/all.c:3736:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rsi, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rdi	 ; tmp164, operand
 ; ./asm_test/win/i/all.c:3737:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	8(%rax), %rdx	 ; operand_42->type, operand_42->type
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp165, _17
 ; ./asm_test/win/i/all.c:3737:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp166, <retval>
 ; ./asm_test/win/i/all.c:3739:             long long zero_int = 0;
	movq	$0, 32(%rsp)	 ;, zero_int
 ; ./asm_test/win/i/all.c:3740:             double neg_one_float = -1.0;
	movq	.LC112(%rip), %rax	 ;, tmp175
	movq	%rax, 40(%rsp)	 ; tmp175, MEM[(double *)_93]
 ; ./asm_test/win/i/all.c:3741:             if (operand->type == name_int)
	movq	8(%rdi), %rax	 ; operand_42->type, _18
 ; ./asm_test/win/i/all.c:3741:             if (operand->type == name_int)
	cmpq	name_int(%rip), %rax	 ; name_int, _18
	je	.L563	 ;,
 ; ./asm_test/win/i/all.c:3743:             else if (operand->type == name_float)
	cmpq	name_float(%rip), %rax	 ; name_float, _18
	je	.L564	 ;,
 ; ./asm_test/win/i/all.c:3746:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	8(%rax), %rbx	 ; _18->name, _23
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp171, _24
 ; ./asm_test/win/i/all.c:3746:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	%rbx, %r8	 ; _23,
	leaq	.LC113(%rip), %rdx	 ;, tmp141
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3747:                 return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L545	 ;
.L563:
 ; ./asm_test/win/i/all.c:3742:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	leaq	32(%rsp), %rdx	 ;, tmp138
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp167
 ; ./asm_test/win/i/all.c:3742:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rdi, %r9	 ; operand,
	movq	%rbx, %rdx	 ; <retval>,
	movl	$1, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp168, inst
	jmp	.L559	 ;
.L564:
 ; ./asm_test/win/i/all.c:3744:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	leaq	40(%rsp), %rdx	 ;, tmp139
	movl	$2, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp169
 ; ./asm_test/win/i/all.c:3744:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%rdi, %r9	 ; operand,
	movq	%rbx, %rdx	 ; <retval>,
	movl	$2, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp170, inst
.L559:
 ; ./asm_test/win/i/all.c:3749:             list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rsi), %rax	 ; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rcx	 ; _25->instructions, _25->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3750:             return temp;
	jmp	.L545	 ;
.L547:
 ; ./asm_test/win/i/all.c:3753:             return tac_variable_access(primary->value.var, status);
	movq	(%rcx), %rcx	 ; primary_36(D)->value.var, primary_36(D)->value.var
	call	tac_variable_access	 ;
	movq	%rax, %rbx	 ; tmp172, <retval>
	jmp	.L545	 ;
.L546:
 ; ./asm_test/win/i/all.c:3755:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp173, _28
 ; ./asm_test/win/i/all.c:3755:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movl	%ebx, %r8d	 ; _1,
	leaq	.LC114(%rip), %rdx	 ;, tmp146
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3756:             return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L545	 ;
	.section .rdata,"dr"
	.align 8
.LC115:
	.ascii "[Warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.def	tac_expression;	.scl	3;	.type	32;	.endef
tac_expression:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp142, expression
	movq	%rdx, %rbx	 ; tmp143, status
 ; ./asm_test/win/i/all.c:3678:     if (expression->operator == OP_NONE) {
	cmpl	$19, 24(%rcx)	 ;, expression_31(D)->operator
	je	.L593	 ;,
 ; ./asm_test/win/i/all.c:3682:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	16(%rcx), %rcx	 ; expression_31(D)->right, expression_31(D)->right
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp145, _4
 ; ./asm_test/win/i/all.c:3682:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %r12	 ; tmp146, right
 ; ./asm_test/win/i/all.c:3683:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%rsi), %ebp	 ; expression_31(D)->operator, _62
 ; ./asm_test/win/i/all.c:3165:     switch (op) {
	cmpl	$18, %ebp	 ;, _62
	ja	.L568	 ;,
	movl	%ebp, %eax	 ; _62, _62
	leaq	.L570(%rip), %rdx	 ;, tmp119
	movslq	(%rdx,%rax,4), %rax	 ;, tmp121
	addq	%rdx, %rax	 ; tmp119, tmp122
	jmp	*%rax	 ; tmp122
	.section .rdata,"dr"
	.align 4
.L570:
	.long	.L574-.L570
	.long	.L573-.L570
	.long	.L589-.L570
	.long	.L571-.L570
	.long	.L569-.L570
	.long	.L572-.L570
	.long	.L572-.L570
	.long	.L572-.L570
	.long	.L572-.L570
	.long	.L572-.L570
	.long	.L572-.L570
	.long	.L572-.L570
	.long	.L572-.L570
	.long	.L575-.L570
	.long	.L574-.L570
	.long	.L573-.L570
	.long	.L589-.L570
	.long	.L571-.L570
	.long	.L569-.L570
	.text
.L593:
 ; ./asm_test/win/i/all.c:3679:         Arg* result = tac_primary(expression->prim_left, status);
	movq	8(%rcx), %rcx	 ; expression_31(D)->prim_left, expression_31(D)->prim_left
	call	tac_primary	 ;
	movq	%rax, %rsi	 ; tmp144, <retval>
 ; ./asm_test/win/i/all.c:3680:         return result;
	jmp	.L565	 ;
.L571:
 ; ./asm_test/win/i/all.c:3173:         case OP_DIV_ASSIGN: return INST_DIV;
	movl	$3, %ebp	 ;, _62
.L572:
 ; ./asm_test/win/i/all.c:3684:     Arg* left = tac_expression(expression->expr_left, status);
	movq	(%rsi), %rcx	 ; expression_31(D)->expr_left, expression_31(D)->expr_left
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rdi	 ; tmp159, left
 ; ./asm_test/win/i/all.c:3686:     if (expression->operator == OP_ASSIGN || expression->operator == OP_ADD_ASSIGN || expression->operator == OP_SUB_ASSIGN || expression->operator == OP_MUL_ASSIGN || expression->operator == OP_DIV_ASSIGN || expression->operator == OP_MOD_ASSIGN) {
	movl	24(%rsi), %eax	 ; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	 ;, tmp137
 ; ./asm_test/win/i/all.c:3686:     if (expression->operator == OP_ASSIGN || expression->operator == OP_ADD_ASSIGN || expression->operator == OP_SUB_ASSIGN || expression->operator == OP_MUL_ASSIGN || expression->operator == OP_DIV_ASSIGN || expression->operator == OP_MOD_ASSIGN) {
	cmpl	$5, %eax	 ;, tmp137
	jbe	.L587	 ;,
.L584:
 ; ./asm_test/win/i/all.c:3699:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rdi), %rdx	 ; left_77->type, left_77->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp155, _18
 ; ./asm_test/win/i/all.c:3699:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp156, <retval>
 ; ./asm_test/win/i/all.c:3700:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rdx	 ; status,
	movq	%rdi, %rcx	 ; left,
	call	load_rvalue	 ;
	movq	%rax, %r8	 ;, tmp157
 ; ./asm_test/win/i/all.c:3700:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%r12, %r9	 ; right,
	movq	%rsi, %rdx	 ; <retval>,
	movl	%ebp, %ecx	 ; _62,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp158, inst
	jmp	.L586	 ;
.L569:
 ; ./asm_test/win/i/all.c:3175:         case OP_MOD_ASSIGN: return INST_MOD;
	movl	$4, %ebp	 ;, _62
	jmp	.L572	 ;
.L568:
 ; ./asm_test/win/i/all.c:3186:         default: return INST_NONE;
	movl	$25, %ebp	 ;, _62
	jmp	.L572	 ;
.L574:
 ; ./asm_test/win/i/all.c:3684:     Arg* left = tac_expression(expression->expr_left, status);
	movq	(%rsi), %rcx	 ; expression_31(D)->expr_left, expression_31(D)->expr_left
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rdi	 ; tmp147, left
 ; ./asm_test/win/i/all.c:3686:     if (expression->operator == OP_ASSIGN || expression->operator == OP_ADD_ASSIGN || expression->operator == OP_SUB_ASSIGN || expression->operator == OP_MUL_ASSIGN || expression->operator == OP_DIV_ASSIGN || expression->operator == OP_MOD_ASSIGN) {
	movl	24(%rsi), %eax	 ; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	 ;, tmp125
 ; ./asm_test/win/i/all.c:3686:     if (expression->operator == OP_ASSIGN || expression->operator == OP_ADD_ASSIGN || expression->operator == OP_SUB_ASSIGN || expression->operator == OP_MUL_ASSIGN || expression->operator == OP_DIV_ASSIGN || expression->operator == OP_MOD_ASSIGN) {
	cmpl	$5, %eax	 ;, tmp125
	ja	.L590	 ;,
	movl	$0, %ebp	 ;, _62
.L587:
 ; ./asm_test/win/i/all.c:3688:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rdi), %rdx	 ; left_75->type, left_75->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp148, _10
 ; ./asm_test/win/i/all.c:3688:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp149, <retval>
 ; ./asm_test/win/i/all.c:3689:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rdx	 ; status,
	movq	%rdi, %rcx	 ; left,
	call	load_rvalue	 ;
	movq	%rax, %r8	 ;, tmp150
 ; ./asm_test/win/i/all.c:3689:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%r12, %r9	 ; right,
	movq	%rsi, %rdx	 ; <retval>,
	movl	%ebp, %ecx	 ; _62,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp151, inst
 ; ./asm_test/win/i/all.c:3690:             list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rcx	 ; _12->instructions, _12->instructions
	call	list_append	 ;
.L588:
 ; ./asm_test/win/i/all.c:3693:         if (left->kind != ARG_VARIABLE)
	cmpl	$0, 16(%rdi)	 ;, left_76->kind
	jne	.L594	 ;,
.L585:
 ; ./asm_test/win/i/all.c:3695:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	movl	$0, %r9d	 ;,
	movq	%rsi, %r8	 ; <retval>,
	movq	%rdi, %rdx	 ; left,
	movl	$14, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp153, inst
 ; ./asm_test/win/i/all.c:3696:         if (left->is_get)
	cmpb	$0, 20(%rdi)	 ;, left_76->is_get
	jne	.L595	 ;,
.L586:
 ; ./asm_test/win/i/all.c:3703:     list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rcx	 ; _20->instructions, _20->instructions
	call	list_append	 ;
.L565:
 ; ./asm_test/win/i/all.c:3705: }
	movq	%rsi, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L594:
 ; ./asm_test/win/i/all.c:3694:             fprintf(stderr, "[Warning] Left-hand side of assignment is not a variable\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp152
 ; ./asm_test/win/i/all.c:3694:             fprintf(stderr, "[Warning] Left-hand side of assignment is not a variable\n");
	movl	$57, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC115(%rip), %rcx	 ;, tmp131
	call	fwrite	 ;
	jmp	.L585	 ;
.L595:
 ; ./asm_test/win/i/all.c:3697:             inst = create_instruction(INST_STORE, left, right, NULL);
	movl	$0, %r9d	 ;,
	movq	%rsi, %r8	 ; <retval>,
	movq	%rdi, %rdx	 ; left,
	movl	$24, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp154, inst
	jmp	.L586	 ;
.L590:
	movl	$0, %ebp	 ;, _62
	jmp	.L584	 ;
.L573:
 ; ./asm_test/win/i/all.c:3169:         case OP_SUB_ASSIGN: return INST_SUB;
	movl	$1, %ebp	 ;, _62
	jmp	.L572	 ;
.L589:
 ; ./asm_test/win/i/all.c:3165:     switch (op) {
	movl	$2, %ebp	 ;, _62
	jmp	.L572	 ;
.L575:
 ; ./asm_test/win/i/all.c:3684:     Arg* left = tac_expression(expression->expr_left, status);
	movq	(%rsi), %rcx	 ; expression_31(D)->expr_left, expression_31(D)->expr_left
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rdi	 ; tmp160, left
 ; ./asm_test/win/i/all.c:3686:     if (expression->operator == OP_ASSIGN || expression->operator == OP_ADD_ASSIGN || expression->operator == OP_SUB_ASSIGN || expression->operator == OP_MUL_ASSIGN || expression->operator == OP_DIV_ASSIGN || expression->operator == OP_MOD_ASSIGN) {
	movl	24(%rsi), %eax	 ; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	 ;, tmp140
 ; ./asm_test/win/i/all.c:3686:     if (expression->operator == OP_ASSIGN || expression->operator == OP_ADD_ASSIGN || expression->operator == OP_SUB_ASSIGN || expression->operator == OP_MUL_ASSIGN || expression->operator == OP_DIV_ASSIGN || expression->operator == OP_MOD_ASSIGN) {
	cmpl	$5, %eax	 ;, tmp140
	ja	.L596	 ;,
 ; ./asm_test/win/i/all.c:3682:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%r12, %rsi	 ; right, <retval>
	jmp	.L588	 ;
.L596:
 ; ./asm_test/win/i/all.c:3176:         case OP_ASSIGN: return INST_ASSIGN;
	movl	$14, %ebp	 ;, _62
	jmp	.L584	 ;
	.section .rdata,"dr"
	.align 8
.LC116:
	.ascii "Error: create_attribute received NULL table\12\0"
	.align 8
.LC117:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.text
	.def	tac_variable;	.scl	3;	.type	32;	.endef
tac_variable:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp125, variable
	movq	%rdx, %rbx	 ; tmp126, status
 ; ./asm_test/win/i/all.c:3480:     if (is_attr) {
	testb	%r8b, %r8b	 ; tmp127
	je	.L598	 ;,
 ; ./asm_test/win/i/all.c:3481:         AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rdx), %rax	 ; status_21(D)->tac, status_21(D)->tac
	movq	(%rax), %rcx	 ; _1->attribute_tables, _1->attribute_tables
	call	list_pop_back	 ;
	movq	%rax, %rdi	 ; tmp128, attr_table
 ; ./asm_test/win/i/all.c:3482:         list_append(status->tac->attribute_tables, (size_t*)attr_table);
	movq	(%rbx), %rax	 ; status_21(D)->tac, status_21(D)->tac
	movq	(%rax), %rcx	 ; _3->attribute_tables, _3->attribute_tables
	movq	%rdi, %rdx	 ; attr_table,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3483:         create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	(%rsi), %r12	 ; variable_20(D)->type, _5
	movq	8(%rsi), %rbp	 ; variable_20(D)->name, _6
 ; ./asm_test/win/i/all.c:3308:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp129, attr
 ; ./asm_test/win/i/all.c:3309:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rbx, %r9	 ; status,
	movl	$97, %r8d	 ;,
	movq	%r12, %rdx	 ; _5,
	movq	%rbp, %rcx	 ; _6,
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3309:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rax, (%rsi)	 ; tmp130, attr_38->var
 ; ./asm_test/win/i/all.c:3310:     attr->type = type;
	movq	%r12, 8(%rsi)	 ; _5, attr_38->type
 ; ./asm_test/win/i/all.c:3311:     attr->offset = offset;
	movq	$0, 16(%rsi)	 ;, attr_38->offset
 ; ./asm_test/win/i/all.c:3312:     if (offset == 0 && table != NULL) {
	testq	%rdi, %rdi	 ; attr_table
	jne	.L607	 ;,
 ; ./asm_test/win/i/all.c:3316:         fprintf(stderr, "Error: create_attribute received NULL table\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp132
 ; ./asm_test/win/i/all.c:3316:         fprintf(stderr, "Error: create_attribute received NULL table\n");
	movl	$44, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC116(%rip), %rcx	 ;, tmp117
	call	fwrite	 ;
.L600:
 ; ./asm_test/win/i/all.c:3318:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp133
 ; ./asm_test/win/i/all.c:3318:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movl	$63, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC117(%rip), %rcx	 ;, tmp119
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:3318:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	jmp	.L597	 ;
.L607:
 ; ./asm_test/win/i/all.c:3313:         attr->offset = table->size;
	movq	16(%rdi), %rax	 ; attr_table_35->size, _43
 ; ./asm_test/win/i/all.c:3313:         attr->offset = table->size;
	movq	%rax, 16(%rsi)	 ; _43, attr_38->offset
 ; ./asm_test/win/i/all.c:3314:         table->size += get_type_size(type);
	movq	%r12, %rcx	 ; _5,
	call	get_type_size	 ;
 ; ./asm_test/win/i/all.c:3314:         table->size += get_type_size(type);
	addq	%rax, 16(%rdi)	 ; tmp131, attr_table_35->size
 ; ./asm_test/win/i/all.c:3317:     if (table == NULL || table->attributes == NULL)
	movq	(%rdi), %rcx	 ; attr_table_35->attributes, _48
 ; ./asm_test/win/i/all.c:3317:     if (table == NULL || table->attributes == NULL)
	testq	%rcx, %rcx	 ; _48
	je	.L600	 ;,
 ; ./asm_test/win/i/all.c:3320:         list_append(table->attributes, (size_t*)attr);
	movq	%rsi, %rdx	 ; attr,
	call	list_append	 ;
	jmp	.L597	 ;
.L598:
 ; ./asm_test/win/i/all.c:3485:         var = create_var(variable->name, variable->type, VAR_VAR, status);
	movq	(%rcx), %rdx	 ; variable_20(D)->type, variable_20(D)->type
	movq	8(%rcx), %rcx	 ; variable_20(D)->name, variable_20(D)->name
	movq	%rbx, %r9	 ; status,
	movl	$118, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdi	 ; tmp134, var
 ; ./asm_test/win/i/all.c:3487:         if (variable->value != NULL)
	movq	16(%rsi), %rcx	 ; variable_20(D)->value, _9
 ; ./asm_test/win/i/all.c:3487:         if (variable->value != NULL)
	testq	%rcx, %rcx	 ; _9
	je	.L603	 ;,
 ; ./asm_test/win/i/all.c:3488:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp135, _10
 ; ./asm_test/win/i/all.c:3488:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rsi	 ; tmp136, value
.L604:
 ; ./asm_test/win/i/all.c:3491:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	%rdi, %rdx	 ; var,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp138, _11
 ; ./asm_test/win/i/all.c:3491:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movl	$0, %r9d	 ;,
	movq	%rsi, %r8	 ; value,
	movl	$14, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp139, _12
 ; ./asm_test/win/i/all.c:3491:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	16(%rbx), %rax	 ; status_21(D)->current_block, status_21(D)->current_block
	movq	8(%rax), %rcx	 ; _13->instructions, _13->instructions
	call	list_append	 ;
.L597:
 ; ./asm_test/win/i/all.c:3493: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L603:
 ; ./asm_test/win/i/all.c:3490:             value = create_arg(ARG_INT, &(long long){0});
	movq	$0, 40(%rsp)	 ;, D.8865
 ; ./asm_test/win/i/all.c:3490:             value = create_arg(ARG_INT, &(long long){0});
	leaq	40(%rsp), %rdx	 ;, tmp122
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp137, value
	jmp	.L604	 ;
	.section .rdata,"dr"
	.align 8
.LC118:
	.ascii "[Warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC119:
	.ascii "[Warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC120:
	.ascii "[Warning] Unsupported statement type for tac_statement: %d\12\0"
	.text
	.def	tac_statement;	.scl	3;	.type	32;	.endef
tac_statement:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3495:     switch (statement->type) {
	movl	8(%rcx), %esi	 ; statement_30(D)->type, _1
 ; ./asm_test/win/i/all.c:3495:     switch (statement->type) {
	cmpl	$7, %esi	 ;, _1
	ja	.L609	 ;,
	movq	%rcx, %rdi	 ; tmp376, statement
	movq	%rdx, %rbx	 ; tmp377, status
	movl	%esi, %esi	 ; _1, _1
	leaq	.L611(%rip), %rdx	 ;, tmp287
	movslq	(%rdx,%rsi,4), %rax	 ;, tmp289
	addq	%rdx, %rax	 ; tmp287, tmp290
	jmp	*%rax	 ; tmp290
	.section .rdata,"dr"
	.align 4
.L611:
	.long	.L618-.L611
	.long	.L617-.L611
	.long	.L616-.L611
	.long	.L615-.L611
	.long	.L614-.L611
	.long	.L613-.L611
	.long	.L612-.L611
	.long	.L610-.L611
	.text
.L618:
 ; ./asm_test/win/i/all.c:3496:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.expr, statement_30(D)->stmt.expr
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp378, _3
 ; ./asm_test/win/i/all.c:3496:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
.L608:
 ; ./asm_test/win/i/all.c:3534: }
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
.L617:
 ; ./asm_test/win/i/all.c:3497:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, 0); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.var, statement_30(D)->stmt.var
	movl	$0, %r8d	 ;,
	movq	%rbx, %rdx	 ; status,
	call	tac_variable	 ;
 ; ./asm_test/win/i/all.c:3497:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, 0); break;
	jmp	.L608	 ;
.L616:
 ; ./asm_test/win/i/all.c:3498:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	(%rcx), %r12	 ; statement_30(D)->stmt.if_stmt, _5
 ; ./asm_test/win/i/all.c:3536:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdi	 ; tmp379, then_label
 ; ./asm_test/win/i/all.c:3537:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rsi	 ; tmp380, else_label
 ; ./asm_test/win/i/all.c:3539:     if ((if_->else_if == NULL || if_->else_if->head == NULL || if_->else_if->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	movq	16(%r12), %rax	 ; _5->else_if, _61
 ; ./asm_test/win/i/all.c:3539:     if ((if_->else_if == NULL || if_->else_if->head == NULL || if_->else_if->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	testq	%rax, %rax	 ; _61
	je	.L620	 ;,
 ; ./asm_test/win/i/all.c:3539:     if ((if_->else_if == NULL || if_->else_if->head == NULL || if_->else_if->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	cmpq	$0, (%rax)	 ;, _61->head
	je	.L620	 ;,
 ; ./asm_test/win/i/all.c:3539:     if ((if_->else_if == NULL || if_->else_if->head == NULL || if_->else_if->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	cmpq	$0, 8(%rax)	 ;, _61->tail
	je	.L620	 ;,
.L621:
 ; ./asm_test/win/i/all.c:3542:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %r14	 ; tmp381, end_label
.L622:
 ; ./asm_test/win/i/all.c:3543:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	%r14, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r15	 ; tmp382, end_block_arg
 ; ./asm_test/win/i/all.c:3544:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	(%r12), %rcx	 ; _5->condition, _5->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp383, _71
 ; ./asm_test/win/i/all.c:3544:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rbp	 ; tmp384, condition
 ; ./asm_test/win/i/all.c:3545:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rsi, %rdx	 ; else_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r13	 ; tmp385, _73
 ; ./asm_test/win/i/all.c:3545:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rdi, %rdx	 ; then_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp386
 ; ./asm_test/win/i/all.c:3545:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r13, %r9	 ; _73,
	movq	%rbp, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp387, inst
 ; ./asm_test/win/i/all.c:3546:     list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _76->instructions, _76->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3547:     Block* then_block = create_block(then_label);
	movq	%rdi, %rcx	 ; then_label,
	call	create_block	 ;
	movq	%rax, %rdi	 ; tmp388, then_block
 ; ./asm_test/win/i/all.c:3548:     list_append(status->current_subroutine->blocks, (size_t*)then_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _79->blocks, _79->blocks
	movq	%rdi, %rdx	 ; then_block,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3549:     status->current_block = then_block;
	movq	%rdi, 16(%rbx)	 ; then_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3550:     List* then_statements = list_copy(if_->body);
	movq	8(%r12), %rcx	 ; _5->body, _5->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp389, then_statements
.L623:
 ; ./asm_test/win/i/all.c:3552:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%rdi, %rcx	 ; then_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp390, statement
 ; ./asm_test/win/i/all.c:3552:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L657	 ;,
 ; ./asm_test/win/i/all.c:3553:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L623	 ;
.L620:
 ; ./asm_test/win/i/all.c:3539:     if ((if_->else_if == NULL || if_->else_if->head == NULL || if_->else_if->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	movq	24(%r12), %rax	 ; _5->else_body, _64
 ; ./asm_test/win/i/all.c:3540:         end_label = else_label;
	movq	%rsi, %r14	 ; else_label, end_label
 ; ./asm_test/win/i/all.c:3539:     if ((if_->else_if == NULL || if_->else_if->head == NULL || if_->else_if->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	testq	%rax, %rax	 ; _64
	je	.L622	 ;,
 ; ./asm_test/win/i/all.c:3539:     if ((if_->else_if == NULL || if_->else_if->head == NULL || if_->else_if->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	cmpq	$0, (%rax)	 ;, _64->head
	je	.L622	 ;,
 ; ./asm_test/win/i/all.c:3539:     if ((if_->else_if == NULL || if_->else_if->head == NULL || if_->else_if->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	cmpq	$0, 8(%rax)	 ;, _64->tail
	jne	.L621	 ;,
	jmp	.L622	 ;
.L657:
 ; ./asm_test/win/i/all.c:3554:     Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%r15, %rdx	 ; end_block_arg,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp391, jump_to_end
 ; ./asm_test/win/i/all.c:3555:     list_append(status->current_block->instructions, (size_t*)jump_to_end);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _85->instructions, _85->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3556:     if (if_->else_if != NULL && if_->else_if->head != NULL && if_->else_if->tail != NULL) {
	movq	16(%r12), %rcx	 ; _5->else_if, _87
 ; ./asm_test/win/i/all.c:3556:     if (if_->else_if != NULL && if_->else_if->head != NULL && if_->else_if->tail != NULL) {
	testq	%rcx, %rcx	 ; _87
	je	.L625	 ;,
 ; ./asm_test/win/i/all.c:3556:     if (if_->else_if != NULL && if_->else_if->head != NULL && if_->else_if->tail != NULL) {
	cmpq	$0, (%rcx)	 ;, _87->head
	je	.L625	 ;,
 ; ./asm_test/win/i/all.c:3556:     if (if_->else_if != NULL && if_->else_if->head != NULL && if_->else_if->tail != NULL) {
	cmpq	$0, 8(%rcx)	 ;, _87->tail
	je	.L625	 ;,
 ; ./asm_test/win/i/all.c:3557:         List* elif_list = list_copy(if_->else_if);
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp392, elif_list
 ; ./asm_test/win/i/all.c:3559:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	jmp	.L626	 ;
.L627:
 ; ./asm_test/win/i/all.c:3566:             if ((elif_list == NULL || elif_list->head == NULL || elif_list->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	movq	24(%r12), %rax	 ; _5->else_body, _103
 ; ./asm_test/win/i/all.c:3566:             if ((elif_list == NULL || elif_list->head == NULL || elif_list->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	testq	%rax, %rax	 ; _103
	je	.L653	 ;,
 ; ./asm_test/win/i/all.c:3566:             if ((elif_list == NULL || elif_list->head == NULL || elif_list->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	cmpq	$0, (%rax)	 ;, _103->head
	je	.L654	 ;,
 ; ./asm_test/win/i/all.c:3567:                 else_label = end_label;
	cmpq	$0, 8(%rax)	 ;, _103->tail
	cmove	%r14, %rsi	 ; else_label,, end_label, else_label
	jmp	.L628	 ;
.L653:
	movq	%r14, %rsi	 ; end_label, else_label
	jmp	.L628	 ;
.L654:
	movq	%r14, %rsi	 ; end_label, else_label
	jmp	.L628	 ;
.L658:
 ; ./asm_test/win/i/all.c:3577:             jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%r15, %rdx	 ; end_block_arg,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp404, jump_to_end
 ; ./asm_test/win/i/all.c:3578:             list_append(status->current_block->instructions, (size_t*)jump_to_end);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _119->instructions, _119->instructions
	call	list_append	 ;
.L626:
 ; ./asm_test/win/i/all.c:3559:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	%r13, %rcx	 ; elif_list,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp405, elif
 ; ./asm_test/win/i/all.c:3559:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	 ; elif
	je	.L625	 ;,
 ; ./asm_test/win/i/all.c:3560:             Block* else_if_block = create_block(else_label);
	movq	%rsi, %rcx	 ; else_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp393, else_if_block
 ; ./asm_test/win/i/all.c:3561:             list_append(status->current_subroutine->blocks, (size_t*)else_if_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _93->blocks, _93->blocks
	movq	%rsi, %rdx	 ; else_if_block,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3562:             status->current_block = else_if_block;
	movq	%rsi, 16(%rbx)	 ; else_if_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3563:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rbp	 ; tmp394, then_label
 ; ./asm_test/win/i/all.c:3564:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rsi	 ; tmp395, else_label
 ; ./asm_test/win/i/all.c:3565:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	(%rdi), %rcx	 ; elif_97->condition, elif_97->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp396, _99
 ; ./asm_test/win/i/all.c:3565:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, 32(%rsp)	 ; tmp397, %sfp
 ; ./asm_test/win/i/all.c:3566:             if ((elif_list == NULL || elif_list->head == NULL || elif_list->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	testq	%r13, %r13	 ; elif_list
	je	.L627	 ;,
 ; ./asm_test/win/i/all.c:3566:             if ((elif_list == NULL || elif_list->head == NULL || elif_list->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	cmpq	$0, 0(%r13)	 ;, elif_list_90->head
	je	.L627	 ;,
 ; ./asm_test/win/i/all.c:3566:             if ((elif_list == NULL || elif_list->head == NULL || elif_list->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	cmpq	$0, 8(%r13)	 ;, elif_list_90->tail
	je	.L627	 ;,
.L628:
 ; ./asm_test/win/i/all.c:3568:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rsi, %rdx	 ; else_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, 40(%rsp)	 ; tmp398, %sfp
 ; ./asm_test/win/i/all.c:3568:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rbp, %rdx	 ; then_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp399
 ; ./asm_test/win/i/all.c:3568:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	40(%rsp), %r9	 ; %sfp,
	movq	32(%rsp), %rdx	 ; %sfp,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp400, inst
 ; ./asm_test/win/i/all.c:3569:             list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _110->instructions, _110->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3570:             then_block = create_block(then_label);
	movq	%rbp, %rcx	 ; then_label,
	call	create_block	 ;
	movq	%rax, %rbp	 ; tmp401, then_block
 ; ./asm_test/win/i/all.c:3571:             list_append(status->current_subroutine->blocks, (size_t*)then_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _113->blocks, _113->blocks
	movq	%rbp, %rdx	 ; then_block,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3572:             status->current_block = then_block;
	movq	%rbp, 16(%rbx)	 ; then_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3573:             List* elif_statements = list_copy(elif->body);
	movq	8(%rdi), %rcx	 ; elif_97->body, elif_97->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp402, elif_statements
.L629:
 ; ./asm_test/win/i/all.c:3575:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%rdi, %rcx	 ; elif_statements,
	call	list_pop	 ;
 ; ./asm_test/win/i/all.c:3575:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	 ; elif_statement
	je	.L658	 ;,
 ; ./asm_test/win/i/all.c:3576:                 tac_statement(elif_statement, status);
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; elif_statement,
	call	tac_statement	 ;
	jmp	.L629	 ;
.L625:
 ; ./asm_test/win/i/all.c:3581:     if (if_->else_body != NULL && if_->else_body->head != NULL && if_->else_body->tail != NULL) {
	movq	24(%r12), %rax	 ; _5->else_body, _121
 ; ./asm_test/win/i/all.c:3581:     if (if_->else_body != NULL && if_->else_body->head != NULL && if_->else_body->tail != NULL) {
	testq	%rax, %rax	 ; _121
	je	.L632	 ;,
 ; ./asm_test/win/i/all.c:3581:     if (if_->else_body != NULL && if_->else_body->head != NULL && if_->else_body->tail != NULL) {
	cmpq	$0, (%rax)	 ;, _121->head
	je	.L632	 ;,
 ; ./asm_test/win/i/all.c:3581:     if (if_->else_body != NULL && if_->else_body->head != NULL && if_->else_body->tail != NULL) {
	cmpq	$0, 8(%rax)	 ;, _121->tail
	je	.L632	 ;,
 ; ./asm_test/win/i/all.c:3582:         Block* else_block = create_block(else_label);
	movq	%rsi, %rcx	 ; else_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp406, else_block
 ; ./asm_test/win/i/all.c:3583:         list_append(status->current_subroutine->blocks, (size_t*)else_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _126->blocks, _126->blocks
	movq	%rsi, %rdx	 ; else_block,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3584:         status->current_block = else_block;
	movq	%rsi, 16(%rbx)	 ; else_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3585:         List* else_statements = list_copy(if_->else_body);
	movq	24(%r12), %rcx	 ; _5->else_body, _5->else_body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp407, else_statements
 ; ./asm_test/win/i/all.c:3587:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L633	 ;
.L634:
 ; ./asm_test/win/i/all.c:3588:             tac_statement(else_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L633:
 ; ./asm_test/win/i/all.c:3587:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rsi, %rcx	 ; else_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp408, else_statement
 ; ./asm_test/win/i/all.c:3587:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	 ; else_statement
	jne	.L634	 ;,
 ; ./asm_test/win/i/all.c:3589:         jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%r15, %rdx	 ; end_block_arg,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp409, jump_to_end
 ; ./asm_test/win/i/all.c:3590:         list_append(status->current_block->instructions, (size_t*)jump_to_end);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _132->instructions, _132->instructions
	call	list_append	 ;
.L632:
 ; ./asm_test/win/i/all.c:3592:     Block* end_block = create_block(end_label);
	movq	%r14, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp410, end_block
 ; ./asm_test/win/i/all.c:3593:     list_append(status->current_subroutine->blocks, (size_t*)end_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _135->blocks, _135->blocks
	movq	%rsi, %rdx	 ; end_block,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3594:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; end_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3595: }
	jmp	.L608	 ;
.L615:
 ; ./asm_test/win/i/all.c:3499:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	(%rcx), %r12	 ; statement_30(D)->stmt.while_stmt, _6
 ; ./asm_test/win/i/all.c:3649:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdi	 ; tmp411, condition_label
 ; ./asm_test/win/i/all.c:3650:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp412, _138
 ; ./asm_test/win/i/all.c:3650:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp413, inst
 ; ./asm_test/win/i/all.c:3651:     list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _140->instructions, _140->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3652:     Block* condition_block = create_block(condition_label);
	movq	%rdi, %rcx	 ; condition_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp414, condition_block
 ; ./asm_test/win/i/all.c:3653:     list_append(status->current_subroutine->blocks, (size_t*)condition_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _143->blocks, _143->blocks
	movq	%rsi, %rdx	 ; condition_block,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3654:     status->current_block = condition_block;
	movq	%rsi, 16(%rbx)	 ; condition_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3655:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rsi	 ; tmp415, body_label
 ; ./asm_test/win/i/all.c:3656:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rbp	 ; tmp416, end_label
 ; ./asm_test/win/i/all.c:3657:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	(%r12), %rcx	 ; _6->condition, _6->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp417, _148
 ; ./asm_test/win/i/all.c:3657:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %r13	 ; tmp418, condition
 ; ./asm_test/win/i/all.c:3658:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rbp, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r14	 ; tmp419, _150
 ; ./asm_test/win/i/all.c:3658:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rsi, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp420
 ; ./asm_test/win/i/all.c:3658:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r14, %r9	 ; _150,
	movq	%r13, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp421, inst
 ; ./asm_test/win/i/all.c:3659:     list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _153->instructions, _153->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3660:     Block* body_block = create_block(body_label);
	movq	%rsi, %rcx	 ; body_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp422, body_block
 ; ./asm_test/win/i/all.c:3661:     list_append(status->current_subroutine->blocks, (size_t*)body_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _156->blocks, _156->blocks
	movq	%rsi, %rdx	 ; body_block,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3662:     status->current_block = body_block;
	movq	%rsi, 16(%rbx)	 ; body_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3663:     list_append(status->start_labels, (size_t*)create_arg(ARG_LABEL, condition_label));
	movq	%rdi, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp423, _158
 ; ./asm_test/win/i/all.c:3663:     list_append(status->start_labels, (size_t*)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rcx	 ; status_31(D)->start_labels, status_31(D)->start_labels
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3664:     list_append(status->end_labels, (size_t*)create_arg(ARG_LABEL, end_label));
	movq	%rbp, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp424, _160
 ; ./asm_test/win/i/all.c:3664:     list_append(status->end_labels, (size_t*)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rcx	 ; status_31(D)->end_labels, status_31(D)->end_labels
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3665:     List* body_statements = list_copy(while_->body);
	movq	8(%r12), %rcx	 ; _6->body, _6->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp425, body_statements
.L635:
 ; ./asm_test/win/i/all.c:3667:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rsi, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp426, statement
 ; ./asm_test/win/i/all.c:3667:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L659	 ;,
 ; ./asm_test/win/i/all.c:3668:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L635	 ;
.L659:
 ; ./asm_test/win/i/all.c:3669:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rcx	 ; status_31(D)->start_labels, status_31(D)->start_labels
	call	list_pop_back	 ;
 ; ./asm_test/win/i/all.c:3670:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rcx	 ; status_31(D)->end_labels, status_31(D)->end_labels
	call	list_pop_back	 ;
 ; ./asm_test/win/i/all.c:3671:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rdi, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp427, _167
 ; ./asm_test/win/i/all.c:3671:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp428, inst
 ; ./asm_test/win/i/all.c:3672:     list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _169->instructions, _169->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3673:     Block* end_block = create_block(end_label);
	movq	%rbp, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp429, end_block
 ; ./asm_test/win/i/all.c:3674:     list_append(status->current_subroutine->blocks, (size_t*)end_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _172->blocks, _172->blocks
	movq	%rsi, %rdx	 ; end_block,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3675:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; end_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3676: }
	jmp	.L608	 ;
.L614:
 ; ./asm_test/win/i/all.c:3500:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	(%rcx), %rdi	 ; statement_30(D)->stmt.for_stmt, _7
 ; ./asm_test/win/i/all.c:3597:     if (for_->initializer != NULL)
	movq	(%rdi), %rcx	 ; _7->initializer, _174
 ; ./asm_test/win/i/all.c:3597:     if (for_->initializer != NULL)
	testq	%rcx, %rcx	 ; _174
	je	.L637	 ;,
 ; ./asm_test/win/i/all.c:3598:         tac_variable(for_->initializer, status, 0);
	movl	$0, %r8d	 ;,
	movq	%rbx, %rdx	 ; status,
	call	tac_variable	 ;
.L637:
 ; ./asm_test/win/i/all.c:3599:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rbp	 ; tmp430, condition_label
 ; ./asm_test/win/i/all.c:3600:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %r13	 ; tmp431, body_label
 ; ./asm_test/win/i/all.c:3601:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %r12	 ; tmp432, end_label
 ; ./asm_test/win/i/all.c:3602:     if (for_->condition != NULL) {
	cmpq	$0, 8(%rdi)	 ;, _7->condition
	je	.L638	 ;,
 ; ./asm_test/win/i/all.c:3603:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rbp, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp433, _179
 ; ./asm_test/win/i/all.c:3603:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp434, inst
 ; ./asm_test/win/i/all.c:3604:         list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _181->instructions, _181->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3605:         Block* condition_block = create_block(condition_label);
	movq	%rbp, %rcx	 ; condition_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp435, condition_block
 ; ./asm_test/win/i/all.c:3606:         list_append(status->current_subroutine->blocks, (size_t*)condition_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _184->blocks, _184->blocks
	movq	%rsi, %rdx	 ; condition_block,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3607:         status->current_block = condition_block;
	movq	%rsi, 16(%rbx)	 ; condition_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3608:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	8(%rdi), %rcx	 ; _7->condition, _7->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp436, _187
 ; ./asm_test/win/i/all.c:3608:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rsi	 ; tmp437, condition
 ; ./asm_test/win/i/all.c:3609:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r14	 ; tmp438, _189
 ; ./asm_test/win/i/all.c:3609:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r13, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp439
 ; ./asm_test/win/i/all.c:3609:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r14, %r9	 ; _189,
	movq	%rsi, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp440, inst
 ; ./asm_test/win/i/all.c:3610:         list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _192->instructions, _192->instructions
	call	list_append	 ;
.L639:
 ; ./asm_test/win/i/all.c:3615:     Block* body_block = create_block(body_label);
	movq	%r13, %rcx	 ; body_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp443, body_block
 ; ./asm_test/win/i/all.c:3616:     list_append(status->current_subroutine->blocks, (size_t*)body_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _199->blocks, _199->blocks
	movq	%rsi, %rdx	 ; body_block,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3617:     status->current_block = body_block;
	movq	%rsi, 16(%rbx)	 ; body_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3618:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %r14	 ; tmp444, increment_label
 ; ./asm_test/win/i/all.c:3619:     if (for_->increment != NULL)
	cmpq	$0, 16(%rdi)	 ;, _7->increment
	je	.L640	 ;,
 ; ./asm_test/win/i/all.c:3620:         list_append(status->start_labels, (size_t*)create_arg(ARG_LABEL, increment_label));
	movq	%rax, %rdx	 ; increment_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp445, _203
 ; ./asm_test/win/i/all.c:3620:         list_append(status->start_labels, (size_t*)create_arg(ARG_LABEL, increment_label));
	movq	40(%rbx), %rcx	 ; status_31(D)->start_labels, status_31(D)->start_labels
	call	list_append	 ;
.L641:
 ; ./asm_test/win/i/all.c:3625:     list_append(status->end_labels, (size_t*)create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp448, _210
 ; ./asm_test/win/i/all.c:3625:     list_append(status->end_labels, (size_t*)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rcx	 ; status_31(D)->end_labels, status_31(D)->end_labels
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3626:     List* body_statements = list_copy(for_->body);
	movq	24(%rdi), %rcx	 ; _7->body, _7->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp449, body_statements
 ; ./asm_test/win/i/all.c:3628:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L643	 ;
.L638:
 ; ./asm_test/win/i/all.c:3612:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%r13, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp441, _194
 ; ./asm_test/win/i/all.c:3612:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp442, inst
 ; ./asm_test/win/i/all.c:3613:         list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _196->instructions, _196->instructions
	call	list_append	 ;
	jmp	.L639	 ;
.L640:
 ; ./asm_test/win/i/all.c:3621:     else if (for_->condition != NULL)
	cmpq	$0, 8(%rdi)	 ;, _7->condition
	je	.L642	 ;,
 ; ./asm_test/win/i/all.c:3622:         list_append(status->start_labels, (size_t*)create_arg(ARG_LABEL, condition_label));
	movq	%rbp, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp446, _206
 ; ./asm_test/win/i/all.c:3622:         list_append(status->start_labels, (size_t*)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rcx	 ; status_31(D)->start_labels, status_31(D)->start_labels
	call	list_append	 ;
	jmp	.L641	 ;
.L642:
 ; ./asm_test/win/i/all.c:3624:         list_append(status->start_labels, (size_t*)create_arg(ARG_LABEL, body_label));
	movq	%r13, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp447, _208
 ; ./asm_test/win/i/all.c:3624:         list_append(status->start_labels, (size_t*)create_arg(ARG_LABEL, body_label));
	movq	40(%rbx), %rcx	 ; status_31(D)->start_labels, status_31(D)->start_labels
	call	list_append	 ;
	jmp	.L641	 ;
.L644:
 ; ./asm_test/win/i/all.c:3629:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L643:
 ; ./asm_test/win/i/all.c:3628:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rsi, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp450, statement
 ; ./asm_test/win/i/all.c:3628:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L644	 ;,
 ; ./asm_test/win/i/all.c:3630:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rcx	 ; status_31(D)->start_labels, status_31(D)->start_labels
	call	list_pop_back	 ;
 ; ./asm_test/win/i/all.c:3631:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rcx	 ; status_31(D)->end_labels, status_31(D)->end_labels
	call	list_pop_back	 ;
 ; ./asm_test/win/i/all.c:3632:     if (for_->increment != NULL) {
	cmpq	$0, 16(%rdi)	 ;, _7->increment
	je	.L645	 ;,
 ; ./asm_test/win/i/all.c:3633:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	%r14, %rdx	 ; increment_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp451, _218
 ; ./asm_test/win/i/all.c:3633:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp452, inst
 ; ./asm_test/win/i/all.c:3634:         list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _220->instructions, _220->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3635:         Block* increment_block = create_block(increment_label);
	movq	%r14, %rcx	 ; increment_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp453, increment_block
 ; ./asm_test/win/i/all.c:3636:         list_append(status->current_subroutine->blocks, (size_t*)increment_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _223->blocks, _223->blocks
	movq	%rsi, %rdx	 ; increment_block,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3637:         status->current_block = increment_block;
	movq	%rsi, 16(%rbx)	 ; increment_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3638:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	16(%rdi), %rcx	 ; _7->increment, _7->increment
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp454, _226
 ; ./asm_test/win/i/all.c:3638:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
.L645:
 ; ./asm_test/win/i/all.c:3640:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rbp, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp455, _227
 ; ./asm_test/win/i/all.c:3640:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp456, inst
 ; ./asm_test/win/i/all.c:3641:     if (for_->condition == NULL)
	cmpq	$0, 8(%rdi)	 ;, _7->condition
	je	.L660	 ;,
.L646:
 ; ./asm_test/win/i/all.c:3643:     list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _232->instructions, _232->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3644:     Block* end_block = create_block(end_label);
	movq	%r12, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp459, end_block
 ; ./asm_test/win/i/all.c:3645:     list_append(status->current_subroutine->blocks, (size_t*)end_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _236->blocks, _236->blocks
	movq	%rsi, %rdx	 ; end_block,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3646:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; end_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3647: }
	jmp	.L608	 ;
.L660:
 ; ./asm_test/win/i/all.c:3642:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%r13, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp457, _230
 ; ./asm_test/win/i/all.c:3642:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp458, inst
	jmp	.L646	 ;
.L613:
 ; ./asm_test/win/i/all.c:3502:             Arg* return_value = create_arg(ARG_VOID, NULL);
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3503:             if (statement->stmt.return_expr != NULL)
	movq	(%rdi), %rcx	 ; statement_30(D)->stmt.return_expr, _8
 ; ./asm_test/win/i/all.c:3503:             if (statement->stmt.return_expr != NULL)
	testq	%rcx, %rcx	 ; _8
	je	.L647	 ;,
 ; ./asm_test/win/i/all.c:3504:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp461, _9
 ; ./asm_test/win/i/all.c:3504:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
.L647:
 ; ./asm_test/win/i/all.c:3505:             list_append(status->current_block->instructions, (size_t*)create_instruction(INST_RET, return_value, NULL, NULL));
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; return_value,
	movl	$21, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp463, _10
 ; ./asm_test/win/i/all.c:3505:             list_append(status->current_block->instructions, (size_t*)create_instruction(INST_RET, return_value, NULL, NULL));
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _11->instructions, _11->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3506:             break;
	jmp	.L608	 ;
.L612:
 ; ./asm_test/win/i/all.c:3509:             if (status->end_labels != NULL && status->end_labels->head != NULL && status->end_labels->tail != NULL) {
	movq	32(%rbx), %rax	 ; status_31(D)->end_labels, _13
 ; ./asm_test/win/i/all.c:3509:             if (status->end_labels != NULL && status->end_labels->head != NULL && status->end_labels->tail != NULL) {
	testq	%rax, %rax	 ; _13
	je	.L648	 ;,
 ; ./asm_test/win/i/all.c:3509:             if (status->end_labels != NULL && status->end_labels->head != NULL && status->end_labels->tail != NULL) {
	cmpq	$0, (%rax)	 ;, _13->head
	je	.L648	 ;,
 ; ./asm_test/win/i/all.c:3509:             if (status->end_labels != NULL && status->end_labels->head != NULL && status->end_labels->tail != NULL) {
	movq	8(%rax), %rax	 ; _13->tail, _15
 ; ./asm_test/win/i/all.c:3509:             if (status->end_labels != NULL && status->end_labels->head != NULL && status->end_labels->tail != NULL) {
	testq	%rax, %rax	 ; _15
	je	.L648	 ;,
 ; ./asm_test/win/i/all.c:3510:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rdx	 ; _15->content, label
 ; ./asm_test/win/i/all.c:3511:                 if (label != NULL) {
	testq	%rdx, %rdx	 ; label
	je	.L648	 ;,
 ; ./asm_test/win/i/all.c:3512:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp464, inst
 ; ./asm_test/win/i/all.c:3513:                     list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _16->instructions, _16->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3514:                     break;
	jmp	.L608	 ;
.L648:
 ; ./asm_test/win/i/all.c:3517:             fprintf(stderr, "[Warning] 'break' statement used outside of loop\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp465
 ; ./asm_test/win/i/all.c:3517:             fprintf(stderr, "[Warning] 'break' statement used outside of loop\n");
	movl	$49, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC118(%rip), %rcx	 ;, tmp369
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:3518:             break;
	jmp	.L608	 ;
.L610:
 ; ./asm_test/win/i/all.c:3520:             if (status->start_labels != NULL && status->start_labels->head != NULL && status->start_labels->tail != NULL) {
	movq	40(%rbx), %rax	 ; status_31(D)->start_labels, _19
 ; ./asm_test/win/i/all.c:3520:             if (status->start_labels != NULL && status->start_labels->head != NULL && status->start_labels->tail != NULL) {
	testq	%rax, %rax	 ; _19
	je	.L649	 ;,
 ; ./asm_test/win/i/all.c:3520:             if (status->start_labels != NULL && status->start_labels->head != NULL && status->start_labels->tail != NULL) {
	cmpq	$0, (%rax)	 ;, _19->head
	je	.L649	 ;,
 ; ./asm_test/win/i/all.c:3520:             if (status->start_labels != NULL && status->start_labels->head != NULL && status->start_labels->tail != NULL) {
	movq	8(%rax), %rax	 ; _19->tail, _21
 ; ./asm_test/win/i/all.c:3520:             if (status->start_labels != NULL && status->start_labels->head != NULL && status->start_labels->tail != NULL) {
	testq	%rax, %rax	 ; _21
	je	.L649	 ;,
 ; ./asm_test/win/i/all.c:3521:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rdx	 ; _21->content, label
 ; ./asm_test/win/i/all.c:3522:                 if (label != NULL) {
	testq	%rdx, %rdx	 ; label
	je	.L649	 ;,
 ; ./asm_test/win/i/all.c:3523:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp466, inst
 ; ./asm_test/win/i/all.c:3524:                     list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _22->instructions, _22->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3525:                     break;
	jmp	.L608	 ;
.L649:
 ; ./asm_test/win/i/all.c:3528:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp467
 ; ./asm_test/win/i/all.c:3528:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC119(%rip), %rcx	 ;, tmp373
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:3529:             break;
	jmp	.L608	 ;
.L609:
 ; ./asm_test/win/i/all.c:3531:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp468, _25
 ; ./asm_test/win/i/all.c:3531:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movl	%esi, %r8d	 ; _1,
	leaq	.LC120(%rip), %rdx	 ;, tmp375
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3534: }
	jmp	.L608	 ;
	.section .rdata,"dr"
	.align 8
.LC121:
	.ascii "[Warning] Constructor '%s' does not start with 'self' initialization\12\0"
	.align 8
.LC122:
	.ascii "[Warning] Unsupported class member type for tac_class: %d\12\0"
	.text
	.def	tac_class;	.scl	3;	.type	32;	.endef
tac_class:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp175, class
	movq	%rdx, %rbx	 ; tmp176, status
 ; ./asm_test/win/i/all.c:3458:     status->current_class = class;
	movq	%rcx, 24(%rdx)	 ; class, status_12(D)->current_class
 ; ./asm_test/win/i/all.c:3459:     List* members = list_copy(class->members);
	movq	8(%rcx), %rcx	 ; class_13(D)->members, class_13(D)->members
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp177, members
 ; ./asm_test/win/i/all.c:3461:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	(%rsi), %rdi	 ; class_13(D)->name, _2
 ; ./asm_test/win/i/all.c:3144:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp178, table
 ; ./asm_test/win/i/all.c:3145:     table->attributes = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:3145:     table->attributes = create_list();
	movq	%rax, (%rsi)	 ; tmp179, table_27->attributes
 ; ./asm_test/win/i/all.c:3146:     table->name = name;
	movq	%rdi, 8(%rsi)	 ; _2, table_27->name
 ; ./asm_test/win/i/all.c:3147:     table->size = 0;
	movq	$0, 16(%rsi)	 ;, table_27->size
 ; ./asm_test/win/i/all.c:3462:     list_append(status->tac->attribute_tables, (size_t*)attr_table);
	movq	(%rbx), %rax	 ; status_12(D)->tac, status_12(D)->tac
	movq	(%rax), %rcx	 ; _3->attribute_tables, _3->attribute_tables
	movq	%rsi, %rdx	 ; table,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3472:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	movq	__imp___acrt_iob_func(%rip), %r14	 ;, tmp173
 ; ./asm_test/win/i/all.c:3472:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	leaq	.LC122(%rip), %r13	 ;, tmp174
 ; ./asm_test/win/i/all.c:3463:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	jmp	.L662	 ;
.L663:
 ; ./asm_test/win/i/all.c:3466:                 tac_method(member->content.method, status);
	movq	(%rax), %rbp	 ; member_21->content.method, _6
 ; ./asm_test/win/i/all.c:3432:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	8(%rbp), %rdx	 ; _6->return_type, _6->return_type
	movq	0(%rbp), %rcx	 ; _6->name, _6->name
	call	create_subroutine	 ;
	movq	%rax, %rsi	 ; tmp180, subroutine
 ; ./asm_test/win/i/all.c:3433:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	 ; subroutine, status_12(D)->current_subroutine
 ; ./asm_test/win/i/all.c:3434:     list_append(status->tac->subroutines, (size_t*)subroutine);
	movq	(%rbx), %rax	 ; status_12(D)->tac, status_12(D)->tac
	movq	24(%rax), %rcx	 ; _32->subroutines, _32->subroutines
	movq	%rsi, %rdx	 ; subroutine,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3435:     List* parameters = list_copy(method->parameters);
	movq	16(%rbp), %rcx	 ; _6->parameters, _6->parameters
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp181, parameters
 ; ./asm_test/win/i/all.c:3437:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L666	 ;
.L667:
 ; ./asm_test/win/i/all.c:3438:         list_append(subroutine->parameters, (size_t*)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rdx	 ; parameter_36->type, parameter_36->type
	movq	8(%rax), %rcx	 ; parameter_36->name, parameter_36->name
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp182, _39
 ; ./asm_test/win/i/all.c:3438:         list_append(subroutine->parameters, (size_t*)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rsi), %rcx	 ; subroutine_31->parameters, subroutine_31->parameters
	call	list_append	 ;
.L666:
 ; ./asm_test/win/i/all.c:3437:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rdi, %rcx	 ; parameters,
	call	list_pop	 ;
 ; ./asm_test/win/i/all.c:3437:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L667	 ;,
 ; ./asm_test/win/i/all.c:3439:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rcx	 ; tmp184, _41
 ; ./asm_test/win/i/all.c:3439:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	 ;
	movq	%rax, %rdi	 ; tmp185, block
 ; ./asm_test/win/i/all.c:3440:     list_append(subroutine->blocks, (size_t*)block);
	movq	32(%rsi), %rcx	 ; subroutine_31->blocks, subroutine_31->blocks
	movq	%rax, %rdx	 ; block,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3441:     status->current_block = block;
	movq	%rdi, 16(%rbx)	 ; block, status_12(D)->current_block
 ; ./asm_test/win/i/all.c:3442:     List* statements = list_copy(method->body);
	movq	24(%rbp), %rcx	 ; _6->body, _6->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp186, statements
 ; ./asm_test/win/i/all.c:3443:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	24(%rbx), %rax	 ; status_12(D)->current_class, status_12(D)->current_class
 ; ./asm_test/win/i/all.c:3443:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	 ; _47->name, _47->name
	movq	8(%rax), %rcx	 ; _48->name, _48->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME,
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp187, _50
 ; ./asm_test/win/i/all.c:3443:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	0(%rbp), %rax	 ; _6->name, _6->name
 ; ./asm_test/win/i/all.c:3443:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rcx	 ; _51->name, _51->name
	call	strcmp	 ;
 ; ./asm_test/win/i/all.c:3443:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	 ; tmp188
	je	.L677	 ;,
.L672:
 ; ./asm_test/win/i/all.c:3453:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp195, statement
 ; ./asm_test/win/i/all.c:3453:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L678	 ;,
 ; ./asm_test/win/i/all.c:3454:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L672	 ;
.L677:
 ; ./asm_test/win/i/all.c:3444:         Statement* stmt = (Statement*)list_pop(statements);
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
 ; ./asm_test/win/i/all.c:3445:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$0, 8(%rax)	 ;, stmt_54->type
	jne	.L669	 ;,
 ; ./asm_test/win/i/all.c:3445:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	 ; stmt_54->stmt.expr, _56
 ; ./asm_test/win/i/all.c:3445:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$19, 24(%rax)	 ;, _56->operator
	jne	.L669	 ;,
 ; ./asm_test/win/i/all.c:3445:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	8(%rax), %rax	 ; _56->prim_left, _58
 ; ./asm_test/win/i/all.c:3445:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$8, 8(%rax)	 ;, _58->type
	jne	.L669	 ;,
 ; ./asm_test/win/i/all.c:3445:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	 ; _58->value.var, _60
 ; ./asm_test/win/i/all.c:3445:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$0, 16(%rax)	 ;, _60->type
	je	.L670	 ;,
.L669:
 ; ./asm_test/win/i/all.c:3446:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	0(%rbp), %rax	 ; _6->name, _6->name
	movq	8(%rax), %rsi	 ; _62->name, _63
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp190, _64
 ; ./asm_test/win/i/all.c:3446:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	%rsi, %r8	 ; _63,
	leaq	.LC121(%rip), %rdx	 ;, tmp165
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3447:             return;
	jmp	.L662	 ;
.L670:
 ; ./asm_test/win/i/all.c:3449:         Symbol* self = stmt->stmt.expr->prim_left->value.var->content.name;
	movq	8(%rax), %r15	 ; _60->content.name, self
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	24(%rbx), %rax	 ; status_12(D)->current_class, tmp199
	leaq	24(%rax), %rdx	 ;, tmp166
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbp	 ; tmp191, _68
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	(%r15), %rdx	 ; self_65->type, self_65->type
	movq	%rbx, %r9	 ; status,
	movl	$118, %r8d	 ;,
	movq	%r15, %rcx	 ; self,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp192, _70
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp193, _71
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$0, %r9d	 ;,
	movq	%rbp, %r8	 ; _68,
	movl	$18, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp194, _72
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	8(%rdi), %rcx	 ; block_42->instructions, block_42->instructions
	call	list_append	 ;
	jmp	.L672	 ;
.L678:
 ; ./asm_test/win/i/all.c:3455:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	 ;, status_12(D)->current_subroutine
	jmp	.L662	 ;
.L664:
 ; ./asm_test/win/i/all.c:3469:                 tac_variable(member->content.variable, status, 1);
	movq	(%rax), %rcx	 ; member_21->content.variable, member_21->content.variable
	movl	$1, %r8d	 ;,
	movq	%rbx, %rdx	 ; status,
	call	tac_variable	 ;
.L662:
 ; ./asm_test/win/i/all.c:3463:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%r12, %rcx	 ; members,
	call	list_pop	 ;
 ; ./asm_test/win/i/all.c:3463:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; member
	je	.L679	 ;,
 ; ./asm_test/win/i/all.c:3464:         switch (member->type) {
	movl	8(%rax), %esi	 ; member_21->type, _5
 ; ./asm_test/win/i/all.c:3464:         switch (member->type) {
	testl	%esi, %esi	 ; _5
	je	.L663	 ;,
	cmpl	$1, %esi	 ;, _5
	je	.L664	 ;,
 ; ./asm_test/win/i/all.c:3472:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	movl	$2, %ecx	 ;,
	call	*%r14	 ; tmp173
	movq	%rax, %rcx	 ; tmp196, _9
 ; ./asm_test/win/i/all.c:3472:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	movl	%esi, %r8d	 ; _5,
	movq	%r13, %rdx	 ; tmp174,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3473:                 break;
	jmp	.L662	 ;
.L679:
 ; ./asm_test/win/i/all.c:3476:     status->current_class = NULL;
	movq	$0, 24(%rbx)	 ;, status_12(D)->current_class
 ; ./asm_test/win/i/all.c:3477: }
	addq	$40, %rsp	 ;,
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
.LC123:
	.ascii "[Warning] Unsupported variable access with NULL base\12\0"
	.align 8
.LC124:
	.ascii "[Warning] Failed to generate variable access for base\12\0"
	.align 8
.LC125:
	.ascii "[Warning] Attempting to access attribute of non-object type: %s\12\0"
	.align 8
.LC126:
	.ascii "[Warning] Attribute '%s' not found in type '%s'\12\0"
	.align 8
.LC127:
	.ascii "[Warning] Attempting to access function '%s' as attribute of type '%s'\12\0"
	.align 8
.LC128:
	.ascii "[Warning] Symbol '%s' in type '%s' is not an attribute\12\0"
.LC129:
	.ascii "arr\0"
	.align 8
.LC130:
	.ascii "[Warning] Attempting to index non-array type: %s\12\0"
	.align 8
.LC131:
	.ascii "[Warning] Failed to generate variable access for index\12\0"
	.align 8
.LC132:
	.ascii "[Warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
	.align 8
.LC133:
	.ascii "[Warning] Unsupported variable access type for tac_variable_access: %u\12\0"
	.text
	.def	tac_variable_access;	.scl	3;	.type	32;	.endef
tac_variable_access:
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$72, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp279, variable_access
	movq	%rdx, %rbx	 ; tmp280, status
 ; ./asm_test/win/i/all.c:3760:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	cmpl	$0, 16(%rcx)	 ;, variable_access_121(D)->type
	jne	.L681	 ;,
 ; ./asm_test/win/i/all.c:3760:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	8(%rcx), %rcx	 ; variable_access_121(D)->content.name, _2
 ; ./asm_test/win/i/all.c:3760:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%rcx, %rcx	 ; _2
	je	.L681	 ;,
 ; ./asm_test/win/i/all.c:3761:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	movl	32(%rcx), %eax	 ; _2->kind, _3
 ; ./asm_test/win/i/all.c:3761:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	leal	-1(%rax), %edx	 ;, tmp204
 ; ./asm_test/win/i/all.c:3761:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	cmpl	$1, %edx	 ;, tmp204
	jbe	.L708	 ;,
 ; ./asm_test/win/i/all.c:3764:         } else if (variable_access->content.name->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	 ; _3
	jne	.L684	 ;,
 ; ./asm_test/win/i/all.c:3765:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name, VAR_VAR, status));
	movq	%rbx, %r9	 ; status,
	movl	$118, %r8d	 ;,
	movq	%rcx, %rdx	 ; _2,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp283, _7
 ; ./asm_test/win/i/all.c:3765:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name, VAR_VAR, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp284, <retval>
.L680:
 ; ./asm_test/win/i/all.c:3859: }
	movq	%rsi, %rax	 ; <retval>,
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
.L708:
 ; ./asm_test/win/i/all.c:3762:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	(%rcx), %rdx	 ; _2->type, _2->type
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp281, _6
 ; ./asm_test/win/i/all.c:3762:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movl	$7, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp282, <retval>
 ; ./asm_test/win/i/all.c:3763:             return result;
	jmp	.L680	 ;
.L684:
 ; ./asm_test/win/i/all.c:3768:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%rcx), %rdx	 ; _2->type, _2->type
	movq	%rbx, %r9	 ; status,
	movl	$118, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp285, _9
 ; ./asm_test/win/i/all.c:3768:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp286, <retval>
 ; ./asm_test/win/i/all.c:3769:             return result;
	jmp	.L680	 ;
.L681:
 ; ./asm_test/win/i/all.c:3772:     if (variable_access->base == NULL) {
	movq	(%rdi), %rsi	 ; variable_access_121(D)->base, <retval>
 ; ./asm_test/win/i/all.c:3772:     if (variable_access->base == NULL) {
	testq	%rsi, %rsi	 ; <retval>
	je	.L709	 ;,
 ; ./asm_test/win/i/all.c:3776:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rdx	 ; status,
	movq	%rsi, %rcx	 ; <retval>,
	call	tac_variable_access	 ;
	movq	%rax, %rcx	 ; tmp288, _12
 ; ./asm_test/win/i/all.c:3776:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rbp	 ; tmp289, base
 ; ./asm_test/win/i/all.c:3777:     if (base == NULL) {
	testq	%rax, %rax	 ; base
	je	.L710	 ;,
 ; ./asm_test/win/i/all.c:3781:     if (variable_access->type == VAR_GET_ATTR) {
	movl	16(%rdi), %esi	 ; variable_access_121(D)->type, _14
 ; ./asm_test/win/i/all.c:3781:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %esi	 ;, _14
	je	.L711	 ;,
 ; ./asm_test/win/i/all.c:3809:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %esi	 ;, _14
	je	.L712	 ;,
 ; ./asm_test/win/i/all.c:3824:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %esi	 ;, _14
	jne	.L697	 ;,
 ; ./asm_test/win/i/all.c:3825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	16(%rax), %esi	 ; base_134->kind, _55
 ; ./asm_test/win/i/all.c:3825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%esi, %esi	 ; _55
	jne	.L698	 ;,
 ; ./asm_test/win/i/all.c:3825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	8(%rax), %rax	 ; base_134->type, _56
 ; ./asm_test/win/i/all.c:3825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rax)	 ;, _56->kind
	je	.L713	 ;,
.L699:
 ; ./asm_test/win/i/all.c:3830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	8(%rbp), %rax	 ; base_233->type, base_233->type
	movq	8(%rax), %rbx	 ; _68->name, _69
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp317, _70
 ; ./asm_test/win/i/all.c:3830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	%rbx, %r9	 ; _69,
	movl	%esi, %r8d	 ; _55,
	leaq	.LC132(%rip), %rdx	 ;, tmp252
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3831:             return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L680	 ;
.L709:
 ; ./asm_test/win/i/all.c:3773:         fprintf(stderr, "[Warning] Unsupported variable access with NULL base\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp287
 ; ./asm_test/win/i/all.c:3773:         fprintf(stderr, "[Warning] Unsupported variable access with NULL base\n");
	movl	$53, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC123(%rip), %rcx	 ;, tmp208
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:3774:         return NULL;
	jmp	.L680	 ;
.L710:
 ; ./asm_test/win/i/all.c:3778:         fprintf(stderr, "[Warning] Failed to generate variable access for base\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp290
 ; ./asm_test/win/i/all.c:3778:         fprintf(stderr, "[Warning] Failed to generate variable access for base\n");
	movl	$54, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC124(%rip), %rcx	 ;, tmp210
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:3779:         return NULL;
	movq	%rbp, %rsi	 ; base, <retval>
	jmp	.L680	 ;
.L711:
 ; ./asm_test/win/i/all.c:3782:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%rax), %r12	 ; base_134->type, _15
 ; ./asm_test/win/i/all.c:3782:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%r12), %eax	 ; _15->kind, _16
 ; ./asm_test/win/i/all.c:3782:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	leal	-1(%rax), %edx	 ;, tmp211
 ; ./asm_test/win/i/all.c:3782:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %edx	 ;, tmp211
	jbe	.L714	 ;,
 ; ./asm_test/win/i/all.c:3786:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%r12), %rcx	 ; _15->ast_node.scope, scope
 ; ./asm_test/win/i/all.c:3787:         if (base->type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _16
	jne	.L689	 ;,
 ; ./asm_test/win/i/all.c:3788:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rcx), %rcx	 ; MEM[(struct Class *)scope_198].class_scope, scope
.L689:
 ; ./asm_test/win/i/all.c:3789:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%rdi), %rax	 ; variable_access_121(D)->content.attr_name, variable_access_121(D)->content.attr_name
	movq	8(%rax), %r13	 ; _20->name, _21
	movq	%r13, %rdx	 ; _21,
	call	search_name_use_strcmp	 ;
	movq	%rax, %rsi	 ; tmp292, <retval>
 ; ./asm_test/win/i/all.c:3790:         if (attr == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L715	 ;,
 ; ./asm_test/win/i/all.c:3794:         if (attr->kind == SYMBOL_FUNCTION) {
	movl	32(%rax), %eax	 ; attr_200->kind, _24
 ; ./asm_test/win/i/all.c:3794:         if (attr->kind == SYMBOL_FUNCTION) {
	cmpl	$1, %eax	 ;, _24
	je	.L716	 ;,
 ; ./asm_test/win/i/all.c:3798:         if (attr->kind == SYMBOL_METHOD)
	cmpl	$2, %eax	 ;, _24
	je	.L717	 ;,
 ; ./asm_test/win/i/all.c:3800:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	 ;, _24
	jne	.L718	 ;,
 ; ./asm_test/win/i/all.c:3804:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	(%rsi), %rdx	 ; attr_200->type, attr_200->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp300, _34
 ; ./asm_test/win/i/all.c:3804:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp301, <retval>
 ; ./asm_test/win/i/all.c:3805:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	8(%rdi), %rcx	 ; variable_access_121(D)->content.attr_name, _35
 ; ./asm_test/win/i/all.c:3805:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%rcx), %rdx	 ; _35->type, _35->type
	movq	%rbx, %r9	 ; status,
	movl	$97, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp302, _37
 ; ./asm_test/win/i/all.c:3805:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r9	 ;, tmp303
 ; ./asm_test/win/i/all.c:3805:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rbp, %r8	 ; base,
	movq	%rsi, %rdx	 ; <retval>,
	movl	$15, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp304, inst
 ; ./asm_test/win/i/all.c:3806:         temp->is_get = 1;
	movb	$1, 20(%rsi)	 ;, temp_203->is_get
 ; ./asm_test/win/i/all.c:3807:         list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_122(D)->current_block, status_122(D)->current_block
	movq	8(%rax), %rcx	 ; _39->instructions, _39->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3808:         return temp;
	jmp	.L680	 ;
.L714:
 ; ./asm_test/win/i/all.c:3783:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	8(%r12), %rbx	 ; _15->name, _18
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp291, _19
 ; ./asm_test/win/i/all.c:3783:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	%rbx, %r8	 ; _18,
	leaq	.LC125(%rip), %rdx	 ;, tmp213
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3784:             return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L680	 ;
.L715:
 ; ./asm_test/win/i/all.c:3791:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r12), %rbx	 ; _15->name, _22
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp293, _23
 ; ./asm_test/win/i/all.c:3791:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	%rbx, %r9	 ; _22,
	movq	%r13, %r8	 ; _21,
	leaq	.LC126(%rip), %rdx	 ;, tmp216
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3792:             return NULL;
	jmp	.L680	 ;
.L716:
 ; ./asm_test/win/i/all.c:3795:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r12), %rdi	 ; _15->name, _25
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp294, _26
 ; ./asm_test/win/i/all.c:3795:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	%rdi, %r9	 ; _25,
	movq	%r13, %r8	 ; _21,
	leaq	.LC127(%rip), %rdx	 ;, tmp218
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3796:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rsi), %rdx	 ; attr_200->type, attr_200->type
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	%rsi, %rcx	 ; <retval>,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp295, _28
 ; ./asm_test/win/i/all.c:3796:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$7, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp296, <retval>
 ; ./asm_test/win/i/all.c:3796:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L680	 ;
.L717:
 ; ./asm_test/win/i/all.c:3799:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rsi), %rdx	 ; attr_200->type, attr_200->type
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	%rsi, %rcx	 ; <retval>,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp297, _30
 ; ./asm_test/win/i/all.c:3799:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$8, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp298, <retval>
 ; ./asm_test/win/i/all.c:3799:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L680	 ;
.L718:
 ; ./asm_test/win/i/all.c:3801:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r12), %rbx	 ; _15->name, _31
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp299, _32
 ; ./asm_test/win/i/all.c:3801:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	%rbx, %r9	 ; _31,
	movq	%r13, %r8	 ; _21,
	leaq	.LC128(%rip), %rdx	 ;, tmp222
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3802:             return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L680	 ;
.L712:
 ; ./asm_test/win/i/all.c:3810:         if (strcmp(base->type->name, "arr") != 0) {
	movq	8(%rax), %rax	 ; base_134->type, base_134->type
 ; ./asm_test/win/i/all.c:3810:         if (strcmp(base->type->name, "arr") != 0) {
	movq	8(%rax), %rcx	 ; _41->name, _41->name
	leaq	.LC129(%rip), %rdx	 ;, tmp232
	call	strcmp	 ;
 ; ./asm_test/win/i/all.c:3810:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	 ; tmp305
	jne	.L719	 ;,
 ; ./asm_test/win/i/all.c:3814:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	8(%rdi), %rcx	 ; variable_access_121(D)->content.index, variable_access_121(D)->content.index
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp307, _49
 ; ./asm_test/win/i/all.c:3814:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rdi	 ; tmp308, index
 ; ./asm_test/win/i/all.c:3815:         if (index == NULL) {
	testq	%rax, %rax	 ; index
	je	.L720	 ;,
 ; ./asm_test/win/i/all.c:3819:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movq	name_int(%rip), %rdx	 ; name_int,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp310, _52
 ; ./asm_test/win/i/all.c:3819:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp311, <retval>
 ; ./asm_test/win/i/all.c:3820:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	%rdi, %r9	 ; index,
	movq	%rbp, %r8	 ; base,
	movq	%rax, %rdx	 ; <retval>,
	movl	$16, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp312, inst
 ; ./asm_test/win/i/all.c:3821:         temp->is_get = 1;
	movb	$1, 20(%rsi)	 ;, temp_189->is_get
 ; ./asm_test/win/i/all.c:3822:         list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_122(D)->current_block, status_122(D)->current_block
	movq	8(%rax), %rcx	 ; _53->instructions, _53->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3823:         return temp;
	jmp	.L680	 ;
.L719:
 ; ./asm_test/win/i/all.c:3811:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	0(%rbp), %rax	 ; base_134->value.variable, base_134->value.variable
 ; ./asm_test/win/i/all.c:3811:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	(%rax), %rax	 ; _44->original_name, _44->original_name
	movq	8(%rax), %rbx	 ; _45->name, _46
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp306, _47
 ; ./asm_test/win/i/all.c:3811:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	%rbx, %r8	 ; _46,
	leaq	.LC130(%rip), %rdx	 ;, tmp236
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3812:             return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L680	 ;
.L720:
 ; ./asm_test/win/i/all.c:3816:             fprintf(stderr, "[Warning] Failed to generate variable access for index\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp309
 ; ./asm_test/win/i/all.c:3816:             fprintf(stderr, "[Warning] Failed to generate variable access for index\n");
	movl	$55, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC131(%rip), %rcx	 ;, tmp239
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:3817:             return NULL;
	movq	%rdi, %rsi	 ; index, <retval>
	jmp	.L680	 ;
.L713:
 ; ./asm_test/win/i/all.c:3826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rax), %rcx	 ; _56->name, _56->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME,
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp313, _60
 ; ./asm_test/win/i/all.c:3826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rbp), %rax	 ; base_134->type, base_134->type
 ; ./asm_test/win/i/all.c:3826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	 ; _61->ast_node.class, _61->ast_node.class
	movq	16(%rax), %rcx	 ; _62->class_scope, _62->class_scope
	call	search_name_use_strcmp	 ;
	movq	%rax, %rcx	 ; tmp314, attr
 ; ./asm_test/win/i/all.c:3827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rax), %rdx	 ; attr_138->type, attr_138->type
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp315, _65
 ; ./asm_test/win/i/all.c:3827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$8, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbp	 ; tmp316, base
.L698:
 ; ./asm_test/win/i/all.c:3829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	movl	16(%rbp), %esi	 ; base_110->kind, _55
 ; ./asm_test/win/i/all.c:3829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	leal	-7(%rsi), %eax	 ;, tmp249
 ; ./asm_test/win/i/all.c:3829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	cmpl	$1, %eax	 ;, tmp249
	ja	.L699	 ;,
 ; ./asm_test/win/i/all.c:3833:         long long arg_count = 0;
	movq	$0, 48(%rsp)	 ;, arg_count
 ; ./asm_test/win/i/all.c:3834:         List* arguments = create_list();
	call	create_list	 ;
	movq	%rax, %rsi	 ; tmp318, arguments
 ; ./asm_test/win/i/all.c:3835:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	cmpl	$8, 16(%rbp)	 ;, base_110->kind
	je	.L721	 ;,
.L702:
 ; ./asm_test/win/i/all.c:3841:         List* args = list_copy(variable_access->content.args);
	movq	8(%rdi), %rcx	 ; variable_access_121(D)->content.args, variable_access_121(D)->content.args
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp328, args
 ; ./asm_test/win/i/all.c:3846:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	leaq	56(%rsp), %r13	 ;, tmp278
 ; ./asm_test/win/i/all.c:3843:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L703	 ;
.L721:
 ; ./asm_test/win/i/all.c:3835:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%rbp), %rax	 ; base_110->type, base_110->type
	movq	8(%rax), %rcx	 ; _73->name, _73->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME,
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp319, _75
 ; ./asm_test/win/i/all.c:3835:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	0(%rbp), %rax	 ; base_110->value.subroutine, base_110->value.subroutine
 ; ./asm_test/win/i/all.c:3835:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	(%rax), %rax	 ; _76->original_name, _76->original_name
 ; ./asm_test/win/i/all.c:3835:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%rax), %rcx	 ; _77->name, _77->name
	call	strcmp	 ;
 ; ./asm_test/win/i/all.c:3835:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	testl	%eax, %eax	 ; tmp320
	je	.L702	 ;,
 ; ./asm_test/win/i/all.c:3836:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	(%rdi), %rax	 ; variable_access_121(D)->base, variable_access_121(D)->base
	movq	(%rax), %rax	 ; _80->base, _80->base
	movq	%rax, 32(%rsp)	 ; _80->base,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
	movq	%rax, %r8	 ;, tmp321
 ; ./asm_test/win/i/all.c:3836:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rcx	 ; tmp322, _83
 ; ./asm_test/win/i/all.c:3836:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp323, _84
 ; ./asm_test/win/i/all.c:3836:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %r12	 ; tmp324, self
 ; ./asm_test/win/i/all.c:3837:             long long size = (long long)get_type_size(self->type);
	movq	8(%rax), %rcx	 ; self_150->type, self_150->type
	call	get_type_size	 ;
 ; ./asm_test/win/i/all.c:3837:             long long size = (long long)get_type_size(self->type);
	movq	%rax, 56(%rsp)	 ; tmp325, MEM[(long long int *)_229]
 ; ./asm_test/win/i/all.c:3838:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	leaq	56(%rsp), %rdx	 ;, tmp265
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp326, _88
 ; ./asm_test/win/i/all.c:3838:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movl	$0, %r9d	 ;,
	movq	%r12, %r8	 ; self,
	movl	$17, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp327, _89
 ; ./asm_test/win/i/all.c:3838:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	%rsi, %rcx	 ; arguments,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3839:             arg_count++;
	addq	$1, 48(%rsp)	 ;, arg_count
	jmp	.L702	 ;
.L704:
 ; ./asm_test/win/i/all.c:3844:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp329, _93
 ; ./asm_test/win/i/all.c:3844:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rdi	 ; tmp330, arg
 ; ./asm_test/win/i/all.c:3845:             long long size = (long long)get_type_size(arg->type);
	movq	8(%rax), %rcx	 ; arg_173->type, arg_173->type
	call	get_type_size	 ;
 ; ./asm_test/win/i/all.c:3845:             long long size = (long long)get_type_size(arg->type);
	movq	%rax, 56(%rsp)	 ; tmp331, MEM[(long long int *)_229]
 ; ./asm_test/win/i/all.c:3846:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	%r13, %rdx	 ; tmp278,
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp332, _97
 ; ./asm_test/win/i/all.c:3846:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movl	$0, %r9d	 ;,
	movq	%rdi, %r8	 ; arg,
	movl	$17, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp333, _98
 ; ./asm_test/win/i/all.c:3846:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	%rsi, %rcx	 ; arguments,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3847:             arg_count++;
	addq	$1, 48(%rsp)	 ;, arg_count
.L703:
 ; ./asm_test/win/i/all.c:3843:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	%r12, %rcx	 ; args,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp334, arg_expr
 ; ./asm_test/win/i/all.c:3843:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg_expr
	jne	.L704	 ;,
	jmp	.L705	 ;
.L706:
 ; ./asm_test/win/i/all.c:3851:             list_append(status->current_block->instructions, (size_t*)arg);
	movq	16(%rbx), %rax	 ; status_122(D)->current_block, status_122(D)->current_block
	movq	8(%rax), %rcx	 ; _101->instructions, _101->instructions
	call	list_append	 ;
.L705:
 ; ./asm_test/win/i/all.c:3850:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	movq	%rsi, %rcx	 ; arguments,
	call	list_pop	 ;
	movq	%rax, %rdx	 ; tmp335, arg
 ; ./asm_test/win/i/all.c:3850:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	testq	%rax, %rax	 ; arg
	jne	.L706	 ;,
 ; ./asm_test/win/i/all.c:3852:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	8(%rbp), %rdx	 ; base_110->type, base_110->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp336, _104
 ; ./asm_test/win/i/all.c:3852:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp337, <retval>
 ; ./asm_test/win/i/all.c:3853:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	leaq	48(%rsp), %rdx	 ;, tmp272
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r9	 ;, tmp338
 ; ./asm_test/win/i/all.c:3853:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	%rbp, %r8	 ; base,
	movq	%rsi, %rdx	 ; <retval>,
	movl	$22, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp339, _106
 ; ./asm_test/win/i/all.c:3853:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	16(%rbx), %rax	 ; status_122(D)->current_block, status_122(D)->current_block
	movq	8(%rax), %rcx	 ; _107->instructions, _107->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3854:         return temp;
	jmp	.L680	 ;
.L697:
 ; ./asm_test/win/i/all.c:3856:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp340, _109
 ; ./asm_test/win/i/all.c:3856:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movl	%esi, %r8d	 ; _14,
	leaq	.LC133(%rip), %rdx	 ;, tmp276
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3857:         return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L680	 ;
	.section .rdata,"dr"
.LC134:
	.ascii "Var: \"NULL\"\12\0"
.LC135:
	.ascii "NULL\11%s\12\0"
.LC136:
	.ascii "%s\11%s(%s)\12\0"
.LC137:
	.ascii "%s\11%s\12\0"
	.text
	.def	output_var;	.scl	3;	.type	32;	.endef
output_var:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
	movq	%rdx, %rsi	 ; tmp118, outfile
 ; ./asm_test/win/i/all.c:2090:     if (var == NULL) {
	testq	%rcx, %rcx	 ; var
	je	.L742	 ;,
	movq	%rcx, %rbp	 ; tmp117, var
 ; ./asm_test/win/i/all.c:2095:     if (var->type == NULL) {
	cmpq	$0, 16(%rcx)	 ;, var_25(D)->type
	je	.L743	 ;,
 ; ./asm_test/win/i/all.c:2098:     } else if (var->original_name) {
	cmpq	$0, (%rcx)	 ;, var_25(D)->original_name
	je	.L744	 ;,
 ; ./asm_test/win/i/all.c:2099:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%r8, %rbx	 ; indent, indent
	salq	$2, %rbx	 ;, indent
	je	.L733	 ;,
 ; ./asm_test/win/i/all.c:2099:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movl	$0, %edi	 ;, i
.L734:
 ; ./asm_test/win/i/all.c:2099:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rsi, %rdx	 ; outfile,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2099:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	addq	$1, %rdi	 ;, i
 ; ./asm_test/win/i/all.c:2099:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	cmpq	%rbx, %rdi	 ; _49, i
	jne	.L734	 ;,
.L733:
 ; ./asm_test/win/i/all.c:2100:         fprintf(outfile, "%s\t%s(%s)\n", var->type->name, var->name, var->original_name->name);
	movq	16(%rbp), %rax	 ; var_25(D)->type, var_25(D)->type
	movq	8(%rax), %r8	 ; _10->name, _10->name
	movq	0(%rbp), %rax	 ; var_25(D)->original_name, var_25(D)->original_name
	movq	8(%rax), %rax	 ; _7->name, _7->name
	movq	%rax, 32(%rsp)	 ; _7->name,
	movq	8(%rbp), %r9	 ; var_25(D)->name,
	leaq	.LC136(%rip), %rdx	 ;, tmp112
	movq	%rsi, %rcx	 ; outfile,
	call	fprintf	 ;
.L722:
 ; ./asm_test/win/i/all.c:2105: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L742:
 ; ./asm_test/win/i/all.c:2091:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%r8, %rbx	 ; indent, indent
	salq	$2, %rbx	 ;, indent
	je	.L724	 ;,
 ; ./asm_test/win/i/all.c:2091:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movl	$0, %edi	 ;, i
.L725:
 ; ./asm_test/win/i/all.c:2091:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rsi, %rdx	 ; outfile,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2091:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	addq	$1, %rdi	 ;, i
 ; ./asm_test/win/i/all.c:2091:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	cmpq	%rbx, %rdi	 ; _43, i
	jne	.L725	 ;,
.L724:
 ; ./asm_test/win/i/all.c:2092:         fprintf(outfile, "Var: \"NULL\"\n");
	movq	%rsi, %r9	 ; outfile,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC134(%rip), %rcx	 ;, tmp104
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2093:         return;
	jmp	.L722	 ;
.L743:
 ; ./asm_test/win/i/all.c:2096:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%r8, %rbx	 ; indent, indent
	salq	$2, %rbx	 ;, indent
	je	.L728	 ;,
 ; ./asm_test/win/i/all.c:2096:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movl	$0, %edi	 ;, i
.L729:
 ; ./asm_test/win/i/all.c:2096:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rsi, %rdx	 ; outfile,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2096:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	addq	$1, %rdi	 ;, i
 ; ./asm_test/win/i/all.c:2096:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	cmpq	%rbx, %rdi	 ; _46, i
	jne	.L729	 ;,
.L728:
 ; ./asm_test/win/i/all.c:2097:         fprintf(outfile, "NULL\t%s\n", var->name);
	movq	8(%rbp), %r8	 ; var_25(D)->name,
	leaq	.LC135(%rip), %rdx	 ;, tmp106
	movq	%rsi, %rcx	 ; outfile,
	call	fprintf	 ;
	jmp	.L722	 ;
.L744:
 ; ./asm_test/win/i/all.c:2102:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movl	$0, %edi	 ;, i
 ; ./asm_test/win/i/all.c:2102:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%r8, %rbx	 ; indent, indent
	salq	$2, %rbx	 ;, indent
	je	.L732	 ;,
.L731:
 ; ./asm_test/win/i/all.c:2102:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rsi, %rdx	 ; outfile,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2102:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	addq	$1, %rdi	 ;, i
 ; ./asm_test/win/i/all.c:2102:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	cmpq	%rbx, %rdi	 ; _52, i
	jne	.L731	 ;,
.L732:
 ; ./asm_test/win/i/all.c:2103:         fprintf(outfile, "%s\t%s\n", var->type->name, var->name);
	movq	16(%rbp), %rax	 ; var_25(D)->type, var_25(D)->type
	movq	8(%rbp), %r9	 ; var_25(D)->name,
	movq	8(%rax), %r8	 ; _14->name,
	leaq	.LC137(%rip), %rdx	 ;, tmp116
	movq	%rsi, %rcx	 ; outfile,
	call	fprintf	 ;
	jmp	.L722	 ;
	.section .rdata,"dr"
.LC138:
	.ascii "\"NULL\"\0"
.LC139:
	.ascii "%s(%s)\0"
.LC140:
	.ascii "%lld\0"
.LC141:
	.ascii "%f\0"
.LC142:
	.ascii "\"%s\"\0"
.LC143:
	.ascii "void\0"
.LC144:
	.ascii "NONE\0"
.LC145:
	.ascii "unknown_ArgType: %u\0"
	.text
	.def	output_arg;	.scl	3;	.type	32;	.endef
output_arg:
	subq	$40, %rsp	 ;,
	movq	%rdx, %r10	 ; tmp136, outfile
 ; ./asm_test/win/i/all.c:2131:     if (arg == NULL) {
	testq	%rcx, %rcx	 ; arg
	je	.L764	 ;,
 ; ./asm_test/win/i/all.c:2135:     switch (arg->kind) {
	movl	16(%rcx), %r8d	 ; arg_20(D)->kind, _1
 ; ./asm_test/win/i/all.c:2135:     switch (arg->kind) {
	cmpl	$9, %r8d	 ;, _1
	ja	.L748	 ;,
	movl	%r8d, %r8d	 ; _1, _1
	leaq	.L750(%rip), %rdx	 ;, tmp104
	movslq	(%rdx,%r8,4), %rax	 ;, tmp106
	addq	%rdx, %rax	 ; tmp104, tmp107
	jmp	*%rax	 ; tmp107
	.section .rdata,"dr"
	.align 4
.L750:
	.long	.L758-.L750
	.long	.L757-.L750
	.long	.L756-.L750
	.long	.L755-.L750
	.long	.L754-.L750
	.long	.L753-.L750
	.long	.L752-.L750
	.long	.L751-.L750
	.long	.L751-.L750
	.long	.L749-.L750
	.text
.L764:
 ; ./asm_test/win/i/all.c:2132:         fprintf(outfile, "\"NULL\"");
	movq	%rdx, %r9	 ; outfile,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC138(%rip), %rcx	 ;, tmp102
	call	fwrite	 ;
.L745:
 ; ./asm_test/win/i/all.c:2158: }
	addq	$40, %rsp	 ;,
	ret	
.L758:
 ; ./asm_test/win/i/all.c:2137:             if (arg->value.variable->original_name)
	movq	(%rcx), %rax	 ; arg_20(D)->value.variable, _2
 ; ./asm_test/win/i/all.c:2137:             if (arg->value.variable->original_name)
	movq	(%rax), %rdx	 ; _2->original_name, _3
 ; ./asm_test/win/i/all.c:2137:             if (arg->value.variable->original_name)
	testq	%rdx, %rdx	 ; _3
	je	.L759	 ;,
 ; ./asm_test/win/i/all.c:2138:                 fprintf(outfile, "%s(%s)", arg->value.variable->name, arg->value.variable->original_name->name);
	movq	8(%rdx), %r9	 ; _3->name,
	movq	8(%rax), %r8	 ; _2->name,
	leaq	.LC139(%rip), %rdx	 ;, tmp111
	movq	%r10, %rcx	 ; outfile,
	call	fprintf	 ;
	jmp	.L745	 ;
.L759:
 ; ./asm_test/win/i/all.c:2140:                 fprintf(outfile, "%s", arg->value.variable->name);
	movq	8(%rax), %rcx	 ; _2->name, _2->name
	movq	%r10, %rdx	 ; outfile,
	call	fputs	 ;
	jmp	.L745	 ;
.L757:
 ; ./asm_test/win/i/all.c:2142:         case ARG_INT: fprintf(outfile, "%lld", arg->value.int_value); break;
	movq	(%rcx), %r8	 ; arg_20(D)->value.int_value,
	leaq	.LC140(%rip), %rdx	 ;, tmp114
	movq	%r10, %rcx	 ; outfile,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2142:         case ARG_INT: fprintf(outfile, "%lld", arg->value.int_value); break;
	jmp	.L745	 ;
.L756:
 ; ./asm_test/win/i/all.c:2143:         case ARG_FLOAT: fprintf(outfile, "%f", arg->value.float_value); break;
	movq	(%rcx), %r8	 ; arg_20(D)->value.float_value, arg_20(D)->value.float_value
	movq	%r8, %xmm2	 ; arg_20(D)->value.float_value,
	leaq	.LC141(%rip), %rdx	 ;, tmp117
	movq	%r10, %rcx	 ; outfile,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2143:         case ARG_FLOAT: fprintf(outfile, "%f", arg->value.float_value); break;
	jmp	.L745	 ;
.L755:
 ; ./asm_test/win/i/all.c:2144:         case ARG_STRING: fprintf(outfile, "\"%s\"", arg->value.string_value); break;
	movq	(%rcx), %r8	 ; arg_20(D)->value.string_value,
	leaq	.LC142(%rip), %rdx	 ;, tmp119
	movq	%r10, %rcx	 ; outfile,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2144:         case ARG_STRING: fprintf(outfile, "\"%s\"", arg->value.string_value); break;
	jmp	.L745	 ;
.L754:
 ; ./asm_test/win/i/all.c:2145:         case ARG_BOOL: fprintf(outfile, "%s", arg->value.bool_value ? "true" : "false"); break;
	cmpb	$0, (%rcx)	 ;, arg_20(D)->value.bool_value
	leaq	.LC78(%rip), %rcx	 ;, tmp133
	leaq	.LC77(%rip), %rax	 ;, tmp134
	cmovne	%rax, %rcx	 ; tmp133,, tmp134, iftmp.110_18
 ; ./asm_test/win/i/all.c:2145:         case ARG_BOOL: fprintf(outfile, "%s", arg->value.bool_value ? "true" : "false"); break;
	movq	%r10, %rdx	 ; outfile,
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:2145:         case ARG_BOOL: fprintf(outfile, "%s", arg->value.bool_value ? "true" : "false"); break;
	jmp	.L745	 ;
.L753:
 ; ./asm_test/win/i/all.c:2146:         case ARG_VOID: fprintf(outfile, "void"); break;
	movq	%r10, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC143(%rip), %rcx	 ;, tmp120
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2146:         case ARG_VOID: fprintf(outfile, "void"); break;
	jmp	.L745	 ;
.L752:
 ; ./asm_test/win/i/all.c:2147:         case ARG_LABEL: fprintf(outfile, "%s", arg->value.label->name); break;
	movq	(%rcx), %rax	 ; arg_20(D)->value.label, arg_20(D)->value.label
	movq	8(%rax), %rcx	 ; _11->name, _11->name
	movq	%r10, %rdx	 ; outfile,
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:2147:         case ARG_LABEL: fprintf(outfile, "%s", arg->value.label->name); break;
	jmp	.L745	 ;
.L751:
 ; ./asm_test/win/i/all.c:2150:             if (arg->value.subroutine->original_name)
	movq	(%rcx), %rax	 ; arg_20(D)->value.subroutine, _13
 ; ./asm_test/win/i/all.c:2150:             if (arg->value.subroutine->original_name)
	movq	(%rax), %rdx	 ; _13->original_name, _14
 ; ./asm_test/win/i/all.c:2150:             if (arg->value.subroutine->original_name)
	testq	%rdx, %rdx	 ; _14
	je	.L761	 ;,
 ; ./asm_test/win/i/all.c:2151:                 fprintf(outfile, "%s(%s)", arg->value.subroutine->name, arg->value.subroutine->original_name->name);
	movq	8(%rdx), %r9	 ; _14->name,
	movq	8(%rax), %r8	 ; _13->name,
	leaq	.LC139(%rip), %rdx	 ;, tmp125
	movq	%r10, %rcx	 ; outfile,
	call	fprintf	 ;
	jmp	.L745	 ;
.L761:
 ; ./asm_test/win/i/all.c:2153:                 fprintf(outfile, "%s", arg->value.subroutine->name);
	movq	8(%rax), %rcx	 ; _13->name, _13->name
	movq	%r10, %rdx	 ; outfile,
	call	fputs	 ;
	jmp	.L745	 ;
.L749:
 ; ./asm_test/win/i/all.c:2155:         case ARG_NONE: fprintf(outfile, "NONE"); break;
	movq	%r10, %r9	 ; outfile,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC144(%rip), %rcx	 ;, tmp127
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2155:         case ARG_NONE: fprintf(outfile, "NONE"); break;
	jmp	.L745	 ;
.L748:
 ; ./asm_test/win/i/all.c:2156:         default: fprintf(outfile, "unknown_ArgType: %u", arg->kind); break;
	leaq	.LC145(%rip), %rdx	 ;, tmp128
	movq	%r10, %rcx	 ; outfile,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2156:         default: fprintf(outfile, "unknown_ArgType: %u", arg->kind); break;
	jmp	.L745	 ;
	.section .rdata,"dr"
	.align 8
.LC146:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unterminated string literal\12\0"
.LC147:
	.ascii "\0\0"
	.align 8
.LC148:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unterminated comment\12\0"
	.align 8
.LC149:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unexpected character\12\0"
	.text
	.def	next_token;	.scl	3;	.type	32;	.endef
next_token:
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp684, lexer
	movl	%edx, %esi	 ; tmp685, skip_comment
 ; ./asm_test/win/i/all.c:1319:     char c = get_current_char(lexer);
	call	get_current_char	 ;
	cmpb	$32, %al	 ;, c
	ja	.L766	 ;,
	movzbl	%al, %edx	 ; c, c
	leaq	.L768(%rip), %rcx	 ;, tmp402
	movslq	(%rcx,%rdx,4), %rdx	 ;, tmp404
	addq	%rcx, %rdx	 ; tmp402, tmp405
	jmp	*%rdx	 ; tmp405
	.section .rdata,"dr"
	.align 4
.L768:
	.long	.L770-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L767-.L768
	.long	.L769-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L767-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L766-.L768
	.long	.L767-.L768
	.text
.L770:
 ; ./asm_test/win/i/all.c:1321:         return create_token(EOF_TOKEN, NULL, lexer->line, lexer->column);
	movq	40(%rbx), %r9	 ; lexer_286(D)->column,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_token	 ;
.L765:
 ; ./asm_test/win/i/all.c:1479: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
.L767:
 ; ./asm_test/win/i/all.c:1323:         return next_token(lexer, skip_comment);
	movsbl	%sil, %edx	 ; skip_comment, skip_comment
	movq	%rbx, %rcx	 ; lexer,
	call	next_token	 ;
	jmp	.L765	 ;
.L769:
 ; ./asm_test/win/i/all.c:1325:         (void)(lexer->line++), lexer->column = 0;
	addq	$1, 32(%rbx)	 ;, lexer_286(D)->line
 ; ./asm_test/win/i/all.c:1325:         (void)(lexer->line++), lexer->column = 0;
	movq	$0, 40(%rbx)	 ;, lexer_286(D)->column
 ; ./asm_test/win/i/all.c:1326:         return next_token(lexer, skip_comment);
	movsbl	%sil, %edx	 ; skip_comment, skip_comment
	movq	%rbx, %rcx	 ; lexer,
	call	next_token	 ;
	jmp	.L765	 ;
.L766:
	cmpb	$57, %al	 ;, c
	jg	.L772	 ;,
	cmpb	$47, %al	 ;, c
	jg	.L773	 ;,
	cmpb	$34, %al	 ;, c
	jne	.L866	 ;,
 ; ./asm_test/win/i/all.c:1354:         size_t start = lexer->position;
	movq	16(%rbx), %rbp	 ; lexer_286(D)->position, start
 ; ./asm_test/win/i/all.c:1355:         size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, tmp759
	leaq	-1(%rax), %r12	 ;, column_start
 ; ./asm_test/win/i/all.c:1356:         c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
	movl	%eax, %esi	 ; tmp697, c
 ; ./asm_test/win/i/all.c:1357:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %al	 ;, c
	ja	.L791	 ;,
 ; ./asm_test/win/i/all.c:1357:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$17179870209, %rax	 ;, tmp438
	btq	%rsi, %rax	 ; c, tmp438
	jc	.L792	 ;,
.L791:
 ; ./asm_test/win/i/all.c:1357:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$17179870209, %rdi	 ;, tmp682
.L858:
 ; ./asm_test/win/i/all.c:1358:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
	movl	%eax, %esi	 ; tmp698, c
 ; ./asm_test/win/i/all.c:1357:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %al	 ;, c
	ja	.L858	 ;,
 ; ./asm_test/win/i/all.c:1357:         while (c != '"' && c != '\0' && c != '\n')
	btq	%rsi, %rdi	 ; c, tmp682
	jnc	.L858	 ;,
.L792:
 ; ./asm_test/win/i/all.c:1359:         if (c != '"') {
	cmpb	$34, %sil	 ;, c
	jne	.L867	 ;,
.L794:
 ; ./asm_test/win/i/all.c:1363:         if (lexer->position - start == 1)
	movq	16(%rbx), %rdx	 ; lexer_286(D)->position, _53
	subq	%rbp, %rdx	 ; start, _53
 ; ./asm_test/win/i/all.c:1363:         if (lexer->position - start == 1)
	cmpq	$1, %rdx	 ;, _53
	je	.L868	 ;,
 ; ./asm_test/win/i/all.c:1365:         return create_token(STRING, create_string_check(&lexer->source[start], lexer->position - start - 1, 1), lexer->line, column_start);
	movq	32(%rbx), %rsi	 ; lexer_286(D)->line, _56
	subq	$1, %rdx	 ;, tmp449
	movq	%rbp, %rcx	 ; start, start
	addq	8(%rbx), %rcx	 ; lexer_286(D)->source, start
	movl	$1, %r8d	 ;,
	call	create_string_check	 ;
	movq	%rax, %rdx	 ; tmp702, _60
 ; ./asm_test/win/i/all.c:1365:         return create_token(STRING, create_string_check(&lexer->source[start], lexer->position - start - 1, 1), lexer->line, column_start);
	movq	%r12, %r9	 ; column_start,
	movq	%rsi, %r8	 ; _56,
	movl	$4, %ecx	 ;,
	call	create_token	 ;
 ; ./asm_test/win/i/all.c:1365:         return create_token(STRING, create_string_check(&lexer->source[start], lexer->position - start - 1, 1), lexer->line, column_start);
	jmp	.L765	 ;
.L772:
	leal	-65(%rax), %edx	 ;, _507
	cmpb	$57, %dl	 ;, _507
	ja	.L777	 ;,
	movabsq	$288230372997595135, %rcx	 ;, tmp413
	btq	%rdx, %rcx	 ; _507, tmp413
	jnc	.L777	 ;,
 ; ./asm_test/win/i/all.c:1328:         size_t start = lexer->position - 1;
	movq	16(%rbx), %r12	 ; lexer_286(D)->position, _13
 ; ./asm_test/win/i/all.c:1328:         size_t start = lexer->position - 1;
	leaq	-1(%r12), %rbp	 ;, start
 ; ./asm_test/win/i/all.c:1329:         size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rdi	 ; lexer_286(D)->column, tmp755
	subq	$1, %rdi	 ;, column_start
	movabsq	$288230372997595135, %rsi	 ;, tmp683
 ; ./asm_test/win/i/all.c:1330:         while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
	jmp	.L779	 ;
.L869:
	cmpb	$47, %al	 ;, c
	jle	.L782	 ;,
.L781:
 ; ./asm_test/win/i/all.c:1331:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
.L779:
	cmpb	$57, %al	 ;, c
	jle	.L869	 ;,
	subl	$65, %eax	 ;, _526
	cmpb	$57, %al	 ;, _526
	ja	.L782	 ;,
	btq	%rax, %rsi	 ; _526, tmp683
	jc	.L781	 ;,
.L782:
 ; ./asm_test/win/i/all.c:1314:         lexer->position -= (size_t)(-count);
	movq	16(%rbx), %rdx	 ; lexer_286(D)->position, _461
 ; ./asm_test/win/i/all.c:1314:         lexer->position -= (size_t)(-count);
	leaq	-1(%rdx), %rax	 ;, tmp420
	movq	%rax, 16(%rbx)	 ; tmp420, lexer_286(D)->position
 ; ./asm_test/win/i/all.c:1315:         lexer->column -= (size_t)(-count);
	subq	$1, 40(%rbx)	 ;, lexer_286(D)->column
 ; ./asm_test/win/i/all.c:1333:         char* content = create_string_check(&lexer->source[start], lexer->position - start, 1);
	subq	%r12, %rdx	 ; _13, tmp421
	movq	%rbp, %rcx	 ; start, start
	addq	8(%rbx), %rcx	 ; lexer_286(D)->source, start
	movl	$1, %r8d	 ;,
	call	create_string_check	 ;
	movq	%rax, %rsi	 ; tmp691, content
 ; ./asm_test/win/i/all.c:649:     if (!initialized) init();
	cmpb	$0, initialized(%rip)	 ;, initialized
	je	.L870	 ;,
.L784:
	leaq	keywordList(%rip), %rax	 ;, ivtmp.388
	leaq	176(%rax), %rdx	 ;, _463
.L786:
 ; ./asm_test/win/i/all.c:651:         if (str == keywordList[i])
	cmpq	(%rax), %rsi	 ; MEM[(char * *)_452], content
	je	.L785	 ;,
 ; ./asm_test/win/i/all.c:650:     for (size_t i = 0; i < 22; ++i)
	addq	$8, %rax	 ;, ivtmp.388
	cmpq	%rdx, %rax	 ; _463, ivtmp.388
	jne	.L786	 ;,
 ; ./asm_test/win/i/all.c:1337:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	movq	%rdi, %r9	 ; column_start,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	%rsi, %rdx	 ; content,
	movl	$1, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L870:
 ; ./asm_test/win/i/all.c:649:     if (!initialized) init();
	call	init	 ;
	jmp	.L784	 ;
.L773:
 ; ./asm_test/win/i/all.c:1339:         size_t start = lexer->position - 1;
	movq	16(%rbx), %rbp	 ; lexer_286(D)->position, _28
 ; ./asm_test/win/i/all.c:1339:         size_t start = lexer->position - 1;
	leaq	-1(%rbp), %rdi	 ;, start
 ; ./asm_test/win/i/all.c:1340:         size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, tmp757
	leaq	-1(%rax), %rsi	 ;, column_start
.L788:
 ; ./asm_test/win/i/all.c:1342:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1341:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %edx	 ;, tmp425
	cmpb	$9, %dl	 ;, tmp425
	jbe	.L788	 ;,
 ; ./asm_test/win/i/all.c:1305:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rdx	 ; lexer_286(D)->position, _467
 ; ./asm_test/win/i/all.c:1343:         TokenType type = INTEGER;
	movl	$2, %r12d	 ;, type
 ; ./asm_test/win/i/all.c:1305:     if (lexer->position >= lexer->length)
	cmpq	24(%rbx), %rdx	 ; lexer_286(D)->length, _467
	jnb	.L789	 ;,
 ; ./asm_test/win/i/all.c:1345:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %al	 ;, c
	je	.L871	 ;,
.L789:
 ; ./asm_test/win/i/all.c:1314:         lexer->position -= (size_t)(-count);
	movq	16(%rbx), %rdx	 ; lexer_286(D)->position, _478
 ; ./asm_test/win/i/all.c:1314:         lexer->position -= (size_t)(-count);
	leaq	-1(%rdx), %rax	 ;, tmp431
	movq	%rax, 16(%rbx)	 ; tmp431, lexer_286(D)->position
 ; ./asm_test/win/i/all.c:1315:         lexer->column -= (size_t)(-count);
	subq	$1, 40(%rbx)	 ;, lexer_286(D)->column
 ; ./asm_test/win/i/all.c:1352:         return create_token(type, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	movq	32(%rbx), %r13	 ; lexer_286(D)->line, _36
	subq	%rbp, %rdx	 ; _28, tmp432
	addq	8(%rbx), %rdi	 ; lexer_286(D)->source, start
	movq	%rdi, %rcx	 ; start, tmp433
	movl	$1, %r8d	 ;,
	call	create_string_check	 ;
	movq	%rax, %rdx	 ; tmp695, _41
 ; ./asm_test/win/i/all.c:1352:         return create_token(type, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	movq	%rsi, %r9	 ; column_start,
	movq	%r13, %r8	 ; _36,
	movl	%r12d, %ecx	 ; type,
	call	create_token	 ;
 ; ./asm_test/win/i/all.c:1352:         return create_token(type, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	jmp	.L765	 ;
.L871:
 ; ./asm_test/win/i/all.c:1307:     return lexer->source[lexer->position];
	movq	8(%rbx), %rax	 ; lexer_286(D)->source, lexer_286(D)->source
 ; ./asm_test/win/i/all.c:1345:         if (c == '.' && ('0' <= p && p <= '9')) {
	movzbl	(%rax,%rdx), %eax	 ; *_470, *_470
	subl	$48, %eax	 ;, tmp427
 ; ./asm_test/win/i/all.c:1345:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %al	 ;, tmp427
	ja	.L789	 ;,
 ; ./asm_test/win/i/all.c:1346:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1347:             while ('0' <= c && c <= '9')
	subl	$48, %eax	 ;, tmp429
	cmpb	$9, %al	 ;, tmp429
	ja	.L850	 ;,
.L790:
 ; ./asm_test/win/i/all.c:1348:                 c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1347:             while ('0' <= c && c <= '9')
	subl	$48, %eax	 ;, tmp430
	cmpb	$9, %al	 ;, tmp430
	jbe	.L790	 ;,
 ; ./asm_test/win/i/all.c:1349:             type = FLOAT;
	movl	$3, %r12d	 ;, type
	jmp	.L789	 ;
.L850:
	movl	$3, %r12d	 ;, type
	jmp	.L789	 ;
.L867:
 ; ./asm_test/win/i/all.c:1360:             fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: Unterminated string literal\n", lexer->filename, lexer->line + 1, start);
	movq	32(%rbx), %rax	 ; lexer_286(D)->line, tmp760
	leaq	1(%rax), %rdi	 ;, _47
	movq	(%rbx), %r13	 ; lexer_286(D)->filename, _48
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp699, _49
 ; ./asm_test/win/i/all.c:1360:             fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: Unterminated string literal\n", lexer->filename, lexer->line + 1, start);
	movq	%rbp, 32(%rsp)	 ; start,
	movq	%rdi, %r9	 ; _47,
	movq	%r13, %r8	 ; _48,
	leaq	.LC146(%rip), %rdx	 ;, tmp446
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1361:             if (c == '\n') (void)(lexer->line++), lexer->column = 0;
	cmpb	$10, %sil	 ;, c
	jne	.L794	 ;,
 ; ./asm_test/win/i/all.c:1361:             if (c == '\n') (void)(lexer->line++), lexer->column = 0;
	addq	$1, 32(%rbx)	 ;, lexer_286(D)->line
 ; ./asm_test/win/i/all.c:1361:             if (c == '\n') (void)(lexer->line++), lexer->column = 0;
	movq	$0, 40(%rbx)	 ;, lexer_286(D)->column
	jmp	.L794	 ;
.L868:
 ; ./asm_test/win/i/all.c:1364:             return create_token(STRING, create_string_check("\0", 1, 1), lexer->line, column_start);
	movq	32(%rbx), %rbx	 ; lexer_286(D)->line, _54
	movl	$1, %r8d	 ;,
	leaq	.LC147(%rip), %rcx	 ;, tmp448
	call	create_string_check	 ;
	movq	%rax, %rdx	 ; tmp700, _55
 ; ./asm_test/win/i/all.c:1364:             return create_token(STRING, create_string_check("\0", 1, 1), lexer->line, column_start);
	movq	%r12, %r9	 ; column_start,
	movq	%rbx, %r8	 ; _54,
	movl	$4, %ecx	 ;,
	call	create_token	 ;
 ; ./asm_test/win/i/all.c:1364:             return create_token(STRING, create_string_check("\0", 1, 1), lexer->line, column_start);
	jmp	.L765	 ;
.L866:
 ; ./asm_test/win/i/all.c:1305:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rdi	 ; lexer_286(D)->position, _459
 ; ./asm_test/win/i/all.c:1305:     if (lexer->position >= lexer->length)
	movq	24(%rbx), %rbp	 ; lexer_286(D)->length, _460
 ; ./asm_test/win/i/all.c:1305:     if (lexer->position >= lexer->length)
	cmpq	%rbp, %rdi	 ; _460, _459
	jnb	.L796	 ;,
 ; ./asm_test/win/i/all.c:1307:     return lexer->source[lexer->position];
	movq	8(%rbx), %r12	 ; lexer_286(D)->source, _486
 ; ./asm_test/win/i/all.c:1307:     return lexer->source[lexer->position];
	movzbl	(%r12,%rdi), %edx	 ; *_487, _11
 ; ./asm_test/win/i/all.c:1368:         if (c == '/' && p == '/') {
	cmpb	$47, %al	 ;, c
	sete	%cl	 ;, _264
 ; ./asm_test/win/i/all.c:1368:         if (c == '/' && p == '/') {
	cmpb	$47, %dl	 ;, _11
	jne	.L797	 ;,
	testb	%cl, %cl	 ; _264
	je	.L797	 ;,
 ; ./asm_test/win/i/all.c:1370:             size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rbp	 ; lexer_286(D)->column, _65
.L798:
 ; ./asm_test/win/i/all.c:1372:                 c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1371:             while (c != '\n' && c != '\0')
	cmpb	$10, %al	 ;, c
	je	.L852	 ;,
	testb	%al, %al	 ; c
	jne	.L798	 ;,
.L852:
 ; ./asm_test/win/i/all.c:1314:         lexer->position -= (size_t)(-count);
	movq	16(%rbx), %rax	 ; lexer_286(D)->position, tmp763
	leaq	-1(%rax), %rdx	 ;, _498
	movq	%rdx, 16(%rbx)	 ; _498, lexer_286(D)->position
 ; ./asm_test/win/i/all.c:1315:         lexer->column -= (size_t)(-count);
	subq	$1, 40(%rbx)	 ;, lexer_286(D)->column
 ; ./asm_test/win/i/all.c:1374:             if (skip_comment)
	testb	%sil, %sil	 ; skip_comment
	je	.L800	 ;,
 ; ./asm_test/win/i/all.c:1375:                 return next_token(lexer, skip_comment);
	movsbl	%sil, %edx	 ; skip_comment, skip_comment
	movq	%rbx, %rcx	 ; lexer,
	call	next_token	 ;
	jmp	.L765	 ;
.L800:
 ; ./asm_test/win/i/all.c:1369:             size_t start = lexer->position + 1;
	addq	$1, %rdi	 ;, start
 ; ./asm_test/win/i/all.c:1376:             return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	movq	32(%rbx), %rbx	 ; lexer_286(D)->line, _70
	subq	%rdi, %rdx	 ; start, tmp461
	leaq	(%r12,%rdi), %rcx	 ;, tmp462
	movl	$1, %r8d	 ;,
	call	create_string_check	 ;
	movq	%rax, %rdx	 ; tmp706, _75
 ; ./asm_test/win/i/all.c:1376:             return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	leaq	-1(%rbp), %r9	 ;,
	movq	%rbx, %r8	 ; _70,
	movl	$7, %ecx	 ;,
	call	create_token	 ;
 ; ./asm_test/win/i/all.c:1376:             return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	jmp	.L765	 ;
.L807:
 ; ./asm_test/win/i/all.c:1381:                 c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1305:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rdx	 ; lexer_286(D)->position, _501
 ; ./asm_test/win/i/all.c:1305:     if (lexer->position >= lexer->length)
	cmpq	%rbp, %rdx	 ; _460, _501
	jnb	.L803	 ;,
 ; ./asm_test/win/i/all.c:1307:     return lexer->source[lexer->position];
	movq	8(%rbx), %rcx	 ; lexer_286(D)->source, lexer_286(D)->source
	movzbl	(%rcx,%rdx), %edx	 ; *_504, p
 ; ./asm_test/win/i/all.c:1383:                 if (c == '\n') (void)(lexer->line++), lexer->column = 0;
	cmpb	$10, %al	 ;, c
	je	.L841	 ;,
.L804:
 ; ./asm_test/win/i/all.c:1384:                 if (p == '\0') break;
	testb	%dl, %dl	 ; p
	je	.L805	 ;,
 ; ./asm_test/win/i/all.c:1385:                 if (c == '\0') {
	testb	%al, %al	 ; c
	je	.L872	 ;,
.L802:
 ; ./asm_test/win/i/all.c:1380:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %al	 ;, c
	jne	.L807	 ;,
	cmpb	$47, %dl	 ;, p
	jne	.L807	 ;,
 ; ./asm_test/win/i/all.c:1399:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1400:             if (skip_comment)
	testb	%sil, %sil	 ; skip_comment
	jne	.L844	 ;,
 ; ./asm_test/win/i/all.c:1402:             return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start - 2, 1), lexer->line, column_start);
	movq	32(%rbx), %rsi	 ; lexer_286(D)->line, _110
	movq	16(%rbx), %rax	 ; lexer_286(D)->position, tmp771
	leaq	-2(%rax), %rdx	 ;, tmp491
	subq	%r14, %rdx	 ; start, tmp493
	movq	%r14, %rcx	 ; start, start
	addq	8(%rbx), %rcx	 ; lexer_286(D)->source, start
	movl	$1, %r8d	 ;,
	call	create_string_check	 ;
	movq	%rax, %rdx	 ; tmp718, _116
 ; ./asm_test/win/i/all.c:1402:             return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start - 2, 1), lexer->line, column_start);
	movq	%r13, %r9	 ; column_start,
	movq	%rsi, %r8	 ; _110,
	movl	$7, %ecx	 ;,
	call	create_token	 ;
 ; ./asm_test/win/i/all.c:1402:             return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start - 2, 1), lexer->line, column_start);
	jmp	.L765	 ;
.L872:
 ; ./asm_test/win/i/all.c:1386:                     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: Unterminated comment\n", lexer->filename, lexer->line + 1, start + 1);
	movq	32(%rbx), %rax	 ; lexer_286(D)->line, tmp765
	leaq	1(%rax), %rbp	 ;, _84
	movq	(%rbx), %r12	 ; lexer_286(D)->filename, _85
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp709, _86
	addq	$2, %rdi	 ;, tmp470
 ; ./asm_test/win/i/all.c:1386:                     fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: Unterminated comment\n", lexer->filename, lexer->line + 1, start + 1);
	movq	%rdi, 32(%rsp)	 ; tmp470,
	movq	%rbp, %r9	 ; _84,
	movq	%r12, %r8	 ; _85,
	leaq	.LC148(%rip), %rdx	 ;, tmp471
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1387:                     if (skip_comment)
	testb	%sil, %sil	 ; skip_comment
	je	.L806	 ;,
 ; ./asm_test/win/i/all.c:1388:                         return next_token(lexer, skip_comment);
	movsbl	%sil, %edx	 ; skip_comment, skip_comment
	movq	%rbx, %rcx	 ; lexer,
	call	next_token	 ;
	jmp	.L765	 ;
.L806:
 ; ./asm_test/win/i/all.c:1389:                     return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	movq	32(%rbx), %rsi	 ; lexer_286(D)->line, _88
	movq	16(%rbx), %rdx	 ; lexer_286(D)->position, tmp473
	subq	%r14, %rdx	 ; start, tmp473
	movq	%r14, %rcx	 ; start, start
	addq	8(%rbx), %rcx	 ; lexer_286(D)->source, start
	movl	$1, %r8d	 ;,
	call	create_string_check	 ;
	movq	%rax, %rdx	 ; tmp711, _93
 ; ./asm_test/win/i/all.c:1389:                     return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	movq	%r13, %r9	 ; column_start,
	movq	%rsi, %r8	 ; _88,
	movl	$7, %ecx	 ;,
	call	create_token	 ;
 ; ./asm_test/win/i/all.c:1389:                     return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	jmp	.L765	 ;
.L873:
 ; ./asm_test/win/i/all.c:1314:         lexer->position -= (size_t)(-count);
	subq	$1, 16(%rbx)	 ;, lexer_286(D)->position
 ; ./asm_test/win/i/all.c:1315:         lexer->column -= (size_t)(-count);
	subq	$1, 40(%rbx)	 ;, lexer_286(D)->column
 ; ./asm_test/win/i/all.c:1317: }
	jmp	.L843	 ;
.L809:
 ; ./asm_test/win/i/all.c:1397:                 return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	movq	32(%rbx), %rsi	 ; lexer_286(D)->line, _103
	movq	16(%rbx), %rdx	 ; lexer_286(D)->position, tmp486
	subq	%r14, %rdx	 ; start, tmp486
	movq	%r14, %rcx	 ; start, start
	addq	8(%rbx), %rcx	 ; lexer_286(D)->source, start
	movl	$1, %r8d	 ;,
	call	create_string_check	 ;
	movq	%rax, %rdx	 ; tmp715, _108
 ; ./asm_test/win/i/all.c:1397:                 return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	movq	%r13, %r9	 ; column_start,
	movq	%rsi, %r8	 ; _103,
	movl	$7, %ecx	 ;,
	call	create_token	 ;
 ; ./asm_test/win/i/all.c:1397:                 return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	jmp	.L765	 ;
.L844:
 ; ./asm_test/win/i/all.c:1401:                 return next_token(lexer, skip_comment);
	movsbl	%sil, %edx	 ; skip_comment, skip_comment
	movq	%rbx, %rcx	 ; lexer,
	call	next_token	 ;
	jmp	.L765	 ;
.L875:
 ; ./asm_test/win/i/all.c:1404:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1405:             return create_token(SYMBOL, symbolList[19], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	152+symbolList(%rip), %rdx	 ; symbolList[19],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L876:
 ; ./asm_test/win/i/all.c:1407:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1408:             return create_token(SYMBOL, symbolList[20], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	160+symbolList(%rip), %rdx	 ; symbolList[20],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L877:
 ; ./asm_test/win/i/all.c:1410:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1411:             return create_token(SYMBOL, symbolList[21], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	168+symbolList(%rip), %rdx	 ; symbolList[21],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L878:
 ; ./asm_test/win/i/all.c:1413:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1414:             return create_token(SYMBOL, symbolList[22], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	176+symbolList(%rip), %rdx	 ; symbolList[22],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L879:
 ; ./asm_test/win/i/all.c:1416:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1417:             return create_token(SYMBOL, symbolList[23], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	184+symbolList(%rip), %rdx	 ; symbolList[23],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L880:
 ; ./asm_test/win/i/all.c:1419:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1420:             return create_token(SYMBOL, symbolList[24], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	192+symbolList(%rip), %rdx	 ; symbolList[24],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L881:
 ; ./asm_test/win/i/all.c:1422:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1423:             return create_token(SYMBOL, symbolList[25], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	200+symbolList(%rip), %rdx	 ; symbolList[25],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L882:
 ; ./asm_test/win/i/all.c:1425:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1426:             return create_token(SYMBOL, symbolList[26], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	208+symbolList(%rip), %rdx	 ; symbolList[26],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L883:
 ; ./asm_test/win/i/all.c:1428:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1429:             return create_token(SYMBOL, symbolList[27], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	216+symbolList(%rip), %rdx	 ; symbolList[27],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L884:
 ; ./asm_test/win/i/all.c:1431:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1432:             return create_token(SYMBOL, symbolList[28], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	224+symbolList(%rip), %rdx	 ; symbolList[28],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L885:
 ; ./asm_test/win/i/all.c:1434:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1435:             return create_token(SYMBOL, symbolList[29], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-2(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	232+symbolList(%rip), %rdx	 ; symbolList[29],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L838:
 ; ./asm_test/win/i/all.c:1437:             return create_token(SYMBOL, symbolList[0], lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	symbolList(%rip), %rdx	 ; symbolList[0],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L837:
 ; ./asm_test/win/i/all.c:1439:             return create_token(SYMBOL, symbolList[1], lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	8+symbolList(%rip), %rdx	 ; symbolList[1],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L824:
 ; ./asm_test/win/i/all.c:1441:             return create_token(SYMBOL, symbolList[2], lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	16+symbolList(%rip), %rdx	 ; symbolList[2],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L822:
 ; ./asm_test/win/i/all.c:1443:             return create_token(SYMBOL, symbolList[3], lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	24+symbolList(%rip), %rdx	 ; symbolList[3],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L834:
 ; ./asm_test/win/i/all.c:1445:             return create_token(SYMBOL, symbolList[4], lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	32+symbolList(%rip), %rdx	 ; symbolList[4],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L840:
 ; ./asm_test/win/i/all.c:1447:             return create_token(SYMBOL, symbolList[5], lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	40+symbolList(%rip), %rdx	 ; symbolList[5],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L832:
 ; ./asm_test/win/i/all.c:1449:             return create_token(SYMBOL, symbolList[6], lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	48+symbolList(%rip), %rdx	 ; symbolList[6],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L826:
 ; ./asm_test/win/i/all.c:1451:             return create_token(SYMBOL, symbolList[7], lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	56+symbolList(%rip), %rdx	 ; symbolList[7],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L825:
 ; ./asm_test/win/i/all.c:1453:             return create_token(SYMBOL, symbolList[8], lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	64+symbolList(%rip), %rdx	 ; symbolList[8],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L830:
 ; ./asm_test/win/i/all.c:1455:             return create_token(SYMBOL, symbolList[9], lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	72+symbolList(%rip), %rdx	 ; symbolList[9],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L835:
 ; ./asm_test/win/i/all.c:1459:             return create_token(SYMBOL, symbolList[11], lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	88+symbolList(%rip), %rdx	 ; symbolList[11],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L833:
 ; ./asm_test/win/i/all.c:1461:             return create_token(SYMBOL, symbolList[12], lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	96+symbolList(%rip), %rdx	 ; symbolList[12],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L836:
 ; ./asm_test/win/i/all.c:1463:             return create_token(SYMBOL, symbolList[13], lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	104+symbolList(%rip), %rdx	 ; symbolList[13],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L831:
 ; ./asm_test/win/i/all.c:1465:             return create_token(SYMBOL, symbolList[14], lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	112+symbolList(%rip), %rdx	 ; symbolList[14],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L839:
 ; ./asm_test/win/i/all.c:1467:             return create_token(SYMBOL, symbolList[15], lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	120+symbolList(%rip), %rdx	 ; symbolList[15],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L829:
 ; ./asm_test/win/i/all.c:1469:             return create_token(SYMBOL, symbolList[16], lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	128+symbolList(%rip), %rdx	 ; symbolList[16],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L827:
 ; ./asm_test/win/i/all.c:1471:             return create_token(SYMBOL, symbolList[17], lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	136+symbolList(%rip), %rdx	 ; symbolList[17],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L828:
 ; ./asm_test/win/i/all.c:1473:             return create_token(SYMBOL, symbolList[18], lexer->line, lexer->column - 1);
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, lexer_286(D)->column
	leaq	-1(%rax), %r9	 ;,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	144+symbolList(%rip), %rdx	 ; symbolList[18],
	movl	$5, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L821:
 ; ./asm_test/win/i/all.c:1475:             fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: Unexpected character\n", lexer->filename, lexer->line + 1, lexer->column);
	movq	40(%rbx), %rdi	 ; lexer_286(D)->column, _257
	movq	32(%rbx), %rax	 ; lexer_286(D)->line, tmp773
	leaq	1(%rax), %rsi	 ;, _259
	movq	(%rbx), %rbx	 ; lexer_286(D)->filename, _260
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp749, _261
 ; ./asm_test/win/i/all.c:1475:             fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: Unexpected character\n", lexer->filename, lexer->line + 1, lexer->column);
	movq	%rdi, 32(%rsp)	 ; _257,
	movq	%rsi, %r9	 ; _259,
	movq	%rbx, %r8	 ; _260,
	leaq	.LC149(%rip), %rdx	 ;, tmp674
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1476:             return create_token(EOF_TOKEN, NULL, 0, 0);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
.L803:
 ; ./asm_test/win/i/all.c:1383:                 if (c == '\n') (void)(lexer->line++), lexer->column = 0;
	cmpb	$10, %al	 ;, c
	jne	.L805	 ;,
 ; ./asm_test/win/i/all.c:1306:         return '\0';
	movl	%r12d, %edx	 ; p, p
.L841:
 ; ./asm_test/win/i/all.c:1383:                 if (c == '\n') (void)(lexer->line++), lexer->column = 0;
	addq	$1, 32(%rbx)	 ;, lexer_286(D)->line
 ; ./asm_test/win/i/all.c:1383:                 if (c == '\n') (void)(lexer->line++), lexer->column = 0;
	movq	$0, 40(%rbx)	 ;, lexer_286(D)->column
	jmp	.L804	 ;
.L805:
 ; ./asm_test/win/i/all.c:1393:                 if (c == '\0') move_position(lexer, -1);
	testb	%al, %al	 ; c
	je	.L873	 ;,
.L843:
 ; ./asm_test/win/i/all.c:1394:                 fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: Unterminated comment\n", lexer->filename, lexer->line + 1, start + 1);
	movq	32(%rbx), %rax	 ; lexer_286(D)->line, tmp768
	leaq	1(%rax), %rbp	 ;, _99
	movq	(%rbx), %r12	 ; lexer_286(D)->filename, _100
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp713, _101
	addq	$2, %rdi	 ;, tmp483
 ; ./asm_test/win/i/all.c:1394:                 fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: Unterminated comment\n", lexer->filename, lexer->line + 1, start + 1);
	movq	%rdi, 32(%rsp)	 ; tmp483,
	movq	%rbp, %r9	 ; _99,
	movq	%r12, %r8	 ; _100,
	leaq	.LC148(%rip), %rdx	 ;, tmp484
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1395:                 if (skip_comment)
	testb	%sil, %sil	 ; skip_comment
	je	.L809	 ;,
 ; ./asm_test/win/i/all.c:1396:                     return next_token(lexer, skip_comment);
	movsbl	%sil, %edx	 ; skip_comment, skip_comment
	movq	%rbx, %rcx	 ; lexer,
	call	next_token	 ;
	jmp	.L765	 ;
.L874:
 ; ./asm_test/win/i/all.c:1307:     return lexer->source[lexer->position];
	movq	8(%rbx), %rdx	 ; lexer_286(D)->source, lexer_286(D)->source
	movzbl	(%rdx,%rdi), %edx	 ; *_476, _11
 ; ./asm_test/win/i/all.c:1368:         if (c == '/' && p == '/') {
	cmpb	$47, %al	 ;, c
	sete	%cl	 ;, _264
.L797:
 ; ./asm_test/win/i/all.c:1377:         } else if (c == '/' && p == '*') {
	cmpb	$42, %dl	 ;, _11
	jne	.L801	 ;,
	testb	%cl, %cl	 ; _264
	je	.L801	 ;,
 ; ./asm_test/win/i/all.c:1378:             size_t start = lexer->position + 1;
	leaq	1(%rdi), %r14	 ;, start
 ; ./asm_test/win/i/all.c:1379:             size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rax	 ; lexer_286(D)->column, tmp764
	leaq	-1(%rax), %r13	 ;, column_start
 ; ./asm_test/win/i/all.c:1319:     char c = get_current_char(lexer);
	movl	$47, %eax	 ;, c
 ; ./asm_test/win/i/all.c:1306:         return '\0';
	movl	$0, %r12d	 ;, p
 ; ./asm_test/win/i/all.c:1380:             while (!(c == '*' && p == '/')) {
	jmp	.L802	 ;
.L777:
 ; ./asm_test/win/i/all.c:1305:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rdi	 ; lexer_286(D)->position, _459
 ; ./asm_test/win/i/all.c:1305:     if (lexer->position >= lexer->length)
	movq	24(%rbx), %rbp	 ; lexer_286(D)->length, _460
 ; ./asm_test/win/i/all.c:1305:     if (lexer->position >= lexer->length)
	cmpq	%rbp, %rdi	 ; _460, _459
	jb	.L874	 ;,
.L796:
 ; ./asm_test/win/i/all.c:1368:         if (c == '/' && p == '/') {
	cmpb	$47, %al	 ;, c
	sete	%cl	 ;, _264
 ; ./asm_test/win/i/all.c:1306:         return '\0';
	movl	$0, %edx	 ;, _11
.L801:
 ; ./asm_test/win/i/all.c:1403:         } else if (c == '=' && p == '=') {
	cmpb	$61, %dl	 ;, _11
	sete	%r8b	 ;, _118
 ; ./asm_test/win/i/all.c:1403:         } else if (c == '=' && p == '=') {
	cmpb	$61, %al	 ;, c
	jne	.L810	 ;,
	testb	%r8b, %r8b	 ; _118
	jne	.L875	 ;,
.L810:
 ; ./asm_test/win/i/all.c:1406:         } else if (c == '!' && p == '=') {
	cmpb	$33, %al	 ;, c
	jne	.L811	 ;,
	testb	%r8b, %r8b	 ; _118
	jne	.L876	 ;,
.L811:
 ; ./asm_test/win/i/all.c:1409:         } else if (c == '<' && p == '=') {
	cmpb	$60, %al	 ;, c
	jne	.L812	 ;,
	testb	%r8b, %r8b	 ; _118
	jne	.L877	 ;,
.L812:
 ; ./asm_test/win/i/all.c:1412:         } else if (c == '>' && p == '=') {
	cmpb	$62, %al	 ;, c
	jne	.L813	 ;,
	testb	%r8b, %r8b	 ; _118
	jne	.L878	 ;,
.L813:
 ; ./asm_test/win/i/all.c:1415:         } else if (c == '+' && p == '=') {
	cmpb	$43, %al	 ;, c
	jne	.L814	 ;,
	testb	%r8b, %r8b	 ; _118
	jne	.L879	 ;,
.L814:
 ; ./asm_test/win/i/all.c:1418:         } else if (c == '-' && p == '=') {
	cmpb	$45, %al	 ;, c
	jne	.L815	 ;,
	testb	%r8b, %r8b	 ; _118
	jne	.L880	 ;,
.L815:
 ; ./asm_test/win/i/all.c:1421:         } else if (c == '*' && p == '=') {
	cmpb	$42, %al	 ;, c
	jne	.L816	 ;,
	testb	%r8b, %r8b	 ; _118
	jne	.L881	 ;,
.L816:
 ; ./asm_test/win/i/all.c:1424:         } else if (c == '/' && p == '=') {
	testb	%r8b, %r8b	 ; _118
	je	.L817	 ;,
	testb	%cl, %cl	 ; _264
	jne	.L882	 ;,
.L817:
 ; ./asm_test/win/i/all.c:1427:         } else if (c == '%' && p == '=') {
	cmpb	$37, %al	 ;, c
	jne	.L818	 ;,
	testb	%r8b, %r8b	 ; _118
	jne	.L883	 ;,
.L818:
 ; ./asm_test/win/i/all.c:1430:         } else if (c == '&' && p == '&') {
	cmpb	$38, %al	 ;, c
	jne	.L819	 ;,
	cmpb	$38, %dl	 ;, _11
	je	.L884	 ;,
.L819:
 ; ./asm_test/win/i/all.c:1433:         } else if (c == '|' && p == '|') {
	cmpb	$124, %al	 ;, c
	jne	.L820	 ;,
	cmpb	$124, %dl	 ;, _11
	je	.L885	 ;,
.L820:
	subl	$33, %eax	 ;, tmp576
	cmpb	$92, %al	 ;, tmp576
	ja	.L821	 ;,
	movzbl	%al, %eax	 ; tmp576, tmp577
	leaq	.L823(%rip), %rdx	 ;, tmp578
	movslq	(%rdx,%rax,4), %rax	 ;, tmp580
	addq	%rdx, %rax	 ; tmp578, tmp581
	jmp	*%rax	 ; tmp581
	.section .rdata,"dr"
	.align 4
.L823:
	.long	.L840-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L839-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L838-.L823
	.long	.L837-.L823
	.long	.L836-.L823
	.long	.L835-.L823
	.long	.L834-.L823
	.long	.L833-.L823
	.long	.L832-.L823
	.long	.L831-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L830-.L823
	.long	.L829-.L823
	.long	.L828-.L823
	.long	.L827-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L826-.L823
	.long	.L821-.L823
	.long	.L825-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L821-.L823
	.long	.L824-.L823
	.long	.L821-.L823
	.long	.L822-.L823
	.text
.L785:
 ; ./asm_test/win/i/all.c:1335:             return create_token(KEYWORD, content, lexer->line, column_start);
	movq	%rdi, %r9	 ; column_start,
	movq	32(%rbx), %r8	 ; lexer_286(D)->line,
	movq	%rsi, %rdx	 ; content,
	movl	$6, %ecx	 ;,
	call	create_token	 ;
	jmp	.L765	 ;
	.def	get_next_token;	.scl	3;	.type	32;	.endef
get_next_token:
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp95, lexer
 ; ./asm_test/win/i/all.c:1481:     if (lexer->peeked_token != NULL) {
	movq	48(%rcx), %rax	 ; lexer_9(D)->peeked_token, <retval>
 ; ./asm_test/win/i/all.c:1481:     if (lexer->peeked_token != NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L887	 ;,
 ; ./asm_test/win/i/all.c:1482:         lexer->current_token = lexer->peeked_token;
	movq	%rax, 80(%rcx)	 ; <retval>, lexer_9(D)->current_token
 ; ./asm_test/win/i/all.c:1483:         lexer->position = lexer->peeked_position;
	movq	56(%rcx), %rdx	 ; lexer_9(D)->peeked_position, lexer_9(D)->peeked_position
	movq	%rdx, 16(%rcx)	 ; lexer_9(D)->peeked_position, lexer_9(D)->position
 ; ./asm_test/win/i/all.c:1484:         lexer->line = lexer->peeked_line;
	movq	64(%rcx), %rdx	 ; lexer_9(D)->peeked_line, lexer_9(D)->peeked_line
	movq	%rdx, 32(%rcx)	 ; lexer_9(D)->peeked_line, lexer_9(D)->line
 ; ./asm_test/win/i/all.c:1485:         lexer->column = lexer->peeked_column;
	movq	72(%rcx), %rdx	 ; lexer_9(D)->peeked_column, lexer_9(D)->peeked_column
	movq	%rdx, 40(%rcx)	 ; lexer_9(D)->peeked_column, lexer_9(D)->column
 ; ./asm_test/win/i/all.c:1486:         lexer->peeked_token = 0;
	movq	$0, 48(%rcx)	 ;, lexer_9(D)->peeked_token
.L886:
 ; ./asm_test/win/i/all.c:1491: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
.L887:
 ; ./asm_test/win/i/all.c:1489:     Token* token = next_token(lexer, skip_comment);
	movsbl	%dl, %edx	 ; skip_comment, skip_comment
	call	next_token	 ;
 ; ./asm_test/win/i/all.c:1490:     return lexer->current_token = token;
	movq	%rax, 80(%rbx)	 ; <retval>, lexer_9(D)->current_token
	jmp	.L886	 ;
	.def	peek_next_token;	.scl	3;	.type	32;	.endef
peek_next_token:
 ; ./asm_test/win/i/all.c:1493:     if (lexer->peeked_token != NULL)
	movq	48(%rcx), %rax	 ; lexer_9(D)->peeked_token, <retval>
 ; ./asm_test/win/i/all.c:1493:     if (lexer->peeked_token != NULL)
	testq	%rax, %rax	 ; <retval>
	je	.L896	 ;,
 ; ./asm_test/win/i/all.c:1507: }
	ret	
.L896:
 ; ./asm_test/win/i/all.c:1492: Token* peek_next_token(Lexer* lexer, char skip_comment) {
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp98, lexer
 ; ./asm_test/win/i/all.c:1495:     size_t saved_position = lexer->position;
	movq	16(%rcx), %rbp	 ; lexer_9(D)->position, saved_position
 ; ./asm_test/win/i/all.c:1496:     size_t saved_line = lexer->line;
	movq	32(%rcx), %rdi	 ; lexer_9(D)->line, saved_line
 ; ./asm_test/win/i/all.c:1497:     size_t saved_column = lexer->column;
	movq	40(%rcx), %rsi	 ; lexer_9(D)->column, saved_column
 ; ./asm_test/win/i/all.c:1498:     Token* token = get_next_token(lexer, skip_comment);
	movsbl	%dl, %edx	 ; skip_comment, skip_comment
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:1499:     lexer->peeked_position = lexer->position;
	movq	16(%rbx), %rdx	 ; lexer_9(D)->position, lexer_9(D)->position
	movq	%rdx, 56(%rbx)	 ; lexer_9(D)->position, lexer_9(D)->peeked_position
 ; ./asm_test/win/i/all.c:1500:     lexer->peeked_line = lexer->line;
	movq	32(%rbx), %rdx	 ; lexer_9(D)->line, lexer_9(D)->line
	movq	%rdx, 64(%rbx)	 ; lexer_9(D)->line, lexer_9(D)->peeked_line
 ; ./asm_test/win/i/all.c:1501:     lexer->peeked_column = lexer->column;
	movq	40(%rbx), %rdx	 ; lexer_9(D)->column, lexer_9(D)->column
	movq	%rdx, 72(%rbx)	 ; lexer_9(D)->column, lexer_9(D)->peeked_column
 ; ./asm_test/win/i/all.c:1502:     lexer->position = saved_position;
	movq	%rbp, 16(%rbx)	 ; saved_position, lexer_9(D)->position
 ; ./asm_test/win/i/all.c:1503:     lexer->line = saved_line;
	movq	%rdi, 32(%rbx)	 ; saved_line, lexer_9(D)->line
 ; ./asm_test/win/i/all.c:1504:     lexer->column = saved_column;
	movq	%rsi, 40(%rbx)	 ; saved_column, lexer_9(D)->column
 ; ./asm_test/win/i/all.c:1505:     lexer->peeked_token = token;
	movq	%rax, 48(%rbx)	 ; <retval>, lexer_9(D)->peeked_token
 ; ./asm_test/win/i/all.c:1507: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC150:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse right operand\12\0"
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
	movq	%rcx, %rdi	 ; tmp130, lexer
	movq	%rdx, %r13	 ; tmp131, expr_left
	movl	%r8d, %r15d	 ; tmp132, min_prec
	movq	%r9, %r14	 ; tmp133, now_scope
 ; ./asm_test/win/i/all.c:2938:     token = peek_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	call	peek_next_token	 ;
 ; ./asm_test/win/i/all.c:2939:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_29->type
	je	.L902	 ;,
 ; ./asm_test/win/i/all.c:2968:     return expr_left;
	movq	%r13, %rsi	 ; expr_left, <retval>
	jmp	.L897	 ;
.L910:
 ; ./asm_test/win/i/all.c:2948:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse right operand\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbx), %rax	 ; token_36->column, tmp149
	leaq	1(%rax), %rdi	 ;, _6
	movq	8(%rbx), %rbx	 ; token_36->line, token_36->line
	addq	$1, %rbx	 ;, _8
	movq	160(%rsp), %rax	 ; parser, tmp150
	movq	(%rax), %rax	 ; parser_38(D)->source_file, parser_38(D)->source_file
	movq	24(%rax), %rbp	 ; _9->path, _10
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp139, _11
 ; ./asm_test/win/i/all.c:2948:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse right operand\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _6,
	movq	%rbx, %r9	 ; _8,
	movq	%rbp, %r8	 ; _10,
	leaq	.LC150(%rip), %rdx	 ;, tmp123
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2949:             return NULL;
	jmp	.L897	 ;
.L908:
 ; ./asm_test/win/i/all.c:2962:             token = peek_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; ./asm_test/win/i/all.c:2953:         while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_50->type
	jne	.L900	 ;,
.L901:
 ; ./asm_test/win/i/all.c:2954:             OperatorType next_op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_66->lexeme, token_66->lexeme
	call	string_to_operator	 ;
	movl	%eax, %ebx	 ; tmp142, next_op
 ; ./asm_test/win/i/all.c:2955:             int next_prec = operator_precedence(next_op);
	movl	%eax, %ecx	 ; next_op,
	call	operator_precedence	 ;
 ; ./asm_test/win/i/all.c:2956:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %ebx	 ;, next_op
	je	.L900	 ;,
	cmpl	%eax, %ebp	 ; next_prec, op_prec
	jge	.L900	 ;,
 ; ./asm_test/win/i/all.c:2958:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	160(%rsp), %rdx	 ; parser, tmp151
	movq	%rdx, 32(%rsp)	 ; tmp151,
	movq	%r14, %r9	 ; now_scope,
	movl	%eax, %r8d	 ; next_prec,
	movq	%rsi, %rdx	 ; <retval>,
	movq	%rdi, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rsi	 ; tmp144, <retval>
 ; ./asm_test/win/i/all.c:2959:             if (right == NULL) {
	testq	%rax, %rax	 ; <retval>
	jne	.L908	 ;,
	jmp	.L897	 ;
.L900:
 ; ./asm_test/win/i/all.c:2964:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rsi, %r9	 ; <retval>,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; expr_left,
	movl	%r12d, %ecx	 ; op,
	call	create_expression	 ;
	movq	%rax, %r13	 ; tmp146, expr_left
 ; ./asm_test/win/i/all.c:2965:         token = peek_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; ./asm_test/win/i/all.c:2939:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_54->type
	jne	.L909	 ;,
.L902:
 ; ./asm_test/win/i/all.c:2940:         OperatorType op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_67->lexeme, token_67->lexeme
	call	string_to_operator	 ;
	movl	%eax, %r12d	 ; tmp135, op
 ; ./asm_test/win/i/all.c:2941:         int op_prec = operator_precedence(op);
	movl	%eax, %ecx	 ; op,
	call	operator_precedence	 ;
	movl	%eax, %ebp	 ; tmp136, op_prec
 ; ./asm_test/win/i/all.c:2942:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, %r12d	 ;, op
	je	.L904	 ;,
	cmpl	%r15d, %eax	 ; min_prec, op_prec
	jl	.L904	 ;,
 ; ./asm_test/win/i/all.c:2944:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2945:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp137, token
 ; ./asm_test/win/i/all.c:2946:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	160(%rsp), %r8	 ; parser,
	movq	%r14, %rdx	 ; now_scope,
	movq	%rdi, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %rsi	 ; tmp138, <retval>
 ; ./asm_test/win/i/all.c:2947:         if (right_primary == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L910	 ;,
 ; ./asm_test/win/i/all.c:2951:         Expression* right = create_expression(OP_NONE, NULL, right_primary, NULL);
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; <retval>,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rsi	 ; tmp140, <retval>
 ; ./asm_test/win/i/all.c:2952:         token = peek_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; ./asm_test/win/i/all.c:2953:         while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_44->type
	je	.L901	 ;,
	jmp	.L900	 ;
.L909:
 ; ./asm_test/win/i/all.c:2968:     return expr_left;
	movq	%r13, %rsi	 ; expr_left, <retval>
	jmp	.L897	 ;
.L904:
	movq	%r13, %rsi	 ; expr_left, <retval>
.L897:
 ; ./asm_test/win/i/all.c:2969: }
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
.LC151:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse expression primary\12\0"
	.text
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp101, lexer
	movq	%rdx, %rsi	 ; tmp102, now_scope
	movq	%r8, %rbp	 ; tmp103, parser
 ; ./asm_test/win/i/all.c:2971:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %rbx	 ; tmp104, <retval>
 ; ./asm_test/win/i/all.c:2972:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L915	 ;,
 ; ./asm_test/win/i/all.c:2976:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; <retval>,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rdx	 ; tmp106, _9
 ; ./asm_test/win/i/all.c:2976:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbp, 32(%rsp)	 ; parser,
	movq	%rsi, %r9	 ; now_scope,
	movl	$0, %r8d	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rbx	 ; tmp107, <retval>
.L911:
 ; ./asm_test/win/i/all.c:2977: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L915:
 ; ./asm_test/win/i/all.c:2973:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse expression primary\n", parser->source_file->path, lexer->current_token->line + 1, lexer->current_token->column + 1);
	movq	80(%rdi), %rax	 ; lexer_13(D)->current_token, _1
 ; ./asm_test/win/i/all.c:2973:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse expression primary\n", parser->source_file->path, lexer->current_token->line + 1, lexer->current_token->column + 1);
	movq	16(%rax), %rdi	 ; _1->column, tmp109
	addq	$1, %rdi	 ;, _3
	movq	8(%rax), %rsi	 ; _1->line, _1->line
	addq	$1, %rsi	 ;, _5
	movq	0(%rbp), %rax	 ; parser_15(D)->source_file, parser_15(D)->source_file
	movq	24(%rax), %rbp	 ; _6->path, _7
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp105, _8
 ; ./asm_test/win/i/all.c:2973:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse expression primary\n", parser->source_file->path, lexer->current_token->line + 1, lexer->current_token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _3,
	movq	%rsi, %r9	 ; _5,
	movq	%rbp, %r8	 ; _7,
	leaq	.LC151(%rip), %rdx	 ;, tmp99
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2974:         return NULL;
	jmp	.L911	 ;
	.section .rdata,"dr"
	.align 8
.LC152:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse parenthesized expression\12\0"
	.align 8
.LC153:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after expression\12\0"
	.align 8
.LC154:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '!'\12\0"
	.align 8
.LC155:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '-'\12\0"
	.align 8
.LC156:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot call undefined variable\12\0"
	.align 8
.LC157:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot call non-function variable\12\0"
	.align 8
.LC158:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function call argument\12\0"
	.align 8
.LC159:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function call argument\12\0"
	.align 8
.LC160:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse sequence index\12\0"
	.align 8
.LC161:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ']' after sequence index\12\0"
	.align 8
.LC162:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot access attribute without a valid scope\12\0"
	.align 8
.LC163:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected attribute name after '.'\12\0"
	.align 8
.LC164:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown attribute name\12\0"
	.align 8
.LC165:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse variable access\12\0"
	.align 8
.LC166:
	.ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in primary expression\12\0"
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
	subq	$88, %rsp	 ;,
	movq	%rdx, 168(%rsp)	 ; tmp371, now_scope
	movq	%r8, 176(%rsp)	 ; tmp372, parser
 ; ./asm_test/win/i/all.c:2980:     token = lexer->current_token;
	movq	80(%rcx), %rdi	 ; lexer_69(D)->current_token, token
 ; ./asm_test/win/i/all.c:2986:     if (token->type == INTEGER) {
	movl	24(%rdi), %eax	 ; token_70->type, _1
 ; ./asm_test/win/i/all.c:2986:     if (token->type == INTEGER) {
	cmpl	$2, %eax	 ;, _1
	je	.L970	 ;,
	movq	%rcx, %rbx	 ; tmp370, lexer
 ; ./asm_test/win/i/all.c:2989:     } else if (token->type == FLOAT) {
	cmpl	$3, %eax	 ;, _1
	je	.L971	 ;,
 ; ./asm_test/win/i/all.c:2992:     } else if (token->type == STRING) {
	cmpl	$4, %eax	 ;, _1
	je	.L972	 ;,
 ; ./asm_test/win/i/all.c:2995:     } else if (token->type == KEYWORD && token->lexeme == keywordList[11]) {
	cmpl	$6, %eax	 ;, _1
	je	.L973	 ;,
 ; ./asm_test/win/i/all.c:3001:     } else if (token->type == SYMBOL && token->lexeme == symbolList[0]) {
	cmpl	$5, %eax	 ;, _1
	je	.L974	 ;,
 ; ./asm_test/win/i/all.c:3030:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && token->lexeme == keywordList[5] && parser->in_method)) {
	cmpl	$1, %eax	 ;, _1
	je	.L930	 ;,
.L929:
 ; ./asm_test/win/i/all.c:3038:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unexpected token in primary expression\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rdi), %rax	 ; token_70->column, tmp477
	leaq	1(%rax), %rsi	 ;, _54
	movq	8(%rdi), %rbx	 ; token_70->line, token_70->line
	addq	$1, %rbx	 ;, _56
	movq	176(%rsp), %rax	 ; parser, tmp478
	movq	(%rax), %rax	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	24(%rax), %rdi	 ; _57->path, _58
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp417, _59
 ; ./asm_test/win/i/all.c:3038:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unexpected token in primary expression\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _54,
	movq	%rbx, %r9	 ; _56,
	movq	%rdi, %r8	 ; _58,
	leaq	.LC166(%rip), %rdx	 ;, tmp364
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3039:         return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L916	 ;
.L970:
 ; ./asm_test/win/i/all.c:2988:         str_value = token->lexeme;
	movq	(%rdi), %rdx	 ; token_70->lexeme, str_value
 ; ./asm_test/win/i/all.c:2985:     VariableAccess* variable_value = NULL;
	movl	$0, %r15d	 ;, variable_value
 ; ./asm_test/win/i/all.c:2984:     Primary* prim_value = NULL;
	movl	$0, %ebx	 ;, prim_value
 ; ./asm_test/win/i/all.c:2983:     Expression* expr_value = NULL;
	movl	$0, %esi	 ;, <retval>
 ; ./asm_test/win/i/all.c:2987:         type = PRIM_INTEGER;
	movl	$0, %ecx	 ;, type
.L918:
 ; ./asm_test/win/i/all.c:3041:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%r15, 32(%rsp)	 ; variable_value,
	movq	%rbx, %r9	 ; prim_value,
	movq	%rsi, %r8	 ; <retval>,
	call	create_primary	 ;
	movq	%rax, %rsi	 ; tmp418, <retval>
.L916:
 ; ./asm_test/win/i/all.c:3042: }
	movq	%rsi, %rax	 ; <retval>,
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
.L971:
 ; ./asm_test/win/i/all.c:2991:         str_value = token->lexeme;
	movq	(%rdi), %rdx	 ; token_70->lexeme, str_value
 ; ./asm_test/win/i/all.c:2985:     VariableAccess* variable_value = NULL;
	movl	$0, %r15d	 ;, variable_value
 ; ./asm_test/win/i/all.c:2984:     Primary* prim_value = NULL;
	movl	$0, %ebx	 ;, prim_value
 ; ./asm_test/win/i/all.c:2983:     Expression* expr_value = NULL;
	movl	$0, %esi	 ;, <retval>
 ; ./asm_test/win/i/all.c:2990:         type = PRIM_FLOAT;
	movl	$1, %ecx	 ;, type
	jmp	.L918	 ;
.L972:
 ; ./asm_test/win/i/all.c:2994:         str_value = token->lexeme;
	movq	(%rdi), %rdx	 ; token_70->lexeme, str_value
 ; ./asm_test/win/i/all.c:2985:     VariableAccess* variable_value = NULL;
	movl	$0, %r15d	 ;, variable_value
 ; ./asm_test/win/i/all.c:2984:     Primary* prim_value = NULL;
	movl	$0, %ebx	 ;, prim_value
 ; ./asm_test/win/i/all.c:2983:     Expression* expr_value = NULL;
	movl	$0, %esi	 ;, <retval>
 ; ./asm_test/win/i/all.c:2993:         type = PRIM_STRING;
	movl	$2, %ecx	 ;, type
	jmp	.L918	 ;
.L973:
 ; ./asm_test/win/i/all.c:2995:     } else if (token->type == KEYWORD && token->lexeme == keywordList[11]) {
	movq	(%rdi), %rax	 ; token_70->lexeme, _2
 ; ./asm_test/win/i/all.c:2995:     } else if (token->type == KEYWORD && token->lexeme == keywordList[11]) {
	movq	88+keywordList(%rip), %rdx	 ; keywordList[11], str_value
 ; ./asm_test/win/i/all.c:2995:     } else if (token->type == KEYWORD && token->lexeme == keywordList[11]) {
	cmpq	%rdx, %rax	 ; str_value, _2
	je	.L957	 ;,
 ; ./asm_test/win/i/all.c:2998:     } else if (token->type == KEYWORD && token->lexeme == keywordList[12]) {
	movq	96+keywordList(%rip), %rdx	 ; keywordList[12], str_value
 ; ./asm_test/win/i/all.c:2998:     } else if (token->type == KEYWORD && token->lexeme == keywordList[12]) {
	cmpq	%rdx, %rax	 ; str_value, _2
	je	.L975	 ;,
 ; ./asm_test/win/i/all.c:3030:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && token->lexeme == keywordList[5] && parser->in_method)) {
	movq	40+keywordList(%rip), %rax	 ; keywordList[5], tmp446
	cmpq	%rax, (%rdi)	 ; tmp446, token_70->lexeme
	jne	.L929	 ;,
 ; ./asm_test/win/i/all.c:3030:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && token->lexeme == keywordList[5] && parser->in_method)) {
	movq	176(%rsp), %rax	 ; parser, tmp447
	cmpb	$0, 9(%rax)	 ;, parser_74(D)->in_method
	je	.L929	 ;,
.L930:
 ; ./asm_test/win/i/all.c:3052:     base_name = search_name(now_scope, token->lexeme);
	movq	(%rdi), %rdx	 ; token_70->lexeme, token_70->lexeme
	movq	168(%rsp), %rcx	 ; now_scope,
	call	search_name	 ;
	movq	%rax, %rsi	 ; tmp384, base_name
 ; ./asm_test/win/i/all.c:3053:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; base_name,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, %r15	 ; tmp385, variable_value
 ; ./asm_test/win/i/all.c:3054:     token = peek_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; ./asm_test/win/i/all.c:3055:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_120->type
	jne	.L931	 ;,
 ; ./asm_test/win/i/all.c:3049:     Symbol* current_type = NULL;
	movl	$0, %ebp	 ;, class_name
 ; ./asm_test/win/i/all.c:3051:     SymbolTable* var_scope = NULL;
	movl	$0, %r12d	 ;, var_scope
	movq	%rdi, 72(%rsp)	 ; token, %sfp
	movq	168(%rsp), %rdi	 ; now_scope, now_scope
	jmp	.L955	 ;
.L974:
 ; ./asm_test/win/i/all.c:3001:     } else if (token->type == SYMBOL && token->lexeme == symbolList[0]) {
	movq	(%rdi), %rax	 ; token_70->lexeme, _6
 ; ./asm_test/win/i/all.c:3001:     } else if (token->type == SYMBOL && token->lexeme == symbolList[0]) {
	cmpq	symbolList(%rip), %rax	 ; symbolList[0], _6
	je	.L976	 ;,
 ; ./asm_test/win/i/all.c:3014:     } else if (token->type == SYMBOL && token->lexeme == symbolList[5]) {
	cmpq	40+symbolList(%rip), %rax	 ; symbolList[5], _6
	je	.L977	 ;,
 ; ./asm_test/win/i/all.c:3022:     } else if (token->type == SYMBOL && token->lexeme == symbolList[12]) {
	cmpq	96+symbolList(%rip), %rax	 ; symbolList[12], _6
	jne	.L929	 ;,
 ; ./asm_test/win/i/all.c:3024:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp381, token
 ; ./asm_test/win/i/all.c:3025:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	176(%rsp), %r8	 ; parser,
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %rbx	 ; tmp382, prim_value
 ; ./asm_test/win/i/all.c:3026:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	je	.L978	 ;,
 ; ./asm_test/win/i/all.c:2985:     VariableAccess* variable_value = NULL;
	movl	$0, %r15d	 ;, variable_value
 ; ./asm_test/win/i/all.c:2983:     Expression* expr_value = NULL;
	movl	$0, %esi	 ;, <retval>
 ; ./asm_test/win/i/all.c:2982:     char* str_value = NULL;
	movl	$0, %edx	 ;, str_value
 ; ./asm_test/win/i/all.c:3023:         type = PRIM_NEG_OPERAND;
	movl	$7, %ecx	 ;, type
	jmp	.L918	 ;
.L976:
 ; ./asm_test/win/i/all.c:3003:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp373, token
 ; ./asm_test/win/i/all.c:3004:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	176(%rsp), %r8	 ; parser,
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %rsi	 ; tmp374, <retval>
 ; ./asm_test/win/i/all.c:3005:         if (expr_value == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L979	 ;,
 ; ./asm_test/win/i/all.c:3009:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:3010:         if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movl	24(%rax), %ecx	 ; token_78->type, type
 ; ./asm_test/win/i/all.c:3010:         if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpl	$5, %ecx	 ;, type
	jne	.L927	 ;,
 ; ./asm_test/win/i/all.c:3010:         if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movq	8+symbolList(%rip), %rdi	 ; symbolList[1], tmp439
	cmpq	%rdi, (%rax)	 ; tmp439, token_78->lexeme
	jne	.L927	 ;,
 ; ./asm_test/win/i/all.c:2985:     VariableAccess* variable_value = NULL;
	movl	$0, %r15d	 ;, variable_value
 ; ./asm_test/win/i/all.c:2984:     Primary* prim_value = NULL;
	movl	$0, %ebx	 ;, prim_value
 ; ./asm_test/win/i/all.c:2982:     char* str_value = NULL;
	movl	$0, %edx	 ;, str_value
	jmp	.L918	 ;
.L979:
 ; ./asm_test/win/i/all.c:3006:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse parenthesized expression\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rdi), %rax	 ; token_72->column, tmp437
	leaq	1(%rax), %rbp	 ;, _9
	movq	8(%rdi), %rbx	 ; token_72->line, token_72->line
	addq	$1, %rbx	 ;, _11
	movq	176(%rsp), %rax	 ; parser, tmp438
	movq	(%rax), %rax	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	24(%rax), %rdi	 ; _12->path, _13
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp375, _14
 ; ./asm_test/win/i/all.c:3006:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse parenthesized expression\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbp, 32(%rsp)	 ; _9,
	movq	%rbx, %r9	 ; _11,
	movq	%rdi, %r8	 ; _13,
	leaq	.LC152(%rip), %rdx	 ;, tmp267
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3007:             return NULL;
	jmp	.L916	 ;
.L927:
 ; ./asm_test/win/i/all.c:3011:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after expression\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_78->column, tmp440
	leaq	1(%rdi), %rsi	 ;, _19
	movq	8(%rax), %rbx	 ; token_78->line, token_78->line
	addq	$1, %rbx	 ;, _21
	movq	176(%rsp), %rax	 ; parser, tmp441
	movq	(%rax), %rax	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	24(%rax), %rdi	 ; _22->path, _23
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp377, _24
 ; ./asm_test/win/i/all.c:3011:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after expression\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _19,
	movq	%rbx, %r9	 ; _21,
	movq	%rdi, %r8	 ; _23,
	leaq	.LC153(%rip), %rdx	 ;, tmp274
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3012:             return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L916	 ;
.L977:
 ; ./asm_test/win/i/all.c:3016:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp378, token
 ; ./asm_test/win/i/all.c:3017:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	176(%rsp), %r8	 ; parser,
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %rbx	 ; tmp379, prim_value
 ; ./asm_test/win/i/all.c:3018:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	je	.L980	 ;,
 ; ./asm_test/win/i/all.c:2985:     VariableAccess* variable_value = NULL;
	movl	$0, %r15d	 ;, variable_value
 ; ./asm_test/win/i/all.c:2983:     Expression* expr_value = NULL;
	movl	$0, %esi	 ;, <retval>
 ; ./asm_test/win/i/all.c:2982:     char* str_value = NULL;
	movl	$0, %edx	 ;, str_value
 ; ./asm_test/win/i/all.c:3015:         type = PRIM_NOT_OPERAND;
	movl	$6, %ecx	 ;, type
	jmp	.L918	 ;
.L980:
 ; ./asm_test/win/i/all.c:3019:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '!'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	 ; token_84->column, tmp442
	leaq	1(%rax), %rdi	 ;, _28
	movq	8(%rsi), %rsi	 ; token_84->line, token_84->line
	addq	$1, %rsi	 ;, _30
	movq	176(%rsp), %rax	 ; parser, tmp443
	movq	(%rax), %rax	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	24(%rax), %rbp	 ; _31->path, _32
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp380, _33
 ; ./asm_test/win/i/all.c:3019:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '!'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _28,
	movq	%rsi, %r9	 ; _30,
	movq	%rbp, %r8	 ; _32,
	leaq	.LC154(%rip), %rdx	 ;, tmp280
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3020:             return NULL;
	movq	%rbx, %rsi	 ; prim_value, <retval>
	jmp	.L916	 ;
.L978:
 ; ./asm_test/win/i/all.c:3027:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '-'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	 ; token_90->column, tmp444
	leaq	1(%rax), %rdi	 ;, _37
	movq	8(%rsi), %rsi	 ; token_90->line, token_90->line
	addq	$1, %rsi	 ;, _39
	movq	176(%rsp), %rax	 ; parser, tmp445
	movq	(%rax), %rax	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	24(%rax), %rbp	 ; _40->path, _41
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp383, _42
 ; ./asm_test/win/i/all.c:3027:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '-'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _37,
	movq	%rsi, %r9	 ; _39,
	movq	%rbp, %r8	 ; _41,
	leaq	.LC155(%rip), %rdx	 ;, tmp286
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3028:             return NULL;
	movq	%rbx, %rsi	 ; prim_value, <retval>
	jmp	.L916	 ;
.L933:
 ; ./asm_test/win/i/all.c:3063:         if (token->lexeme == symbolList[0]) {
	movq	(%rax), %rax	 ; token_326->lexeme, _132
 ; ./asm_test/win/i/all.c:3063:         if (token->lexeme == symbolList[0]) {
	cmpq	symbolList(%rip), %rax	 ; symbolList[0], _132
	je	.L981	 ;,
 ; ./asm_test/win/i/all.c:3095:         } else if (token->lexeme == symbolList[7]) {
	cmpq	56+symbolList(%rip), %rax	 ; symbolList[7], _132
	je	.L982	 ;,
 ; ./asm_test/win/i/all.c:3107:         } else if (token->lexeme == symbolList[6]) {
	cmpq	48+symbolList(%rip), %rax	 ; symbolList[6], _132
	jne	.L968	 ;,
 ; ./asm_test/win/i/all.c:3108:             token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:3109:             token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r14	 ; tmp407, token
 ; ./asm_test/win/i/all.c:3110:             if (var_scope == NULL) {
	testq	%r12, %r12	 ; var_scope
	je	.L983	 ;,
 ; ./asm_test/win/i/all.c:3114:             if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_219->type
	jne	.L984	 ;,
 ; ./asm_test/win/i/all.c:3118:             base_name = search_name(var_scope, token->lexeme);
	movq	(%rax), %r13	 ; token_219->lexeme, _236
	movq	%r13, %rdx	 ; _236,
	movq	%r12, %rcx	 ; var_scope,
	call	search_name	 ;
	movq	%rax, %rsi	 ; tmp410, base_name
 ; ./asm_test/win/i/all.c:3119:             if (base_name == NULL) {
	testq	%rax, %rax	 ; base_name
	je	.L985	 ;,
.L952:
 ; ./asm_test/win/i/all.c:3134:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rsi, %r8	 ; base_name,
	movq	%r15, %rdx	 ; variable_value,
	movl	$2, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, %r15	 ; tmp414, variable_value
 ; ./asm_test/win/i/all.c:3136:             var_scope = NULL;
	movl	$0, %r12d	 ;, var_scope
 ; ./asm_test/win/i/all.c:3135:             current_type = NULL;
	movl	$0, %ebp	 ;, class_name
.L945:
 ; ./asm_test/win/i/all.c:3139:         token = peek_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; ./asm_test/win/i/all.c:3055:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_255->type
	jne	.L986	 ;,
.L955:
 ; ./asm_test/win/i/all.c:3056:         if (base_name != NULL) {
	testq	%rsi, %rsi	 ; base_name
	je	.L932	 ;,
 ; ./asm_test/win/i/all.c:3058:             if (base_name->type != NULL)
	movq	(%rsi), %rbp	 ; base_name_324->type, class_name
 ; ./asm_test/win/i/all.c:3057:             current_type = base_name;
	testq	%rbp, %rbp	 ; class_name
	cmove	%rsi, %rbp	 ; class_name,, base_name, class_name
.L932:
 ; ./asm_test/win/i/all.c:3061:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	testq	%r12, %r12	 ; var_scope
	jne	.L933	 ;,
	testq	%rbp, %rbp	 ; class_name
	je	.L933	 ;,
 ; ./asm_test/win/i/all.c:3061:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rbp)	 ;, current_type_125->kind
	jne	.L933	 ;,
 ; ./asm_test/win/i/all.c:3062:             var_scope = current_type->ast_node.class->class_scope;
	movq	24(%rbp), %rdx	 ; current_type_125->ast_node.class, current_type_125->ast_node.class
	movq	16(%rdx), %r12	 ; _129->class_scope, var_scope
	jmp	.L933	 ;
.L981:
 ; ./asm_test/win/i/all.c:3064:             token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp387, token
 ; ./asm_test/win/i/all.c:3065:             if (base_name == NULL)
	testq	%rsi, %rsi	 ; base_name
	je	.L987	 ;,
 ; ./asm_test/win/i/all.c:3067:             else if (base_name->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rsi)	 ;, base_name_324->kind
	je	.L988	 ;,
.L937:
 ; ./asm_test/win/i/all.c:3072:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	movl	32(%rsi), %eax	 ; base_name_152->kind, tmp450
	subl	$1, %eax	 ;, tmp304
	cmpl	$1, %eax	 ;, tmp304
	ja	.L989	 ;,
.L936:
 ; ./asm_test/win/i/all.c:3074:             token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp393, token
 ; ./asm_test/win/i/all.c:3075:             List* args = create_list();
	call	create_list	 ;
	movq	%rax, %r14	 ; tmp394, args
 ; ./asm_test/win/i/all.c:3076:             while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	leaq	symbolList(%rip), %r13	 ;, tmp366
 ; ./asm_test/win/i/all.c:3076:             while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	jmp	.L938	 ;
.L987:
 ; ./asm_test/win/i/all.c:3066:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot call undefined variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rax	 ; token_134->column, tmp448
	leaq	1(%rax), %r12	 ;, _136
	movq	8(%rbp), %rbp	 ; token_134->line, token_134->line
	addq	$1, %rbp	 ;, _138
	movq	176(%rsp), %rax	 ; parser, tmp449
	movq	(%rax), %rax	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	24(%rax), %r13	 ; _139->path, _140
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp388, _141
 ; ./asm_test/win/i/all.c:3066:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot call undefined variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r12, 32(%rsp)	 ; _136,
	movq	%rbp, %r9	 ; _138,
	movq	%r13, %r8	 ; _140,
	leaq	.LC156(%rip), %rdx	 ;, tmp300
	call	fprintf	 ;
	jmp	.L936	 ;
.L988:
 ; ./asm_test/win/i/all.c:3068:                 char* name = make_method_name(base_name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	8(%rsi), %rcx	 ; base_name_324->name, base_name_324->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME,
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp389, name
 ; ./asm_test/win/i/all.c:3069:                 base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
	movq	24(%rsi), %rax	 ; base_name_324->ast_node.class, base_name_324->ast_node.class
	movq	16(%rax), %rcx	 ; _146->class_scope, _147
	call	search_name_use_strcmp	 ;
	movq	%rax, %rsi	 ; tmp390, base_name
 ; ./asm_test/win/i/all.c:3070:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; base_name,
	movq	%r15, %rdx	 ; variable_value,
	movl	$2, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, %r15	 ; tmp391, variable_value
 ; ./asm_test/win/i/all.c:3072:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	testq	%rsi, %rsi	 ; base_name
	jne	.L937	 ;,
	jmp	.L936	 ;
.L989:
 ; ./asm_test/win/i/all.c:3073:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot call non-function variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbp), %rax	 ; token_134->column, tmp451
	leaq	1(%rax), %r12	 ;, _155
	movq	8(%rbp), %rbp	 ; token_134->line, token_134->line
	addq	$1, %rbp	 ;, _157
	movq	176(%rsp), %rax	 ; parser, tmp452
	movq	(%rax), %rax	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	24(%rax), %r13	 ; _158->path, _159
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp392, _160
 ; ./asm_test/win/i/all.c:3073:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot call non-function variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r12, 32(%rsp)	 ; _155,
	movq	%rbp, %r9	 ; _157,
	movq	%r13, %r8	 ; _159,
	leaq	.LC157(%rip), %rdx	 ;, tmp310
	call	fprintf	 ;
	jmp	.L936	 ;
.L992:
 ; ./asm_test/win/i/all.c:3079:                     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function call argument\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbp), %rax	 ; token_164->column, tmp454
	addq	$1, %rax	 ;, _166
	movq	%rax, 56(%rsp)	 ; _166, %sfp
	movq	8(%rbp), %rax	 ; token_164->line, token_164->line
	leaq	1(%rax), %rcx	 ;, _168
	movq	%rcx, 64(%rsp)	 ; _168, %sfp
	movq	176(%rsp), %rdx	 ; parser, tmp456
	movq	(%rdx), %rax	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	24(%rax), %rbp	 ; _169->path, _170
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp396, _171
 ; ./asm_test/win/i/all.c:3079:                     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function call argument\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	56(%rsp), %rax	 ; %sfp, _166
	movq	%rax, 32(%rsp)	 ; _166,
	movq	64(%rsp), %r9	 ; %sfp,
	movq	%rbp, %r8	 ; _170,
	leaq	.LC158(%rip), %rdx	 ;,
	call	fprintf	 ;
	jmp	.L939	 ;
.L993:
 ; ./asm_test/win/i/all.c:3082:                 if (token->type == SYMBOL && token->lexeme == symbolList[4])
	movq	(%rax), %rax	 ; token_172->lexeme, _174
 ; ./asm_test/win/i/all.c:3082:                 if (token->type == SYMBOL && token->lexeme == symbolList[4])
	cmpq	32(%r13), %rax	 ; symbolList[4], _174
	je	.L990	 ;,
 ; ./asm_test/win/i/all.c:3084:                 else if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpq	8(%r13), %rax	 ; symbolList[1], _174
	jne	.L940	 ;,
.L938:
 ; ./asm_test/win/i/all.c:3076:             while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpl	$5, 24(%rbp)	 ;, token_164->type
	jne	.L944	 ;,
 ; ./asm_test/win/i/all.c:3076:             while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movq	8(%r13), %rax	 ; symbolList[1], tmp460
	cmpq	%rax, 0(%rbp)	 ; tmp460, token_164->lexeme
	je	.L991	 ;,
.L944:
 ; ./asm_test/win/i/all.c:3077:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	176(%rsp), %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %r12	 ; tmp395, arg
 ; ./asm_test/win/i/all.c:3078:                 if (arg == NULL)
	testq	%rax, %rax	 ; arg
	je	.L992	 ;,
.L939:
 ; ./asm_test/win/i/all.c:3080:                 list_append(args, (size_t*)arg);
	movq	%r12, %rdx	 ; arg,
	movq	%r14, %rcx	 ; args,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3081:                 token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp397, token
 ; ./asm_test/win/i/all.c:3082:                 if (token->type == SYMBOL && token->lexeme == symbolList[4])
	cmpl	$5, 24(%rax)	 ;, token_172->type
	je	.L993	 ;,
.L940:
 ; ./asm_test/win/i/all.c:3085:                     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function call argument\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	72(%rsp), %rdi	 ; %sfp, token
	movq	16(%rbp), %rax	 ; token_172->column, tmp458
	leaq	1(%rax), %rsi	 ;, _180
	movq	8(%rbp), %rbx	 ; token_172->line, token_172->line
	addq	$1, %rbx	 ;, _182
	movq	176(%rsp), %rax	 ; parser, tmp459
	movq	(%rax), %rax	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	24(%rax), %rbp	 ; _183->path, _184
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp399, _185
 ; ./asm_test/win/i/all.c:3085:                     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function call argument\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _180,
	movq	%rbx, %r9	 ; _182,
	movq	%rbp, %r8	 ; _184,
	leaq	.LC159(%rip), %rdx	 ;, tmp322
	call	fprintf	 ;
.L956:
 ; ./asm_test/win/i/all.c:3034:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse variable access\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rdi), %rax	 ; token_70->column, tmp475
	leaq	1(%rax), %rsi	 ;, _47
	movq	8(%rdi), %rbx	 ; token_70->line, token_70->line
	addq	$1, %rbx	 ;, _49
	movq	176(%rsp), %rax	 ; parser, tmp476
	movq	(%rax), %rax	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	24(%rax), %rdi	 ; _50->path, _51
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp416, _52
 ; ./asm_test/win/i/all.c:3034:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse variable access\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _47,
	movq	%rbx, %r9	 ; _49,
	movq	%rdi, %r8	 ; _51,
	leaq	.LC165(%rip), %rdx	 ;, tmp359
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3035:             return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L916	 ;
.L990:
 ; ./asm_test/win/i/all.c:3083:                     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp398, token
 ; ./asm_test/win/i/all.c:3083:                     token = get_next_token(lexer, 1);
	jmp	.L938	 ;
.L991:
 ; ./asm_test/win/i/all.c:3089:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%r14, 32(%rsp)	 ; args,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%r15, %rdx	 ; variable_value,
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, %r15	 ; tmp400, variable_value
 ; ./asm_test/win/i/all.c:3090:             base_name = base_name->type;
	movq	(%rsi), %rsi	 ; base_name_191->type, base_name
 ; ./asm_test/win/i/all.c:3093:             if (base_name->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rsi)	 ;, base_name_192->kind
	jne	.L963	 ;,
 ; ./asm_test/win/i/all.c:3094:                 var_scope = base_name->ast_node.class->class_scope;
	movq	24(%rsi), %rax	 ; base_name_192->ast_node.class, base_name_192->ast_node.class
	movq	16(%rax), %r12	 ; _194->class_scope, var_scope
 ; ./asm_test/win/i/all.c:3091:             current_type = NULL;
	movl	$0, %ebp	 ;, class_name
	jmp	.L945	 ;
.L982:
 ; ./asm_test/win/i/all.c:3096:             token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:3097:             token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r14	 ; tmp401, token
 ; ./asm_test/win/i/all.c:3098:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	176(%rsp), %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %r13	 ; tmp402, index
 ; ./asm_test/win/i/all.c:3099:             if (index == NULL)
	testq	%rax, %rax	 ; index
	je	.L994	 ;,
.L947:
 ; ./asm_test/win/i/all.c:3101:             token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:3102:             if (token->type != SYMBOL || token->lexeme != symbolList[8]) {
	cmpl	$5, 24(%rax)	 ;, token_206->type
	jne	.L948	 ;,
 ; ./asm_test/win/i/all.c:3102:             if (token->type != SYMBOL || token->lexeme != symbolList[8]) {
	movq	64+symbolList(%rip), %rcx	 ; symbolList[8], tmp466
	cmpq	%rcx, (%rax)	 ; tmp466, token_206->lexeme
	jne	.L948	 ;,
 ; ./asm_test/win/i/all.c:3106:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movq	$0, 32(%rsp)	 ;,
	movq	%r13, %r9	 ; index,
	movl	$0, %r8d	 ;,
	movq	%r15, %rdx	 ; variable_value,
	movl	$3, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, %r15	 ; tmp406, variable_value
	jmp	.L945	 ;
.L994:
 ; ./asm_test/win/i/all.c:3100:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse sequence index\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r14), %rax	 ; token_197->column, tmp462
	addq	$1, %rax	 ;, _200
	movq	%rax, 56(%rsp)	 ; _200, %sfp
	movq	8(%r14), %rax	 ; token_197->line, token_197->line
	leaq	1(%rax), %rcx	 ;, _202
	movq	%rcx, 64(%rsp)	 ; _202, %sfp
	movq	176(%rsp), %rdx	 ; parser, tmp464
	movq	(%rdx), %rax	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	24(%rax), %r14	 ; _203->path, _204
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp403, _205
 ; ./asm_test/win/i/all.c:3100:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse sequence index\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	56(%rsp), %rax	 ; %sfp, _200
	movq	%rax, 32(%rsp)	 ; _200,
	movq	64(%rsp), %r9	 ; %sfp,
	movq	%r14, %r8	 ; _204,
	leaq	.LC160(%rip), %rdx	 ;, tmp331
	call	fprintf	 ;
	jmp	.L947	 ;
.L948:
 ; ./asm_test/win/i/all.c:3103:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ']' after sequence index\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	72(%rsp), %rdi	 ; %sfp, token
	movq	16(%rax), %rbx	 ; token_206->column, tmp467
	leaq	1(%rbx), %rsi	 ;, _211
	movq	8(%rax), %rbx	 ; token_206->line, token_206->line
	addq	$1, %rbx	 ;, _213
	movq	176(%rsp), %rax	 ; parser, tmp468
	movq	(%rax), %rax	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	24(%rax), %rbp	 ; _214->path, _215
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp405, _216
 ; ./asm_test/win/i/all.c:3103:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ']' after sequence index\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _211,
	movq	%rbx, %r9	 ; _213,
	movq	%rbp, %r8	 ; _215,
	leaq	.LC161(%rip), %rdx	 ;, tmp338
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3104:                 return NULL;
	jmp	.L956	 ;
.L983:
 ; ./asm_test/win/i/all.c:3111:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot access attribute without a valid scope\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	72(%rsp), %rdi	 ; %sfp, token
	movq	16(%rax), %rax	 ; token_219->column, tmp469
	leaq	1(%rax), %rsi	 ;, _222
	movq	8(%r14), %rbx	 ; token_219->line, token_219->line
	addq	$1, %rbx	 ;, _224
	movq	176(%rsp), %rax	 ; parser, tmp470
	movq	(%rax), %rax	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	24(%rax), %rbp	 ; _225->path, _226
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp408, _227
 ; ./asm_test/win/i/all.c:3111:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot access attribute without a valid scope\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _222,
	movq	%rbx, %r9	 ; _224,
	movq	%rbp, %r8	 ; _226,
	leaq	.LC162(%rip), %rdx	 ;, tmp344
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3112:                 return NULL;
	jmp	.L956	 ;
.L984:
 ; ./asm_test/win/i/all.c:3115:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected attribute name after '.'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	72(%rsp), %rdi	 ; %sfp, token
	movq	16(%rax), %rax	 ; token_219->column, tmp471
	leaq	1(%rax), %rsi	 ;, _230
	movq	8(%r14), %rbx	 ; token_219->line, token_219->line
	addq	$1, %rbx	 ;, _232
	movq	176(%rsp), %rax	 ; parser, tmp472
	movq	(%rax), %rax	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	24(%rax), %rbp	 ; _233->path, _234
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp409, _235
 ; ./asm_test/win/i/all.c:3115:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected attribute name after '.'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _230,
	movq	%rbx, %r9	 ; _232,
	movq	%rbp, %r8	 ; _234,
	leaq	.LC163(%rip), %rdx	 ;, tmp349
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3116:                 return NULL;
	jmp	.L956	 ;
.L985:
 ; ./asm_test/win/i/all.c:3121:                 if (current_type != NULL) {
	testq	%rbp, %rbp	 ; class_name
	je	.L953	 ;,
 ; ./asm_test/win/i/all.c:3122:                     if (current_type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rbp)	 ;, current_type_125->kind
	jne	.L954	 ;,
 ; ./asm_test/win/i/all.c:3123:                         class_name = current_type->name;
	movq	8(%rbp), %rbp	 ; current_type_125->name, class_name
.L953:
 ; ./asm_test/win/i/all.c:3127:                 char* name = make_method_name(class_name, token->lexeme);
	movq	%r13, %rdx	 ; _236,
	movq	%rbp, %rcx	 ; class_name,
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp411, name
 ; ./asm_test/win/i/all.c:3128:                 base_name = search_name_use_strcmp(var_scope, name);
	movq	%r12, %rcx	 ; var_scope,
	call	search_name_use_strcmp	 ;
	movq	%rax, %rsi	 ; tmp412, base_name
 ; ./asm_test/win/i/all.c:3130:             if (base_name == NULL) {
	testq	%rax, %rax	 ; base_name
	jne	.L952	 ;,
 ; ./asm_test/win/i/all.c:3131:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown attribute name\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	72(%rsp), %rdi	 ; %sfp, token
	movq	16(%r14), %rax	 ; token_219->column, tmp473
	leaq	1(%rax), %rsi	 ;, _247
	movq	8(%r14), %rbx	 ; token_219->line, token_219->line
	addq	$1, %rbx	 ;, _249
	movq	176(%rsp), %rax	 ; parser, tmp474
	movq	(%rax), %rax	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	24(%rax), %rbp	 ; _250->path, _251
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp413, _252
 ; ./asm_test/win/i/all.c:3131:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown attribute name\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _247,
	movq	%rbx, %r9	 ; _249,
	movq	%rbp, %r8	 ; _251,
	leaq	.LC164(%rip), %rdx	 ;, tmp354
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3132:                 return NULL;
	jmp	.L956	 ;
.L954:
 ; ./asm_test/win/i/all.c:3124:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	movq	0(%rbp), %rbp	 ; current_type_125->type, class_name
 ; ./asm_test/win/i/all.c:3124:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	testq	%rbp, %rbp	 ; class_name
	je	.L953	 ;,
 ; ./asm_test/win/i/all.c:3124:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rbp)	 ;, _240->kind
	jne	.L964	 ;,
 ; ./asm_test/win/i/all.c:3125:                         class_name = current_type->type->name;
	movq	8(%rbp), %rbp	 ; _240->name, class_name
	jmp	.L953	 ;
.L964:
 ; ./asm_test/win/i/all.c:3120:                 char* class_name = NULL;
	movq	%rax, %rbp	 ; base_name, class_name
	jmp	.L953	 ;
.L963:
 ; ./asm_test/win/i/all.c:3092:             var_scope = NULL;
	movl	$0, %r12d	 ;, var_scope
 ; ./asm_test/win/i/all.c:3091:             current_type = NULL;
	movl	$0, %ebp	 ;, class_name
	jmp	.L945	 ;
.L986:
	movq	72(%rsp), %rdi	 ; %sfp, token
.L931:
 ; ./asm_test/win/i/all.c:3033:         if (variable_value == NULL) {
	testq	%r15, %r15	 ; variable_value
	je	.L956	 ;,
 ; ./asm_test/win/i/all.c:2984:     Primary* prim_value = NULL;
	movl	$0, %ebx	 ;, prim_value
 ; ./asm_test/win/i/all.c:2983:     Expression* expr_value = NULL;
	movl	$0, %esi	 ;, <retval>
 ; ./asm_test/win/i/all.c:2982:     char* str_value = NULL;
	movl	$0, %edx	 ;, str_value
 ; ./asm_test/win/i/all.c:3031:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %ecx	 ;, type
	jmp	.L918	 ;
.L968:
	movq	72(%rsp), %rdi	 ; %sfp, token
	jmp	.L931	 ;
.L957:
 ; ./asm_test/win/i/all.c:2985:     VariableAccess* variable_value = NULL;
	movl	$0, %r15d	 ;, variable_value
 ; ./asm_test/win/i/all.c:2984:     Primary* prim_value = NULL;
	movl	$0, %ebx	 ;, prim_value
 ; ./asm_test/win/i/all.c:2983:     Expression* expr_value = NULL;
	movl	$0, %esi	 ;, <retval>
 ; ./asm_test/win/i/all.c:2996:         type = PRIM_TRUE;
	movl	$3, %ecx	 ;, type
	jmp	.L918	 ;
.L975:
 ; ./asm_test/win/i/all.c:2985:     VariableAccess* variable_value = NULL;
	movl	$0, %r15d	 ;, variable_value
 ; ./asm_test/win/i/all.c:2984:     Primary* prim_value = NULL;
	movl	$0, %ebx	 ;, prim_value
 ; ./asm_test/win/i/all.c:2983:     Expression* expr_value = NULL;
	movl	$0, %esi	 ;, <retval>
 ; ./asm_test/win/i/all.c:2999:         type = PRIM_FALSE;
	movl	$4, %ecx	 ;, type
	jmp	.L918	 ;
	.section .rdata,"dr"
	.align 8
.LC167:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected variable type\12\0"
	.align 8
.LC168:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected a type for variable declaration\12\0"
	.align 8
.LC169:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown variable type\12\0"
	.align 8
.LC170:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected variable name\12\0"
	.align 8
.LC171:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse variable initializer\12\0"
	.text
	.def	parse_variable;	.scl	3;	.type	32;	.endef
parse_variable:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp189, lexer
	movq	%rdx, %r12	 ; tmp190, now_scope
	movq	%r8, %rdi	 ; tmp191, parser
 ; ./asm_test/win/i/all.c:2686:     token = lexer->current_token;
	movq	80(%rcx), %rbp	 ; lexer_62(D)->current_token, token
 ; ./asm_test/win/i/all.c:2687:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	movl	24(%rbp), %eax	 ; token_63->type, _1
 ; ./asm_test/win/i/all.c:2687:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpl	$1, %eax	 ;, _1
	je	.L996	 ;,
 ; ./asm_test/win/i/all.c:2687:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpl	$6, %eax	 ;, _1
	jne	.L997	 ;,
 ; ./asm_test/win/i/all.c:2687:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	movq	0(%rbp), %rax	 ; token_63->lexeme, _2
 ; ./asm_test/win/i/all.c:2687:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	128+keywordList(%rip), %rax	 ; keywordList[16], _2
	je	.L996	 ;,
 ; ./asm_test/win/i/all.c:2687:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	136+keywordList(%rip), %rax	 ; keywordList[17], _2
	je	.L996	 ;,
 ; ./asm_test/win/i/all.c:2687:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	144+keywordList(%rip), %rax	 ; keywordList[18], _2
	je	.L996	 ;,
 ; ./asm_test/win/i/all.c:2687:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	152+keywordList(%rip), %rax	 ; keywordList[19], _2
	je	.L996	 ;,
 ; ./asm_test/win/i/all.c:2687:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	160+keywordList(%rip), %rax	 ; keywordList[20], _2
	jne	.L997	 ;,
.L996:
 ; ./asm_test/win/i/all.c:2691:     Symbol* type = search_name(now_scope, token->lexeme);
	movq	0(%rbp), %rdx	 ; token_63->lexeme, token_63->lexeme
	movq	%r12, %rcx	 ; now_scope,
	call	search_name	 ;
	movq	%rax, %rsi	 ; tmp193, type
 ; ./asm_test/win/i/all.c:2692:     if (type != NULL) {
	testq	%rax, %rax	 ; type
	je	.L999	 ;,
 ; ./asm_test/win/i/all.c:2693:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; type_68->kind, _71
 ; ./asm_test/win/i/all.c:2693:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	cmpl	$6, %eax	 ;, _71
	je	.L1000	 ;,
	testl	%eax, %eax	 ; _71
	jne	.L1009	 ;,
.L1000:
 ; ./asm_test/win/i/all.c:2697:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp196, token
 ; ./asm_test/win/i/all.c:2698:     if (token->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	 ;, token_75->type
	jne	.L1010	 ;,
.L1001:
 ; ./asm_test/win/i/all.c:2700:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movl	$3, %edx	 ;, iftmp.66_56
 ; ./asm_test/win/i/all.c:2700:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	cmpb	$0, 10(%rdi)	 ;, parser_64(D)->in_class
	je	.L1002	 ;,
 ; ./asm_test/win/i/all.c:2700:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	cmpb	$1, 9(%rdi)	 ;, parser_64(D)->in_method
	sbbl	%edx, %edx	 ; iftmp.66_56
	andl	$2, %edx	 ;, iftmp.66_56
	addl	$3, %edx	 ;, iftmp.66_56
.L1002:
 ; ./asm_test/win/i/all.c:2700:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movq	0(%rbp), %rcx	 ; token_75->lexeme, token_75->lexeme
	movq	%r12, %r9	 ; now_scope,
	movq	%rsi, %r8	 ; type,
	call	create_symbol	 ;
	movq	%rax, %rbp	 ; tmp198, name
 ; ./asm_test/win/i/all.c:2702:     token = peek_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; ./asm_test/win/i/all.c:2701:     Expression* value = NULL;
	movl	$0, %r13d	 ;, value
 ; ./asm_test/win/i/all.c:2703:     if (token->type == SYMBOL && token->lexeme == symbolList[18]) {
	cmpl	$5, 24(%rax)	 ;, token_81->type
	je	.L1011	 ;,
.L1003:
 ; ./asm_test/win/i/all.c:2710:     return create_variable(type, name, value);
	movq	%r13, %r8	 ; value,
	movq	%rbp, %rdx	 ; name,
	movq	%rsi, %rcx	 ; type,
	call	create_variable	 ;
.L995:
 ; ./asm_test/win/i/all.c:2711: }
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
.L997:
 ; ./asm_test/win/i/all.c:2688:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected variable type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbp), %rax	 ; token_63->column, tmp205
	leaq	1(%rax), %rsi	 ;, _9
	movq	8(%rbp), %rbx	 ; token_63->line, token_63->line
	addq	$1, %rbx	 ;, _11
	movq	(%rdi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	movq	24(%rax), %rdi	 ; _12->path, _13
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp192, _14
 ; ./asm_test/win/i/all.c:2688:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected variable type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _9,
	movq	%rbx, %r9	 ; _11,
	movq	%rdi, %r8	 ; _13,
	leaq	.LC167(%rip), %rdx	 ;, tmp157
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2689:         return NULL;
	movl	$0, %eax	 ;, <retval>
	jmp	.L995	 ;
.L1009:
 ; ./asm_test/win/i/all.c:2694:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected a type for variable declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbp), %rax	 ; token_63->column, tmp206
	leaq	1(%rax), %r13	 ;, _20
	movq	8(%rbp), %rbp	 ; token_63->line, token_63->line
	addq	$1, %rbp	 ;, _22
	movq	(%rdi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	movq	24(%rax), %r14	 ; _23->path, _24
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp194, _25
 ; ./asm_test/win/i/all.c:2694:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected a type for variable declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r13, 32(%rsp)	 ; _20,
	movq	%rbp, %r9	 ; _22,
	movq	%r14, %r8	 ; _24,
	leaq	.LC168(%rip), %rdx	 ;, tmp167
	call	fprintf	 ;
	jmp	.L1000	 ;
.L999:
 ; ./asm_test/win/i/all.c:2696:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown variable type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbp), %rax	 ; token_63->column, tmp207
	leaq	1(%rax), %r13	 ;, _27
	movq	8(%rbp), %rbp	 ; token_63->line, token_63->line
	addq	$1, %rbp	 ;, _29
	movq	(%rdi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	movq	24(%rax), %r14	 ; _30->path, _31
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp195, _32
 ; ./asm_test/win/i/all.c:2696:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown variable type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r13, 32(%rsp)	 ; _27,
	movq	%rbp, %r9	 ; _29,
	movq	%r14, %r8	 ; _31,
	leaq	.LC169(%rip), %rdx	 ;, tmp172
	call	fprintf	 ;
	jmp	.L1000	 ;
.L1010:
 ; ./asm_test/win/i/all.c:2699:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected variable name\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rax	 ; token_75->column, tmp208
	leaq	1(%rax), %r14	 ;, _35
	movq	8(%rbp), %rax	 ; token_75->line, tmp209
	leaq	1(%rax), %r13	 ;, _37
	movq	(%rdi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	movq	24(%rax), %r15	 ; _38->path, _39
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp197, _40
 ; ./asm_test/win/i/all.c:2699:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected variable name\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r14, 32(%rsp)	 ; _35,
	movq	%r13, %r9	 ; _37,
	movq	%r15, %r8	 ; _39,
	leaq	.LC170(%rip), %rdx	 ;, tmp177
	call	fprintf	 ;
	jmp	.L1001	 ;
.L1011:
 ; ./asm_test/win/i/all.c:2703:     if (token->type == SYMBOL && token->lexeme == symbolList[18]) {
	movq	144+symbolList(%rip), %rcx	 ; symbolList[18], tmp210
	cmpq	%rcx, (%rax)	 ; tmp210, token_81->lexeme
	jne	.L1003	 ;,
 ; ./asm_test/win/i/all.c:2704:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2705:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r14	 ; tmp200, token
 ; ./asm_test/win/i/all.c:2706:         value = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%r12, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %r13	 ; tmp201, value
 ; ./asm_test/win/i/all.c:2707:         if (value == NULL)
	testq	%rax, %rax	 ; value
	jne	.L1003	 ;,
 ; ./asm_test/win/i/all.c:2708:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse variable initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r14), %rax	 ; token_84->column, tmp211
	leaq	1(%rax), %rbx	 ;, _48
	movq	8(%r14), %r12	 ; token_84->line, token_84->line
	addq	$1, %r12	 ;, _50
	movq	(%rdi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	movq	24(%rax), %rdi	 ; _51->path, _52
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp202, _53
 ; ./asm_test/win/i/all.c:2708:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse variable initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _48,
	movq	%r12, %r9	 ; _50,
	movq	%rdi, %r8	 ; _52,
	leaq	.LC171(%rip), %rdx	 ;, tmp185
	call	fprintf	 ;
	jmp	.L1003	 ;
	.section .rdata,"dr"
	.align 8
.LC172:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'if'\12\0"
	.align 8
.LC173:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse if condition\12\0"
	.align 8
.LC174:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after if condition\12\0"
	.align 8
.LC175:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start if body\12\0"
	.align 8
.LC176:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse if body statement\12\0"
	.align 8
.LC177:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'elif'\12\0"
	.align 8
.LC178:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else-if condition\12\0"
	.align 8
.LC179:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after else-if condition\12\0"
	.align 8
.LC180:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start else-if body\12\0"
	.align 8
.LC181:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else-if body statement\12\0"
	.align 8
.LC182:
	.ascii "Error creating else-if statement: condition is NULL\12\0"
	.align 8
.LC183:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start else body\12\0"
	.align 8
.LC184:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else body statement\12\0"
	.align 8
.LC185:
	.ascii "Error creating if statement: condition is NULL\12\0"
	.align 8
.LC186:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'for'\12\0"
	.align 8
.LC187:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop initializer\12\0"
	.align 8
.LC188:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop initializer\12\0"
	.align 8
.LC189:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop condition\12\0"
	.align 8
.LC190:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop condition\12\0"
	.align 8
.LC191:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop increment\12\0"
	.align 8
.LC192:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after for loop increment\12\0"
	.align 8
.LC193:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start for loop body\12\0"
	.align 8
.LC194:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop body statement\12\0"
	.align 8
.LC195:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'while'\12\0"
	.align 8
.LC196:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse while condition\12\0"
	.align 8
.LC197:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after while condition\12\0"
	.align 8
.LC198:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start while body\12\0"
	.align 8
.LC199:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse while body statement\12\0"
	.align 8
.LC200:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot use 'break' outside of a loop\12\0"
	.align 8
.LC201:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot use 'continue' outside of a loop\12\0"
	.align 8
.LC202:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse statement\12\0"
	.align 8
.LC203:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after statement\12\0"
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
	movq	%rcx, %rbx	 ; tmp680, lexer
	movq	%rdx, %r15	 ; tmp681, now_scope
	movq	%r8, %rsi	 ; tmp682, parser
 ; ./asm_test/win/i/all.c:2714:     token = lexer->current_token;
	movq	80(%rcx), %rdx	 ; lexer_59(D)->current_token, token
 ; ./asm_test/win/i/all.c:2716:     if (token->type == KEYWORD) {
	cmpl	$6, 24(%rdx)	 ;, token_60->type
	jne	.L1013	 ;,
 ; ./asm_test/win/i/all.c:2717:         if (token->lexeme == keywordList[6])
	movq	(%rdx), %rax	 ; token_60->lexeme, _2
 ; ./asm_test/win/i/all.c:2717:         if (token->lexeme == keywordList[6])
	cmpq	48+keywordList(%rip), %rax	 ; keywordList[6], _2
	je	.L1101	 ;,
 ; ./asm_test/win/i/all.c:2719:         else if (token->lexeme == keywordList[10])
	cmpq	80+keywordList(%rip), %rax	 ; keywordList[10], _2
	je	.L1102	 ;,
 ; ./asm_test/win/i/all.c:2721:         else if (token->lexeme == keywordList[9])
	cmpq	72+keywordList(%rip), %rax	 ; keywordList[9], _2
	je	.L1103	 ;,
 ; ./asm_test/win/i/all.c:2723:         else if (token->lexeme == keywordList[21]) {
	cmpq	168+keywordList(%rip), %rax	 ; keywordList[21], _2
	je	.L1104	 ;,
 ; ./asm_test/win/i/all.c:2726:         } else if (token->lexeme == keywordList[13]) {
	cmpq	104+keywordList(%rip), %rax	 ; keywordList[13], _2
	je	.L1105	 ;,
 ; ./asm_test/win/i/all.c:2732:         } else if (token->lexeme == keywordList[14]) {
	cmpq	112+keywordList(%rip), %rax	 ; keywordList[14], _2
	je	.L1106	 ;,
 ; ./asm_test/win/i/all.c:2738:         } else if (token->lexeme == keywordList[15]) {
	cmpq	120+keywordList(%rip), %rax	 ; keywordList[15], _2
	je	.L1107	 ;,
 ; ./asm_test/win/i/all.c:2745:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%r15, %rdx	 ; now_scope,
	call	parse_expression	 ;
 ; ./asm_test/win/i/all.c:2745:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp778,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdi	 ; tmp779, <retval>
	jmp	.L1083	 ;
.L1101:
 ; ./asm_test/win/i/all.c:2758:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2759:     if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	cmpl	$5, 24(%rax)	 ;, token_104->type
	jne	.L1015	 ;,
 ; ./asm_test/win/i/all.c:2759:     if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	movq	symbolList(%rip), %rdi	 ; symbolList[0], tmp824
	cmpq	%rdi, (%rax)	 ; tmp824, token_104->lexeme
	jne	.L1015	 ;,
 ; ./asm_test/win/i/all.c:2763:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp685, token
 ; ./asm_test/win/i/all.c:2764:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%r15, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %r14	 ; tmp686, condition
 ; ./asm_test/win/i/all.c:2765:     if (condition == NULL)
	testq	%rax, %rax	 ; condition
	je	.L1108	 ;,
.L1018:
 ; ./asm_test/win/i/all.c:2767:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2768:     if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpl	$5, 24(%rax)	 ;, token_124->type
	jne	.L1019	 ;,
 ; ./asm_test/win/i/all.c:2768:     if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movq	8+symbolList(%rip), %rdi	 ; symbolList[1], tmp827
	cmpq	%rdi, (%rax)	 ; tmp827, token_124->lexeme
	jne	.L1019	 ;,
 ; ./asm_test/win/i/all.c:2772:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2773:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	cmpl	$5, 24(%rax)	 ;, token_135->type
	jne	.L1021	 ;,
 ; ./asm_test/win/i/all.c:2773:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	movq	16+symbolList(%rip), %rdi	 ; symbolList[2], tmp829
	cmpq	%rdi, (%rax)	 ; tmp829, token_135->lexeme
	jne	.L1021	 ;,
 ; ./asm_test/win/i/all.c:2777:     List* body = create_list();
	call	create_list	 ;
	movq	%rax, %r12	 ; tmp692, body
	movq	%rax, 88(%rsp)	 ; body, %sfp
 ; ./asm_test/win/i/all.c:2778:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp693, token
 ; ./asm_test/win/i/all.c:2779:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	leaq	symbolList(%rip), %r13	 ;, tmp671
	movq	%r14, 56(%rsp)	 ; condition, %sfp
 ; ./asm_test/win/i/all.c:2779:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	jmp	.L1023	 ;
.L1015:
 ; ./asm_test/win/i/all.c:2760:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after 'if'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_104->column, tmp825
	addq	$1, %rdi	 ;, _109
	movq	8(%rax), %rbx	 ; token_104->line, token_104->line
	addq	$1, %rbx	 ;, _111
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rsi	 ; _112->path, _113
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp684, _114
 ; ./asm_test/win/i/all.c:2760:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after 'if'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _109,
	movq	%rbx, %r9	 ; _111,
	movq	%rsi, %r8	 ; _113,
	leaq	.LC172(%rip), %rdx	 ;, tmp453
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2761:         return NULL;
	movl	$0, %edx	 ;, if_
.L1017:
 ; ./asm_test/win/i/all.c:2718:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$2, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdi	 ; tmp725, <retval>
 ; ./asm_test/win/i/all.c:2718:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	jmp	.L1012	 ;
.L1108:
 ; ./asm_test/win/i/all.c:2766:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rdi), %rax	 ; token_115->column, tmp826
	leaq	1(%rax), %rbp	 ;, _118
	movq	8(%rdi), %rdi	 ; token_115->line, token_115->line
	addq	$1, %rdi	 ;, _120
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %r12	 ; _121->path, _122
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp687, _123
 ; ./asm_test/win/i/all.c:2766:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbp, 32(%rsp)	 ; _118,
	movq	%rdi, %r9	 ; _120,
	movq	%r12, %r8	 ; _122,
	leaq	.LC173(%rip), %rdx	 ;, tmp458
	call	fprintf	 ;
	jmp	.L1018	 ;
.L1019:
 ; ./asm_test/win/i/all.c:2769:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_124->column, tmp828
	addq	$1, %rdi	 ;, _129
	movq	8(%rax), %rbx	 ; token_124->line, token_124->line
	addq	$1, %rbx	 ;, _131
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rsi	 ; _132->path, _133
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp689, _134
 ; ./asm_test/win/i/all.c:2769:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _129,
	movq	%rbx, %r9	 ; _131,
	movq	%rsi, %r8	 ; _133,
	leaq	.LC174(%rip), %rdx	 ;, tmp465
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2770:         return NULL;
	movl	$0, %edx	 ;, if_
	jmp	.L1017	 ;
.L1021:
 ; ./asm_test/win/i/all.c:2774:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start if body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_135->column, tmp830
	addq	$1, %rdi	 ;, _140
	movq	8(%rax), %rbx	 ; token_135->line, token_135->line
	addq	$1, %rbx	 ;, _142
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rsi	 ; _143->path, _144
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp691, _145
 ; ./asm_test/win/i/all.c:2774:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start if body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _140,
	movq	%rbx, %r9	 ; _142,
	movq	%rsi, %r8	 ; _144,
	leaq	.LC175(%rip), %rdx	 ;, tmp472
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2775:         return NULL;
	movl	$0, %edx	 ;, if_
	jmp	.L1017	 ;
.L1025:
 ; ./asm_test/win/i/all.c:2780:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%r15, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %rdi	 ; tmp694, statement
 ; ./asm_test/win/i/all.c:2781:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L1109	 ;,
.L1024:
 ; ./asm_test/win/i/all.c:2783:         list_append(body, (size_t*)statement);
	movq	%rdi, %rdx	 ; statement,
	movq	%r12, %rcx	 ; body,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2784:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp696, token
.L1023:
 ; ./asm_test/win/i/all.c:2779:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	cmpl	$5, 24(%rbp)	 ;, token_149->type
	jne	.L1025	 ;,
 ; ./asm_test/win/i/all.c:2779:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	movq	24(%r13), %rax	 ; symbolList[3], tmp833
	cmpq	%rax, 0(%rbp)	 ; tmp833, token_149->lexeme
	jne	.L1025	 ;,
 ; ./asm_test/win/i/all.c:2786:     List* else_if = create_list();
	movq	56(%rsp), %r14	 ; %sfp, condition
	call	create_list	 ;
	movq	%rax, 64(%rsp)	 ; tmp697, %sfp
 ; ./asm_test/win/i/all.c:2787:     List* else_body = create_list();
	call	create_list	 ;
	movq	%rax, 72(%rsp)	 ; tmp698, %sfp
 ; ./asm_test/win/i/all.c:2788:     token = peek_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; ./asm_test/win/i/all.c:2789:     while (token->type == KEYWORD && token->lexeme == keywordList[7]) {
	cmpl	$6, 24(%rax)	 ;, token_163->type
	jne	.L1027	 ;,
	movq	%r14, 80(%rsp)	 ; condition, %sfp
	jmp	.L1026	 ;
.L1109:
 ; ./asm_test/win/i/all.c:2782:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse if body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbp), %rax	 ; token_149->column, tmp831
	leaq	1(%rax), %r14	 ;, _151
	movq	8(%rbp), %rax	 ; token_149->line, token_149->line
	addq	$1, %rax	 ;, _153
	movq	%rax, 48(%rsp)	 ; _153, %sfp
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rbp	 ; _154->path, _155
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp695, _156
 ; ./asm_test/win/i/all.c:2782:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse if body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r14, 32(%rsp)	 ; _151,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rbp, %r8	 ; _155,
	leaq	.LC176(%rip), %rdx	 ;,
	call	fprintf	 ;
	jmp	.L1024	 ;
.L1028:
 ; ./asm_test/win/i/all.c:2793:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after 'elif'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_164->column, tmp835
	addq	$1, %rdi	 ;, _169
	movq	8(%rax), %rbx	 ; token_164->line, token_164->line
	addq	$1, %rbx	 ;, _171
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rsi	 ; _172->path, _173
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp701, _174
 ; ./asm_test/win/i/all.c:2793:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after 'elif'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _169,
	movq	%rbx, %r9	 ; _171,
	movq	%rsi, %r8	 ; _173,
	leaq	.LC177(%rip), %rdx	 ;, tmp486
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2794:             return NULL;
	movl	$0, %edx	 ;, if_
	jmp	.L1017	 ;
.L1113:
 ; ./asm_test/win/i/all.c:2799:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse else-if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rdi), %rax	 ; token_175->column, tmp836
	leaq	1(%rax), %rbp	 ;, _178
	movq	8(%rdi), %rdi	 ; token_175->line, token_175->line
	addq	$1, %rdi	 ;, _180
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %r12	 ; _181->path, _182
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp704, _183
 ; ./asm_test/win/i/all.c:2799:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse else-if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbp, 32(%rsp)	 ; _178,
	movq	%rdi, %r9	 ; _180,
	movq	%r12, %r8	 ; _182,
	leaq	.LC178(%rip), %rdx	 ;, tmp491
	call	fprintf	 ;
	jmp	.L1030	 ;
.L1031:
 ; ./asm_test/win/i/all.c:2802:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after else-if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_184->column, tmp838
	addq	$1, %rdi	 ;, _189
	movq	8(%rax), %rbx	 ; token_184->line, token_184->line
	addq	$1, %rbx	 ;, _191
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rsi	 ; _192->path, _193
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp706, _194
 ; ./asm_test/win/i/all.c:2802:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after else-if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _189,
	movq	%rbx, %r9	 ; _191,
	movq	%rsi, %r8	 ; _193,
	leaq	.LC179(%rip), %rdx	 ;, tmp498
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2803:             return NULL;
	movl	$0, %edx	 ;, if_
	jmp	.L1017	 ;
.L1033:
 ; ./asm_test/win/i/all.c:2807:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start else-if body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_195->column, tmp840
	addq	$1, %rdi	 ;, _200
	movq	8(%rax), %rbx	 ; token_195->line, token_195->line
	addq	$1, %rbx	 ;, _202
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rsi	 ; _203->path, _204
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp708, _205
 ; ./asm_test/win/i/all.c:2807:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start else-if body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _200,
	movq	%rbx, %r9	 ; _202,
	movq	%rsi, %r8	 ; _204,
	leaq	.LC180(%rip), %rdx	 ;, tmp505
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2808:             return NULL;
	movl	$0, %edx	 ;, if_
	jmp	.L1017	 ;
.L1037:
 ; ./asm_test/win/i/all.c:2813:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%r15, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %rdi	 ; tmp711, statement
 ; ./asm_test/win/i/all.c:2814:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L1110	 ;,
.L1036:
 ; ./asm_test/win/i/all.c:2816:             list_append(elif_body, (size_t*)statement);
	movq	%rdi, %rdx	 ; statement,
	movq	%rbp, %rcx	 ; elif_body,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2817:             token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp713, token
.L1035:
 ; ./asm_test/win/i/all.c:2812:         while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	cmpl	$5, 24(%r12)	 ;, token_209->type
	jne	.L1037	 ;,
 ; ./asm_test/win/i/all.c:2812:         while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	movq	24(%r14), %rax	 ; symbolList[3], tmp843
	cmpq	%rax, (%r12)	 ; tmp843, token_209->lexeme
	jne	.L1037	 ;,
 ; ./asm_test/win/i/all.c:802:     if (condition == NULL) {
	movq	56(%rsp), %r13	 ; %sfp, elif_condition
	testq	%r13, %r13	 ; elif_condition
	je	.L1111	 ;,
 ; ./asm_test/win/i/all.c:806:     ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp715, else_if
 ; ./asm_test/win/i/all.c:807:     else_if->condition = condition;
	movq	%r13, (%rax)	 ; elif_condition, else_if_257->condition
 ; ./asm_test/win/i/all.c:808:     else_if->body = body;
	movq	%rbp, 8(%rax)	 ; elif_body, else_if_257->body
.L1039:
 ; ./asm_test/win/i/all.c:2819:         list_append(else_if, (size_t*)create_else_if(elif_condition, elif_body));
	movq	64(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2820:         token = peek_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; ./asm_test/win/i/all.c:2789:     while (token->type == KEYWORD && token->lexeme == keywordList[7]) {
	cmpl	$6, 24(%rax)	 ;, token_222->type
	jne	.L1098	 ;,
.L1026:
 ; ./asm_test/win/i/all.c:2789:     while (token->type == KEYWORD && token->lexeme == keywordList[7]) {
	movq	56+keywordList(%rip), %rdi	 ; keywordList[7], tmp844
	cmpq	%rdi, (%rax)	 ; tmp844, token_434->lexeme
	jne	.L1112	 ;,
 ; ./asm_test/win/i/all.c:2790:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2791:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2792:         if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	cmpl	$5, 24(%rax)	 ;, token_164->type
	jne	.L1028	 ;,
 ; ./asm_test/win/i/all.c:2792:         if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	movq	symbolList(%rip), %rdi	 ; symbolList[0], tmp834
	cmpq	%rdi, (%rax)	 ; tmp834, token_164->lexeme
	jne	.L1028	 ;,
 ; ./asm_test/win/i/all.c:2796:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp702, token
 ; ./asm_test/win/i/all.c:2797:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%r15, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %r13	 ; tmp703, elif_condition
 ; ./asm_test/win/i/all.c:2798:         if (elif_condition == NULL)
	testq	%rax, %rax	 ; elif_condition
	je	.L1113	 ;,
.L1030:
 ; ./asm_test/win/i/all.c:2800:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2801:         if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpl	$5, 24(%rax)	 ;, token_184->type
	jne	.L1031	 ;,
 ; ./asm_test/win/i/all.c:2801:         if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movq	8+symbolList(%rip), %rdi	 ; symbolList[1], tmp837
	cmpq	%rdi, (%rax)	 ; tmp837, token_184->lexeme
	jne	.L1031	 ;,
 ; ./asm_test/win/i/all.c:2805:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2806:         if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	cmpl	$5, 24(%rax)	 ;, token_195->type
	jne	.L1033	 ;,
 ; ./asm_test/win/i/all.c:2806:         if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	movq	16+symbolList(%rip), %rdi	 ; symbolList[2], tmp839
	cmpq	%rdi, (%rax)	 ; tmp839, token_195->lexeme
	jne	.L1033	 ;,
 ; ./asm_test/win/i/all.c:2810:         List* elif_body = create_list();
	call	create_list	 ;
	movq	%rax, %rbp	 ; tmp709, elif_body
 ; ./asm_test/win/i/all.c:2811:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp710, token
 ; ./asm_test/win/i/all.c:2812:         while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	leaq	symbolList(%rip), %r14	 ;, tmp665
	movq	%r13, 56(%rsp)	 ; elif_condition, %sfp
 ; ./asm_test/win/i/all.c:2812:         while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	jmp	.L1035	 ;
.L1110:
 ; ./asm_test/win/i/all.c:2815:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse else-if body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r12), %rax	 ; token_209->column, tmp841
	leaq	1(%rax), %r13	 ;, _211
	movq	8(%r12), %rax	 ; token_209->line, token_209->line
	addq	$1, %rax	 ;, _213
	movq	%rax, 48(%rsp)	 ; _213, %sfp
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %r12	 ; _214->path, _215
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp712, _216
 ; ./asm_test/win/i/all.c:2815:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse else-if body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r13, 32(%rsp)	 ; _211,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%r12, %r8	 ; _215,
	leaq	.LC181(%rip), %rdx	 ;,
	call	fprintf	 ;
	jmp	.L1036	 ;
.L1111:
 ; ./asm_test/win/i/all.c:803:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp714
 ; ./asm_test/win/i/all.c:803:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC182(%rip), %rcx	 ;, tmp514
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:804:         return NULL;
	movq	%r13, %rdx	 ; elif_condition, else_if
	jmp	.L1039	 ;
.L1042:
 ; ./asm_test/win/i/all.c:2826:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start else body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_229->column, tmp846
	addq	$1, %rdi	 ;, _234
	movq	8(%rax), %rbx	 ; token_229->line, token_229->line
	addq	$1, %rbx	 ;, _236
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rsi	 ; _237->path, _238
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp718, _239
 ; ./asm_test/win/i/all.c:2826:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start else body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _234,
	movq	%rbx, %r9	 ; _236,
	movq	%rsi, %r8	 ; _238,
	leaq	.LC183(%rip), %rdx	 ;, tmp523
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2827:             return NULL;
	movl	$0, %edx	 ;, if_
	jmp	.L1017	 ;
.L1046:
 ; ./asm_test/win/i/all.c:2831:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%r15, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %rdi	 ; tmp720, statement
 ; ./asm_test/win/i/all.c:2832:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L1114	 ;,
.L1045:
 ; ./asm_test/win/i/all.c:2834:             list_append(else_body, (size_t*)statement);
	movq	%rdi, %rdx	 ; statement,
	movq	72(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2835:             token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp722, token
.L1044:
 ; ./asm_test/win/i/all.c:2830:         while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	cmpl	$5, 24(%r13)	 ;, token_242->type
	jne	.L1046	 ;,
 ; ./asm_test/win/i/all.c:2830:         while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	movq	24(%r12), %rax	 ; symbolList[3], tmp849
	cmpq	%rax, 0(%r13)	 ; tmp849, token_242->lexeme
	jne	.L1046	 ;,
	jmp	.L1027	 ;
.L1114:
 ; ./asm_test/win/i/all.c:2833:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse else body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r13), %rax	 ; token_242->column, tmp847
	leaq	1(%rax), %rbp	 ;, _244
	movq	8(%r13), %rax	 ; token_242->line, token_242->line
	addq	$1, %rax	 ;, _246
	movq	%rax, 48(%rsp)	 ; _246, %sfp
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %r13	 ; _247->path, _248
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp721, _249
 ; ./asm_test/win/i/all.c:2833:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse else body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbp, 32(%rsp)	 ; _244,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%r13, %r8	 ; _248,
	leaq	.LC184(%rip), %rdx	 ;,
	call	fprintf	 ;
	jmp	.L1045	 ;
.L1098:
	movq	80(%rsp), %r14	 ; %sfp, condition
.L1027:
 ; ./asm_test/win/i/all.c:790:     if (condition == NULL) {
	testq	%r14, %r14	 ; condition
	je	.L1115	 ;,
 ; ./asm_test/win/i/all.c:794:     If* if_ = (If*)alloc_memory(sizeof(If));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp724, if_
 ; ./asm_test/win/i/all.c:795:     if_->condition = condition;
	movq	%r14, (%rax)	 ; condition, if__260->condition
 ; ./asm_test/win/i/all.c:796:     if_->body = body;
	movq	88(%rsp), %rax	 ; %sfp, body
	movq	%rax, 8(%rdx)	 ; body, if__260->body
 ; ./asm_test/win/i/all.c:797:     if_->else_if = else_if;
	movq	64(%rsp), %rax	 ; %sfp, else_if
	movq	%rax, 16(%rdx)	 ; else_if, if__260->else_if
 ; ./asm_test/win/i/all.c:798:     if_->else_body = else_body;
	movq	72(%rsp), %rax	 ; %sfp, else_body
	movq	%rax, 24(%rdx)	 ; else_body, if__260->else_body
 ; ./asm_test/win/i/all.c:799:     return if_;
	jmp	.L1017	 ;
.L1115:
 ; ./asm_test/win/i/all.c:791:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp723
 ; ./asm_test/win/i/all.c:791:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	movl	$47, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC185(%rip), %rcx	 ;, tmp532
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:792:         return NULL;
	movq	%r14, %rdx	 ; condition, if_
	jmp	.L1017	 ;
.L1102:
 ; ./asm_test/win/i/all.c:2843:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2844:     if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	cmpl	$5, 24(%rax)	 ;, token_262->type
	jne	.L1050	 ;,
 ; ./asm_test/win/i/all.c:2844:     if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	movq	symbolList(%rip), %rdi	 ; symbolList[0], tmp853
	cmpq	%rdi, (%rax)	 ; tmp853, token_262->lexeme
	jne	.L1050	 ;,
 ; ./asm_test/win/i/all.c:2848:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp728, token
 ; ./asm_test/win/i/all.c:2850:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	cmpl	$5, 24(%rax)	 ;, token_273->type
	jne	.L1053	 ;,
 ; ./asm_test/win/i/all.c:2850:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	movq	72+symbolList(%rip), %rax	 ; symbolList[9], tmp855
	cmpq	%rax, 0(%rbp)	 ; tmp855, token_273->lexeme
	je	.L1093	 ;,
.L1053:
 ; ./asm_test/win/i/all.c:2851:         initializer = parse_variable(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%r15, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
	movq	%rax, %rdi	 ; tmp729, initializer
 ; ./asm_test/win/i/all.c:2852:         if (initializer == NULL)
	testq	%rax, %rax	 ; initializer
	je	.L1116	 ;,
.L1055:
 ; ./asm_test/win/i/all.c:2854:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2856:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	cmpl	$5, 24(%rax)	 ;, token_285->type
	jne	.L1056	 ;,
 ; ./asm_test/win/i/all.c:2856:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	movq	72+symbolList(%rip), %rcx	 ; symbolList[9], tmp857
	cmpq	%rcx, (%rax)	 ; tmp857, token_285->lexeme
	je	.L1054	 ;,
.L1056:
 ; ./asm_test/win/i/all.c:2857:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_285->column, tmp858
	addq	$1, %rdi	 ;, _291
	movq	8(%rax), %rbx	 ; token_285->line, token_285->line
	addq	$1, %rbx	 ;, _293
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rsi	 ; _294->path, _295
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp732, _296
 ; ./asm_test/win/i/all.c:2857:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _291,
	movq	%rbx, %r9	 ; _293,
	movq	%rsi, %r8	 ; _295,
	leaq	.LC188(%rip), %rdx	 ;, tmp554
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2858:         return NULL;
	movl	$0, %r9d	 ;, for_
	jmp	.L1052	 ;
.L1050:
 ; ./asm_test/win/i/all.c:2845:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after 'for'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_262->column, tmp854
	addq	$1, %rdi	 ;, _267
	movq	8(%rax), %rbx	 ; token_262->line, token_262->line
	addq	$1, %rbx	 ;, _269
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rsi	 ; _270->path, _271
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp727, _272
 ; ./asm_test/win/i/all.c:2845:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after 'for'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _267,
	movq	%rbx, %r9	 ; _269,
	movq	%rsi, %r8	 ; _271,
	leaq	.LC186(%rip), %rdx	 ;, tmp540
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2846:         return NULL;
	movl	$0, %r9d	 ;, for_
.L1052:
 ; ./asm_test/win/i/all.c:2720:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$4, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdi	 ; tmp751, <retval>
 ; ./asm_test/win/i/all.c:2720:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L1012	 ;
.L1116:
 ; ./asm_test/win/i/all.c:2853:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbp), %rax	 ; token_273->column, tmp856
	leaq	1(%rax), %r12	 ;, _279
	movq	8(%rbp), %rbp	 ; token_273->line, token_273->line
	addq	$1, %rbp	 ;, _281
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %r13	 ; _282->path, _283
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp730, _284
 ; ./asm_test/win/i/all.c:2853:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r12, 32(%rsp)	 ; _279,
	movq	%rbp, %r9	 ; _281,
	movq	%r13, %r8	 ; _283,
	leaq	.LC187(%rip), %rdx	 ;, tmp547
	call	fprintf	 ;
	jmp	.L1055	 ;
.L1093:
 ; ./asm_test/win/i/all.c:2849:     Variable* initializer = NULL;
	movl	$0, %edi	 ;, initializer
.L1054:
 ; ./asm_test/win/i/all.c:2860:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp733, token
 ; ./asm_test/win/i/all.c:2862:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	cmpl	$5, 24(%rax)	 ;, token_297->type
	jne	.L1057	 ;,
 ; ./asm_test/win/i/all.c:2862:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	movq	72+symbolList(%rip), %rax	 ; symbolList[9], tmp859
	cmpq	%rax, 0(%rbp)	 ; tmp859, token_297->lexeme
	je	.L1094	 ;,
.L1057:
 ; ./asm_test/win/i/all.c:2863:         condition = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%r15, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %r13	 ; tmp734, condition
 ; ./asm_test/win/i/all.c:2864:         if (condition == NULL)
	testq	%rax, %rax	 ; condition
	je	.L1117	 ;,
.L1059:
 ; ./asm_test/win/i/all.c:2866:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2868:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	cmpl	$5, 24(%rax)	 ;, token_309->type
	jne	.L1060	 ;,
 ; ./asm_test/win/i/all.c:2868:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	movq	72+symbolList(%rip), %rcx	 ; symbolList[9], tmp861
	cmpq	%rcx, (%rax)	 ; tmp861, token_309->lexeme
	je	.L1058	 ;,
.L1060:
 ; ./asm_test/win/i/all.c:2869:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_309->column, tmp862
	addq	$1, %rdi	 ;, _315
	movq	8(%rax), %rbx	 ; token_309->line, token_309->line
	addq	$1, %rbx	 ;, _317
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rsi	 ; _318->path, _319
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp737, _320
 ; ./asm_test/win/i/all.c:2869:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _315,
	movq	%rbx, %r9	 ; _317,
	movq	%rsi, %r8	 ; _319,
	leaq	.LC190(%rip), %rdx	 ;, tmp568
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2870:         return NULL;
	movl	$0, %r9d	 ;, for_
	jmp	.L1052	 ;
.L1117:
 ; ./asm_test/win/i/all.c:2865:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbp), %rax	 ; token_297->column, tmp860
	leaq	1(%rax), %r12	 ;, _303
	movq	8(%rbp), %rbp	 ; token_297->line, token_297->line
	addq	$1, %rbp	 ;, _305
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %r14	 ; _306->path, _307
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp735, _308
 ; ./asm_test/win/i/all.c:2865:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r12, 32(%rsp)	 ; _303,
	movq	%rbp, %r9	 ; _305,
	movq	%r14, %r8	 ; _307,
	leaq	.LC189(%rip), %rdx	 ;, tmp561
	call	fprintf	 ;
	jmp	.L1059	 ;
.L1094:
 ; ./asm_test/win/i/all.c:2861:     Expression* condition = NULL;
	movl	$0, %r13d	 ;, condition
.L1058:
 ; ./asm_test/win/i/all.c:2872:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp738, token
 ; ./asm_test/win/i/all.c:2874:     if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpl	$5, 24(%rax)	 ;, token_321->type
	jne	.L1061	 ;,
 ; ./asm_test/win/i/all.c:2874:     if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movq	8+symbolList(%rip), %rax	 ; symbolList[1], tmp863
	cmpq	%rax, (%r12)	 ; tmp863, token_321->lexeme
	je	.L1095	 ;,
.L1061:
 ; ./asm_test/win/i/all.c:2875:         increment = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%r15, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, 48(%rsp)	 ; increment, %sfp
 ; ./asm_test/win/i/all.c:2876:         if (increment == NULL)
	testq	%rax, %rax	 ; increment
	je	.L1118	 ;,
.L1063:
 ; ./asm_test/win/i/all.c:2878:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2880:     if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpl	$5, 24(%rax)	 ;, token_333->type
	jne	.L1064	 ;,
 ; ./asm_test/win/i/all.c:2880:     if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movq	8+symbolList(%rip), %rcx	 ; symbolList[1], tmp866
	cmpq	%rcx, (%rax)	 ; tmp866, token_333->lexeme
	je	.L1062	 ;,
.L1064:
 ; ./asm_test/win/i/all.c:2881:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after for loop increment\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_333->column, tmp867
	addq	$1, %rdi	 ;, _339
	movq	8(%rax), %rbx	 ; token_333->line, token_333->line
	addq	$1, %rbx	 ;, _341
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rsi	 ; _342->path, _343
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp742, _344
 ; ./asm_test/win/i/all.c:2881:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after for loop increment\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _339,
	movq	%rbx, %r9	 ; _341,
	movq	%rsi, %r8	 ; _343,
	leaq	.LC192(%rip), %rdx	 ;, tmp582
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2882:         return NULL;
	movl	$0, %r9d	 ;, for_
	jmp	.L1052	 ;
.L1118:
 ; ./asm_test/win/i/all.c:2877:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop increment\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r12), %rax	 ; token_321->column, tmp865
	leaq	1(%rax), %rbp	 ;, _327
	movq	8(%r12), %rax	 ; token_321->line, token_321->line
	leaq	1(%rax), %r14	 ;, _329
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %r12	 ; _330->path, _331
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp740, _332
 ; ./asm_test/win/i/all.c:2877:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop increment\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbp, 32(%rsp)	 ; _327,
	movq	%r14, %r9	 ; _329,
	movq	%r12, %r8	 ; _331,
	leaq	.LC191(%rip), %rdx	 ;, tmp575
	call	fprintf	 ;
	jmp	.L1063	 ;
.L1095:
 ; ./asm_test/win/i/all.c:2873:     Expression* increment = NULL;
	movq	$0, 48(%rsp)	 ;, %sfp
.L1062:
 ; ./asm_test/win/i/all.c:2884:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2885:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	cmpl	$5, 24(%rax)	 ;, token_345->type
	jne	.L1065	 ;,
 ; ./asm_test/win/i/all.c:2885:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	movq	16+symbolList(%rip), %rcx	 ; symbolList[2], tmp868
	cmpq	%rcx, (%rax)	 ; tmp868, token_345->lexeme
	jne	.L1065	 ;,
 ; ./asm_test/win/i/all.c:2889:     List* body = create_list();
	call	create_list	 ;
	movq	%rax, %r14	 ; tmp745, body
 ; ./asm_test/win/i/all.c:2890:     parser->in_loop = 1;
	movb	$1, 11(%rsi)	 ;, parser_62(D)->in_loop
 ; ./asm_test/win/i/all.c:2891:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp746, token
 ; ./asm_test/win/i/all.c:2892:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	jmp	.L1067	 ;
.L1065:
 ; ./asm_test/win/i/all.c:2886:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start for loop body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_345->column, tmp869
	addq	$1, %rdi	 ;, _350
	movq	8(%rax), %rbx	 ; token_345->line, token_345->line
	addq	$1, %rbx	 ;, _352
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rsi	 ; _353->path, _354
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp744, _355
 ; ./asm_test/win/i/all.c:2886:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start for loop body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _350,
	movq	%rbx, %r9	 ; _352,
	movq	%rsi, %r8	 ; _354,
	leaq	.LC193(%rip), %rdx	 ;, tmp589
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2887:         return NULL;
	movl	$0, %r9d	 ;, for_
	jmp	.L1052	 ;
.L1069:
 ; ./asm_test/win/i/all.c:2893:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%r15, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp747, statement
 ; ./asm_test/win/i/all.c:2894:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L1119	 ;,
.L1068:
 ; ./asm_test/win/i/all.c:2896:         list_append(body, (size_t*)statement);
	movq	%r12, %rdx	 ; statement,
	movq	%r14, %rcx	 ; body,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2897:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp749, token
.L1067:
 ; ./asm_test/win/i/all.c:2892:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	cmpl	$5, 24(%rbp)	 ;, token_359->type
	jne	.L1069	 ;,
 ; ./asm_test/win/i/all.c:2892:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	leaq	symbolList(%rip), %rax	 ;, tmp874
	movq	24(%rax), %rax	 ; symbolList[3], tmp875
	cmpq	%rax, 0(%rbp)	 ; tmp875, token_359->lexeme
	jne	.L1069	 ;,
 ; ./asm_test/win/i/all.c:2899:     parser->in_loop = 0;
	movb	$0, 11(%rsi)	 ;, parser_62(D)->in_loop
 ; ./asm_test/win/i/all.c:812:     For* for_ = (For*)alloc_memory(sizeof(For));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %r9	 ; tmp750, for_
 ; ./asm_test/win/i/all.c:813:     for_->initializer = initializer;
	movq	%rdi, (%rax)	 ; initializer, for__376->initializer
 ; ./asm_test/win/i/all.c:814:     for_->condition = condition;
	movq	%r13, 8(%rax)	 ; condition, for__376->condition
 ; ./asm_test/win/i/all.c:815:     for_->increment = increment;
	movq	48(%rsp), %rax	 ; %sfp, increment
	movq	%rax, 16(%r9)	 ; increment, for__376->increment
 ; ./asm_test/win/i/all.c:816:     for_->body = body;
	movq	%r14, 24(%r9)	 ; body, for__376->body
 ; ./asm_test/win/i/all.c:2900:     return create_for(initializer, condition, increment, body);
	jmp	.L1052	 ;
.L1119:
 ; ./asm_test/win/i/all.c:2895:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbp), %rax	 ; token_359->column, tmp871
	addq	$1, %rax	 ;, _361
	movq	%rax, 56(%rsp)	 ; _361, %sfp
	movq	8(%rbp), %rax	 ; token_359->line, token_359->line
	leaq	1(%rax), %rcx	 ;, _363
	movq	%rcx, 64(%rsp)	 ; _363, %sfp
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rbp	 ; _364->path, _365
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp748, _366
 ; ./asm_test/win/i/all.c:2895:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	56(%rsp), %rax	 ; %sfp, _361
	movq	%rax, 32(%rsp)	 ; _361,
	movq	64(%rsp), %r9	 ; %sfp,
	movq	%rbp, %r8	 ; _365,
	leaq	.LC194(%rip), %rdx	 ;,
	call	fprintf	 ;
	jmp	.L1068	 ;
.L1103:
 ; ./asm_test/win/i/all.c:2904:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2905:     if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	cmpl	$5, 24(%rax)	 ;, token_377->type
	jne	.L1071	 ;,
 ; ./asm_test/win/i/all.c:2905:     if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	movq	symbolList(%rip), %rdi	 ; symbolList[0], tmp877
	cmpq	%rdi, (%rax)	 ; tmp877, token_377->lexeme
	jne	.L1071	 ;,
 ; ./asm_test/win/i/all.c:2909:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp754, token
 ; ./asm_test/win/i/all.c:2910:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%r15, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %r12	 ; tmp755, condition
 ; ./asm_test/win/i/all.c:2911:     if (condition == NULL)
	testq	%rax, %rax	 ; condition
	je	.L1120	 ;,
.L1074:
 ; ./asm_test/win/i/all.c:2913:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2914:     if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpl	$5, 24(%rax)	 ;, token_397->type
	jne	.L1075	 ;,
 ; ./asm_test/win/i/all.c:2914:     if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movq	8+symbolList(%rip), %rdi	 ; symbolList[1], tmp880
	cmpq	%rdi, (%rax)	 ; tmp880, token_397->lexeme
	jne	.L1075	 ;,
 ; ./asm_test/win/i/all.c:2918:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2919:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	cmpl	$5, 24(%rax)	 ;, token_408->type
	jne	.L1077	 ;,
 ; ./asm_test/win/i/all.c:2919:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	movq	16+symbolList(%rip), %rdi	 ; symbolList[2], tmp882
	cmpq	%rdi, (%rax)	 ; tmp882, token_408->lexeme
	jne	.L1077	 ;,
 ; ./asm_test/win/i/all.c:2923:     List* body = create_list();
	call	create_list	 ;
	movq	%rax, %r13	 ; tmp761, body
 ; ./asm_test/win/i/all.c:2924:     parser->in_loop = 1;
	movb	$1, 11(%rsi)	 ;, parser_62(D)->in_loop
 ; ./asm_test/win/i/all.c:2925:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp762, token
 ; ./asm_test/win/i/all.c:2926:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	leaq	symbolList(%rip), %r14	 ;, tmp677
	movq	%r12, 56(%rsp)	 ; condition, %sfp
 ; ./asm_test/win/i/all.c:2926:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	jmp	.L1079	 ;
.L1071:
 ; ./asm_test/win/i/all.c:2906:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after 'while'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_377->column, tmp878
	addq	$1, %rdi	 ;, _382
	movq	8(%rax), %rbx	 ; token_377->line, token_377->line
	addq	$1, %rbx	 ;, _384
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rsi	 ; _385->path, _386
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp753, _387
 ; ./asm_test/win/i/all.c:2906:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after 'while'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _382,
	movq	%rbx, %r9	 ; _384,
	movq	%rsi, %r8	 ; _386,
	leaq	.LC195(%rip), %rdx	 ;, tmp604
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2907:         return NULL;
	movl	$0, %r8d	 ;, while_
.L1073:
 ; ./asm_test/win/i/all.c:2722:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$3, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdi	 ; tmp767, <retval>
 ; ./asm_test/win/i/all.c:2722:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	jmp	.L1012	 ;
.L1120:
 ; ./asm_test/win/i/all.c:2912:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse while condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rdi), %rax	 ; token_388->column, tmp879
	leaq	1(%rax), %rbp	 ;, _391
	movq	8(%rdi), %rdi	 ; token_388->line, token_388->line
	addq	$1, %rdi	 ;, _393
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %r13	 ; _394->path, _395
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp756, _396
 ; ./asm_test/win/i/all.c:2912:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse while condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbp, 32(%rsp)	 ; _391,
	movq	%rdi, %r9	 ; _393,
	movq	%r13, %r8	 ; _395,
	leaq	.LC196(%rip), %rdx	 ;, tmp609
	call	fprintf	 ;
	jmp	.L1074	 ;
.L1075:
 ; ./asm_test/win/i/all.c:2915:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after while condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_397->column, tmp881
	addq	$1, %rdi	 ;, _402
	movq	8(%rax), %rbx	 ; token_397->line, token_397->line
	addq	$1, %rbx	 ;, _404
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rsi	 ; _405->path, _406
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp758, _407
 ; ./asm_test/win/i/all.c:2915:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after while condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _402,
	movq	%rbx, %r9	 ; _404,
	movq	%rsi, %r8	 ; _406,
	leaq	.LC197(%rip), %rdx	 ;, tmp616
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2916:         return NULL;
	movl	$0, %r8d	 ;, while_
	jmp	.L1073	 ;
.L1077:
 ; ./asm_test/win/i/all.c:2920:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start while body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_408->column, tmp883
	addq	$1, %rdi	 ;, _413
	movq	8(%rax), %rbx	 ; token_408->line, token_408->line
	addq	$1, %rbx	 ;, _415
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rsi	 ; _416->path, _417
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp760, _418
 ; ./asm_test/win/i/all.c:2920:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start while body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _413,
	movq	%rbx, %r9	 ; _415,
	movq	%rsi, %r8	 ; _417,
	leaq	.LC198(%rip), %rdx	 ;, tmp623
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2921:         return NULL;
	movl	$0, %r8d	 ;, while_
	jmp	.L1073	 ;
.L1081:
 ; ./asm_test/win/i/all.c:2927:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%r15, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %rbp	 ; tmp763, statement
 ; ./asm_test/win/i/all.c:2928:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L1121	 ;,
.L1080:
 ; ./asm_test/win/i/all.c:2930:         list_append(body, (size_t*)statement);
	movq	%rbp, %rdx	 ; statement,
	movq	%r13, %rcx	 ; body,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2931:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp765, token
.L1079:
 ; ./asm_test/win/i/all.c:2926:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	cmpl	$5, 24(%rdi)	 ;, token_422->type
	jne	.L1081	 ;,
 ; ./asm_test/win/i/all.c:2926:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	movq	24(%r14), %rax	 ; symbolList[3], tmp886
	cmpq	%rax, (%rdi)	 ; tmp886, token_422->lexeme
	jne	.L1081	 ;,
 ; ./asm_test/win/i/all.c:2933:     parser->in_loop = 0;
	movq	56(%rsp), %r12	 ; %sfp, condition
	movb	$0, 11(%rsi)	 ;, parser_62(D)->in_loop
 ; ./asm_test/win/i/all.c:820:     While* while_ = (While*)alloc_memory(sizeof(While));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %r8	 ; tmp766, while_
 ; ./asm_test/win/i/all.c:821:     while_->condition = condition;
	movq	%r12, (%rax)	 ; condition, while__436->condition
 ; ./asm_test/win/i/all.c:822:     while_->body = body;
	movq	%r13, 8(%rax)	 ; body, while__436->body
 ; ./asm_test/win/i/all.c:2934:     return create_while(condition, body);
	jmp	.L1073	 ;
.L1121:
 ; ./asm_test/win/i/all.c:2929:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse while body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rdi), %rax	 ; token_422->column, tmp884
	leaq	1(%rax), %r12	 ;, _424
	movq	8(%rdi), %rax	 ; token_422->line, token_422->line
	addq	$1, %rax	 ;, _426
	movq	%rax, 48(%rsp)	 ; _426, %sfp
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rdi	 ; _427->path, _428
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp764, _429
 ; ./asm_test/win/i/all.c:2929:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse while body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r12, 32(%rsp)	 ; _424,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rdi, %r8	 ; _428,
	leaq	.LC199(%rip), %rdx	 ;,
	call	fprintf	 ;
	jmp	.L1080	 ;
.L1104:
 ; ./asm_test/win/i/all.c:2724:             get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2725:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rsi, %r8	 ; parser,
	movq	%r15, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; ./asm_test/win/i/all.c:2725:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rax, 40(%rsp)	 ; tmp768,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdi	 ; tmp769, <retval>
	jmp	.L1083	 ;
.L1105:
 ; ./asm_test/win/i/all.c:2727:             token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2728:             if (token->type == SYMBOL && token->lexeme == symbolList[9]) {
	cmpl	$5, 24(%rax)	 ;, token_78->type
	jne	.L1085	 ;,
 ; ./asm_test/win/i/all.c:2728:             if (token->type == SYMBOL && token->lexeme == symbolList[9]) {
	movq	72+symbolList(%rip), %rdi	 ; symbolList[9], tmp887
	cmpq	%rdi, (%rax)	 ; tmp887, token_78->lexeme
	je	.L1122	 ;,
.L1085:
 ; ./asm_test/win/i/all.c:2731:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rsi, %r8	 ; parser,
	movq	%r15, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
 ; ./asm_test/win/i/all.c:2731:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp772,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdi	 ; tmp773, <retval>
	jmp	.L1083	 ;
.L1122:
 ; ./asm_test/win/i/all.c:2729:                 return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdi	 ; tmp771, <retval>
	jmp	.L1012	 ;
.L1106:
 ; ./asm_test/win/i/all.c:2733:             if (!parser->in_loop) {
	cmpb	$0, 11(%r8)	 ;, parser_62(D)->in_loop
	je	.L1123	 ;,
 ; ./asm_test/win/i/all.c:2737:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$6, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdi	 ; tmp775, <retval>
	jmp	.L1083	 ;
.L1123:
 ; ./asm_test/win/i/all.c:2734:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot use 'break' outside of a loop\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rdx), %rax	 ; token_60->column, tmp888
	leaq	1(%rax), %rdi	 ;, _19
	movq	8(%rdx), %rbx	 ; token_60->line, token_60->line
	addq	$1, %rbx	 ;, _21
	movq	(%r8), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rsi	 ; _22->path, _23
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp774, _24
 ; ./asm_test/win/i/all.c:2734:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot use 'break' outside of a loop\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _19,
	movq	%rbx, %r9	 ; _21,
	movq	%rsi, %r8	 ; _23,
	leaq	.LC200(%rip), %rdx	 ;, tmp640
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2735:                 return NULL;
	movl	$0, %edi	 ;, <retval>
	jmp	.L1012	 ;
.L1107:
 ; ./asm_test/win/i/all.c:2739:             if (!parser->in_loop) {
	cmpb	$0, 11(%r8)	 ;, parser_62(D)->in_loop
	je	.L1124	 ;,
 ; ./asm_test/win/i/all.c:2743:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$7, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdi	 ; tmp777, <retval>
	jmp	.L1083	 ;
.L1124:
 ; ./asm_test/win/i/all.c:2740:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot use 'continue' outside of a loop\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rdx), %rax	 ; token_60->column, tmp889
	leaq	1(%rax), %rdi	 ;, _28
	movq	8(%rdx), %rbx	 ; token_60->line, token_60->line
	addq	$1, %rbx	 ;, _30
	movq	(%r8), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rsi	 ; _31->path, _32
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp776, _33
 ; ./asm_test/win/i/all.c:2740:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot use 'continue' outside of a loop\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _28,
	movq	%rbx, %r9	 ; _30,
	movq	%rsi, %r8	 ; _32,
	leaq	.LC201(%rip), %rdx	 ;, tmp646
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2741:                 return NULL;
	movl	$0, %edi	 ;, <retval>
	jmp	.L1012	 ;
.L1013:
 ; ./asm_test/win/i/all.c:2747:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%r15, %rdx	 ; now_scope,
	call	parse_expression	 ;
 ; ./asm_test/win/i/all.c:2747:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp780,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdi	 ; tmp781, <retval>
.L1083:
 ; ./asm_test/win/i/all.c:2749:     if (statement == NULL)
	testq	%rdi, %rdi	 ; <retval>
	je	.L1125	 ;,
.L1090:
 ; ./asm_test/win/i/all.c:2751:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2752:     if (token->type != SYMBOL || token->lexeme != symbolList[9])
	cmpl	$5, 24(%rax)	 ;, token_101->type
	jne	.L1091	 ;,
 ; ./asm_test/win/i/all.c:2752:     if (token->type != SYMBOL || token->lexeme != symbolList[9])
	movq	72+symbolList(%rip), %rbx	 ; symbolList[9], tmp891
	cmpq	%rbx, (%rax)	 ; tmp891, token_101->lexeme
	je	.L1012	 ;,
.L1091:
 ; ./asm_test/win/i/all.c:2753:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rbx	 ; token_101->column, tmp892
	leaq	1(%rbx), %rbp	 ;, _47
	movq	8(%rax), %rbx	 ; token_101->line, token_101->line
	addq	$1, %rbx	 ;, _49
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %rsi	 ; _50->path, _51
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp784, _52
 ; ./asm_test/win/i/all.c:2753:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbp, 32(%rsp)	 ; _47,
	movq	%rbx, %r9	 ; _49,
	movq	%rsi, %r8	 ; _51,
	leaq	.LC203(%rip), %rdx	 ;, tmp658
	call	fprintf	 ;
.L1012:
 ; ./asm_test/win/i/all.c:2755: }
	movq	%rdi, %rax	 ; <retval>,
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
.L1125:
 ; ./asm_test/win/i/all.c:2748:     token = lexer->current_token;
	movq	80(%rbx), %rax	 ; lexer_59(D)->current_token, token
 ; ./asm_test/win/i/all.c:2750:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rcx	 ; token_97->column, tmp890
	leaq	1(%rcx), %r12	 ;, _37
	movq	8(%rax), %rbp	 ; token_97->line, token_97->line
	addq	$1, %rbp	 ;, _39
	movq	(%rsi), %rax	 ; parser_62(D)->source_file, parser_62(D)->source_file
	movq	24(%rax), %r13	 ; _40->path, _41
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp782, _42
 ; ./asm_test/win/i/all.c:2750:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r12, 32(%rsp)	 ; _37,
	movq	%rbp, %r9	 ; _39,
	movq	%r13, %r8	 ; _41,
	leaq	.LC202(%rip), %rdx	 ;, tmp651
	call	fprintf	 ;
	jmp	.L1090	 ;
.L1112:
	movq	80(%rsp), %r14	 ; %sfp, condition
 ; ./asm_test/win/i/all.c:2822:     if (token->type == KEYWORD && token->lexeme == keywordList[8]) {
	movq	64+keywordList(%rip), %rdi	 ; keywordList[8], tmp893
	cmpq	%rdi, (%rax)	 ; tmp893, token_434->lexeme
	jne	.L1027	 ;,
 ; ./asm_test/win/i/all.c:2823:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2824:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2825:         if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	cmpl	$5, 24(%rax)	 ;, token_229->type
	jne	.L1042	 ;,
 ; ./asm_test/win/i/all.c:2825:         if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	movq	16+symbolList(%rip), %rdi	 ; symbolList[2], tmp845
	cmpq	%rdi, (%rax)	 ; tmp845, token_229->lexeme
	jne	.L1042	 ;,
 ; ./asm_test/win/i/all.c:2829:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp719, token
 ; ./asm_test/win/i/all.c:2830:         while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	leaq	symbolList(%rip), %r12	 ;, tmp662
 ; ./asm_test/win/i/all.c:2830:         while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	jmp	.L1044	 ;
	.section .rdata,"dr"
	.align 8
.LC204:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected identifier after 'import'\12\0"
	.align 8
.LC205:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected string literal after 'from'\12\0"
	.align 8
.LC206:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' at end of import statement\12\0"
.LC207:
	.ascii "%s.tc\0"
.LC208:
	.ascii "D:/TC/std/\0"
.LC209:
	.ascii "r\0"
	.align 8
.LC210:
	.ascii "Error opening library file for import: %s\12\0"
	.align 8
.LC211:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
	.align 8
.LC212:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
	.align 8
.LC213:
	.ascii "Error parsing library file for import: %s\12\0"
	.align 8
.LC214:
	.ascii "Error: Imported symbol '%s' was not found in %s\12\0"
	.align 8
.LC215:
	.ascii "Error creating import: name is NULL\12\0"
	.align 8
.LC216:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected function return type after 'func'\12\0"
	.align 8
.LC217:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown function return type\12\0"
	.align 8
.LC218:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected function name after return type\12\0"
	.align 8
.LC219:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after function name\12\0"
	.align 8
.LC220:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function parameter\12\0"
	.align 8
.LC221:
	.ascii "[Parser Error] at %s:%zu:%zu: Function parameters cannot have default values\12\0"
	.align 8
.LC222:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function parameter\12\0"
	.align 8
.LC223:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start function body\12\0"
	.align 8
.LC224:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function body statement\12\0"
	.align 8
.LC225:
	.ascii "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\12\0"
	.align 8
.LC226:
	.ascii "[Parser Error] at %s:%zu:%zu: Function missing return statement\12\0"
	.align 8
.LC227:
	.ascii "Error creating function: name or return_type is NULL\12\0"
	.align 8
.LC228:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected class name after 'class'\12\0"
	.align 8
.LC229:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start class body\12\0"
	.align 8
.LC230:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected method return type after 'method'\12\0"
	.align 8
.LC231:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown return type for method\12\0"
	.align 8
.LC232:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected method name after return type\12\0"
	.align 8
.LC233:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after method name\12\0"
	.align 8
.LC234:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected 'self' as first parameter of method\12\0"
	.align 8
.LC235:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after method parameter\12\0"
	.align 8
.LC236:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse method parameter\12\0"
	.align 8
.LC237:
	.ascii "[Parser Error] at %s:%zu:%zu: Method parameters cannot have default values\12\0"
	.align 8
.LC238:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start method body\12\0"
	.align 8
.LC239:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse method body statement\12\0"
	.align 8
.LC240:
	.ascii "[Parser Error] at %s:%zu:%zu: Method missing return statement\12\0"
	.align 8
.LC241:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class method\12\0"
	.align 8
.LC242:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class variable\12\0"
	.align 8
.LC243:
	.ascii "[Parser Error] at %s:%zu:%zu: Unsupported type for class variable\12\0"
	.align 8
.LC244:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after class variable declaration\12\0"
	.align 8
.LC245:
	.ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in class member\12\0"
	.align 8
.LC246:
	.ascii "[Parser Error] at %s:%zu:%zu: Constructor name conflicts with existing member\12\0"
.LC247:
	.ascii "0\0"
	.align 8
.LC248:
	.ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in code member\12\0"
	.align 8
.LC249:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse import statement\12\0"
	.align 8
.LC250:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to import module\12\0"
	.align 8
.LC251:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function declaration\12\0"
	.align 8
.LC252:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class declaration\12\0"
	.text
	.def	parse_code;	.scl	3;	.type	32;	.endef
parse_code:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$200, %rsp	 ;,
	movq	%rcx, %r12	 ; tmp985, lexer
	movq	%rdx, %rbx	 ; tmp986, now_scope
	movq	%r8, %r14	 ; tmp987, parser
 ; ./asm_test/win/i/all.c:2366:     if (builtin_scope == NULL) {
	cmpq	$0, builtin_scope(%rip)	 ;, builtin_scope
	je	.L1245	 ;,
.L1127:
 ; ./asm_test/win/i/all.c:2375:         now_scope = builtin_scope;
	testq	%rbx, %rbx	 ; now_scope
	cmove	builtin_scope(%rip), %rbx	 ; builtin_scope,, now_scope
 ; ./asm_test/win/i/all.c:2377:     List* members = create_list();
	call	create_list	 ;
	movq	%rax, 72(%rsp)	 ; tmp994, %sfp
 ; ./asm_test/win/i/all.c:2378:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	%rbx, %rcx	 ; now_scope,
	call	create_symbol_table	 ;
	movq	%rax, 64(%rsp)	 ; tmp995, %sfp
 ; ./asm_test/win/i/all.c:2379:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%r12, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, 56(%rsp)	 ; token, %sfp
 ; ./asm_test/win/i/all.c:2397:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unexpected token in code member\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	__imp___acrt_iob_func(%rip), %r13	 ;, tmp982
	movq	%r14, %r15	 ; parser, parser
	movq	%r12, %r14	 ; lexer, lexer
 ; ./asm_test/win/i/all.c:2380:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	jne	.L1129	 ;,
.L1130:
 ; ./asm_test/win/i/all.c:686:     Code* code = (Code*)alloc_memory(sizeof(Code));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:687:     code->members = members;
	movq	72(%rsp), %rsi	 ; %sfp, members
	movq	%rsi, (%rax)	 ; members, code_658->members
 ; ./asm_test/win/i/all.c:688:     code->global_scope = global_scope;
	movq	64(%rsp), %rsi	 ; %sfp, global_scope
	movq	%rsi, 8(%rax)	 ; global_scope, code_658->global_scope
 ; ./asm_test/win/i/all.c:2401: }
	addq	$200, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
.L1245:
 ; ./asm_test/win/i/all.c:2367:         builtin_scope = create_symbol_table(NULL);
	movl	$0, %ecx	 ;,
	call	create_symbol_table	 ;
	movq	%rax, %r9	 ; tmp988, _2
 ; ./asm_test/win/i/all.c:2367:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, builtin_scope(%rip)	 ; _2, builtin_scope
 ; ./asm_test/win/i/all.c:2368:         name_void = create_symbol(keywordList[20], SYMBOL_TYPE, NULL, builtin_scope);
	movl	$0, %r8d	 ;,
	movl	$6, %edx	 ;,
	movq	160+keywordList(%rip), %rcx	 ; keywordList[20],
	call	create_symbol	 ;
 ; ./asm_test/win/i/all.c:2368:         name_void = create_symbol(keywordList[20], SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_void(%rip)	 ; tmp989, name_void
 ; ./asm_test/win/i/all.c:2369:         name_int = create_symbol(keywordList[16], SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %r9	 ; builtin_scope,
	movl	$0, %r8d	 ;,
	movl	$6, %edx	 ;,
	movq	128+keywordList(%rip), %rcx	 ; keywordList[16],
	call	create_symbol	 ;
 ; ./asm_test/win/i/all.c:2369:         name_int = create_symbol(keywordList[16], SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_int(%rip)	 ; tmp990, name_int
 ; ./asm_test/win/i/all.c:2370:         name_float = create_symbol(keywordList[17], SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %r9	 ; builtin_scope,
	movl	$0, %r8d	 ;,
	movl	$6, %edx	 ;,
	movq	136+keywordList(%rip), %rcx	 ; keywordList[17],
	call	create_symbol	 ;
 ; ./asm_test/win/i/all.c:2370:         name_float = create_symbol(keywordList[17], SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_float(%rip)	 ; tmp991, name_float
 ; ./asm_test/win/i/all.c:2371:         name_string = create_symbol(keywordList[18], SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %r9	 ; builtin_scope,
	movl	$0, %r8d	 ;,
	movl	$6, %edx	 ;,
	movq	144+keywordList(%rip), %rcx	 ; keywordList[18],
	call	create_symbol	 ;
 ; ./asm_test/win/i/all.c:2371:         name_string = create_symbol(keywordList[18], SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_string(%rip)	 ; tmp992, name_string
 ; ./asm_test/win/i/all.c:2372:         name_bool = create_symbol(keywordList[19], SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %r9	 ; builtin_scope,
	movl	$0, %r8d	 ;,
	movl	$6, %edx	 ;,
	movq	152+keywordList(%rip), %rcx	 ; keywordList[19],
	call	create_symbol	 ;
 ; ./asm_test/win/i/all.c:2372:         name_bool = create_symbol(keywordList[19], SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_bool(%rip)	 ; tmp993, name_bool
	jmp	.L1127	 ;
.L1261:
 ; ./asm_test/win/i/all.c:2404:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2405:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_110->type
	jne	.L1246	 ;,
 ; ./asm_test/win/i/all.c:2409:     char* import_name = token->lexeme;
	movq	(%rax), %r12	 ; token_110->lexeme, import_name
 ; ./asm_test/win/i/all.c:2411:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp999, token
 ; ./asm_test/win/i/all.c:2410:     char* source = NULL;
	movq	$0, 80(%rsp)	 ;, %sfp
 ; ./asm_test/win/i/all.c:2412:     if (token->type == KEYWORD && token->lexeme == keywordList[1]) {
	cmpl	$6, 24(%rax)	 ;, token_120->type
	je	.L1247	 ;,
.L1135:
 ; ./asm_test/win/i/all.c:2421:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	cmpl	$5, 24(%rsi)	 ;, token_135->type
	jne	.L1136	 ;,
 ; ./asm_test/win/i/all.c:2421:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	movq	72+symbolList(%rip), %rax	 ; symbolList[9], tmp1222
	cmpq	%rax, (%rsi)	 ; tmp1222, token_135->lexeme
	jne	.L1136	 ;,
 ; ./asm_test/win/i/all.c:2426:     name = parse_import_file(import_name, source, now_scope, parser->source_file);
	movq	(%r15), %rcx	 ; parser_85(D)->source_file, _146
 ; ./asm_test/win/i/all.c:1164:     if (source == NULL) {
	cmpq	$0, 80(%rsp)	 ;, %sfp
	je	.L1248	 ;,
 ; ./asm_test/win/i/all.c:1169:         filename = absolute_path(source, get_file_dir(source_file));
	call	get_file_dir	 ;
	movq	%rax, %rdx	 ; tmp1007, _165
 ; ./asm_test/win/i/all.c:1169:         filename = absolute_path(source, get_file_dir(source_file));
	movq	80(%rsp), %rcx	 ; %sfp,
	call	absolute_path	 ;
	movq	%rax, %rdi	 ; tmp1008, filename
.L1140:
 ; ./asm_test/win/i/all.c:1170:     openfile = fopen(filename, "r");
	leaq	.LC209(%rip), %rdx	 ;, tmp680
	movq	%rdi, %rcx	 ; filename,
	call	fopen	 ;
	movq	%rax, %rbp	 ; tmp1009, openfile
 ; ./asm_test/win/i/all.c:1171:     if (openfile == NULL) {
	testq	%rax, %rax	 ; openfile
	je	.L1249	 ;,
 ; ./asm_test/win/i/all.c:1175:     fprintf(stderr, "Info: Starting parsing lib file for import: %s\n", filename);
	movl	$2, %ecx	 ;,
	movq	__imp___acrt_iob_func(%rip), %rax	 ;, tmp683
	movq	%rax, 96(%rsp)	 ; tmp683, %sfp
	call	*%rax	 ; tmp683
	movq	%rax, %rcx	 ; tmp1011, _170
 ; ./asm_test/win/i/all.c:1175:     fprintf(stderr, "Info: Starting parsing lib file for import: %s\n", filename);
	movq	%rdi, %r8	 ; filename,
	leaq	.LC211(%rip), %rdx	 ;, tmp684
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1176:     size_t length = 0;
	movq	$0, 184(%rsp)	 ;, length
 ; ./asm_test/win/i/all.c:1177:     char* source_code = read_source(openfile, &length);
	leaq	184(%rsp), %rdx	 ;, tmp685
	movq	%rbp, %rcx	 ; openfile,
	call	read_source	 ;
	movq	%rax, 88(%rsp)	 ; tmp1012, %sfp
 ; ./asm_test/win/i/all.c:1178:     fclose(openfile);
	movq	%rbp, %rcx	 ; openfile,
	call	fclose	 ;
 ; ./asm_test/win/i/all.c:1179:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	%rdi, %rcx	 ; filename,
	call	create_file	 ;
	movq	%rax, %rbx	 ; tmp1013, _172
 ; ./asm_test/win/i/all.c:1153:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbp	 ; tmp1014, new_parser
 ; ./asm_test/win/i/all.c:1154:     new_parser->in_function = 0;
	movb	$0, 8(%rax)	 ;, new_parser_185->in_function
 ; ./asm_test/win/i/all.c:1155:     new_parser->in_method = 0;
	movb	$0, 9(%rax)	 ;, new_parser_185->in_method
 ; ./asm_test/win/i/all.c:1156:     new_parser->in_loop = 0;
	movb	$0, 11(%rax)	 ;, new_parser_185->in_loop
 ; ./asm_test/win/i/all.c:1157:     new_parser->source_file = file;
	movq	%rbx, (%rax)	 ; _172, new_parser_185->source_file
 ; ./asm_test/win/i/all.c:1179:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	builtin_scope(%rip), %rbx	 ; builtin_scope, builtin_scope.62_174
	movq	%rdi, %r8	 ; filename,
	movq	184(%rsp), %rdx	 ; length,
	movq	88(%rsp), %rcx	 ; %sfp,
	call	create_lexer	 ;
	movq	%rax, %rcx	 ; tmp1015, _176
 ; ./asm_test/win/i/all.c:1179:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	%rbp, %r8	 ; new_parser,
	movq	%rbx, %rdx	 ; builtin_scope.62_174,
	call	parse_code	 ;
	movq	%rax, %rbp	 ; tmp1016, code
 ; ./asm_test/win/i/all.c:1180:     fprintf(stderr, "Info: Finished parsing lib file for import: %s\n", filename);
	movl	$2, %ecx	 ;,
	movq	96(%rsp), %rax	 ; %sfp, tmp683
	call	*%rax	 ; tmp683
	movq	%rax, %rcx	 ; tmp1017, _178
 ; ./asm_test/win/i/all.c:1180:     fprintf(stderr, "Info: Finished parsing lib file for import: %s\n", filename);
	movq	%rdi, %r8	 ; filename,
	leaq	.LC212(%rip), %rdx	 ;, tmp688
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1181:     if (code == NULL) {
	testq	%rbp, %rbp	 ; code
	je	.L1250	 ;,
 ; ./asm_test/win/i/all.c:1185:     name = search_name_use_strcmp(code->global_scope, import_name);
	movq	8(%rbp), %rcx	 ; code_177->global_scope, code_177->global_scope
	movq	%r12, %rdx	 ; import_name,
	call	search_name_use_strcmp	 ;
	movq	%rax, %rbp	 ; tmp1019, name
 ; ./asm_test/win/i/all.c:1186:     if (name != NULL)
	testq	%rax, %rax	 ; name
	je	.L1144	 ;,
 ; ./asm_test/win/i/all.c:1187:         list_append(scope->symbols, (size_t*)name);
	movq	64(%rsp), %rax	 ; %sfp, global_scope
	movq	8(%rax), %rcx	 ; global_scope_81->symbols, global_scope_81->symbols
	movq	%rbp, %rdx	 ; name,
	call	list_append	 ;
.L1145:
 ; ./asm_test/win/i/all.c:696:     Import* import = (Import*)alloc_memory(sizeof(Import));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp1022, import
 ; ./asm_test/win/i/all.c:697:     import->name = name;
	movq	%rbp, (%rax)	 ; name, import_187->name
 ; ./asm_test/win/i/all.c:698:     import->source = source;
	movq	80(%rsp), %rax	 ; %sfp, source
	movq	%rax, 8(%rdx)	 ; source, import_187->source
.L1230:
 ; ./asm_test/win/i/all.c:2385:             list_append(members, (size_t*)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ; tmp1023, _26
 ; ./asm_test/win/i/all.c:2385:             list_append(members, (size_t*)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	72(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2381:         if (token->type == KEYWORD && token->lexeme == keywordList[0]) {
	jmp	.L1146	 ;
.L1246:
 ; ./asm_test/win/i/all.c:2406:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected identifier after 'import'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rsi	 ; token_110->column, tmp1218
	leaq	1(%rsi), %rdi	 ;, _113
	movq	8(%rax), %rsi	 ; token_110->line, token_110->line
	addq	$1, %rsi	 ;, _115
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rbp	 ; _116->path, _117
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp998, _118
 ; ./asm_test/win/i/all.c:2406:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected identifier after 'import'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _113,
	movq	%rsi, %r9	 ; _115,
	movq	%rbp, %r8	 ; _117,
	leaq	.LC204(%rip), %rdx	 ;, tmp658
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2407:         return NULL;
	jmp	.L1134	 ;
.L1247:
 ; ./asm_test/win/i/all.c:2412:     if (token->type == KEYWORD && token->lexeme == keywordList[1]) {
	movq	8+keywordList(%rip), %rax	 ; keywordList[1], tmp1219
	cmpq	%rax, (%rsi)	 ; tmp1219, token_120->lexeme
	je	.L1251	 ;,
.L1136:
 ; ./asm_test/win/i/all.c:2422:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' at end of import statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	 ; token_973->column, tmp1223
	leaq	1(%rax), %rdi	 ;, _140
	movq	8(%rsi), %rsi	 ; token_973->line, token_973->line
	addq	$1, %rsi	 ;, _142
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rbp	 ; _143->path, _144
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1003, _145
 ; ./asm_test/win/i/all.c:2422:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' at end of import statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _140,
	movq	%rsi, %r9	 ; _142,
	movq	%rbp, %r8	 ; _144,
	leaq	.LC206(%rip), %rdx	 ;, tmp672
	call	fprintf	 ;
.L1134:
 ; ./asm_test/win/i/all.c:2384:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse import statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	56(%rsp), %rax	 ; %sfp, token
	movq	16(%rax), %rbx	 ; token_673->column, token_673->column
	movq	%rbx, 56(%rsp)	 ; token_673->column, %sfp
	movq	%rbx, %rsi	 ; token_673->column, token_673->column
	addq	$1, %rsi	 ;, _20
	movq	8(%rax), %rbx	 ; token_673->line, token_673->line
	addq	$1, %rbx	 ;, _22
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rdi	 ; _23->path, _24
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1169, _25
 ; ./asm_test/win/i/all.c:2384:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse import statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _20,
	movq	%rbx, %r9	 ; _22,
	movq	%rdi, %r8	 ; _24,
	leaq	.LC249(%rip), %rdx	 ;, tmp938
	call	fprintf	 ;
	movl	$0, %edx	 ;, import
	jmp	.L1230	 ;
.L1251:
 ; ./asm_test/win/i/all.c:2413:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2414:         if (token->type != STRING) {
	cmpl	$4, 24(%rax)	 ;, token_124->type
	jne	.L1252	 ;,
 ; ./asm_test/win/i/all.c:2418:         source = token->lexeme;
	movq	(%rax), %rax	 ; token_124->lexeme, source
	movq	%rax, 80(%rsp)	 ; source, %sfp
 ; ./asm_test/win/i/all.c:2419:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp1002, token
	jmp	.L1135	 ;
.L1252:
 ; ./asm_test/win/i/all.c:2415:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected string literal after 'from'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rbx	 ; token_124->column, tmp1220
	leaq	1(%rbx), %rdi	 ;, _127
	movq	8(%rax), %rsi	 ; token_124->line, token_124->line
	addq	$1, %rsi	 ;, _129
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rbp	 ; _130->path, _131
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1001, _132
 ; ./asm_test/win/i/all.c:2415:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected string literal after 'from'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _127,
	movq	%rsi, %r9	 ; _129,
	movq	%rbp, %r8	 ; _131,
	leaq	.LC205(%rip), %rdx	 ;, tmp665
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2416:             return NULL;
	jmp	.L1134	 ;
.L1248:
 ; ./asm_test/win/i/all.c:1165:         char* temp_import_name = create_string_check("", strlen(import_name) + 4, 0);
	movq	%r12, %rcx	 ; import_name,
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:1165:         char* temp_import_name = create_string_check("", strlen(import_name) + 4, 0);
	leaq	4(%rax), %rdx	 ;, tmp676
	movl	$0, %r8d	 ;,
	leaq	.LC99(%rip), %rcx	 ;, tmp677
	call	create_string_check	 ;
	movq	%rax, %rdi	 ; tmp1005, temp_import_name
 ; ./asm_test/win/i/all.c:1166:         sprintf(temp_import_name, "%s.tc", import_name);
	movq	%r12, %r8	 ; import_name,
	leaq	.LC207(%rip), %rdx	 ;, tmp678
	movq	%rax, %rcx	 ; temp_import_name,
	call	sprintf	 ;
 ; ./asm_test/win/i/all.c:1167:         filename = absolute_path(temp_import_name, "D:/TC/std/");
	leaq	.LC208(%rip), %rdx	 ;, tmp679
	movq	%rdi, %rcx	 ; temp_import_name,
	call	absolute_path	 ;
	movq	%rax, %rdi	 ; tmp1006, filename
	jmp	.L1140	 ;
.L1249:
 ; ./asm_test/win/i/all.c:1172:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1010, _169
 ; ./asm_test/win/i/all.c:1172:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	movq	%rdi, %r8	 ; filename,
	leaq	.LC210(%rip), %rdx	 ;, tmp682
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1173:         return NULL;
	jmp	.L1142	 ;
.L1250:
 ; ./asm_test/win/i/all.c:1182:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1018, _179
 ; ./asm_test/win/i/all.c:1182:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movq	%rdi, %r8	 ; filename,
	leaq	.LC213(%rip), %rdx	 ;, tmp690
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1183:         return NULL;
	jmp	.L1142	 ;
.L1144:
 ; ./asm_test/win/i/all.c:1189:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1020, _183
 ; ./asm_test/win/i/all.c:1189:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	movq	%rdi, %r9	 ; filename,
	movq	%r12, %r8	 ; import_name,
	leaq	.LC214(%rip), %rdx	 ;, tmp694
	call	fprintf	 ;
.L1142:
 ; ./asm_test/win/i/all.c:2428:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to import module\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	 ; token_135->column, tmp1350
	leaq	1(%rax), %rdi	 ;, _150
	movq	8(%rsi), %rsi	 ; token_135->line, token_135->line
	addq	$1, %rsi	 ;, _152
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rbp	 ; _153->path, _154
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1170, _155
 ; ./asm_test/win/i/all.c:2428:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to import module\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _150,
	movq	%rsi, %r9	 ; _152,
	movq	%rbp, %r8	 ; _154,
	leaq	.LC250(%rip), %rdx	 ;, tmp943
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2429:         name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
	movq	64(%rsp), %r9	 ; %sfp,
	movq	name_void(%rip), %r8	 ; name_void,
	movl	$3, %edx	 ;,
	movq	%r12, %rcx	 ; import_name,
	call	create_symbol	 ;
	movq	%rax, %rbp	 ; tmp1171, name
 ; ./asm_test/win/i/all.c:692:     if (name == NULL) {
	testq	%rax, %rax	 ; name
	jne	.L1145	 ;,
 ; ./asm_test/win/i/all.c:693:         fprintf(stderr, "Error creating import: name is NULL\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp1021
 ; ./asm_test/win/i/all.c:693:         fprintf(stderr, "Error creating import: name is NULL\n");
	movl	$36, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC215(%rip), %rcx	 ;, tmp696
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:694:         return NULL;
	jmp	.L1134	 ;
.L1149:
 ; ./asm_test/win/i/all.c:2438:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected function return type after 'func'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	 ; token_190->column, tmp1230
	leaq	1(%rax), %rdi	 ;, _199
	movq	8(%rsi), %rsi	 ; token_190->line, token_190->line
	addq	$1, %rsi	 ;, _201
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rbp	 ; _202->path, _203
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1026, _204
 ; ./asm_test/win/i/all.c:2438:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected function return type after 'func'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _199,
	movq	%rsi, %r9	 ; _201,
	movq	%rbp, %r8	 ; _203,
	leaq	.LC216(%rip), %rdx	 ;, tmp707
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2439:         return NULL;
	jmp	.L1150	 ;
.L1262:
 ; ./asm_test/win/i/all.c:2443:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown function return type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	 ; token_190->column, tmp1231
	leaq	1(%rax), %rdi	 ;, _208
	movq	8(%rsi), %rsi	 ; token_190->line, token_190->line
	addq	$1, %rsi	 ;, _210
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rbp	 ; _211->path, _212
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1028, _213
 ; ./asm_test/win/i/all.c:2443:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown function return type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _208,
	movq	%rsi, %r9	 ; _210,
	movq	%rbp, %r8	 ; _212,
	leaq	.LC217(%rip), %rdx	 ;, tmp713
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2444:         return NULL;
	jmp	.L1150	 ;
.L1263:
 ; ./asm_test/win/i/all.c:2448:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected function name after return type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rax	 ; token_214->column, tmp1232
	leaq	1(%rax), %rdi	 ;, _217
	movq	8(%rsi), %rsi	 ; token_214->line, token_214->line
	addq	$1, %rsi	 ;, _219
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rbp	 ; _220->path, _221
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1030, _222
 ; ./asm_test/win/i/all.c:2448:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected function name after return type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _217,
	movq	%rsi, %r9	 ; _219,
	movq	%rbp, %r8	 ; _221,
	leaq	.LC218(%rip), %rdx	 ;, tmp718
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2449:         return NULL;
	jmp	.L1150	 ;
.L1153:
 ; ./asm_test/win/i/all.c:2456:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after function name\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rsi	 ; token_226->column, tmp1235
	leaq	1(%rsi), %rdi	 ;, _231
	movq	8(%rax), %rsi	 ; token_226->line, token_226->line
	addq	$1, %rsi	 ;, _233
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rbp	 ; _234->path, _235
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1034, _236
 ; ./asm_test/win/i/all.c:2456:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after function name\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _231,
	movq	%rsi, %r9	 ; _233,
	movq	%rbp, %r8	 ; _235,
	leaq	.LC219(%rip), %rdx	 ;, tmp726
	call	fprintf	 ;
.L1150:
 ; ./asm_test/win/i/all.c:2389:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	56(%rsp), %rax	 ; %sfp, token
	movq	16(%rax), %rdi	 ; token_673->column, token_673->column
	movq	%rdi, 56(%rsp)	 ; token_673->column, %sfp
	leaq	1(%rdi), %rsi	 ;, _30
	movq	8(%rax), %rbx	 ; token_673->line, token_673->line
	addq	$1, %rbx	 ;, _32
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rdi	 ; _33->path, _34
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1172, _35
 ; ./asm_test/win/i/all.c:2389:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _30,
	movq	%rbx, %r9	 ; _32,
	movq	%rdi, %r8	 ; _34,
	leaq	.LC251(%rip), %rdx	 ;, tmp949
	call	fprintf	 ;
	movq	$0, 80(%rsp)	 ;, %sfp
.L1232:
 ; ./asm_test/win/i/all.c:2390:             list_append(members, (size_t*)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movl	$0, %r9d	 ;,
	movq	80(%rsp), %r8	 ; %sfp,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ; tmp1054, _36
 ; ./asm_test/win/i/all.c:2390:             list_append(members, (size_t*)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	72(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2386:         } else if (token->type == KEYWORD && token->lexeme == keywordList[2]) {
	jmp	.L1146	 ;
.L1255:
 ; ./asm_test/win/i/all.c:2464:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	 ; token_240->column, tmp1236
	leaq	1(%rax), %rdi	 ;, _242
	movq	8(%rsi), %rbx	 ; token_240->line, token_240->line
	addq	$1, %rbx	 ;, _244
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rsi	 ; _245->path, _246
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1038, _247
 ; ./asm_test/win/i/all.c:2464:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _242,
	movq	%rbx, %r9	 ; _244,
	movq	%rsi, %r8	 ; _246,
	leaq	.LC220(%rip), %rdx	 ;, tmp731
	call	fprintf	 ;
	jmp	.L1157	 ;
.L1158:
 ; ./asm_test/win/i/all.c:2468:             list_append(parameters, (size_t*)parameter);
	movq	%rax, %rdx	 ; parameter,
	movq	88(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
	jmp	.L1157	 ;
.L1256:
 ; ./asm_test/win/i/all.c:2470:         if (token->type == SYMBOL && token->lexeme == symbolList[4]) {
	movq	(%rax), %rax	 ; token_256->lexeme, _258
 ; ./asm_test/win/i/all.c:2470:         if (token->type == SYMBOL && token->lexeme == symbolList[4]) {
	cmpq	32(%rbp), %rax	 ; symbolList[4], _258
	je	.L1253	 ;,
 ; ./asm_test/win/i/all.c:2472:         } else if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpq	8(%rbp), %rax	 ; symbolList[1], _258
	jne	.L1159	 ;,
.L1155:
 ; ./asm_test/win/i/all.c:2461:     while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpl	$5, 24(%rsi)	 ;, token_240->type
	jne	.L1162	 ;,
 ; ./asm_test/win/i/all.c:2461:     while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movq	8(%rbp), %rax	 ; symbolList[1], tmp1239
	cmpq	%rax, (%rsi)	 ; tmp1239, token_240->lexeme
	je	.L1254	 ;,
.L1162:
 ; ./asm_test/win/i/all.c:2462:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	%r12, %rdx	 ; function_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; ./asm_test/win/i/all.c:2463:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	je	.L1255	 ;,
 ; ./asm_test/win/i/all.c:2465:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_239->value
	je	.L1158	 ;,
 ; ./asm_test/win/i/all.c:2466:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Function parameters cannot have default values\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	 ; token_240->column, tmp1237
	leaq	1(%rax), %rdi	 ;, _250
	movq	8(%rsi), %rbx	 ; token_240->line, token_240->line
	addq	$1, %rbx	 ;, _252
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rsi	 ; _253->path, _254
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1039, _255
 ; ./asm_test/win/i/all.c:2466:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Function parameters cannot have default values\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _250,
	movq	%rbx, %r9	 ; _252,
	movq	%rsi, %r8	 ; _254,
	leaq	.LC221(%rip), %rdx	 ;, tmp736
	call	fprintf	 ;
.L1157:
 ; ./asm_test/win/i/all.c:2469:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp1040, token
 ; ./asm_test/win/i/all.c:2470:         if (token->type == SYMBOL && token->lexeme == symbolList[4]) {
	cmpl	$5, 24(%rax)	 ;, token_256->type
	je	.L1256	 ;,
.L1159:
 ; ./asm_test/win/i/all.c:2473:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	 ; token_256->column, tmp1238
	leaq	1(%rax), %rdi	 ;, _264
	movq	8(%rsi), %rsi	 ; token_256->line, token_256->line
	addq	$1, %rsi	 ;, _266
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rbp	 ; _267->path, _268
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1042, _269
 ; ./asm_test/win/i/all.c:2473:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _264,
	movq	%rsi, %r9	 ; _266,
	movq	%rbp, %r8	 ; _268,
	leaq	.LC222(%rip), %rdx	 ;, tmp743
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2474:             return NULL;
	jmp	.L1150	 ;
.L1253:
 ; ./asm_test/win/i/all.c:2471:             token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp1041, token
 ; ./asm_test/win/i/all.c:2471:             token = get_next_token(lexer, 1);
	jmp	.L1155	 ;
.L1254:
 ; ./asm_test/win/i/all.c:2477:     token = get_next_token(lexer, 1);
	movq	104(%rsp), %rdi	 ; %sfp, return_type
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2478:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	cmpl	$5, 24(%rax)	 ;, token_273->type
	jne	.L1163	 ;,
 ; ./asm_test/win/i/all.c:2478:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	movq	16+symbolList(%rip), %rsi	 ; symbolList[2], tmp1240
	cmpq	%rsi, (%rax)	 ; tmp1240, token_273->lexeme
	jne	.L1163	 ;,
 ; ./asm_test/win/i/all.c:2482:     List* body = create_list();
	call	create_list	 ;
	movq	%rax, 104(%rsp)	 ; tmp1045, %sfp
 ; ./asm_test/win/i/all.c:2483:     parser->in_function = 1;
	movb	$1, 8(%r15)	 ;, parser_85(D)->in_function
 ; ./asm_test/win/i/all.c:2485:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp1046, token
 ; ./asm_test/win/i/all.c:2484:     char have_return = 0;
	movl	$0, %ebp	 ;, have_return
	movq	%rdi, 120(%rsp)	 ; return_type, %sfp
 ; ./asm_test/win/i/all.c:2486:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	jmp	.L1165	 ;
.L1163:
 ; ./asm_test/win/i/all.c:2479:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start function body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rsi	 ; token_273->column, tmp1241
	leaq	1(%rsi), %rdi	 ;, _278
	movq	8(%rax), %rsi	 ; token_273->line, token_273->line
	addq	$1, %rsi	 ;, _280
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rbp	 ; _281->path, _282
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1044, _283
 ; ./asm_test/win/i/all.c:2479:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start function body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _278,
	movq	%rsi, %r9	 ; _280,
	movq	%rbp, %r8	 ; _282,
	leaq	.LC223(%rip), %rdx	 ;, tmp752
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2480:         return NULL;
	jmp	.L1150	 ;
.L1169:
 ; ./asm_test/win/i/all.c:2487:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	%r12, %rdx	 ; function_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %rbx	 ; tmp1047, statement
 ; ./asm_test/win/i/all.c:2488:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L1257	 ;,
 ; ./asm_test/win/i/all.c:2490:         else if (have_return)
	testb	%bpl, %bpl	 ; have_return
	jne	.L1258	 ;,
.L1168:
 ; ./asm_test/win/i/all.c:2493:             have_return = 1;
	cmpl	$5, 8(%rbx)	 ;, statement_286->type
	movl	$1, %eax	 ;, tmp960
	cmove	%eax, %ebp	 ; have_return,, tmp960, have_return
.L1167:
 ; ./asm_test/win/i/all.c:2494:         list_append(body, (size_t*)statement);
	movq	%rbx, %rdx	 ; statement,
	movq	104(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2495:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp1050, token
.L1165:
 ; ./asm_test/win/i/all.c:2486:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	cmpl	$5, 24(%rsi)	 ;, token_287->type
	jne	.L1169	 ;,
 ; ./asm_test/win/i/all.c:2486:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	leaq	symbolList(%rip), %rax	 ;, tmp1246
	movq	24(%rax), %rax	 ; symbolList[3], tmp1247
	cmpq	%rax, (%rsi)	 ; tmp1247, token_287->lexeme
	jne	.L1169	 ;,
 ; ./asm_test/win/i/all.c:2497:     parser->in_function = 0;
	movq	120(%rsp), %rdi	 ; %sfp, return_type
	movb	$0, 8(%r15)	 ;, parser_85(D)->in_function
 ; ./asm_test/win/i/all.c:2498:     if (!have_return && return_type != name_void)
	testb	%bpl, %bpl	 ; have_return
	jne	.L1170	 ;,
 ; ./asm_test/win/i/all.c:2498:     if (!have_return && return_type != name_void)
	cmpq	name_void(%rip), %rdi	 ; name_void, return_type
	je	.L1171	 ;,
 ; ./asm_test/win/i/all.c:2499:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Function missing return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	 ; token_287->column, tmp1248
	leaq	1(%rax), %rbp	 ;, _310
	movq	8(%rsi), %rax	 ; token_287->line, token_287->line
	leaq	1(%rax), %rbx	 ;, _312
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rsi	 ; _313->path, _314
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1051, _315
 ; ./asm_test/win/i/all.c:2499:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Function missing return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbp, 32(%rsp)	 ; _310,
	movq	%rbx, %r9	 ; _312,
	movq	%rsi, %r8	 ; _314,
	leaq	.LC226(%rip), %rdx	 ;, tmp769
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2500:     if (!have_return && return_type == name_void)
	cmpq	name_void(%rip), %rdi	 ; name_void, return_type
	je	.L1171	 ;,
.L1170:
 ; ./asm_test/win/i/all.c:702:     if (name == NULL || return_type == NULL) {
	cmpq	$0, 96(%rsp)	 ;, %sfp
	je	.L1259	 ;,
 ; ./asm_test/win/i/all.c:706:     function->name = name;
	movq	80(%rsp), %rax	 ; %sfp, function
	movq	96(%rsp), %rbx	 ; %sfp, name
	movq	%rbx, (%rax)	 ; name, function_223->name
 ; ./asm_test/win/i/all.c:707:     function->return_type = return_type;
	movq	%rdi, 8(%rax)	 ; return_type, function_223->return_type
 ; ./asm_test/win/i/all.c:708:     function->parameters = parameters;
	movq	88(%rsp), %rsi	 ; %sfp, parameters
	movq	%rsi, 16(%rax)	 ; parameters, function_223->parameters
 ; ./asm_test/win/i/all.c:709:     function->body = body;
	movq	104(%rsp), %rdi	 ; %sfp, body
	movq	%rdi, 24(%rax)	 ; body, function_223->body
 ; ./asm_test/win/i/all.c:710:     function->function_scope = function_scope;
	movq	%r12, 32(%rax)	 ; function_scope, function_223->function_scope
	jmp	.L1232	 ;
.L1257:
 ; ./asm_test/win/i/all.c:2489:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	 ; token_287->column, tmp1242
	leaq	1(%rax), %rdi	 ;, _289
	movq	8(%rsi), %rsi	 ; token_287->line, token_287->line
	leaq	1(%rsi), %rax	 ;, _291
	movq	%rax, 112(%rsp)	 ; _291, %sfp
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rsi	 ; _292->path, _293
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1048, _294
 ; ./asm_test/win/i/all.c:2489:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _289,
	movq	112(%rsp), %r9	 ; %sfp,
	movq	%rsi, %r8	 ; _293,
	leaq	.LC224(%rip), %rdx	 ;, tmp757
	call	fprintf	 ;
	jmp	.L1167	 ;
.L1258:
 ; ./asm_test/win/i/all.c:2491:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	 ; token_287->column, tmp1244
	leaq	1(%rax), %rdi	 ;, _297
	movq	8(%rsi), %rsi	 ; token_287->line, token_287->line
	leaq	1(%rsi), %rax	 ;, _299
	movq	%rax, 112(%rsp)	 ; _299, %sfp
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rsi	 ; _300->path, _301
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1049, _302
 ; ./asm_test/win/i/all.c:2491:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _297,
	movq	112(%rsp), %r9	 ; %sfp,
	movq	%rsi, %r8	 ; _301,
	leaq	.LC225(%rip), %rdx	 ;, tmp762
	call	fprintf	 ;
	jmp	.L1168	 ;
.L1171:
 ; ./asm_test/win/i/all.c:2501:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdx	 ; tmp1052, _317
 ; ./asm_test/win/i/all.c:2501:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	104(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
	jmp	.L1170	 ;
.L1259:
 ; ./asm_test/win/i/all.c:703:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %r9	 ;, tmp1053
 ; ./asm_test/win/i/all.c:703:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	movl	$53, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC227(%rip), %rcx	 ;, tmp771
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:704:         return NULL;
	jmp	.L1150	 ;
.L1147:
 ; ./asm_test/win/i/all.c:2391:         } else if (token->type == KEYWORD && token->lexeme == keywordList[3]) {
	cmpq	24+keywordList(%rip), %rax	 ; keywordList[3], _17
	je	.L1260	 ;,
.L1131:
 ; ./asm_test/win/i/all.c:2397:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unexpected token in code member\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	56(%rsp), %rax	 ; %sfp, token
	movq	16(%rax), %rdi	 ; token_673->column, token_673->column
	movq	%rdi, 56(%rsp)	 ; token_673->column, %sfp
	leaq	1(%rdi), %rsi	 ;, _48
	movq	8(%rax), %rbx	 ; token_673->line, token_673->line
	addq	$1, %rbx	 ;, _50
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rdi	 ; _51->path, _52
	movl	$2, %ecx	 ;,
	call	*%r13	 ; tmp982
	movq	%rax, %rcx	 ; tmp1166, _53
 ; ./asm_test/win/i/all.c:2397:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unexpected token in code member\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _48,
	movq	%rbx, %r9	 ; _50,
	movq	%rdi, %r8	 ; _52,
	leaq	.LC248(%rip), %rdx	 ;,
	call	fprintf	 ;
.L1146:
 ; ./asm_test/win/i/all.c:2398:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, 56(%rsp)	 ; token, %sfp
 ; ./asm_test/win/i/all.c:2380:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L1130	 ;,
.L1129:
 ; ./asm_test/win/i/all.c:2380:     while (token != NULL && token->type != EOF_TOKEN) {
	movq	56(%rsp), %rax	 ; %sfp, token
	movl	24(%rax), %eax	 ; token_673->type, _54
 ; ./asm_test/win/i/all.c:2380:     while (token != NULL && token->type != EOF_TOKEN) {
	testl	%eax, %eax	 ; _54
	je	.L1130	 ;,
 ; ./asm_test/win/i/all.c:2381:         if (token->type == KEYWORD && token->lexeme == keywordList[0]) {
	cmpl	$6, %eax	 ;, _54
	jne	.L1131	 ;,
 ; ./asm_test/win/i/all.c:2381:         if (token->type == KEYWORD && token->lexeme == keywordList[0]) {
	movq	56(%rsp), %rax	 ; %sfp, token
	movq	(%rax), %rax	 ; token_673->lexeme, _17
 ; ./asm_test/win/i/all.c:2381:         if (token->type == KEYWORD && token->lexeme == keywordList[0]) {
	cmpq	keywordList(%rip), %rax	 ; keywordList[0], _17
	je	.L1261	 ;,
 ; ./asm_test/win/i/all.c:2386:         } else if (token->type == KEYWORD && token->lexeme == keywordList[2]) {
	cmpq	16+keywordList(%rip), %rax	 ; keywordList[2], _17
	jne	.L1147	 ;,
 ; ./asm_test/win/i/all.c:2435:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
	movq	%rax, %r12	 ; tmp1024, function_scope
 ; ./asm_test/win/i/all.c:2436:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp1025, token
 ; ./asm_test/win/i/all.c:2437:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	movl	24(%rax), %eax	 ; token_190->type, _191
 ; ./asm_test/win/i/all.c:2437:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpl	$1, %eax	 ;, _191
	je	.L1148	 ;,
 ; ./asm_test/win/i/all.c:2437:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpl	$6, %eax	 ;, _191
	jne	.L1149	 ;,
 ; ./asm_test/win/i/all.c:2437:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	movq	(%rsi), %rax	 ; token_190->lexeme, _192
 ; ./asm_test/win/i/all.c:2437:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	128+keywordList(%rip), %rax	 ; keywordList[16], _192
	je	.L1148	 ;,
 ; ./asm_test/win/i/all.c:2437:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	136+keywordList(%rip), %rax	 ; keywordList[17], _192
	je	.L1148	 ;,
 ; ./asm_test/win/i/all.c:2437:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	144+keywordList(%rip), %rax	 ; keywordList[18], _192
	je	.L1148	 ;,
 ; ./asm_test/win/i/all.c:2437:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	152+keywordList(%rip), %rax	 ; keywordList[19], _192
	je	.L1148	 ;,
 ; ./asm_test/win/i/all.c:2437:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	160+keywordList(%rip), %rax	 ; keywordList[20], _192
	jne	.L1149	 ;,
.L1148:
 ; ./asm_test/win/i/all.c:2441:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%rsi), %rdx	 ; token_190->lexeme, token_190->lexeme
	movq	64(%rsp), %rcx	 ; %sfp,
	call	search_name	 ;
	movq	%rax, %rdi	 ; tmp1027, return_type
 ; ./asm_test/win/i/all.c:2442:     if (return_type == NULL) {
	testq	%rax, %rax	 ; return_type
	je	.L1262	 ;,
 ; ./asm_test/win/i/all.c:2446:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp1029, token
 ; ./asm_test/win/i/all.c:2447:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_214->type
	jne	.L1263	 ;,
 ; ./asm_test/win/i/all.c:2451:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %r9	 ; tmp1031, function
	movq	%rax, 80(%rsp)	 ; function, %sfp
 ; ./asm_test/win/i/all.c:2452:     function->function_scope = function_scope;
	movq	%r12, 32(%rax)	 ; function_scope, function_223->function_scope
 ; ./asm_test/win/i/all.c:2453:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	(%rsi), %rcx	 ; token_214->lexeme, token_214->lexeme
	movq	%rdi, %r8	 ; return_type,
	movl	$1, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, 96(%rsp)	 ; tmp1032, %sfp
 ; ./asm_test/win/i/all.c:2454:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2455:     if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	cmpl	$5, 24(%rax)	 ;, token_226->type
	jne	.L1153	 ;,
 ; ./asm_test/win/i/all.c:2455:     if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	movq	symbolList(%rip), %rsi	 ; symbolList[0], tmp1234
	cmpq	%rsi, (%rax)	 ; tmp1234, token_226->lexeme
	jne	.L1153	 ;,
 ; ./asm_test/win/i/all.c:2459:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp1035, token
 ; ./asm_test/win/i/all.c:2460:     List* parameters = create_list();
	call	create_list	 ;
	movq	%rax, 88(%rsp)	 ; tmp1036, %sfp
 ; ./asm_test/win/i/all.c:2461:     while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	leaq	symbolList(%rip), %rbp	 ;, tmp968
	movq	%rdi, 104(%rsp)	 ; return_type, %sfp
 ; ./asm_test/win/i/all.c:2461:     while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	jmp	.L1155	 ;
.L1260:
 ; ./asm_test/win/i/all.c:2585:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
	movq	%rax, 80(%rsp)	 ; tmp1055, %sfp
 ; ./asm_test/win/i/all.c:2586:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp1056, token
 ; ./asm_test/win/i/all.c:2587:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_328->type
	jne	.L1264	 ;,
 ; ./asm_test/win/i/all.c:2591:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %r9	 ; tmp1058, class
	movq	%rax, 104(%rsp)	 ; class, %sfp
 ; ./asm_test/win/i/all.c:2592:     class->class_scope = class_scope;
	movq	80(%rsp), %rax	 ; %sfp, class_scope
	movq	%rax, 16(%r9)	 ; class_scope, class_337->class_scope
 ; ./asm_test/win/i/all.c:2593:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	movq	(%rsi), %rcx	 ; token_328->lexeme, token_328->lexeme
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, 96(%rsp)	 ; tmp1059, %sfp
 ; ./asm_test/win/i/all.c:2594:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2595:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	cmpl	$5, 24(%rax)	 ;, token_340->type
	jne	.L1175	 ;,
 ; ./asm_test/win/i/all.c:2595:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	movq	16+symbolList(%rip), %rdi	 ; symbolList[2], tmp1261
	cmpq	%rdi, (%rax)	 ; tmp1261, token_340->lexeme
	jne	.L1175	 ;,
 ; ./asm_test/win/i/all.c:2599:     List* members = create_list();
	call	create_list	 ;
	movq	%rax, 112(%rsp)	 ; tmp1062, %sfp
 ; ./asm_test/win/i/all.c:2600:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, 56(%rsp)	 ; tmp1063, %sfp
 ; ./asm_test/win/i/all.c:2601:     size_t size = 0;
	movq	$0, 136(%rsp)	 ;, %sfp
 ; ./asm_test/win/i/all.c:2632:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unexpected token in class member\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	__imp___acrt_iob_func(%rip), %r12	 ;, tmp980
	movq	%r14, %rbp	 ; lexer, lexer
 ; ./asm_test/win/i/all.c:2602:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	jmp	.L1177	 ;
.L1264:
 ; ./asm_test/win/i/all.c:2588:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected class name after 'class'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rax	 ; token_328->column, tmp1258
	leaq	1(%rax), %rdi	 ;, _331
	movq	8(%rsi), %rsi	 ; token_328->line, token_328->line
	addq	$1, %rsi	 ;, _333
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rbp	 ; _334->path, _335
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1057, _336
 ; ./asm_test/win/i/all.c:2588:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected class name after 'class'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _331,
	movq	%rsi, %r9	 ; _333,
	movq	%rbp, %r8	 ; _335,
	leaq	.LC228(%rip), %rdx	 ;, tmp777
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2589:         return NULL;
	jmp	.L1174	 ;
.L1175:
 ; ./asm_test/win/i/all.c:2596:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start class body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_340->column, tmp1262
	addq	$1, %rdi	 ;, _345
	movq	8(%rax), %rsi	 ; token_340->line, token_340->line
	addq	$1, %rsi	 ;, _347
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rbp	 ; _348->path, _349
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1061, _350
 ; ./asm_test/win/i/all.c:2596:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start class body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _345,
	movq	%rsi, %r9	 ; _347,
	movq	%rbp, %r8	 ; _349,
	leaq	.LC229(%rip), %rdx	 ;, tmp785
	call	fprintf	 ;
.L1174:
 ; ./asm_test/win/i/all.c:2394:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse class declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	56(%rsp), %rax	 ; %sfp, token
	movq	16(%rax), %rbx	 ; token_673->column, token_673->column
	movq	%rbx, 56(%rsp)	 ; token_673->column, %sfp
	movq	%rbx, %rsi	 ; token_673->column, token_673->column
	addq	$1, %rsi	 ;, _40
	movq	8(%rax), %rbx	 ; token_673->line, token_673->line
	addq	$1, %rbx	 ;, _42
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rdi	 ; _43->path, _44
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1173, _45
 ; ./asm_test/win/i/all.c:2394:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse class declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _40,
	movq	%rbx, %r9	 ; _42,
	movq	%rdi, %r8	 ; _44,
	leaq	.LC252(%rip), %rdx	 ;, tmp954
	call	fprintf	 ;
	movq	$0, 104(%rsp)	 ;, %sfp
	jmp	.L1233	 ;
.L1181:
 ; ./asm_test/win/i/all.c:2510:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected method return type after 'method'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	 ; token_512->column, tmp1264
	leaq	1(%rax), %rdi	 ;, _521
	movq	8(%rsi), %rsi	 ; token_512->line, token_512->line
	addq	$1, %rsi	 ;, _523
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rbx	 ; _524->path, _525
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1067, _526
 ; ./asm_test/win/i/all.c:2510:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected method return type after 'method'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _521,
	movq	%rsi, %r9	 ; _523,
	movq	%rbx, %r8	 ; _525,
	leaq	.LC230(%rip), %rdx	 ;, tmp798
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2511:         return NULL;
	jmp	.L1234	 ;
.L1271:
 ; ./asm_test/win/i/all.c:2515:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown return type for method\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	 ; token_512->column, tmp1266
	leaq	1(%rax), %rdi	 ;, _530
	movq	8(%rsi), %rsi	 ; token_512->line, token_512->line
	addq	$1, %rsi	 ;, _532
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rbx	 ; _533->path, _534
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1069, _535
 ; ./asm_test/win/i/all.c:2515:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown return type for method\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _530,
	movq	%rsi, %r9	 ; _532,
	movq	%rbx, %r8	 ; _534,
	leaq	.LC231(%rip), %rdx	 ;, tmp804
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2516:         return NULL;
	jmp	.L1234	 ;
.L1272:
 ; ./asm_test/win/i/all.c:2520:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected method name after return type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rax	 ; token_536->column, tmp1267
	leaq	1(%rax), %rdi	 ;, _539
	movq	8(%rsi), %rsi	 ; token_536->line, token_536->line
	addq	$1, %rsi	 ;, _541
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rbx	 ; _542->path, _543
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1071, _544
 ; ./asm_test/win/i/all.c:2520:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected method name after return type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _539,
	movq	%rsi, %r9	 ; _541,
	movq	%rbx, %r8	 ; _543,
	leaq	.LC232(%rip), %rdx	 ;, tmp809
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2521:         return NULL;
	jmp	.L1234	 ;
.L1185:
 ; ./asm_test/win/i/all.c:2528:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after method name\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_550->column, tmp1272
	addq	$1, %rdi	 ;, _555
	movq	8(%rax), %rsi	 ; token_550->line, token_550->line
	addq	$1, %rsi	 ;, _557
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rbx	 ; _558->path, _559
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1076, _560
 ; ./asm_test/win/i/all.c:2528:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after method name\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _555,
	movq	%rsi, %r9	 ; _557,
	movq	%rbx, %r8	 ; _559,
	leaq	.LC233(%rip), %rdx	 ;, tmp818
	call	fprintf	 ;
.L1234:
 ; ./asm_test/win/i/all.c:2606:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse class method\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	56(%rsp), %rax	 ; %sfp, token
	movq	16(%rax), %rsi	 ; token_354->column, token_354->column
	movq	%rsi, 56(%rsp)	 ; token_354->column, %sfp
	leaq	1(%rsi), %rsi	 ;, _359
	movq	8(%rax), %rbx	 ; token_354->line, token_354->line
	addq	$1, %rbx	 ;, _361
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rdi	 ; _362->path, _363
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1099, _364
 ; ./asm_test/win/i/all.c:2606:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse class method\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _359,
	movq	%rbx, %r9	 ; _361,
	movq	%rdi, %r8	 ; _363,
	leaq	.LC241(%rip), %rdx	 ;, tmp875
	call	fprintf	 ;
	movl	$0, %edx	 ;, _653
	jmp	.L1207	 ;
.L1193:
 ; ./asm_test/win/i/all.c:2542:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after method parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	 ; token_576->column, tmp1277
	leaq	1(%rax), %rdi	 ;, _584
	movq	8(%rsi), %rsi	 ; token_576->line, token_576->line
	addq	$1, %rsi	 ;, _586
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rbx	 ; _587->path, _588
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1084, _589
 ; ./asm_test/win/i/all.c:2542:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after method parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _584,
	movq	%rsi, %r9	 ; _586,
	movq	%rbx, %r8	 ; _588,
	leaq	.LC235(%rip), %rdx	 ;, tmp834
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2543:             return NULL;
	jmp	.L1234	 ;
.L1265:
 ; ./asm_test/win/i/all.c:2547:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse method parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbx), %rax	 ; token_579->column, tmp1278
	leaq	1(%rax), %rsi	 ;, _591
	movq	8(%rbx), %rbx	 ; token_579->line, token_579->line
	addq	$1, %rbx	 ;, _593
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rdi	 ; _594->path, _595
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1085, _596
 ; ./asm_test/win/i/all.c:2547:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse method parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _591,
	movq	%rbx, %r9	 ; _593,
	movq	%rdi, %r8	 ; _595,
	leaq	.LC236(%rip), %rdx	 ;, tmp839
	call	fprintf	 ;
	jmp	.L1195	 ;
.L1196:
 ; ./asm_test/win/i/all.c:2551:             list_append(parameters, (size_t*)parameter);
	movq	%rax, %rdx	 ; parameter,
	movq	144(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
	jmp	.L1195	 ;
.L1266:
 ; ./asm_test/win/i/all.c:2537:     while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movq	8(%r14), %rdi	 ; symbolList[1], tmp1280
	cmpq	%rdi, (%rsi)	 ; tmp1280, token_576->lexeme
	je	.L1194	 ;,
 ; ./asm_test/win/i/all.c:2538:         if (token->type == SYMBOL && token->lexeme == symbolList[4]) {
	movq	32(%r14), %rdi	 ; symbolList[4], tmp1275
	cmpq	%rdi, (%rsi)	 ; tmp1275, token_576->lexeme
	jne	.L1190	 ;,
 ; ./asm_test/win/i/all.c:2539:             token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp1082, token
 ; ./asm_test/win/i/all.c:2545:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	88(%rsp), %rdx	 ; %sfp,
	movq	%rbp, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; ./asm_test/win/i/all.c:2546:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	je	.L1265	 ;,
 ; ./asm_test/win/i/all.c:2548:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_580->value
	je	.L1196	 ;,
 ; ./asm_test/win/i/all.c:2549:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Method parameters cannot have default values\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbx), %rax	 ; token_579->column, tmp1279
	leaq	1(%rax), %rsi	 ;, _599
	movq	8(%rbx), %rbx	 ; token_579->line, token_579->line
	addq	$1, %rbx	 ;, _601
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rdi	 ; _602->path, _603
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1086, _604
 ; ./asm_test/win/i/all.c:2549:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Method parameters cannot have default values\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _599,
	movq	%rbx, %r9	 ; _601,
	movq	%rdi, %r8	 ; _603,
	leaq	.LC237(%rip), %rdx	 ;, tmp844
	call	fprintf	 ;
.L1195:
 ; ./asm_test/win/i/all.c:2552:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp1087, token
.L1189:
 ; ./asm_test/win/i/all.c:2537:     while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movl	24(%rsi), %eax	 ; token_576->type, _575
 ; ./asm_test/win/i/all.c:2537:     while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpl	$5, %eax	 ;, _575
	je	.L1266	 ;,
.L1190:
 ; ./asm_test/win/i/all.c:2540:         } else if (token->type == SYMBOL && token->lexeme == symbolList[1]) break;
	cmpl	$5, %eax	 ;, _575
	jne	.L1193	 ;,
 ; ./asm_test/win/i/all.c:2540:         } else if (token->type == SYMBOL && token->lexeme == symbolList[1]) break;
	movq	8+symbolList(%rip), %rax	 ; symbolList[1], tmp1276
	cmpq	%rax, (%rsi)	 ; tmp1276, token_576->lexeme
	jne	.L1193	 ;,
.L1194:
 ; ./asm_test/win/i/all.c:2554:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2555:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	cmpl	$5, 24(%rax)	 ;, token_608->type
	jne	.L1198	 ;,
 ; ./asm_test/win/i/all.c:2555:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	movq	16+symbolList(%rip), %rbx	 ; symbolList[2], tmp1281
	cmpq	%rbx, (%rax)	 ; tmp1281, token_608->lexeme
	jne	.L1198	 ;,
 ; ./asm_test/win/i/all.c:2559:     List* body = create_list();
	call	create_list	 ;
	movq	%rax, 128(%rsp)	 ; tmp1090, %sfp
 ; ./asm_test/win/i/all.c:2560:     parser->in_function = 1;
	movb	$1, 8(%r15)	 ;, parser_85(D)->in_function
 ; ./asm_test/win/i/all.c:2561:     parser->in_method = 1;
	movb	$1, 9(%r15)	 ;, parser_85(D)->in_method
 ; ./asm_test/win/i/all.c:2563:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp1091, token
 ; ./asm_test/win/i/all.c:2562:     char have_return = 0;
	movl	$0, %r14d	 ;, have_return
 ; ./asm_test/win/i/all.c:2564:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	jmp	.L1200	 ;
.L1198:
 ; ./asm_test/win/i/all.c:2556:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start method body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_608->column, tmp1282
	addq	$1, %rdi	 ;, _613
	movq	8(%rax), %rsi	 ; token_608->line, token_608->line
	addq	$1, %rsi	 ;, _615
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rbx	 ; _616->path, _617
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1089, _618
 ; ./asm_test/win/i/all.c:2556:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start method body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _613,
	movq	%rsi, %r9	 ; _615,
	movq	%rbx, %r8	 ; _617,
	leaq	.LC238(%rip), %rdx	 ;, tmp853
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2557:         return NULL;
	jmp	.L1234	 ;
.L1204:
 ; ./asm_test/win/i/all.c:2565:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	88(%rsp), %rdx	 ; %sfp,
	movq	%rbp, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %rbx	 ; tmp1092, statement
 ; ./asm_test/win/i/all.c:2566:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L1267	 ;,
 ; ./asm_test/win/i/all.c:2568:         else if (have_return)
	testb	%r14b, %r14b	 ; have_return
	jne	.L1268	 ;,
.L1203:
 ; ./asm_test/win/i/all.c:2571:             have_return = 1;
	cmpl	$5, 8(%rbx)	 ;, statement_621->type
	movl	$1, %eax	 ;, tmp964
	cmove	%eax, %r14d	 ; have_return,, tmp964, have_return
.L1202:
 ; ./asm_test/win/i/all.c:2572:         list_append(body, (size_t*)statement);
	movq	%rbx, %rdx	 ; statement,
	movq	128(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2573:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp1095, token
.L1200:
 ; ./asm_test/win/i/all.c:2564:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	cmpl	$5, 24(%rdi)	 ;, token_622->type
	jne	.L1204	 ;,
 ; ./asm_test/win/i/all.c:2564:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	leaq	symbolList(%rip), %rax	 ;, tmp1289
	movq	24(%rax), %rax	 ; symbolList[3], tmp1290
	cmpq	%rax, (%rdi)	 ; tmp1290, token_622->lexeme
	jne	.L1204	 ;,
 ; ./asm_test/win/i/all.c:2575:     parser->in_function = 0;
	movb	$0, 8(%r15)	 ;, parser_85(D)->in_function
 ; ./asm_test/win/i/all.c:2576:     parser->in_method = 0;
	movb	$0, 9(%r15)	 ;, parser_85(D)->in_method
 ; ./asm_test/win/i/all.c:2577:     if (!have_return && return_type != name_void)
	testb	%r14b, %r14b	 ; have_return
	jne	.L1205	 ;,
 ; ./asm_test/win/i/all.c:2577:     if (!have_return && return_type != name_void)
	movq	120(%rsp), %r14	 ; %sfp, return_type
	cmpq	name_void(%rip), %r14	 ; name_void, return_type
	je	.L1206	 ;,
 ; ./asm_test/win/i/all.c:2578:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Method missing return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rdi), %rax	 ; token_622->column, tmp1292
	leaq	1(%rax), %rsi	 ;, _645
	movq	8(%rdi), %rax	 ; token_622->line, token_622->line
	leaq	1(%rax), %rbx	 ;, _647
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rdi	 ; _648->path, _649
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1096, _650
 ; ./asm_test/win/i/all.c:2578:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Method missing return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _645,
	movq	%rbx, %r9	 ; _647,
	movq	%rdi, %r8	 ; _649,
	leaq	.LC240(%rip), %rdx	 ;, tmp870
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2579:     if (!have_return && return_type == name_void)
	cmpq	name_void(%rip), %r14	 ; name_void, return_type
	je	.L1206	 ;,
.L1205:
 ; ./asm_test/win/i/all.c:2581:     return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
	movq	88(%rsp), %rax	 ; %sfp, method_scope
	movq	%rax, 40(%rsp)	 ; method_scope,
	movq	128(%rsp), %rax	 ; %sfp, body
	movq	%rax, 32(%rsp)	 ; body,
	movq	144(%rsp), %r9	 ; %sfp,
	movq	120(%rsp), %r8	 ; %sfp,
	movq	160(%rsp), %rdx	 ; %sfp,
	movq	152(%rsp), %rcx	 ; %sfp,
	call	create_method_use_ptr	 ;
	movq	%rax, %rdx	 ; tmp1098, _653
 ; ./asm_test/win/i/all.c:2605:             if (method == NULL)
	testq	%rax, %rax	 ; _653
	je	.L1234	 ;,
.L1207:
 ; ./asm_test/win/i/all.c:2607:             list_append(members, (size_t*)create_class_member(CLASS_METHOD, method, NULL));
	movl	$0, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_class_member	 ;
	movq	%rax, %rdx	 ; tmp1100, _365
 ; ./asm_test/win/i/all.c:2607:             list_append(members, (size_t*)create_class_member(CLASS_METHOD, method, NULL));
	movq	112(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2603:         if (token->type == KEYWORD && token->lexeme == keywordList[4]) {
	jmp	.L1208	 ;
.L1267:
 ; ./asm_test/win/i/all.c:2567:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse method body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rdi), %rax	 ; token_622->column, tmp1284
	addq	$1, %rax	 ;, _624
	movq	%rax, 168(%rsp)	 ; _624, %sfp
	movq	8(%rdi), %rsi	 ; token_622->line, token_622->line
	addq	$1, %rsi	 ;, _626
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rdi	 ; _627->path, _628
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1093, _629
 ; ./asm_test/win/i/all.c:2567:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse method body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	168(%rsp), %rax	 ; %sfp, _624
	movq	%rax, 32(%rsp)	 ; _624,
	movq	%rsi, %r9	 ; _626,
	movq	%rdi, %r8	 ; _628,
	leaq	.LC239(%rip), %rdx	 ;, tmp858
	call	fprintf	 ;
	jmp	.L1202	 ;
.L1268:
 ; ./asm_test/win/i/all.c:2569:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rdi), %rax	 ; token_622->column, tmp1287
	addq	$1, %rax	 ;, _632
	movq	%rax, 168(%rsp)	 ; _632, %sfp
	movq	8(%rdi), %rsi	 ; token_622->line, token_622->line
	addq	$1, %rsi	 ;, _634
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rdi	 ; _635->path, _636
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1094, _637
 ; ./asm_test/win/i/all.c:2569:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	168(%rsp), %rax	 ; %sfp, _632
	movq	%rax, 32(%rsp)	 ; _632,
	movq	%rsi, %r9	 ; _634,
	movq	%rdi, %r8	 ; _636,
	leaq	.LC225(%rip), %rdx	 ;, tmp863
	call	fprintf	 ;
	jmp	.L1203	 ;
.L1206:
 ; ./asm_test/win/i/all.c:2580:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdx	 ; tmp1097, _652
 ; ./asm_test/win/i/all.c:2580:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	128(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
	jmp	.L1205	 ;
.L1179:
 ; ./asm_test/win/i/all.c:2608:         } else if (token->type == KEYWORD && token->lexeme == keywordList[21]) {
	cmpq	168+keywordList(%rip), %rax	 ; keywordList[21], _355
	je	.L1269	 ;,
.L1178:
 ; ./asm_test/win/i/all.c:2632:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unexpected token in class member\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	56(%rsp), %rax	 ; %sfp, token
	movq	16(%rax), %rsi	 ; token_354->column, token_354->column
	movq	%rsi, 56(%rsp)	 ; token_354->column, %sfp
	leaq	1(%rsi), %rsi	 ;, _410
	movq	8(%rax), %rbx	 ; token_354->line, token_354->line
	addq	$1, %rbx	 ;, _412
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rdi	 ; _413->path, _414
	movl	$2, %ecx	 ;,
	call	*%r12	 ; tmp980
	movq	%rax, %rcx	 ; tmp1108, _415
 ; ./asm_test/win/i/all.c:2632:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unexpected token in class member\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _410,
	movq	%rbx, %r9	 ; _412,
	movq	%rdi, %r8	 ; _414,
	leaq	.LC245(%rip), %rdx	 ;,
	call	fprintf	 ;
.L1208:
 ; ./asm_test/win/i/all.c:2633:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, 56(%rsp)	 ; tmp1109, %sfp
.L1177:
 ; ./asm_test/win/i/all.c:2602:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	movq	56(%rsp), %rax	 ; %sfp, token
	movl	24(%rax), %eax	 ; token_354->type, _353
 ; ./asm_test/win/i/all.c:2602:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	cmpl	$5, %eax	 ;, _353
	je	.L1270	 ;,
 ; ./asm_test/win/i/all.c:2603:         if (token->type == KEYWORD && token->lexeme == keywordList[4]) {
	cmpl	$6, %eax	 ;, _353
	jne	.L1178	 ;,
 ; ./asm_test/win/i/all.c:2603:         if (token->type == KEYWORD && token->lexeme == keywordList[4]) {
	movq	56(%rsp), %rax	 ; %sfp, token
	movq	(%rax), %rax	 ; token_354->lexeme, _355
 ; ./asm_test/win/i/all.c:2603:         if (token->type == KEYWORD && token->lexeme == keywordList[4]) {
	cmpq	32+keywordList(%rip), %rax	 ; keywordList[4], _355
	jne	.L1179	 ;,
 ; ./asm_test/win/i/all.c:2506:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	80(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
	movq	%rax, 88(%rsp)	 ; method_scope, %sfp
 ; ./asm_test/win/i/all.c:2507:     Symbol* self = create_symbol(keywordList[5], SYMBOL_VARIABLE, class_name, method_scope);
	movq	%rax, %r9	 ; method_scope,
	movq	96(%rsp), %r8	 ; %sfp,
	movl	$3, %edx	 ;,
	movq	40+keywordList(%rip), %rcx	 ; keywordList[5],
	call	create_symbol	 ;
	movq	%rax, %r14	 ; tmp1065, self
 ; ./asm_test/win/i/all.c:2508:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp1066, token
 ; ./asm_test/win/i/all.c:2509:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	movl	24(%rax), %eax	 ; token_512->type, _513
 ; ./asm_test/win/i/all.c:2509:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpl	$1, %eax	 ;, _513
	je	.L1180	 ;,
 ; ./asm_test/win/i/all.c:2509:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpl	$6, %eax	 ;, _513
	jne	.L1181	 ;,
 ; ./asm_test/win/i/all.c:2509:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	movq	(%rsi), %rax	 ; token_512->lexeme, _514
 ; ./asm_test/win/i/all.c:2509:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	128+keywordList(%rip), %rax	 ; keywordList[16], _514
	je	.L1180	 ;,
 ; ./asm_test/win/i/all.c:2509:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	136+keywordList(%rip), %rax	 ; keywordList[17], _514
	je	.L1180	 ;,
 ; ./asm_test/win/i/all.c:2509:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	144+keywordList(%rip), %rax	 ; keywordList[18], _514
	je	.L1180	 ;,
 ; ./asm_test/win/i/all.c:2509:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	152+keywordList(%rip), %rax	 ; keywordList[19], _514
	je	.L1180	 ;,
 ; ./asm_test/win/i/all.c:2509:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	160+keywordList(%rip), %rax	 ; keywordList[20], _514
	jne	.L1181	 ;,
.L1180:
 ; ./asm_test/win/i/all.c:2513:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%rsi), %rdx	 ; token_512->lexeme, token_512->lexeme
	movq	80(%rsp), %rcx	 ; %sfp,
	call	search_name	 ;
	movq	%rax, 120(%rsp)	 ; return_type, %sfp
 ; ./asm_test/win/i/all.c:2514:     if (return_type == NULL) {
	testq	%rax, %rax	 ; return_type
	je	.L1271	 ;,
 ; ./asm_test/win/i/all.c:2518:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp1070, token
 ; ./asm_test/win/i/all.c:2519:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_536->type
	jne	.L1272	 ;,
 ; ./asm_test/win/i/all.c:2523:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rdi	 ; tmp1072, method
	movq	%rax, 152(%rsp)	 ; method, %sfp
 ; ./asm_test/win/i/all.c:2524:     method->method_scope = method_scope;
	movq	88(%rsp), %rax	 ; %sfp, method_scope
	movq	%rax, 32(%rdi)	 ; method_scope, method_545->method_scope
 ; ./asm_test/win/i/all.c:2525:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	(%rsi), %rdx	 ; token_536->lexeme, token_536->lexeme
	movq	96(%rsp), %rax	 ; %sfp, name
	movq	8(%rax), %rcx	 ; name_339->name, name_339->name
	call	make_method_name	 ;
	movq	%rax, %rcx	 ; tmp1073, _548
 ; ./asm_test/win/i/all.c:2525:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	%rdi, %r9	 ; method,
	movq	120(%rsp), %r8	 ; %sfp,
	movl	$2, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, 160(%rsp)	 ; tmp1074, %sfp
 ; ./asm_test/win/i/all.c:2526:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2527:     if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	cmpl	$5, 24(%rax)	 ;, token_550->type
	jne	.L1185	 ;,
 ; ./asm_test/win/i/all.c:2527:     if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	movq	symbolList(%rip), %rdi	 ; symbolList[0], tmp1271
	cmpq	%rdi, (%rax)	 ; tmp1271, token_550->lexeme
	jne	.L1185	 ;,
 ; ./asm_test/win/i/all.c:2531:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2532:     if (token->type != KEYWORD || token->lexeme != keywordList[5])
	cmpl	$6, 24(%rax)	 ;, token_561->type
	jne	.L1187	 ;,
 ; ./asm_test/win/i/all.c:2532:     if (token->type != KEYWORD || token->lexeme != keywordList[5])
	movq	40+keywordList(%rip), %rsi	 ; keywordList[5], tmp1273
	cmpq	%rsi, (%rax)	 ; tmp1273, token_561->lexeme
	je	.L1188	 ;,
.L1187:
 ; ./asm_test/win/i/all.c:2533:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected 'self' as first parameter of method\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_561->column, tmp1274
	addq	$1, %rdi	 ;, _566
	movq	8(%rax), %rsi	 ; token_561->line, token_561->line
	leaq	1(%rsi), %rbx	 ;, _568
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rsi	 ; _569->path, _570
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1078, _571
 ; ./asm_test/win/i/all.c:2533:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected 'self' as first parameter of method\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _566,
	movq	%rbx, %r9	 ; _568,
	movq	%rsi, %r8	 ; _570,
	leaq	.LC234(%rip), %rdx	 ;, tmp825
	call	fprintf	 ;
.L1188:
 ; ./asm_test/win/i/all.c:2534:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp1079, token
 ; ./asm_test/win/i/all.c:2535:     List* parameters = create_list();
	call	create_list	 ;
	movq	%rax, %rdi	 ; tmp1080, parameters
	movq	%rax, 144(%rsp)	 ; parameters, %sfp
 ; ./asm_test/win/i/all.c:2536:     list_append(parameters, (size_t*)create_variable(class_name, self, NULL));
	movl	$0, %r8d	 ;,
	movq	%r14, %rdx	 ; self,
	movq	96(%rsp), %rcx	 ; %sfp,
	call	create_variable	 ;
	movq	%rax, %rdx	 ; tmp1081, _574
 ; ./asm_test/win/i/all.c:2536:     list_append(parameters, (size_t*)create_variable(class_name, self, NULL));
	movq	%rdi, %rcx	 ; parameters,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2537:     while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	leaq	symbolList(%rip), %r14	 ;, tmp976
 ; ./asm_test/win/i/all.c:2537:     while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	jmp	.L1189	 ;
.L1269:
 ; ./asm_test/win/i/all.c:2609:             token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r14	 ; tmp1101, token
 ; ./asm_test/win/i/all.c:2610:             parser->in_class = 1;
	movb	$1, 10(%r15)	 ;, parser_85(D)->in_class
 ; ./asm_test/win/i/all.c:2611:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	80(%rsp), %rdx	 ; %sfp,
	movq	%rbp, %rcx	 ; lexer,
	call	parse_variable	 ;
	movq	%rax, %rbx	 ; tmp1102, variable
 ; ./asm_test/win/i/all.c:2612:             parser->in_class = 0;
	movb	$0, 10(%r15)	 ;, parser_85(D)->in_class
 ; ./asm_test/win/i/all.c:2613:             if (variable == NULL)
	testq	%rax, %rax	 ; variable
	je	.L1273	 ;,
.L1209:
 ; ./asm_test/win/i/all.c:2615:             ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
	movq	%rbx, %r8	 ; variable,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_class_member	 ;
	movq	%rax, %rbx	 ; tmp1104, member
 ; ./asm_test/win/i/all.c:2616:             list_append(members, (size_t*)member);
	movq	%rax, %rdx	 ; member,
	movq	112(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2617:             if (member->type == CLASS_VARIABLE) {
	cmpl	$1, 8(%rbx)	 ;, member_377->type
	je	.L1274	 ;,
.L1210:
 ; ./asm_test/win/i/all.c:2628:             token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2629:             if (token->type != SYMBOL || token->lexeme != symbolList[9])
	cmpl	$5, 24(%rax)	 ;, token_398->type
	jne	.L1216	 ;,
 ; ./asm_test/win/i/all.c:2629:             if (token->type != SYMBOL || token->lexeme != symbolList[9])
	leaq	symbolList(%rip), %rsi	 ;, tmp1307
	movq	72(%rsi), %rsi	 ; symbolList[9], tmp1308
	cmpq	%rsi, (%rax)	 ; tmp1308, token_398->lexeme
	je	.L1208	 ;,
.L1216:
 ; ./asm_test/win/i/all.c:2630:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after class variable declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_398->column, tmp1309
	leaq	1(%rdi), %rsi	 ;, _403
	movq	8(%rax), %rbx	 ; token_398->line, token_398->line
	addq	$1, %rbx	 ;, _405
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rdi	 ; _406->path, _407
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1107, _408
 ; ./asm_test/win/i/all.c:2630:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after class variable declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _403,
	movq	%rbx, %r9	 ; _405,
	movq	%rdi, %r8	 ; _407,
	leaq	.LC244(%rip), %rdx	 ;, tmp894
	call	fprintf	 ;
	jmp	.L1208	 ;
.L1273:
 ; ./asm_test/win/i/all.c:2614:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse class variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r14), %rax	 ; token_368->column, tmp1300
	leaq	1(%rax), %rdi	 ;, _371
	movq	8(%r14), %rax	 ; token_368->line, tmp1302
	addq	$1, %rax	 ;, _373
	movq	%rax, 56(%rsp)	 ; _373, %sfp
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rsi	 ; _374->path, _375
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1103, _376
 ; ./asm_test/win/i/all.c:2614:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse class variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _371,
	movq	56(%rsp), %r9	 ; %sfp,
	movq	%rsi, %r8	 ; _375,
	leaq	.LC242(%rip), %rdx	 ;, tmp881
	call	fprintf	 ;
	jmp	.L1209	 ;
.L1274:
 ; ./asm_test/win/i/all.c:2618:                 Symbol* type = member->content.variable->type;
	movq	(%rbx), %rax	 ; member_377->content.variable, member_377->content.variable
	movq	(%rax), %rax	 ; _379->type, type
 ; ./asm_test/win/i/all.c:2619:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	name_int(%rip), %rax	 ; name_int, type
	je	.L1211	 ;,
 ; ./asm_test/win/i/all.c:2619:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	name_float(%rip), %rax	 ; name_float, type
	je	.L1211	 ;,
 ; ./asm_test/win/i/all.c:2619:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	name_string(%rip), %rax	 ; name_string, type
	je	.L1211	 ;,
 ; ./asm_test/win/i/all.c:2621:                 else if (type == name_bool || type == name_void)
	cmpq	name_bool(%rip), %rax	 ; name_bool, type
	je	.L1213	 ;,
 ; ./asm_test/win/i/all.c:2621:                 else if (type == name_bool || type == name_void)
	cmpq	name_void(%rip), %rax	 ; name_void, type
	je	.L1213	 ;,
 ; ./asm_test/win/i/all.c:2623:                 else if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rax)	 ;, type_380->kind
	jne	.L1215	 ;,
 ; ./asm_test/win/i/all.c:2624:                     size += 8;
	addq	$8, 136(%rsp)	 ;, %sfp
	jmp	.L1210	 ;
.L1211:
 ; ./asm_test/win/i/all.c:2620:                     size += 8;
	addq	$8, 136(%rsp)	 ;, %sfp
	jmp	.L1210	 ;
.L1213:
 ; ./asm_test/win/i/all.c:2622:                     size += 1;
	addq	$1, 136(%rsp)	 ;, %sfp
	jmp	.L1210	 ;
.L1215:
 ; ./asm_test/win/i/all.c:2626:                     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unsupported type for class variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r14), %rax	 ; token_368->column, tmp1306
	leaq	1(%rax), %rsi	 ;, _392
	movq	8(%r14), %rbx	 ; token_368->line, token_368->line
	addq	$1, %rbx	 ;, _394
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rdi	 ; _395->path, _396
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1105, _397
 ; ./asm_test/win/i/all.c:2626:                     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unsupported type for class variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _392,
	movq	%rbx, %r9	 ; _394,
	movq	%rdi, %r8	 ; _396,
	leaq	.LC243(%rip), %rdx	 ;, tmp887
	call	fprintf	 ;
	jmp	.L1210	 ;
.L1270:
 ; ./asm_test/win/i/all.c:2602:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	movq	56(%rsp), %rax	 ; %sfp, token
	leaq	symbolList(%rip), %rsi	 ;, tmp1316
	movq	24(%rsi), %rdi	 ; symbolList[3], tmp1317
	cmpq	%rdi, (%rax)	 ; tmp1317, token_354->lexeme
	jne	.L1178	 ;,
 ; ./asm_test/win/i/all.c:2635:     char* init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
	movq	%rbp, %r14	 ; lexer, lexer
	movq	96(%rsp), %rax	 ; %sfp, name
	movq	8(%rax), %rcx	 ; name_339->name, name_339->name
	movq	DEFAULT_INIT_NAME(%rip), %rdx	 ; DEFAULT_INIT_NAME,
	call	make_method_name	 ;
	movq	%rax, %rbx	 ; tmp1110, init_name
 ; ./asm_test/win/i/all.c:2636:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	movq	%rax, %rdx	 ; init_name,
	movq	80(%rsp), %rcx	 ; %sfp,
	call	search_name_use_strcmp	 ;
	movq	%rax, %r12	 ; tmp1111, init
 ; ./asm_test/win/i/all.c:2637:     if (init == NULL) {
	testq	%rax, %rax	 ; init
	je	.L1275	 ;,
.L1218:
 ; ./asm_test/win/i/all.c:2649:     if (init->kind != SYMBOL_METHOD)
	cmpl	$2, 32(%r12)	 ;, init_438->kind
	jne	.L1276	 ;,
.L1219:
 ; ./asm_test/win/i/all.c:2651:     char* constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	96(%rsp), %rbp	 ; %sfp, name
	movq	8(%rbp), %rcx	 ; name_339->name, name_339->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME,
	call	make_method_name	 ;
	movq	%rax, %rbx	 ; tmp1125, constructor_name
 ; ./asm_test/win/i/all.c:2652:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp1126, method
	movq	%rax, 88(%rsp)	 ; method, %sfp
 ; ./asm_test/win/i/all.c:2653:     method->method_scope = create_symbol_table(class_scope);
	movq	80(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; ./asm_test/win/i/all.c:2653:     method->method_scope = create_symbol_table(class_scope);
	movq	%rax, 32(%rsi)	 ; tmp1127, method_450->method_scope
 ; ./asm_test/win/i/all.c:2654:     Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
	movq	%rsi, %r9	 ; method,
	movq	%rbp, %r8	 ; name,
	movl	$2, %edx	 ;,
	movq	%rbx, %rcx	 ; constructor_name,
	call	create_symbol	 ;
	movq	%rax, 120(%rsp)	 ; tmp1128, %sfp
 ; ./asm_test/win/i/all.c:2655:     List* parameters = create_list();
	call	create_list	 ;
	movq	%rax, %rdi	 ; tmp1129, parameters
 ; ./asm_test/win/i/all.c:2656:     Symbol* self = create_symbol(keywordList[5], SYMBOL_VARIABLE, name, method->method_scope);
	movq	32(%rsi), %r9	 ; method_450->method_scope,
	movq	%rbp, %r8	 ; name,
	movl	$3, %edx	 ;,
	movq	40+keywordList(%rip), %rcx	 ; keywordList[5],
	call	create_symbol	 ;
	movq	%rax, %rbp	 ; tmp1130, self
 ; ./asm_test/win/i/all.c:2657:     List* init_params = list_copy(init->ast_node.method->parameters);
	movq	24(%r12), %rax	 ; init_438->ast_node.method, init_438->ast_node.method
	movq	16(%rax), %rcx	 ; _457->parameters, _457->parameters
	call	list_copy	 ;
	movq	%rax, %rbx	 ; tmp1131, init_params
 ; ./asm_test/win/i/all.c:2660:         if (param->name->name == keywordList[5]) continue;
	leaq	keywordList(%rip), %rsi	 ;, tmp971
.L1221:
 ; ./asm_test/win/i/all.c:2659:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	movq	%rbx, %rcx	 ; init_params,
	call	list_pop	 ;
 ; ./asm_test/win/i/all.c:2659:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	testq	%rax, %rax	 ; param
	je	.L1277	 ;,
 ; ./asm_test/win/i/all.c:2660:         if (param->name->name == keywordList[5]) continue;
	movq	8(%rax), %rdx	 ; param_460->name, _461
 ; ./asm_test/win/i/all.c:2660:         if (param->name->name == keywordList[5]) continue;
	movq	40(%rsi), %rcx	 ; keywordList[5], tmp1326
	cmpq	%rcx, 8(%rdx)	 ; tmp1326, _461->name
	je	.L1221	 ;,
 ; ./asm_test/win/i/all.c:2661:         list_append(parameters, (size_t*)create_variable(param->type, param->name, NULL));
	movq	(%rax), %rcx	 ; param_460->type, param_460->type
	movl	$0, %r8d	 ;,
	call	create_variable	 ;
	movq	%rax, %rdx	 ; tmp1132, _465
 ; ./asm_test/win/i/all.c:2661:         list_append(parameters, (size_t*)create_variable(param->type, param->name, NULL));
	movq	%rdi, %rcx	 ; parameters,
	call	list_append	 ;
	jmp	.L1221	 ;
.L1275:
 ; ./asm_test/win/i/all.c:2638:         Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp1112, method
 ; ./asm_test/win/i/all.c:2639:         method->method_scope = create_symbol_table(class_scope);
	movq	80(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; ./asm_test/win/i/all.c:2639:         method->method_scope = create_symbol_table(class_scope);
	movq	%rax, 32(%rsi)	 ; tmp1113, method_423->method_scope
 ; ./asm_test/win/i/all.c:2640:         init = create_symbol(init_name, SYMBOL_METHOD, name, method);
	movq	%rsi, %r9	 ; method,
	movq	96(%rsp), %rbp	 ; %sfp, name
	movq	%rbp, %r8	 ; name,
	movl	$2, %edx	 ;,
	movq	%rbx, %rcx	 ; init_name,
	call	create_symbol	 ;
	movq	%rax, %r12	 ; tmp1114, init
 ; ./asm_test/win/i/all.c:2641:         List* parameters = create_list();
	call	create_list	 ;
	movq	%rax, %rdi	 ; tmp1115, parameters
 ; ./asm_test/win/i/all.c:2642:         Symbol* self = create_symbol(keywordList[5], SYMBOL_VARIABLE, name, method->method_scope);
	movq	32(%rsi), %r9	 ; method_423->method_scope,
	movq	%rbp, %rbx	 ; name, name
	movq	%rbp, %r8	 ; name,
	movl	$3, %edx	 ;,
	movq	40+keywordList(%rip), %rcx	 ; keywordList[5],
	call	create_symbol	 ;
	movq	%rax, %rbp	 ; tmp1116, self
 ; ./asm_test/win/i/all.c:2643:         list_append(parameters, (size_t*)create_variable(name, self, NULL));
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; self,
	movq	%rbx, 96(%rsp)	 ; name, %sfp
	movq	%rbx, %rcx	 ; name,
	call	create_variable	 ;
	movq	%rax, %rdx	 ; tmp1117, _430
 ; ./asm_test/win/i/all.c:2643:         list_append(parameters, (size_t*)create_variable(name, self, NULL));
	movq	%rdi, %rcx	 ; parameters,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2644:         List* body = create_list();
	call	create_list	 ;
	movq	%rax, %rbx	 ; tmp1118, body
 ; ./asm_test/win/i/all.c:2645:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rbp, %r8	 ; self,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
 ; ./asm_test/win/i/all.c:2645:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, 32(%rsp)	 ; tmp1119,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
	movq	%rax, %r8	 ;, tmp1120
 ; ./asm_test/win/i/all.c:2645:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; ./asm_test/win/i/all.c:2645:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp1121,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdx	 ; tmp1122, _435
 ; ./asm_test/win/i/all.c:2645:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rbx, %rcx	 ; body,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2646:         create_method_use_ptr(method, init, name, parameters, body, method->method_scope);
	movq	32(%rsi), %rax	 ; method_423->method_scope, method_423->method_scope
	movq	%rax, 40(%rsp)	 ; method_423->method_scope,
	movq	%rbx, 32(%rsp)	 ; body,
	movq	%rdi, %r9	 ; parameters,
	movq	96(%rsp), %r8	 ; %sfp,
	movq	%r12, %rdx	 ; init,
	movq	%rsi, %rcx	 ; method,
	call	create_method_use_ptr	 ;
 ; ./asm_test/win/i/all.c:2647:         list_append(members, (size_t*)create_class_member(CLASS_METHOD, method, NULL));
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; method,
	movl	$0, %ecx	 ;,
	call	create_class_member	 ;
	movq	%rax, %rdx	 ; tmp1123, _437
 ; ./asm_test/win/i/all.c:2647:         list_append(members, (size_t*)create_class_member(CLASS_METHOD, method, NULL));
	movq	112(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
	jmp	.L1218	 ;
.L1276:
 ; ./asm_test/win/i/all.c:2650:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Constructor name conflicts with existing member\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	56(%rsp), %rax	 ; %sfp, token
	movq	16(%rax), %rbx	 ; token_354->column, token_354->column
	movq	%rbx, 56(%rsp)	 ; token_354->column, %sfp
	movq	%rbx, %rsi	 ; token_354->column, token_354->column
	addq	$1, %rsi	 ;, _441
	movq	8(%rax), %rbx	 ; token_354->line, token_354->line
	addq	$1, %rbx	 ;, _443
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	24(%rax), %rdi	 ; _444->path, _445
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp1124, _446
 ; ./asm_test/win/i/all.c:2650:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Constructor name conflicts with existing member\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _441,
	movq	%rbx, %r9	 ; _443,
	movq	%rdi, %r8	 ; _445,
	leaq	.LC246(%rip), %rdx	 ;, tmp912
	call	fprintf	 ;
	jmp	.L1219	 ;
.L1277:
 ; ./asm_test/win/i/all.c:2663:     List* body = create_list();
	call	create_list	 ;
	movq	%rax, %rbx	 ; tmp1134, body
	movq	%rax, 56(%rsp)	 ; body, %sfp
 ; ./asm_test/win/i/all.c:2664:     List* ms = list_copy(members);
	movq	112(%rsp), %rcx	 ; %sfp,
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp1135, ms
 ; ./asm_test/win/i/all.c:2666:     list_append(body, (size_t*)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rbp, %r8	 ; self,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
 ; ./asm_test/win/i/all.c:2666:     list_append(body, (size_t*)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, 32(%rsp)	 ; tmp1136,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
	movq	%rax, %r8	 ;, tmp1137
 ; ./asm_test/win/i/all.c:2666:     list_append(body, (size_t*)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; ./asm_test/win/i/all.c:2666:     list_append(body, (size_t*)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp1138,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdx	 ; tmp1139, _471
 ; ./asm_test/win/i/all.c:2666:     list_append(body, (size_t*)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rbx, %rcx	 ; body,
	call	list_append	 ;
.L1224:
 ; ./asm_test/win/i/all.c:2667:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	movq	%rsi, %rcx	 ; ms,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp1149, mb
 ; ./asm_test/win/i/all.c:2667:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	testq	%rax, %rax	 ; mb
	je	.L1278	 ;,
 ; ./asm_test/win/i/all.c:2668:         if (mb->type == CLASS_VARIABLE) {
	cmpl	$1, 8(%rbx)	 ;, mb_472->type
	jne	.L1224	 ;,
 ; ./asm_test/win/i/all.c:2669:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	(%rbx), %rax	 ; mb_472->content.variable, mb_472->content.variable
	movq	8(%rax), %rax	 ; _474->name, _475
	movq	%rax, 128(%rsp)	 ; _475, %sfp
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rbp, %r8	 ; self,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, %rdx	 ; tmp1140, _476
 ; ./asm_test/win/i/all.c:2669:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	128(%rsp), %r8	 ; %sfp,
	movl	$2, %ecx	 ;,
	call	create_variable_access	 ;
 ; ./asm_test/win/i/all.c:2669:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	%rax, 32(%rsp)	 ; tmp1141,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
	movq	%rax, %r8	 ;, tmp1142
 ; ./asm_test/win/i/all.c:2669:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, 128(%rsp)	 ; tmp1143, %sfp
 ; ./asm_test/win/i/all.c:2670:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string_check("0", 2, 1), NULL, NULL, NULL), NULL);
	movq	(%rbx), %rax	 ; mb_472->content.variable, mb_472->content.variable
	movq	16(%rax), %r9	 ; _480->value, _481
 ; ./asm_test/win/i/all.c:2670:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string_check("0", 2, 1), NULL, NULL, NULL), NULL);
	testq	%r9, %r9	 ; _481
	je	.L1279	 ;,
.L1225:
 ; ./asm_test/win/i/all.c:2671:             list_append(body, (size_t*)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movl	$0, %r8d	 ;,
	movq	128(%rsp), %rdx	 ; %sfp,
	movl	$13, %ecx	 ;,
	call	create_expression	 ;
 ; ./asm_test/win/i/all.c:2671:             list_append(body, (size_t*)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp1147,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdx	 ; tmp1148, _487
 ; ./asm_test/win/i/all.c:2671:             list_append(body, (size_t*)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	56(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
	jmp	.L1224	 ;
.L1279:
 ; ./asm_test/win/i/all.c:2670:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string_check("0", 2, 1), NULL, NULL, NULL), NULL);
	movl	$1, %r8d	 ;,
	movl	$2, %edx	 ;,
	leaq	.LC247(%rip), %rcx	 ;, tmp925
	call	create_string_check	 ;
	movq	%rax, %rdx	 ; tmp1144, _482
 ; ./asm_test/win/i/all.c:2670:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string_check("0", 2, 1), NULL, NULL, NULL), NULL);
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_primary	 ;
	movq	%rax, %r8	 ;, tmp1145
 ; ./asm_test/win/i/all.c:2670:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string_check("0", 2, 1), NULL, NULL, NULL), NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %r9	 ; tmp1146, _481
	jmp	.L1225	 ;
.L1278:
 ; ./asm_test/win/i/all.c:2674:     List* args = create_list();
	call	create_list	 ;
	movq	%rax, %rbx	 ; tmp1150, args
 ; ./asm_test/win/i/all.c:2675:     list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rbp, %r8	 ; self,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
 ; ./asm_test/win/i/all.c:2675:     list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	%rax, 32(%rsp)	 ; tmp1151,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
	movq	%rax, %r8	 ;, tmp1152
 ; ./asm_test/win/i/all.c:2675:     list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rdx	 ; tmp1153, _491
 ; ./asm_test/win/i/all.c:2675:     list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	%rbx, %rcx	 ; args,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2676:     List* params = list_copy(parameters);
	movq	%rdi, %rcx	 ; parameters,
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp1154, params
 ; ./asm_test/win/i/all.c:2677:     while ((param = (Variable*)list_pop(params)) != NULL)
	jmp	.L1227	 ;
.L1228:
 ; ./asm_test/win/i/all.c:2678:         list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	8(%rax), %r8	 ; param_493->name, param_493->name
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
 ; ./asm_test/win/i/all.c:2678:         list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rax, 32(%rsp)	 ; tmp1155,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
	movq	%rax, %r8	 ;, tmp1156
 ; ./asm_test/win/i/all.c:2678:         list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rdx	 ; tmp1157, _497
 ; ./asm_test/win/i/all.c:2678:         list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rbx, %rcx	 ; args,
	call	list_append	 ;
.L1227:
 ; ./asm_test/win/i/all.c:2677:     while ((param = (Variable*)list_pop(params)) != NULL)
	movq	%rsi, %rcx	 ; params,
	call	list_pop	 ;
 ; ./asm_test/win/i/all.c:2677:     while ((param = (Variable*)list_pop(params)) != NULL)
	testq	%rax, %rax	 ; param
	jne	.L1228	 ;,
 ; ./asm_test/win/i/all.c:2679:     list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%r12, %r8	 ; init,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, %rdx	 ; tmp1159, _498
 ; ./asm_test/win/i/all.c:2679:     list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rbx, 32(%rsp)	 ; args,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
 ; ./asm_test/win/i/all.c:2679:     list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, 32(%rsp)	 ; tmp1160,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
	movq	%rax, %r8	 ;, tmp1161
 ; ./asm_test/win/i/all.c:2679:     list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; ./asm_test/win/i/all.c:2679:     list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp1162,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rdx	 ; tmp1163, _502
 ; ./asm_test/win/i/all.c:2679:     list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	56(%rsp), %rbx	 ; %sfp, body
	movq	%rbx, %rcx	 ; body,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2680:     create_method_use_ptr(method, constructor, name, parameters, body, method->method_scope);
	movq	88(%rsp), %rsi	 ; %sfp, method
	movq	32(%rsi), %rax	 ; method_450->method_scope, method_450->method_scope
	movq	%rax, 40(%rsp)	 ; method_450->method_scope,
	movq	%rbx, 32(%rsp)	 ; body,
	movq	%rdi, %r9	 ; parameters,
	movq	96(%rsp), %rbx	 ; %sfp, name
	movq	%rbx, %r8	 ; name,
	movq	120(%rsp), %rdx	 ; %sfp,
	movq	%rsi, %rcx	 ; method,
	call	create_method_use_ptr	 ;
 ; ./asm_test/win/i/all.c:2681:     list_append(members, (size_t*)create_class_member(CLASS_METHOD, method, NULL));
	movl	$0, %r8d	 ;,
	movq	%rsi, %rdx	 ; method,
	movl	$0, %ecx	 ;,
	call	create_class_member	 ;
	movq	%rax, %rdx	 ; tmp1164, _504
 ; ./asm_test/win/i/all.c:2681:     list_append(members, (size_t*)create_class_member(CLASS_METHOD, method, NULL));
	movq	112(%rsp), %rsi	 ; %sfp, members
	movq	%rsi, %rcx	 ; members,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:746:     class->name = name;
	movq	104(%rsp), %rax	 ; %sfp, class
	movq	%rbx, (%rax)	 ; name, class_337->name
 ; ./asm_test/win/i/all.c:747:     class->members = members;
	movq	%rsi, 8(%rax)	 ; members, class_337->members
 ; ./asm_test/win/i/all.c:748:     class->class_scope = class_scope;
	movq	80(%rsp), %rdi	 ; %sfp, class_scope
	movq	%rdi, 16(%rax)	 ; class_scope, class_337->class_scope
 ; ./asm_test/win/i/all.c:749:     class->size = size;
	movq	136(%rsp), %rdi	 ; %sfp, size
	movq	%rdi, 24(%rax)	 ; size, class_337->size
.L1233:
 ; ./asm_test/win/i/all.c:2395:             list_append(members, (size_t*)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	104(%rsp), %r9	 ; %sfp,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$2, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ; tmp1165, _46
 ; ./asm_test/win/i/all.c:2395:             list_append(members, (size_t*)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	72(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2391:         } else if (token->type == KEYWORD && token->lexeme == keywordList[3]) {
	jmp	.L1146	 ;
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC253:
	.ascii "NULL\0"
.LC254:
	.ascii "Usage: %s <filename>\12\0"
.LC255:
	.ascii "Error opening file: %s\12\0"
.LC256:
	.ascii ".token\0"
.LC257:
	.ascii "w\0"
	.align 8
.LC258:
	.ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
	.align 8
.LC259:
	.ascii "Token(Type: identifier,  Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC260:
	.ascii "Token(Type: integer,     Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC261:
	.ascii "Token(Type: float,       Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC262:
	.ascii "Token(Type: string,      Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC263:
	.ascii "Token(Type: symbol,      Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC264:
	.ascii "Token(Type: keyword,     Line: %zu, Column: %zu)\11Lexeme: '\0"
	.align 8
.LC265:
	.ascii "Token(Type: comment,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC266:
	.ascii "\\0\0"
.LC267:
	.ascii "\\n\0"
.LC268:
	.ascii "\\t\0"
.LC269:
	.ascii "\\r\0"
.LC270:
	.ascii "'\12\0"
.LC271:
	.ascii "\12info by lib:\12    %s\12\0"
.LC272:
	.ascii ".ast\0"
.LC273:
	.ascii ".tc\0"
.LC274:
	.ascii "import\12\0"
.LC275:
	.ascii "source: \"%s\"\12\0"
.LC276:
	.ascii "parameters\12\0"
.LC277:
	.ascii "parameters[%d]\12\0"
.LC278:
	.ascii "class\12\0"
.LC279:
	.ascii "members\12\0"
.LC280:
	.ascii "method\12\0"
.LC281:
	.ascii "variable\12\0"
.LC282:
	.ascii "unknown_ClassMemberType: %u\12\0"
.LC283:
	.ascii "unknown_CodeMemberType: %u\12\0"
.LC284:
	.ascii ".tac\0"
.LC285:
	.ascii "main\0"
	.align 8
.LC286:
	.ascii "[Warning] Unsupported symbol kind for import: %d\12\0"
.LC287:
	.ascii "TAC {\12\0"
.LC288:
	.ascii "designs: []\12\0"
.LC289:
	.ascii "designs: [\12\0"
.LC290:
	.ascii "NULL \0"
.LC291:
	.ascii "%s \0"
.LC292:
	.ascii "%zu \0"
.LC293:
	.ascii "{}\12\0"
.LC294:
	.ascii "{\12\0"
.LC295:
	.ascii "NULL\11\0"
.LC296:
	.ascii "%s\11\0"
.LC297:
	.ascii "%s(%s) \0"
.LC298:
	.ascii "%zu\12\0"
.LC299:
	.ascii "}\12\0"
.LC300:
	.ascii "]\12\0"
.LC301:
	.ascii "entry_point: \"NULL\"\12\0"
.LC302:
	.ascii "entry_point: %s\12\0"
.LC303:
	.ascii "global: []\12\0"
.LC304:
	.ascii "global: [\12\0"
.LC305:
	.ascii "subroutines: []\12\0"
.LC306:
	.ascii "subroutines: [\12\0"
.LC307:
	.ascii "NULL {\12\0"
.LC308:
	.ascii "%s {\12\0"
.LC309:
	.ascii "return_type: \"NULL\"\12\0"
.LC310:
	.ascii "return_type: %s\12\0"
.LC311:
	.ascii "parameters: []\12\0"
.LC312:
	.ascii "parameters: [\12\0"
.LC313:
	.ascii "local: []\12\0"
.LC314:
	.ascii "local: [\12\0"
.LC315:
	.ascii "instructions: []\12\0"
.LC316:
	.ascii "instructions: [\12\0"
.LC317:
	.ascii "add\11\0"
.LC318:
	.ascii "sub\11\0"
.LC319:
	.ascii "mul\11\0"
.LC320:
	.ascii "div\11\0"
.LC321:
	.ascii "mod\11\0"
.LC322:
	.ascii "eq \11\0"
.LC323:
	.ascii "ne \11\0"
.LC324:
	.ascii "lt \11\0"
.LC325:
	.ascii "gt \11\0"
.LC326:
	.ascii "le \11\0"
.LC327:
	.ascii "ge \11\0"
.LC328:
	.ascii "and\11\0"
.LC329:
	.ascii "or \11\0"
.LC330:
	.ascii "not\11\0"
.LC331:
	.ascii "assign\11\0"
.LC332:
	.ascii "get_attr\11\0"
.LC333:
	.ascii "get_elem\11\0"
.LC334:
	.ascii "param\11\0"
.LC335:
	.ascii "alloc\11\0"
.LC336:
	.ascii "jmp_c\11\0"
.LC337:
	.ascii "jmp\11\0"
.LC338:
	.ascii "ret\11\0"
.LC339:
	.ascii "call\11\0"
.LC340:
	.ascii "load\11\0"
.LC341:
	.ascii "store\11\0"
.LC342:
	.ascii "INST_NONE\12\0"
.LC343:
	.ascii "unknown_InstructionType: %u\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
main:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	andq	$-16, %rsp	 ;,
	subq	$112, %rsp	 ;,
	movl	%ecx, %ebx	 ; tmp695, argc
	movq	%rdx, %rsi	 ; tmp696, argv
 ; ./asm_test/win/i/all.c:4056: int main(int argc, char* argv[]) {
	call	__main	 ;
 ; ./asm_test/win/i/all.c:4057:     if (argc < 2) {
	cmpl	$1, %ebx	 ;, argc
	jle	.L1583	 ;,
 ; ./asm_test/win/i/all.c:4061:     init();
	call	init	 ;
 ; ./asm_test/win/i/all.c:957:     File* file = create_file(name);
	movq	8(%rsi), %rcx	 ; MEM[(char * *)argv_8(D) + 8B], MEM[(char * *)argv_8(D) + 8B]
	call	create_file	 ;
	movq	%rax, %rbx	 ; tmp698, file
 ; ./asm_test/win/i/all.c:958:     char* filename = file->path;
	movq	24(%rax), %r12	 ; file_13->path, filename
 ; ./asm_test/win/i/all.c:959:     size_t length = 0;
	movq	$0, 72(%rsp)	 ;, length
 ; ./asm_test/win/i/all.c:960:     FILE* source_file = fopen(filename, "r");
	leaq	.LC209(%rip), %rdx	 ;, tmp378
	movq	%r12, %rcx	 ; filename,
	call	fopen	 ;
	movq	%rax, %rsi	 ; tmp699, source_file
 ; ./asm_test/win/i/all.c:961:     if (source_file == NULL) {
	testq	%rax, %rax	 ; source_file
	je	.L1584	 ;,
 ; ./asm_test/win/i/all.c:965:     char* source = read_source(source_file, &length);
	leaq	72(%rsp), %rdx	 ;, tmp381
	movq	%rax, %rcx	 ; source_file,
	call	read_source	 ;
	movq	%rax, %rdi	 ; tmp701, source
 ; ./asm_test/win/i/all.c:966:     fclose(source_file);
	movq	%rsi, %rcx	 ; source_file,
	call	fclose	 ;
 ; ./asm_test/win/i/all.c:967:     Lexer* lexer = create_lexer(source, length, filename);
	movq	%r12, %r8	 ; filename,
	movq	72(%rsp), %rdx	 ; length,
	movq	%rdi, %rcx	 ; source,
	call	create_lexer	 ;
	movq	%rax, %r13	 ; tmp702, lexer
 ; ./asm_test/win/i/all.c:969:         change_file_extension(file, create_string_check(".token", 6, 1));
	movl	$1, %r8d	 ;,
	movl	$6, %edx	 ;,
	leaq	.LC256(%rip), %rcx	 ;, tmp383
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3946:     file->extension = new_extension;
	movq	%rax, 8(%rbx)	 ; tmp703, file_13->extension
 ; ./asm_test/win/i/all.c:3947:     rebuild_full_path(file);
	movq	%rbx, %rcx	 ; file,
	call	rebuild_full_path	 ;
 ; ./asm_test/win/i/all.c:970:         char* out_token_name = file->path;
	movq	24(%rbx), %rsi	 ; file_13->path, out_token_name
 ; ./asm_test/win/i/all.c:971:         FILE* out_token_file = fopen(out_token_name, "w");
	leaq	.LC257(%rip), %rdx	 ;, tmp384
	movq	%rsi, %rcx	 ; out_token_name,
	call	fopen	 ;
	movq	%rax, %rdi	 ; tmp704, out_token_file
 ; ./asm_test/win/i/all.c:972:         if (out_token_file == NULL)
	testq	%rax, %rax	 ; out_token_file
	je	.L1585	 ;,
 ; ./asm_test/win/i/all.c:940:     for (Token* current = get_next_token(lexer, 0); current != 0; current = get_next_token(lexer, 0)) {
	movl	$0, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp706, current
 ; ./asm_test/win/i/all.c:940:     for (Token* current = get_next_token(lexer, 0); current != 0; current = get_next_token(lexer, 0)) {
	testq	%rax, %rax	 ; current
	je	.L1286	 ;,
 ; ./asm_test/win/i/all.c:933:             fputs("\\r", file);
	leaq	.LC269(%rip), %r14	 ;, tmp692
 ; ./asm_test/win/i/all.c:929:             fputs("\\n", file);
	movq	%rbx, 56(%rsp)	 ; file, %sfp
	jmp	.L1305	 ;
.L1583:
 ; ./asm_test/win/i/all.c:4058:         fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
	movq	(%rsi), %rbx	 ; *argv_8(D), _1
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp697, _2
 ; ./asm_test/win/i/all.c:4058:         fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
	movq	%rbx, %r8	 ; _1,
	leaq	.LC254(%rip), %rdx	 ;, tmp376
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:4059:         return 1;
	movl	$1, %eax	 ;, <retval>
	jmp	.L1280	 ;
.L1584:
 ; ./asm_test/win/i/all.c:962:         fprintf(stderr, "Error opening file: %s\n", filename);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp700, _16
 ; ./asm_test/win/i/all.c:962:         fprintf(stderr, "Error opening file: %s\n", filename);
	movq	%r12, %r8	 ; filename,
	leaq	.LC255(%rip), %rdx	 ;, tmp380
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:4064:     return 0;
	movl	$0, %eax	 ;, <retval>
	jmp	.L1280	 ;
.L1585:
 ; ./asm_test/win/i/all.c:973:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp705, _23
 ; ./asm_test/win/i/all.c:973:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	movq	%rsi, %r8	 ; out_token_name,
	leaq	.LC255(%rip), %rdx	 ;, tmp386
	call	fprintf	 ;
	jmp	.L1285	 ;
.L1296:
 ; ./asm_test/win/i/all.c:908:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	movq	16(%r15), %rdx	 ; current_417->column, current_417->column
	movq	8(%r15), %rax	 ; current_417->line, current_417->line
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	leaq	.LC258(%rip), %rdx	 ;, tmp397
	movq	%rdi, %rcx	 ; out_token_file,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:909:         return;
	jmp	.L1297	 ;
.L1295:
 ; ./asm_test/win/i/all.c:911:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%r15), %rdx	 ; current_417->column, current_417->column
	movq	8(%r15), %rax	 ; current_417->line, current_417->line
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	leaq	.LC259(%rip), %rdx	 ;, tmp402
	movq	%rdi, %rcx	 ; out_token_file,
	call	fprintf	 ;
.L1287:
 ; ./asm_test/win/i/all.c:4056: int main(int argc, char* argv[]) {
	movl	$0, %ebx	 ;, i
 ; ./asm_test/win/i/all.c:927:             fputs("\\0", file);
	leaq	.LC266(%rip), %r12	 ;, tmp691
	jmp	.L1298	 ;
.L1294:
 ; ./asm_test/win/i/all.c:913:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%r15), %rdx	 ; current_417->column, current_417->column
	movq	8(%r15), %rax	 ; current_417->line, current_417->line
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	leaq	.LC260(%rip), %rdx	 ;, tmp407
	movq	%rdi, %rcx	 ; out_token_file,
	call	fprintf	 ;
	jmp	.L1287	 ;
.L1293:
 ; ./asm_test/win/i/all.c:915:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%r15), %rdx	 ; current_417->column, current_417->column
	movq	8(%r15), %rax	 ; current_417->line, current_417->line
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	leaq	.LC261(%rip), %rdx	 ;, tmp412
	movq	%rdi, %rcx	 ; out_token_file,
	call	fprintf	 ;
	jmp	.L1287	 ;
.L1292:
 ; ./asm_test/win/i/all.c:917:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%r15), %rdx	 ; current_417->column, current_417->column
	movq	8(%r15), %rax	 ; current_417->line, current_417->line
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	leaq	.LC262(%rip), %rdx	 ;, tmp417
	movq	%rdi, %rcx	 ; out_token_file,
	call	fprintf	 ;
	jmp	.L1287	 ;
.L1291:
 ; ./asm_test/win/i/all.c:919:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%r15), %rdx	 ; current_417->column, current_417->column
	movq	8(%r15), %rax	 ; current_417->line, current_417->line
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	leaq	.LC263(%rip), %rdx	 ;, tmp422
	movq	%rdi, %rcx	 ; out_token_file,
	call	fprintf	 ;
	jmp	.L1287	 ;
.L1290:
 ; ./asm_test/win/i/all.c:921:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%r15), %rdx	 ; current_417->column, current_417->column
	movq	8(%r15), %rax	 ; current_417->line, current_417->line
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	leaq	.LC264(%rip), %rdx	 ;, tmp427
	movq	%rdi, %rcx	 ; out_token_file,
	call	fprintf	 ;
	jmp	.L1287	 ;
.L1288:
 ; ./asm_test/win/i/all.c:923:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	movq	16(%r15), %rdx	 ; current_417->column, current_417->column
	movq	8(%r15), %rax	 ; current_417->line, current_417->line
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	leaq	.LC265(%rip), %rdx	 ;, tmp432
	movq	%rdi, %rcx	 ; out_token_file,
	call	fprintf	 ;
	jmp	.L1287	 ;
.L1587:
 ; ./asm_test/win/i/all.c:927:             fputs("\\0", file);
	movq	%rdi, %r9	 ; out_token_file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%r12, %rcx	 ; tmp691,
	call	fwrite	 ;
.L1300:
 ; ./asm_test/win/i/all.c:924:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	addq	$1, %rbx	 ;, i
.L1298:
 ; ./asm_test/win/i/all.c:924:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	(%r15), %rsi	 ; current_417->lexeme, _78
 ; ./asm_test/win/i/all.c:924:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	%rsi, %rcx	 ; _78,
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:924:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	cmpq	%rax, %rbx	 ; tmp707, i
	jnb	.L1586	 ;,
 ; ./asm_test/win/i/all.c:925:         char c = token->lexeme[i];
	movzbl	(%rsi,%rbx), %ecx	 ; *_80, c
 ; ./asm_test/win/i/all.c:926:         if (c == '\0')
	testb	%cl, %cl	 ; c
	je	.L1587	 ;,
 ; ./asm_test/win/i/all.c:928:         else if (c == '\n')
	cmpb	$10, %cl	 ;, c
	je	.L1588	 ;,
 ; ./asm_test/win/i/all.c:930:         else if (c == '\t')
	cmpb	$9, %cl	 ;, c
	je	.L1589	 ;,
 ; ./asm_test/win/i/all.c:932:         else if (c == '\r')
	cmpb	$13, %cl	 ;, c
	je	.L1590	 ;,
 ; ./asm_test/win/i/all.c:935:             fputc(c, file);
	movsbl	%cl, %ecx	 ; c, c
	movq	%rdi, %rdx	 ; out_token_file,
	call	fputc	 ;
	jmp	.L1300	 ;
.L1588:
 ; ./asm_test/win/i/all.c:929:             fputs("\\n", file);
	movq	%rdi, %r9	 ; out_token_file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC267(%rip), %rcx	 ;,
	call	fwrite	 ;
	jmp	.L1300	 ;
.L1589:
 ; ./asm_test/win/i/all.c:931:             fputs("\\t", file);
	movq	%rdi, %r9	 ; out_token_file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC268(%rip), %rcx	 ;, tmp435
	call	fwrite	 ;
	jmp	.L1300	 ;
.L1590:
 ; ./asm_test/win/i/all.c:933:             fputs("\\r", file);
	movq	%rdi, %r9	 ; out_token_file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; tmp692,
	call	fwrite	 ;
	jmp	.L1300	 ;
.L1586:
 ; ./asm_test/win/i/all.c:937:     fprintf(file, "'\n");
	movq	%rdi, %r9	 ; out_token_file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC270(%rip), %rcx	 ;, tmp441
	call	fwrite	 ;
.L1297:
 ; ./asm_test/win/i/all.c:942:         if (current->type == EOF_TOKEN)
	cmpl	$0, 24(%r15)	 ;, current_417->type
	je	.L1577	 ;,
 ; ./asm_test/win/i/all.c:940:     for (Token* current = get_next_token(lexer, 0); current != 0; current = get_next_token(lexer, 0)) {
	movl	$0, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp708, current
 ; ./asm_test/win/i/all.c:940:     for (Token* current = get_next_token(lexer, 0); current != 0; current = get_next_token(lexer, 0)) {
	testq	%rax, %rax	 ; current
	je	.L1591	 ;,
.L1305:
	cmpl	$7, 24(%r15)	 ;, current_417->type
	ja	.L1287	 ;,
	movl	24(%r15), %eax	 ; current_417->type, current_417->type
	leaq	.L1289(%rip), %rdx	 ;, tmp388
	movslq	(%rdx,%rax,4), %rax	 ;, tmp390
	addq	%rdx, %rax	 ; tmp388, tmp391
	jmp	*%rax	 ; tmp391
	.section .rdata,"dr"
	.align 4
.L1289:
	.long	.L1296-.L1289
	.long	.L1295-.L1289
	.long	.L1294-.L1289
	.long	.L1293-.L1289
	.long	.L1292-.L1289
	.long	.L1291-.L1289
	.long	.L1290-.L1289
	.long	.L1288-.L1289
	.text
.L1591:
	movq	56(%rsp), %rbx	 ; %sfp, file
	jmp	.L1286	 ;
.L1577:
	movq	56(%rsp), %rbx	 ; %sfp, file
.L1286:
 ; ./asm_test/win/i/all.c:945:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
	movq	%rax, %r8	 ;, tmp709
 ; ./asm_test/win/i/all.c:945:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	leaq	.LC271(%rip), %rdx	 ;, tmp442
	movq	%rdi, %rcx	 ; out_token_file,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:976:             fclose(out_token_file);
	movq	%rdi, %rcx	 ; out_token_file,
	call	fclose	 ;
.L1285:
 ; ./asm_test/win/i/all.c:1509:     lexer->position = 0;
	movq	$0, 16(%r13)	 ;, lexer_19->position
 ; ./asm_test/win/i/all.c:1510:     lexer->line = 0;
	movq	$0, 32(%r13)	 ;, lexer_19->line
 ; ./asm_test/win/i/all.c:1511:     lexer->column = 0;
	movq	$0, 40(%r13)	 ;, lexer_19->column
 ; ./asm_test/win/i/all.c:1512:     lexer->peeked_token = NULL;
	movq	$0, 48(%r13)	 ;, lexer_19->peeked_token
 ; ./asm_test/win/i/all.c:1513:     lexer->peeked_position = 0;
	movq	$0, 56(%r13)	 ;, lexer_19->peeked_position
 ; ./asm_test/win/i/all.c:1514:     lexer->peeked_line = 0;
	movq	$0, 64(%r13)	 ;, lexer_19->peeked_line
 ; ./asm_test/win/i/all.c:1515:     lexer->peeked_column = 0;
	movq	$0, 72(%r13)	 ;, lexer_19->peeked_column
 ; ./asm_test/win/i/all.c:1516:     lexer->current_token = NULL;
	movq	$0, 80(%r13)	 ;, lexer_19->current_token
 ; ./asm_test/win/i/all.c:1153:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %r8	 ; tmp710, new_parser
 ; ./asm_test/win/i/all.c:1154:     new_parser->in_function = 0;
	movb	$0, 8(%rax)	 ;, new_parser_86->in_function
 ; ./asm_test/win/i/all.c:1155:     new_parser->in_method = 0;
	movb	$0, 9(%rax)	 ;, new_parser_86->in_method
 ; ./asm_test/win/i/all.c:1156:     new_parser->in_loop = 0;
	movb	$0, 11(%rax)	 ;, new_parser_86->in_loop
 ; ./asm_test/win/i/all.c:1157:     new_parser->source_file = file;
	movq	%rbx, (%rax)	 ; file, new_parser_86->source_file
 ; ./asm_test/win/i/all.c:983:         ast = parse_code(lexer, builtin_scope, parser);
	movq	builtin_scope(%rip), %rdx	 ; builtin_scope,
	movq	%r13, %rcx	 ; lexer,
	call	parse_code	 ;
	movq	%rax, %r13	 ; tmp711, ast
 ; ./asm_test/win/i/all.c:985:         change_file_extension(file, create_string_check(".ast", 4, 1));
	movl	$1, %r8d	 ;,
	movl	$4, %edx	 ;,
	leaq	.LC272(%rip), %rcx	 ;, tmp444
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3946:     file->extension = new_extension;
	movq	%rax, 8(%rbx)	 ; tmp712, file_13->extension
 ; ./asm_test/win/i/all.c:3947:     rebuild_full_path(file);
	movq	%rbx, %rcx	 ; file,
	call	rebuild_full_path	 ;
 ; ./asm_test/win/i/all.c:986:         char* out_ast_name = file->path;
	movq	24(%rbx), %rdi	 ; file_13->path, out_ast_name
 ; ./asm_test/win/i/all.c:987:         change_file_extension(file, create_string_check(".tc", 3, 1));
	movl	$1, %r8d	 ;,
	movl	$3, %edx	 ;,
	leaq	.LC273(%rip), %rcx	 ;, tmp445
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3946:     file->extension = new_extension;
	movq	%rax, 8(%rbx)	 ; tmp713, file_13->extension
 ; ./asm_test/win/i/all.c:3947:     rebuild_full_path(file);
	movq	%rbx, %rcx	 ; file,
	call	rebuild_full_path	 ;
 ; ./asm_test/win/i/all.c:988:         FILE* out_ast_file = fopen(out_ast_name, "w");
	leaq	.LC257(%rip), %rdx	 ;, tmp446
	movq	%rdi, %rcx	 ; out_ast_name,
	call	fopen	 ;
	movq	%rax, %rsi	 ; tmp714, out_ast_file
 ; ./asm_test/win/i/all.c:989:         if (out_ast_file == NULL)
	testq	%rax, %rax	 ; out_ast_file
	je	.L1592	 ;,
 ; ./asm_test/win/i/all.c:1542:     List* members = list_copy(code->members);
	movq	0(%r13), %rcx	 ; ast_27->members,
	call	list_copy	 ;
	movq	%rax, 56(%rsp)	 ; tmp716, %sfp
	movq	%rbx, 48(%rsp)	 ; file, %sfp
	movq	%r13, 40(%rsp)	 ; ast, %sfp
 ; ./asm_test/win/i/all.c:1544:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	jmp	.L1308	 ;
.L1592:
 ; ./asm_test/win/i/all.c:990:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp715, _32
 ; ./asm_test/win/i/all.c:990:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	movq	%rdi, %r8	 ; out_ast_name,
	leaq	.LC255(%rip), %rdx	 ;, tmp448
	call	fprintf	 ;
	jmp	.L1307	 ;
.L1312:
 ; ./asm_test/win/i/all.c:1552:     fprintf(outfile, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	leaq	.LC275(%rip), %rdx	 ;, tmp455
	movq	%rsi, %rcx	 ; out_ast_file,
	call	fprintf	 ;
.L1308:
 ; ./asm_test/win/i/all.c:1544:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	movq	56(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp727, member
 ; ./asm_test/win/i/all.c:1544:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	 ; member
	je	.L1593	 ;,
 ; ./asm_test/win/i/all.c:1519:     switch (code_member->type) {
	movl	8(%rbx), %eax	 ; member_91->type, _92
 ; ./asm_test/win/i/all.c:1519:     switch (code_member->type) {
	cmpl	$1, %eax	 ;, _92
	je	.L1309	 ;,
	cmpl	$2, %eax	 ;, _92
	je	.L1310	 ;,
	testl	%eax, %eax	 ; _92
	jne	.L1311	 ;,
 ; ./asm_test/win/i/all.c:1521:             indention(outfile, indent, 0, indent_has_next);
	leaq	80(%rsp), %rdi	 ;, tmp449
	movq	%rdi, %r9	 ; tmp449,
	movl	$0, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1522:             fprintf(outfile, "import\n");
	movq	%rsi, %r9	 ; out_ast_file,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC274(%rip), %rcx	 ;, tmp450
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1523:             output_import(code_member->content.import, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rbx	 ; member_91->content.import, _94
 ; ./asm_test/win/i/all.c:1548:     indention(outfile, indent, 0, indent_has_next);
	movq	%rdi, %r9	 ; tmp449,
	movl	$0, %r8d	 ;,
	movl	$2, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1549:     fprintf(outfile, "name\n");
	movq	%rsi, %r9	 ; out_ast_file,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC25(%rip), %rcx	 ;, tmp452
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1550:     output_name(import->name, outfile, indent + 1, indent_has_next);
	movq	%rdi, %r9	 ; tmp449,
	movl	$3, %r8d	 ;,
	movq	%rsi, %rdx	 ; out_ast_file,
	movq	(%rbx), %rcx	 ; _94->name,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1551:     indention(outfile, indent, 1, indent_has_next);
	movq	%rdi, %r9	 ; tmp449,
	movl	$1, %r8d	 ;,
	movl	$2, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1552:     fprintf(outfile, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	8(%rbx), %r8	 ; _94->source, _102
 ; ./asm_test/win/i/all.c:1552:     fprintf(outfile, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	testq	%r8, %r8	 ; _102
	jne	.L1312	 ;,
 ; ./asm_test/win/i/all.c:1552:     fprintf(outfile, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	leaq	.LC253(%rip), %r8	 ;, _102
	jmp	.L1312	 ;
.L1309:
 ; ./asm_test/win/i/all.c:1526:             indention(outfile, indent, 0, indent_has_next);
	leaq	80(%rsp), %rdi	 ;, tmp456
	movq	%rdi, %r9	 ; tmp456,
	movl	$0, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1527:             fprintf(outfile, "function\n");
	movq	%rsi, %r9	 ; out_ast_file,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC27(%rip), %rcx	 ;, tmp457
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1528:             output_function(code_member->content.function, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rbx	 ; member_91->content.function, _96
 ; ./asm_test/win/i/all.c:1555:     indention(outfile, indent, 0, indent_has_next);
	movq	%rdi, %r9	 ; tmp456,
	movl	$0, %r8d	 ;,
	movl	$2, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1556:     fprintf(outfile, "name\n");
	movq	%rsi, %r9	 ; out_ast_file,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC25(%rip), %rcx	 ;, tmp459
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1557:     output_name(function->name, outfile, indent + 1, indent_has_next);
	movq	%rdi, %r9	 ; tmp456,
	movl	$3, %r8d	 ;,
	movq	%rsi, %rdx	 ; out_ast_file,
	movq	(%rbx), %rcx	 ; _96->name,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1558:     indention(outfile, indent, 0, indent_has_next);
	movq	%rdi, %r9	 ; tmp456,
	movl	$0, %r8d	 ;,
	movl	$2, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1559:     fprintf(outfile, "return_type\n");
	movq	%rsi, %r9	 ; out_ast_file,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC13(%rip), %rcx	 ;, tmp462
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1560:     output_name(function->return_type, outfile, indent + 1, indent_has_next);
	movq	8(%rbx), %rcx	 ; _96->return_type, _96->return_type
	movq	%rdi, %r9	 ; tmp456,
	movl	$3, %r8d	 ;,
	movq	%rsi, %rdx	 ; out_ast_file,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1561:     indention(outfile, indent, 0, indent_has_next);
	movq	%rdi, %r9	 ; tmp456,
	movl	$0, %r8d	 ;,
	movl	$2, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1562:     fprintf(outfile, "parameters\n");
	movq	%rsi, %r9	 ; out_ast_file,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC276(%rip), %rcx	 ;, tmp466
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1563:     List* parameters = list_copy(function->parameters);
	movq	16(%rbx), %rcx	 ; _96->parameters, _96->parameters
	call	list_copy	 ;
	movq	%rax, %r15	 ; tmp717, parameters
 ; ./asm_test/win/i/all.c:1564:     List* body = list_copy(function->body);
	movq	24(%rbx), %rcx	 ; _96->body, _96->body
	call	list_copy	 ;
	movq	%rax, %r14	 ; tmp718, body
 ; ./asm_test/win/i/all.c:1566:     int index = -1;
	movl	$-1, %edi	 ;, index
 ; ./asm_test/win/i/all.c:1568:         indention(outfile, indent + 1, 0, indent_has_next);
	leaq	80(%rsp), %r12	 ;, tmp684
 ; ./asm_test/win/i/all.c:1567:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	jmp	.L1314	 ;
.L1315:
 ; ./asm_test/win/i/all.c:1568:         indention(outfile, indent + 1, 0, indent_has_next);
	movq	%r12, %r9	 ; tmp684,
	movl	$0, %r8d	 ;,
	movl	$3, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1569:         fprintf(outfile, "parameters[%d]\n", ++index);
	addl	$1, %edi	 ;, index
	movl	%edi, %r8d	 ; index,
	leaq	.LC277(%rip), %rdx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1570:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	movq	%r12, %r9	 ; tmp684,
	movl	$4, %r8d	 ;,
	movq	%rsi, %rdx	 ; out_ast_file,
	movq	%rbx, %rcx	 ; parameter,
	call	output_variable	 ;
.L1314:
 ; ./asm_test/win/i/all.c:1567:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%r15, %rcx	 ; parameters,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp719, parameter
 ; ./asm_test/win/i/all.c:1567:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	 ; parameter
	jne	.L1315	 ;,
 ; ./asm_test/win/i/all.c:1572:     indention(outfile, indent, 1, indent_has_next);
	leaq	80(%rsp), %r9	 ;,
	movl	$1, %r8d	 ;,
	movl	$2, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1573:     fprintf(outfile, "body\n");
	movq	%rsi, %r9	 ; out_ast_file,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC59(%rip), %rcx	 ;, tmp473
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1576:         output_statement(statement, outfile, indent + 1, indent_has_next);
	leaq	80(%rsp), %rbx	 ;, tmp683
 ; ./asm_test/win/i/all.c:1575:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L1316	 ;
.L1317:
 ; ./asm_test/win/i/all.c:1576:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rbx, %r9	 ; tmp683,
	movl	$3, %r8d	 ;,
	movq	%rsi, %rdx	 ; out_ast_file,
	call	output_statement	 ;
.L1316:
 ; ./asm_test/win/i/all.c:1575:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r14, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp720, statement
 ; ./asm_test/win/i/all.c:1575:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L1317	 ;,
	jmp	.L1308	 ;
.L1310:
 ; ./asm_test/win/i/all.c:1531:             indention(outfile, indent, 0, indent_has_next);
	leaq	80(%rsp), %rdi	 ;, tmp475
	movq	%rdi, %r9	 ; tmp475,
	movl	$0, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1532:             fprintf(outfile, "class\n");
	movq	%rsi, %r9	 ; out_ast_file,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC278(%rip), %rcx	 ;, tmp476
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1533:             output_class(code_member->content.class, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rbx	 ; member_91->content.class, _98
 ; ./asm_test/win/i/all.c:1621:     indention(outfile, indent, 0, indent_has_next);
	movq	%rdi, %r9	 ; tmp475,
	movl	$0, %r8d	 ;,
	movl	$2, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1622:     fprintf(outfile, "name\n");
	movq	%rsi, %r9	 ; out_ast_file,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC25(%rip), %rcx	 ;, tmp478
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1623:     output_name(class->name, outfile, indent + 1, indent_has_next);
	movq	%rdi, %r9	 ; tmp475,
	movl	$3, %r8d	 ;,
	movq	%rsi, %rdx	 ; out_ast_file,
	movq	(%rbx), %rcx	 ; _98->name,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1624:     indention(outfile, indent, 1, indent_has_next);
	movq	%rdi, %r9	 ; tmp475,
	movl	$1, %r8d	 ;,
	movl	$2, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1625:     fprintf(outfile, "members\n");
	movq	%rsi, %r9	 ; out_ast_file,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC279(%rip), %rcx	 ;, tmp481
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1626:     List* members = list_copy(class->members);
	movq	8(%rbx), %rcx	 ; _98->members, _98->members
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp721, members
 ; ./asm_test/win/i/all.c:1628:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	jmp	.L1318	 ;
.L1319:
 ; ./asm_test/win/i/all.c:1605:             indention(outfile, indent, 0, indent_has_next);
	leaq	80(%rsp), %rdi	 ;, tmp483
	movq	%rdi, %r9	 ; tmp483,
	movl	$0, %r8d	 ;,
	movl	$3, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1606:             fprintf(outfile, "method\n");
	movq	%rsi, %r9	 ; out_ast_file,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC280(%rip), %rcx	 ;,
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1607:             output_method(class_member->content.method, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rbx	 ; member_120->content.method, _123
 ; ./asm_test/win/i/all.c:1579:     indention(outfile, indent, 0, indent_has_next);
	movq	%rdi, %r9	 ; tmp483,
	movl	$0, %r8d	 ;,
	movl	$4, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1580:     fprintf(outfile, "name\n");
	movq	%rsi, %r9	 ; out_ast_file,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC25(%rip), %rcx	 ;, tmp486
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1581:     output_name(method->name, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rcx	 ; _123->name, _123->name
	movq	%rdi, %r9	 ; tmp483,
	movl	$5, %r8d	 ;,
	movq	%rsi, %rdx	 ; out_ast_file,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1582:     indention(outfile, indent, 0, indent_has_next);
	movq	%rdi, %r9	 ; tmp483,
	movl	$0, %r8d	 ;,
	movl	$4, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1583:     fprintf(outfile, "return_type\n");
	movq	%rsi, %r9	 ; out_ast_file,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC13(%rip), %rcx	 ;, tmp490
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1584:     output_name(method->return_type, outfile, indent + 1, indent_has_next);
	movq	8(%rbx), %rcx	 ; _123->return_type, _123->return_type
	movq	%rdi, %r9	 ; tmp483,
	movl	$5, %r8d	 ;,
	movq	%rsi, %rdx	 ; out_ast_file,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1585:     indention(outfile, indent, 0, indent_has_next);
	movq	%rdi, %r9	 ; tmp483,
	movl	$0, %r8d	 ;,
	movl	$4, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1586:     fprintf(outfile, "parameters\n");
	movq	%rsi, %r9	 ; out_ast_file,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC276(%rip), %rcx	 ;, tmp494
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1587:     List* parameters = list_copy(method->parameters);
	movq	16(%rbx), %rcx	 ; _123->parameters, _123->parameters
	call	list_copy	 ;
	movq	%rax, %r15	 ; tmp722, parameters
 ; ./asm_test/win/i/all.c:1588:     List* body = list_copy(method->body);
	movq	24(%rbx), %rcx	 ; _123->body, _123->body
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp723, body
 ; ./asm_test/win/i/all.c:1590:     int index = -1;
	movl	$-1, %edi	 ;, index
 ; ./asm_test/win/i/all.c:1592:         indention(outfile, indent + 1, 0, indent_has_next);
	leaq	80(%rsp), %r14	 ;, tmp678
.L1322:
 ; ./asm_test/win/i/all.c:1591:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%r15, %rcx	 ; parameters,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp724, parameter
 ; ./asm_test/win/i/all.c:1591:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	 ; parameter
	je	.L1594	 ;,
 ; ./asm_test/win/i/all.c:1592:         indention(outfile, indent + 1, 0, indent_has_next);
	movq	%r14, %r9	 ; tmp678,
	movl	$0, %r8d	 ;,
	movl	$5, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1593:         fprintf(outfile, "parameters[%d]\n", ++index);
	addl	$1, %edi	 ;, index
	movl	%edi, %r8d	 ; index,
	leaq	.LC277(%rip), %rdx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1594:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	movq	%r14, %r9	 ; tmp678,
	movl	$6, %r8d	 ;,
	movq	%rsi, %rdx	 ; out_ast_file,
	movq	%rbx, %rcx	 ; parameter,
	call	output_variable	 ;
	jmp	.L1322	 ;
.L1594:
 ; ./asm_test/win/i/all.c:1596:     indention(outfile, indent, 1, indent_has_next);
	leaq	80(%rsp), %r9	 ;,
	movl	$1, %r8d	 ;,
	movl	$4, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1597:     fprintf(outfile, "body\n");
	movq	%rsi, %r9	 ; out_ast_file,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC59(%rip), %rcx	 ;, tmp501
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1600:         output_statement(statement, outfile, indent + 1, indent_has_next);
	leaq	80(%rsp), %rbx	 ;, tmp677
.L1324:
 ; ./asm_test/win/i/all.c:1599:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r12, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp725, statement
 ; ./asm_test/win/i/all.c:1599:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L1318	 ;,
 ; ./asm_test/win/i/all.c:1600:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%rbx, %r9	 ; tmp677,
	movl	$5, %r8d	 ;,
	movq	%rsi, %rdx	 ; out_ast_file,
	call	output_statement	 ;
	jmp	.L1324	 ;
.L1320:
 ; ./asm_test/win/i/all.c:1610:             indention(outfile, indent, 0, indent_has_next);
	leaq	80(%rsp), %rdi	 ;, tmp503
	movq	%rdi, %r9	 ; tmp503,
	movl	$0, %r8d	 ;,
	movl	$3, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1611:             fprintf(outfile, "variable\n");
	movq	%rsi, %r9	 ; out_ast_file,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC281(%rip), %rcx	 ;, tmp504
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1612:             output_variable(class_member->content.variable, outfile, indent + 1, indent_has_next);
	movq	(%rbx), %rcx	 ; member_120->content.variable, member_120->content.variable
	movq	%rdi, %r9	 ; tmp503,
	movl	$4, %r8d	 ;,
	movq	%rsi, %rdx	 ; out_ast_file,
	call	output_variable	 ;
.L1318:
 ; ./asm_test/win/i/all.c:1628:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	movq	%r13, %rcx	 ; members,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp726, member
 ; ./asm_test/win/i/all.c:1628:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	 ; member
	je	.L1308	 ;,
 ; ./asm_test/win/i/all.c:1603:     switch (class_member->type) {
	movl	8(%rbx), %eax	 ; member_120->type, _121
 ; ./asm_test/win/i/all.c:1603:     switch (class_member->type) {
	testl	%eax, %eax	 ; _121
	je	.L1319	 ;,
	cmpl	$1, %eax	 ;, _121
	je	.L1320	 ;,
 ; ./asm_test/win/i/all.c:1615:             indention(outfile, indent, 0, indent_has_next);
	leaq	80(%rsp), %r9	 ;,
	movl	$0, %r8d	 ;,
	movl	$3, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1616:             fprintf(outfile, "unknown_ClassMemberType: %u\n", class_member->type);
	movl	8(%rbx), %r8d	 ; member_120->type,
	leaq	.LC282(%rip), %rdx	 ;, tmp509
	movq	%rsi, %rcx	 ; out_ast_file,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1617:             break;
	jmp	.L1318	 ;
.L1311:
 ; ./asm_test/win/i/all.c:1536:             indention(outfile, indent, 0, indent_has_next);
	leaq	80(%rsp), %r9	 ;,
	movl	$0, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1537:             fprintf(outfile, "unknown_CodeMemberType: %u\n", code_member->type);
	movl	8(%rbx), %r8d	 ; member_91->type,
	leaq	.LC283(%rip), %rdx	 ;, tmp512
	movq	%rsi, %rcx	 ; out_ast_file,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1538:             break;
	jmp	.L1308	 ;
.L1593:
 ; ./asm_test/win/i/all.c:950:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	48(%rsp), %rbx	 ; %sfp, file
	movq	40(%rsp), %r13	 ; %sfp, ast
	call	get_info	 ;
	movq	%rax, %r8	 ;, tmp728
 ; ./asm_test/win/i/all.c:950:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	leaq	.LC271(%rip), %rdx	 ;, tmp513
	movq	%rsi, %rcx	 ; out_ast_file,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:993:             fclose(out_ast_file);
	movq	%rsi, %rcx	 ; out_ast_file,
	call	fclose	 ;
.L1307:
 ; ./asm_test/win/i/all.c:997:         change_file_extension(file, create_string_check(".tac", 4, 1));
	movl	$1, %r8d	 ;,
	movl	$4, %edx	 ;,
	leaq	.LC284(%rip), %rcx	 ;, tmp514
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3946:     file->extension = new_extension;
	movq	%rax, 8(%rbx)	 ; tmp729, file_13->extension
 ; ./asm_test/win/i/all.c:3947:     rebuild_full_path(file);
	movq	%rbx, %rcx	 ; file,
	call	rebuild_full_path	 ;
 ; ./asm_test/win/i/all.c:998:         char* out_tac_name = file->path;
	movq	24(%rbx), %rsi	 ; file_13->path, out_tac_name
 ; ./asm_test/win/i/all.c:999:         change_file_extension(file, create_string_check(".tc", 3, 1));
	movl	$1, %r8d	 ;,
	movl	$3, %edx	 ;,
	leaq	.LC273(%rip), %rcx	 ;, tmp515
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3946:     file->extension = new_extension;
	movq	%rax, 8(%rbx)	 ; tmp730, file_13->extension
 ; ./asm_test/win/i/all.c:3947:     rebuild_full_path(file);
	movq	%rbx, %rcx	 ; file,
	call	rebuild_full_path	 ;
 ; ./asm_test/win/i/all.c:1000:         FILE* out_tac_file = fopen(out_tac_name, "w");
	leaq	.LC257(%rip), %rdx	 ;, tmp516
	movq	%rsi, %rcx	 ; out_tac_name,
	call	fopen	 ;
	movq	%rax, %rbx	 ; tmp731, out_tac_file
 ; ./asm_test/win/i/all.c:1001:         if (out_tac_file == NULL)
	testq	%rax, %rax	 ; out_tac_file
	je	.L1595	 ;,
 ; ./asm_test/win/i/all.c:3190:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %r12	 ; tmp733, tac
 ; ./asm_test/win/i/all.c:3191:     tac->attribute_tables = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:3191:     tac->attribute_tables = create_list();
	movq	%rax, (%r12)	 ; tmp734, tac_156->attribute_tables
 ; ./asm_test/win/i/all.c:3192:     tac->entry_point = NULL;
	movq	$0, 8(%r12)	 ;, tac_156->entry_point
 ; ./asm_test/win/i/all.c:3193:     tac->global_vars = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:3193:     tac->global_vars = create_list();
	movq	%rax, 16(%r12)	 ; tmp735, tac_156->global_vars
 ; ./asm_test/win/i/all.c:3194:     tac->subroutines = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:3194:     tac->subroutines = create_list();
	movq	%rax, 24(%r12)	 ; tmp736, tac_156->subroutines
 ; ./asm_test/win/i/all.c:3198:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movl	$96, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp737, status
 ; ./asm_test/win/i/all.c:3199:     status->tac = tac;
	movq	%r12, (%rax)	 ; tac, status_153->tac
 ; ./asm_test/win/i/all.c:3200:     status->current_subroutine = NULL;
	movq	$0, 8(%rax)	 ;, status_153->current_subroutine
 ; ./asm_test/win/i/all.c:3201:     status->current_block = NULL;
	movq	$0, 16(%rax)	 ;, status_153->current_block
 ; ./asm_test/win/i/all.c:3202:     status->end_labels = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:3202:     status->end_labels = create_list();
	movq	%rax, 32(%rsi)	 ; tmp738, status_153->end_labels
 ; ./asm_test/win/i/all.c:3203:     status->start_labels = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:3203:     status->start_labels = create_list();
	movq	%rax, 40(%rsi)	 ; tmp739, status_153->start_labels
 ; ./asm_test/win/i/all.c:3204:     status->attr_count = 0;
	movq	$0, 48(%rsi)	 ;, status_153->attr_count
 ; ./asm_test/win/i/all.c:3205:     status->param_count = 0;
	movq	$0, 56(%rsi)	 ;, status_153->param_count
 ; ./asm_test/win/i/all.c:3206:     status->var_count = 0;
	movq	$0, 64(%rsi)	 ;, status_153->var_count
 ; ./asm_test/win/i/all.c:3207:     status->temp_count = 0;
	movq	$0, 72(%rsi)	 ;, status_153->temp_count
 ; ./asm_test/win/i/all.c:3208:     status->block_count = 0;
	movq	$0, 80(%rsi)	 ;, status_153->block_count
 ; ./asm_test/win/i/all.c:3209:     status->subroutine_count = 0;
	movq	$0, 88(%rsi)	 ;, status_153->subroutine_count
 ; ./asm_test/win/i/all.c:3390:     List* members = list_copy(code->members);
	movq	0(%r13), %rcx	 ; ast_27->members,
	call	list_copy	 ;
	movq	%rax, 56(%rsp)	 ; tmp740, %sfp
 ; ./asm_test/win/i/all.c:3392:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	jmp	.L1331	 ;
.L1595:
 ; ./asm_test/win/i/all.c:1002:             fprintf(stderr, "Error opening file: %s\n", out_tac_name);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp732, _37
 ; ./asm_test/win/i/all.c:1002:             fprintf(stderr, "Error opening file: %s\n", out_tac_name);
	movq	%rsi, %r8	 ; out_tac_name,
	leaq	.LC255(%rip), %rdx	 ;, tmp518
	call	fprintf	 ;
	jmp	.L1330	 ;
.L1597:
 ; ./asm_test/win/i/all.c:3394:             tac_function(code_member->content.function, status);
	movq	(%rdi), %r15	 ; code_member_144->content.function, _146
 ; ./asm_test/win/i/all.c:3415:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	8(%r15), %rdx	 ; _146->return_type, _146->return_type
	movq	(%r15), %rcx	 ; _146->name, _146->name
	call	create_subroutine	 ;
	movq	%rax, %r13	 ; tmp741, subroutine
 ; ./asm_test/win/i/all.c:3416:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rsi)	 ; subroutine, status_153->current_subroutine
 ; ./asm_test/win/i/all.c:3417:     list_append(status->tac->subroutines, (size_t*)subroutine);
	movq	(%rsi), %rax	 ; status_153->tac, status_153->tac
	movq	24(%rax), %rcx	 ; _163->subroutines, _163->subroutines
	movq	%r13, %rdx	 ; subroutine,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3418:     List* parameters = list_copy(function->parameters);
	movq	16(%r15), %rcx	 ; _146->parameters, _146->parameters
	call	list_copy	 ;
	movq	%rax, %r14	 ; tmp742, parameters
 ; ./asm_test/win/i/all.c:3420:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L1333	 ;
.L1334:
 ; ./asm_test/win/i/all.c:3421:         list_append(subroutine->parameters, (size_t*)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rdx	 ; parameter_167->type, parameter_167->type
	movq	8(%rax), %rcx	 ; parameter_167->name, parameter_167->name
	movq	%rsi, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp743, _170
 ; ./asm_test/win/i/all.c:3421:         list_append(subroutine->parameters, (size_t*)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%r13), %rcx	 ; subroutine_162->parameters, subroutine_162->parameters
	call	list_append	 ;
.L1333:
 ; ./asm_test/win/i/all.c:3420:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r14, %rcx	 ; parameters,
	call	list_pop	 ;
 ; ./asm_test/win/i/all.c:3420:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L1334	 ;,
 ; ./asm_test/win/i/all.c:3422:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rsi, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rcx	 ; tmp745, _172
 ; ./asm_test/win/i/all.c:3422:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	 ;
	movq	%rax, %r14	 ; tmp746, block
 ; ./asm_test/win/i/all.c:3423:     list_append(subroutine->blocks, (size_t*)block);
	movq	32(%r13), %rcx	 ; subroutine_162->blocks, subroutine_162->blocks
	movq	%rax, %rdx	 ; block,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3424:     status->current_block = block;
	movq	%r14, 16(%rsi)	 ; block, status_153->current_block
 ; ./asm_test/win/i/all.c:3425:     List* statements = list_copy(function->body);
	movq	24(%r15), %rcx	 ; _146->body, _146->body
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp747, statements
 ; ./asm_test/win/i/all.c:3427:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L1335	 ;
.L1336:
 ; ./asm_test/win/i/all.c:3428:         tac_statement(statement, status);
	movq	%rsi, %rdx	 ; status,
	call	tac_statement	 ;
.L1335:
 ; ./asm_test/win/i/all.c:3427:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%r13, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp748, statement
 ; ./asm_test/win/i/all.c:3427:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L1336	 ;,
 ; ./asm_test/win/i/all.c:3429:     status->current_subroutine = NULL;
	movq	$0, 8(%rsi)	 ;, status_153->current_subroutine
 ; ./asm_test/win/i/all.c:3395:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rdi), %rax	 ; code_member_144->content.function, code_member_144->content.function
	movq	(%rax), %rdi	 ; _147->name, _148
 ; ./asm_test/win/i/all.c:3395:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rdi), %rcx	 ; _148->name, _148->name
	leaq	.LC285(%rip), %rdx	 ;,
	call	strcmp	 ;
 ; ./asm_test/win/i/all.c:3395:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	 ; tmp749
	jne	.L1331	 ;,
 ; ./asm_test/win/i/all.c:3396:                 tac->entry_point = code_member->content.function->name;
	movq	%rdi, 8(%r12)	 ; _148, tac_156->entry_point
	jmp	.L1331	 ;
.L1598:
 ; ./asm_test/win/i/all.c:3398:             tac_class(code_member->content.class, status);
	movq	%rsi, %rdx	 ; status,
	movq	(%rdi), %rcx	 ; code_member_144->content.class,
	call	tac_class	 ;
.L1331:
 ; ./asm_test/win/i/all.c:3392:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	56(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp753, code_member
 ; ./asm_test/win/i/all.c:3392:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; code_member
	je	.L1596	 ;,
 ; ./asm_test/win/i/all.c:3393:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rdi), %eax	 ; code_member_144->type, _145
 ; ./asm_test/win/i/all.c:3393:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	 ;, _145
	je	.L1597	 ;,
 ; ./asm_test/win/i/all.c:3397:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	 ;, _145
	je	.L1598	 ;,
 ; ./asm_test/win/i/all.c:3399:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	 ; _145
	jne	.L1331	 ;,
 ; ./asm_test/win/i/all.c:3405:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rdi), %rax	 ; code_member_144->content.import, code_member_144->content.import
	movq	(%rax), %rcx	 ; _152->name, _178
 ; ./asm_test/win/i/all.c:3405:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rcx), %edi	 ; _178->kind, _179
 ; ./asm_test/win/i/all.c:3405:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %edi	 ;, _179
	je	.L1599	 ;,
 ; ./asm_test/win/i/all.c:3407:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rdi), %eax	 ;, tmp536
 ; ./asm_test/win/i/all.c:3407:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, tmp536
	jbe	.L1600	 ;,
 ; ./asm_test/win/i/all.c:3409:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%edi, %edi	 ; _179
	jne	.L1341	 ;,
 ; ./asm_test/win/i/all.c:3410:         tac_class(import->name->ast_node.class, status);
	movq	24(%rcx), %rcx	 ; _178->ast_node.class, _178->ast_node.class
	movq	%rsi, %rdx	 ; status,
	call	tac_class	 ;
	jmp	.L1331	 ;
.L1599:
 ; ./asm_test/win/i/all.c:3406:         list_append(tac->global_vars, (size_t*)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	%rsi, %r9	 ; status,
	movl	$118, %r8d	 ;,
	movq	(%rcx), %rdx	 ; _178->type,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp750, _181
 ; ./asm_test/win/i/all.c:3406:         list_append(tac->global_vars, (size_t*)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	16(%r12), %rcx	 ; tac_156->global_vars, tac_156->global_vars
	call	list_append	 ;
	jmp	.L1331	 ;
.L1600:
 ; ./asm_test/win/i/all.c:3408:         list_append(tac->global_vars, (size_t*)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	%rsi, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	(%rcx), %rdx	 ; _178->type,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp751, _185
 ; ./asm_test/win/i/all.c:3408:         list_append(tac->global_vars, (size_t*)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%r12), %rcx	 ; tac_156->global_vars, tac_156->global_vars
	call	list_append	 ;
	jmp	.L1331	 ;
.L1341:
 ; ./asm_test/win/i/all.c:3412:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
	movq	%rax, %rcx	 ; tmp752, _188
 ; ./asm_test/win/i/all.c:3412:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	%edi, %r8d	 ; _179,
	leaq	.LC286(%rip), %rdx	 ;, tmp540
	call	fprintf	 ;
	jmp	.L1331	 ;
.L1596:
 ; ./asm_test/win/i/all.c:1983:     fprintf(outfile, "TAC {\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC287(%rip), %rcx	 ;, tmp541
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:1984:     if (tac->attribute_tables == NULL || tac->attribute_tables->head == NULL || tac->attribute_tables->tail == NULL) {
	movq	(%r12), %rax	 ; tac_156->attribute_tables, _195
 ; ./asm_test/win/i/all.c:1984:     if (tac->attribute_tables == NULL || tac->attribute_tables->head == NULL || tac->attribute_tables->tail == NULL) {
	testq	%rax, %rax	 ; _195
	je	.L1452	 ;,
 ; ./asm_test/win/i/all.c:1984:     if (tac->attribute_tables == NULL || tac->attribute_tables->head == NULL || tac->attribute_tables->tail == NULL) {
	cmpq	$0, (%rax)	 ;, _195->head
	je	.L1453	 ;,
	movl	$4, %esi	 ;, ivtmp_362
 ; ./asm_test/win/i/all.c:1984:     if (tac->attribute_tables == NULL || tac->attribute_tables->head == NULL || tac->attribute_tables->tail == NULL) {
	cmpq	$0, 8(%rax)	 ;, _195->tail
	je	.L1345	 ;,
.L1344:
 ; ./asm_test/win/i/all.c:1988:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:1988:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_362
	jne	.L1344	 ;,
 ; ./asm_test/win/i/all.c:1989:         fprintf(outfile, "designs: [\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC289(%rip), %rcx	 ;, tmp543
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2330:         fprintf(outfile, "%s ", attribute_table->name->name);
	leaq	.LC291(%rip), %r15	 ;, tmp673
 ; ./asm_test/win/i/all.c:2355:         fprintf(outfile, "%s\t", attribute->type->name);
	leaq	.LC296(%rip), %r14	 ;, tmp674
 ; ./asm_test/win/i/all.c:1991:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	jmp	.L1347	 ;
.L1452:
	movl	$4, %esi	 ;, ivtmp_415
.L1345:
 ; ./asm_test/win/i/all.c:1985:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:1985:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_415
	jne	.L1345	 ;,
 ; ./asm_test/win/i/all.c:1986:         fprintf(outfile, "designs: []\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC288(%rip), %rcx	 ;, tmp542
	call	fwrite	 ;
.L1346:
	movl	$4, %esi	 ;, ivtmp_418
 ; ./asm_test/win/i/all.c:1996:     if (tac->entry_point == NULL) {
	cmpq	$0, 8(%r12)	 ;, tac_156->entry_point
	je	.L1366	 ;,
.L1365:
 ; ./asm_test/win/i/all.c:2000:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2000:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_418
	jne	.L1365	 ;,
 ; ./asm_test/win/i/all.c:2001:         fprintf(outfile, "entry_point: %s\n", tac->entry_point->name);
	movq	8(%r12), %rax	 ; tac_156->entry_point, tac_156->entry_point
	movq	8(%rax), %r8	 ; _220->name,
	leaq	.LC302(%rip), %rdx	 ;, tmp571
	movq	%rbx, %rcx	 ; out_tac_file,
	call	fprintf	 ;
.L1367:
 ; ./asm_test/win/i/all.c:2003:     if (tac->global_vars == NULL || tac->global_vars->head == NULL || tac->global_vars->tail == NULL) {
	movq	16(%r12), %rax	 ; tac_156->global_vars, _222
 ; ./asm_test/win/i/all.c:2003:     if (tac->global_vars == NULL || tac->global_vars->head == NULL || tac->global_vars->tail == NULL) {
	testq	%rax, %rax	 ; _222
	je	.L1458	 ;,
 ; ./asm_test/win/i/all.c:2003:     if (tac->global_vars == NULL || tac->global_vars->head == NULL || tac->global_vars->tail == NULL) {
	cmpq	$0, (%rax)	 ;, _222->head
	je	.L1459	 ;,
	movl	$4, %esi	 ;, ivtmp_424
 ; ./asm_test/win/i/all.c:2003:     if (tac->global_vars == NULL || tac->global_vars->head == NULL || tac->global_vars->tail == NULL) {
	cmpq	$0, 8(%rax)	 ;, _222->tail
	je	.L1370	 ;,
.L1369:
 ; ./asm_test/win/i/all.c:2007:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2007:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_424
	jne	.L1369	 ;,
 ; ./asm_test/win/i/all.c:2008:         fprintf(outfile, "global: [\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC304(%rip), %rcx	 ;, tmp573
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2010:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	jmp	.L1372	 ;
.L1453:
	movl	$4, %esi	 ;, ivtmp_415
	jmp	.L1345	 ;
.L1349:
 ; ./asm_test/win/i/all.c:2326:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2326:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_385
	jne	.L1349	 ;,
 ; ./asm_test/win/i/all.c:2327:         fprintf(outfile, "NULL ");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC290(%rip), %rcx	 ;, tmp544
	call	fwrite	 ;
	jmp	.L1350	 ;
.L1351:
 ; ./asm_test/win/i/all.c:2334:         fprintf(outfile, "{}\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$3, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC293(%rip), %rcx	 ;, tmp550
	call	fwrite	 ;
.L1347:
 ; ./asm_test/win/i/all.c:1991:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	movq	(%r12), %rcx	 ; tac_156->attribute_tables, tac_156->attribute_tables
	call	list_pop	 ;
	movq	%rax, %r13	 ; tmp755, attribute_table
 ; ./asm_test/win/i/all.c:1991:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	testq	%rax, %rax	 ; attribute_table
	je	.L1601	 ;,
	movl	$8, %esi	 ;, ivtmp_382
 ; ./asm_test/win/i/all.c:2325:     if (attribute_table->name == NULL) {
	cmpq	$0, 8(%r13)	 ;, attribute_table_207->name
	je	.L1349	 ;,
.L1348:
 ; ./asm_test/win/i/all.c:2329:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2329:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_382
	jne	.L1348	 ;,
 ; ./asm_test/win/i/all.c:2330:         fprintf(outfile, "%s ", attribute_table->name->name);
	movq	8(%r13), %rax	 ; attribute_table_207->name, attribute_table_207->name
	movq	8(%rax), %r8	 ; _270->name,
	movq	%r15, %rdx	 ; tmp673,
	movq	%rbx, %rcx	 ; out_tac_file,
	call	fprintf	 ;
.L1350:
 ; ./asm_test/win/i/all.c:2332:     fprintf(outfile, "%zu ", attribute_table->size);
	movq	16(%r13), %r8	 ; attribute_table_207->size,
	leaq	.LC292(%rip), %rdx	 ;, tmp549
	movq	%rbx, %rcx	 ; out_tac_file,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2333:     if (attribute_table->attributes == NULL || attribute_table->attributes->head == NULL || attribute_table->attributes->tail == NULL)
	movq	0(%r13), %rax	 ; attribute_table_207->attributes, _273
 ; ./asm_test/win/i/all.c:2333:     if (attribute_table->attributes == NULL || attribute_table->attributes->head == NULL || attribute_table->attributes->tail == NULL)
	testq	%rax, %rax	 ; _273
	je	.L1351	 ;,
 ; ./asm_test/win/i/all.c:2333:     if (attribute_table->attributes == NULL || attribute_table->attributes->head == NULL || attribute_table->attributes->tail == NULL)
	cmpq	$0, (%rax)	 ;, _273->head
	je	.L1351	 ;,
 ; ./asm_test/win/i/all.c:2333:     if (attribute_table->attributes == NULL || attribute_table->attributes->head == NULL || attribute_table->attributes->tail == NULL)
	cmpq	$0, 8(%rax)	 ;, _273->tail
	je	.L1351	 ;,
 ; ./asm_test/win/i/all.c:2336:         fprintf(outfile, "{\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC294(%rip), %rcx	 ;, tmp551
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2338:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	jmp	.L1354	 ;
.L1356:
 ; ./asm_test/win/i/all.c:2351:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2351:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_406
	jne	.L1356	 ;,
 ; ./asm_test/win/i/all.c:2352:         fprintf(outfile, "NULL\t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC295(%rip), %rcx	 ;,
	call	fwrite	 ;
	jmp	.L1357	 ;
.L1603:
 ; ./asm_test/win/i/all.c:2358:         fprintf(outfile, "NULL ");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC290(%rip), %rcx	 ;, tmp556
	call	fwrite	 ;
	jmp	.L1359	 ;
.L1604:
 ; ./asm_test/win/i/all.c:2360:         fprintf(outfile, "%s(%s) ", attribute->var->name, attribute->var->original_name->name);
	movq	8(%rdx), %r9	 ; _295->name,
	movq	8(%rax), %r8	 ; _294->name,
	leaq	.LC297(%rip), %rdx	 ;, tmp559
	movq	%rbx, %rcx	 ; out_tac_file,
	call	fprintf	 ;
.L1359:
 ; ./asm_test/win/i/all.c:2363:     fprintf(outfile, "%zu\n", attribute->offset);
	movq	16(%rdi), %r8	 ; attribute_277->offset,
	leaq	.LC298(%rip), %rdx	 ;, tmp563
	movq	%rbx, %rcx	 ; out_tac_file,
	call	fprintf	 ;
.L1354:
 ; ./asm_test/win/i/all.c:2338:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	movq	0(%r13), %rcx	 ; attribute_table_207->attributes, attribute_table_207->attributes
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp754, attribute
 ; ./asm_test/win/i/all.c:2338:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	testq	%rax, %rax	 ; attribute
	je	.L1602	 ;,
	movl	$12, %esi	 ;, ivtmp_403
 ; ./asm_test/win/i/all.c:2350:     if (attribute->type == NULL) {
	cmpq	$0, 8(%rdi)	 ;, attribute_277->type
	je	.L1356	 ;,
.L1355:
 ; ./asm_test/win/i/all.c:2354:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2354:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_403
	jne	.L1355	 ;,
 ; ./asm_test/win/i/all.c:2355:         fprintf(outfile, "%s\t", attribute->type->name);
	movq	8(%rdi), %rax	 ; attribute_277->type, attribute_277->type
	movq	8(%rax), %r8	 ; _292->name,
	movq	%r14, %rdx	 ; tmp674,
	movq	%rbx, %rcx	 ; out_tac_file,
	call	fprintf	 ;
.L1357:
 ; ./asm_test/win/i/all.c:2357:     if (attribute->var == NULL)
	movq	(%rdi), %rax	 ; attribute_277->var, _294
 ; ./asm_test/win/i/all.c:2357:     if (attribute->var == NULL)
	testq	%rax, %rax	 ; _294
	je	.L1603	 ;,
 ; ./asm_test/win/i/all.c:2359:     else if (attribute->var->original_name)
	movq	(%rax), %rdx	 ; _294->original_name, _295
 ; ./asm_test/win/i/all.c:2359:     else if (attribute->var->original_name)
	testq	%rdx, %rdx	 ; _295
	jne	.L1604	 ;,
 ; ./asm_test/win/i/all.c:2362:         fprintf(outfile, "%s ", attribute->var->name);
	movq	8(%rax), %r8	 ; _294->name,
	movq	%r15, %rdx	 ; tmp673,
	movq	%rbx, %rcx	 ; out_tac_file,
	call	fprintf	 ;
	jmp	.L1359	 ;
.L1602:
	movl	$8, %esi	 ;, ivtmp_409
.L1362:
 ; ./asm_test/win/i/all.c:2340:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2340:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_409
	jne	.L1362	 ;,
 ; ./asm_test/win/i/all.c:2341:         fprintf(outfile, "}\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC299(%rip), %rcx	 ;, tmp565
	call	fwrite	 ;
	jmp	.L1347	 ;
.L1601:
	movl	$4, %esi	 ;, ivtmp_412
.L1364:
 ; ./asm_test/win/i/all.c:1993:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:1993:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_412
	jne	.L1364	 ;,
 ; ./asm_test/win/i/all.c:1994:         fprintf(outfile, "]\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC300(%rip), %rcx	 ;, tmp567
	call	fwrite	 ;
	jmp	.L1346	 ;
.L1366:
 ; ./asm_test/win/i/all.c:1997:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:1997:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_421
	jne	.L1366	 ;,
 ; ./asm_test/win/i/all.c:1998:         fprintf(outfile, "entry_point: \"NULL\"\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$20, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC301(%rip), %rcx	 ;, tmp568
	call	fwrite	 ;
	jmp	.L1367	 ;
.L1458:
	movl	$4, %esi	 ;, ivtmp_430
.L1370:
 ; ./asm_test/win/i/all.c:2004:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2004:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_430
	jne	.L1370	 ;,
 ; ./asm_test/win/i/all.c:2005:         fprintf(outfile, "global: []\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC303(%rip), %rcx	 ;, tmp572
	call	fwrite	 ;
.L1371:
 ; ./asm_test/win/i/all.c:2015:     if (tac->subroutines == NULL || tac->subroutines->head == NULL || tac->subroutines->tail == NULL) {
	movq	24(%r12), %rax	 ; tac_156->subroutines, _238
 ; ./asm_test/win/i/all.c:2015:     if (tac->subroutines == NULL || tac->subroutines->head == NULL || tac->subroutines->tail == NULL) {
	testq	%rax, %rax	 ; _238
	je	.L1461	 ;,
 ; ./asm_test/win/i/all.c:2015:     if (tac->subroutines == NULL || tac->subroutines->head == NULL || tac->subroutines->tail == NULL) {
	cmpq	$0, (%rax)	 ;, _238->head
	je	.L1462	 ;,
	movl	$4, %esi	 ;, ivtmp_433
 ; ./asm_test/win/i/all.c:2015:     if (tac->subroutines == NULL || tac->subroutines->head == NULL || tac->subroutines->tail == NULL) {
	cmpq	$0, 8(%rax)	 ;, _238->tail
	je	.L1377	 ;,
.L1376:
 ; ./asm_test/win/i/all.c:2019:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2019:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_433
	jne	.L1376	 ;,
 ; ./asm_test/win/i/all.c:2020:         fprintf(outfile, "subroutines: [\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC306(%rip), %rcx	 ;, tmp579
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	leaq	.L1413(%rip), %r14	 ;, tmp667
 ; ./asm_test/win/i/all.c:2022:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	jmp	.L1378	 ;
.L1459:
	movl	$4, %esi	 ;, ivtmp_430
	jmp	.L1370	 ;
.L1373:
 ; ./asm_test/win/i/all.c:2011:             output_var(var, outfile, indent + 2);
	movl	$2, %r8d	 ;,
	movq	%rbx, %rdx	 ; out_tac_file,
	call	output_var	 ;
.L1372:
 ; ./asm_test/win/i/all.c:2010:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	movq	16(%r12), %rcx	 ; tac_156->global_vars, tac_156->global_vars
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp756, var
 ; ./asm_test/win/i/all.c:2010:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	testq	%rax, %rax	 ; var
	jne	.L1373	 ;,
	movl	$4, %esi	 ;, ivtmp_427
.L1374:
 ; ./asm_test/win/i/all.c:2012:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2012:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_427
	jne	.L1374	 ;,
 ; ./asm_test/win/i/all.c:2013:         fprintf(outfile, "]\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC300(%rip), %rcx	 ;, tmp575
	call	fwrite	 ;
	jmp	.L1371	 ;
.L1461:
	movl	$4, %esi	 ;, ivtmp_957
.L1377:
 ; ./asm_test/win/i/all.c:2016:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2016:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_957
	jne	.L1377	 ;,
 ; ./asm_test/win/i/all.c:2017:         fprintf(outfile, "subroutines: []\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC305(%rip), %rcx	 ;, tmp576
	call	fwrite	 ;
.L1451:
 ; ./asm_test/win/i/all.c:2028:     fprintf(outfile, "}\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC299(%rip), %rcx	 ;, tmp577
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:954:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
	movq	%rax, %r8	 ;, tmp757
 ; ./asm_test/win/i/all.c:954:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	leaq	.LC271(%rip), %rdx	 ;, tmp578
	movq	%rbx, %rcx	 ; out_tac_file,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1006:             fclose(out_tac_file);
	movq	%rbx, %rcx	 ; out_tac_file,
	call	fclose	 ;
.L1330:
 ; ./asm_test/win/i/all.c:4064:     return 0;
	movl	$0, %eax	 ;, <retval>
.L1280:
 ; ./asm_test/win/i/all.c:4065: }
	leaq	-56(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	popq	%rbp	 ;
	ret	
.L1462:
	movl	$4, %esi	 ;, ivtmp_957
	jmp	.L1377	 ;
.L1380:
 ; ./asm_test/win/i/all.c:2037:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2037:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_439
	jne	.L1380	 ;,
 ; ./asm_test/win/i/all.c:2038:         fprintf(outfile, "NULL {\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC307(%rip), %rcx	 ;, tmp580
	call	fwrite	 ;
	jmp	.L1381	 ;
.L1383:
 ; ./asm_test/win/i/all.c:2044:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2044:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_445
	jne	.L1383	 ;,
 ; ./asm_test/win/i/all.c:2045:         fprintf(outfile, "return_type: \"NULL\"\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$20, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC309(%rip), %rcx	 ;, tmp584
	call	fwrite	 ;
	jmp	.L1384	 ;
.L1466:
	movl	$12, %esi	 ;, ivtmp_454
.L1387:
 ; ./asm_test/win/i/all.c:2051:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2051:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_454
	jne	.L1387	 ;,
 ; ./asm_test/win/i/all.c:2052:         fprintf(outfile, "parameters: []\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC311(%rip), %rcx	 ;, tmp588
	call	fwrite	 ;
.L1388:
 ; ./asm_test/win/i/all.c:2062:     if (subroutine->local_vars == NULL || subroutine->local_vars->head == NULL || subroutine->local_vars->tail == NULL) {
	movq	24(%r13), %rax	 ; subroutine_250->local_vars, _339
 ; ./asm_test/win/i/all.c:2062:     if (subroutine->local_vars == NULL || subroutine->local_vars->head == NULL || subroutine->local_vars->tail == NULL) {
	testq	%rax, %rax	 ; _339
	je	.L1469	 ;,
 ; ./asm_test/win/i/all.c:2062:     if (subroutine->local_vars == NULL || subroutine->local_vars->head == NULL || subroutine->local_vars->tail == NULL) {
	cmpq	$0, (%rax)	 ;, _339->head
	je	.L1470	 ;,
	movl	$12, %esi	 ;, ivtmp_457
 ; ./asm_test/win/i/all.c:2062:     if (subroutine->local_vars == NULL || subroutine->local_vars->head == NULL || subroutine->local_vars->tail == NULL) {
	cmpq	$0, 8(%rax)	 ;, _339->tail
	je	.L1394	 ;,
.L1393:
 ; ./asm_test/win/i/all.c:2066:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2066:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_457
	jne	.L1393	 ;,
 ; ./asm_test/win/i/all.c:2067:         fprintf(outfile, "local: [\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC314(%rip), %rcx	 ;, tmp593
	call	fwrite	 ;
.L1396:
 ; ./asm_test/win/i/all.c:2069:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	movq	24(%r13), %rcx	 ; subroutine_250->local_vars, subroutine_250->local_vars
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp759, var
 ; ./asm_test/win/i/all.c:2069:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	testq	%rax, %rax	 ; var
	je	.L1605	 ;,
 ; ./asm_test/win/i/all.c:2070:             output_var(var, outfile, indent + 2);
	movl	$4, %r8d	 ;,
	movq	%rbx, %rdx	 ; out_tac_file,
	call	output_var	 ;
	jmp	.L1396	 ;
.L1467:
	movl	$12, %esi	 ;, ivtmp_454
	jmp	.L1387	 ;
.L1390:
 ; ./asm_test/win/i/all.c:2058:             output_var(parameter, outfile, indent + 2);
	movl	$4, %r8d	 ;,
	movq	%rbx, %rdx	 ; out_tac_file,
	call	output_var	 ;
.L1389:
 ; ./asm_test/win/i/all.c:2057:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	movq	16(%r13), %rcx	 ; subroutine_250->parameters, subroutine_250->parameters
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp758, parameter
 ; ./asm_test/win/i/all.c:2057:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L1390	 ;,
	movl	$12, %esi	 ;, ivtmp_451
.L1391:
 ; ./asm_test/win/i/all.c:2059:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2059:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_451
	jne	.L1391	 ;,
 ; ./asm_test/win/i/all.c:2060:         fprintf(outfile, "]\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC300(%rip), %rcx	 ;, tmp591
	call	fwrite	 ;
	jmp	.L1388	 ;
.L1469:
	movl	$12, %esi	 ;, ivtmp_463
.L1394:
 ; ./asm_test/win/i/all.c:2063:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2063:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_463
	jne	.L1394	 ;,
 ; ./asm_test/win/i/all.c:2064:         fprintf(outfile, "local: []\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC313(%rip), %rcx	 ;, tmp592
	call	fwrite	 ;
.L1395:
 ; ./asm_test/win/i/all.c:2074:     if (subroutine->blocks == NULL || subroutine->blocks->head == NULL || subroutine->blocks->tail == NULL) {
	movq	32(%r13), %rax	 ; subroutine_250->blocks, _355
 ; ./asm_test/win/i/all.c:2074:     if (subroutine->blocks == NULL || subroutine->blocks->head == NULL || subroutine->blocks->tail == NULL) {
	testq	%rax, %rax	 ; _355
	je	.L1472	 ;,
 ; ./asm_test/win/i/all.c:2074:     if (subroutine->blocks == NULL || subroutine->blocks->head == NULL || subroutine->blocks->tail == NULL) {
	cmpq	$0, (%rax)	 ;, _355->head
	je	.L1473	 ;,
	movl	$12, %esi	 ;, ivtmp_466
 ; ./asm_test/win/i/all.c:2074:     if (subroutine->blocks == NULL || subroutine->blocks->head == NULL || subroutine->blocks->tail == NULL) {
	cmpq	$0, 8(%rax)	 ;, _355->tail
	je	.L1401	 ;,
.L1400:
 ; ./asm_test/win/i/all.c:2078:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2078:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_466
	jne	.L1400	 ;,
 ; ./asm_test/win/i/all.c:2079:         fprintf(outfile, "instructions: [\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC316(%rip), %rcx	 ;, tmp597
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2081:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	jmp	.L1403	 ;
.L1470:
	movl	$12, %esi	 ;, ivtmp_463
	jmp	.L1394	 ;
.L1605:
	movl	$12, %esi	 ;, ivtmp_460
.L1398:
 ; ./asm_test/win/i/all.c:2071:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2071:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_460
	jne	.L1398	 ;,
 ; ./asm_test/win/i/all.c:2072:         fprintf(outfile, "]\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC300(%rip), %rcx	 ;, tmp595
	call	fwrite	 ;
	jmp	.L1395	 ;
.L1472:
	movl	$12, %esi	 ;, ivtmp_797
.L1401:
 ; ./asm_test/win/i/all.c:2075:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2075:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_797
	jne	.L1401	 ;,
 ; ./asm_test/win/i/all.c:2076:         fprintf(outfile, "instructions: []\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC315(%rip), %rcx	 ;, tmp596
	call	fwrite	 ;
.L1402:
	movl	$8, %esi	 ;, ivtmp_306
.L1448:
 ; ./asm_test/win/i/all.c:2086:     for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2086:     for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_306
	jne	.L1448	 ;,
 ; ./asm_test/win/i/all.c:2087:     fprintf(outfile, "}\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC299(%rip), %rcx	 ;, tmp650
	call	fwrite	 ;
.L1378:
 ; ./asm_test/win/i/all.c:2022:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	movq	24(%r12), %rcx	 ; tac_156->subroutines, tac_156->subroutines
	call	list_pop	 ;
	movq	%rax, %r13	 ; tmp762, subroutine
 ; ./asm_test/win/i/all.c:2022:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	testq	%rax, %rax	 ; subroutine
	je	.L1606	 ;,
	movl	$8, %esi	 ;, ivtmp_436
 ; ./asm_test/win/i/all.c:2036:     if (subroutine->name == NULL) {
	cmpq	$0, 0(%r13)	 ;, subroutine_250->name
	je	.L1380	 ;,
.L1379:
 ; ./asm_test/win/i/all.c:2040:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2040:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_436
	jne	.L1379	 ;,
 ; ./asm_test/win/i/all.c:2041:         fprintf(outfile, "%s {\n", subroutine->name->name);
	movq	0(%r13), %rax	 ; subroutine_250->name, subroutine_250->name
	movq	8(%rax), %r8	 ; _310->name,
	leaq	.LC308(%rip), %rdx	 ;, tmp583
	movq	%rbx, %rcx	 ; out_tac_file,
	call	fprintf	 ;
.L1381:
	movl	$12, %esi	 ;, ivtmp_442
 ; ./asm_test/win/i/all.c:2043:     if (subroutine->return_type == NULL) {
	cmpq	$0, 8(%r13)	 ;, subroutine_250->return_type
	je	.L1383	 ;,
.L1382:
 ; ./asm_test/win/i/all.c:2047:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2047:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_442
	jne	.L1382	 ;,
 ; ./asm_test/win/i/all.c:2048:         fprintf(outfile, "return_type: %s\n", subroutine->return_type->name);
	movq	8(%r13), %rax	 ; subroutine_250->return_type, subroutine_250->return_type
	movq	8(%rax), %r8	 ; _321->name,
	leaq	.LC310(%rip), %rdx	 ;, tmp587
	movq	%rbx, %rcx	 ; out_tac_file,
	call	fprintf	 ;
.L1384:
 ; ./asm_test/win/i/all.c:2050:     if (subroutine->parameters == NULL || subroutine->parameters->head == NULL || subroutine->parameters->tail == NULL) {
	movq	16(%r13), %rax	 ; subroutine_250->parameters, _323
 ; ./asm_test/win/i/all.c:2050:     if (subroutine->parameters == NULL || subroutine->parameters->head == NULL || subroutine->parameters->tail == NULL) {
	testq	%rax, %rax	 ; _323
	je	.L1466	 ;,
 ; ./asm_test/win/i/all.c:2050:     if (subroutine->parameters == NULL || subroutine->parameters->head == NULL || subroutine->parameters->tail == NULL) {
	cmpq	$0, (%rax)	 ;, _323->head
	je	.L1467	 ;,
	movl	$12, %esi	 ;, ivtmp_448
 ; ./asm_test/win/i/all.c:2050:     if (subroutine->parameters == NULL || subroutine->parameters->head == NULL || subroutine->parameters->tail == NULL) {
	cmpq	$0, 8(%rax)	 ;, _323->tail
	je	.L1387	 ;,
.L1386:
 ; ./asm_test/win/i/all.c:2054:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2054:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_448
	jne	.L1386	 ;,
 ; ./asm_test/win/i/all.c:2055:         fprintf(outfile, "parameters: [\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC312(%rip), %rcx	 ;, tmp589
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2057:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	jmp	.L1389	 ;
.L1473:
	movl	$12, %esi	 ;, ivtmp_797
	jmp	.L1401	 ;
.L1405:
 ; ./asm_test/win/i/all.c:2113:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2113:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_472
	jne	.L1405	 ;,
 ; ./asm_test/win/i/all.c:2114:         fprintf(outfile, "NULL ");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC290(%rip), %rcx	 ;, tmp598
	call	fwrite	 ;
	jmp	.L1406	 ;
.L1407:
 ; ./asm_test/win/i/all.c:2120:         fprintf(outfile, "{}\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$3, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC293(%rip), %rcx	 ;, tmp602
	call	fwrite	 ;
.L1403:
 ; ./asm_test/win/i/all.c:2081:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	movq	32(%r13), %rcx	 ; subroutine_250->blocks, subroutine_250->blocks
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp761, block
 ; ./asm_test/win/i/all.c:2081:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	testq	%rax, %rax	 ; block
	je	.L1607	 ;,
	movl	$16, %esi	 ;, ivtmp_469
 ; ./asm_test/win/i/all.c:2112:     if (block->label == NULL) {
	cmpq	$0, (%rdi)	 ;, block_367->label
	je	.L1405	 ;,
.L1404:
 ; ./asm_test/win/i/all.c:2116:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2116:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_469
	jne	.L1404	 ;,
 ; ./asm_test/win/i/all.c:2117:         fprintf(outfile, "%s ", block->label->name);
	movq	(%rdi), %rax	 ; block_367->label, block_367->label
	movq	8(%rax), %r8	 ; _388->name,
	leaq	.LC291(%rip), %rdx	 ;,
	movq	%rbx, %rcx	 ; out_tac_file,
	call	fprintf	 ;
.L1406:
 ; ./asm_test/win/i/all.c:2119:     if (block->instructions == NULL || block->instructions->head == NULL || block->instructions->tail == NULL)
	movq	8(%rdi), %rax	 ; block_367->instructions, _390
 ; ./asm_test/win/i/all.c:2119:     if (block->instructions == NULL || block->instructions->head == NULL || block->instructions->tail == NULL)
	testq	%rax, %rax	 ; _390
	je	.L1407	 ;,
 ; ./asm_test/win/i/all.c:2119:     if (block->instructions == NULL || block->instructions->head == NULL || block->instructions->tail == NULL)
	cmpq	$0, (%rax)	 ;, _390->head
	je	.L1407	 ;,
 ; ./asm_test/win/i/all.c:2119:     if (block->instructions == NULL || block->instructions->head == NULL || block->instructions->tail == NULL)
	cmpq	$0, 8(%rax)	 ;, _390->tail
	je	.L1407	 ;,
 ; ./asm_test/win/i/all.c:2122:         fprintf(outfile, "{\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC294(%rip), %rcx	 ;, tmp603
	call	fwrite	 ;
	movl	$1, %r15d	 ;, tmp663
 ; ./asm_test/win/i/all.c:2124:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	jmp	.L1410	 ;
.L1477:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1438:
 ; ./asm_test/win/i/all.c:2167:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2167:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1438	 ;,
 ; ./asm_test/win/i/all.c:2168:             fprintf(outfile, "add\t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC317(%rip), %rcx	 ;, tmp610
	call	fwrite	 ;
.L1439:
 ; ./asm_test/win/i/all.c:2277:     output_arg(instruction->arg1, outfile);
	movq	(%rsi), %rcx	 ; instruction_394->arg1, instruction_394->arg1
	movq	%rbx, %rdx	 ; out_tac_file,
	call	output_arg	 ;
 ; ./asm_test/win/i/all.c:2278:     switch (instruction->type) {
	movl	24(%rsi), %ecx	 ; instruction_394->type, _486
 ; ./asm_test/win/i/all.c:2278:     switch (instruction->type) {
	cmpl	$24, %ecx	 ;, _486
	ja	.L1410	 ;,
	movq	%r15, %rax	 ; tmp663, _1084
	salq	%cl, %rax	 ; _486, _1084
	testl	$4825087, %eax	 ;, _1084
	jne	.L1441	 ;,
	testl	$25583616, %eax	 ;, _1084
	jne	.L1442	 ;,
	testl	$3145728, %eax	 ;, _1084
	jne	.L1443	 ;,
	jmp	.L1410	 ;
.L1478:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1437:
 ; ./asm_test/win/i/all.c:2171:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2171:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1437	 ;,
 ; ./asm_test/win/i/all.c:2172:             fprintf(outfile, "sub\t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC318(%rip), %rcx	 ;, tmp611
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2173:         } break;
	jmp	.L1439	 ;
.L1479:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1436:
 ; ./asm_test/win/i/all.c:2175:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2175:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1436	 ;,
 ; ./asm_test/win/i/all.c:2176:             fprintf(outfile, "mul\t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC319(%rip), %rcx	 ;, tmp612
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2177:         } break;
	jmp	.L1439	 ;
.L1480:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1435:
 ; ./asm_test/win/i/all.c:2179:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2179:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1435	 ;,
 ; ./asm_test/win/i/all.c:2180:             fprintf(outfile, "div\t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC320(%rip), %rcx	 ;, tmp613
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2181:         } break;
	jmp	.L1439	 ;
.L1481:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1434:
 ; ./asm_test/win/i/all.c:2183:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2183:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1434	 ;,
 ; ./asm_test/win/i/all.c:2184:             fprintf(outfile, "mod\t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC321(%rip), %rcx	 ;, tmp614
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2185:         } break;
	jmp	.L1439	 ;
.L1482:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1433:
 ; ./asm_test/win/i/all.c:2187:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2187:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1433	 ;,
 ; ./asm_test/win/i/all.c:2188:             fprintf(outfile, "eq \t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC322(%rip), %rcx	 ;, tmp615
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2189:         } break;
	jmp	.L1439	 ;
.L1483:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1432:
 ; ./asm_test/win/i/all.c:2191:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2191:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1432	 ;,
 ; ./asm_test/win/i/all.c:2192:             fprintf(outfile, "ne \t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC323(%rip), %rcx	 ;, tmp616
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2193:         } break;
	jmp	.L1439	 ;
.L1484:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1431:
 ; ./asm_test/win/i/all.c:2195:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2195:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1431	 ;,
 ; ./asm_test/win/i/all.c:2196:             fprintf(outfile, "lt \t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC324(%rip), %rcx	 ;, tmp617
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2197:         } break;
	jmp	.L1439	 ;
.L1485:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1430:
 ; ./asm_test/win/i/all.c:2199:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2199:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1430	 ;,
 ; ./asm_test/win/i/all.c:2200:             fprintf(outfile, "gt \t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC325(%rip), %rcx	 ;, tmp618
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2201:         } break;
	jmp	.L1439	 ;
.L1486:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1429:
 ; ./asm_test/win/i/all.c:2203:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2203:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1429	 ;,
 ; ./asm_test/win/i/all.c:2204:             fprintf(outfile, "le \t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC326(%rip), %rcx	 ;, tmp619
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2205:         } break;
	jmp	.L1439	 ;
.L1487:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1428:
 ; ./asm_test/win/i/all.c:2207:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2207:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1428	 ;,
 ; ./asm_test/win/i/all.c:2208:             fprintf(outfile, "ge \t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC327(%rip), %rcx	 ;, tmp620
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2209:         } break;
	jmp	.L1439	 ;
.L1488:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1427:
 ; ./asm_test/win/i/all.c:2211:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2211:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1427	 ;,
 ; ./asm_test/win/i/all.c:2212:             fprintf(outfile, "and\t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC328(%rip), %rcx	 ;, tmp621
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2213:         } break;
	jmp	.L1439	 ;
.L1489:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1426:
 ; ./asm_test/win/i/all.c:2215:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2215:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1426	 ;,
 ; ./asm_test/win/i/all.c:2216:             fprintf(outfile, "or \t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC329(%rip), %rcx	 ;, tmp622
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2217:         } break;
	jmp	.L1439	 ;
.L1490:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1425:
 ; ./asm_test/win/i/all.c:2219:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2219:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1425	 ;,
 ; ./asm_test/win/i/all.c:2220:             fprintf(outfile, "not\t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC330(%rip), %rcx	 ;, tmp623
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2221:         } break;
	jmp	.L1439	 ;
.L1491:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1424:
 ; ./asm_test/win/i/all.c:2223:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2223:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1424	 ;,
 ; ./asm_test/win/i/all.c:2224:             fprintf(outfile, "assign\t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC331(%rip), %rcx	 ;, tmp624
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2225:         } break;
	jmp	.L1439	 ;
.L1492:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1423:
 ; ./asm_test/win/i/all.c:2227:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2227:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1423	 ;,
 ; ./asm_test/win/i/all.c:2228:             fprintf(outfile, "get_attr\t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC332(%rip), %rcx	 ;, tmp625
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2229:         } break;
	jmp	.L1439	 ;
.L1493:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1422:
 ; ./asm_test/win/i/all.c:2231:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2231:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1422	 ;,
 ; ./asm_test/win/i/all.c:2232:             fprintf(outfile, "get_elem\t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC333(%rip), %rcx	 ;, tmp626
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2233:         } break;
	jmp	.L1439	 ;
.L1494:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1421:
 ; ./asm_test/win/i/all.c:2235:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2235:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1421	 ;,
 ; ./asm_test/win/i/all.c:2236:             fprintf(outfile, "param\t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC334(%rip), %rcx	 ;, tmp627
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2237:         } break;
	jmp	.L1439	 ;
.L1495:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1420:
 ; ./asm_test/win/i/all.c:2239:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2239:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1420	 ;,
 ; ./asm_test/win/i/all.c:2240:             fprintf(outfile, "alloc\t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC335(%rip), %rcx	 ;, tmp628
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2241:         } break;
	jmp	.L1439	 ;
.L1496:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1419:
 ; ./asm_test/win/i/all.c:2243:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2243:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1419	 ;,
 ; ./asm_test/win/i/all.c:2244:             fprintf(outfile, "jmp_c\t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC336(%rip), %rcx	 ;, tmp629
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2245:         } break;
	jmp	.L1439	 ;
.L1497:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1418:
 ; ./asm_test/win/i/all.c:2247:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2247:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1418	 ;,
 ; ./asm_test/win/i/all.c:2248:             fprintf(outfile, "jmp\t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC337(%rip), %rcx	 ;, tmp630
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2249:         } break;
	jmp	.L1439	 ;
.L1498:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1417:
 ; ./asm_test/win/i/all.c:2251:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2251:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1417	 ;,
 ; ./asm_test/win/i/all.c:2252:             fprintf(outfile, "ret\t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC338(%rip), %rcx	 ;, tmp631
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2253:         } break;
	jmp	.L1439	 ;
.L1499:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1416:
 ; ./asm_test/win/i/all.c:2255:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2255:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1416	 ;,
 ; ./asm_test/win/i/all.c:2256:             fprintf(outfile, "call\t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC339(%rip), %rcx	 ;, tmp632
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2257:         } break;
	jmp	.L1439	 ;
.L1500:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1415:
 ; ./asm_test/win/i/all.c:2259:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2259:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1415	 ;,
 ; ./asm_test/win/i/all.c:2260:             fprintf(outfile, "load\t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC340(%rip), %rcx	 ;, tmp633
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2261:         } break;
	jmp	.L1439	 ;
.L1501:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1414:
 ; ./asm_test/win/i/all.c:2263:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2263:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1414	 ;,
 ; ./asm_test/win/i/all.c:2264:             fprintf(outfile, "store\t");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC341(%rip), %rcx	 ;, tmp634
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2265:         } break;
	jmp	.L1439	 ;
.L1502:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %esi	 ;, ivtmp_475
.L1412:
 ; ./asm_test/win/i/all.c:2267:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2267:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_475
	jne	.L1412	 ;,
 ; ./asm_test/win/i/all.c:2268:             fprintf(outfile, "INST_NONE\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC342(%rip), %rcx	 ;, tmp635
	call	fwrite	 ;
 ; ./asm_test/win/i/all.c:2270:             return;
	jmp	.L1410	 ;
.L1476:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movq	$20, 56(%rsp)	 ;, %sfp
.L1411:
 ; ./asm_test/win/i/all.c:2272:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2272:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, 56(%rsp)	 ;, %sfp
	jne	.L1411	 ;,
 ; ./asm_test/win/i/all.c:2273:             fprintf(outfile, "unknown_InstructionType: %u\n", instruction->type);
	movl	24(%rsi), %r8d	 ; instruction_394->type,
	leaq	.LC343(%rip), %rdx	 ;, tmp637
	movq	%rbx, %rcx	 ; out_tac_file,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2275:             return;
	jmp	.L1410	 ;
.L1441:
 ; ./asm_test/win/i/all.c:2296:             fprintf(outfile, " ");
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	fputc	 ;
 ; ./asm_test/win/i/all.c:2297:             output_arg(instruction->arg2, outfile);
	movq	8(%rsi), %rcx	 ; instruction_394->arg2, instruction_394->arg2
	movq	%rbx, %rdx	 ; out_tac_file,
	call	output_arg	 ;
 ; ./asm_test/win/i/all.c:2298:             fprintf(outfile, " ");
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	fputc	 ;
 ; ./asm_test/win/i/all.c:2299:             output_arg(instruction->arg3, outfile);
	movq	16(%rsi), %rcx	 ; instruction_394->arg3, instruction_394->arg3
	movq	%rbx, %rdx	 ; out_tac_file,
	call	output_arg	 ;
.L1443:
 ; ./asm_test/win/i/all.c:2317:     fprintf(outfile, "\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$10, %ecx	 ;,
	call	fputc	 ;
.L1410:
 ; ./asm_test/win/i/all.c:2124:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	movq	8(%rdi), %rcx	 ; block_367->instructions, block_367->instructions
	call	list_pop	 ;
	movq	%rax, %rsi	 ; tmp760, instruction
 ; ./asm_test/win/i/all.c:2124:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	testq	%rax, %rax	 ; instruction
	je	.L1608	 ;,
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	cmpl	$25, 24(%rsi)	 ;, instruction_394->type
	ja	.L1476	 ;,
	movl	24(%rsi), %eax	 ; instruction_394->type, instruction_394->type
	movslq	(%r14,%rax,4), %rax	 ;, tmp607
	addq	%r14, %rax	 ; tmp667, tmp608
	jmp	*%rax	 ; tmp608
	.section .rdata,"dr"
	.align 4
.L1413:
	.long	.L1477-.L1413
	.long	.L1478-.L1413
	.long	.L1479-.L1413
	.long	.L1480-.L1413
	.long	.L1481-.L1413
	.long	.L1482-.L1413
	.long	.L1483-.L1413
	.long	.L1484-.L1413
	.long	.L1485-.L1413
	.long	.L1486-.L1413
	.long	.L1487-.L1413
	.long	.L1488-.L1413
	.long	.L1489-.L1413
	.long	.L1490-.L1413
	.long	.L1491-.L1413
	.long	.L1492-.L1413
	.long	.L1493-.L1413
	.long	.L1494-.L1413
	.long	.L1495-.L1413
	.long	.L1496-.L1413
	.long	.L1497-.L1413
	.long	.L1498-.L1413
	.long	.L1499-.L1413
	.long	.L1500-.L1413
	.long	.L1501-.L1413
	.long	.L1502-.L1413
	.text
.L1442:
 ; ./asm_test/win/i/all.c:2307:             fprintf(outfile, " ");
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	fputc	 ;
 ; ./asm_test/win/i/all.c:2308:             output_arg(instruction->arg2, outfile);
	movq	8(%rsi), %rcx	 ; instruction_394->arg2, instruction_394->arg2
	movq	%rbx, %rdx	 ; out_tac_file,
	call	output_arg	 ;
 ; ./asm_test/win/i/all.c:2309:             break;
	jmp	.L1443	 ;
.L1608:
	movl	$16, %esi	 ;, ivtmp_333
.L1445:
 ; ./asm_test/win/i/all.c:2126:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2126:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_333
	jne	.L1445	 ;,
 ; ./asm_test/win/i/all.c:2127:         fprintf(outfile, "}\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC299(%rip), %rcx	 ;, tmp647
	call	fwrite	 ;
	jmp	.L1403	 ;
.L1607:
	movl	$12, %esi	 ;, ivtmp_316
.L1447:
 ; ./asm_test/win/i/all.c:2083:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2083:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_316
	jne	.L1447	 ;,
 ; ./asm_test/win/i/all.c:2084:         fprintf(outfile, "]\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC300(%rip), %rcx	 ;, tmp649
	call	fwrite	 ;
	jmp	.L1402	 ;
.L1606:
	movl	$4, %esi	 ;, ivtmp_249
.L1450:
 ; ./asm_test/win/i/all.c:2024:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2024:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	subq	$1, %rsi	 ;, ivtmp_249
	jne	.L1450	 ;,
 ; ./asm_test/win/i/all.c:2025:         fprintf(outfile, "]\n");
	movq	%rbx, %r9	 ; out_tac_file,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC300(%rip), %rcx	 ;, tmp652
	call	fwrite	 ;
	jmp	.L1451	 ;
.lcomm id_counter.0,8,8
.lcomm builtin_scope,8,8
.lcomm name_void,8,8
.lcomm name_string,8,8
.lcomm name_int,8,8
.lcomm name_float,8,8
.lcomm name_bool,8,8
.lcomm all_string_list,8,8
.lcomm symbolList,240,32
.lcomm keywordList,176,32
.lcomm DEFAULT_INIT_NAME,8,8
.lcomm DEFAULT_CONSTRUCTOR_NAME,8,8
.lcomm struct_memory_used,8,8
.lcomm struct_memory_count,8,8
.lcomm string_memory_used,8,8
.lcomm string_memory_count,8,8
.lcomm memoryBlockCount,8,8
.lcomm struct_memory,8,8
.lcomm string_memory,8,8
	.section .rdata,"dr"
.LC344:
	.ascii "(\0"
.LC345:
	.ascii ")\0"
.LC346:
	.ascii "{\0"
.LC347:
	.ascii "}\0"
.LC348:
	.ascii ",\0"
.LC349:
	.ascii "!\0"
.LC350:
	.ascii "[\0"
.LC351:
	.ascii "]\0"
.LC352:
	.ascii ";\0"
.LC353:
	.ascii "_\0"
.LC354:
	.ascii "+\0"
.LC355:
	.ascii "-\0"
.LC356:
	.ascii "*\0"
.LC357:
	.ascii "%\0"
.LC358:
	.ascii "<\0"
.LC359:
	.ascii ">\0"
.LC360:
	.ascii "=\0"
.LC361:
	.ascii "==\0"
.LC362:
	.ascii "!=\0"
.LC363:
	.ascii "<=\0"
.LC364:
	.ascii ">=\0"
.LC365:
	.ascii "+=\0"
.LC366:
	.ascii "-=\0"
.LC367:
	.ascii "*=\0"
.LC368:
	.ascii "/=\0"
.LC369:
	.ascii "%=\0"
.LC370:
	.ascii "&&\0"
.LC371:
	.ascii "||\0"
	.align 32
symbolStrings:
	.quad	.LC344
	.quad	.LC345
	.quad	.LC346
	.quad	.LC347
	.quad	.LC348
	.quad	.LC349
	.quad	.LC108
	.quad	.LC350
	.quad	.LC351
	.quad	.LC352
	.quad	.LC353
	.quad	.LC354
	.quad	.LC355
	.quad	.LC356
	.quad	.LC106
	.quad	.LC357
	.quad	.LC358
	.quad	.LC359
	.quad	.LC360
	.quad	.LC361
	.quad	.LC362
	.quad	.LC363
	.quad	.LC364
	.quad	.LC365
	.quad	.LC366
	.quad	.LC367
	.quad	.LC368
	.quad	.LC369
	.quad	.LC370
	.quad	.LC371
.LC372:
	.ascii "import\0"
.LC373:
	.ascii "from\0"
.LC374:
	.ascii "func\0"
.LC375:
	.ascii "class\0"
.LC376:
	.ascii "method\0"
.LC377:
	.ascii "self\0"
.LC378:
	.ascii "if\0"
.LC379:
	.ascii "elif\0"
.LC380:
	.ascii "else\0"
.LC381:
	.ascii "while\0"
.LC382:
	.ascii "for\0"
.LC383:
	.ascii "return\0"
.LC384:
	.ascii "break\0"
.LC385:
	.ascii "continue\0"
.LC386:
	.ascii "int\0"
.LC387:
	.ascii "float\0"
.LC388:
	.ascii "string\0"
.LC389:
	.ascii "bool\0"
.LC390:
	.ascii "var\0"
	.align 32
keywordStrings:
	.quad	.LC372
	.quad	.LC373
	.quad	.LC374
	.quad	.LC375
	.quad	.LC376
	.quad	.LC377
	.quad	.LC378
	.quad	.LC379
	.quad	.LC380
	.quad	.LC381
	.quad	.LC382
	.quad	.LC77
	.quad	.LC78
	.quad	.LC383
	.quad	.LC384
	.quad	.LC385
	.quad	.LC386
	.quad	.LC387
	.quad	.LC388
	.quad	.LC389
	.quad	.LC143
	.quad	.LC390
.lcomm initialized,1,1
	.align 8
.LC112:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Rev6, Built by MSYS2 project) 13.2.0"
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	strncmp;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	getcwd;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
	.def	putc;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
