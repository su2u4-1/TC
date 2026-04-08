	.file	"file.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.p2align 4
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
	.p2align 4
	.globl	absolute_path
	.type	absolute_path, @function
absolute_path:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
; src/file.c:62:     string abs_path = create_string_not_check("", total_len);
	leaq	.LC0(%rip), %r13	;, tmp149
; src/file.c:22: string absolute_path(string path, string base_path) {
	pushq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC1(%rip), %r12	;, tmp150
; src/file.c:22: string absolute_path(string path, string base_path) {
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp152, base_path
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp151, path
	subq	$24, %rsp	;,
	.p2align 4,,10
	.p2align 3
.L21:
; src/file.c:23:     path = create_string_not_check(path, strlen(path));
	movq	%rbx, %rdi	; path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:23:     path = create_string_not_check(path, strlen(path));
	movq	%rbx, %rdi	; path,
; src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	xorl	%ebx, %ebx	; i
; src/file.c:23:     path = create_string_not_check(path, strlen(path));
	movq	%rax, %rsi	; tmp153, tmp118
; src/file.c:23:     path = create_string_not_check(path, strlen(path));
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp154, <retval>
; src/file.c:24:     size_t path_len = strlen(path);
	movq	%rax, %rdi	; <retval>,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp155, path_len
; src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	testq	%rax, %rax	; path_len
	jne	.L4	;,
	jmp	.L17	;
	.p2align 4,,10
	.p2align 3
.L6:
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rbx	;, i
	jbe	.L11	;,
; src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	leaq	1(%rbx), %rsi	;, i
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, %dl	;, _3
	je	.L12	;,
.L25:
	movq	%rsi, %rbx	; i, i
.L13:
; src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	cmpq	%r15, %rbx	; path_len, i
	jnb	.L38	;,
.L4:
; src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	leaq	(%r14,%rbx), %rdi	;, _2
	movzbl	(%rdi), %edx	; *_2, _3
; src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	cmpb	$92, %dl	;, _3
	jne	.L6	;,
; src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	movb	$47, (%rdi)	;, *_2
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rbx	;, i
	jbe	.L11	;,
	leaq	1(%rbx), %rsi	;, i
.L12:
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-1(%r14,%rbx), %rcx	;, _6
	movzbl	(%rcx), %eax	; *_6, _7
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$46, %al	;, _7
	je	.L39	;,
.L9:
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, %al	;, _7
	jne	.L25	;,
; src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	movq	%r15, %rdx	; path_len, tmp132
; src/file.c:34:             path_len--;
	subq	$1, %r15	;, path_len
; src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	addq	%r14, %rsi	; <retval>, tmp133
; src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	subq	%rbx, %rdx	; i, tmp132
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	call	*memmove@GOTPCREL(%rip)	;
; src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	cmpq	%r15, %rbx	; path_len, i
	jb	.L4	;,
	.p2align 4,,10
	.p2align 3
.L38:
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	cmpq	$1, %r15	;, path_len
	jbe	.L15	;,
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	movzbl	(%r14), %eax	; *path_52, _22
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	leal	-65(%rax), %edx	;, tmp134
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	cmpb	$25, %dl	;, tmp134
	jbe	.L40	;,
.L16:
; src/file.c:55:     if (path_len > 0 && path[0] == '/')
	cmpb	$47, %al	;, _22
	je	.L3	;,
.L5:
; src/file.c:57:     if (base_path == NULL)
	testq	%rbp, %rbp	; base_path
	je	.L41	;,
.L19:
; src/file.c:61:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	movq	%rbp, %rdi	; base_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:62:     string abs_path = create_string_not_check("", total_len);
	movq	%r13, %rdi	; tmp149,
; src/file.c:61:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	leaq	2(%r15,%rax), %r15	;, total_len
; src/file.c:62:     string abs_path = create_string_not_check("", total_len);
	movq	%r15, %rsi	; total_len,
	call	*create_string_not_check@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%rbp, %r8	; base_path,
	movq	%r14, %r9	; <retval>,
	movq	%r12, %rcx	; tmp150,
; src/file.c:62:     string abs_path = create_string_not_check("", total_len);
	movq	%rax, %rbx	; tmp158, abs_path
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%rax, %rdi	; abs_path,
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
; src/file.c:64:     return absolute_path(create_string(abs_path, total_len), NULL);
	xorl	%ebp, %ebp	; base_path
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/file.c:64:     return absolute_path(create_string(abs_path, total_len), NULL);
	movq	%rbx, %rdi	; abs_path,
	movq	%r15, %rsi	; total_len,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp159, path
	jmp	.L21	;
	.p2align 4,,10
	.p2align 3
.L39:
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, -2(%r14,%rbx)	;, *_9
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-2(%rbx), %r8	;, _8
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	jne	.L25	;,
; src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	%r15, %rdx	; path_len, tmp127
	movq	%r8, 8(%rsp)	; _8, %sfp
; src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	addq	%r14, %rsi	; <retval>, tmp129
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	movq	%rcx, %rdi	; _6,
; src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	subq	%rbx, %rdx	; i, tmp127
; src/file.c:29:             path_len -= 2;
	subq	$2, %r15	;, path_len
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	call	*memmove@GOTPCREL(%rip)	;
; src/file.c:30:             i -= 2;
	movq	8(%rsp), %rbx	; %sfp, i
	.p2align 4,,10
	.p2align 3
.L11:
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	testq	%rbx, %rbx	; i
	jne	.L42	;,
	movl	$1, %ebx	;, i
	jmp	.L13	;
	.p2align 4,,10
	.p2align 3
.L15:
; src/file.c:55:     if (path_len > 0 && path[0] == '/')
	testq	%r15, %r15	; path_len
	jne	.L43	;,
.L17:
	xorl	%r15d, %r15d	; path_len
; src/file.c:57:     if (base_path == NULL)
	testq	%rbp, %rbp	; base_path
	jne	.L19	;,
.L41:
; /usr/include/x86_64-linux-gnu/bits/unistd.h:88:   return __glibc_fortify (getcwd, __size, sizeof (char),
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	*getcwd@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp156, base_path
; src/file.c:59:     if (base_path == NULL)
	testq	%rax, %rax	; base_path
	jne	.L19	;,
.L3:
; src/file.c:65: }
	addq	$24, %rsp	;,
	movq	%r14, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L43:
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	movzbl	(%r14), %eax	; *path_52, _22
	jmp	.L16	;
	.p2align 4,,10
	.p2align 3
.L40:
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	cmpb	$58, 1(%r14)	;, MEM[(char *)path_52 + 1B]
	jne	.L5	;,
; src/file.c:46:         path[0] = to_lower(path[0]);
	movsbl	%al, %edi	; _22, _22
	call	*to_lower@GOTPCREL(%rip)	;
; src/file.c:47:         memmove(path, path + 1, path_len);
	leaq	1(%r14), %rsi	;, tmp137
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	movq	%r15, %rdx	; path_len,
	movq	%r14, %rdi	; <retval>,
	call	*memmove@GOTPCREL(%rip)	;
; src/file.c:48:         path[0] = '/';
	movb	$47, (%r14)	;, *path_52
; src/file.c:49:         path[2] = '/';
	movb	$47, 2(%r14)	;, MEM[(char *)path_52 + 2B]
; src/file.c:50:         return path;
	jmp	.L3	;
.L42:
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	(%r14,%rbx), %rdi	;, _2
; src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	leaq	1(%rbx), %rsi	;, i
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, (%rdi)	;, *_14
	jne	.L25	;,
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	movzbl	-1(%r14,%rbx), %eax	; *_87, _7
	jmp	.L9	;
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
	.p2align 4
	.globl	create_file
	.type	create_file, @function
create_file:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
; src/file.c:178:     StrNode* dirs_head = NULL;
	xorl	%r13d, %r13d	; node
; src/file.c:15: File* create_file(const string path) {
	pushq	%r12	;
	pushq	%rbp	;
; src/file.c:181:     size_t start = 0;
	xorl	%ebp, %ebp	; ivtmp.43
; src/file.c:15: File* create_file(const string path) {
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp205, path
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
	movq	%rax, %r12	; tmp206, <retval>
; src/file.c:17:     file->path = absolute_path(path, NULL);
	call	absolute_path	;
	movq	%rax, %rdi	; tmp207, _1
; src/file.c:17:     file->path = absolute_path(path, NULL);
	movq	%rax, 24(%r12)	; _1, file_4->path
; src/file.c:172:     size_t path_len = strlen(file->path);
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:175:     string path_copy = create_string_not_check("", path_len + 1);
	leaq	.LC0(%rip), %rdi	;,
	leaq	1(%rax), %rsi	;, tmp148
; src/file.c:172:     size_t path_len = strlen(file->path);
	movq	%rax, %r15	; tmp208, tmp146
; src/file.c:175:     string path_copy = create_string_not_check("", path_len + 1);
	call	*create_string_not_check@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	movq	24(%r12), %rsi	; file_4->path, file_4->path
; src/file.c:175:     string path_copy = create_string_not_check("", path_len + 1);
	movq	%rax, %r14	; tmp209, path_copy
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	movq	%rax, %rdi	; path_copy,
	call	*strcpy@GOTPCREL(%rip)	;
; src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	testq	%r15, %r15	; tmp146
	je	.L45	;,
; src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	cmpb	$47, (%r14)	;, *path_copy_12
	je	.L112	;,
.L45:
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:95:   return __builtin___strncpy_chk (__dest, __src, __len,
	leaq	32(%rsp), %rax	;, tmp243
; src/file.c:178:     StrNode* dirs_head = NULL;
	movq	%r13, %rbx	; node, node
	movq	%rbp, %r8	; ivtmp.43, start
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:95:   return __builtin___strncpy_chk (__dest, __src, __len,
	movq	%rax, 8(%rsp)	; tmp243, %sfp
	jmp	.L62	;
	.p2align 4,,10
	.p2align 3
.L49:
; src/file.c:210:     while (i <= path_len) {
	cmpq	%rbp, %r15	; ivtmp.43, tmp146
	jb	.L48	;,
.L62:
	movq	%rbp, %rax	; ivtmp.43, ivtmp.43
; src/file.c:266:             start = i + 1;
	addq	$1, %rbp	;, ivtmp.43
; src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpq	%rax, %r15	; ivtmp.43, tmp146
	je	.L113	;,
; src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpb	$47, (%r14,%rax)	;, MEM[(char *)path_copy_12 + ivtmp.43_137 * 1]
	jne	.L49	;,
; src/file.c:212:             if (i > start) {
	cmpq	%rax, %r8	; ivtmp.43, start
	jnb	.L50	;,
.L47:
; src/file.c:213:                 size_t comp_len = i - start;
	subq	%r8, %rax	; start, ivtmp.43
	movq	%rax, %rcx	; ivtmp.43, comp_len
; src/file.c:214:                 if (comp_len >= componentMaxSize) {
	cmpq	$255, %rax	;, comp_len
	ja	.L114	;,
.L51:
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:95:   return __builtin___strncpy_chk (__dest, __src, __len,
	movq	%rcx, 16(%rsp)	; comp_len, %sfp
	movq	%rcx, %rdx	; comp_len,
	movq	8(%rsp), %rdi	; %sfp,
; src/file.c:219:                 strncpy(component, path_copy + start, comp_len);
	leaq	(%r14,%r8), %rsi	;, tmp154
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:95:   return __builtin___strncpy_chk (__dest, __src, __len,
	call	*strncpy@GOTPCREL(%rip)	;
; src/file.c:220:                 component[comp_len] = '\0';
	movq	16(%rsp), %rcx	; %sfp, comp_len
; src/file.c:222:                 if (strcmp(component, ".") == 0) {
	movq	8(%rsp), %rax	; %sfp, tmp204
; src/file.c:220:                 component[comp_len] = '\0';
	movb	$0, 32(%rsp,%rcx)	;, component[comp_len_25]
; src/file.c:222:                 if (strcmp(component, ".") == 0) {
	cmpw	$46, (%rax)	;, MEM <char[1:2]> [(void *)&component]
	je	.L50	;,
; src/file.c:224:                 } else if (strcmp(component, "..") == 0) {
	cmpw	$11822, (%rax)	;, MEM <char[1:3]> [(void *)&component]
	je	.L115	;,
.L55:
; src/file.c:253:                 } else if (strlen(component) > 0) {
	cmpb	$0, 32(%rsp)	;, MEM[(const char *)&component]
	jne	.L116	;,
	.p2align 4,,10
	.p2align 3
.L50:
; src/file.c:266:             start = i + 1;
	movq	%rbp, %r8	; ivtmp.43, start
	jmp	.L49	;
	.p2align 4,,10
	.p2align 3
.L113:
; src/file.c:212:             if (i > start) {
	cmpq	%r15, %r8	; tmp146, start
	jb	.L47	;,
.L48:
; src/file.c:272:     file->dirs = dirs_head;
	movq	%rbx, (%r12)	; node, file_4->dirs
; src/file.c:275:     if (dirs_tail != NULL) {
	testq	%r13, %r13	; node
	je	.L63	;,
; src/file.c:276:         string dot = strrchr(dirs_tail->dir, '.');
	movq	0(%r13), %r13	; dirs_tail_148->dir, node
; src/file.c:276:         string dot = strrchr(dirs_tail->dir, '.');
	movl	$46, %esi	;,
	movq	%r13, %rdi	; node,
	call	*strrchr@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp218, dot
; src/file.c:278:         if (dot != NULL && dot != dirs_tail->dir) {
	testq	%rax, %rax	; dot
	je	.L63	;,
	cmpq	%rax, %r13	; dot, node
	je	.L63	;,
; src/file.c:280:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	%rax, %rsi	; dot, name_len
; src/file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%r13, %rdi	; node,
; src/file.c:280:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	subq	%r13, %rsi	; node, name_len
; src/file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%rbp, %rdi	; dot,
; src/file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%rax, 16(%r12)	; tmp219, file_4->name
; src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%rbp, %rdi	; dot,
; src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%rax, %rsi	; tmp220, tmp177
; src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%rax, 8(%r12)	; _55, file_4->extension
; src/file.c:298:     while (current != NULL) {
	testq	%rbx, %rbx	; node
	je	.L65	;,
.L118:
; src/file.c:295:     StrNode* current = dirs_head;
	movq	%rbx, %rbp	; node, current
; src/file.c:296:     size_t node_count = 0;
	xorl	%r15d, %r15d	; node_count
; src/file.c:294:     size_t full_path_len = 0;
	xorl	%r14d, %r14d	; full_path_len
	.p2align 4,,10
	.p2align 3
.L66:
; src/file.c:299:         full_path_len += strlen(current->dir);
	movq	0(%rbp), %rdi	; current_157->dir, current_157->dir
; src/file.c:300:         node_count++;
	addq	$1, %r15	;, node_count
; src/file.c:299:         full_path_len += strlen(current->dir);
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:301:         current = current->next;
	movq	8(%rbp), %rbp	; current_157->next, current
; src/file.c:299:         full_path_len += strlen(current->dir);
	addq	%rax, %r14	; tmp222, full_path_len
; src/file.c:298:     while (current != NULL) {
	testq	%rbp, %rbp	; current
	jne	.L66	;,
; src/file.c:308:     string full_path = create_string_not_check("", full_path_len + 1);
	leaq	1(%r14), %rax	;, tmp202
	cmpq	$1, %r15	;, node_count
	leaq	(%r14,%r15), %rsi	;, tmp201
	cmovbe	%rax, %rsi	; tmp201,, tmp202, _66
	leaq	.LC0(%rip), %rdi	;,
	call	*create_string_not_check@GOTPCREL(%rip)	;
; src/file.c:309:     full_path[0] = '\0';
	movb	$0, (%rax)	;, *full_path_70
; src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	(%rbx), %rbp	;* node, pretmp_134
; src/file.c:308:     string full_path = create_string_not_check("", full_path_len + 1);
	movq	%rax, %r13	; tmp224, full_path
	.p2align 4,,10
	.p2align 3
.L72:
	movq	%r13, %rdi	; full_path,
	call	*strlen@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movq	%rbp, %rsi	; pretmp_134,
	leaq	0(%r13,%rax), %rdi	;, tmp189
	call	*stpcpy@GOTPCREL(%rip)	;
; src/file.c:322:         current = current->next;
	movq	8(%rbx), %rbx	; current_19->next, node
; src/file.c:313:     while (current != NULL) {
	testq	%rbx, %rbx	; node
	je	.L68	;,
; src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	(%rbx), %rbp	; current_83->dir, pretmp_134
; src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	cmpb	$47, 0(%rbp)	;, MEM <char[1:2]> [(void *)pretmp_134]
	je	.L117	;,
.L75:
; src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$0, 0(%r13)	;, MEM[(const char *)full_path_70]
	je	.L72	;,
; src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$47, -1(%rax)	;, *_78
	je	.L72	;,
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movl	$47, %edx	;,
	movw	%dx, (%rax)	;, MEM <char[1:2]> [(void *)_154]
; src/file.c:320:         strcat(full_path, current->dir);
	movq	(%rbx), %rbp	;* node, pretmp_134
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	jmp	.L72	;
	.p2align 4,,10
	.p2align 3
.L114:
	movq	%r8, 16(%rsp)	; start, %sfp
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC3(%rip), %rdx	;, tmp153
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/file.c:216:                     comp_len = componentMaxSize - 1;
	movq	16(%rsp), %r8	; %sfp, start
	movl	$255, %ecx	;, comp_len
	jmp	.L51	;
	.p2align 4,,10
	.p2align 3
.L63:
; src/file.c:285:             file->name = dirs_tail->dir;
	xorl	%eax, %eax	; _55
	movq	%r13, 16(%r12)	; node, file_4->name
; src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%rax, 8(%r12)	; _55, file_4->extension
; src/file.c:298:     while (current != NULL) {
	testq	%rbx, %rbx	; node
	jne	.L118	;,
.L65:
; src/file.c:308:     string full_path = create_string_not_check("", full_path_len + 1);
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;,
	call	*create_string_not_check@GOTPCREL(%rip)	;
; src/file.c:309:     full_path[0] = '\0';
	movb	$0, (%rax)	;, *full_path_95
; src/file.c:308:     string full_path = create_string_not_check("", full_path_len + 1);
	movq	%rax, %r13	; tmp223, full_path
.L68:
; src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%r13, %rdi	; full_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%r13, %rdi	; full_path,
; src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, %rsi	; tmp227, tmp195
; src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, 24(%r12)	; tmp228, file_4->path
; src/file.c:20: }
	addq	$296, %rsp	;,
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
.L117:
; src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	cmpb	$0, 1(%rbp)	;, MEM <char[1:2]> [(void *)pretmp_134]
	je	.L72	;,
	jmp	.L75	;
	.p2align 4,,10
	.p2align 3
.L115:
; src/file.c:224:                 } else if (strcmp(component, "..") == 0) {
	cmpb	$0, 2(%rax)	;, MEM <char[1:3]> [(void *)&component]
	jne	.L55	;,
; src/file.c:226:                     if (dirs_tail != NULL && dirs_tail != dirs_head) {
	testq	%r13, %r13	; node
	je	.L58	;,
	cmpq	%rbx, %r13	; node, node
	je	.L58	;,
; src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	movq	0(%r13), %rax	; dirs_tail_153->dir, dirs_tail_153->dir
	cmpb	$46, (%rax)	;, MEM <char[1:3]> [(void *)_33]
	je	.L119	;,
.L78:
; src/file.c:236:                             StrNode* prev = dirs_head;
	movq	%rbx, %rax	; node, prev
	jmp	.L60	;
	.p2align 4,,10
	.p2align 3
.L79:
; src/file.c:238:                                 prev = prev->next;
	movq	%rdx, %rax	; _38, prev
.L60:
; src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	testq	%rax, %rax	; prev
	je	.L50	;,
; src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	movq	8(%rax), %rdx	; prev_37->next, _38
; src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	cmpq	%r13, %rdx	; node, _38
	jne	.L79	;,
; src/file.c:241:                                 prev->next = 0;
	movq	$0, 8(%rax)	;, prev_37->next
; src/file.c:242:                                 dirs_tail = prev;
	movq	%rax, %r13	; prev, node
	jmp	.L50	;
	.p2align 4,,10
	.p2align 3
.L112:
; src/file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
; src/file.c:204:         start = 1;
	movl	$1, %ebp	;, ivtmp.43
; src/file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/file.c:199:         node->dir = create_string("/", 1);
	movl	$1, %esi	;,
	leaq	.LC2(%rip), %rdi	;, tmp151
; src/file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %r13	; tmp210, node
; src/file.c:199:         node->dir = create_string("/", 1);
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:200:         node->next = 0;
	movq	$0, 8(%r13)	;, node_16->next
; src/file.c:199:         node->dir = create_string("/", 1);
	movq	%rax, 0(%r13)	; tmp211, node_16->dir
	jmp	.L45	;
	.p2align 4,,10
	.p2align 3
.L58:
; src/file.c:245:                     } else if (dirs_head == NULL) {
	testq	%rbx, %rbx	; node
	jne	.L50	;,
; src/file.c:247:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/file.c:248:                         node->dir = create_string("..", 2);
	movl	$2, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp169
; src/file.c:247:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %rbx	; tmp214, node
; src/file.c:248:                         node->dir = create_string("..", 2);
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:251:                         dirs_tail = node;
	movq	%rbx, %r13	; node, node
; src/file.c:249:                         node->next = 0;
	movq	$0, 8(%rbx)	;, node_40->next
; src/file.c:248:                         node->dir = create_string("..", 2);
	movq	%rax, (%rbx)	; tmp215, node_40->dir
	jmp	.L50	;
	.p2align 4,,10
	.p2align 3
.L116:
	movq	%rcx, 24(%rsp)	; comp_len, %sfp
; src/file.c:255:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/file.c:256:                     node->dir = create_string(component, comp_len);
	movq	24(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
; src/file.c:255:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, 16(%rsp)	; node, %sfp
; src/file.c:256:                     node->dir = create_string(component, comp_len);
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:256:                     node->dir = create_string(component, comp_len);
	movq	16(%rsp), %rdx	; %sfp, node
	movq	%rax, (%rdx)	; tmp217, node_43->dir
; src/file.c:257:                     node->next = 0;
	movq	$0, 8(%rdx)	;, node_43->next
; src/file.c:259:                     if (dirs_tail != NULL)
	testq	%r13, %r13	; node
	je	.L61	;,
; src/file.c:260:                         dirs_tail->next = node;
	movq	%rdx, 8(%r13)	; node, dirs_tail_153->next
.L61:
; src/file.c:262:                     dirs_tail = node;
	movq	%rdx, %r13	; node, node
; src/file.c:263:                     if (dirs_head == NULL) dirs_head = node;
	testq	%rbx, %rbx	; node
	jne	.L50	;,
; src/file.c:262:                     dirs_tail = node;
	movq	%rdx, %rbx	; node, node
; src/file.c:263:                     if (dirs_head == NULL) dirs_head = node;
	movq	%rdx, %r13	; node, node
	jmp	.L50	;
	.p2align 4,,10
	.p2align 3
.L119:
; src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	cmpb	$46, 1(%rax)	;, MEM <char[1:3]> [(void *)_33]
	jne	.L78	;,
; src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	cmpb	$0, 2(%rax)	;, MEM <char[1:3]> [(void *)_33]
	jne	.L78	;,
; src/file.c:229:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/file.c:230:                             node->dir = create_string("..", 2);
	movl	$2, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp168
; src/file.c:229:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, 16(%rsp)	; node, %sfp
; src/file.c:230:                             node->dir = create_string("..", 2);
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:230:                             node->dir = create_string("..", 2);
	movq	16(%rsp), %rdx	; %sfp, node
	movq	%rax, (%rdx)	; tmp213, node_35->dir
; src/file.c:231:                             node->next = 0;
	movq	$0, 8(%rdx)	;, node_35->next
; src/file.c:232:                             dirs_tail->next = node;
	movq	%rdx, 8(%r13)	; node, dirs_tail_153->next
; src/file.c:233:                             dirs_tail = node;
	movq	%rdx, %r13	; node, node
	jmp	.L50	;
	.size	create_file, .-create_file
	.p2align 4
	.globl	get_file_name
	.type	get_file_name, @function
get_file_name:
; src/file.c:68:     return path->name;
	movq	16(%rdi), %rax	; path_2(D)->name, path_2(D)->name
; src/file.c:69: }
	ret	
	.size	get_file_name, .-get_file_name
	.p2align 4
	.globl	get_file_extension
	.type	get_file_extension, @function
get_file_extension:
; src/file.c:72:     return path->extension;
	movq	8(%rdi), %rax	; path_2(D)->extension, path_2(D)->extension
; src/file.c:73: }
	ret	
	.size	get_file_extension, .-get_file_extension
	.p2align 4
	.globl	get_file_dir
	.type	get_file_dir, @function
get_file_dir:
; src/file.c:76:     if (path->dirs == NULL) return 0;
	movq	(%rdi), %rdx	; path_31(D)->dirs, current
; src/file.c:76:     if (path->dirs == NULL) return 0;
	testq	%rdx, %rdx	; current
	je	.L149	;,
; src/file.c:75: string get_file_dir(File* path) {
	pushq	%r13	;
; src/file.c:80:     size_t node_count = 0;
	xorl	%r13d, %r13d	; node_count
; src/file.c:75: string get_file_dir(File* path) {
	pushq	%r12	;
	movq	%rdi, %r12	; tmp128, path
	pushq	%rbp	;
; src/file.c:79:     size_t total_len = 0;
	xorl	%ebp, %ebp	; total_len
; src/file.c:75: string get_file_dir(File* path) {
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/file.c:83:         if (current->next != NULL) {  // Not the last element (which is the filename)
	movq	8(%rdx), %rbx	; _1->next, <retval>
; src/file.c:83:         if (current->next != NULL) {  // Not the last element (which is the filename)
	testq	%rbx, %rbx	; <retval>
	je	.L122	;,
	.p2align 4,,10
	.p2align 3
.L124:
; src/file.c:84:             size_t dir_len = strlen(current->dir);
	movq	(%rdx), %rdi	; current_22->dir, current_22->dir
; src/file.c:86:             node_count++;
	addq	$1, %r13	;, node_count
; src/file.c:84:             size_t dir_len = strlen(current->dir);
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rbx, %rdx	; <retval>, current
; src/file.c:85:             total_len += dir_len;
	addq	%rax, %rbp	; tmp129, total_len
; src/file.c:83:         if (current->next != NULL) {  // Not the last element (which is the filename)
	movq	8(%rbx), %rax	; _54->next, _2
; src/file.c:83:         if (current->next != NULL) {  // Not the last element (which is the filename)
	testq	%rax, %rax	; _2
	je	.L153	;,
	movq	%rax, %rbx	; _2, <retval>
	jmp	.L124	;
	.p2align 4,,10
	.p2align 3
.L153:
; src/file.c:91:     if (node_count == 0) return NULL;
	testq	%r13, %r13	; node_count
	je	.L122	;,
; src/file.c:98:     string dir_path = create_string_not_check("", total_len + 1);
	leaq	1(%rbp), %rax	;, tmp127
	leaq	0(%rbp,%r13), %rsi	;, tmp126
	cmpq	$1, %r13	;, node_count
	cmove	%rax, %rsi	; tmp126,, tmp127, _4
	leaq	.LC0(%rip), %rdi	;, tmp112
	call	*create_string_not_check@GOTPCREL(%rip)	;
; src/file.c:99:     dir_path[0] = '\0';
	movb	$0, (%rax)	;, *dir_path_36
; src/file.c:101:     current = path->dirs;
	movq	(%r12), %rbx	; path_31(D)->dirs, current
; src/file.c:98:     string dir_path = create_string_not_check("", total_len + 1);
	movq	%rax, %rbp	; tmp130, dir_path
; src/file.c:103:     while (current != NULL) {
	testq	%rbx, %rbx	; current
	je	.L130	;,
; src/file.c:104:         if (current->next != NULL) {  // Not the last element
	cmpq	$0, 8(%rbx)	;, current_38->next
	je	.L130	;,
.L152:
; src/file.c:110:             strcat(dir_path, current->dir);
	movq	(%rbx), %r12	;* current, pretmp_14
.L132:
	movq	%rbp, %rdi	; dir_path,
	call	*strlen@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movq	%r12, %rsi	; pretmp_14,
	leaq	0(%rbp,%rax), %rdi	;, tmp120
	call	*stpcpy@GOTPCREL(%rip)	;
; src/file.c:113:         current = current->next;
	movq	8(%rbx), %rbx	; current_47->next, current
; src/file.c:103:     while (current != NULL) {
	testq	%rbx, %rbx	; current
	je	.L130	;,
; src/file.c:104:         if (current->next != NULL) {  // Not the last element
	cmpq	$0, 8(%rbx)	;, current_41->next
	je	.L130	;,
; src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	movq	(%rbx), %r12	; current_41->dir, pretmp_14
; src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	cmpb	$47, (%r12)	;, MEM <char[1:2]> [(void *)pretmp_14]
	je	.L154	;,
.L135:
; src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$0, 0(%rbp)	;, MEM[(const char *)dir_path_36]
	je	.L132	;,
; src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$47, -1(%rax)	;, *_12
	je	.L132	;,
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movl	$47, %ecx	;,
	movw	%cx, (%rax)	;, MEM <char[1:2]> [(void *)_60]
	jmp	.L152	;
	.p2align 4,,10
	.p2align 3
.L130:
; src/file.c:116:     return create_string(dir_path, strlen(dir_path));
	movq	%rbp, %rdi	; dir_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:117: }
	addq	$8, %rsp	;,
; src/file.c:116:     return create_string(dir_path, strlen(dir_path));
	movq	%rbp, %rdi	; dir_path,
; src/file.c:117: }
	popq	%rbx	;
; src/file.c:116:     return create_string(dir_path, strlen(dir_path));
	movq	%rax, %rsi	; tmp131, tmp114
; src/file.c:117: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; src/file.c:116:     return create_string(dir_path, strlen(dir_path));
	jmp	*create_string@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L154:
; src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	cmpb	$0, 1(%r12)	;, MEM <char[1:2]> [(void *)pretmp_14]
	je	.L132	;,
	jmp	.L135	;
.L122:
; src/file.c:117: }
	popq	%rdx	;
	xorl	%eax, %eax	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L149:
	xorl	%eax, %eax	;
	ret	
	.size	get_file_dir, .-get_file_dir
	.section	.rodata.str1.1
.LC6:
	.string	"%s/%s%s"
.LC7:
	.string	"%s%s"
	.text
	.p2align 4
	.type	rebuild_full_path, @function
rebuild_full_path:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp133, file
	subq	$8, %rsp	;,
; src/file.c:124:     string dir = get_file_dir(file);
	call	get_file_dir	;
	movq	%rax, %rbp	; tmp134, dir
; src/file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	; dir
	je	.L156	;,
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%rax, %rdi	; dir,
; src/file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	movq	%rbp, %r15	; dir, iftmp.4_55
	leaq	.LC0(%rip), %r14	;, tmp132
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rdi	; file_18(D)->name, file_18(D)->name
; src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rbx), %r13	; file_18(D)->extension, _54
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%rax, %r12	; tmp135, tmp105
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	addq	%r12, %rax	; tmp105, _52
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%rax), %r12	;, _53
; src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%r13, %r13	; _54
	je	.L167	;,
.L163:
; src/file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	movq	%r13, %rdi	; _54,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:131:     string new_path = create_string_not_check("", path_len + 1);
	movq	%r14, %rdi	; tmp132,
	leaq	1(%r12,%rax), %rsi	;, tmp122
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp140, new_path
; src/file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	testq	%rbp, %rbp	; dir
	je	.L159	;,
; src/file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpb	$0, (%r15)	;, MEM[(const char *)iftmp.4_55]
	jne	.L168	;,
.L159:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	16(%rbx), %r8	; file_18(D)->name,
	movq	%r13, %r9	; _54,
	leaq	.LC7(%rip), %rcx	;, tmp114
	xorl	%eax, %eax	;
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movq	%r12, %rdi	; new_path,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L160:
; src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%r12, %rdi	; new_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%r12, %rdi	; new_path,
; src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, %rsi	; tmp137, tmp116
; src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, 24(%rbx)	; tmp138, file_18(D)->path
; src/file.c:138: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L167:
; src/file.c:131:     string new_path = create_string_not_check("", path_len + 1);
	leaq	2(%rax), %rsi	;, tmp130
	movq	%r14, %rdi	; tmp132,
; src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	%r14, %r13	; tmp132, _54
; src/file.c:131:     string new_path = create_string_not_check("", path_len + 1);
	call	*create_string_not_check@GOTPCREL(%rip)	;
; src/file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpb	$0, (%r15)	;, MEM[(const char *)iftmp.4_55]
; src/file.c:131:     string new_path = create_string_not_check("", path_len + 1);
	movq	%rax, %r12	; tmp143, new_path
; src/file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	je	.L159	;,
.L168:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	subq	$8, %rsp	;,
	movq	$-1, %rdx	;,
	movq	%r15, %r8	; iftmp.4_55,
	xorl	%eax, %eax	;
	pushq	%r13	; _54
	movl	$2, %esi	;,
	movq	16(%rbx), %r9	; file_18(D)->name,
	movq	%r12, %rdi	; new_path,
	leaq	.LC6(%rip), %rcx	;, tmp112
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	popq	%rax	;
	popq	%rdx	;
	jmp	.L160	;
	.p2align 4,,10
	.p2align 3
.L156:
; src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rbx), %r13	; file_18(D)->extension, _54
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rdi	; file_18(D)->name, file_18(D)->name
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%r13, %r13	; _54
	je	.L162	;,
; src/file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	leaq	.LC0(%rip), %r14	;, tmp132
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%rax), %r12	;, _53
; src/file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	movq	%r14, %r15	; tmp132, iftmp.4_55
	jmp	.L163	;
	.p2align 4,,10
	.p2align 3
.L162:
; src/file.c:131:     string new_path = create_string_not_check("", path_len + 1);
	leaq	.LC0(%rip), %r13	;, tmp125
	leaq	2(%rax), %rsi	;, tmp124
	movq	%r13, %rdi	; tmp125,
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp141, new_path
	jmp	.L159	;
	.size	rebuild_full_path, .-rebuild_full_path
	.p2align 4
	.globl	get_full_path
	.type	get_full_path, @function
get_full_path:
; src/file.c:120:     return path->path;
	movq	24(%rdi), %rax	; path_2(D)->path, path_2(D)->path
; src/file.c:121: }
	ret	
	.size	get_full_path, .-get_full_path
	.p2align 4
	.globl	change_file_extension
	.type	change_file_extension, @function
change_file_extension:
; src/file.c:141:     file->extension = new_extension;
	movq	%rsi, 8(%rdi)	; tmp85, file_2(D)->extension
; src/file.c:142:     rebuild_full_path(file);
	jmp	rebuild_full_path	;
	.size	change_file_extension, .-change_file_extension
	.p2align 4
	.globl	change_file_name
	.type	change_file_name, @function
change_file_name:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rsi, %r12	; tmp107, new_name
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp106, file
	pushq	%rbx	;
; src/file.c:149:     if (file->dirs != NULL) {
	movq	(%rdi), %rax	; file_13(D)->dirs, _2
; src/file.c:146:     file->name = new_name;
	movq	%rsi, 16(%rdi)	; new_name, file_13(D)->name
; src/file.c:149:     if (file->dirs != NULL) {
	testq	%rax, %rax	; _2
	je	.L173	;,
	.p2align 4,,10
	.p2align 3
.L172:
	movq	%rax, %rbx	; _2, current
; src/file.c:153:             if (current->next == NULL) {
	movq	8(%rax), %rax	; current_8->next, _2
; src/file.c:153:             if (current->next == NULL) {
	testq	%rax, %rax	; _2
	jne	.L172	;,
; src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rbp), %r14	; file_13(D)->extension, _3
; src/file.c:156:                 size_t full_name_len = strlen(new_name);
	movq	%r12, %rdi	; new_name,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp108, full_name_len
; src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%r14, %r14	; _3
	je	.L176	;,
; src/file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	movq	%r14, %rdi	; _3,
	call	*strlen@GOTPCREL(%rip)	;
	leaq	.LC0(%rip), %rdi	;, tmp105
; src/file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	addq	%rax, %r13	; tmp109, full_name_len
.L174:
; src/file.c:159:                 string full_name = create_string_not_check("", full_name_len + 1);
	leaq	1(%r13), %rsi	;, tmp99
	call	*create_string_not_check@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r14, %r9	; _3,
	movq	%r12, %r8	; new_name,
	movl	$2, %esi	;,
; src/file.c:159:                 string full_name = create_string_not_check("", full_name_len + 1);
	movq	%rax, %r13	; tmp110, full_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC7(%rip), %rcx	;, tmp101
	movq	$-1, %rdx	;,
	movq	%rax, %rdi	; full_name,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%r13, %rdi	; full_name,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%r13, %rdi	; full_name,
; src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rax, %rsi	; tmp111, tmp103
; src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rax, (%rbx)	; tmp112, current_28->dir
.L173:
; src/file.c:169: }
	popq	%rbx	;
; src/file.c:168:     rebuild_full_path(file);
	movq	%rbp, %rdi	; file,
; src/file.c:169: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; src/file.c:168:     rebuild_full_path(file);
	jmp	rebuild_full_path	;
	.p2align 4,,10
	.p2align 3
.L176:
; src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	leaq	.LC0(%rip), %rdi	;, tmp105
	movq	%rdi, %r14	; tmp105, _3
	jmp	.L174	;
	.size	change_file_name, .-change_file_name
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
