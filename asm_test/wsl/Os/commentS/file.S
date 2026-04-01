	.file	"file.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.globl	get_cwd
	.type	get_cwd, @function
get_cwd:
; /usr/include/x86_64-linux-gnu/bits/unistd.h:88:   return __glibc_fortify (getcwd, __size, sizeof (char),
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	jmp	*getcwd@GOTPCREL(%rip)	;
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
	pushq	%r14	;
	pushq	%r13	;
; src/file.c:62:     string abs_path = create_string_not_check("", total_len);
	leaq	.LC0(%rip), %r13	;, tmp147
; src/file.c:22: string absolute_path(string path, string base_path) {
	pushq	%r12	;
	movq	%rsi, %r12	; tmp149, base_path
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$16, %rsp	;,
.L20:
; src/file.c:23:     path = create_string_not_check(path, strlen(path));
	movq	%rdi, 8(%rsp)	; path, %sfp
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:23:     path = create_string_not_check(path, strlen(path));
	movq	8(%rsp), %rdi	; %sfp, path
; src/file.c:23:     path = create_string_not_check(path, strlen(path));
	movq	%rax, %rsi	; tmp150, tmp118
; src/file.c:23:     path = create_string_not_check(path, strlen(path));
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp151, <retval>
; src/file.c:24:     size_t path_len = strlen(path);
	movq	%rax, %rdi	; <retval>,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp152, path_len
; src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	xorl	%eax, %eax	; i
.L3:
; src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	cmpq	%rbp, %rax	; path_len, i
	jnb	.L35	;,
; src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	leaq	(%rbx,%rax), %rcx	;, _2
	movb	(%rcx), %dl	; *_2, _3
; src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	cmpb	$92, %dl	;, _3
	jne	.L4	;,
; src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	movb	$47, (%rcx)	;, *_2
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rax	;, i
	jbe	.L9	;,
.L10:
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-1(%rbx,%rax), %rdi	;, _6
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$46, (%rdi)	;, *_6
	jne	.L11	;,
	jmp	.L36	;
.L4:
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rax	;, i
	jbe	.L9	;,
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, %dl	;, _3
	jne	.L11	;,
	jmp	.L10	;
.L36:
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, -2(%rbx,%rax)	;, *_9
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-2(%rax), %r14	;, _8
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	jne	.L11	;,
; src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	%rbp, %rdx	; path_len, tmp127
; src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	leaq	1(%rbx,%rax), %rsi	;, tmp129
; src/file.c:29:             path_len -= 2;
	subq	$2, %rbp	;, path_len
; src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	subq	%rax, %rdx	; i, tmp127
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	call	*memmove@GOTPCREL(%rip)	;
; src/file.c:30:             i -= 2;
	movq	%r14, %rax	; _8, i
.L9:
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	testq	%rax, %rax	; i
	je	.L12	;,
.L11:
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	(%rbx,%rax), %rdi	;, _14
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, (%rdi)	;, *_14
	jne	.L12	;,
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, -1(%rbx,%rax)	;, *_17
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	-1(%rax), %r14	;, _16
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	jne	.L12	;,
; src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	movq	%rbp, %rdx	; path_len, tmp133
; src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	leaq	1(%rbx,%rax), %rsi	;, tmp135
; src/file.c:34:             path_len--;
	decq	%rbp	; path_len
; src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	subq	%rax, %rdx	; i, tmp133
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	call	*memmove@GOTPCREL(%rip)	;
; src/file.c:35:             i--;
	movq	%r14, %rax	; _16, i
.L12:
; src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	incq	%rax	; i
	jmp	.L3	;
.L35:
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	cmpq	$1, %rbp	;, path_len
	jbe	.L14	;,
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	movb	(%rbx), %al	; *path_52, tmp160
	subl	$65, %eax	;, tmp136
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	cmpb	$25, %al	;, tmp136
	ja	.L15	;,
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	cmpb	$58, 1(%rbx)	;, MEM[(char *)path_52 + 1B]
	jne	.L16	;,
; src/file.c:47:         memmove(path, path + 1, path_len);
	leaq	1(%rbx), %rsi	;, tmp139
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	movq	%rbp, %rdx	; path_len,
	movq	%rbx, %rdi	; <retval>,
	call	*memmove@GOTPCREL(%rip)	;
; src/file.c:48:         path[0] = '/';
	movb	$47, (%rbx)	;, *path_52
; src/file.c:49:         path[2] = '/';
	movb	$47, 2(%rbx)	;, MEM[(char *)path_52 + 2B]
; src/file.c:50:         return path;
	jmp	.L2	;
.L14:
; src/file.c:55:     if (path_len > 0 && path[0] == '/')
	testq	%rbp, %rbp	; path_len
	je	.L16	;,
.L15:
; src/file.c:55:     if (path_len > 0 && path[0] == '/')
	cmpb	$47, (%rbx)	;, *path_52
	je	.L2	;,
.L16:
; src/file.c:57:     if (base_path == NULL)
	testq	%r12, %r12	; base_path
	jne	.L18	;,
; src/file.c:58:         base_path = get_cwd();
	call	get_cwd	;
	movq	%rax, %r12	; tmp153, base_path
; src/file.c:59:     if (base_path == NULL)
	testq	%rax, %rax	; base_path
	je	.L2	;,
.L18:
; src/file.c:61:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	movq	%r12, %rdi	; base_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:62:     string abs_path = create_string_not_check("", total_len);
	movq	%r13, %rdi	; tmp147,
; src/file.c:61:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	leaq	2(%rbp,%rax), %r14	;, total_len
; src/file.c:62:     string abs_path = create_string_not_check("", total_len);
	movq	%r14, %rsi	; total_len,
	call	*create_string_not_check@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r12, %r8	; base_path,
	movq	%rbx, %r9	; <retval>,
	orq	$-1, %rdx	;,
; src/file.c:62:     string abs_path = create_string_not_check("", total_len);
	movq	%rax, %rbp	; tmp155, abs_path
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%rax, %rdi	; abs_path,
	leaq	.LC1(%rip), %rcx	;, tmp146
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
; src/file.c:64:     return absolute_path(create_string(abs_path, total_len), NULL);
	xorl	%r12d, %r12d	; base_path
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/file.c:64:     return absolute_path(create_string(abs_path, total_len), NULL);
	movq	%rbp, %rdi	; abs_path,
	movq	%r14, %rsi	; total_len,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp156, path
	jmp	.L20	;
.L2:
; src/file.c:65: }
	addq	$16, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	absolute_path, .-absolute_path
	.section	.rodata.str1.1
.LC2:
	.string	"/"
.LC3:
	.string	"Warning: Path component too long, truncating to %zu characters\n"
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
	movq	%rdi, %rbx	; tmp202, path
; src/file.c:16:     File* file = (File*)alloc_memory(sizeof(File));
	movl	$32, %edi	;,
; src/file.c:15: File* create_file(const string path) {
	subq	$296, %rsp	;,
; src/file.c:16:     File* file = (File*)alloc_memory(sizeof(File));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/file.c:17:     file->path = absolute_path(path, NULL);
	xorl	%esi, %esi	;
	movq	%rbx, %rdi	; path,
; src/file.c:16:     File* file = (File*)alloc_memory(sizeof(File));
	movq	%rax, %rbp	; tmp203, <retval>
; src/file.c:17:     file->path = absolute_path(path, NULL);
	call	absolute_path	;
	movq	%rax, %rdi	; tmp204, _1
; src/file.c:17:     file->path = absolute_path(path, NULL);
	movq	%rax, 24(%rbp)	; _1, file_4->path
; src/file.c:172:     size_t path_len = strlen(file->path);
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:175:     string path_copy = create_string_not_check("", path_len + 1);
	leaq	.LC0(%rip), %rdi	;,
	leaq	1(%rax), %rsi	;, tmp145
; src/file.c:172:     size_t path_len = strlen(file->path);
	movq	%rax, 16(%rsp)	; tmp205, %sfp
; src/file.c:175:     string path_copy = create_string_not_check("", path_len + 1);
	call	*create_string_not_check@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	movq	24(%rbp), %rsi	; file_4->path, file_4->path
; src/file.c:175:     string path_copy = create_string_not_check("", path_len + 1);
	movq	%rax, %r13	; tmp206, path_copy
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	movq	%rax, %rdi	; path_copy,
	call	*strcpy@GOTPCREL(%rip)	;
; src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	cmpq	$0, 16(%rsp)	;, %sfp
	je	.L59	;,
; src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	cmpb	$47, 0(%r13)	;, *path_copy_12
	jne	.L59	;,
; src/file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/file.c:199:         node->dir = create_string("/", 1);
	leaq	.LC2(%rip), %rdi	;, tmp148
	movl	$1, %esi	;,
; src/file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %r14	; tmp207, dirs_tail
; src/file.c:199:         node->dir = create_string("/", 1);
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:200:         node->next = 0;
	xorl	%edi, %edi	;
; src/file.c:204:         start = 1;
	movl	$1, %r9d	;, start
; src/file.c:199:         node->dir = create_string("/", 1);
	movq	%rax, (%r14)	; tmp208, node_16->dir
; src/file.c:200:         node->next = 0;
	movq	%rdi, 8(%r14)	;, node_16->next
	jmp	.L38	;
.L59:
; src/file.c:181:     size_t start = 0;
	xorl	%r9d, %r9d	; start
; src/file.c:178:     StrNode* dirs_head = NULL;
	xorl	%r14d, %r14d	; dirs_tail
.L38:
; src/file.c:209:     size_t i = start;
	movq	%r9, %r12	; start, i
; src/file.c:210:     while (i <= path_len) {
	movq	%r14, %rbx	; dirs_tail, node
.L39:
; src/file.c:210:     while (i <= path_len) {
	cmpq	%r12, 16(%rsp)	; i, %sfp
	jb	.L92	;,
; src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	je	.L40	;,
; src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpb	$47, 0(%r13,%r12)	;, MEM[(char *)path_copy_12 + i_18 * 1]
	jne	.L41	;,
.L40:
; src/file.c:212:             if (i > start) {
	cmpq	%r12, %r9	; i, start
	jnb	.L42	;,
; src/file.c:213:                 size_t comp_len = i - start;
	movq	%r12, %r15	; i, comp_len
	subq	%r9, %r15	; start, comp_len
; src/file.c:214:                 if (comp_len >= componentMaxSize) {
	cmpq	$255, %r15	;, comp_len
	jbe	.L43	;,
	movq	%r9, 8(%rsp)	; start, %sfp
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	xorl	%eax, %eax	;
	movl	$255, %ecx	;,
	leaq	.LC3(%rip), %rdx	;, tmp150
	movl	$2, %esi	;,
; src/file.c:215:                     comp_len = componentMaxSize - 1;
	movl	$255, %r15d	;, comp_len
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/file.c:215:                     comp_len = componentMaxSize - 1;
	movq	8(%rsp), %r9	; %sfp, start
.L43:
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:95:   return __builtin___strncpy_chk (__dest, __src, __len,
	leaq	32(%rsp), %rax	;, tmp241
; src/file.c:219:                 strncpy(component, path_copy + start, comp_len);
	leaq	0(%r13,%r9), %rsi	;, tmp151
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:95:   return __builtin___strncpy_chk (__dest, __src, __len,
	movq	%r15, %rdx	; comp_len,
	movq	%rax, %rdi	; tmp241,
	movq	%rax, 8(%rsp)	; tmp241, %sfp
	call	*strncpy@GOTPCREL(%rip)	;
; src/file.c:220:                 component[comp_len] = '\0';
	movb	$0, 32(%rsp,%r15)	;, component[comp_len_25]
; src/file.c:222:                 if (strcmp(component, ".") == 0) {
	movq	8(%rsp), %rdi	; %sfp,
	leaq	.LC4(%rip), %rsi	;,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:222:                 if (strcmp(component, ".") == 0) {
	testl	%eax, %eax	; tmp209
	je	.L42	;,
; src/file.c:224:                 } else if (strcmp(component, "..") == 0) {
	movq	8(%rsp), %rdi	; %sfp,
	leaq	.LC5(%rip), %rsi	;,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:224:                 } else if (strcmp(component, "..") == 0) {
	testl	%eax, %eax	; tmp210
	jne	.L45	;,
; src/file.c:226:                     if (dirs_tail != NULL && dirs_tail != dirs_head) {
	testq	%r14, %r14	; dirs_tail
	je	.L46	;,
	cmpq	%rbx, %r14	; node, dirs_tail
	je	.L46	;,
; src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	movq	(%r14), %rdi	; dirs_tail_28->dir,
	leaq	.LC5(%rip), %rsi	;,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	testl	%eax, %eax	; tmp211
	jne	.L60	;,
; src/file.c:229:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/file.c:230:                             node->dir = create_string("..", 2);
	movl	$2, %esi	;,
	leaq	.LC5(%rip), %rdi	;,
; src/file.c:229:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %r15	; tmp212, node
; src/file.c:230:                             node->dir = create_string("..", 2);
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:231:                             node->next = 0;
	xorl	%esi, %esi	;
; src/file.c:230:                             node->dir = create_string("..", 2);
	movq	%rax, (%r15)	; tmp213, node_35->dir
; src/file.c:231:                             node->next = 0;
	movq	%rsi, 8(%r15)	;, node_35->next
; src/file.c:232:                             dirs_tail->next = node;
	movq	%r15, 8(%r14)	; node, dirs_tail_28->next
; src/file.c:233:                             dirs_tail = node;
	movq	%r15, %r14	; node, dirs_tail
	jmp	.L42	;
.L60:
; src/file.c:236:                             StrNode* prev = dirs_head;
	movq	%rbx, %rax	; node, prev
.L47:
; src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	testq	%rax, %rax	; prev
	je	.L42	;,
; src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	movq	8(%rax), %rdx	; prev_37->next, _38
; src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	cmpq	%rdx, %r14	; _38, dirs_tail
	je	.L93	;,
; src/file.c:238:                                 prev = prev->next;
	movq	%rdx, %rax	; _38, prev
	jmp	.L47	;
.L93:
; src/file.c:241:                                 prev->next = 0;
	xorl	%ecx, %ecx	;
; src/file.c:242:                                 dirs_tail = prev;
	movq	%rax, %r14	; prev, dirs_tail
; src/file.c:241:                                 prev->next = 0;
	movq	%rcx, 8(%rax)	;, prev_37->next
	jmp	.L42	;
.L46:
; src/file.c:245:                     } else if (dirs_head == NULL) {
	testq	%rbx, %rbx	; node
	jne	.L42	;,
; src/file.c:247:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/file.c:248:                         node->dir = create_string("..", 2);
	movl	$2, %esi	;,
	leaq	.LC5(%rip), %rdi	;,
; src/file.c:247:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %rbx	; tmp214, node
; src/file.c:248:                         node->dir = create_string("..", 2);
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:249:                         node->next = 0;
	xorl	%edx, %edx	;
; src/file.c:248:                         node->dir = create_string("..", 2);
	movq	%rax, (%rbx)	; tmp215, node_40->dir
; src/file.c:249:                         node->next = 0;
	movq	%rdx, 8(%rbx)	;, node_40->next
	jmp	.L91	;
.L45:
; src/file.c:253:                 } else if (strlen(component) > 0) {
	cmpb	$0, 32(%rsp)	;, MEM[(const char *)&component]
	je	.L42	;,
; src/file.c:255:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/file.c:256:                     node->dir = create_string(component, comp_len);
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r15, %rsi	; comp_len,
; src/file.c:255:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, 24(%rsp)	; node, %sfp
; src/file.c:256:                     node->dir = create_string(component, comp_len);
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:256:                     node->dir = create_string(component, comp_len);
	movq	24(%rsp), %rdx	; %sfp, node
	movq	%rax, (%rdx)	; tmp217, node_43->dir
; src/file.c:257:                     node->next = 0;
	xorl	%eax, %eax	;
	movq	%rax, 8(%rdx)	;, node_43->next
; src/file.c:259:                     if (dirs_tail != NULL)
	testq	%r14, %r14	; dirs_tail
	je	.L48	;,
; src/file.c:260:                         dirs_tail->next = node;
	movq	%rdx, 8(%r14)	; node, dirs_tail_28->next
.L48:
; src/file.c:262:                     dirs_tail = node;
	movq	%rdx, %r14	; node, dirs_tail
; src/file.c:263:                     if (dirs_head == NULL) dirs_head = node;
	testq	%rbx, %rbx	; node
	jne	.L42	;,
; src/file.c:262:                     dirs_tail = node;
	movq	%rdx, %rbx	; node, node
.L91:
; src/file.c:263:                     if (dirs_head == NULL) dirs_head = node;
	movq	%rbx, %r14	; node, dirs_tail
.L42:
; src/file.c:266:             start = i + 1;
	leaq	1(%r12), %r9	;, start
.L41:
; src/file.c:268:         i++;
	incq	%r12	; i
	jmp	.L39	;
.L92:
; src/file.c:272:     file->dirs = dirs_head;
	movq	%rbx, 0(%rbp)	; node, file_4->dirs
; src/file.c:275:     if (dirs_tail != NULL) {
	testq	%r14, %r14	; dirs_tail
	je	.L50	;,
; src/file.c:276:         string dot = strrchr(dirs_tail->dir, '.');
	movq	(%r14), %r14	; dirs_tail_28->dir, dirs_tail
; src/file.c:276:         string dot = strrchr(dirs_tail->dir, '.');
	movl	$46, %esi	;,
	movq	%r14, %rdi	; dirs_tail,
	call	*strrchr@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp218, dot
; src/file.c:278:         if (dot != NULL && dot != dirs_tail->dir) {
	cmpq	%rax, %r14	; dot, dirs_tail
	je	.L50	;,
	testq	%rax, %rax	; dot
	je	.L50	;,
; src/file.c:280:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	%rax, %rsi	; dot, name_len
; src/file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%r14, %rdi	; dirs_tail,
; src/file.c:280:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	subq	%r14, %rsi	; dirs_tail, name_len
; src/file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%r12, %rdi	; dot,
; src/file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%rax, 16(%rbp)	; tmp219, file_4->name
; src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%r12, %rdi	; dot,
; src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%rax, %rsi	; tmp220, tmp177
; src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:278:         if (dot != NULL && dot != dirs_tail->dir) {
	jmp	.L51	;
.L50:
; src/file.c:285:             file->name = dirs_tail->dir;
	movq	%r14, 16(%rbp)	; dirs_tail, file_4->name
	xorl	%eax, %eax	; _73
.L51:
; src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%rax, 8(%rbp)	; _73, file_4->extension
; src/file.c:295:     StrNode* current = dirs_head;
	movq	%rbx, %r14	; node, current
; src/file.c:296:     size_t node_count = 0;
	xorl	%r13d, %r13d	; node_count
; src/file.c:294:     size_t full_path_len = 0;
	xorl	%r12d, %r12d	; full_path_len
.L52:
; src/file.c:298:     while (current != NULL) {
	testq	%r14, %r14	; current
	je	.L94	;,
; src/file.c:299:         full_path_len += strlen(current->dir);
	movq	(%r14), %rdi	; current_56->dir,
; src/file.c:300:         node_count++;
	incq	%r13	; node_count
; src/file.c:299:         full_path_len += strlen(current->dir);
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:301:         current = current->next;
	movq	8(%r14), %r14	; current_56->next, current
; src/file.c:299:         full_path_len += strlen(current->dir);
	addq	%rax, %r12	; tmp222, full_path_len
	jmp	.L52	;
.L94:
; src/file.c:305:     if (node_count > 1)
	cmpq	$1, %r13	;, node_count
	jbe	.L54	;,
; src/file.c:306:         full_path_len += (node_count - 1);
	leaq	-1(%r12,%r13), %r12	;, full_path_len
.L54:
; src/file.c:308:     string full_path = create_string_not_check("", full_path_len + 1);
	leaq	1(%r12), %rsi	;, tmp182
	leaq	.LC0(%rip), %rdi	;,
	call	*create_string_not_check@GOTPCREL(%rip)	;
; src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	leaq	.LC2(%rip), %r13	;, tmp200
; src/file.c:309:     full_path[0] = '\0';
	movb	$0, (%rax)	;, *full_path_70
; src/file.c:308:     string full_path = create_string_not_check("", full_path_len + 1);
	movq	%rax, %r12	; tmp223, full_path
; src/file.c:312:     bool is_first = true;
	movb	$1, %al	;, is_first
.L55:
; src/file.c:313:     while (current != NULL) {
	testq	%rbx, %rbx	; node
	je	.L95	;,
; src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testb	%al, %al	; is_first
	jne	.L56	;,
; src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	(%rbx), %rdi	; current_72->dir,
	movq	%r13, %rsi	; tmp200,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testl	%eax, %eax	; tmp224
	je	.L56	;,
; src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$0, (%r12)	;, MEM[(const char *)full_path_70]
	je	.L56	;,
; src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	movq	%r12, %rdi	; full_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$47, -1(%r12,%rax)	;, *_78
	je	.L56	;,
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movq	%r13, %rsi	; tmp200,
	movq	%r12, %rdi	; full_path,
	call	*strcat@GOTPCREL(%rip)	;
.L56:
	movq	(%rbx), %rsi	; current_72->dir,
	movq	%r12, %rdi	; full_path,
	call	*strcat@GOTPCREL(%rip)	;
; src/file.c:322:         current = current->next;
	movq	8(%rbx), %rbx	; current_72->next, node
; src/file.c:321:         is_first = false;
	xorl	%eax, %eax	; is_first
	jmp	.L55	;
.L95:
; src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%r12, %rdi	; full_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%r12, %rdi	; full_path,
; src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, %rsi	; tmp226, tmp192
; src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, 24(%rbp)	; tmp227, file_4->path
; src/file.c:20: }
	addq	$296, %rsp	;,
	movq	%rbp, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
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
; src/file.c:76:     if (path->dirs == NULL) return 0;
	movq	(%rdi), %rax	; path_31(D)->dirs, <retval>
; src/file.c:76:     if (path->dirs == NULL) return 0;
	testq	%rax, %rax	; <retval>
	je	.L119	;,
; src/file.c:75: string get_file_dir(File* path) {
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp123, path
	pushq	%rbp	;
; src/file.c:80:     size_t node_count = 0;
	xorl	%ebp, %ebp	; node_count
; src/file.c:75: string get_file_dir(File* path) {
	pushq	%rbx	;
; src/file.c:79:     size_t total_len = 0;
	xorl	%ebx, %ebx	; total_len
; src/file.c:75: string get_file_dir(File* path) {
	pushq	%rsi	;
.L101:
; src/file.c:83:         if (current->next != NULL) {  // Not the last element (which is the filename)
	movq	8(%rax), %r13	; current_53->next, _2
; src/file.c:83:         if (current->next != NULL) {  // Not the last element (which is the filename)
	testq	%r13, %r13	; _2
	je	.L100	;,
; src/file.c:84:             size_t dir_len = strlen(current->dir);
	movq	(%rax), %rdi	; current_53->dir,
; src/file.c:86:             node_count++;
	incq	%rbp	; node_count
; src/file.c:84:             size_t dir_len = strlen(current->dir);
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:85:             total_len += dir_len;
	addq	%rax, %rbx	; tmp124, total_len
; src/file.c:86:             node_count++;
	movq	%r13, %rax	; _2, <retval>
	jmp	.L101	;
.L100:
; src/file.c:91:     if (node_count == 0) return NULL;
	testq	%rbp, %rbp	; node_count
	je	.L98	;,
; src/file.c:94:     if (node_count > 1)
	cmpq	$1, %rbp	;, node_count
	je	.L102	;,
; src/file.c:95:         total_len += node_count - 1;
	leaq	-1(%rbx,%rbp), %rbx	;, total_len
.L102:
; src/file.c:98:     string dir_path = create_string_not_check("", total_len + 1);
	leaq	1(%rbx), %rsi	;, tmp107
	leaq	.LC0(%rip), %rdi	;, tmp108
	call	*create_string_not_check@GOTPCREL(%rip)	;
; src/file.c:99:     dir_path[0] = '\0';
	movb	$0, (%rax)	;, *dir_path_36
; src/file.c:98:     string dir_path = create_string_not_check("", total_len + 1);
	movq	%rax, %rbx	; tmp125, dir_path
; src/file.c:101:     current = path->dirs;
	movq	(%r12), %rbp	; path_31(D)->dirs, current
; src/file.c:102:     bool first = true;
	movb	$1, %al	;, first
; src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	leaq	.LC2(%rip), %r12	;, tmp122
.L103:
; src/file.c:103:     while (current != NULL) {
	testq	%rbp, %rbp	; current
	je	.L122	;,
; src/file.c:104:         if (current->next != NULL) {  // Not the last element
	cmpq	$0, 8(%rbp)	;, current_22->next
	je	.L104	;,
; src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	testb	%al, %al	; first
	jne	.L105	;,
; src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	movq	0(%rbp), %rdi	; current_22->dir,
	movq	%r12, %rsi	; tmp122,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	testl	%eax, %eax	; tmp126
	je	.L105	;,
; src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$0, (%rbx)	;, MEM[(const char *)dir_path_36]
	je	.L105	;,
; src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	movq	%rbx, %rdi	; dir_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$47, -1(%rbx,%rax)	;, *_12
	je	.L105	;,
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movq	%r12, %rsi	; tmp122,
	movq	%rbx, %rdi	; dir_path,
	call	*strcat@GOTPCREL(%rip)	;
.L105:
	movq	0(%rbp), %rsi	; current_22->dir,
	movq	%rbx, %rdi	; dir_path,
	call	*strcat@GOTPCREL(%rip)	;
; src/file.c:111:             first = false;
	xorl	%eax, %eax	; first
.L104:
; src/file.c:113:         current = current->next;
	movq	8(%rbp), %rbp	; current_22->next, current
	jmp	.L103	;
.L122:
; src/file.c:116:     return create_string(dir_path, strlen(dir_path));
	movq	%rbx, %rdi	; dir_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:117: }
	popq	%rcx	;
; src/file.c:116:     return create_string(dir_path, strlen(dir_path));
	movq	%rbx, %rdi	; dir_path,
; src/file.c:117: }
	popq	%rbx	;
; src/file.c:116:     return create_string(dir_path, strlen(dir_path));
	movq	%rax, %rsi	; tmp128, tmp117
; src/file.c:117: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; src/file.c:116:     return create_string(dir_path, strlen(dir_path));
	jmp	*create_string@GOTPCREL(%rip)	;
.L98:
; src/file.c:117: }
	popq	%rdx	;
	xorl	%eax, %eax	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L119:
	xorl	%eax, %eax	;
	ret	
	.size	get_file_dir, .-get_file_dir
	.section	.rodata.str1.1
.LC6:
	.string	"%s/%s%s"
.LC7:
	.string	"%s%s"
	.text
	.type	rebuild_full_path, @function
rebuild_full_path:
	pushq	%r15	;
	leaq	.LC0(%rip), %r15	;, iftmp.4_14
	pushq	%r14	;
; src/file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	movq	%r15, %r14	; iftmp.4_14, iftmp.4_14
; src/file.c:123: static void rebuild_full_path(File* file) {
	pushq	%r13	;
; src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	%r15, %r13	; iftmp.4_14, iftmp.5_15
; src/file.c:123: static void rebuild_full_path(File* file) {
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp130, file
	subq	$24, %rsp	;,
; src/file.c:124:     string dir = get_file_dir(file);
	call	get_file_dir	;
; src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rbx), %rdx	; file_18(D)->extension, _1
; src/file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	; dir
; src/file.c:124:     string dir = get_file_dir(file);
	movq	%rax, %r12	; tmp131, dir
; src/file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	cmovne	%rax, %r14	; dir,, iftmp.4_14
; src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%rdx, %rdx	; _1
	movq	%rdx, 8(%rsp)	; _1, %sfp
	cmovne	%rdx, %r13	; _1,, iftmp.5_15
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%r14, %rdi	; iftmp.4_14,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rdi	; file_18(D)->name, file_18(D)->name
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%rax, %rbp	; tmp132, tmp101
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	movq	8(%rsp), %rdx	; %sfp, _1
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%rbp,%rax), %rbp	;, path_len
; src/file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	testq	%rdx, %rdx	; _1
	je	.L126	;,
; src/file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	movq	%r13, %rdi	; iftmp.5_15,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	addq	%rax, %rbp	; tmp134, path_len
.L126:
; src/file.c:131:     string new_path = create_string_not_check("", path_len + 1);
	leaq	1(%rbp), %rsi	;, tmp111
	movq	%r15, %rdi	; iftmp.4_14,
	call	*create_string_not_check@GOTPCREL(%rip)	;
; src/file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	testq	%r12, %r12	; dir
	movq	16(%rbx), %r8	; file_18(D)->name, file_18(D)->name
; src/file.c:131:     string new_path = create_string_not_check("", path_len + 1);
	movq	%rax, %rbp	; tmp135, new_path
; src/file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	je	.L127	;,
; src/file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpb	$0, (%r14)	;, MEM[(const char *)iftmp.4_14]
	je	.L127	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r8, %r9	; file_18(D)->name,
	leaq	.LC6(%rip), %rcx	;, tmp114
	movq	%r14, %r8	; iftmp.4_14,
	movq	%rbp, %rdi	; new_path,
	orq	$-1, %rdx	;,
	movl	$2, %esi	;,
	pushq	%rax	;
	xorl	%eax, %eax	;
	pushq	%r13	; iftmp.5_15
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	popq	%rdx	;
	popq	%rcx	;
	jmp	.L128	;
.L127:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r13, %r9	; iftmp.5_15,
	leaq	.LC7(%rip), %rcx	;, tmp116
	orq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	movq	%rbp, %rdi	; new_path,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L128:
; src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%rbp, %rdi	; new_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%rbp, %rdi	; new_path,
; src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, %rsi	; tmp136, tmp118
; src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, 24(%rbx)	; tmp137, file_18(D)->path
; src/file.c:138: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
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
; src/file.c:141:     file->extension = new_extension;
	movq	%rsi, 8(%rdi)	; tmp85, file_2(D)->extension
; src/file.c:142:     rebuild_full_path(file);
	jmp	rebuild_full_path	;
	.size	change_file_extension, .-change_file_extension
	.globl	change_file_name
	.type	change_file_name, @function
change_file_name:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rsi, %r12	; tmp112, new_name
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp111, file
	pushq	%rbx	;
	subq	$24, %rsp	;,
; src/file.c:149:     if (file->dirs != NULL) {
	movq	(%rdi), %rax	; file_13(D)->dirs, _1
; src/file.c:146:     file->name = new_name;
	movq	%rsi, 16(%rdi)	; new_name, file_13(D)->name
; src/file.c:149:     if (file->dirs != NULL) {
	testq	%rax, %rax	; _1
	je	.L142	;,
.L141:
	movq	%rax, %r15	; _1, current
; src/file.c:153:             if (current->next == NULL) {
	movq	8(%rax), %rax	; current_8->next, _1
; src/file.c:153:             if (current->next == NULL) {
	testq	%rax, %rax	; _1
	jne	.L141	;,
; src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rbp), %r13	; file_13(D)->extension, _3
	leaq	.LC0(%rip), %r14	;, iftmp.6_10
; src/file.c:156:                 size_t full_name_len = strlen(new_name);
	movq	%r12, %rdi	; new_name,
; src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	%r14, %rax	; iftmp.6_10, iftmp.6_10
	testq	%r13, %r13	; _3
	cmovne	%r13, %rax	; _3,, iftmp.6_10
	movq	%rax, 8(%rsp)	; iftmp.6_10, %sfp
; src/file.c:156:                 size_t full_name_len = strlen(new_name);
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp113, full_name_len
; src/file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	testq	%r13, %r13	; _3
	je	.L144	;,
; src/file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	movq	8(%rsp), %rdi	; %sfp,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	addq	%rax, %rbx	; tmp114, full_name_len
.L144:
; src/file.c:159:                 string full_name = create_string_not_check("", full_name_len + 1);
	leaq	1(%rbx), %rsi	;, tmp100
	movq	%r14, %rdi	; iftmp.6_10,
	call	*create_string_not_check@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	8(%rsp), %r9	; %sfp,
	movq	%r12, %r8	; new_name,
	orq	$-1, %rdx	;,
; src/file.c:159:                 string full_name = create_string_not_check("", full_name_len + 1);
	movq	%rax, %rbx	; tmp115, full_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC7(%rip), %rcx	;, tmp102
	movl	$2, %esi	;,
	movq	%rax, %rdi	; full_name,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rbx, %rdi	; full_name,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rbx, %rdi	; full_name,
; src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rax, %rsi	; tmp116, tmp104
; src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rax, (%r15)	; tmp117, current_16->dir
.L142:
; src/file.c:169: }
	addq	$24, %rsp	;,
; src/file.c:168:     rebuild_full_path(file);
	movq	%rbp, %rdi	; file,
; src/file.c:169: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/file.c:168:     rebuild_full_path(file);
	jmp	rebuild_full_path	;
	.size	change_file_name, .-change_file_name
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
