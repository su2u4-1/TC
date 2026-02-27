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
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp134, path
	pushq	%rsi	;
; src/file.c:21:     size_t path_len = strlen(path);
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:22:     for (size_t i = 0; i < path_len; i++) {
	xorl	%edx, %edx	; i
; src/file.c:21:     size_t path_len = strlen(path);
	movq	%rax, %rbp	; tmp135, path_len
.L3:
; src/file.c:22:     for (size_t i = 0; i < path_len; i++) {
	cmpq	%rbp, %rdx	; path_len, i
	jnb	.L31	;,
; src/file.c:23:         if (path[i] == '\\') path[i] = '/';
	leaq	(%rbx,%rdx), %rcx	;, _1
	movb	(%rcx), %al	; *_1, _2
; src/file.c:23:         if (path[i] == '\\') path[i] = '/';
	cmpb	$92, %al	;, _2
	jne	.L4	;,
; src/file.c:23:         if (path[i] == '\\') path[i] = '/';
	movb	$47, (%rcx)	;, *_1
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rdx	;, i
	jbe	.L9	;,
.L10:
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-1(%rbx,%rdx), %rdi	;, _6
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$46, (%rdi)	;, *_6
	jne	.L11	;,
	jmp	.L32	;
.L4:
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rdx	;, i
	jbe	.L9	;,
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, %al	;, _2
	jne	.L11	;,
	jmp	.L10	;
.L32:
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, -2(%rbx,%rdx)	;, *_9
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-2(%rdx), %r12	;, _8
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	jne	.L11	;,
; src/file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	%rbp, %rax	; path_len, tmp118
; src/file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	leaq	1(%rbx,%rdx), %rsi	;, tmp120
; src/file.c:26:             path_len -= 2;
	subq	$2, %rbp	;, path_len
; src/file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	subq	%rdx, %rax	; i, tmp118
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	movq	%rax, %rdx	; tmp118,
	call	*memmove@GOTPCREL(%rip)	;
; src/file.c:27:             i -= 2;
	movq	%r12, %rdx	; _8, i
.L9:
; src/file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	testq	%rdx, %rdx	; i
	je	.L12	;,
.L11:
; src/file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	(%rbx,%rdx), %rdi	;, _14
; src/file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, (%rdi)	;, *_14
	jne	.L12	;,
; src/file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, -1(%rbx,%rdx)	;, *_17
; src/file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	-1(%rdx), %r12	;, _16
; src/file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	jne	.L12	;,
; src/file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	movq	%rbp, %rax	; path_len, tmp124
; src/file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	leaq	1(%rbx,%rdx), %rsi	;, tmp126
; src/file.c:31:             path_len--;
	decq	%rbp	; path_len
; src/file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	subq	%rdx, %rax	; i, tmp124
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	movq	%rax, %rdx	; tmp124,
	call	*memmove@GOTPCREL(%rip)	;
; src/file.c:32:             i--;
	movq	%r12, %rdx	; _16, i
.L12:
; src/file.c:22:     for (size_t i = 0; i < path_len; i++) {
	incq	%rdx	; i
	jmp	.L3	;
.L31:
; src/file.c:39:     if (path_len > 0 && path[0] == '/')
	testq	%rbp, %rbp	; path_len
	je	.L14	;,
; src/file.c:39:     if (path_len > 0 && path[0] == '/')
	cmpb	$47, (%rbx)	;, *path_38(D)
	je	.L15	;,
.L14:
; src/file.c:42:     string cwd = get_cwd();
	call	get_cwd	;
	movq	%rax, %r12	; tmp136, cwd
; src/file.c:43:     if (cwd == NULL)
	testq	%rax, %rax	; cwd
	je	.L15	;,
; src/file.c:45:     size_t total_len = strlen(cwd) + 1 + path_len + 1;
	movq	%rax, %rdi	; cwd,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:46:     string abs_path = create_string("", total_len);
	leaq	.LC0(%rip), %rdi	;, tmp131
; src/file.c:45:     size_t total_len = strlen(cwd) + 1 + path_len + 1;
	leaq	2(%rbp,%rax), %r13	;, total_len
; src/file.c:46:     string abs_path = create_string("", total_len);
	movq	%r13, %rsi	; total_len,
	call	*create_string@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%rbx, %r9	; path,
	movq	%r12, %r8	; cwd,
	movl	$2, %esi	;,
; src/file.c:46:     string abs_path = create_string("", total_len);
	movq	%rax, %rbp	; tmp138, abs_path
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC1(%rip), %rcx	;, tmp132
	movq	%rax, %rdi	; abs_path,
	orq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/file.c:48:     free(cwd);
	movq	%r12, %rdi	; cwd,
	call	*free@GOTPCREL(%rip)	;
; src/file.c:50: }
	popq	%rcx	;
; src/file.c:49:     return create_string(abs_path, total_len);
	movq	%r13, %rsi	; total_len,
; src/file.c:50: }
	popq	%rbx	;
; src/file.c:49:     return create_string(abs_path, total_len);
	movq	%rbp, %rdi	; abs_path,
; src/file.c:50: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; src/file.c:49:     return create_string(abs_path, total_len);
	jmp	*create_string@GOTPCREL(%rip)	;
.L15:
; src/file.c:50: }
	popq	%rdx	;
	movq	%rbx, %rax	; path,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	absolute_path, .-absolute_path
	.globl	get_file_name
	.type	get_file_name, @function
get_file_name:
; src/file.c:53:     return path->name;
	movq	16(%rdi), %rax	; path_2(D)->name, path_2(D)->name
; src/file.c:54: }
	ret	
	.size	get_file_name, .-get_file_name
	.globl	get_file_extension
	.type	get_file_extension, @function
get_file_extension:
; src/file.c:57:     return path->extension;
	movq	8(%rdi), %rax	; path_2(D)->extension, path_2(D)->extension
; src/file.c:58: }
	ret	
	.size	get_file_extension, .-get_file_extension
	.section	.rodata.str1.1
.LC2:
	.string	"/"
	.text
	.globl	get_file_dir
	.type	get_file_dir, @function
get_file_dir:
; src/file.c:61:     if (path->dirs == 0) return 0;
	movq	(%rdi), %rax	; path_31(D)->dirs, <retval>
; src/file.c:61:     if (path->dirs == 0) return 0;
	testq	%rax, %rax	; <retval>
	je	.L56	;,
; src/file.c:60: string get_file_dir(File* path) {
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp123, path
	pushq	%rbp	;
; src/file.c:65:     size_t node_count = 0;
	xorl	%ebp, %ebp	; node_count
; src/file.c:60: string get_file_dir(File* path) {
	pushq	%rbx	;
; src/file.c:64:     size_t total_len = 0;
	xorl	%ebx, %ebx	; total_len
; src/file.c:60: string get_file_dir(File* path) {
	pushq	%rsi	;
.L38:
; src/file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	movq	8(%rax), %r13	; current_53->next, _2
; src/file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	testq	%r13, %r13	; _2
	je	.L37	;,
; src/file.c:69:             size_t dir_len = strlen((current->dir));
	movq	(%rax), %rdi	; current_53->dir,
; src/file.c:71:             node_count++;
	incq	%rbp	; node_count
; src/file.c:69:             size_t dir_len = strlen((current->dir));
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:70:             total_len += dir_len;
	addq	%rax, %rbx	; tmp124, total_len
; src/file.c:71:             node_count++;
	movq	%r13, %rax	; _2, <retval>
	jmp	.L38	;
.L37:
; src/file.c:76:     if (node_count == 0) return 0;
	testq	%rbp, %rbp	; node_count
	je	.L35	;,
; src/file.c:79:     if (node_count > 1)
	cmpq	$1, %rbp	;, node_count
	je	.L39	;,
; src/file.c:80:         total_len += node_count - 1;
	leaq	-1(%rbx,%rbp), %rbx	;, total_len
.L39:
; src/file.c:83:     string dir_path = create_string("", total_len + 1);
	leaq	1(%rbx), %rsi	;, tmp107
	leaq	.LC0(%rip), %rdi	;, tmp108
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:84:     dir_path[0] = '\0';
	movb	$0, (%rax)	;, *dir_path_36
; src/file.c:83:     string dir_path = create_string("", total_len + 1);
	movq	%rax, %rbx	; tmp125, dir_path
; src/file.c:86:     current = path->dirs;
	movq	(%r12), %rbp	; path_31(D)->dirs, current
; src/file.c:87:     bool first = true;
	movb	$1, %al	;, first
; src/file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	leaq	.LC2(%rip), %r12	;, tmp122
.L40:
; src/file.c:88:     while (current != 0) {
	testq	%rbp, %rbp	; current
	je	.L59	;,
; src/file.c:89:         if (current->next != 0) {  // Not the last element
	cmpq	$0, 8(%rbp)	;, current_22->next
	je	.L41	;,
; src/file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	testb	%al, %al	; first
	jne	.L42	;,
; src/file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	movq	0(%rbp), %rdi	; current_22->dir,
	movq	%r12, %rsi	; tmp122,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	testl	%eax, %eax	; tmp126
	je	.L42	;,
; src/file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$0, (%rbx)	;, MEM[(const char *)dir_path_36]
	je	.L42	;,
; src/file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	movq	%rbx, %rdi	; dir_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$47, -1(%rbx,%rax)	;, *_12
	je	.L42	;,
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movq	%r12, %rsi	; tmp122,
	movq	%rbx, %rdi	; dir_path,
	call	*strcat@GOTPCREL(%rip)	;
.L42:
	movq	0(%rbp), %rsi	; current_22->dir,
	movq	%rbx, %rdi	; dir_path,
	call	*strcat@GOTPCREL(%rip)	;
; src/file.c:96:             first = false;
	xorl	%eax, %eax	; first
.L41:
; src/file.c:98:         current = current->next;
	movq	8(%rbp), %rbp	; current_22->next, current
	jmp	.L40	;
.L59:
; src/file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	%rbx, %rdi	; dir_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:102: }
	popq	%rcx	;
; src/file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	%rbx, %rdi	; dir_path,
; src/file.c:102: }
	popq	%rbx	;
; src/file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	%rax, %rsi	; tmp128, tmp117
; src/file.c:102: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; src/file.c:101:     return create_string(dir_path, strlen(dir_path));
	jmp	*create_string@GOTPCREL(%rip)	;
.L35:
; src/file.c:102: }
	popq	%rdx	;
	xorl	%eax, %eax	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L56:
	xorl	%eax, %eax	;
	ret	
	.size	get_file_dir, .-get_file_dir
	.globl	get_full_path
	.type	get_full_path, @function
get_full_path:
; src/file.c:105:     return path->path;
	movq	24(%rdi), %rax	; path_2(D)->path, path_2(D)->path
; src/file.c:106: }
	ret	
	.size	get_full_path, .-get_full_path
	.globl	change_file_extension
	.type	change_file_extension, @function
change_file_extension:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	leaq	.LC0(%rip), %r12	;, iftmp.2_13
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp129, file
; src/file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	movq	%r12, %r14	; iftmp.2_13, iftmp.2_13
; src/file.c:108: void change_file_extension(File* file, const string new_extension) {
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp130, new_extension
	subq	$24, %rsp	;,
; src/file.c:109:     file->extension = new_extension;
	movq	%rsi, 8(%rdi)	; new_extension, file_18(D)->extension
; src/file.c:112:     string dir = get_file_dir(file);
	call	get_file_dir	;
; src/file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	; dir
; src/file.c:112:     string dir = get_file_dir(file);
	movq	%rax, %r13	; tmp131, dir
; src/file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	cmovne	%rax, %r14	; dir,, iftmp.2_13
; src/file.c:114:     string ext_cstr = new_extension != NULL ? new_extension : "";
	testq	%rbx, %rbx	; new_extension
	movq	%r12, %rax	; iftmp.2_13, iftmp.3_14
	cmovne	%rbx, %rax	; new_extension,, iftmp.3_14
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%r14, %rdi	; iftmp.2_13,
; src/file.c:114:     string ext_cstr = new_extension != NULL ? new_extension : "";
	movq	%rax, 8(%rsp)	; iftmp.3_14, %sfp
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbp), %rdi	; file_18(D)->name, file_18(D)->name
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%rax, %r15	; tmp132, tmp101
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%r15,%rax), %r15	;, path_len
; src/file.c:117:     if (new_extension != 0) path_len += strlen(ext_cstr);
	testq	%rbx, %rbx	; new_extension
	je	.L64	;,
; src/file.c:117:     if (new_extension != 0) path_len += strlen(ext_cstr);
	movq	8(%rsp), %rdi	; %sfp,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:117:     if (new_extension != 0) path_len += strlen(ext_cstr);
	addq	%rax, %r15	; tmp134, path_len
.L64:
; src/file.c:119:     string new_path = create_string("", path_len + 1);
	movq	%r12, %rdi	; iftmp.2_13,
	leaq	1(%r15), %rsi	;, tmp111
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	testq	%r13, %r13	; dir
	movq	16(%rbp), %r9	; file_18(D)->name, file_18(D)->name
; src/file.c:119:     string new_path = create_string("", path_len + 1);
	movq	%rax, %r12	; tmp135, new_path
; src/file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	je	.L65	;,
; src/file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	cmpb	$0, (%r14)	;, MEM[(const char *)iftmp.2_13]
	je	.L65	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%rax, %rdi	; new_path,
	movq	%r14, %r8	; iftmp.2_13,
	leaq	.LC1(%rip), %rcx	;, tmp114
	xorl	%eax, %eax	;
	orq	$-1, %rdx	;,
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L66	;
.L65:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r9, %rsi	; file_18(D)->name,
	movq	%r12, %rdi	; new_path,
	call	*strcpy@GOTPCREL(%rip)	;
.L66:
; src/file.c:125:     if (new_extension != 0)
	testq	%rbx, %rbx	; new_extension
	je	.L67	;,
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movq	%rbx, %rsi	; new_extension,
	movq	%r12, %rdi	; new_path,
	call	*strcat@GOTPCREL(%rip)	;
.L67:
; src/file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%r12, %rdi	; new_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%r12, %rdi	; new_path,
; src/file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, %rsi	; tmp136, tmp117
; src/file.c:128:     file->path = create_string(new_path, strlen(new_path));
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, 24(%rbp)	; tmp137, file_18(D)->path
; src/file.c:129: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	change_file_extension, .-change_file_extension
	.section	.rodata.str1.1
.LC3:
	.string	"%s%s"
.LC4:
	.string	"%s/%s%s"
	.text
	.globl	change_file_name
	.type	change_file_name, @function
change_file_name:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp152, new_name
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp151, file
	subq	$24, %rsp	;,
; src/file.c:135:     if (file->dirs != 0) {
	movq	(%rdi), %rax	; file_26(D)->dirs, _1
; src/file.c:132:     file->name = new_name;
	movq	%rsi, 16(%rdi)	; new_name, file_26(D)->name
; src/file.c:135:     if (file->dirs != 0) {
	testq	%rax, %rax	; _1
	je	.L82	;,
.L81:
	movq	%rax, %r15	; _1, current
; src/file.c:139:             if (current->next == 0) {
	movq	8(%rax), %rax	; current_17->next, _1
; src/file.c:139:             if (current->next == 0) {
	testq	%rax, %rax	; _1
	jne	.L81	;,
; src/file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rbx), %r13	; file_26(D)->extension, _3
	leaq	.LC0(%rip), %r14	;, iftmp.4_20
; src/file.c:142:                 size_t full_name_len = strlen(new_name);
	movq	%rbp, %rdi	; new_name,
; src/file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	%r14, %rax	; iftmp.4_20, iftmp.4_20
	testq	%r13, %r13	; _3
	cmovne	%r13, %rax	; _3,, iftmp.4_20
	movq	%rax, (%rsp)	; iftmp.4_20, %sfp
; src/file.c:142:                 size_t full_name_len = strlen(new_name);
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp153, full_name_len
; src/file.c:143:                 if (file->extension != 0) full_name_len += strlen(ext_cstr);
	testq	%r13, %r13	; _3
	je	.L84	;,
; src/file.c:143:                 if (file->extension != 0) full_name_len += strlen(ext_cstr);
	movq	(%rsp), %rdi	; %sfp,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:143:                 if (file->extension != 0) full_name_len += strlen(ext_cstr);
	addq	%rax, %r12	; tmp154, full_name_len
.L84:
; src/file.c:145:                 string full_name = create_string("", full_name_len + 1);
	leaq	1(%r12), %rsi	;, tmp114
	movq	%r14, %rdi	; iftmp.4_20,
	call	*create_string@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	(%rsp), %r9	; %sfp,
	movq	%rbp, %r8	; new_name,
	orq	$-1, %rdx	;,
; src/file.c:145:                 string full_name = create_string("", full_name_len + 1);
	movq	%rax, %r12	; tmp155, full_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC3(%rip), %rcx	;, tmp116
	movl	$2, %esi	;,
	movq	%rax, %rdi	; full_name,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%r12, %rdi	; full_name,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%r12, %rdi	; full_name,
; src/file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rax, %rsi	; tmp156, tmp118
; src/file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rax, (%r15)	; tmp157, current_46->dir
.L82:
; src/file.c:155:     string dir = get_file_dir(file);
	movq	%rbx, %rdi	; file,
	leaq	.LC0(%rip), %r12	;, iftmp.5_21
	call	get_file_dir	;
; src/file.c:156:     string dir_cstr = dir != NULL ? dir : "";
	movq	%r12, %r15	; iftmp.5_21, iftmp.5_21
; src/file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	movq	8(%rbx), %rdx	; file_26(D)->extension, _8
; src/file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	movq	%r12, %r14	; iftmp.5_21, iftmp.6_22
; src/file.c:156:     string dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	; dir
; src/file.c:155:     string dir = get_file_dir(file);
	movq	%rax, %r13	; tmp158, dir
; src/file.c:156:     string dir_cstr = dir != NULL ? dir : "";
	cmovne	%rax, %r15	; dir,, iftmp.5_21
; src/file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	testq	%rdx, %rdx	; _8
	movq	%rdx, 8(%rsp)	; _8, %sfp
	cmovne	%rdx, %r14	; _8,, iftmp.6_22
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%r15, %rdi	; iftmp.5_21,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%rbp, %rdi	; new_name,
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%rax, (%rsp)	; tmp121, %sfp
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	(%rsp), %rcx	; %sfp, tmp121
; src/file.c:160:     if (file->extension != 0) path_len += strlen(ext_cstr);
	movq	8(%rsp), %rdx	; %sfp, _8
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	leaq	1(%rcx,%rax), %rsi	;, path_len
; src/file.c:160:     if (file->extension != 0) path_len += strlen(ext_cstr);
	testq	%rdx, %rdx	; _8
	je	.L88	;,
	movq	%rsi, (%rsp)	; path_len, %sfp
; src/file.c:160:     if (file->extension != 0) path_len += strlen(ext_cstr);
	movq	%r14, %rdi	; iftmp.6_22,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:160:     if (file->extension != 0) path_len += strlen(ext_cstr);
	movq	(%rsp), %rsi	; %sfp, path_len
	addq	%rax, %rsi	; tmp161, path_len
.L88:
; src/file.c:162:     string new_path = create_string("", path_len + 1);
	movq	%r12, %rdi	; iftmp.5_21,
	incq	%rsi	; tmp130
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp162, new_path
; src/file.c:163:     if (dir != NULL && strlen(dir_cstr) > 0)
	testq	%r13, %r13	; dir
	je	.L89	;,
; src/file.c:163:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpb	$0, (%r15)	;, MEM[(const char *)iftmp.5_21]
	je	.L89	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC4(%rip), %rcx	;, tmp132
	movq	%rbp, %r9	; new_name,
	movq	%r15, %r8	; iftmp.5_21,
	movq	%r12, %rdi	; new_path,
	orq	$-1, %rdx	;,
	movl	$2, %esi	;,
	pushq	%rax	;
	xorl	%eax, %eax	;
	pushq	%r14	; iftmp.6_22
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	popq	%rdx	;
	popq	%rcx	;
	jmp	.L90	;
.L89:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r14, %r9	; iftmp.6_22,
	movq	%rbp, %r8	; new_name,
	leaq	.LC3(%rip), %rcx	;, tmp133
	movq	%r12, %rdi	; new_path,
	orq	$-1, %rdx	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L90:
; src/file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%r12, %rdi	; new_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%r12, %rdi	; new_path,
; src/file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, %rsi	; tmp163, tmp135
; src/file.c:168:     file->path = create_string(new_path, strlen(new_path));
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, 24(%rbx)	; tmp164, file_26(D)->path
; src/file.c:169: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	change_file_name, .-change_file_name
	.section	.rodata.str1.1
.LC5:
	.string	"."
.LC6:
	.string	".."
	.text
	.globl	normalize_path
	.type	normalize_path, @function
normalize_path:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp198, file
	pushq	%rbx	;
	subq	$296, %rsp	;,
; src/file.c:172:     size_t path_len = strlen(file->path);
	movq	24(%rdi), %rdi	; file_74(D)->path, file_74(D)->path
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:175:     string path_copy = create_string("", path_len + 1);
	leaq	.LC0(%rip), %rdi	;,
; src/file.c:172:     size_t path_len = strlen(file->path);
	movq	%rax, %r13	; tmp199, tmp142
; src/file.c:175:     string path_copy = create_string("", path_len + 1);
	leaq	1(%rax), %rsi	;, tmp144
	call	*create_string@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	movq	24(%rbp), %rsi	; file_74(D)->path, file_74(D)->path
; src/file.c:175:     string path_copy = create_string("", path_len + 1);
	movq	%rax, 8(%rsp)	; tmp200, %sfp
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	movq	%rax, %rdi	; tmp200,
	call	*strcpy@GOTPCREL(%rip)	;
; src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	testq	%r13, %r13	; tmp142
	je	.L126	;,
; src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	movq	8(%rsp), %rax	; %sfp, path_copy
	cmpb	$47, (%rax)	;, *path_copy_77
	jne	.L126	;,
; src/file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/file.c:199:         node->dir = create_string("/", 1);
	movl	$1, %esi	;,
	leaq	.LC2(%rip), %rdi	;, tmp147
; src/file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %r14	; tmp201, node
; src/file.c:199:         node->dir = create_string("/", 1);
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:200:         node->next = 0;
	xorl	%edi, %edi	;
; src/file.c:204:         start = 1;
	movl	$1, %esi	;, start
; src/file.c:199:         node->dir = create_string("/", 1);
	movq	%rax, (%r14)	; tmp202, node_79->dir
; src/file.c:200:         node->next = 0;
	movq	%rdi, 8(%r14)	;, node_79->next
	jmp	.L106	;
.L126:
; src/file.c:181:     size_t start = 0;
	xorl	%esi, %esi	; start
; src/file.c:178:     StrNode* dirs_head = 0;
	xorl	%r14d, %r14d	; node
.L106:
; src/file.c:209:     size_t i = start;
	movq	%rsi, %r12	; start, i
; src/file.c:210:     while (i <= path_len) {
	movq	%r14, %rbx	; node, node
.L107:
; src/file.c:210:     while (i <= path_len) {
	cmpq	%r12, %r13	; i, tmp142
	jb	.L160	;,
; src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpq	%r13, %r12	; tmp142, i
	je	.L108	;,
; src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	movq	8(%rsp), %rax	; %sfp, path_copy
	cmpb	$47, (%rax,%r12)	;, MEM[(char *)path_copy_77 + i_56 * 1]
	jne	.L109	;,
.L108:
; src/file.c:212:             if (i > start) {
	cmpq	%r12, %rsi	; i, start
	jnb	.L110	;,
; src/file.c:213:                 size_t comp_len = i - start;
	movq	%r12, %rax	; i, comp_len
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:95:   return __builtin___strncpy_chk (__dest, __src, __len,
	movl	$256, %ecx	;,
; src/file.c:213:                 size_t comp_len = i - start;
	subq	%rsi, %rax	; start, comp_len
	movq	%rax, 24(%rsp)	; comp_len, %sfp
; src/file.c:215:                 strncpy(component, path_copy + start, comp_len);
	movq	8(%rsp), %rax	; %sfp, path_copy
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:95:   return __builtin___strncpy_chk (__dest, __src, __len,
	movq	24(%rsp), %rdx	; %sfp,
; src/file.c:215:                 strncpy(component, path_copy + start, comp_len);
	addq	%rax, %rsi	; path_copy, tmp148
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:95:   return __builtin___strncpy_chk (__dest, __src, __len,
	leaq	32(%rsp), %rax	;, tmp232
	movq	%rax, %rdi	; tmp232,
	movq	%rax, 16(%rsp)	; tmp232, %sfp
	call	*__strncpy_chk@GOTPCREL(%rip)	;
; src/file.c:216:                 component[comp_len] = '\0';
	movq	24(%rsp), %rax	; %sfp, comp_len
; src/file.c:218:                 if (strcmp(component, ".") == 0) {
	movq	16(%rsp), %rdi	; %sfp,
	leaq	.LC5(%rip), %rsi	;,
; src/file.c:216:                 component[comp_len] = '\0';
	movb	$0, 32(%rsp,%rax)	;, component[comp_len_105]
; src/file.c:218:                 if (strcmp(component, ".") == 0) {
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:218:                 if (strcmp(component, ".") == 0) {
	testl	%eax, %eax	; tmp203
	je	.L110	;,
; src/file.c:220:                 } else if (strcmp(component, "..") == 0) {
	movq	16(%rsp), %rdi	; %sfp,
	leaq	.LC6(%rip), %rsi	;,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:220:                 } else if (strcmp(component, "..") == 0) {
	testl	%eax, %eax	; tmp204
	jne	.L112	;,
; src/file.c:222:                     if (dirs_tail != 0 && dirs_tail != dirs_head) {
	testq	%r14, %r14	; node
	je	.L113	;,
	cmpq	%r14, %rbx	; node, node
	je	.L113	;,
; src/file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	movq	(%r14), %rdi	; dirs_tail_52->dir,
	leaq	.LC6(%rip), %rsi	;,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	testl	%eax, %eax	; tmp205
	jne	.L127	;,
; src/file.c:225:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/file.c:226:                             node->dir = create_string("..", 2);
	movl	$2, %esi	;,
	leaq	.LC6(%rip), %rdi	;,
; src/file.c:225:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %r15	; tmp206, node
; src/file.c:226:                             node->dir = create_string("..", 2);
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:227:                             node->next = 0;
	xorl	%esi, %esi	;
; src/file.c:226:                             node->dir = create_string("..", 2);
	movq	%rax, (%r15)	; tmp207, node_120->dir
; src/file.c:227:                             node->next = 0;
	movq	%rsi, 8(%r15)	;, node_120->next
; src/file.c:228:                             dirs_tail->next = node;
	movq	%r15, 8(%r14)	; node, dirs_tail_52->next
	jmp	.L159	;
.L127:
; src/file.c:232:                             StrNode* prev = dirs_head;
	movq	%rbx, %rax	; node, prev
.L114:
; src/file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	testq	%rax, %rax	; prev
	je	.L110	;,
; src/file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	movq	8(%rax), %rdx	; prev_57->next, _17
; src/file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	cmpq	%r14, %rdx	; node, _17
	je	.L161	;,
; src/file.c:234:                                 prev = prev->next;
	movq	%rdx, %rax	; _17, prev
	jmp	.L114	;
.L161:
; src/file.c:237:                                 prev->next = 0;
	xorl	%ecx, %ecx	;
; src/file.c:238:                                 dirs_tail = prev;
	movq	%rax, %r14	; prev, node
; src/file.c:237:                                 prev->next = 0;
	movq	%rcx, 8(%rax)	;, prev_57->next
	jmp	.L110	;
.L113:
; src/file.c:241:                     } else if (dirs_head == 0) {
	testq	%rbx, %rbx	; node
	jne	.L110	;,
; src/file.c:243:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/file.c:244:                         node->dir = create_string("..", 2);
	movl	$2, %esi	;,
	leaq	.LC6(%rip), %rdi	;,
; src/file.c:243:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %rbx	; tmp208, node
; src/file.c:244:                         node->dir = create_string("..", 2);
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:245:                         node->next = 0;
	xorl	%edx, %edx	;
; src/file.c:244:                         node->dir = create_string("..", 2);
	movq	%rax, (%rbx)	; tmp209, node_114->dir
; src/file.c:245:                         node->next = 0;
	movq	%rdx, 8(%rbx)	;, node_114->next
	jmp	.L158	;
.L112:
; src/file.c:249:                 } else if (strlen(component) > 0) {
	cmpb	$0, 32(%rsp)	;, MEM[(const char *)&component]
	je	.L110	;,
; src/file.c:251:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/file.c:252:                     node->dir = create_string(component, comp_len);
	movq	24(%rsp), %rsi	; %sfp,
	movq	16(%rsp), %rdi	; %sfp,
; src/file.c:251:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %r15	; tmp210, node
; src/file.c:252:                     node->dir = create_string(component, comp_len);
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:252:                     node->dir = create_string(component, comp_len);
	movq	%rax, (%r15)	; tmp211, node_108->dir
; src/file.c:253:                     node->next = 0;
	xorl	%eax, %eax	;
	movq	%rax, 8(%r15)	;, node_108->next
; src/file.c:255:                     if (dirs_tail != 0)
	testq	%r14, %r14	; node
	je	.L115	;,
; src/file.c:256:                         (dirs_tail)->next = node;
	movq	%r15, 8(%r14)	; node, dirs_tail_52->next
.L115:
; src/file.c:259:                     if (dirs_head == 0) dirs_head = node;
	testq	%rbx, %rbx	; node
	je	.L129	;,
.L159:
; src/file.c:258:                     dirs_tail = node;
	movq	%r15, %r14	; node, node
	jmp	.L110	;
.L129:
	movq	%r15, %rbx	; node, node
.L158:
; src/file.c:259:                     if (dirs_head == 0) dirs_head = node;
	movq	%rbx, %r14	; node, node
.L110:
; src/file.c:262:             start = i + 1;
	leaq	1(%r12), %rsi	;, start
.L109:
; src/file.c:264:         i++;
	incq	%r12	; i
	jmp	.L107	;
.L160:
; src/file.c:268:     file->dirs = dirs_head;
	movq	%rbx, 0(%rbp)	; node, file_74(D)->dirs
; src/file.c:271:     if (dirs_tail != 0) {
	testq	%r14, %r14	; node
	je	.L117	;,
; src/file.c:272:         string dot = strrchr(dirs_tail->dir, '.');
	movq	(%r14), %r14	; dirs_tail_52->dir, node
; src/file.c:272:         string dot = strrchr(dirs_tail->dir, '.');
	movl	$46, %esi	;,
	movq	%r14, %rdi	; node,
	call	*strrchr@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp212, dot
; src/file.c:274:         if (dot != NULL && dot != dirs_tail->dir) {
	testq	%rax, %rax	; dot
	je	.L117	;,
	cmpq	%rax, %r14	; dot, node
	je	.L117	;,
; src/file.c:276:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	%rax, %rsi	; dot, name_len
; src/file.c:277:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%r14, %rdi	; node,
; src/file.c:276:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	subq	%r14, %rsi	; node, name_len
; src/file.c:277:             file->name = create_string(dirs_tail->dir, name_len);
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:278:             file->extension = create_string(dot, strlen(dot));
	movq	%r12, %rdi	; dot,
; src/file.c:277:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%rax, 16(%rbp)	; tmp213, file_74(D)->name
; src/file.c:278:             file->extension = create_string(dot, strlen(dot));
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:278:             file->extension = create_string(dot, strlen(dot));
	movq	%r12, %rdi	; dot,
; src/file.c:278:             file->extension = create_string(dot, strlen(dot));
	movq	%rax, %rsi	; tmp214, tmp174
; src/file.c:278:             file->extension = create_string(dot, strlen(dot));
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:274:         if (dot != NULL && dot != dirs_tail->dir) {
	jmp	.L118	;
.L117:
; src/file.c:281:             file->name = dirs_tail->dir;
	movq	%r14, 16(%rbp)	; node, file_74(D)->name
	xorl	%eax, %eax	; _33
.L118:
; src/file.c:282:             file->extension = 0;
	movq	%rax, 8(%rbp)	; _33, file_74(D)->extension
; src/file.c:291:     StrNode* current = dirs_head;
	movq	%rbx, %r14	; node, current
; src/file.c:292:     size_t node_count = 0;
	xorl	%r13d, %r13d	; node_count
; src/file.c:290:     size_t full_path_len = 0;
	xorl	%r12d, %r12d	; full_path_len
.L119:
; src/file.c:294:     while (current != 0) {
	testq	%r14, %r14	; current
	je	.L162	;,
; src/file.c:295:         full_path_len += strlen(current->dir);
	movq	(%r14), %rdi	; current_60->dir,
; src/file.c:296:         node_count++;
	incq	%r13	; node_count
; src/file.c:295:         full_path_len += strlen(current->dir);
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:297:         current = current->next;
	movq	8(%r14), %r14	; current_60->next, current
; src/file.c:295:         full_path_len += strlen(current->dir);
	addq	%rax, %r12	; tmp216, full_path_len
	jmp	.L119	;
.L162:
; src/file.c:301:     if (node_count > 1)
	cmpq	$1, %r13	;, node_count
	jbe	.L121	;,
; src/file.c:302:         full_path_len += (node_count - 1);
	leaq	-1(%r12,%r13), %r12	;, full_path_len
.L121:
; src/file.c:304:     string full_path = create_string("", full_path_len + 1);
	leaq	1(%r12), %rsi	;, tmp179
	leaq	.LC0(%rip), %rdi	;,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	leaq	.LC2(%rip), %r13	;, tmp196
; src/file.c:305:     full_path[0] = '\0';
	movb	$0, (%rax)	;, *full_path_97
; src/file.c:304:     string full_path = create_string("", full_path_len + 1);
	movq	%rax, %r12	; tmp217, full_path
; src/file.c:308:     bool is_first = true;
	movb	$1, %al	;, is_first
.L122:
; src/file.c:309:     while (current != 0) {
	testq	%rbx, %rbx	; node
	je	.L163	;,
; src/file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testb	%al, %al	; is_first
	jne	.L123	;,
; src/file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	(%rbx), %rdi	; current_61->dir,
	movq	%r13, %rsi	; tmp196,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testl	%eax, %eax	; tmp218
	je	.L123	;,
; src/file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$0, (%r12)	;, MEM[(const char *)full_path_97]
	je	.L123	;,
; src/file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	movq	%r12, %rdi	; full_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$47, -1(%r12,%rax)	;, *_38
	je	.L123	;,
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movq	%r13, %rsi	; tmp196,
	movq	%r12, %rdi	; full_path,
	call	*strcat@GOTPCREL(%rip)	;
.L123:
	movq	(%rbx), %rsi	; current_61->dir,
	movq	%r12, %rdi	; full_path,
	call	*strcat@GOTPCREL(%rip)	;
; src/file.c:318:         current = current->next;
	movq	8(%rbx), %rbx	; current_61->next, node
; src/file.c:317:         is_first = false;
	xorl	%eax, %eax	; is_first
	jmp	.L122	;
.L163:
; src/file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%r12, %rdi	; full_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%r12, %rdi	; full_path,
; src/file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, %rsi	; tmp220, tmp189
; src/file.c:321:     file->path = create_string(full_path, strlen(full_path));
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, 24(%rbp)	; tmp221, file_74(D)->path
; src/file.c:322: }
	addq	$296, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	normalize_path, .-normalize_path
	.globl	create_file
	.type	create_file, @function
create_file:
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp86, path
; src/file.c:14:     File* file = (File*)alloc_memory(sizeof(File));
	movl	$32, %edi	;,
; src/file.c:13: File* create_file(const string path) {
	pushq	%rbx	;
	pushq	%rax	;
; src/file.c:14:     File* file = (File*)alloc_memory(sizeof(File));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/file.c:15:     file->path = absolute_path(path);
	movq	%rbp, %rdi	; path,
; src/file.c:14:     File* file = (File*)alloc_memory(sizeof(File));
	movq	%rax, %rbx	; tmp87, <retval>
; src/file.c:15:     file->path = absolute_path(path);
	call	absolute_path	;
; src/file.c:16:     normalize_path(file);
	movq	%rbx, %rdi	; <retval>,
; src/file.c:15:     file->path = absolute_path(path);
	movq	%rax, 24(%rbx)	; tmp88, file_4->path
; src/file.c:16:     normalize_path(file);
	call	normalize_path	;
; src/file.c:18: }
	movq	%rbx, %rax	; <retval>,
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_file, .-create_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
