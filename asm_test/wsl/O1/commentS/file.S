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
	movq	%rdi, %rbx	; tmp134, path
; src/file.c:21:     size_t path_len = strlen(path);
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp112, path_len
; src/file.c:22:     for (size_t i = 0; i < path_len; i++) {
	testq	%rax, %rax	; tmp112
	je	.L4	;,
; src/file.c:22:     for (size_t i = 0; i < path_len; i++) {
	movl	$0, %eax	;, i
	jmp	.L11	;
.L23:
; src/file.c:23:         if (path[i] == '\\') path[i] = '/';
	movb	$47, (%rcx)	;, *_1
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rax	;, i
	jbe	.L20	;,
.L6:
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-1(%rbx,%rax), %rdi	;, _5
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$46, (%rdi)	;, *_5
	je	.L21	;,
.L10:
; src/file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	(%rbx,%rax), %rdi	;, _13
; src/file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, (%rdi)	;, *_13
	jne	.L9	;,
.L13:
; src/file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	-1(%rax), %r12	;, _15
; src/file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, -1(%rbx,%rax)	;, *_16
	jne	.L9	;,
; src/file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	movq	%rbp, %rdx	; path_len, tmp124
	subq	%rax, %rdx	; i, tmp124
; src/file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	leaq	1(%rbx,%rax), %rsi	;, tmp126
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	call	*memmove@GOTPCREL(%rip)	;
; src/file.c:31:             path_len--;
	subq	$1, %rbp	;, path_len
; src/file.c:32:             i--;
	movq	%r12, %rax	; _15, i
	jmp	.L9	;
.L21:
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-2(%rax), %r12	;, _7
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, -2(%rbx,%rax)	;, *_8
	jne	.L10	;,
; src/file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	%rbp, %rdx	; path_len, tmp118
	subq	%rax, %rdx	; i, tmp118
; src/file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	leaq	1(%rbx,%rax), %rsi	;, tmp120
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	call	*memmove@GOTPCREL(%rip)	;
; src/file.c:26:             path_len -= 2;
	subq	$2, %rbp	;, path_len
; src/file.c:27:             i -= 2;
	movq	%r12, %rax	; _7, i
.L8:
; src/file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	testq	%rax, %rax	; i
	jne	.L10	;,
.L9:
; src/file.c:22:     for (size_t i = 0; i < path_len; i++) {
	addq	$1, %rax	;, i
; src/file.c:22:     for (size_t i = 0; i < path_len; i++) {
	cmpq	%rbp, %rax	; path_len, i
	jnb	.L22	;,
.L11:
; src/file.c:23:         if (path[i] == '\\') path[i] = '/';
	leaq	(%rbx,%rax), %rcx	;, _1
	movzbl	(%rcx), %edx	; *_1, _2
; src/file.c:23:         if (path[i] == '\\') path[i] = '/';
	cmpb	$92, %dl	;, _2
	je	.L23	;,
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rax	;, i
	jbe	.L8	;,
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, %dl	;, _2
	jne	.L9	;,
	jmp	.L6	;
.L22:
; src/file.c:39:     if (path_len > 0 && path[0] == '/')
	testq	%rbp, %rbp	; path_len
	je	.L4	;,
; src/file.c:40:         return path;
	movq	%rbx, %rax	; path, <retval>
; src/file.c:39:     if (path_len > 0 && path[0] == '/')
	cmpb	$47, (%rbx)	;, *path_37(D)
	je	.L3	;,
.L4:
; src/file.c:42:     string cwd = get_cwd();
	call	get_cwd	;
	movq	%rax, %r12	; tmp136, cwd
; src/file.c:44:         return path;
	movq	%rbx, %rax	; path, <retval>
; src/file.c:43:     if (cwd == NULL)
	testq	%r12, %r12	; cwd
	je	.L3	;,
; src/file.c:45:     size_t total_len = strlen(cwd) + 1 + path_len + 1;
	movq	%r12, %rdi	; cwd,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:45:     size_t total_len = strlen(cwd) + 1 + path_len + 1;
	leaq	2(%rbp,%rax), %r13	;, total_len
; src/file.c:46:     string abs_path = create_string("", total_len);
	movq	%r13, %rsi	; total_len,
	leaq	.LC0(%rip), %rdi	;, tmp131
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp138, abs_path
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%rbx, %r9	; path,
	movq	%r12, %r8	; cwd,
	leaq	.LC1(%rip), %rcx	;, tmp132
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movq	%rax, %rdi	; abs_path,
	movl	$0, %eax	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/file.c:48:     free(cwd);
	movq	%r12, %rdi	; cwd,
	call	*free@GOTPCREL(%rip)	;
; src/file.c:49:     return create_string(abs_path, total_len);
	movq	%r13, %rsi	; total_len,
	movq	%rbp, %rdi	; abs_path,
	call	*create_string@GOTPCREL(%rip)	;
.L3:
; src/file.c:50: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L20:
; src/file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	testq	%rax, %rax	; i
	je	.L9	;,
; src/file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	(%rbx,%rax), %rdi	;, _13
	jmp	.L13	;
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
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/file.c:61:     if (path->dirs == 0) return 0;
	movq	(%rdi), %rax	; path_30(D)->dirs, _1
; src/file.c:61:     if (path->dirs == 0) return 0;
	testq	%rax, %rax	; _1
	je	.L34	;,
	movq	%rdi, %r13	; tmp129, path
; src/file.c:65:     size_t node_count = 0;
	movl	$0, %r12d	;, node_count
; src/file.c:64:     size_t total_len = 0;
	movl	$0, %ebp	;, total_len
	jmp	.L29	;
.L37:
; src/file.c:69:             size_t dir_len = strlen((current->dir));
	movq	(%rax), %rdi	; current_57->dir, current_57->dir
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:70:             total_len += dir_len;
	addq	%rax, %rbp	; tmp130, total_len
; src/file.c:71:             node_count++;
	addq	$1, %r12	;, node_count
	movq	%rbx, %rax	; <retval>, _1
.L29:
; src/file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	movq	8(%rax), %rbx	; current_57->next, <retval>
; src/file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	testq	%rbx, %rbx	; <retval>
	jne	.L37	;,
; src/file.c:76:     if (node_count == 0) return 0;
	testq	%r12, %r12	; node_count
	je	.L26	;,
; src/file.c:80:         total_len += node_count - 1;
	leaq	-1(%rbp,%r12), %rax	;, tmp125
	cmpq	$1, %r12	;, node_count
	cmova	%rax, %rbp	; tmp125,, total_len
; src/file.c:83:     string dir_path = create_string("", total_len + 1);
	leaq	1(%rbp), %rsi	;, tmp109
	leaq	.LC0(%rip), %rdi	;, tmp110
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp131, dir_path
; src/file.c:84:     dir_path[0] = '\0';
	movb	$0, (%rax)	;, *dir_path_33
; src/file.c:86:     current = path->dirs;
	movq	0(%r13), %rbx	; path_30(D)->dirs, current
; src/file.c:88:     while (current != 0) {
	testq	%rbx, %rbx	; current
	je	.L31	;,
; src/file.c:87:     bool first = true;
	movl	$1, %eax	;, first
; src/file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	leaq	.LC2(%rip), %r12	;, tmp128
	jmp	.L33	;
.L32:
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movq	(%rbx), %rsi	; current_58->dir, current_58->dir
	movq	%rbp, %rdi	; dir_path,
	call	*strcat@GOTPCREL(%rip)	;
; src/file.c:98:         current = current->next;
	movq	8(%rbx), %rbx	; current_58->next, current
	movl	$0, %eax	;, first
; src/file.c:88:     while (current != 0) {
	testq	%rbx, %rbx	; current
	je	.L31	;,
.L33:
; src/file.c:89:         if (current->next != 0) {  // Not the last element
	cmpq	$0, 8(%rbx)	;, current_58->next
	je	.L31	;,
; src/file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	testb	%al, %al	; first
	jne	.L32	;,
; src/file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	movq	(%rbx), %rdi	; current_58->dir, current_58->dir
	movq	%r12, %rsi	; tmp128,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	testl	%eax, %eax	; tmp132
	je	.L32	;,
; src/file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$0, 0(%rbp)	;, MEM[(const char *)dir_path_33]
	je	.L32	;,
; src/file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	movq	%rbp, %rdi	; dir_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$47, -1(%rbp,%rax)	;, *_12
	je	.L32	;,
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movw	$47, 0(%rbp,%rax)	;, MEM <char[1:2]> [(void *)_48]
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	jmp	.L32	;
.L31:
; src/file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	%rbp, %rdi	; dir_path,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp134, tmp121
; src/file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	%rbp, %rdi	; dir_path,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp135, <retval>
.L26:
; src/file.c:102: }
	movq	%rbx, %rax	; <retval>,
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L34:
; src/file.c:61:     if (path->dirs == 0) return 0;
	movq	%rax, %rbx	; _1, <retval>
	jmp	.L26	;
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
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp132, file
	movq	%rsi, %rbp	; tmp133, new_extension
; src/file.c:109:     file->extension = new_extension;
	movq	%rsi, 8(%rdi)	; new_extension, file_18(D)->extension
; src/file.c:112:     string dir = get_file_dir(file);
	call	get_file_dir	;
	movq	%rax, %r13	; tmp134, dir
; src/file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	; dir
	leaq	.LC0(%rip), %r14	;, tmp131
	cmovne	%rax, %r14	; dir,, iftmp.2_13
; src/file.c:114:     string ext_cstr = new_extension != NULL ? new_extension : "";
	testq	%rbp, %rbp	; new_extension
	je	.L51	;,
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%r14, %rdi	; iftmp.2_13,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp138, tmp113
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rdi	; file_18(D)->name, file_18(D)->name
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%r12,%rax), %r12	;, path_len
; src/file.c:117:     if (new_extension != 0) path_len += strlen(ext_cstr);
	movq	%rbp, %rdi	; new_extension,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:117:     if (new_extension != 0) path_len += strlen(ext_cstr);
	leaq	(%rax,%r12), %rsi	;, path_len
.L46:
; src/file.c:119:     string new_path = create_string("", path_len + 1);
	addq	$1, %rsi	;, tmp104
	leaq	.LC0(%rip), %rdi	;, tmp105
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp135, new_path
; src/file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	testq	%r13, %r13	; dir
	je	.L43	;,
; src/file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	cmpb	$0, (%r14)	;, MEM[(const char *)iftmp.2_13]
	jne	.L52	;,
.L43:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	16(%rbx), %rsi	; file_18(D)->name, file_18(D)->name
	movq	%r12, %rdi	; new_path,
	call	*strcpy@GOTPCREL(%rip)	;
.L44:
; src/file.c:125:     if (new_extension != 0)
	testq	%rbp, %rbp	; new_extension
	je	.L45	;,
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movq	%rbp, %rsi	; new_extension,
	movq	%r12, %rdi	; new_path,
	call	*strcat@GOTPCREL(%rip)	;
.L45:
; src/file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%r12, %rdi	; new_path,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp136, tmp110
; src/file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%r12, %rdi	; new_path,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, 24(%rbx)	; tmp137, file_18(D)->path
; src/file.c:129: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L52:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	16(%rbx), %r9	; file_18(D)->name,
	movq	%r14, %r8	; iftmp.2_13,
	leaq	.LC1(%rip), %rcx	;, tmp107
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movq	%rax, %rdi	; new_path,
	movl	$0, %eax	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L44	;
.L51:
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%r14, %rdi	; iftmp.2_13,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp141, tmp124
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rdi	; file_18(D)->name, file_18(D)->name
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%r12,%rax), %rsi	;, path_len
	jmp	.L46	;
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
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbx	; tmp151, file
	movq	%rsi, %r12	; tmp152, new_name
; src/file.c:132:     file->name = new_name;
	movq	%rsi, 16(%rdi)	; new_name, file_26(D)->name
; src/file.c:135:     if (file->dirs != 0) {
	movq	(%rdi), %rax	; file_26(D)->dirs, _2
; src/file.c:135:     if (file->dirs != 0) {
	testq	%rax, %rax	; _2
	je	.L55	;,
.L54:
	movq	%rax, %rbp	; _2, current
; src/file.c:139:             if (current->next == 0) {
	movq	8(%rax), %rax	; current_17->next, _2
; src/file.c:139:             if (current->next == 0) {
	testq	%rax, %rax	; _2
	jne	.L54	;,
; src/file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rbx), %r14	; file_26(D)->extension, _3
; src/file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%r14, %r14	; _3
	je	.L72	;,
; src/file.c:142:                 size_t full_name_len = strlen(new_name);
	movq	%r12, %rdi	; new_name,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp165, tmp142
; src/file.c:143:                 if (file->extension != 0) full_name_len += strlen(ext_cstr);
	movq	%r14, %rdi	; _3,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:143:                 if (file->extension != 0) full_name_len += strlen(ext_cstr);
	leaq	(%rax,%r13), %rsi	;, full_name_len
.L65:
; src/file.c:145:                 string full_name = create_string("", full_name_len + 1);
	addq	$1, %rsi	;, tmp111
	leaq	.LC0(%rip), %rdi	;, tmp112
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp153, full_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r14, %r9	; _3,
	movq	%r12, %r8	; new_name,
	leaq	.LC3(%rip), %rcx	;, tmp113
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movq	%rax, %rdi	; full_name,
	movl	$0, %eax	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%r13, %rdi	; full_name,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp154, tmp115
; src/file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%r13, %rdi	; full_name,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rax, 0(%rbp)	; tmp155, current_58->dir
.L55:
; src/file.c:155:     string dir = get_file_dir(file);
	movq	%rbx, %rdi	; file,
	call	get_file_dir	;
	movq	%rax, %rbp	; tmp156, dir
; src/file.c:156:     string dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	; dir
	leaq	.LC0(%rip), %r14	;, tmp150
	cmovne	%rax, %r14	; dir,, iftmp.5_21
; src/file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	movq	8(%rbx), %r15	; file_26(D)->extension, _8
; src/file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	testq	%r15, %r15	; _8
	je	.L73	;,
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%r14, %rdi	; iftmp.5_21,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp160, tmp125
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%r12, %rdi	; new_name,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	leaq	1(%r13,%rax), %r13	;, path_len
; src/file.c:160:     if (file->extension != 0) path_len += strlen(ext_cstr);
	movq	%r15, %rdi	; _8,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:160:     if (file->extension != 0) path_len += strlen(ext_cstr);
	leaq	(%rax,%r13), %rsi	;, path_len
.L64:
; src/file.c:162:     string new_path = create_string("", path_len + 1);
	addq	$1, %rsi	;, tmp117
	leaq	.LC0(%rip), %rdi	;, tmp118
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp157, new_path
; src/file.c:163:     if (dir != NULL && strlen(dir_cstr) > 0)
	testq	%rbp, %rbp	; dir
	je	.L62	;,
; src/file.c:163:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpb	$0, (%r14)	;, MEM[(const char *)iftmp.5_21]
	jne	.L74	;,
.L62:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r15, %r9	; _8,
	movq	%r12, %r8	; new_name,
	leaq	.LC3(%rip), %rcx	;, tmp120
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movq	%r13, %rdi	; new_path,
	movl	$0, %eax	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L63:
; src/file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%r13, %rdi	; new_path,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp158, tmp122
; src/file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%r13, %rdi	; new_path,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, 24(%rbx)	; tmp159, file_26(D)->path
; src/file.c:169: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L74:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	subq	$8, %rsp	;,
	pushq	%r15	; _8
	movq	%r12, %r9	; new_name,
	movq	%r14, %r8	; iftmp.5_21,
	leaq	.LC4(%rip), %rcx	;, tmp119
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movq	%rax, %rdi	; new_path,
	movl	$0, %eax	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	addq	$16, %rsp	;,
	jmp	.L63	;
.L73:
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%r14, %rdi	; iftmp.5_21,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp163, tmp135
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%r12, %rdi	; new_name,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	leaq	1(%r13,%rax), %rsi	;, path_len
; src/file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	leaq	.LC0(%rip), %r15	;, _8
	jmp	.L64	;
.L72:
; src/file.c:142:                 size_t full_name_len = strlen(new_name);
	movq	%r12, %rdi	; new_name,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp167, full_name_len
; src/file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	leaq	.LC0(%rip), %r14	;, _3
	jmp	.L65	;
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
	pushq	%rbx	;
	subq	$280, %rsp	;,
	movq	%rdi, %r14	; tmp207, file
; src/file.c:172:     size_t path_len = strlen(file->path);
	movq	24(%rdi), %rdi	; file_70(D)->path, file_70(D)->path
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp208, tmp144
; src/file.c:175:     string path_copy = create_string("", path_len + 1);
	leaq	1(%rax), %rsi	;, tmp146
	leaq	.LC0(%rip), %rdi	;, tmp147
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp209, path_copy
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	movq	24(%r14), %rsi	; file_70(D)->path, file_70(D)->path
	movq	%rax, %rdi	; path_copy,
	call	*strcpy@GOTPCREL(%rip)	;
; src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	testq	%r12, %r12	; tmp144
	je	.L96	;,
; src/file.c:181:     size_t start = 0;
	movl	$0, %esi	;, start
; src/file.c:178:     StrNode* dirs_head = 0;
	movl	$0, %ebp	;, node
; src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	cmpb	$47, 0(%r13)	;, *path_copy_73
	jne	.L76	;,
; src/file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp210, node
; src/file.c:199:         node->dir = create_string("/", 1);
	movl	$1, %esi	;,
	leaq	.LC2(%rip), %rdi	;, tmp149
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:199:         node->dir = create_string("/", 1);
	movq	%rax, 0(%rbp)	; tmp211, node_75->dir
; src/file.c:200:         node->next = 0;
	movq	$0, 8(%rbp)	;, node_75->next
; src/file.c:204:         start = 1;
	movl	$1, %esi	;, start
	jmp	.L76	;
.L77:
; src/file.c:212:             if (i > start) {
	cmpq	%rbx, %rsi	; i, start
	jb	.L107	;,
.L79:
; src/file.c:262:             start = i + 1;
	leaq	1(%rbx), %rsi	;, start
.L78:
; src/file.c:264:         i++;
	leaq	1(%rbx), %rax	;, i
; src/file.c:210:     while (i <= path_len) {
	cmpq	%rbx, %r12	; i, tmp144
	je	.L108	;,
	movq	%rax, %rbx	; i, i
.L86:
; src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpq	%rbx, %r12	; i, tmp144
	je	.L77	;,
; src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpb	$47, 0(%r13,%rbx)	;, MEM[(char *)path_copy_73 + i_147 * 1]
	jne	.L78	;,
	jmp	.L77	;
.L107:
; src/file.c:213:                 size_t comp_len = i - start;
	movq	%rbx, %rax	; i, comp_len
	subq	%rsi, %rax	; start, comp_len
; src/file.c:215:                 strncpy(component, path_copy + start, comp_len);
	addq	%r13, %rsi	; path_copy, tmp150
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:95:   return __builtin___strncpy_chk (__dest, __src, __len,
	leaq	16(%rsp), %rdi	;, tmp151
	movl	$256, %ecx	;,
	movq	%rax, (%rsp)	; comp_len, %sfp
	movq	%rax, %rdx	; comp_len,
	movq	%rdi, 8(%rsp)	; tmp151, %sfp
	call	*__strncpy_chk@GOTPCREL(%rip)	;
; src/file.c:216:                 component[comp_len] = '\0';
	movq	(%rsp), %rax	; %sfp, comp_len
	movb	$0, 16(%rsp,%rax)	;, component[comp_len_100]
; src/file.c:218:                 if (strcmp(component, ".") == 0) {
	leaq	.LC5(%rip), %rsi	;,
	movq	8(%rsp), %rdi	; %sfp,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:218:                 if (strcmp(component, ".") == 0) {
	testl	%eax, %eax	; tmp212
	je	.L79	;,
; src/file.c:220:                 } else if (strcmp(component, "..") == 0) {
	leaq	16(%rsp), %rdi	;, tmp158
	leaq	.LC6(%rip), %rsi	;, tmp159
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:220:                 } else if (strcmp(component, "..") == 0) {
	testl	%eax, %eax	; tmp213
	jne	.L81	;,
; src/file.c:222:                     if (dirs_tail != 0 && dirs_tail != dirs_head) {
	testq	%r15, %r15	; dirs_tail
	je	.L82	;,
	cmpq	%r15, %rbp	; dirs_tail, node
	je	.L82	;,
; src/file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	movq	(%r15), %rdi	; dirs_tail_144->dir, dirs_tail_144->dir
	leaq	.LC6(%rip), %rsi	;, tmp167
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	testl	%eax, %eax	; tmp214
	jne	.L98	;,
; src/file.c:225:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, (%rsp)	; tmp215, %sfp
; src/file.c:226:                             node->dir = create_string("..", 2);
	movl	$2, %esi	;,
	leaq	.LC6(%rip), %rdi	;, tmp168
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:226:                             node->dir = create_string("..", 2);
	movq	(%rsp), %rcx	; %sfp, node
	movq	%rax, (%rcx)	; tmp216, node_115->dir
; src/file.c:227:                             node->next = 0;
	movq	$0, 8(%rcx)	;, node_115->next
; src/file.c:228:                             dirs_tail->next = node;
	movq	%rcx, 8(%r15)	; node, dirs_tail_144->next
; src/file.c:229:                             dirs_tail = node;
	movq	%rcx, %r15	; node, dirs_tail
	jmp	.L79	;
.L98:
; src/file.c:232:                             StrNode* prev = dirs_head;
	movq	%rbp, %rax	; node, prev
	jmp	.L83	;
.L99:
; src/file.c:234:                                 prev = prev->next;
	movq	%rdx, %rax	; _17, prev
.L83:
; src/file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	testq	%rax, %rax	; prev
	je	.L79	;,
; src/file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	movq	8(%rax), %rdx	; prev_53->next, _17
; src/file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	cmpq	%r15, %rdx	; dirs_tail, _17
	jne	.L99	;,
; src/file.c:237:                                 prev->next = 0;
	movq	$0, 8(%rax)	;, prev_53->next
; src/file.c:238:                                 dirs_tail = prev;
	movq	%rax, %r15	; prev, dirs_tail
	jmp	.L79	;
.L82:
; src/file.c:241:                     } else if (dirs_head == 0) {
	testq	%rbp, %rbp	; node
	jne	.L79	;,
; src/file.c:243:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp217, node
; src/file.c:244:                         node->dir = create_string("..", 2);
	movl	$2, %esi	;,
	leaq	.LC6(%rip), %rdi	;, tmp169
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:244:                         node->dir = create_string("..", 2);
	movq	%rax, 0(%rbp)	; tmp218, node_109->dir
; src/file.c:245:                         node->next = 0;
	movq	$0, 8(%rbp)	;, node_109->next
; src/file.c:247:                         dirs_tail = node;
	movq	%rbp, %r15	; node, dirs_tail
	jmp	.L79	;
.L81:
; src/file.c:249:                 } else if (strlen(component) > 0) {
	cmpb	$0, 16(%rsp)	;, MEM[(const char *)&component]
	je	.L79	;,
; src/file.c:251:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp219, %sfp
; src/file.c:252:                     node->dir = create_string(component, comp_len);
	leaq	16(%rsp), %rdi	;, tmp170
	movq	(%rsp), %rsi	; %sfp,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:252:                     node->dir = create_string(component, comp_len);
	movq	8(%rsp), %rcx	; %sfp, node
	movq	%rax, (%rcx)	; tmp220, node_103->dir
; src/file.c:253:                     node->next = 0;
	movq	$0, 8(%rcx)	;, node_103->next
; src/file.c:255:                     if (dirs_tail != 0)
	testq	%r15, %r15	; dirs_tail
	je	.L85	;,
; src/file.c:256:                         (dirs_tail)->next = node;
	movq	%rcx, 8(%r15)	; node, dirs_tail_144->next
.L85:
; src/file.c:259:                     if (dirs_head == 0) dirs_head = node;
	testq	%rbp, %rbp	; node
	je	.L100	;,
; src/file.c:258:                     dirs_tail = node;
	movq	8(%rsp), %r15	; %sfp, dirs_tail
	jmp	.L79	;
.L100:
	movq	8(%rsp), %rbp	; %sfp, node
	movq	%rbp, %r15	; node, dirs_tail
	jmp	.L79	;
.L108:
; src/file.c:268:     file->dirs = dirs_head;
	movq	%rbp, (%r14)	; node, file_70(D)->dirs
; src/file.c:271:     if (dirs_tail != 0) {
	testq	%r15, %r15	; dirs_tail
	je	.L87	;,
; src/file.c:272:         string dot = strrchr(dirs_tail->dir, '.');
	movq	(%r15), %r12	; dirs_tail_47->dir, _21
; src/file.c:272:         string dot = strrchr(dirs_tail->dir, '.');
	movl	$46, %esi	;,
	movq	%r12, %rdi	; _21,
	call	*strrchr@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp221, dot
; src/file.c:274:         if (dot != NULL && dot != dirs_tail->dir) {
	cmpq	%rax, %r12	; dot, _21
	je	.L88	;,
	testq	%rax, %rax	; dot
	je	.L88	;,
; src/file.c:276:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	%rax, %rsi	; dot, name_len
	subq	%r12, %rsi	; _21, name_len
; src/file.c:277:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%r12, %rdi	; _21,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:277:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%rax, 16(%r14)	; tmp222, file_70(D)->name
; src/file.c:278:             file->extension = create_string(dot, strlen(dot));
	movq	%rbx, %rdi	; dot,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp223, tmp177
; src/file.c:278:             file->extension = create_string(dot, strlen(dot));
	movq	%rbx, %rdi	; dot,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp224, dirs_tail
; src/file.c:274:         if (dot != NULL && dot != dirs_tail->dir) {
	jmp	.L89	;
.L88:
; src/file.c:281:             file->name = dirs_tail->dir;
	movq	%r12, 16(%r14)	; _21, file_70(D)->name
	movl	$0, %r15d	;, dirs_tail
.L89:
; src/file.c:282:             file->extension = 0;
	movq	%r15, 8(%r14)	; dirs_tail, file_70(D)->extension
; src/file.c:294:     while (current != 0) {
	testq	%rbp, %rbp	; node
	je	.L90	;,
; src/file.c:291:     StrNode* current = dirs_head;
	movq	%rbp, %rbx	; node, current
; src/file.c:292:     size_t node_count = 0;
	movl	$0, %r12d	;, node_count
; src/file.c:290:     size_t full_path_len = 0;
	movl	$0, %r13d	;, full_path_len
.L91:
; src/file.c:295:         full_path_len += strlen(current->dir);
	movq	(%rbx), %rdi	; current_150->dir, current_150->dir
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:295:         full_path_len += strlen(current->dir);
	addq	%rax, %r13	; tmp225, full_path_len
	movq	%r12, %rax	; node_count, node_count
; src/file.c:296:         node_count++;
	addq	$1, %r12	;, node_count
; src/file.c:297:         current = current->next;
	movq	8(%rbx), %rbx	; current_150->next, current
; src/file.c:294:     while (current != 0) {
	testq	%rbx, %rbx	; current
	jne	.L91	;,
; src/file.c:302:         full_path_len += (node_count - 1);
	addq	%r13, %rax	; full_path_len, tmp200
	cmpq	$1, %r12	;, node_count
	cmova	%rax, %r13	; tmp200,, full_path_len
; src/file.c:304:     string full_path = create_string("", full_path_len + 1);
	leaq	1(%r13), %rsi	;, tmp196
	leaq	.LC0(%rip), %rdi	;, tmp197
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp226, full_path
; src/file.c:305:     full_path[0] = '\0';
	movb	$0, (%rax)	;, *full_path_56
	movl	$1, %eax	;, is_first
; src/file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	leaq	.LC2(%rip), %r12	;, tmp205
	jmp	.L94	;
.L87:
; src/file.c:285:         file->name = 0;
	movq	$0, 16(%r14)	;, file_70(D)->name
	jmp	.L89	;
.L93:
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movq	0(%rbp), %rsi	; current_151->dir, current_151->dir
	movq	%rbx, %rdi	; full_path,
	call	*strcat@GOTPCREL(%rip)	;
; src/file.c:318:         current = current->next;
	movq	8(%rbp), %rbp	; current_151->next, node
	movl	$0, %eax	;, is_first
; src/file.c:309:     while (current != 0) {
	testq	%rbp, %rbp	; node
	je	.L95	;,
.L94:
; src/file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testb	%al, %al	; is_first
	jne	.L93	;,
; src/file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	0(%rbp), %rdi	; current_151->dir, current_151->dir
	movq	%r12, %rsi	; tmp205,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testl	%eax, %eax	; tmp227
	je	.L93	;,
; src/file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$0, (%rbx)	;, MEM[(const char *)full_path_56]
	je	.L93	;,
; src/file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	movq	%rbx, %rdi	; full_path,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$47, -1(%rbx,%rax)	;, *_35
	je	.L93	;,
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movw	$47, (%rbx,%rax)	;, MEM <char[1:2]> [(void *)_131]
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	jmp	.L93	;
.L90:
; src/file.c:304:     string full_path = create_string("", full_path_len + 1);
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp195
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp231, full_path
; src/file.c:305:     full_path[0] = '\0';
	movb	$0, (%rax)	;, *full_path_81
.L95:
; src/file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%rbx, %rdi	; full_path,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp229, tmp193
; src/file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%rbx, %rdi	; full_path,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, 24(%r14)	; tmp230, file_70(D)->path
; src/file.c:322: }
	addq	$280, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L96:
; src/file.c:181:     size_t start = 0;
	movq	%r12, %rsi	; tmp144, start
; src/file.c:178:     StrNode* dirs_head = 0;
	movl	$0, %ebp	;, node
.L76:
; src/file.c:209:     size_t i = start;
	movq	%rsi, %rbx	; start, i
	movq	%rbp, %r15	; node, dirs_tail
	jmp	.L86	;
	.size	normalize_path, .-normalize_path
	.globl	create_file
	.type	create_file, @function
create_file:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbp	; tmp86, path
; src/file.c:14:     File* file = (File*)alloc_memory(sizeof(File));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp87, <retval>
; src/file.c:15:     file->path = absolute_path(path);
	movq	%rbp, %rdi	; path,
	call	absolute_path	;
; src/file.c:15:     file->path = absolute_path(path);
	movq	%rax, 24(%rbx)	; tmp88, file_4->path
; src/file.c:16:     normalize_path(file);
	movq	%rbx, %rdi	; <retval>,
	call	normalize_path	;
; src/file.c:18: }
	movq	%rbx, %rax	; <retval>,
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_file, .-create_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
