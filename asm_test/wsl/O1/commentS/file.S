	.file	"file.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.globl	get_cwd
	.type	get_cwd, @function
get_cwd:
	subq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/unistd.h:88:   return __glibc_fortify (getcwd, __size, sizeof (char),
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*getcwd@GOTPCREL(%rip)	;
; src/file.c:11: }
	addq	$8, %rsp	;,
	ret	
	.size	get_cwd, .-get_cwd
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	""
.LC1:
	.string	"%s/%s"
	.text
	.globl	absolute_path
	.type	absolute_path, @function
absolute_path:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbx	; tmp148, path
	movq	%rsi, %r12	; tmp149, base_path
; src/file.c:23:     path = create_string_not_check(path, strlen(path));
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp150, tmp119
; src/file.c:23:     path = create_string_not_check(path, strlen(path));
	movq	%rbx, %rdi	; path,
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp151, <retval>
; src/file.c:24:     size_t path_len = strlen(path);
	movq	%rax, %rdi	; <retval>,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp122, path_len
; src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	testq	%rax, %rax	; tmp122
	je	.L4	;,
; src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	movl	$0, %edx	;, i
	jmp	.L11	;
.L24:
; src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	movb	$47, (%rcx)	;, *_2
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rdx	;, i
	jbe	.L21	;,
.L6:
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-1(%rbx,%rdx), %rdi	;, _6
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$46, (%rdi)	;, *_6
	je	.L22	;,
.L10:
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	(%rbx,%rdx), %rdi	;, _14
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, (%rdi)	;, *_14
	jne	.L9	;,
.L16:
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	-1(%rdx), %r13	;, _16
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, -1(%rbx,%rdx)	;, *_17
	jne	.L9	;,
; src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	movq	%rbp, %rax	; path_len, tmp134
	subq	%rdx, %rax	; i, tmp134
; src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	leaq	1(%rbx,%rdx), %rsi	;, tmp136
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	movq	%rax, %rdx	; tmp134,
	call	*memmove@GOTPCREL(%rip)	;
; src/file.c:34:             path_len--;
	subq	$1, %rbp	;, path_len
; src/file.c:35:             i--;
	movq	%r13, %rdx	; _16, i
	jmp	.L9	;
.L22:
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-2(%rdx), %r13	;, _8
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, -2(%rbx,%rdx)	;, *_9
	jne	.L10	;,
; src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	%rbp, %rax	; path_len, tmp128
	subq	%rdx, %rax	; i, tmp128
; src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	leaq	1(%rbx,%rdx), %rsi	;, tmp130
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	movq	%rax, %rdx	; tmp128,
	call	*memmove@GOTPCREL(%rip)	;
; src/file.c:29:             path_len -= 2;
	subq	$2, %rbp	;, path_len
; src/file.c:30:             i -= 2;
	movq	%r13, %rdx	; _8, i
.L8:
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	testq	%rdx, %rdx	; i
	jne	.L10	;,
.L9:
; src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	addq	$1, %rdx	;, i
; src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	cmpq	%rbp, %rdx	; path_len, i
	jnb	.L23	;,
.L11:
; src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	leaq	(%rbx,%rdx), %rcx	;, _2
	movzbl	(%rcx), %eax	; *_2, _3
; src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	cmpb	$92, %al	;, _3
	je	.L24	;,
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rdx	;, i
	jbe	.L8	;,
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, %al	;, _3
	jne	.L9	;,
	jmp	.L6	;
.L23:
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	cmpq	$1, %rbp	;, path_len
	jbe	.L12	;,
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	movzbl	(%rbx), %eax	; *path_50, tmp161
	subl	$65, %eax	;, tmp137
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	cmpb	$25, %al	;, tmp137
	ja	.L13	;,
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	cmpb	$58, 1(%rbx)	;, MEM[(char *)path_50 + 1B]
	je	.L25	;,
.L13:
; src/file.c:55:     if (path_len > 0 && path[0] == '/')
	cmpb	$47, (%rbx)	;, *path_50
	je	.L3	;,
.L4:
; src/file.c:57:     if (base_path == NULL)
	testq	%r12, %r12	; base_path
	je	.L26	;,
.L15:
; src/file.c:61:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	movq	%r12, %rdi	; base_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:61:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	leaq	2(%rbp,%rax), %r13	;, total_len
; src/file.c:62:     string abs_path = create_string_not_check("", total_len);
	movq	%r13, %rsi	; total_len,
	leaq	.LC0(%rip), %rdi	;, tmp145
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp155, abs_path
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%rbx, %r9	; <retval>,
	movq	%r12, %r8	; base_path,
	leaq	.LC1(%rip), %rcx	;, tmp146
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movq	%rax, %rdi	; abs_path,
	movl	$0, %eax	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/file.c:64:     return absolute_path(create_string(abs_path, total_len), NULL);
	movq	%r13, %rsi	; total_len,
	movq	%rbp, %rdi	; abs_path,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp156, _34
; src/file.c:64:     return absolute_path(create_string(abs_path, total_len), NULL);
	movl	$0, %esi	;,
	call	absolute_path	;
	movq	%rax, %rbx	; tmp157, <retval>
.L3:
; src/file.c:65: }
	movq	%rbx, %rax	; <retval>,
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L25:
; src/file.c:47:         memmove(path, path + 1, path_len);
	leaq	1(%rbx), %rsi	;, tmp140
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	movq	%rbp, %rdx	; path_len,
	movq	%rbx, %rdi	; <retval>,
	call	*memmove@GOTPCREL(%rip)	;
; src/file.c:48:         path[0] = '/';
	movb	$47, (%rbx)	;, *path_50
; src/file.c:49:         path[2] = '/';
	movb	$47, 2(%rbx)	;, MEM[(char *)path_50 + 2B]
; src/file.c:50:         return path;
	jmp	.L3	;
.L12:
; src/file.c:55:     if (path_len > 0 && path[0] == '/')
	testq	%rbp, %rbp	; path_len
	je	.L4	;,
	jmp	.L13	;
.L26:
; /usr/include/x86_64-linux-gnu/bits/unistd.h:88:   return __glibc_fortify (getcwd, __size, sizeof (char),
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*getcwd@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp153, base_path
; src/file.c:59:     if (base_path == NULL)
	testq	%rax, %rax	; base_path
	jne	.L15	;,
	jmp	.L3	;
.L21:
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	testq	%rdx, %rdx	; i
	je	.L9	;,
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	(%rbx,%rdx), %rdi	;, _14
	jmp	.L16	;
	.size	absolute_path, .-absolute_path
	.section	.rodata.str1.1
.LC2:
	.string	"/"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"Warning: Path component too long, truncating to %zu characters\n"
	.section	.rodata.str1.1
.LC4:
	.string	"."
.LC5:
	.string	".."
	.text
	.globl	create_file
	.type	create_file, @function
create_file:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$296, %rsp	;,
	movq	%rdi, %rbx	; tmp213, path
; src/file.c:16:     File* file = (File*)alloc_memory(sizeof(File));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp214, <retval>
; src/file.c:17:     file->path = absolute_path(path, NULL);
	movl	$0, %esi	;,
	movq	%rbx, %rdi	; path,
	call	absolute_path	;
	movq	%rax, %rdi	; tmp215, _1
; src/file.c:17:     file->path = absolute_path(path, NULL);
	movq	%rax, 24(%r15)	; _1, file_4->path
; src/file.c:172:     size_t path_len = strlen(file->path);
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp216, tmp145
; src/file.c:175:     string path_copy = create_string_not_check("", path_len + 1);
	leaq	1(%rax), %rsi	;, tmp147
	leaq	.LC0(%rip), %rdi	;, tmp148
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp217, path_copy
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	movq	24(%r15), %rsi	; file_4->path, file_4->path
	movq	%rax, %rdi	; path_copy,
	call	*strcpy@GOTPCREL(%rip)	;
; src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	testq	%r12, %r12	; tmp145
	je	.L49	;,
; src/file.c:181:     size_t start = 0;
	movl	$0, %ebx	;, start
; src/file.c:178:     StrNode* dirs_head = NULL;
	movq	$0, 8(%rsp)	;, %sfp
; src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	cmpb	$47, (%r14)	;, *path_copy_12
	jne	.L28	;,
; src/file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp218, node
	movq	%rax, 8(%rsp)	; node, %sfp
; src/file.c:199:         node->dir = create_string("/", 1);
	movl	$1, %esi	;,
	leaq	.LC2(%rip), %rdi	;, tmp150
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:199:         node->dir = create_string("/", 1);
	movq	%rax, (%rbx)	; tmp219, node_16->dir
; src/file.c:200:         node->next = 0;
	movq	$0, 8(%rbx)	;, node_16->next
; src/file.c:204:         start = 1;
	movl	$1, %ebx	;, start
	jmp	.L28	;
.L62:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$255, %ecx	;,
	leaq	.LC3(%rip), %rdx	;, tmp152
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/file.c:215:                     comp_len = componentMaxSize - 1;
	movq	$255, 16(%rsp)	;, %sfp
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L32	;
.L51:
; src/file.c:236:                             StrNode* prev = dirs_head;
	movq	%rbp, %rax	; node, prev
	jmp	.L36	;
.L52:
; src/file.c:238:                                 prev = prev->next;
	movq	%rdx, %rax	; _38, prev
.L36:
; src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	testq	%rax, %rax	; prev
	je	.L31	;,
; src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	movq	8(%rax), %rdx	; prev_37->next, _38
; src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	movq	8(%rsp), %rcx	; %sfp, node
	cmpq	%rcx, %rdx	; node, _38
	jne	.L52	;,
; src/file.c:241:                                 prev->next = 0;
	movq	$0, 8(%rax)	;, prev_37->next
; src/file.c:242:                                 dirs_tail = prev;
	movq	%rax, 8(%rsp)	; prev, %sfp
	jmp	.L31	;
.L35:
; src/file.c:245:                     } else if (dirs_head == NULL) {
	testq	%rbp, %rbp	; node
	jne	.L31	;,
; src/file.c:247:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp225, node
; src/file.c:248:                         node->dir = create_string("..", 2);
	movl	$2, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp172
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:248:                         node->dir = create_string("..", 2);
	movq	%rax, 0(%rbp)	; tmp226, node_39->dir
; src/file.c:249:                         node->next = 0;
	movq	$0, 8(%rbp)	;, node_39->next
; src/file.c:251:                         dirs_tail = node;
	movq	%rbp, 8(%rsp)	; node, %sfp
	jmp	.L31	;
.L34:
; src/file.c:253:                 } else if (strlen(component) > 0) {
	cmpb	$0, 32(%rsp)	;, MEM[(const char *)&component]
	jne	.L60	;,
.L31:
; src/file.c:266:             start = i + 1;
	leaq	1(%rbx), %r13	;, start
.L30:
; src/file.c:268:         i++;
	leaq	1(%rbx), %rax	;, i
; src/file.c:210:     while (i <= path_len) {
	cmpq	%rbx, %r12	; start, tmp145
	je	.L61	;,
	movq	%rax, %rbx	; i, start
.L39:
; src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpq	%rbx, %r12	; start, tmp145
	je	.L29	;,
; src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpb	$47, (%r14,%rbx)	;, MEM[(char *)path_copy_12 + i_150 * 1]
	jne	.L30	;,
.L29:
; src/file.c:212:             if (i > start) {
	cmpq	%rbx, %r13	; start, start
	jnb	.L31	;,
; src/file.c:213:                 size_t comp_len = i - start;
	movq	%rbx, %rax	; start, comp_len
	subq	%r13, %rax	; start, comp_len
	movq	%rax, 16(%rsp)	; comp_len, %sfp
; src/file.c:214:                 if (comp_len >= componentMaxSize) {
	cmpq	$255, %rax	;, comp_len
	ja	.L62	;,
.L32:
; src/file.c:219:                 strncpy(component, path_copy + start, comp_len);
	leaq	(%r14,%r13), %rsi	;, tmp153
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:95:   return __builtin___strncpy_chk (__dest, __src, __len,
	movq	16(%rsp), %rdx	; %sfp,
	movq	24(%rsp), %r13	; %sfp, tmp210
	movq	%r13, %rdi	; tmp210,
	call	*strncpy@GOTPCREL(%rip)	;
; src/file.c:220:                 component[comp_len] = '\0';
	movq	16(%rsp), %rax	; %sfp, comp_len
	movb	$0, 32(%rsp,%rax)	;, component[comp_len_25]
; src/file.c:222:                 if (strcmp(component, ".") == 0) {
	leaq	.LC4(%rip), %rsi	;,
	movq	%r13, %rdi	; tmp210,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:222:                 if (strcmp(component, ".") == 0) {
	testl	%eax, %eax	; tmp220
	je	.L31	;,
; src/file.c:224:                 } else if (strcmp(component, "..") == 0) {
	leaq	.LC5(%rip), %rsi	;,
	movq	%r13, %rdi	; tmp210,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:224:                 } else if (strcmp(component, "..") == 0) {
	testl	%eax, %eax	; tmp221
	jne	.L34	;,
; src/file.c:226:                     if (dirs_tail != NULL && dirs_tail != dirs_head) {
	movq	8(%rsp), %rax	; %sfp, node
	testq	%rax, %rax	; node
	je	.L35	;,
	cmpq	%rbp, %rax	; node, node
	je	.L35	;,
; src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	movq	(%rax), %rdi	; dirs_tail_152->dir, dirs_tail_152->dir
	leaq	.LC5(%rip), %rsi	;, tmp170
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	testl	%eax, %eax	; tmp222
	jne	.L51	;,
; src/file.c:229:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp223, node
; src/file.c:230:                             node->dir = create_string("..", 2);
	movl	$2, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp171
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:230:                             node->dir = create_string("..", 2);
	movq	%rax, 0(%r13)	; tmp224, node_35->dir
; src/file.c:231:                             node->next = 0;
	movq	$0, 8(%r13)	;, node_35->next
; src/file.c:232:                             dirs_tail->next = node;
	movq	8(%rsp), %rax	; %sfp, node
	movq	%r13, 8(%rax)	; node, dirs_tail_152->next
; src/file.c:233:                             dirs_tail = node;
	movq	%r13, 8(%rsp)	; node, %sfp
	jmp	.L31	;
.L60:
; src/file.c:255:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp227, node
; src/file.c:256:                     node->dir = create_string(component, comp_len);
	leaq	32(%rsp), %rdi	;, tmp173
	movq	16(%rsp), %rsi	; %sfp,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:256:                     node->dir = create_string(component, comp_len);
	movq	%rax, 0(%r13)	; tmp228, node_42->dir
; src/file.c:257:                     node->next = 0;
	movq	$0, 8(%r13)	;, node_42->next
; src/file.c:259:                     if (dirs_tail != NULL)
	movq	8(%rsp), %rax	; %sfp, node
	testq	%rax, %rax	; node
	je	.L38	;,
; src/file.c:260:                         dirs_tail->next = node;
	movq	%r13, 8(%rax)	; node, dirs_tail_152->next
.L38:
; src/file.c:263:                     if (dirs_head == NULL) dirs_head = node;
	testq	%rbp, %rbp	; node
	je	.L53	;,
; src/file.c:262:                     dirs_tail = node;
	movq	%r13, 8(%rsp)	; node, %sfp
	jmp	.L31	;
.L53:
	movq	%r13, 8(%rsp)	; node, %sfp
; src/file.c:263:                     if (dirs_head == NULL) dirs_head = node;
	movq	%r13, %rbp	; node, node
	jmp	.L31	;
.L61:
; src/file.c:272:     file->dirs = dirs_head;
	movq	%rbp, (%r15)	; node, file_4->dirs
; src/file.c:275:     if (dirs_tail != NULL) {
	movq	8(%rsp), %rax	; %sfp, node
	testq	%rax, %rax	; node
	je	.L40	;,
; src/file.c:276:         string dot = strrchr(dirs_tail->dir, '.');
	movq	(%rax), %r12	; dirs_tail_88->dir, _46
; src/file.c:276:         string dot = strrchr(dirs_tail->dir, '.');
	movl	$46, %esi	;,
	movq	%r12, %rdi	; _46,
	call	*strrchr@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp229, dot
; src/file.c:278:         if (dot != NULL && dot != dirs_tail->dir) {
	cmpq	%rax, %r12	; dot, _46
	je	.L41	;,
	testq	%rax, %rax	; dot
	je	.L41	;,
; src/file.c:280:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	%rax, %rsi	; dot, name_len
	subq	%r12, %rsi	; _46, name_len
; src/file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%r12, %rdi	; _46,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%rax, 16(%r15)	; tmp230, file_4->name
; src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%rbx, %rdi	; dot,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp231, tmp180
; src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%rbx, %rdi	; dot,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp232, %sfp
; src/file.c:278:         if (dot != NULL && dot != dirs_tail->dir) {
	jmp	.L42	;
.L41:
; src/file.c:285:             file->name = dirs_tail->dir;
	movq	%r12, 16(%r15)	; _46, file_4->name
	movq	$0, 8(%rsp)	;, %sfp
.L42:
; src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	8(%rsp), %rax	; %sfp, node
	movq	%rax, 8(%r15)	; node, file_4->extension
; src/file.c:298:     while (current != NULL) {
	testq	%rbp, %rbp	; node
	je	.L43	;,
; src/file.c:295:     StrNode* current = dirs_head;
	movq	%rbp, %rbx	; node, current
; src/file.c:296:     size_t node_count = 0;
	movl	$0, %r12d	;, node_count
; src/file.c:294:     size_t full_path_len = 0;
	movl	$0, %r13d	;, full_path_len
.L44:
; src/file.c:299:         full_path_len += strlen(current->dir);
	movq	(%rbx), %rdi	; current_156->dir, current_156->dir
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:299:         full_path_len += strlen(current->dir);
	addq	%rax, %r13	; tmp233, full_path_len
	movq	%r12, %rax	; node_count, node_count
; src/file.c:300:         node_count++;
	addq	$1, %r12	;, node_count
; src/file.c:301:         current = current->next;
	movq	8(%rbx), %rbx	; current_156->next, current
; src/file.c:298:     while (current != NULL) {
	testq	%rbx, %rbx	; current
	jne	.L44	;,
; src/file.c:306:         full_path_len += (node_count - 1);
	addq	%r13, %rax	; full_path_len, tmp204
	cmpq	$1, %r12	;, node_count
	cmova	%rax, %r13	; tmp204,, full_path_len
; src/file.c:308:     string full_path = create_string_not_check("", full_path_len + 1);
	leaq	1(%r13), %rsi	;, tmp200
	leaq	.LC0(%rip), %rdi	;, tmp201
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp234, full_path
; src/file.c:309:     full_path[0] = '\0';
	movb	$0, (%rax)	;, *full_path_53
	movl	$1, %eax	;, is_first
; src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	leaq	.LC2(%rip), %r12	;, tmp209
	jmp	.L47	;
.L40:
; src/file.c:289:         file->name = NULL;
	movq	$0, 16(%r15)	;, file_4->name
	jmp	.L42	;
.L46:
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movq	0(%rbp), %rsi	; current_162->dir, current_162->dir
	movq	%rbx, %rdi	; full_path,
	call	*strcat@GOTPCREL(%rip)	;
; src/file.c:322:         current = current->next;
	movq	8(%rbp), %rbp	; current_162->next, node
	movl	$0, %eax	;, is_first
; src/file.c:313:     while (current != NULL) {
	testq	%rbp, %rbp	; node
	je	.L48	;,
.L47:
; src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testb	%al, %al	; is_first
	jne	.L46	;,
; src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	0(%rbp), %rdi	; current_162->dir, current_162->dir
	movq	%r12, %rsi	; tmp209,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testl	%eax, %eax	; tmp235
	je	.L46	;,
; src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$0, (%rbx)	;, MEM[(const char *)full_path_53]
	je	.L46	;,
; src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	movq	%rbx, %rdi	; full_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$47, -1(%rbx,%rax)	;, *_73
	je	.L46	;,
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movw	$47, (%rbx,%rax)	;, MEM <char[1:2]> [(void *)_140]
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	jmp	.L46	;
.L43:
; src/file.c:308:     string full_path = create_string_not_check("", full_path_len + 1);
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp199
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp239, full_path
; src/file.c:309:     full_path[0] = '\0';
	movb	$0, (%rax)	;, *full_path_131
.L48:
; src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%rbx, %rdi	; full_path,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp237, tmp196
; src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%rbx, %rdi	; full_path,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, 24(%r15)	; tmp238, file_4->path
; src/file.c:20: }
	movq	%r15, %rax	; <retval>,
	addq	$296, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L49:
; src/file.c:181:     size_t start = 0;
	movq	%r12, %rbx	; tmp145, start
; src/file.c:178:     StrNode* dirs_head = NULL;
	movq	$0, 8(%rsp)	;, %sfp
.L28:
	movq	8(%rsp), %rbp	; %sfp, node
	movq	%rbx, %r13	; start, start
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:95:   return __builtin___strncpy_chk (__dest, __src, __len,
	leaq	32(%rsp), %rax	;, tmp270
	movq	%rax, 24(%rsp)	; tmp270, %sfp
	jmp	.L39	;
	.size	create_file, .-create_file
	.globl	get_file_name
	.type	get_file_name, @function
get_file_name:
; src/file.c:68:     return path->name;
	movq	16(%rdi), %rax	; path_2(D)->name, path_2(D)->name
; src/file.c:69: }
	ret	
	.size	get_file_name, .-get_file_name
	.globl	get_file_extension
	.type	get_file_extension, @function
get_file_extension:
; src/file.c:72:     return path->extension;
	movq	8(%rdi), %rax	; path_2(D)->extension, path_2(D)->extension
; src/file.c:73: }
	ret	
	.size	get_file_extension, .-get_file_extension
	.globl	get_file_dir
	.type	get_file_dir, @function
get_file_dir:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/file.c:76:     if (path->dirs == NULL) return 0;
	movq	(%rdi), %rax	; path_30(D)->dirs, _1
; src/file.c:76:     if (path->dirs == NULL) return 0;
	testq	%rax, %rax	; _1
	je	.L73	;,
	movq	%rdi, %r13	; tmp129, path
; src/file.c:80:     size_t node_count = 0;
	movl	$0, %r12d	;, node_count
; src/file.c:79:     size_t total_len = 0;
	movl	$0, %ebp	;, total_len
	jmp	.L68	;
.L76:
; src/file.c:84:             size_t dir_len = strlen(current->dir);
	movq	(%rax), %rdi	; current_57->dir, current_57->dir
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:85:             total_len += dir_len;
	addq	%rax, %rbp	; tmp130, total_len
; src/file.c:86:             node_count++;
	addq	$1, %r12	;, node_count
	movq	%rbx, %rax	; <retval>, _1
.L68:
; src/file.c:83:         if (current->next != NULL) {  // Not the last element (which is the filename)
	movq	8(%rax), %rbx	; current_57->next, <retval>
; src/file.c:83:         if (current->next != NULL) {  // Not the last element (which is the filename)
	testq	%rbx, %rbx	; <retval>
	jne	.L76	;,
; src/file.c:91:     if (node_count == 0) return NULL;
	testq	%r12, %r12	; node_count
	je	.L65	;,
; src/file.c:95:         total_len += node_count - 1;
	leaq	-1(%rbp,%r12), %rax	;, tmp125
	cmpq	$1, %r12	;, node_count
	cmova	%rax, %rbp	; tmp125,, total_len
; src/file.c:98:     string dir_path = create_string_not_check("", total_len + 1);
	leaq	1(%rbp), %rsi	;, tmp109
	leaq	.LC0(%rip), %rdi	;, tmp110
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp131, dir_path
; src/file.c:99:     dir_path[0] = '\0';
	movb	$0, (%rax)	;, *dir_path_33
; src/file.c:101:     current = path->dirs;
	movq	0(%r13), %rbx	; path_30(D)->dirs, current
; src/file.c:103:     while (current != NULL) {
	testq	%rbx, %rbx	; current
	je	.L70	;,
; src/file.c:102:     bool first = true;
	movl	$1, %eax	;, first
; src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	leaq	.LC2(%rip), %r12	;, tmp128
	jmp	.L72	;
.L71:
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movq	(%rbx), %rsi	; current_58->dir, current_58->dir
	movq	%rbp, %rdi	; dir_path,
	call	*strcat@GOTPCREL(%rip)	;
; src/file.c:113:         current = current->next;
	movq	8(%rbx), %rbx	; current_58->next, current
	movl	$0, %eax	;, first
; src/file.c:103:     while (current != NULL) {
	testq	%rbx, %rbx	; current
	je	.L70	;,
.L72:
; src/file.c:104:         if (current->next != NULL) {  // Not the last element
	cmpq	$0, 8(%rbx)	;, current_58->next
	je	.L70	;,
; src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	testb	%al, %al	; first
	jne	.L71	;,
; src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	movq	(%rbx), %rdi	; current_58->dir, current_58->dir
	movq	%r12, %rsi	; tmp128,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	testl	%eax, %eax	; tmp132
	je	.L71	;,
; src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$0, 0(%rbp)	;, MEM[(const char *)dir_path_33]
	je	.L71	;,
; src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	movq	%rbp, %rdi	; dir_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$47, -1(%rbp,%rax)	;, *_12
	je	.L71	;,
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movw	$47, 0(%rbp,%rax)	;, MEM <char[1:2]> [(void *)_48]
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	jmp	.L71	;
.L70:
; src/file.c:116:     return create_string(dir_path, strlen(dir_path));
	movq	%rbp, %rdi	; dir_path,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp134, tmp121
; src/file.c:116:     return create_string(dir_path, strlen(dir_path));
	movq	%rbp, %rdi	; dir_path,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp135, <retval>
.L65:
; src/file.c:117: }
	movq	%rbx, %rax	; <retval>,
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L73:
; src/file.c:76:     if (path->dirs == NULL) return 0;
	movq	%rax, %rbx	; _1, <retval>
	jmp	.L65	;
	.size	get_file_dir, .-get_file_dir
	.section	.rodata.str1.1
.LC6:
	.string	"%s/%s%s"
.LC7:
	.string	"%s%s"
	.text
	.type	rebuild_full_path, @function
rebuild_full_path:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp133, file
; src/file.c:124:     string dir = get_file_dir(file);
	call	get_file_dir	;
	movq	%rax, %rbp	; tmp134, dir
; src/file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	; dir
	leaq	.LC0(%rip), %r13	;, tmp132
	cmovne	%rax, %r13	; dir,, iftmp.4_14
; src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rbx), %r14	; file_18(D)->extension, _1
; src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%r14, %r14	; _1
	je	.L88	;,
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%r13, %rdi	; iftmp.4_14,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp138, tmp114
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rdi	; file_18(D)->name, file_18(D)->name
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%r12,%rax), %r12	;, path_len
; src/file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	movq	%r14, %rdi	; _1,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	leaq	(%rax,%r12), %rsi	;, path_len
.L83:
; src/file.c:131:     string new_path = create_string_not_check("", path_len + 1);
	addq	$1, %rsi	;, tmp104
	leaq	.LC0(%rip), %rdi	;, tmp105
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp135, new_path
; src/file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	testq	%rbp, %rbp	; dir
	je	.L81	;,
; src/file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpb	$0, 0(%r13)	;, MEM[(const char *)iftmp.4_14]
	jne	.L89	;,
.L81:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r14, %r9	; _1,
	movq	16(%rbx), %r8	; file_18(D)->name,
	leaq	.LC7(%rip), %rcx	;, tmp109
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movq	%r12, %rdi	; new_path,
	movl	$0, %eax	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L82:
; src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%r12, %rdi	; new_path,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp136, tmp111
; src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%r12, %rdi	; new_path,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, 24(%rbx)	; tmp137, file_18(D)->path
; src/file.c:138: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L89:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	subq	$8, %rsp	;,
	pushq	%r14	; _1
	movq	16(%rbx), %r9	; file_18(D)->name,
	movq	%r13, %r8	; iftmp.4_14,
	leaq	.LC6(%rip), %rcx	;, tmp107
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movq	%rax, %rdi	; new_path,
	movl	$0, %eax	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	addq	$16, %rsp	;,
	jmp	.L82	;
.L88:
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%r13, %rdi	; iftmp.4_14,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp141, tmp125
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rdi	; file_18(D)->name, file_18(D)->name
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%r12,%rax), %rsi	;, path_len
; src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	leaq	.LC0(%rip), %r14	;, _1
	jmp	.L83	;
	.size	rebuild_full_path, .-rebuild_full_path
	.globl	get_full_path
	.type	get_full_path, @function
get_full_path:
; src/file.c:120:     return path->path;
	movq	24(%rdi), %rax	; path_2(D)->path, path_2(D)->path
; src/file.c:121: }
	ret	
	.size	get_full_path, .-get_full_path
	.globl	change_file_extension
	.type	change_file_extension, @function
change_file_extension:
	subq	$8, %rsp	;,
; src/file.c:141:     file->extension = new_extension;
	movq	%rsi, 8(%rdi)	; tmp85, file_2(D)->extension
; src/file.c:142:     rebuild_full_path(file);
	call	rebuild_full_path	;
; src/file.c:143: }
	addq	$8, %rsp	;,
	ret	
	.size	change_file_extension, .-change_file_extension
	.globl	change_file_name
	.type	change_file_name, @function
change_file_name:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbp	; tmp109, file
	movq	%rsi, %r12	; tmp110, new_name
; src/file.c:146:     file->name = new_name;
	movq	%rsi, 16(%rdi)	; new_name, file_13(D)->name
; src/file.c:149:     if (file->dirs != NULL) {
	movq	(%rdi), %rax	; file_13(D)->dirs, _2
; src/file.c:149:     if (file->dirs != NULL) {
	testq	%rax, %rax	; _2
	je	.L95	;,
.L94:
	movq	%rax, %rbx	; _2, current
; src/file.c:153:             if (current->next == NULL) {
	movq	8(%rax), %rax	; current_8->next, _2
; src/file.c:153:             if (current->next == NULL) {
	testq	%rax, %rax	; _2
	jne	.L94	;,
; src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rbp), %r14	; file_13(D)->extension, _3
; src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%r14, %r14	; _3
	je	.L104	;,
; src/file.c:156:                 size_t full_name_len = strlen(new_name);
	movq	%r12, %rdi	; new_name,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp114, tmp101
; src/file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	movq	%r14, %rdi	; _3,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	leaq	(%rax,%r13), %rsi	;, full_name_len
.L99:
; src/file.c:159:                 string full_name = create_string_not_check("", full_name_len + 1);
	addq	$1, %rsi	;, tmp94
	leaq	.LC0(%rip), %rdi	;, tmp95
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp111, full_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r14, %r9	; _3,
	movq	%r12, %r8	; new_name,
	leaq	.LC7(%rip), %rcx	;, tmp96
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movq	%rax, %rdi	; full_name,
	movl	$0, %eax	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%r13, %rdi	; full_name,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp112, tmp98
; src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%r13, %rdi	; full_name,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rax, (%rbx)	; tmp113, current_26->dir
.L95:
; src/file.c:168:     rebuild_full_path(file);
	movq	%rbp, %rdi	; file,
	call	rebuild_full_path	;
; src/file.c:169: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L104:
; src/file.c:156:                 size_t full_name_len = strlen(new_name);
	movq	%r12, %rdi	; new_name,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp116, full_name_len
; src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	leaq	.LC0(%rip), %r14	;, _3
	jmp	.L99	;
	.size	change_file_name, .-change_file_name
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
