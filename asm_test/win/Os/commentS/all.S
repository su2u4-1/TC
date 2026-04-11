	.file	"all.c"
 ; GNU C17 (Rev6, Built by MSYS2 project) version 13.2.0 (x86_64-w64-mingw32)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.def	list_pop;	.scl	3;	.type	32;	.endef
list_pop:
 ; ./asm_test/win/i/all.c:1046:         return NULL;
	xorl	%eax, %eax	 ; <retval>
 ; ./asm_test/win/i/all.c:1045:     if (list == NULL || list->head == NULL)
	testq	%rcx, %rcx	 ; list
	je	.L1	 ;,
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
	jne	.L3	 ;,
 ; ./asm_test/win/i/all.c:1050:         list->tail = NULL;
	xorl	%edx, %edx	 ;
	movq	%rdx, 8(%rcx)	 ;, list_6(D)->tail
.L3:
 ; ./asm_test/win/i/all.c:1051:     return head_node->content;
	movq	8(%rax), %rax	 ; _1->content, <retval>
.L1:
 ; ./asm_test/win/i/all.c:1052: }
	ret	
	.def	list_pop_back;	.scl	3;	.type	32;	.endef
list_pop_back:
 ; ./asm_test/win/i/all.c:1055:         return NULL;
	xorl	%eax, %eax	 ; <retval>
 ; ./asm_test/win/i/all.c:1054:     if (list == NULL || list->head == NULL)
	testq	%rcx, %rcx	 ; list
	je	.L9	 ;,
 ; ./asm_test/win/i/all.c:1054:     if (list == NULL || list->head == NULL)
	movq	(%rcx), %rax	 ; list_8(D)->head, <retval>
 ; ./asm_test/win/i/all.c:1054:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	 ; <retval>
	je	.L9	 ;,
 ; ./asm_test/win/i/all.c:1056:     if (list->head == list->tail) {
	movq	8(%rcx), %r8	 ; list_8(D)->tail, _3
 ; ./asm_test/win/i/all.c:1056:     if (list->head == list->tail) {
	cmpq	%r8, %rax	 ; _3, <retval>
	jne	.L11	 ;,
 ; ./asm_test/win/i/all.c:1059:         list->tail = NULL;
	xorl	%r9d, %r9d	 ;
 ; ./asm_test/win/i/all.c:1057:         size_t* content = list->head->content;
	movq	8(%rax), %rax	 ; _1->content, <retval>
 ; ./asm_test/win/i/all.c:1059:         list->tail = NULL;
	movq	%r9, (%rcx)	 ;, list_8(D)->head
	movq	%r9, 8(%rcx)	 ;, list_8(D)->tail
 ; ./asm_test/win/i/all.c:1060:         return content;
	ret	
.L11:
	movq	%rax, %rdx	 ; <retval>, current
 ; ./asm_test/win/i/all.c:1063:     while (current->next != list->tail)
	movq	(%rax), %rax	 ; current_5->next, <retval>
 ; ./asm_test/win/i/all.c:1063:     while (current->next != list->tail)
	cmpq	%rax, %r8	 ; <retval>, _3
	jne	.L11	 ;,
 ; ./asm_test/win/i/all.c:1066:     current->next = NULL;
	xorl	%r8d, %r8d	 ;
 ; ./asm_test/win/i/all.c:1065:     size_t* content = list->tail->content;
	movq	8(%rax), %rax	 ; _3->content, <retval>
 ; ./asm_test/win/i/all.c:1066:     current->next = NULL;
	movq	%r8, (%rdx)	 ;, current_2->next
 ; ./asm_test/win/i/all.c:1067:     list->tail = current;
	movq	%rdx, 8(%rcx)	 ; current, list_8(D)->tail
.L9:
 ; ./asm_test/win/i/all.c:1069: }
	ret	
	.def	search_name;	.scl	3;	.type	32;	.endef
search_name:
.L19:
 ; ./asm_test/win/i/all.c:1132:     while (scope != NULL) {
	testq	%rcx, %rcx	 ; scope
	je	.L25	 ;,
 ; ./asm_test/win/i/all.c:1134:         Node* current = names->head;
	movq	8(%rcx), %rax	 ; scope_2->symbols, scope_2->symbols
.L24:
 ; ./asm_test/win/i/all.c:1139:             current = current->next;
	movq	(%rax), %rax	 ;* current, current
 ; ./asm_test/win/i/all.c:1135:         while (current != NULL) {
	testq	%rax, %rax	 ; current
	je	.L26	 ;,
 ; ./asm_test/win/i/all.c:1136:             Symbol* current_name = (Symbol*)current->content;
	movq	8(%rax), %r8	 ; current_3->content, <retval>
 ; ./asm_test/win/i/all.c:1137:             if (current_name->name == name)
	cmpq	%rdx, 8(%r8)	 ; name, current_name_11->name
	jne	.L24	 ;,
	jmp	.L18	 ;
.L26:
 ; ./asm_test/win/i/all.c:1141:         scope = scope->parent;
	movq	(%rcx), %rcx	 ; scope_2->parent, scope
	jmp	.L19	 ;
.L25:
 ; ./asm_test/win/i/all.c:1143:     return NULL;
	xorl	%r8d, %r8d	 ; <retval>
.L18:
 ; ./asm_test/win/i/all.c:1144: }
	movq	%r8, %rax	 ; <retval>,
	ret	
	.def	get_current_char;	.scl	3;	.type	32;	.endef
get_current_char:
 ; ./asm_test/win/i/all.c:1299:     if (lexer->position >= lexer->length)
	movq	16(%rcx), %rax	 ; lexer_11(D)->position, _1
 ; ./asm_test/win/i/all.c:1300:         return '\0';
	xorl	%edx, %edx	 ; <retval>
 ; ./asm_test/win/i/all.c:1299:     if (lexer->position >= lexer->length)
	cmpq	24(%rcx), %rax	 ; lexer_11(D)->length, _1
	jnb	.L27	 ;,
 ; ./asm_test/win/i/all.c:1302:     return lexer->source[lexer->position++];
	movq	8(%rcx), %rdx	 ; lexer_11(D)->source, _5
 ; ./asm_test/win/i/all.c:1302:     return lexer->source[lexer->position++];
	leaq	1(%rax), %r8	 ;, tmp91
 ; ./asm_test/win/i/all.c:1301:     lexer->column++;
	incq	40(%rcx)	 ; lexer_11(D)->column
 ; ./asm_test/win/i/all.c:1302:     return lexer->source[lexer->position++];
	movq	%r8, 16(%rcx)	 ; tmp91, lexer_11(D)->position
 ; ./asm_test/win/i/all.c:1302:     return lexer->source[lexer->position++];
	movb	(%rdx,%rax), %dl	 ; *_7, <retval>
.L27:
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
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	movl	$1, %eax	 ;, tmp110
 ; ./asm_test/win/i/all.c:1145: void indention(FILE* out, size_t indent, char is_last, char indent_has_next[32]) {
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%r9, %r12	 ; tmp138, indent_has_next
	pushq	%rbp	 ;
	movl	%r8d, %ebp	 ; tmp137, is_last
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	movq	%rdx, %r8	 ; indent, tmp107
 ; ./asm_test/win/i/all.c:1145: void indention(FILE* out, size_t indent, char is_last, char indent_has_next[32]) {
	pushq	%rdi	 ;
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	shrq	$3, %r8	 ;, tmp107
 ; ./asm_test/win/i/all.c:1145: void indention(FILE* out, size_t indent, char is_last, char indent_has_next[32]) {
	movq	%rcx, %rdi	 ; tmp135, out
	pushq	%rsi	 ;
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	addq	%r9, %r8	 ; indent_has_next, _44
 ; ./asm_test/win/i/all.c:1145: void indention(FILE* out, size_t indent, char is_last, char indent_has_next[32]) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp136, indent
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	movl	%ebx, %ecx	 ; indent, tmp108
	andl	$7, %ecx	 ;, tmp108
 ; ./asm_test/win/i/all.c:1145: void indention(FILE* out, size_t indent, char is_last, char indent_has_next[32]) {
	subq	$32, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	sall	%cl, %eax	 ; tmp108, tmp109
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	movb	(%r8), %dl	 ; *_44, pretmp_45
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	testb	%bpl, %bpl	 ; is_last
	jne	.L31	 ;,
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	orl	%eax, %edx	 ; tmp109, iftmp.86_27
	jmp	.L32	 ;
.L31:
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	notl	%eax	 ; tmp111
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	andl	%eax, %edx	 ; tmp111, iftmp.86_27
.L32:
 ; ./asm_test/win/i/all.c:1146:     indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
	movb	%dl, (%r8)	 ; iftmp.86_27, *_44
 ; ./asm_test/win/i/all.c:1147:     for (size_t i = 1; i < indent; ++i)
	movl	$1, %esi	 ;, i
 ; ./asm_test/win/i/all.c:1148:         fprintf(out, (indent_has_next[i / 8] & (1 << (i % 8))) != 0 ? "│   " : "    ");
	leaq	.LC1(%rip), %r13	 ;, tmp133
	leaq	.LC0(%rip), %r14	 ;, tmp134
.L33:
 ; ./asm_test/win/i/all.c:1147:     for (size_t i = 1; i < indent; ++i)
	cmpq	%rbx, %rsi	 ; indent, i
	jnb	.L41	 ;,
 ; ./asm_test/win/i/all.c:1148:         fprintf(out, (indent_has_next[i / 8] & (1 << (i % 8))) != 0 ? "│   " : "    ");
	movq	%rsi, %rax	 ; i, tmp112
 ; ./asm_test/win/i/all.c:1148:         fprintf(out, (indent_has_next[i / 8] & (1 << (i % 8))) != 0 ? "│   " : "    ");
	movl	%esi, %ecx	 ; i, tmp114
 ; ./asm_test/win/i/all.c:1148:         fprintf(out, (indent_has_next[i / 8] & (1 << (i % 8))) != 0 ? "│   " : "    ");
	movq	%r14, %rdx	 ; tmp134, iftmp.87_28
 ; ./asm_test/win/i/all.c:1148:         fprintf(out, (indent_has_next[i / 8] & (1 << (i % 8))) != 0 ? "│   " : "    ");
	shrq	$3, %rax	 ;, tmp112
 ; ./asm_test/win/i/all.c:1148:         fprintf(out, (indent_has_next[i / 8] & (1 << (i % 8))) != 0 ? "│   " : "    ");
	andl	$7, %ecx	 ;, tmp114
 ; ./asm_test/win/i/all.c:1148:         fprintf(out, (indent_has_next[i / 8] & (1 << (i % 8))) != 0 ? "│   " : "    ");
	movsbl	(%r12,%rax), %eax	 ; *_19, *_19
 ; ./asm_test/win/i/all.c:1148:         fprintf(out, (indent_has_next[i / 8] & (1 << (i % 8))) != 0 ? "│   " : "    ");
	sarl	%cl, %eax	 ; tmp114, tmp115
 ; ./asm_test/win/i/all.c:1148:         fprintf(out, (indent_has_next[i / 8] & (1 << (i % 8))) != 0 ? "│   " : "    ");
	movq	%rdi, %rcx	 ; out,
 ; ./asm_test/win/i/all.c:1148:         fprintf(out, (indent_has_next[i / 8] & (1 << (i % 8))) != 0 ? "│   " : "    ");
	testb	$1, %al	 ;, tmp115
	cmove	%r13, %rdx	 ; tmp133,, iftmp.87_28
 ; ./asm_test/win/i/all.c:1147:     for (size_t i = 1; i < indent; ++i)
	incq	%rsi	 ; i
 ; ./asm_test/win/i/all.c:1148:         fprintf(out, (indent_has_next[i / 8] & (1 << (i % 8))) != 0 ? "│   " : "    ");
	call	fprintf	 ;
	jmp	.L33	 ;
.L41:
 ; ./asm_test/win/i/all.c:1149:     if (indent > 0)
	testq	%rbx, %rbx	 ; indent
	je	.L30	 ;,
 ; ./asm_test/win/i/all.c:1150:         fprintf(out, is_last ? "└── " : "├── ");
	testb	%bpl, %bpl	 ; is_last
	leaq	.LC3(%rip), %rdx	 ;, tmp129
	leaq	.LC2(%rip), %rax	 ;, tmp130
 ; ./asm_test/win/i/all.c:1150:         fprintf(out, is_last ? "└── " : "├── ");
	movq	%rdi, %rcx	 ; out,
 ; ./asm_test/win/i/all.c:1150:         fprintf(out, is_last ? "└── " : "├── ");
	cmovne	%rax, %rdx	 ; tmp129,, tmp130, iftmp.88_29
 ; ./asm_test/win/i/all.c:1151: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; ./asm_test/win/i/all.c:1150:         fprintf(out, is_last ? "└── " : "├── ");
	jmp	fprintf	 ;
.L30:
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
.LC4:
	.ascii "[Warning] Unsupported type for size lookup: %s\12\0"
	.text
	.def	get_type_size;	.scl	3;	.type	32;	.endef
get_type_size:
 ; ./asm_test/win/i/all.c:3153:         result = 0;
	xorl	%eax, %eax	 ; <retval>
 ; ./asm_test/win/i/all.c:3152:     if (type == NULL)
	testq	%rcx, %rcx	 ; type
	je	.L50	 ;,
 ; ./asm_test/win/i/all.c:3154:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, name_int(%rip)	 ; type, name_int
	je	.L51	 ;,
 ; ./asm_test/win/i/all.c:3154:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, name_float(%rip)	 ; type, name_float
	je	.L51	 ;,
 ; ./asm_test/win/i/all.c:3154:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, name_string(%rip)	 ; type, name_string
	je	.L51	 ;,
 ; ./asm_test/win/i/all.c:3156:     else if (type == name_bool || type == name_void)
	cmpq	%rcx, name_bool(%rip)	 ; type, name_bool
 ; ./asm_test/win/i/all.c:3157:         result = 1;
	movl	$1, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:3156:     else if (type == name_bool || type == name_void)
	je	.L50	 ;,
 ; ./asm_test/win/i/all.c:3156:     else if (type == name_bool || type == name_void)
	cmpq	%rcx, name_void(%rip)	 ; type, name_void
	je	.L50	 ;,
 ; ./asm_test/win/i/all.c:3158:     else if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rcx)	 ;, type_13(D)->kind
	jne	.L45	 ;,
 ; ./asm_test/win/i/all.c:3159:         result = type->ast_node.class->size;
	movq	24(%rcx), %rax	 ; type_13(D)->ast_node.class, type_13(D)->ast_node.class
	movq	24(%rax), %rax	 ; _7->size, <retval>
	ret	
.L45:
 ; ./asm_test/win/i/all.c:3150: size_t get_type_size(Symbol* type) {
	subq	$56, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3161:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	movq	8(%rcx), %r8	 ; type_13(D)->name, _8
	movl	$2, %ecx	 ;,
	movq	%r8, 40(%rsp)	 ; _8, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3161:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	movq	40(%rsp), %r8	 ; %sfp, _8
	leaq	.LC4(%rip), %rdx	 ;, tmp95
 ; ./asm_test/win/i/all.c:3161:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	movq	%rax, %rcx	 ; tmp98, _9
 ; ./asm_test/win/i/all.c:3161:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3155:         result = 8;
	movl	$8, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:3163: }
	addq	$56, %rsp	 ;,
	ret	
.L51:
 ; ./asm_test/win/i/all.c:3155:         result = 8;
	movl	$8, %eax	 ;, <retval>
	ret	
.L50:
 ; ./asm_test/win/i/all.c:3163: }
	ret	
	.section .rdata,"dr"
.LC5:
	.ascii "Name: \"NULL\"\12\0"
.LC6:
	.ascii "name: \"%s\"\12\0"
.LC7:
	.ascii "id: %zu\12\0"
.LC8:
	.ascii "kind: \"type\"\12\0"
.LC9:
	.ascii "kind: \"variable\"\12\0"
.LC10:
	.ascii "type\12\0"
.LC11:
	.ascii "kind: \"function\"\12\0"
.LC12:
	.ascii "return_type\12\0"
.LC13:
	.ascii "kind: \"method\"\12\0"
.LC14:
	.ascii "kind: \"class\"\12\0"
.LC15:
	.ascii "kind: \"attribute\"\12\0"
.LC16:
	.ascii "kind: \"parameter\"\12\0"
.LC17:
	.ascii "kind: \"unknown_NameType\"\12\0"
	.text
	.def	output_name;	.scl	3;	.type	32;	.endef
output_name:
	pushq	%r15	 ;
 ; ./asm_test/win/i/all.c:1925:     fprintf(outfile, "id: %zu\n", name->id);
	leaq	.LC7(%rip), %r15	 ;, tmp116
 ; ./asm_test/win/i/all.c:1916: void output_name(Symbol* name, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%r14	 ;
 ; ./asm_test/win/i/all.c:1923:     fprintf(outfile, "name: \"%s\"\n", name->name);
	leaq	.LC6(%rip), %r14	 ;, tmp115
 ; ./asm_test/win/i/all.c:1916: void output_name(Symbol* name, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%r13	 ;
 ; ./asm_test/win/i/all.c:1926:     switch (name->kind) {
	leaq	.L58(%rip), %r13	 ;, tmp117
 ; ./asm_test/win/i/all.c:1916: void output_name(Symbol* name, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%r12	 ;
	leaq	1(%r8), %r12	 ;, ivtmp.270
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp118, name
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp121, indent_has_next
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp119, outfile
	subq	$40, %rsp	 ;,
.L54:
	leaq	-1(%r12), %rbp	 ;, indent
 ; ./asm_test/win/i/all.c:1918:         indention(outfile, indent, 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
 ; ./asm_test/win/i/all.c:1917:     if (name == NULL) {
	testq	%rdi, %rdi	 ; name
	jne	.L55	 ;,
 ; ./asm_test/win/i/all.c:1918:         indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1919:         fprintf(outfile, "Name: \"NULL\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC5(%rip), %rcx	 ;, tmp91
	jmp	.L70	 ;
.L55:
 ; ./asm_test/win/i/all.c:1922:     indention(outfile, indent, 0, indent_has_next);
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1923:     fprintf(outfile, "name: \"%s\"\n", name->name);
	movq	8(%rdi), %r8	 ; name_15->name,
	movq	%r14, %rdx	 ; tmp115,
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1924:     indention(outfile, indent, 0, indent_has_next);
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1925:     fprintf(outfile, "id: %zu\n", name->id);
	movq	16(%rdi), %r8	 ; name_15->id,
	movq	%r15, %rdx	 ; tmp116,
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1926:     switch (name->kind) {
	cmpl	$6, 32(%rdi)	 ;, name_15->kind
	ja	.L56	 ;,
	movl	32(%rdi), %eax	 ; name_15->kind, name_15->kind
 ; ./asm_test/win/i/all.c:1928:             indention(outfile, indent, 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
 ; ./asm_test/win/i/all.c:1926:     switch (name->kind) {
	movslq	0(%r13,%rax,4), %rax	 ;, tmp99
	addq	%r13, %rax	 ; tmp117, tmp100
	jmp	*%rax	 ; tmp100
	.section .rdata,"dr"
	.align 4
.L58:
	.long	.L64-.L58
	.long	.L63-.L58
	.long	.L62-.L58
	.long	.L61-.L58
	.long	.L60-.L58
	.long	.L59-.L58
	.long	.L57-.L58
	.text
.L57:
 ; ./asm_test/win/i/all.c:1928:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1929:             fprintf(outfile, "kind: \"type\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC8(%rip), %rcx	 ;, tmp102
	jmp	.L70	 ;
.L61:
 ; ./asm_test/win/i/all.c:1932:             indention(outfile, indent, 0, indent_has_next);
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1933:             fprintf(outfile, "kind: \"variable\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC9(%rip), %rcx	 ;, tmp103
	jmp	.L68	 ;
.L63:
 ; ./asm_test/win/i/all.c:1939:             indention(outfile, indent, 0, indent_has_next);
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1940:             fprintf(outfile, "kind: \"function\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC11(%rip), %rcx	 ;, tmp105
	jmp	.L69	 ;
.L62:
 ; ./asm_test/win/i/all.c:1946:             indention(outfile, indent, 0, indent_has_next);
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1947:             fprintf(outfile, "kind: \"method\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC13(%rip), %rcx	 ;, tmp107
.L69:
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1948:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1949:             fprintf(outfile, "return_type\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC12(%rip), %rcx	 ;, tmp108
	jmp	.L67	 ;
.L64:
 ; ./asm_test/win/i/all.c:1953:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1954:             fprintf(outfile, "kind: \"class\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC14(%rip), %rcx	 ;, tmp109
	jmp	.L70	 ;
.L59:
 ; ./asm_test/win/i/all.c:1957:             indention(outfile, indent, 0, indent_has_next);
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1958:             fprintf(outfile, "kind: \"attribute\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC15(%rip), %rcx	 ;, tmp110
.L68:
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1959:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1960:             fprintf(outfile, "type\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC10(%rip), %rcx	 ;, tmp111
.L67:
	call	fputs	 ;
	incq	%r12	 ; ivtmp.270
 ; ./asm_test/win/i/all.c:1961:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	(%rdi), %rdi	 ; name_15->type, name
	jmp	.L54	 ;
.L60:
 ; ./asm_test/win/i/all.c:1964:             indention(outfile, indent, 0, indent_has_next);
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1965:             fprintf(outfile, "kind: \"parameter\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC16(%rip), %rcx	 ;, tmp112
	jmp	.L68	 ;
.L56:
 ; ./asm_test/win/i/all.c:1971:             indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1972:             fprintf(outfile, "kind: \"unknown_NameType\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC17(%rip), %rcx	 ;, tmp114
.L70:
 ; ./asm_test/win/i/all.c:1975: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; ./asm_test/win/i/all.c:1972:             fprintf(outfile, "kind: \"unknown_NameType\"\n");
	jmp	fputs	 ;
	.section .rdata,"dr"
.LC18:
	.ascii "true\0"
.LC19:
	.ascii "false\0"
.LC20:
	.ascii "\"NULL\"\0"
.LC21:
	.ascii "%s(%s)\0"
.LC22:
	.ascii "%lld\0"
.LC23:
	.ascii "%f\0"
.LC24:
	.ascii "\"%s\"\0"
.LC25:
	.ascii "void\0"
.LC26:
	.ascii "NONE\0"
.LC27:
	.ascii "unknown_ArgType: %u\0"
	.text
	.def	output_arg;	.scl	3;	.type	32;	.endef
output_arg:
 ; ./asm_test/win/i/all.c:2130: void output_arg(Arg* arg, FILE* outfile) {
	movq	%rcx, %rax	 ; tmp127, arg
	movq	%rdx, %rcx	 ; tmp128, outfile
 ; ./asm_test/win/i/all.c:2131:     if (arg == NULL) {
	testq	%rax, %rax	 ; arg
	jne	.L72	 ;,
 ; ./asm_test/win/i/all.c:2132:         fprintf(outfile, "\"NULL\"");
	leaq	.LC20(%rip), %rcx	 ;, tmp100
	jmp	.L88	 ;
.L72:
 ; ./asm_test/win/i/all.c:2135:     switch (arg->kind) {
	movl	16(%rax), %r8d	 ; arg_20(D)->kind,
 ; ./asm_test/win/i/all.c:2135:     switch (arg->kind) {
	cmpl	$9, %r8d	 ;, _1
	ja	.L73	 ;,
	leaq	.L75(%rip), %r9	 ;, tmp102
	movslq	(%r9,%r8,4), %rdx	 ;, tmp104
	addq	%r9, %rdx	 ; tmp102, tmp105
	jmp	*%rdx	 ; tmp105
	.section .rdata,"dr"
	.align 4
.L75:
	.long	.L76-.L75
	.long	.L82-.L75
	.long	.L81-.L75
	.long	.L80-.L75
	.long	.L79-.L75
	.long	.L78-.L75
	.long	.L77-.L75
	.long	.L76-.L75
	.long	.L76-.L75
	.long	.L74-.L75
	.text
.L76:
 ; ./asm_test/win/i/all.c:2150:             if (arg->value.subroutine->original_name)
	movq	(%rax), %rdx	 ;* arg, _13
 ; ./asm_test/win/i/all.c:2150:             if (arg->value.subroutine->original_name)
	movq	(%rdx), %rax	 ;* _13, _14
 ; ./asm_test/win/i/all.c:2138:                 fprintf(outfile, "%s(%s)", arg->value.variable->name, arg->value.variable->original_name->name);
	movq	8(%rdx), %r8	 ;, pretmp_39
 ; ./asm_test/win/i/all.c:2150:             if (arg->value.subroutine->original_name)
	testq	%rax, %rax	 ; _14
	jne	.L93	 ;,
 ; ./asm_test/win/i/all.c:2140:                 fprintf(outfile, "%s", arg->value.variable->name);
	movq	%rcx, %rdx	 ; outfile,
	movq	%r8, %rcx	 ; pretmp_38,
.L88:
	jmp	fputs	 ;
.L82:
 ; ./asm_test/win/i/all.c:2142:         case ARG_INT: fprintf(outfile, "%lld", arg->value.int_value); break;
	movq	(%rax), %r8	 ; arg_20(D)->value.int_value,
	leaq	.LC22(%rip), %rdx	 ;, tmp109
	jmp	.L90	 ;
.L81:
 ; ./asm_test/win/i/all.c:2143:         case ARG_FLOAT: fprintf(outfile, "%f", arg->value.float_value); break;
	movq	(%rax), %r8	 ; arg_20(D)->value.float_value, arg_20(D)->value.float_value
	leaq	.LC23(%rip), %rdx	 ;, tmp112
	movq	%r8, %xmm2	 ; arg_20(D)->value.float_value,
	jmp	fprintf	 ;
.L80:
 ; ./asm_test/win/i/all.c:2144:         case ARG_STRING: fprintf(outfile, "\"%s\"", arg->value.string_value); break;
	movq	(%rax), %r8	 ; arg_20(D)->value.string_value,
	leaq	.LC24(%rip), %rdx	 ;, tmp113
.L90:
	jmp	fprintf	 ;
.L79:
 ; ./asm_test/win/i/all.c:2145:         case ARG_BOOL: fprintf(outfile, "%s", arg->value.bool_value ? "true" : "false"); break;
	cmpb	$0, (%rax)	 ;, arg_20(D)->value.bool_value
	leaq	.LC18(%rip), %rdx	 ;, tmp126
	leaq	.LC19(%rip), %rax	 ;, tmp125
	cmovne	%rdx, %rax	 ; tmp125,, tmp126, iftmp.110_18
	jmp	.L91	 ;
.L78:
 ; ./asm_test/win/i/all.c:2146:         case ARG_VOID: fprintf(outfile, "void"); break;
	movq	%rcx, %rdx	 ; outfile,
	leaq	.LC25(%rip), %rcx	 ;, tmp114
	jmp	.L88	 ;
.L77:
 ; ./asm_test/win/i/all.c:2147:         case ARG_LABEL: fprintf(outfile, "%s", arg->value.label->name); break;
	movq	(%rax), %rax	 ; arg_20(D)->value.label, arg_20(D)->value.label
	movq	8(%rax), %rax	 ; _11->name, _11->name
.L91:
	movq	%rcx, %rdx	 ; outfile,
	movq	%rax, %rcx	 ; _11->name,
	jmp	.L88	 ;
.L93:
 ; ./asm_test/win/i/all.c:2151:                 fprintf(outfile, "%s(%s)", arg->value.subroutine->name, arg->value.subroutine->original_name->name);
	movq	8(%rax), %r9	 ;,
	leaq	.LC21(%rip), %rdx	 ;, tmp118
	jmp	fprintf	 ;
.L74:
 ; ./asm_test/win/i/all.c:2155:         case ARG_NONE: fprintf(outfile, "NONE"); break;
	movq	%rcx, %rdx	 ; outfile,
	leaq	.LC26(%rip), %rcx	 ;, tmp119
	jmp	.L88	 ;
.L73:
 ; ./asm_test/win/i/all.c:2156:         default: fprintf(outfile, "unknown_ArgType: %u", arg->kind); break;
	leaq	.LC27(%rip), %rdx	 ;, tmp120
	jmp	fprintf	 ;
	.section .rdata,"dr"
.LC28:
	.ascii "Fatal: Cannot allocate memory\12\0"
	.text
	.def	increase_memory_size;	.scl	3;	.type	32;	.endef
increase_memory_size:
	pushq	%rsi	 ;
	movl	%ecx, %esi	 ; tmp109, for_struct
 ; ./asm_test/win/i/all.c:530:     MemoryBlock* new_block = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movl	$32, %ecx	 ;,
 ; ./asm_test/win/i/all.c:529: void increase_memory_size(char for_struct) {
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:530:     MemoryBlock* new_block = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	call	malloc	 ;
 ; ./asm_test/win/i/all.c:531:     if (new_block == NULL) {
	testq	%rax, %rax	 ; tmp102
	jne	.L95	 ;,
 ; ./asm_test/win/i/all.c:532:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:532:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	leaq	.LC28(%rip), %rcx	 ;, tmp104
 ; ./asm_test/win/i/all.c:532:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movq	%rax, %rdx	 ; tmp111, _1
 ; ./asm_test/win/i/all.c:532:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:533:         MemoryBlock* current = string_memory;
	movq	string_memory(%rip), %rbx	 ; string_memory, current
.L96:
 ; ./asm_test/win/i/all.c:534:         while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	je	.L101	 ;,
 ; ./asm_test/win/i/all.c:536:             free(current->block);
	movq	24(%rbx), %rcx	 ; current_16->block, current_16->block
 ; ./asm_test/win/i/all.c:535:             MemoryBlock* next = current->next;
	movq	16(%rbx), %rsi	 ; current_16->next, next
 ; ./asm_test/win/i/all.c:536:             free(current->block);
	call	free	 ;
 ; ./asm_test/win/i/all.c:537:             free(current);
	movq	%rbx, %rcx	 ; current,
 ; ./asm_test/win/i/all.c:538:             current = next;
	movq	%rsi, %rbx	 ; next, current
 ; ./asm_test/win/i/all.c:537:             free(current);
	call	free	 ;
	jmp	.L96	 ;
.L101:
 ; ./asm_test/win/i/all.c:541:         exit(1);
	movl	$1, %ecx	 ;,
 ; ./asm_test/win/i/all.c:540:         initialized = 0;
	movb	$0, initialized(%rip)	 ;, initialized
 ; ./asm_test/win/i/all.c:541:         exit(1);
	call	exit	 ;
.L95:
 ; ./asm_test/win/i/all.c:543:     new_block->block = (size_t*)malloc(1024);
	movl	$1024, %ecx	 ;,
	movq	%rax, %rbx	 ; tmp110, tmp102
	call	malloc	 ;
 ; ./asm_test/win/i/all.c:544:     new_block->size = 1024;
	movq	$1024, (%rbx)	 ;, new_block_21->size
 ; ./asm_test/win/i/all.c:543:     new_block->block = (size_t*)malloc(1024);
	movq	%rax, 24(%rbx)	 ; tmp112, new_block_21->block
 ; ./asm_test/win/i/all.c:546:     new_block->next = NULL;
	xorl	%eax, %eax	 ;
	movq	%rax, 8(%rbx)	 ;, new_block_21->used
	movq	%rax, 16(%rbx)	 ;, new_block_21->next
 ; ./asm_test/win/i/all.c:547:     if (for_struct) {
	testb	%sil, %sil	 ; for_struct
	je	.L98	 ;,
 ; ./asm_test/win/i/all.c:548:         struct_memory_used += struct_memory->used;
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory.13_4
 ; ./asm_test/win/i/all.c:551:         struct_memory_count += 1024;
	addq	$1024, struct_memory_count(%rip)	 ;, struct_memory_count
 ; ./asm_test/win/i/all.c:550:         struct_memory = new_block;
	movq	%rbx, struct_memory(%rip)	 ; tmp102, struct_memory
 ; ./asm_test/win/i/all.c:548:         struct_memory_used += struct_memory->used;
	movq	8(%rax), %rdx	 ; struct_memory.13_4->used, struct_memory.13_4->used
 ; ./asm_test/win/i/all.c:549:         new_block->next = struct_memory;
	movq	%rax, 16(%rbx)	 ; struct_memory.13_4, new_block_21->next
 ; ./asm_test/win/i/all.c:548:         struct_memory_used += struct_memory->used;
	addq	%rdx, struct_memory_used(%rip)	 ; struct_memory.13_4->used, struct_memory_used
	jmp	.L94	 ;
.L98:
 ; ./asm_test/win/i/all.c:553:         string_memory_used += string_memory->used;
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory.17_10
 ; ./asm_test/win/i/all.c:556:         string_memory_count += 1024;
	addq	$1024, string_memory_count(%rip)	 ;, string_memory_count
 ; ./asm_test/win/i/all.c:555:         string_memory = new_block;
	movq	%rbx, string_memory(%rip)	 ; tmp102, string_memory
 ; ./asm_test/win/i/all.c:553:         string_memory_used += string_memory->used;
	movq	8(%rax), %rdx	 ; string_memory.17_10->used, string_memory.17_10->used
	addq	%rdx, string_memory_used(%rip)	 ; string_memory.17_10->used, string_memory_used
 ; ./asm_test/win/i/all.c:554:         new_block->next = string_memory;
	movq	%rax, 16(%rbx)	 ; string_memory.17_10, new_block_21->next
.L94:
 ; ./asm_test/win/i/all.c:558: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.def	search_name_use_strcmp;	.scl	3;	.type	32;	.endef
search_name_use_strcmp:
	pushq	%rbp	 ;
	movq	%rdx, %rbp	 ; tmp94, name
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp93, scope
	subq	$40, %rsp	 ;,
.L103:
 ; ./asm_test/win/i/all.c:1118:     while (scope != NULL) {
	testq	%rbx, %rbx	 ; scope
	je	.L112	 ;,
 ; ./asm_test/win/i/all.c:1120:         Node* current = names->head;
	movq	8(%rbx), %rax	 ; scope_3->symbols, scope_3->symbols
	movq	(%rax), %rsi	 ; names_9->head, current
.L104:
 ; ./asm_test/win/i/all.c:1121:         while (current != NULL) {
	testq	%rsi, %rsi	 ; current
	je	.L113	 ;,
 ; ./asm_test/win/i/all.c:1122:             Symbol* current_name = (Symbol*)current->content;
	movq	8(%rsi), %rdi	 ; current_4->content, <retval>
 ; ./asm_test/win/i/all.c:1123:             if (strcmp(current_name->name, name) == 0)
	movq	%rbp, %rdx	 ; name,
	movq	8(%rdi), %rcx	 ; current_name_12->name, current_name_12->name
	call	strcmp	 ;
 ; ./asm_test/win/i/all.c:1123:             if (strcmp(current_name->name, name) == 0)
	testl	%eax, %eax	 ; tmp95
	je	.L102	 ;,
 ; ./asm_test/win/i/all.c:1125:             current = current->next;
	movq	(%rsi), %rsi	 ; current_4->next, current
	jmp	.L104	 ;
.L113:
 ; ./asm_test/win/i/all.c:1127:         scope = scope->parent;
	movq	(%rbx), %rbx	 ; scope_3->parent, scope
	jmp	.L103	 ;
.L112:
 ; ./asm_test/win/i/all.c:1129:     return NULL;
	xorl	%edi, %edi	 ; <retval>
.L102:
 ; ./asm_test/win/i/all.c:1130: }
	addq	$40, %rsp	 ;,
	movq	%rdi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC29:
	.ascii "Var: \"NULL\"\12\0"
.LC30:
	.ascii "NULL\11%s\12\0"
.LC31:
	.ascii "%s\11%s(%s)\12\0"
.LC32:
	.ascii "%s\11%s\12\0"
	.text
	.def	output_var;	.scl	3;	.type	32;	.endef
output_var:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
 ; ./asm_test/win/i/all.c:2091:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	leaq	0(,%r8,4), %rdi	 ;, _3
 ; ./asm_test/win/i/all.c:2089: void output_var(Var* var, FILE* outfile, size_t indent) {
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp115, outfile
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp114, var
	subq	$56, %rsp	 ;,
 ; ./asm_test/win/i/all.c:2090:     if (var == NULL) {
	testq	%rcx, %rcx	 ; var
	jne	.L115	 ;,
.L116:
 ; ./asm_test/win/i/all.c:2091:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rsi, %rdx	 ; outfile,
	movl	$32, %ecx	 ;,
 ; ./asm_test/win/i/all.c:2091:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	incq	%rbx	 ; i
 ; ./asm_test/win/i/all.c:2091:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2091:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	cmpq	%rdi, %rbx	 ; _3, i
	jb	.L116	 ;,
 ; ./asm_test/win/i/all.c:2105: }
	addq	$56, %rsp	 ;,
 ; ./asm_test/win/i/all.c:2092:         fprintf(outfile, "Var: \"NULL\"\n");
	movq	%rsi, %rdx	 ; outfile,
	leaq	.LC29(%rip), %rcx	 ;, tmp101
 ; ./asm_test/win/i/all.c:2105: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; ./asm_test/win/i/all.c:2092:         fprintf(outfile, "Var: \"NULL\"\n");
	jmp	fputs	 ;
.L115:
 ; ./asm_test/win/i/all.c:2096:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	xorl	%ebp, %ebp	 ; i
 ; ./asm_test/win/i/all.c:2095:     if (var->type == NULL) {
	cmpq	$0, 16(%rcx)	 ;, var_25(D)->type
	jne	.L117	 ;,
.L118:
 ; ./asm_test/win/i/all.c:2096:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rsi, %rdx	 ; outfile,
	movl	$32, %ecx	 ;,
 ; ./asm_test/win/i/all.c:2096:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	incq	%rbp	 ; i
 ; ./asm_test/win/i/all.c:2096:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2096:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	cmpq	%rdi, %rbp	 ; _3, i
	jb	.L118	 ;,
 ; ./asm_test/win/i/all.c:2097:         fprintf(outfile, "NULL\t%s\n", var->name);
	movq	8(%rbx), %r8	 ; var_25(D)->name,
 ; ./asm_test/win/i/all.c:2105: }
	addq	$56, %rsp	 ;,
 ; ./asm_test/win/i/all.c:2097:         fprintf(outfile, "NULL\t%s\n", var->name);
	movq	%rsi, %rcx	 ; outfile,
	leaq	.LC30(%rip), %rdx	 ;, tmp103
 ; ./asm_test/win/i/all.c:2105: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; ./asm_test/win/i/all.c:2097:         fprintf(outfile, "NULL\t%s\n", var->name);
	jmp	fprintf	 ;
.L117:
 ; ./asm_test/win/i/all.c:2098:     } else if (var->original_name) {
	cmpq	$0, (%rcx)	 ;, var_25(D)->original_name
	je	.L119	 ;,
.L120:
 ; ./asm_test/win/i/all.c:2099:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rsi, %rdx	 ; outfile,
	movl	$32, %ecx	 ;,
 ; ./asm_test/win/i/all.c:2099:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	incq	%rbp	 ; i
 ; ./asm_test/win/i/all.c:2099:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2099:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	cmpq	%rdi, %rbp	 ; _3, i
	jb	.L120	 ;,
 ; ./asm_test/win/i/all.c:2100:         fprintf(outfile, "%s\t%s(%s)\n", var->type->name, var->name, var->original_name->name);
	movq	16(%rbx), %rax	 ; var_25(D)->type, var_25(D)->type
	movq	%rsi, %rcx	 ; outfile,
	leaq	.LC31(%rip), %rdx	 ;, tmp109
	movq	8(%rax), %r8	 ; _10->name, _10->name
	movq	(%rbx), %rax	 ; var_25(D)->original_name, var_25(D)->original_name
	movq	8(%rax), %rax	 ; _7->name, _7->name
	movq	%rax, 32(%rsp)	 ; _7->name,
	movq	8(%rbx), %r9	 ; var_25(D)->name,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2105: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L119:
 ; ./asm_test/win/i/all.c:2102:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rsi, %rdx	 ; outfile,
	movl	$32, %ecx	 ;,
 ; ./asm_test/win/i/all.c:2102:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	incq	%rbp	 ; i
 ; ./asm_test/win/i/all.c:2102:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2102:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	cmpq	%rdi, %rbp	 ; _3, i
	jb	.L119	 ;,
 ; ./asm_test/win/i/all.c:2103:         fprintf(outfile, "%s\t%s\n", var->type->name, var->name);
	movq	16(%rbx), %rax	 ; var_25(D)->type, var_25(D)->type
	movq	8(%rbx), %r9	 ; var_25(D)->name,
	movq	%rsi, %rcx	 ; outfile,
	leaq	.LC32(%rip), %rdx	 ;, tmp113
	movq	8(%rax), %r8	 ; _14->name,
 ; ./asm_test/win/i/all.c:2105: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; ./asm_test/win/i/all.c:2103:         fprintf(outfile, "%s\t%s\n", var->type->name, var->name);
	jmp	fprintf	 ;
	.def	string_to_operator;	.scl	3;	.type	32;	.endef
string_to_operator:
 ; ./asm_test/win/i/all.c:1198:     if (str == symbolList[18]) return OP_ASSIGN;
	cmpq	%rcx, 144+symbolList(%rip)	 ; str, symbolList[18]
 ; ./asm_test/win/i/all.c:1198:     if (str == symbolList[18]) return OP_ASSIGN;
	movl	$13, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:1198:     if (str == symbolList[18]) return OP_ASSIGN;
	je	.L129	 ;,
 ; ./asm_test/win/i/all.c:1199:     else if (str == symbolList[23]) return OP_ADD_ASSIGN;
	cmpq	%rcx, 184+symbolList(%rip)	 ; str, symbolList[23]
 ; ./asm_test/win/i/all.c:1199:     else if (str == symbolList[23]) return OP_ADD_ASSIGN;
	movl	$14, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:1199:     else if (str == symbolList[23]) return OP_ADD_ASSIGN;
	je	.L129	 ;,
 ; ./asm_test/win/i/all.c:1200:     else if (str == symbolList[24]) return OP_SUB_ASSIGN;
	cmpq	%rcx, 192+symbolList(%rip)	 ; str, symbolList[24]
 ; ./asm_test/win/i/all.c:1200:     else if (str == symbolList[24]) return OP_SUB_ASSIGN;
	movl	$15, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:1200:     else if (str == symbolList[24]) return OP_SUB_ASSIGN;
	je	.L129	 ;,
 ; ./asm_test/win/i/all.c:1201:     else if (str == symbolList[25]) return OP_MUL_ASSIGN;
	cmpq	%rcx, 200+symbolList(%rip)	 ; str, symbolList[25]
 ; ./asm_test/win/i/all.c:1201:     else if (str == symbolList[25]) return OP_MUL_ASSIGN;
	movl	$16, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:1201:     else if (str == symbolList[25]) return OP_MUL_ASSIGN;
	je	.L129	 ;,
 ; ./asm_test/win/i/all.c:1202:     else if (str == symbolList[26]) return OP_DIV_ASSIGN;
	cmpq	%rcx, 208+symbolList(%rip)	 ; str, symbolList[26]
 ; ./asm_test/win/i/all.c:1202:     else if (str == symbolList[26]) return OP_DIV_ASSIGN;
	movl	$17, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:1202:     else if (str == symbolList[26]) return OP_DIV_ASSIGN;
	je	.L129	 ;,
 ; ./asm_test/win/i/all.c:1203:     else if (str == symbolList[27]) return OP_MOD_ASSIGN;
	cmpq	%rcx, 216+symbolList(%rip)	 ; str, symbolList[27]
 ; ./asm_test/win/i/all.c:1203:     else if (str == symbolList[27]) return OP_MOD_ASSIGN;
	movl	$18, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:1203:     else if (str == symbolList[27]) return OP_MOD_ASSIGN;
	je	.L129	 ;,
 ; ./asm_test/win/i/all.c:1204:     else if (str == symbolList[28]) return OP_AND;
	cmpq	224+symbolList(%rip), %rcx	 ; symbolList[28], str
 ; ./asm_test/win/i/all.c:1204:     else if (str == symbolList[28]) return OP_AND;
	movl	$11, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:1204:     else if (str == symbolList[28]) return OP_AND;
	je	.L129	 ;,
 ; ./asm_test/win/i/all.c:1205:     else if (str == symbolList[29]) return OP_OR;
	cmpq	232+symbolList(%rip), %rcx	 ; symbolList[29], str
 ; ./asm_test/win/i/all.c:1205:     else if (str == symbolList[29]) return OP_OR;
	movl	$12, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:1205:     else if (str == symbolList[29]) return OP_OR;
	je	.L129	 ;,
 ; ./asm_test/win/i/all.c:1206:     else if (str == symbolList[19]) return OP_EQ;
	cmpq	152+symbolList(%rip), %rcx	 ; symbolList[19], str
 ; ./asm_test/win/i/all.c:1206:     else if (str == symbolList[19]) return OP_EQ;
	movl	$5, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:1206:     else if (str == symbolList[19]) return OP_EQ;
	je	.L129	 ;,
 ; ./asm_test/win/i/all.c:1207:     else if (str == symbolList[20]) return OP_NE;
	cmpq	160+symbolList(%rip), %rcx	 ; symbolList[20], str
 ; ./asm_test/win/i/all.c:1207:     else if (str == symbolList[20]) return OP_NE;
	movl	$6, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:1207:     else if (str == symbolList[20]) return OP_NE;
	je	.L129	 ;,
 ; ./asm_test/win/i/all.c:1208:     else if (str == symbolList[16]) return OP_LT;
	cmpq	128+symbolList(%rip), %rcx	 ; symbolList[16], str
 ; ./asm_test/win/i/all.c:1208:     else if (str == symbolList[16]) return OP_LT;
	movl	$7, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:1208:     else if (str == symbolList[16]) return OP_LT;
	je	.L129	 ;,
 ; ./asm_test/win/i/all.c:1209:     else if (str == symbolList[17]) return OP_GT;
	cmpq	136+symbolList(%rip), %rcx	 ; symbolList[17], str
 ; ./asm_test/win/i/all.c:1209:     else if (str == symbolList[17]) return OP_GT;
	movl	$8, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:1209:     else if (str == symbolList[17]) return OP_GT;
	je	.L129	 ;,
 ; ./asm_test/win/i/all.c:1210:     else if (str == symbolList[21]) return OP_LE;
	cmpq	168+symbolList(%rip), %rcx	 ; symbolList[21], str
 ; ./asm_test/win/i/all.c:1210:     else if (str == symbolList[21]) return OP_LE;
	movl	$9, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:1210:     else if (str == symbolList[21]) return OP_LE;
	je	.L129	 ;,
 ; ./asm_test/win/i/all.c:1211:     else if (str == symbolList[22]) return OP_GE;
	cmpq	176+symbolList(%rip), %rcx	 ; symbolList[22], str
 ; ./asm_test/win/i/all.c:1211:     else if (str == symbolList[22]) return OP_GE;
	movl	$10, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:1211:     else if (str == symbolList[22]) return OP_GE;
	je	.L129	 ;,
 ; ./asm_test/win/i/all.c:1212:     else if (str == symbolList[11]) return OP_ADD;
	xorl	%eax, %eax	 ; <retval>
 ; ./asm_test/win/i/all.c:1212:     else if (str == symbolList[11]) return OP_ADD;
	cmpq	88+symbolList(%rip), %rcx	 ; symbolList[11], str
	je	.L129	 ;,
 ; ./asm_test/win/i/all.c:1213:     else if (str == symbolList[12]) return OP_SUB;
	cmpq	96+symbolList(%rip), %rcx	 ; symbolList[12], str
 ; ./asm_test/win/i/all.c:1213:     else if (str == symbolList[12]) return OP_SUB;
	movl	$1, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:1213:     else if (str == symbolList[12]) return OP_SUB;
	je	.L129	 ;,
 ; ./asm_test/win/i/all.c:1214:     else if (str == symbolList[13]) return OP_MUL;
	cmpq	104+symbolList(%rip), %rcx	 ; symbolList[13], str
 ; ./asm_test/win/i/all.c:1214:     else if (str == symbolList[13]) return OP_MUL;
	movl	$2, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:1214:     else if (str == symbolList[13]) return OP_MUL;
	je	.L129	 ;,
 ; ./asm_test/win/i/all.c:1215:     else if (str == symbolList[14]) return OP_DIV;
	cmpq	112+symbolList(%rip), %rcx	 ; symbolList[14], str
 ; ./asm_test/win/i/all.c:1215:     else if (str == symbolList[14]) return OP_DIV;
	movl	$3, %eax	 ;, <retval>
 ; ./asm_test/win/i/all.c:1215:     else if (str == symbolList[14]) return OP_DIV;
	je	.L129	 ;,
 ; ./asm_test/win/i/all.c:1216:     else if (str == symbolList[15]) return OP_MOD;
	cmpq	120+symbolList(%rip), %rcx	 ; symbolList[15], str
	movl	$19, %eax	 ;, tmp127
	movl	$4, %edx	 ;, tmp128
	cmove	%edx, %eax	 ; tmp127,, tmp128, <retval>
.L129:
 ; ./asm_test/win/i/all.c:1218: }
	ret	
	.section .rdata,"dr"
.LC33:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.text
	.def	create_method_use_ptr;	.scl	3;	.type	32;	.endef
create_method_use_ptr:
	subq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:714:     if (name == NULL || return_type == NULL) {
	testq	%rdx, %rdx	 ; name
	je	.L154	 ;,
	testq	%r8, %r8	 ; return_type
	jne	.L151	 ;,
.L154:
 ; ./asm_test/win/i/all.c:715:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:715:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	leaq	.LC33(%rip), %rcx	 ;, tmp98
 ; ./asm_test/win/i/all.c:715:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	movq	%rax, %rdx	 ; tmp104, _20
 ; ./asm_test/win/i/all.c:715:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	call	fputs	 ;
	xorl	%eax, %eax	 ; method
	jmp	.L153	 ;
.L151:
 ; ./asm_test/win/i/all.c:718:     method->name = name;
	movq	%rdx, (%rcx)	 ; name, method_8(D)->name
 ; ./asm_test/win/i/all.c:721:     method->body = body;
	movq	80(%rsp), %rdx	 ; body, body
	movq	%rcx, %rax	 ; tmp100, method
 ; ./asm_test/win/i/all.c:719:     method->return_type = return_type;
	movq	%r8, 8(%rcx)	 ; return_type, method_8(D)->return_type
 ; ./asm_test/win/i/all.c:721:     method->body = body;
	movq	%rdx, 24(%rcx)	 ; body, method_8(D)->body
 ; ./asm_test/win/i/all.c:722:     method->method_scope = method_scope;
	movq	88(%rsp), %rdx	 ; method_scope, method_scope
 ; ./asm_test/win/i/all.c:720:     method->parameters = parameters;
	movq	%r9, 16(%rcx)	 ; parameters, method_8(D)->parameters
 ; ./asm_test/win/i/all.c:722:     method->method_scope = method_scope;
	movq	%rdx, 32(%rcx)	 ; method_scope, method_8(D)->method_scope
.L153:
 ; ./asm_test/win/i/all.c:724: }
	addq	$40, %rsp	 ;,
	ret	
	.def	create_memory_block.constprop.0;	.scl	3;	.type	32;	.endef
create_memory_block.constprop.0:
	pushq	%rbx	 ;
 ; ./asm_test/win/i/all.c:603:     MemoryBlock* new_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movl	$32, %ecx	 ;,
 ; ./asm_test/win/i/all.c:602: MemoryBlock* create_memory_block(size_t size) {
	subq	$32, %rsp	 ;,
 ; ./asm_test/win/i/all.c:603:     MemoryBlock* new_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	call	malloc	 ;
 ; ./asm_test/win/i/all.c:604:     if (new_memory == NULL) {
	testq	%rax, %rax	 ; tmp85
	jne	.L157	 ;,
 ; ./asm_test/win/i/all.c:605:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:605:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	leaq	.LC28(%rip), %rcx	 ;, tmp87
 ; ./asm_test/win/i/all.c:605:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movq	%rax, %rdx	 ; tmp91, _11
 ; ./asm_test/win/i/all.c:605:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:607:         exit(1);
	movl	$1, %ecx	 ;,
 ; ./asm_test/win/i/all.c:606:         initialized = 0;
	movb	$0, initialized(%rip)	 ;, initialized
 ; ./asm_test/win/i/all.c:607:         exit(1);
	call	exit	 ;
.L157:
 ; ./asm_test/win/i/all.c:609:     new_memory->block = (size_t*)malloc(size);
	movl	$1024, %ecx	 ;,
	movq	%rax, %rbx	 ; tmp90, tmp85
	call	malloc	 ;
 ; ./asm_test/win/i/all.c:610:     new_memory->size = size;
	movq	$1024, (%rbx)	 ;, new_memory_1->size
 ; ./asm_test/win/i/all.c:609:     new_memory->block = (size_t*)malloc(size);
	movq	%rax, 24(%rbx)	 ; tmp92, new_memory_1->block
 ; ./asm_test/win/i/all.c:612:     new_memory->next = NULL;
	xorl	%eax, %eax	 ;
	movq	%rax, 8(%rbx)	 ;, new_memory_1->used
	movq	%rax, 16(%rbx)	 ;, new_memory_1->next
 ; ./asm_test/win/i/all.c:614: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; tmp85,
	popq	%rbx	 ;
	ret	
	.section .rdata,"dr"
.LC34:
	.ascii "init\0"
.LC35:
	.ascii "$constructor\0"
	.text
	.def	init;	.scl	3;	.type	32;	.endef
init:
 ; ./asm_test/win/i/all.c:616:     if (initialized) return;
	cmpb	$0, initialized(%rip)	 ;, initialized
	jne	.L168	 ;,
 ; ./asm_test/win/i/all.c:615: void init(void) {
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:617:     if (struct_memory == NULL) {
	cmpq	$0, struct_memory(%rip)	 ;, struct_memory
	jne	.L161	 ;,
 ; ./asm_test/win/i/all.c:618:         struct_memory = create_memory_block(1024);
	call	create_memory_block.constprop.0	 ;
 ; ./asm_test/win/i/all.c:619:         struct_memory_count = 1024;
	movq	$1024, struct_memory_count(%rip)	 ;, struct_memory_count
 ; ./asm_test/win/i/all.c:618:         struct_memory = create_memory_block(1024);
	movq	%rax, struct_memory(%rip)	 ; tmp109, struct_memory
.L161:
 ; ./asm_test/win/i/all.c:621:     if (string_memory == NULL) {
	cmpq	$0, string_memory(%rip)	 ;, string_memory
	jne	.L162	 ;,
 ; ./asm_test/win/i/all.c:622:         string_memory = create_memory_block(1024);
	call	create_memory_block.constprop.0	 ;
 ; ./asm_test/win/i/all.c:623:         string_memory_count = 1024;
	movq	$1024, string_memory_count(%rip)	 ;, string_memory_count
 ; ./asm_test/win/i/all.c:622:         string_memory = create_memory_block(1024);
	movq	%rax, string_memory(%rip)	 ; tmp110, string_memory
.L162:
 ; ./asm_test/win/i/all.c:625:     initialized = 1;
	movb	$1, initialized(%rip)	 ;, initialized
 ; ./asm_test/win/i/all.c:626:     for (size_t i = 0; i < 22; ++i)
	xorl	%ebx, %ebx	 ; i
 ; ./asm_test/win/i/all.c:627:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), 0);
	leaq	keywordStrings(%rip), %rbp	 ;, tmp97
 ; ./asm_test/win/i/all.c:627:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), 0);
	leaq	keywordList(%rip), %rdi	 ;, tmp101
.L163:
 ; ./asm_test/win/i/all.c:627:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), 0);
	movq	0(%rbp,%rbx,8), %rsi	 ; MEM[(char * *)&keywordStrings + i_43 * 8], _10
 ; ./asm_test/win/i/all.c:627:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), 0);
	movq	%rsi, %rcx	 ; _10,
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:627:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), 0);
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rcx	 ; _10,
 ; ./asm_test/win/i/all.c:627:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), 0);
	movq	%rax, %rdx	 ; tmp111, tmp99
 ; ./asm_test/win/i/all.c:627:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), 0);
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:627:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), 0);
	movq	%rax, (%rdi,%rbx,8)	 ; tmp112, MEM[(char * *)&keywordList + i_43 * 8]
 ; ./asm_test/win/i/all.c:626:     for (size_t i = 0; i < 22; ++i)
	incq	%rbx	 ; i
 ; ./asm_test/win/i/all.c:626:     for (size_t i = 0; i < 22; ++i)
	cmpq	$22, %rbx	 ;, i
	jne	.L163	 ;,
 ; ./asm_test/win/i/all.c:628:     for (size_t i = 0; i < 30; ++i)
	xorl	%ebx, %ebx	 ; i
 ; ./asm_test/win/i/all.c:629:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), 0);
	leaq	symbolStrings(%rip), %rbp	 ;, tmp102
 ; ./asm_test/win/i/all.c:629:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), 0);
	leaq	symbolList(%rip), %rdi	 ;, tmp106
.L164:
 ; ./asm_test/win/i/all.c:629:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), 0);
	movq	0(%rbp,%rbx,8), %rsi	 ; MEM[(char * *)&symbolStrings + i_44 * 8], _15
 ; ./asm_test/win/i/all.c:629:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), 0);
	movq	%rsi, %rcx	 ; _15,
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:629:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), 0);
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rcx	 ; _15,
 ; ./asm_test/win/i/all.c:629:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), 0);
	movq	%rax, %rdx	 ; tmp113, tmp104
 ; ./asm_test/win/i/all.c:629:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), 0);
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:629:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), 0);
	movq	%rax, (%rdi,%rbx,8)	 ; tmp114, MEM[(char * *)&symbolList + i_44 * 8]
 ; ./asm_test/win/i/all.c:628:     for (size_t i = 0; i < 30; ++i)
	incq	%rbx	 ; i
 ; ./asm_test/win/i/all.c:628:     for (size_t i = 0; i < 30; ++i)
	cmpq	$30, %rbx	 ;, i
	jne	.L164	 ;,
 ; ./asm_test/win/i/all.c:630:     DEFAULT_INIT_NAME = create_string_check("init", 4, 0);
	xorl	%r8d, %r8d	 ;
	movl	$4, %edx	 ;,
	leaq	.LC34(%rip), %rcx	 ;, tmp107
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:631:     DEFAULT_CONSTRUCTOR_NAME = create_string_check("$constructor", 13, 0);
	xorl	%r8d, %r8d	 ;
	movl	$13, %edx	 ;,
	leaq	.LC35(%rip), %rcx	 ;, tmp108
 ; ./asm_test/win/i/all.c:630:     DEFAULT_INIT_NAME = create_string_check("init", 4, 0);
	movq	%rax, DEFAULT_INIT_NAME(%rip)	 ; tmp115, DEFAULT_INIT_NAME
 ; ./asm_test/win/i/all.c:631:     DEFAULT_CONSTRUCTOR_NAME = create_string_check("$constructor", 13, 0);
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
.L168:
	ret	
	.section .rdata,"dr"
.LC36:
	.ascii "Fatal: Memory allocation is not aligned, used: %zu bytes\12\0"
	.text
	.def	alloc_memory;	.scl	3;	.type	32;	.endef
alloc_memory:
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp109, size
	subq	$48, %rsp	 ;,
 ; ./asm_test/win/i/all.c:634:     if (!initialized) init();
	cmpb	$0, initialized(%rip)	 ;, initialized
	jne	.L172	 ;,
 ; ./asm_test/win/i/all.c:634:     if (!initialized) init();
	call	init	 ;
.L172:
 ; ./asm_test/win/i/all.c:636:     if (struct_memory->used + size >= struct_memory->size)
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory.22_3
 ; ./asm_test/win/i/all.c:635:     size = (size + sizeof(size_t) - 1) & ~(sizeof(size_t) - 1);
	addq	$7, %rbx	 ;, _2
 ; ./asm_test/win/i/all.c:635:     size = (size + sizeof(size_t) - 1) & ~(sizeof(size_t) - 1);
	andq	$-8, %rbx	 ;, size
 ; ./asm_test/win/i/all.c:636:     if (struct_memory->used + size >= struct_memory->size)
	movq	8(%rax), %rdx	 ; struct_memory.22_3->used, tmp100
	addq	%rbx, %rdx	 ; size, tmp100
 ; ./asm_test/win/i/all.c:636:     if (struct_memory->used + size >= struct_memory->size)
	cmpq	(%rax), %rdx	 ; struct_memory.22_3->size, tmp100
	jb	.L173	 ;,
 ; ./asm_test/win/i/all.c:637:         increase_memory_size(1);
	movl	$1, %ecx	 ;,
	call	increase_memory_size	 ;
.L173:
 ; ./asm_test/win/i/all.c:638:     if (struct_memory->used % sizeof(size_t) != 0) {
	movq	struct_memory(%rip), %rdx	 ; struct_memory, struct_memory.24_7
	movq	8(%rdx), %r8	 ; struct_memory.24_7->used, _8
 ; ./asm_test/win/i/all.c:638:     if (struct_memory->used % sizeof(size_t) != 0) {
	testl	$7, %r8d	 ;, _8
	je	.L174	 ;,
	movq	%r8, 40(%rsp)	 ; _8, %sfp
 ; ./asm_test/win/i/all.c:639:         fprintf(stderr, "Fatal: Memory allocation is not aligned, used: %zu bytes\n", struct_memory->used);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:639:         fprintf(stderr, "Fatal: Memory allocation is not aligned, used: %zu bytes\n", struct_memory->used);
	movq	40(%rsp), %r8	 ; %sfp, _8
	leaq	.LC36(%rip), %rdx	 ;, tmp104
 ; ./asm_test/win/i/all.c:639:         fprintf(stderr, "Fatal: Memory allocation is not aligned, used: %zu bytes\n", struct_memory->used);
	movq	%rax, %rcx	 ; tmp110, _10
 ; ./asm_test/win/i/all.c:639:         fprintf(stderr, "Fatal: Memory allocation is not aligned, used: %zu bytes\n", struct_memory->used);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:641:         exit(1);
	movl	$1, %ecx	 ;,
 ; ./asm_test/win/i/all.c:640:         initialized = 0;
	movb	$0, initialized(%rip)	 ;, initialized
 ; ./asm_test/win/i/all.c:641:         exit(1);
	call	exit	 ;
.L174:
 ; ./asm_test/win/i/all.c:643:     size_t* ptr = struct_memory->block + (struct_memory->used / sizeof(size_t));
	movq	%r8, %rax	 ; _8, tmp105
 ; ./asm_test/win/i/all.c:644:     struct_memory->used += size;
	addq	%rbx, %r8	 ; size, tmp107
 ; ./asm_test/win/i/all.c:645:     ++memoryBlockCount;
	incq	memoryBlockCount(%rip)	 ; memoryBlockCount
 ; ./asm_test/win/i/all.c:644:     struct_memory->used += size;
	movq	%r8, 8(%rdx)	 ; tmp107, struct_memory.24_7->used
 ; ./asm_test/win/i/all.c:643:     size_t* ptr = struct_memory->block + (struct_memory->used / sizeof(size_t));
	andq	$-8, %rax	 ;, tmp105
 ; ./asm_test/win/i/all.c:643:     size_t* ptr = struct_memory->block + (struct_memory->used / sizeof(size_t));
	addq	24(%rdx), %rax	 ; struct_memory.24_7->block, <retval>
 ; ./asm_test/win/i/all.c:647: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	ret	
	.section .rdata,"dr"
.LC37:
	.ascii "Info: Allocate big memory block of size %zu bytes\12\0"
	.text
	.def	create_string_check;	.scl	3;	.type	32;	.endef
create_string_check:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp130, data
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp131, length
	pushq	%rbx	 ;
	movl	%r8d, %ebx	 ; tmp132, check
	subq	$48, %rsp	 ;,
 ; ./asm_test/win/i/all.c:571:     if (!initialized) init();
	cmpb	$0, initialized(%rip)	 ;, initialized
	jne	.L177	 ;,
 ; ./asm_test/win/i/all.c:571:     if (!initialized) init();
	call	init	 ;
.L177:
 ; ./asm_test/win/i/all.c:572:     if (data == NULL || length == 0) return 0;
	testq	%rdi, %rdi	 ; data
	je	.L186	 ;,
	testq	%rsi, %rsi	 ; length
	je	.L186	 ;,
 ; ./asm_test/win/i/all.c:573:     if (check) {
	testb	%bl, %bl	 ; check
	je	.L179	 ;,
 ; ./asm_test/win/i/all.c:574:         StringList* current = all_string_list;
	movq	all_string_list(%rip), %rbp	 ; all_string_list, current
 ; ./asm_test/win/i/all.c:575:         char* existing = NULL;
	xorl	%ebx, %ebx	 ; <retval>
.L180:
 ; ./asm_test/win/i/all.c:576:         while (current != NULL) {
	testq	%rbp, %rbp	 ; current
	je	.L192	 ;,
 ; ./asm_test/win/i/all.c:577:             if (current->length == length && current->str != NULL && strncmp(current->str, data, length) == 0)
	cmpq	%rsi, 8(%rbp)	 ; length, current_21->length
	jne	.L181	 ;,
 ; ./asm_test/win/i/all.c:577:             if (current->length == length && current->str != NULL && strncmp(current->str, data, length) == 0)
	movq	0(%rbp), %r12	 ; current_21->str, _6
 ; ./asm_test/win/i/all.c:577:             if (current->length == length && current->str != NULL && strncmp(current->str, data, length) == 0)
	testq	%r12, %r12	 ; _6
	je	.L181	 ;,
 ; ./asm_test/win/i/all.c:577:             if (current->length == length && current->str != NULL && strncmp(current->str, data, length) == 0)
	movq	%rsi, %r8	 ; length,
	movq	%rdi, %rdx	 ; data,
	movq	%r12, %rcx	 ; _6,
	call	strncmp	 ;
 ; ./asm_test/win/i/all.c:578:                 existing = current->str;
	testl	%eax, %eax	 ; tmp133
	cmove	%r12, %rbx	 ; <retval>,, _6, <retval>
.L181:
 ; ./asm_test/win/i/all.c:579:             current = current->next;
	movq	16(%rbp), %rbp	 ; current_21->next, current
	jmp	.L180	 ;
.L192:
 ; ./asm_test/win/i/all.c:581:         if (existing != NULL)
	testq	%rbx, %rbx	 ; <retval>
	jne	.L176	 ;,
.L179:
 ; ./asm_test/win/i/all.c:585:     if (length >= 1024 - 1)
	cmpq	$1022, %rsi	 ;, length
	jbe	.L183	 ;,
 ; ./asm_test/win/i/all.c:586:         str = alloc_big_memory(length + 1);
	leaq	1(%rsi), %r8	 ;, _9
 ; ./asm_test/win/i/all.c:560:     string_memory_count += size;
	addq	%r8, string_memory_count(%rip)	 ; _9, string_memory_count
 ; ./asm_test/win/i/all.c:562:     char* block = (char*)malloc(size);
	movq	%r8, %rcx	 ; _9,
 ; ./asm_test/win/i/all.c:561:     string_memory_used += size;
	addq	%r8, string_memory_used(%rip)	 ; _9, string_memory_used
 ; ./asm_test/win/i/all.c:562:     char* block = (char*)malloc(size);
	movq	%r8, 40(%rsp)	 ; _9, %sfp
	call	malloc	 ;
 ; ./asm_test/win/i/all.c:563:     fprintf(stderr, "Info: Allocate big memory block of size %zu bytes\n", size);
	movl	$2, %ecx	 ;,
	movq	__imp___acrt_iob_func(%rip), %rbp	 ;, tmp119
 ; ./asm_test/win/i/all.c:562:     char* block = (char*)malloc(size);
	movq	%rax, %rbx	 ; tmp134, <retval>
 ; ./asm_test/win/i/all.c:563:     fprintf(stderr, "Info: Allocate big memory block of size %zu bytes\n", size);
	call	*%rbp	 ; tmp119
 ; ./asm_test/win/i/all.c:563:     fprintf(stderr, "Info: Allocate big memory block of size %zu bytes\n", size);
	movq	40(%rsp), %r8	 ; %sfp, _9
	leaq	.LC37(%rip), %rdx	 ;, tmp120
 ; ./asm_test/win/i/all.c:563:     fprintf(stderr, "Info: Allocate big memory block of size %zu bytes\n", size);
	movq	%rax, %rcx	 ; tmp135, _55
 ; ./asm_test/win/i/all.c:563:     fprintf(stderr, "Info: Allocate big memory block of size %zu bytes\n", size);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:564:     if (block == NULL) {
	testq	%rbx, %rbx	 ; <retval>
	jne	.L184	 ;,
 ; ./asm_test/win/i/all.c:565:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movl	$2, %ecx	 ;,
	call	*%rbp	 ; tmp119
 ; ./asm_test/win/i/all.c:565:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	leaq	.LC28(%rip), %rcx	 ;, tmp122
 ; ./asm_test/win/i/all.c:565:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movq	%rax, %rdx	 ; tmp136, _56
 ; ./asm_test/win/i/all.c:565:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:566:         exit(1);
	movl	$1, %ecx	 ;,
	call	exit	 ;
.L183:
 ; ./asm_test/win/i/all.c:588:         if (string_memory->used + length >= string_memory->size)
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory.4_10
 ; ./asm_test/win/i/all.c:588:         if (string_memory->used + length >= string_memory->size)
	movq	8(%rax), %rdx	 ; string_memory.4_10->used, tmp123
	addq	%rsi, %rdx	 ; length, tmp123
 ; ./asm_test/win/i/all.c:588:         if (string_memory->used + length >= string_memory->size)
	cmpq	(%rax), %rdx	 ; string_memory.4_10->size, tmp123
	jb	.L185	 ;,
 ; ./asm_test/win/i/all.c:589:             increase_memory_size(0);
	xorl	%ecx, %ecx	 ;
	call	increase_memory_size	 ;
.L185:
 ; ./asm_test/win/i/all.c:590:         str = (char*)string_memory->block + string_memory->used;
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory.6_14
 ; ./asm_test/win/i/all.c:590:         str = (char*)string_memory->block + string_memory->used;
	movq	8(%rax), %rdx	 ; string_memory.6_14->used, _16
 ; ./asm_test/win/i/all.c:590:         str = (char*)string_memory->block + string_memory->used;
	movq	24(%rax), %rbx	 ; string_memory.6_14->block, <retval>
	addq	%rdx, %rbx	 ; _16, <retval>
 ; ./asm_test/win/i/all.c:591:         string_memory->used += length + 1;
	leaq	1(%rdx,%rsi), %rdx	 ;, tmp127
	movq	%rdx, 8(%rax)	 ; tmp127, string_memory.6_14->used
.L184:
 ; ./asm_test/win/i/all.c:593:     strncpy(str, data, length);
	movq	%rdi, %rdx	 ; data,
	movq	%rsi, %r8	 ; length,
	movq	%rbx, %rcx	 ; <retval>,
	call	strncpy	 ;
 ; ./asm_test/win/i/all.c:594:     str[length] = '\0';
	movb	$0, (%rbx,%rsi)	 ;, *_19
 ; ./asm_test/win/i/all.c:595:     StringList* new_str = (StringList*)alloc_memory(sizeof(StringList));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:598:     new_str->next = all_string_list;
	movq	all_string_list(%rip), %rdx	 ; all_string_list, all_string_list
 ; ./asm_test/win/i/all.c:596:     new_str->str = str;
	movq	%rbx, (%rax)	 ; <retval>, new_str_45->str
 ; ./asm_test/win/i/all.c:597:     new_str->length = length;
	movq	%rsi, 8(%rax)	 ; length, new_str_45->length
 ; ./asm_test/win/i/all.c:598:     new_str->next = all_string_list;
	movq	%rdx, 16(%rax)	 ; all_string_list, new_str_45->next
 ; ./asm_test/win/i/all.c:599:     all_string_list = new_str;
	movq	%rax, all_string_list(%rip)	 ; new_str, all_string_list
 ; ./asm_test/win/i/all.c:600:     return str;
	jmp	.L176	 ;
.L186:
 ; ./asm_test/win/i/all.c:572:     if (data == NULL || length == 0) return 0;
	xorl	%ebx, %ebx	 ; <retval>
.L176:
 ; ./asm_test/win/i/all.c:601: }
	addq	$48, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.section .rdata,"dr"
.LC38:
	.ascii "\0"
.LC39:
	.ascii "%s/%s\0"
	.text
	.def	absolute_path;	.scl	3;	.type	32;	.endef
absolute_path:
	pushq	%r13	 ;
	pushq	%r12	 ;
 ; ./asm_test/win/i/all.c:3896:     char* abs_path = create_string_check("", total_len, 0);
	leaq	.LC38(%rip), %r12	 ;, tmp153
 ; ./asm_test/win/i/all.c:3866: char* absolute_path(char* path, char* base_path) {
	pushq	%rbp	 ;
 ; ./asm_test/win/i/all.c:3897:     sprintf(abs_path, "%s/%s", base_path, path);
	leaq	.LC39(%rip), %rbp	 ;, tmp154
 ; ./asm_test/win/i/all.c:3866: char* absolute_path(char* path, char* base_path) {
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp156, base_path
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
.L213:
 ; ./asm_test/win/i/all.c:3867:     path = create_string_check(path, strlen(path), 0);
	movq	%rcx, 96(%rsp)	 ; path, path
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:3867:     path = create_string_check(path, strlen(path), 0);
	movq	96(%rsp), %rcx	 ; path, path
	xorl	%r8d, %r8d	 ;
 ; ./asm_test/win/i/all.c:3867:     path = create_string_check(path, strlen(path), 0);
	movq	%rax, %rdx	 ; tmp157, tmp124
 ; ./asm_test/win/i/all.c:3867:     path = create_string_check(path, strlen(path), 0);
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3868:     size_t path_len = strlen(path);
	movq	%rax, %rcx	 ; <retval>,
 ; ./asm_test/win/i/all.c:3867:     path = create_string_check(path, strlen(path), 0);
	movq	%rax, %rbx	 ; tmp158, <retval>
 ; ./asm_test/win/i/all.c:3868:     size_t path_len = strlen(path);
	call	strlen	 ;
	movq	%rax, %rsi	 ; tmp159, path_len
 ; ./asm_test/win/i/all.c:3869:     for (size_t i = 0; i < path_len; i++) {
	xorl	%eax, %eax	 ; i
.L194:
 ; ./asm_test/win/i/all.c:3869:     for (size_t i = 0; i < path_len; i++) {
	cmpq	%rsi, %rax	 ; path_len, i
	jnb	.L228	 ;,
 ; ./asm_test/win/i/all.c:3870:         if (path[i] == '\\') path[i] = '/';
	leaq	(%rbx,%rax), %rcx	 ;, _2
	movb	(%rcx), %dl	 ; *_2, _3
 ; ./asm_test/win/i/all.c:3870:         if (path[i] == '\\') path[i] = '/';
	cmpb	$92, %dl	 ;, _3
	jne	.L195	 ;,
 ; ./asm_test/win/i/all.c:3870:         if (path[i] == '\\') path[i] = '/';
	movb	$47, (%rcx)	 ;, *_2
 ; ./asm_test/win/i/all.c:3871:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rax	 ;, i
	jbe	.L200	 ;,
.L201:
 ; ./asm_test/win/i/all.c:3871:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-1(%rbx,%rax), %rcx	 ;, _6
 ; ./asm_test/win/i/all.c:3871:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$46, (%rcx)	 ;, *_6
	jne	.L202	 ;,
	jmp	.L229	 ;
.L195:
 ; ./asm_test/win/i/all.c:3871:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rax	 ;, i
	jbe	.L200	 ;,
 ; ./asm_test/win/i/all.c:3871:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, %dl	 ;, _3
	jne	.L202	 ;,
	jmp	.L201	 ;
.L229:
 ; ./asm_test/win/i/all.c:3871:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, -2(%rbx,%rax)	 ;, *_9
 ; ./asm_test/win/i/all.c:3871:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-2(%rax), %r13	 ;, _8
 ; ./asm_test/win/i/all.c:3871:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	jne	.L202	 ;,
 ; ./asm_test/win/i/all.c:3872:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	%rsi, %r8	 ; path_len, tmp165
 ; ./asm_test/win/i/all.c:3872:             memmove(path + i - 1, path + i + 1, path_len - i);
	leaq	1(%rbx,%rax), %rdx	 ;, tmp135
 ; ./asm_test/win/i/all.c:3873:             path_len -= 2;
	subq	$2, %rsi	 ;, path_len
 ; ./asm_test/win/i/all.c:3872:             memmove(path + i - 1, path + i + 1, path_len - i);
	subq	%rax, %r8	 ; i, tmp165
	call	memmove	 ;
 ; ./asm_test/win/i/all.c:3874:             i -= 2;
	movq	%r13, %rax	 ; _8, i
.L200:
 ; ./asm_test/win/i/all.c:3876:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	testq	%rax, %rax	 ; i
	je	.L203	 ;,
.L202:
 ; ./asm_test/win/i/all.c:3876:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	(%rbx,%rax), %rcx	 ;, _14
 ; ./asm_test/win/i/all.c:3876:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, (%rcx)	 ;, *_14
	jne	.L203	 ;,
 ; ./asm_test/win/i/all.c:3876:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, -1(%rbx,%rax)	 ;, *_17
 ; ./asm_test/win/i/all.c:3876:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	-1(%rax), %r13	 ;, _16
 ; ./asm_test/win/i/all.c:3876:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	jne	.L203	 ;,
 ; ./asm_test/win/i/all.c:3877:             memmove(path + i, path + i + 1, path_len - i);
	movq	%rsi, %r8	 ; path_len, tmp166
 ; ./asm_test/win/i/all.c:3877:             memmove(path + i, path + i + 1, path_len - i);
	leaq	1(%rbx,%rax), %rdx	 ;, tmp141
 ; ./asm_test/win/i/all.c:3878:             path_len--;
	decq	%rsi	 ; path_len
 ; ./asm_test/win/i/all.c:3877:             memmove(path + i, path + i + 1, path_len - i);
	subq	%rax, %r8	 ; i, tmp166
	call	memmove	 ;
 ; ./asm_test/win/i/all.c:3879:             i--;
	movq	%r13, %rax	 ; _16, i
.L203:
 ; ./asm_test/win/i/all.c:3869:     for (size_t i = 0; i < path_len; i++) {
	incq	%rax	 ; i
	jmp	.L194	 ;
.L228:
 ; ./asm_test/win/i/all.c:3882:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpq	$2, %rsi	 ;, path_len
	jbe	.L205	 ;,
 ; ./asm_test/win/i/all.c:3882:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpb	$47, (%rbx)	 ;, *path_55
	jne	.L206	 ;,
 ; ./asm_test/win/i/all.c:3882:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	movb	1(%rbx), %al	 ; MEM[(char *)path_55 + 1B], _24
	leal	-97(%rax), %edx	 ;, tmp142
 ; ./asm_test/win/i/all.c:3882:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpb	$25, %dl	 ;, tmp142
	ja	.L193	 ;,
 ; ./asm_test/win/i/all.c:3882:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpb	$47, 2(%rbx)	 ;, MEM[(char *)path_55 + 2B]
	jne	.L193	 ;,
 ; ./asm_test/win/i/all.c:3883:         path[0] = (path[1] >= 'a' && path[1] <= 'z') ? (path[1] - ('a' - 'A')) : path[1];
	subl	$32, %eax	 ;, tmp143
 ; ./asm_test/win/i/all.c:3884:         path[1] = ':';
	movb	$58, 1(%rbx)	 ;, MEM[(char *)path_55 + 1B]
 ; ./asm_test/win/i/all.c:3883:         path[0] = (path[1] >= 'a' && path[1] <= 'z') ? (path[1] - ('a' - 'A')) : path[1];
	movb	%al, (%rbx)	 ; tmp143, *path_55
 ; ./asm_test/win/i/all.c:3885:         return path;
	jmp	.L193	 ;
.L205:
 ; ./asm_test/win/i/all.c:3887:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	jne	.L208	 ;,
.L206:
 ; ./asm_test/win/i/all.c:3887:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	movb	(%rbx), %al	 ; *path_55, tmp167
	subl	$65, %eax	 ;, tmp145
 ; ./asm_test/win/i/all.c:3887:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpb	$25, %al	 ;, tmp145
	ja	.L209	 ;,
 ; ./asm_test/win/i/all.c:3887:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpb	$58, 1(%rbx)	 ;, MEM[(char *)path_55 + 1B]
	jmp	.L227	 ;
.L208:
 ; ./asm_test/win/i/all.c:3889:     if (path_len > 0 && path[0] == '/')
	testq	%rsi, %rsi	 ; path_len
	je	.L210	 ;,
.L209:
 ; ./asm_test/win/i/all.c:3889:     if (path_len > 0 && path[0] == '/')
	cmpb	$47, (%rbx)	 ;, *path_55
.L227:
	je	.L193	 ;,
.L210:
 ; ./asm_test/win/i/all.c:3891:     if (base_path == NULL)
	testq	%rdi, %rdi	 ; base_path
	jne	.L212	 ;,
 ; ./asm_test/win/i/all.c:3892:         base_path = getcwd(NULL, 0);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	getcwd	 ;
	movq	%rax, %rdi	 ; tmp160, base_path
 ; ./asm_test/win/i/all.c:3893:     if (base_path == NULL)
	testq	%rax, %rax	 ; base_path
	je	.L193	 ;,
.L212:
 ; ./asm_test/win/i/all.c:3895:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	movq	%rdi, %rcx	 ; base_path,
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:3896:     char* abs_path = create_string_check("", total_len, 0);
	xorl	%r8d, %r8d	 ;
	movq	%r12, %rcx	 ; tmp153,
 ; ./asm_test/win/i/all.c:3895:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	leaq	2(%rsi,%rax), %r13	 ;, total_len
 ; ./asm_test/win/i/all.c:3896:     char* abs_path = create_string_check("", total_len, 0);
	movq	%r13, %rdx	 ; total_len,
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3897:     sprintf(abs_path, "%s/%s", base_path, path);
	movq	%rdi, %r8	 ; base_path,
	movq	%rbx, %r9	 ; <retval>,
	movq	%rbp, %rdx	 ; tmp154,
 ; ./asm_test/win/i/all.c:3896:     char* abs_path = create_string_check("", total_len, 0);
	movq	%rax, %rsi	 ; tmp162, abs_path
 ; ./asm_test/win/i/all.c:3897:     sprintf(abs_path, "%s/%s", base_path, path);
	movq	%rax, %rcx	 ; abs_path,
 ; ./asm_test/win/i/all.c:3898:     return absolute_path(create_string_check(abs_path, total_len, 1), NULL);
	xorl	%edi, %edi	 ; base_path
 ; ./asm_test/win/i/all.c:3897:     sprintf(abs_path, "%s/%s", base_path, path);
	call	sprintf	 ;
 ; ./asm_test/win/i/all.c:3898:     return absolute_path(create_string_check(abs_path, total_len, 1), NULL);
	movq	%rsi, %rcx	 ; abs_path,
	movl	$1, %r8d	 ;,
	movq	%r13, %rdx	 ; total_len,
	call	create_string_check	 ;
	movq	%rax, %rcx	 ; tmp163, path
	jmp	.L213	 ;
.L193:
 ; ./asm_test/win/i/all.c:3899: }
	addq	$40, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
	.section .rdata,"dr"
.LC40:
	.ascii "%zu/%zu bytes\0"
.LC41:
	.ascii "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu\0"
	.text
	.def	get_info;	.scl	3;	.type	32;	.endef
get_info:
	pushq	%r12	 ;
	pushq	%rbp	 ;
 ; ./asm_test/win/i/all.c:656:     size_t stringCount = 0;
	xorl	%ebp, %ebp	 ; stringCount
 ; ./asm_test/win/i/all.c:655: char* get_info(void) {
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$64, %rsp	 ;,
 ; ./asm_test/win/i/all.c:657:     StringList* current = all_string_list;
	movq	all_string_list(%rip), %rax	 ; all_string_list, current
.L231:
 ; ./asm_test/win/i/all.c:658:     while (current != NULL) {
	testq	%rax, %rax	 ; current
	je	.L234	 ;,
 ; ./asm_test/win/i/all.c:660:         current = current->next;
	movq	16(%rax), %rax	 ; current_13->next, current
 ; ./asm_test/win/i/all.c:659:         stringCount++;
	incq	%rbp	 ; stringCount
	jmp	.L231	 ;
.L234:
 ; ./asm_test/win/i/all.c:662:     char* struct_memory_used_str = create_string_check("", 48, 0);
	leaq	.LC38(%rip), %rbx	 ;, tmp98
	xorl	%r8d, %r8d	 ;
	movl	$48, %edx	 ;,
	movq	%rbx, %rcx	 ; tmp98,
 ; ./asm_test/win/i/all.c:663:     sprintf(struct_memory_used_str, "%zu/%zu bytes", struct_memory_used + struct_memory->used, struct_memory_count);
	leaq	.LC40(%rip), %r12	 ;, tmp104
 ; ./asm_test/win/i/all.c:662:     char* struct_memory_used_str = create_string_check("", 48, 0);
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:663:     sprintf(struct_memory_used_str, "%zu/%zu bytes", struct_memory_used + struct_memory->used, struct_memory_count);
	movq	struct_memory_count(%rip), %r9	 ; struct_memory_count,
	movq	%r12, %rdx	 ; tmp104,
	movq	struct_memory_used(%rip), %r8	 ; struct_memory_used, struct_memory_used
 ; ./asm_test/win/i/all.c:662:     char* struct_memory_used_str = create_string_check("", 48, 0);
	movq	%rax, %rsi	 ; tmp116, struct_memory_used_str
 ; ./asm_test/win/i/all.c:663:     sprintf(struct_memory_used_str, "%zu/%zu bytes", struct_memory_used + struct_memory->used, struct_memory_count);
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory
	movq	%rsi, %rcx	 ; struct_memory_used_str,
	addq	8(%rax), %r8	 ; struct_memory.46_2->used,
	call	sprintf	 ;
 ; ./asm_test/win/i/all.c:664:     char* string_memory_used_str = create_string_check("", 48, 0);
	movq	%rbx, %rcx	 ; tmp98,
	xorl	%r8d, %r8d	 ;
	movl	$48, %edx	 ;,
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:665:     sprintf(string_memory_used_str, "%zu/%zu bytes", string_memory_used + string_memory->used, string_memory_count);
	movq	string_memory_count(%rip), %r9	 ; string_memory_count,
	movq	%r12, %rdx	 ; tmp104,
	movq	string_memory_used(%rip), %r8	 ; string_memory_used, string_memory_used
 ; ./asm_test/win/i/all.c:664:     char* string_memory_used_str = create_string_check("", 48, 0);
	movq	%rax, %rdi	 ; tmp117, string_memory_used_str
 ; ./asm_test/win/i/all.c:665:     sprintf(string_memory_used_str, "%zu/%zu bytes", string_memory_used + string_memory->used, string_memory_count);
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory
	movq	%rdi, %rcx	 ; string_memory_used_str,
	addq	8(%rax), %r8	 ; string_memory.49_7->used,
	call	sprintf	 ;
 ; ./asm_test/win/i/all.c:666:     char* info = (char*)create_string_check("", 240, 0);
	movq	%rbx, %rcx	 ; tmp98,
	xorl	%r8d, %r8d	 ;
	movl	$240, %edx	 ;,
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:667:     sprintf(info, "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu", 2, struct_memory_used_str, string_memory_used_str, stringCount, memoryBlockCount);
	movq	%rbp, 40(%rsp)	 ; stringCount,
	movq	%rsi, %r9	 ; struct_memory_used_str,
	movl	$2, %r8d	 ;,
 ; ./asm_test/win/i/all.c:666:     char* info = (char*)create_string_check("", 240, 0);
	movq	%rax, %rbx	 ; tmp118, <retval>
 ; ./asm_test/win/i/all.c:667:     sprintf(info, "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu", 2, struct_memory_used_str, string_memory_used_str, stringCount, memoryBlockCount);
	movq	memoryBlockCount(%rip), %rax	 ; memoryBlockCount, memoryBlockCount
	movq	%rdi, 32(%rsp)	 ; string_memory_used_str,
	leaq	.LC41(%rip), %rdx	 ;, tmp114
	movq	%rbx, %rcx	 ; <retval>,
	movq	%rax, 48(%rsp)	 ; memoryBlockCount,
	call	sprintf	 ;
 ; ./asm_test/win/i/all.c:669: }
	addq	$64, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.section .rdata,"dr"
.LC42:
	.ascii "%s.%s\0"
	.text
	.def	make_method_name;	.scl	3;	.type	32;	.endef
make_method_name:
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp101, method_name
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp100, class_name
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1193:     char* name = create_string_check("", strlen(class_name) + strlen(method_name) + 2, 1);
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:1193:     char* name = create_string_check("", strlen(class_name) + strlen(method_name) + 2, 1);
	movq	%rdi, %rcx	 ; method_name,
 ; ./asm_test/win/i/all.c:1193:     char* name = create_string_check("", strlen(class_name) + strlen(method_name) + 2, 1);
	movq	%rax, %rbx	 ; tmp102, tmp90
 ; ./asm_test/win/i/all.c:1193:     char* name = create_string_check("", strlen(class_name) + strlen(method_name) + 2, 1);
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:1193:     char* name = create_string_check("", strlen(class_name) + strlen(method_name) + 2, 1);
	movl	$1, %r8d	 ;,
	leaq	.LC38(%rip), %rcx	 ;, tmp97
	leaq	2(%rbx,%rax), %rdx	 ;, tmp96
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:1194:     sprintf(name, "%s.%s", class_name, method_name);
	movq	%rdi, %r9	 ; method_name,
	movq	%rsi, %r8	 ; class_name,
	leaq	.LC42(%rip), %rdx	 ;, tmp98
	movq	%rax, %rcx	 ; <retval>,
 ; ./asm_test/win/i/all.c:1193:     char* name = create_string_check("", strlen(class_name) + strlen(method_name) + 2, 1);
	movq	%rax, %rbx	 ; tmp104, <retval>
 ; ./asm_test/win/i/all.c:1194:     sprintf(name, "%s.%s", class_name, method_name);
	call	sprintf	 ;
 ; ./asm_test/win/i/all.c:1196: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.section .rdata,"dr"
.LC43:
	.ascii "/\0"
	.text
	.def	get_file_dir;	.scl	3;	.type	32;	.endef
get_file_dir:
 ; ./asm_test/win/i/all.c:3901:     if (path->dirs == NULL) return 0;
	movq	(%rcx), %rax	 ; path_31(D)->dirs, <retval>
 ; ./asm_test/win/i/all.c:3901:     if (path->dirs == NULL) return 0;
	testq	%rax, %rax	 ; <retval>
	je	.L258	 ;,
 ; ./asm_test/win/i/all.c:3900: char* get_file_dir(File* path) {
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp124, path
	pushq	%rsi	 ;
 ; ./asm_test/win/i/all.c:3903:     size_t node_count = 0;
	xorl	%esi, %esi	 ; node_count
 ; ./asm_test/win/i/all.c:3900: char* get_file_dir(File* path) {
	pushq	%rbx	 ;
 ; ./asm_test/win/i/all.c:3902:     size_t total_len = 0;
	xorl	%ebx, %ebx	 ; total_len
 ; ./asm_test/win/i/all.c:3900: char* get_file_dir(File* path) {
	subq	$40, %rsp	 ;,
.L240:
 ; ./asm_test/win/i/all.c:3906:         if (current->next != NULL) {
	movq	8(%rax), %rbp	 ; current_53->next, _2
 ; ./asm_test/win/i/all.c:3906:         if (current->next != NULL) {
	testq	%rbp, %rbp	 ; _2
	je	.L239	 ;,
 ; ./asm_test/win/i/all.c:3907:             size_t dir_len = strlen(current->dir);
	movq	(%rax), %rcx	 ; current_53->dir,
 ; ./asm_test/win/i/all.c:3909:             node_count++;
	incq	%rsi	 ; node_count
 ; ./asm_test/win/i/all.c:3907:             size_t dir_len = strlen(current->dir);
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:3908:             total_len += dir_len;
	addq	%rax, %rbx	 ; tmp125, total_len
 ; ./asm_test/win/i/all.c:3909:             node_count++;
	movq	%rbp, %rax	 ; _2, <retval>
	jmp	.L240	 ;
.L239:
 ; ./asm_test/win/i/all.c:3913:     if (node_count == 0) return NULL;
	testq	%rsi, %rsi	 ; node_count
	je	.L237	 ;,
 ; ./asm_test/win/i/all.c:3914:     if (node_count > 1)
	cmpq	$1, %rsi	 ;, node_count
	je	.L241	 ;,
 ; ./asm_test/win/i/all.c:3915:         total_len += node_count - 1;
	leaq	-1(%rbx,%rsi), %rbx	 ;, total_len
.L241:
 ; ./asm_test/win/i/all.c:3916:     char* dir_path = create_string_check("", total_len + 1, 0);
	leaq	1(%rbx), %rdx	 ;, tmp107
	xorl	%r8d, %r8d	 ;
	leaq	.LC38(%rip), %rcx	 ;, tmp108
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3917:     dir_path[0] = '\0';
	movb	$0, (%rax)	 ;, *dir_path_36
 ; ./asm_test/win/i/all.c:3916:     char* dir_path = create_string_check("", total_len + 1, 0);
	movq	%rax, %rbx	 ; tmp126, dir_path
 ; ./asm_test/win/i/all.c:3918:     current = path->dirs;
	movq	(%rdi), %rsi	 ; path_31(D)->dirs, current
 ; ./asm_test/win/i/all.c:3919:     char first = 1;
	movb	$1, %al	 ;, first
 ; ./asm_test/win/i/all.c:3922:             if (!first && strcmp(current->dir, "/") != 0)
	leaq	.LC43(%rip), %rdi	 ;, tmp123
.L242:
 ; ./asm_test/win/i/all.c:3920:     while (current != NULL) {
	testq	%rsi, %rsi	 ; current
	je	.L261	 ;,
 ; ./asm_test/win/i/all.c:3921:         if (current->next != NULL) {
	cmpq	$0, 8(%rsi)	 ;, current_22->next
	je	.L243	 ;,
 ; ./asm_test/win/i/all.c:3922:             if (!first && strcmp(current->dir, "/") != 0)
	testb	%al, %al	 ; first
	jne	.L244	 ;,
 ; ./asm_test/win/i/all.c:3922:             if (!first && strcmp(current->dir, "/") != 0)
	movq	(%rsi), %rcx	 ; current_22->dir,
	movq	%rdi, %rdx	 ; tmp123,
	call	strcmp	 ;
 ; ./asm_test/win/i/all.c:3922:             if (!first && strcmp(current->dir, "/") != 0)
	testl	%eax, %eax	 ; tmp127
	je	.L244	 ;,
 ; ./asm_test/win/i/all.c:3923:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$0, (%rbx)	 ;, MEM[(const char *)dir_path_36]
	je	.L244	 ;,
 ; ./asm_test/win/i/all.c:3923:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	movq	%rbx, %rcx	 ; dir_path,
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:3923:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$47, -1(%rbx,%rax)	 ;, *_12
	je	.L244	 ;,
 ; ./asm_test/win/i/all.c:3924:                     strcat(dir_path, "/");
	movq	%rdi, %rdx	 ; tmp123,
	movq	%rbx, %rcx	 ; dir_path,
	call	strcat	 ;
.L244:
 ; ./asm_test/win/i/all.c:3925:             strcat(dir_path, current->dir);
	movq	(%rsi), %rdx	 ; current_22->dir,
	movq	%rbx, %rcx	 ; dir_path,
	call	strcat	 ;
 ; ./asm_test/win/i/all.c:3926:             first = 0;
	xorl	%eax, %eax	 ; first
.L243:
 ; ./asm_test/win/i/all.c:3928:         current = current->next;
	movq	8(%rsi), %rsi	 ; current_22->next, current
	jmp	.L242	 ;
.L261:
 ; ./asm_test/win/i/all.c:3930:     return create_string_check(dir_path, strlen(dir_path), 1);
	movq	%rbx, %rcx	 ; dir_path,
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:3931: }
	addq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3930:     return create_string_check(dir_path, strlen(dir_path), 1);
	movq	%rbx, %rcx	 ; dir_path,
	movl	$1, %r8d	 ;,
 ; ./asm_test/win/i/all.c:3931: }
	popq	%rbx	 ;
 ; ./asm_test/win/i/all.c:3930:     return create_string_check(dir_path, strlen(dir_path), 1);
	movq	%rax, %rdx	 ; tmp129, tmp117
 ; ./asm_test/win/i/all.c:3931: }
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; ./asm_test/win/i/all.c:3930:     return create_string_check(dir_path, strlen(dir_path), 1);
	jmp	create_string_check	 ;
.L237:
 ; ./asm_test/win/i/all.c:3931: }
	addq	$40, %rsp	 ;,
	xorl	%eax, %eax	 ;
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L258:
	xorl	%eax, %eax	 ;
	ret	
	.section .rdata,"dr"
.LC44:
	.ascii "%s/%s%s\0"
.LC45:
	.ascii "%s%s\0"
	.text
	.def	rebuild_full_path;	.scl	3;	.type	32;	.endef
rebuild_full_path:
	pushq	%r14	 ;
	pushq	%r13	 ;
	leaq	.LC38(%rip), %r13	 ;, iftmp.89_14
	pushq	%r12	 ;
 ; ./asm_test/win/i/all.c:3934:     char* dir_cstr = dir != NULL ? dir : "";
	movq	%r13, %r12	 ; iftmp.89_14, iftmp.89_14
 ; ./asm_test/win/i/all.c:3932: void rebuild_full_path(File* file) {
	pushq	%rbp	 ;
 ; ./asm_test/win/i/all.c:3935:     char* ext_cstr = file->extension != NULL ? file->extension : "";
	movq	%r13, %rbp	 ; iftmp.89_14, iftmp.90_15
 ; ./asm_test/win/i/all.c:3932: void rebuild_full_path(File* file) {
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp130, file
	subq	$48, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3933:     char* dir = get_file_dir(file);
	call	get_file_dir	 ;
 ; ./asm_test/win/i/all.c:3935:     char* ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rbx), %r14	 ; file_18(D)->extension, _1
 ; ./asm_test/win/i/all.c:3934:     char* dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	 ; dir
 ; ./asm_test/win/i/all.c:3933:     char* dir = get_file_dir(file);
	movq	%rax, %rdi	 ; tmp131, dir
 ; ./asm_test/win/i/all.c:3934:     char* dir_cstr = dir != NULL ? dir : "";
	cmovne	%rax, %r12	 ; dir,, iftmp.89_14
 ; ./asm_test/win/i/all.c:3935:     char* ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%r14, %r14	 ; _1
	cmovne	%r14, %rbp	 ; _1,, iftmp.90_15
 ; ./asm_test/win/i/all.c:3936:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%r12, %rcx	 ; iftmp.89_14,
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:3936:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rcx	 ; file_18(D)->name, file_18(D)->name
 ; ./asm_test/win/i/all.c:3936:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%rax, %rsi	 ; tmp132, tmp101
 ; ./asm_test/win/i/all.c:3936:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:3936:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%rsi,%rax), %rsi	 ;, path_len
 ; ./asm_test/win/i/all.c:3937:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	testq	%r14, %r14	 ; _1
	je	.L265	 ;,
 ; ./asm_test/win/i/all.c:3937:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	movq	%rbp, %rcx	 ; iftmp.90_15,
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:3937:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	addq	%rax, %rsi	 ; tmp134, path_len
.L265:
 ; ./asm_test/win/i/all.c:3938:     char* new_path = create_string_check("", path_len + 1, 0);
	xorl	%r8d, %r8d	 ;
	leaq	1(%rsi), %rdx	 ;, tmp111
	movq	%r13, %rcx	 ; iftmp.89_14,
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3939:     if (dir != NULL && strlen(dir_cstr) > 0)
	testq	%rdi, %rdi	 ; dir
	movq	16(%rbx), %r8	 ; file_18(D)->name, file_18(D)->name
 ; ./asm_test/win/i/all.c:3938:     char* new_path = create_string_check("", path_len + 1, 0);
	movq	%rax, %rsi	 ; tmp135, new_path
 ; ./asm_test/win/i/all.c:3939:     if (dir != NULL && strlen(dir_cstr) > 0)
	je	.L266	 ;,
 ; ./asm_test/win/i/all.c:3939:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpb	$0, (%r12)	 ;, MEM[(const char *)iftmp.89_14]
	je	.L266	 ;,
 ; ./asm_test/win/i/all.c:3940:         sprintf(new_path, "%s/%s%s", dir_cstr, file->name, ext_cstr);
	movq	%rbp, 32(%rsp)	 ; iftmp.90_15,
	movq	%r8, %r9	 ; file_18(D)->name,
	leaq	.LC44(%rip), %rdx	 ;, tmp114
	movq	%r12, %r8	 ; iftmp.89_14,
	movq	%rax, %rcx	 ; new_path,
	call	sprintf	 ;
	jmp	.L267	 ;
.L266:
 ; ./asm_test/win/i/all.c:3942:         sprintf(new_path, "%s%s", file->name, ext_cstr);
	movq	%rbp, %r9	 ; iftmp.90_15,
	leaq	.LC45(%rip), %rdx	 ;, tmp116
	movq	%rsi, %rcx	 ; new_path,
	call	sprintf	 ;
.L267:
 ; ./asm_test/win/i/all.c:3943:     file->path = create_string_check(new_path, strlen(new_path), 1);
	movq	%rsi, %rcx	 ; new_path,
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:3943:     file->path = create_string_check(new_path, strlen(new_path), 1);
	movq	%rsi, %rcx	 ; new_path,
	movl	$1, %r8d	 ;,
 ; ./asm_test/win/i/all.c:3943:     file->path = create_string_check(new_path, strlen(new_path), 1);
	movq	%rax, %rdx	 ; tmp136, tmp118
 ; ./asm_test/win/i/all.c:3943:     file->path = create_string_check(new_path, strlen(new_path), 1);
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
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
	.def	read_source.constprop.0;	.scl	3;	.type	32;	.endef
read_source.constprop.0:
	pushq	%rdi	 ;
 ; ./asm_test/win/i/all.c:893:     fseek(file, 0, SEEK_END);
	movl	$2, %r8d	 ;,
 ; ./asm_test/win/i/all.c:892: char* read_source(FILE* file, size_t* length) {
	movq	%rcx, %rdi	 ; tmp104, file
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp105, length
 ; ./asm_test/win/i/all.c:893:     fseek(file, 0, SEEK_END);
	xorl	%edx, %edx	 ;
 ; ./asm_test/win/i/all.c:892: char* read_source(FILE* file, size_t* length) {
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; ./asm_test/win/i/all.c:893:     fseek(file, 0, SEEK_END);
	call	fseek	 ;
 ; ./asm_test/win/i/all.c:894:     *length = (size_t)ftell(file);
	movq	%rdi, %rcx	 ; file,
	call	ftell	 ;
 ; ./asm_test/win/i/all.c:895:     fseek(file, 0, SEEK_SET);
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rdi, %rcx	 ; file,
 ; ./asm_test/win/i/all.c:894:     *length = (size_t)ftell(file);
	cltq
	movq	%rax, (%rsi)	 ; _2, *length_4(D)
 ; ./asm_test/win/i/all.c:895:     fseek(file, 0, SEEK_SET);
	call	fseek	 ;
 ; ./asm_test/win/i/all.c:896:     char* source = create_string_check("", *length + 1, 0);
	movq	(%rsi), %rax	 ; *length_4(D), tmp111
	xorl	%r8d, %r8d	 ;
	leaq	.LC38(%rip), %rcx	 ;, tmp99
	leaq	1(%rax), %rdx	 ;, tmp97
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:897:     size_t bytes_read = fread(source, 1, *length, file);
	movq	(%rsi), %r8	 ; *length_4(D),
	movq	%rdi, %r9	 ; file,
	movl	$1, %edx	 ;,
	movq	%rax, %rcx	 ; <retval>,
 ; ./asm_test/win/i/all.c:896:     char* source = create_string_check("", *length + 1, 0);
	movq	%rax, %rbx	 ; tmp107, <retval>
 ; ./asm_test/win/i/all.c:897:     size_t bytes_read = fread(source, 1, *length, file);
	call	fread	 ;
 ; ./asm_test/win/i/all.c:898:     source[bytes_read] = '\0';
	movb	$0, (%rbx,%rax)	 ;, *_10
 ; ./asm_test/win/i/all.c:899:     *length = bytes_read;
	movq	%rax, (%rsi)	 ; bytes_read, *length_4(D)
 ; ./asm_test/win/i/all.c:900:     for (size_t i = 0; i < *length; ++i) {
	xorl	%eax, %eax	 ; i
.L278:
 ; ./asm_test/win/i/all.c:900:     for (size_t i = 0; i < *length; ++i) {
	cmpq	(%rsi), %rax	 ; *length_4(D), i
	jnb	.L282	 ;,
 ; ./asm_test/win/i/all.c:901:         if (source[i] == '\r' || source[i] == '\t')
	movb	(%rbx,%rax), %dl	 ; MEM[(char *)source_7 + i_11 * 1], tmp100
	andl	$-5, %edx	 ;, tmp100
 ; ./asm_test/win/i/all.c:901:         if (source[i] == '\r' || source[i] == '\t')
	cmpb	$9, %dl	 ;, tmp100
	jne	.L279	 ;,
 ; ./asm_test/win/i/all.c:902:             source[i] = ' ';
	movb	$32, (%rbx,%rax)	 ;, MEM[(char *)source_7 + i_11 * 1]
.L279:
 ; ./asm_test/win/i/all.c:900:     for (size_t i = 0; i < *length; ++i) {
	incq	%rax	 ; i
	jmp	.L278	 ;
.L282:
 ; ./asm_test/win/i/all.c:905: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.def	create_lexer;	.scl	3;	.type	32;	.endef
create_lexer:
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp87, source
 ; ./asm_test/win/i/all.c:1276:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	movl	$88, %ecx	 ;,
 ; ./asm_test/win/i/all.c:1275: Lexer* create_lexer(char* source, size_t length, char* filename) {
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp88, length
	pushq	%rbx	 ;
	movq	%r8, %rbx	 ; tmp89, filename
	subq	$32, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1276:     Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:1283:     lexer->peeked_position = 0;
	xorl	%ecx, %ecx	 ;
 ; ./asm_test/win/i/all.c:1278:     lexer->position = 0;
	xorl	%edx, %edx	 ;
 ; ./asm_test/win/i/all.c:1277:     lexer->source = source;
	movq	%rdi, 8(%rax)	 ; source, lexer_3->source
 ; ./asm_test/win/i/all.c:1278:     lexer->position = 0;
	movq	%rdx, 16(%rax)	 ;, lexer_3->position
 ; ./asm_test/win/i/all.c:1279:     lexer->length = length;
	movq	%rsi, 24(%rax)	 ; length, lexer_3->length
 ; ./asm_test/win/i/all.c:1283:     lexer->peeked_position = 0;
	movq	%rcx, 32(%rax)	 ;, lexer_3->line
	movq	%rcx, 40(%rax)	 ;, lexer_3->column
	movq	%rcx, 48(%rax)	 ;, lexer_3->peeked_token
 ; ./asm_test/win/i/all.c:1285:     lexer->peeked_column = 0;
	movq	%rcx, 56(%rax)	 ;, lexer_3->peeked_position
	movq	%rcx, 64(%rax)	 ;, lexer_3->peeked_line
 ; ./asm_test/win/i/all.c:1286:     lexer->current_token = NULL;
	movq	%rcx, 72(%rax)	 ;, lexer_3->peeked_column
	movq	%rcx, 80(%rax)	 ;, lexer_3->current_token
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
	movl	%ecx, %ebp	 ; tmp88, type
 ; ./asm_test/win/i/all.c:1291:     Token* token = (Token*)alloc_memory(sizeof(Token));
	movl	$32, %ecx	 ;,
 ; ./asm_test/win/i/all.c:1290: Token* create_token(TokenType type, char* lexeme, size_t line, size_t column) {
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp89, lexeme
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp90, line
	pushq	%rbx	 ;
	movq	%r9, %rbx	 ; tmp91, column
	subq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1291:     Token* token = (Token*)alloc_memory(sizeof(Token));
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
 ; ./asm_test/win/i/all.c:1013:     new_list->tail = NULL;
	xorl	%edx, %edx	 ;
	movq	%rdx, (%rax)	 ;, new_list_3->head
	movq	%rdx, 8(%rax)	 ;, new_list_3->tail
 ; ./asm_test/win/i/all.c:1015: }
	addq	$40, %rsp	 ;,
	ret	
	.def	list_copy;	.scl	3;	.type	32;	.endef
list_copy:
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp88, original
	subq	$32, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1037:     if (original == NULL)
	testq	%rcx, %rcx	 ; original
	je	.L290	 ;,
 ; ./asm_test/win/i/all.c:1039:     List* new_list = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:1040:     new_list->head = original->head;
	movq	(%rbx), %rdx	 ; original_5(D)->head, _1
 ; ./asm_test/win/i/all.c:1040:     new_list->head = original->head;
	movq	%rdx, (%rax)	 ; _1, new_list_8->head
 ; ./asm_test/win/i/all.c:1041:     new_list->tail = original->tail;
	movq	8(%rbx), %rdx	 ; original_5(D)->tail, _2
 ; ./asm_test/win/i/all.c:1042:     return new_list;
	movq	%rax, %rbx	 ; new_list, original
 ; ./asm_test/win/i/all.c:1041:     new_list->tail = original->tail;
	movq	%rdx, 8(%rax)	 ; _2, new_list_8->tail
.L290:
 ; ./asm_test/win/i/all.c:1043: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; original,
	popq	%rbx	 ;
	ret	
	.section .rdata,"dr"
.LC46:
	.ascii "type: \"name\"\12\0"
.LC47:
	.ascii "name\12\0"
.LC48:
	.ascii "type: \"function_call\"\12\0"
.LC49:
	.ascii "function\12\0"
.LC50:
	.ascii "arguments\12\0"
.LC51:
	.ascii "arguments[%d]\12\0"
.LC52:
	.ascii "type: \"get sequence_element\"\12\0"
.LC53:
	.ascii "sequence\12\0"
.LC54:
	.ascii "index\12\0"
.LC55:
	.ascii "type: \"get_attribute\"\12\0"
.LC56:
	.ascii "object\12\0"
.LC57:
	.ascii "attribute_name\12\0"
.LC58:
	.ascii "unknown_VariableAccessType: %u\12\0"
	.text
	.def	output_variable_access;	.scl	3;	.type	32;	.endef
output_variable_access:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp126, variable_access
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp128, indent
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp129, indent_has_next
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp127, outfile
	subq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1865:     switch (variable_access->type) {
	movl	16(%rcx), %eax	 ; variable_access_19(D)->type, _1
 ; ./asm_test/win/i/all.c:1865:     switch (variable_access->type) {
	cmpl	$2, %eax	 ;, _1
	je	.L296	 ;,
	ja	.L297	 ;,
	testl	%eax, %eax	 ; _1
	leaq	1(%r8), %r13	 ;, _5
	jne	.L305	 ;,
 ; ./asm_test/win/i/all.c:1867:             indention(outfile, indent, 0, indent_has_next);
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1868:             fprintf(outfile, "type: \"name\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC46(%rip), %rcx	 ;, tmp103
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1869:             indention(outfile, indent, 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1870:             fprintf(outfile, "name\n");
	leaq	.LC47(%rip), %rcx	 ;, tmp104
	movq	%rbx, %rdx	 ; outfile,
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1871:             output_name(variable_access->content.name, outfile, indent + 1, indent_has_next);
	movq	8(%rbp), %rcx	 ; variable_access_19(D)->content.name, variable_access_19(D)->content.name
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r13, %r8	 ; _5,
	jmp	.L309	 ;
.L297:
 ; ./asm_test/win/i/all.c:1865:     switch (variable_access->type) {
	cmpl	$3, %eax	 ;, _1
	jne	.L310	 ;,
 ; ./asm_test/win/i/all.c:1891:             indention(outfile, indent, 0, indent_has_next);
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
 ; ./asm_test/win/i/all.c:1895:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%rdi), %r12	 ;, _8
 ; ./asm_test/win/i/all.c:1891:             indention(outfile, indent, 0, indent_has_next);
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1892:             fprintf(outfile, "type: \"get sequence_element\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC52(%rip), %rcx	 ;, tmp113
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1893:             indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1894:             fprintf(outfile, "sequence\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC53(%rip), %rcx	 ;, tmp114
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1895:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %rcx	 ; variable_access_19(D)->base,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _8,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; ./asm_test/win/i/all.c:1896:             indention(outfile, indent, 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1897:             fprintf(outfile, "index\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC54(%rip), %rcx	 ;, tmp115
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1898:             output_expression(variable_access->content.index, outfile, indent + 1, indent_has_next);
	movq	8(%rbp), %rcx	 ; variable_access_19(D)->content.index, variable_access_19(D)->content.index
 ; ./asm_test/win/i/all.c:1915: }
	addq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1898:             output_expression(variable_access->content.index, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _8,
	movq	%rbx, %rdx	 ; outfile,
 ; ./asm_test/win/i/all.c:1915: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; ./asm_test/win/i/all.c:1898:             output_expression(variable_access->content.index, outfile, indent + 1, indent_has_next);
	jmp	output_expression	 ;
.L305:
 ; ./asm_test/win/i/all.c:1874:             args = list_copy(variable_access->content.args);
	movq	8(%rcx), %rcx	 ; variable_access_19(D)->content.args, variable_access_19(D)->content.args
 ; ./asm_test/win/i/all.c:1886:                 fprintf(outfile, "arguments[%d]\n", ++index);
	leaq	.LC51(%rip), %r14	 ;, tmp124
 ; ./asm_test/win/i/all.c:1874:             args = list_copy(variable_access->content.args);
	call	list_copy	 ;
 ; ./asm_test/win/i/all.c:1875:             indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
 ; ./asm_test/win/i/all.c:1874:             args = list_copy(variable_access->content.args);
	movq	%rax, %r12	 ; tmp130, args
 ; ./asm_test/win/i/all.c:1875:             indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1876:             fprintf(outfile, "type: \"function_call\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC48(%rip), %rcx	 ;, tmp108
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1877:             indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1878:             fprintf(outfile, "function\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC49(%rip), %rcx	 ;, tmp109
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1879:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %rcx	 ; variable_access_19(D)->base,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r13, %r8	 ; _5,
	movq	%rbx, %rdx	 ; outfile,
 ; ./asm_test/win/i/all.c:1883:             index = -1;
	orl	$-1, %ebp	 ;, index
 ; ./asm_test/win/i/all.c:1879:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	call	output_variable_access	 ;
 ; ./asm_test/win/i/all.c:1880:             indention(outfile, indent, 1, indent_has_next);
	movq	%rdi, %rdx	 ; indent,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
 ; ./asm_test/win/i/all.c:1887:                 output_expression(arg, outfile, indent + 2, indent_has_next);
	addq	$2, %rdi	 ;, tmp125
 ; ./asm_test/win/i/all.c:1880:             indention(outfile, indent, 1, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1881:             fprintf(outfile, "arguments\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC50(%rip), %rcx	 ;, tmp110
	call	fputs	 ;
.L302:
 ; ./asm_test/win/i/all.c:1884:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	movq	%r12, %rcx	 ; args,
	call	list_pop	 ;
	movq	%rax, %r15	 ; tmp131, arg
 ; ./asm_test/win/i/all.c:1884:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg
	je	.L311	 ;,
 ; ./asm_test/win/i/all.c:1885:                 indention(outfile, indent + 1, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%r13, %rdx	 ; _5,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1886:                 fprintf(outfile, "arguments[%d]\n", ++index);
	incl	%ebp	 ; index
	movq	%r14, %rdx	 ; tmp124,
	movq	%rbx, %rcx	 ; outfile,
	movl	%ebp, %r8d	 ; index,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1887:                 output_expression(arg, outfile, indent + 2, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %r8	 ; tmp125,
	movq	%rbx, %rdx	 ; outfile,
	movq	%r15, %rcx	 ; arg,
	call	output_expression	 ;
	jmp	.L302	 ;
.L296:
 ; ./asm_test/win/i/all.c:1901:             indention(outfile, indent, 0, indent_has_next);
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
 ; ./asm_test/win/i/all.c:1905:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	leaq	1(%rdi), %r12	 ;, _11
 ; ./asm_test/win/i/all.c:1901:             indention(outfile, indent, 0, indent_has_next);
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1902:             fprintf(outfile, "type: \"get_attribute\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC55(%rip), %rcx	 ;, tmp117
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1903:             indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1904:             fprintf(outfile, "object\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC56(%rip), %rcx	 ;, tmp118
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1905:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %rcx	 ; variable_access_19(D)->base,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _11,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; ./asm_test/win/i/all.c:1906:             indention(outfile, indent, 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1907:             fprintf(outfile, "attribute_name\n");
	leaq	.LC57(%rip), %rcx	 ;, tmp119
	movq	%rbx, %rdx	 ; outfile,
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1908:             output_name(variable_access->content.attr_name, outfile, indent + 1, indent_has_next);
	movq	8(%rbp), %rcx	 ; variable_access_19(D)->content.attr_name, variable_access_19(D)->content.attr_name
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _11,
.L309:
 ; ./asm_test/win/i/all.c:1915: }
	addq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1908:             output_name(variable_access->content.attr_name, outfile, indent + 1, indent_has_next);
	movq	%rbx, %rdx	 ; outfile,
 ; ./asm_test/win/i/all.c:1915: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; ./asm_test/win/i/all.c:1908:             output_name(variable_access->content.attr_name, outfile, indent + 1, indent_has_next);
	jmp	output_name	 ;
.L310:
 ; ./asm_test/win/i/all.c:1911:             indention(outfile, indent, 1, indent_has_next);
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1912:             fprintf(outfile, "unknown_VariableAccessType: %u\n", variable_access->type);
	movl	16(%rbp), %r8d	 ; variable_access_19(D)->type,
 ; ./asm_test/win/i/all.c:1915: }
	addq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1912:             fprintf(outfile, "unknown_VariableAccessType: %u\n", variable_access->type);
	movq	%rbx, %rcx	 ; outfile,
	leaq	.LC58(%rip), %rdx	 ;, tmp122
 ; ./asm_test/win/i/all.c:1915: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; ./asm_test/win/i/all.c:1912:             fprintf(outfile, "unknown_VariableAccessType: %u\n", variable_access->type);
	jmp	fprintf	 ;
.L311:
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
	.section .rdata,"dr"
.LC59:
	.ascii "UNKNOWN_OPERATOR\0"
.LC60:
	.ascii "primary\12\0"
.LC61:
	.ascii "type: \"integer\"\12\0"
.LC62:
	.ascii "value: %s\12\0"
.LC63:
	.ascii "type: \"float\"\12\0"
.LC64:
	.ascii "type: \"string\"\12\0"
.LC65:
	.ascii "value: \"%s\"\12\0"
.LC66:
	.ascii "type: \"boolean\"\12\0"
.LC67:
	.ascii "value: \"true\"\12\0"
.LC68:
	.ascii "value: \"false\"\12\0"
.LC69:
	.ascii "type: \"expression\"\12\0"
.LC70:
	.ascii "value\12\0"
.LC71:
	.ascii "type: \"!\"\12\0"
.LC72:
	.ascii "type: \"-\"\12\0"
.LC73:
	.ascii "type: \"variable\"\12\0"
.LC74:
	.ascii "unknown_PrimaryType: %u\12\0"
.LC75:
	.ascii "operator: \"%s\"\12\0"
.LC76:
	.ascii "left\12\0"
.LC77:
	.ascii "right\12\0"
	.text
	.def	output_expression;	.scl	3;	.type	32;	.endef
output_expression:
	pushq	%r15	 ;
	pushq	%r14	 ;
 ; ./asm_test/win/i/all.c:1787:         fprintf(outfile, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	leaq	.LC59(%rip), %r14	 ;, iftmp.85_9
 ; ./asm_test/win/i/all.c:1779: void output_expression(Expression* expression, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%r13	 ;
 ; ./asm_test/win/i/all.c:1251:     switch (op) {
	leaq	.L330(%rip), %r13	 ;, tmp157
 ; ./asm_test/win/i/all.c:1779: void output_expression(Expression* expression, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%r12	 ;
	movq	%rcx, %r12	 ; tmp161, expression
	pushq	%rbp	 ;
	movq	%r8, %rbp	 ; tmp163, indent
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp164, indent_has_next
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp162, outfile
	subq	$40, %rsp	 ;,
.L350:
 ; ./asm_test/win/i/all.c:1780:     if (expression->operator == OP_NONE) {
	movl	24(%r12), %eax	 ; expression_11->operator,
 ; ./asm_test/win/i/all.c:1780:     if (expression->operator == OP_NONE) {
	cmpl	$19, %eax	 ;, _1
	jne	.L313	 ;,
 ; ./asm_test/win/i/all.c:1781:         indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %rdx	 ; indent,
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1782:         fprintf(outfile, "primary\n");
	movq	%rbx, %rdx	 ; outfile,
	addq	$2, %rbp	 ;, indent
	leaq	.LC60(%rip), %rcx	 ;, tmp98
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1783:         output_primary(expression->prim_left, outfile, indent + 1, indent_has_next);
	movq	8(%r12), %r12	 ; expression_11->prim_left, primary
 ; ./asm_test/win/i/all.c:1797:     switch (primary->type) {
	leaq	.L317(%rip), %r15	 ;, tmp156
.L314:
	cmpl	$8, 8(%r12)	 ;, primary_27->type
	leaq	-1(%rbp), %rdi	 ;, indent
	ja	.L315	 ;,
	movl	8(%r12), %eax	 ; primary_27->type, primary_27->type
 ; ./asm_test/win/i/all.c:1850:             indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
 ; ./asm_test/win/i/all.c:1797:     switch (primary->type) {
	movslq	(%r15,%rax,4), %rax	 ;, tmp102
	addq	%r15, %rax	 ; tmp156, tmp103
	jmp	*%rax	 ; tmp103
	.section .rdata,"dr"
	.align 4
.L317:
	.long	.L325-.L317
	.long	.L324-.L317
	.long	.L323-.L317
	.long	.L322-.L317
	.long	.L321-.L317
	.long	.L320-.L317
	.long	.L319-.L317
	.long	.L318-.L317
	.long	.L316-.L317
	.text
.L325:
 ; ./asm_test/win/i/all.c:1799:             indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1800:             fprintf(outfile, "type: \"integer\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC61(%rip), %rcx	 ;, tmp105
	jmp	.L355	 ;
.L324:
 ; ./asm_test/win/i/all.c:1805:             indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1806:             fprintf(outfile, "type: \"float\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC63(%rip), %rcx	 ;, tmp107
.L355:
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1807:             indention(outfile, indent, 1, indent_has_next);
	movq	%rdi, %rdx	 ; indent,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1808:             fprintf(outfile, "value: %s\n", primary->value.literal_value);
	movq	(%r12), %r8	 ; primary_27->value.literal_value,
	leaq	.LC62(%rip), %rdx	 ;, tmp108
.L356:
 ; ./asm_test/win/i/all.c:1795: }
	addq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1808:             fprintf(outfile, "value: %s\n", primary->value.literal_value);
	movq	%rbx, %rcx	 ; outfile,
 ; ./asm_test/win/i/all.c:1795: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; ./asm_test/win/i/all.c:1808:             fprintf(outfile, "value: %s\n", primary->value.literal_value);
	jmp	fprintf	 ;
.L323:
 ; ./asm_test/win/i/all.c:1811:             indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1812:             fprintf(outfile, "type: \"string\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC64(%rip), %rcx	 ;, tmp109
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1813:             indention(outfile, indent, 1, indent_has_next);
	movq	%rdi, %rdx	 ; indent,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1814:             fprintf(outfile, "value: \"%s\"\n", primary->value.literal_value);
	movq	(%r12), %r8	 ; primary_27->value.literal_value,
	leaq	.LC65(%rip), %rdx	 ;, tmp110
	jmp	.L356	 ;
.L322:
 ; ./asm_test/win/i/all.c:1817:             indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1818:             fprintf(outfile, "type: \"boolean\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC66(%rip), %rcx	 ;, tmp111
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1819:             indention(outfile, indent, 1, indent_has_next);
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1820:             fprintf(outfile, "value: \"true\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC67(%rip), %rcx	 ;, tmp112
	jmp	.L357	 ;
.L321:
 ; ./asm_test/win/i/all.c:1823:             indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1824:             fprintf(outfile, "type: \"boolean\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC66(%rip), %rcx	 ;, tmp113
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1825:             indention(outfile, indent, 1, indent_has_next);
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1826:             fprintf(outfile, "value: \"false\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC68(%rip), %rcx	 ;, tmp114
.L357:
 ; ./asm_test/win/i/all.c:1795: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; ./asm_test/win/i/all.c:1826:             fprintf(outfile, "value: \"false\"\n");
	jmp	fputs	 ;
.L320:
 ; ./asm_test/win/i/all.c:1829:             indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1830:             fprintf(outfile, "type: \"expression\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC69(%rip), %rcx	 ;, tmp115
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1831:             indention(outfile, indent, 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1832:             fprintf(outfile, "value\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC70(%rip), %rcx	 ;, tmp116
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1833:             output_expression(primary->value.expr, outfile, indent + 1, indent_has_next);
	movq	(%r12), %r12	 ; primary_27->value.expr, expression
 ; ./asm_test/win/i/all.c:1834:             break;
	jmp	.L350	 ;
.L319:
 ; ./asm_test/win/i/all.c:1836:             indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1837:             fprintf(outfile, "type: \"!\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC71(%rip), %rcx	 ;, tmp117
	jmp	.L354	 ;
.L318:
 ; ./asm_test/win/i/all.c:1843:             indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1844:             fprintf(outfile, "type: \"-\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC72(%rip), %rcx	 ;, tmp119
.L354:
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1845:             indention(outfile, indent, 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	incq	%rbp	 ; indent
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1846:             fprintf(outfile, "value\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC70(%rip), %rcx	 ;, tmp120
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1847:             output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
	movq	(%r12), %r12	 ; primary_27->value.operand, primary
	jmp	.L314	 ;
.L316:
 ; ./asm_test/win/i/all.c:1850:             indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1851:             fprintf(outfile, "type: \"variable\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC73(%rip), %rcx	 ;, tmp121
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1852:             indention(outfile, indent, 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1853:             fprintf(outfile, "value\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC70(%rip), %rcx	 ;, tmp122
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1854:             output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
	movq	(%r12), %rcx	 ; primary_27->value.var,
 ; ./asm_test/win/i/all.c:1795: }
	addq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1854:             output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbp, %r8	 ; indent,
	movq	%rbx, %rdx	 ; outfile,
 ; ./asm_test/win/i/all.c:1795: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; ./asm_test/win/i/all.c:1854:             output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
	jmp	output_variable_access	 ;
.L315:
 ; ./asm_test/win/i/all.c:1857:             indention(outfile, indent, 1, indent_has_next);
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rsi, %r9	 ; indent_has_next,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1858:             fprintf(outfile, "unknown_PrimaryType: %u\n", primary->type);
	movl	8(%r12), %r8d	 ; primary_27->type,
 ; ./asm_test/win/i/all.c:1795: }
	addq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1858:             fprintf(outfile, "unknown_PrimaryType: %u\n", primary->type);
	movq	%rbx, %rcx	 ; outfile,
	leaq	.LC74(%rip), %rdx	 ;, tmp124
 ; ./asm_test/win/i/all.c:1795: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; ./asm_test/win/i/all.c:1858:             fprintf(outfile, "unknown_PrimaryType: %u\n", primary->type);
	jmp	fprintf	 ;
.L313:
 ; ./asm_test/win/i/all.c:1251:     switch (op) {
	xorl	%edi, %edi	 ; iftmp.85_9
	cmpl	$18, %eax	 ;, _1
	ja	.L328	 ;,
	movslq	0(%r13,%rax,4), %rax	 ;, tmp128
	addq	%r13, %rax	 ; tmp157, tmp129
	jmp	*%rax	 ; tmp129
	.section .rdata,"dr"
	.align 4
.L330:
	.long	.L348-.L330
	.long	.L347-.L330
	.long	.L346-.L330
	.long	.L345-.L330
	.long	.L344-.L330
	.long	.L343-.L330
	.long	.L342-.L330
	.long	.L341-.L330
	.long	.L340-.L330
	.long	.L339-.L330
	.long	.L338-.L330
	.long	.L337-.L330
	.long	.L336-.L330
	.long	.L335-.L330
	.long	.L334-.L330
	.long	.L333-.L330
	.long	.L332-.L330
	.long	.L331-.L330
	.long	.L329-.L330
	.text
.L335:
 ; ./asm_test/win/i/all.c:1252:         case OP_ASSIGN: return symbolList[18];
	movq	144+symbolList(%rip), %rdi	 ; symbolList[18], iftmp.85_9
	jmp	.L328	 ;
.L334:
 ; ./asm_test/win/i/all.c:1253:         case OP_ADD_ASSIGN: return symbolList[23];
	movq	184+symbolList(%rip), %rdi	 ; symbolList[23], iftmp.85_9
	jmp	.L328	 ;
.L333:
 ; ./asm_test/win/i/all.c:1254:         case OP_SUB_ASSIGN: return symbolList[24];
	movq	192+symbolList(%rip), %rdi	 ; symbolList[24], iftmp.85_9
	jmp	.L328	 ;
.L332:
 ; ./asm_test/win/i/all.c:1255:         case OP_MUL_ASSIGN: return symbolList[25];
	movq	200+symbolList(%rip), %rdi	 ; symbolList[25], iftmp.85_9
	jmp	.L328	 ;
.L331:
 ; ./asm_test/win/i/all.c:1256:         case OP_DIV_ASSIGN: return symbolList[26];
	movq	208+symbolList(%rip), %rdi	 ; symbolList[26], iftmp.85_9
	jmp	.L328	 ;
.L329:
 ; ./asm_test/win/i/all.c:1257:         case OP_MOD_ASSIGN: return symbolList[27];
	movq	216+symbolList(%rip), %rdi	 ; symbolList[27], iftmp.85_9
	jmp	.L328	 ;
.L337:
 ; ./asm_test/win/i/all.c:1258:         case OP_AND: return symbolList[28];
	movq	224+symbolList(%rip), %rdi	 ; symbolList[28], iftmp.85_9
	jmp	.L328	 ;
.L336:
 ; ./asm_test/win/i/all.c:1259:         case OP_OR: return symbolList[29];
	movq	232+symbolList(%rip), %rdi	 ; symbolList[29], iftmp.85_9
	jmp	.L328	 ;
.L343:
 ; ./asm_test/win/i/all.c:1260:         case OP_EQ: return symbolList[19];
	movq	152+symbolList(%rip), %rdi	 ; symbolList[19], iftmp.85_9
	jmp	.L328	 ;
.L342:
 ; ./asm_test/win/i/all.c:1261:         case OP_NE: return symbolList[20];
	movq	160+symbolList(%rip), %rdi	 ; symbolList[20], iftmp.85_9
	jmp	.L328	 ;
.L341:
 ; ./asm_test/win/i/all.c:1262:         case OP_LT: return symbolList[16];
	movq	128+symbolList(%rip), %rdi	 ; symbolList[16], iftmp.85_9
	jmp	.L328	 ;
.L340:
 ; ./asm_test/win/i/all.c:1263:         case OP_GT: return symbolList[17];
	movq	136+symbolList(%rip), %rdi	 ; symbolList[17], iftmp.85_9
	jmp	.L328	 ;
.L339:
 ; ./asm_test/win/i/all.c:1264:         case OP_LE: return symbolList[21];
	movq	168+symbolList(%rip), %rdi	 ; symbolList[21], iftmp.85_9
	jmp	.L328	 ;
.L338:
 ; ./asm_test/win/i/all.c:1265:         case OP_GE: return symbolList[22];
	movq	176+symbolList(%rip), %rdi	 ; symbolList[22], iftmp.85_9
	jmp	.L328	 ;
.L348:
 ; ./asm_test/win/i/all.c:1266:         case OP_ADD: return symbolList[11];
	movq	88+symbolList(%rip), %rdi	 ; symbolList[11], iftmp.85_9
	jmp	.L328	 ;
.L347:
 ; ./asm_test/win/i/all.c:1267:         case OP_SUB: return symbolList[12];
	movq	96+symbolList(%rip), %rdi	 ; symbolList[12], iftmp.85_9
	jmp	.L328	 ;
.L346:
 ; ./asm_test/win/i/all.c:1268:         case OP_MUL: return symbolList[13];
	movq	104+symbolList(%rip), %rdi	 ; symbolList[13], iftmp.85_9
	jmp	.L328	 ;
.L345:
 ; ./asm_test/win/i/all.c:1269:         case OP_DIV: return symbolList[14];
	movq	112+symbolList(%rip), %rdi	 ; symbolList[14], iftmp.85_9
	jmp	.L328	 ;
.L344:
 ; ./asm_test/win/i/all.c:1270:         case OP_MOD: return symbolList[15];
	movq	120+symbolList(%rip), %rdi	 ; symbolList[15], iftmp.85_9
.L328:
 ; ./asm_test/win/i/all.c:1786:         indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1787:         fprintf(outfile, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	testq	%rdi, %rdi	 ; iftmp.85_9
 ; ./asm_test/win/i/all.c:1787:         fprintf(outfile, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	leaq	.LC75(%rip), %rdx	 ;, tmp150
	movq	%rbx, %rcx	 ; outfile,
 ; ./asm_test/win/i/all.c:1787:         fprintf(outfile, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	cmove	%r14, %rdi	 ; iftmp.85_9,, iftmp.85_9, iftmp.85_9
 ; ./asm_test/win/i/all.c:1787:         fprintf(outfile, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%rdi, %r8	 ; iftmp.85_9,
 ; ./asm_test/win/i/all.c:1790:         output_expression(expression->expr_left, outfile, indent + 1, indent_has_next);
	leaq	1(%rbp), %rdi	 ;, _5
 ; ./asm_test/win/i/all.c:1787:         fprintf(outfile, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1788:         indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1789:         fprintf(outfile, "left\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC76(%rip), %rcx	 ;, tmp151
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1790:         output_expression(expression->expr_left, outfile, indent + 1, indent_has_next);
	movq	(%r12), %rcx	 ; expression_11->expr_left,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %r8	 ; _5,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; ./asm_test/win/i/all.c:1791:         indention(outfile, indent, 1, indent_has_next);
	movq	%rbp, %rdx	 ; indent,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
 ; ./asm_test/win/i/all.c:1793:         output_expression(expression->right, outfile, indent + 1, indent_has_next);
	movq	%rdi, %rbp	 ; _5, indent
 ; ./asm_test/win/i/all.c:1791:         indention(outfile, indent, 1, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1792:         fprintf(outfile, "right\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC77(%rip), %rcx	 ;, tmp152
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1793:         output_expression(expression->right, outfile, indent + 1, indent_has_next);
	movq	16(%r12), %r12	 ; expression_11->right, expression
	jmp	.L350	 ;
	.section .rdata,"dr"
.LC78:
	.ascii "value: \"NULL\"\12\0"
	.text
	.def	output_variable;	.scl	3;	.type	32;	.endef
output_variable:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp97, variable
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp99, indent
 ; ./asm_test/win/i/all.c:1632:     indention(outfile, indent, 0, indent_has_next);
	xorl	%r8d, %r8d	 ;
 ; ./asm_test/win/i/all.c:1631: void output_variable(Variable* variable, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp100, indent_has_next
 ; ./asm_test/win/i/all.c:1634:     output_name(variable->type, outfile, indent + 1, indent_has_next);
	leaq	1(%rdi), %r12	 ;, _1
 ; ./asm_test/win/i/all.c:1631: void output_variable(Variable* variable, FILE* outfile, size_t indent, char indent_has_next[32]) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp98, outfile
 ; ./asm_test/win/i/all.c:1632:     indention(outfile, indent, 0, indent_has_next);
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
 ; ./asm_test/win/i/all.c:1631: void output_variable(Variable* variable, FILE* outfile, size_t indent, char indent_has_next[32]) {
	subq	$32, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1632:     indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1633:     fprintf(outfile, "type\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC10(%rip), %rcx	 ;, tmp91
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1634:     output_name(variable->type, outfile, indent + 1, indent_has_next);
	movq	0(%rbp), %rcx	 ; variable_13(D)->type,
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1635:     indention(outfile, indent, 0, indent_has_next);
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1636:     fprintf(outfile, "name\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC47(%rip), %rcx	 ;, tmp92
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1637:     output_name(variable->name, outfile, indent + 1, indent_has_next);
	movq	8(%rbp), %rcx	 ; variable_13(D)->name, variable_13(D)->name
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1638:     if (variable->value != NULL) {
	cmpq	$0, 16(%rbp)	 ;, variable_13(D)->value
 ; ./asm_test/win/i/all.c:1639:         indention(outfile, indent, 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%rdi, %rdx	 ; indent,
	movl	$1, %r8d	 ;,
	movq	%rbx, %rcx	 ; outfile,
 ; ./asm_test/win/i/all.c:1638:     if (variable->value != NULL) {
	je	.L359	 ;,
 ; ./asm_test/win/i/all.c:1639:         indention(outfile, indent, 1, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1640:         fprintf(outfile, "value\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC70(%rip), %rcx	 ;, tmp94
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1641:         output_expression(variable->value, outfile, indent + 1, indent_has_next);
	movq	16(%rbp), %rcx	 ; variable_13(D)->value, variable_13(D)->value
 ; ./asm_test/win/i/all.c:1646: }
	addq	$32, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1641:         output_expression(variable->value, outfile, indent + 1, indent_has_next);
	movq	%rsi, %r9	 ; indent_has_next,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
 ; ./asm_test/win/i/all.c:1646: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; ./asm_test/win/i/all.c:1641:         output_expression(variable->value, outfile, indent + 1, indent_has_next);
	jmp	output_expression	 ;
.L359:
 ; ./asm_test/win/i/all.c:1643:         indention(outfile, indent, 1, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1646: }
	addq	$32, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1644:         fprintf(outfile, "value: \"NULL\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC78(%rip), %rcx	 ;, tmp96
 ; ./asm_test/win/i/all.c:1646: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; ./asm_test/win/i/all.c:1644:         fprintf(outfile, "value: \"NULL\"\n");
	jmp	fputs	 ;
	.section .rdata,"dr"
.LC79:
	.ascii "if_statement\12\0"
.LC80:
	.ascii "condition\12\0"
.LC81:
	.ascii "body\12\0"
.LC82:
	.ascii "else_if\12\0"
.LC83:
	.ascii "else_body\12\0"
.LC84:
	.ascii "for_statement\12\0"
.LC85:
	.ascii "initializer\12\0"
.LC86:
	.ascii "initializer: \"NULL\"\12\0"
.LC87:
	.ascii "condition: \"NULL\"\12\0"
.LC88:
	.ascii "increment\12\0"
.LC89:
	.ascii "increment: \"NULL\"\12\0"
.LC90:
	.ascii "while_statement\12\0"
.LC91:
	.ascii "variable_declaration_statement\12\0"
.LC92:
	.ascii "return_statement: \"NULL\"\12\0"
.LC93:
	.ascii "return_statement\12\0"
.LC94:
	.ascii "break_statement: \"NULL\"\12\0"
.LC95:
	.ascii "continue_statement: \"NULL\"\12\0"
.LC96:
	.ascii "expression_statement: \"NULL\"\12\0"
.LC97:
	.ascii "expression_statement\12\0"
.LC98:
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
	movq	%rcx, %rsi	 ; tmp188, statement
	pushq	%rbx	 ;
	movq	%r8, %rbx	 ; tmp190, indent
	subq	$72, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1648:     switch (statement->type) {
	cmpl	$7, 8(%rcx)	 ;, statement_19(D)->type
 ; ./asm_test/win/i/all.c:1647: void output_statement(Statement* statement, FILE* outfile, size_t indent, char indent_has_next[32]) {
	movq	%rdx, 40(%rsp)	 ; tmp189, %sfp
	movq	%r9, 48(%rsp)	 ; tmp191, %sfp
 ; ./asm_test/win/i/all.c:1648:     switch (statement->type) {
	ja	.L362	 ;,
	movl	8(%rcx), %eax	 ; statement_19(D)->type, statement_19(D)->type
	leaq	.L364(%rip), %rdx	 ;, tmp137
 ; ./asm_test/win/i/all.c:1684:             indention(outfile, indent, 0, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	40(%rsp), %rcx	 ; %sfp,
 ; ./asm_test/win/i/all.c:1648:     switch (statement->type) {
	movslq	(%rdx,%rax,4), %rax	 ;, tmp139
	addq	%rdx, %rax	 ; tmp137, tmp140
 ; ./asm_test/win/i/all.c:1684:             indention(outfile, indent, 0, indent_has_next);
	movq	%rbx, %rdx	 ; indent,
 ; ./asm_test/win/i/all.c:1648:     switch (statement->type) {
	jmp	*%rax	 ; tmp140
	.section .rdata,"dr"
	.align 4
.L364:
	.long	.L371-.L364
	.long	.L370-.L364
	.long	.L369-.L364
	.long	.L368-.L364
	.long	.L367-.L364
	.long	.L366-.L364
	.long	.L365-.L364
	.long	.L363-.L364
	.text
.L369:
 ; ./asm_test/win/i/all.c:1650:             indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1651:             fprintf(outfile, "if_statement\n");
	movq	40(%rsp), %rdx	 ; %sfp,
 ; ./asm_test/win/i/all.c:1652:             output_if(statement->stmt.if_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%rbx), %rdi	 ;, _2
 ; ./asm_test/win/i/all.c:1651:             fprintf(outfile, "if_statement\n");
	leaq	.LC79(%rip), %rcx	 ;, tmp142
 ; ./asm_test/win/i/all.c:1708:     fprintf(outfile, "condition\n");
	leaq	.LC80(%rip), %r14	 ;, tmp146
 ; ./asm_test/win/i/all.c:1651:             fprintf(outfile, "if_statement\n");
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1652:             output_if(statement->stmt.if_stmt, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %r15	 ; statement_19(D)->stmt.if_stmt, _3
 ; ./asm_test/win/i/all.c:1709:     output_expression(if_->condition, outfile, indent + 1, indent_has_next);
	leaq	2(%rbx), %rsi	 ;, _57
 ; ./asm_test/win/i/all.c:1704:     List* body = list_copy(if_->body);
	movq	8(%r15), %rcx	 ; _3->body, _3->body
	call	list_copy	 ;
 ; ./asm_test/win/i/all.c:1705:     List* else_if_list = list_copy(if_->else_if);
	movq	16(%r15), %rcx	 ; _3->else_if, _3->else_if
 ; ./asm_test/win/i/all.c:1704:     List* body = list_copy(if_->body);
	movq	%rax, %r13	 ; tmp192, body
 ; ./asm_test/win/i/all.c:1705:     List* else_if_list = list_copy(if_->else_if);
	call	list_copy	 ;
 ; ./asm_test/win/i/all.c:1706:     List* else_body = list_copy(if_->else_body);
	movq	24(%r15), %rcx	 ; _3->else_body, _3->else_body
 ; ./asm_test/win/i/all.c:1705:     List* else_if_list = list_copy(if_->else_if);
	movq	%rax, %r12	 ; tmp193, else_if_list
 ; ./asm_test/win/i/all.c:1706:     List* else_body = list_copy(if_->else_body);
	call	list_copy	 ;
 ; ./asm_test/win/i/all.c:1707:     indention(outfile, indent, 0, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _2,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; ./asm_test/win/i/all.c:1706:     List* else_body = list_copy(if_->else_body);
	movq	%rax, %rbp	 ; tmp194, else_body
 ; ./asm_test/win/i/all.c:1707:     indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1708:     fprintf(outfile, "condition\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r14, %rcx	 ; tmp146,
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1709:     output_expression(if_->condition, outfile, indent + 1, indent_has_next);
	movq	(%r15), %rcx	 ; _3->condition,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rsi, %r8	 ; _57,
	movq	40(%rsp), %rdx	 ; %sfp,
 ; ./asm_test/win/i/all.c:1711:     fprintf(outfile, "body\n");
	leaq	.LC81(%rip), %r15	 ;, tmp147
 ; ./asm_test/win/i/all.c:1709:     output_expression(if_->condition, outfile, indent + 1, indent_has_next);
	call	output_expression	 ;
 ; ./asm_test/win/i/all.c:1710:     indention(outfile, indent, 0, indent_has_next);
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%rdi, %rdx	 ; _2,
	xorl	%r8d, %r8d	 ;
	movq	48(%rsp), %r9	 ; %sfp,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1711:     fprintf(outfile, "body\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; tmp147,
	call	fputs	 ;
.L372:
 ; ./asm_test/win/i/all.c:1713:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r13, %rcx	 ; body,
	call	list_pop	 ;
 ; ./asm_test/win/i/all.c:1714:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
 ; ./asm_test/win/i/all.c:1713:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rax, %rcx	 ; tmp195, statement
 ; ./asm_test/win/i/all.c:1713:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L397	 ;,
 ; ./asm_test/win/i/all.c:1714:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rsi, %r8	 ; _57,
	call	output_statement	 ;
	jmp	.L372	 ;
.L397:
 ; ./asm_test/win/i/all.c:1715:     indention(outfile, indent, 0, indent_has_next);
	movq	40(%rsp), %rcx	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _2,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1716:     fprintf(outfile, "else_if\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC82(%rip), %rcx	 ;, tmp148
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1729:     output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
	leaq	3(%rbx), %rax	 ;, _64
	movq	%rax, 56(%rsp)	 ; _64, %sfp
.L374:
 ; ./asm_test/win/i/all.c:1718:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	movq	%r12, %rcx	 ; else_if_list,
	call	list_pop	 ;
	movq	%rax, %r13	 ; tmp198, else_if
 ; ./asm_test/win/i/all.c:1718:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	testq	%rax, %rax	 ; else_if
	je	.L398	 ;,
 ; ./asm_test/win/i/all.c:1726:     List* body = list_copy(else_if->body);
	movq	8(%r13), %rcx	 ; else_if_60->body, else_if_60->body
	call	list_copy	 ;
 ; ./asm_test/win/i/all.c:1727:     indention(outfile, indent, 0, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; _57,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; ./asm_test/win/i/all.c:1726:     List* body = list_copy(else_if->body);
	movq	%rax, %rbx	 ; tmp196, body
 ; ./asm_test/win/i/all.c:1727:     indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1728:     fprintf(outfile, "condition\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r14, %rcx	 ; tmp146,
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1729:     output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	56(%rsp), %r8	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	0(%r13), %rcx	 ; else_if_60->condition,
	call	output_expression	 ;
 ; ./asm_test/win/i/all.c:1730:     indention(outfile, indent, 1, indent_has_next);
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rsi, %rdx	 ; _57,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1731:     fprintf(outfile, "body\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; tmp147,
	call	fputs	 ;
.L375:
 ; ./asm_test/win/i/all.c:1733:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbx, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp197, statement
 ; ./asm_test/win/i/all.c:1733:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L374	 ;,
 ; ./asm_test/win/i/all.c:1734:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	56(%rsp), %r8	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	call	output_statement	 ;
	jmp	.L375	 ;
.L398:
 ; ./asm_test/win/i/all.c:1720:     indention(outfile, indent, 1, indent_has_next);
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rdx	 ; _2,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1721:     fprintf(outfile, "else_body\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC83(%rip), %rcx	 ;, tmp152
	call	fputs	 ;
.L378:
 ; ./asm_test/win/i/all.c:1722:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	movq	%rbp, %rcx	 ; else_body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp199, statement
 ; ./asm_test/win/i/all.c:1722:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L361	 ;,
 ; ./asm_test/win/i/all.c:1723:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rsi, %r8	 ; _57,
	call	output_statement	 ;
	jmp	.L378	 ;
.L367:
 ; ./asm_test/win/i/all.c:1655:             indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1656:             fprintf(outfile, "for_statement\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC84(%rip), %rcx	 ;, tmp153
 ; ./asm_test/win/i/all.c:1657:             output_for(statement->stmt.for_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%rbx), %rdi	 ;, _4
 ; ./asm_test/win/i/all.c:1656:             fprintf(outfile, "for_statement\n");
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1657:             output_for(statement->stmt.for_stmt, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rsi	 ; statement_19(D)->stmt.for_stmt, _5
 ; ./asm_test/win/i/all.c:1737:     List* body = list_copy(for_->body);
	movq	24(%rsi), %rcx	 ; _5->body, _5->body
	call	list_copy	 ;
 ; ./asm_test/win/i/all.c:1739:         indention(outfile, indent, 0, indent_has_next);
	xorl	%r8d, %r8d	 ;
 ; ./asm_test/win/i/all.c:1738:     if (for_->initializer != NULL) {
	cmpq	$0, (%rsi)	 ;, _5->initializer
 ; ./asm_test/win/i/all.c:1739:         indention(outfile, indent, 0, indent_has_next);
	movq	%rdi, %rdx	 ; _4,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; ./asm_test/win/i/all.c:1737:     List* body = list_copy(for_->body);
	movq	%rax, %rbp	 ; tmp200, body
 ; ./asm_test/win/i/all.c:1738:     if (for_->initializer != NULL) {
	je	.L381	 ;,
 ; ./asm_test/win/i/all.c:1739:         indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1740:         fprintf(outfile, "initializer\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC85(%rip), %rcx	 ;, tmp155
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1741:         output_variable(for_->initializer, outfile, indent + 1, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	(%rsi), %rcx	 ; _5->initializer,
	leaq	2(%rbx), %r8	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	call	output_variable	 ;
	jmp	.L382	 ;
.L381:
 ; ./asm_test/win/i/all.c:1743:         indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1744:         fprintf(outfile, "initializer: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC86(%rip), %rcx	 ;, tmp157
	call	fputs	 ;
.L382:
 ; ./asm_test/win/i/all.c:1747:         indention(outfile, indent, 0, indent_has_next);
	xorl	%r8d, %r8d	 ;
 ; ./asm_test/win/i/all.c:1746:     if (for_->condition != NULL) {
	cmpq	$0, 8(%rsi)	 ;, _5->condition
 ; ./asm_test/win/i/all.c:1747:         indention(outfile, indent, 0, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rdx	 ; _4,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; ./asm_test/win/i/all.c:1746:     if (for_->condition != NULL) {
	je	.L383	 ;,
 ; ./asm_test/win/i/all.c:1747:         indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1748:         fprintf(outfile, "condition\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC80(%rip), %rcx	 ;, tmp158
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1749:         output_expression(for_->condition, outfile, indent + 1, indent_has_next);
	movq	8(%rsi), %rcx	 ; _5->condition, _5->condition
	movq	48(%rsp), %r9	 ; %sfp,
	leaq	2(%rbx), %r8	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	call	output_expression	 ;
	jmp	.L384	 ;
.L383:
 ; ./asm_test/win/i/all.c:1751:         indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1752:         fprintf(outfile, "condition: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC87(%rip), %rcx	 ;, tmp161
	call	fputs	 ;
.L384:
 ; ./asm_test/win/i/all.c:1755:         indention(outfile, indent, 0, indent_has_next);
	xorl	%r8d, %r8d	 ;
 ; ./asm_test/win/i/all.c:1754:     if (for_->increment != NULL) {
	cmpq	$0, 16(%rsi)	 ;, _5->increment
 ; ./asm_test/win/i/all.c:1755:         indention(outfile, indent, 0, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rdx	 ; _4,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; ./asm_test/win/i/all.c:1754:     if (for_->increment != NULL) {
	je	.L385	 ;,
 ; ./asm_test/win/i/all.c:1755:         indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1756:         fprintf(outfile, "increment\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC88(%rip), %rcx	 ;, tmp162
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1757:         output_expression(for_->increment, outfile, indent + 1, indent_has_next);
	movq	16(%rsi), %rcx	 ; _5->increment, _5->increment
	movq	48(%rsp), %r9	 ; %sfp,
	leaq	2(%rbx), %r8	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	call	output_expression	 ;
	jmp	.L386	 ;
.L385:
 ; ./asm_test/win/i/all.c:1759:         indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1760:         fprintf(outfile, "increment: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC89(%rip), %rcx	 ;, tmp165
	call	fputs	 ;
.L386:
 ; ./asm_test/win/i/all.c:1762:     indention(outfile, indent, 1, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%rdi, %rdx	 ; _4,
 ; ./asm_test/win/i/all.c:1766:         output_statement(statement, outfile, indent + 1, indent_has_next);
	addq	$2, %rbx	 ;, tmp187
 ; ./asm_test/win/i/all.c:1762:     indention(outfile, indent, 1, indent_has_next);
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1763:     fprintf(outfile, "body\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC81(%rip), %rcx	 ;, tmp166
	call	fputs	 ;
.L387:
 ; ./asm_test/win/i/all.c:1765:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbp, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp201, statement
 ; ./asm_test/win/i/all.c:1765:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L361	 ;,
 ; ./asm_test/win/i/all.c:1766:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %r8	 ; tmp187,
	call	output_statement	 ;
	jmp	.L387	 ;
.L368:
 ; ./asm_test/win/i/all.c:1660:             indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1661:             fprintf(outfile, "while_statement\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC90(%rip), %rcx	 ;, tmp168
 ; ./asm_test/win/i/all.c:1662:             output_while(statement->stmt.while_stmt, outfile, indent + 1, indent_has_next);
	leaq	1(%rbx), %rdi	 ;, _6
 ; ./asm_test/win/i/all.c:1772:     output_expression(while_->condition, outfile, indent + 1, indent_has_next);
	addq	$2, %rbx	 ;, _82
 ; ./asm_test/win/i/all.c:1661:             fprintf(outfile, "while_statement\n");
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1662:             output_while(statement->stmt.while_stmt, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rbp	 ; statement_19(D)->stmt.while_stmt, _7
 ; ./asm_test/win/i/all.c:1769:     List* body = list_copy(while_->body);
	movq	8(%rbp), %rcx	 ; _7->body, _7->body
	call	list_copy	 ;
 ; ./asm_test/win/i/all.c:1770:     indention(outfile, indent, 0, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _6,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; ./asm_test/win/i/all.c:1769:     List* body = list_copy(while_->body);
	movq	%rax, %rsi	 ; tmp202, body
 ; ./asm_test/win/i/all.c:1770:     indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1771:     fprintf(outfile, "condition\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC80(%rip), %rcx	 ;, tmp170
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1772:     output_expression(while_->condition, outfile, indent + 1, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %r8	 ; _82,
	movq	0(%rbp), %rcx	 ; _7->condition,
	call	output_expression	 ;
 ; ./asm_test/win/i/all.c:1773:     indention(outfile, indent, 1, indent_has_next);
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rdx	 ; _6,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1774:     fprintf(outfile, "body\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC81(%rip), %rcx	 ;, tmp171
	call	fputs	 ;
.L390:
 ; ./asm_test/win/i/all.c:1776:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rsi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp203, statement
 ; ./asm_test/win/i/all.c:1776:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L361	 ;,
 ; ./asm_test/win/i/all.c:1777:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %r8	 ; _82,
	call	output_statement	 ;
	jmp	.L390	 ;
.L370:
 ; ./asm_test/win/i/all.c:1665:             indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1666:             fprintf(outfile, "variable_declaration_statement\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC91(%rip), %rcx	 ;, tmp172
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1667:             output_variable(statement->stmt.var, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; statement_19(D)->stmt.var,
	movq	48(%rsp), %r9	 ; %sfp,
	leaq	1(%rbx), %r8	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
 ; ./asm_test/win/i/all.c:1702: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; ./asm_test/win/i/all.c:1667:             output_variable(statement->stmt.var, outfile, indent + 1, indent_has_next);
	jmp	output_variable	 ;
.L366:
 ; ./asm_test/win/i/all.c:1670:             if (statement->stmt.expr == NULL) {
	cmpq	$0, (%rsi)	 ;, statement_19(D)->stmt.expr
	jne	.L392	 ;,
 ; ./asm_test/win/i/all.c:1671:                 indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1672:                 fprintf(outfile, "return_statement: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC92(%rip), %rcx	 ;, tmp174
	jmp	.L395	 ;
.L392:
 ; ./asm_test/win/i/all.c:1675:             indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1676:             fprintf(outfile, "return_statement\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC93(%rip), %rcx	 ;, tmp175
	jmp	.L396	 ;
.L365:
 ; ./asm_test/win/i/all.c:1680:             indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1681:             fprintf(outfile, "break_statement: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC94(%rip), %rcx	 ;, tmp177
.L395:
 ; ./asm_test/win/i/all.c:1702: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; ./asm_test/win/i/all.c:1681:             fprintf(outfile, "break_statement: \"NULL\"\n");
	jmp	fputs	 ;
.L363:
 ; ./asm_test/win/i/all.c:1684:             indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1685:             fprintf(outfile, "continue_statement: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC95(%rip), %rcx	 ;, tmp178
	jmp	.L395	 ;
.L371:
 ; ./asm_test/win/i/all.c:1688:             if (statement->stmt.expr == NULL) {
	cmpq	$0, (%rsi)	 ;, statement_19(D)->stmt.expr
	jne	.L393	 ;,
 ; ./asm_test/win/i/all.c:1689:                 indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1690:                 fprintf(outfile, "expression_statement: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC96(%rip), %rcx	 ;, tmp179
	jmp	.L395	 ;
.L393:
 ; ./asm_test/win/i/all.c:1693:             indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1694:             fprintf(outfile, "expression_statement\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC97(%rip), %rcx	 ;, tmp180
.L396:
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1695:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	movq	(%rsi), %rcx	 ; statement_19(D)->stmt.expr,
	movq	48(%rsp), %r9	 ; %sfp,
	leaq	1(%rbx), %r8	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
 ; ./asm_test/win/i/all.c:1702: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; ./asm_test/win/i/all.c:1695:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	jmp	output_expression	 ;
.L362:
 ; ./asm_test/win/i/all.c:1698:             indention(outfile, indent, 0, indent_has_next);
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rbx, %rdx	 ; indent,
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1699:             fprintf(outfile, "unknown_StatementType: %u\n", statement->type);
	movl	8(%rsi), %r8d	 ; statement_19(D)->type,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; ./asm_test/win/i/all.c:1702: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
 ; ./asm_test/win/i/all.c:1699:             fprintf(outfile, "unknown_StatementType: %u\n", statement->type);
	leaq	.LC98(%rip), %rdx	 ;, tmp183
 ; ./asm_test/win/i/all.c:1702: }
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; ./asm_test/win/i/all.c:1699:             fprintf(outfile, "unknown_StatementType: %u\n", statement->type);
	jmp	fprintf	 ;
.L361:
 ; ./asm_test/win/i/all.c:1702: }
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
	.def	create_symbol_table;	.scl	3;	.type	32;	.endef
create_symbol_table:
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp86, parent
 ; ./asm_test/win/i/all.c:1112:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	movl	$16, %ecx	 ;,
 ; ./asm_test/win/i/all.c:1111: SymbolTable* create_symbol_table(SymbolTable* parent) {
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1112:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:1113:     new_scope->parent = parent;
	movq	%rsi, (%rax)	 ; parent, new_scope_4->parent
 ; ./asm_test/win/i/all.c:1112:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	movq	%rax, %rbx	 ; tmp87, <retval>
 ; ./asm_test/win/i/all.c:1114:     new_scope->symbols = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:1114:     new_scope->symbols = create_list();
	movq	%rax, 8(%rbx)	 ; tmp88, new_scope_4->symbols
 ; ./asm_test/win/i/all.c:1116: }
	addq	$40, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.section .rdata,"dr"
.LC99:
	.ascii "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\12\0"
.LC100:
	.ascii "Error creating variable access: content is NULL\12\0"
.LC101:
	.ascii "Error creating variable access: unknown type %u\12\0"
	.text
	.def	create_variable_access;	.scl	3;	.type	32;	.endef
create_variable_access:
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rdx, %rbp	 ; tmp147, base
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movl	%ecx, %ebx	 ; tmp146, type
	subq	$56, %rsp	 ;,
 ; ./asm_test/win/i/all.c:868:     if ((base == NULL) != (type == VAR_NAME)) {
	testl	%ecx, %ecx	 ; type
	sete	%al	 ;, tmp110
	testq	%rdx, %rdx	 ; base
 ; ./asm_test/win/i/all.c:867: VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, Symbol* name_content, Expression* expr_content, List* args_content) {
	movq	144(%rsp), %r12	 ; args_content, args_content
 ; ./asm_test/win/i/all.c:868:     if ((base == NULL) != (type == VAR_NAME)) {
	sete	%r13b	 ;, tmp112
 ; ./asm_test/win/i/all.c:868:     if ((base == NULL) != (type == VAR_NAME)) {
	cmpb	%al, %r13b	 ; tmp110, tmp112
	je	.L402	 ;,
 ; ./asm_test/win/i/all.c:869:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC18(%rip), %rax	 ;, tmp139
	testl	%ecx, %ecx	 ; type
	leaq	.LC19(%rip), %r8	 ;, tmp138
 ; ./asm_test/win/i/all.c:869:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movl	$2, %ecx	 ;,
 ; ./asm_test/win/i/all.c:869:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	%rax, %r9	 ; tmp139, iftmp.68_20
	cmovne	%r8, %r9	 ; tmp138,, iftmp.68_20
 ; ./asm_test/win/i/all.c:869:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	testq	%rdx, %rdx	 ; base
	cmove	%rax, %r8	 ; tmp138,, tmp139, iftmp.69_21
 ; ./asm_test/win/i/all.c:869:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	%r9, 40(%rsp)	 ; iftmp.68_20, %sfp
 ; ./asm_test/win/i/all.c:869:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	%r8, 32(%rsp)	 ; iftmp.69_21, %sfp
 ; ./asm_test/win/i/all.c:869:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:869:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	40(%rsp), %r9	 ; %sfp, iftmp.68_20
	movq	32(%rsp), %r8	 ; %sfp, iftmp.69_21
	leaq	.LC99(%rip), %rdx	 ;, tmp114
 ; ./asm_test/win/i/all.c:869:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	%rax, %rcx	 ; tmp150, _4
 ; ./asm_test/win/i/all.c:869:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:870:         return NULL;
	jmp	.L405	 ;
.L402:
	movq	%r8, %rdi	 ; tmp148, name_content
 ; ./asm_test/win/i/all.c:872:     VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
	movl	$24, %ecx	 ;,
	movq	%r9, %rsi	 ; tmp149, expr_content
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:875:     if (type == VAR_NAME && name_content != NULL)
	testq	%rdi, %rdi	 ; name_content
 ; ./asm_test/win/i/all.c:873:     variable_access->type = type;
	movl	%ebx, 16(%rax)	 ; type, variable_access_30->type
 ; ./asm_test/win/i/all.c:875:     if (type == VAR_NAME && name_content != NULL)
	setne	%dl	 ;, tmp115
 ; ./asm_test/win/i/all.c:874:     variable_access->base = base;
	movq	%rbp, (%rax)	 ; base, variable_access_30->base
 ; ./asm_test/win/i/all.c:875:     if (type == VAR_NAME && name_content != NULL)
	testb	%r13b, %r13b	 ; tmp112
	je	.L406	 ;,
	testb	%dl, %dl	 ; tmp115
	jne	.L440	 ;,
.L406:
 ; ./asm_test/win/i/all.c:877:     else if (type == VAR_FUNC_CALL && args_content != NULL)
	cmpl	$1, %ebx	 ;, type
	jne	.L408	 ;,
	testq	%r12, %r12	 ; args_content
	je	.L408	 ;,
 ; ./asm_test/win/i/all.c:878:         variable_access->content.args = args_content;
	movq	%r12, 8(%rax)	 ; args_content, variable_access_30->content.args
	jmp	.L401	 ;
.L408:
 ; ./asm_test/win/i/all.c:879:     else if (type == VAR_GET_SEQ && expr_content != NULL)
	cmpl	$3, %ebx	 ;, type
	jne	.L410	 ;,
	testq	%rsi, %rsi	 ; expr_content
	je	.L410	 ;,
 ; ./asm_test/win/i/all.c:880:         variable_access->content.index = expr_content;
	movq	%rsi, 8(%rax)	 ; expr_content, variable_access_30->content.index
	jmp	.L401	 ;
.L410:
 ; ./asm_test/win/i/all.c:881:     else if (type == VAR_GET_ATTR && name_content != NULL)
	cmpl	$2, %ebx	 ;, type
	jne	.L411	 ;,
	testb	%dl, %dl	 ; tmp115
	je	.L411	 ;,
.L440:
 ; ./asm_test/win/i/all.c:882:         variable_access->content.attr_name = name_content;
	movq	%rdi, 8(%rax)	 ; name_content,
	jmp	.L401	 ;
.L411:
 ; ./asm_test/win/i/all.c:884:         if (name_content == NULL && expr_content == NULL && args_content == NULL)
	orq	%r12, %rsi	 ; args_content, tmp126
	movq	__imp___acrt_iob_func(%rip), %rax	 ;, tmp133
 ; ./asm_test/win/i/all.c:885:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	movl	$2, %ecx	 ;,
 ; ./asm_test/win/i/all.c:884:         if (name_content == NULL && expr_content == NULL && args_content == NULL)
	orq	%rsi, %rdi	 ; tmp126, tmp154
	jne	.L412	 ;,
 ; ./asm_test/win/i/all.c:885:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	call	*%rax	 ; tmp133
 ; ./asm_test/win/i/all.c:885:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	leaq	.LC100(%rip), %rcx	 ;, tmp129
 ; ./asm_test/win/i/all.c:885:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	movq	%rax, %rdx	 ; tmp152, _18
 ; ./asm_test/win/i/all.c:885:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:885:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	jmp	.L405	 ;
.L412:
 ; ./asm_test/win/i/all.c:887:             fprintf(stderr, "Error creating variable access: unknown type %u\n", type);
	call	*%rax	 ; tmp133
 ; ./asm_test/win/i/all.c:887:             fprintf(stderr, "Error creating variable access: unknown type %u\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC101(%rip), %rdx	 ;, tmp131
 ; ./asm_test/win/i/all.c:887:             fprintf(stderr, "Error creating variable access: unknown type %u\n", type);
	movq	%rax, %rcx	 ; tmp153, _19
 ; ./asm_test/win/i/all.c:887:             fprintf(stderr, "Error creating variable access: unknown type %u\n", type);
	call	fprintf	 ;
.L405:
 ; ./asm_test/win/i/all.c:870:         return NULL;
	xorl	%eax, %eax	 ; <retval>
.L401:
 ; ./asm_test/win/i/all.c:891: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
	.section .rdata,"dr"
.LC102:
	.ascii "Error creating primary: value is NULL\12\0"
.LC103:
	.ascii "Error creating primary: unknown type %u\12\0"
	.text
	.def	create_primary;	.scl	3;	.type	32;	.endef
create_primary:
	pushq	%r12	 ;
	movq	%r9, %r12	 ; tmp139, prim_value
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp137, str_value
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp138, expr_value
	pushq	%rbx	 ;
	movl	%ecx, %ebx	 ; tmp136, type
 ; ./asm_test/win/i/all.c:848:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	movl	$16, %ecx	 ;,
 ; ./asm_test/win/i/all.c:847: Primary* create_primary(PrimaryType type, char* str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value) {
	subq	$32, %rsp	 ;,
 ; ./asm_test/win/i/all.c:847: Primary* create_primary(PrimaryType type, char* str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value) {
	movq	112(%rsp), %rbp	 ; variable_value, variable_value
 ; ./asm_test/win/i/all.c:848:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:849:     primary->type = type;
	movl	%ebx, 8(%rax)	 ; type, primary_25->type
 ; ./asm_test/win/i/all.c:850:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpl	$4, %ebx	 ;, type
	ja	.L442	 ;,
	testq	%rdi, %rdi	 ; str_value
	je	.L442	 ;,
 ; ./asm_test/win/i/all.c:851:         primary->value.literal_value = str_value;
	movq	%rdi, (%rax)	 ; str_value, primary_25->value.literal_value
	jmp	.L441	 ;
.L442:
 ; ./asm_test/win/i/all.c:852:     else if (type == PRIM_EXPRESSION && expr_value != NULL)
	cmpl	$5, %ebx	 ;, type
	jne	.L444	 ;,
	testq	%rsi, %rsi	 ; expr_value
	je	.L444	 ;,
 ; ./asm_test/win/i/all.c:853:         primary->value.expr = expr_value;
	movq	%rsi, (%rax)	 ; expr_value, primary_25->value.expr
	jmp	.L441	 ;
.L444:
 ; ./asm_test/win/i/all.c:854:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	leal	-6(%rbx), %edx	 ;, tmp118
 ; ./asm_test/win/i/all.c:854:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	cmpl	$1, %edx	 ;, tmp118
	ja	.L446	 ;,
	testq	%r12, %r12	 ; prim_value
	je	.L446	 ;,
 ; ./asm_test/win/i/all.c:855:         primary->value.operand = prim_value;
	movq	%r12, (%rax)	 ; prim_value, primary_25->value.operand
	jmp	.L441	 ;
.L446:
 ; ./asm_test/win/i/all.c:856:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != NULL)
	cmpl	$8, %ebx	 ;, type
	jne	.L447	 ;,
	testq	%rbp, %rbp	 ; variable_value
	je	.L447	 ;,
 ; ./asm_test/win/i/all.c:857:         primary->value.var = variable_value;
	movq	%rbp, (%rax)	 ; variable_value, primary_25->value.var
	jmp	.L441	 ;
.L447:
 ; ./asm_test/win/i/all.c:859:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	orq	%r12, %rbp	 ; prim_value, tmp127
	movq	__imp___acrt_iob_func(%rip), %rax	 ;, tmp135
 ; ./asm_test/win/i/all.c:860:             fprintf(stderr, "Error creating primary: value is NULL\n");
	movl	$2, %ecx	 ;,
 ; ./asm_test/win/i/all.c:859:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	orq	%rbp, %rsi	 ; tmp127, tmp128
	orq	%rdi, %rsi	 ; str_value, tmp143
	jne	.L448	 ;,
 ; ./asm_test/win/i/all.c:860:             fprintf(stderr, "Error creating primary: value is NULL\n");
	call	*%rax	 ; tmp135
 ; ./asm_test/win/i/all.c:860:             fprintf(stderr, "Error creating primary: value is NULL\n");
	leaq	.LC102(%rip), %rcx	 ;, tmp131
 ; ./asm_test/win/i/all.c:860:             fprintf(stderr, "Error creating primary: value is NULL\n");
	movq	%rax, %rdx	 ; tmp141, _17
 ; ./asm_test/win/i/all.c:860:             fprintf(stderr, "Error creating primary: value is NULL\n");
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:860:             fprintf(stderr, "Error creating primary: value is NULL\n");
	jmp	.L449	 ;
.L448:
 ; ./asm_test/win/i/all.c:862:             fprintf(stderr, "Error creating primary: unknown type %u\n", type);
	call	*%rax	 ; tmp135
 ; ./asm_test/win/i/all.c:862:             fprintf(stderr, "Error creating primary: unknown type %u\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC103(%rip), %rdx	 ;, tmp133
 ; ./asm_test/win/i/all.c:862:             fprintf(stderr, "Error creating primary: unknown type %u\n", type);
	movq	%rax, %rcx	 ; tmp142, _18
 ; ./asm_test/win/i/all.c:862:             fprintf(stderr, "Error creating primary: unknown type %u\n", type);
	call	fprintf	 ;
.L449:
 ; ./asm_test/win/i/all.c:863:         return NULL;
	xorl	%eax, %eax	 ; <retval>
.L441:
 ; ./asm_test/win/i/all.c:866: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.section .rdata,"dr"
.LC104:
	.ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\12\0"
.LC105:
	.ascii "Error creating expression: both expr_left and prim_left are NULL\12\0"
	.text
	.def	create_expression;	.scl	3;	.type	32;	.endef
create_expression:
	pushq	%r12	 ;
	movl	%ecx, %r12d	 ; tmp133, operator
	pushq	%rbp	 ;
	movq	%r8, %rbp	 ; tmp135, prim_left
	pushq	%rdi	 ;
	movq	%r9, %rdi	 ; tmp136, right
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp134, expr_left
	pushq	%rbx	 ;
	subq	$64, %rsp	 ;,
 ; ./asm_test/win/i/all.c:826:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpl	$19, %ecx	 ;, operator
	sete	%dl	 ;, tmp99
	testq	%r9, %r9	 ; right
	sete	%al	 ;, tmp101
 ; ./asm_test/win/i/all.c:826:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpb	%al, %dl	 ; tmp101, tmp99
	jne	.L476	 ;,
 ; ./asm_test/win/i/all.c:826:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	movq	%r8, %rax	 ; prim_left, tmp140
	orq	%rsi, %rax	 ; expr_left, tmp140
	jne	.L493	 ;,
	jmp	.L495	 ;
.L476:
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC19(%rip), %rbx	 ;, tmp114
	leaq	.LC18(%rip), %rax	 ;, tmp113
	testq	%r9, %r9	 ; right
	movq	%rbx, %rdi	 ; tmp114, iftmp.70_9
	cmove	%rax, %rdi	 ; tmp113,, iftmp.70_9
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%r8, %r8	 ; prim_left
	cmove	%rax, %rbx	 ; tmp114,, tmp113, iftmp.71_4
.L480:
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%rsi, %rsi	 ; expr_left
	leaq	.LC19(%rip), %r9	 ;, tmp119
	leaq	.LC18(%rip), %rax	 ;, tmp120
	cmove	%rax, %r9	 ; tmp119,, tmp120, iftmp.72_11
	jmp	.L481	 ;
.L495:
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	testq	%r9, %r9	 ; right
	jne	.L496	 ;,
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC18(%rip), %rdi	 ;, iftmp.70_9
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rdi, %rbx	 ; iftmp.70_9, iftmp.71_4
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rdi, %r9	 ; iftmp.70_9, iftmp.72_11
.L481:
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmpl	$19, %r12d	 ;, operator
	movq	%r9, 56(%rsp)	 ; iftmp.72_11, %sfp
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movl	$2, %ecx	 ;,
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC18(%rip), %rax	 ;, tmp126
	leaq	.LC19(%rip), %r8	 ;, tmp125
	cmove	%rax, %r8	 ; tmp125,, tmp126, iftmp.73_12
	movq	%r8, 48(%rsp)	 ; iftmp.73_12, %sfp
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rdi, 40(%rsp)	 ; iftmp.70_9,
	movq	56(%rsp), %r9	 ; %sfp, iftmp.72_11
	leaq	.LC104(%rip), %rdx	 ;, tmp104
	movq	%rbx, 32(%rsp)	 ; iftmp.71_4,
	movq	48(%rsp), %r8	 ; %sfp, iftmp.73_12
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rax, %rcx	 ; tmp137, _7
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:832:         return NULL;
	jmp	.L483	 ;
.L493:
 ; ./asm_test/win/i/all.c:834:     Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:835:     expression->operator = operator;
	movl	%r12d, 24(%rax)	 ; operator, expression_22->operator
 ; ./asm_test/win/i/all.c:836:     if (expr_left != NULL)
	testq	%rsi, %rsi	 ; expr_left
	je	.L484	 ;,
 ; ./asm_test/win/i/all.c:837:         expression->expr_left = expr_left;
	movq	%rsi, (%rax)	 ; expr_left, expression_22->expr_left
	jmp	.L485	 ;
.L484:
 ; ./asm_test/win/i/all.c:838:     else if (prim_left != NULL)
	testq	%rbp, %rbp	 ; prim_left
	je	.L486	 ;,
 ; ./asm_test/win/i/all.c:839:         expression->prim_left = prim_left;
	movq	%rbp, 8(%rax)	 ; prim_left, expression_22->prim_left
	jmp	.L485	 ;
.L486:
 ; ./asm_test/win/i/all.c:841:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:841:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	leaq	.LC105(%rip), %rcx	 ;, tmp106
 ; ./asm_test/win/i/all.c:841:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	movq	%rax, %rdx	 ; tmp139, _8
 ; ./asm_test/win/i/all.c:841:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	call	fputs	 ;
.L483:
 ; ./asm_test/win/i/all.c:832:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L475	 ;
.L485:
 ; ./asm_test/win/i/all.c:844:     expression->right = right;
	movq	%rdi, 16(%rax)	 ; right, expression_22->right
 ; ./asm_test/win/i/all.c:845:     return expression;
	jmp	.L475	 ;
.L496:
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC19(%rip), %rdi	 ;, iftmp.70_9
 ; ./asm_test/win/i/all.c:827:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC18(%rip), %rbx	 ;, iftmp.71_4
	jmp	.L480	 ;
.L475:
 ; ./asm_test/win/i/all.c:846: }
	addq	$64, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.section .rdata,"dr"
.LC106:
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
	je	.L501	 ;,
	movq	%rdx, %rbx	 ; tmp98, name
	testq	%rdx, %rdx	 ; name
	jne	.L498	 ;,
.L501:
 ; ./asm_test/win/i/all.c:754:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:754:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	leaq	.LC106(%rip), %rcx	 ;, tmp95
 ; ./asm_test/win/i/all.c:754:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	movq	%rax, %rdx	 ; tmp100, _17
 ; ./asm_test/win/i/all.c:754:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	call	fputs	 ;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L497	 ;
.L498:
	movq	%rcx, %rsi	 ; tmp97, type
 ; ./asm_test/win/i/all.c:757:     Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
	movl	$24, %ecx	 ;,
	movq	%r8, %rdi	 ; tmp99, value
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:758:     variable->type = type;
	movq	%rsi, (%rax)	 ; type, variable_9->type
 ; ./asm_test/win/i/all.c:759:     variable->name = name;
	movq	%rbx, 8(%rax)	 ; name, variable_9->name
 ; ./asm_test/win/i/all.c:760:     variable->value = value;
	movq	%rdi, 16(%rax)	 ; value, variable_9->value
.L497:
 ; ./asm_test/win/i/all.c:762: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.section .rdata,"dr"
.LC107:
	.ascii "Error creating statement: content is NULL\12\0"
.LC108:
	.ascii "Error creating statement: unknown type %u\12\0"
	.text
	.def	create_statement;	.scl	3;	.type	32;	.endef
create_statement:
	pushq	%r13	 ;
	movq	%r8, %r13	 ; tmp149, while_stmt
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%r9, %rdi	 ; tmp150, for_stmt
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp148, if_stmt
	pushq	%rbx	 ;
	movl	%ecx, %ebx	 ; tmp147, type
 ; ./asm_test/win/i/all.c:764:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	movl	$16, %ecx	 ;,
 ; ./asm_test/win/i/all.c:763: Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt) {
	subq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:763: Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt) {
	movq	128(%rsp), %r12	 ; expr, expr
	movq	136(%rsp), %rbp	 ; var_stmt, var_stmt
 ; ./asm_test/win/i/all.c:764:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:765:     statement->type = type;
	movl	%ebx, 8(%rax)	 ; type, statement_31->type
 ; ./asm_test/win/i/all.c:766:     if (type == EXPRESSION_STATEMENT && expr != NULL)
	testl	%ebx, %ebx	 ; type
	jne	.L504	 ;,
	testq	%r12, %r12	 ; expr
	jne	.L546	 ;,
.L504:
 ; ./asm_test/win/i/all.c:768:     else if (type == VARIABLE_STATEMENT && var_stmt != NULL)
	cmpl	$1, %ebx	 ;, type
	jne	.L506	 ;,
	testq	%rbp, %rbp	 ; var_stmt
	je	.L506	 ;,
 ; ./asm_test/win/i/all.c:769:         statement->stmt.var = var_stmt;
	movq	%rbp, (%rax)	 ; var_stmt, statement_31->stmt.var
	jmp	.L503	 ;
.L506:
 ; ./asm_test/win/i/all.c:770:     else if (type == IF_STATEMENT && if_stmt != NULL)
	cmpl	$2, %ebx	 ;, type
	jne	.L508	 ;,
	testq	%rsi, %rsi	 ; if_stmt
	je	.L508	 ;,
 ; ./asm_test/win/i/all.c:771:         statement->stmt.if_stmt = if_stmt;
	movq	%rsi, (%rax)	 ; if_stmt, statement_31->stmt.if_stmt
	jmp	.L503	 ;
.L508:
 ; ./asm_test/win/i/all.c:772:     else if (type == WHILE_STATEMENT && while_stmt != NULL)
	cmpl	$3, %ebx	 ;, type
	jne	.L509	 ;,
	testq	%r13, %r13	 ; while_stmt
	je	.L509	 ;,
 ; ./asm_test/win/i/all.c:773:         statement->stmt.while_stmt = while_stmt;
	movq	%r13, (%rax)	 ; while_stmt, statement_31->stmt.while_stmt
	jmp	.L503	 ;
.L509:
 ; ./asm_test/win/i/all.c:774:     else if (type == FOR_STATEMENT && for_stmt != NULL)
	cmpl	$4, %ebx	 ;, type
	jne	.L510	 ;,
	testq	%rdi, %rdi	 ; for_stmt
	je	.L510	 ;,
 ; ./asm_test/win/i/all.c:775:         statement->stmt.for_stmt = for_stmt;
	movq	%rdi, (%rax)	 ; for_stmt, statement_31->stmt.for_stmt
	jmp	.L503	 ;
.L510:
 ; ./asm_test/win/i/all.c:776:     else if (type == RETURN_STATEMENT)
	cmpl	$5, %ebx	 ;, type
	jne	.L511	 ;,
.L546:
 ; ./asm_test/win/i/all.c:777:         statement->stmt.return_expr = expr;
	movq	%r12, (%rax)	 ; expr,* <retval>
	jmp	.L503	 ;
.L511:
 ; ./asm_test/win/i/all.c:778:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	leal	-6(%rbx), %edx	 ;, tmp136
 ; ./asm_test/win/i/all.c:778:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$1, %edx	 ;, tmp136
	ja	.L512	 ;,
 ; ./asm_test/win/i/all.c:779:         statement->stmt.expr = NULL;
	xorl	%edx, %edx	 ;
	movq	%rdx, (%rax)	 ;, statement_31->stmt.expr
	jmp	.L503	 ;
.L512:
 ; ./asm_test/win/i/all.c:781:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	orq	%r13, %rdi	 ; while_stmt, tmp137
	movq	__imp___acrt_iob_func(%rip), %rax	 ;, tmp146
 ; ./asm_test/win/i/all.c:782:             fprintf(stderr, "Error creating statement: content is NULL\n");
	movl	$2, %ecx	 ;,
 ; ./asm_test/win/i/all.c:781:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	orq	%rdi, %rsi	 ; tmp137, tmp138
	orq	%rsi, %rbp	 ; tmp138, tmp139
	orq	%rbp, %r12	 ; tmp139, tmp154
	jne	.L513	 ;,
 ; ./asm_test/win/i/all.c:782:             fprintf(stderr, "Error creating statement: content is NULL\n");
	call	*%rax	 ; tmp146
 ; ./asm_test/win/i/all.c:782:             fprintf(stderr, "Error creating statement: content is NULL\n");
	leaq	.LC107(%rip), %rcx	 ;, tmp142
 ; ./asm_test/win/i/all.c:782:             fprintf(stderr, "Error creating statement: content is NULL\n");
	movq	%rax, %rdx	 ; tmp152, _23
 ; ./asm_test/win/i/all.c:782:             fprintf(stderr, "Error creating statement: content is NULL\n");
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:782:             fprintf(stderr, "Error creating statement: content is NULL\n");
	jmp	.L514	 ;
.L513:
 ; ./asm_test/win/i/all.c:784:             fprintf(stderr, "Error creating statement: unknown type %u\n", type);
	call	*%rax	 ; tmp146
 ; ./asm_test/win/i/all.c:784:             fprintf(stderr, "Error creating statement: unknown type %u\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC108(%rip), %rdx	 ;, tmp144
 ; ./asm_test/win/i/all.c:784:             fprintf(stderr, "Error creating statement: unknown type %u\n", type);
	movq	%rax, %rcx	 ; tmp153, _24
 ; ./asm_test/win/i/all.c:784:             fprintf(stderr, "Error creating statement: unknown type %u\n", type);
	call	fprintf	 ;
.L514:
 ; ./asm_test/win/i/all.c:785:         return NULL;
	xorl	%eax, %eax	 ; <retval>
.L503:
 ; ./asm_test/win/i/all.c:788: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
	.section .rdata,"dr"
.LC109:
	.ascii "Error creating class member: content is NULL\12\0"
.LC110:
	.ascii "Error creating class member: unknown type %u\12\0"
	.text
	.def	create_class_member;	.scl	3;	.type	32;	.endef
create_class_member:
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp113, method_content
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp114, variable_content
	pushq	%rbx	 ;
	movl	%ecx, %ebx	 ; tmp112, type
 ; ./asm_test/win/i/all.c:726:     ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
	movl	$16, %ecx	 ;,
 ; ./asm_test/win/i/all.c:725: ClassMember* create_class_member(ClassMemberType type, Method* method_content, Variable* variable_content) {
	subq	$32, %rsp	 ;,
 ; ./asm_test/win/i/all.c:726:     ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:727:     class_member->type = type;
	movl	%ebx, 8(%rax)	 ; type, class_member_11->type
 ; ./asm_test/win/i/all.c:728:     if (type == CLASS_METHOD && method_content != NULL)
	testb	$1, %bl	 ;, type
	jne	.L548	 ;,
	testq	%rdi, %rdi	 ; method_content
	je	.L548	 ;,
 ; ./asm_test/win/i/all.c:729:         class_member->content.method = method_content;
	movq	%rdi, (%rax)	 ; method_content, class_member_11->content.method
	jmp	.L547	 ;
.L548:
 ; ./asm_test/win/i/all.c:730:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	testq	%rsi, %rsi	 ; variable_content
	je	.L550	 ;,
	testb	$1, %bl	 ;, type
	je	.L550	 ;,
 ; ./asm_test/win/i/all.c:731:         class_member->content.variable = variable_content;
	movq	%rsi, (%rax)	 ; variable_content, class_member_11->content.variable
	jmp	.L547	 ;
.L550:
 ; ./asm_test/win/i/all.c:733:         if (method_content == NULL && variable_content == NULL)
	orq	%rdi, %rsi	 ; method_content, tmp118
	movq	__imp___acrt_iob_func(%rip), %rax	 ;, tmp111
 ; ./asm_test/win/i/all.c:734:             fprintf(stderr, "Error creating class member: content is NULL\n");
	movl	$2, %ecx	 ;,
 ; ./asm_test/win/i/all.c:733:         if (method_content == NULL && variable_content == NULL)
	jne	.L552	 ;,
 ; ./asm_test/win/i/all.c:734:             fprintf(stderr, "Error creating class member: content is NULL\n");
	call	*%rax	 ; tmp111
 ; ./asm_test/win/i/all.c:734:             fprintf(stderr, "Error creating class member: content is NULL\n");
	leaq	.LC109(%rip), %rcx	 ;, tmp107
 ; ./asm_test/win/i/all.c:734:             fprintf(stderr, "Error creating class member: content is NULL\n");
	movq	%rax, %rdx	 ; tmp116, _24
 ; ./asm_test/win/i/all.c:734:             fprintf(stderr, "Error creating class member: content is NULL\n");
	call	fputs	 ;
	jmp	.L553	 ;
.L552:
 ; ./asm_test/win/i/all.c:736:             fprintf(stderr, "Error creating class member: unknown type %u\n", type);
	call	*%rax	 ; tmp111
 ; ./asm_test/win/i/all.c:736:             fprintf(stderr, "Error creating class member: unknown type %u\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC110(%rip), %rdx	 ;, tmp109
 ; ./asm_test/win/i/all.c:736:             fprintf(stderr, "Error creating class member: unknown type %u\n", type);
	movq	%rax, %rcx	 ; tmp117, _25
 ; ./asm_test/win/i/all.c:736:             fprintf(stderr, "Error creating class member: unknown type %u\n", type);
	call	fprintf	 ;
.L553:
 ; ./asm_test/win/i/all.c:725: ClassMember* create_class_member(ClassMemberType type, Method* method_content, Variable* variable_content) {
	xorl	%eax, %eax	 ; <retval>
.L547:
 ; ./asm_test/win/i/all.c:740: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.section .rdata,"dr"
.LC111:
	.ascii "Error creating code member: content is NULL\12\0"
.LC112:
	.ascii "Error creating code member: unknown type %u\12\0"
	.text
	.def	create_code_member;	.scl	3;	.type	32;	.endef
create_code_member:
	pushq	%r12	 ;
	movq	%r8, %r12	 ; tmp125, function_content
	pushq	%rbp	 ;
	movq	%rdx, %rbp	 ; tmp124, import_content
	pushq	%rdi	 ;
	movq	%r9, %rdi	 ; tmp126, class_content
	pushq	%rsi	 ;
	movl	%ecx, %esi	 ; tmp123, type
 ; ./asm_test/win/i/all.c:671:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	movl	$16, %ecx	 ;,
 ; ./asm_test/win/i/all.c:670: CodeMember* create_code_member(CodeMemberType type, Import* import_content, Function* function_content, Class* class_content) {
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; ./asm_test/win/i/all.c:671:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:672:     code_member->type = type;
	movl	%esi, 8(%rax)	 ; type, code_member_18->type
 ; ./asm_test/win/i/all.c:671:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	movq	%rax, %rbx	 ; tmp127, <retval>
 ; ./asm_test/win/i/all.c:673:     if (type == CODE_IMPORT && import_content != NULL)
	testl	%esi, %esi	 ; type
	jne	.L568	 ;,
	testq	%rbp, %rbp	 ; import_content
	je	.L568	 ;,
 ; ./asm_test/win/i/all.c:674:         code_member->content.import = import_content;
	movq	%rbp, (%rax)	 ; import_content, code_member_18->content.import
	jmp	.L567	 ;
.L568:
 ; ./asm_test/win/i/all.c:675:     else if (type == CODE_FUNCTION && function_content != NULL)
	cmpl	$1, %esi	 ;, type
	jne	.L570	 ;,
	testq	%r12, %r12	 ; function_content
	je	.L570	 ;,
 ; ./asm_test/win/i/all.c:676:         code_member->content.function = function_content;
	movq	%r12, (%rbx)	 ; function_content, code_member_18->content.function
	jmp	.L567	 ;
.L570:
 ; ./asm_test/win/i/all.c:677:     else if (type == CODE_CLASS && class_content != NULL)
	cmpl	$2, %esi	 ;, type
	jne	.L571	 ;,
	testq	%rdi, %rdi	 ; class_content
	je	.L571	 ;,
 ; ./asm_test/win/i/all.c:678:         code_member->content.class = class_content;
	movq	%rdi, (%rbx)	 ; class_content, code_member_18->content.class
	jmp	.L567	 ;
.L571:
 ; ./asm_test/win/i/all.c:679:     else if (import_content == NULL && function_content == NULL && class_content == NULL)
	orq	%r12, %rdi	 ; function_content, tmp115
	movq	__imp___acrt_iob_func(%rip), %rax	 ;, tmp122
 ; ./asm_test/win/i/all.c:680:         fprintf(stderr, "Error creating code member: content is NULL\n");
	movl	$2, %ecx	 ;,
 ; ./asm_test/win/i/all.c:679:     else if (import_content == NULL && function_content == NULL && class_content == NULL)
	orq	%rdi, %rbp	 ; tmp115, tmp130
	jne	.L572	 ;,
 ; ./asm_test/win/i/all.c:680:         fprintf(stderr, "Error creating code member: content is NULL\n");
	call	*%rax	 ; tmp122
 ; ./asm_test/win/i/all.c:680:         fprintf(stderr, "Error creating code member: content is NULL\n");
	leaq	.LC111(%rip), %rcx	 ;, tmp118
 ; ./asm_test/win/i/all.c:680:         fprintf(stderr, "Error creating code member: content is NULL\n");
	movq	%rax, %rdx	 ; tmp128, _13
 ; ./asm_test/win/i/all.c:680:         fprintf(stderr, "Error creating code member: content is NULL\n");
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:680:         fprintf(stderr, "Error creating code member: content is NULL\n");
	jmp	.L567	 ;
.L572:
 ; ./asm_test/win/i/all.c:682:         fprintf(stderr, "Error creating code member: unknown type %u\n", type);
	call	*%rax	 ; tmp122
 ; ./asm_test/win/i/all.c:682:         fprintf(stderr, "Error creating code member: unknown type %u\n", type);
	movl	%esi, %r8d	 ; type,
	leaq	.LC112(%rip), %rdx	 ;, tmp120
 ; ./asm_test/win/i/all.c:682:         fprintf(stderr, "Error creating code member: unknown type %u\n", type);
	movq	%rax, %rcx	 ; tmp129, _14
 ; ./asm_test/win/i/all.c:682:         fprintf(stderr, "Error creating code member: unknown type %u\n", type);
	call	fprintf	 ;
.L567:
 ; ./asm_test/win/i/all.c:684: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.section .rdata,"dr"
.LC113:
	.ascii "Error: list_append received NULL list\12\0"
	.text
	.def	list_append;	.scl	3;	.type	32;	.endef
list_append:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1023:     if (list == NULL) {
	testq	%rcx, %rcx	 ; list
	jne	.L593	 ;,
 ; ./asm_test/win/i/all.c:1024:         fprintf(stderr, "Error: list_append received NULL list\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:1035: }
	addq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1024:         fprintf(stderr, "Error: list_append received NULL list\n");
	leaq	.LC113(%rip), %rcx	 ;, tmp89
 ; ./asm_test/win/i/all.c:1035: }
	popq	%rbx	 ;
 ; ./asm_test/win/i/all.c:1024:         fprintf(stderr, "Error: list_append received NULL list\n");
	movq	%rax, %rdx	 ; tmp93, _14
 ; ./asm_test/win/i/all.c:1035: }
	popq	%rsi	 ;
 ; ./asm_test/win/i/all.c:1024:         fprintf(stderr, "Error: list_append received NULL list\n");
	jmp	fputs	 ;
.L593:
	movq	%rcx, %rbx	 ; tmp91, list
 ; ./asm_test/win/i/all.c:1017:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %ecx	 ;,
	movq	%rdx, %rsi	 ; tmp92, item
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:1018:     new_node->next = NULL;
	xorl	%edx, %edx	 ;
 ; ./asm_test/win/i/all.c:1028:     if (list->head == NULL) {
	cmpq	$0, (%rbx)	 ;, list_3(D)->head
 ; ./asm_test/win/i/all.c:1018:     new_node->next = NULL;
	movq	%rdx, (%rax)	 ;, new_node_15->next
 ; ./asm_test/win/i/all.c:1019:     new_node->content = content;
	movq	%rsi, 8(%rax)	 ; item, new_node_15->content
 ; ./asm_test/win/i/all.c:1028:     if (list->head == NULL) {
	jne	.L594	 ;,
 ; ./asm_test/win/i/all.c:1029:         list->head = new_node;
	movq	%rax, (%rbx)	 ; new_node, list_3(D)->head
	jmp	.L597	 ;
.L594:
 ; ./asm_test/win/i/all.c:1032:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	 ; list_3(D)->tail, list_3(D)->tail
	movq	%rax, (%rdx)	 ; new_node, _2->next
.L597:
 ; ./asm_test/win/i/all.c:1033:         list->tail = new_node;
	movq	%rax, 8(%rbx)	 ; new_node, list_3(D)->tail
 ; ./asm_test/win/i/all.c:1035: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.section .rdata,"dr"
.LC114:
	.ascii "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\12\0"
.LC115:
	.ascii "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\12\0"
	.text
	.def	create_symbol;	.scl	3;	.type	32;	.endef
create_symbol:
	pushq	%r14	 ;
	movq	%r8, %r14	 ; tmp114, type
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%rcx, %r12	 ; tmp112, name
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movl	%edx, %edi	 ; tmp113, kind
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp115, ast_node
	pushq	%rbx	 ;
	subq	$64, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1073:     switch (kind) {
	cmpl	$2, %edx	 ;, kind
	je	.L599	 ;,
	movq	%r9, %rbp	 ; ast_node, scope
	ja	.L600	 ;,
	cmpl	$1, %edx	 ;, kind
	je	.L599	 ;,
 ; ./asm_test/win/i/all.c:1074:         case SYMBOL_CLASS: scope = ((Class*)ast_node)->class_scope->parent; break;
	movq	16(%r9), %rax	 ; MEM[(struct Class *)ast_node_22(D)].class_scope, MEM[(struct Class *)ast_node_22(D)].class_scope
	jmp	.L616	 ;
.L599:
 ; ./asm_test/win/i/all.c:1076:         case SYMBOL_METHOD: scope = ((Method*)ast_node)->method_scope->parent; break;
	movq	32(%rsi), %rax	 ;, MEM[(struct Method *)ast_node_22(D)].method_scope
.L616:
	movq	(%rax), %rbp	 ;* MEM[(struct Method *)ast_node_22(D)].method_scope, scope
.L600:
 ; ./asm_test/win/i/all.c:1085:     Symbol* result = search_name(scope, name);
	movq	%r12, %rdx	 ; name,
	movq	%rbp, %rcx	 ; scope,
	call	search_name	 ;
 ; ./asm_test/win/i/all.c:1086:     if (result != NULL)
	testq	%rax, %rax	 ; result
	je	.L602	 ;,
 ; ./asm_test/win/i/all.c:1087:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	movq	id_counter.0(%rip), %rdx	 ; id_counter, tmp121
 ; ./asm_test/win/i/all.c:1087:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	movl	32(%rax), %r9d	 ; result_30->kind, _8
 ; ./asm_test/win/i/all.c:1087:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	movl	$2, %ecx	 ;,
	movq	16(%rax), %r13	 ; result_30->id, _7
	leaq	1(%rdx), %rbx	 ;, _6
 ; ./asm_test/win/i/all.c:1087:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	movl	%r9d, 60(%rsp)	 ; _8, %sfp
 ; ./asm_test/win/i/all.c:1087:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:1087:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	movq	%rbx, 40(%rsp)	 ; _6,
	movl	60(%rsp), %r9d	 ; %sfp, _8
	movq	%r12, %r8	 ; name,
	movq	%r13, 32(%rsp)	 ; _7,
 ; ./asm_test/win/i/all.c:1087:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	movq	%rax, %rcx	 ; tmp117, _9
 ; ./asm_test/win/i/all.c:1087:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	leaq	.LC114(%rip), %rdx	 ;, tmp106
	call	fprintf	 ;
.L602:
 ; ./asm_test/win/i/all.c:1088:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:1089:     new_name->name = name;
	movq	%r12, 8(%rax)	 ; name, new_name_34->name
 ; ./asm_test/win/i/all.c:1088:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movq	%rax, %rbx	 ; tmp118, <retval>
 ; ./asm_test/win/i/all.c:1090:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	 ; id_counter, tmp122
 ; ./asm_test/win/i/all.c:1091:     new_name->kind = kind;
	movl	%edi, 32(%rbx)	 ; kind, new_name_34->kind
 ; ./asm_test/win/i/all.c:1090:     new_name->id = ++id_counter;
	leaq	1(%rax), %r13	 ;, _11
 ; ./asm_test/win/i/all.c:1092:     new_name->type = type;
	movq	%r14, (%rbx)	 ; type, new_name_34->type
 ; ./asm_test/win/i/all.c:1090:     new_name->id = ++id_counter;
	movq	%r13, id_counter.0(%rip)	 ; _11, id_counter
	movq	%r13, 16(%rbx)	 ; _11, new_name_34->id
 ; ./asm_test/win/i/all.c:1096:         case SYMBOL_METHOD: new_name->ast_node.method = (Method*)ast_node; break;
	movq	%rsi, 24(%rbx)	 ; ast_node,
 ; ./asm_test/win/i/all.c:1105:     if (scope == NULL)
	testq	%rbp, %rbp	 ; scope
	jne	.L608	 ;,
 ; ./asm_test/win/i/all.c:1106:         fprintf(stderr, "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n", name, kind, new_name->id);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:1106:         fprintf(stderr, "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n", name, kind, new_name->id);
	movq	%r13, 32(%rsp)	 ; _11,
	movl	%edi, %r9d	 ; kind,
	movq	%r12, %r8	 ; name,
 ; ./asm_test/win/i/all.c:1106:         fprintf(stderr, "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n", name, kind, new_name->id);
	movq	%rax, %rcx	 ; tmp119, _14
 ; ./asm_test/win/i/all.c:1106:         fprintf(stderr, "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n", name, kind, new_name->id);
	leaq	.LC115(%rip), %rdx	 ;, tmp109
	call	fprintf	 ;
	jmp	.L598	 ;
.L608:
 ; ./asm_test/win/i/all.c:1108:         list_append(scope->symbols, (size_t*)new_name);
	movq	8(%rbp), %rcx	 ; scope_16->symbols, scope_16->symbols
	movq	%rbx, %rdx	 ; <retval>,
	call	list_append	 ;
.L598:
 ; ./asm_test/win/i/all.c:1110: }
	addq	$64, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
	.def	create_subroutine;	.scl	3;	.type	32;	.endef
create_subroutine:
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp89, name
 ; ./asm_test/win/i/all.c:3213:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3212: Subroutine* create_subroutine(Symbol* name, Symbol* return_type) {
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp90, return_type
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3213:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:3214:     subroutine->name = name;
	movq	%rdi, (%rax)	 ; name, subroutine_6->name
 ; ./asm_test/win/i/all.c:3213:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %rbx	 ; tmp91, <retval>
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
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.def	create_block;	.scl	3;	.type	32;	.endef
create_block:
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp86, label
 ; ./asm_test/win/i/all.c:3222:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3221: Block* create_block(Var* label) {
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3222:     Block* block = (Block*)alloc_memory(sizeof(Block));
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:3223:     block->label = label;
	movq	%rsi, (%rax)	 ; label, block_4->label
 ; ./asm_test/win/i/all.c:3222:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rbx	 ; tmp87, <retval>
 ; ./asm_test/win/i/all.c:3224:     block->instructions = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:3224:     block->instructions = create_list();
	movq	%rax, 8(%rbx)	 ; tmp88, block_4->instructions
 ; ./asm_test/win/i/all.c:3226: }
	addq	$40, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.def	create_arg;	.scl	3;	.type	32;	.endef
create_arg:
	pushq	%rsi	 ;
	movl	%ecx, %esi	 ; tmp110, kind
 ; ./asm_test/win/i/all.c:3332:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3331: Arg* create_arg(ArgType kind, void* value) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp111, value
	subq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3332:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:3334:     arg->type = NULL;
	xorl	%ecx, %ecx	 ;
 ; ./asm_test/win/i/all.c:3333:     arg->kind = kind;
	movl	%esi, 16(%rax)	 ; kind, arg_15->kind
 ; ./asm_test/win/i/all.c:3335:     switch (kind) {
	decl	%esi	 ;
 ; ./asm_test/win/i/all.c:3334:     arg->type = NULL;
	movq	%rcx, 8(%rax)	 ;, arg_15->type
 ; ./asm_test/win/i/all.c:3335:     switch (kind) {
	cmpl	$7, %esi	 ;, tmp95
	ja	.L623	 ;,
	leaq	.L624(%rip), %rcx	 ;, tmp97
	movslq	(%rcx,%rsi,4), %rdx	 ;, tmp99
	addq	%rcx, %rdx	 ; tmp97, tmp100
	jmp	*%rdx	 ; tmp100
	.section .rdata,"dr"
	.align 4
.L624:
	.long	.L630-.L624
	.long	.L629-.L624
	.long	.L628-.L624
	.long	.L627-.L624
	.long	.L626-.L624
	.long	.L625-.L624
	.long	.L623-.L624
	.long	.L623-.L624
	.text
.L630:
 ; ./asm_test/win/i/all.c:3341:             arg->value.int_value = *(long long*)value;
	movq	(%rbx), %rdx	 ; MEM[(long long int *)value_19(D)], _2
 ; ./asm_test/win/i/all.c:3341:             arg->value.int_value = *(long long*)value;
	movq	%rdx, (%rax)	 ; _2, arg_15->value.int_value
 ; ./asm_test/win/i/all.c:3342:             arg->type = name_int;
	movq	name_int(%rip), %rdx	 ; name_int, name_int
	jmp	.L633	 ;
.L629:
 ; ./asm_test/win/i/all.c:3345:             arg->value.float_value = *(double*)value;
	movsd	(%rbx), %xmm0	 ; MEM[(double *)value_19(D)], _4
 ; ./asm_test/win/i/all.c:3346:             arg->type = name_float;
	movq	name_float(%rip), %rdx	 ; name_float, name_float
 ; ./asm_test/win/i/all.c:3345:             arg->value.float_value = *(double*)value;
	movsd	%xmm0, (%rax)	 ; _4, arg_15->value.float_value
	jmp	.L633	 ;
.L628:
 ; ./asm_test/win/i/all.c:3349:             arg->value.string_value = (char*)value;
	movq	%rbx, (%rax)	 ; value, arg_15->value.string_value
 ; ./asm_test/win/i/all.c:3350:             arg->type = name_string;
	movq	name_string(%rip), %rdx	 ; name_string, name_string
	jmp	.L633	 ;
.L627:
 ; ./asm_test/win/i/all.c:3353:             arg->value.bool_value = *(char*)value;
	movb	(%rbx), %dl	 ; MEM[(char *)value_19(D)], _7
 ; ./asm_test/win/i/all.c:3353:             arg->value.bool_value = *(char*)value;
	movb	%dl, (%rax)	 ; _7, arg_15->value.bool_value
 ; ./asm_test/win/i/all.c:3354:             arg->type = name_bool;
	movq	name_bool(%rip), %rdx	 ; name_bool, name_bool
	jmp	.L633	 ;
.L626:
 ; ./asm_test/win/i/all.c:3357:             arg->value.string_value = NULL;
	xorl	%edx, %edx	 ;
	movq	%rdx, (%rax)	 ;, arg_15->value.string_value
 ; ./asm_test/win/i/all.c:3358:             arg->type = name_void;
	movq	name_void(%rip), %rdx	 ; name_void, name_void
	jmp	.L633	 ;
.L625:
 ; ./asm_test/win/i/all.c:3361:             arg->value.label = (Var*)value;
	movq	%rbx, (%rax)	 ; value, arg_15->value.label
 ; ./asm_test/win/i/all.c:3362:             break;
	jmp	.L631	 ;
.L623:
 ; ./asm_test/win/i/all.c:3365:             arg->value.subroutine = (Var*)value;
	movq	%rbx, (%rax)	 ; value,* <retval>
 ; ./asm_test/win/i/all.c:3366:             arg->type = arg->value.subroutine->type;
	movq	16(%rbx), %rdx	 ; MEM[(struct Var *)value_19(D)].type, MEM[(struct Var *)value_19(D)].type
.L633:
	movq	%rdx, 8(%rax)	 ; MEM[(struct Var *)value_19(D)].type, arg_15->type
.L631:
 ; ./asm_test/win/i/all.c:3373:     arg->is_get = 0;
	movb	$0, 20(%rax)	 ;, arg_15->is_get
 ; ./asm_test/win/i/all.c:3375: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.def	create_instruction;	.scl	3;	.type	32;	.endef
create_instruction:
	pushq	%rbp	 ;
	movl	%ecx, %ebp	 ; tmp88, type
 ; ./asm_test/win/i/all.c:3324:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3323: Instruction* create_instruction(InstructionType type, Arg* arg1, Arg* arg2, Arg* arg3) {
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp89, arg1
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp90, arg2
	pushq	%rbx	 ;
	movq	%r9, %rbx	 ; tmp91, arg3
	subq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3324:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
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
.LC116:
	.ascii "$%d-error\0"
.LC117:
	.ascii "$%c%zu\0"
	.text
	.def	create_var;	.scl	3;	.type	32;	.endef
create_var:
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%rdx, %r12	 ; tmp156, type
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp155, original_name
	pushq	%rdi	 ;
	movl	%r8d, %edi	 ; tmp157, kind
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp158, status
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3272:     if (original_name != NULL) {
	testq	%rcx, %rcx	 ; original_name
	jne	.L637	 ;,
.L670:
 ; ./asm_test/win/i/all.c:3285:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:3286:     var->original_name = original_name;
	movq	%rbp, (%rax)	 ; original_name, var_42->original_name
 ; ./asm_test/win/i/all.c:3285:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	 ; tmp159, <retval>
 ; ./asm_test/win/i/all.c:3288:     switch (kind) {
	cmpl	$112, %edi	 ;, kind
	je	.L638	 ;,
	ja	.L639	 ;,
	cmpl	$98, %edi	 ;, kind
	je	.L640	 ;,
	cmpl	$102, %edi	 ;, kind
	je	.L641	 ;,
	cmpl	$97, %edi	 ;, kind
	je	.L642	 ;,
	jmp	.L689	 ;
.L639:
	cmpl	$116, %edi	 ;, kind
	je	.L644	 ;,
	cmpl	$118, %edi	 ;, kind
	je	.L645	 ;,
.L689:
	orq	$-1, %r9	 ;, id
	jmp	.L643	 ;
.L637:
 ; ./asm_test/win/i/all.c:3273:         Class* current_class = NULL;
	xorl	%r14d, %r14d	 ; current_class
 ; ./asm_test/win/i/all.c:3274:         if (type->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rdx)	 ;, type_34(D)->kind
	jne	.L646	 ;,
 ; ./asm_test/win/i/all.c:3276:             status->current_class = type->ast_node.class;
	movq	24(%rdx), %rax	 ; type_34(D)->ast_node.class, type_34(D)->ast_node.class
 ; ./asm_test/win/i/all.c:3275:             current_class = status->current_class;
	movq	24(%r9), %r14	 ; status_35(D)->current_class, current_class
 ; ./asm_test/win/i/all.c:3276:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%r9)	 ; type_34(D)->ast_node.class, status_35(D)->current_class
.L646:
 ; ./asm_test/win/i/all.c:3228:     if (status->current_subroutine != NULL && status->current_subroutine->local_vars != NULL && status->current_subroutine->local_vars->head != NULL && status->current_subroutine->local_vars->tail != NULL) {
	movq	8(%rsi), %rax	 ; status_35(D)->current_subroutine, _57
 ; ./asm_test/win/i/all.c:3228:     if (status->current_subroutine != NULL && status->current_subroutine->local_vars != NULL && status->current_subroutine->local_vars->head != NULL && status->current_subroutine->local_vars->tail != NULL) {
	testq	%rax, %rax	 ; _57
	jne	.L647	 ;,
.L650:
 ; ./asm_test/win/i/all.c:3237:     if (status->current_subroutine != NULL && status->current_subroutine->parameters != NULL && status->current_subroutine->parameters->head != NULL && status->current_subroutine->parameters->tail != NULL) {
	movq	8(%rsi), %rax	 ; status_35(D)->current_subroutine, _64
 ; ./asm_test/win/i/all.c:3237:     if (status->current_subroutine != NULL && status->current_subroutine->parameters != NULL && status->current_subroutine->parameters->head != NULL && status->current_subroutine->parameters->tail != NULL) {
	testq	%rax, %rax	 ; _64
	jne	.L648	 ;,
	jmp	.L649	 ;
.L647:
 ; ./asm_test/win/i/all.c:3228:     if (status->current_subroutine != NULL && status->current_subroutine->local_vars != NULL && status->current_subroutine->local_vars->head != NULL && status->current_subroutine->local_vars->tail != NULL) {
	movq	24(%rax), %rcx	 ; _57->local_vars, _58
 ; ./asm_test/win/i/all.c:3228:     if (status->current_subroutine != NULL && status->current_subroutine->local_vars != NULL && status->current_subroutine->local_vars->head != NULL && status->current_subroutine->local_vars->tail != NULL) {
	testq	%rcx, %rcx	 ; _58
	je	.L650	 ;,
 ; ./asm_test/win/i/all.c:3228:     if (status->current_subroutine != NULL && status->current_subroutine->local_vars != NULL && status->current_subroutine->local_vars->head != NULL && status->current_subroutine->local_vars->tail != NULL) {
	cmpq	$0, (%rcx)	 ;, _58->head
	je	.L650	 ;,
 ; ./asm_test/win/i/all.c:3228:     if (status->current_subroutine != NULL && status->current_subroutine->local_vars != NULL && status->current_subroutine->local_vars->head != NULL && status->current_subroutine->local_vars->tail != NULL) {
	cmpq	$0, 8(%rcx)	 ;, _58->tail
	je	.L650	 ;,
 ; ./asm_test/win/i/all.c:3229:         List* vars = list_copy(status->current_subroutine->local_vars);
	call	list_copy	 ;
	movq	%rax, %rcx	 ; tmp160, vars
.L651:
 ; ./asm_test/win/i/all.c:3231:         while ((var = (Var*)list_pop(vars)) != NULL) {
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp161, <retval>
 ; ./asm_test/win/i/all.c:3231:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L650	 ;,
 ; ./asm_test/win/i/all.c:3232:             if (var->original_name == original_name) {
	cmpq	(%rbx), %rbp	 ; var_62->original_name, original_name
	jne	.L651	 ;,
	jmp	.L652	 ;
.L648:
 ; ./asm_test/win/i/all.c:3237:     if (status->current_subroutine != NULL && status->current_subroutine->parameters != NULL && status->current_subroutine->parameters->head != NULL && status->current_subroutine->parameters->tail != NULL) {
	movq	16(%rax), %rcx	 ; _64->parameters, _65
 ; ./asm_test/win/i/all.c:3237:     if (status->current_subroutine != NULL && status->current_subroutine->parameters != NULL && status->current_subroutine->parameters->head != NULL && status->current_subroutine->parameters->tail != NULL) {
	testq	%rcx, %rcx	 ; _65
	jne	.L690	 ;,
.L649:
 ; ./asm_test/win/i/all.c:3246:     if (status->current_class != NULL && status->tac->attribute_tables != NULL && status->tac->attribute_tables->head != NULL && status->tac->attribute_tables->tail != NULL) {
	cmpq	$0, 24(%rsi)	 ;, status_35(D)->current_class
 ; ./asm_test/win/i/all.c:3246:     if (status->current_class != NULL && status->tac->attribute_tables != NULL && status->tac->attribute_tables->head != NULL && status->tac->attribute_tables->tail != NULL) {
	movq	(%rsi), %rax	 ; status_35(D)->tac, pretmp_17
 ; ./asm_test/win/i/all.c:3246:     if (status->current_class != NULL && status->tac->attribute_tables != NULL && status->tac->attribute_tables->head != NULL && status->tac->attribute_tables->tail != NULL) {
	jne	.L654	 ;,
	jmp	.L655	 ;
.L690:
 ; ./asm_test/win/i/all.c:3237:     if (status->current_subroutine != NULL && status->current_subroutine->parameters != NULL && status->current_subroutine->parameters->head != NULL && status->current_subroutine->parameters->tail != NULL) {
	cmpq	$0, (%rcx)	 ;, _65->head
	je	.L649	 ;,
 ; ./asm_test/win/i/all.c:3237:     if (status->current_subroutine != NULL && status->current_subroutine->parameters != NULL && status->current_subroutine->parameters->head != NULL && status->current_subroutine->parameters->tail != NULL) {
	cmpq	$0, 8(%rcx)	 ;, _65->tail
	je	.L649	 ;,
 ; ./asm_test/win/i/all.c:3238:         List* vars = list_copy(status->current_subroutine->parameters);
	call	list_copy	 ;
	movq	%rax, %rcx	 ; tmp162, vars
.L656:
 ; ./asm_test/win/i/all.c:3240:         while ((var = (Var*)list_pop(vars)) != NULL) {
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp163, <retval>
 ; ./asm_test/win/i/all.c:3240:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L649	 ;,
 ; ./asm_test/win/i/all.c:3241:             if (var->original_name == original_name) {
	cmpq	(%rbx), %rbp	 ; var_69->original_name, original_name
	jne	.L656	 ;,
	jmp	.L652	 ;
.L654:
 ; ./asm_test/win/i/all.c:3246:     if (status->current_class != NULL && status->tac->attribute_tables != NULL && status->tac->attribute_tables->head != NULL && status->tac->attribute_tables->tail != NULL) {
	movq	(%rax), %rcx	 ; pretmp_17->attribute_tables, _73
 ; ./asm_test/win/i/all.c:3246:     if (status->current_class != NULL && status->tac->attribute_tables != NULL && status->tac->attribute_tables->head != NULL && status->tac->attribute_tables->tail != NULL) {
	testq	%rcx, %rcx	 ; _73
	jne	.L691	 ;,
.L655:
 ; ./asm_test/win/i/all.c:3260:     if (status->tac->global_vars != NULL && status->tac->global_vars->head != NULL && status->tac->global_vars->tail != NULL) {
	movq	(%rsi), %rax	 ; status_35(D)->tac, status_35(D)->tac
	movq	16(%rax), %rcx	 ; _88->global_vars, _89
 ; ./asm_test/win/i/all.c:3260:     if (status->tac->global_vars != NULL && status->tac->global_vars->head != NULL && status->tac->global_vars->tail != NULL) {
	testq	%rcx, %rcx	 ; _89
	jne	.L658	 ;,
	jmp	.L659	 ;
.L691:
 ; ./asm_test/win/i/all.c:3246:     if (status->current_class != NULL && status->tac->attribute_tables != NULL && status->tac->attribute_tables->head != NULL && status->tac->attribute_tables->tail != NULL) {
	cmpq	$0, (%rcx)	 ;, _73->head
	je	.L655	 ;,
 ; ./asm_test/win/i/all.c:3246:     if (status->current_class != NULL && status->tac->attribute_tables != NULL && status->tac->attribute_tables->head != NULL && status->tac->attribute_tables->tail != NULL) {
	cmpq	$0, 8(%rcx)	 ;, _73->tail
	je	.L655	 ;,
 ; ./asm_test/win/i/all.c:3247:         List* tables = list_copy(status->tac->attribute_tables);
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp164, tables
.L660:
 ; ./asm_test/win/i/all.c:3249:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	movq	%r13, %rcx	 ; tables,
	call	list_pop	 ;
 ; ./asm_test/win/i/all.c:3249:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	testq	%rax, %rax	 ; table
	je	.L655	 ;,
 ; ./asm_test/win/i/all.c:3250:             if (table->name == status->current_class->name && table->attributes != NULL && table->attributes->head != NULL && table->attributes->tail != NULL) {
	movq	24(%rsi), %rdx	 ; status_35(D)->current_class, status_35(D)->current_class
 ; ./asm_test/win/i/all.c:3250:             if (table->name == status->current_class->name && table->attributes != NULL && table->attributes->head != NULL && table->attributes->tail != NULL) {
	movq	(%rdx), %rdx	 ; _79->name, tmp173
	cmpq	%rdx, 8(%rax)	 ; tmp173, table_77->name
	jne	.L660	 ;,
 ; ./asm_test/win/i/all.c:3250:             if (table->name == status->current_class->name && table->attributes != NULL && table->attributes->head != NULL && table->attributes->tail != NULL) {
	movq	(%rax), %rcx	 ; table_77->attributes, _81
 ; ./asm_test/win/i/all.c:3250:             if (table->name == status->current_class->name && table->attributes != NULL && table->attributes->head != NULL && table->attributes->tail != NULL) {
	testq	%rcx, %rcx	 ; _81
	je	.L660	 ;,
 ; ./asm_test/win/i/all.c:3250:             if (table->name == status->current_class->name && table->attributes != NULL && table->attributes->head != NULL && table->attributes->tail != NULL) {
	cmpq	$0, (%rcx)	 ;, _81->head
	je	.L660	 ;,
 ; ./asm_test/win/i/all.c:3250:             if (table->name == status->current_class->name && table->attributes != NULL && table->attributes->head != NULL && table->attributes->tail != NULL) {
	cmpq	$0, 8(%rcx)	 ;, _81->tail
	je	.L660	 ;,
 ; ./asm_test/win/i/all.c:3251:                 List* attributes = list_copy(table->attributes);
	call	list_copy	 ;
	movq	%rax, %rcx	 ; tmp165, attributes
.L663:
 ; ./asm_test/win/i/all.c:3253:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	call	list_pop	 ;
 ; ./asm_test/win/i/all.c:3253:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	testq	%rax, %rax	 ; attr
	je	.L660	 ;,
 ; ./asm_test/win/i/all.c:3254:                     if (attr->var->original_name == original_name) {
	movq	(%rax), %rbx	 ; attr_85->var, <retval>
 ; ./asm_test/win/i/all.c:3254:                     if (attr->var->original_name == original_name) {
	cmpq	(%rbx), %rbp	 ; _86->original_name, original_name
	jne	.L663	 ;,
	jmp	.L652	 ;
.L658:
 ; ./asm_test/win/i/all.c:3260:     if (status->tac->global_vars != NULL && status->tac->global_vars->head != NULL && status->tac->global_vars->tail != NULL) {
	cmpq	$0, (%rcx)	 ;, _89->head
	jne	.L692	 ;,
.L659:
 ; ./asm_test/win/i/all.c:3269:     return NULL;
	xorl	%ebx, %ebx	 ; <retval>
	jmp	.L652	 ;
.L692:
 ; ./asm_test/win/i/all.c:3260:     if (status->tac->global_vars != NULL && status->tac->global_vars->head != NULL && status->tac->global_vars->tail != NULL) {
	cmpq	$0, 8(%rcx)	 ;, _89->tail
	je	.L659	 ;,
 ; ./asm_test/win/i/all.c:3261:         List* vars = list_copy(status->tac->global_vars);
	call	list_copy	 ;
	movq	%rax, %rcx	 ; tmp168, vars
.L666:
 ; ./asm_test/win/i/all.c:3263:         while ((var = (Var*)list_pop(vars)) != NULL) {
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp169, <retval>
 ; ./asm_test/win/i/all.c:3263:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L659	 ;,
 ; ./asm_test/win/i/all.c:3264:             if (var->original_name == original_name) {
	cmpq	(%rbx), %rbp	 ; var_93->original_name, original_name
	jne	.L666	 ;,
.L652:
 ; ./asm_test/win/i/all.c:3279:         if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r12)	 ;, type_34(D)->kind
	jne	.L668	 ;,
 ; ./asm_test/win/i/all.c:3280:             status->current_class = current_class;
	movq	%r14, 24(%rsi)	 ; current_class, status_35(D)->current_class
.L668:
 ; ./asm_test/win/i/all.c:3281:         if (var != NULL) {
	testq	%rbx, %rbx	 ; <retval>
	jne	.L636	 ;,
	jmp	.L670	 ;
.L642:
 ; ./asm_test/win/i/all.c:3289:         case VAR_ATTR: id = status->attr_count++; break;
	movq	48(%rsi), %r9	 ; status_35(D)->attr_count, id
 ; ./asm_test/win/i/all.c:3289:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%r9), %rax	 ;, tmp140
	movq	%rax, 48(%rsi)	 ; tmp140, status_35(D)->attr_count
 ; ./asm_test/win/i/all.c:3289:         case VAR_ATTR: id = status->attr_count++; break;
	jmp	.L643	 ;
.L638:
 ; ./asm_test/win/i/all.c:3290:         case VAR_PARAM: id = status->param_count++; break;
	movq	56(%rsi), %r9	 ; status_35(D)->param_count, id
 ; ./asm_test/win/i/all.c:3290:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r9), %rax	 ;, tmp141
	movq	%rax, 56(%rsi)	 ; tmp141, status_35(D)->param_count
 ; ./asm_test/win/i/all.c:3290:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L643	 ;
.L645:
 ; ./asm_test/win/i/all.c:3291:         case VAR_VAR: id = status->var_count++; break;
	movq	64(%rsi), %r9	 ; status_35(D)->var_count, id
 ; ./asm_test/win/i/all.c:3291:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%r9), %rax	 ;, tmp142
	movq	%rax, 64(%rsi)	 ; tmp142, status_35(D)->var_count
 ; ./asm_test/win/i/all.c:3291:         case VAR_VAR: id = status->var_count++; break;
	jmp	.L643	 ;
.L644:
 ; ./asm_test/win/i/all.c:3292:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rsi), %r9	 ; status_35(D)->temp_count, id
 ; ./asm_test/win/i/all.c:3292:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r9), %rax	 ;, tmp143
	movq	%rax, 72(%rsi)	 ; tmp143, status_35(D)->temp_count
 ; ./asm_test/win/i/all.c:3292:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L643	 ;
.L640:
 ; ./asm_test/win/i/all.c:3293:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rsi), %r9	 ; status_35(D)->block_count, id
 ; ./asm_test/win/i/all.c:3293:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r9), %rax	 ;, tmp144
	movq	%rax, 80(%rsi)	 ; tmp144, status_35(D)->block_count
 ; ./asm_test/win/i/all.c:3293:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L643	 ;
.L641:
 ; ./asm_test/win/i/all.c:3294:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	88(%rsi), %r9	 ; status_35(D)->subroutine_count, id
 ; ./asm_test/win/i/all.c:3294:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%r9), %rax	 ;, tmp145
	movq	%rax, 88(%rsi)	 ; tmp145, status_35(D)->subroutine_count
.L643:
 ; ./asm_test/win/i/all.c:3297:     var->name = create_string_check("", 32, 1);
	movl	$1, %r8d	 ;,
	movl	$32, %edx	 ;,
	movq	%r9, 40(%rsp)	 ; id, %sfp
	leaq	.LC38(%rip), %rcx	 ;, tmp146
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3298:     if (id == (size_t)-1)
	movq	40(%rsp), %r9	 ; %sfp, id
 ; ./asm_test/win/i/all.c:3299:         sprintf(var->name, "$%d-error", kind);
	movl	%edi, %r8d	 ; kind,
 ; ./asm_test/win/i/all.c:3297:     var->name = create_string_check("", 32, 1);
	movq	%rax, 8(%rbx)	 ; _16, var_42->name
 ; ./asm_test/win/i/all.c:3297:     var->name = create_string_check("", 32, 1);
	movq	%rax, %rcx	 ; tmp170, _16
 ; ./asm_test/win/i/all.c:3298:     if (id == (size_t)-1)
	cmpq	$-1, %r9	 ;, id
	jne	.L671	 ;,
 ; ./asm_test/win/i/all.c:3299:         sprintf(var->name, "$%d-error", kind);
	leaq	.LC116(%rip), %rdx	 ;, tmp147
	call	sprintf	 ;
	jmp	.L672	 ;
.L671:
 ; ./asm_test/win/i/all.c:3301:         sprintf(var->name, "$%c%zu", kind, id);
	leaq	.LC117(%rip), %rdx	 ;, tmp148
	call	sprintf	 ;
.L672:
 ; ./asm_test/win/i/all.c:3303:     if (kind == VAR_TEMP || kind == VAR_VAR)
	andl	$-3, %edi	 ;, tmp149
 ; ./asm_test/win/i/all.c:3302:     var->type = type;
	movq	%r12, 16(%rbx)	 ; type, var_42->type
 ; ./asm_test/win/i/all.c:3303:     if (kind == VAR_TEMP || kind == VAR_VAR)
	cmpl	$116, %edi	 ;, tmp149
	jne	.L636	 ;,
 ; ./asm_test/win/i/all.c:3304:         list_append(status->current_subroutine->local_vars, (size_t*)var);
	movq	8(%rsi), %rax	 ; status_35(D)->current_subroutine, status_35(D)->current_subroutine
	movq	%rbx, %rdx	 ; <retval>,
	movq	24(%rax), %rcx	 ; _20->local_vars, _20->local_vars
	call	list_append	 ;
.L636:
 ; ./asm_test/win/i/all.c:3306: }
	addq	$48, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp96, arg
	subq	$32, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3377:     if (arg == NULL) {
	testq	%rcx, %rcx	 ; arg
	je	.L694	 ;,
 ; ./asm_test/win/i/all.c:3380:     if (arg->is_get) {
	cmpb	$0, 20(%rcx)	 ;, arg_3(D)->is_get
	je	.L694	 ;,
	movq	%rdx, %rdi	 ; tmp97, status
 ; ./asm_test/win/i/all.c:3381:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rcx), %rdx	 ; arg_3(D)->type, arg_3(D)->type
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	movq	%rdi, %r9	 ; status,
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3381:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; ./asm_test/win/i/all.c:3381:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp98, _10
 ; ./asm_test/win/i/all.c:3381:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3382:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rbx, %r8	 ; arg,
	xorl	%r9d, %r9d	 ;
	movl	$23, %ecx	 ;,
	movq	%rax, %rdx	 ; temp,
 ; ./asm_test/win/i/all.c:3381:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rsi	 ; tmp99, temp
 ; ./asm_test/win/i/all.c:3382:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_LOAD, temp, arg, NULL));
	call	create_instruction	 ;
 ; ./asm_test/win/i/all.c:3382:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rsi, %rbx	 ; temp, arg
 ; ./asm_test/win/i/all.c:3382:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rax, %rdx	 ; tmp100, _12
 ; ./asm_test/win/i/all.c:3382:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rdi), %rax	 ; status_6(D)->current_block, status_6(D)->current_block
	movq	8(%rax), %rcx	 ; _13->instructions, _13->instructions
	call	list_append	 ;
.L694:
 ; ./asm_test/win/i/all.c:3386: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; arg,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.section .rdata,"dr"
.LC118:
	.ascii "[Warning] Unsupported variable access with NULL base\12\0"
.LC119:
	.ascii "[Warning] Failed to generate variable access for base\12\0"
.LC120:
	.ascii "[Warning] Attempting to access attribute of non-object type: %s\12\0"
.LC121:
	.ascii "[Warning] Attribute '%s' not found in type '%s'\12\0"
.LC122:
	.ascii "[Warning] Attempting to access function '%s' as attribute of type '%s'\12\0"
.LC123:
	.ascii "[Warning] Symbol '%s' in type '%s' is not an attribute\12\0"
.LC124:
	.ascii "arr\0"
.LC125:
	.ascii "[Warning] Attempting to index non-array type: %s\12\0"
.LC126:
	.ascii "[Warning] Failed to generate variable access for index\12\0"
.LC127:
	.ascii "[Warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
.LC128:
	.ascii "[Warning] Unsupported variable access type for tac_variable_access: %u\12\0"
	.text
	.def	tac_variable_access;	.scl	3;	.type	32;	.endef
tac_variable_access:
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp275, variable_access
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp276, status
	subq	$88, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3760:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	cmpl	$0, 16(%rcx)	 ;, variable_access_122(D)->type
	jne	.L700	 ;,
 ; ./asm_test/win/i/all.c:3760:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	8(%rcx), %rcx	 ; variable_access_122(D)->content.name, _2
 ; ./asm_test/win/i/all.c:3760:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%rcx, %rcx	 ; _2
	je	.L700	 ;,
 ; ./asm_test/win/i/all.c:3761:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	movl	32(%rcx), %eax	 ; _2->kind, _3
 ; ./asm_test/win/i/all.c:3762:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	%rbx, %r9	 ; status,
 ; ./asm_test/win/i/all.c:3761:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	leal	-1(%rax), %edx	 ;, tmp207
 ; ./asm_test/win/i/all.c:3761:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	cmpl	$1, %edx	 ;, tmp207
	ja	.L701	 ;,
 ; ./asm_test/win/i/all.c:3762:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	(%rcx), %rdx	 ; _2->type,
	movl	$102, %r8d	 ;,
	jmp	.L741	 ;
.L701:
 ; ./asm_test/win/i/all.c:3765:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name, VAR_VAR, status));
	movl	$118, %r8d	 ;,
	movq	%rcx, %rdx	 ; _2,
 ; ./asm_test/win/i/all.c:3764:         } else if (variable_access->content.name->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	 ; _3
	je	.L742	 ;,
 ; ./asm_test/win/i/all.c:3768:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%rcx), %rdx	 ; _2->type,
.L742:
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3768:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	xorl	%ecx, %ecx	 ;
 ; ./asm_test/win/i/all.c:3768:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	%rax, %rdx	 ; tmp279, _10
	jmp	.L740	 ;
.L700:
 ; ./asm_test/win/i/all.c:3772:     if (variable_access->base == NULL) {
	movq	0(%rbp), %rcx	 ; variable_access_122(D)->base, _11
 ; ./asm_test/win/i/all.c:3772:     if (variable_access->base == NULL) {
	testq	%rcx, %rcx	 ; _11
	jne	.L703	 ;,
 ; ./asm_test/win/i/all.c:3773:         fprintf(stderr, "[Warning] Unsupported variable access with NULL base\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3773:         fprintf(stderr, "[Warning] Unsupported variable access with NULL base\n");
	leaq	.LC118(%rip), %rcx	 ;, tmp209
 ; ./asm_test/win/i/all.c:3773:         fprintf(stderr, "[Warning] Unsupported variable access with NULL base\n");
	movq	%rax, %rdx	 ; tmp280, _12
	jmp	.L735	 ;
.L703:
 ; ./asm_test/win/i/all.c:3776:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_variable_access	 ;
 ; ./asm_test/win/i/all.c:3776:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3776:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rax, %rcx	 ; tmp281, _13
 ; ./asm_test/win/i/all.c:3776:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	call	load_rvalue	 ;
	movq	%rax, %rsi	 ; tmp282, base
 ; ./asm_test/win/i/all.c:3777:     if (base == NULL) {
	testq	%rax, %rax	 ; base
	jne	.L705	 ;,
 ; ./asm_test/win/i/all.c:3778:         fprintf(stderr, "[Warning] Failed to generate variable access for base\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3778:         fprintf(stderr, "[Warning] Failed to generate variable access for base\n");
	leaq	.LC119(%rip), %rcx	 ;, tmp211
 ; ./asm_test/win/i/all.c:3778:         fprintf(stderr, "[Warning] Failed to generate variable access for base\n");
	movq	%rax, %rdx	 ; tmp283, _14
.L735:
 ; ./asm_test/win/i/all.c:3778:         fprintf(stderr, "[Warning] Failed to generate variable access for base\n");
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:3779:         return NULL;
	jmp	.L739	 ;
.L705:
 ; ./asm_test/win/i/all.c:3781:     if (variable_access->type == VAR_GET_ATTR) {
	movl	16(%rbp), %r8d	 ; variable_access_122(D)->type, _15
 ; ./asm_test/win/i/all.c:3781:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %r8d	 ;, _15
	jne	.L707	 ;,
 ; ./asm_test/win/i/all.c:3782:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%rax), %r12	 ; base_135->type, _16
 ; ./asm_test/win/i/all.c:3782:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%r12), %eax	 ; _16->kind, _17
 ; ./asm_test/win/i/all.c:3782:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	leal	-1(%rax), %edx	 ;, tmp212
 ; ./asm_test/win/i/all.c:3782:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %edx	 ;, tmp212
	ja	.L708	 ;,
 ; ./asm_test/win/i/all.c:3783:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	8(%r12), %r8	 ; _16->name, _19
	movl	$2, %ecx	 ;,
	movq	%r8, 48(%rsp)	 ; _19, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3783:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	48(%rsp), %r8	 ; %sfp, _19
	leaq	.LC120(%rip), %rdx	 ;, tmp214
 ; ./asm_test/win/i/all.c:3783:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	%rax, %rcx	 ; tmp284, _20
	jmp	.L736	 ;
.L708:
 ; ./asm_test/win/i/all.c:3786:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%r12), %rcx	 ; _16->ast_node.scope, scope
 ; ./asm_test/win/i/all.c:3787:         if (base->type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _17
	jne	.L709	 ;,
 ; ./asm_test/win/i/all.c:3788:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rcx), %rcx	 ; MEM[(struct Class *)scope_199].class_scope, scope
.L709:
 ; ./asm_test/win/i/all.c:3789:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%rbp), %rax	 ; variable_access_122(D)->content.attr_name, variable_access_122(D)->content.attr_name
	movq	8(%rax), %r13	 ; _21->name, _22
	movq	%r13, %rdx	 ; _22,
	call	search_name_use_strcmp	 ;
	movq	%rax, %rdi	 ; tmp285, attr
 ; ./asm_test/win/i/all.c:3790:         if (attr == NULL) {
	testq	%rax, %rax	 ; attr
	jne	.L710	 ;,
 ; ./asm_test/win/i/all.c:3791:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r12), %r9	 ; _16->name, _23
	movl	$2, %ecx	 ;,
	movq	%r9, 48(%rsp)	 ; _23, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3791:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	48(%rsp), %r9	 ; %sfp, _23
	movq	%r13, %r8	 ; _22,
	leaq	.LC121(%rip), %rdx	 ;, tmp217
 ; ./asm_test/win/i/all.c:3791:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	%rax, %rcx	 ; tmp286, _24
	jmp	.L737	 ;
.L710:
 ; ./asm_test/win/i/all.c:3794:         if (attr->kind == SYMBOL_FUNCTION) {
	movl	32(%rax), %eax	 ; attr_201->kind, _25
 ; ./asm_test/win/i/all.c:3794:         if (attr->kind == SYMBOL_FUNCTION) {
	cmpl	$1, %eax	 ;, _25
	jne	.L711	 ;,
 ; ./asm_test/win/i/all.c:3795:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r12), %r9	 ; _16->name, _26
	movl	$2, %ecx	 ;,
	movq	%r9, 48(%rsp)	 ; _26, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3795:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	48(%rsp), %r9	 ; %sfp, _26
	movq	%r13, %r8	 ; _22,
	leaq	.LC122(%rip), %rdx	 ;, tmp219
 ; ./asm_test/win/i/all.c:3795:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	%rax, %rcx	 ; tmp287, _27
 ; ./asm_test/win/i/all.c:3795:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3796:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rdi), %rdx	 ; attr_201->type,
	movq	%rbx, %r9	 ; status,
	movq	%rdi, %rcx	 ; attr,
	movl	$102, %r8d	 ;,
.L741:
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3796:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$7, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3796:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; tmp288, _29
	jmp	.L740	 ;
.L711:
 ; ./asm_test/win/i/all.c:3798:         if (attr->kind == SYMBOL_METHOD)
	cmpl	$2, %eax	 ;, _25
	jne	.L712	 ;,
 ; ./asm_test/win/i/all.c:3799:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rdi), %rdx	 ; attr_201->type,
	movq	%rdi, %rcx	 ; attr,
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3799:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$8, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3799:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; tmp289, _31
.L740:
 ; ./asm_test/win/i/all.c:3859: }
	addq	$88, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
 ; ./asm_test/win/i/all.c:3799:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	create_arg	 ;
.L712:
 ; ./asm_test/win/i/all.c:3800:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	 ;, _25
	je	.L713	 ;,
 ; ./asm_test/win/i/all.c:3801:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r12), %r9	 ; _16->name, _32
	movl	$2, %ecx	 ;,
	movq	%r9, 48(%rsp)	 ; _32, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3801:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	48(%rsp), %r9	 ; %sfp, _32
	movq	%r13, %r8	 ; _22,
	leaq	.LC123(%rip), %rdx	 ;, tmp221
 ; ./asm_test/win/i/all.c:3801:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	%rax, %rcx	 ; tmp290, _33
.L737:
 ; ./asm_test/win/i/all.c:3801:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3802:             return NULL;
	jmp	.L739	 ;
.L713:
 ; ./asm_test/win/i/all.c:3804:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	(%rdi), %rdx	 ; attr_201->type,
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3804:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; ./asm_test/win/i/all.c:3804:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp291, _35
 ; ./asm_test/win/i/all.c:3804:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3805:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	8(%rbp), %rcx	 ; variable_access_122(D)->content.attr_name, _36
 ; ./asm_test/win/i/all.c:3805:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rbx, %r9	 ; status,
	movl	$97, %r8d	 ;,
 ; ./asm_test/win/i/all.c:3804:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	%rax, %rdi	 ; tmp292, <retval>
 ; ./asm_test/win/i/all.c:3805:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%rcx), %rdx	 ; _36->type,
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3805:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	xorl	%ecx, %ecx	 ;
 ; ./asm_test/win/i/all.c:3805:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rax, %rdx	 ; tmp293, _38
 ; ./asm_test/win/i/all.c:3805:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3805:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rsi, %r8	 ; base,
	movq	%rdi, %rdx	 ; <retval>,
	movl	$15, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3805:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rax, %r9	 ;, tmp294
	jmp	.L743	 ;
.L707:
 ; ./asm_test/win/i/all.c:3809:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %r8d	 ;, _15
	jne	.L714	 ;,
 ; ./asm_test/win/i/all.c:3810:         if (strcmp(base->type->name, "arr") != 0) {
	movq	8(%rax), %rax	 ; base_135->type, base_135->type
 ; ./asm_test/win/i/all.c:3810:         if (strcmp(base->type->name, "arr") != 0) {
	leaq	.LC124(%rip), %rdx	 ;, tmp229
	movq	8(%rax), %rcx	 ; _42->name, _42->name
	call	strcmp	 ;
 ; ./asm_test/win/i/all.c:3810:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	 ; tmp296
	je	.L715	 ;,
 ; ./asm_test/win/i/all.c:3811:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	(%rsi), %rax	 ; base_135->value.variable, base_135->value.variable
 ; ./asm_test/win/i/all.c:3811:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movl	$2, %ecx	 ;,
	movq	(%rax), %rax	 ; _45->original_name, _45->original_name
	movq	8(%rax), %r8	 ; _46->name, _47
	movq	%r8, 48(%rsp)	 ; _47, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3811:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	48(%rsp), %r8	 ; %sfp, _47
	leaq	.LC125(%rip), %rdx	 ;, tmp233
 ; ./asm_test/win/i/all.c:3811:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	%rax, %rcx	 ; tmp297, _48
.L736:
 ; ./asm_test/win/i/all.c:3811:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3812:             return NULL;
	jmp	.L739	 ;
.L715:
 ; ./asm_test/win/i/all.c:3814:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	8(%rbp), %rcx	 ; variable_access_122(D)->content.index, variable_access_122(D)->content.index
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; ./asm_test/win/i/all.c:3814:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rbx, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3814:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rax, %rcx	 ; tmp298, _50
 ; ./asm_test/win/i/all.c:3814:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	call	load_rvalue	 ;
	movq	%rax, %rbp	 ; tmp299, index
 ; ./asm_test/win/i/all.c:3815:         if (index == NULL) {
	testq	%rax, %rax	 ; index
	jne	.L716	 ;,
 ; ./asm_test/win/i/all.c:3816:             fprintf(stderr, "[Warning] Failed to generate variable access for index\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3816:             fprintf(stderr, "[Warning] Failed to generate variable access for index\n");
	leaq	.LC126(%rip), %rcx	 ;, tmp236
 ; ./asm_test/win/i/all.c:3816:             fprintf(stderr, "[Warning] Failed to generate variable access for index\n");
	movq	%rax, %rdx	 ; tmp300, _51
	jmp	.L735	 ;
.L716:
 ; ./asm_test/win/i/all.c:3819:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	name_int(%rip), %rdx	 ; name_int,
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3819:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; ./asm_test/win/i/all.c:3819:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp301, _53
 ; ./asm_test/win/i/all.c:3819:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3820:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	%rbp, %r9	 ; index,
	movq	%rsi, %r8	 ; base,
	movl	$16, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3819:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	%rax, %rdi	 ; tmp302, <retval>
 ; ./asm_test/win/i/all.c:3820:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	%rax, %rdx	 ; <retval>,
.L743:
	call	create_instruction	 ;
 ; ./asm_test/win/i/all.c:3821:         temp->is_get = 1;
	movb	$1, 20(%rdi)	 ;,
 ; ./asm_test/win/i/all.c:3820:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	%rax, %rdx	 ; tmp303, inst
	jmp	.L738	 ;
.L714:
 ; ./asm_test/win/i/all.c:3824:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %r8d	 ;, _15
	jne	.L717	 ;,
 ; ./asm_test/win/i/all.c:3825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	cmpl	$0, 16(%rax)	 ;, base_135->kind
	jne	.L718	 ;,
 ; ./asm_test/win/i/all.c:3825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	8(%rax), %rax	 ; base_135->type, _57
 ; ./asm_test/win/i/all.c:3825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rax)	 ;, _57->kind
	jne	.L718	 ;,
 ; ./asm_test/win/i/all.c:3826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rax), %rcx	 ; _57->name, _57->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME,
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp304, _61
 ; ./asm_test/win/i/all.c:3826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rsi), %rax	 ; base_135->type, base_135->type
 ; ./asm_test/win/i/all.c:3826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	 ; _62->ast_node.class, _62->ast_node.class
	movq	16(%rax), %rcx	 ; _63->class_scope, _63->class_scope
	call	search_name_use_strcmp	 ;
 ; ./asm_test/win/i/all.c:3827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	(%rax), %rdx	 ; attr_139->type,
 ; ./asm_test/win/i/all.c:3826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	%rax, %rcx	 ; tmp305, attr
 ; ./asm_test/win/i/all.c:3827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$8, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; tmp306, _66
 ; ./asm_test/win/i/all.c:3827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp307, base
.L718:
 ; ./asm_test/win/i/all.c:3829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	movl	16(%rsi), %r8d	 ; base_111->kind, _67
 ; ./asm_test/win/i/all.c:3829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	leal	-7(%r8), %eax	 ;, tmp245
	movl	%r8d, 60(%rsp)	 ; _67, %sfp
 ; ./asm_test/win/i/all.c:3829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	cmpl	$1, %eax	 ;, tmp245
	jbe	.L719	 ;,
 ; ./asm_test/win/i/all.c:3830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	8(%rsi), %rax	 ; base_111->type, base_111->type
	movl	$2, %ecx	 ;,
	movq	8(%rax), %r9	 ; _69->name, _70
	movq	%r9, 48(%rsp)	 ; _70, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	48(%rsp), %r9	 ; %sfp, _70
	movl	60(%rsp), %r8d	 ; %sfp, _67
	leaq	.LC127(%rip), %rdx	 ;, tmp248
 ; ./asm_test/win/i/all.c:3830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	%rax, %rcx	 ; tmp308, _71
 ; ./asm_test/win/i/all.c:3830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	call	fprintf	 ;
.L739:
 ; ./asm_test/win/i/all.c:3831:             return NULL;
	xorl	%edi, %edi	 ; <retval>
	jmp	.L699	 ;
.L719:
 ; ./asm_test/win/i/all.c:3833:         long long arg_count = 0;
	xorl	%eax, %eax	 ;
	movq	%rax, 64(%rsp)	 ;, arg_count
 ; ./asm_test/win/i/all.c:3834:         List* arguments = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:3835:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	cmpl	$8, 16(%rsi)	 ;, base_111->kind
 ; ./asm_test/win/i/all.c:3834:         List* arguments = create_list();
	movq	%rax, %rdi	 ; tmp309, arguments
 ; ./asm_test/win/i/all.c:3835:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	jne	.L722	 ;,
 ; ./asm_test/win/i/all.c:3835:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%rsi), %rax	 ; base_111->type, base_111->type
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME,
	movq	8(%rax), %rcx	 ; _74->name, _74->name
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp310, _76
 ; ./asm_test/win/i/all.c:3835:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	(%rsi), %rax	 ; base_111->value.subroutine, base_111->value.subroutine
 ; ./asm_test/win/i/all.c:3835:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	(%rax), %rax	 ; _77->original_name, _77->original_name
 ; ./asm_test/win/i/all.c:3835:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%rax), %rcx	 ; _78->name, _78->name
	call	strcmp	 ;
 ; ./asm_test/win/i/all.c:3835:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	testl	%eax, %eax	 ; tmp311
	je	.L722	 ;,
 ; ./asm_test/win/i/all.c:3836:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	0(%rbp), %rax	 ; variable_access_122(D)->base, variable_access_122(D)->base
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$8, %ecx	 ;,
	movq	(%rax), %rax	 ; _81->base, _81->base
	movq	%rax, 32(%rsp)	 ; _81->base,
	call	create_primary	 ;
 ; ./asm_test/win/i/all.c:3836:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3836:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rax, %r8	 ;, tmp312
 ; ./asm_test/win/i/all.c:3836:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	call	create_expression	 ;
 ; ./asm_test/win/i/all.c:3836:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rbx, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3836:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rax, %rcx	 ; tmp313, _84
 ; ./asm_test/win/i/all.c:3836:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	call	tac_expression	 ;
 ; ./asm_test/win/i/all.c:3836:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rbx, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3836:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rax, %rcx	 ; tmp314, _85
 ; ./asm_test/win/i/all.c:3836:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	call	load_rvalue	 ;
 ; ./asm_test/win/i/all.c:3837:             long long size = (long long)get_type_size(self->type);
	movq	8(%rax), %rcx	 ; self_151->type, self_151->type
	movq	%rax, 48(%rsp)	 ; self, %sfp
	call	get_type_size	 ;
 ; ./asm_test/win/i/all.c:3838:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	leaq	72(%rsp), %rdx	 ;, tmp261
	movl	$1, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3837:             long long size = (long long)get_type_size(self->type);
	movq	%rax, 72(%rsp)	 ; tmp316, MEM[(long long int *)_7]
 ; ./asm_test/win/i/all.c:3838:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3838:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	48(%rsp), %r8	 ; %sfp, self
	xorl	%r9d, %r9d	 ;
	movl	$17, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3838:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	%rax, %rdx	 ; tmp317, _89
 ; ./asm_test/win/i/all.c:3838:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	call	create_instruction	 ;
 ; ./asm_test/win/i/all.c:3838:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	%rdi, %rcx	 ; arguments,
 ; ./asm_test/win/i/all.c:3838:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	%rax, %rdx	 ; tmp318, _90
 ; ./asm_test/win/i/all.c:3838:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3839:             arg_count++;
	incq	64(%rsp)	 ; arg_count
.L722:
 ; ./asm_test/win/i/all.c:3841:         List* args = list_copy(variable_access->content.args);
	movq	8(%rbp), %rcx	 ; variable_access_122(D)->content.args, variable_access_122(D)->content.args
 ; ./asm_test/win/i/all.c:3846:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	leaq	72(%rsp), %r12	 ;, tmp274
 ; ./asm_test/win/i/all.c:3841:         List* args = list_copy(variable_access->content.args);
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp319, args
.L724:
 ; ./asm_test/win/i/all.c:3843:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	%rbp, %rcx	 ; args,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp325, arg_expr
 ; ./asm_test/win/i/all.c:3843:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg_expr
	je	.L726	 ;,
 ; ./asm_test/win/i/all.c:3844:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; ./asm_test/win/i/all.c:3844:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	%rbx, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3844:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	%rax, %rcx	 ; tmp320, _94
 ; ./asm_test/win/i/all.c:3844:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	call	load_rvalue	 ;
 ; ./asm_test/win/i/all.c:3845:             long long size = (long long)get_type_size(arg->type);
	movq	8(%rax), %rcx	 ; arg_174->type, arg_174->type
	movq	%rax, 48(%rsp)	 ; arg, %sfp
	call	get_type_size	 ;
 ; ./asm_test/win/i/all.c:3846:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	%r12, %rdx	 ; tmp274,
	movl	$1, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3845:             long long size = (long long)get_type_size(arg->type);
	movq	%rax, 72(%rsp)	 ; tmp322, MEM[(long long int *)_7]
 ; ./asm_test/win/i/all.c:3846:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3846:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	48(%rsp), %r8	 ; %sfp, arg
	xorl	%r9d, %r9d	 ;
	movl	$17, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3846:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	%rax, %rdx	 ; tmp323, _98
 ; ./asm_test/win/i/all.c:3846:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	call	create_instruction	 ;
 ; ./asm_test/win/i/all.c:3846:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	%rdi, %rcx	 ; arguments,
 ; ./asm_test/win/i/all.c:3846:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	%rax, %rdx	 ; tmp324, _99
 ; ./asm_test/win/i/all.c:3846:             list_append(arguments, (size_t*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3847:             arg_count++;
	incq	64(%rsp)	 ; arg_count
	jmp	.L724	 ;
.L726:
 ; ./asm_test/win/i/all.c:3850:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	movq	%rdi, %rcx	 ; arguments,
	call	list_pop	 ;
	movq	%rax, %rdx	 ; tmp326, arg
 ; ./asm_test/win/i/all.c:3850:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	testq	%rax, %rax	 ; arg
	je	.L744	 ;,
 ; ./asm_test/win/i/all.c:3851:             list_append(status->current_block->instructions, (size_t*)arg);
	movq	16(%rbx), %rax	 ; status_123(D)->current_block, status_123(D)->current_block
	movq	8(%rax), %rcx	 ; _102->instructions, _102->instructions
	call	list_append	 ;
	jmp	.L726	 ;
.L744:
 ; ./asm_test/win/i/all.c:3852:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	8(%rsi), %rdx	 ; base_111->type, base_111->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3852:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; ./asm_test/win/i/all.c:3852:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp327, _105
 ; ./asm_test/win/i/all.c:3852:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3853:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	leaq	64(%rsp), %rdx	 ;, tmp268
	movl	$1, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3852:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	%rax, %rdi	 ; tmp328, <retval>
 ; ./asm_test/win/i/all.c:3853:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3853:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	%rdi, %rdx	 ; <retval>,
	movq	%rsi, %r8	 ; base,
	movl	$22, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3853:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	%rax, %r9	 ;, tmp329
 ; ./asm_test/win/i/all.c:3853:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp330, _107
.L738:
 ; ./asm_test/win/i/all.c:3853:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	16(%rbx), %rax	 ; status_123(D)->current_block, status_123(D)->current_block
	movq	8(%rax), %rcx	 ;, _108->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3854:         return temp;
	jmp	.L699	 ;
.L717:
	movl	%r8d, 48(%rsp)	 ; _15, %sfp
 ; ./asm_test/win/i/all.c:3856:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3856:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movl	48(%rsp), %r8d	 ; %sfp, _15
	leaq	.LC128(%rip), %rdx	 ;, tmp272
 ; ./asm_test/win/i/all.c:3856:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movq	%rax, %rcx	 ; tmp331, _110
 ; ./asm_test/win/i/all.c:3856:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3857:         return NULL;
	jmp	.L739	 ;
.L699:
 ; ./asm_test/win/i/all.c:3859: }
	addq	$88, %rsp	 ;,
	movq	%rdi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
	.section .rdata,"dr"
.LC130:
	.ascii "[Warning] Unsupported type for negation: %s\12\0"
.LC131:
	.ascii "[Warning] Unsupported primary type for tac_primary: %d\12\0"
	.text
	.def	tac_primary;	.scl	3;	.type	32;	.endef
tac_primary:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$64, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3707:     switch (primary->type) {
	movl	8(%rcx), %r8d	 ; primary_36(D)->type,
 ; ./asm_test/win/i/all.c:3707:     switch (primary->type) {
	cmpl	$8, %r8d	 ;, _1
	ja	.L746	 ;,
	movq	%rdx, %rsi	 ; tmp142, status
	leaq	.L748(%rip), %rdx	 ;, tmp118
	movslq	(%rdx,%r8,4), %rax	 ;, tmp120
	addq	%rdx, %rax	 ; tmp118, tmp121
	jmp	*%rax	 ; tmp121
	.section .rdata,"dr"
	.align 4
.L748:
	.long	.L756-.L748
	.long	.L755-.L748
	.long	.L754-.L748
	.long	.L753-.L748
	.long	.L752-.L748
	.long	.L751-.L748
	.long	.L750-.L748
	.long	.L749-.L748
	.long	.L747-.L748
	.text
.L756:
 ; ./asm_test/win/i/all.c:3709:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rcx), %rcx	 ; primary_36(D)->value.literal_value,
	xorl	%edx, %edx	 ;
	movl	$10, %r8d	 ;,
	call	strtoll	 ;
 ; ./asm_test/win/i/all.c:3710:             return create_arg(ARG_INT, &t);
	leaq	56(%rsp), %rdx	 ;, tmp123
	movl	$1, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3709:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, 56(%rsp)	 ; tmp143, MEM[(long long int *)_92]
	jmp	.L765	 ;
.L755:
 ; ./asm_test/win/i/all.c:3713:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rcx), %rcx	 ; primary_36(D)->value.literal_value,
	xorl	%edx, %edx	 ;
	call	strtod	 ;
 ; ./asm_test/win/i/all.c:3714:             return create_arg(ARG_FLOAT, &t);
	leaq	56(%rsp), %rdx	 ;, tmp124
	movl	$2, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3713:             double t = strtod(primary->value.literal_value, NULL);
	movsd	%xmm0, 56(%rsp)	 ; tmp145, MEM[(double *)_92]
.L765:
 ; ./asm_test/win/i/all.c:3714:             return create_arg(ARG_FLOAT, &t);
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp146, <retval>
	jmp	.L745	 ;
.L754:
 ; ./asm_test/win/i/all.c:3717:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rcx), %rdx	 ; primary_36(D)->value.literal_value,
 ; ./asm_test/win/i/all.c:3758: }
	addq	$64, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3717:             return create_arg(ARG_STRING, primary->value.literal_value);
	movl	$3, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3758: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; ./asm_test/win/i/all.c:3717:             return create_arg(ARG_STRING, primary->value.literal_value);
	jmp	create_arg	 ;
.L753:
 ; ./asm_test/win/i/all.c:3719:             char t = 1;
	movb	$1, 56(%rsp)	 ;, MEM[(char *)_92]
	jmp	.L766	 ;
.L752:
 ; ./asm_test/win/i/all.c:3723:             char t = 0;
	movb	$0, 56(%rsp)	 ;, MEM[(char *)_92]
.L766:
 ; ./asm_test/win/i/all.c:3724:             return create_arg(ARG_BOOL, &t);
	leaq	56(%rsp), %rdx	 ;, tmp126
	movl	$4, %ecx	 ;,
	jmp	.L765	 ;
.L751:
 ; ./asm_test/win/i/all.c:3727:             return tac_expression(primary->value.expr, status);
	movq	(%rcx), %rcx	 ; primary_36(D)->value.expr,
 ; ./asm_test/win/i/all.c:3758: }
	addq	$64, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3727:             return tac_expression(primary->value.expr, status);
	movq	%rsi, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3758: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; ./asm_test/win/i/all.c:3727:             return tac_expression(primary->value.expr, status);
	jmp	tac_expression	 ;
.L750:
 ; ./asm_test/win/i/all.c:3729:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_36(D)->value.operand,
	movq	%rsi, %rdx	 ; status,
	call	tac_primary	 ;
 ; ./asm_test/win/i/all.c:3729:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rsi, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3729:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %rcx	 ; tmp149, _9
 ; ./asm_test/win/i/all.c:3729:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	call	load_rvalue	 ;
 ; ./asm_test/win/i/all.c:3730:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	movq	name_bool(%rip), %rdx	 ; name_bool,
 ; ./asm_test/win/i/all.c:3729:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %rdi	 ; tmp150, operand
 ; ./asm_test/win/i/all.c:3730:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3730:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; ./asm_test/win/i/all.c:3730:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp151, _11
 ; ./asm_test/win/i/all.c:3730:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3731:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	xorl	%r9d, %r9d	 ;
	movq	%rdi, %r8	 ; operand,
	movl	$13, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3730:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rbx	 ; tmp152, <retval>
 ; ./asm_test/win/i/all.c:3731:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	movq	%rax, %rdx	 ; <retval>,
	jmp	.L763	 ;
.L749:
 ; ./asm_test/win/i/all.c:3736:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_36(D)->value.operand,
	movq	%rsi, %rdx	 ; status,
	call	tac_primary	 ;
 ; ./asm_test/win/i/all.c:3736:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rsi, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3736:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %rcx	 ; tmp154, _15
 ; ./asm_test/win/i/all.c:3736:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	call	load_rvalue	 ;
 ; ./asm_test/win/i/all.c:3737:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movq	8(%rax), %rdx	 ; operand_42->type, operand_42->type
 ; ./asm_test/win/i/all.c:3736:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %rdi	 ; tmp155, operand
 ; ./asm_test/win/i/all.c:3737:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3737:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; ./asm_test/win/i/all.c:3737:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp156, _17
 ; ./asm_test/win/i/all.c:3737:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp157, <retval>
 ; ./asm_test/win/i/all.c:3739:             long long zero_int = 0;
	xorl	%eax, %eax	 ;
	movq	%rax, 48(%rsp)	 ;, zero_int
 ; ./asm_test/win/i/all.c:3740:             double neg_one_float = -1.0;
	movq	.LC129(%rip), %rax	 ;, tmp165
	movq	%rax, 56(%rsp)	 ; tmp165, MEM[(double *)_92]
 ; ./asm_test/win/i/all.c:3741:             if (operand->type == name_int)
	movq	8(%rdi), %rax	 ; operand_42->type, _18
 ; ./asm_test/win/i/all.c:3741:             if (operand->type == name_int)
	cmpq	name_int(%rip), %rax	 ; name_int, _18
	jne	.L758	 ;,
 ; ./asm_test/win/i/all.c:3742:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	leaq	48(%rsp), %rdx	 ;, tmp132
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3742:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rdi, %r9	 ; operand,
	movq	%rbx, %rdx	 ; <retval>,
	movl	$1, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3742:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rax, %r8	 ;, tmp158
	jmp	.L763	 ;
.L758:
 ; ./asm_test/win/i/all.c:3743:             else if (operand->type == name_float)
	cmpq	name_float(%rip), %rax	 ; name_float, _18
	jne	.L760	 ;,
 ; ./asm_test/win/i/all.c:3744:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	leaq	56(%rsp), %rdx	 ;, tmp133
	movl	$2, %ecx	 ;,
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3744:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%rdi, %r9	 ; operand,
	movq	%rbx, %rdx	 ; <retval>,
	movl	$2, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3744:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%rax, %r8	 ;, tmp160
.L763:
 ; ./asm_test/win/i/all.c:3744:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp161, inst
 ; ./asm_test/win/i/all.c:3749:             list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rsi), %rax	 ; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rcx	 ;, _25->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3750:             return temp;
	jmp	.L745	 ;
.L760:
 ; ./asm_test/win/i/all.c:3746:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	8(%rax), %r8	 ; _18->name, _23
	movl	$2, %ecx	 ;,
	movq	%r8, 40(%rsp)	 ; _23, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3746:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	40(%rsp), %r8	 ; %sfp, _23
	leaq	.LC130(%rip), %rdx	 ;, tmp135
 ; ./asm_test/win/i/all.c:3746:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	%rax, %rcx	 ; tmp162, _24
 ; ./asm_test/win/i/all.c:3746:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	call	fprintf	 ;
	jmp	.L764	 ;
.L747:
 ; ./asm_test/win/i/all.c:3753:             return tac_variable_access(primary->value.var, status);
	movq	(%rcx), %rcx	 ; primary_36(D)->value.var,
 ; ./asm_test/win/i/all.c:3758: }
	addq	$64, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3753:             return tac_variable_access(primary->value.var, status);
	movq	%rsi, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3758: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; ./asm_test/win/i/all.c:3753:             return tac_variable_access(primary->value.var, status);
	jmp	tac_variable_access	 ;
.L746:
	movl	%r8d, 40(%rsp)	 ; _1, %sfp
 ; ./asm_test/win/i/all.c:3755:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3755:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movl	40(%rsp), %r8d	 ; %sfp, _1
	leaq	.LC131(%rip), %rdx	 ;, tmp139
 ; ./asm_test/win/i/all.c:3755:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movq	%rax, %rcx	 ; tmp163, _28
 ; ./asm_test/win/i/all.c:3755:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	call	fprintf	 ;
.L764:
 ; ./asm_test/win/i/all.c:3756:             return NULL;
	xorl	%ebx, %ebx	 ; <retval>
.L745:
 ; ./asm_test/win/i/all.c:3758: }
	addq	$64, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.section .rdata,"dr"
.LC132:
	.ascii "[Warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.def	tac_expression;	.scl	3;	.type	32;	.endef
tac_expression:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp128, expression
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp129, status
	subq	$32, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3678:     if (expression->operator == OP_NONE) {
	cmpl	$19, 24(%rcx)	 ;, expression_31(D)->operator
	jne	.L768	 ;,
 ; ./asm_test/win/i/all.c:3679:         Arg* result = tac_primary(expression->prim_left, status);
	movq	8(%rcx), %rcx	 ; expression_31(D)->prim_left, expression_31(D)->prim_left
 ; ./asm_test/win/i/all.c:3705: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; ./asm_test/win/i/all.c:3679:         Arg* result = tac_primary(expression->prim_left, status);
	jmp	tac_primary	 ;
.L768:
 ; ./asm_test/win/i/all.c:3682:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	16(%rcx), %rcx	 ; expression_31(D)->right, expression_31(D)->right
 ; ./asm_test/win/i/all.c:3683:     InstructionType op = get_instruction_type(expression->operator);
	movl	$25, %r12d	 ;, _66
 ; ./asm_test/win/i/all.c:3682:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	call	tac_expression	 ;
 ; ./asm_test/win/i/all.c:3682:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%rbx, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3682:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%rax, %rcx	 ; tmp130, _4
 ; ./asm_test/win/i/all.c:3682:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	call	load_rvalue	 ;
	movq	%rax, %rdi	 ; tmp131, <retval>
 ; ./asm_test/win/i/all.c:3683:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%rbp), %eax	 ; expression_31(D)->operator,
	cmpl	$18, %eax	 ;, _5
	ja	.L769	 ;,
	leaq	CSWTCH.123(%rip), %rdx	 ;, tmp115
	movzbl	(%rdx,%rax), %r12d	 ; CSWTCH.123[_5], _66
.L769:
 ; ./asm_test/win/i/all.c:3684:     Arg* left = tac_expression(expression->expr_left, status);
	movq	0(%rbp), %rcx	 ; expression_31(D)->expr_left,
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rsi	 ; tmp132, left
 ; ./asm_test/win/i/all.c:3686:     if (expression->operator == OP_ASSIGN || expression->operator == OP_ADD_ASSIGN || expression->operator == OP_SUB_ASSIGN || expression->operator == OP_MUL_ASSIGN || expression->operator == OP_DIV_ASSIGN || expression->operator == OP_MOD_ASSIGN) {
	movl	24(%rbp), %eax	 ; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	 ;, tmp117
 ; ./asm_test/win/i/all.c:3686:     if (expression->operator == OP_ASSIGN || expression->operator == OP_ADD_ASSIGN || expression->operator == OP_SUB_ASSIGN || expression->operator == OP_MUL_ASSIGN || expression->operator == OP_DIV_ASSIGN || expression->operator == OP_MOD_ASSIGN) {
	cmpl	$5, %eax	 ;, tmp117
	ja	.L770	 ;,
 ; ./asm_test/win/i/all.c:3687:         if (op != INST_ASSIGN) {
	cmpl	$14, %r12d	 ;, _66
	je	.L771	 ;,
 ; ./asm_test/win/i/all.c:3688:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rsi), %rdx	 ; left_38->type, left_38->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3688:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; ./asm_test/win/i/all.c:3688:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp133, _10
 ; ./asm_test/win/i/all.c:3688:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3689:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rdx	 ; status,
	movq	%rsi, %rcx	 ; left,
 ; ./asm_test/win/i/all.c:3688:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rbp	 ; tmp134, temp
 ; ./asm_test/win/i/all.c:3689:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	 ;
 ; ./asm_test/win/i/all.c:3689:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rdi, %r9	 ; <retval>,
	movq	%rbp, %rdx	 ; temp,
	movl	%r12d, %ecx	 ; _66,
 ; ./asm_test/win/i/all.c:3689:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %r8	 ;, tmp135
 ; ./asm_test/win/i/all.c:3691:             right = temp;
	movq	%rbp, %rdi	 ; temp, <retval>
 ; ./asm_test/win/i/all.c:3689:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp136, inst
 ; ./asm_test/win/i/all.c:3690:             list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rcx	 ; _12->instructions, _12->instructions
	call	list_append	 ;
.L771:
 ; ./asm_test/win/i/all.c:3693:         if (left->kind != ARG_VARIABLE)
	cmpl	$0, 16(%rsi)	 ;, left_38->kind
	je	.L772	 ;,
 ; ./asm_test/win/i/all.c:3694:             fprintf(stderr, "[Warning] Left-hand side of assignment is not a variable\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3694:             fprintf(stderr, "[Warning] Left-hand side of assignment is not a variable\n");
	leaq	.LC132(%rip), %rcx	 ;, tmp123
 ; ./asm_test/win/i/all.c:3694:             fprintf(stderr, "[Warning] Left-hand side of assignment is not a variable\n");
	movq	%rax, %rdx	 ; tmp137, _15
 ; ./asm_test/win/i/all.c:3694:             fprintf(stderr, "[Warning] Left-hand side of assignment is not a variable\n");
	call	fputs	 ;
.L772:
 ; ./asm_test/win/i/all.c:3695:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	xorl	%r9d, %r9d	 ;
	movq	%rsi, %rdx	 ; left,
	movq	%rdi, %r8	 ; <retval>,
	movl	$14, %ecx	 ;,
	call	create_instruction	 ;
 ; ./asm_test/win/i/all.c:3696:         if (left->is_get)
	cmpb	$0, 20(%rsi)	 ;, left_38->is_get
 ; ./asm_test/win/i/all.c:3695:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	movq	%rax, %rdx	 ; tmp138, inst
 ; ./asm_test/win/i/all.c:3696:         if (left->is_get)
	je	.L773	 ;,
 ; ./asm_test/win/i/all.c:3697:             inst = create_instruction(INST_STORE, left, right, NULL);
	movq	%rsi, %rdx	 ; left,
	xorl	%r9d, %r9d	 ;
	movq	%rdi, %r8	 ; <retval>,
	movl	$24, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp139, inst
	jmp	.L773	 ;
.L770:
 ; ./asm_test/win/i/all.c:3699:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rsi), %rdx	 ; left_38->type, left_38->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3699:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; ./asm_test/win/i/all.c:3699:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp140, _18
 ; ./asm_test/win/i/all.c:3699:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3700:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rdx	 ; status,
	movq	%rsi, %rcx	 ; left,
 ; ./asm_test/win/i/all.c:3699:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rbp	 ; tmp141, temp
 ; ./asm_test/win/i/all.c:3700:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	 ;
 ; ./asm_test/win/i/all.c:3700:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rdi, %r9	 ; <retval>,
	movq	%rbp, %rdx	 ; temp,
	movl	%r12d, %ecx	 ; _66,
 ; ./asm_test/win/i/all.c:3700:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %r8	 ;, tmp142
 ; ./asm_test/win/i/all.c:3701:         right = temp;
	movq	%rbp, %rdi	 ; temp, <retval>
 ; ./asm_test/win/i/all.c:3700:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp143, inst
.L773:
 ; ./asm_test/win/i/all.c:3703:     list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rcx	 ; _20->instructions, _20->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3705: }
	addq	$32, %rsp	 ;,
	movq	%rdi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.section .rdata,"dr"
.LC133:
	.ascii "Warning: Path component too long, truncating to %zu characters\12\0"
.LC134:
	.ascii ".\0"
.LC135:
	.ascii "..\0"
	.text
	.def	create_file;	.scl	3;	.type	32;	.endef
create_file:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp204, path
 ; ./asm_test/win/i/all.c:3861:     File* file = (File*)alloc_memory(sizeof(File));
	movl	$32, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3860: File* create_file(char* path) {
	subq	$312, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3861:     File* file = (File*)alloc_memory(sizeof(File));
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:3862:     file->path = absolute_path(path, NULL);
	xorl	%edx, %edx	 ;
	movq	%rbx, %rcx	 ; path,
 ; ./asm_test/win/i/all.c:3861:     File* file = (File*)alloc_memory(sizeof(File));
	movq	%rax, %rsi	 ; tmp205, <retval>
 ; ./asm_test/win/i/all.c:3862:     file->path = absolute_path(path, NULL);
	call	absolute_path	 ;
 ; ./asm_test/win/i/all.c:3862:     file->path = absolute_path(path, NULL);
	movq	%rax, 24(%rsi)	 ; _1, file_4->path
 ; ./asm_test/win/i/all.c:3862:     file->path = absolute_path(path, NULL);
	movq	%rax, %rcx	 ; tmp206, _1
 ; ./asm_test/win/i/all.c:3950:     size_t path_len = strlen(file->path);
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:3951:     char* path_copy = create_string_check("", path_len + 1, 0);
	xorl	%r8d, %r8d	 ;
	leaq	.LC38(%rip), %rcx	 ;,
	leaq	1(%rax), %rdx	 ;, tmp145
 ; ./asm_test/win/i/all.c:3950:     size_t path_len = strlen(file->path);
	movq	%rax, %r13	 ; tmp207, tmp143
 ; ./asm_test/win/i/all.c:3951:     char* path_copy = create_string_check("", path_len + 1, 0);
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3952:     strcpy(path_copy, file->path);
	movq	24(%rsi), %rdx	 ; file_4->path, file_4->path
	movq	%rax, %rcx	 ; path_copy,
 ; ./asm_test/win/i/all.c:3951:     char* path_copy = create_string_check("", path_len + 1, 0);
	movq	%rax, %rbp	 ; tmp208, path_copy
 ; ./asm_test/win/i/all.c:3952:     strcpy(path_copy, file->path);
	call	strcpy	 ;
 ; ./asm_test/win/i/all.c:3956:     if (path_len > 0 && path_copy[0] == '/') {
	testq	%r13, %r13	 ; tmp143
	je	.L801	 ;,
 ; ./asm_test/win/i/all.c:3956:     if (path_len > 0 && path_copy[0] == '/') {
	cmpb	$47, 0(%rbp)	 ;, *path_copy_12
	jne	.L801	 ;,
 ; ./asm_test/win/i/all.c:3957:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3962:         start = 1;
	movl	$1, %r14d	 ;, start
 ; ./asm_test/win/i/all.c:3957:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:3958:         node->dir = create_string_check("/", 1, 1);
	movl	$1, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC43(%rip), %rcx	 ;, tmp148
 ; ./asm_test/win/i/all.c:3957:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %r15	 ; tmp209, node
 ; ./asm_test/win/i/all.c:3958:         node->dir = create_string_check("/", 1, 1);
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3959:         node->next = 0;
	xorl	%r9d, %r9d	 ;
 ; ./asm_test/win/i/all.c:3958:         node->dir = create_string_check("/", 1, 1);
	movq	%rax, (%r15)	 ; tmp210, node_15->dir
 ; ./asm_test/win/i/all.c:3959:         node->next = 0;
	movq	%r9, 8(%r15)	 ;, node_15->next
	jmp	.L780	 ;
.L801:
 ; ./asm_test/win/i/all.c:3955:     size_t start = 0;
	xorl	%r14d, %r14d	 ; start
 ; ./asm_test/win/i/all.c:3953:     StrNode* dirs_head = NULL;
	xorl	%r15d, %r15d	 ; node
.L780:
 ; ./asm_test/win/i/all.c:3974:                 strncpy(component, path_copy + start, comp_len);
	leaq	48(%rsp), %rax	 ;, tmp202
 ; ./asm_test/win/i/all.c:3964:     size_t i = start;
	movq	%r14, %rdi	 ; start, i
 ; ./asm_test/win/i/all.c:3965:     while (i <= path_len) {
	movq	%r15, %rbx	 ; node, node
 ; ./asm_test/win/i/all.c:3974:                 strncpy(component, path_copy + start, comp_len);
	movq	%rax, 40(%rsp)	 ; tmp202, %sfp
.L781:
 ; ./asm_test/win/i/all.c:3965:     while (i <= path_len) {
	cmpq	%rdi, %r13	 ; i, tmp143
	jb	.L834	 ;,
 ; ./asm_test/win/i/all.c:3966:         if (i == path_len || path_copy[i] == '/') {
	je	.L782	 ;,
 ; ./asm_test/win/i/all.c:3966:         if (i == path_len || path_copy[i] == '/') {
	cmpb	$47, 0(%rbp,%rdi)	 ;, MEM[(char *)path_copy_12 + i_17 * 1]
	jne	.L783	 ;,
.L782:
 ; ./asm_test/win/i/all.c:3967:             if (i > start) {
	cmpq	%rdi, %r14	 ; i, start
	jnb	.L784	 ;,
 ; ./asm_test/win/i/all.c:3968:                 size_t comp_len = i - start;
	movq	%rdi, %r12	 ; i, comp_len
	subq	%r14, %r12	 ; start, comp_len
 ; ./asm_test/win/i/all.c:3969:                 if (comp_len >= 256) {
	cmpq	$255, %r12	 ;, comp_len
	jbe	.L785	 ;,
 ; ./asm_test/win/i/all.c:3970:                     fprintf(stderr, "Warning: Path component too long, truncating to %zu characters\n", comp_len);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3970:                     fprintf(stderr, "Warning: Path component too long, truncating to %zu characters\n", comp_len);
	movq	%r12, %r8	 ; comp_len,
	leaq	.LC133(%rip), %rdx	 ;, tmp150
 ; ./asm_test/win/i/all.c:3971:                     comp_len = 256 - 1;
	movl	$255, %r12d	 ;, comp_len
 ; ./asm_test/win/i/all.c:3970:                     fprintf(stderr, "Warning: Path component too long, truncating to %zu characters\n", comp_len);
	movq	%rax, %rcx	 ; tmp211, _22
 ; ./asm_test/win/i/all.c:3970:                     fprintf(stderr, "Warning: Path component too long, truncating to %zu characters\n", comp_len);
	call	fprintf	 ;
.L785:
 ; ./asm_test/win/i/all.c:3974:                 strncpy(component, path_copy + start, comp_len);
	movq	40(%rsp), %rcx	 ; %sfp,
 ; ./asm_test/win/i/all.c:3974:                 strncpy(component, path_copy + start, comp_len);
	leaq	0(%rbp,%r14), %rdx	 ;, tmp151
 ; ./asm_test/win/i/all.c:3974:                 strncpy(component, path_copy + start, comp_len);
	movq	%r12, %r8	 ; comp_len,
	call	strncpy	 ;
 ; ./asm_test/win/i/all.c:3976:                 if (strcmp(component, ".") == 0) {
	movq	40(%rsp), %rcx	 ; %sfp,
	leaq	.LC134(%rip), %rdx	 ;,
 ; ./asm_test/win/i/all.c:3975:                 component[comp_len] = '\0';
	movb	$0, 48(%rsp,%r12)	 ;, component[comp_len_24]
 ; ./asm_test/win/i/all.c:3976:                 if (strcmp(component, ".") == 0) {
	call	strcmp	 ;
 ; ./asm_test/win/i/all.c:3976:                 if (strcmp(component, ".") == 0) {
	testl	%eax, %eax	 ; tmp212
	je	.L784	 ;,
 ; ./asm_test/win/i/all.c:3977:                 } else if (strcmp(component, "..") == 0) {
	leaq	.LC135(%rip), %r14	 ;, tmp160
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%r14, %rdx	 ; tmp160,
	call	strcmp	 ;
 ; ./asm_test/win/i/all.c:3977:                 } else if (strcmp(component, "..") == 0) {
	testl	%eax, %eax	 ; tmp213
	jne	.L787	 ;,
 ; ./asm_test/win/i/all.c:3978:                     if (dirs_tail != NULL && dirs_tail != dirs_head) {
	testq	%r15, %r15	 ; node
	je	.L788	 ;,
	cmpq	%rbx, %r15	 ; node, node
	je	.L788	 ;,
 ; ./asm_test/win/i/all.c:3979:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	movq	(%r15), %rcx	 ; dirs_tail_27->dir,
	movq	%r14, %rdx	 ; tmp160,
	call	strcmp	 ;
 ; ./asm_test/win/i/all.c:3979:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	testl	%eax, %eax	 ; tmp214
	jne	.L802	 ;,
 ; ./asm_test/win/i/all.c:3980:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:3981:                             node->dir = create_string_check("..", 2, 1);
	movl	$1, %r8d	 ;,
	movl	$2, %edx	 ;,
	movq	%r14, %rcx	 ; tmp160,
 ; ./asm_test/win/i/all.c:3980:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %r12	 ; tmp215, node
 ; ./asm_test/win/i/all.c:3981:                             node->dir = create_string_check("..", 2, 1);
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3982:                             node->next = 0;
	xorl	%r8d, %r8d	 ;
 ; ./asm_test/win/i/all.c:3981:                             node->dir = create_string_check("..", 2, 1);
	movq	%rax, (%r12)	 ; tmp216, node_34->dir
 ; ./asm_test/win/i/all.c:3982:                             node->next = 0;
	movq	%r8, 8(%r12)	 ;, node_34->next
 ; ./asm_test/win/i/all.c:3983:                             dirs_tail->next = node;
	movq	%r12, 8(%r15)	 ; node, dirs_tail_27->next
 ; ./asm_test/win/i/all.c:3984:                             dirs_tail = node;
	movq	%r12, %r15	 ; node, node
	jmp	.L784	 ;
.L802:
 ; ./asm_test/win/i/all.c:3986:                             StrNode* prev = dirs_head;
	movq	%rbx, %rax	 ; node, prev
.L789:
 ; ./asm_test/win/i/all.c:3987:                             while (prev != NULL && prev->next != dirs_tail)
	testq	%rax, %rax	 ; prev
	je	.L784	 ;,
 ; ./asm_test/win/i/all.c:3987:                             while (prev != NULL && prev->next != dirs_tail)
	movq	8(%rax), %rdx	 ; prev_36->next, _37
 ; ./asm_test/win/i/all.c:3987:                             while (prev != NULL && prev->next != dirs_tail)
	cmpq	%rdx, %r15	 ; _37, node
	je	.L835	 ;,
 ; ./asm_test/win/i/all.c:3988:                                 prev = prev->next;
	movq	%rdx, %rax	 ; _37, prev
	jmp	.L789	 ;
.L835:
 ; ./asm_test/win/i/all.c:3990:                                 prev->next = 0;
	xorl	%ecx, %ecx	 ;
 ; ./asm_test/win/i/all.c:3991:                                 dirs_tail = prev;
	movq	%rax, %r15	 ; prev, node
 ; ./asm_test/win/i/all.c:3990:                                 prev->next = 0;
	movq	%rcx, 8(%rax)	 ;, prev_36->next
	jmp	.L784	 ;
.L788:
 ; ./asm_test/win/i/all.c:3994:                     } else if (dirs_head == NULL) {
	testq	%rbx, %rbx	 ; node
	jne	.L784	 ;,
 ; ./asm_test/win/i/all.c:3995:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:3996:                         node->dir = create_string_check("..", 2, 1);
	movl	$2, %edx	 ;,
	movl	$1, %r8d	 ;,
	movq	%r14, %rcx	 ; tmp160,
 ; ./asm_test/win/i/all.c:3995:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %rbx	 ; tmp217, node
 ; ./asm_test/win/i/all.c:3996:                         node->dir = create_string_check("..", 2, 1);
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3997:                         node->next = 0;
	xorl	%edx, %edx	 ;
 ; ./asm_test/win/i/all.c:3996:                         node->dir = create_string_check("..", 2, 1);
	movq	%rax, (%rbx)	 ; tmp218, node_39->dir
 ; ./asm_test/win/i/all.c:3997:                         node->next = 0;
	movq	%rdx, 8(%rbx)	 ;, node_39->next
	jmp	.L833	 ;
.L787:
 ; ./asm_test/win/i/all.c:4001:                 } else if (strlen(component) > 0) {
	cmpb	$0, 48(%rsp)	 ;, MEM[(const char *)&component]
	je	.L784	 ;,
 ; ./asm_test/win/i/all.c:4002:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:4003:                     node->dir = create_string_check(component, comp_len, 1);
	movq	40(%rsp), %rcx	 ; %sfp,
	movl	$1, %r8d	 ;,
	movq	%r12, %rdx	 ; comp_len,
 ; ./asm_test/win/i/all.c:4002:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %r14	 ; tmp219, node
 ; ./asm_test/win/i/all.c:4003:                     node->dir = create_string_check(component, comp_len, 1);
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:4003:                     node->dir = create_string_check(component, comp_len, 1);
	movq	%rax, (%r14)	 ; tmp220, node_42->dir
 ; ./asm_test/win/i/all.c:4004:                     node->next = 0;
	xorl	%eax, %eax	 ;
	movq	%rax, 8(%r14)	 ;, node_42->next
 ; ./asm_test/win/i/all.c:4005:                     if (dirs_tail != NULL)
	testq	%r15, %r15	 ; node
	je	.L790	 ;,
 ; ./asm_test/win/i/all.c:4006:                         dirs_tail->next = node;
	movq	%r14, 8(%r15)	 ; node, dirs_tail_27->next
.L790:
 ; ./asm_test/win/i/all.c:4007:                     dirs_tail = node;
	movq	%r14, %r15	 ; node, node
 ; ./asm_test/win/i/all.c:4008:                     if (dirs_head == NULL) dirs_head = node;
	testq	%rbx, %rbx	 ; node
	jne	.L784	 ;,
 ; ./asm_test/win/i/all.c:4007:                     dirs_tail = node;
	movq	%r14, %rbx	 ; node, node
.L833:
 ; ./asm_test/win/i/all.c:4008:                     if (dirs_head == NULL) dirs_head = node;
	movq	%rbx, %r15	 ; node, node
.L784:
 ; ./asm_test/win/i/all.c:4011:             start = i + 1;
	leaq	1(%rdi), %r14	 ;, start
.L783:
 ; ./asm_test/win/i/all.c:4013:         i++;
	incq	%rdi	 ; i
	jmp	.L781	 ;
.L834:
 ; ./asm_test/win/i/all.c:4015:     file->dirs = dirs_head;
	movq	%rbx, (%rsi)	 ; node, file_4->dirs
 ; ./asm_test/win/i/all.c:4016:     if (dirs_tail != NULL) {
	testq	%r15, %r15	 ; node
	je	.L792	 ;,
 ; ./asm_test/win/i/all.c:4017:         char* dot = strrchr(dirs_tail->dir, '.');
	movq	(%r15), %r15	 ; dirs_tail_27->dir, node
 ; ./asm_test/win/i/all.c:4017:         char* dot = strrchr(dirs_tail->dir, '.');
	movl	$46, %edx	 ;,
	movq	%r15, %rcx	 ; node,
	call	strrchr	 ;
	movq	%rax, %rdi	 ; tmp221, dot
 ; ./asm_test/win/i/all.c:4018:         if (dot != NULL && dot != dirs_tail->dir) {
	cmpq	%rax, %r15	 ; dot, node
	je	.L792	 ;,
	testq	%rax, %rax	 ; dot
	je	.L792	 ;,
 ; ./asm_test/win/i/all.c:4019:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	%rax, %rdx	 ; dot, name_len
 ; ./asm_test/win/i/all.c:4020:             file->name = create_string_check(dirs_tail->dir, name_len, 1);
	movl	$1, %r8d	 ;,
	movq	%r15, %rcx	 ; node,
 ; ./asm_test/win/i/all.c:4019:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	subq	%r15, %rdx	 ; node, name_len
 ; ./asm_test/win/i/all.c:4020:             file->name = create_string_check(dirs_tail->dir, name_len, 1);
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:4021:             file->extension = create_string_check(dot, strlen(dot), 1);
	movq	%rdi, %rcx	 ; dot,
 ; ./asm_test/win/i/all.c:4020:             file->name = create_string_check(dirs_tail->dir, name_len, 1);
	movq	%rax, 16(%rsi)	 ; tmp222, file_4->name
 ; ./asm_test/win/i/all.c:4021:             file->extension = create_string_check(dot, strlen(dot), 1);
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:4021:             file->extension = create_string_check(dot, strlen(dot), 1);
	movl	$1, %r8d	 ;,
	movq	%rdi, %rcx	 ; dot,
 ; ./asm_test/win/i/all.c:4021:             file->extension = create_string_check(dot, strlen(dot), 1);
	movq	%rax, %rdx	 ; tmp223, tmp177
 ; ./asm_test/win/i/all.c:4021:             file->extension = create_string_check(dot, strlen(dot), 1);
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:4018:         if (dot != NULL && dot != dirs_tail->dir) {
	jmp	.L793	 ;
.L792:
 ; ./asm_test/win/i/all.c:4023:             file->name = dirs_tail->dir;
	movq	%r15, 16(%rsi)	 ; node, file_4->name
	xorl	%eax, %eax	 ; _72
.L793:
 ; ./asm_test/win/i/all.c:4021:             file->extension = create_string_check(dot, strlen(dot), 1);
	movq	%rax, 8(%rsi)	 ; _72, file_4->extension
 ; ./asm_test/win/i/all.c:4031:     StrNode* current = dirs_head;
	movq	%rbx, %r12	 ; node, current
 ; ./asm_test/win/i/all.c:4032:     size_t node_count = 0;
	xorl	%ebp, %ebp	 ; node_count
 ; ./asm_test/win/i/all.c:4030:     size_t full_path_len = 0;
	xorl	%edi, %edi	 ; full_path_len
.L794:
 ; ./asm_test/win/i/all.c:4033:     while (current != NULL) {
	testq	%r12, %r12	 ; current
	je	.L836	 ;,
 ; ./asm_test/win/i/all.c:4034:         full_path_len += strlen(current->dir);
	movq	(%r12), %rcx	 ; current_55->dir,
 ; ./asm_test/win/i/all.c:4035:         node_count++;
	incq	%rbp	 ; node_count
 ; ./asm_test/win/i/all.c:4034:         full_path_len += strlen(current->dir);
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:4036:         current = current->next;
	movq	8(%r12), %r12	 ; current_55->next, current
 ; ./asm_test/win/i/all.c:4034:         full_path_len += strlen(current->dir);
	addq	%rax, %rdi	 ; tmp225, full_path_len
	jmp	.L794	 ;
.L836:
 ; ./asm_test/win/i/all.c:4038:     if (node_count > 1)
	cmpq	$1, %rbp	 ;, node_count
	jbe	.L796	 ;,
 ; ./asm_test/win/i/all.c:4039:         full_path_len += (node_count - 1);
	leaq	-1(%rdi,%rbp), %rdi	 ;, full_path_len
.L796:
 ; ./asm_test/win/i/all.c:4040:     char* full_path = create_string_check("", full_path_len + 1, 0);
	leaq	1(%rdi), %rdx	 ;, tmp182
	xorl	%r8d, %r8d	 ;
	leaq	.LC38(%rip), %rcx	 ;,
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:4045:         if (!is_first && strcmp(current->dir, "/") != 0) {
	leaq	.LC43(%rip), %rbp	 ;, tmp200
 ; ./asm_test/win/i/all.c:4041:     full_path[0] = '\0';
	movb	$0, (%rax)	 ;, *full_path_69
 ; ./asm_test/win/i/all.c:4040:     char* full_path = create_string_check("", full_path_len + 1, 0);
	movq	%rax, %rdi	 ; tmp226, full_path
 ; ./asm_test/win/i/all.c:4043:     char is_first = 1;
	movb	$1, %al	 ;, is_first
.L797:
 ; ./asm_test/win/i/all.c:4044:     while (current != NULL) {
	testq	%rbx, %rbx	 ; node
	je	.L837	 ;,
 ; ./asm_test/win/i/all.c:4045:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testb	%al, %al	 ; is_first
	jne	.L798	 ;,
 ; ./asm_test/win/i/all.c:4045:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	(%rbx), %rcx	 ; current_71->dir,
	movq	%rbp, %rdx	 ; tmp200,
	call	strcmp	 ;
 ; ./asm_test/win/i/all.c:4045:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testl	%eax, %eax	 ; tmp227
	je	.L798	 ;,
 ; ./asm_test/win/i/all.c:4046:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$0, (%rdi)	 ;, MEM[(const char *)full_path_69]
	je	.L798	 ;,
 ; ./asm_test/win/i/all.c:4046:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	movq	%rdi, %rcx	 ; full_path,
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:4046:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$47, -1(%rdi,%rax)	 ;, *_77
	je	.L798	 ;,
 ; ./asm_test/win/i/all.c:4047:                 strcat(full_path, "/");
	movq	%rbp, %rdx	 ; tmp200,
	movq	%rdi, %rcx	 ; full_path,
	call	strcat	 ;
.L798:
 ; ./asm_test/win/i/all.c:4050:         strcat(full_path, current->dir);
	movq	(%rbx), %rdx	 ; current_71->dir,
	movq	%rdi, %rcx	 ; full_path,
	call	strcat	 ;
 ; ./asm_test/win/i/all.c:4052:         current = current->next;
	movq	8(%rbx), %rbx	 ; current_71->next, node
 ; ./asm_test/win/i/all.c:4051:         is_first = 0;
	xorl	%eax, %eax	 ; is_first
	jmp	.L797	 ;
.L837:
 ; ./asm_test/win/i/all.c:4054:     file->path = create_string_check(full_path, strlen(full_path), 1);
	movq	%rdi, %rcx	 ; full_path,
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:4054:     file->path = create_string_check(full_path, strlen(full_path), 1);
	movq	%rdi, %rcx	 ; full_path,
	movl	$1, %r8d	 ;,
 ; ./asm_test/win/i/all.c:4054:     file->path = create_string_check(full_path, strlen(full_path), 1);
	movq	%rax, %rdx	 ; tmp229, tmp192
 ; ./asm_test/win/i/all.c:4054:     file->path = create_string_check(full_path, strlen(full_path), 1);
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:4054:     file->path = create_string_check(full_path, strlen(full_path), 1);
	movq	%rax, 24(%rsi)	 ; tmp230, file_4->path
 ; ./asm_test/win/i/all.c:3865: }
	addq	$312, %rsp	 ;,
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
.LC136:
	.ascii "Error: create_attribute received NULL table\12\0"
.LC137:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.text
	.def	tac_variable;	.scl	3;	.type	32;	.endef
tac_variable:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp120, variable
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp121, status
	subq	$64, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3480:     if (is_attr) {
	testb	%r8b, %r8b	 ; tmp122
	je	.L839	 ;,
 ; ./asm_test/win/i/all.c:3481:         AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rdx), %rax	 ; status_10(D)->tac, status_10(D)->tac
	movq	(%rax), %rcx	 ; _1->attribute_tables, _2
	call	list_pop_back	 ;
 ; ./asm_test/win/i/all.c:3482:         list_append(status->tac->attribute_tables, (size_t*)attr_table);
	movq	%rax, %rdx	 ; attr_table,
 ; ./asm_test/win/i/all.c:3481:         AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	%rax, %rsi	 ; tmp123, attr_table
 ; ./asm_test/win/i/all.c:3482:         list_append(status->tac->attribute_tables, (size_t*)attr_table);
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3483:         create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	(%rdi), %rbp	 ; variable_9(D)->type, _4
	movq	8(%rdi), %r12	 ; variable_9(D)->name, _5
 ; ./asm_test/win/i/all.c:3308:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:3309:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rbx, %r9	 ; status,
	movl	$97, %r8d	 ;,
	movq	%rbp, %rdx	 ; _4,
	movq	%r12, %rcx	 ; _5,
 ; ./asm_test/win/i/all.c:3308:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movq	%rax, %rdi	 ; tmp124, attr
 ; ./asm_test/win/i/all.c:3309:     attr->var = create_var(var, type, VAR_ATTR, status);
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3311:     attr->offset = offset;
	xorl	%edx, %edx	 ;
 ; ./asm_test/win/i/all.c:3310:     attr->type = type;
	movq	%rbp, 8(%rdi)	 ; _4, attr_15->type
 ; ./asm_test/win/i/all.c:3309:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rax, (%rdi)	 ; tmp125, attr_15->var
 ; ./asm_test/win/i/all.c:3311:     attr->offset = offset;
	movq	%rdx, 16(%rdi)	 ;, attr_15->offset
 ; ./asm_test/win/i/all.c:3312:     if (offset == 0 && table != NULL) {
	testq	%rsi, %rsi	 ; attr_table
	je	.L840	 ;,
 ; ./asm_test/win/i/all.c:3313:         attr->offset = table->size;
	movq	16(%rsi), %rax	 ; attr_table_12->size, attr_table_12->size
 ; ./asm_test/win/i/all.c:3314:         table->size += get_type_size(type);
	movq	%rbp, %rcx	 ; _4,
 ; ./asm_test/win/i/all.c:3313:         attr->offset = table->size;
	movq	%rax, 16(%rdi)	 ; attr_table_12->size, attr_15->offset
 ; ./asm_test/win/i/all.c:3314:         table->size += get_type_size(type);
	call	get_type_size	 ;
 ; ./asm_test/win/i/all.c:3317:     if (table == NULL || table->attributes == NULL)
	movq	(%rsi), %rcx	 ; attr_table_12->attributes, _25
 ; ./asm_test/win/i/all.c:3314:         table->size += get_type_size(type);
	addq	%rax, 16(%rsi)	 ; tmp126, attr_table_12->size
 ; ./asm_test/win/i/all.c:3320:         list_append(table->attributes, (size_t*)attr);
	movq	%rdi, %rdx	 ; attr,
 ; ./asm_test/win/i/all.c:3317:     if (table == NULL || table->attributes == NULL)
	testq	%rcx, %rcx	 ; _25
	jne	.L851	 ;,
	jmp	.L841	 ;
.L840:
 ; ./asm_test/win/i/all.c:3316:         fprintf(stderr, "Error: create_attribute received NULL table\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3316:         fprintf(stderr, "Error: create_attribute received NULL table\n");
	leaq	.LC136(%rip), %rcx	 ;, tmp113
 ; ./asm_test/win/i/all.c:3316:         fprintf(stderr, "Error: create_attribute received NULL table\n");
	movq	%rax, %rdx	 ; tmp127, _24
 ; ./asm_test/win/i/all.c:3316:         fprintf(stderr, "Error: create_attribute received NULL table\n");
	call	fputs	 ;
.L841:
 ; ./asm_test/win/i/all.c:3318:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3493: }
	addq	$64, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3318:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	leaq	.LC137(%rip), %rcx	 ;, tmp115
 ; ./asm_test/win/i/all.c:3493: }
	popq	%rbx	 ;
 ; ./asm_test/win/i/all.c:3318:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movq	%rax, %rdx	 ; tmp128, _26
 ; ./asm_test/win/i/all.c:3493: }
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; ./asm_test/win/i/all.c:3318:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	jmp	fputs	 ;
.L839:
 ; ./asm_test/win/i/all.c:3485:         var = create_var(variable->name, variable->type, VAR_VAR, status);
	movq	8(%rcx), %rcx	 ; variable_9(D)->name, variable_9(D)->name
	movq	%rdx, %r9	 ; status,
	movq	(%rdi), %rdx	 ; variable_9(D)->type,
	movl	$118, %r8d	 ;,
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3487:         if (variable->value != NULL)
	movq	16(%rdi), %rcx	 ; variable_9(D)->value, _30
 ; ./asm_test/win/i/all.c:3485:         var = create_var(variable->name, variable->type, VAR_VAR, status);
	movq	%rax, %rsi	 ; tmp129, var
 ; ./asm_test/win/i/all.c:3487:         if (variable->value != NULL)
	testq	%rcx, %rcx	 ; _30
	je	.L843	 ;,
 ; ./asm_test/win/i/all.c:3488:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; ./asm_test/win/i/all.c:3488:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	%rbx, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3488:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	%rax, %rcx	 ; tmp130, _31
 ; ./asm_test/win/i/all.c:3488:             value = load_rvalue(tac_expression(variable->value, status), status);
	call	load_rvalue	 ;
	jmp	.L850	 ;
.L843:
 ; ./asm_test/win/i/all.c:3490:             value = create_arg(ARG_INT, &(long long){0});
	xorl	%eax, %eax	 ;
 ; ./asm_test/win/i/all.c:3490:             value = create_arg(ARG_INT, &(long long){0});
	leaq	56(%rsp), %rdx	 ;, tmp117
	movl	$1, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3490:             value = create_arg(ARG_INT, &(long long){0});
	movq	%rax, 56(%rsp)	 ;, D.11834
 ; ./asm_test/win/i/all.c:3490:             value = create_arg(ARG_INT, &(long long){0});
	call	create_arg	 ;
.L850:
 ; ./asm_test/win/i/all.c:3491:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	%rsi, %rdx	 ; var,
	xorl	%ecx, %ecx	 ;
	movq	%rax, 40(%rsp)	 ; value, %sfp
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3491:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	40(%rsp), %r8	 ; %sfp, value
	movl	$14, %ecx	 ;,
	xorl	%r9d, %r9d	 ;
 ; ./asm_test/win/i/all.c:3491:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	%rax, %rdx	 ; tmp133, _34
 ; ./asm_test/win/i/all.c:3491:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp134, _36
 ; ./asm_test/win/i/all.c:3491:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	16(%rbx), %rax	 ; status_10(D)->current_block, status_10(D)->current_block
	movq	8(%rax), %rcx	 ; _37->instructions, _37->instructions
.L851:
 ; ./asm_test/win/i/all.c:3493: }
	addq	$64, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; ./asm_test/win/i/all.c:3491:         list_append(status->current_block->instructions, (size_t*)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	jmp	list_append	 ;
	.section .rdata,"dr"
.LC138:
	.ascii "[Warning] 'break' statement used outside of loop\12\0"
.LC139:
	.ascii "[Warning] 'continue' statement used outside of loop\12\0"
.LC140:
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
	movl	8(%rcx), %r8d	 ; statement_30(D)->type,
 ; ./asm_test/win/i/all.c:3495:     switch (statement->type) {
	cmpl	$7, %r8d	 ;, _1
	ja	.L853	 ;,
	movq	%rdx, %rbx	 ; tmp374, status
	leaq	.L855(%rip), %rdx	 ;, tmp287
	movq	%rcx, %rsi	 ; tmp373, statement
	movslq	(%rdx,%r8,4), %rax	 ;, tmp289
	addq	%rdx, %rax	 ; tmp287, tmp290
	jmp	*%rax	 ; tmp290
	.section .rdata,"dr"
	.align 4
.L855:
	.long	.L862-.L855
	.long	.L861-.L855
	.long	.L860-.L855
	.long	.L859-.L855
	.long	.L858-.L855
	.long	.L857-.L855
	.long	.L856-.L855
	.long	.L854-.L855
	.text
.L862:
 ; ./asm_test/win/i/all.c:3496:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.expr,
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; ./asm_test/win/i/all.c:3534: }
	addq	$56, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3496:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	%rbx, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3496:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	%rax, %rcx	 ; tmp375, _3
 ; ./asm_test/win/i/all.c:3534: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; ./asm_test/win/i/all.c:3496:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	jmp	load_rvalue	 ;
.L861:
 ; ./asm_test/win/i/all.c:3497:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, 0); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.var,
 ; ./asm_test/win/i/all.c:3534: }
	addq	$56, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3497:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, 0); break;
	movq	%rbx, %rdx	 ; status,
	xorl	%r8d, %r8d	 ;
 ; ./asm_test/win/i/all.c:3534: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; ./asm_test/win/i/all.c:3497:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, 0); break;
	jmp	tac_variable	 ;
.L860:
 ; ./asm_test/win/i/all.c:3498:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	(%rcx), %rbp	 ; statement_30(D)->stmt.if_stmt, _5
 ; ./asm_test/win/i/all.c:3536:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3537:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
 ; ./asm_test/win/i/all.c:3536:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	 ; tmp376, then_label
 ; ./asm_test/win/i/all.c:3537:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
	movq	%rax, %rsi	 ; tmp377, else_label
 ; ./asm_test/win/i/all.c:3539:     if ((if_->else_if == NULL || if_->else_if->head == NULL || if_->else_if->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	movq	16(%rbp), %rax	 ; _5->else_if, _61
 ; ./asm_test/win/i/all.c:3539:     if ((if_->else_if == NULL || if_->else_if->head == NULL || if_->else_if->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	testq	%rax, %rax	 ; _61
	je	.L863	 ;,
 ; ./asm_test/win/i/all.c:3539:     if ((if_->else_if == NULL || if_->else_if->head == NULL || if_->else_if->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	cmpq	$0, (%rax)	 ;, _61->head
	je	.L863	 ;,
 ; ./asm_test/win/i/all.c:3539:     if ((if_->else_if == NULL || if_->else_if->head == NULL || if_->else_if->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	cmpq	$0, 8(%rax)	 ;, _61->tail
	jne	.L864	 ;,
.L863:
 ; ./asm_test/win/i/all.c:3539:     if ((if_->else_if == NULL || if_->else_if->head == NULL || if_->else_if->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	movq	24(%rbp), %rax	 ; _5->else_body, _64
 ; ./asm_test/win/i/all.c:3540:         end_label = else_label;
	movq	%rsi, %rdi	 ; else_label, end_label
 ; ./asm_test/win/i/all.c:3539:     if ((if_->else_if == NULL || if_->else_if->head == NULL || if_->else_if->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	testq	%rax, %rax	 ; _64
	je	.L865	 ;,
 ; ./asm_test/win/i/all.c:3539:     if ((if_->else_if == NULL || if_->else_if->head == NULL || if_->else_if->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	cmpq	$0, (%rax)	 ;, _64->head
	je	.L865	 ;,
 ; ./asm_test/win/i/all.c:3539:     if ((if_->else_if == NULL || if_->else_if->head == NULL || if_->else_if->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	cmpq	$0, 8(%rax)	 ;, _64->tail
	je	.L865	 ;,
.L864:
 ; ./asm_test/win/i/all.c:3542:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
	movq	%rax, %rdi	 ; tmp378, end_label
.L865:
 ; ./asm_test/win/i/all.c:3543:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	%rdi, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3544:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	0(%rbp), %rcx	 ; _5->condition,
	movq	%rbx, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3543:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	%rax, 32(%rsp)	 ; tmp379, %sfp
 ; ./asm_test/win/i/all.c:3544:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	call	tac_expression	 ;
 ; ./asm_test/win/i/all.c:3544:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	%rbx, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3544:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	%rax, %rcx	 ; tmp380, _71
 ; ./asm_test/win/i/all.c:3544:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	call	load_rvalue	 ;
 ; ./asm_test/win/i/all.c:3545:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rsi, %rdx	 ; else_label,
	movl	$6, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3544:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	%rax, %r13	 ; tmp381, condition
 ; ./asm_test/win/i/all.c:3545:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3545:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r12, %rdx	 ; then_label,
	movl	$6, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3545:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, 40(%rsp)	 ; _73, %sfp
 ; ./asm_test/win/i/all.c:3545:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3545:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	40(%rsp), %r9	 ; %sfp, _73
	movq	%r13, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3545:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, %r8	 ;, tmp383
 ; ./asm_test/win/i/all.c:3545:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp384, inst
 ; ./asm_test/win/i/all.c:3546:     list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _76->instructions, _76->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3547:     Block* then_block = create_block(then_label);
	movq	%r12, %rcx	 ; then_label,
	call	create_block	 ;
	movq	%rax, %r12	 ; tmp385, then_block
 ; ./asm_test/win/i/all.c:3548:     list_append(status->current_subroutine->blocks, (size_t*)then_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	%r12, %rdx	 ; then_block,
	movq	32(%rax), %rcx	 ; _79->blocks, _79->blocks
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3549:     status->current_block = then_block;
	movq	%r12, 16(%rbx)	 ; then_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3550:     List* then_statements = list_copy(if_->body);
	movq	8(%rbp), %rcx	 ; _5->body, _5->body
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp386, then_statements
.L866:
 ; ./asm_test/win/i/all.c:3552:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%r12, %rcx	 ; then_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp387, statement
 ; ./asm_test/win/i/all.c:3552:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L944	 ;,
 ; ./asm_test/win/i/all.c:3553:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L866	 ;
.L944:
 ; ./asm_test/win/i/all.c:3554:     Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	32(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp388, jump_to_end
 ; ./asm_test/win/i/all.c:3555:     list_append(status->current_block->instructions, (size_t*)jump_to_end);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _85->instructions, _85->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3556:     if (if_->else_if != NULL && if_->else_if->head != NULL && if_->else_if->tail != NULL) {
	movq	16(%rbp), %rcx	 ; _5->else_if, _87
 ; ./asm_test/win/i/all.c:3556:     if (if_->else_if != NULL && if_->else_if->head != NULL && if_->else_if->tail != NULL) {
	testq	%rcx, %rcx	 ; _87
	je	.L868	 ;,
 ; ./asm_test/win/i/all.c:3556:     if (if_->else_if != NULL && if_->else_if->head != NULL && if_->else_if->tail != NULL) {
	cmpq	$0, (%rcx)	 ;, _87->head
	je	.L868	 ;,
 ; ./asm_test/win/i/all.c:3556:     if (if_->else_if != NULL && if_->else_if->head != NULL && if_->else_if->tail != NULL) {
	cmpq	$0, 8(%rcx)	 ;, _87->tail
	je	.L868	 ;,
 ; ./asm_test/win/i/all.c:3557:         List* elif_list = list_copy(if_->else_if);
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp389, elif_list
.L869:
 ; ./asm_test/win/i/all.c:3559:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	%r12, %rcx	 ; elif_list,
	call	list_pop	 ;
	movq	%rax, %r13	 ; tmp402, elif
 ; ./asm_test/win/i/all.c:3559:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	 ; elif
	je	.L868	 ;,
 ; ./asm_test/win/i/all.c:3560:             Block* else_if_block = create_block(else_label);
	movq	%rsi, %rcx	 ; else_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp390, else_if_block
 ; ./asm_test/win/i/all.c:3561:             list_append(status->current_subroutine->blocks, (size_t*)else_if_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	%rsi, %rdx	 ; else_if_block,
	movq	32(%rax), %rcx	 ; _93->blocks, _93->blocks
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3562:             status->current_block = else_if_block;
	movq	%rsi, 16(%rbx)	 ; else_if_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3563:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	xorl	%edx, %edx	 ;
	movl	$98, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3564:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
 ; ./asm_test/win/i/all.c:3563:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r14	 ; tmp391, then_label
 ; ./asm_test/win/i/all.c:3564:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3565:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	0(%r13), %rcx	 ; elif_97->condition,
	movq	%rbx, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3564:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rsi	 ; tmp392, else_label
 ; ./asm_test/win/i/all.c:3565:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	call	tac_expression	 ;
 ; ./asm_test/win/i/all.c:3565:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	%rbx, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3565:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	%rax, %rcx	 ; tmp393, _99
 ; ./asm_test/win/i/all.c:3565:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	call	load_rvalue	 ;
	movq	%rax, %r15	 ; tmp394, condition
 ; ./asm_test/win/i/all.c:3566:             if ((elif_list == NULL || elif_list->head == NULL || elif_list->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	testq	%r12, %r12	 ; elif_list
	je	.L870	 ;,
 ; ./asm_test/win/i/all.c:3566:             if ((elif_list == NULL || elif_list->head == NULL || elif_list->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	cmpq	$0, (%r12)	 ;, elif_list_90->head
	je	.L870	 ;,
 ; ./asm_test/win/i/all.c:3566:             if ((elif_list == NULL || elif_list->head == NULL || elif_list->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	cmpq	$0, 8(%r12)	 ;, elif_list_90->tail
	jne	.L871	 ;,
.L870:
 ; ./asm_test/win/i/all.c:3566:             if ((elif_list == NULL || elif_list->head == NULL || elif_list->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	movq	24(%rbp), %rax	 ; _5->else_body, _103
 ; ./asm_test/win/i/all.c:3566:             if ((elif_list == NULL || elif_list->head == NULL || elif_list->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	testq	%rax, %rax	 ; _103
	je	.L898	 ;,
 ; ./asm_test/win/i/all.c:3566:             if ((elif_list == NULL || elif_list->head == NULL || elif_list->tail == NULL) && (if_->else_body == NULL || if_->else_body->head == NULL || if_->else_body->tail == NULL))
	cmpq	$0, (%rax)	 ;, _103->head
	je	.L898	 ;,
 ; ./asm_test/win/i/all.c:3567:                 else_label = end_label;
	cmpq	$0, 8(%rax)	 ;, _103->tail
	cmove	%rdi, %rsi	 ; else_label,, end_label, else_label
	jmp	.L871	 ;
.L898:
	movq	%rdi, %rsi	 ; end_label, else_label
.L871:
 ; ./asm_test/win/i/all.c:3568:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rsi, %rdx	 ; else_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3568:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r14, %rdx	 ; then_label,
	movl	$6, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3568:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, 40(%rsp)	 ; _107, %sfp
 ; ./asm_test/win/i/all.c:3568:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3568:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	40(%rsp), %r9	 ; %sfp, _107
	movq	%r15, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3568:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, %r8	 ;, tmp396
 ; ./asm_test/win/i/all.c:3568:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp397, inst
 ; ./asm_test/win/i/all.c:3569:             list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _110->instructions, _110->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3570:             then_block = create_block(then_label);
	movq	%r14, %rcx	 ; then_label,
	call	create_block	 ;
	movq	%rax, %r14	 ; tmp398, then_block
 ; ./asm_test/win/i/all.c:3571:             list_append(status->current_subroutine->blocks, (size_t*)then_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	%r14, %rdx	 ; then_block,
	movq	32(%rax), %rcx	 ; _113->blocks, _113->blocks
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3572:             status->current_block = then_block;
	movq	%r14, 16(%rbx)	 ; then_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3573:             List* elif_statements = list_copy(elif->body);
	movq	8(%r13), %rcx	 ; elif_97->body, elif_97->body
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp399, elif_statements
.L872:
 ; ./asm_test/win/i/all.c:3575:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%r13, %rcx	 ; elif_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp400, elif_statement
 ; ./asm_test/win/i/all.c:3575:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	 ; elif_statement
	je	.L945	 ;,
 ; ./asm_test/win/i/all.c:3576:                 tac_statement(elif_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L872	 ;
.L945:
 ; ./asm_test/win/i/all.c:3577:             jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	32(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp401, jump_to_end
 ; ./asm_test/win/i/all.c:3578:             list_append(status->current_block->instructions, (size_t*)jump_to_end);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _119->instructions, _119->instructions
	call	list_append	 ;
	jmp	.L869	 ;
.L868:
 ; ./asm_test/win/i/all.c:3581:     if (if_->else_body != NULL && if_->else_body->head != NULL && if_->else_body->tail != NULL) {
	movq	24(%rbp), %rax	 ; _5->else_body, _121
 ; ./asm_test/win/i/all.c:3581:     if (if_->else_body != NULL && if_->else_body->head != NULL && if_->else_body->tail != NULL) {
	testq	%rax, %rax	 ; _121
	je	.L875	 ;,
 ; ./asm_test/win/i/all.c:3581:     if (if_->else_body != NULL && if_->else_body->head != NULL && if_->else_body->tail != NULL) {
	cmpq	$0, (%rax)	 ;, _121->head
	je	.L875	 ;,
 ; ./asm_test/win/i/all.c:3581:     if (if_->else_body != NULL && if_->else_body->head != NULL && if_->else_body->tail != NULL) {
	cmpq	$0, 8(%rax)	 ;, _121->tail
	je	.L875	 ;,
 ; ./asm_test/win/i/all.c:3582:         Block* else_block = create_block(else_label);
	movq	%rsi, %rcx	 ; else_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp403, else_block
 ; ./asm_test/win/i/all.c:3583:         list_append(status->current_subroutine->blocks, (size_t*)else_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	%rsi, %rdx	 ; else_block,
	movq	32(%rax), %rcx	 ; _126->blocks, _126->blocks
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3584:         status->current_block = else_block;
	movq	%rsi, 16(%rbx)	 ; else_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3585:         List* else_statements = list_copy(if_->else_body);
	movq	24(%rbp), %rcx	 ; _5->else_body, _5->else_body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp404, else_statements
.L876:
 ; ./asm_test/win/i/all.c:3587:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rsi, %rcx	 ; else_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp405, else_statement
 ; ./asm_test/win/i/all.c:3587:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	 ; else_statement
	je	.L946	 ;,
 ; ./asm_test/win/i/all.c:3588:             tac_statement(else_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L876	 ;
.L946:
 ; ./asm_test/win/i/all.c:3589:         jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	32(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
.L943:
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp406, jump_to_end
 ; ./asm_test/win/i/all.c:3590:         list_append(status->current_block->instructions, (size_t*)jump_to_end);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ;, _132->instructions
	call	list_append	 ;
.L875:
 ; ./asm_test/win/i/all.c:3592:     Block* end_block = create_block(end_label);
	movq	%rdi, %rcx	 ; end_label,
	jmp	.L939	 ;
.L859:
 ; ./asm_test/win/i/all.c:3499:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	(%rcx), %r12	 ; statement_30(D)->stmt.while_stmt, _6
 ; ./asm_test/win/i/all.c:3649:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3650:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$6, %ecx	 ;,
	movq	%rax, %rdx	 ; condition_label,
 ; ./asm_test/win/i/all.c:3649:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rsi	 ; tmp408, condition_label
 ; ./asm_test/win/i/all.c:3650:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3650:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3650:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp409, _138
 ; ./asm_test/win/i/all.c:3650:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp410, inst
 ; ./asm_test/win/i/all.c:3651:     list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _140->instructions, _140->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3652:     Block* condition_block = create_block(condition_label);
	movq	%rsi, %rcx	 ; condition_label,
	call	create_block	 ;
	movq	%rax, %rdi	 ; tmp411, condition_block
 ; ./asm_test/win/i/all.c:3653:     list_append(status->current_subroutine->blocks, (size_t*)condition_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	%rdi, %rdx	 ; condition_block,
	movq	32(%rax), %rcx	 ; _143->blocks, _143->blocks
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3654:     status->current_block = condition_block;
	movq	%rdi, 16(%rbx)	 ; condition_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3655:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	xorl	%edx, %edx	 ;
	movl	$98, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3656:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
 ; ./asm_test/win/i/all.c:3655:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	 ; tmp412, body_label
 ; ./asm_test/win/i/all.c:3656:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3657:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	(%r12), %rcx	 ; _6->condition,
	movq	%rbx, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3656:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rdi	 ; tmp413, end_label
 ; ./asm_test/win/i/all.c:3657:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	call	tac_expression	 ;
 ; ./asm_test/win/i/all.c:3657:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	%rbx, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3657:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	%rax, %rcx	 ; tmp414, _148
 ; ./asm_test/win/i/all.c:3657:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	call	load_rvalue	 ;
 ; ./asm_test/win/i/all.c:3658:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rdi, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3657:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	%rax, %r13	 ; tmp415, condition
 ; ./asm_test/win/i/all.c:3658:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3658:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rbp, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3658:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, 32(%rsp)	 ; _150, %sfp
 ; ./asm_test/win/i/all.c:3658:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3658:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	32(%rsp), %r9	 ; %sfp, _150
	movq	%r13, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3658:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, %r8	 ;, tmp417
 ; ./asm_test/win/i/all.c:3658:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp418, inst
 ; ./asm_test/win/i/all.c:3659:     list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _153->instructions, _153->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3660:     Block* body_block = create_block(body_label);
	movq	%rbp, %rcx	 ; body_label,
	call	create_block	 ;
	movq	%rax, %rbp	 ; tmp419, body_block
 ; ./asm_test/win/i/all.c:3661:     list_append(status->current_subroutine->blocks, (size_t*)body_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	%rbp, %rdx	 ; body_block,
	movq	32(%rax), %rcx	 ; _156->blocks, _156->blocks
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3662:     status->current_block = body_block;
	movq	%rbp, 16(%rbx)	 ; body_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3663:     list_append(status->start_labels, (size_t*)create_arg(ARG_LABEL, condition_label));
	movq	%rsi, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3663:     list_append(status->start_labels, (size_t*)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rcx	 ; status_31(D)->start_labels, status_31(D)->start_labels
 ; ./asm_test/win/i/all.c:3663:     list_append(status->start_labels, (size_t*)create_arg(ARG_LABEL, condition_label));
	movq	%rax, %rdx	 ; tmp420, _158
 ; ./asm_test/win/i/all.c:3663:     list_append(status->start_labels, (size_t*)create_arg(ARG_LABEL, condition_label));
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3664:     list_append(status->end_labels, (size_t*)create_arg(ARG_LABEL, end_label));
	movq	%rdi, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3664:     list_append(status->end_labels, (size_t*)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rcx	 ; status_31(D)->end_labels, status_31(D)->end_labels
 ; ./asm_test/win/i/all.c:3664:     list_append(status->end_labels, (size_t*)create_arg(ARG_LABEL, end_label));
	movq	%rax, %rdx	 ; tmp421, _160
 ; ./asm_test/win/i/all.c:3664:     list_append(status->end_labels, (size_t*)create_arg(ARG_LABEL, end_label));
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3665:     List* body_statements = list_copy(while_->body);
	movq	8(%r12), %rcx	 ; _6->body, _6->body
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp422, body_statements
.L879:
 ; ./asm_test/win/i/all.c:3667:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rbp, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp423, statement
 ; ./asm_test/win/i/all.c:3667:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L947	 ;,
 ; ./asm_test/win/i/all.c:3668:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L879	 ;
.L947:
 ; ./asm_test/win/i/all.c:3669:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rcx	 ; status_31(D)->start_labels, status_31(D)->start_labels
	call	list_pop_back	 ;
 ; ./asm_test/win/i/all.c:3670:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rcx	 ; status_31(D)->end_labels, status_31(D)->end_labels
	call	list_pop_back	 ;
 ; ./asm_test/win/i/all.c:3671:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rsi, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3671:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
 ; ./asm_test/win/i/all.c:3671:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp424, _167
	jmp	.L943	 ;
.L858:
 ; ./asm_test/win/i/all.c:3500:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	(%rcx), %rsi	 ; statement_30(D)->stmt.for_stmt, _7
 ; ./asm_test/win/i/all.c:3597:     if (for_->initializer != NULL)
	movq	(%rsi), %rcx	 ; _7->initializer, _174
 ; ./asm_test/win/i/all.c:3597:     if (for_->initializer != NULL)
	testq	%rcx, %rcx	 ; _174
	je	.L881	 ;,
 ; ./asm_test/win/i/all.c:3598:         tac_variable(for_->initializer, status, 0);
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rdx	 ; status,
	call	tac_variable	 ;
.L881:
 ; ./asm_test/win/i/all.c:3599:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3600:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; ./asm_test/win/i/all.c:3599:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	 ; tmp427, condition_label
 ; ./asm_test/win/i/all.c:3600:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3601:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; ./asm_test/win/i/all.c:3600:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rdi	 ; tmp428, body_label
 ; ./asm_test/win/i/all.c:3601:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3602:     if (for_->condition != NULL) {
	cmpq	$0, 8(%rsi)	 ;, _7->condition
 ; ./asm_test/win/i/all.c:3601:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	 ; tmp429, end_label
 ; ./asm_test/win/i/all.c:3602:     if (for_->condition != NULL) {
	je	.L882	 ;,
 ; ./asm_test/win/i/all.c:3603:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rbp, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3603:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3603:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp430, _179
 ; ./asm_test/win/i/all.c:3603:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp431, inst
 ; ./asm_test/win/i/all.c:3604:         list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _181->instructions, _181->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3605:         Block* condition_block = create_block(condition_label);
	movq	%rbp, %rcx	 ; condition_label,
	call	create_block	 ;
	movq	%rax, %r13	 ; tmp432, condition_block
 ; ./asm_test/win/i/all.c:3606:         list_append(status->current_subroutine->blocks, (size_t*)condition_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	%r13, %rdx	 ; condition_block,
	movq	32(%rax), %rcx	 ; _184->blocks, _184->blocks
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3607:         status->current_block = condition_block;
	movq	%r13, 16(%rbx)	 ; condition_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3608:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	8(%rsi), %rcx	 ; _7->condition, _7->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; ./asm_test/win/i/all.c:3608:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	%rbx, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3608:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	%rax, %rcx	 ; tmp433, _187
 ; ./asm_test/win/i/all.c:3608:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	call	load_rvalue	 ;
 ; ./asm_test/win/i/all.c:3609:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3608:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	%rax, %r13	 ; tmp434, condition
 ; ./asm_test/win/i/all.c:3609:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3609:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rdi, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3609:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, 32(%rsp)	 ; _189, %sfp
 ; ./asm_test/win/i/all.c:3609:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3609:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	32(%rsp), %r9	 ; %sfp, _189
	movq	%r13, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3609:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, %r8	 ;, tmp436
	jmp	.L937	 ;
.L882:
 ; ./asm_test/win/i/all.c:3612:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rdi, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3612:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3612:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp438, _194
.L937:
 ; ./asm_test/win/i/all.c:3612:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp439, inst
 ; ./asm_test/win/i/all.c:3613:         list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ;, _196->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3615:     Block* body_block = create_block(body_label);
	movq	%rdi, %rcx	 ; body_label,
	call	create_block	 ;
	movq	%rax, %r13	 ; tmp440, body_block
 ; ./asm_test/win/i/all.c:3616:     list_append(status->current_subroutine->blocks, (size_t*)body_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	%r13, %rdx	 ; body_block,
	movq	32(%rax), %rcx	 ; _199->blocks, _199->blocks
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3617:     status->current_block = body_block;
	movq	%r13, 16(%rbx)	 ; body_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3618:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3619:     if (for_->increment != NULL)
	cmpq	$0, 16(%rsi)	 ;, _7->increment
 ; ./asm_test/win/i/all.c:3618:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r13	 ; tmp441, increment_label
 ; ./asm_test/win/i/all.c:3620:         list_append(status->start_labels, (size_t*)create_arg(ARG_LABEL, increment_label));
	movq	%rax, %rdx	 ; increment_label,
 ; ./asm_test/win/i/all.c:3619:     if (for_->increment != NULL)
	jne	.L938	 ;,
 ; ./asm_test/win/i/all.c:3621:     else if (for_->condition != NULL)
	cmpq	$0, 8(%rsi)	 ;, _7->condition
 ; ./asm_test/win/i/all.c:3622:         list_append(status->start_labels, (size_t*)create_arg(ARG_LABEL, condition_label));
	movq	%rbp, %rdx	 ; condition_label,
 ; ./asm_test/win/i/all.c:3621:     else if (for_->condition != NULL)
	jne	.L938	 ;,
 ; ./asm_test/win/i/all.c:3624:         list_append(status->start_labels, (size_t*)create_arg(ARG_LABEL, body_label));
	movq	%rdi, %rdx	 ; body_label,
.L938:
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3624:         list_append(status->start_labels, (size_t*)create_arg(ARG_LABEL, body_label));
	movq	40(%rbx), %rcx	 ; status_31(D)->start_labels, status_31(D)->start_labels
 ; ./asm_test/win/i/all.c:3624:         list_append(status->start_labels, (size_t*)create_arg(ARG_LABEL, body_label));
	movq	%rax, %rdx	 ; tmp444, _208
 ; ./asm_test/win/i/all.c:3624:         list_append(status->start_labels, (size_t*)create_arg(ARG_LABEL, body_label));
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3625:     list_append(status->end_labels, (size_t*)create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3625:     list_append(status->end_labels, (size_t*)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rcx	 ; status_31(D)->end_labels, status_31(D)->end_labels
 ; ./asm_test/win/i/all.c:3625:     list_append(status->end_labels, (size_t*)create_arg(ARG_LABEL, end_label));
	movq	%rax, %rdx	 ; tmp445, _210
 ; ./asm_test/win/i/all.c:3625:     list_append(status->end_labels, (size_t*)create_arg(ARG_LABEL, end_label));
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3626:     List* body_statements = list_copy(for_->body);
	movq	24(%rsi), %rcx	 ; _7->body, _7->body
	call	list_copy	 ;
	movq	%rax, %r14	 ; tmp446, body_statements
.L887:
 ; ./asm_test/win/i/all.c:3628:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%r14, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp447, statement
 ; ./asm_test/win/i/all.c:3628:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L948	 ;,
 ; ./asm_test/win/i/all.c:3629:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L887	 ;
.L948:
 ; ./asm_test/win/i/all.c:3630:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rcx	 ; status_31(D)->start_labels, status_31(D)->start_labels
	call	list_pop_back	 ;
 ; ./asm_test/win/i/all.c:3631:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rcx	 ; status_31(D)->end_labels, status_31(D)->end_labels
	call	list_pop_back	 ;
 ; ./asm_test/win/i/all.c:3632:     if (for_->increment != NULL) {
	cmpq	$0, 16(%rsi)	 ;, _7->increment
	je	.L889	 ;,
 ; ./asm_test/win/i/all.c:3633:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	%r13, %rdx	 ; increment_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3633:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3633:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp448, _218
 ; ./asm_test/win/i/all.c:3633:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp449, inst
 ; ./asm_test/win/i/all.c:3634:         list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _220->instructions, _220->instructions
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3635:         Block* increment_block = create_block(increment_label);
	movq	%r13, %rcx	 ; increment_label,
	call	create_block	 ;
	movq	%rax, %r13	 ; tmp450, increment_block
 ; ./asm_test/win/i/all.c:3636:         list_append(status->current_subroutine->blocks, (size_t*)increment_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	%r13, %rdx	 ; increment_block,
	movq	32(%rax), %rcx	 ; _223->blocks, _223->blocks
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3637:         status->current_block = increment_block;
	movq	%r13, 16(%rbx)	 ; increment_block, status_31(D)->current_block
 ; ./asm_test/win/i/all.c:3638:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	16(%rsi), %rcx	 ; _7->increment, _7->increment
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; ./asm_test/win/i/all.c:3638:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	%rbx, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3638:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	%rax, %rcx	 ; tmp451, _226
 ; ./asm_test/win/i/all.c:3638:         load_rvalue(tac_expression(for_->increment, status), status);
	call	load_rvalue	 ;
.L889:
 ; ./asm_test/win/i/all.c:3640:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rbp, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3640:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3640:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp452, _227
 ; ./asm_test/win/i/all.c:3640:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	 ;
 ; ./asm_test/win/i/all.c:3641:     if (for_->condition == NULL)
	cmpq	$0, 8(%rsi)	 ;, _7->condition
	jne	.L890	 ;,
 ; ./asm_test/win/i/all.c:3642:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rdi, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3642:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3642:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp454, _230
 ; ./asm_test/win/i/all.c:3642:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	call	create_instruction	 ;
.L890:
 ; ./asm_test/win/i/all.c:3643:     list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rdx	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rdx), %rcx	 ; _232->instructions, _232->instructions
	movq	%rax, %rdx	 ; inst,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3644:     Block* end_block = create_block(end_label);
	movq	%r12, %rcx	 ; end_label,
.L939:
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp456, end_block
 ; ./asm_test/win/i/all.c:3645:     list_append(status->current_subroutine->blocks, (size_t*)end_block);
	movq	8(%rbx), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	%rsi, %rdx	 ; end_block,
	movq	32(%rax), %rcx	 ;, _236->blocks
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3646:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; end_block, status_31(D)->current_block
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
.L857:
 ; ./asm_test/win/i/all.c:3502:             Arg* return_value = create_arg(ARG_VOID, NULL);
	movl	$5, %ecx	 ;,
	xorl	%edx, %edx	 ;
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3503:             if (statement->stmt.return_expr != NULL)
	movq	(%rsi), %rcx	 ; statement_30(D)->stmt.return_expr, _8
 ; ./asm_test/win/i/all.c:3503:             if (statement->stmt.return_expr != NULL)
	testq	%rcx, %rcx	 ; _8
	je	.L891	 ;,
 ; ./asm_test/win/i/all.c:3504:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; ./asm_test/win/i/all.c:3504:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	%rbx, %rdx	 ; status,
 ; ./asm_test/win/i/all.c:3504:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	%rax, %rcx	 ; tmp458, _9
 ; ./asm_test/win/i/all.c:3504:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	call	load_rvalue	 ;
.L891:
 ; ./asm_test/win/i/all.c:3505:             list_append(status->current_block->instructions, (size_t*)create_instruction(INST_RET, return_value, NULL, NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rax, %rdx	 ; return_value,
	movl	$21, %ecx	 ;,
	jmp	.L940	 ;
.L856:
 ; ./asm_test/win/i/all.c:3509:             if (status->end_labels != NULL && status->end_labels->head != NULL && status->end_labels->tail != NULL) {
	movq	32(%rbx), %rax	 ; status_31(D)->end_labels, _13
 ; ./asm_test/win/i/all.c:3509:             if (status->end_labels != NULL && status->end_labels->head != NULL && status->end_labels->tail != NULL) {
	testq	%rax, %rax	 ; _13
	je	.L892	 ;,
 ; ./asm_test/win/i/all.c:3509:             if (status->end_labels != NULL && status->end_labels->head != NULL && status->end_labels->tail != NULL) {
	cmpq	$0, (%rax)	 ;, _13->head
	je	.L892	 ;,
 ; ./asm_test/win/i/all.c:3509:             if (status->end_labels != NULL && status->end_labels->head != NULL && status->end_labels->tail != NULL) {
	movq	8(%rax), %rax	 ; _13->tail, _15
 ; ./asm_test/win/i/all.c:3509:             if (status->end_labels != NULL && status->end_labels->head != NULL && status->end_labels->tail != NULL) {
	testq	%rax, %rax	 ; _15
	je	.L892	 ;,
 ; ./asm_test/win/i/all.c:3510:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rdx	 ; _15->content, label
 ; ./asm_test/win/i/all.c:3511:                 if (label != NULL) {
	testq	%rdx, %rdx	 ; label
	je	.L892	 ;,
.L942:
 ; ./asm_test/win/i/all.c:3512:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
.L940:
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp461, inst
 ; ./asm_test/win/i/all.c:3513:                     list_append(status->current_block->instructions, (size_t*)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ;, _16->instructions
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
 ; ./asm_test/win/i/all.c:3513:                     list_append(status->current_block->instructions, (size_t*)inst);
	jmp	list_append	 ;
.L892:
 ; ./asm_test/win/i/all.c:3517:             fprintf(stderr, "[Warning] 'break' statement used outside of loop\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3517:             fprintf(stderr, "[Warning] 'break' statement used outside of loop\n");
	leaq	.LC138(%rip), %rcx	 ;, tmp364
 ; ./asm_test/win/i/all.c:3517:             fprintf(stderr, "[Warning] 'break' statement used outside of loop\n");
	movq	%rax, %rdx	 ; tmp462, _18
	jmp	.L941	 ;
.L854:
 ; ./asm_test/win/i/all.c:3520:             if (status->start_labels != NULL && status->start_labels->head != NULL && status->start_labels->tail != NULL) {
	movq	40(%rbx), %rax	 ; status_31(D)->start_labels, _19
 ; ./asm_test/win/i/all.c:3520:             if (status->start_labels != NULL && status->start_labels->head != NULL && status->start_labels->tail != NULL) {
	testq	%rax, %rax	 ; _19
	je	.L893	 ;,
 ; ./asm_test/win/i/all.c:3520:             if (status->start_labels != NULL && status->start_labels->head != NULL && status->start_labels->tail != NULL) {
	cmpq	$0, (%rax)	 ;, _19->head
	je	.L893	 ;,
 ; ./asm_test/win/i/all.c:3520:             if (status->start_labels != NULL && status->start_labels->head != NULL && status->start_labels->tail != NULL) {
	movq	8(%rax), %rax	 ; _19->tail, _21
 ; ./asm_test/win/i/all.c:3520:             if (status->start_labels != NULL && status->start_labels->head != NULL && status->start_labels->tail != NULL) {
	testq	%rax, %rax	 ; _21
	je	.L893	 ;,
 ; ./asm_test/win/i/all.c:3521:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rdx	 ; _21->content, label
 ; ./asm_test/win/i/all.c:3522:                 if (label != NULL) {
	testq	%rdx, %rdx	 ; label
	jne	.L942	 ;,
.L893:
 ; ./asm_test/win/i/all.c:3528:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3528:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	leaq	.LC139(%rip), %rcx	 ;, tmp368
 ; ./asm_test/win/i/all.c:3528:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	movq	%rax, %rdx	 ; tmp464, _24
.L941:
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
 ; ./asm_test/win/i/all.c:3528:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	jmp	fputs	 ;
.L853:
	movl	%r8d, 32(%rsp)	 ; _1, %sfp
 ; ./asm_test/win/i/all.c:3531:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3531:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movl	32(%rsp), %r8d	 ; %sfp, _1
 ; ./asm_test/win/i/all.c:3534: }
	addq	$56, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3531:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	leaq	.LC140(%rip), %rdx	 ;, tmp370
 ; ./asm_test/win/i/all.c:3534: }
	popq	%rbx	 ;
 ; ./asm_test/win/i/all.c:3531:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movq	%rax, %rcx	 ; tmp465, _25
 ; ./asm_test/win/i/all.c:3534: }
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; ./asm_test/win/i/all.c:3531:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	jmp	fprintf	 ;
	.section .rdata,"dr"
.LC141:
	.ascii "[Warning] Constructor '%s' does not start with 'self' initialization\12\0"
.LC142:
	.ascii "[Warning] Unsupported class member type for tac_class: %d\12\0"
	.text
	.def	tac_class;	.scl	3;	.type	32;	.endef
tac_class:
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
 ; ./asm_test/win/i/all.c:3472:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	leaq	.LC142(%rip), %r12	 ;, tmp163
 ; ./asm_test/win/i/all.c:3457: void tac_class(Class* class, TACStatus* status) {
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp164, class
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp165, status
	subq	$48, %rsp	 ;,
 ; ./asm_test/win/i/all.c:3458:     status->current_class = class;
	movq	%rcx, 24(%rdx)	 ; class, status_12(D)->current_class
 ; ./asm_test/win/i/all.c:3459:     List* members = list_copy(class->members);
	movq	8(%rcx), %rcx	 ; class_13(D)->members, class_13(D)->members
	call	list_copy	 ;
 ; ./asm_test/win/i/all.c:3144:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3461:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	(%rsi), %rdi	 ; class_13(D)->name, _2
 ; ./asm_test/win/i/all.c:3459:     List* members = list_copy(class->members);
	movq	%rax, %rbp	 ; tmp166, members
 ; ./asm_test/win/i/all.c:3144:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp167, table
 ; ./asm_test/win/i/all.c:3145:     table->attributes = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:3147:     table->size = 0;
	xorl	%ecx, %ecx	 ;
 ; ./asm_test/win/i/all.c:3146:     table->name = name;
	movq	%rdi, 8(%rsi)	 ; _2, table_27->name
 ; ./asm_test/win/i/all.c:3462:     list_append(status->tac->attribute_tables, (size_t*)attr_table);
	movq	%rsi, %rdx	 ; table,
 ; ./asm_test/win/i/all.c:3145:     table->attributes = create_list();
	movq	%rax, (%rsi)	 ; tmp168, table_27->attributes
 ; ./asm_test/win/i/all.c:3462:     list_append(status->tac->attribute_tables, (size_t*)attr_table);
	movq	(%rbx), %rax	 ; status_12(D)->tac, status_12(D)->tac
 ; ./asm_test/win/i/all.c:3147:     table->size = 0;
	movq	%rcx, 16(%rsi)	 ;, table_27->size
 ; ./asm_test/win/i/all.c:3462:     list_append(status->tac->attribute_tables, (size_t*)attr_table);
	movq	(%rax), %rcx	 ; _3->attribute_tables,
	call	list_append	 ;
.L950:
 ; ./asm_test/win/i/all.c:3463:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rbp, %rcx	 ; members,
	call	list_pop	 ;
 ; ./asm_test/win/i/all.c:3463:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; member
	je	.L965	 ;,
 ; ./asm_test/win/i/all.c:3464:         switch (member->type) {
	movl	8(%rax), %r8d	 ; member_21->type, _5
 ; ./asm_test/win/i/all.c:3464:         switch (member->type) {
	testl	%r8d, %r8d	 ; _5
	je	.L951	 ;,
	cmpl	$1, %r8d	 ;, _5
	jne	.L966	 ;,
 ; ./asm_test/win/i/all.c:3469:                 tac_variable(member->content.variable, status, 1);
	movq	(%rax), %rcx	 ; member_21->content.variable,
	movl	$1, %r8d	 ;,
	movq	%rbx, %rdx	 ; status,
	call	tac_variable	 ;
 ; ./asm_test/win/i/all.c:3470:                 break;
	jmp	.L950	 ;
.L951:
 ; ./asm_test/win/i/all.c:3466:                 tac_method(member->content.method, status);
	movq	(%rax), %r13	 ; member_21->content.method, _6
 ; ./asm_test/win/i/all.c:3432:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	8(%r13), %rdx	 ; _6->return_type, _6->return_type
	movq	0(%r13), %rcx	 ; _6->name,
	call	create_subroutine	 ;
 ; ./asm_test/win/i/all.c:3433:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	 ; subroutine, status_12(D)->current_subroutine
 ; ./asm_test/win/i/all.c:3432:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	%rax, %rsi	 ; tmp169, subroutine
 ; ./asm_test/win/i/all.c:3434:     list_append(status->tac->subroutines, (size_t*)subroutine);
	movq	(%rbx), %rax	 ; status_12(D)->tac, status_12(D)->tac
	movq	%rsi, %rdx	 ; subroutine,
	movq	24(%rax), %rcx	 ; _32->subroutines, _32->subroutines
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3435:     List* parameters = list_copy(method->parameters);
	movq	16(%r13), %rcx	 ; _6->parameters, _6->parameters
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp170, parameters
.L954:
 ; ./asm_test/win/i/all.c:3437:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rdi, %rcx	 ; parameters,
	call	list_pop	 ;
 ; ./asm_test/win/i/all.c:3437:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	je	.L967	 ;,
 ; ./asm_test/win/i/all.c:3438:         list_append(subroutine->parameters, (size_t*)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %rcx	 ; parameter_36->name, parameter_36->name
	movq	(%rax), %rdx	 ; parameter_36->type,
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3438:         list_append(subroutine->parameters, (size_t*)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rsi), %rcx	 ; subroutine_31->parameters, subroutine_31->parameters
 ; ./asm_test/win/i/all.c:3438:         list_append(subroutine->parameters, (size_t*)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rdx	 ; tmp171, _39
 ; ./asm_test/win/i/all.c:3438:         list_append(subroutine->parameters, (size_t*)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	list_append	 ;
	jmp	.L954	 ;
.L967:
 ; ./asm_test/win/i/all.c:3439:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
	movq	%rax, %rcx	 ; tmp173, _41
 ; ./asm_test/win/i/all.c:3439:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	 ;
 ; ./asm_test/win/i/all.c:3440:     list_append(subroutine->blocks, (size_t*)block);
	movq	32(%rsi), %rcx	 ; subroutine_31->blocks, subroutine_31->blocks
 ; ./asm_test/win/i/all.c:3439:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %rdi	 ; tmp174, block
 ; ./asm_test/win/i/all.c:3440:     list_append(subroutine->blocks, (size_t*)block);
	movq	%rax, %rdx	 ; block,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3441:     status->current_block = block;
	movq	%rdi, 16(%rbx)	 ; block, status_12(D)->current_block
 ; ./asm_test/win/i/all.c:3442:     List* statements = list_copy(method->body);
	movq	24(%r13), %rcx	 ; _6->body, _6->body
	call	list_copy	 ;
 ; ./asm_test/win/i/all.c:3443:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME,
 ; ./asm_test/win/i/all.c:3442:     List* statements = list_copy(method->body);
	movq	%rax, %rsi	 ; tmp175, statements
 ; ./asm_test/win/i/all.c:3443:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	24(%rbx), %rax	 ; status_12(D)->current_class, status_12(D)->current_class
 ; ./asm_test/win/i/all.c:3443:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	 ; _47->name, _47->name
	movq	8(%rax), %rcx	 ; _48->name, _48->name
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp176, _50
 ; ./asm_test/win/i/all.c:3443:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	0(%r13), %rax	 ; _6->name, _6->name
	movq	8(%rax), %r13	 ; _51->name, _52
 ; ./asm_test/win/i/all.c:3443:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	%r13, %rcx	 ; _52,
	call	strcmp	 ;
 ; ./asm_test/win/i/all.c:3443:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	 ; tmp177
	jne	.L960	 ;,
 ; ./asm_test/win/i/all.c:3444:         Statement* stmt = (Statement*)list_pop(statements);
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
 ; ./asm_test/win/i/all.c:3445:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$0, 8(%rax)	 ;, stmt_54->type
	jne	.L957	 ;,
 ; ./asm_test/win/i/all.c:3445:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	 ; stmt_54->stmt.expr, _56
 ; ./asm_test/win/i/all.c:3445:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$19, 24(%rax)	 ;, _56->operator
	jne	.L957	 ;,
 ; ./asm_test/win/i/all.c:3445:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	8(%rax), %rax	 ; _56->prim_left, _58
 ; ./asm_test/win/i/all.c:3445:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$8, 8(%rax)	 ;, _58->type
	jne	.L957	 ;,
 ; ./asm_test/win/i/all.c:3445:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	 ; _58->value.var, _60
 ; ./asm_test/win/i/all.c:3445:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$0, 16(%rax)	 ;, _60->type
	je	.L958	 ;,
.L957:
 ; ./asm_test/win/i/all.c:3446:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3446:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	%r13, %r8	 ; _52,
	leaq	.LC141(%rip), %rdx	 ;, tmp156
 ; ./asm_test/win/i/all.c:3446:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	%rax, %rcx	 ; tmp179, _62
 ; ./asm_test/win/i/all.c:3446:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3447:             return;
	jmp	.L950	 ;
.L958:
 ; ./asm_test/win/i/all.c:3449:         Symbol* self = stmt->stmt.expr->prim_left->value.var->content.name;
	movq	8(%rax), %r14	 ; _60->content.name, self
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	24(%rbx), %rax	 ; status_12(D)->current_class, tmp188
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$1, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	leaq	24(%rax), %rdx	 ;, tmp157
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	(%r14), %rdx	 ; self_63->type,
	movq	%rbx, %r9	 ; status,
	movq	%r14, %rcx	 ; self,
	movl	$118, %r8d	 ;,
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %r13	 ; tmp180, _66
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	xorl	%ecx, %ecx	 ;
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %rdx	 ; tmp181, _68
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	create_arg	 ;
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$18, %ecx	 ;,
	xorl	%r9d, %r9d	 ;
	movq	%r13, %r8	 ; _66,
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %rdx	 ; tmp182, _69
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	create_instruction	 ;
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	8(%rdi), %rcx	 ; block_42->instructions, block_42->instructions
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %rdx	 ; tmp183, _70
 ; ./asm_test/win/i/all.c:3450:         list_append(block->instructions, (size_t*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	list_append	 ;
.L960:
 ; ./asm_test/win/i/all.c:3453:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp184, statement
 ; ./asm_test/win/i/all.c:3453:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L968	 ;,
 ; ./asm_test/win/i/all.c:3454:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L960	 ;
.L968:
 ; ./asm_test/win/i/all.c:3455:     status->current_subroutine = NULL;
	xorl	%edx, %edx	 ;
	movq	%rdx, 8(%rbx)	 ;, status_12(D)->current_subroutine
	jmp	.L950	 ;
.L966:
	movl	%r8d, 44(%rsp)	 ; _5, %sfp
 ; ./asm_test/win/i/all.c:3472:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3472:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	movl	44(%rsp), %r8d	 ; %sfp, _5
	movq	%r12, %rdx	 ; tmp163,
 ; ./asm_test/win/i/all.c:3472:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	movq	%rax, %rcx	 ; tmp185, _9
 ; ./asm_test/win/i/all.c:3472:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3473:                 break;
	jmp	.L950	 ;
.L965:
 ; ./asm_test/win/i/all.c:3476:     status->current_class = NULL;
	xorl	%eax, %eax	 ;
	movq	%rax, 24(%rbx)	 ;, status_12(D)->current_class
 ; ./asm_test/win/i/all.c:3477: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
	.section .rdata,"dr"
.LC143:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unterminated string literal\12\0"
.LC144:
	.ascii "\0\0"
.LC145:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unterminated comment\12\0"
.LC146:
	.ascii "[Lexer Error] at %s:%zu:%zu: Unexpected character\12\0"
	.text
	.def	next_token;	.scl	3;	.type	32;	.endef
next_token:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movl	%edx, %edi	 ; tmp592, skip_comment
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp591, lexer
	subq	$64, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1319:     char c = get_current_char(lexer);
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1320:     if (c == '\0')
	testb	%al, %al	 ; c
	jne	.L970	 ;,
 ; ./asm_test/win/i/all.c:1321:         return create_token(EOF_TOKEN, NULL, lexer->line, lexer->column);
	movq	40(%rcx), %r9	 ; lexer_290(D)->column,
	movq	32(%rcx), %r8	 ; lexer_290(D)->line,
	jmp	.L1152	 ;
.L970:
 ; ./asm_test/win/i/all.c:1322:     else if (c == ' ' || c == '\t' || c == '\r')
	movl	%eax, %edx	 ; c, tmp356
	andl	$-5, %edx	 ;, tmp356
 ; ./asm_test/win/i/all.c:1322:     else if (c == ' ' || c == '\t' || c == '\r')
	cmpb	$9, %dl	 ;, tmp356
	je	.L1047	 ;,
	cmpb	$32, %al	 ;, c
	je	.L1047	 ;,
 ; ./asm_test/win/i/all.c:1324:     else if (c == '\n') {
	cmpb	$10, %al	 ;, c
	jne	.L973	 ;,
 ; ./asm_test/win/i/all.c:1325:         (void)(lexer->line++), lexer->column = 0;
	xorl	%r9d, %r9d	 ;
 ; ./asm_test/win/i/all.c:1325:         (void)(lexer->line++), lexer->column = 0;
	incq	32(%rcx)	 ; lexer_290(D)->line
 ; ./asm_test/win/i/all.c:1325:         (void)(lexer->line++), lexer->column = 0;
	movq	%r9, 40(%rcx)	 ;, lexer_290(D)->column
	jmp	.L1047	 ;
.L973:
 ; ./asm_test/win/i/all.c:1328:         size_t start = lexer->position - 1;
	movq	16(%rcx), %rsi	 ; lexer_290(D)->position, pretmp_499
	cmpb	$57, %al	 ;, c
	jg	.L974	 ;,
	cmpb	$47, %al	 ;, c
	jg	.L975	 ;,
	cmpb	$34, %al	 ;, c
	jne	.L977	 ;,
 ; ./asm_test/win/i/all.c:1357:         while (c != '"' && c != '\0' && c != '\n')
	movabsq	$-17179870210, %r9	 ;, tmp589
 ; ./asm_test/win/i/all.c:1355:         size_t column_start = lexer->column - 1;
	movq	40(%rcx), %rax	 ; lexer_290(D)->column, tmp619
	leaq	-1(%rax), %rbp	 ;, column_start
 ; ./asm_test/win/i/all.c:1356:         c = get_current_char(lexer);
	call	get_current_char	 ;
	movl	%eax, %edi	 ; tmp600, c
 ; ./asm_test/win/i/all.c:1357:         while (c != '"' && c != '\0' && c != '\n')
	jmp	.L993	 ;
.L974:
	leal	-65(%rax), %edx	 ;, _251
	cmpb	$57, %dl	 ;, _251
	ja	.L977	 ;,
	movabsq	$288230372997595135, %r10	 ;, tmp365
	btq	%rdx, %r10	 ; _251, tmp365
	jnc	.L977	 ;,
 ; ./asm_test/win/i/all.c:1329:         size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rdi	 ; lexer_290(D)->column, tmp616
 ; ./asm_test/win/i/all.c:1328:         size_t start = lexer->position - 1;
	leaq	-1(%rsi), %r9	 ;, start
 ; ./asm_test/win/i/all.c:1329:         size_t column_start = lexer->column - 1;
	decq	%rdi	 ; column_start
.L980:
	cmpb	$57, %al	 ;, c
	jg	.L981	 ;,
	cmpb	$47, %al	 ;, c
	jle	.L983	 ;,
.L982:
 ; ./asm_test/win/i/all.c:1331:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
	jmp	.L980	 ;
.L981:
	subl	$65, %eax	 ;, _253
	cmpb	$57, %al	 ;, _253
	ja	.L983	 ;,
	btq	%rax, %r10	 ; _253, tmp365
	jc	.L982	 ;,
.L983:
 ; ./asm_test/win/i/all.c:1314:         lexer->position -= (size_t)(-count);
	movq	16(%rbx), %rdx	 ; lexer_290(D)->position, _461
 ; ./asm_test/win/i/all.c:1315:         lexer->column -= (size_t)(-count);
	decq	40(%rbx)	 ; lexer_290(D)->column
 ; ./asm_test/win/i/all.c:1333:         char* content = create_string_check(&lexer->source[start], lexer->position - start, 1);
	movl	$1, %r8d	 ;,
	movq	8(%rbx), %rcx	 ; lexer_290(D)->source, start
 ; ./asm_test/win/i/all.c:1314:         lexer->position -= (size_t)(-count);
	leaq	-1(%rdx), %rax	 ;, tmp372
 ; ./asm_test/win/i/all.c:1333:         char* content = create_string_check(&lexer->source[start], lexer->position - start, 1);
	subq	%rsi, %rdx	 ; pretmp_499, tmp373
 ; ./asm_test/win/i/all.c:1314:         lexer->position -= (size_t)(-count);
	movq	%rax, 16(%rbx)	 ; tmp372, lexer_290(D)->position
 ; ./asm_test/win/i/all.c:1333:         char* content = create_string_check(&lexer->source[start], lexer->position - start, 1);
	addq	%r9, %rcx	 ; start, start
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:649:     if (!initialized) init();
	cmpb	$0, initialized(%rip)	 ;, initialized
 ; ./asm_test/win/i/all.c:1333:         char* content = create_string_check(&lexer->source[start], lexer->position - start, 1);
	movq	%rax, %rdx	 ; tmp595, content
 ; ./asm_test/win/i/all.c:649:     if (!initialized) init();
	jne	.L985	 ;,
	movq	%rax, 48(%rsp)	 ; content, %sfp
 ; ./asm_test/win/i/all.c:649:     if (!initialized) init();
	call	init	 ;
	movq	48(%rsp), %rdx	 ; %sfp, content
.L985:
 ; ./asm_test/win/i/all.c:650:     for (size_t i = 0; i < 22; ++i)
	xorl	%eax, %eax	 ; i
 ; ./asm_test/win/i/all.c:651:         if (str == keywordList[i])
	leaq	keywordList(%rip), %rcx	 ;, tmp376
.L987:
 ; ./asm_test/win/i/all.c:651:         if (str == keywordList[i])
	cmpq	(%rcx,%rax,8), %rdx	 ; MEM[(char * *)&keywordList + i_23 * 8], content
	je	.L1051	 ;,
 ; ./asm_test/win/i/all.c:650:     for (size_t i = 0; i < 22; ++i)
	incq	%rax	 ; i
 ; ./asm_test/win/i/all.c:650:     for (size_t i = 0; i < 22; ++i)
	cmpq	$22, %rax	 ;, i
	jne	.L987	 ;,
 ; ./asm_test/win/i/all.c:653:     return 0;
	xorl	%eax, %eax	 ; _460
	jmp	.L986	 ;
.L1051:
 ; ./asm_test/win/i/all.c:652:             return 1;
	movb	$1, %al	 ;, _460
.L986:
 ; ./asm_test/win/i/all.c:1335:             return create_token(KEYWORD, content, lexer->line, column_start);
	movq	32(%rbx), %r8	 ; lexer_290(D)->line, pretmp_28
	movq	%rdi, %r9	 ; column_start,
	movl	$6, %ecx	 ;,
 ; ./asm_test/win/i/all.c:1334:         if (is_keyword(content))
	testb	%al, %al	 ; _460
	jne	.L1153	 ;,
 ; ./asm_test/win/i/all.c:1337:             return create_token(IDENTIFIER, content, lexer->line, column_start);
	movl	$1, %ecx	 ;,
	jmp	.L1153	 ;
.L975:
 ; ./asm_test/win/i/all.c:1340:         size_t column_start = lexer->column - 1;
	movq	40(%rcx), %rax	 ; lexer_290(D)->column, tmp618
 ; ./asm_test/win/i/all.c:1339:         size_t start = lexer->position - 1;
	leaq	-1(%rsi), %r10	 ;, start
 ; ./asm_test/win/i/all.c:1340:         size_t column_start = lexer->column - 1;
	leaq	-1(%rax), %rdi	 ;, column_start
.L989:
 ; ./asm_test/win/i/all.c:1342:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1341:         while ('0' <= c && c <= '9')
	leal	-48(%rax), %edx	 ;, tmp378
	cmpb	$9, %dl	 ;, tmp378
	jbe	.L989	 ;,
 ; ./asm_test/win/i/all.c:1305:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rdx	 ; lexer_290(D)->position, _467
 ; ./asm_test/win/i/all.c:1333:         char* content = create_string_check(&lexer->source[start], lexer->position - start, 1);
	movq	8(%rbx), %r9	 ; lexer_290(D)->source, pretmp_511
 ; ./asm_test/win/i/all.c:1343:         TokenType type = INTEGER;
	movl	$2, %ebp	 ;, type
 ; ./asm_test/win/i/all.c:1305:     if (lexer->position >= lexer->length)
	cmpq	24(%rbx), %rdx	 ; lexer_290(D)->length, _467
	jnb	.L990	 ;,
 ; ./asm_test/win/i/all.c:1345:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$46, %al	 ;, c
	jne	.L990	 ;,
 ; ./asm_test/win/i/all.c:1345:         if (c == '.' && ('0' <= p && p <= '9')) {
	movb	(%r9,%rdx), %al	 ; *_470, *_470
	subl	$48, %eax	 ;, tmp379
 ; ./asm_test/win/i/all.c:1345:         if (c == '.' && ('0' <= p && p <= '9')) {
	cmpb	$9, %al	 ;, tmp379
	ja	.L990	 ;,
.L1151:
 ; ./asm_test/win/i/all.c:1348:                 c = get_current_char(lexer);
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1347:             while ('0' <= c && c <= '9')
	subl	$48, %eax	 ;, tmp381
	cmpb	$9, %al	 ;, tmp381
	ja	.L1159	 ;,
 ; ./asm_test/win/i/all.c:1348:                 c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	jmp	.L1151	 ;
.L1159:
 ; ./asm_test/win/i/all.c:1349:             type = FLOAT;
	movl	$3, %ebp	 ;, type
.L990:
 ; ./asm_test/win/i/all.c:1314:         lexer->position -= (size_t)(-count);
	movq	16(%rbx), %rdx	 ; lexer_290(D)->position, _473
 ; ./asm_test/win/i/all.c:1315:         lexer->column -= (size_t)(-count);
	decq	40(%rbx)	 ; lexer_290(D)->column
 ; ./asm_test/win/i/all.c:1352:         return create_token(type, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	leaq	(%r9,%r10), %rcx	 ;, tmp384
	movl	$1, %r8d	 ;,
 ; ./asm_test/win/i/all.c:1314:         lexer->position -= (size_t)(-count);
	leaq	-1(%rdx), %rax	 ;, tmp382
 ; ./asm_test/win/i/all.c:1352:         return create_token(type, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	subq	%rsi, %rdx	 ; pretmp_499, tmp383
 ; ./asm_test/win/i/all.c:1314:         lexer->position -= (size_t)(-count);
	movq	%rax, 16(%rbx)	 ; tmp382, lexer_290(D)->position
 ; ./asm_test/win/i/all.c:1352:         return create_token(type, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	movq	32(%rbx), %rbx	 ; lexer_290(D)->line, _39
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:1352:         return create_token(type, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	movq	%rdi, %r9	 ; column_start,
	movq	%rbx, %r8	 ; _39,
	movl	%ebp, %ecx	 ; type,
 ; ./asm_test/win/i/all.c:1352:         return create_token(type, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	movq	%rax, %rdx	 ; tmp599, _44
	jmp	.L1153	 ;
.L1161:
 ; ./asm_test/win/i/all.c:1357:         while (c != '"' && c != '\0' && c != '\n')
	btq	%rdi, %r9	 ; c, tmp589
	jnc	.L1160	 ;,
.L994:
 ; ./asm_test/win/i/all.c:1358:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
	movl	%eax, %edi	 ; tmp601, c
.L993:
 ; ./asm_test/win/i/all.c:1357:         while (c != '"' && c != '\0' && c != '\n')
	cmpb	$34, %dil	 ;, c
	ja	.L994	 ;,
	jmp	.L1161	 ;
.L1160:
 ; ./asm_test/win/i/all.c:1321:         return create_token(EOF_TOKEN, NULL, lexer->line, lexer->column);
	movq	32(%rbx), %r12	 ; lexer_290(D)->line, pretmp_514
 ; ./asm_test/win/i/all.c:1359:         if (c != '"') {
	cmpb	$34, %dil	 ;, c
	je	.L996	 ;,
 ; ./asm_test/win/i/all.c:1360:             fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: Unterminated string literal\n", lexer->filename, lexer->line + 1, start);
	movq	(%rbx), %r8	 ; lexer_290(D)->filename, _51
	movl	$2, %ecx	 ;,
	movq	%r8, 48(%rsp)	 ; _51, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:1360:             fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: Unterminated string literal\n", lexer->filename, lexer->line + 1, start);
	movq	%rsi, 32(%rsp)	 ; pretmp_499,
	movq	48(%rsp), %r8	 ; %sfp, _51
	leaq	1(%r12), %r9	 ;,
 ; ./asm_test/win/i/all.c:1360:             fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: Unterminated string literal\n", lexer->filename, lexer->line + 1, start);
	movq	%rax, %rcx	 ; tmp602, _52
 ; ./asm_test/win/i/all.c:1360:             fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: Unterminated string literal\n", lexer->filename, lexer->line + 1, start);
	leaq	.LC143(%rip), %rdx	 ;, tmp392
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1361:             if (c == '\n') (void)(lexer->line++), lexer->column = 0;
	cmpb	$10, %dil	 ;, c
	jne	.L996	 ;,
 ; ./asm_test/win/i/all.c:1361:             if (c == '\n') (void)(lexer->line++), lexer->column = 0;
	xorl	%r8d, %r8d	 ;
 ; ./asm_test/win/i/all.c:1361:             if (c == '\n') (void)(lexer->line++), lexer->column = 0;
	incq	32(%rbx)	 ; lexer_290(D)->line
 ; ./asm_test/win/i/all.c:1361:             if (c == '\n') (void)(lexer->line++), lexer->column = 0;
	movq	%r8, 40(%rbx)	 ;, lexer_290(D)->column
.L996:
 ; ./asm_test/win/i/all.c:1363:         if (lexer->position - start == 1)
	movq	16(%rbx), %rdx	 ; lexer_290(D)->position, _56
 ; ./asm_test/win/i/all.c:1364:             return create_token(STRING, create_string_check("\0", 1, 1), lexer->line, column_start);
	movq	32(%rbx), %rdi	 ; lexer_290(D)->line, pretmp_293
	movl	$1, %r8d	 ;,
	leaq	.LC144(%rip), %rcx	 ;, tmp394
 ; ./asm_test/win/i/all.c:1363:         if (lexer->position - start == 1)
	subq	%rsi, %rdx	 ; pretmp_499, _56
 ; ./asm_test/win/i/all.c:1363:         if (lexer->position - start == 1)
	cmpq	$1, %rdx	 ;, _56
	je	.L1155	 ;,
 ; ./asm_test/win/i/all.c:1365:         return create_token(STRING, create_string_check(&lexer->source[start], lexer->position - start - 1, 1), lexer->line, column_start);
	addq	8(%rbx), %rsi	 ; lexer_290(D)->source, pretmp_499
	decq	%rdx	 ; tmp395
	movl	$1, %r8d	 ;,
	movq	%rsi, %rcx	 ; pretmp_499, tmp396
.L1155:
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:1365:         return create_token(STRING, create_string_check(&lexer->source[start], lexer->position - start - 1, 1), lexer->line, column_start);
	movq	%rbp, %r9	 ; column_start,
	movq	%rdi, %r8	 ; pretmp_293,
	movl	$4, %ecx	 ;,
 ; ./asm_test/win/i/all.c:1365:         return create_token(STRING, create_string_check(&lexer->source[start], lexer->position - start - 1, 1), lexer->line, column_start);
	movq	%rax, %rdx	 ; tmp604, _63
	jmp	.L1153	 ;
.L977:
 ; ./asm_test/win/i/all.c:1305:     if (lexer->position >= lexer->length)
	movq	24(%rbx), %r9	 ; lexer_290(D)->length, _480
 ; ./asm_test/win/i/all.c:1306:         return '\0';
	xorl	%ecx, %ecx	 ; _484
 ; ./asm_test/win/i/all.c:1305:     if (lexer->position >= lexer->length)
	cmpq	%r9, %rsi	 ; _480, pretmp_499
	jnb	.L999	 ;,
 ; ./asm_test/win/i/all.c:1307:     return lexer->source[lexer->position];
	movq	8(%rbx), %rdx	 ; lexer_290(D)->source, lexer_290(D)->source
	movb	(%rdx,%rsi), %cl	 ; *_482, _484
.L999:
 ; ./asm_test/win/i/all.c:1368:         if (c == '/' && p == '/') {
	cmpb	$47, %al	 ;, c
	sete	%r8b	 ;, tmp399
 ; ./asm_test/win/i/all.c:1368:         if (c == '/' && p == '/') {
	cmpb	$47, %cl	 ;, _484
	jne	.L1000	 ;,
	testb	%r8b, %r8b	 ; tmp399
	je	.L1000	 ;,
 ; ./asm_test/win/i/all.c:1370:             size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rbp	 ; lexer_290(D)->column, _68
.L1001:
 ; ./asm_test/win/i/all.c:1372:                 c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1371:             while (c != '\n' && c != '\0')
	cmpb	$10, %al	 ;, c
	je	.L1058	 ;,
	testb	%al, %al	 ; c
	jne	.L1001	 ;,
.L1058:
 ; ./asm_test/win/i/all.c:1314:         lexer->position -= (size_t)(-count);
	movq	16(%rbx), %rax	 ; lexer_290(D)->position, tmp622
 ; ./asm_test/win/i/all.c:1315:         lexer->column -= (size_t)(-count);
	decq	40(%rbx)	 ; lexer_290(D)->column
 ; ./asm_test/win/i/all.c:1314:         lexer->position -= (size_t)(-count);
	leaq	-1(%rax), %rdx	 ;, _488
	movq	%rdx, 16(%rbx)	 ; _488, lexer_290(D)->position
 ; ./asm_test/win/i/all.c:1374:             if (skip_comment)
	testb	%dil, %dil	 ; skip_comment
	jne	.L1047	 ;,
 ; ./asm_test/win/i/all.c:1369:             size_t start = lexer->position + 1;
	leaq	1(%rsi), %rcx	 ;, start
 ; ./asm_test/win/i/all.c:1376:             return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	movl	$1, %r8d	 ;,
	movq	32(%rbx), %rsi	 ; lexer_290(D)->line, _73
	subq	%rcx, %rdx	 ; start, tmp408
	addq	8(%rbx), %rcx	 ; lexer_290(D)->source, tmp409
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:1376:             return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	leaq	-1(%rbp), %r9	 ;,
 ; ./asm_test/win/i/all.c:1376:             return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	movq	%rax, %rdx	 ; tmp606, _78
	jmp	.L1156	 ;
.L1000:
 ; ./asm_test/win/i/all.c:1377:         } else if (c == '/' && p == '*') {
	cmpb	$42, %cl	 ;, _484
	jne	.L1004	 ;,
	testb	%r8b, %r8b	 ; tmp399
	je	.L1004	 ;,
 ; ./asm_test/win/i/all.c:1379:             size_t column_start = lexer->column - 1;
	movq	40(%rbx), %rax	 ; lexer_290(D)->column, tmp623
 ; ./asm_test/win/i/all.c:1378:             size_t start = lexer->position + 1;
	leaq	1(%rsi), %rbp	 ;, start
 ; ./asm_test/win/i/all.c:1367:         char p = peek_next_char(lexer);
	movb	$42, %dl	 ;, p
 ; ./asm_test/win/i/all.c:1379:             size_t column_start = lexer->column - 1;
	leaq	-1(%rax), %r12	 ;, column_start
 ; ./asm_test/win/i/all.c:1319:     char c = get_current_char(lexer);
	movb	$47, %al	 ;, c
.L1005:
 ; ./asm_test/win/i/all.c:1380:             while (!(c == '*' && p == '/')) {
	cmpb	$42, %al	 ;, c
	je	.L1162	 ;,
.L1010:
 ; ./asm_test/win/i/all.c:1381:                 c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1305:     if (lexer->position >= lexer->length)
	movq	16(%rbx), %rdx	 ; lexer_290(D)->position, _491
 ; ./asm_test/win/i/all.c:1305:     if (lexer->position >= lexer->length)
	cmpq	%r9, %rdx	 ; _480, _491
	jnb	.L1006	 ;,
 ; ./asm_test/win/i/all.c:1307:     return lexer->source[lexer->position];
	movq	8(%rbx), %rcx	 ; lexer_290(D)->source, lexer_290(D)->source
	movb	(%rcx,%rdx), %dl	 ; *_494, p
 ; ./asm_test/win/i/all.c:1383:                 if (c == '\n') (void)(lexer->line++), lexer->column = 0;
	cmpb	$10, %al	 ;, c
	jne	.L1007	 ;,
	jmp	.L1046	 ;
.L1006:
	cmpb	$10, %al	 ;, c
	jne	.L1008	 ;,
 ; ./asm_test/win/i/all.c:1306:         return '\0';
	xorl	%edx, %edx	 ; p
.L1046:
 ; ./asm_test/win/i/all.c:1383:                 if (c == '\n') (void)(lexer->line++), lexer->column = 0;
	xorl	%ecx, %ecx	 ;
 ; ./asm_test/win/i/all.c:1383:                 if (c == '\n') (void)(lexer->line++), lexer->column = 0;
	incq	32(%rbx)	 ; lexer_290(D)->line
 ; ./asm_test/win/i/all.c:1383:                 if (c == '\n') (void)(lexer->line++), lexer->column = 0;
	movq	%rcx, 40(%rbx)	 ;, lexer_290(D)->column
.L1007:
 ; ./asm_test/win/i/all.c:1384:                 if (p == '\0') break;
	testb	%dl, %dl	 ; p
	je	.L1008	 ;,
 ; ./asm_test/win/i/all.c:1385:                 if (c == '\0') {
	testb	%al, %al	 ; c
	jne	.L1005	 ;,
	jmp	.L1050	 ;
.L1162:
 ; ./asm_test/win/i/all.c:1380:             while (!(c == '*' && p == '/')) {
	cmpb	$47, %dl	 ;, p
	jne	.L1010	 ;,
	jmp	.L1163	 ;
.L1008:
 ; ./asm_test/win/i/all.c:1393:                 if (c == '\0') move_position(lexer, -1);
	testb	%al, %al	 ; c
	jne	.L1050	 ;,
 ; ./asm_test/win/i/all.c:1314:         lexer->position -= (size_t)(-count);
	decq	16(%rbx)	 ; lexer_290(D)->position
 ; ./asm_test/win/i/all.c:1315:         lexer->column -= (size_t)(-count);
	decq	40(%rbx)	 ; lexer_290(D)->column
.L1050:
 ; ./asm_test/win/i/all.c:1394:                 fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: Unterminated comment\n", lexer->filename, lexer->line + 1, start + 1);
	movq	32(%rbx), %rax	 ; lexer_290(D)->line, tmp627
	movq	(%rbx), %r8	 ; lexer_290(D)->filename, _103
	addq	$2, %rsi	 ;, tmp431
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %r9	 ;, _102
	movq	%r8, 48(%rsp)	 ; _103, %sfp
	movq	%r9, 56(%rsp)	 ; _102, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:1394:                 fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: Unterminated comment\n", lexer->filename, lexer->line + 1, start + 1);
	movq	%rsi, 32(%rsp)	 ; tmp431,
	movq	56(%rsp), %r9	 ; %sfp, _102
	leaq	.LC145(%rip), %rdx	 ;, tmp432
	movq	48(%rsp), %r8	 ; %sfp, _103
 ; ./asm_test/win/i/all.c:1394:                 fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: Unterminated comment\n", lexer->filename, lexer->line + 1, start + 1);
	movq	%rax, %rcx	 ; tmp610, _104
 ; ./asm_test/win/i/all.c:1394:                 fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: Unterminated comment\n", lexer->filename, lexer->line + 1, start + 1);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1395:                 if (skip_comment)
	testb	%dil, %dil	 ; skip_comment
	jne	.L1047	 ;,
 ; ./asm_test/win/i/all.c:1397:                 return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
	movq	32(%rbx), %rsi	 ; lexer_290(D)->line, _106
	movq	16(%rbx), %rdx	 ; lexer_290(D)->position, tmp434
	jmp	.L1157	 ;
.L1047:
 ; ./asm_test/win/i/all.c:1479: }
	addq	$64, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1401:                 return next_token(lexer, skip_comment);
	movsbl	%dil, %edx	 ; skip_comment, skip_comment
	movq	%rbx, %rcx	 ; lexer,
 ; ./asm_test/win/i/all.c:1479: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; ./asm_test/win/i/all.c:1401:                 return next_token(lexer, skip_comment);
	jmp	next_token	 ;
.L1163:
 ; ./asm_test/win/i/all.c:1399:             c = get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1400:             if (skip_comment)
	testb	%dil, %dil	 ; skip_comment
	jne	.L1047	 ;,
 ; ./asm_test/win/i/all.c:1402:             return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start - 2, 1), lexer->line, column_start);
	movq	16(%rbx), %rax	 ; lexer_290(D)->position, tmp630
	movq	32(%rbx), %rsi	 ; lexer_290(D)->line, _113
	leaq	-2(%rax), %rdx	 ;, tmp439
.L1157:
	movq	8(%rbx), %rcx	 ; lexer_290(D)->source, start
	subq	%rbp, %rdx	 ; start, tmp441
	movl	$1, %r8d	 ;,
	addq	%rbp, %rcx	 ; start, start
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:1402:             return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start - 2, 1), lexer->line, column_start);
	movq	%r12, %r9	 ; column_start,
 ; ./asm_test/win/i/all.c:1402:             return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start - 2, 1), lexer->line, column_start);
	movq	%rax, %rdx	 ; tmp612, _119
.L1156:
 ; ./asm_test/win/i/all.c:1402:             return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start - 2, 1), lexer->line, column_start);
	movq	%rsi, %r8	 ; _113,
	movl	$7, %ecx	 ;,
	jmp	.L1153	 ;
.L1004:
 ; ./asm_test/win/i/all.c:1403:         } else if (c == '=' && p == '=') {
	cmpb	$61, %cl	 ;, _484
	sete	%dl	 ;, tmp444
 ; ./asm_test/win/i/all.c:1403:         } else if (c == '=' && p == '=') {
	cmpb	$61, %al	 ;, c
	jne	.L1013	 ;,
	testb	%dl, %dl	 ; tmp444
	je	.L1013	 ;,
 ; ./asm_test/win/i/all.c:1404:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1405:             return create_token(SYMBOL, symbolList[19], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_290(D)->column, lexer_290(D)->column
	movq	32(%rbx), %r8	 ; lexer_290(D)->line,
	movq	152+symbolList(%rip), %rdx	 ; symbolList[19],
	leaq	-2(%rax), %r9	 ;,
	jmp	.L1154	 ;
.L1013:
 ; ./asm_test/win/i/all.c:1406:         } else if (c == '!' && p == '=') {
	cmpb	$33, %al	 ;, c
	jne	.L1014	 ;,
	testb	%dl, %dl	 ; tmp444
	je	.L1014	 ;,
 ; ./asm_test/win/i/all.c:1407:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1408:             return create_token(SYMBOL, symbolList[20], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_290(D)->column, lexer_290(D)->column
	movq	32(%rbx), %r8	 ; lexer_290(D)->line,
	movq	160+symbolList(%rip), %rdx	 ; symbolList[20],
	leaq	-2(%rax), %r9	 ;,
	jmp	.L1154	 ;
.L1014:
 ; ./asm_test/win/i/all.c:1409:         } else if (c == '<' && p == '=') {
	cmpb	$60, %al	 ;, c
	jne	.L1015	 ;,
	testb	%dl, %dl	 ; tmp444
	je	.L1015	 ;,
 ; ./asm_test/win/i/all.c:1410:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1411:             return create_token(SYMBOL, symbolList[21], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_290(D)->column, lexer_290(D)->column
	movq	32(%rbx), %r8	 ; lexer_290(D)->line,
	movq	168+symbolList(%rip), %rdx	 ; symbolList[21],
	leaq	-2(%rax), %r9	 ;,
	jmp	.L1154	 ;
.L1015:
 ; ./asm_test/win/i/all.c:1412:         } else if (c == '>' && p == '=') {
	cmpb	$62, %al	 ;, c
	jne	.L1016	 ;,
	testb	%dl, %dl	 ; tmp444
	je	.L1016	 ;,
 ; ./asm_test/win/i/all.c:1413:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1414:             return create_token(SYMBOL, symbolList[22], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_290(D)->column, lexer_290(D)->column
	movq	32(%rbx), %r8	 ; lexer_290(D)->line,
	movq	176+symbolList(%rip), %rdx	 ; symbolList[22],
	leaq	-2(%rax), %r9	 ;,
	jmp	.L1154	 ;
.L1016:
 ; ./asm_test/win/i/all.c:1415:         } else if (c == '+' && p == '=') {
	cmpb	$43, %al	 ;, c
	jne	.L1017	 ;,
	testb	%dl, %dl	 ; tmp444
	je	.L1017	 ;,
 ; ./asm_test/win/i/all.c:1416:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1417:             return create_token(SYMBOL, symbolList[23], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_290(D)->column, lexer_290(D)->column
	movq	32(%rbx), %r8	 ; lexer_290(D)->line,
	movq	184+symbolList(%rip), %rdx	 ; symbolList[23],
	leaq	-2(%rax), %r9	 ;,
	jmp	.L1154	 ;
.L1017:
 ; ./asm_test/win/i/all.c:1418:         } else if (c == '-' && p == '=') {
	cmpb	$45, %al	 ;, c
	jne	.L1018	 ;,
	testb	%dl, %dl	 ; tmp444
	je	.L1018	 ;,
 ; ./asm_test/win/i/all.c:1419:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1420:             return create_token(SYMBOL, symbolList[24], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_290(D)->column, lexer_290(D)->column
	movq	32(%rbx), %r8	 ; lexer_290(D)->line,
	movq	192+symbolList(%rip), %rdx	 ; symbolList[24],
	leaq	-2(%rax), %r9	 ;,
	jmp	.L1154	 ;
.L1018:
 ; ./asm_test/win/i/all.c:1421:         } else if (c == '*' && p == '=') {
	cmpb	$42, %al	 ;, c
	jne	.L1019	 ;,
	testb	%dl, %dl	 ; tmp444
	je	.L1019	 ;,
 ; ./asm_test/win/i/all.c:1422:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1423:             return create_token(SYMBOL, symbolList[25], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_290(D)->column, lexer_290(D)->column
	movq	32(%rbx), %r8	 ; lexer_290(D)->line,
	movq	200+symbolList(%rip), %rdx	 ; symbolList[25],
	leaq	-2(%rax), %r9	 ;,
	jmp	.L1154	 ;
.L1019:
 ; ./asm_test/win/i/all.c:1424:         } else if (c == '/' && p == '=') {
	testb	%r8b, %r8b	 ; tmp399
	je	.L1020	 ;,
	testb	%dl, %dl	 ; tmp444
	je	.L1020	 ;,
 ; ./asm_test/win/i/all.c:1425:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1426:             return create_token(SYMBOL, symbolList[26], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_290(D)->column, lexer_290(D)->column
	movq	32(%rbx), %r8	 ; lexer_290(D)->line,
	movq	208+symbolList(%rip), %rdx	 ; symbolList[26],
	leaq	-2(%rax), %r9	 ;,
	jmp	.L1154	 ;
.L1020:
 ; ./asm_test/win/i/all.c:1427:         } else if (c == '%' && p == '=') {
	cmpb	$37, %al	 ;, c
	jne	.L1021	 ;,
	testb	%dl, %dl	 ; tmp444
	je	.L1021	 ;,
 ; ./asm_test/win/i/all.c:1428:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1429:             return create_token(SYMBOL, symbolList[27], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_290(D)->column, lexer_290(D)->column
	movq	32(%rbx), %r8	 ; lexer_290(D)->line,
	movq	216+symbolList(%rip), %rdx	 ; symbolList[27],
	leaq	-2(%rax), %r9	 ;,
	jmp	.L1154	 ;
.L1021:
 ; ./asm_test/win/i/all.c:1430:         } else if (c == '&' && p == '&') {
	cmpb	$38, %al	 ;, c
	jne	.L1022	 ;,
	cmpb	$38, %cl	 ;, _484
	jne	.L1022	 ;,
 ; ./asm_test/win/i/all.c:1431:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1432:             return create_token(SYMBOL, symbolList[28], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_290(D)->column, lexer_290(D)->column
	movq	32(%rbx), %r8	 ; lexer_290(D)->line,
	movq	224+symbolList(%rip), %rdx	 ; symbolList[28],
	leaq	-2(%rax), %r9	 ;,
	jmp	.L1154	 ;
.L1022:
 ; ./asm_test/win/i/all.c:1433:         } else if (c == '|' && p == '|') {
	cmpb	$124, %al	 ;, c
	jne	.L1023	 ;,
	cmpb	$124, %cl	 ;, _484
	jne	.L1023	 ;,
 ; ./asm_test/win/i/all.c:1434:             get_current_char(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	get_current_char	 ;
 ; ./asm_test/win/i/all.c:1435:             return create_token(SYMBOL, symbolList[29], lexer->line, lexer->column - 2);
	movq	40(%rbx), %rax	 ; lexer_290(D)->column, lexer_290(D)->column
	movq	32(%rbx), %r8	 ; lexer_290(D)->line,
	movq	232+symbolList(%rip), %rdx	 ; symbolList[29],
	leaq	-2(%rax), %r9	 ;,
	jmp	.L1154	 ;
.L1023:
 ; ./asm_test/win/i/all.c:1321:         return create_token(EOF_TOKEN, NULL, lexer->line, lexer->column);
	movq	40(%rbx), %rsi	 ; lexer_290(D)->column, pretmp_372
	movq	32(%rbx), %r8	 ; lexer_290(D)->line, pretmp_498
	cmpb	$62, %al	 ;, c
	jg	.L1024	 ;,
	cmpb	$32, %al	 ;, c
	jle	.L1025	 ;,
	subl	$33, %eax	 ;, tmp524
	cmpb	$29, %al	 ;, tmp524
	ja	.L1025	 ;,
	leaq	.L1027(%rip), %rdx	 ;, tmp526
	movzbl	%al, %eax	 ; tmp524, tmp525
	movslq	(%rdx,%rax,4), %rax	 ;, tmp528
	addq	%rdx, %rax	 ; tmp526, tmp529
	jmp	*%rax	 ; tmp529
	.section .rdata,"dr"
	.align 4
.L1027:
	.long	.L1040-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1039-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1038-.L1027
	.long	.L1037-.L1027
	.long	.L1036-.L1027
	.long	.L1035-.L1027
	.long	.L1034-.L1027
	.long	.L1033-.L1027
	.long	.L1032-.L1027
	.long	.L1031-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1025-.L1027
	.long	.L1030-.L1027
	.long	.L1029-.L1027
	.long	.L1028-.L1027
	.long	.L1026-.L1027
	.text
.L1024:
	cmpb	$123, %al	 ;, c
	je	.L1041	 ;,
	jg	.L1042	 ;,
	cmpb	$91, %al	 ;, c
	je	.L1043	 ;,
	cmpb	$93, %al	 ;, c
	jne	.L1025	 ;,
 ; ./asm_test/win/i/all.c:1453:             return create_token(SYMBOL, symbolList[8], lexer->line, lexer->column - 1);
	movq	64+symbolList(%rip), %rdx	 ; symbolList[8],
	leaq	-1(%rsi), %r9	 ;,
	jmp	.L1154	 ;
.L1042:
	cmpb	$125, %al	 ;, c
	jne	.L1025	 ;,
 ; ./asm_test/win/i/all.c:1443:             return create_token(SYMBOL, symbolList[3], lexer->line, lexer->column - 1);
	movq	24+symbolList(%rip), %rdx	 ; symbolList[3],
	leaq	-1(%rsi), %r9	 ;,
	jmp	.L1154	 ;
.L1038:
 ; ./asm_test/win/i/all.c:1437:             return create_token(SYMBOL, symbolList[0], lexer->line, lexer->column - 1);
	movq	symbolList(%rip), %rdx	 ; symbolList[0],
	leaq	-1(%rsi), %r9	 ;,
	jmp	.L1154	 ;
.L1037:
 ; ./asm_test/win/i/all.c:1439:             return create_token(SYMBOL, symbolList[1], lexer->line, lexer->column - 1);
	movq	8+symbolList(%rip), %rdx	 ; symbolList[1],
	leaq	-1(%rsi), %r9	 ;,
	jmp	.L1154	 ;
.L1041:
 ; ./asm_test/win/i/all.c:1441:             return create_token(SYMBOL, symbolList[2], lexer->line, lexer->column - 1);
	movq	16+symbolList(%rip), %rdx	 ; symbolList[2],
	leaq	-1(%rsi), %r9	 ;,
	jmp	.L1154	 ;
.L1034:
 ; ./asm_test/win/i/all.c:1445:             return create_token(SYMBOL, symbolList[4], lexer->line, lexer->column - 1);
	movq	32+symbolList(%rip), %rdx	 ; symbolList[4],
	leaq	-1(%rsi), %r9	 ;,
	jmp	.L1154	 ;
.L1040:
 ; ./asm_test/win/i/all.c:1447:             return create_token(SYMBOL, symbolList[5], lexer->line, lexer->column - 1);
	movq	40+symbolList(%rip), %rdx	 ; symbolList[5],
	leaq	-1(%rsi), %r9	 ;,
	jmp	.L1154	 ;
.L1032:
 ; ./asm_test/win/i/all.c:1449:             return create_token(SYMBOL, symbolList[6], lexer->line, lexer->column - 1);
	movq	48+symbolList(%rip), %rdx	 ; symbolList[6],
	leaq	-1(%rsi), %r9	 ;,
	jmp	.L1154	 ;
.L1043:
 ; ./asm_test/win/i/all.c:1451:             return create_token(SYMBOL, symbolList[7], lexer->line, lexer->column - 1);
	movq	56+symbolList(%rip), %rdx	 ; symbolList[7],
	leaq	-1(%rsi), %r9	 ;,
	jmp	.L1154	 ;
.L1030:
 ; ./asm_test/win/i/all.c:1455:             return create_token(SYMBOL, symbolList[9], lexer->line, lexer->column - 1);
	movq	72+symbolList(%rip), %rdx	 ; symbolList[9],
	leaq	-1(%rsi), %r9	 ;,
	jmp	.L1154	 ;
.L1035:
 ; ./asm_test/win/i/all.c:1459:             return create_token(SYMBOL, symbolList[11], lexer->line, lexer->column - 1);
	movq	88+symbolList(%rip), %rdx	 ; symbolList[11],
	leaq	-1(%rsi), %r9	 ;,
	jmp	.L1154	 ;
.L1033:
 ; ./asm_test/win/i/all.c:1461:             return create_token(SYMBOL, symbolList[12], lexer->line, lexer->column - 1);
	movq	96+symbolList(%rip), %rdx	 ; symbolList[12],
	leaq	-1(%rsi), %r9	 ;,
	jmp	.L1154	 ;
.L1036:
 ; ./asm_test/win/i/all.c:1463:             return create_token(SYMBOL, symbolList[13], lexer->line, lexer->column - 1);
	movq	104+symbolList(%rip), %rdx	 ; symbolList[13],
	leaq	-1(%rsi), %r9	 ;,
	jmp	.L1154	 ;
.L1031:
 ; ./asm_test/win/i/all.c:1465:             return create_token(SYMBOL, symbolList[14], lexer->line, lexer->column - 1);
	movq	112+symbolList(%rip), %rdx	 ; symbolList[14],
	leaq	-1(%rsi), %r9	 ;,
	jmp	.L1154	 ;
.L1039:
 ; ./asm_test/win/i/all.c:1467:             return create_token(SYMBOL, symbolList[15], lexer->line, lexer->column - 1);
	movq	120+symbolList(%rip), %rdx	 ; symbolList[15],
	leaq	-1(%rsi), %r9	 ;,
	jmp	.L1154	 ;
.L1029:
 ; ./asm_test/win/i/all.c:1469:             return create_token(SYMBOL, symbolList[16], lexer->line, lexer->column - 1);
	movq	128+symbolList(%rip), %rdx	 ; symbolList[16],
	leaq	-1(%rsi), %r9	 ;,
	jmp	.L1154	 ;
.L1026:
 ; ./asm_test/win/i/all.c:1471:             return create_token(SYMBOL, symbolList[17], lexer->line, lexer->column - 1);
	movq	136+symbolList(%rip), %rdx	 ; symbolList[17],
	leaq	-1(%rsi), %r9	 ;,
	jmp	.L1154	 ;
.L1028:
 ; ./asm_test/win/i/all.c:1473:             return create_token(SYMBOL, symbolList[18], lexer->line, lexer->column - 1);
	movq	144+symbolList(%rip), %rdx	 ; symbolList[18],
	leaq	-1(%rsi), %r9	 ;,
.L1154:
	movl	$5, %ecx	 ;,
	jmp	.L1153	 ;
.L1025:
	movq	%r8, 48(%rsp)	 ; pretmp_498, %sfp
 ; ./asm_test/win/i/all.c:1475:             fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: Unexpected character\n", lexer->filename, lexer->line + 1, lexer->column);
	movq	(%rbx), %rbx	 ; lexer_290(D)->filename, _264
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:1475:             fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: Unexpected character\n", lexer->filename, lexer->line + 1, lexer->column);
	movq	48(%rsp), %r8	 ; %sfp, pretmp_498
	movq	%rsi, 32(%rsp)	 ; pretmp_372,
	leaq	.LC146(%rip), %rdx	 ;, tmp586
 ; ./asm_test/win/i/all.c:1475:             fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: Unexpected character\n", lexer->filename, lexer->line + 1, lexer->column);
	movq	%rax, %rcx	 ; tmp613, _265
 ; ./asm_test/win/i/all.c:1475:             fprintf(stderr, "[Lexer Error] at %s:%zu:%zu: Unexpected character\n", lexer->filename, lexer->line + 1, lexer->column);
	leaq	1(%r8), %r9	 ;,
	movq	%rbx, %r8	 ; _264,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1476:             return create_token(EOF_TOKEN, NULL, 0, 0);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
.L1152:
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
.L1153:
 ; ./asm_test/win/i/all.c:1479: }
	addq	$64, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; ./asm_test/win/i/all.c:1476:             return create_token(EOF_TOKEN, NULL, 0, 0);
	jmp	create_token	 ;
	.def	get_next_token;	.scl	3;	.type	32;	.endef
get_next_token:
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp95, lexer
	subq	$32, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1481:     if (lexer->peeked_token != NULL) {
	movq	48(%rcx), %rax	 ; lexer_8(D)->peeked_token, <retval>
 ; ./asm_test/win/i/all.c:1481:     if (lexer->peeked_token != NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L1165	 ;,
 ; ./asm_test/win/i/all.c:1483:         lexer->position = lexer->peeked_position;
	movq	56(%rcx), %rdx	 ; lexer_8(D)->peeked_position, lexer_8(D)->peeked_position
 ; ./asm_test/win/i/all.c:1482:         lexer->current_token = lexer->peeked_token;
	movq	%rax, 80(%rcx)	 ; <retval>, lexer_8(D)->current_token
 ; ./asm_test/win/i/all.c:1483:         lexer->position = lexer->peeked_position;
	movq	%rdx, 16(%rcx)	 ; lexer_8(D)->peeked_position, lexer_8(D)->position
 ; ./asm_test/win/i/all.c:1484:         lexer->line = lexer->peeked_line;
	movq	64(%rcx), %rdx	 ; lexer_8(D)->peeked_line, lexer_8(D)->peeked_line
	movq	%rdx, 32(%rcx)	 ; lexer_8(D)->peeked_line, lexer_8(D)->line
 ; ./asm_test/win/i/all.c:1485:         lexer->column = lexer->peeked_column;
	movq	72(%rcx), %rdx	 ; lexer_8(D)->peeked_column, lexer_8(D)->peeked_column
	movq	%rdx, 40(%rcx)	 ; lexer_8(D)->peeked_column, lexer_8(D)->column
 ; ./asm_test/win/i/all.c:1486:         lexer->peeked_token = 0;
	xorl	%edx, %edx	 ;
	movq	%rdx, 48(%rcx)	 ;, lexer_8(D)->peeked_token
 ; ./asm_test/win/i/all.c:1487:         return lexer->current_token;
	jmp	.L1164	 ;
.L1165:
 ; ./asm_test/win/i/all.c:1489:     Token* token = next_token(lexer, skip_comment);
	movsbl	%dl, %edx	 ; skip_comment, skip_comment
	call	next_token	 ;
 ; ./asm_test/win/i/all.c:1490:     return lexer->current_token = token;
	movq	%rax, 80(%rbx)	 ; <retval>, lexer_8(D)->current_token
.L1164:
 ; ./asm_test/win/i/all.c:1491: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
	.def	peek_next_token.constprop.0;	.scl	3;	.type	32;	.endef
peek_next_token.constprop.0:
 ; ./asm_test/win/i/all.c:1493:     if (lexer->peeked_token != NULL)
	movq	48(%rcx), %rax	 ; lexer_1(D)->peeked_token, <retval>
 ; ./asm_test/win/i/all.c:1493:     if (lexer->peeked_token != NULL)
	testq	%rax, %rax	 ; <retval>
	jne	.L1171	 ;,
 ; ./asm_test/win/i/all.c:1492: Token* peek_next_token(Lexer* lexer, char skip_comment) {
	pushq	%rbp	 ;
 ; ./asm_test/win/i/all.c:1498:     Token* token = get_next_token(lexer, skip_comment);
	movl	$1, %edx	 ;,
 ; ./asm_test/win/i/all.c:1492: Token* peek_next_token(Lexer* lexer, char skip_comment) {
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp94, lexer
	subq	$40, %rsp	 ;,
 ; ./asm_test/win/i/all.c:1495:     size_t saved_position = lexer->position;
	movq	16(%rcx), %rbp	 ; lexer_1(D)->position, saved_position
 ; ./asm_test/win/i/all.c:1496:     size_t saved_line = lexer->line;
	movq	32(%rcx), %rdi	 ; lexer_1(D)->line, saved_line
 ; ./asm_test/win/i/all.c:1497:     size_t saved_column = lexer->column;
	movq	40(%rcx), %rsi	 ; lexer_1(D)->column, saved_column
 ; ./asm_test/win/i/all.c:1498:     Token* token = get_next_token(lexer, skip_comment);
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:1499:     lexer->peeked_position = lexer->position;
	movq	16(%rbx), %rdx	 ; lexer_1(D)->position, lexer_1(D)->position
 ; ./asm_test/win/i/all.c:1502:     lexer->position = saved_position;
	movq	%rbp, 16(%rbx)	 ; saved_position, lexer_1(D)->position
 ; ./asm_test/win/i/all.c:1505:     lexer->peeked_token = token;
	movq	%rax, 48(%rbx)	 ; <retval>, lexer_1(D)->peeked_token
 ; ./asm_test/win/i/all.c:1499:     lexer->peeked_position = lexer->position;
	movq	%rdx, 56(%rbx)	 ; lexer_1(D)->position, lexer_1(D)->peeked_position
 ; ./asm_test/win/i/all.c:1500:     lexer->peeked_line = lexer->line;
	movq	32(%rbx), %rdx	 ; lexer_1(D)->line, lexer_1(D)->line
 ; ./asm_test/win/i/all.c:1503:     lexer->line = saved_line;
	movq	%rdi, 32(%rbx)	 ; saved_line, lexer_1(D)->line
 ; ./asm_test/win/i/all.c:1500:     lexer->peeked_line = lexer->line;
	movq	%rdx, 64(%rbx)	 ; lexer_1(D)->line, lexer_1(D)->peeked_line
 ; ./asm_test/win/i/all.c:1501:     lexer->peeked_column = lexer->column;
	movq	40(%rbx), %rdx	 ; lexer_1(D)->column, lexer_1(D)->column
 ; ./asm_test/win/i/all.c:1504:     lexer->column = saved_column;
	movq	%rsi, 40(%rbx)	 ; saved_column, lexer_1(D)->column
 ; ./asm_test/win/i/all.c:1501:     lexer->peeked_column = lexer->column;
	movq	%rdx, 72(%rbx)	 ; lexer_1(D)->column, lexer_1(D)->peeked_column
 ; ./asm_test/win/i/all.c:1507: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L1171:
	ret	
	.section .rdata,"dr"
.LC147:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse right operand\12\0"
	.text
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
parse_expr_prec:
	pushq	%r15	 ;
	leaq	CSWTCH.116(%rip), %r15	 ;, tmp137
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	movl	%r8d, %r12d	 ; tmp141, min_prec
	pushq	%rbp	 ;
	movq	%r9, %rbp	 ; tmp142, now_scope
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp140, expr_left
	subq	$72, %rsp	 ;,
 ; ./asm_test/win/i/all.c:2936: Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, SymbolTable* now_scope, Parser* parser) {
	movq	%rcx, 144(%rsp)	 ; tmp139, lexer
	movq	176(%rsp), %r13	 ; parser, parser
 ; ./asm_test/win/i/all.c:2938:     token = peek_next_token(lexer, 1);
	call	peek_next_token.constprop.0	 ;
.L1175:
 ; ./asm_test/win/i/all.c:2939:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_20->type
	jne	.L1174	 ;,
 ; ./asm_test/win/i/all.c:2940:         OperatorType op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_20->lexeme,
	xorl	%r14d, %r14d	 ; _66
	call	string_to_operator	 ;
	movl	%eax, %edi	 ; tmp144, op
	cmpl	$18, %eax	 ;, op
	ja	.L1176	 ;,
	movl	%eax, %eax	 ; op, op
	movsbl	(%r15,%rax), %r14d	 ; CSWTCH.116[op_32], _66
.L1176:
 ; ./asm_test/win/i/all.c:2942:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, %edi	 ;, op
	je	.L1174	 ;,
	cmpl	%r14d, %r12d	 ; _66, min_prec
	jg	.L1174	 ;,
 ; ./asm_test/win/i/all.c:2944:         token = get_next_token(lexer, 1);
	movq	144(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2945:         token = get_next_token(lexer, 1);
	movq	144(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2946:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	144(%rsp), %rcx	 ; lexer,
	movq	%r13, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
 ; ./asm_test/win/i/all.c:2945:         token = get_next_token(lexer, 1);
	movq	%rax, %rsi	 ; tmp145, token
 ; ./asm_test/win/i/all.c:2946:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp146, right_primary
 ; ./asm_test/win/i/all.c:2947:         if (right_primary == NULL) {
	testq	%rax, %rax	 ; right_primary
	jne	.L1178	 ;,
 ; ./asm_test/win/i/all.c:2948:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse right operand\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	 ; token_37->column, tmp156
	movq	8(%rsi), %r9	 ; token_37->line, token_37->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rbx	 ;, _6
	movq	0(%r13), %rax	 ; parser_39(D)->source_file, parser_39(D)->source_file
	incq	%r9	 ; _8
	movq	%r9, 56(%rsp)	 ; _8, %sfp
	movq	24(%rax), %r8	 ; _9->path, _10
	movq	%r8, 48(%rsp)	 ; _10, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2948:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse right operand\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _6,
	movq	56(%rsp), %r9	 ; %sfp, _8
	leaq	.LC147(%rip), %rdx	 ;, tmp126
	movq	48(%rsp), %r8	 ; %sfp, _10
 ; ./asm_test/win/i/all.c:2948:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse right operand\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp147, _11
 ; ./asm_test/win/i/all.c:2948:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse right operand\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2949:             return NULL;
	jmp	.L1179	 ;
.L1178:
 ; ./asm_test/win/i/all.c:2951:         Expression* right = create_expression(OP_NONE, NULL, right_primary, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rsi	 ; tmp148, right
.L1184:
 ; ./asm_test/win/i/all.c:2962:             token = peek_next_token(lexer, 1);
	movq	144(%rsp), %rcx	 ; lexer,
	call	peek_next_token.constprop.0	 ;
 ; ./asm_test/win/i/all.c:2953:         while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_19->type
	jne	.L1186	 ;,
 ; ./asm_test/win/i/all.c:2954:             OperatorType next_op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_19->lexeme,
	xorl	%r8d, %r8d	 ; _72
	call	string_to_operator	 ;
	cmpl	$18, %eax	 ;, next_op
	ja	.L1181	 ;,
	movl	%eax, %edx	 ; next_op, next_op
	movsbl	(%r15,%rdx), %r8d	 ; CSWTCH.116[next_op_46], _72
.L1181:
 ; ./asm_test/win/i/all.c:2956:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %eax	 ;, next_op
	je	.L1186	 ;,
	cmpl	%r8d, %r14d	 ; _72, _66
	jge	.L1186	 ;,
 ; ./asm_test/win/i/all.c:2958:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	%r13, 32(%rsp)	 ; parser,
	movq	144(%rsp), %rcx	 ; lexer,
	movq	%rsi, %rdx	 ; right,
	movq	%rbp, %r9	 ; now_scope,
	call	parse_expr_prec	 ;
	movq	%rax, %rsi	 ; tmp153, right
 ; ./asm_test/win/i/all.c:2959:             if (right == NULL) {
	testq	%rax, %rax	 ; right
	jne	.L1184	 ;,
.L1179:
 ; ./asm_test/win/i/all.c:2949:             return NULL;
	xorl	%ebx, %ebx	 ; <retval>
	jmp	.L1174	 ;
.L1186:
 ; ./asm_test/win/i/all.c:2964:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rbx, %rdx	 ; <retval>,
	movl	%edi, %ecx	 ; op,
	movq	%rsi, %r9	 ; right,
	xorl	%r8d, %r8d	 ;
	call	create_expression	 ;
 ; ./asm_test/win/i/all.c:2965:         token = peek_next_token(lexer, 1);
	movq	144(%rsp), %rcx	 ; lexer,
 ; ./asm_test/win/i/all.c:2964:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rax, %rbx	 ; tmp151, <retval>
 ; ./asm_test/win/i/all.c:2965:         token = peek_next_token(lexer, 1);
	call	peek_next_token.constprop.0	 ;
	jmp	.L1175	 ;
.L1174:
 ; ./asm_test/win/i/all.c:2969: }
	addq	$72, %rsp	 ;,
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
.LC148:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse expression primary\12\0"
	.text
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%rbp	 ;
	movq	%rdx, %rbp	 ; tmp102, now_scope
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp103, parser
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp101, lexer
	pushq	%rbx	 ;
	subq	$72, %rsp	 ;,
 ; ./asm_test/win/i/all.c:2971:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %rbx	 ; tmp104, <retval>
 ; ./asm_test/win/i/all.c:2972:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; <retval>
	jne	.L1192	 ;,
 ; ./asm_test/win/i/all.c:2973:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse expression primary\n", parser->source_file->path, lexer->current_token->line + 1, lexer->current_token->column + 1);
	movq	80(%rsi), %rax	 ; lexer_13(D)->current_token, _1
 ; ./asm_test/win/i/all.c:2973:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse expression primary\n", parser->source_file->path, lexer->current_token->line + 1, lexer->current_token->column + 1);
	movl	$2, %ecx	 ;,
	movq	16(%rax), %rsi	 ; _1->column, tmp109
	movq	8(%rax), %r9	 ; _1->line, _1->line
	movq	(%rdi), %rax	 ; parser_15(D)->source_file, parser_15(D)->source_file
	incq	%r9	 ; _5
	incq	%rsi	 ; _3
	movq	24(%rax), %r8	 ; _6->path, _7
	movq	%r9, 56(%rsp)	 ; _5, %sfp
	movq	%r8, 48(%rsp)	 ; _7, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2973:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse expression primary\n", parser->source_file->path, lexer->current_token->line + 1, lexer->current_token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _3,
	movq	56(%rsp), %r9	 ; %sfp, _5
	leaq	.LC148(%rip), %rdx	 ;, tmp99
	movq	48(%rsp), %r8	 ; %sfp, _7
 ; ./asm_test/win/i/all.c:2973:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse expression primary\n", parser->source_file->path, lexer->current_token->line + 1, lexer->current_token->column + 1);
	movq	%rax, %rcx	 ; tmp105, _8
 ; ./asm_test/win/i/all.c:2973:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse expression primary\n", parser->source_file->path, lexer->current_token->line + 1, lexer->current_token->column + 1);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2974:         return NULL;
	jmp	.L1191	 ;
.L1192:
 ; ./asm_test/win/i/all.c:2976:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	movq	%rax, %r8	 ; <retval>,
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; ./asm_test/win/i/all.c:2976:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rdi, 32(%rsp)	 ; parser,
	movq	%rbp, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; ./asm_test/win/i/all.c:2976:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp106, _9
 ; ./asm_test/win/i/all.c:2976:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rbx	 ; tmp107, <retval>
.L1191:
 ; ./asm_test/win/i/all.c:2977: }
	addq	$72, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC149:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse parenthesized expression\12\0"
.LC150:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after expression\12\0"
.LC151:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '!'\12\0"
.LC152:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '-'\12\0"
.LC153:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot call undefined variable\12\0"
.LC154:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot call non-function variable\12\0"
.LC155:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function call argument\12\0"
.LC156:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function call argument\12\0"
.LC157:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse sequence index\12\0"
.LC158:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ']' after sequence index\12\0"
.LC159:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot access attribute without a valid scope\12\0"
.LC160:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected attribute name after '.'\12\0"
.LC161:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown attribute name\12\0"
.LC162:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse variable access\12\0"
.LC163:
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
 ; ./asm_test/win/i/all.c:2980:     token = lexer->current_token;
	movq	80(%rcx), %r12	 ; lexer_70(D)->current_token, token
 ; ./asm_test/win/i/all.c:2978: Primary* parse_primary(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
	movq	%rcx, 160(%rsp)	 ; tmp367, lexer
 ; ./asm_test/win/i/all.c:2986:     if (token->type == INTEGER) {
	movl	24(%r12), %eax	 ; token_71->type, _1
 ; ./asm_test/win/i/all.c:2978: Primary* parse_primary(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
	movq	%rdx, 168(%rsp)	 ; tmp368, now_scope
 ; ./asm_test/win/i/all.c:2986:     if (token->type == INTEGER) {
	cmpl	$2, %eax	 ;, _1
	jne	.L1196	 ;,
 ; ./asm_test/win/i/all.c:2988:         str_value = token->lexeme;
	movq	(%r12), %rdx	 ; token_71->lexeme, str_value
 ; ./asm_test/win/i/all.c:2985:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; ./asm_test/win/i/all.c:2984:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; ./asm_test/win/i/all.c:2983:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; ./asm_test/win/i/all.c:2987:         type = PRIM_INTEGER;
	xorl	%ecx, %ecx	 ; type
	jmp	.L1197	 ;
.L1196:
 ; ./asm_test/win/i/all.c:2989:     } else if (token->type == FLOAT) {
	cmpl	$3, %eax	 ;, _1
	jne	.L1198	 ;,
 ; ./asm_test/win/i/all.c:2991:         str_value = token->lexeme;
	movq	(%r12), %rdx	 ; token_71->lexeme, str_value
 ; ./asm_test/win/i/all.c:2985:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; ./asm_test/win/i/all.c:2984:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; ./asm_test/win/i/all.c:2983:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; ./asm_test/win/i/all.c:2990:         type = PRIM_FLOAT;
	movl	$1, %ecx	 ;, type
	jmp	.L1197	 ;
.L1198:
 ; ./asm_test/win/i/all.c:2992:     } else if (token->type == STRING) {
	cmpl	$4, %eax	 ;, _1
	jne	.L1199	 ;,
 ; ./asm_test/win/i/all.c:2994:         str_value = token->lexeme;
	movq	(%r12), %rdx	 ; token_71->lexeme, str_value
 ; ./asm_test/win/i/all.c:2985:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; ./asm_test/win/i/all.c:2984:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; ./asm_test/win/i/all.c:2983:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; ./asm_test/win/i/all.c:2993:         type = PRIM_STRING;
	movl	$2, %ecx	 ;, type
	jmp	.L1197	 ;
.L1199:
	movq	%r8, %rdi	 ; tmp369, parser
 ; ./asm_test/win/i/all.c:2995:     } else if (token->type == KEYWORD && token->lexeme == keywordList[11]) {
	cmpl	$6, %eax	 ;, _1
	jne	.L1200	 ;,
 ; ./asm_test/win/i/all.c:2995:     } else if (token->type == KEYWORD && token->lexeme == keywordList[11]) {
	movq	(%r12), %rax	 ; token_71->lexeme, _3
 ; ./asm_test/win/i/all.c:2995:     } else if (token->type == KEYWORD && token->lexeme == keywordList[11]) {
	movq	88+keywordList(%rip), %rdx	 ; keywordList[11], str_value
 ; ./asm_test/win/i/all.c:2995:     } else if (token->type == KEYWORD && token->lexeme == keywordList[11]) {
	cmpq	%rdx, %rax	 ; str_value, _3
	je	.L1239	 ;,
 ; ./asm_test/win/i/all.c:2998:     } else if (token->type == KEYWORD && token->lexeme == keywordList[12]) {
	movq	96+keywordList(%rip), %rdx	 ; keywordList[12], str_value
 ; ./asm_test/win/i/all.c:2998:     } else if (token->type == KEYWORD && token->lexeme == keywordList[12]) {
	cmpq	%rdx, %rax	 ; str_value, _3
	jne	.L1269	 ;,
	jmp	.L1276	 ;
.L1200:
 ; ./asm_test/win/i/all.c:3001:     } else if (token->type == SYMBOL && token->lexeme == symbolList[0]) {
	cmpl	$5, %eax	 ;, _1
	jne	.L1202	 ;,
 ; ./asm_test/win/i/all.c:3001:     } else if (token->type == SYMBOL && token->lexeme == symbolList[0]) {
	movq	(%r12), %rax	 ; token_71->lexeme, _7
 ; ./asm_test/win/i/all.c:3001:     } else if (token->type == SYMBOL && token->lexeme == symbolList[0]) {
	cmpq	symbolList(%rip), %rax	 ; symbolList[0], _7
	jne	.L1203	 ;,
 ; ./asm_test/win/i/all.c:3003:         token = get_next_token(lexer, 1);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:3004:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rdi, %r8	 ; parser,
 ; ./asm_test/win/i/all.c:3003:         token = get_next_token(lexer, 1);
	movq	%rax, %rbx	 ; tmp370, token
 ; ./asm_test/win/i/all.c:3004:         expr_value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
 ; ./asm_test/win/i/all.c:3005:         if (expr_value == NULL) {
	testq	%rax, %rax	 ; expr_value
	jne	.L1204	 ;,
 ; ./asm_test/win/i/all.c:3006:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse parenthesized expression\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbx), %rax	 ; token_73->column, tmp418
	movq	8(%rbx), %r9	 ; token_73->line, token_73->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rsi	 ;, _10
	movq	(%rdi), %rax	 ; parser_75(D)->source_file, parser_75(D)->source_file
	incq	%r9	 ; _12
	movq	%r9, 64(%rsp)	 ; _12, %sfp
	movq	24(%rax), %r8	 ; _13->path, _14
	movq	%r8, 56(%rsp)	 ; _14, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3006:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse parenthesized expression\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _10,
	movq	64(%rsp), %r9	 ; %sfp, _12
	leaq	.LC149(%rip), %rdx	 ;, tmp266
	movq	56(%rsp), %r8	 ; %sfp, _14
 ; ./asm_test/win/i/all.c:3006:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse parenthesized expression\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp372, _15
	jmp	.L1271	 ;
.L1204:
 ; ./asm_test/win/i/all.c:3009:         token = get_next_token(lexer, 1);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	movq	%rax, 56(%rsp)	 ; expr_value, %sfp
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:3010:         if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movl	24(%rax), %ecx	 ; token_79->type, type
 ; ./asm_test/win/i/all.c:3010:         if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpl	$5, %ecx	 ;, type
	jne	.L1206	 ;,
 ; ./asm_test/win/i/all.c:3010:         if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movq	8+symbolList(%rip), %rsi	 ; symbolList[1], tmp419
	cmpq	%rsi, (%rax)	 ; tmp419, token_79->lexeme
	movq	56(%rsp), %r8	 ; %sfp, expr_value
	je	.L1241	 ;,
.L1206:
 ; ./asm_test/win/i/all.c:3011:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after expression\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rsi	 ; token_79->column, tmp420
	movq	8(%rax), %r9	 ; token_79->line, token_79->line
	movl	$2, %ecx	 ;,
	movq	(%rdi), %rax	 ; parser_75(D)->source_file, parser_75(D)->source_file
	incq	%r9	 ; _22
	leaq	1(%rsi), %rbx	 ;, _20
	movq	24(%rax), %r8	 ; _23->path, _24
	movq	%r9, 64(%rsp)	 ; _22, %sfp
	movq	%r8, 56(%rsp)	 ; _24, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3011:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after expression\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _20,
	movq	64(%rsp), %r9	 ; %sfp, _22
	leaq	.LC150(%rip), %rdx	 ;, tmp273
	movq	56(%rsp), %r8	 ; %sfp, _24
 ; ./asm_test/win/i/all.c:3011:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after expression\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp374, _25
.L1271:
 ; ./asm_test/win/i/all.c:3011:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after expression\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:3007:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L1195	 ;
.L1203:
 ; ./asm_test/win/i/all.c:3014:     } else if (token->type == SYMBOL && token->lexeme == symbolList[5]) {
	cmpq	40+symbolList(%rip), %rax	 ; symbolList[5], _7
	jne	.L1208	 ;,
 ; ./asm_test/win/i/all.c:3016:         token = get_next_token(lexer, 1);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:3017:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rdi, %r8	 ; parser,
 ; ./asm_test/win/i/all.c:3016:         token = get_next_token(lexer, 1);
	movq	%rax, %rbx	 ; tmp375, token
 ; ./asm_test/win/i/all.c:3017:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp376, prim_value
 ; ./asm_test/win/i/all.c:3018:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	jne	.L1242	 ;,
 ; ./asm_test/win/i/all.c:3019:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '!'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbx), %rax	 ; token_85->column, tmp421
	movq	8(%rbx), %r9	 ; token_85->line, token_85->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rsi	 ;, _29
	movq	(%rdi), %rax	 ; parser_75(D)->source_file, parser_75(D)->source_file
	incq	%r9	 ; _31
	movq	%r9, 64(%rsp)	 ; _31, %sfp
	movq	24(%rax), %r8	 ; _32->path, _33
	movq	%r8, 56(%rsp)	 ; _33, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3019:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '!'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _29,
	movq	64(%rsp), %r9	 ; %sfp, _31
	leaq	.LC151(%rip), %rdx	 ;, tmp279
	movq	56(%rsp), %r8	 ; %sfp, _33
 ; ./asm_test/win/i/all.c:3019:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '!'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp377, _34
	jmp	.L1271	 ;
.L1208:
 ; ./asm_test/win/i/all.c:3022:     } else if (token->type == SYMBOL && token->lexeme == symbolList[12]) {
	cmpq	96+symbolList(%rip), %rax	 ; symbolList[12], _7
	jne	.L1209	 ;,
 ; ./asm_test/win/i/all.c:3024:         token = get_next_token(lexer, 1);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:3025:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rdi, %r8	 ; parser,
 ; ./asm_test/win/i/all.c:3024:         token = get_next_token(lexer, 1);
	movq	%rax, %rbx	 ; tmp378, token
 ; ./asm_test/win/i/all.c:3025:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp379, prim_value
 ; ./asm_test/win/i/all.c:3026:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	jne	.L1243	 ;,
 ; ./asm_test/win/i/all.c:3027:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '-'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbx), %rax	 ; token_91->column, tmp422
	movq	8(%rbx), %r9	 ; token_91->line, token_91->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rsi	 ;, _38
	movq	(%rdi), %rax	 ; parser_75(D)->source_file, parser_75(D)->source_file
	incq	%r9	 ; _40
	movq	%r9, 64(%rsp)	 ; _40, %sfp
	movq	24(%rax), %r8	 ; _41->path, _42
	movq	%r8, 56(%rsp)	 ; _42, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3027:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '-'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _38,
	movq	64(%rsp), %r9	 ; %sfp, _40
	leaq	.LC152(%rip), %rdx	 ;, tmp285
	movq	56(%rsp), %r8	 ; %sfp, _42
 ; ./asm_test/win/i/all.c:3027:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '-'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp380, _43
	jmp	.L1271	 ;
.L1269:
 ; ./asm_test/win/i/all.c:3030:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && token->lexeme == keywordList[5] && parser->in_method)) {
	cmpq	40+keywordList(%rip), %rax	 ; keywordList[5], _3
	jne	.L1209	 ;,
 ; ./asm_test/win/i/all.c:3030:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && token->lexeme == keywordList[5] && parser->in_method)) {
	cmpb	$0, 9(%r8)	 ;, parser_75(D)->in_method
	je	.L1209	 ;,
.L1238:
 ; ./asm_test/win/i/all.c:3052:     base_name = search_name(now_scope, token->lexeme);
	movq	(%r12), %rdx	 ; token_71->lexeme,
 ; ./asm_test/win/i/all.c:3053:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	xorl	%r9d, %r9d	 ;
 ; ./asm_test/win/i/all.c:3051:     SymbolTable* var_scope = NULL;
	xorl	%r13d, %r13d	 ; var_scope
 ; ./asm_test/win/i/all.c:3049:     Symbol* current_type = NULL;
	xorl	%ebp, %ebp	 ; class_name
 ; ./asm_test/win/i/all.c:3052:     base_name = search_name(now_scope, token->lexeme);
	movq	168(%rsp), %rcx	 ; now_scope,
	xorl	%r15d, %r15d	 ; var_scope
	call	search_name	 ;
 ; ./asm_test/win/i/all.c:3053:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rdx, 32(%rsp)	 ;,
	movq	%rax, %r8	 ; base_name,
	xorl	%edx, %edx	 ;
 ; ./asm_test/win/i/all.c:3052:     base_name = search_name(now_scope, token->lexeme);
	movq	%rax, %rbx	 ; tmp381, base_name
 ; ./asm_test/win/i/all.c:3053:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	call	create_variable_access	 ;
 ; ./asm_test/win/i/all.c:3054:     token = peek_next_token(lexer, 1);
	movq	160(%rsp), %rcx	 ; lexer,
 ; ./asm_test/win/i/all.c:3053:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	movq	%rax, %rsi	 ; tmp382, variable_value
 ; ./asm_test/win/i/all.c:3054:     token = peek_next_token(lexer, 1);
	call	peek_next_token.constprop.0	 ;
.L1210:
 ; ./asm_test/win/i/all.c:3055:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_132->type
	jne	.L1231	 ;,
 ; ./asm_test/win/i/all.c:3056:         if (base_name != NULL) {
	testq	%rbx, %rbx	 ; base_name
	je	.L1211	 ;,
 ; ./asm_test/win/i/all.c:3058:             if (base_name->type != NULL)
	movq	(%rbx), %rbp	 ; base_name_122->type, class_name
 ; ./asm_test/win/i/all.c:3057:             current_type = base_name;
	testq	%rbp, %rbp	 ; class_name
	cmove	%rbx, %rbp	 ; class_name,, base_name, class_name
.L1211:
 ; ./asm_test/win/i/all.c:3061:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	testq	%r13, %r13	 ; var_scope
	jne	.L1212	 ;,
	testq	%rbp, %rbp	 ; class_name
	je	.L1212	 ;,
 ; ./asm_test/win/i/all.c:3061:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rbp)	 ;, current_type_126->kind
	jne	.L1212	 ;,
 ; ./asm_test/win/i/all.c:3062:             var_scope = current_type->ast_node.class->class_scope;
	movq	24(%rbp), %rdx	 ; current_type_126->ast_node.class, current_type_126->ast_node.class
	movq	16(%rdx), %r13	 ; _130->class_scope, var_scope
.L1212:
 ; ./asm_test/win/i/all.c:3063:         if (token->lexeme == symbolList[0]) {
	movq	(%rax), %rax	 ; token_132->lexeme, _133
 ; ./asm_test/win/i/all.c:3063:         if (token->lexeme == symbolList[0]) {
	cmpq	symbolList(%rip), %rax	 ; symbolList[0], _133
	jne	.L1213	 ;,
 ; ./asm_test/win/i/all.c:3064:             token = get_next_token(lexer, 1);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp384, token
 ; ./asm_test/win/i/all.c:3065:             if (base_name == NULL)
	testq	%rbx, %rbx	 ; base_name
	jne	.L1214	 ;,
 ; ./asm_test/win/i/all.c:3066:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot call undefined variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rax	 ; token_135->column, tmp423
	movq	8(%r13), %r9	 ; token_135->line, token_135->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %r14	 ;, _137
	movq	(%rdi), %rax	 ; parser_75(D)->source_file, parser_75(D)->source_file
	incq	%r9	 ; _139
	movq	%r9, 64(%rsp)	 ; _139, %sfp
	movq	24(%rax), %r8	 ; _140->path, _141
	movq	%r8, 56(%rsp)	 ; _141, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3066:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot call undefined variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r14, 32(%rsp)	 ; _137,
	movq	64(%rsp), %r9	 ; %sfp, _139
	leaq	.LC153(%rip), %rdx	 ;, tmp297
	movq	56(%rsp), %r8	 ; %sfp, _141
 ; ./asm_test/win/i/all.c:3066:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot call undefined variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp385, _142
	jmp	.L1272	 ;
.L1214:
 ; ./asm_test/win/i/all.c:3067:             else if (base_name->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rbx)	 ;, base_name_122->kind
	jne	.L1216	 ;,
 ; ./asm_test/win/i/all.c:3068:                 char* name = make_method_name(base_name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	8(%rbx), %rcx	 ; base_name_122->name, base_name_122->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME,
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp386, name
 ; ./asm_test/win/i/all.c:3069:                 base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
	movq	24(%rbx), %rax	 ; base_name_122->ast_node.class, base_name_122->ast_node.class
	movq	16(%rax), %rcx	 ; _147->class_scope, _148
	call	search_name_use_strcmp	 ;
 ; ./asm_test/win/i/all.c:3070:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	%rsi, %rdx	 ; variable_value,
	xorl	%r9d, %r9d	 ;
	movl	$2, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3069:                 base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
	movq	%rax, %rbx	 ; tmp387, base_name
 ; ./asm_test/win/i/all.c:3070:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	xorl	%eax, %eax	 ;
	movq	%rax, 32(%rsp)	 ;,
	movq	%rbx, %r8	 ; base_name,
	call	create_variable_access	 ;
	movq	%rax, %rsi	 ; tmp388, variable_value
 ; ./asm_test/win/i/all.c:3072:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	testq	%rbx, %rbx	 ; base_name
	je	.L1215	 ;,
.L1216:
 ; ./asm_test/win/i/all.c:3072:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	movl	32(%rbx), %eax	 ; base_name_153->kind, tmp424
	decl	%eax	 ; tmp301
	cmpl	$1, %eax	 ;, tmp301
	jbe	.L1215	 ;,
 ; ./asm_test/win/i/all.c:3073:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot call non-function variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r13), %rax	 ; token_135->column, tmp425
	movq	8(%r13), %r9	 ; token_135->line, token_135->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %r14	 ;, _156
	movq	(%rdi), %rax	 ; parser_75(D)->source_file, parser_75(D)->source_file
	incq	%r9	 ; _158
	movq	%r9, 64(%rsp)	 ; _158, %sfp
	movq	24(%rax), %r8	 ; _159->path, _160
	movq	%r8, 56(%rsp)	 ; _160, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3073:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot call non-function variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r14, 32(%rsp)	 ; _156,
	movq	64(%rsp), %r9	 ; %sfp, _158
	leaq	.LC154(%rip), %rdx	 ;, tmp307
	movq	56(%rsp), %r8	 ; %sfp, _160
 ; ./asm_test/win/i/all.c:3073:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot call non-function variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp389, _161
.L1272:
 ; ./asm_test/win/i/all.c:3073:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot call non-function variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
.L1215:
 ; ./asm_test/win/i/all.c:3074:             token = get_next_token(lexer, 1);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp390, token
 ; ./asm_test/win/i/all.c:3075:             List* args = create_list();
	call	create_list	 ;
	movq	%rax, %r13	 ; tmp391, args
.L1219:
 ; ./asm_test/win/i/all.c:3076:             while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpl	$5, 24(%rbp)	 ;, token_165->type
	je	.L1277	 ;,
.L1225:
 ; ./asm_test/win/i/all.c:3077:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rdi, %r8	 ; parser,
	call	parse_expression	 ;
	movq	%rax, %r14	 ; tmp392, arg
 ; ./asm_test/win/i/all.c:3078:                 if (arg == NULL)
	testq	%rax, %rax	 ; arg
	jne	.L1220	 ;,
 ; ./asm_test/win/i/all.c:3079:                     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function call argument\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbp), %rax	 ; token_165->column, tmp426
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rdx	 ;, _167
	movq	8(%rbp), %rax	 ; token_165->line, token_165->line
	movq	%rdx, 72(%rsp)	 ; _167, %sfp
	leaq	1(%rax), %r9	 ;, _169
	movq	(%rdi), %rax	 ; parser_75(D)->source_file, parser_75(D)->source_file
	movq	%r9, 64(%rsp)	 ; _169, %sfp
	movq	24(%rax), %r8	 ; _170->path, _171
	movq	%r8, 56(%rsp)	 ; _171, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3079:                     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function call argument\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	72(%rsp), %rdx	 ; %sfp, _167
	movq	64(%rsp), %r9	 ; %sfp, _169
	movq	56(%rsp), %r8	 ; %sfp, _171
 ; ./asm_test/win/i/all.c:3079:                     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function call argument\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp393, _172
 ; ./asm_test/win/i/all.c:3079:                     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function call argument\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdx, 32(%rsp)	 ; _167,
	leaq	.LC155(%rip), %rdx	 ;,
	call	fprintf	 ;
.L1220:
 ; ./asm_test/win/i/all.c:3080:                 list_append(args, (size_t*)arg);
	movq	%r14, %rdx	 ; arg,
	movq	%r13, %rcx	 ; args,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3081:                 token = get_next_token(lexer, 1);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:3082:                 if (token->type == SYMBOL && token->lexeme == symbolList[4])
	cmpl	$5, 24(%rax)	 ;, token_173->type
 ; ./asm_test/win/i/all.c:3081:                 token = get_next_token(lexer, 1);
	movq	%rax, %rbp	 ; tmp394, token
 ; ./asm_test/win/i/all.c:3082:                 if (token->type == SYMBOL && token->lexeme == symbolList[4])
	jne	.L1221	 ;,
 ; ./asm_test/win/i/all.c:3082:                 if (token->type == SYMBOL && token->lexeme == symbolList[4])
	movq	(%rax), %rax	 ; token_173->lexeme, _175
 ; ./asm_test/win/i/all.c:3082:                 if (token->type == SYMBOL && token->lexeme == symbolList[4])
	cmpq	32+symbolList(%rip), %rax	 ; symbolList[4], _175
	jne	.L1222	 ;,
 ; ./asm_test/win/i/all.c:3083:                     token = get_next_token(lexer, 1);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp395, token
 ; ./asm_test/win/i/all.c:3083:                     token = get_next_token(lexer, 1);
	jmp	.L1219	 ;
.L1222:
 ; ./asm_test/win/i/all.c:3084:                 else if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpq	8+symbolList(%rip), %rax	 ; symbolList[1], _175
	je	.L1219	 ;,
.L1221:
 ; ./asm_test/win/i/all.c:3085:                     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function call argument\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbp), %rax	 ; token_173->column, tmp427
	movq	8(%rbp), %r9	 ; token_173->line, token_173->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rbx	 ;, _182
	movq	(%rdi), %rax	 ; parser_75(D)->source_file, parser_75(D)->source_file
	incq	%r9	 ; _184
	movq	%r9, 64(%rsp)	 ; _184, %sfp
	movq	24(%rax), %r8	 ; _185->path, _186
	movq	%r8, 56(%rsp)	 ; _186, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3085:                     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function call argument\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _182,
	movq	64(%rsp), %r9	 ; %sfp, _184
	leaq	.LC156(%rip), %rdx	 ;, tmp319
	movq	56(%rsp), %r8	 ; %sfp, _186
 ; ./asm_test/win/i/all.c:3085:                     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function call argument\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp396, _187
	jmp	.L1275	 ;
.L1277:
 ; ./asm_test/win/i/all.c:3076:             while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movq	8+symbolList(%rip), %rax	 ; symbolList[1], tmp428
	cmpq	%rax, 0(%rbp)	 ; tmp428, token_165->lexeme
	jne	.L1225	 ;,
 ; ./asm_test/win/i/all.c:3089:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%r13, 32(%rsp)	 ; args,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; variable_value,
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
 ; ./asm_test/win/i/all.c:3090:             base_name = base_name->type;
	movq	(%rbx), %rbx	 ; base_name_193->type, base_name
 ; ./asm_test/win/i/all.c:3089:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%rax, %rsi	 ; tmp397, variable_value
 ; ./asm_test/win/i/all.c:3093:             if (base_name->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rbx)	 ;, base_name_194->kind
	jne	.L1245	 ;,
 ; ./asm_test/win/i/all.c:3094:                 var_scope = base_name->ast_node.class->class_scope;
	movq	24(%rbx), %rax	 ; base_name_194->ast_node.class, base_name_194->ast_node.class
	movq	16(%rax), %r13	 ; _196->class_scope, var_scope
	jmp	.L1274	 ;
.L1213:
 ; ./asm_test/win/i/all.c:3095:         } else if (token->lexeme == symbolList[7]) {
	cmpq	56+symbolList(%rip), %rax	 ; symbolList[7], _133
	jne	.L1227	 ;,
 ; ./asm_test/win/i/all.c:3096:             token = get_next_token(lexer, 1);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:3097:             token = get_next_token(lexer, 1);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:3098:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rdi, %r8	 ; parser,
 ; ./asm_test/win/i/all.c:3097:             token = get_next_token(lexer, 1);
	movq	%rax, 56(%rsp)	 ; token, %sfp
 ; ./asm_test/win/i/all.c:3098:             Expression* index = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
 ; ./asm_test/win/i/all.c:3099:             if (index == NULL)
	movq	56(%rsp), %r9	 ; %sfp, token
	testq	%rax, %rax	 ; index
 ; ./asm_test/win/i/all.c:3098:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	%rax, %r14	 ; tmp399, index
 ; ./asm_test/win/i/all.c:3099:             if (index == NULL)
	jne	.L1228	 ;,
 ; ./asm_test/win/i/all.c:3100:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse sequence index\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r9), %rax	 ; token_199->column, tmp429
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rdx	 ;, _202
	movq	8(%r9), %rax	 ; token_199->line, token_199->line
	movq	%rdx, 72(%rsp)	 ; _202, %sfp
	leaq	1(%rax), %r9	 ;, _204
	movq	(%rdi), %rax	 ; parser_75(D)->source_file, parser_75(D)->source_file
	movq	%r9, 64(%rsp)	 ; _204, %sfp
	movq	24(%rax), %r8	 ; _205->path, _206
	movq	%r8, 56(%rsp)	 ; _206, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3100:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse sequence index\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	72(%rsp), %rdx	 ; %sfp, _202
	movq	64(%rsp), %r9	 ; %sfp, _204
	movq	56(%rsp), %r8	 ; %sfp, _206
 ; ./asm_test/win/i/all.c:3100:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse sequence index\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp400, _207
 ; ./asm_test/win/i/all.c:3100:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse sequence index\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdx, 32(%rsp)	 ; _202,
	leaq	.LC157(%rip), %rdx	 ;, tmp328
	call	fprintf	 ;
.L1228:
 ; ./asm_test/win/i/all.c:3101:             token = get_next_token(lexer, 1);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:3102:             if (token->type != SYMBOL || token->lexeme != symbolList[8]) {
	cmpl	$5, 24(%rax)	 ;, token_208->type
	jne	.L1229	 ;,
 ; ./asm_test/win/i/all.c:3102:             if (token->type != SYMBOL || token->lexeme != symbolList[8]) {
	movq	64+symbolList(%rip), %rdx	 ; symbolList[8], tmp430
	cmpq	%rdx, (%rax)	 ; tmp430, token_208->lexeme
	je	.L1230	 ;,
.L1229:
 ; ./asm_test/win/i/all.c:3103:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ']' after sequence index\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rsi	 ; token_208->column, tmp431
	movq	8(%rax), %r9	 ; token_208->line, token_208->line
	movl	$2, %ecx	 ;,
	movq	(%rdi), %rax	 ; parser_75(D)->source_file, parser_75(D)->source_file
	incq	%r9	 ; _216
	leaq	1(%rsi), %rbx	 ;, _214
	movq	24(%rax), %r8	 ; _217->path, _218
	movq	%r9, 64(%rsp)	 ; _216, %sfp
	movq	%r8, 56(%rsp)	 ; _218, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3103:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ']' after sequence index\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _214,
	movq	64(%rsp), %r9	 ; %sfp, _216
	leaq	.LC158(%rip), %rdx	 ;, tmp335
	movq	56(%rsp), %r8	 ; %sfp, _218
 ; ./asm_test/win/i/all.c:3103:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ']' after sequence index\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp402, _219
.L1275:
 ; ./asm_test/win/i/all.c:3103:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ']' after sequence index\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
	jmp	.L1224	 ;
.L1230:
 ; ./asm_test/win/i/all.c:3106:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movq	%r15, 32(%rsp)	 ; var_scope,
	movq	%rsi, %rdx	 ; variable_value,
	movq	%r14, %r9	 ; index,
	xorl	%r8d, %r8d	 ;
	movl	$3, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, %rsi	 ; tmp403, variable_value
	jmp	.L1226	 ;
.L1227:
 ; ./asm_test/win/i/all.c:3107:         } else if (token->lexeme == symbolList[6]) {
	cmpq	48+symbolList(%rip), %rax	 ; symbolList[6], _133
	jne	.L1231	 ;,
 ; ./asm_test/win/i/all.c:3108:             token = get_next_token(lexer, 1);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:3109:             token = get_next_token(lexer, 1);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r14	 ; tmp404, token
 ; ./asm_test/win/i/all.c:3110:             if (var_scope == NULL) {
	testq	%r13, %r13	 ; var_scope
	jne	.L1232	 ;,
 ; ./asm_test/win/i/all.c:3111:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot access attribute without a valid scope\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rax	 ; token_222->column, tmp432
	movq	8(%r14), %r9	 ; token_222->line, token_222->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rbx	 ;, _226
	movq	(%rdi), %rax	 ; parser_75(D)->source_file, parser_75(D)->source_file
	incq	%r9	 ; _228
	movq	%r9, 64(%rsp)	 ; _228, %sfp
	movq	24(%rax), %r8	 ; _229->path, _230
	movq	%r8, 56(%rsp)	 ; _230, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3111:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot access attribute without a valid scope\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _226,
	movq	64(%rsp), %r9	 ; %sfp, _228
	leaq	.LC159(%rip), %rdx	 ;, tmp341
	movq	56(%rsp), %r8	 ; %sfp, _230
 ; ./asm_test/win/i/all.c:3111:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot access attribute without a valid scope\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp405, _231
	jmp	.L1275	 ;
.L1232:
 ; ./asm_test/win/i/all.c:3114:             if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_222->type
	je	.L1233	 ;,
 ; ./asm_test/win/i/all.c:3115:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected attribute name after '.'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rax	 ; token_222->column, tmp433
	movq	8(%r14), %r9	 ; token_222->line, token_222->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rbx	 ;, _235
	movq	(%rdi), %rax	 ; parser_75(D)->source_file, parser_75(D)->source_file
	incq	%r9	 ; _237
	movq	%r9, 64(%rsp)	 ; _237, %sfp
	movq	24(%rax), %r8	 ; _238->path, _239
	movq	%r8, 56(%rsp)	 ; _239, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3115:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected attribute name after '.'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _235,
	movq	64(%rsp), %r9	 ; %sfp, _237
	leaq	.LC160(%rip), %rdx	 ;, tmp346
	movq	56(%rsp), %r8	 ; %sfp, _239
 ; ./asm_test/win/i/all.c:3115:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected attribute name after '.'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp406, _240
	jmp	.L1275	 ;
.L1233:
 ; ./asm_test/win/i/all.c:3118:             base_name = search_name(var_scope, token->lexeme);
	movq	(%rax), %rdx	 ; token_222->lexeme, _241
	movq	%r13, %rcx	 ; var_scope,
	call	search_name	 ;
	movq	%rax, %rbx	 ; tmp407, base_name
 ; ./asm_test/win/i/all.c:3119:             if (base_name == NULL) {
	testq	%rax, %rax	 ; base_name
	jne	.L1234	 ;,
 ; ./asm_test/win/i/all.c:3121:                 if (current_type != NULL) {
	testq	%rbp, %rbp	 ; class_name
	je	.L1235	 ;,
 ; ./asm_test/win/i/all.c:3122:                     if (current_type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rbp)	 ;, current_type_126->kind
	je	.L1273	 ;,
 ; ./asm_test/win/i/all.c:3124:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	movq	0(%rbp), %rbp	 ; current_type_126->type, class_name
 ; ./asm_test/win/i/all.c:3124:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	testq	%rbp, %rbp	 ; class_name
	je	.L1235	 ;,
 ; ./asm_test/win/i/all.c:3124:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rbp)	 ;, _245->kind
	jne	.L1246	 ;,
.L1273:
 ; ./asm_test/win/i/all.c:3125:                         class_name = current_type->type->name;
	movq	8(%rbp), %rbp	 ;, class_name
	jmp	.L1235	 ;
.L1246:
 ; ./asm_test/win/i/all.c:3120:                 char* class_name = NULL;
	xorl	%ebp, %ebp	 ; class_name
.L1235:
 ; ./asm_test/win/i/all.c:3127:                 char* name = make_method_name(class_name, token->lexeme);
	movq	%rbp, %rcx	 ; class_name,
	call	make_method_name	 ;
 ; ./asm_test/win/i/all.c:3128:                 base_name = search_name_use_strcmp(var_scope, name);
	movq	%r13, %rcx	 ; var_scope,
 ; ./asm_test/win/i/all.c:3127:                 char* name = make_method_name(class_name, token->lexeme);
	movq	%rax, %rdx	 ; tmp408, name
 ; ./asm_test/win/i/all.c:3128:                 base_name = search_name_use_strcmp(var_scope, name);
	call	search_name_use_strcmp	 ;
	movq	%rax, %rbx	 ; tmp409, base_name
 ; ./asm_test/win/i/all.c:3130:             if (base_name == NULL) {
	testq	%rax, %rax	 ; base_name
	jne	.L1234	 ;,
 ; ./asm_test/win/i/all.c:3131:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown attribute name\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r14), %rax	 ; token_222->column, tmp434
	movq	8(%r14), %r9	 ; token_222->line, token_222->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rbx	 ;, _253
	movq	(%rdi), %rax	 ; parser_75(D)->source_file, parser_75(D)->source_file
	incq	%r9	 ; _255
	movq	%r9, 64(%rsp)	 ; _255, %sfp
	movq	24(%rax), %r8	 ; _256->path, _257
	movq	%r8, 56(%rsp)	 ; _257, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3131:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown attribute name\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _253,
	movq	64(%rsp), %r9	 ; %sfp, _255
	leaq	.LC161(%rip), %rdx	 ;, tmp351
	movq	56(%rsp), %r8	 ; %sfp, _257
 ; ./asm_test/win/i/all.c:3131:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown attribute name\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp410, _258
	jmp	.L1275	 ;
.L1234:
 ; ./asm_test/win/i/all.c:3134:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	%r15, 32(%rsp)	 ; var_scope,
	movq	%rsi, %rdx	 ; variable_value,
	xorl	%r9d, %r9d	 ;
	movq	%rbx, %r8	 ; base_name,
	movl	$2, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, %rsi	 ; tmp411, variable_value
.L1245:
 ; ./asm_test/win/i/all.c:3092:             var_scope = NULL;
	xorl	%r13d, %r13d	 ; var_scope
.L1274:
 ; ./asm_test/win/i/all.c:3091:             current_type = NULL;
	xorl	%ebp, %ebp	 ; class_name
.L1226:
 ; ./asm_test/win/i/all.c:3139:         token = peek_next_token(lexer, 1);
	movq	160(%rsp), %rcx	 ; lexer,
	call	peek_next_token.constprop.0	 ;
	jmp	.L1210	 ;
.L1231:
 ; ./asm_test/win/i/all.c:3033:         if (variable_value == NULL) {
	testq	%rsi, %rsi	 ; variable_value
	jne	.L1247	 ;,
.L1224:
 ; ./asm_test/win/i/all.c:3034:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse variable access\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r12), %rax	 ; token_71->column, tmp435
	movq	8(%r12), %r9	 ; token_71->line, token_71->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rbx	 ;, _48
	movq	(%rdi), %rax	 ; parser_75(D)->source_file, parser_75(D)->source_file
	incq	%r9	 ; _50
	movq	%r9, 64(%rsp)	 ; _50, %sfp
	movq	24(%rax), %r8	 ; _51->path, _52
	movq	%r8, 56(%rsp)	 ; _52, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3034:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse variable access\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _48,
	movq	64(%rsp), %r9	 ; %sfp, _50
	leaq	.LC162(%rip), %rdx	 ;, tmp356
	movq	56(%rsp), %r8	 ; %sfp, _52
 ; ./asm_test/win/i/all.c:3034:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse variable access\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp413, _53
	jmp	.L1271	 ;
.L1202:
 ; ./asm_test/win/i/all.c:3030:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && token->lexeme == keywordList[5] && parser->in_method)) {
	decl	%eax	 ; _1
	je	.L1238	 ;,
.L1209:
 ; ./asm_test/win/i/all.c:3038:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unexpected token in primary expression\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r12), %rax	 ; token_71->column, tmp436
	movq	8(%r12), %r9	 ; token_71->line, token_71->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rbx	 ;, _55
	movq	(%rdi), %rax	 ; parser_75(D)->source_file, parser_75(D)->source_file
	incq	%r9	 ; _57
	movq	%r9, 64(%rsp)	 ; _57, %sfp
	movq	24(%rax), %r8	 ; _58->path, _59
	movq	%r8, 56(%rsp)	 ; _59, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3038:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unexpected token in primary expression\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _55,
	movq	64(%rsp), %r9	 ; %sfp, _57
	leaq	.LC163(%rip), %rdx	 ;, tmp361
	movq	56(%rsp), %r8	 ; %sfp, _59
 ; ./asm_test/win/i/all.c:3038:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unexpected token in primary expression\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp414, _60
	jmp	.L1271	 ;
.L1239:
 ; ./asm_test/win/i/all.c:2985:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; ./asm_test/win/i/all.c:2984:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; ./asm_test/win/i/all.c:2983:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; ./asm_test/win/i/all.c:2996:         type = PRIM_TRUE;
	movl	$3, %ecx	 ;, type
	jmp	.L1197	 ;
.L1276:
 ; ./asm_test/win/i/all.c:2985:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; ./asm_test/win/i/all.c:2984:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; ./asm_test/win/i/all.c:2983:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; ./asm_test/win/i/all.c:2999:         type = PRIM_FALSE;
	movl	$4, %ecx	 ;, type
	jmp	.L1197	 ;
.L1241:
 ; ./asm_test/win/i/all.c:2985:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; ./asm_test/win/i/all.c:2984:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; ./asm_test/win/i/all.c:2982:     char* str_value = NULL;
	xorl	%edx, %edx	 ; str_value
	jmp	.L1197	 ;
.L1242:
 ; ./asm_test/win/i/all.c:2985:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; ./asm_test/win/i/all.c:2983:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; ./asm_test/win/i/all.c:2982:     char* str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; ./asm_test/win/i/all.c:3015:         type = PRIM_NOT_OPERAND;
	movl	$6, %ecx	 ;, type
	jmp	.L1197	 ;
.L1243:
 ; ./asm_test/win/i/all.c:2985:     VariableAccess* variable_value = NULL;
	xorl	%esi, %esi	 ; variable_value
 ; ./asm_test/win/i/all.c:2983:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; ./asm_test/win/i/all.c:2982:     char* str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; ./asm_test/win/i/all.c:3023:         type = PRIM_NEG_OPERAND;
	movl	$7, %ecx	 ;, type
	jmp	.L1197	 ;
.L1247:
 ; ./asm_test/win/i/all.c:2984:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; ./asm_test/win/i/all.c:2983:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; ./asm_test/win/i/all.c:2982:     char* str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; ./asm_test/win/i/all.c:3031:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %ecx	 ;, type
.L1197:
 ; ./asm_test/win/i/all.c:3041:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%rsi, 32(%rsp)	 ; variable_value,
	call	create_primary	 ;
.L1195:
 ; ./asm_test/win/i/all.c:3042: }
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
	.section .rdata,"dr"
.LC164:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected variable type\12\0"
.LC165:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected a type for variable declaration\12\0"
.LC166:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown variable type\12\0"
.LC167:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected variable name\12\0"
.LC168:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse variable initializer\12\0"
	.text
	.def	parse_variable;	.scl	3;	.type	32;	.endef
parse_variable:
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%rdx, %r12	 ; tmp188, now_scope
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp187, lexer
	pushq	%rbx	 ;
	movq	%r8, %rbx	 ; tmp189, parser
	subq	$64, %rsp	 ;,
 ; ./asm_test/win/i/all.c:2686:     token = lexer->current_token;
	movq	80(%rcx), %r10	 ; lexer_63(D)->current_token, token
 ; ./asm_test/win/i/all.c:2687:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	movl	24(%r10), %eax	 ; token_64->type, _1
 ; ./asm_test/win/i/all.c:2687:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpl	$1, %eax	 ;, _1
	je	.L1279	 ;,
 ; ./asm_test/win/i/all.c:2687:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpl	$6, %eax	 ;, _1
	jne	.L1280	 ;,
 ; ./asm_test/win/i/all.c:2687:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	movq	(%r10), %rax	 ; token_64->lexeme, _3
 ; ./asm_test/win/i/all.c:2687:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	128+keywordList(%rip), %rax	 ; keywordList[16], _3
	je	.L1279	 ;,
 ; ./asm_test/win/i/all.c:2687:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	136+keywordList(%rip), %rax	 ; keywordList[17], _3
	je	.L1279	 ;,
 ; ./asm_test/win/i/all.c:2687:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	144+keywordList(%rip), %rax	 ; keywordList[18], _3
	je	.L1279	 ;,
 ; ./asm_test/win/i/all.c:2687:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	152+keywordList(%rip), %rax	 ; keywordList[19], _3
	je	.L1279	 ;,
 ; ./asm_test/win/i/all.c:2687:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	160+keywordList(%rip), %rax	 ; keywordList[20], _3
	jne	.L1280	 ;,
.L1279:
 ; ./asm_test/win/i/all.c:2691:     Symbol* type = search_name(now_scope, token->lexeme);
	movq	(%r10), %rdx	 ; token_64->lexeme,
	movq	%r12, %rcx	 ; now_scope,
	call	search_name	 ;
	movq	%rax, %rdi	 ; tmp191, type
 ; ./asm_test/win/i/all.c:2692:     if (type != NULL) {
	testq	%rax, %rax	 ; type
	je	.L1282	 ;,
 ; ./asm_test/win/i/all.c:2693:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; type_69->kind, _72
 ; ./asm_test/win/i/all.c:2693:         if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
	cmpl	$6, %eax	 ;, _72
	je	.L1283	 ;,
	testl	%eax, %eax	 ; _72
	je	.L1283	 ;,
 ; ./asm_test/win/i/all.c:2694:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected a type for variable declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r10), %rax	 ; token_64->column, tmp203
	movq	8(%r10), %r9	 ; token_64->line, token_64->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rbp	 ;, _21
	movq	(%rbx), %rax	 ; parser_65(D)->source_file, parser_65(D)->source_file
	incq	%r9	 ; _23
	movq	%r9, 56(%rsp)	 ; _23, %sfp
	movq	24(%rax), %r8	 ; _24->path, _25
	movq	%r8, 48(%rsp)	 ; _25, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2694:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected a type for variable declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbp, 32(%rsp)	 ; _21,
	movq	56(%rsp), %r9	 ; %sfp, _23
	leaq	.LC165(%rip), %rdx	 ;, tmp166
	movq	48(%rsp), %r8	 ; %sfp, _25
 ; ./asm_test/win/i/all.c:2694:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected a type for variable declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp192, _26
	jmp	.L1303	 ;
.L1282:
 ; ./asm_test/win/i/all.c:2696:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown variable type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r10), %rax	 ; token_64->column, tmp204
	movq	8(%r10), %r9	 ; token_64->line, token_64->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rbp	 ;, _28
	movq	(%rbx), %rax	 ; parser_65(D)->source_file, parser_65(D)->source_file
	incq	%r9	 ; _30
	movq	%r9, 56(%rsp)	 ; _30, %sfp
	movq	24(%rax), %r8	 ; _31->path, _32
	movq	%r8, 48(%rsp)	 ; _32, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2696:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown variable type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbp, 32(%rsp)	 ; _28,
	movq	56(%rsp), %r9	 ; %sfp, _30
	leaq	.LC166(%rip), %rdx	 ;, tmp171
	movq	48(%rsp), %r8	 ; %sfp, _32
 ; ./asm_test/win/i/all.c:2696:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown variable type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp193, _33
.L1303:
 ; ./asm_test/win/i/all.c:2696:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown variable type\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
.L1283:
 ; ./asm_test/win/i/all.c:2697:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2698:     if (token->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	 ;, token_76->type
 ; ./asm_test/win/i/all.c:2697:     token = get_next_token(lexer, 1);
	movq	%rax, %rbp	 ; tmp194, token
 ; ./asm_test/win/i/all.c:2698:     if (token->type != IDENTIFIER)
	je	.L1284	 ;,
 ; ./asm_test/win/i/all.c:2699:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected variable name\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rax	 ; token_76->column, tmp205
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %r13	 ;, _36
	movq	8(%rbp), %rax	 ; token_76->line, tmp206
	leaq	1(%rax), %r9	 ;, _38
	movq	(%rbx), %rax	 ; parser_65(D)->source_file, parser_65(D)->source_file
	movq	%r9, 56(%rsp)	 ; _38, %sfp
	movq	24(%rax), %r8	 ; _39->path, _40
	movq	%r8, 48(%rsp)	 ; _40, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2699:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected variable name\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r13, 32(%rsp)	 ; _36,
	movq	56(%rsp), %r9	 ; %sfp, _38
	leaq	.LC167(%rip), %rdx	 ;, tmp176
	movq	48(%rsp), %r8	 ; %sfp, _40
 ; ./asm_test/win/i/all.c:2699:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected variable name\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp195, _41
 ; ./asm_test/win/i/all.c:2699:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected variable name\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
.L1284:
 ; ./asm_test/win/i/all.c:2700:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	cmpb	$0, 10(%rbx)	 ;, parser_65(D)->in_class
 ; ./asm_test/win/i/all.c:2700:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movl	$3, %edx	 ;, iftmp.66_57
 ; ./asm_test/win/i/all.c:2700:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	je	.L1285	 ;,
 ; ./asm_test/win/i/all.c:2700:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	cmpb	$1, 9(%rbx)	 ;, parser_65(D)->in_method
	sbbl	%edx, %edx	 ; iftmp.66_57
	andl	$2, %edx	 ;, iftmp.66_57
	addl	$3, %edx	 ;, iftmp.66_57
.L1285:
 ; ./asm_test/win/i/all.c:2700:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movq	0(%rbp), %rcx	 ; token_76->lexeme,
	movq	%r12, %r9	 ; now_scope,
	movq	%rdi, %r8	 ; type,
 ; ./asm_test/win/i/all.c:2701:     Expression* value = NULL;
	xorl	%ebp, %ebp	 ; value
 ; ./asm_test/win/i/all.c:2700:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	call	create_symbol	 ;
 ; ./asm_test/win/i/all.c:2702:     token = peek_next_token(lexer, 1);
	movq	%rsi, %rcx	 ; lexer,
 ; ./asm_test/win/i/all.c:2700:     Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
	movq	%rax, %r14	 ; tmp196, name
 ; ./asm_test/win/i/all.c:2702:     token = peek_next_token(lexer, 1);
	call	peek_next_token.constprop.0	 ;
 ; ./asm_test/win/i/all.c:2703:     if (token->type == SYMBOL && token->lexeme == symbolList[18]) {
	cmpl	$5, 24(%rax)	 ;, token_82->type
	jne	.L1286	 ;,
 ; ./asm_test/win/i/all.c:2703:     if (token->type == SYMBOL && token->lexeme == symbolList[18]) {
	movq	144+symbolList(%rip), %rdx	 ; symbolList[18], tmp207
	cmpq	%rdx, (%rax)	 ; tmp207, token_82->lexeme
	jne	.L1286	 ;,
 ; ./asm_test/win/i/all.c:2704:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2705:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2706:         value = parse_expression(lexer, now_scope, parser);
	movq	%rbx, %r8	 ; parser,
	movq	%r12, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
 ; ./asm_test/win/i/all.c:2705:         token = get_next_token(lexer, 1);
	movq	%rax, %r13	 ; tmp198, token
 ; ./asm_test/win/i/all.c:2706:         value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rbp	 ; tmp199, value
 ; ./asm_test/win/i/all.c:2707:         if (value == NULL)
	testq	%rax, %rax	 ; value
	jne	.L1286	 ;,
 ; ./asm_test/win/i/all.c:2708:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse variable initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r13), %rax	 ; token_85->column, tmp208
	movq	8(%r13), %r9	 ; token_85->line, token_85->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rsi	 ;, _49
	movq	(%rbx), %rax	 ; parser_65(D)->source_file, parser_65(D)->source_file
	incq	%r9	 ; _51
	movq	%r9, 56(%rsp)	 ; _51, %sfp
	movq	24(%rax), %r8	 ; _52->path, _53
	movq	%r8, 48(%rsp)	 ; _53, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2708:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse variable initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _49,
	movq	56(%rsp), %r9	 ; %sfp, _51
	leaq	.LC168(%rip), %rdx	 ;, tmp183
	movq	48(%rsp), %r8	 ; %sfp, _53
 ; ./asm_test/win/i/all.c:2708:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse variable initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp200, _54
 ; ./asm_test/win/i/all.c:2708:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse variable initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
.L1286:
 ; ./asm_test/win/i/all.c:2711: }
	addq	$64, %rsp	 ;,
 ; ./asm_test/win/i/all.c:2710:     return create_variable(type, name, value);
	movq	%rbp, %r8	 ; value,
	movq	%r14, %rdx	 ; name,
	movq	%rdi, %rcx	 ; type,
 ; ./asm_test/win/i/all.c:2711: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; ./asm_test/win/i/all.c:2710:     return create_variable(type, name, value);
	jmp	create_variable	 ;
.L1280:
 ; ./asm_test/win/i/all.c:2688:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected variable type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r10), %rax	 ; token_64->column, tmp202
	movq	8(%r10), %r9	 ; token_64->line, token_64->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rsi	 ;, _10
	movq	(%rbx), %rax	 ; parser_65(D)->source_file, parser_65(D)->source_file
	incq	%r9	 ; _12
	movq	%r9, 56(%rsp)	 ; _12, %sfp
	movq	24(%rax), %r8	 ; _13->path, _14
	movq	%r8, 48(%rsp)	 ; _14, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2688:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected variable type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _10,
	movq	56(%rsp), %r9	 ; %sfp, _12
	leaq	.LC164(%rip), %rdx	 ;, tmp157
	movq	48(%rsp), %r8	 ; %sfp, _14
 ; ./asm_test/win/i/all.c:2688:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected variable type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp190, _15
 ; ./asm_test/win/i/all.c:2688:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected variable type\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2711: }
	addq	$64, %rsp	 ;,
	xorl	%eax, %eax	 ;
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
	.section .rdata,"dr"
.LC169:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'if'\12\0"
.LC170:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse if condition\12\0"
.LC171:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after if condition\12\0"
.LC172:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start if body\12\0"
.LC173:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse if body statement\12\0"
.LC174:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'elif'\12\0"
.LC175:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else-if condition\12\0"
.LC176:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after else-if condition\12\0"
.LC177:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start else-if body\12\0"
.LC178:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else-if body statement\12\0"
.LC179:
	.ascii "Error creating else-if statement: condition is NULL\12\0"
.LC180:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start else body\12\0"
.LC181:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse else body statement\12\0"
.LC182:
	.ascii "Error creating if statement: condition is NULL\12\0"
.LC183:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'for'\12\0"
.LC184:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop initializer\12\0"
.LC185:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop initializer\12\0"
.LC186:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop condition\12\0"
.LC187:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop condition\12\0"
.LC188:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop increment\12\0"
.LC189:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after for loop increment\12\0"
.LC190:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start for loop body\12\0"
.LC191:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse for loop body statement\12\0"
.LC192:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after 'while'\12\0"
.LC193:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse while condition\12\0"
.LC194:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ')' after while condition\12\0"
.LC195:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start while body\12\0"
.LC196:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse while body statement\12\0"
.LC197:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot use 'break' outside of a loop\12\0"
.LC198:
	.ascii "[Parser Error] at %s:%zu:%zu: Cannot use 'continue' outside of a loop\12\0"
.LC199:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse statement\12\0"
.LC200:
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
	movq	%r8, %rsi	 ; tmp673, parser
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp671, lexer
	subq	$88, %rsp	 ;,
 ; ./asm_test/win/i/all.c:2712: Statement* parse_statement(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
	movq	%rdx, 168(%rsp)	 ; tmp672, now_scope
 ; ./asm_test/win/i/all.c:2714:     token = lexer->current_token;
	movq	80(%rcx), %rdx	 ; lexer_61(D)->current_token, token
 ; ./asm_test/win/i/all.c:2716:     if (token->type == KEYWORD) {
	cmpl	$6, 24(%rdx)	 ;, token_62->type
	jne	.L1305	 ;,
 ; ./asm_test/win/i/all.c:2717:         if (token->lexeme == keywordList[6])
	movq	(%rdx), %rax	 ; token_62->lexeme, _2
 ; ./asm_test/win/i/all.c:2717:         if (token->lexeme == keywordList[6])
	cmpq	48+keywordList(%rip), %rax	 ; keywordList[6], _2
	jne	.L1306	 ;,
 ; ./asm_test/win/i/all.c:2758:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2759:     if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	cmpl	$5, 24(%rax)	 ;, token_106->type
	jne	.L1307	 ;,
 ; ./asm_test/win/i/all.c:2759:     if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	movq	symbolList(%rip), %rdi	 ; symbolList[0], tmp775
	cmpq	%rdi, (%rax)	 ; tmp775, token_106->lexeme
	je	.L1308	 ;,
.L1307:
 ; ./asm_test/win/i/all.c:2760:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after 'if'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_106->column, tmp776
	movq	8(%rax), %r9	 ; token_106->line, token_106->line
	movl	$2, %ecx	 ;,
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _113
	leaq	1(%rdi), %rbx	 ;, _111
	movq	24(%rax), %r8	 ; _114->path, _115
	movq	%r9, 56(%rsp)	 ; _113, %sfp
	movq	%r8, 48(%rsp)	 ; _115, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2760:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after 'if'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _111,
	movq	56(%rsp), %r9	 ; %sfp, _113
	leaq	.LC169(%rip), %rdx	 ;, tmp450
	movq	48(%rsp), %r8	 ; %sfp, _115
 ; ./asm_test/win/i/all.c:2760:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after 'if'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp675, _116
	jmp	.L1395	 ;
.L1308:
 ; ./asm_test/win/i/all.c:2763:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2764:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	%rsi, %r8	 ; parser,
	movq	%rbx, %rcx	 ; lexer,
 ; ./asm_test/win/i/all.c:2763:     token = get_next_token(lexer, 1);
	movq	%rax, %rdi	 ; tmp676, token
 ; ./asm_test/win/i/all.c:2764:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rbp	 ; tmp677, condition
 ; ./asm_test/win/i/all.c:2765:     if (condition == NULL)
	testq	%rax, %rax	 ; condition
	jne	.L1310	 ;,
 ; ./asm_test/win/i/all.c:2766:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rdi), %rax	 ; token_117->column, tmp777
	movq	8(%rdi), %r9	 ; token_117->line, token_117->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %r12	 ;, _120
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _122
	movq	%r9, 56(%rsp)	 ; _122, %sfp
	movq	24(%rax), %r8	 ; _123->path, _124
	movq	%r8, 48(%rsp)	 ; _124, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2766:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r12, 32(%rsp)	 ; _120,
	movq	56(%rsp), %r9	 ; %sfp, _122
	leaq	.LC170(%rip), %rdx	 ;, tmp455
	movq	48(%rsp), %r8	 ; %sfp, _124
 ; ./asm_test/win/i/all.c:2766:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp678, _125
 ; ./asm_test/win/i/all.c:2766:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
.L1310:
 ; ./asm_test/win/i/all.c:2767:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2768:     if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpl	$5, 24(%rax)	 ;, token_126->type
	jne	.L1311	 ;,
 ; ./asm_test/win/i/all.c:2768:     if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movq	8+symbolList(%rip), %rdi	 ; symbolList[1], tmp778
	cmpq	%rdi, (%rax)	 ; tmp778, token_126->lexeme
	je	.L1312	 ;,
.L1311:
 ; ./asm_test/win/i/all.c:2769:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_126->column, tmp779
	movq	8(%rax), %r9	 ; token_126->line, token_126->line
	movl	$2, %ecx	 ;,
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _133
	leaq	1(%rdi), %rbx	 ;, _131
	movq	24(%rax), %r8	 ; _134->path, _135
	movq	%r9, 56(%rsp)	 ; _133, %sfp
	movq	%r8, 48(%rsp)	 ; _135, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2769:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _131,
	movq	56(%rsp), %r9	 ; %sfp, _133
	leaq	.LC171(%rip), %rdx	 ;, tmp462
	movq	48(%rsp), %r8	 ; %sfp, _135
 ; ./asm_test/win/i/all.c:2769:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp680, _136
.L1395:
 ; ./asm_test/win/i/all.c:2769:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
.L1309:
 ; ./asm_test/win/i/all.c:2761:         return NULL;
	xorl	%edx, %edx	 ; if_
	jmp	.L1313	 ;
.L1312:
 ; ./asm_test/win/i/all.c:2772:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2773:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	cmpl	$5, 24(%rax)	 ;, token_137->type
	jne	.L1314	 ;,
 ; ./asm_test/win/i/all.c:2773:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	movq	16+symbolList(%rip), %rdi	 ; symbolList[2], tmp780
	cmpq	%rdi, (%rax)	 ; tmp780, token_137->lexeme
	je	.L1315	 ;,
.L1314:
 ; ./asm_test/win/i/all.c:2774:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start if body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_137->column, tmp781
	movq	8(%rax), %r9	 ; token_137->line, token_137->line
	movl	$2, %ecx	 ;,
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _144
	leaq	1(%rdi), %rbx	 ;, _142
	movq	24(%rax), %r8	 ; _145->path, _146
	movq	%r9, 56(%rsp)	 ; _144, %sfp
	movq	%r8, 48(%rsp)	 ; _146, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2774:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start if body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _142,
	movq	56(%rsp), %r9	 ; %sfp, _144
	leaq	.LC172(%rip), %rdx	 ;, tmp469
	movq	48(%rsp), %r8	 ; %sfp, _146
 ; ./asm_test/win/i/all.c:2774:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start if body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp682, _147
	jmp	.L1395	 ;
.L1315:
 ; ./asm_test/win/i/all.c:2777:     List* body = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:2778:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; ./asm_test/win/i/all.c:2782:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse if body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	leaq	.LC173(%rip), %r12	 ;, tmp666
 ; ./asm_test/win/i/all.c:2777:     List* body = create_list();
	movq	%rax, %r14	 ; tmp683, body
 ; ./asm_test/win/i/all.c:2778:     token = get_next_token(lexer, 1);
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp684, token
.L1316:
 ; ./asm_test/win/i/all.c:2779:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	cmpl	$5, 24(%r15)	 ;, token_151->type
	je	.L1405	 ;,
.L1318:
 ; ./asm_test/win/i/all.c:2780:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	%rsi, %r8	 ; parser,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r13	 ; tmp685, statement
 ; ./asm_test/win/i/all.c:2781:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L1317	 ;,
 ; ./asm_test/win/i/all.c:2782:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse if body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r15), %rax	 ; token_151->column, tmp782
	movq	8(%r15), %r9	 ; token_151->line, token_151->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rdi	 ;, _153
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _155
	movq	%r9, 56(%rsp)	 ; _155, %sfp
	movq	24(%rax), %r8	 ; _156->path, _157
	movq	%r8, 48(%rsp)	 ; _157, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2782:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse if body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _153,
	movq	56(%rsp), %r9	 ; %sfp, _155
	movq	%r12, %rdx	 ; tmp666,
	movq	48(%rsp), %r8	 ; %sfp, _157
 ; ./asm_test/win/i/all.c:2782:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse if body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp686, _158
 ; ./asm_test/win/i/all.c:2782:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse if body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
.L1317:
 ; ./asm_test/win/i/all.c:2783:         list_append(body, (size_t*)statement);
	movq	%r13, %rdx	 ; statement,
	movq	%r14, %rcx	 ; body,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2784:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp687, token
	jmp	.L1316	 ;
.L1405:
 ; ./asm_test/win/i/all.c:2779:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	movq	24+symbolList(%rip), %rax	 ; symbolList[3], tmp783
	cmpq	%rax, (%r15)	 ; tmp783, token_151->lexeme
	jne	.L1318	 ;,
 ; ./asm_test/win/i/all.c:2786:     List* else_if = create_list();
	call	create_list	 ;
	movq	%rax, %r13	 ; tmp688, else_if
 ; ./asm_test/win/i/all.c:2787:     List* else_body = create_list();
	call	create_list	 ;
	movq	%rax, %r12	 ; tmp689, else_body
.L1397:
 ; ./asm_test/win/i/all.c:2820:         token = peek_next_token(lexer, 1);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token.constprop.0	 ;
 ; ./asm_test/win/i/all.c:2789:     while (token->type == KEYWORD && token->lexeme == keywordList[7]) {
	cmpl	$6, 24(%rax)	 ;, token_228->type
	jne	.L1332	 ;,
 ; ./asm_test/win/i/all.c:2789:     while (token->type == KEYWORD && token->lexeme == keywordList[7]) {
	movq	(%rax), %rax	 ; token_228->lexeme, _230
 ; ./asm_test/win/i/all.c:2789:     while (token->type == KEYWORD && token->lexeme == keywordList[7]) {
	cmpq	56+keywordList(%rip), %rax	 ; keywordList[7], _230
	jne	.L1406	 ;,
 ; ./asm_test/win/i/all.c:2790:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2791:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2792:         if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	cmpl	$5, 24(%rax)	 ;, token_166->type
	jne	.L1320	 ;,
 ; ./asm_test/win/i/all.c:2792:         if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	movq	symbolList(%rip), %rdi	 ; symbolList[0], tmp784
	cmpq	%rdi, (%rax)	 ; tmp784, token_166->lexeme
	je	.L1321	 ;,
.L1320:
 ; ./asm_test/win/i/all.c:2793:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after 'elif'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_166->column, tmp785
	movq	8(%rax), %r9	 ; token_166->line, token_166->line
	movl	$2, %ecx	 ;,
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _174
	leaq	1(%rdi), %rbx	 ;, _172
	movq	24(%rax), %r8	 ; _175->path, _176
	movq	%r9, 56(%rsp)	 ; _174, %sfp
	movq	%r8, 48(%rsp)	 ; _176, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2793:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after 'elif'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _172,
	movq	56(%rsp), %r9	 ; %sfp, _174
	leaq	.LC174(%rip), %rdx	 ;, tmp483
	movq	48(%rsp), %r8	 ; %sfp, _176
 ; ./asm_test/win/i/all.c:2793:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after 'elif'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp692, _177
	jmp	.L1395	 ;
.L1321:
 ; ./asm_test/win/i/all.c:2796:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2797:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	%rsi, %r8	 ; parser,
	movq	%rbx, %rcx	 ; lexer,
 ; ./asm_test/win/i/all.c:2796:         token = get_next_token(lexer, 1);
	movq	%rax, %r15	 ; tmp693, token
 ; ./asm_test/win/i/all.c:2797:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rdi	 ; tmp694, elif_condition
 ; ./asm_test/win/i/all.c:2798:         if (elif_condition == NULL)
	testq	%rax, %rax	 ; elif_condition
	jne	.L1322	 ;,
 ; ./asm_test/win/i/all.c:2799:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse else-if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r15), %rax	 ; token_178->column, tmp786
	movq	8(%r15), %r9	 ; token_178->line, token_178->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rdx	 ;, _181
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _183
	movq	%rdx, 64(%rsp)	 ; _181, %sfp
	movq	24(%rax), %r8	 ; _184->path, _185
	movq	%r9, 56(%rsp)	 ; _183, %sfp
	movq	%r8, 48(%rsp)	 ; _185, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2799:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse else-if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	64(%rsp), %rdx	 ; %sfp, _181
	movq	56(%rsp), %r9	 ; %sfp, _183
	movq	48(%rsp), %r8	 ; %sfp, _185
 ; ./asm_test/win/i/all.c:2799:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse else-if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp695, _186
 ; ./asm_test/win/i/all.c:2799:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse else-if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdx, 32(%rsp)	 ; _181,
	leaq	.LC175(%rip), %rdx	 ;, tmp488
	call	fprintf	 ;
.L1322:
 ; ./asm_test/win/i/all.c:2800:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2801:         if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpl	$5, 24(%rax)	 ;, token_187->type
	jne	.L1323	 ;,
 ; ./asm_test/win/i/all.c:2801:         if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movq	8+symbolList(%rip), %rdx	 ; symbolList[1], tmp787
	cmpq	%rdx, (%rax)	 ; tmp787, token_187->lexeme
	je	.L1324	 ;,
.L1323:
 ; ./asm_test/win/i/all.c:2802:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after else-if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_187->column, tmp788
	movq	8(%rax), %r9	 ; token_187->line, token_187->line
	movl	$2, %ecx	 ;,
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _195
	leaq	1(%rdi), %rbx	 ;, _193
	movq	24(%rax), %r8	 ; _196->path, _197
	movq	%r9, 56(%rsp)	 ; _195, %sfp
	movq	%r8, 48(%rsp)	 ; _197, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2802:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after else-if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _193,
	movq	56(%rsp), %r9	 ; %sfp, _195
	leaq	.LC176(%rip), %rdx	 ;, tmp495
	movq	48(%rsp), %r8	 ; %sfp, _197
 ; ./asm_test/win/i/all.c:2802:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after else-if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp697, _198
	jmp	.L1395	 ;
.L1324:
 ; ./asm_test/win/i/all.c:2805:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2806:         if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	cmpl	$5, 24(%rax)	 ;, token_199->type
	jne	.L1325	 ;,
 ; ./asm_test/win/i/all.c:2806:         if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	movq	16+symbolList(%rip), %rdx	 ; symbolList[2], tmp789
	cmpq	%rdx, (%rax)	 ; tmp789, token_199->lexeme
	je	.L1326	 ;,
.L1325:
 ; ./asm_test/win/i/all.c:2807:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start else-if body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_199->column, tmp790
	movq	8(%rax), %r9	 ; token_199->line, token_199->line
	movl	$2, %ecx	 ;,
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _207
	leaq	1(%rdi), %rbx	 ;, _205
	movq	24(%rax), %r8	 ; _208->path, _209
	movq	%r9, 56(%rsp)	 ; _207, %sfp
	movq	%r8, 48(%rsp)	 ; _209, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2807:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start else-if body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _205,
	movq	56(%rsp), %r9	 ; %sfp, _207
	leaq	.LC177(%rip), %rdx	 ;, tmp502
	movq	48(%rsp), %r8	 ; %sfp, _209
 ; ./asm_test/win/i/all.c:2807:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start else-if body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp699, _210
	jmp	.L1395	 ;
.L1326:
 ; ./asm_test/win/i/all.c:2810:         List* elif_body = create_list();
	call	create_list	 ;
	movq	%rax, %r15	 ; tmp700, elif_body
.L1396:
 ; ./asm_test/win/i/all.c:2817:             token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2812:         while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	cmpl	$5, 24(%rax)	 ;, token_214->type
 ; ./asm_test/win/i/all.c:2817:             token = get_next_token(lexer, 1);
	movq	%rax, %r9	 ; tmp704, token
 ; ./asm_test/win/i/all.c:2812:         while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	je	.L1407	 ;,
.L1329:
 ; ./asm_test/win/i/all.c:2813:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	%rsi, %r8	 ; parser,
	movq	%rbx, %rcx	 ; lexer,
	movq	%r9, 48(%rsp)	 ; token, %sfp
	call	parse_statement	 ;
 ; ./asm_test/win/i/all.c:2814:             if (statement == NULL)
	movq	48(%rsp), %r9	 ; %sfp, token
	testq	%rax, %rax	 ; statement
 ; ./asm_test/win/i/all.c:2813:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rax, %r10	 ; tmp702, statement
 ; ./asm_test/win/i/all.c:2814:             if (statement == NULL)
	jne	.L1328	 ;,
	movq	%rax, 72(%rsp)	 ; statement, %sfp
 ; ./asm_test/win/i/all.c:2815:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse else-if body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r9), %rax	 ; token_214->column, tmp791
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rdx	 ;, _216
	movq	8(%r9), %rax	 ; token_214->line, token_214->line
	movq	%rdx, 64(%rsp)	 ; _216, %sfp
	leaq	1(%rax), %r9	 ;, _218
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	movq	%r9, 56(%rsp)	 ; _218, %sfp
	movq	24(%rax), %r8	 ; _219->path, _220
	movq	%r8, 48(%rsp)	 ; _220, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2815:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse else-if body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	64(%rsp), %rdx	 ; %sfp, _216
	movq	56(%rsp), %r9	 ; %sfp, _218
	movq	48(%rsp), %r8	 ; %sfp, _220
 ; ./asm_test/win/i/all.c:2815:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse else-if body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp703, _221
 ; ./asm_test/win/i/all.c:2815:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse else-if body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdx, 32(%rsp)	 ; _216,
	leaq	.LC178(%rip), %rdx	 ;,
	call	fprintf	 ;
	movq	72(%rsp), %r10	 ; %sfp, statement
.L1328:
 ; ./asm_test/win/i/all.c:2816:             list_append(elif_body, (size_t*)statement);
	movq	%r10, %rdx	 ; statement,
	movq	%r15, %rcx	 ; elif_body,
	call	list_append	 ;
	jmp	.L1396	 ;
.L1407:
 ; ./asm_test/win/i/all.c:2812:         while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	movq	24+symbolList(%rip), %rax	 ; symbolList[3], tmp792
	cmpq	%rax, (%r9)	 ; tmp792, token_214->lexeme
	jne	.L1329	 ;,
 ; ./asm_test/win/i/all.c:802:     if (condition == NULL) {
	testq	%rdi, %rdi	 ; elif_condition
	jne	.L1330	 ;,
 ; ./asm_test/win/i/all.c:803:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:803:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	leaq	.LC179(%rip), %rcx	 ;, tmp511
 ; ./asm_test/win/i/all.c:803:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	movq	%rax, %rdx	 ; tmp705, _263
 ; ./asm_test/win/i/all.c:803:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:804:         return NULL;
	jmp	.L1331	 ;
.L1330:
 ; ./asm_test/win/i/all.c:806:     ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:808:     else_if->body = body;
	movq	%r15, 8(%rax)	 ; elif_body, else_if_264->body
 ; ./asm_test/win/i/all.c:807:     else_if->condition = condition;
	movq	%rdi, (%rax)	 ; elif_condition, else_if_264->condition
 ; ./asm_test/win/i/all.c:809:     return else_if;
	movq	%rax, %rdi	 ; else_if, elif_condition
.L1331:
 ; ./asm_test/win/i/all.c:2819:         list_append(else_if, (size_t*)create_else_if(elif_condition, elif_body));
	movq	%rdi, %rdx	 ; elif_condition,
	movq	%r13, %rcx	 ; else_if,
	call	list_append	 ;
	jmp	.L1397	 ;
.L1406:
 ; ./asm_test/win/i/all.c:2822:     if (token->type == KEYWORD && token->lexeme == keywordList[8]) {
	cmpq	64+keywordList(%rip), %rax	 ; keywordList[8], _230
	je	.L1408	 ;,
.L1332:
 ; ./asm_test/win/i/all.c:790:     if (condition == NULL) {
	testq	%rbp, %rbp	 ; condition
	jne	.L1393	 ;,
 ; ./asm_test/win/i/all.c:791:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:791:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	leaq	.LC182(%rip), %rcx	 ;, tmp529
 ; ./asm_test/win/i/all.c:791:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	movq	%rax, %rdx	 ; tmp714, _266
 ; ./asm_test/win/i/all.c:791:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:792:         return NULL;
	jmp	.L1309	 ;
.L1408:
 ; ./asm_test/win/i/all.c:2823:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2824:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2825:         if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	cmpl	$5, 24(%rax)	 ;, token_236->type
	jne	.L1337	 ;,
 ; ./asm_test/win/i/all.c:2825:         if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	movq	16+symbolList(%rip), %rdi	 ; symbolList[2], tmp793
	cmpq	%rdi, (%rax)	 ; tmp793, token_236->lexeme
	je	.L1398	 ;,
.L1337:
 ; ./asm_test/win/i/all.c:2826:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start else body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_236->column, tmp794
	movq	8(%rax), %r9	 ; token_236->line, token_236->line
	movl	$2, %ecx	 ;,
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _243
	leaq	1(%rdi), %rbx	 ;, _241
	movq	24(%rax), %r8	 ; _244->path, _245
	movq	%r9, 56(%rsp)	 ; _243, %sfp
	movq	%r8, 48(%rsp)	 ; _245, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2826:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start else body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _241,
	movq	56(%rsp), %r9	 ; %sfp, _243
	leaq	.LC180(%rip), %rdx	 ;, tmp520
	movq	48(%rsp), %r8	 ; %sfp, _245
 ; ./asm_test/win/i/all.c:2826:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start else body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp709, _246
	jmp	.L1395	 ;
.L1409:
 ; ./asm_test/win/i/all.c:2830:         while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	movq	24+symbolList(%rip), %rax	 ; symbolList[3], tmp796
	cmpq	%rax, (%rdi)	 ; tmp796, token_249->lexeme
	je	.L1332	 ;,
.L1341:
 ; ./asm_test/win/i/all.c:2831:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	%rsi, %r8	 ; parser,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r15	 ; tmp711, statement
 ; ./asm_test/win/i/all.c:2832:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L1340	 ;,
 ; ./asm_test/win/i/all.c:2833:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse else body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rdi), %rax	 ; token_249->column, tmp795
	movq	8(%rdi), %r9	 ; token_249->line, token_249->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rdx	 ;, _251
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _253
	movq	%rdx, 64(%rsp)	 ; _251, %sfp
	movq	24(%rax), %r8	 ; _254->path, _255
	movq	%r9, 56(%rsp)	 ; _253, %sfp
	movq	%r8, 48(%rsp)	 ; _255, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2833:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse else body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	64(%rsp), %rdx	 ; %sfp, _251
	movq	56(%rsp), %r9	 ; %sfp, _253
	movq	48(%rsp), %r8	 ; %sfp, _255
 ; ./asm_test/win/i/all.c:2833:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse else body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp712, _256
 ; ./asm_test/win/i/all.c:2833:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse else body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdx, 32(%rsp)	 ; _251,
	leaq	.LC181(%rip), %rdx	 ;,
	call	fprintf	 ;
.L1340:
 ; ./asm_test/win/i/all.c:2834:             list_append(else_body, (size_t*)statement);
	movq	%r15, %rdx	 ; statement,
	movq	%r12, %rcx	 ; else_body,
	call	list_append	 ;
.L1398:
 ; ./asm_test/win/i/all.c:2835:             token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2830:         while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	cmpl	$5, 24(%rax)	 ;, token_249->type
 ; ./asm_test/win/i/all.c:2835:             token = get_next_token(lexer, 1);
	movq	%rax, %rdi	 ; tmp713, token
 ; ./asm_test/win/i/all.c:2830:         while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	je	.L1409	 ;,
	jmp	.L1341	 ;
.L1393:
 ; ./asm_test/win/i/all.c:794:     If* if_ = (If*)alloc_memory(sizeof(If));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:795:     if_->condition = condition;
	movq	%rbp, (%rax)	 ; condition, if__267->condition
 ; ./asm_test/win/i/all.c:794:     If* if_ = (If*)alloc_memory(sizeof(If));
	movq	%rax, %rdx	 ; tmp715, if_
 ; ./asm_test/win/i/all.c:796:     if_->body = body;
	movq	%r14, 8(%rax)	 ; body, if__267->body
 ; ./asm_test/win/i/all.c:797:     if_->else_if = else_if;
	movq	%r13, 16(%rax)	 ; else_if, if__267->else_if
 ; ./asm_test/win/i/all.c:798:     if_->else_body = else_body;
	movq	%r12, 24(%rax)	 ; else_body, if__267->else_body
.L1313:
 ; ./asm_test/win/i/all.c:2718:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	xorl	%edi, %edi	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$2, %ecx	 ;,
	movq	%rdi, 40(%rsp)	 ;,
	movq	%rdi, 32(%rsp)	 ;,
	jmp	.L1404	 ;
.L1306:
 ; ./asm_test/win/i/all.c:2719:         else if (token->lexeme == keywordList[10])
	cmpq	80+keywordList(%rip), %rax	 ; keywordList[10], _2
	jne	.L1343	 ;,
 ; ./asm_test/win/i/all.c:2843:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2844:     if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	cmpl	$5, 24(%rax)	 ;, token_269->type
	jne	.L1344	 ;,
 ; ./asm_test/win/i/all.c:2844:     if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	movq	symbolList(%rip), %rdi	 ; symbolList[0], tmp797
	cmpq	%rdi, (%rax)	 ; tmp797, token_269->lexeme
	je	.L1345	 ;,
.L1344:
 ; ./asm_test/win/i/all.c:2845:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after 'for'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_269->column, tmp798
	movq	8(%rax), %r9	 ; token_269->line, token_269->line
	movl	$2, %ecx	 ;,
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _276
	leaq	1(%rdi), %rbx	 ;, _274
	movq	24(%rax), %r8	 ; _277->path, _278
	movq	%r9, 56(%rsp)	 ; _276, %sfp
	movq	%r8, 48(%rsp)	 ; _278, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2845:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after 'for'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _274,
	movq	56(%rsp), %r9	 ; %sfp, _276
	leaq	.LC183(%rip), %rdx	 ;, tmp537
	movq	48(%rsp), %r8	 ; %sfp, _278
 ; ./asm_test/win/i/all.c:2845:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after 'for'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp718, _279
	jmp	.L1399	 ;
.L1345:
 ; ./asm_test/win/i/all.c:2848:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2850:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	cmpl	$5, 24(%rax)	 ;, token_280->type
 ; ./asm_test/win/i/all.c:2848:     token = get_next_token(lexer, 1);
	movq	%rax, %rdi	 ; tmp719, token
 ; ./asm_test/win/i/all.c:2850:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	jne	.L1347	 ;,
 ; ./asm_test/win/i/all.c:2850:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	movq	72+symbolList(%rip), %rax	 ; symbolList[9], tmp799
	cmpq	%rax, (%rdi)	 ; tmp799, token_280->lexeme
	je	.L1389	 ;,
.L1347:
 ; ./asm_test/win/i/all.c:2851:         initializer = parse_variable(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	%rsi, %r8	 ; parser,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
	movq	%rax, %r12	 ; tmp720, initializer
 ; ./asm_test/win/i/all.c:2852:         if (initializer == NULL)
	testq	%rax, %rax	 ; initializer
	jne	.L1349	 ;,
 ; ./asm_test/win/i/all.c:2853:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rdi), %rax	 ; token_280->column, tmp800
	movq	8(%rdi), %r9	 ; token_280->line, token_280->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rbp	 ;, _286
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _288
	movq	%r9, 56(%rsp)	 ; _288, %sfp
	movq	24(%rax), %r8	 ; _289->path, _290
	movq	%r8, 48(%rsp)	 ; _290, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2853:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbp, 32(%rsp)	 ; _286,
	movq	56(%rsp), %r9	 ; %sfp, _288
	leaq	.LC184(%rip), %rdx	 ;, tmp544
	movq	48(%rsp), %r8	 ; %sfp, _290
 ; ./asm_test/win/i/all.c:2853:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp721, _291
 ; ./asm_test/win/i/all.c:2853:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
.L1349:
 ; ./asm_test/win/i/all.c:2854:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2856:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	cmpl	$5, 24(%rax)	 ;, token_292->type
	jne	.L1350	 ;,
 ; ./asm_test/win/i/all.c:2856:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	movq	72+symbolList(%rip), %rdi	 ; symbolList[9], tmp801
	cmpq	%rdi, (%rax)	 ; tmp801, token_292->lexeme
	je	.L1348	 ;,
.L1350:
 ; ./asm_test/win/i/all.c:2857:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_292->column, tmp802
	movq	8(%rax), %r9	 ; token_292->line, token_292->line
	movl	$2, %ecx	 ;,
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _300
	leaq	1(%rdi), %rbx	 ;, _298
	movq	24(%rax), %r8	 ; _301->path, _302
	movq	%r9, 56(%rsp)	 ; _300, %sfp
	movq	%r8, 48(%rsp)	 ; _302, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2857:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _298,
	movq	56(%rsp), %r9	 ; %sfp, _300
	leaq	.LC185(%rip), %rdx	 ;, tmp551
	movq	48(%rsp), %r8	 ; %sfp, _302
 ; ./asm_test/win/i/all.c:2857:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp723, _303
.L1399:
 ; ./asm_test/win/i/all.c:2857:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2846:         return NULL;
	xorl	%r9d, %r9d	 ; for_
	jmp	.L1351	 ;
.L1389:
 ; ./asm_test/win/i/all.c:2849:     Variable* initializer = NULL;
	xorl	%r12d, %r12d	 ; initializer
.L1348:
 ; ./asm_test/win/i/all.c:2860:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2862:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	cmpl	$5, 24(%rax)	 ;, token_304->type
 ; ./asm_test/win/i/all.c:2860:     token = get_next_token(lexer, 1);
	movq	%rax, %rdi	 ; tmp724, token
 ; ./asm_test/win/i/all.c:2862:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	jne	.L1352	 ;,
 ; ./asm_test/win/i/all.c:2862:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	movq	72+symbolList(%rip), %rax	 ; symbolList[9], tmp803
	cmpq	%rax, (%rdi)	 ; tmp803, token_304->lexeme
	je	.L1390	 ;,
.L1352:
 ; ./asm_test/win/i/all.c:2863:         condition = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	%rsi, %r8	 ; parser,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %rbp	 ; tmp725, condition
 ; ./asm_test/win/i/all.c:2864:         if (condition == NULL)
	testq	%rax, %rax	 ; condition
	jne	.L1354	 ;,
 ; ./asm_test/win/i/all.c:2865:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rdi), %rax	 ; token_304->column, tmp804
	movq	8(%rdi), %r9	 ; token_304->line, token_304->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %r13	 ;, _310
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _312
	movq	%r9, 56(%rsp)	 ; _312, %sfp
	movq	24(%rax), %r8	 ; _313->path, _314
	movq	%r8, 48(%rsp)	 ; _314, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2865:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r13, 32(%rsp)	 ; _310,
	movq	56(%rsp), %r9	 ; %sfp, _312
	leaq	.LC186(%rip), %rdx	 ;, tmp558
	movq	48(%rsp), %r8	 ; %sfp, _314
 ; ./asm_test/win/i/all.c:2865:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp726, _315
 ; ./asm_test/win/i/all.c:2865:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
.L1354:
 ; ./asm_test/win/i/all.c:2866:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2868:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	cmpl	$5, 24(%rax)	 ;, token_316->type
	jne	.L1355	 ;,
 ; ./asm_test/win/i/all.c:2868:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	movq	72+symbolList(%rip), %rdi	 ; symbolList[9], tmp805
	cmpq	%rdi, (%rax)	 ; tmp805, token_316->lexeme
	je	.L1353	 ;,
.L1355:
 ; ./asm_test/win/i/all.c:2869:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_316->column, tmp806
	movq	8(%rax), %r9	 ; token_316->line, token_316->line
	movl	$2, %ecx	 ;,
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _324
	leaq	1(%rdi), %rbx	 ;, _322
	movq	24(%rax), %r8	 ; _325->path, _326
	movq	%r9, 56(%rsp)	 ; _324, %sfp
	movq	%r8, 48(%rsp)	 ; _326, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2869:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _322,
	movq	56(%rsp), %r9	 ; %sfp, _324
	leaq	.LC187(%rip), %rdx	 ;, tmp565
	movq	48(%rsp), %r8	 ; %sfp, _326
 ; ./asm_test/win/i/all.c:2869:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp728, _327
	jmp	.L1399	 ;
.L1390:
 ; ./asm_test/win/i/all.c:2861:     Expression* condition = NULL;
	xorl	%ebp, %ebp	 ; condition
.L1353:
 ; ./asm_test/win/i/all.c:2872:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2874:     if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpl	$5, 24(%rax)	 ;, token_328->type
 ; ./asm_test/win/i/all.c:2872:     token = get_next_token(lexer, 1);
	movq	%rax, %r13	 ; tmp729, token
 ; ./asm_test/win/i/all.c:2874:     if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	jne	.L1356	 ;,
 ; ./asm_test/win/i/all.c:2874:     if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movq	8+symbolList(%rip), %rax	 ; symbolList[1], tmp807
	cmpq	%rax, 0(%r13)	 ; tmp807, token_328->lexeme
	je	.L1391	 ;,
.L1356:
 ; ./asm_test/win/i/all.c:2875:         increment = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	%rsi, %r8	 ; parser,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %rdi	 ; tmp730, increment
 ; ./asm_test/win/i/all.c:2876:         if (increment == NULL)
	testq	%rax, %rax	 ; increment
	jne	.L1358	 ;,
 ; ./asm_test/win/i/all.c:2877:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop increment\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r13), %rax	 ; token_328->column, tmp808
	movq	8(%r13), %r9	 ; token_328->line, token_328->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %r14	 ;, _334
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _336
	movq	%r9, 56(%rsp)	 ; _336, %sfp
	movq	24(%rax), %r8	 ; _337->path, _338
	movq	%r8, 48(%rsp)	 ; _338, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2877:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop increment\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r14, 32(%rsp)	 ; _334,
	movq	56(%rsp), %r9	 ; %sfp, _336
	leaq	.LC188(%rip), %rdx	 ;, tmp572
	movq	48(%rsp), %r8	 ; %sfp, _338
 ; ./asm_test/win/i/all.c:2877:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop increment\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp731, _339
 ; ./asm_test/win/i/all.c:2877:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop increment\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
.L1358:
 ; ./asm_test/win/i/all.c:2878:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2880:     if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpl	$5, 24(%rax)	 ;, token_340->type
	jne	.L1359	 ;,
 ; ./asm_test/win/i/all.c:2880:     if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movq	8+symbolList(%rip), %rdx	 ; symbolList[1], tmp809
	cmpq	%rdx, (%rax)	 ; tmp809, token_340->lexeme
	je	.L1357	 ;,
.L1359:
 ; ./asm_test/win/i/all.c:2881:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after for loop increment\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_340->column, tmp810
	movq	8(%rax), %r9	 ; token_340->line, token_340->line
	movl	$2, %ecx	 ;,
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _348
	leaq	1(%rdi), %rbx	 ;, _346
	movq	24(%rax), %r8	 ; _349->path, _350
	movq	%r9, 56(%rsp)	 ; _348, %sfp
	movq	%r8, 48(%rsp)	 ; _350, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2881:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after for loop increment\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _346,
	movq	56(%rsp), %r9	 ; %sfp, _348
	leaq	.LC189(%rip), %rdx	 ;, tmp579
	movq	48(%rsp), %r8	 ; %sfp, _350
 ; ./asm_test/win/i/all.c:2881:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after for loop increment\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp733, _351
	jmp	.L1399	 ;
.L1391:
 ; ./asm_test/win/i/all.c:2873:     Expression* increment = NULL;
	xorl	%edi, %edi	 ; increment
.L1357:
 ; ./asm_test/win/i/all.c:2884:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2885:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	cmpl	$5, 24(%rax)	 ;, token_352->type
	jne	.L1360	 ;,
 ; ./asm_test/win/i/all.c:2885:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	movq	16+symbolList(%rip), %rdx	 ; symbolList[2], tmp811
	cmpq	%rdx, (%rax)	 ; tmp811, token_352->lexeme
	je	.L1361	 ;,
.L1360:
 ; ./asm_test/win/i/all.c:2886:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start for loop body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_352->column, tmp812
	movq	8(%rax), %r9	 ; token_352->line, token_352->line
	movl	$2, %ecx	 ;,
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _359
	leaq	1(%rdi), %rbx	 ;, _357
	movq	24(%rax), %r8	 ; _360->path, _361
	movq	%r9, 56(%rsp)	 ; _359, %sfp
	movq	%r8, 48(%rsp)	 ; _361, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2886:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start for loop body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _357,
	movq	56(%rsp), %r9	 ; %sfp, _359
	leaq	.LC190(%rip), %rdx	 ;, tmp586
	movq	48(%rsp), %r8	 ; %sfp, _361
 ; ./asm_test/win/i/all.c:2886:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start for loop body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp735, _362
	jmp	.L1399	 ;
.L1361:
 ; ./asm_test/win/i/all.c:2889:     List* body = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:2890:     parser->in_loop = 1;
	movb	$1, 11(%rsi)	 ;, parser_64(D)->in_loop
 ; ./asm_test/win/i/all.c:2889:     List* body = create_list();
	movq	%rax, %r13	 ; tmp736, body
.L1400:
 ; ./asm_test/win/i/all.c:2897:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2892:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	cmpl	$5, 24(%rax)	 ;, token_366->type
 ; ./asm_test/win/i/all.c:2897:         token = get_next_token(lexer, 1);
	movq	%rax, %r14	 ; tmp740, token
 ; ./asm_test/win/i/all.c:2892:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	je	.L1410	 ;,
.L1364:
 ; ./asm_test/win/i/all.c:2893:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	%rsi, %r8	 ; parser,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r15	 ; tmp738, statement
 ; ./asm_test/win/i/all.c:2894:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L1363	 ;,
 ; ./asm_test/win/i/all.c:2895:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r14), %rax	 ; token_366->column, tmp813
	movq	8(%r14), %r9	 ; token_366->line, token_366->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rdx	 ;, _368
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _370
	movq	%rdx, 64(%rsp)	 ; _368, %sfp
	movq	24(%rax), %r8	 ; _371->path, _372
	movq	%r9, 56(%rsp)	 ; _370, %sfp
	movq	%r8, 48(%rsp)	 ; _372, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2895:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	64(%rsp), %rdx	 ; %sfp, _368
	movq	56(%rsp), %r9	 ; %sfp, _370
	movq	48(%rsp), %r8	 ; %sfp, _372
 ; ./asm_test/win/i/all.c:2895:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp739, _373
 ; ./asm_test/win/i/all.c:2895:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse for loop body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdx, 32(%rsp)	 ; _368,
	leaq	.LC191(%rip), %rdx	 ;,
	call	fprintf	 ;
.L1363:
 ; ./asm_test/win/i/all.c:2896:         list_append(body, (size_t*)statement);
	movq	%r15, %rdx	 ; statement,
	movq	%r13, %rcx	 ; body,
	call	list_append	 ;
	jmp	.L1400	 ;
.L1410:
 ; ./asm_test/win/i/all.c:2892:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	movq	24+symbolList(%rip), %rax	 ; symbolList[3], tmp814
	cmpq	%rax, (%r14)	 ; tmp814, token_366->lexeme
	jne	.L1364	 ;,
 ; ./asm_test/win/i/all.c:2899:     parser->in_loop = 0;
	movb	$0, 11(%rsi)	 ;, parser_64(D)->in_loop
 ; ./asm_test/win/i/all.c:812:     For* for_ = (For*)alloc_memory(sizeof(For));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:813:     for_->initializer = initializer;
	movq	%r12, (%rax)	 ; initializer, for__383->initializer
 ; ./asm_test/win/i/all.c:812:     For* for_ = (For*)alloc_memory(sizeof(For));
	movq	%rax, %r9	 ; tmp741, for_
 ; ./asm_test/win/i/all.c:814:     for_->condition = condition;
	movq	%rbp, 8(%rax)	 ; condition, for__383->condition
 ; ./asm_test/win/i/all.c:815:     for_->increment = increment;
	movq	%rdi, 16(%rax)	 ; increment, for__383->increment
 ; ./asm_test/win/i/all.c:816:     for_->body = body;
	movq	%r13, 24(%rax)	 ; body, for__383->body
.L1351:
 ; ./asm_test/win/i/all.c:2720:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	xorl	%esi, %esi	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$4, %ecx	 ;,
	movq	%rsi, 40(%rsp)	 ;,
	movq	%rsi, 32(%rsp)	 ;,
.L1404:
	call	create_statement	 ;
	movq	%rax, %rdi	 ; tmp742, <retval>
 ; ./asm_test/win/i/all.c:2720:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L1304	 ;
.L1343:
 ; ./asm_test/win/i/all.c:2721:         else if (token->lexeme == keywordList[9])
	cmpq	72+keywordList(%rip), %rax	 ; keywordList[9], _2
	jne	.L1365	 ;,
 ; ./asm_test/win/i/all.c:2904:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2905:     if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	cmpl	$5, 24(%rax)	 ;, token_384->type
	jne	.L1366	 ;,
 ; ./asm_test/win/i/all.c:2905:     if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	movq	symbolList(%rip), %rdi	 ; symbolList[0], tmp815
	cmpq	%rdi, (%rax)	 ; tmp815, token_384->lexeme
	je	.L1367	 ;,
.L1366:
 ; ./asm_test/win/i/all.c:2906:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after 'while'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rbx	 ; token_384->column, tmp816
	movq	8(%rax), %r9	 ; token_384->line, token_384->line
	movl	$2, %ecx	 ;,
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _391
	incq	%rbx	 ; _389
	movq	24(%rax), %r8	 ; _392->path, _393
	movq	%r9, 56(%rsp)	 ; _391, %sfp
	movq	%r8, 48(%rsp)	 ; _393, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2906:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after 'while'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _389,
	movq	56(%rsp), %r9	 ; %sfp, _391
	leaq	.LC192(%rip), %rdx	 ;, tmp601
	movq	48(%rsp), %r8	 ; %sfp, _393
 ; ./asm_test/win/i/all.c:2906:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after 'while'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp744, _394
	jmp	.L1401	 ;
.L1367:
 ; ./asm_test/win/i/all.c:2909:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2910:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	%rsi, %r8	 ; parser,
	movq	%rbx, %rcx	 ; lexer,
 ; ./asm_test/win/i/all.c:2909:     token = get_next_token(lexer, 1);
	movq	%rax, %rdi	 ; tmp745, token
 ; ./asm_test/win/i/all.c:2910:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rbp	 ; tmp746, condition
 ; ./asm_test/win/i/all.c:2911:     if (condition == NULL)
	testq	%rax, %rax	 ; condition
	jne	.L1369	 ;,
 ; ./asm_test/win/i/all.c:2912:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse while condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rdi), %rax	 ; token_395->column, tmp817
	movq	8(%rdi), %r9	 ; token_395->line, token_395->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %r12	 ;, _398
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _400
	movq	%r9, 56(%rsp)	 ; _400, %sfp
	movq	24(%rax), %r8	 ; _401->path, _402
	movq	%r8, 48(%rsp)	 ; _402, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2912:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse while condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r12, 32(%rsp)	 ; _398,
	movq	56(%rsp), %r9	 ; %sfp, _400
	leaq	.LC193(%rip), %rdx	 ;, tmp606
	movq	48(%rsp), %r8	 ; %sfp, _402
 ; ./asm_test/win/i/all.c:2912:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse while condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp747, _403
 ; ./asm_test/win/i/all.c:2912:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse while condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
.L1369:
 ; ./asm_test/win/i/all.c:2913:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2914:     if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpl	$5, 24(%rax)	 ;, token_404->type
	jne	.L1370	 ;,
 ; ./asm_test/win/i/all.c:2914:     if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movq	8+symbolList(%rip), %rdi	 ; symbolList[1], tmp818
	cmpq	%rdi, (%rax)	 ; tmp818, token_404->lexeme
	je	.L1371	 ;,
.L1370:
 ; ./asm_test/win/i/all.c:2915:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after while condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rbx	 ; token_404->column, tmp819
	movq	8(%rax), %r9	 ; token_404->line, token_404->line
	movl	$2, %ecx	 ;,
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _411
	incq	%rbx	 ; _409
	movq	24(%rax), %r8	 ; _412->path, _413
	movq	%r9, 56(%rsp)	 ; _411, %sfp
	movq	%r8, 48(%rsp)	 ; _413, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2915:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after while condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _409,
	movq	56(%rsp), %r9	 ; %sfp, _411
	leaq	.LC194(%rip), %rdx	 ;, tmp613
	movq	48(%rsp), %r8	 ; %sfp, _413
 ; ./asm_test/win/i/all.c:2915:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after while condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp749, _414
.L1401:
 ; ./asm_test/win/i/all.c:2915:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ')' after while condition\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2907:         return NULL;
	xorl	%r8d, %r8d	 ; while_
	jmp	.L1372	 ;
.L1371:
 ; ./asm_test/win/i/all.c:2918:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2919:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	cmpl	$5, 24(%rax)	 ;, token_415->type
	jne	.L1373	 ;,
 ; ./asm_test/win/i/all.c:2919:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	movq	16+symbolList(%rip), %rdi	 ; symbolList[2], tmp820
	cmpq	%rdi, (%rax)	 ; tmp820, token_415->lexeme
	je	.L1374	 ;,
.L1373:
 ; ./asm_test/win/i/all.c:2920:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start while body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rbx	 ; token_415->column, tmp821
	movq	8(%rax), %r9	 ; token_415->line, token_415->line
	movl	$2, %ecx	 ;,
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _422
	incq	%rbx	 ; _420
	movq	24(%rax), %r8	 ; _423->path, _424
	movq	%r9, 56(%rsp)	 ; _422, %sfp
	movq	%r8, 48(%rsp)	 ; _424, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2920:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start while body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _420,
	movq	56(%rsp), %r9	 ; %sfp, _422
	leaq	.LC195(%rip), %rdx	 ;, tmp620
	movq	48(%rsp), %r8	 ; %sfp, _424
 ; ./asm_test/win/i/all.c:2920:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start while body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp751, _425
	jmp	.L1401	 ;
.L1374:
 ; ./asm_test/win/i/all.c:2923:     List* body = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:2924:     parser->in_loop = 1;
	movb	$1, 11(%rsi)	 ;, parser_64(D)->in_loop
 ; ./asm_test/win/i/all.c:2925:     token = get_next_token(lexer, 1);
	movq	%rbx, %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; ./asm_test/win/i/all.c:2923:     List* body = create_list();
	movq	%rax, %rdi	 ; tmp752, body
 ; ./asm_test/win/i/all.c:2929:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse while body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	leaq	.LC196(%rip), %r13	 ;, tmp670
 ; ./asm_test/win/i/all.c:2925:     token = get_next_token(lexer, 1);
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp753, token
.L1375:
 ; ./asm_test/win/i/all.c:2926:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	cmpl	$5, 24(%r15)	 ;, token_429->type
	je	.L1411	 ;,
.L1377:
 ; ./asm_test/win/i/all.c:2927:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	%rsi, %r8	 ; parser,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r14	 ; tmp754, statement
 ; ./asm_test/win/i/all.c:2928:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L1376	 ;,
 ; ./asm_test/win/i/all.c:2929:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse while body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r15), %rax	 ; token_429->column, tmp822
	movq	8(%r15), %r9	 ; token_429->line, token_429->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %r12	 ;, _431
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _433
	movq	%r9, 56(%rsp)	 ; _433, %sfp
	movq	24(%rax), %r8	 ; _434->path, _435
	movq	%r8, 48(%rsp)	 ; _435, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2929:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse while body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r12, 32(%rsp)	 ; _431,
	movq	56(%rsp), %r9	 ; %sfp, _433
	movq	%r13, %rdx	 ; tmp670,
	movq	48(%rsp), %r8	 ; %sfp, _435
 ; ./asm_test/win/i/all.c:2929:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse while body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp755, _436
 ; ./asm_test/win/i/all.c:2929:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse while body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
.L1376:
 ; ./asm_test/win/i/all.c:2930:         list_append(body, (size_t*)statement);
	movq	%r14, %rdx	 ; statement,
	movq	%rdi, %rcx	 ; body,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2931:         token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp756, token
	jmp	.L1375	 ;
.L1411:
 ; ./asm_test/win/i/all.c:2926:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	movq	24+symbolList(%rip), %rax	 ; symbolList[3], tmp823
	cmpq	%rax, (%r15)	 ; tmp823, token_429->lexeme
	jne	.L1377	 ;,
 ; ./asm_test/win/i/all.c:2933:     parser->in_loop = 0;
	movb	$0, 11(%rsi)	 ;, parser_64(D)->in_loop
 ; ./asm_test/win/i/all.c:820:     While* while_ = (While*)alloc_memory(sizeof(While));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:821:     while_->condition = condition;
	movq	%rbp, (%rax)	 ; condition, while__443->condition
 ; ./asm_test/win/i/all.c:820:     While* while_ = (While*)alloc_memory(sizeof(While));
	movq	%rax, %r8	 ; tmp757, while_
 ; ./asm_test/win/i/all.c:822:     while_->body = body;
	movq	%rdi, 8(%rax)	 ; body, while__443->body
.L1372:
 ; ./asm_test/win/i/all.c:2722:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	xorl	%ebx, %ebx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$3, %ecx	 ;,
	movq	%rbx, 40(%rsp)	 ;,
	movq	%rbx, 32(%rsp)	 ;,
	jmp	.L1404	 ;
.L1365:
 ; ./asm_test/win/i/all.c:2723:         else if (token->lexeme == keywordList[21]) {
	cmpq	168+keywordList(%rip), %rax	 ; keywordList[21], _2
	jne	.L1378	 ;,
 ; ./asm_test/win/i/all.c:2724:             get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2725:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	%rsi, %r8	 ; parser,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; ./asm_test/win/i/all.c:2725:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	xorl	%r11d, %r11d	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rax, 40(%rsp)	 ; tmp759,
	xorl	%edx, %edx	 ;
	movl	$1, %ecx	 ;,
	movq	%r11, 32(%rsp)	 ;,
	jmp	.L1403	 ;
.L1378:
 ; ./asm_test/win/i/all.c:2726:         } else if (token->lexeme == keywordList[13]) {
	cmpq	104+keywordList(%rip), %rax	 ; keywordList[13], _2
	jne	.L1380	 ;,
 ; ./asm_test/win/i/all.c:2727:             token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2728:             if (token->type == SYMBOL && token->lexeme == symbolList[9]) {
	cmpl	$5, 24(%rax)	 ;, token_80->type
	jne	.L1381	 ;,
 ; ./asm_test/win/i/all.c:2728:             if (token->type == SYMBOL && token->lexeme == symbolList[9]) {
	movq	72+symbolList(%rip), %rdi	 ; symbolList[9], tmp824
	cmpq	%rdi, (%rax)	 ; tmp824, token_80->lexeme
	jne	.L1381	 ;,
 ; ./asm_test/win/i/all.c:2729:                 return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r10d, %r10d	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%r10, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	movq	%r10, 32(%rsp)	 ;,
	jmp	.L1404	 ;
.L1381:
 ; ./asm_test/win/i/all.c:2731:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	%rsi, %r8	 ; parser,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
 ; ./asm_test/win/i/all.c:2731:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%r9, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	xorl	%r9d, %r9d	 ;
	movq	%rax, 32(%rsp)	 ; tmp763,
	jmp	.L1403	 ;
.L1380:
 ; ./asm_test/win/i/all.c:2732:         } else if (token->lexeme == keywordList[14]) {
	cmpq	112+keywordList(%rip), %rax	 ; keywordList[14], _2
	jne	.L1382	 ;,
 ; ./asm_test/win/i/all.c:2733:             if (!parser->in_loop) {
	cmpb	$0, 11(%r8)	 ;, parser_64(D)->in_loop
	jne	.L1383	 ;,
 ; ./asm_test/win/i/all.c:2734:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot use 'break' outside of a loop\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rdx), %rax	 ; token_62->column, tmp825
	movq	8(%rdx), %r9	 ; token_62->line, token_62->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rbx	 ;, _20
	movq	(%r8), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _22
	movq	%r9, 56(%rsp)	 ; _22, %sfp
	movq	24(%rax), %r8	 ; _23->path, _24
	movq	%r8, 48(%rsp)	 ; _24, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2734:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot use 'break' outside of a loop\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _20,
	movq	56(%rsp), %r9	 ; %sfp, _22
	leaq	.LC197(%rip), %rdx	 ;, tmp637
	movq	48(%rsp), %r8	 ; %sfp, _24
 ; ./asm_test/win/i/all.c:2734:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot use 'break' outside of a loop\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp765, _25
	jmp	.L1402	 ;
.L1383:
 ; ./asm_test/win/i/all.c:2737:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r8d, %r8d	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$6, %ecx	 ;,
	movq	%r8, 40(%rsp)	 ;,
	movq	%r8, 32(%rsp)	 ;,
	xorl	%r8d, %r8d	 ;
	jmp	.L1403	 ;
.L1382:
 ; ./asm_test/win/i/all.c:2738:         } else if (token->lexeme == keywordList[15]) {
	cmpq	120+keywordList(%rip), %rax	 ; keywordList[15], _2
	jne	.L1305	 ;,
 ; ./asm_test/win/i/all.c:2739:             if (!parser->in_loop) {
	cmpb	$0, 11(%r8)	 ;, parser_64(D)->in_loop
	jne	.L1385	 ;,
 ; ./asm_test/win/i/all.c:2740:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot use 'continue' outside of a loop\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rdx), %rax	 ; token_62->column, tmp826
	movq	8(%rdx), %r9	 ; token_62->line, token_62->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rbx	 ;, _29
	movq	(%r8), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _31
	movq	%r9, 56(%rsp)	 ; _31, %sfp
	movq	24(%rax), %r8	 ; _32->path, _33
	movq	%r8, 48(%rsp)	 ; _33, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2740:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot use 'continue' outside of a loop\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _29,
	movq	56(%rsp), %r9	 ; %sfp, _31
	leaq	.LC198(%rip), %rdx	 ;, tmp643
	movq	48(%rsp), %r8	 ; %sfp, _33
 ; ./asm_test/win/i/all.c:2740:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot use 'continue' outside of a loop\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp767, _34
.L1402:
 ; ./asm_test/win/i/all.c:2740:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Cannot use 'continue' outside of a loop\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2735:                 return NULL;
	xorl	%edi, %edi	 ; <retval>
	jmp	.L1304	 ;
.L1385:
 ; ./asm_test/win/i/all.c:2743:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%ecx, %ecx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rcx, 40(%rsp)	 ;,
	movq	%rcx, 32(%rsp)	 ;,
	movl	$7, %ecx	 ;,
	jmp	.L1403	 ;
.L1305:
 ; ./asm_test/win/i/all.c:2745:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	%rsi, %r8	 ; parser,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
 ; ./asm_test/win/i/all.c:2745:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rax, 32(%rsp)	 ; tmp769,
	xorl	%ecx, %ecx	 ;
	movq	%rdx, 40(%rsp)	 ;,
	xorl	%edx, %edx	 ;
.L1403:
	call	create_statement	 ;
	movq	%rax, %rdi	 ; tmp770, <retval>
 ; ./asm_test/win/i/all.c:2749:     if (statement == NULL)
	testq	%rax, %rax	 ; <retval>
	jne	.L1386	 ;,
 ; ./asm_test/win/i/all.c:2748:     token = lexer->current_token;
	movq	80(%rbx), %rax	 ; lexer_61(D)->current_token, token
 ; ./asm_test/win/i/all.c:2750:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movl	$2, %ecx	 ;,
	movq	16(%rax), %rdx	 ; token_99->column, tmp827
	movq	8(%rax), %r9	 ; token_99->line, token_99->line
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	leaq	1(%rdx), %rbp	 ;, _38
	incq	%r9	 ; _40
	movq	24(%rax), %r8	 ; _41->path, _42
	movq	%r9, 56(%rsp)	 ; _40, %sfp
	movq	%r8, 48(%rsp)	 ; _42, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2750:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbp, 32(%rsp)	 ; _38,
	movq	56(%rsp), %r9	 ; %sfp, _40
	leaq	.LC199(%rip), %rdx	 ;, tmp648
	movq	48(%rsp), %r8	 ; %sfp, _42
 ; ./asm_test/win/i/all.c:2750:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp771, _43
 ; ./asm_test/win/i/all.c:2750:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
.L1386:
 ; ./asm_test/win/i/all.c:2751:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2752:     if (token->type != SYMBOL || token->lexeme != symbolList[9])
	cmpl	$5, 24(%rax)	 ;, token_103->type
	jne	.L1387	 ;,
 ; ./asm_test/win/i/all.c:2752:     if (token->type != SYMBOL || token->lexeme != symbolList[9])
	movq	72+symbolList(%rip), %rbx	 ; symbolList[9], tmp828
	cmpq	%rbx, (%rax)	 ; tmp828, token_103->lexeme
	je	.L1304	 ;,
.L1387:
 ; ./asm_test/win/i/all.c:2753:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rbx	 ; token_103->column, tmp829
	movq	8(%rax), %r9	 ; token_103->line, token_103->line
	movl	$2, %ecx	 ;,
	movq	(%rsi), %rax	 ; parser_64(D)->source_file, parser_64(D)->source_file
	incq	%r9	 ; _50
	incq	%rbx	 ; _48
	movq	24(%rax), %r8	 ; _51->path, _52
	movq	%r9, 56(%rsp)	 ; _50, %sfp
	movq	%r8, 48(%rsp)	 ; _52, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2753:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _48,
	movq	56(%rsp), %r9	 ; %sfp, _50
	leaq	.LC200(%rip), %rdx	 ;, tmp655
	movq	48(%rsp), %r8	 ; %sfp, _52
 ; ./asm_test/win/i/all.c:2753:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp773, _53
 ; ./asm_test/win/i/all.c:2753:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
.L1304:
 ; ./asm_test/win/i/all.c:2755: }
	addq	$88, %rsp	 ;,
	movq	%rdi, %rax	 ; <retval>,
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
.LC201:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected identifier after 'import'\12\0"
.LC202:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected string literal after 'from'\12\0"
.LC203:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' at end of import statement\12\0"
.LC204:
	.ascii "%s.tc\0"
.LC205:
	.ascii "D:/TC/std/\0"
.LC206:
	.ascii "r\0"
.LC207:
	.ascii "Error opening library file for import: %s\12\0"
.LC208:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
.LC209:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
.LC210:
	.ascii "Error parsing library file for import: %s\12\0"
.LC211:
	.ascii "Error: Imported symbol '%s' was not found in %s\12\0"
.LC212:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to import module\12\0"
.LC213:
	.ascii "Error creating import: name is NULL\12\0"
.LC214:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse import statement\12\0"
.LC215:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected function return type after 'func'\12\0"
.LC216:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown function return type\12\0"
.LC217:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected function name after return type\12\0"
.LC218:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after function name\12\0"
.LC219:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function parameter\12\0"
.LC220:
	.ascii "[Parser Error] at %s:%zu:%zu: Function parameters cannot have default values\12\0"
.LC221:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function parameter\12\0"
.LC222:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start function body\12\0"
.LC223:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function body statement\12\0"
.LC224:
	.ascii "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\12\0"
.LC225:
	.ascii "[Parser Error] at %s:%zu:%zu: Function missing return statement\12\0"
.LC226:
	.ascii "Error creating function: name or return_type is NULL\12\0"
.LC227:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse function declaration\12\0"
.LC228:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected class name after 'class'\12\0"
.LC229:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start class body\12\0"
.LC230:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected method return type after 'method'\12\0"
.LC231:
	.ascii "[Parser Error] at %s:%zu:%zu: Unknown return type for method\12\0"
.LC232:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected method name after return type\12\0"
.LC233:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '(' after method name\12\0"
.LC234:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected 'self' as first parameter of method\12\0"
.LC235:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after method parameter\12\0"
.LC236:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse method parameter\12\0"
.LC237:
	.ascii "[Parser Error] at %s:%zu:%zu: Method parameters cannot have default values\12\0"
.LC238:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected '{' to start method body\12\0"
.LC239:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse method body statement\12\0"
.LC240:
	.ascii "[Parser Error] at %s:%zu:%zu: Method missing return statement\12\0"
.LC241:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class method\12\0"
.LC242:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class variable\12\0"
.LC243:
	.ascii "[Parser Error] at %s:%zu:%zu: Unsupported type for class variable\12\0"
.LC244:
	.ascii "[Parser Error] at %s:%zu:%zu: Expected ';' after class variable declaration\12\0"
.LC245:
	.ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in class member\12\0"
.LC246:
	.ascii "[Parser Error] at %s:%zu:%zu: Constructor name conflicts with existing member\12\0"
.LC247:
	.ascii "0\0"
.LC248:
	.ascii "[Parser Error] at %s:%zu:%zu: Failed to parse class declaration\12\0"
.LC249:
	.ascii "[Parser Error] at %s:%zu:%zu: Unexpected token in code member\12\0"
	.text
	.def	parse_code;	.scl	3;	.type	32;	.endef
parse_code:
	pushq	%r15	 ;
	movq	%r8, %r15	 ; tmp975, parser
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp974, now_scope
	subq	$184, %rsp	 ;,
 ; ./asm_test/win/i/all.c:2366:     if (builtin_scope == NULL) {
	cmpq	$0, builtin_scope(%rip)	 ;, builtin_scope
 ; ./asm_test/win/i/all.c:2365: Code* parse_code(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
	movq	%rcx, 256(%rsp)	 ; tmp973, lexer
 ; ./asm_test/win/i/all.c:2366:     if (builtin_scope == NULL) {
	jne	.L1413	 ;,
 ; ./asm_test/win/i/all.c:2367:         builtin_scope = create_symbol_table(NULL);
	xorl	%ecx, %ecx	 ;
	call	create_symbol_table	 ;
 ; ./asm_test/win/i/all.c:2368:         name_void = create_symbol(keywordList[20], SYMBOL_TYPE, NULL, builtin_scope);
	movq	160+keywordList(%rip), %rcx	 ; keywordList[20],
	xorl	%r8d, %r8d	 ;
	movl	$6, %edx	 ;,
 ; ./asm_test/win/i/all.c:2367:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, %r9	 ; tmp976, _2
 ; ./asm_test/win/i/all.c:2367:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, builtin_scope(%rip)	 ; _2, builtin_scope
 ; ./asm_test/win/i/all.c:2368:         name_void = create_symbol(keywordList[20], SYMBOL_TYPE, NULL, builtin_scope);
	call	create_symbol	 ;
 ; ./asm_test/win/i/all.c:2369:         name_int = create_symbol(keywordList[16], SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
	movq	128+keywordList(%rip), %rcx	 ; keywordList[16],
	movl	$6, %edx	 ;,
 ; ./asm_test/win/i/all.c:2368:         name_void = create_symbol(keywordList[20], SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_void(%rip)	 ; tmp977, name_void
 ; ./asm_test/win/i/all.c:2369:         name_int = create_symbol(keywordList[16], SYMBOL_TYPE, NULL, builtin_scope);
	call	create_symbol	 ;
 ; ./asm_test/win/i/all.c:2370:         name_float = create_symbol(keywordList[17], SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
	movq	136+keywordList(%rip), %rcx	 ; keywordList[17],
	movl	$6, %edx	 ;,
 ; ./asm_test/win/i/all.c:2369:         name_int = create_symbol(keywordList[16], SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_int(%rip)	 ; tmp978, name_int
 ; ./asm_test/win/i/all.c:2370:         name_float = create_symbol(keywordList[17], SYMBOL_TYPE, NULL, builtin_scope);
	call	create_symbol	 ;
 ; ./asm_test/win/i/all.c:2371:         name_string = create_symbol(keywordList[18], SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
	movq	144+keywordList(%rip), %rcx	 ; keywordList[18],
	movl	$6, %edx	 ;,
 ; ./asm_test/win/i/all.c:2370:         name_float = create_symbol(keywordList[17], SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_float(%rip)	 ; tmp979, name_float
 ; ./asm_test/win/i/all.c:2371:         name_string = create_symbol(keywordList[18], SYMBOL_TYPE, NULL, builtin_scope);
	call	create_symbol	 ;
 ; ./asm_test/win/i/all.c:2372:         name_bool = create_symbol(keywordList[19], SYMBOL_TYPE, NULL, builtin_scope);
	movq	builtin_scope(%rip), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
	movq	152+keywordList(%rip), %rcx	 ; keywordList[19],
	movl	$6, %edx	 ;,
 ; ./asm_test/win/i/all.c:2371:         name_string = create_symbol(keywordList[18], SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_string(%rip)	 ; tmp980, name_string
 ; ./asm_test/win/i/all.c:2372:         name_bool = create_symbol(keywordList[19], SYMBOL_TYPE, NULL, builtin_scope);
	call	create_symbol	 ;
 ; ./asm_test/win/i/all.c:2372:         name_bool = create_symbol(keywordList[19], SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, name_bool(%rip)	 ; tmp981, name_bool
.L1413:
 ; ./asm_test/win/i/all.c:2374:     if (now_scope == NULL)
	testq	%rbx, %rbx	 ; now_scope
	jne	.L1414	 ;,
 ; ./asm_test/win/i/all.c:2375:         now_scope = builtin_scope;
	movq	builtin_scope(%rip), %rbx	 ; builtin_scope, now_scope
.L1414:
 ; ./asm_test/win/i/all.c:2377:     List* members = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:2378:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	%rbx, %rcx	 ; now_scope,
 ; ./asm_test/win/i/all.c:2377:     List* members = create_list();
	movq	%rax, 96(%rsp)	 ; tmp982, %sfp
 ; ./asm_test/win/i/all.c:2378:     SymbolTable* global_scope = create_symbol_table(now_scope);
	call	create_symbol_table	 ;
	movq	%rax, 72(%rsp)	 ; tmp983, %sfp
.L1432:
 ; ./asm_test/win/i/all.c:2398:         token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp1160, token
 ; ./asm_test/win/i/all.c:2380:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L1526	 ;,
 ; ./asm_test/win/i/all.c:2380:     while (token != NULL && token->type != EOF_TOKEN) {
	movl	24(%rax), %eax	 ; token_56->type, _54
 ; ./asm_test/win/i/all.c:2380:     while (token != NULL && token->type != EOF_TOKEN) {
	testl	%eax, %eax	 ; _54
	je	.L1526	 ;,
 ; ./asm_test/win/i/all.c:2381:         if (token->type == KEYWORD && token->lexeme == keywordList[0]) {
	cmpl	$6, %eax	 ;, _54
	jne	.L1416	 ;,
 ; ./asm_test/win/i/all.c:2381:         if (token->type == KEYWORD && token->lexeme == keywordList[0]) {
	movq	(%rbx), %rax	 ; token_56->lexeme, _17
 ; ./asm_test/win/i/all.c:2381:         if (token->type == KEYWORD && token->lexeme == keywordList[0]) {
	cmpq	keywordList(%rip), %rax	 ; keywordList[0], _17
	jne	.L1417	 ;,
 ; ./asm_test/win/i/all.c:2404:     token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	__imp___acrt_iob_func(%rip), %rbp	 ;, tmp941
 ; ./asm_test/win/i/all.c:2405:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_110->type
	je	.L1418	 ;,
 ; ./asm_test/win/i/all.c:2406:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected identifier after 'import'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_110->column, tmp1165
	movq	8(%rax), %r9	 ; token_110->line, token_110->line
	movl	$2, %ecx	 ;,
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _115
	leaq	1(%rdi), %rsi	 ;, _113
	movq	24(%rax), %r8	 ; _116->path, _117
	movq	%r9, 64(%rsp)	 ; _115, %sfp
	movq	%r8, 56(%rsp)	 ; _117, %sfp
	call	*%rbp	 ; tmp941
 ; ./asm_test/win/i/all.c:2406:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected identifier after 'import'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _113,
	movq	64(%rsp), %r9	 ; %sfp, _115
	leaq	.LC201(%rip), %rdx	 ;, tmp654
	movq	56(%rsp), %r8	 ; %sfp, _117
 ; ./asm_test/win/i/all.c:2406:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected identifier after 'import'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp986, _118
	jmp	.L1553	 ;
.L1418:
 ; ./asm_test/win/i/all.c:2409:     char* import_name = token->lexeme;
	movq	(%rax), %rax	 ; token_110->lexeme, import_name
 ; ./asm_test/win/i/all.c:2411:     token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; ./asm_test/win/i/all.c:2410:     char* source = NULL;
	xorl	%r14d, %r14d	 ; source
 ; ./asm_test/win/i/all.c:2409:     char* import_name = token->lexeme;
	movq	%rax, 56(%rsp)	 ; import_name, %sfp
 ; ./asm_test/win/i/all.c:2411:     token = get_next_token(lexer, 1);
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2412:     if (token->type == KEYWORD && token->lexeme == keywordList[1]) {
	cmpl	$6, 24(%rax)	 ;, token_120->type
 ; ./asm_test/win/i/all.c:2411:     token = get_next_token(lexer, 1);
	movq	%rax, %rsi	 ; tmp987, token
 ; ./asm_test/win/i/all.c:2412:     if (token->type == KEYWORD && token->lexeme == keywordList[1]) {
	jne	.L1420	 ;,
 ; ./asm_test/win/i/all.c:2412:     if (token->type == KEYWORD && token->lexeme == keywordList[1]) {
	movq	8+keywordList(%rip), %rax	 ; keywordList[1], tmp1167
	cmpq	%rax, (%rsi)	 ; tmp1167, token_120->lexeme
	jne	.L1420	 ;,
 ; ./asm_test/win/i/all.c:2413:         token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2414:         if (token->type != STRING) {
	cmpl	$4, 24(%rax)	 ;, token_124->type
	je	.L1421	 ;,
 ; ./asm_test/win/i/all.c:2415:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected string literal after 'from'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_124->column, tmp1168
	movq	8(%rax), %r9	 ; token_124->line, token_124->line
	movl	$2, %ecx	 ;,
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _129
	leaq	1(%rdi), %rsi	 ;, _127
	movq	24(%rax), %r8	 ; _130->path, _131
	movq	%r9, 64(%rsp)	 ; _129, %sfp
	movq	%r8, 56(%rsp)	 ; _131, %sfp
	call	*%rbp	 ; tmp941
 ; ./asm_test/win/i/all.c:2415:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected string literal after 'from'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _127,
	movq	64(%rsp), %r9	 ; %sfp, _129
	leaq	.LC202(%rip), %rdx	 ;, tmp661
	movq	56(%rsp), %r8	 ; %sfp, _131
 ; ./asm_test/win/i/all.c:2415:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected string literal after 'from'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp989, _132
.L1553:
 ; ./asm_test/win/i/all.c:2415:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected string literal after 'from'\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
	jmp	.L1419	 ;
.L1421:
 ; ./asm_test/win/i/all.c:2419:         token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; ./asm_test/win/i/all.c:2418:         source = token->lexeme;
	movq	(%rax), %r14	 ; token_124->lexeme, source
 ; ./asm_test/win/i/all.c:2419:         token = get_next_token(lexer, 1);
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp990, token
.L1420:
 ; ./asm_test/win/i/all.c:2421:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	cmpl	$5, 24(%rsi)	 ;, token_135->type
 ; ./asm_test/win/i/all.c:2426:     name = parse_import_file(import_name, source, now_scope, parser->source_file);
	movq	(%r15), %rcx	 ; parser_85(D)->source_file, pretmp_188
 ; ./asm_test/win/i/all.c:2421:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	jne	.L1422	 ;,
 ; ./asm_test/win/i/all.c:2421:     if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
	movq	72+symbolList(%rip), %rax	 ; symbolList[9], tmp1169
	cmpq	%rax, (%rsi)	 ; tmp1169, token_135->lexeme
	je	.L1423	 ;,
.L1422:
 ; ./asm_test/win/i/all.c:2422:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' at end of import statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	8(%rsi), %r9	 ; token_135->line, token_135->line
	movq	24(%rcx), %r8	 ; pretmp_188->path, _144
	movl	$2, %ecx	 ;,
	movq	16(%rsi), %rax	 ; token_135->column, tmp1170
	incq	%r9	 ; _142
	movq	%r8, 56(%rsp)	 ; _144, %sfp
	movq	%r9, 64(%rsp)	 ; _142, %sfp
	leaq	1(%rax), %rdi	 ;, _140
	call	*%rbp	 ; tmp941
 ; ./asm_test/win/i/all.c:2422:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' at end of import statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _140,
	movq	64(%rsp), %r9	 ; %sfp, _142
	leaq	.LC203(%rip), %rdx	 ;, tmp667
	movq	56(%rsp), %r8	 ; %sfp, _144
 ; ./asm_test/win/i/all.c:2422:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' at end of import statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp991, _145
	jmp	.L1553	 ;
.L1423:
 ; ./asm_test/win/i/all.c:1164:     if (source == NULL) {
	testq	%r14, %r14	 ; source
	jne	.L1424	 ;,
 ; ./asm_test/win/i/all.c:1165:         char* temp_import_name = create_string_check("", strlen(import_name) + 4, 0);
	movq	56(%rsp), %rcx	 ; %sfp,
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:1165:         char* temp_import_name = create_string_check("", strlen(import_name) + 4, 0);
	xorl	%r8d, %r8d	 ;
	leaq	.LC38(%rip), %rcx	 ;, tmp672
	leaq	4(%rax), %rdx	 ;, tmp671
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:1166:         sprintf(temp_import_name, "%s.tc", import_name);
	movq	56(%rsp), %r8	 ; %sfp,
	leaq	.LC204(%rip), %rdx	 ;, tmp673
 ; ./asm_test/win/i/all.c:1165:         char* temp_import_name = create_string_check("", strlen(import_name) + 4, 0);
	movq	%rax, %rdi	 ; tmp993, temp_import_name
 ; ./asm_test/win/i/all.c:1166:         sprintf(temp_import_name, "%s.tc", import_name);
	movq	%rax, %rcx	 ; temp_import_name,
	call	sprintf	 ;
 ; ./asm_test/win/i/all.c:1167:         filename = absolute_path(temp_import_name, "D:/TC/std/");
	leaq	.LC205(%rip), %rdx	 ;, tmp674
	movq	%rdi, %rcx	 ; temp_import_name,
	jmp	.L1551	 ;
.L1424:
 ; ./asm_test/win/i/all.c:1169:         filename = absolute_path(source, get_file_dir(source_file));
	call	get_file_dir	 ;
 ; ./asm_test/win/i/all.c:1169:         filename = absolute_path(source, get_file_dir(source_file));
	movq	%r14, %rcx	 ; source,
 ; ./asm_test/win/i/all.c:1169:         filename = absolute_path(source, get_file_dir(source_file));
	movq	%rax, %rdx	 ; tmp995, _165
.L1551:
 ; ./asm_test/win/i/all.c:1169:         filename = absolute_path(source, get_file_dir(source_file));
	call	absolute_path	 ;
 ; ./asm_test/win/i/all.c:1170:     openfile = fopen(filename, "r");
	leaq	.LC206(%rip), %rdx	 ;, tmp675
	movq	%rax, %rcx	 ; filename,
 ; ./asm_test/win/i/all.c:1169:         filename = absolute_path(source, get_file_dir(source_file));
	movq	%rax, %rdi	 ; tmp996, filename
 ; ./asm_test/win/i/all.c:1170:     openfile = fopen(filename, "r");
	call	fopen	 ;
 ; ./asm_test/win/i/all.c:1172:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	movl	$2, %ecx	 ;,
 ; ./asm_test/win/i/all.c:1170:     openfile = fopen(filename, "r");
	movq	%rax, %r13	 ; tmp997, openfile
 ; ./asm_test/win/i/all.c:1171:     if (openfile == NULL) {
	testq	%rax, %rax	 ; openfile
	jne	.L1426	 ;,
 ; ./asm_test/win/i/all.c:1172:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	call	*%rbp	 ; tmp941
 ; ./asm_test/win/i/all.c:1172:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	movq	%rdi, %r8	 ; filename,
	leaq	.LC207(%rip), %rdx	 ;, tmp677
 ; ./asm_test/win/i/all.c:1172:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	movq	%rax, %rcx	 ; tmp998, _169
	jmp	.L1552	 ;
.L1426:
 ; ./asm_test/win/i/all.c:1175:     fprintf(stderr, "Info: Starting parsing lib file for import: %s\n", filename);
	call	*%rbp	 ; tmp941
 ; ./asm_test/win/i/all.c:1175:     fprintf(stderr, "Info: Starting parsing lib file for import: %s\n", filename);
	movq	%rdi, %r8	 ; filename,
	leaq	.LC208(%rip), %rdx	 ;, tmp679
 ; ./asm_test/win/i/all.c:1175:     fprintf(stderr, "Info: Starting parsing lib file for import: %s\n", filename);
	movq	%rax, %rcx	 ; tmp999, _170
 ; ./asm_test/win/i/all.c:1175:     fprintf(stderr, "Info: Starting parsing lib file for import: %s\n", filename);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1176:     size_t length = 0;
	xorl	%r10d, %r10d	 ;
 ; ./asm_test/win/i/all.c:1177:     char* source_code = read_source(openfile, &length);
	leaq	168(%rsp), %rdx	 ;, tmp680
	movq	%r13, %rcx	 ; openfile,
 ; ./asm_test/win/i/all.c:1176:     size_t length = 0;
	movq	%r10, 168(%rsp)	 ;, length
 ; ./asm_test/win/i/all.c:1177:     char* source_code = read_source(openfile, &length);
	call	read_source.constprop.0	 ;
 ; ./asm_test/win/i/all.c:1178:     fclose(openfile);
	movq	%r13, %rcx	 ; openfile,
 ; ./asm_test/win/i/all.c:1177:     char* source_code = read_source(openfile, &length);
	movq	%rax, 64(%rsp)	 ; tmp1000, %sfp
 ; ./asm_test/win/i/all.c:1178:     fclose(openfile);
	call	fclose	 ;
 ; ./asm_test/win/i/all.c:1179:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	%rdi, %rcx	 ; filename,
	call	create_file	 ;
 ; ./asm_test/win/i/all.c:1153:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$16, %ecx	 ;,
 ; ./asm_test/win/i/all.c:1179:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	%rax, %r13	 ; tmp1001, _172
 ; ./asm_test/win/i/all.c:1153:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:1179:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	168(%rsp), %rdx	 ; length,
	movq	64(%rsp), %rcx	 ; %sfp,
	movq	%rdi, %r8	 ; filename,
 ; ./asm_test/win/i/all.c:1157:     new_parser->source_file = file;
	movq	%r13, (%rax)	 ; _172, new_parser_185->source_file
 ; ./asm_test/win/i/all.c:1179:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	builtin_scope(%rip), %r13	 ; builtin_scope, builtin_scope.62_174
 ; ./asm_test/win/i/all.c:1153:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movq	%rax, %r12	 ; tmp1002, new_parser
 ; ./asm_test/win/i/all.c:1154:     new_parser->in_function = 0;
	movw	$0, 8(%rax)	 ;, MEM <unsigned short> [(char *)new_parser_185 + 8B]
 ; ./asm_test/win/i/all.c:1156:     new_parser->in_loop = 0;
	movb	$0, 11(%rax)	 ;, new_parser_185->in_loop
 ; ./asm_test/win/i/all.c:1179:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	call	create_lexer	 ;
 ; ./asm_test/win/i/all.c:1179:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	%r13, %rdx	 ; builtin_scope.62_174,
	movq	%r12, %r8	 ; new_parser,
 ; ./asm_test/win/i/all.c:1179:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	%rax, %rcx	 ; tmp1003, _176
 ; ./asm_test/win/i/all.c:1179:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	call	parse_code	 ;
 ; ./asm_test/win/i/all.c:1180:     fprintf(stderr, "Info: Finished parsing lib file for import: %s\n", filename);
	movl	$2, %ecx	 ;,
 ; ./asm_test/win/i/all.c:1179:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	%rax, %r13	 ; tmp1004, code
 ; ./asm_test/win/i/all.c:1180:     fprintf(stderr, "Info: Finished parsing lib file for import: %s\n", filename);
	call	*%rbp	 ; tmp941
 ; ./asm_test/win/i/all.c:1180:     fprintf(stderr, "Info: Finished parsing lib file for import: %s\n", filename);
	movq	%rdi, %r8	 ; filename,
	leaq	.LC209(%rip), %rdx	 ;, tmp683
 ; ./asm_test/win/i/all.c:1180:     fprintf(stderr, "Info: Finished parsing lib file for import: %s\n", filename);
	movq	%rax, %rcx	 ; tmp1005, _178
 ; ./asm_test/win/i/all.c:1180:     fprintf(stderr, "Info: Finished parsing lib file for import: %s\n", filename);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1181:     if (code == NULL) {
	testq	%r13, %r13	 ; code
	jne	.L1428	 ;,
 ; ./asm_test/win/i/all.c:1182:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movl	$2, %ecx	 ;,
	call	*%rbp	 ; tmp941
 ; ./asm_test/win/i/all.c:1182:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movq	%rdi, %r8	 ; filename,
	leaq	.LC210(%rip), %rdx	 ;, tmp685
 ; ./asm_test/win/i/all.c:1182:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movq	%rax, %rcx	 ; tmp1006, _179
.L1552:
 ; ./asm_test/win/i/all.c:1182:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	call	fprintf	 ;
	jmp	.L1427	 ;
.L1428:
 ; ./asm_test/win/i/all.c:1185:     name = search_name_use_strcmp(code->global_scope, import_name);
	movq	8(%r13), %rcx	 ; code_177->global_scope, code_177->global_scope
	movq	56(%rsp), %rdx	 ; %sfp,
	call	search_name_use_strcmp	 ;
	movq	%rax, %r13	 ; tmp1007, name
 ; ./asm_test/win/i/all.c:1186:     if (name != NULL)
	testq	%rax, %rax	 ; name
	je	.L1429	 ;,
 ; ./asm_test/win/i/all.c:1187:         list_append(scope->symbols, (size_t*)name);
	movq	72(%rsp), %rax	 ; %sfp, global_scope
	movq	%r13, %rdx	 ; name,
	movq	8(%rax), %rcx	 ; global_scope_81->symbols, global_scope_81->symbols
	call	list_append	 ;
	jmp	.L1430	 ;
.L1429:
 ; ./asm_test/win/i/all.c:1189:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	movl	$2, %ecx	 ;,
	call	*%rbp	 ; tmp941
 ; ./asm_test/win/i/all.c:1189:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	movq	56(%rsp), %r8	 ; %sfp,
	movq	%rdi, %r9	 ; filename,
	leaq	.LC211(%rip), %rdx	 ;, tmp689
 ; ./asm_test/win/i/all.c:1189:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	movq	%rax, %rcx	 ; tmp1008, _183
 ; ./asm_test/win/i/all.c:1189:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	call	fprintf	 ;
.L1427:
 ; ./asm_test/win/i/all.c:2428:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to import module\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rsi), %rax	 ; token_135->column, tmp1172
	movq	8(%rsi), %r9	 ; token_135->line, token_135->line
	movl	$2, %ecx	 ;,
	movq	__imp___acrt_iob_func(%rip), %rsi	 ;, tmp693
	leaq	1(%rax), %rdi	 ;, _150
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _152
	movq	%r9, 80(%rsp)	 ; _152, %sfp
	movq	24(%rax), %r8	 ; _153->path, _154
	movq	%r8, 64(%rsp)	 ; _154, %sfp
	call	*%rsi	 ; tmp693
 ; ./asm_test/win/i/all.c:2428:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to import module\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _150,
	movq	80(%rsp), %r9	 ; %sfp, _152
	leaq	.LC212(%rip), %rdx	 ;, tmp694
	movq	64(%rsp), %r8	 ; %sfp, _154
 ; ./asm_test/win/i/all.c:2428:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to import module\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1009, _155
 ; ./asm_test/win/i/all.c:2428:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to import module\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2429:         name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
	movq	72(%rsp), %r9	 ; %sfp,
	movq	56(%rsp), %rcx	 ; %sfp,
	movl	$3, %edx	 ;,
	movq	name_void(%rip), %r8	 ; name_void,
	call	create_symbol	 ;
	movq	%rax, %r13	 ; tmp1010, name
 ; ./asm_test/win/i/all.c:692:     if (name == NULL) {
	testq	%rax, %rax	 ; name
	jne	.L1430	 ;,
 ; ./asm_test/win/i/all.c:693:         fprintf(stderr, "Error creating import: name is NULL\n");
	movl	$2, %ecx	 ;,
	call	*%rsi	 ; tmp693
 ; ./asm_test/win/i/all.c:693:         fprintf(stderr, "Error creating import: name is NULL\n");
	leaq	.LC213(%rip), %rcx	 ;, tmp697
 ; ./asm_test/win/i/all.c:693:         fprintf(stderr, "Error creating import: name is NULL\n");
	movq	%rax, %rdx	 ; tmp1011, _186
 ; ./asm_test/win/i/all.c:693:         fprintf(stderr, "Error creating import: name is NULL\n");
	call	fputs	 ;
	jmp	.L1419	 ;
.L1430:
 ; ./asm_test/win/i/all.c:696:     Import* import = (Import*)alloc_memory(sizeof(Import));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:697:     import->name = name;
	movq	%r13, (%rax)	 ; name, import_187->name
 ; ./asm_test/win/i/all.c:696:     Import* import = (Import*)alloc_memory(sizeof(Import));
	movq	%rax, %rdx	 ; tmp1012, import
 ; ./asm_test/win/i/all.c:698:     import->source = source;
	movq	%r14, 8(%rax)	 ; source, import_187->source
	jmp	.L1431	 ;
.L1419:
 ; ./asm_test/win/i/all.c:2384:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse import statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbx), %rax	 ; token_56->column, tmp1173
	movq	8(%rbx), %r9	 ; token_56->line, token_56->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rsi	 ;, _20
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _22
	movq	%r9, 64(%rsp)	 ; _22, %sfp
	movq	24(%rax), %r8	 ; _23->path, _24
	movq	%r8, 56(%rsp)	 ; _24, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2384:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse import statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _20,
	movq	64(%rsp), %r9	 ; %sfp, _22
	leaq	.LC214(%rip), %rdx	 ;, tmp702
	movq	56(%rsp), %r8	 ; %sfp, _24
 ; ./asm_test/win/i/all.c:2384:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse import statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1013, _25
 ; ./asm_test/win/i/all.c:2384:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse import statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
	xorl	%edx, %edx	 ; import
.L1431:
 ; ./asm_test/win/i/all.c:2385:             list_append(members, (size_t*)create_code_member(CODE_IMPORT, import, NULL, NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%ecx, %ecx	 ;
	jmp	.L1562	 ;
.L1417:
 ; ./asm_test/win/i/all.c:2386:         } else if (token->type == KEYWORD && token->lexeme == keywordList[2]) {
	cmpq	16+keywordList(%rip), %rax	 ; keywordList[2], _17
	jne	.L1433	 ;,
 ; ./asm_test/win/i/all.c:2435:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; ./asm_test/win/i/all.c:2436:     token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; ./asm_test/win/i/all.c:2435:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	%rax, 56(%rsp)	 ; tmp1015, %sfp
 ; ./asm_test/win/i/all.c:2436:     token = get_next_token(lexer, 1);
	call	get_next_token	 ;
	movq	%rax, %r9	 ; tmp1016, token
 ; ./asm_test/win/i/all.c:2437:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	movl	24(%rax), %eax	 ; token_190->type, _191
 ; ./asm_test/win/i/all.c:2437:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpl	$1, %eax	 ;, _191
	je	.L1434	 ;,
 ; ./asm_test/win/i/all.c:2437:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpl	$6, %eax	 ;, _191
	jne	.L1435	 ;,
 ; ./asm_test/win/i/all.c:2437:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	movq	(%r9), %rax	 ; token_190->lexeme, _192
 ; ./asm_test/win/i/all.c:2437:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	128+keywordList(%rip), %rax	 ; keywordList[16], _192
	je	.L1434	 ;,
 ; ./asm_test/win/i/all.c:2437:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	136+keywordList(%rip), %rax	 ; keywordList[17], _192
	je	.L1434	 ;,
 ; ./asm_test/win/i/all.c:2437:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	144+keywordList(%rip), %rax	 ; keywordList[18], _192
	je	.L1434	 ;,
 ; ./asm_test/win/i/all.c:2437:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	152+keywordList(%rip), %rax	 ; keywordList[19], _192
	je	.L1434	 ;,
 ; ./asm_test/win/i/all.c:2437:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	160+keywordList(%rip), %rax	 ; keywordList[20], _192
	je	.L1434	 ;,
.L1435:
 ; ./asm_test/win/i/all.c:2438:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected function return type after 'func'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r9), %rax	 ; token_190->column, tmp1174
	movq	8(%r9), %r9	 ; token_190->line, token_190->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rsi	 ;, _199
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _201
	movq	%r9, 64(%rsp)	 ; _201, %sfp
	movq	24(%rax), %r8	 ; _202->path, _203
	movq	%r8, 56(%rsp)	 ; _203, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2438:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected function return type after 'func'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _199,
	movq	64(%rsp), %r9	 ; %sfp, _201
	leaq	.LC215(%rip), %rdx	 ;, tmp713
	movq	56(%rsp), %r8	 ; %sfp, _203
 ; ./asm_test/win/i/all.c:2438:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected function return type after 'func'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1017, _204
	jmp	.L1555	 ;
.L1434:
 ; ./asm_test/win/i/all.c:2441:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%r9), %rdx	 ; token_190->lexeme,
	movq	72(%rsp), %rcx	 ; %sfp,
	call	search_name	 ;
	movq	%rax, %rdi	 ; tmp1018, return_type
 ; ./asm_test/win/i/all.c:2442:     if (return_type == NULL) {
	testq	%rax, %rax	 ; return_type
	jne	.L1437	 ;,
 ; ./asm_test/win/i/all.c:2443:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown function return type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r9), %rax	 ; token_190->column, tmp1175
	movq	8(%r9), %r9	 ; token_190->line, token_190->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rsi	 ;, _208
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _210
	movq	%r9, 64(%rsp)	 ; _210, %sfp
	movq	24(%rax), %r8	 ; _211->path, _212
	movq	%r8, 56(%rsp)	 ; _212, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2443:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown function return type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _208,
	movq	64(%rsp), %r9	 ; %sfp, _210
	leaq	.LC216(%rip), %rdx	 ;, tmp718
	movq	56(%rsp), %r8	 ; %sfp, _212
 ; ./asm_test/win/i/all.c:2443:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown function return type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1019, _213
.L1555:
 ; ./asm_test/win/i/all.c:2443:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown function return type\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
	jmp	.L1436	 ;
.L1437:
 ; ./asm_test/win/i/all.c:2446:     token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2447:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_214->type
 ; ./asm_test/win/i/all.c:2446:     token = get_next_token(lexer, 1);
	movq	%rax, %rbp	 ; tmp1020, token
 ; ./asm_test/win/i/all.c:2447:     if (token->type != IDENTIFIER) {
	je	.L1438	 ;,
 ; ./asm_test/win/i/all.c:2448:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected function name after return type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rax	 ; token_214->column, tmp1176
	movq	8(%rbp), %r9	 ; token_214->line, token_214->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rsi	 ;, _217
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _219
	movq	%r9, 64(%rsp)	 ; _219, %sfp
	movq	24(%rax), %r8	 ; _220->path, _221
	movq	%r8, 56(%rsp)	 ; _221, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2448:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected function name after return type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _217,
	movq	64(%rsp), %r9	 ; %sfp, _219
	leaq	.LC217(%rip), %rdx	 ;, tmp723
	movq	56(%rsp), %r8	 ; %sfp, _221
 ; ./asm_test/win/i/all.c:2448:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected function name after return type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1021, _222
	jmp	.L1555	 ;
.L1438:
 ; ./asm_test/win/i/all.c:2451:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:2453:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	0(%rbp), %rcx	 ; token_214->lexeme,
	movq	%rdi, %r8	 ; return_type,
	movl	$1, %edx	 ;,
 ; ./asm_test/win/i/all.c:2451:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movq	%rax, %rsi	 ; tmp1022, function
 ; ./asm_test/win/i/all.c:2452:     function->function_scope = function_scope;
	movq	56(%rsp), %rax	 ; %sfp, function_scope
 ; ./asm_test/win/i/all.c:2453:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	%rsi, %r9	 ; function,
 ; ./asm_test/win/i/all.c:2452:     function->function_scope = function_scope;
	movq	%rax, 32(%rsi)	 ; function_scope, function_223->function_scope
 ; ./asm_test/win/i/all.c:2453:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	call	create_symbol	 ;
 ; ./asm_test/win/i/all.c:2454:     token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; ./asm_test/win/i/all.c:2453:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	%rax, %r14	 ; tmp1023, name
 ; ./asm_test/win/i/all.c:2454:     token = get_next_token(lexer, 1);
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2455:     if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	cmpl	$5, 24(%rax)	 ;, token_226->type
	jne	.L1439	 ;,
 ; ./asm_test/win/i/all.c:2455:     if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	movq	symbolList(%rip), %rdx	 ; symbolList[0], tmp1178
	cmpq	%rdx, (%rax)	 ; tmp1178, token_226->lexeme
	je	.L1440	 ;,
.L1439:
 ; ./asm_test/win/i/all.c:2456:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after function name\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_226->column, tmp1179
	movq	8(%rax), %r9	 ; token_226->line, token_226->line
	movl	$2, %ecx	 ;,
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _233
	leaq	1(%rdi), %rsi	 ;, _231
	movq	24(%rax), %r8	 ; _234->path, _235
	movq	%r9, 64(%rsp)	 ; _233, %sfp
	movq	%r8, 56(%rsp)	 ; _235, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2456:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after function name\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _231,
	movq	64(%rsp), %r9	 ; %sfp, _233
	leaq	.LC218(%rip), %rdx	 ;, tmp730
	movq	56(%rsp), %r8	 ; %sfp, _235
 ; ./asm_test/win/i/all.c:2456:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after function name\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1025, _236
	jmp	.L1555	 ;
.L1440:
 ; ./asm_test/win/i/all.c:2459:     token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp1026, token
 ; ./asm_test/win/i/all.c:2460:     List* parameters = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:2466:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Function parameters cannot have default values\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	__imp___acrt_iob_func(%rip), %r12	 ;, tmp959
 ; ./asm_test/win/i/all.c:2460:     List* parameters = create_list();
	movq	%rax, 64(%rsp)	 ; tmp1027, %sfp
.L1441:
 ; ./asm_test/win/i/all.c:2461:     while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpl	$5, 24(%r13)	 ;, token_240->type
	je	.L1563	 ;,
.L1448:
 ; ./asm_test/win/i/all.c:2462:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	256(%rsp), %rcx	 ; lexer,
	movq	%r15, %r8	 ; parser,
	call	parse_variable	 ;
	movq	%rax, %rdx	 ; tmp1028, parameter
 ; ./asm_test/win/i/all.c:2463:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L1442	 ;,
 ; ./asm_test/win/i/all.c:2464:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r13), %rax	 ; token_240->column, tmp1180
	movq	8(%r13), %r9	 ; token_240->line, token_240->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rbp	 ;, _242
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _244
	movq	%r9, 88(%rsp)	 ; _244, %sfp
	movq	24(%rax), %r8	 ; _245->path, _246
	movq	%r8, 80(%rsp)	 ; _246, %sfp
	call	*%r12	 ; tmp959
 ; ./asm_test/win/i/all.c:2464:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbp, 32(%rsp)	 ; _242,
	movq	88(%rsp), %r9	 ; %sfp, _244
	leaq	.LC219(%rip), %rdx	 ;, tmp735
	movq	80(%rsp), %r8	 ; %sfp, _246
 ; ./asm_test/win/i/all.c:2464:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1029, _247
	jmp	.L1554	 ;
.L1442:
 ; ./asm_test/win/i/all.c:2465:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_239->value
	je	.L1444	 ;,
 ; ./asm_test/win/i/all.c:2466:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Function parameters cannot have default values\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r13), %rax	 ; token_240->column, tmp1181
	movq	8(%r13), %r9	 ; token_240->line, token_240->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rbp	 ;, _250
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _252
	movq	%r9, 88(%rsp)	 ; _252, %sfp
	movq	24(%rax), %r8	 ; _253->path, _254
	movq	%r8, 80(%rsp)	 ; _254, %sfp
	call	*%r12	 ; tmp959
 ; ./asm_test/win/i/all.c:2466:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Function parameters cannot have default values\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbp, 32(%rsp)	 ; _250,
	movq	88(%rsp), %r9	 ; %sfp, _252
	leaq	.LC220(%rip), %rdx	 ;,
	movq	80(%rsp), %r8	 ; %sfp, _254
 ; ./asm_test/win/i/all.c:2466:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Function parameters cannot have default values\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1030, _255
.L1554:
 ; ./asm_test/win/i/all.c:2466:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Function parameters cannot have default values\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
	jmp	.L1443	 ;
.L1444:
 ; ./asm_test/win/i/all.c:2468:             list_append(parameters, (size_t*)parameter);
	movq	64(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
.L1443:
 ; ./asm_test/win/i/all.c:2469:         token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2470:         if (token->type == SYMBOL && token->lexeme == symbolList[4]) {
	cmpl	$5, 24(%rax)	 ;, token_256->type
 ; ./asm_test/win/i/all.c:2469:         token = get_next_token(lexer, 1);
	movq	%rax, %r13	 ; tmp1031, token
 ; ./asm_test/win/i/all.c:2470:         if (token->type == SYMBOL && token->lexeme == symbolList[4]) {
	jne	.L1445	 ;,
 ; ./asm_test/win/i/all.c:2470:         if (token->type == SYMBOL && token->lexeme == symbolList[4]) {
	movq	(%rax), %rax	 ; token_256->lexeme, _258
 ; ./asm_test/win/i/all.c:2470:         if (token->type == SYMBOL && token->lexeme == symbolList[4]) {
	cmpq	32+symbolList(%rip), %rax	 ; symbolList[4], _258
	jne	.L1446	 ;,
 ; ./asm_test/win/i/all.c:2471:             token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp1032, token
 ; ./asm_test/win/i/all.c:2471:             token = get_next_token(lexer, 1);
	jmp	.L1441	 ;
.L1446:
 ; ./asm_test/win/i/all.c:2472:         } else if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpq	8+symbolList(%rip), %rax	 ; symbolList[1], _258
	je	.L1441	 ;,
.L1445:
 ; ./asm_test/win/i/all.c:2473:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r13), %rax	 ; token_256->column, tmp1182
	movq	8(%r13), %r9	 ; token_256->line, token_256->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rsi	 ;, _265
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _267
	movq	%r9, 64(%rsp)	 ; _267, %sfp
	movq	24(%rax), %r8	 ; _268->path, _269
	movq	%r8, 56(%rsp)	 ; _269, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2473:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _265,
	movq	64(%rsp), %r9	 ; %sfp, _267
	leaq	.LC221(%rip), %rdx	 ;, tmp747
	movq	56(%rsp), %r8	 ; %sfp, _269
 ; ./asm_test/win/i/all.c:2473:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1033, _270
	jmp	.L1555	 ;
.L1563:
 ; ./asm_test/win/i/all.c:2461:     while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movq	8+symbolList(%rip), %rax	 ; symbolList[1], tmp1183
	cmpq	%rax, 0(%r13)	 ; tmp1183, token_240->lexeme
	jne	.L1448	 ;,
 ; ./asm_test/win/i/all.c:2477:     token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2478:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	cmpl	$5, 24(%rax)	 ;, token_274->type
	jne	.L1449	 ;,
 ; ./asm_test/win/i/all.c:2478:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	movq	16+symbolList(%rip), %rdx	 ; symbolList[2], tmp1184
	cmpq	%rdx, (%rax)	 ; tmp1184, token_274->lexeme
	je	.L1450	 ;,
.L1449:
 ; ./asm_test/win/i/all.c:2479:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start function body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_274->column, tmp1185
	movq	8(%rax), %r9	 ; token_274->line, token_274->line
	movl	$2, %ecx	 ;,
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _281
	leaq	1(%rdi), %rsi	 ;, _279
	movq	24(%rax), %r8	 ; _282->path, _283
	movq	%r9, 64(%rsp)	 ; _281, %sfp
	movq	%r8, 56(%rsp)	 ; _283, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2479:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start function body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _279,
	movq	64(%rsp), %r9	 ; %sfp, _281
	leaq	.LC222(%rip), %rdx	 ;, tmp756
	movq	56(%rsp), %r8	 ; %sfp, _283
 ; ./asm_test/win/i/all.c:2479:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start function body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1035, _284
	jmp	.L1555	 ;
.L1450:
 ; ./asm_test/win/i/all.c:2482:     List* body = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:2483:     parser->in_function = 1;
	movb	$1, 8(%r15)	 ;, parser_85(D)->in_function
 ; ./asm_test/win/i/all.c:2485:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
 ; ./asm_test/win/i/all.c:2484:     char have_return = 0;
	xorl	%r13d, %r13d	 ; have_return
 ; ./asm_test/win/i/all.c:2485:     token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
 ; ./asm_test/win/i/all.c:2482:     List* body = create_list();
	movq	%rax, %rbp	 ; tmp1036, body
 ; ./asm_test/win/i/all.c:2485:     token = get_next_token(lexer, 1);
	call	get_next_token	 ;
	movq	%rax, %r9	 ; tmp1037, token
.L1451:
 ; ./asm_test/win/i/all.c:2486:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	cmpl	$5, 24(%r9)	 ;, token_288->type
	je	.L1564	 ;,
.L1456:
 ; ./asm_test/win/i/all.c:2487:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	256(%rsp), %rcx	 ; lexer,
	movq	%r15, %r8	 ; parser,
	movq	%r9, 80(%rsp)	 ; token, %sfp
	call	parse_statement	 ;
 ; ./asm_test/win/i/all.c:2488:         if (statement == NULL)
	movq	80(%rsp), %r9	 ; %sfp, token
	testq	%rax, %rax	 ; statement
 ; ./asm_test/win/i/all.c:2487:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	%rax, %r12	 ; tmp1038, statement
 ; ./asm_test/win/i/all.c:2488:         if (statement == NULL)
	jne	.L1452	 ;,
 ; ./asm_test/win/i/all.c:2489:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r9), %rax	 ; token_288->column, tmp1186
	movq	8(%r9), %r9	 ; token_288->line, token_288->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rdx	 ;, _290
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _292
	movq	%rdx, 104(%rsp)	 ; _290, %sfp
	movq	24(%rax), %r8	 ; _293->path, _294
	movq	%r9, 88(%rsp)	 ; _292, %sfp
	movq	%r8, 80(%rsp)	 ; _294, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2489:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	104(%rsp), %rdx	 ; %sfp, _290
	movq	88(%rsp), %r9	 ; %sfp, _292
	movq	80(%rsp), %r8	 ; %sfp, _294
 ; ./asm_test/win/i/all.c:2489:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1039, _295
 ; ./asm_test/win/i/all.c:2489:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdx, 32(%rsp)	 ; _290,
	leaq	.LC223(%rip), %rdx	 ;, tmp761
	call	fprintf	 ;
	jmp	.L1455	 ;
.L1452:
 ; ./asm_test/win/i/all.c:2490:         else if (have_return)
	testb	%r13b, %r13b	 ; have_return
	je	.L1454	 ;,
 ; ./asm_test/win/i/all.c:2491:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r9), %rax	 ; token_288->column, tmp1187
	movq	8(%r9), %r9	 ; token_288->line, token_288->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rdx	 ;, _298
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _300
	movq	%rdx, 104(%rsp)	 ; _298, %sfp
	movq	24(%rax), %r8	 ; _301->path, _302
	movq	%r9, 88(%rsp)	 ; _300, %sfp
	movq	%r8, 80(%rsp)	 ; _302, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2491:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	104(%rsp), %rdx	 ; %sfp, _298
	movq	88(%rsp), %r9	 ; %sfp, _300
	movq	80(%rsp), %r8	 ; %sfp, _302
 ; ./asm_test/win/i/all.c:2491:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1040, _303
 ; ./asm_test/win/i/all.c:2491:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdx, 32(%rsp)	 ; _298,
	leaq	.LC224(%rip), %rdx	 ;,
	call	fprintf	 ;
.L1454:
 ; ./asm_test/win/i/all.c:2493:             have_return = 1;
	cmpl	$5, 8(%r12)	 ;, statement_287->type
	movb	$1, %al	 ;, tmp947
	cmove	%eax, %r13d	 ; have_return,, tmp947, have_return
.L1455:
 ; ./asm_test/win/i/all.c:2494:         list_append(body, (size_t*)statement);
	movq	%r12, %rdx	 ; statement,
	movq	%rbp, %rcx	 ; body,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2495:         token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r9	 ; tmp1041, token
	jmp	.L1451	 ;
.L1564:
 ; ./asm_test/win/i/all.c:2486:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	movq	24+symbolList(%rip), %rax	 ; symbolList[3], tmp1188
	cmpq	%rax, (%r9)	 ; tmp1188, token_288->lexeme
	jne	.L1456	 ;,
 ; ./asm_test/win/i/all.c:2497:     parser->in_function = 0;
	movb	$0, 8(%r15)	 ;, parser_85(D)->in_function
 ; ./asm_test/win/i/all.c:2498:     if (!have_return && return_type != name_void)
	testb	%r13b, %r13b	 ; have_return
	jne	.L1458	 ;,
 ; ./asm_test/win/i/all.c:2498:     if (!have_return && return_type != name_void)
	cmpq	name_void(%rip), %rdi	 ; name_void, return_type
	jne	.L1459	 ;,
.L1460:
 ; ./asm_test/win/i/all.c:2501:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	xorl	%r8d, %r8d	 ;
	movl	$5, %ecx	 ;,
	movq	%r9, 40(%rsp)	 ;,
	movq	%r9, 32(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	call	create_statement	 ;
 ; ./asm_test/win/i/all.c:2501:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	%rbp, %rcx	 ; body,
 ; ./asm_test/win/i/all.c:2501:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	%rax, %rdx	 ; tmp1042, _320
 ; ./asm_test/win/i/all.c:2501:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	call	list_append	 ;
	jmp	.L1458	 ;
.L1459:
 ; ./asm_test/win/i/all.c:2499:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Function missing return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r9), %rax	 ; token_288->column, tmp1189
	movq	8(%r9), %r9	 ; token_288->line, token_288->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %r12	 ;, _313
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _315
	movq	%r9, 88(%rsp)	 ; _315, %sfp
	movq	24(%rax), %r8	 ; _316->path, _317
	movq	%r8, 80(%rsp)	 ; _317, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2499:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Function missing return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r12, 32(%rsp)	 ; _313,
	movq	88(%rsp), %r9	 ; %sfp, _315
	leaq	.LC225(%rip), %rdx	 ;, tmp773
	movq	80(%rsp), %r8	 ; %sfp, _317
 ; ./asm_test/win/i/all.c:2499:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Function missing return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1043, _318
 ; ./asm_test/win/i/all.c:2499:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Function missing return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2500:     if (!have_return && return_type == name_void)
	cmpq	name_void(%rip), %rdi	 ; name_void, return_type
	je	.L1460	 ;,
.L1458:
 ; ./asm_test/win/i/all.c:702:     if (name == NULL || return_type == NULL) {
	testq	%r14, %r14	 ; name
	jne	.L1462	 ;,
 ; ./asm_test/win/i/all.c:703:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:703:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	leaq	.LC226(%rip), %rcx	 ;, tmp775
 ; ./asm_test/win/i/all.c:703:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	movq	%rax, %rdx	 ; tmp1044, _328
 ; ./asm_test/win/i/all.c:703:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	call	fputs	 ;
	jmp	.L1436	 ;
.L1462:
 ; ./asm_test/win/i/all.c:708:     function->parameters = parameters;
	movq	64(%rsp), %rax	 ; %sfp, parameters
 ; ./asm_test/win/i/all.c:706:     function->name = name;
	movq	%r14, (%rsi)	 ; name, function_223->name
 ; ./asm_test/win/i/all.c:707:     function->return_type = return_type;
	movq	%rdi, 8(%rsi)	 ; return_type, function_223->return_type
 ; ./asm_test/win/i/all.c:708:     function->parameters = parameters;
	movq	%rax, 16(%rsi)	 ; parameters, function_223->parameters
 ; ./asm_test/win/i/all.c:710:     function->function_scope = function_scope;
	movq	56(%rsp), %rax	 ; %sfp, function_scope
 ; ./asm_test/win/i/all.c:709:     function->body = body;
	movq	%rbp, 24(%rsi)	 ; body, function_223->body
 ; ./asm_test/win/i/all.c:710:     function->function_scope = function_scope;
	movq	%rax, 32(%rsi)	 ; function_scope, function_223->function_scope
	jmp	.L1463	 ;
.L1436:
 ; ./asm_test/win/i/all.c:2389:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbx), %rax	 ; token_56->column, tmp1192
	movq	8(%rbx), %r9	 ; token_56->line, token_56->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rsi	 ;, _30
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _32
	movq	%r9, 64(%rsp)	 ; _32, %sfp
	movq	24(%rax), %r8	 ; _33->path, _34
	movq	%r8, 56(%rsp)	 ; _34, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2389:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _30,
	xorl	%esi, %esi	 ; function
	movq	64(%rsp), %r9	 ; %sfp, _32
	movq	56(%rsp), %r8	 ; %sfp, _34
 ; ./asm_test/win/i/all.c:2389:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1045, _35
 ; ./asm_test/win/i/all.c:2389:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse function declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	leaq	.LC227(%rip), %rdx	 ;, tmp780
	call	fprintf	 ;
.L1463:
 ; ./asm_test/win/i/all.c:2390:             list_append(members, (size_t*)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	xorl	%r9d, %r9d	 ;
	movq	%rsi, %r8	 ; function,
	xorl	%edx, %edx	 ;
	movl	$1, %ecx	 ;,
.L1562:
	call	create_code_member	 ;
 ; ./asm_test/win/i/all.c:2390:             list_append(members, (size_t*)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	96(%rsp), %rcx	 ; %sfp,
 ; ./asm_test/win/i/all.c:2390:             list_append(members, (size_t*)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	%rax, %rdx	 ; tmp1046, _36
 ; ./asm_test/win/i/all.c:2390:             list_append(members, (size_t*)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2386:         } else if (token->type == KEYWORD && token->lexeme == keywordList[2]) {
	jmp	.L1432	 ;
.L1433:
 ; ./asm_test/win/i/all.c:2391:         } else if (token->type == KEYWORD && token->lexeme == keywordList[3]) {
	cmpq	24+keywordList(%rip), %rax	 ; keywordList[3], _17
	jne	.L1416	 ;,
 ; ./asm_test/win/i/all.c:2585:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; ./asm_test/win/i/all.c:2586:     token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; ./asm_test/win/i/all.c:2585:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	%rax, 56(%rsp)	 ; tmp1047, %sfp
 ; ./asm_test/win/i/all.c:2586:     token = get_next_token(lexer, 1);
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2587:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_331->type
 ; ./asm_test/win/i/all.c:2586:     token = get_next_token(lexer, 1);
	movq	%rax, %rsi	 ; tmp1048, token
 ; ./asm_test/win/i/all.c:2587:     if (token->type != IDENTIFIER) {
	je	.L1464	 ;,
 ; ./asm_test/win/i/all.c:2588:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected class name after 'class'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rax	 ; token_331->column, tmp1193
	movq	8(%rsi), %r9	 ; token_331->line, token_331->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rdi	 ;, _334
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _336
	movq	%r9, 64(%rsp)	 ; _336, %sfp
	movq	24(%rax), %r8	 ; _337->path, _338
	movq	%r8, 56(%rsp)	 ; _338, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2588:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected class name after 'class'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _334,
	movq	64(%rsp), %r9	 ; %sfp, _336
	leaq	.LC228(%rip), %rdx	 ;, tmp786
	movq	56(%rsp), %r8	 ; %sfp, _338
 ; ./asm_test/win/i/all.c:2588:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected class name after 'class'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1049, _339
	jmp	.L1561	 ;
.L1464:
 ; ./asm_test/win/i/all.c:2591:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:2592:     class->class_scope = class_scope;
	movq	56(%rsp), %rdi	 ; %sfp, class_scope
 ; ./asm_test/win/i/all.c:2593:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	movq	(%rsi), %rcx	 ; token_331->lexeme,
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, %r9	 ; class,
 ; ./asm_test/win/i/all.c:2591:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movq	%rax, 64(%rsp)	 ; tmp1050, %sfp
 ; ./asm_test/win/i/all.c:2592:     class->class_scope = class_scope;
	movq	%rdi, 16(%rax)	 ; class_scope, class_340->class_scope
 ; ./asm_test/win/i/all.c:2593:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	call	create_symbol	 ;
 ; ./asm_test/win/i/all.c:2594:     token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; ./asm_test/win/i/all.c:2593:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	movq	%rax, %r14	 ; tmp1051, name
 ; ./asm_test/win/i/all.c:2594:     token = get_next_token(lexer, 1);
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2595:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	cmpl	$5, 24(%rax)	 ;, token_343->type
	jne	.L1466	 ;,
 ; ./asm_test/win/i/all.c:2595:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	movq	16+symbolList(%rip), %rdi	 ; symbolList[2], tmp1196
	cmpq	%rdi, (%rax)	 ; tmp1196, token_343->lexeme
	je	.L1467	 ;,
.L1466:
 ; ./asm_test/win/i/all.c:2596:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start class body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_343->column, tmp1197
	movq	8(%rax), %r9	 ; token_343->line, token_343->line
	movl	$2, %ecx	 ;,
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _350
	leaq	1(%rdi), %rsi	 ;, _348
	movq	24(%rax), %r8	 ; _351->path, _352
	movq	%r9, 64(%rsp)	 ; _350, %sfp
	movq	%r8, 56(%rsp)	 ; _352, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2596:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start class body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _348,
	movq	64(%rsp), %r9	 ; %sfp, _350
	leaq	.LC229(%rip), %rdx	 ;, tmp793
	movq	56(%rsp), %r8	 ; %sfp, _352
 ; ./asm_test/win/i/all.c:2596:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start class body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1053, _353
.L1561:
 ; ./asm_test/win/i/all.c:2596:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start class body\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2394:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse class declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbx), %rax	 ; token_56->column, tmp1237
	movq	8(%rbx), %r9	 ; token_56->line, token_56->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rsi	 ;, _40
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _42
	movq	%r9, 64(%rsp)	 ; _42, %sfp
	movq	24(%rax), %r8	 ; _43->path, _44
	movq	%r8, 56(%rsp)	 ; _44, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2394:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse class declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _40,
	movq	64(%rsp), %r9	 ; %sfp, _42
	leaq	.LC248(%rip), %rdx	 ;, tmp933
	movq	56(%rsp), %r8	 ; %sfp, _44
 ; ./asm_test/win/i/all.c:2394:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse class declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1157, _45
 ; ./asm_test/win/i/all.c:2394:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse class declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
	xorl	%eax, %eax	 ;
	movq	%rax, 64(%rsp)	 ;, %sfp
	jmp	.L1525	 ;
.L1467:
 ; ./asm_test/win/i/all.c:2599:     List* members = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:2600:     token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; ./asm_test/win/i/all.c:2599:     List* members = create_list();
	movq	%rax, 80(%rsp)	 ; tmp1054, %sfp
 ; ./asm_test/win/i/all.c:2600:     token = get_next_token(lexer, 1);
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2601:     size_t size = 0;
	xorl	%r8d, %r8d	 ;
	movq	%r8, 104(%rsp)	 ;, %sfp
 ; ./asm_test/win/i/all.c:2600:     token = get_next_token(lexer, 1);
	movq	%rax, %rbx	 ; tmp1055, token
.L1468:
 ; ./asm_test/win/i/all.c:2602:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	movl	24(%rbx), %eax	 ; token_357->type, _356
 ; ./asm_test/win/i/all.c:2602:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	cmpl	$5, %eax	 ;, _356
	je	.L1565	 ;,
 ; ./asm_test/win/i/all.c:2603:         if (token->type == KEYWORD && token->lexeme == keywordList[4]) {
	cmpl	$6, %eax	 ;, _356
	jne	.L1469	 ;,
 ; ./asm_test/win/i/all.c:2603:         if (token->type == KEYWORD && token->lexeme == keywordList[4]) {
	movq	(%rbx), %rax	 ; token_357->lexeme, _358
 ; ./asm_test/win/i/all.c:2603:         if (token->type == KEYWORD && token->lexeme == keywordList[4]) {
	cmpq	32+keywordList(%rip), %rax	 ; keywordList[4], _358
	jne	.L1470	 ;,
 ; ./asm_test/win/i/all.c:2506:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	56(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; ./asm_test/win/i/all.c:2507:     Symbol* self = create_symbol(keywordList[5], SYMBOL_VARIABLE, class_name, method_scope);
	movq	40+keywordList(%rip), %rcx	 ; keywordList[5],
	movq	%r14, %r8	 ; name,
	movl	$3, %edx	 ;,
	movq	%rax, %r9	 ; tmp1056,
 ; ./asm_test/win/i/all.c:2506:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	%rax, 88(%rsp)	 ; tmp1056, %sfp
 ; ./asm_test/win/i/all.c:2507:     Symbol* self = create_symbol(keywordList[5], SYMBOL_VARIABLE, class_name, method_scope);
	call	create_symbol	 ;
 ; ./asm_test/win/i/all.c:2508:     token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; ./asm_test/win/i/all.c:2507:     Symbol* self = create_symbol(keywordList[5], SYMBOL_VARIABLE, class_name, method_scope);
	movq	%rax, %rdi	 ; tmp1057, self
 ; ./asm_test/win/i/all.c:2508:     token = get_next_token(lexer, 1);
	call	get_next_token	 ;
	movq	%rax, %r9	 ; tmp1058, token
 ; ./asm_test/win/i/all.c:2509:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	movl	24(%rax), %eax	 ; token_518->type, _519
 ; ./asm_test/win/i/all.c:2509:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpl	$1, %eax	 ;, _519
	je	.L1471	 ;,
 ; ./asm_test/win/i/all.c:2509:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpl	$6, %eax	 ;, _519
	jne	.L1472	 ;,
 ; ./asm_test/win/i/all.c:2509:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	movq	(%r9), %rax	 ; token_518->lexeme, _520
 ; ./asm_test/win/i/all.c:2509:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	128+keywordList(%rip), %rax	 ; keywordList[16], _520
	je	.L1471	 ;,
 ; ./asm_test/win/i/all.c:2509:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	136+keywordList(%rip), %rax	 ; keywordList[17], _520
	je	.L1471	 ;,
 ; ./asm_test/win/i/all.c:2509:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	144+keywordList(%rip), %rax	 ; keywordList[18], _520
	je	.L1471	 ;,
 ; ./asm_test/win/i/all.c:2509:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	152+keywordList(%rip), %rax	 ; keywordList[19], _520
	je	.L1471	 ;,
 ; ./asm_test/win/i/all.c:2509:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
	cmpq	160+keywordList(%rip), %rax	 ; keywordList[20], _520
	je	.L1471	 ;,
.L1472:
 ; ./asm_test/win/i/all.c:2510:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected method return type after 'method'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r9), %rax	 ; token_518->column, tmp1198
	movq	8(%r9), %r9	 ; token_518->line, token_518->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rsi	 ;, _527
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _529
	movq	%r9, 112(%rsp)	 ; _529, %sfp
	movq	24(%rax), %r8	 ; _530->path, _531
	movq	%r8, 88(%rsp)	 ; _531, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2510:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected method return type after 'method'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _527,
	movq	112(%rsp), %r9	 ; %sfp, _529
	leaq	.LC230(%rip), %rdx	 ;, tmp806
	movq	88(%rsp), %r8	 ; %sfp, _531
 ; ./asm_test/win/i/all.c:2510:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected method return type after 'method'\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1059, _532
	jmp	.L1557	 ;
.L1471:
 ; ./asm_test/win/i/all.c:2513:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%r9), %rdx	 ; token_518->lexeme,
	movq	56(%rsp), %rcx	 ; %sfp,
	call	search_name	 ;
	movq	%rax, %rsi	 ; tmp1060, return_type
 ; ./asm_test/win/i/all.c:2514:     if (return_type == NULL) {
	testq	%rax, %rax	 ; return_type
	jne	.L1474	 ;,
 ; ./asm_test/win/i/all.c:2515:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown return type for method\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r9), %rax	 ; token_518->column, tmp1199
	movq	8(%r9), %r9	 ; token_518->line, token_518->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rsi	 ;, _536
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _538
	movq	%r9, 112(%rsp)	 ; _538, %sfp
	movq	24(%rax), %r8	 ; _539->path, _540
	movq	%r8, 88(%rsp)	 ; _540, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2515:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown return type for method\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _536,
	movq	112(%rsp), %r9	 ; %sfp, _538
	leaq	.LC231(%rip), %rdx	 ;, tmp811
	movq	88(%rsp), %r8	 ; %sfp, _540
 ; ./asm_test/win/i/all.c:2515:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unknown return type for method\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1061, _541
	jmp	.L1557	 ;
.L1474:
 ; ./asm_test/win/i/all.c:2518:     token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2519:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_542->type
 ; ./asm_test/win/i/all.c:2518:     token = get_next_token(lexer, 1);
	movq	%rax, %rbp	 ; tmp1062, token
 ; ./asm_test/win/i/all.c:2519:     if (token->type != IDENTIFIER) {
	je	.L1475	 ;,
 ; ./asm_test/win/i/all.c:2520:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected method name after return type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rax	 ; token_542->column, tmp1200
	movq	8(%rbp), %r9	 ; token_542->line, token_542->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rsi	 ;, _545
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _547
	movq	%r9, 112(%rsp)	 ; _547, %sfp
	movq	24(%rax), %r8	 ; _548->path, _549
	movq	%r8, 88(%rsp)	 ; _549, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2520:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected method name after return type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _545,
	movq	112(%rsp), %r9	 ; %sfp, _547
	leaq	.LC232(%rip), %rdx	 ;, tmp816
	movq	88(%rsp), %r8	 ; %sfp, _549
 ; ./asm_test/win/i/all.c:2520:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected method name after return type\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1063, _550
.L1557:
 ; ./asm_test/win/i/all.c:2520:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected method name after return type\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
	jmp	.L1473	 ;
.L1475:
 ; ./asm_test/win/i/all.c:2523:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:2524:     method->method_scope = method_scope;
	movq	88(%rsp), %rdx	 ; %sfp, method_scope
 ; ./asm_test/win/i/all.c:2525:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	8(%r14), %rcx	 ; name_342->name, name_342->name
 ; ./asm_test/win/i/all.c:2523:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movq	%rax, 112(%rsp)	 ; tmp1064, %sfp
 ; ./asm_test/win/i/all.c:2524:     method->method_scope = method_scope;
	movq	%rdx, 32(%rax)	 ; method_scope, method_551->method_scope
 ; ./asm_test/win/i/all.c:2525:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	0(%rbp), %rdx	 ; token_542->lexeme,
	call	make_method_name	 ;
 ; ./asm_test/win/i/all.c:2525:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	112(%rsp), %r9	 ; %sfp,
	movq	%rsi, %r8	 ; return_type,
	movl	$2, %edx	 ;,
 ; ./asm_test/win/i/all.c:2525:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	%rax, %rcx	 ; tmp1065, _554
 ; ./asm_test/win/i/all.c:2525:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	call	create_symbol	 ;
 ; ./asm_test/win/i/all.c:2526:     token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; ./asm_test/win/i/all.c:2525:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	%rax, 128(%rsp)	 ; tmp1066, %sfp
 ; ./asm_test/win/i/all.c:2526:     token = get_next_token(lexer, 1);
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2527:     if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	cmpl	$5, 24(%rax)	 ;, token_556->type
	jne	.L1476	 ;,
 ; ./asm_test/win/i/all.c:2527:     if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
	movq	symbolList(%rip), %rdx	 ; symbolList[0], tmp1203
	cmpq	%rdx, (%rax)	 ; tmp1203, token_556->lexeme
	je	.L1477	 ;,
.L1476:
 ; ./asm_test/win/i/all.c:2528:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after method name\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_556->column, tmp1204
	movq	8(%rax), %r9	 ; token_556->line, token_556->line
	movl	$2, %ecx	 ;,
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _563
	leaq	1(%rdi), %rsi	 ;, _561
	movq	24(%rax), %r8	 ; _564->path, _565
	movq	%r9, 112(%rsp)	 ; _563, %sfp
	movq	%r8, 88(%rsp)	 ; _565, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2528:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after method name\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _561,
	movq	112(%rsp), %r9	 ; %sfp, _563
	leaq	.LC233(%rip), %rdx	 ;, tmp824
	movq	88(%rsp), %r8	 ; %sfp, _565
 ; ./asm_test/win/i/all.c:2528:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '(' after method name\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1068, _566
	jmp	.L1557	 ;
.L1477:
 ; ./asm_test/win/i/all.c:2531:     token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2532:     if (token->type != KEYWORD || token->lexeme != keywordList[5])
	cmpl	$6, 24(%rax)	 ;, token_567->type
	jne	.L1478	 ;,
 ; ./asm_test/win/i/all.c:2532:     if (token->type != KEYWORD || token->lexeme != keywordList[5])
	movq	40+keywordList(%rip), %rdx	 ; keywordList[5], tmp1205
	cmpq	%rdx, (%rax)	 ; tmp1205, token_567->lexeme
	je	.L1479	 ;,
.L1478:
 ; ./asm_test/win/i/all.c:2533:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected 'self' as first parameter of method\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdx	 ; token_567->column, tmp1206
	movq	8(%rax), %r9	 ; token_567->line, token_567->line
	movl	$2, %ecx	 ;,
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	leaq	1(%rdx), %rbp	 ;, _572
	incq	%r9	 ; _574
	movq	24(%rax), %r8	 ; _575->path, _576
	movq	%r9, 136(%rsp)	 ; _574, %sfp
	movq	%r8, 120(%rsp)	 ; _576, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2533:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected 'self' as first parameter of method\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbp, 32(%rsp)	 ; _572,
	movq	136(%rsp), %r9	 ; %sfp, _574
	leaq	.LC234(%rip), %rdx	 ;, tmp831
	movq	120(%rsp), %r8	 ; %sfp, _576
 ; ./asm_test/win/i/all.c:2533:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected 'self' as first parameter of method\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1070, _577
 ; ./asm_test/win/i/all.c:2533:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected 'self' as first parameter of method\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
.L1479:
 ; ./asm_test/win/i/all.c:2534:     token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; ./asm_test/win/i/all.c:2549:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Method parameters cannot have default values\n", parser->source_file->path, token->line + 1, token->column + 1);
	leaq	.LC237(%rip), %rbp	 ;, tmp966
 ; ./asm_test/win/i/all.c:2534:     token = get_next_token(lexer, 1);
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp1071, token
 ; ./asm_test/win/i/all.c:2535:     List* parameters = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:2536:     list_append(parameters, (size_t*)create_variable(class_name, self, NULL));
	movq	%rdi, %rdx	 ; self,
	xorl	%r8d, %r8d	 ;
	movq	%r14, %rcx	 ; name,
 ; ./asm_test/win/i/all.c:2535:     List* parameters = create_list();
	movq	%rax, 120(%rsp)	 ; tmp1072, %sfp
 ; ./asm_test/win/i/all.c:2536:     list_append(parameters, (size_t*)create_variable(class_name, self, NULL));
	call	create_variable	 ;
 ; ./asm_test/win/i/all.c:2536:     list_append(parameters, (size_t*)create_variable(class_name, self, NULL));
	movq	120(%rsp), %rcx	 ; %sfp,
 ; ./asm_test/win/i/all.c:2536:     list_append(parameters, (size_t*)create_variable(class_name, self, NULL));
	movq	%rax, %rdx	 ; tmp1073, _580
 ; ./asm_test/win/i/all.c:2536:     list_append(parameters, (size_t*)create_variable(class_name, self, NULL));
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2549:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Method parameters cannot have default values\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	__imp___acrt_iob_func(%rip), %rdi	 ;, tmp965
.L1480:
 ; ./asm_test/win/i/all.c:2537:     while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpl	$5, 24(%r12)	 ;, token_582->type
	je	.L1566	 ;,
.L1481:
 ; ./asm_test/win/i/all.c:2542:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after method parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r12), %rax	 ; token_582->column, tmp1207
	movq	8(%r12), %r9	 ; token_582->line, token_582->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rsi	 ;, _592
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _594
	movq	%r9, 112(%rsp)	 ; _594, %sfp
	movq	24(%rax), %r8	 ; _595->path, _596
	movq	%r8, 88(%rsp)	 ; _596, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2542:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after method parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _592,
	movq	112(%rsp), %r9	 ; %sfp, _594
	leaq	.LC235(%rip), %rdx	 ;, tmp837
	movq	88(%rsp), %r8	 ; %sfp, _596
 ; ./asm_test/win/i/all.c:2542:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after method parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1076, _597
	jmp	.L1557	 ;
.L1566:
 ; ./asm_test/win/i/all.c:2537:     while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	movq	(%r12), %rax	 ; token_582->lexeme, _614
 ; ./asm_test/win/i/all.c:2537:     while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
	cmpq	8+symbolList(%rip), %rax	 ; symbolList[1], _614
	je	.L1567	 ;,
 ; ./asm_test/win/i/all.c:2538:         if (token->type == SYMBOL && token->lexeme == symbolList[4]) {
	cmpq	%rax, 32+symbolList(%rip)	 ; _614, symbolList[4]
	jne	.L1481	 ;,
 ; ./asm_test/win/i/all.c:2539:             token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2545:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	88(%rsp), %rdx	 ; %sfp,
	movq	256(%rsp), %rcx	 ; lexer,
	movq	%r15, %r8	 ; parser,
 ; ./asm_test/win/i/all.c:2539:             token = get_next_token(lexer, 1);
	movq	%rax, %r12	 ; tmp1074, token
 ; ./asm_test/win/i/all.c:2545:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	call	parse_variable	 ;
	movq	%rax, %rdx	 ; tmp1075, parameter
 ; ./asm_test/win/i/all.c:2546:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L1549	 ;,
 ; ./asm_test/win/i/all.c:2547:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse method parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r12), %rax	 ; token_585->column, tmp1208
	movq	8(%r12), %r9	 ; token_585->line, token_585->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %r13	 ;, _599
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _601
	movq	%r9, 144(%rsp)	 ; _601, %sfp
	movq	24(%rax), %r8	 ; _602->path, _603
	movq	%r8, 136(%rsp)	 ; _603, %sfp
	call	*%rdi	 ; tmp965
 ; ./asm_test/win/i/all.c:2547:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse method parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r13, 32(%rsp)	 ; _599,
	leaq	.LC236(%rip), %rdx	 ;, tmp842
	movq	144(%rsp), %r9	 ; %sfp, _601
	movq	136(%rsp), %r8	 ; %sfp, _603
 ; ./asm_test/win/i/all.c:2547:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse method parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1077, _604
	jmp	.L1556	 ;
.L1549:
 ; ./asm_test/win/i/all.c:2548:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_586->value
	je	.L1485	 ;,
 ; ./asm_test/win/i/all.c:2549:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Method parameters cannot have default values\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r12), %rax	 ; token_585->column, tmp1209
	movq	8(%r12), %r9	 ; token_585->line, token_585->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %r13	 ;, _607
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _609
	movq	%r9, 144(%rsp)	 ; _609, %sfp
	movq	24(%rax), %r8	 ; _610->path, _611
	movq	%r8, 136(%rsp)	 ; _611, %sfp
	call	*%rdi	 ; tmp965
 ; ./asm_test/win/i/all.c:2549:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Method parameters cannot have default values\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%r13, 32(%rsp)	 ; _607,
	movq	144(%rsp), %r9	 ; %sfp, _609
	movq	%rbp, %rdx	 ; tmp966,
	movq	136(%rsp), %r8	 ; %sfp, _611
 ; ./asm_test/win/i/all.c:2549:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Method parameters cannot have default values\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1078, _612
.L1556:
 ; ./asm_test/win/i/all.c:2549:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Method parameters cannot have default values\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
	jmp	.L1484	 ;
.L1485:
 ; ./asm_test/win/i/all.c:2551:             list_append(parameters, (size_t*)parameter);
	movq	120(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
.L1484:
 ; ./asm_test/win/i/all.c:2552:         token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp1079, token
	jmp	.L1480	 ;
.L1567:
 ; ./asm_test/win/i/all.c:2554:     token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2555:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	cmpl	$5, 24(%rax)	 ;, token_616->type
	jne	.L1487	 ;,
 ; ./asm_test/win/i/all.c:2555:     if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
	movq	16+symbolList(%rip), %rdi	 ; symbolList[2], tmp1210
	cmpq	%rdi, (%rax)	 ; tmp1210, token_616->lexeme
	je	.L1488	 ;,
.L1487:
 ; ./asm_test/win/i/all.c:2556:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start method body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rdi	 ; token_616->column, tmp1211
	movq	8(%rax), %r9	 ; token_616->line, token_616->line
	movl	$2, %ecx	 ;,
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _623
	leaq	1(%rdi), %rsi	 ;, _621
	movq	24(%rax), %r8	 ; _624->path, _625
	movq	%r9, 112(%rsp)	 ; _623, %sfp
	movq	%r8, 88(%rsp)	 ; _625, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2556:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start method body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _621,
	movq	112(%rsp), %r9	 ; %sfp, _623
	leaq	.LC238(%rip), %rdx	 ;, tmp855
	movq	88(%rsp), %r8	 ; %sfp, _625
 ; ./asm_test/win/i/all.c:2556:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected '{' to start method body\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1081, _626
	jmp	.L1557	 ;
.L1488:
 ; ./asm_test/win/i/all.c:2559:     List* body = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:2560:     parser->in_function = 1;
	movw	$257, 8(%r15)	 ;, MEM <unsigned short> [(char *)parser_85(D) + 8B]
 ; ./asm_test/win/i/all.c:2563:     token = get_next_token(lexer, 1);
	movl	$1, %edx	 ;,
 ; ./asm_test/win/i/all.c:2562:     char have_return = 0;
	xorl	%r12d, %r12d	 ; have_return
 ; ./asm_test/win/i/all.c:2563:     token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
 ; ./asm_test/win/i/all.c:2559:     List* body = create_list();
	movq	%rax, %rdi	 ; tmp1082, body
 ; ./asm_test/win/i/all.c:2563:     token = get_next_token(lexer, 1);
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp1083, token
.L1489:
 ; ./asm_test/win/i/all.c:2564:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	cmpl	$5, 24(%r13)	 ;, token_630->type
	je	.L1568	 ;,
.L1494:
 ; ./asm_test/win/i/all.c:2565:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	88(%rsp), %rdx	 ; %sfp,
	movq	256(%rsp), %rcx	 ; lexer,
	movq	%r15, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %rbp	 ; tmp1084, statement
 ; ./asm_test/win/i/all.c:2566:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L1490	 ;,
 ; ./asm_test/win/i/all.c:2567:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse method body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r13), %rax	 ; token_630->column, tmp1212
	movq	8(%r13), %r9	 ; token_630->line, token_630->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rdx	 ;, _632
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _634
	movq	%rdx, 152(%rsp)	 ; _632, %sfp
	movq	24(%rax), %r8	 ; _635->path, _636
	movq	%r9, 144(%rsp)	 ; _634, %sfp
	movq	%r8, 136(%rsp)	 ; _636, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2567:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse method body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	152(%rsp), %rdx	 ; %sfp, _632
	movq	144(%rsp), %r9	 ; %sfp, _634
	movq	136(%rsp), %r8	 ; %sfp, _636
 ; ./asm_test/win/i/all.c:2567:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse method body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1085, _637
 ; ./asm_test/win/i/all.c:2567:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse method body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdx, 32(%rsp)	 ; _632,
	leaq	.LC239(%rip), %rdx	 ;, tmp860
	call	fprintf	 ;
	jmp	.L1493	 ;
.L1490:
 ; ./asm_test/win/i/all.c:2568:         else if (have_return)
	testb	%r12b, %r12b	 ; have_return
	je	.L1492	 ;,
 ; ./asm_test/win/i/all.c:2569:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r13), %rax	 ; token_630->column, tmp1213
	movq	8(%r13), %r9	 ; token_630->line, token_630->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rdx	 ;, _640
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _642
	movq	%rdx, 152(%rsp)	 ; _640, %sfp
	movq	24(%rax), %r8	 ; _643->path, _644
	movq	%r9, 144(%rsp)	 ; _642, %sfp
	movq	%r8, 136(%rsp)	 ; _644, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2569:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	152(%rsp), %rdx	 ; %sfp, _640
	movq	144(%rsp), %r9	 ; %sfp, _642
	movq	136(%rsp), %r8	 ; %sfp, _644
 ; ./asm_test/win/i/all.c:2569:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1086, _645
 ; ./asm_test/win/i/all.c:2569:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdx, 32(%rsp)	 ; _640,
	leaq	.LC224(%rip), %rdx	 ;,
	call	fprintf	 ;
.L1492:
 ; ./asm_test/win/i/all.c:2571:             have_return = 1;
	cmpl	$5, 8(%rbp)	 ;, statement_629->type
	movb	$1, %al	 ;, tmp951
	cmove	%eax, %r12d	 ; have_return,, tmp951, have_return
.L1493:
 ; ./asm_test/win/i/all.c:2572:         list_append(body, (size_t*)statement);
	movq	%rbp, %rdx	 ; statement,
	movq	%rdi, %rcx	 ; body,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2573:         token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp1087, token
	jmp	.L1489	 ;
.L1568:
 ; ./asm_test/win/i/all.c:2564:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	movq	24+symbolList(%rip), %rax	 ; symbolList[3], tmp1214
	cmpq	%rax, 0(%r13)	 ; tmp1214, token_630->lexeme
	jne	.L1494	 ;,
 ; ./asm_test/win/i/all.c:2575:     parser->in_function = 0;
	movw	$0, 8(%r15)	 ;, MEM <unsigned short> [(char *)parser_85(D) + 8B]
 ; ./asm_test/win/i/all.c:2577:     if (!have_return && return_type != name_void)
	testb	%r12b, %r12b	 ; have_return
	jne	.L1496	 ;,
 ; ./asm_test/win/i/all.c:2577:     if (!have_return && return_type != name_void)
	cmpq	name_void(%rip), %rsi	 ; name_void, return_type
	jne	.L1497	 ;,
.L1498:
 ; ./asm_test/win/i/all.c:2580:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	xorl	%ecx, %ecx	 ;
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rcx, 40(%rsp)	 ;,
	movq	%rcx, 32(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
 ; ./asm_test/win/i/all.c:2580:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	%rdi, %rcx	 ; body,
 ; ./asm_test/win/i/all.c:2580:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	movq	%rax, %rdx	 ; tmp1088, _662
 ; ./asm_test/win/i/all.c:2580:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL));
	call	list_append	 ;
	jmp	.L1496	 ;
.L1497:
 ; ./asm_test/win/i/all.c:2578:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Method missing return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%r13), %rax	 ; token_630->column, tmp1215
	movq	8(%r13), %r9	 ; token_630->line, token_630->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rbp	 ;, _655
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _657
	movq	%r9, 144(%rsp)	 ; _657, %sfp
	movq	24(%rax), %r8	 ; _658->path, _659
	movq	%r8, 136(%rsp)	 ; _659, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2578:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Method missing return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbp, 32(%rsp)	 ; _655,
	movq	144(%rsp), %r9	 ; %sfp, _657
	leaq	.LC240(%rip), %rdx	 ;, tmp872
	movq	136(%rsp), %r8	 ; %sfp, _659
 ; ./asm_test/win/i/all.c:2578:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Method missing return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1089, _660
 ; ./asm_test/win/i/all.c:2578:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Method missing return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2579:     if (!have_return && return_type == name_void)
	cmpq	name_void(%rip), %rsi	 ; name_void, return_type
	je	.L1498	 ;,
.L1496:
 ; ./asm_test/win/i/all.c:2581:     return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
	movq	88(%rsp), %rax	 ; %sfp, method_scope
	movq	%rdi, 32(%rsp)	 ; body,
	movq	%rsi, %r8	 ; return_type,
	movq	128(%rsp), %rdx	 ; %sfp,
	movq	120(%rsp), %r9	 ; %sfp,
	movq	%rax, 40(%rsp)	 ; method_scope,
	movq	112(%rsp), %rcx	 ; %sfp,
	call	create_method_use_ptr	 ;
	movq	%rax, %rdx	 ; tmp1090, _663
 ; ./asm_test/win/i/all.c:2605:             if (method == NULL)
	testq	%rax, %rax	 ; _663
	jne	.L1500	 ;,
.L1473:
 ; ./asm_test/win/i/all.c:2606:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse class method\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbx), %rax	 ; token_357->column, tmp1217
	movq	8(%rbx), %r9	 ; token_357->line, token_357->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rsi	 ;, _362
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _364
	movq	%r9, 112(%rsp)	 ; _364, %sfp
	movq	24(%rax), %r8	 ; _365->path, _366
	movq	%r8, 88(%rsp)	 ; _366, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2606:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse class method\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _362,
	movq	112(%rsp), %r9	 ; %sfp, _364
	leaq	.LC241(%rip), %rdx	 ;, tmp877
	movq	88(%rsp), %r8	 ; %sfp, _366
 ; ./asm_test/win/i/all.c:2606:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse class method\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1091, _367
 ; ./asm_test/win/i/all.c:2606:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse class method\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
	xorl	%edx, %edx	 ; _663
.L1500:
 ; ./asm_test/win/i/all.c:2607:             list_append(members, (size_t*)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%ecx, %ecx	 ;
	xorl	%r8d, %r8d	 ;
	call	create_class_member	 ;
 ; ./asm_test/win/i/all.c:2607:             list_append(members, (size_t*)create_class_member(CLASS_METHOD, method, NULL));
	movq	80(%rsp), %rcx	 ; %sfp,
 ; ./asm_test/win/i/all.c:2607:             list_append(members, (size_t*)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rdx	 ; tmp1092, _368
 ; ./asm_test/win/i/all.c:2607:             list_append(members, (size_t*)create_class_member(CLASS_METHOD, method, NULL));
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2603:         if (token->type == KEYWORD && token->lexeme == keywordList[4]) {
	jmp	.L1512	 ;
.L1470:
 ; ./asm_test/win/i/all.c:2608:         } else if (token->type == KEYWORD && token->lexeme == keywordList[21]) {
	cmpq	168+keywordList(%rip), %rax	 ; keywordList[21], _358
	jne	.L1469	 ;,
 ; ./asm_test/win/i/all.c:2609:             token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2610:             parser->in_class = 1;
	movb	$1, 10(%r15)	 ;, parser_85(D)->in_class
 ; ./asm_test/win/i/all.c:2611:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	%r15, %r8	 ; parser,
	movq	256(%rsp), %rcx	 ; lexer,
 ; ./asm_test/win/i/all.c:2609:             token = get_next_token(lexer, 1);
	movq	%rax, %rbx	 ; tmp1093, token
 ; ./asm_test/win/i/all.c:2611:             Variable* variable = parse_variable(lexer, class_scope, parser);
	call	parse_variable	 ;
 ; ./asm_test/win/i/all.c:2612:             parser->in_class = 0;
	movb	$0, 10(%r15)	 ;, parser_85(D)->in_class
 ; ./asm_test/win/i/all.c:2611:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	%rax, %rdi	 ; tmp1094, variable
 ; ./asm_test/win/i/all.c:2613:             if (variable == NULL)
	testq	%rax, %rax	 ; variable
	jne	.L1502	 ;,
 ; ./asm_test/win/i/all.c:2614:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse class variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbx), %rax	 ; token_371->column, tmp1218
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rbp	 ;, _374
	movq	8(%rbx), %rax	 ; token_371->line, tmp1219
	leaq	1(%rax), %r9	 ;, _376
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	movq	%r9, 88(%rsp)	 ; _376, %sfp
	movq	24(%rax), %rsi	 ; _377->path, _378
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2614:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse class variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbp, 32(%rsp)	 ; _374,
	movq	88(%rsp), %r9	 ; %sfp, _376
	leaq	.LC242(%rip), %rdx	 ;, tmp883
 ; ./asm_test/win/i/all.c:2614:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse class variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1095, _379
 ; ./asm_test/win/i/all.c:2614:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Failed to parse class variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, %r8	 ; _378,
	call	fprintf	 ;
.L1502:
 ; ./asm_test/win/i/all.c:2615:             ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
	xorl	%edx, %edx	 ;
	movq	%rdi, %r8	 ; variable,
	movl	$1, %ecx	 ;,
	call	create_class_member	 ;
 ; ./asm_test/win/i/all.c:2616:             list_append(members, (size_t*)member);
	movq	80(%rsp), %rcx	 ; %sfp,
 ; ./asm_test/win/i/all.c:2615:             ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
	movq	%rax, %rsi	 ; tmp1096, member
 ; ./asm_test/win/i/all.c:2616:             list_append(members, (size_t*)member);
	movq	%rax, %rdx	 ; member,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2617:             if (member->type == CLASS_VARIABLE) {
	cmpl	$1, 8(%rsi)	 ;, member_380->type
	jne	.L1506	 ;,
 ; ./asm_test/win/i/all.c:2618:                 Symbol* type = member->content.variable->type;
	movq	(%rsi), %rax	 ; member_380->content.variable, member_380->content.variable
	movq	(%rax), %rax	 ; _382->type, type
 ; ./asm_test/win/i/all.c:2619:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	name_int(%rip), %rax	 ; name_int, type
	je	.L1558	 ;,
 ; ./asm_test/win/i/all.c:2619:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	name_float(%rip), %rax	 ; name_float, type
	je	.L1558	 ;,
 ; ./asm_test/win/i/all.c:2619:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	name_string(%rip), %rax	 ; name_string, type
	je	.L1558	 ;,
 ; ./asm_test/win/i/all.c:2621:                 else if (type == name_bool || type == name_void)
	cmpq	name_bool(%rip), %rax	 ; name_bool, type
	je	.L1507	 ;,
 ; ./asm_test/win/i/all.c:2621:                 else if (type == name_bool || type == name_void)
	cmpq	name_void(%rip), %rax	 ; name_void, type
	jne	.L1508	 ;,
.L1507:
 ; ./asm_test/win/i/all.c:2622:                     size += 1;
	incq	104(%rsp)	 ; %sfp
	jmp	.L1506	 ;
.L1508:
 ; ./asm_test/win/i/all.c:2623:                 else if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rax)	 ;, type_383->kind
	jne	.L1509	 ;,
.L1558:
 ; ./asm_test/win/i/all.c:2624:                     size += 8;
	addq	$8, 104(%rsp)	 ;, %sfp
	jmp	.L1506	 ;
.L1509:
 ; ./asm_test/win/i/all.c:2626:                     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unsupported type for class variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbx), %rax	 ; token_371->column, tmp1223
	movq	8(%rbx), %r9	 ; token_371->line, token_371->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rsi	 ;, _395
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _397
	movq	%r9, 112(%rsp)	 ; _397, %sfp
	movq	24(%rax), %r8	 ; _398->path, _399
	movq	%r8, 88(%rsp)	 ; _399, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2626:                     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unsupported type for class variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _395,
	movq	112(%rsp), %r9	 ; %sfp, _397
	leaq	.LC243(%rip), %rdx	 ;, tmp889
	movq	88(%rsp), %r8	 ; %sfp, _399
 ; ./asm_test/win/i/all.c:2626:                     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unsupported type for class variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1097, _400
 ; ./asm_test/win/i/all.c:2626:                     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unsupported type for class variable\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
.L1506:
 ; ./asm_test/win/i/all.c:2628:             token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; ./asm_test/win/i/all.c:2629:             if (token->type != SYMBOL || token->lexeme != symbolList[9])
	cmpl	$5, 24(%rax)	 ;, token_401->type
	jne	.L1510	 ;,
 ; ./asm_test/win/i/all.c:2629:             if (token->type != SYMBOL || token->lexeme != symbolList[9])
	movq	72+symbolList(%rip), %rbx	 ; symbolList[9], tmp1224
	cmpq	%rbx, (%rax)	 ; tmp1224, token_401->lexeme
	je	.L1512	 ;,
.L1510:
 ; ./asm_test/win/i/all.c:2630:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after class variable declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rax), %rbx	 ; token_401->column, tmp1225
	movq	8(%rax), %r9	 ; token_401->line, token_401->line
	movl	$2, %ecx	 ;,
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _408
	incq	%rbx	 ; _406
	movq	24(%rax), %r8	 ; _409->path, _410
	movq	%r9, 112(%rsp)	 ; _408, %sfp
	movq	%r8, 88(%rsp)	 ; _410, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2630:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after class variable declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rbx, 32(%rsp)	 ; _406,
	movq	112(%rsp), %r9	 ; %sfp, _408
	leaq	.LC244(%rip), %rdx	 ;, tmp896
	movq	88(%rsp), %r8	 ; %sfp, _410
 ; ./asm_test/win/i/all.c:2630:                 fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Expected ';' after class variable declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1099, _411
	jmp	.L1559	 ;
.L1565:
 ; ./asm_test/win/i/all.c:2602:     while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
	movq	24+symbolList(%rip), %rax	 ; symbolList[3], tmp1227
	cmpq	%rax, (%rbx)	 ; tmp1227, token_357->lexeme
	je	.L1569	 ;,
.L1469:
 ; ./asm_test/win/i/all.c:2632:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unexpected token in class member\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbx), %rax	 ; token_357->column, tmp1226
	movq	8(%rbx), %r9	 ; token_357->line, token_357->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rsi	 ;, _413
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _415
	movq	%r9, 112(%rsp)	 ; _415, %sfp
	movq	24(%rax), %r8	 ; _416->path, _417
	movq	%r8, 88(%rsp)	 ; _417, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2632:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unexpected token in class member\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _413,
	movq	112(%rsp), %r9	 ; %sfp, _415
	leaq	.LC245(%rip), %rdx	 ;,
	movq	88(%rsp), %r8	 ; %sfp, _417
 ; ./asm_test/win/i/all.c:2632:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unexpected token in class member\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1100, _418
.L1559:
 ; ./asm_test/win/i/all.c:2632:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unexpected token in class member\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
.L1512:
 ; ./asm_test/win/i/all.c:2633:         token = get_next_token(lexer, 1);
	movq	256(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp1101, token
	jmp	.L1468	 ;
.L1569:
 ; ./asm_test/win/i/all.c:2635:     char* init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
	movq	8(%r14), %rcx	 ; name_342->name, name_342->name
	movq	DEFAULT_INIT_NAME(%rip), %rdx	 ; DEFAULT_INIT_NAME,
	call	make_method_name	 ;
 ; ./asm_test/win/i/all.c:2636:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; init_name,
 ; ./asm_test/win/i/all.c:2635:     char* init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
	movq	%rax, %rbp	 ; tmp1102, init_name
 ; ./asm_test/win/i/all.c:2636:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	call	search_name_use_strcmp	 ;
	movq	%rax, %rsi	 ; tmp1103, init
 ; ./asm_test/win/i/all.c:2637:     if (init == NULL) {
	testq	%rax, %rax	 ; init
	jne	.L1514	 ;,
 ; ./asm_test/win/i/all.c:2638:         Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:2639:         method->method_scope = create_symbol_table(class_scope);
	movq	56(%rsp), %rcx	 ; %sfp,
 ; ./asm_test/win/i/all.c:2638:         Method* method = (Method*)alloc_memory(sizeof(Method));
	movq	%rax, %rdi	 ; tmp1104, method
 ; ./asm_test/win/i/all.c:2639:         method->method_scope = create_symbol_table(class_scope);
	call	create_symbol_table	 ;
 ; ./asm_test/win/i/all.c:2640:         init = create_symbol(init_name, SYMBOL_METHOD, name, method);
	movq	%rbp, %rcx	 ; init_name,
	movq	%rdi, %r9	 ; method,
	movq	%r14, %r8	 ; name,
 ; ./asm_test/win/i/all.c:2639:         method->method_scope = create_symbol_table(class_scope);
	movq	%rax, 32(%rdi)	 ; tmp1105, method_426->method_scope
 ; ./asm_test/win/i/all.c:2640:         init = create_symbol(init_name, SYMBOL_METHOD, name, method);
	movl	$2, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, %rsi	 ; tmp1106, init
 ; ./asm_test/win/i/all.c:2641:         List* parameters = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:2642:         Symbol* self = create_symbol(keywordList[5], SYMBOL_VARIABLE, name, method->method_scope);
	movq	32(%rdi), %r9	 ; method_426->method_scope,
	movq	%r14, %r8	 ; name,
	movq	40+keywordList(%rip), %rcx	 ; keywordList[5],
	movl	$3, %edx	 ;,
 ; ./asm_test/win/i/all.c:2641:         List* parameters = create_list();
	movq	%rax, %rbp	 ; tmp1107, parameters
 ; ./asm_test/win/i/all.c:2642:         Symbol* self = create_symbol(keywordList[5], SYMBOL_VARIABLE, name, method->method_scope);
	call	create_symbol	 ;
 ; ./asm_test/win/i/all.c:2643:         list_append(parameters, (size_t*)create_variable(name, self, NULL));
	xorl	%r8d, %r8d	 ;
	movq	%r14, %rcx	 ; name,
	movq	%rax, %rdx	 ; self,
 ; ./asm_test/win/i/all.c:2642:         Symbol* self = create_symbol(keywordList[5], SYMBOL_VARIABLE, name, method->method_scope);
	movq	%rax, %r13	 ; tmp1108, self
 ; ./asm_test/win/i/all.c:2643:         list_append(parameters, (size_t*)create_variable(name, self, NULL));
	call	create_variable	 ;
 ; ./asm_test/win/i/all.c:2643:         list_append(parameters, (size_t*)create_variable(name, self, NULL));
	movq	%rbp, %rcx	 ; parameters,
 ; ./asm_test/win/i/all.c:2643:         list_append(parameters, (size_t*)create_variable(name, self, NULL));
	movq	%rax, %rdx	 ; tmp1109, _433
 ; ./asm_test/win/i/all.c:2643:         list_append(parameters, (size_t*)create_variable(name, self, NULL));
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2644:         List* body = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:2645:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	movq	%r13, %r8	 ; self,
	xorl	%edx, %edx	 ;
 ; ./asm_test/win/i/all.c:2644:         List* body = create_list();
	movq	%rax, %r12	 ; tmp1110, body
 ; ./asm_test/win/i/all.c:2645:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%eax, %eax	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rax, 32(%rsp)	 ;,
	call	create_variable_access	 ;
 ; ./asm_test/win/i/all.c:2645:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp1111,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; ./asm_test/win/i/all.c:2645:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; ./asm_test/win/i/all.c:2645:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %r8	 ;, tmp1112
 ; ./asm_test/win/i/all.c:2645:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	create_expression	 ;
 ; ./asm_test/win/i/all.c:2645:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rdx, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp1113,
	call	create_statement	 ;
 ; ./asm_test/win/i/all.c:2645:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%r12, %rcx	 ; body,
 ; ./asm_test/win/i/all.c:2645:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %rdx	 ; tmp1114, _438
 ; ./asm_test/win/i/all.c:2645:         list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2646:         create_method_use_ptr(method, init, name, parameters, body, method->method_scope);
	movq	32(%rdi), %rax	 ; method_426->method_scope, method_426->method_scope
	movq	%rbp, %r9	 ; parameters,
	movq	%r14, %r8	 ; name,
	movq	%r12, 32(%rsp)	 ; body,
	movq	%rsi, %rdx	 ; init,
	movq	%rdi, %rcx	 ; method,
	movq	%rax, 40(%rsp)	 ; method_426->method_scope,
	call	create_method_use_ptr	 ;
 ; ./asm_test/win/i/all.c:2647:         list_append(members, (size_t*)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rdi, %rdx	 ; method,
	xorl	%ecx, %ecx	 ;
	xorl	%r8d, %r8d	 ;
	call	create_class_member	 ;
 ; ./asm_test/win/i/all.c:2647:         list_append(members, (size_t*)create_class_member(CLASS_METHOD, method, NULL));
	movq	80(%rsp), %rcx	 ; %sfp,
 ; ./asm_test/win/i/all.c:2647:         list_append(members, (size_t*)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rdx	 ; tmp1115, _440
 ; ./asm_test/win/i/all.c:2647:         list_append(members, (size_t*)create_class_member(CLASS_METHOD, method, NULL));
	call	list_append	 ;
.L1514:
 ; ./asm_test/win/i/all.c:2649:     if (init->kind != SYMBOL_METHOD)
	cmpl	$2, 32(%rsi)	 ;, init_441->kind
	je	.L1515	 ;,
 ; ./asm_test/win/i/all.c:2650:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Constructor name conflicts with existing member\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbx), %rax	 ; token_357->column, tmp1228
	movq	8(%rbx), %r9	 ; token_357->line, token_357->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rdi	 ;, _445
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _447
	movq	%r9, 112(%rsp)	 ; _447, %sfp
	movq	24(%rax), %r8	 ; _448->path, _449
	movq	%r8, 88(%rsp)	 ; _449, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2650:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Constructor name conflicts with existing member\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rdi, 32(%rsp)	 ; _445,
	movq	112(%rsp), %r9	 ; %sfp, _447
	leaq	.LC246(%rip), %rdx	 ;, tmp914
	movq	88(%rsp), %r8	 ; %sfp, _449
 ; ./asm_test/win/i/all.c:2650:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Constructor name conflicts with existing member\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1116, _450
 ; ./asm_test/win/i/all.c:2650:         fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Constructor name conflicts with existing member\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
.L1515:
 ; ./asm_test/win/i/all.c:2651:     char* constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME,
	movq	8(%r14), %rcx	 ; name_342->name, name_342->name
	call	make_method_name	 ;
 ; ./asm_test/win/i/all.c:2652:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
 ; ./asm_test/win/i/all.c:2651:     char* constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	%rax, %rdi	 ; tmp1117, constructor_name
 ; ./asm_test/win/i/all.c:2652:     Method* method = (Method*)alloc_memory(sizeof(Method));
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:2653:     method->method_scope = create_symbol_table(class_scope);
	movq	56(%rsp), %rcx	 ; %sfp,
 ; ./asm_test/win/i/all.c:2652:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movq	%rax, %rbx	 ; tmp1118, method
 ; ./asm_test/win/i/all.c:2653:     method->method_scope = create_symbol_table(class_scope);
	call	create_symbol_table	 ;
 ; ./asm_test/win/i/all.c:2654:     Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
	movq	%rbx, %r9	 ; method,
	movq	%r14, %r8	 ; name,
	movl	$2, %edx	 ;,
 ; ./asm_test/win/i/all.c:2653:     method->method_scope = create_symbol_table(class_scope);
	movq	%rax, 32(%rbx)	 ; tmp1119, method_454->method_scope
 ; ./asm_test/win/i/all.c:2654:     Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
	movq	%rdi, %rcx	 ; constructor_name,
	call	create_symbol	 ;
	movq	%rax, 112(%rsp)	 ; tmp1120, %sfp
 ; ./asm_test/win/i/all.c:2655:     List* parameters = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:2656:     Symbol* self = create_symbol(keywordList[5], SYMBOL_VARIABLE, name, method->method_scope);
	movq	32(%rbx), %r9	 ; method_454->method_scope,
	movq	%r14, %r8	 ; name,
	movq	40+keywordList(%rip), %rcx	 ; keywordList[5],
	movl	$3, %edx	 ;,
 ; ./asm_test/win/i/all.c:2655:     List* parameters = create_list();
	movq	%rax, 88(%rsp)	 ; tmp1121, %sfp
 ; ./asm_test/win/i/all.c:2656:     Symbol* self = create_symbol(keywordList[5], SYMBOL_VARIABLE, name, method->method_scope);
	call	create_symbol	 ;
	movq	%rax, %r12	 ; tmp1122, self
 ; ./asm_test/win/i/all.c:2657:     List* init_params = list_copy(init->ast_node.method->parameters);
	movq	24(%rsi), %rax	 ; init_441->ast_node.method, init_441->ast_node.method
	movq	16(%rax), %rcx	 ; _461->parameters, _461->parameters
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp1123, init_params
.L1517:
 ; ./asm_test/win/i/all.c:2659:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	movq	%rbp, %rcx	 ; init_params,
	call	list_pop	 ;
 ; ./asm_test/win/i/all.c:2659:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	testq	%rax, %rax	 ; param
	je	.L1570	 ;,
 ; ./asm_test/win/i/all.c:2660:         if (param->name->name == keywordList[5]) continue;
	movq	8(%rax), %rdx	 ; param_464->name, _465
 ; ./asm_test/win/i/all.c:2660:         if (param->name->name == keywordList[5]) continue;
	movq	40+keywordList(%rip), %rdi	 ; keywordList[5], tmp1229
	cmpq	%rdi, 8(%rdx)	 ; tmp1229, _465->name
	je	.L1517	 ;,
 ; ./asm_test/win/i/all.c:2661:         list_append(parameters, (size_t*)create_variable(param->type, param->name, NULL));
	movq	(%rax), %rcx	 ; param_464->type,
	xorl	%r8d, %r8d	 ;
	call	create_variable	 ;
 ; ./asm_test/win/i/all.c:2661:         list_append(parameters, (size_t*)create_variable(param->type, param->name, NULL));
	movq	88(%rsp), %rcx	 ; %sfp,
 ; ./asm_test/win/i/all.c:2661:         list_append(parameters, (size_t*)create_variable(param->type, param->name, NULL));
	movq	%rax, %rdx	 ; tmp1124, _469
 ; ./asm_test/win/i/all.c:2661:         list_append(parameters, (size_t*)create_variable(param->type, param->name, NULL));
	call	list_append	 ;
	jmp	.L1517	 ;
.L1570:
 ; ./asm_test/win/i/all.c:2663:     List* body = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:2664:     List* ms = list_copy(members);
	movq	80(%rsp), %rcx	 ; %sfp,
 ; ./asm_test/win/i/all.c:2663:     List* body = create_list();
	movq	%rax, %r13	 ; tmp1126, body
 ; ./asm_test/win/i/all.c:2664:     List* ms = list_copy(members);
	call	list_copy	 ;
 ; ./asm_test/win/i/all.c:2666:     list_append(body, (size_t*)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	movq	%r12, %r8	 ; self,
	xorl	%edx, %edx	 ;
 ; ./asm_test/win/i/all.c:2664:     List* ms = list_copy(members);
	movq	%rax, 120(%rsp)	 ; tmp1127, %sfp
 ; ./asm_test/win/i/all.c:2666:     list_append(body, (size_t*)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%eax, %eax	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rax, 32(%rsp)	 ;,
	call	create_variable_access	 ;
 ; ./asm_test/win/i/all.c:2666:     list_append(body, (size_t*)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp1128,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; ./asm_test/win/i/all.c:2666:     list_append(body, (size_t*)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; ./asm_test/win/i/all.c:2666:     list_append(body, (size_t*)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %r8	 ;, tmp1129
.L1560:
 ; ./asm_test/win/i/all.c:2671:             list_append(body, (size_t*)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	call	create_expression	 ;
 ; ./asm_test/win/i/all.c:2671:             list_append(body, (size_t*)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	xorl	%r11d, %r11d	 ;
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%r11, 40(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rax, 32(%rsp)	 ; tmp1139,
	call	create_statement	 ;
 ; ./asm_test/win/i/all.c:2671:             list_append(body, (size_t*)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	%r13, %rcx	 ; body,
 ; ./asm_test/win/i/all.c:2671:             list_append(body, (size_t*)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	%rax, %rdx	 ; tmp1140, _492
 ; ./asm_test/win/i/all.c:2671:             list_append(body, (size_t*)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	call	list_append	 ;
.L1520:
 ; ./asm_test/win/i/all.c:2667:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	movq	120(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp1141, mb
 ; ./asm_test/win/i/all.c:2667:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	testq	%rax, %rax	 ; mb
	je	.L1571	 ;,
 ; ./asm_test/win/i/all.c:2668:         if (mb->type == CLASS_VARIABLE) {
	cmpl	$1, 8(%rdi)	 ;, mb_476->type
	jne	.L1520	 ;,
 ; ./asm_test/win/i/all.c:2669:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	(%rdi), %rax	 ; mb_476->content.variable, mb_476->content.variable
	xorl	%r9d, %r9d	 ;
	movq	%r12, %r8	 ; self,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	8(%rax), %rbp	 ; _479->name, _480
	xorl	%eax, %eax	 ;
	movq	%rax, 32(%rsp)	 ;,
	call	create_variable_access	 ;
 ; ./asm_test/win/i/all.c:2669:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	%rbp, %r8	 ; _480,
	xorl	%r9d, %r9d	 ;
	movl	$2, %ecx	 ;,
 ; ./asm_test/win/i/all.c:2669:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	%rax, %rdx	 ; tmp1132, _481
 ; ./asm_test/win/i/all.c:2669:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	xorl	%eax, %eax	 ;
	movq	%rax, 32(%rsp)	 ;,
	call	create_variable_access	 ;
 ; ./asm_test/win/i/all.c:2669:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp1133,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; ./asm_test/win/i/all.c:2669:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; ./asm_test/win/i/all.c:2669:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	movq	%rax, %r8	 ;, tmp1134
 ; ./asm_test/win/i/all.c:2669:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, NULL, self, NULL, NULL), mb->content.variable->name, NULL, NULL)), NULL);
	call	create_expression	 ;
	movq	%rax, %rbp	 ; tmp1135, left
 ; ./asm_test/win/i/all.c:2670:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string_check("0", 2, 1), NULL, NULL, NULL), NULL);
	movq	(%rdi), %rax	 ; mb_476->content.variable, mb_476->content.variable
	movq	16(%rax), %r9	 ; _485->value, _486
 ; ./asm_test/win/i/all.c:2670:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string_check("0", 2, 1), NULL, NULL, NULL), NULL);
	testq	%r9, %r9	 ; _486
	jne	.L1521	 ;,
 ; ./asm_test/win/i/all.c:2670:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string_check("0", 2, 1), NULL, NULL, NULL), NULL);
	movl	$1, %r8d	 ;,
	movl	$2, %edx	 ;,
	leaq	.LC247(%rip), %rcx	 ;, tmp926
 ; ./asm_test/win/i/all.c:2670:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string_check("0", 2, 1), NULL, NULL, NULL), NULL);
	xorl	%edi, %edi	 ;
 ; ./asm_test/win/i/all.c:2670:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string_check("0", 2, 1), NULL, NULL, NULL), NULL);
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:2670:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string_check("0", 2, 1), NULL, NULL, NULL), NULL);
	movq	%rdi, 32(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
 ; ./asm_test/win/i/all.c:2670:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string_check("0", 2, 1), NULL, NULL, NULL), NULL);
	movq	%rax, %rdx	 ; tmp1136, _487
 ; ./asm_test/win/i/all.c:2670:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string_check("0", 2, 1), NULL, NULL, NULL), NULL);
	xorl	%ecx, %ecx	 ;
	call	create_primary	 ;
 ; ./asm_test/win/i/all.c:2670:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string_check("0", 2, 1), NULL, NULL, NULL), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; ./asm_test/win/i/all.c:2670:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string_check("0", 2, 1), NULL, NULL, NULL), NULL);
	movq	%rax, %r8	 ;, tmp1137
 ; ./asm_test/win/i/all.c:2670:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string_check("0", 2, 1), NULL, NULL, NULL), NULL);
	call	create_expression	 ;
	movq	%rax, %r9	 ; tmp1138, _486
.L1521:
 ; ./asm_test/win/i/all.c:2671:             list_append(body, (size_t*)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; left,
	movl	$13, %ecx	 ;,
	jmp	.L1560	 ;
.L1571:
 ; ./asm_test/win/i/all.c:2674:     List* args = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:2675:     list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	xorl	%r10d, %r10d	 ;
	movq	%r12, %r8	 ; self,
	xorl	%r9d, %r9d	 ;
	movq	%r10, 32(%rsp)	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
 ; ./asm_test/win/i/all.c:2674:     List* args = create_list();
	movq	%rax, %rbp	 ; tmp1142, args
 ; ./asm_test/win/i/all.c:2675:     list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	call	create_variable_access	 ;
 ; ./asm_test/win/i/all.c:2675:     list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp1143,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; ./asm_test/win/i/all.c:2675:     list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; ./asm_test/win/i/all.c:2675:     list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	%rax, %r8	 ;, tmp1144
 ; ./asm_test/win/i/all.c:2675:     list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	call	create_expression	 ;
 ; ./asm_test/win/i/all.c:2675:     list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	%rbp, %rcx	 ; args,
 ; ./asm_test/win/i/all.c:2675:     list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	movq	%rax, %rdx	 ; tmp1145, _496
 ; ./asm_test/win/i/all.c:2675:     list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL));
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2676:     List* params = list_copy(parameters);
	movq	88(%rsp), %rcx	 ; %sfp,
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp1146, params
.L1523:
 ; ./asm_test/win/i/all.c:2677:     while ((param = (Variable*)list_pop(params)) != NULL)
	movq	%r12, %rcx	 ; params,
	call	list_pop	 ;
 ; ./asm_test/win/i/all.c:2677:     while ((param = (Variable*)list_pop(params)) != NULL)
	testq	%rax, %rax	 ; param
	je	.L1572	 ;,
 ; ./asm_test/win/i/all.c:2678:         list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	xorl	%r9d, %r9d	 ;
	movq	8(%rax), %r8	 ; param_498->name, param_498->name
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%r9, 32(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	call	create_variable_access	 ;
 ; ./asm_test/win/i/all.c:2678:         list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp1147,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; ./asm_test/win/i/all.c:2678:         list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	movl	$19, %ecx	 ;,
 ; ./asm_test/win/i/all.c:2678:         list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rax, %r8	 ;, tmp1148
 ; ./asm_test/win/i/all.c:2678:         list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	call	create_expression	 ;
 ; ./asm_test/win/i/all.c:2678:         list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rbp, %rcx	 ; args,
 ; ./asm_test/win/i/all.c:2678:         list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rax, %rdx	 ; tmp1149, _502
 ; ./asm_test/win/i/all.c:2678:         list_append(args, (size_t*)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	call	list_append	 ;
	jmp	.L1523	 ;
.L1572:
 ; ./asm_test/win/i/all.c:2679:     list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	movq	%rsi, %r8	 ; init,
	xorl	%ecx, %ecx	 ;
	movq	%rdx, 32(%rsp)	 ;,
	xorl	%edx, %edx	 ;
	call	create_variable_access	 ;
 ; ./asm_test/win/i/all.c:2679:     list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rbp, 32(%rsp)	 ; args,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
 ; ./asm_test/win/i/all.c:2679:     list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %rdx	 ; tmp1151, _503
 ; ./asm_test/win/i/all.c:2679:     list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
 ; ./asm_test/win/i/all.c:2679:     list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp1152,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; ./asm_test/win/i/all.c:2679:     list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; ./asm_test/win/i/all.c:2679:     list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %r8	 ;, tmp1153
 ; ./asm_test/win/i/all.c:2679:     list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	call	create_expression	 ;
 ; ./asm_test/win/i/all.c:2679:     list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%ecx, %ecx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rcx, 40(%rsp)	 ;,
	xorl	%edx, %edx	 ;
	movl	$5, %ecx	 ;,
	movq	%rax, 32(%rsp)	 ; tmp1154,
	call	create_statement	 ;
 ; ./asm_test/win/i/all.c:2679:     list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%r13, %rcx	 ; body,
 ; ./asm_test/win/i/all.c:2679:     list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %rdx	 ; tmp1155, _507
 ; ./asm_test/win/i/all.c:2679:     list_append(body, (size_t*)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:2680:     create_method_use_ptr(method, constructor, name, parameters, body, method->method_scope);
	movq	32(%rbx), %rax	 ; method_454->method_scope, method_454->method_scope
	movq	%rbx, %rcx	 ; method,
	movq	%r14, %r8	 ; name,
	movq	88(%rsp), %r9	 ; %sfp,
	movq	112(%rsp), %rdx	 ; %sfp,
	movq	%r13, 32(%rsp)	 ; body,
	movq	%rax, 40(%rsp)	 ; method_454->method_scope,
	call	create_method_use_ptr	 ;
 ; ./asm_test/win/i/all.c:2681:     list_append(members, (size_t*)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rbx, %rdx	 ; method,
	xorl	%r8d, %r8d	 ;
	xorl	%ecx, %ecx	 ;
	call	create_class_member	 ;
 ; ./asm_test/win/i/all.c:2681:     list_append(members, (size_t*)create_class_member(CLASS_METHOD, method, NULL));
	movq	80(%rsp), %rcx	 ; %sfp,
 ; ./asm_test/win/i/all.c:2681:     list_append(members, (size_t*)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rdx	 ; tmp1156, _509
 ; ./asm_test/win/i/all.c:2681:     list_append(members, (size_t*)create_class_member(CLASS_METHOD, method, NULL));
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:746:     class->name = name;
	movq	64(%rsp), %rax	 ; %sfp, class
 ; ./asm_test/win/i/all.c:747:     class->members = members;
	movq	80(%rsp), %rbx	 ; %sfp, members
	movq	%rbx, 8(%rax)	 ; members, class_340->members
 ; ./asm_test/win/i/all.c:748:     class->class_scope = class_scope;
	movq	56(%rsp), %rbx	 ; %sfp, class_scope
 ; ./asm_test/win/i/all.c:746:     class->name = name;
	movq	%r14, (%rax)	 ; name, class_340->name
 ; ./asm_test/win/i/all.c:748:     class->class_scope = class_scope;
	movq	%rbx, 16(%rax)	 ; class_scope, class_340->class_scope
 ; ./asm_test/win/i/all.c:749:     class->size = size;
	movq	104(%rsp), %rbx	 ; %sfp, size
	movq	%rbx, 24(%rax)	 ; size, class_340->size
.L1525:
 ; ./asm_test/win/i/all.c:2395:             list_append(members, (size_t*)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	64(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$2, %ecx	 ;,
	jmp	.L1562	 ;
.L1416:
 ; ./asm_test/win/i/all.c:2397:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unexpected token in code member\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	16(%rbx), %rax	 ; token_56->column, tmp1238
	movq	8(%rbx), %r9	 ; token_56->line, token_56->line
	movl	$2, %ecx	 ;,
	leaq	1(%rax), %rsi	 ;, _48
	movq	(%r15), %rax	 ; parser_85(D)->source_file, parser_85(D)->source_file
	incq	%r9	 ; _50
	movq	%r9, 64(%rsp)	 ; _50, %sfp
	movq	24(%rax), %r8	 ; _51->path, _52
	movq	%r8, 56(%rsp)	 ; _52, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:2397:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unexpected token in code member\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rsi, 32(%rsp)	 ; _48,
	movq	64(%rsp), %r9	 ; %sfp, _50
	leaq	.LC249(%rip), %rdx	 ;,
	movq	56(%rsp), %r8	 ; %sfp, _52
 ; ./asm_test/win/i/all.c:2397:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unexpected token in code member\n", parser->source_file->path, token->line + 1, token->column + 1);
	movq	%rax, %rcx	 ; tmp1159, _53
 ; ./asm_test/win/i/all.c:2397:             fprintf(stderr, "[Parser Error] at %s:%zu:%zu: Unexpected token in code member\n", parser->source_file->path, token->line + 1, token->column + 1);
	call	fprintf	 ;
	jmp	.L1432	 ;
.L1526:
 ; ./asm_test/win/i/all.c:686:     Code* code = (Code*)alloc_memory(sizeof(Code));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:687:     code->members = members;
	movq	96(%rsp), %rbx	 ; %sfp, members
	movq	%rbx, (%rax)	 ; members, code_668->members
 ; ./asm_test/win/i/all.c:688:     code->global_scope = global_scope;
	movq	72(%rsp), %rbx	 ; %sfp, global_scope
	movq	%rbx, 8(%rax)	 ; global_scope, code_668->global_scope
 ; ./asm_test/win/i/all.c:2401: }
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
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC250:
	.ascii "NULL\0"
.LC251:
	.ascii "Usage: %s <filename>\12\0"
.LC252:
	.ascii "Error opening file: %s\12\0"
.LC253:
	.ascii ".token\0"
.LC254:
	.ascii "w\0"
.LC255:
	.ascii "Token(Type: EOF,         Line: %zu, Column: %zu)\12\0"
.LC256:
	.ascii "Token(Type: identifier,  Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC257:
	.ascii "Token(Type: integer,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC258:
	.ascii "Token(Type: float,       Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC259:
	.ascii "Token(Type: string,      Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC260:
	.ascii "Token(Type: symbol,      Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC261:
	.ascii "Token(Type: keyword,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC262:
	.ascii "Token(Type: comment,     Line: %zu, Column: %zu)\11Lexeme: '\0"
.LC263:
	.ascii "\\0\0"
.LC264:
	.ascii "\\n\0"
.LC265:
	.ascii "\\t\0"
.LC266:
	.ascii "\\r\0"
.LC267:
	.ascii "'\12\0"
.LC268:
	.ascii "\12info by lib:\12    %s\12\0"
.LC269:
	.ascii ".ast\0"
.LC270:
	.ascii ".tc\0"
.LC271:
	.ascii ".tac\0"
.LC272:
	.ascii "import\12\0"
.LC273:
	.ascii "source: \"%s\"\12\0"
.LC274:
	.ascii "parameters\12\0"
.LC275:
	.ascii "parameters[%d]\12\0"
.LC276:
	.ascii "class\12\0"
.LC277:
	.ascii "members\12\0"
.LC278:
	.ascii "method\12\0"
.LC279:
	.ascii "variable\12\0"
.LC280:
	.ascii "unknown_ClassMemberType: %u\12\0"
.LC281:
	.ascii "unknown_CodeMemberType: %u\12\0"
.LC282:
	.ascii "main\0"
.LC283:
	.ascii "[Warning] Unsupported symbol kind for import: %d\12\0"
.LC284:
	.ascii "TAC {\12\0"
.LC285:
	.ascii "designs: []\12\0"
.LC286:
	.ascii "designs: [\12\0"
.LC287:
	.ascii "NULL \0"
.LC288:
	.ascii "%s \0"
.LC289:
	.ascii "%zu \0"
.LC290:
	.ascii "{}\12\0"
.LC291:
	.ascii "{\12\0"
.LC292:
	.ascii "NULL\11\0"
.LC293:
	.ascii "%s\11\0"
.LC294:
	.ascii "%s(%s) \0"
.LC295:
	.ascii "%zu\12\0"
.LC296:
	.ascii "}\12\0"
.LC297:
	.ascii "]\12\0"
.LC298:
	.ascii "entry_point: \"NULL\"\12\0"
.LC299:
	.ascii "entry_point: %s\12\0"
.LC300:
	.ascii "global: []\12\0"
.LC301:
	.ascii "global: [\12\0"
.LC302:
	.ascii "subroutines: []\12\0"
.LC303:
	.ascii "subroutines: [\12\0"
.LC304:
	.ascii "NULL {\12\0"
.LC305:
	.ascii "%s {\12\0"
.LC306:
	.ascii "return_type: \"NULL\"\12\0"
.LC307:
	.ascii "return_type: %s\12\0"
.LC308:
	.ascii "parameters: []\12\0"
.LC309:
	.ascii "parameters: [\12\0"
.LC310:
	.ascii "local: []\12\0"
.LC311:
	.ascii "local: [\12\0"
.LC312:
	.ascii "instructions: []\12\0"
.LC313:
	.ascii "instructions: [\12\0"
.LC314:
	.ascii "add\11\0"
.LC315:
	.ascii "sub\11\0"
.LC316:
	.ascii "mul\11\0"
.LC317:
	.ascii "div\11\0"
.LC318:
	.ascii "mod\11\0"
.LC319:
	.ascii "eq \11\0"
.LC320:
	.ascii "ne \11\0"
.LC321:
	.ascii "lt \11\0"
.LC322:
	.ascii "gt \11\0"
.LC323:
	.ascii "le \11\0"
.LC324:
	.ascii "ge \11\0"
.LC325:
	.ascii "and\11\0"
.LC326:
	.ascii "or \11\0"
.LC327:
	.ascii "not\11\0"
.LC328:
	.ascii "assign\11\0"
.LC329:
	.ascii "get_attr\11\0"
.LC330:
	.ascii "get_elem\11\0"
.LC331:
	.ascii "param\11\0"
.LC332:
	.ascii "alloc\11\0"
.LC333:
	.ascii "jmp_c\11\0"
.LC334:
	.ascii "jmp\11\0"
.LC335:
	.ascii "ret\11\0"
.LC336:
	.ascii "call\11\0"
.LC337:
	.ascii "load\11\0"
.LC338:
	.ascii "store\11\0"
.LC339:
	.ascii "INST_NONE\12\0"
.LC340:
	.ascii "unknown_InstructionType: %u\12\0"
	.section	.text.startup,"x"
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
main:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movl	%ecx, %esi	 ; tmp687, argc
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp688, argv
	subq	$120, %rsp	 ;,
 ; ./asm_test/win/i/all.c:4056: int main(int argc, char* argv[]) {
	call	__main	 ;
 ; ./asm_test/win/i/all.c:4057:     if (argc < 2) {
	decl	%esi	 ; argc
	jg	.L1574	 ;,
 ; ./asm_test/win/i/all.c:4058:         fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
	movq	(%rbx), %r8	 ; *argv_8(D), _1
	movl	$2, %ecx	 ;,
	movq	%r8, 40(%rsp)	 ; _1, %sfp
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:4058:         fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
	movq	40(%rsp), %r8	 ; %sfp, _1
	leaq	.LC251(%rip), %rdx	 ;, tmp375
 ; ./asm_test/win/i/all.c:4058:         fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
	movq	%rax, %rcx	 ; tmp689, _2
 ; ./asm_test/win/i/all.c:4058:         fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:4059:         return 1;
	movl	$1, %eax	 ;, <retval>
	jmp	.L1573	 ;
.L1574:
 ; ./asm_test/win/i/all.c:4061:     init();
	call	init	 ;
 ; ./asm_test/win/i/all.c:957:     File* file = create_file(name);
	movq	8(%rbx), %rcx	 ; MEM[(char * *)argv_8(D) + 8B], MEM[(char * *)argv_8(D) + 8B]
	call	create_file	 ;
 ; ./asm_test/win/i/all.c:959:     size_t length = 0;
	xorl	%r10d, %r10d	 ;
 ; ./asm_test/win/i/all.c:960:     FILE* source_file = fopen(filename, "r");
	leaq	.LC206(%rip), %rdx	 ;, tmp377
 ; ./asm_test/win/i/all.c:958:     char* filename = file->path;
	movq	24(%rax), %rbp	 ; file_13->path, filename
 ; ./asm_test/win/i/all.c:959:     size_t length = 0;
	movq	%r10, 72(%rsp)	 ;, length
 ; ./asm_test/win/i/all.c:957:     File* file = create_file(name);
	movq	%rax, %rdi	 ; tmp690, file
 ; ./asm_test/win/i/all.c:960:     FILE* source_file = fopen(filename, "r");
	movq	%rbp, %rcx	 ; filename,
	call	fopen	 ;
	movq	%rax, %rbx	 ; tmp691, source_file
 ; ./asm_test/win/i/all.c:961:     if (source_file == NULL) {
	testq	%rax, %rax	 ; source_file
	jne	.L1576	 ;,
 ; ./asm_test/win/i/all.c:962:         fprintf(stderr, "Error opening file: %s\n", filename);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:962:         fprintf(stderr, "Error opening file: %s\n", filename);
	movq	%rbp, %r8	 ; filename,
 ; ./asm_test/win/i/all.c:962:         fprintf(stderr, "Error opening file: %s\n", filename);
	movq	%rax, %rcx	 ; tmp692, _16
	jmp	.L1900	 ;
.L1576:
 ; ./asm_test/win/i/all.c:965:     char* source = read_source(source_file, &length);
	leaq	72(%rsp), %rdx	 ;, tmp380
	movq	%rax, %rcx	 ; source_file,
	call	read_source.constprop.0	 ;
 ; ./asm_test/win/i/all.c:966:     fclose(source_file);
	movq	%rbx, %rcx	 ; source_file,
 ; ./asm_test/win/i/all.c:965:     char* source = read_source(source_file, &length);
	movq	%rax, %rsi	 ; tmp693, source
 ; ./asm_test/win/i/all.c:966:     fclose(source_file);
	call	fclose	 ;
 ; ./asm_test/win/i/all.c:967:     Lexer* lexer = create_lexer(source, length, filename);
	movq	72(%rsp), %rdx	 ; length,
	movq	%rbp, %r8	 ; filename,
	movq	%rsi, %rcx	 ; source,
	call	create_lexer	 ;
 ; ./asm_test/win/i/all.c:969:         change_file_extension(file, create_string_check(".token", 6, 1));
	movl	$1, %r8d	 ;,
	movl	$6, %edx	 ;,
	leaq	.LC253(%rip), %rcx	 ;, tmp382
 ; ./asm_test/win/i/all.c:967:     Lexer* lexer = create_lexer(source, length, filename);
	movq	%rax, %rsi	 ; tmp694, lexer
 ; ./asm_test/win/i/all.c:969:         change_file_extension(file, create_string_check(".token", 6, 1));
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3947:     rebuild_full_path(file);
	movq	%rdi, %rcx	 ; file,
 ; ./asm_test/win/i/all.c:3946:     file->extension = new_extension;
	movq	%rax, 8(%rdi)	 ; tmp695, file_13->extension
 ; ./asm_test/win/i/all.c:3947:     rebuild_full_path(file);
	call	rebuild_full_path	 ;
 ; ./asm_test/win/i/all.c:970:         char* out_token_name = file->path;
	movq	24(%rdi), %rbp	 ; file_13->path, out_token_name
 ; ./asm_test/win/i/all.c:971:         FILE* out_token_file = fopen(out_token_name, "w");
	leaq	.LC254(%rip), %rdx	 ;,
	movq	%rbp, %rcx	 ; out_token_name,
	call	fopen	 ;
	movq	%rax, %rbx	 ; tmp696, out_token_file
 ; ./asm_test/win/i/all.c:972:         if (out_token_file == NULL)
	testq	%rax, %rax	 ; out_token_file
	jne	.L1578	 ;,
 ; ./asm_test/win/i/all.c:973:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:973:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	movq	%rbp, %r8	 ; out_token_name,
	leaq	.LC252(%rip), %rdx	 ;, tmp385
 ; ./asm_test/win/i/all.c:973:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	movq	%rax, %rcx	 ; tmp697, _23
 ; ./asm_test/win/i/all.c:973:             fprintf(stderr, "Error opening file: %s\n", out_token_name);
	call	fprintf	 ;
	jmp	.L1579	 ;
.L1578:
 ; ./asm_test/win/i/all.c:940:     for (Token* current = get_next_token(lexer, 0); current != 0; current = get_next_token(lexer, 0)) {
	xorl	%edx, %edx	 ;
	movq	%rsi, %rcx	 ; lexer,
 ; ./asm_test/win/i/all.c:929:             fputs("\\n", file);
	leaq	.LC264(%rip), %r14	 ;, tmp685
 ; ./asm_test/win/i/all.c:940:     for (Token* current = get_next_token(lexer, 0); current != 0; current = get_next_token(lexer, 0)) {
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp698, current
.L1580:
 ; ./asm_test/win/i/all.c:940:     for (Token* current = get_next_token(lexer, 0); current != 0; current = get_next_token(lexer, 0)) {
	testq	%rbp, %rbp	 ; current
	je	.L1601	 ;,
	cmpl	$7, 24(%rbp)	 ;, current_42->type
	ja	.L1581	 ;,
	movl	24(%rbp), %edx	 ; current_42->type, current_42->type
	leaq	.L1583(%rip), %rax	 ;, tmp387
	movslq	(%rax,%rdx,4), %rcx	 ;, tmp389
	movq	16(%rbp), %rdx	 ; current_42->column, current_42->column
	addq	%rax, %rcx	 ; tmp387, tmp390
	movq	8(%rbp), %rax	 ; current_42->line, current_42->line
 ; ./asm_test/win/i/all.c:923:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	1(%rdx), %r9	 ;,
	leaq	1(%rax), %r8	 ;,
	jmp	*%rcx	 ; tmp390
	.section .rdata,"dr"
	.align 4
.L1583:
	.long	.L1590-.L1583
	.long	.L1589-.L1583
	.long	.L1588-.L1583
	.long	.L1587-.L1583
	.long	.L1586-.L1583
	.long	.L1585-.L1583
	.long	.L1584-.L1583
	.long	.L1582-.L1583
	.section	.text.startup,"x"
.L1590:
 ; ./asm_test/win/i/all.c:908:         fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
	leaq	.LC255(%rip), %rdx	 ;, tmp396
	movq	%rbx, %rcx	 ; out_token_file,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:909:         return;
	jmp	.L1591	 ;
.L1589:
 ; ./asm_test/win/i/all.c:911:         fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC256(%rip), %rdx	 ;, tmp401
	jmp	.L1886	 ;
.L1588:
 ; ./asm_test/win/i/all.c:913:         fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC257(%rip), %rdx	 ;, tmp406
	jmp	.L1886	 ;
.L1587:
 ; ./asm_test/win/i/all.c:915:         fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC258(%rip), %rdx	 ;, tmp411
	jmp	.L1886	 ;
.L1586:
 ; ./asm_test/win/i/all.c:917:         fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC259(%rip), %rdx	 ;, tmp416
	jmp	.L1886	 ;
.L1585:
 ; ./asm_test/win/i/all.c:919:         fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC260(%rip), %rdx	 ;, tmp421
	jmp	.L1886	 ;
.L1584:
 ; ./asm_test/win/i/all.c:921:         fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC261(%rip), %rdx	 ;, tmp426
	jmp	.L1886	 ;
.L1582:
 ; ./asm_test/win/i/all.c:923:         fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
	leaq	.LC262(%rip), %rdx	 ;, tmp431
.L1886:
	movq	%rbx, %rcx	 ; out_token_file,
	call	fprintf	 ;
.L1581:
 ; ./asm_test/win/i/all.c:4056: int main(int argc, char* argv[]) {
	xorl	%r12d, %r12d	 ; i
 ; ./asm_test/win/i/all.c:927:             fputs("\\0", file);
	leaq	.LC263(%rip), %r15	 ;, tmp683
.L1592:
 ; ./asm_test/win/i/all.c:924:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	0(%rbp), %r13	 ; current_42->lexeme, _79
 ; ./asm_test/win/i/all.c:924:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	movq	%r13, %rcx	 ; _79,
	call	strlen	 ;
 ; ./asm_test/win/i/all.c:924:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	cmpq	%rax, %r12	 ; tmp699, i
	jnb	.L1901	 ;,
 ; ./asm_test/win/i/all.c:925:         char c = token->lexeme[i];
	movsbl	0(%r13,%r12), %ecx	 ; *_81,
 ; ./asm_test/win/i/all.c:927:             fputs("\\0", file);
	movq	%rbx, %rdx	 ; out_token_file,
 ; ./asm_test/win/i/all.c:926:         if (c == '\0')
	testb	%cl, %cl	 ; c
	jne	.L1593	 ;,
 ; ./asm_test/win/i/all.c:927:             fputs("\\0", file);
	movq	%r15, %rcx	 ; tmp683,
	jmp	.L1887	 ;
.L1593:
 ; ./asm_test/win/i/all.c:928:         else if (c == '\n')
	cmpb	$10, %cl	 ;, c
	jne	.L1595	 ;,
 ; ./asm_test/win/i/all.c:929:             fputs("\\n", file);
	movq	%r14, %rcx	 ; tmp685,
.L1887:
	call	fputs	 ;
	jmp	.L1594	 ;
.L1595:
 ; ./asm_test/win/i/all.c:930:         else if (c == '\t')
	cmpb	$9, %cl	 ;, c
	jne	.L1596	 ;,
 ; ./asm_test/win/i/all.c:931:             fputs("\\t", file);
	leaq	.LC265(%rip), %rcx	 ;, tmp434
	jmp	.L1887	 ;
.L1596:
 ; ./asm_test/win/i/all.c:932:         else if (c == '\r')
	cmpb	$13, %cl	 ;, c
	jne	.L1597	 ;,
 ; ./asm_test/win/i/all.c:933:             fputs("\\r", file);
	leaq	.LC266(%rip), %rcx	 ;,
	jmp	.L1887	 ;
.L1597:
 ; ./asm_test/win/i/all.c:935:             fputc(c, file);
	call	fputc	 ;
.L1594:
 ; ./asm_test/win/i/all.c:924:     for (size_t i = 0; i < strlen(token->lexeme); ++i) {
	incq	%r12	 ; i
	jmp	.L1592	 ;
.L1901:
 ; ./asm_test/win/i/all.c:937:     fprintf(file, "'\n");
	movq	%rbx, %rdx	 ; out_token_file,
	leaq	.LC267(%rip), %rcx	 ;, tmp440
	call	fputs	 ;
.L1591:
 ; ./asm_test/win/i/all.c:942:         if (current->type == EOF_TOKEN)
	cmpl	$0, 24(%rbp)	 ;, current_42->type
	jne	.L1599	 ;,
.L1601:
 ; ./asm_test/win/i/all.c:945:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
 ; ./asm_test/win/i/all.c:945:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rbx, %rcx	 ; out_token_file,
	leaq	.LC268(%rip), %rdx	 ;, tmp441
 ; ./asm_test/win/i/all.c:945:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %r8	 ;, tmp700
 ; ./asm_test/win/i/all.c:945:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:976:             fclose(out_token_file);
	movq	%rbx, %rcx	 ; out_token_file,
	call	fclose	 ;
	jmp	.L1579	 ;
.L1599:
 ; ./asm_test/win/i/all.c:940:     for (Token* current = get_next_token(lexer, 0); current != 0; current = get_next_token(lexer, 0)) {
	xorl	%edx, %edx	 ;
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp701, current
	jmp	.L1580	 ;
.L1579:
 ; ./asm_test/win/i/all.c:1512:     lexer->peeked_token = NULL;
	xorl	%r9d, %r9d	 ;
 ; ./asm_test/win/i/all.c:1153:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$16, %ecx	 ;,
 ; ./asm_test/win/i/all.c:1512:     lexer->peeked_token = NULL;
	movq	%r9, 16(%rsi)	 ;, lexer_19->position
	movq	%r9, 32(%rsi)	 ;, lexer_19->line
	movq	%r9, 40(%rsi)	 ;, lexer_19->column
 ; ./asm_test/win/i/all.c:1516:     lexer->current_token = NULL;
	movq	%r9, 48(%rsi)	 ;, lexer_19->peeked_token
	movq	%r9, 56(%rsi)	 ;, lexer_19->peeked_position
	movq	%r9, 64(%rsi)	 ;, lexer_19->peeked_line
	movq	%r9, 72(%rsi)	 ;, lexer_19->peeked_column
	movq	%r9, 80(%rsi)	 ;, lexer_19->current_token
 ; ./asm_test/win/i/all.c:1153:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:983:         ast = parse_code(lexer, builtin_scope, parser);
	movq	builtin_scope(%rip), %rdx	 ; builtin_scope,
	movq	%rsi, %rcx	 ; lexer,
 ; ./asm_test/win/i/all.c:1154:     new_parser->in_function = 0;
	movw	$0, 8(%rax)	 ;, MEM <unsigned short> [(char *)new_parser_87 + 8B]
 ; ./asm_test/win/i/all.c:1153:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movq	%rax, %r8	 ; tmp702, new_parser
 ; ./asm_test/win/i/all.c:1156:     new_parser->in_loop = 0;
	movb	$0, 11(%rax)	 ;, new_parser_87->in_loop
 ; ./asm_test/win/i/all.c:1157:     new_parser->source_file = file;
	movq	%rdi, (%rax)	 ; file, new_parser_87->source_file
 ; ./asm_test/win/i/all.c:983:         ast = parse_code(lexer, builtin_scope, parser);
	call	parse_code	 ;
 ; ./asm_test/win/i/all.c:985:         change_file_extension(file, create_string_check(".ast", 4, 1));
	movl	$1, %r8d	 ;,
	movl	$4, %edx	 ;,
	leaq	.LC269(%rip), %rcx	 ;, tmp443
 ; ./asm_test/win/i/all.c:983:         ast = parse_code(lexer, builtin_scope, parser);
	movq	%rax, %rbp	 ; tmp703, ast
 ; ./asm_test/win/i/all.c:985:         change_file_extension(file, create_string_check(".ast", 4, 1));
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3947:     rebuild_full_path(file);
	movq	%rdi, %rcx	 ; file,
 ; ./asm_test/win/i/all.c:3946:     file->extension = new_extension;
	movq	%rax, 8(%rdi)	 ; tmp704, file_13->extension
 ; ./asm_test/win/i/all.c:3947:     rebuild_full_path(file);
	call	rebuild_full_path	 ;
 ; ./asm_test/win/i/all.c:987:         change_file_extension(file, create_string_check(".tc", 3, 1));
	movl	$1, %r8d	 ;,
	movl	$3, %edx	 ;,
	leaq	.LC270(%rip), %rcx	 ;, tmp444
 ; ./asm_test/win/i/all.c:986:         char* out_ast_name = file->path;
	movq	24(%rdi), %rsi	 ; file_13->path, out_ast_name
 ; ./asm_test/win/i/all.c:987:         change_file_extension(file, create_string_check(".tc", 3, 1));
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3947:     rebuild_full_path(file);
	movq	%rdi, %rcx	 ; file,
 ; ./asm_test/win/i/all.c:3946:     file->extension = new_extension;
	movq	%rax, 8(%rdi)	 ; tmp705, file_13->extension
 ; ./asm_test/win/i/all.c:3947:     rebuild_full_path(file);
	call	rebuild_full_path	 ;
 ; ./asm_test/win/i/all.c:988:         FILE* out_ast_file = fopen(out_ast_name, "w");
	leaq	.LC254(%rip), %rdx	 ;,
	movq	%rsi, %rcx	 ; out_ast_name,
	call	fopen	 ;
	movq	%rax, %rbx	 ; tmp706, out_ast_file
 ; ./asm_test/win/i/all.c:989:         if (out_ast_file == NULL)
	testq	%rax, %rax	 ; out_ast_file
	jne	.L1882	 ;,
 ; ./asm_test/win/i/all.c:990:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:990:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	movq	%rsi, %r8	 ; out_ast_name,
	leaq	.LC252(%rip), %rdx	 ;, tmp450
 ; ./asm_test/win/i/all.c:990:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	movq	%rax, %rcx	 ; tmp710, _32
 ; ./asm_test/win/i/all.c:990:             fprintf(stderr, "Error opening file: %s\n", out_ast_name);
	call	fprintf	 ;
.L1606:
 ; ./asm_test/win/i/all.c:997:         change_file_extension(file, create_string_check(".tac", 4, 1));
	movl	$1, %r8d	 ;,
	movl	$4, %edx	 ;,
	leaq	.LC271(%rip), %rcx	 ;, tmp446
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3947:     rebuild_full_path(file);
	movq	%rdi, %rcx	 ; file,
 ; ./asm_test/win/i/all.c:3946:     file->extension = new_extension;
	movq	%rax, 8(%rdi)	 ; tmp707, file_13->extension
 ; ./asm_test/win/i/all.c:3947:     rebuild_full_path(file);
	call	rebuild_full_path	 ;
 ; ./asm_test/win/i/all.c:999:         change_file_extension(file, create_string_check(".tc", 3, 1));
	movl	$1, %r8d	 ;,
	movl	$3, %edx	 ;,
	leaq	.LC270(%rip), %rcx	 ;, tmp447
 ; ./asm_test/win/i/all.c:998:         char* out_tac_name = file->path;
	movq	24(%rdi), %rsi	 ; file_13->path, out_tac_name
 ; ./asm_test/win/i/all.c:999:         change_file_extension(file, create_string_check(".tc", 3, 1));
	call	create_string_check	 ;
 ; ./asm_test/win/i/all.c:3947:     rebuild_full_path(file);
	movq	%rdi, %rcx	 ; file,
 ; ./asm_test/win/i/all.c:3946:     file->extension = new_extension;
	movq	%rax, 8(%rdi)	 ; tmp708, file_13->extension
 ; ./asm_test/win/i/all.c:3947:     rebuild_full_path(file);
	call	rebuild_full_path	 ;
 ; ./asm_test/win/i/all.c:1000:         FILE* out_tac_file = fopen(out_tac_name, "w");
	leaq	.LC254(%rip), %rdx	 ;,
	movq	%rsi, %rcx	 ; out_tac_name,
	call	fopen	 ;
	movq	%rax, %rbx	 ; tmp709, out_tac_file
 ; ./asm_test/win/i/all.c:1001:         if (out_tac_file == NULL)
	testq	%rax, %rax	 ; out_tac_file
	jne	.L1883	 ;,
 ; ./asm_test/win/i/all.c:1002:             fprintf(stderr, "Error opening file: %s\n", out_tac_name);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:1002:             fprintf(stderr, "Error opening file: %s\n", out_tac_name);
	movq	%rsi, %r8	 ; out_tac_name,
 ; ./asm_test/win/i/all.c:1002:             fprintf(stderr, "Error opening file: %s\n", out_tac_name);
	movq	%rax, %rcx	 ; tmp724, _37
	jmp	.L1900	 ;
.L1882:
 ; ./asm_test/win/i/all.c:1542:     List* members = list_copy(code->members);
	movq	0(%rbp), %rcx	 ; MEM[(struct List * *)ast_27],
	call	list_copy	 ;
	movq	%rax, 48(%rsp)	 ; tmp711, %sfp
.L1607:
 ; ./asm_test/win/i/all.c:1544:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	movq	48(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %r12	 ; tmp722, member
 ; ./asm_test/win/i/all.c:1544:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	 ; member
	je	.L1902	 ;,
 ; ./asm_test/win/i/all.c:1519:     switch (code_member->type) {
	movl	8(%r12), %eax	 ; member_92->type, _93
	leaq	80(%rsp), %rsi	 ;, tmp645
	movq	%rsi, 40(%rsp)	 ; tmp645, %sfp
 ; ./asm_test/win/i/all.c:1519:     switch (code_member->type) {
	cmpl	$1, %eax	 ;, _93
	je	.L1608	 ;,
	cmpl	$2, %eax	 ;, _93
	je	.L1609	 ;,
	testl	%eax, %eax	 ; _93
	jne	.L1610	 ;,
 ; ./asm_test/win/i/all.c:1521:             indention(outfile, indent, 0, indent_has_next);
	movq	%rsi, %r9	 ; tmp645,
	xorl	%r8d, %r8d	 ;
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1522:             fprintf(outfile, "import\n");
	movq	%rbx, %rdx	 ; out_ast_file,
	leaq	.LC272(%rip), %rcx	 ;, tmp452
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1548:     indention(outfile, indent, 0, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; out_ast_file,
 ; ./asm_test/win/i/all.c:1523:             output_import(code_member->content.import, outfile, indent + 1, indent_has_next);
	movq	(%r12), %r12	 ; member_92->content.import, _95
 ; ./asm_test/win/i/all.c:1548:     indention(outfile, indent, 0, indent_has_next);
	movl	$2, %edx	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1549:     fprintf(outfile, "name\n");
	movq	%rbx, %rdx	 ; out_ast_file,
	leaq	.LC47(%rip), %rcx	 ;, tmp454
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1550:     output_name(import->name, outfile, indent + 1, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
	movq	(%r12), %rcx	 ; _95->name,
	movq	%rbx, %rdx	 ; out_ast_file,
	movl	$3, %r8d	 ;,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1551:     indention(outfile, indent, 1, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
	movl	$2, %edx	 ;,
	movq	%rbx, %rcx	 ; out_ast_file,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1552:     fprintf(outfile, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	8(%r12), %r8	 ; _95->source, _103
 ; ./asm_test/win/i/all.c:1552:     fprintf(outfile, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	testq	%r8, %r8	 ; _103
	jne	.L1611	 ;,
 ; ./asm_test/win/i/all.c:1552:     fprintf(outfile, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	leaq	.LC250(%rip), %r8	 ;, _103
.L1611:
 ; ./asm_test/win/i/all.c:1552:     fprintf(outfile, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	leaq	.LC273(%rip), %rdx	 ;, tmp457
	movq	%rbx, %rcx	 ; out_ast_file,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1553: }
	jmp	.L1607	 ;
.L1608:
 ; ./asm_test/win/i/all.c:1526:             indention(outfile, indent, 0, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; out_ast_file,
 ; ./asm_test/win/i/all.c:1566:     int index = -1;
	orl	$-1, %r14d	 ;, index
 ; ./asm_test/win/i/all.c:1526:             indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1527:             fprintf(outfile, "function\n");
	movq	%rbx, %rdx	 ; out_ast_file,
	leaq	.LC49(%rip), %rcx	 ;, tmp459
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1555:     indention(outfile, indent, 0, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; out_ast_file,
 ; ./asm_test/win/i/all.c:1528:             output_function(code_member->content.function, outfile, indent + 1, indent_has_next);
	movq	(%r12), %r12	 ; member_92->content.function, _97
 ; ./asm_test/win/i/all.c:1555:     indention(outfile, indent, 0, indent_has_next);
	movl	$2, %edx	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1556:     fprintf(outfile, "name\n");
	movq	%rbx, %rdx	 ; out_ast_file,
	leaq	.LC47(%rip), %rcx	 ;, tmp461
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1557:     output_name(function->name, outfile, indent + 1, indent_has_next);
	movq	(%r12), %rcx	 ; _97->name,
	movq	40(%rsp), %r9	 ; %sfp,
	movq	%rbx, %rdx	 ; out_ast_file,
	movl	$3, %r8d	 ;,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1558:     indention(outfile, indent, 0, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; out_ast_file,
	movl	$2, %edx	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1559:     fprintf(outfile, "return_type\n");
	movq	%rbx, %rdx	 ; out_ast_file,
	leaq	.LC12(%rip), %rcx	 ;, tmp464
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1560:     output_name(function->return_type, outfile, indent + 1, indent_has_next);
	movq	8(%r12), %rcx	 ; _97->return_type, _97->return_type
	movq	40(%rsp), %r9	 ; %sfp,
	movq	%rbx, %rdx	 ; out_ast_file,
	movl	$3, %r8d	 ;,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1561:     indention(outfile, indent, 0, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; out_ast_file,
	movl	$2, %edx	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1562:     fprintf(outfile, "parameters\n");
	movq	%rbx, %rdx	 ; out_ast_file,
	leaq	.LC274(%rip), %rcx	 ;, tmp468
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1563:     List* parameters = list_copy(function->parameters);
	movq	16(%r12), %rcx	 ; _97->parameters, _97->parameters
	call	list_copy	 ;
 ; ./asm_test/win/i/all.c:1564:     List* body = list_copy(function->body);
	movq	24(%r12), %rcx	 ; _97->body, _97->body
 ; ./asm_test/win/i/all.c:1563:     List* parameters = list_copy(function->parameters);
	movq	%rax, %r13	 ; tmp712, parameters
 ; ./asm_test/win/i/all.c:1564:     List* body = list_copy(function->body);
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp713, body
.L1613:
 ; ./asm_test/win/i/all.c:1567:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%r13, %rcx	 ; parameters,
	call	list_pop	 ;
 ; ./asm_test/win/i/all.c:1568:         indention(outfile, indent + 1, 0, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
 ; ./asm_test/win/i/all.c:1567:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%rax, %r15	 ; tmp714, parameter
 ; ./asm_test/win/i/all.c:1567:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	 ; parameter
	je	.L1903	 ;,
 ; ./asm_test/win/i/all.c:1568:         indention(outfile, indent + 1, 0, indent_has_next);
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; out_ast_file,
	movl	$3, %edx	 ;,
 ; ./asm_test/win/i/all.c:1569:         fprintf(outfile, "parameters[%d]\n", ++index);
	incl	%r14d	 ; index
 ; ./asm_test/win/i/all.c:1568:         indention(outfile, indent + 1, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1569:         fprintf(outfile, "parameters[%d]\n", ++index);
	movl	%r14d, %r8d	 ; index,
	movq	%rbx, %rcx	 ; out_ast_file,
	leaq	.LC275(%rip), %rdx	 ;,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1570:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
	movq	%rbx, %rdx	 ; out_ast_file,
	movq	%r15, %rcx	 ; parameter,
	movl	$4, %r8d	 ;,
	call	output_variable	 ;
	jmp	.L1613	 ;
.L1903:
 ; ./asm_test/win/i/all.c:1572:     indention(outfile, indent, 1, indent_has_next);
	movl	$2, %edx	 ;,
	movq	%rbx, %rcx	 ; out_ast_file,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1573:     fprintf(outfile, "body\n");
	movq	%rbx, %rdx	 ; out_ast_file,
	leaq	.LC81(%rip), %rcx	 ;, tmp475
	call	fputs	 ;
.L1615:
 ; ./asm_test/win/i/all.c:1575:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r12, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp715, statement
 ; ./asm_test/win/i/all.c:1575:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L1607	 ;,
 ; ./asm_test/win/i/all.c:1576:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
	movl	$3, %r8d	 ;,
	movq	%rbx, %rdx	 ; out_ast_file,
	call	output_statement	 ;
	jmp	.L1615	 ;
.L1609:
 ; ./asm_test/win/i/all.c:1531:             indention(outfile, indent, 0, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; out_ast_file,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1532:             fprintf(outfile, "class\n");
	movq	%rbx, %rdx	 ; out_ast_file,
	leaq	.LC276(%rip), %rcx	 ;, tmp478
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1621:     indention(outfile, indent, 0, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; out_ast_file,
 ; ./asm_test/win/i/all.c:1533:             output_class(code_member->content.class, outfile, indent + 1, indent_has_next);
	movq	(%r12), %r12	 ; member_92->content.class, _99
 ; ./asm_test/win/i/all.c:1621:     indention(outfile, indent, 0, indent_has_next);
	movl	$2, %edx	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1622:     fprintf(outfile, "name\n");
	movq	%rbx, %rdx	 ; out_ast_file,
	leaq	.LC47(%rip), %rcx	 ;,
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1623:     output_name(class->name, outfile, indent + 1, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
	movq	(%r12), %rcx	 ; _99->name,
	movq	%rbx, %rdx	 ; out_ast_file,
	movl	$3, %r8d	 ;,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1624:     indention(outfile, indent, 1, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
	movl	$2, %edx	 ;,
	movq	%rbx, %rcx	 ; out_ast_file,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1625:     fprintf(outfile, "members\n");
	movq	%rbx, %rdx	 ; out_ast_file,
	leaq	.LC277(%rip), %rcx	 ;, tmp483
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1626:     List* members = list_copy(class->members);
	movq	8(%r12), %rcx	 ; _99->members, _99->members
	call	list_copy	 ;
	movq	%rax, 56(%rsp)	 ; tmp716, %sfp
.L1617:
 ; ./asm_test/win/i/all.c:1628:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	movq	56(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %r12	 ; tmp721, member
 ; ./asm_test/win/i/all.c:1628:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	 ; member
	je	.L1607	 ;,
 ; ./asm_test/win/i/all.c:1603:     switch (class_member->type) {
	movl	8(%r12), %eax	 ; member_121->type, _122
 ; ./asm_test/win/i/all.c:1603:     switch (class_member->type) {
	testl	%eax, %eax	 ; _122
	je	.L1618	 ;,
	decl	%eax	 ; _122
	jne	.L1904	 ;,
 ; ./asm_test/win/i/all.c:1610:             indention(outfile, indent, 0, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; out_ast_file,
	movl	$3, %edx	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1611:             fprintf(outfile, "variable\n");
	movq	%rbx, %rdx	 ; out_ast_file,
	leaq	.LC279(%rip), %rcx	 ;, tmp505
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1612:             output_variable(class_member->content.variable, outfile, indent + 1, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
	movq	(%r12), %rcx	 ; member_121->content.variable,
	movq	%rbx, %rdx	 ; out_ast_file,
	movl	$4, %r8d	 ;,
	call	output_variable	 ;
 ; ./asm_test/win/i/all.c:1613:             break;
	jmp	.L1617	 ;
.L1618:
 ; ./asm_test/win/i/all.c:1605:             indention(outfile, indent, 0, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movl	$3, %edx	 ;,
	movq	%rbx, %rcx	 ; out_ast_file,
 ; ./asm_test/win/i/all.c:1590:     int index = -1;
	orl	$-1, %r15d	 ;, index
 ; ./asm_test/win/i/all.c:1605:             indention(outfile, indent, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1606:             fprintf(outfile, "method\n");
	movq	%rbx, %rdx	 ; out_ast_file,
	leaq	.LC278(%rip), %rcx	 ;,
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1579:     indention(outfile, indent, 0, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; out_ast_file,
 ; ./asm_test/win/i/all.c:1607:             output_method(class_member->content.method, outfile, indent + 1, indent_has_next);
	movq	(%r12), %r12	 ; member_121->content.method, _124
 ; ./asm_test/win/i/all.c:1579:     indention(outfile, indent, 0, indent_has_next);
	movl	$4, %edx	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1580:     fprintf(outfile, "name\n");
	movq	%rbx, %rdx	 ; out_ast_file,
	leaq	.LC47(%rip), %rcx	 ;,
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1581:     output_name(method->name, outfile, indent + 1, indent_has_next);
	movq	(%r12), %rcx	 ; _124->name,
	movq	40(%rsp), %r9	 ; %sfp,
	movq	%rbx, %rdx	 ; out_ast_file,
	movl	$5, %r8d	 ;,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1582:     indention(outfile, indent, 0, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; out_ast_file,
	movl	$4, %edx	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1583:     fprintf(outfile, "return_type\n");
	movq	%rbx, %rdx	 ; out_ast_file,
	leaq	.LC12(%rip), %rcx	 ;, tmp491
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1584:     output_name(method->return_type, outfile, indent + 1, indent_has_next);
	movq	8(%r12), %rcx	 ; _124->return_type, _124->return_type
	movq	40(%rsp), %r9	 ; %sfp,
	movq	%rbx, %rdx	 ; out_ast_file,
	movl	$5, %r8d	 ;,
	call	output_name	 ;
 ; ./asm_test/win/i/all.c:1585:     indention(outfile, indent, 0, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; out_ast_file,
	movl	$4, %edx	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1586:     fprintf(outfile, "parameters\n");
	movq	%rbx, %rdx	 ; out_ast_file,
	leaq	.LC274(%rip), %rcx	 ;, tmp495
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1587:     List* parameters = list_copy(method->parameters);
	movq	16(%r12), %rcx	 ; _124->parameters, _124->parameters
	call	list_copy	 ;
 ; ./asm_test/win/i/all.c:1588:     List* body = list_copy(method->body);
	movq	24(%r12), %rcx	 ; _124->body, _124->body
	leaq	80(%rsp), %r12	 ;, tmp649
 ; ./asm_test/win/i/all.c:1587:     List* parameters = list_copy(method->parameters);
	movq	%rax, %r14	 ; tmp717, parameters
 ; ./asm_test/win/i/all.c:1588:     List* body = list_copy(method->body);
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp718, body
.L1621:
 ; ./asm_test/win/i/all.c:1591:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%r14, %rcx	 ; parameters,
 ; ./asm_test/win/i/all.c:1592:         indention(outfile, indent + 1, 0, indent_has_next);
	movq	%r12, %r9	 ; tmp649,
 ; ./asm_test/win/i/all.c:1591:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	call	list_pop	 ;
	movq	%rax, %rsi	 ; tmp719, parameter
 ; ./asm_test/win/i/all.c:1591:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	 ; parameter
	je	.L1905	 ;,
 ; ./asm_test/win/i/all.c:1592:         indention(outfile, indent + 1, 0, indent_has_next);
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; out_ast_file,
	movl	$5, %edx	 ;,
 ; ./asm_test/win/i/all.c:1593:         fprintf(outfile, "parameters[%d]\n", ++index);
	incl	%r15d	 ; index
 ; ./asm_test/win/i/all.c:1592:         indention(outfile, indent + 1, 0, indent_has_next);
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1593:         fprintf(outfile, "parameters[%d]\n", ++index);
	movl	%r15d, %r8d	 ; index,
	movq	%rbx, %rcx	 ; out_ast_file,
	leaq	.LC275(%rip), %rdx	 ;,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1594:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	movq	%r12, %r9	 ; tmp649,
	movq	%rbx, %rdx	 ; out_ast_file,
	movq	%rsi, %rcx	 ; parameter,
	movl	$6, %r8d	 ;,
	call	output_variable	 ;
	jmp	.L1621	 ;
.L1905:
 ; ./asm_test/win/i/all.c:1596:     indention(outfile, indent, 1, indent_has_next);
	movl	$4, %edx	 ;,
	movq	%rbx, %rcx	 ; out_ast_file,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1597:     fprintf(outfile, "body\n");
	movq	%rbx, %rdx	 ; out_ast_file,
	leaq	.LC81(%rip), %rcx	 ;, tmp502
	call	fputs	 ;
.L1623:
 ; ./asm_test/win/i/all.c:1599:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r13, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp720, statement
 ; ./asm_test/win/i/all.c:1599:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L1617	 ;,
 ; ./asm_test/win/i/all.c:1600:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	%r12, %r9	 ; tmp649,
	movl	$5, %r8d	 ;,
	movq	%rbx, %rdx	 ; out_ast_file,
	call	output_statement	 ;
	jmp	.L1623	 ;
.L1904:
 ; ./asm_test/win/i/all.c:1615:             indention(outfile, indent, 0, indent_has_next);
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; out_ast_file,
	leaq	80(%rsp), %r9	 ;,
	movl	$3, %edx	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1616:             fprintf(outfile, "unknown_ClassMemberType: %u\n", class_member->type);
	movl	8(%r12), %r8d	 ; member_121->type,
	leaq	.LC280(%rip), %rdx	 ;, tmp509
	movq	%rbx, %rcx	 ; out_ast_file,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1617:             break;
	jmp	.L1617	 ;
.L1610:
 ; ./asm_test/win/i/all.c:1536:             indention(outfile, indent, 0, indent_has_next);
	movq	40(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rbx, %rcx	 ; out_ast_file,
	movl	$1, %edx	 ;,
	call	indention	 ;
 ; ./asm_test/win/i/all.c:1537:             fprintf(outfile, "unknown_CodeMemberType: %u\n", code_member->type);
	movl	8(%r12), %r8d	 ; member_92->type,
	leaq	.LC281(%rip), %rdx	 ;, tmp512
	movq	%rbx, %rcx	 ; out_ast_file,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1538:             break;
	jmp	.L1607	 ;
.L1902:
 ; ./asm_test/win/i/all.c:950:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
 ; ./asm_test/win/i/all.c:950:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rbx, %rcx	 ; out_ast_file,
	leaq	.LC268(%rip), %rdx	 ;, tmp513
 ; ./asm_test/win/i/all.c:950:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %r8	 ;, tmp723
 ; ./asm_test/win/i/all.c:950:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:993:             fclose(out_ast_file);
	movq	%rbx, %rcx	 ; out_ast_file,
	call	fclose	 ;
	jmp	.L1606	 ;
.L1900:
 ; ./asm_test/win/i/all.c:1002:             fprintf(stderr, "Error opening file: %s\n", out_tac_name);
	leaq	.LC252(%rip), %rdx	 ;, tmp515
	call	fprintf	 ;
	jmp	.L1577	 ;
.L1883:
 ; ./asm_test/win/i/all.c:3190:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3395:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC282(%rip), %r15	 ;, tmp672
 ; ./asm_test/win/i/all.c:3190:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	call	alloc_memory	 ;
	movq	%rax, %rdi	 ; tmp725, tac
 ; ./asm_test/win/i/all.c:3191:     tac->attribute_tables = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:3192:     tac->entry_point = NULL;
	xorl	%edx, %edx	 ;
	movq	%rdx, 8(%rdi)	 ;, tac_158->entry_point
 ; ./asm_test/win/i/all.c:3191:     tac->attribute_tables = create_list();
	movq	%rax, (%rdi)	 ; tmp726, tac_158->attribute_tables
 ; ./asm_test/win/i/all.c:3193:     tac->global_vars = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:3193:     tac->global_vars = create_list();
	movq	%rax, 16(%rdi)	 ; tmp727, tac_158->global_vars
 ; ./asm_test/win/i/all.c:3194:     tac->subroutines = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:3198:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movl	$96, %ecx	 ;,
 ; ./asm_test/win/i/all.c:3194:     tac->subroutines = create_list();
	movq	%rax, 24(%rdi)	 ; tmp728, tac_158->subroutines
 ; ./asm_test/win/i/all.c:3198:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	call	alloc_memory	 ;
 ; ./asm_test/win/i/all.c:3201:     status->current_block = NULL;
	xorl	%ecx, %ecx	 ;
	movq	%rcx, 8(%rax)	 ;, status_155->current_subroutine
 ; ./asm_test/win/i/all.c:3198:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movq	%rax, %rsi	 ; tmp729, status
 ; ./asm_test/win/i/all.c:3201:     status->current_block = NULL;
	movq	%rcx, 16(%rax)	 ;, status_155->current_block
 ; ./asm_test/win/i/all.c:3199:     status->tac = tac;
	movq	%rdi, (%rax)	 ; tac, status_155->tac
 ; ./asm_test/win/i/all.c:3202:     status->end_labels = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:3202:     status->end_labels = create_list();
	movq	%rax, 32(%rsi)	 ; tmp730, status_155->end_labels
 ; ./asm_test/win/i/all.c:3203:     status->start_labels = create_list();
	call	create_list	 ;
 ; ./asm_test/win/i/all.c:3207:     status->temp_count = 0;
	xorl	%r8d, %r8d	 ;
 ; ./asm_test/win/i/all.c:3390:     List* members = list_copy(code->members);
	movq	0(%rbp), %rcx	 ; ast_27->members,
 ; ./asm_test/win/i/all.c:3203:     status->start_labels = create_list();
	movq	%rax, 40(%rsi)	 ; tmp731, status_155->start_labels
 ; ./asm_test/win/i/all.c:3207:     status->temp_count = 0;
	movq	%r8, 48(%rsi)	 ;, status_155->attr_count
	movq	%r8, 56(%rsi)	 ;, status_155->param_count
	movq	%r8, 64(%rsi)	 ;, status_155->var_count
 ; ./asm_test/win/i/all.c:3209:     status->subroutine_count = 0;
	movq	%r8, 72(%rsi)	 ;, status_155->temp_count
	movq	%r8, 80(%rsi)	 ;, status_155->block_count
	movq	%r8, 88(%rsi)	 ;, status_155->subroutine_count
 ; ./asm_test/win/i/all.c:3390:     List* members = list_copy(code->members);
	call	list_copy	 ;
	movq	%rax, 40(%rsp)	 ; tmp732, %sfp
.L1630:
 ; ./asm_test/win/i/all.c:3392:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	40(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rbp	 ; tmp745, code_member
 ; ./asm_test/win/i/all.c:3392:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; code_member
	je	.L1906	 ;,
 ; ./asm_test/win/i/all.c:3393:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rbp), %eax	 ; code_member_145->type, _146
 ; ./asm_test/win/i/all.c:3393:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	 ;, _146
	jne	.L1631	 ;,
 ; ./asm_test/win/i/all.c:3394:             tac_function(code_member->content.function, status);
	movq	0(%rbp), %r13	 ; code_member_145->content.function, _147
 ; ./asm_test/win/i/all.c:3415:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	8(%r13), %rdx	 ; _147->return_type, _147->return_type
	movq	0(%r13), %rcx	 ; _147->name,
	call	create_subroutine	 ;
 ; ./asm_test/win/i/all.c:3416:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rsi)	 ; subroutine, status_155->current_subroutine
 ; ./asm_test/win/i/all.c:3415:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	%rax, %r12	 ; tmp733, subroutine
 ; ./asm_test/win/i/all.c:3417:     list_append(status->tac->subroutines, (size_t*)subroutine);
	movq	(%rsi), %rax	 ; status_155->tac, status_155->tac
	movq	%r12, %rdx	 ; subroutine,
	movq	24(%rax), %rcx	 ; _165->subroutines, _165->subroutines
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3418:     List* parameters = list_copy(function->parameters);
	movq	16(%r13), %rcx	 ; _147->parameters, _147->parameters
	call	list_copy	 ;
	movq	%rax, %r14	 ; tmp734, parameters
.L1632:
 ; ./asm_test/win/i/all.c:3420:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r14, %rcx	 ; parameters,
	call	list_pop	 ;
 ; ./asm_test/win/i/all.c:3420:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	je	.L1907	 ;,
 ; ./asm_test/win/i/all.c:3421:         list_append(subroutine->parameters, (size_t*)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %rcx	 ; parameter_169->name, parameter_169->name
	movq	(%rax), %rdx	 ; parameter_169->type,
	movq	%rsi, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3421:         list_append(subroutine->parameters, (size_t*)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%r12), %rcx	 ; subroutine_164->parameters, subroutine_164->parameters
 ; ./asm_test/win/i/all.c:3421:         list_append(subroutine->parameters, (size_t*)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rdx	 ; tmp735, _172
 ; ./asm_test/win/i/all.c:3421:         list_append(subroutine->parameters, (size_t*)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	list_append	 ;
	jmp	.L1632	 ;
.L1907:
 ; ./asm_test/win/i/all.c:3422:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rsi, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
	movq	%rax, %rcx	 ; tmp737, _174
 ; ./asm_test/win/i/all.c:3422:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	 ;
 ; ./asm_test/win/i/all.c:3423:     list_append(subroutine->blocks, (size_t*)block);
	movq	32(%r12), %rcx	 ; subroutine_164->blocks, subroutine_164->blocks
 ; ./asm_test/win/i/all.c:3422:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %r14	 ; tmp738, block
 ; ./asm_test/win/i/all.c:3423:     list_append(subroutine->blocks, (size_t*)block);
	movq	%rax, %rdx	 ; block,
	call	list_append	 ;
 ; ./asm_test/win/i/all.c:3424:     status->current_block = block;
	movq	%r14, 16(%rsi)	 ; block, status_155->current_block
 ; ./asm_test/win/i/all.c:3425:     List* statements = list_copy(function->body);
	movq	24(%r13), %rcx	 ; _147->body, _147->body
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp739, statements
.L1634:
 ; ./asm_test/win/i/all.c:3427:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%r12, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp740, statement
 ; ./asm_test/win/i/all.c:3427:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L1908	 ;,
 ; ./asm_test/win/i/all.c:3428:         tac_statement(statement, status);
	movq	%rsi, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L1634	 ;
.L1908:
 ; ./asm_test/win/i/all.c:3429:     status->current_subroutine = NULL;
	xorl	%eax, %eax	 ;
 ; ./asm_test/win/i/all.c:3395:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	%r15, %rdx	 ; tmp672,
 ; ./asm_test/win/i/all.c:3429:     status->current_subroutine = NULL;
	movq	%rax, 8(%rsi)	 ;, status_155->current_subroutine
 ; ./asm_test/win/i/all.c:3395:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	0(%rbp), %rax	 ; code_member_145->content.function, code_member_145->content.function
	movq	(%rax), %rbp	 ; _148->name, _149
 ; ./asm_test/win/i/all.c:3395:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rbp), %rcx	 ; _149->name, _149->name
	call	strcmp	 ;
 ; ./asm_test/win/i/all.c:3395:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	 ; tmp741
	jne	.L1630	 ;,
 ; ./asm_test/win/i/all.c:3396:                 tac->entry_point = code_member->content.function->name;
	movq	%rbp, 8(%rdi)	 ; _149, tac_158->entry_point
	jmp	.L1630	 ;
.L1631:
 ; ./asm_test/win/i/all.c:3397:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	 ;, _146
	jne	.L1638	 ;,
 ; ./asm_test/win/i/all.c:3398:             tac_class(code_member->content.class, status);
	movq	0(%rbp), %rcx	 ; code_member_145->content.class,
	movq	%rsi, %rdx	 ; status,
	jmp	.L1888	 ;
.L1638:
 ; ./asm_test/win/i/all.c:3399:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	 ; _146
	jne	.L1630	 ;,
	movq	0(%rbp), %rax	 ; code_member_145->content.import, code_member_145->content.import
	movq	(%rax), %rcx	 ; MEM[(struct Symbol * *)_153], _154
 ; ./asm_test/win/i/all.c:3405:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rcx), %r8d	 ; _154->kind, _181
 ; ./asm_test/win/i/all.c:3405:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %r8d	 ;, _181
	jne	.L1640	 ;,
 ; ./asm_test/win/i/all.c:3406:         list_append(tac->global_vars, (size_t*)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	%rsi, %r9	 ; status,
	movl	$118, %r8d	 ;,
	jmp	.L1889	 ;
.L1640:
 ; ./asm_test/win/i/all.c:3407:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%r8), %eax	 ;, tmp531
 ; ./asm_test/win/i/all.c:3407:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, tmp531
	ja	.L1641	 ;,
 ; ./asm_test/win/i/all.c:3408:         list_append(tac->global_vars, (size_t*)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	%rsi, %r9	 ; status,
	movl	$102, %r8d	 ;,
.L1889:
	movq	(%rcx), %rdx	 ; _154->type,
	call	create_var	 ;
 ; ./asm_test/win/i/all.c:3408:         list_append(tac->global_vars, (size_t*)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%rdi), %rcx	 ; tac_158->global_vars, tac_158->global_vars
 ; ./asm_test/win/i/all.c:3408:         list_append(tac->global_vars, (size_t*)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; tmp743, _187
 ; ./asm_test/win/i/all.c:3408:         list_append(tac->global_vars, (size_t*)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	call	list_append	 ;
	jmp	.L1630	 ;
.L1641:
 ; ./asm_test/win/i/all.c:3409:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%r8d, %r8d	 ; _181
	jne	.L1642	 ;,
 ; ./asm_test/win/i/all.c:3410:         tac_class(import->name->ast_node.class, status);
	movq	24(%rcx), %rcx	 ; _154->ast_node.class, _154->ast_node.class
	movq	%rsi, %rdx	 ; status,
.L1888:
	call	tac_class	 ;
	jmp	.L1630	 ;
.L1642:
	movl	%r8d, 48(%rsp)	 ; _181, %sfp
 ; ./asm_test/win/i/all.c:3412:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	$2, %ecx	 ;,
	call	*__imp___acrt_iob_func(%rip)	 ;
 ; ./asm_test/win/i/all.c:3412:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	48(%rsp), %r8d	 ; %sfp, _181
	leaq	.LC283(%rip), %rdx	 ;, tmp535
 ; ./asm_test/win/i/all.c:3412:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movq	%rax, %rcx	 ; tmp744, _190
 ; ./asm_test/win/i/all.c:3412:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	call	fprintf	 ;
	jmp	.L1630	 ;
.L1906:
 ; ./asm_test/win/i/all.c:1983:     fprintf(outfile, "TAC {\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC284(%rip), %rcx	 ;, tmp536
	movl	$4, %esi	 ;, ivtmp_415
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1984:     if (tac->attribute_tables == NULL || tac->attribute_tables->head == NULL || tac->attribute_tables->tail == NULL) {
	movq	(%rdi), %rax	 ; tac_158->attribute_tables, _197
 ; ./asm_test/win/i/all.c:1984:     if (tac->attribute_tables == NULL || tac->attribute_tables->head == NULL || tac->attribute_tables->tail == NULL) {
	testq	%rax, %rax	 ; _197
	je	.L1646	 ;,
 ; ./asm_test/win/i/all.c:1984:     if (tac->attribute_tables == NULL || tac->attribute_tables->head == NULL || tac->attribute_tables->tail == NULL) {
	cmpq	$0, (%rax)	 ;, _197->head
	je	.L1646	 ;,
 ; ./asm_test/win/i/all.c:1984:     if (tac->attribute_tables == NULL || tac->attribute_tables->head == NULL || tac->attribute_tables->tail == NULL) {
	cmpq	$0, 8(%rax)	 ;, _197->tail
	jne	.L1645	 ;,
.L1646:
 ; ./asm_test/win/i/all.c:1985:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:1985:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rsi	 ; ivtmp_415
	jne	.L1646	 ;,
 ; ./asm_test/win/i/all.c:1986:         fprintf(outfile, "designs: []\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC285(%rip), %rcx	 ;, tmp537
	jmp	.L1891	 ;
.L1645:
 ; ./asm_test/win/i/all.c:1988:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:1988:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rsi	 ; ivtmp_360
	jne	.L1645	 ;,
 ; ./asm_test/win/i/all.c:1989:         fprintf(outfile, "designs: [\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC286(%rip), %rcx	 ;, tmp538
 ; ./asm_test/win/i/all.c:2330:         fprintf(outfile, "%s ", attribute_table->name->name);
	leaq	.LC288(%rip), %r12	 ;, tmp669
 ; ./asm_test/win/i/all.c:1989:         fprintf(outfile, "designs: [\n");
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:2355:         fprintf(outfile, "%s\t", attribute->type->name);
	leaq	.LC293(%rip), %r13	 ;, tmp670
.L1648:
 ; ./asm_test/win/i/all.c:1991:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	movq	(%rdi), %rcx	 ; tac_158->attribute_tables,
	call	list_pop	 ;
	movq	%rax, %rsi	 ; tmp747, attribute_table
 ; ./asm_test/win/i/all.c:1991:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	testq	%rax, %rax	 ; attribute_table
	je	.L1909	 ;,
 ; ./asm_test/win/i/all.c:2325:     if (attribute_table->name == NULL) {
	cmpq	$0, 8(%rsi)	 ;, attribute_table_209->name
	movl	$8, %ebp	 ;, ivtmp_366
	jne	.L1649	 ;,
.L1650:
 ; ./asm_test/win/i/all.c:2326:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2326:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%rbp	 ; ivtmp_195
	jne	.L1650	 ;,
 ; ./asm_test/win/i/all.c:2327:         fprintf(outfile, "NULL ");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC287(%rip), %rcx	 ;, tmp539
	call	fputs	 ;
	jmp	.L1651	 ;
.L1649:
 ; ./asm_test/win/i/all.c:2329:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2329:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%rbp	 ; ivtmp_366
	jne	.L1649	 ;,
 ; ./asm_test/win/i/all.c:2330:         fprintf(outfile, "%s ", attribute_table->name->name);
	movq	8(%rsi), %rax	 ; attribute_table_209->name, attribute_table_209->name
	movq	%r12, %rdx	 ; tmp669,
	movq	%rbx, %rcx	 ; out_tac_file,
	movq	8(%rax), %r8	 ; _276->name,
	call	fprintf	 ;
.L1651:
 ; ./asm_test/win/i/all.c:2332:     fprintf(outfile, "%zu ", attribute_table->size);
	movq	16(%rsi), %r8	 ; attribute_table_209->size,
	leaq	.LC289(%rip), %rdx	 ;, tmp544
	movq	%rbx, %rcx	 ; out_tac_file,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2333:     if (attribute_table->attributes == NULL || attribute_table->attributes->head == NULL || attribute_table->attributes->tail == NULL)
	movq	(%rsi), %rax	 ; attribute_table_209->attributes, _279
 ; ./asm_test/win/i/all.c:2333:     if (attribute_table->attributes == NULL || attribute_table->attributes->head == NULL || attribute_table->attributes->tail == NULL)
	testq	%rax, %rax	 ; _279
	je	.L1652	 ;,
 ; ./asm_test/win/i/all.c:2333:     if (attribute_table->attributes == NULL || attribute_table->attributes->head == NULL || attribute_table->attributes->tail == NULL)
	cmpq	$0, (%rax)	 ;, _279->head
	je	.L1652	 ;,
 ; ./asm_test/win/i/all.c:2333:     if (attribute_table->attributes == NULL || attribute_table->attributes->head == NULL || attribute_table->attributes->tail == NULL)
	cmpq	$0, 8(%rax)	 ;, _279->tail
	jne	.L1653	 ;,
.L1652:
 ; ./asm_test/win/i/all.c:2334:         fprintf(outfile, "{}\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC290(%rip), %rcx	 ;, tmp545
	jmp	.L1890	 ;
.L1653:
 ; ./asm_test/win/i/all.c:2336:         fprintf(outfile, "{\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC291(%rip), %rcx	 ;, tmp546
 ; ./asm_test/win/i/all.c:2352:         fprintf(outfile, "NULL\t");
	leaq	.LC292(%rip), %r14	 ;, tmp667
 ; ./asm_test/win/i/all.c:2336:         fprintf(outfile, "{\n");
	call	fputs	 ;
.L1655:
 ; ./asm_test/win/i/all.c:2338:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	movq	(%rsi), %rcx	 ; attribute_table_209->attributes,
	call	list_pop	 ;
	movq	%rax, %rbp	 ; tmp746, attribute
 ; ./asm_test/win/i/all.c:2338:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	testq	%rax, %rax	 ; attribute
	je	.L1910	 ;,
 ; ./asm_test/win/i/all.c:2350:     if (attribute->type == NULL) {
	cmpq	$0, 8(%rbp)	 ;, attribute_283->type
	movl	$12, %r15d	 ;, ivtmp_370
	jne	.L1656	 ;,
.L1657:
 ; ./asm_test/win/i/all.c:2351:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2351:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r15	 ; ivtmp_391
	jne	.L1657	 ;,
 ; ./asm_test/win/i/all.c:2352:         fprintf(outfile, "NULL\t");
	movq	%rbx, %rdx	 ; out_tac_file,
	movq	%r14, %rcx	 ; tmp667,
	call	fputs	 ;
	jmp	.L1658	 ;
.L1656:
 ; ./asm_test/win/i/all.c:2354:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2354:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r15	 ; ivtmp_370
	jne	.L1656	 ;,
 ; ./asm_test/win/i/all.c:2355:         fprintf(outfile, "%s\t", attribute->type->name);
	movq	8(%rbp), %rax	 ; attribute_283->type, attribute_283->type
	movq	%r13, %rdx	 ; tmp670,
	movq	%rbx, %rcx	 ; out_tac_file,
	movq	8(%rax), %r8	 ; _298->name,
	call	fprintf	 ;
.L1658:
 ; ./asm_test/win/i/all.c:2357:     if (attribute->var == NULL)
	movq	0(%rbp), %rax	 ; attribute_283->var, _300
 ; ./asm_test/win/i/all.c:2357:     if (attribute->var == NULL)
	testq	%rax, %rax	 ; _300
	jne	.L1659	 ;,
 ; ./asm_test/win/i/all.c:2358:         fprintf(outfile, "NULL ");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC287(%rip), %rcx	 ;, tmp551
	call	fputs	 ;
	jmp	.L1660	 ;
.L1659:
 ; ./asm_test/win/i/all.c:2359:     else if (attribute->var->original_name)
	movq	(%rax), %rdx	 ; _300->original_name, _301
 ; ./asm_test/win/i/all.c:2360:         fprintf(outfile, "%s(%s) ", attribute->var->name, attribute->var->original_name->name);
	movq	8(%rax), %r8	 ; _300->name, pretmp_615
 ; ./asm_test/win/i/all.c:2359:     else if (attribute->var->original_name)
	testq	%rdx, %rdx	 ; _301
	je	.L1661	 ;,
 ; ./asm_test/win/i/all.c:2360:         fprintf(outfile, "%s(%s) ", attribute->var->name, attribute->var->original_name->name);
	movq	8(%rdx), %r9	 ; _301->name,
	movq	%rbx, %rcx	 ; out_tac_file,
	leaq	.LC294(%rip), %rdx	 ;, tmp553
	call	fprintf	 ;
	jmp	.L1660	 ;
.L1661:
 ; ./asm_test/win/i/all.c:2362:         fprintf(outfile, "%s ", attribute->var->name);
	movq	%r12, %rdx	 ; tmp669,
	movq	%rbx, %rcx	 ; out_tac_file,
	call	fprintf	 ;
.L1660:
 ; ./asm_test/win/i/all.c:2363:     fprintf(outfile, "%zu\n", attribute->offset);
	movq	16(%rbp), %r8	 ; attribute_283->offset,
	leaq	.LC295(%rip), %rdx	 ;, tmp556
	movq	%rbx, %rcx	 ; out_tac_file,
	call	fprintf	 ;
	jmp	.L1655	 ;
.L1910:
	movl	$8, %esi	 ;, ivtmp_394
.L1663:
 ; ./asm_test/win/i/all.c:2340:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2340:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%rsi	 ; ivtmp_394
	jne	.L1663	 ;,
 ; ./asm_test/win/i/all.c:2341:         fprintf(outfile, "}\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC296(%rip), %rcx	 ;, tmp557
.L1890:
	call	fputs	 ;
	jmp	.L1648	 ;
.L1909:
	movl	$4, %esi	 ;, ivtmp_412
.L1665:
 ; ./asm_test/win/i/all.c:1993:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:1993:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rsi	 ; ivtmp_412
	jne	.L1665	 ;,
 ; ./asm_test/win/i/all.c:1994:         fprintf(outfile, "]\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC297(%rip), %rcx	 ;, tmp558
.L1891:
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:1996:     if (tac->entry_point == NULL) {
	cmpq	$0, 8(%rdi)	 ;, tac_158->entry_point
	movl	$4, %esi	 ;, ivtmp_418
	jne	.L1666	 ;,
.L1667:
 ; ./asm_test/win/i/all.c:1997:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:1997:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rsi	 ; ivtmp_421
	jne	.L1667	 ;,
 ; ./asm_test/win/i/all.c:1998:         fprintf(outfile, "entry_point: \"NULL\"\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC298(%rip), %rcx	 ;, tmp559
	call	fputs	 ;
	jmp	.L1668	 ;
.L1666:
 ; ./asm_test/win/i/all.c:2000:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2000:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rsi	 ; ivtmp_418
	jne	.L1666	 ;,
 ; ./asm_test/win/i/all.c:2001:         fprintf(outfile, "entry_point: %s\n", tac->entry_point->name);
	movq	8(%rdi), %rax	 ; tac_158->entry_point, tac_158->entry_point
	leaq	.LC299(%rip), %rdx	 ;, tmp562
	movq	%rbx, %rcx	 ; out_tac_file,
	movq	8(%rax), %r8	 ; _223->name,
	call	fprintf	 ;
.L1668:
 ; ./asm_test/win/i/all.c:2003:     if (tac->global_vars == NULL || tac->global_vars->head == NULL || tac->global_vars->tail == NULL) {
	movq	16(%rdi), %rax	 ; tac_158->global_vars, _225
	movl	$4, %esi	 ;, ivtmp_409
 ; ./asm_test/win/i/all.c:2003:     if (tac->global_vars == NULL || tac->global_vars->head == NULL || tac->global_vars->tail == NULL) {
	testq	%rax, %rax	 ; _225
	je	.L1671	 ;,
 ; ./asm_test/win/i/all.c:2003:     if (tac->global_vars == NULL || tac->global_vars->head == NULL || tac->global_vars->tail == NULL) {
	cmpq	$0, (%rax)	 ;, _225->head
	je	.L1671	 ;,
 ; ./asm_test/win/i/all.c:2003:     if (tac->global_vars == NULL || tac->global_vars->head == NULL || tac->global_vars->tail == NULL) {
	cmpq	$0, 8(%rax)	 ;, _225->tail
	jne	.L1670	 ;,
.L1671:
 ; ./asm_test/win/i/all.c:2004:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2004:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rsi	 ; ivtmp_409
	jne	.L1671	 ;,
 ; ./asm_test/win/i/all.c:2005:         fprintf(outfile, "global: []\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC300(%rip), %rcx	 ;, tmp563
	jmp	.L1892	 ;
.L1670:
 ; ./asm_test/win/i/all.c:2007:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2007:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rsi	 ; ivtmp_424
	jne	.L1670	 ;,
 ; ./asm_test/win/i/all.c:2008:         fprintf(outfile, "global: [\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC301(%rip), %rcx	 ;, tmp564
	call	fputs	 ;
.L1673:
 ; ./asm_test/win/i/all.c:2010:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	movq	16(%rdi), %rcx	 ; tac_158->global_vars, tac_158->global_vars
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp748, var
 ; ./asm_test/win/i/all.c:2010:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	testq	%rax, %rax	 ; var
	je	.L1911	 ;,
 ; ./asm_test/win/i/all.c:2011:             output_var(var, outfile, indent + 2);
	movl	$2, %r8d	 ;,
	movq	%rbx, %rdx	 ; out_tac_file,
	call	output_var	 ;
	jmp	.L1673	 ;
.L1911:
	movl	$4, %esi	 ;, ivtmp_267
.L1675:
 ; ./asm_test/win/i/all.c:2012:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2012:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rsi	 ; ivtmp_267
	jne	.L1675	 ;,
 ; ./asm_test/win/i/all.c:2013:         fprintf(outfile, "]\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC297(%rip), %rcx	 ;, tmp566
.L1892:
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:2015:     if (tac->subroutines == NULL || tac->subroutines->head == NULL || tac->subroutines->tail == NULL) {
	movq	24(%rdi), %rax	 ; tac_158->subroutines, _242
	movl	$4, %esi	 ;, ivtmp_272
 ; ./asm_test/win/i/all.c:2015:     if (tac->subroutines == NULL || tac->subroutines->head == NULL || tac->subroutines->tail == NULL) {
	testq	%rax, %rax	 ; _242
	je	.L1678	 ;,
 ; ./asm_test/win/i/all.c:2015:     if (tac->subroutines == NULL || tac->subroutines->head == NULL || tac->subroutines->tail == NULL) {
	cmpq	$0, (%rax)	 ;, _242->head
	je	.L1678	 ;,
 ; ./asm_test/win/i/all.c:2015:     if (tac->subroutines == NULL || tac->subroutines->head == NULL || tac->subroutines->tail == NULL) {
	cmpq	$0, 8(%rax)	 ;, _242->tail
	jne	.L1677	 ;,
.L1678:
 ; ./asm_test/win/i/all.c:2016:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2016:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rsi	 ; ivtmp_272
	jne	.L1678	 ;,
 ; ./asm_test/win/i/all.c:2017:         fprintf(outfile, "subroutines: []\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC302(%rip), %rcx	 ;, tmp567
.L1893:
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:2028:     fprintf(outfile, "}\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC296(%rip), %rcx	 ;, tmp568
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:954:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	get_info	 ;
 ; ./asm_test/win/i/all.c:954:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rbx, %rcx	 ; out_tac_file,
	leaq	.LC268(%rip), %rdx	 ;, tmp569
 ; ./asm_test/win/i/all.c:954:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	movq	%rax, %r8	 ;, tmp749
 ; ./asm_test/win/i/all.c:954:     fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:1006:             fclose(out_tac_file);
	movq	%rbx, %rcx	 ; out_tac_file,
	call	fclose	 ;
	jmp	.L1577	 ;
.L1677:
 ; ./asm_test/win/i/all.c:2019:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2019:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rsi	 ; ivtmp_515
	jne	.L1677	 ;,
 ; ./asm_test/win/i/all.c:2020:         fprintf(outfile, "subroutines: [\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC303(%rip), %rcx	 ;, tmp570
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	leaq	.L1714(%rip), %r13	 ;, tmp663
 ; ./asm_test/win/i/all.c:2020:         fprintf(outfile, "subroutines: [\n");
	call	fputs	 ;
.L1679:
 ; ./asm_test/win/i/all.c:2022:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	movq	24(%rdi), %rcx	 ; tac_158->subroutines, tac_158->subroutines
	call	list_pop	 ;
	movq	%rax, %rsi	 ; tmp754, subroutine
 ; ./asm_test/win/i/all.c:2022:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	testq	%rax, %rax	 ; subroutine
	je	.L1912	 ;,
 ; ./asm_test/win/i/all.c:2036:     if (subroutine->name == NULL) {
	cmpq	$0, (%rsi)	 ;, subroutine_254->name
	movl	$8, %ebp	 ;, ivtmp_557
	jne	.L1680	 ;,
.L1681:
 ; ./asm_test/win/i/all.c:2037:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2037:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%rbp	 ; ivtmp_589
	jne	.L1681	 ;,
 ; ./asm_test/win/i/all.c:2038:         fprintf(outfile, "NULL {\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC304(%rip), %rcx	 ;, tmp571
	call	fputs	 ;
	jmp	.L1682	 ;
.L1680:
 ; ./asm_test/win/i/all.c:2040:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2040:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%rbp	 ; ivtmp_557
	jne	.L1680	 ;,
 ; ./asm_test/win/i/all.c:2041:         fprintf(outfile, "%s {\n", subroutine->name->name);
	movq	(%rsi), %rax	 ; subroutine_254->name, subroutine_254->name
	leaq	.LC305(%rip), %rdx	 ;, tmp574
	movq	%rbx, %rcx	 ; out_tac_file,
	movq	8(%rax), %r8	 ; _316->name,
	call	fprintf	 ;
.L1682:
 ; ./asm_test/win/i/all.c:2043:     if (subroutine->return_type == NULL) {
	cmpq	$0, 8(%rsi)	 ;, subroutine_254->return_type
	movl	$12, %ebp	 ;, ivtmp_854
	jne	.L1683	 ;,
.L1684:
 ; ./asm_test/win/i/all.c:2044:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2044:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rbp	 ; ivtmp_883
	jne	.L1684	 ;,
 ; ./asm_test/win/i/all.c:2045:         fprintf(outfile, "return_type: \"NULL\"\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC306(%rip), %rcx	 ;, tmp575
	call	fputs	 ;
	jmp	.L1685	 ;
.L1683:
 ; ./asm_test/win/i/all.c:2047:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2047:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rbp	 ; ivtmp_854
	jne	.L1683	 ;,
 ; ./asm_test/win/i/all.c:2048:         fprintf(outfile, "return_type: %s\n", subroutine->return_type->name);
	movq	8(%rsi), %rax	 ; subroutine_254->return_type, subroutine_254->return_type
	leaq	.LC307(%rip), %rdx	 ;, tmp578
	movq	%rbx, %rcx	 ; out_tac_file,
	movq	8(%rax), %r8	 ; _327->name,
	call	fprintf	 ;
.L1685:
 ; ./asm_test/win/i/all.c:2050:     if (subroutine->parameters == NULL || subroutine->parameters->head == NULL || subroutine->parameters->tail == NULL) {
	movq	16(%rsi), %rax	 ; subroutine_254->parameters, _329
	movl	$12, %ebp	 ;, ivtmp_468
 ; ./asm_test/win/i/all.c:2050:     if (subroutine->parameters == NULL || subroutine->parameters->head == NULL || subroutine->parameters->tail == NULL) {
	testq	%rax, %rax	 ; _329
	je	.L1688	 ;,
 ; ./asm_test/win/i/all.c:2050:     if (subroutine->parameters == NULL || subroutine->parameters->head == NULL || subroutine->parameters->tail == NULL) {
	cmpq	$0, (%rax)	 ;, _329->head
	je	.L1688	 ;,
 ; ./asm_test/win/i/all.c:2050:     if (subroutine->parameters == NULL || subroutine->parameters->head == NULL || subroutine->parameters->tail == NULL) {
	cmpq	$0, 8(%rax)	 ;, _329->tail
	jne	.L1687	 ;,
.L1688:
 ; ./asm_test/win/i/all.c:2051:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2051:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rbp	 ; ivtmp_468
	jne	.L1688	 ;,
 ; ./asm_test/win/i/all.c:2052:         fprintf(outfile, "parameters: []\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC308(%rip), %rcx	 ;, tmp579
	jmp	.L1894	 ;
.L1687:
 ; ./asm_test/win/i/all.c:2054:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2054:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rbp	 ; ivtmp_380
	jne	.L1687	 ;,
 ; ./asm_test/win/i/all.c:2055:         fprintf(outfile, "parameters: [\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC309(%rip), %rcx	 ;, tmp580
	call	fputs	 ;
.L1690:
 ; ./asm_test/win/i/all.c:2057:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	movq	16(%rsi), %rcx	 ; subroutine_254->parameters, subroutine_254->parameters
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp750, parameter
 ; ./asm_test/win/i/all.c:2057:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	je	.L1913	 ;,
 ; ./asm_test/win/i/all.c:2058:             output_var(parameter, outfile, indent + 2);
	movl	$4, %r8d	 ;,
	movq	%rbx, %rdx	 ; out_tac_file,
	call	output_var	 ;
	jmp	.L1690	 ;
.L1913:
	movl	$12, %ebp	 ;, ivtmp_266
.L1692:
 ; ./asm_test/win/i/all.c:2059:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2059:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rbp	 ; ivtmp_266
	jne	.L1692	 ;,
 ; ./asm_test/win/i/all.c:2060:         fprintf(outfile, "]\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC297(%rip), %rcx	 ;, tmp582
.L1894:
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:2062:     if (subroutine->local_vars == NULL || subroutine->local_vars->head == NULL || subroutine->local_vars->tail == NULL) {
	movq	24(%rsi), %rax	 ; subroutine_254->local_vars, _346
	movl	$12, %ebp	 ;, ivtmp_480
 ; ./asm_test/win/i/all.c:2062:     if (subroutine->local_vars == NULL || subroutine->local_vars->head == NULL || subroutine->local_vars->tail == NULL) {
	testq	%rax, %rax	 ; _346
	je	.L1695	 ;,
 ; ./asm_test/win/i/all.c:2062:     if (subroutine->local_vars == NULL || subroutine->local_vars->head == NULL || subroutine->local_vars->tail == NULL) {
	cmpq	$0, (%rax)	 ;, _346->head
	je	.L1695	 ;,
 ; ./asm_test/win/i/all.c:2062:     if (subroutine->local_vars == NULL || subroutine->local_vars->head == NULL || subroutine->local_vars->tail == NULL) {
	cmpq	$0, 8(%rax)	 ;, _346->tail
	jne	.L1694	 ;,
.L1695:
 ; ./asm_test/win/i/all.c:2063:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2063:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rbp	 ; ivtmp_480
	jne	.L1695	 ;,
 ; ./asm_test/win/i/all.c:2064:         fprintf(outfile, "local: []\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC310(%rip), %rcx	 ;, tmp583
	jmp	.L1895	 ;
.L1694:
 ; ./asm_test/win/i/all.c:2066:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2066:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rbp	 ; ivtmp_374
	jne	.L1694	 ;,
 ; ./asm_test/win/i/all.c:2067:         fprintf(outfile, "local: [\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC311(%rip), %rcx	 ;, tmp584
	call	fputs	 ;
.L1697:
 ; ./asm_test/win/i/all.c:2069:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	movq	24(%rsi), %rcx	 ; subroutine_254->local_vars, subroutine_254->local_vars
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp751, var
 ; ./asm_test/win/i/all.c:2069:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	testq	%rax, %rax	 ; var
	je	.L1914	 ;,
 ; ./asm_test/win/i/all.c:2070:             output_var(var, outfile, indent + 2);
	movl	$4, %r8d	 ;,
	movq	%rbx, %rdx	 ; out_tac_file,
	call	output_var	 ;
	jmp	.L1697	 ;
.L1914:
	movl	$12, %ebp	 ;, ivtmp_474
.L1699:
 ; ./asm_test/win/i/all.c:2071:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2071:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rbp	 ; ivtmp_474
	jne	.L1699	 ;,
 ; ./asm_test/win/i/all.c:2072:         fprintf(outfile, "]\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC297(%rip), %rcx	 ;, tmp586
.L1895:
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:2074:     if (subroutine->blocks == NULL || subroutine->blocks->head == NULL || subroutine->blocks->tail == NULL) {
	movq	32(%rsi), %rax	 ; subroutine_254->blocks, _363
 ; ./asm_test/win/i/all.c:2074:     if (subroutine->blocks == NULL || subroutine->blocks->head == NULL || subroutine->blocks->tail == NULL) {
	testq	%rax, %rax	 ; _363
	je	.L1774	 ;,
 ; ./asm_test/win/i/all.c:2074:     if (subroutine->blocks == NULL || subroutine->blocks->head == NULL || subroutine->blocks->tail == NULL) {
	cmpq	$0, (%rax)	 ;, _363->head
	je	.L1774	 ;,
 ; ./asm_test/win/i/all.c:2074:     if (subroutine->blocks == NULL || subroutine->blocks->head == NULL || subroutine->blocks->tail == NULL) {
	cmpq	$0, 8(%rax)	 ;, _363->tail
	movl	$12, %ebp	 ;, ivtmp_393
	jne	.L1701	 ;,
.L1774:
	movl	$12, %esi	 ;, ivtmp_261
.L1702:
 ; ./asm_test/win/i/all.c:2075:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2075:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rsi	 ; ivtmp_261
	jne	.L1702	 ;,
 ; ./asm_test/win/i/all.c:2076:         fprintf(outfile, "instructions: []\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC312(%rip), %rcx	 ;, tmp587
	jmp	.L1899	 ;
.L1701:
 ; ./asm_test/win/i/all.c:2078:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2078:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rbp	 ; ivtmp_393
	jne	.L1701	 ;,
 ; ./asm_test/win/i/all.c:2079:         fprintf(outfile, "instructions: [\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC313(%rip), %rcx	 ;, tmp588
.L1898:
 ; ./asm_test/win/i/all.c:2127:         fprintf(outfile, "}\n");
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:2081:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	movq	32(%rsi), %rcx	 ; subroutine_254->blocks, subroutine_254->blocks
	call	list_pop	 ;
	movq	%rax, %r12	 ; tmp753, block
 ; ./asm_test/win/i/all.c:2081:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	testq	%rax, %rax	 ; block
	je	.L1915	 ;,
 ; ./asm_test/win/i/all.c:2112:     if (block->label == NULL) {
	cmpq	$0, (%r12)	 ;, block_375->label
	movl	$16, %ebp	 ;, ivtmp_486
	jne	.L1705	 ;,
.L1706:
 ; ./asm_test/win/i/all.c:2113:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2113:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%rbp	 ; ivtmp_402
	jne	.L1706	 ;,
 ; ./asm_test/win/i/all.c:2114:         fprintf(outfile, "NULL ");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC287(%rip), %rcx	 ;, tmp589
	call	fputs	 ;
	jmp	.L1707	 ;
.L1705:
 ; ./asm_test/win/i/all.c:2116:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2116:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%rbp	 ; ivtmp_486
	jne	.L1705	 ;,
 ; ./asm_test/win/i/all.c:2117:         fprintf(outfile, "%s ", block->label->name);
	movq	(%r12), %rax	 ; block_375->label, block_375->label
	leaq	.LC288(%rip), %rdx	 ;,
	movq	%rbx, %rcx	 ; out_tac_file,
	movq	8(%rax), %r8	 ; _397->name,
	call	fprintf	 ;
.L1707:
 ; ./asm_test/win/i/all.c:2119:     if (block->instructions == NULL || block->instructions->head == NULL || block->instructions->tail == NULL)
	movq	8(%r12), %rax	 ; block_375->instructions, _399
 ; ./asm_test/win/i/all.c:2119:     if (block->instructions == NULL || block->instructions->head == NULL || block->instructions->tail == NULL)
	testq	%rax, %rax	 ; _399
	je	.L1708	 ;,
 ; ./asm_test/win/i/all.c:2119:     if (block->instructions == NULL || block->instructions->head == NULL || block->instructions->tail == NULL)
	cmpq	$0, (%rax)	 ;, _399->head
	je	.L1708	 ;,
 ; ./asm_test/win/i/all.c:2119:     if (block->instructions == NULL || block->instructions->head == NULL || block->instructions->tail == NULL)
	cmpq	$0, 8(%rax)	 ;, _399->tail
	jne	.L1709	 ;,
.L1708:
 ; ./asm_test/win/i/all.c:2120:         fprintf(outfile, "{}\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC290(%rip), %rcx	 ;, tmp593
	jmp	.L1898	 ;
.L1709:
 ; ./asm_test/win/i/all.c:2122:         fprintf(outfile, "{\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC291(%rip), %rcx	 ;, tmp594
	movl	$1, %r15d	 ;, tmp659
	call	fputs	 ;
.L1711:
 ; ./asm_test/win/i/all.c:2124:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	movq	8(%r12), %rcx	 ; block_375->instructions, block_375->instructions
	call	list_pop	 ;
	movq	%rax, %rbp	 ; tmp752, instruction
 ; ./asm_test/win/i/all.c:2124:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	testq	%rax, %rax	 ; instruction
	je	.L1916	 ;,
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	cmpl	$25, 24(%rbp)	 ;, instruction_403->type
	ja	.L1777	 ;,
	movl	24(%rbp), %eax	 ; instruction_403->type, instruction_403->type
	movslq	0(%r13,%rax,4), %rax	 ;, tmp598
	addq	%r13, %rax	 ; tmp663, tmp599
	jmp	*%rax	 ; tmp599
	.section .rdata,"dr"
	.align 4
.L1714:
	.long	.L1778-.L1714
	.long	.L1779-.L1714
	.long	.L1780-.L1714
	.long	.L1781-.L1714
	.long	.L1782-.L1714
	.long	.L1783-.L1714
	.long	.L1784-.L1714
	.long	.L1785-.L1714
	.long	.L1786-.L1714
	.long	.L1787-.L1714
	.long	.L1788-.L1714
	.long	.L1789-.L1714
	.long	.L1790-.L1714
	.long	.L1791-.L1714
	.long	.L1792-.L1714
	.long	.L1793-.L1714
	.long	.L1794-.L1714
	.long	.L1795-.L1714
	.long	.L1796-.L1714
	.long	.L1797-.L1714
	.long	.L1798-.L1714
	.long	.L1799-.L1714
	.long	.L1800-.L1714
	.long	.L1801-.L1714
	.long	.L1802-.L1714
	.long	.L1803-.L1714
	.section	.text.startup,"x"
.L1778:
	movl	$20, %r14d	 ;, ivtmp_853
.L1739:
 ; ./asm_test/win/i/all.c:2167:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2167:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_853
	jne	.L1739	 ;,
 ; ./asm_test/win/i/all.c:2168:             fprintf(outfile, "add\t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC314(%rip), %rcx	 ;, tmp601
	jmp	.L1896	 ;
.L1779:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_408
.L1738:
 ; ./asm_test/win/i/all.c:2171:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2171:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_408
	jne	.L1738	 ;,
 ; ./asm_test/win/i/all.c:2172:             fprintf(outfile, "sub\t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC315(%rip), %rcx	 ;, tmp602
	jmp	.L1896	 ;
.L1780:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_442
.L1737:
 ; ./asm_test/win/i/all.c:2175:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2175:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_442
	jne	.L1737	 ;,
 ; ./asm_test/win/i/all.c:2176:             fprintf(outfile, "mul\t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC316(%rip), %rcx	 ;, tmp603
	jmp	.L1896	 ;
.L1781:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_481
.L1736:
 ; ./asm_test/win/i/all.c:2179:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2179:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_481
	jne	.L1736	 ;,
 ; ./asm_test/win/i/all.c:2180:             fprintf(outfile, "div\t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC317(%rip), %rcx	 ;, tmp604
	jmp	.L1896	 ;
.L1782:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_484
.L1735:
 ; ./asm_test/win/i/all.c:2183:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2183:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_484
	jne	.L1735	 ;,
 ; ./asm_test/win/i/all.c:2184:             fprintf(outfile, "mod\t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC318(%rip), %rcx	 ;, tmp605
	jmp	.L1896	 ;
.L1783:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_576
.L1734:
 ; ./asm_test/win/i/all.c:2187:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2187:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_576
	jne	.L1734	 ;,
 ; ./asm_test/win/i/all.c:2188:             fprintf(outfile, "eq \t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC319(%rip), %rcx	 ;, tmp606
	jmp	.L1896	 ;
.L1784:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_501
.L1733:
 ; ./asm_test/win/i/all.c:2191:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2191:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_501
	jne	.L1733	 ;,
 ; ./asm_test/win/i/all.c:2192:             fprintf(outfile, "ne \t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC320(%rip), %rcx	 ;, tmp607
	jmp	.L1896	 ;
.L1785:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_478
.L1732:
 ; ./asm_test/win/i/all.c:2195:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2195:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_478
	jne	.L1732	 ;,
 ; ./asm_test/win/i/all.c:2196:             fprintf(outfile, "lt \t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC321(%rip), %rcx	 ;, tmp608
	jmp	.L1896	 ;
.L1786:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_472
.L1731:
 ; ./asm_test/win/i/all.c:2199:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2199:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_472
	jne	.L1731	 ;,
 ; ./asm_test/win/i/all.c:2200:             fprintf(outfile, "gt \t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC322(%rip), %rcx	 ;, tmp609
	jmp	.L1896	 ;
.L1787:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_252
.L1730:
 ; ./asm_test/win/i/all.c:2203:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2203:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_252
	jne	.L1730	 ;,
 ; ./asm_test/win/i/all.c:2204:             fprintf(outfile, "le \t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC323(%rip), %rcx	 ;, tmp610
	jmp	.L1896	 ;
.L1788:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_253
.L1729:
 ; ./asm_test/win/i/all.c:2207:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2207:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_253
	jne	.L1729	 ;,
 ; ./asm_test/win/i/all.c:2208:             fprintf(outfile, "ge \t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC324(%rip), %rcx	 ;, tmp611
	jmp	.L1896	 ;
.L1789:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_312
.L1728:
 ; ./asm_test/win/i/all.c:2211:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2211:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_312
	jne	.L1728	 ;,
 ; ./asm_test/win/i/all.c:2212:             fprintf(outfile, "and\t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC325(%rip), %rcx	 ;, tmp612
	jmp	.L1896	 ;
.L1790:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_326
.L1727:
 ; ./asm_test/win/i/all.c:2215:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2215:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_326
	jne	.L1727	 ;,
 ; ./asm_test/win/i/all.c:2216:             fprintf(outfile, "or \t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC326(%rip), %rcx	 ;, tmp613
	jmp	.L1896	 ;
.L1791:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_322
.L1726:
 ; ./asm_test/win/i/all.c:2219:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2219:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_322
	jne	.L1726	 ;,
 ; ./asm_test/win/i/all.c:2220:             fprintf(outfile, "not\t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC327(%rip), %rcx	 ;, tmp614
	jmp	.L1896	 ;
.L1792:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_339
.L1725:
 ; ./asm_test/win/i/all.c:2223:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2223:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_339
	jne	.L1725	 ;,
 ; ./asm_test/win/i/all.c:2224:             fprintf(outfile, "assign\t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC328(%rip), %rcx	 ;, tmp615
	jmp	.L1896	 ;
.L1793:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_821
.L1724:
 ; ./asm_test/win/i/all.c:2227:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2227:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_821
	jne	.L1724	 ;,
 ; ./asm_test/win/i/all.c:2228:             fprintf(outfile, "get_attr\t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC329(%rip), %rcx	 ;, tmp616
	jmp	.L1896	 ;
.L1794:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_340
.L1723:
 ; ./asm_test/win/i/all.c:2231:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2231:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_340
	jne	.L1723	 ;,
 ; ./asm_test/win/i/all.c:2232:             fprintf(outfile, "get_elem\t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC330(%rip), %rcx	 ;, tmp617
	jmp	.L1896	 ;
.L1795:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_436
.L1722:
 ; ./asm_test/win/i/all.c:2235:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2235:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_436
	jne	.L1722	 ;,
 ; ./asm_test/win/i/all.c:2236:             fprintf(outfile, "param\t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC331(%rip), %rcx	 ;, tmp618
	jmp	.L1896	 ;
.L1796:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_454
.L1721:
 ; ./asm_test/win/i/all.c:2239:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2239:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_454
	jne	.L1721	 ;,
 ; ./asm_test/win/i/all.c:2240:             fprintf(outfile, "alloc\t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC332(%rip), %rcx	 ;, tmp619
	jmp	.L1896	 ;
.L1797:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_457
.L1720:
 ; ./asm_test/win/i/all.c:2243:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2243:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_457
	jne	.L1720	 ;,
 ; ./asm_test/win/i/all.c:2244:             fprintf(outfile, "jmp_c\t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC333(%rip), %rcx	 ;, tmp620
	jmp	.L1896	 ;
.L1798:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_355
.L1719:
 ; ./asm_test/win/i/all.c:2247:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2247:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_355
	jne	.L1719	 ;,
 ; ./asm_test/win/i/all.c:2248:             fprintf(outfile, "jmp\t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC334(%rip), %rcx	 ;, tmp621
	jmp	.L1896	 ;
.L1799:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_362
.L1718:
 ; ./asm_test/win/i/all.c:2251:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2251:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_362
	jne	.L1718	 ;,
 ; ./asm_test/win/i/all.c:2252:             fprintf(outfile, "ret\t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC335(%rip), %rcx	 ;, tmp622
	jmp	.L1896	 ;
.L1800:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_384
.L1717:
 ; ./asm_test/win/i/all.c:2255:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2255:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_384
	jne	.L1717	 ;,
 ; ./asm_test/win/i/all.c:2256:             fprintf(outfile, "call\t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC336(%rip), %rcx	 ;, tmp623
	jmp	.L1896	 ;
.L1801:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_352
.L1716:
 ; ./asm_test/win/i/all.c:2259:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2259:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_352
	jne	.L1716	 ;,
 ; ./asm_test/win/i/all.c:2260:             fprintf(outfile, "load\t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC337(%rip), %rcx	 ;, tmp624
	jmp	.L1896	 ;
.L1802:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_451
.L1715:
 ; ./asm_test/win/i/all.c:2263:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2263:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_451
	jne	.L1715	 ;,
 ; ./asm_test/win/i/all.c:2264:             fprintf(outfile, "store\t");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC338(%rip), %rcx	 ;, tmp625
.L1896:
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:2277:     output_arg(instruction->arg1, outfile);
	movq	0(%rbp), %rcx	 ; instruction_403->arg1,
	movq	%rbx, %rdx	 ; out_tac_file,
	call	output_arg	 ;
 ; ./asm_test/win/i/all.c:2278:     switch (instruction->type) {
	movl	24(%rbp), %ecx	 ; instruction_403->type, _495
 ; ./asm_test/win/i/all.c:2278:     switch (instruction->type) {
	cmpl	$24, %ecx	 ;, _495
	jbe	.L1917	 ;,
	jmp	.L1711	 ;
.L1803:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %ebp	 ;, ivtmp_256
.L1713:
 ; ./asm_test/win/i/all.c:2267:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2267:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%rbp	 ; ivtmp_256
	jne	.L1713	 ;,
 ; ./asm_test/win/i/all.c:2268:             fprintf(outfile, "INST_NONE\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC339(%rip), %rcx	 ;, tmp626
	call	fputs	 ;
 ; ./asm_test/win/i/all.c:2270:             return;
	jmp	.L1711	 ;
.L1777:
 ; ./asm_test/win/i/all.c:2165:     switch (instruction->type) {
	movl	$20, %r14d	 ;, ivtmp_523
.L1712:
 ; ./asm_test/win/i/all.c:2272:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2272:             for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%r14	 ; ivtmp_523
	jne	.L1712	 ;,
 ; ./asm_test/win/i/all.c:2273:             fprintf(outfile, "unknown_InstructionType: %u\n", instruction->type);
	movl	24(%rbp), %r8d	 ; instruction_403->type,
	leaq	.LC340(%rip), %rdx	 ;, tmp628
	movq	%rbx, %rcx	 ; out_tac_file,
	call	fprintf	 ;
 ; ./asm_test/win/i/all.c:2275:             return;
	jmp	.L1711	 ;
.L1917:
	movq	%r15, %rax	 ; tmp659, _469
	salq	%cl, %rax	 ; _495, _469
 ; ./asm_test/win/i/all.c:2278:     switch (instruction->type) {
	testl	$4825087, %eax	 ;, _469
	jne	.L1742	 ;,
	testl	$25583616, %eax	 ;, _469
	jne	.L1743	 ;,
	testl	$3145728, %eax	 ;, _469
	jne	.L1744	 ;,
	jmp	.L1711	 ;
.L1742:
 ; ./asm_test/win/i/all.c:2296:             fprintf(outfile, " ");
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	fputc	 ;
 ; ./asm_test/win/i/all.c:2297:             output_arg(instruction->arg2, outfile);
	movq	8(%rbp), %rcx	 ; instruction_403->arg2, instruction_403->arg2
	movq	%rbx, %rdx	 ; out_tac_file,
	call	output_arg	 ;
 ; ./asm_test/win/i/all.c:2298:             fprintf(outfile, " ");
	movl	$32, %ecx	 ;,
	movq	%rbx, %rdx	 ; out_tac_file,
	call	fputc	 ;
 ; ./asm_test/win/i/all.c:2299:             output_arg(instruction->arg3, outfile);
	movq	16(%rbp), %rcx	 ; instruction_403->arg3, instruction_403->arg3
	jmp	.L1897	 ;
.L1743:
 ; ./asm_test/win/i/all.c:2307:             fprintf(outfile, " ");
	movl	$32, %ecx	 ;,
	movq	%rbx, %rdx	 ; out_tac_file,
	call	fputc	 ;
 ; ./asm_test/win/i/all.c:2308:             output_arg(instruction->arg2, outfile);
	movq	8(%rbp), %rcx	 ; instruction_403->arg2, instruction_403->arg2
.L1897:
	movq	%rbx, %rdx	 ; out_tac_file,
	call	output_arg	 ;
.L1744:
 ; ./asm_test/win/i/all.c:2317:     fprintf(outfile, "\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$10, %ecx	 ;,
	call	fputc	 ;
	jmp	.L1711	 ;
.L1916:
	movl	$16, %ebp	 ;, ivtmp_544
.L1746:
 ; ./asm_test/win/i/all.c:2126:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2126:         for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%rbp	 ; ivtmp_544
	jne	.L1746	 ;,
 ; ./asm_test/win/i/all.c:2127:         fprintf(outfile, "}\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC296(%rip), %rcx	 ;, tmp637
	jmp	.L1898	 ;
.L1915:
	movl	$12, %esi	 ;, ivtmp_306
.L1748:
 ; ./asm_test/win/i/all.c:2083:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2083:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rsi	 ; ivtmp_306
	jne	.L1748	 ;,
 ; ./asm_test/win/i/all.c:2084:         fprintf(outfile, "]\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC297(%rip), %rcx	 ;, tmp639
.L1899:
	call	fputs	 ;
	movl	$8, %esi	 ;, ivtmp_207
.L1749:
 ; ./asm_test/win/i/all.c:2086:     for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2086:     for (size_t i = 0; i < indent * 4; ++i) putc(' ', outfile);
	decq	%rsi	 ; ivtmp_207
	jne	.L1749	 ;,
 ; ./asm_test/win/i/all.c:2087:     fprintf(outfile, "}\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC296(%rip), %rcx	 ;, tmp640
	call	fputs	 ;
	jmp	.L1679	 ;
.L1912:
	movl	$4, %esi	 ;, ivtmp_208
.L1751:
 ; ./asm_test/win/i/all.c:2024:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	movq	%rbx, %rdx	 ; out_tac_file,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; ./asm_test/win/i/all.c:2024:         for (size_t i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
	decq	%rsi	 ; ivtmp_208
	jne	.L1751	 ;,
 ; ./asm_test/win/i/all.c:2025:         fprintf(outfile, "]\n");
	movq	%rbx, %rdx	 ; out_tac_file,
	leaq	.LC297(%rip), %rcx	 ;, tmp642
	jmp	.L1893	 ;
.L1577:
 ; ./asm_test/win/i/all.c:4064:     return 0;
	xorl	%eax, %eax	 ; <retval>
.L1573:
 ; ./asm_test/win/i/all.c:4065: }
	addq	$120, %rsp	 ;,
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
	.align 16
CSWTCH.123:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	14
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.align 16
CSWTCH.116:
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
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
.LC341:
	.ascii "(\0"
.LC342:
	.ascii ")\0"
.LC343:
	.ascii "{\0"
.LC344:
	.ascii "}\0"
.LC345:
	.ascii ",\0"
.LC346:
	.ascii "!\0"
.LC347:
	.ascii "[\0"
.LC348:
	.ascii "]\0"
.LC349:
	.ascii ";\0"
.LC350:
	.ascii "_\0"
.LC351:
	.ascii "+\0"
.LC352:
	.ascii "-\0"
.LC353:
	.ascii "*\0"
.LC354:
	.ascii "%\0"
.LC355:
	.ascii "<\0"
.LC356:
	.ascii ">\0"
.LC357:
	.ascii "=\0"
.LC358:
	.ascii "==\0"
.LC359:
	.ascii "!=\0"
.LC360:
	.ascii "<=\0"
.LC361:
	.ascii ">=\0"
.LC362:
	.ascii "+=\0"
.LC363:
	.ascii "-=\0"
.LC364:
	.ascii "*=\0"
.LC365:
	.ascii "/=\0"
.LC366:
	.ascii "%=\0"
.LC367:
	.ascii "&&\0"
.LC368:
	.ascii "||\0"
	.align 32
symbolStrings:
	.quad	.LC341
	.quad	.LC342
	.quad	.LC343
	.quad	.LC344
	.quad	.LC345
	.quad	.LC346
	.quad	.LC134
	.quad	.LC347
	.quad	.LC348
	.quad	.LC349
	.quad	.LC350
	.quad	.LC351
	.quad	.LC352
	.quad	.LC353
	.quad	.LC43
	.quad	.LC354
	.quad	.LC355
	.quad	.LC356
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
.LC369:
	.ascii "import\0"
.LC370:
	.ascii "from\0"
.LC371:
	.ascii "func\0"
.LC372:
	.ascii "class\0"
.LC373:
	.ascii "method\0"
.LC374:
	.ascii "self\0"
.LC375:
	.ascii "if\0"
.LC376:
	.ascii "elif\0"
.LC377:
	.ascii "else\0"
.LC378:
	.ascii "while\0"
.LC379:
	.ascii "for\0"
.LC380:
	.ascii "return\0"
.LC381:
	.ascii "break\0"
.LC382:
	.ascii "continue\0"
.LC383:
	.ascii "int\0"
.LC384:
	.ascii "float\0"
.LC385:
	.ascii "string\0"
.LC386:
	.ascii "bool\0"
.LC387:
	.ascii "var\0"
	.align 32
keywordStrings:
	.quad	.LC369
	.quad	.LC370
	.quad	.LC371
	.quad	.LC372
	.quad	.LC373
	.quad	.LC374
	.quad	.LC375
	.quad	.LC376
	.quad	.LC377
	.quad	.LC378
	.quad	.LC379
	.quad	.LC18
	.quad	.LC19
	.quad	.LC380
	.quad	.LC381
	.quad	.LC382
	.quad	.LC383
	.quad	.LC384
	.quad	.LC385
	.quad	.LC386
	.quad	.LC25
	.quad	.LC387
.lcomm initialized,1,1
	.align 8
.LC129:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Rev6, Built by MSYS2 project) 13.2.0"
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	putc;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	strncmp;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	getcwd;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
