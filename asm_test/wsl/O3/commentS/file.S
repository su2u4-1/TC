	.file	"file.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O3 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.p2align 4
	.globl	get_cwd
	.type	get_cwd, @function
get_cwd:
.LFB65:
	.cfi_startproc
	endbr64	
; /usr/include/x86_64-linux-gnu/bits/unistd.h:88:   return __glibc_fortify (getcwd, __size, sizeof (char),
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	jmp	getcwd@PLT	;
	.cfi_endproc
.LFE65:
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
.LFB67:
	.cfi_startproc
	endbr64	
	pushq	%r14	;
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13	;
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12	;
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rdi, %r12	; tmp133, path
	pushq	%rbp	;
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx	;
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
; src/file.c:21:     size_t path_len = strlen(path);
	call	strlen@PLT	;
; src/file.c:22:     for (size_t i = 0; i < path_len; i++) {
	testq	%rax, %rax	; path_len
	je	.L4	;,
	movq	%rax, %r13	; tmp134, path_len
; src/file.c:22:     for (size_t i = 0; i < path_len; i++) {
	xorl	%ebx, %ebx	; i
	jmp	.L14	;
	.p2align 4,,10
	.p2align 3
.L5:
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rbx	;, i
	jbe	.L10	;,
; src/file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	leaq	1(%rbx), %rsi	;, i
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, %dl	;, _2
	je	.L11	;,
.L20:
	movq	%rsi, %rbx	; i, i
.L12:
; src/file.c:22:     for (size_t i = 0; i < path_len; i++) {
	cmpq	%r13, %rbx	; path_len, i
	jnb	.L36	;,
.L14:
; src/file.c:23:         if (path[i] == '\\') path[i] = '/';
	leaq	(%r12,%rbx), %rbp	;, _1
	movzbl	0(%rbp), %edx	; *_1, _2
; src/file.c:23:         if (path[i] == '\\') path[i] = '/';
	cmpb	$92, %dl	;, _2
	jne	.L5	;,
; src/file.c:23:         if (path[i] == '\\') path[i] = '/';
	movb	$47, 0(%rbp)	;, *_1
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rbx	;, i
	jbe	.L10	;,
	leaq	1(%rbx), %rsi	;, i
.L11:
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-1(%r12,%rbx), %rdi	;, _6
	movzbl	(%rdi), %eax	; *_6, _7
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$46, %al	;, _7
	je	.L37	;,
.L8:
; src/file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, %al	;, _7
	jne	.L20	;,
; src/file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	movq	%r13, %rdx	; path_len, tmp122
; src/file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	addq	%r12, %rsi	; path, tmp123
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	movq	%rbp, %rdi	; _1,
; src/file.c:31:             path_len--;
	subq	$1, %r13	;, path_len
; src/file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	subq	%rbx, %rdx	; i, tmp122
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	call	memmove@PLT	;
; src/file.c:22:     for (size_t i = 0; i < path_len; i++) {
	cmpq	%r13, %rbx	; path_len, i
	jb	.L14	;,
	.p2align 4,,10
	.p2align 3
.L36:
; src/file.c:39:     if (path_len > 0 && path[0] == '/')
	testq	%r13, %r13	; path_len
	je	.L4	;,
; src/file.c:39:     if (path_len > 0 && path[0] == '/')
	cmpb	$47, (%r12)	;, *path_38(D)
	je	.L25	;,
.L15:
; /usr/include/x86_64-linux-gnu/bits/unistd.h:88:   return __glibc_fortify (getcwd, __size, sizeof (char),
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	getcwd@PLT	;
	movq	%rax, %rbx	; tmp135, iftmp.0_54
; src/file.c:43:     if (cwd == NULL)
	testq	%rax, %rax	; iftmp.0_54
	je	.L25	;,
; src/file.c:45:     size_t total_len = strlen(cwd) + 1 + path_len + 1;
	movq	%rax, %rdi	; iftmp.0_54,
	call	strlen@PLT	;
; src/file.c:46:     string abs_path = create_string("", total_len);
	leaq	.LC0(%rip), %rdi	;, tmp128
; src/file.c:45:     size_t total_len = strlen(cwd) + 1 + path_len + 1;
	leaq	2(%r13,%rax), %r13	;, total_len
; src/file.c:46:     string abs_path = create_string("", total_len);
	movq	%r13, %rsi	; total_len,
	call	create_string@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r12, %r9	; path,
	movq	%rbx, %r8	; iftmp.0_54,
	movl	$2, %esi	;,
; src/file.c:46:     string abs_path = create_string("", total_len);
	movq	%rax, %rbp	; tmp137, abs_path
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%rax, %rdi	; abs_path,
	xorl	%eax, %eax	;
	movq	$-1, %rdx	;,
	leaq	.LC1(%rip), %rcx	;, tmp129
	call	__sprintf_chk@PLT	;
; src/file.c:48:     free(cwd);
	movq	%rbx, %rdi	; iftmp.0_54,
	call	free@PLT	;
; src/file.c:50: }
	popq	%rbx	;
	.cfi_remember_state
	.cfi_def_cfa_offset 40
; src/file.c:49:     return create_string(abs_path, total_len);
	movq	%r13, %rsi	; total_len,
	movq	%rbp, %rdi	; abs_path,
; src/file.c:50: }
	popq	%rbp	;
	.cfi_def_cfa_offset 32
	popq	%r12	;
	.cfi_def_cfa_offset 24
	popq	%r13	;
	.cfi_def_cfa_offset 16
	popq	%r14	;
	.cfi_def_cfa_offset 8
; src/file.c:49:     return create_string(abs_path, total_len);
	jmp	create_string@PLT	;
	.p2align 4,,10
	.p2align 3
.L37:
	.cfi_restore_state
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-2(%rbx), %r14	;, _8
	leaq	(%r12,%r14), %rbp	;, _1
; src/file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, 0(%rbp)	;, *_9
	jne	.L20	;,
; src/file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	%r13, %rdx	; path_len, tmp117
; src/file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	addq	%r12, %rsi	; path, tmp119
; src/file.c:26:             path_len -= 2;
	subq	$2, %r13	;, path_len
; src/file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	subq	%rbx, %rdx	; i, tmp117
; src/file.c:27:             i -= 2;
	movq	%r14, %rbx	; _8, i
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:36:   return __builtin___memmove_chk (__dest, __src, __len,
	call	memmove@PLT	;
	.p2align 4,,10
	.p2align 3
.L10:
; src/file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	testq	%rbx, %rbx	; i
	jne	.L38	;,
	movl	$1, %ebx	;, i
	jmp	.L12	;
	.p2align 4,,10
	.p2align 3
.L25:
; src/file.c:50: }
	popq	%rbx	;
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%r12, %rax	; path,
	popq	%rbp	;
	.cfi_def_cfa_offset 32
	popq	%r12	;
	.cfi_def_cfa_offset 24
	popq	%r13	;
	.cfi_def_cfa_offset 16
	popq	%r14	;
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L4:
	.cfi_restore_state
	xorl	%r13d, %r13d	; path_len
	jmp	.L15	;
.L38:
; src/file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, 0(%rbp)	;, *prephitmp_59
; src/file.c:22:     for (size_t i = 0; i < path_len; i++) {
	leaq	1(%rbx), %rsi	;, i
; src/file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	jne	.L20	;,
; src/file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	movzbl	-1(%r12,%rbx), %eax	; *_69, _7
	jmp	.L8	;
	.cfi_endproc
.LFE67:
	.size	absolute_path, .-absolute_path
	.p2align 4
	.globl	get_file_name
	.type	get_file_name, @function
get_file_name:
.LFB68:
	.cfi_startproc
	endbr64	
; src/file.c:53:     return path->name;
	movq	16(%rdi), %rax	; path_2(D)->name, path_2(D)->name
; src/file.c:54: }
	ret	
	.cfi_endproc
.LFE68:
	.size	get_file_name, .-get_file_name
	.p2align 4
	.globl	get_file_extension
	.type	get_file_extension, @function
get_file_extension:
.LFB69:
	.cfi_startproc
	endbr64	
; src/file.c:57:     return path->extension;
	movq	8(%rdi), %rax	; path_2(D)->extension, path_2(D)->extension
; src/file.c:58: }
	ret	
	.cfi_endproc
.LFE69:
	.size	get_file_extension, .-get_file_extension
	.p2align 4
	.globl	get_file_dir
	.type	get_file_dir, @function
get_file_dir:
.LFB70:
	.cfi_startproc
	endbr64	
; src/file.c:61:     if (path->dirs == 0) return 0;
	movq	(%rdi), %rdx	; path_31(D)->dirs, current
; src/file.c:61:     if (path->dirs == 0) return 0;
	testq	%rdx, %rdx	; current
	je	.L68	;,
; src/file.c:60: string get_file_dir(File* path) {
	pushq	%r13	;
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
; src/file.c:65:     size_t node_count = 0;
	xorl	%r13d, %r13d	; node_count
; src/file.c:60: string get_file_dir(File* path) {
	pushq	%r12	;
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12	; tmp128, path
	pushq	%rbp	;
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
; src/file.c:64:     size_t total_len = 0;
	xorl	%ebp, %ebp	; total_len
; src/file.c:60: string get_file_dir(File* path) {
	pushq	%rbx	;
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp	;,
	.cfi_def_cfa_offset 48
; src/file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	movq	8(%rdx), %rbx	; _1->next, <retval>
; src/file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	testq	%rbx, %rbx	; <retval>
	je	.L41	;,
	.p2align 4,,10
	.p2align 3
.L43:
; src/file.c:69:             size_t dir_len = strlen((current->dir));
	movq	(%rdx), %rdi	; current_7->dir, current_7->dir
; src/file.c:71:             node_count++;
	addq	$1, %r13	;, node_count
; src/file.c:69:             size_t dir_len = strlen((current->dir));
	call	strlen@PLT	;
	movq	%rbx, %rdx	; <retval>, current
; src/file.c:70:             total_len += dir_len;
	addq	%rax, %rbp	; tmp129, total_len
; src/file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	movq	8(%rbx), %rax	; _16->next, _2
; src/file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	testq	%rax, %rax	; _2
	je	.L72	;,
	movq	%rax, %rbx	; _2, <retval>
	jmp	.L43	;
	.p2align 4,,10
	.p2align 3
.L72:
; src/file.c:76:     if (node_count == 0) return 0;
	testq	%r13, %r13	; node_count
	je	.L41	;,
; src/file.c:83:     string dir_path = create_string("", total_len + 1);
	leaq	1(%rbp), %rax	;, tmp127
	leaq	0(%rbp,%r13), %rsi	;, tmp126
	cmpq	$1, %r13	;, node_count
	cmove	%rax, %rsi	; tmp126,, tmp127, _4
	leaq	.LC0(%rip), %rdi	;, tmp112
	call	create_string@PLT	;
; src/file.c:84:     dir_path[0] = '\0';
	movb	$0, (%rax)	;, *dir_path_36
; src/file.c:86:     current = path->dirs;
	movq	(%r12), %rbx	; path_31(D)->dirs, current
; src/file.c:83:     string dir_path = create_string("", total_len + 1);
	movq	%rax, %rbp	; tmp130, dir_path
; src/file.c:88:     while (current != 0) {
	testq	%rbx, %rbx	; current
	je	.L49	;,
; src/file.c:89:         if (current->next != 0) {  // Not the last element
	cmpq	$0, 8(%rbx)	;, current_38->next
	je	.L49	;,
.L71:
; src/file.c:95:             strcat(dir_path, current->dir);
	movq	(%rbx), %r12	;* current, pretmp_28
.L51:
	movq	%rbp, %rdi	; dir_path,
	call	strlen@PLT	;
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movq	%r12, %rsi	; pretmp_28,
	leaq	0(%rbp,%rax), %rdi	;, tmp120
	call	stpcpy@PLT	;
; src/file.c:98:         current = current->next;
	movq	8(%rbx), %rbx	; current_47->next, current
; src/file.c:88:     while (current != 0) {
	testq	%rbx, %rbx	; current
	je	.L49	;,
; src/file.c:89:         if (current->next != 0) {  // Not the last element
	cmpq	$0, 8(%rbx)	;, current_41->next
	je	.L49	;,
; src/file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	movq	(%rbx), %r12	; current_41->dir, pretmp_28
; src/file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	cmpb	$47, (%r12)	;, MEM <char[1:2]> [(void *)pretmp_28]
	je	.L73	;,
.L54:
; src/file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$0, 0(%rbp)	;, MEM[(const char *)dir_path_36]
	je	.L51	;,
; src/file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$47, -1(%rax)	;, *_12
	je	.L51	;,
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movl	$47, %ecx	;,
	movw	%cx, (%rax)	;, MEM <char[1:2]> [(void *)_60]
	jmp	.L71	;
	.p2align 4,,10
	.p2align 3
.L49:
; src/file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	%rbp, %rdi	; dir_path,
	call	strlen@PLT	;
; src/file.c:102: }
	addq	$8, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
; src/file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	%rbp, %rdi	; dir_path,
; src/file.c:102: }
	popq	%rbx	;
	.cfi_restore 3
	.cfi_def_cfa_offset 32
; src/file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	%rax, %rsi	; tmp131, tmp114
; src/file.c:102: }
	popq	%rbp	;
	.cfi_restore 6
	.cfi_def_cfa_offset 24
	popq	%r12	;
	.cfi_restore 12
	.cfi_def_cfa_offset 16
	popq	%r13	;
	.cfi_restore 13
	.cfi_def_cfa_offset 8
; src/file.c:101:     return create_string(dir_path, strlen(dir_path));
	jmp	create_string@PLT	;
	.p2align 4,,10
	.p2align 3
.L73:
	.cfi_restore_state
; src/file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	cmpb	$0, 1(%r12)	;, MEM <char[1:2]> [(void *)pretmp_28]
	je	.L51	;,
	jmp	.L54	;
.L41:
; src/file.c:102: }
	popq	%rdx	;
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax	;
	popq	%rbx	;
	.cfi_def_cfa_offset 32
	popq	%rbp	;
	.cfi_def_cfa_offset 24
	popq	%r12	;
	.cfi_def_cfa_offset 16
	popq	%r13	;
	.cfi_def_cfa_offset 8
	ret	
.L68:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	xorl	%eax, %eax	;
	ret	
	.cfi_endproc
.LFE70:
	.size	get_file_dir, .-get_file_dir
	.p2align 4
	.globl	get_full_path
	.type	get_full_path, @function
get_full_path:
.LFB71:
	.cfi_startproc
	endbr64	
; src/file.c:105:     return path->path;
	movq	24(%rdi), %rax	; path_2(D)->path, path_2(D)->path
; src/file.c:106: }
	ret	
	.cfi_endproc
.LFE71:
	.size	get_full_path, .-get_full_path
	.p2align 4
	.globl	change_file_extension
	.type	change_file_extension, @function
change_file_extension:
.LFB72:
	.cfi_startproc
	endbr64	
	pushq	%r15	;
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	;
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	;
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp	; tmp137, new_extension
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx	; tmp136, file
	subq	$8, %rsp	;,
	.cfi_def_cfa_offset 64
; src/file.c:109:     file->extension = new_extension;
	movq	%rsi, 8(%rdi)	; new_extension, file_18(D)->extension
; src/file.c:112:     string dir = get_file_dir(file);
	call	get_file_dir	;
	movq	%rax, %r13	; tmp138, dir
; src/file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	; dir
	je	.L76	;,
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%rax, %rdi	; dir,
; src/file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	movq	%r13, %r15	; dir, iftmp.2_52
	leaq	.LC0(%rip), %r14	;, tmp135
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	call	strlen@PLT	;
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rdi	; file_18(D)->name, file_18(D)->name
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%rax, %r12	; tmp139, tmp107
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	call	strlen@PLT	;
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	addq	%r12, %rax	; tmp107, _50
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%rax), %r12	;, _51
; src/file.c:114:     string ext_cstr = new_extension != NULL ? new_extension : "";
	testq	%rbp, %rbp	; new_extension
	je	.L94	;,
.L86:
; src/file.c:117:     if (new_extension != 0) path_len += strlen(ext_cstr);
	movq	%rbp, %rdi	; new_extension,
	call	strlen@PLT	;
; src/file.c:119:     string new_path = create_string("", path_len + 1);
	movq	%r14, %rdi	; tmp135,
	leaq	1(%r12,%rax), %rsi	;, tmp124
	call	create_string@PLT	;
	movq	%rax, %r12	; tmp144, new_path
; src/file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	testq	%r13, %r13	; dir
	je	.L95	;,
; src/file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	cmpb	$0, (%r15)	;, MEM[(const char *)iftmp.2_52]
	jne	.L96	;,
.L79:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	16(%rbx), %rsi	; file_18(D)->name, file_18(D)->name
	movq	%r12, %rdi	; new_path,
	call	strcpy@PLT	;
.L80:
; src/file.c:125:     if (new_extension != 0)
	testq	%rbp, %rbp	; new_extension
	je	.L82	;,
.L81:
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movq	%rbp, %rsi	; new_extension,
	movq	%r12, %rdi	; new_path,
	call	strcat@PLT	;
.L82:
; src/file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%r12, %rdi	; new_path,
	call	strlen@PLT	;
; src/file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%r12, %rdi	; new_path,
; src/file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, %rsi	; tmp141, tmp118
; src/file.c:128:     file->path = create_string(new_path, strlen(new_path));
	call	create_string@PLT	;
; src/file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, 24(%rbx)	; tmp142, file_18(D)->path
; src/file.c:129: }
	addq	$8, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L94:
	.cfi_restore_state
; src/file.c:119:     string new_path = create_string("", path_len + 1);
	leaq	2(%rax), %rsi	;, tmp133
	movq	%r14, %rdi	; tmp135,
	call	create_string@PLT	;
; src/file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	cmpb	$0, (%r15)	;, MEM[(const char *)iftmp.2_52]
; src/file.c:119:     string new_path = create_string("", path_len + 1);
	movq	%rax, %r12	; tmp147, new_path
; src/file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	je	.L79	;,
.L96:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	16(%rbx), %r9	; file_18(D)->name,
	movq	%r15, %r8	; iftmp.2_52,
	leaq	.LC1(%rip), %rcx	;, tmp114
	xorl	%eax, %eax	;
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movq	%r12, %rdi	; new_path,
	call	__sprintf_chk@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L80	;
	.p2align 4,,10
	.p2align 3
.L76:
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rdi	; file_18(D)->name, file_18(D)->name
	call	strlen@PLT	;
; src/file.c:114:     string ext_cstr = new_extension != NULL ? new_extension : "";
	testq	%rbp, %rbp	; new_extension
	je	.L85	;,
; src/file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	leaq	.LC0(%rip), %r14	;, tmp135
; src/file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%rax), %r12	;, _51
; src/file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	movq	%r14, %r15	; tmp135, iftmp.2_52
	jmp	.L86	;
	.p2align 4,,10
	.p2align 3
.L85:
; src/file.c:119:     string new_path = create_string("", path_len + 1);
	leaq	2(%rax), %rsi	;, tmp126
	leaq	.LC0(%rip), %rdi	;, tmp127
	call	create_string@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	16(%rbx), %rsi	; file_18(D)->name, file_18(D)->name
	movq	%rax, %rdi	; new_path,
; src/file.c:119:     string new_path = create_string("", path_len + 1);
	movq	%rax, %r12	; tmp145, new_path
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	call	strcpy@PLT	;
	jmp	.L82	;
	.p2align 4,,10
	.p2align 3
.L95:
	movq	16(%rbx), %rsi	; file_18(D)->name, file_18(D)->name
	movq	%r12, %rdi	; new_path,
	call	strcpy@PLT	;
	jmp	.L81	;
	.cfi_endproc
.LFE72:
	.size	change_file_extension, .-change_file_extension
	.section	.rodata.str1.1
.LC2:
	.string	"%s%s"
.LC3:
	.string	"%s/%s%s"
	.text
	.p2align 4
	.globl	change_file_name
	.type	change_file_name, @function
change_file_name:
.LFB73:
	.cfi_startproc
	endbr64	
	pushq	%r15	;
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	;
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	.LC0(%rip), %r14	;, iftmp.5_70
	pushq	%r13	;
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp	; tmp148, new_name
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx	; tmp147, file
	subq	$24, %rsp	;,
	.cfi_def_cfa_offset 80
; src/file.c:135:     if (file->dirs != 0) {
	movq	(%rdi), %rax	; file_26(D)->dirs, _2
; src/file.c:132:     file->name = new_name;
	movq	%rsi, 16(%rdi)	; new_name, file_26(D)->name
; src/file.c:135:     if (file->dirs != 0) {
	testq	%rax, %rax	; _2
	je	.L99	;,
	.p2align 4,,10
	.p2align 3
.L98:
	movq	%rax, %r12	; _2, current
; src/file.c:139:             if (current->next == 0) {
	movq	8(%rax), %rax	; current_17->next, _2
; src/file.c:139:             if (current->next == 0) {
	testq	%rax, %rax	; _2
	jne	.L98	;,
; src/file.c:142:                 size_t full_name_len = strlen(new_name);
	movq	%rbp, %rdi	; new_name,
; src/file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rbx), %r15	; file_26(D)->extension, _3
; src/file.c:142:                 size_t full_name_len = strlen(new_name);
	call	strlen@PLT	;
	movq	%rax, %r13	; tmp149, full_name_len
; src/file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%r15, %r15	; _3
	je	.L110	;,
; src/file.c:143:                 if (file->extension != 0) full_name_len += strlen(ext_cstr);
	movq	%r15, %rdi	; _3,
	leaq	.LC0(%rip), %r14	;, iftmp.5_70
	call	strlen@PLT	;
; src/file.c:143:                 if (file->extension != 0) full_name_len += strlen(ext_cstr);
	addq	%rax, %r13	; tmp150, full_name_len
.L100:
; src/file.c:145:                 string full_name = create_string("", full_name_len + 1);
	leaq	1(%r13), %rsi	;, tmp116
	movq	%r14, %rdi	; iftmp.5_70,
	call	create_string@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r15, %r9	; _3,
	movq	%rbp, %r8	; new_name,
	movl	$2, %esi	;,
; src/file.c:145:                 string full_name = create_string("", full_name_len + 1);
	movq	%rax, %r13	; tmp151, full_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC2(%rip), %rcx	;, tmp118
	movq	$-1, %rdx	;,
	movq	%rax, %rdi	; full_name,
	xorl	%eax, %eax	;
	call	__sprintf_chk@PLT	;
; src/file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%r13, %rdi	; full_name,
	call	strlen@PLT	;
; src/file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%r13, %rdi	; full_name,
; src/file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rax, %rsi	; tmp152, tmp120
; src/file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	call	create_string@PLT	;
; src/file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rax, (%r12)	; tmp153, current_67->dir
.L99:
; src/file.c:155:     string dir = get_file_dir(file);
	movq	%rbx, %rdi	; file,
	call	get_file_dir	;
	movq	%rax, %r12	; tmp154, dir
; src/file.c:156:     string dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	; dir
	je	.L102	;,
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%rax, %rdi	; dir,
	call	strlen@PLT	;
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%rbp, %rdi	; new_name,
; src/file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	movq	8(%rbx), %r15	; file_26(D)->extension, _69
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%rax, %r13	; tmp155, tmp123
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	call	strlen@PLT	;
; src/file.c:156:     string dir_cstr = dir != NULL ? dir : "";
	movq	%r12, %r8	; dir, iftmp.5_70
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	leaq	0(%r13,%rax), %rsi	;, _44
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	leaq	1(%rsi), %r13	;, _46
; src/file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	testq	%r15, %r15	; _69
	je	.L115	;,
.L109:
; src/file.c:160:     if (file->extension != 0) path_len += strlen(ext_cstr);
	movq	%r15, %rdi	; _69,
	movq	%r8, 8(%rsp)	; iftmp.5_70, %sfp
	call	strlen@PLT	;
; src/file.c:162:     string new_path = create_string("", path_len + 1);
	movq	%r14, %rdi	; iftmp.5_70,
	leaq	1(%r13,%rax), %rsi	;, tmp137
	call	create_string@PLT	;
; src/file.c:163:     if (dir != NULL && strlen(dir_cstr) > 0)
	testq	%r12, %r12	; dir
	movq	8(%rsp), %r8	; %sfp, iftmp.5_70
; src/file.c:162:     string new_path = create_string("", path_len + 1);
	movq	%rax, %r13	; tmp160, new_path
; src/file.c:163:     if (dir != NULL && strlen(dir_cstr) > 0)
	je	.L105	;,
; src/file.c:163:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpb	$0, (%r8)	;, MEM[(const char *)iftmp.5_70]
	jne	.L116	;,
.L105:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r15, %r9	; _69,
	movq	%rbp, %r8	; new_name,
	leaq	.LC2(%rip), %rcx	;, tmp129
	movq	%r13, %rdi	; new_path,
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	__sprintf_chk@PLT	;
.L106:
; src/file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%r13, %rdi	; new_path,
	call	strlen@PLT	;
; src/file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%r13, %rdi	; new_path,
; src/file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, %rsi	; tmp157, tmp131
; src/file.c:168:     file->path = create_string(new_path, strlen(new_path));
	call	create_string@PLT	;
; src/file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, 24(%rbx)	; tmp158, file_26(D)->path
; src/file.c:169: }
	addq	$24, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L115:
	.cfi_restore_state
; src/file.c:162:     string new_path = create_string("", path_len + 1);
	addq	$2, %rsi	;, tmp139
	movq	%r14, %rdi	; iftmp.5_70,
	movq	%r12, 8(%rsp)	; iftmp.5_70, %sfp
; src/file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	leaq	.LC0(%rip), %r15	;, _69
; src/file.c:162:     string new_path = create_string("", path_len + 1);
	call	create_string@PLT	;
	movq	8(%rsp), %r8	; %sfp, iftmp.5_70
	movq	%rax, %r13	; tmp161, new_path
; src/file.c:163:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpb	$0, (%r8)	;, MEM[(const char *)iftmp.5_70]
	je	.L105	;,
.L116:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	subq	$8, %rsp	;,
	.cfi_def_cfa_offset 88
	movq	$-1, %rdx	;,
	movq	%rbp, %r9	; new_name,
	xorl	%eax, %eax	;
	pushq	%r15	; _69
	.cfi_def_cfa_offset 96
	leaq	.LC3(%rip), %rcx	;, tmp128
	movl	$2, %esi	;,
	movq	%r13, %rdi	; new_path,
	call	__sprintf_chk@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	popq	%rax	;
	.cfi_def_cfa_offset 88
	popq	%rdx	;
	.cfi_def_cfa_offset 80
	jmp	.L106	;
	.p2align 4,,10
	.p2align 3
.L110:
; src/file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	leaq	.LC0(%rip), %r14	;, iftmp.5_70
	movq	%r14, %r15	; iftmp.5_70, _3
	jmp	.L100	;
	.p2align 4,,10
	.p2align 3
.L102:
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%rbp, %rdi	; new_name,
; src/file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	movq	8(%rbx), %r15	; file_26(D)->extension, _69
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	call	strlen@PLT	;
; src/file.c:156:     string dir_cstr = dir != NULL ? dir : "";
	leaq	.LC0(%rip), %r8	;, iftmp.5_70
; src/file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	leaq	1(%rax), %r13	;, _46
; src/file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	testq	%r15, %r15	; _69
	jne	.L109	;,
; src/file.c:162:     string new_path = create_string("", path_len + 1);
	leaq	2(%rax), %rsi	;, tmp141
	movq	%r14, %rdi	; iftmp.5_70,
; src/file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	leaq	.LC0(%rip), %r15	;, _69
; src/file.c:162:     string new_path = create_string("", path_len + 1);
	call	create_string@PLT	;
	movq	%rax, %r13	; tmp162, new_path
	jmp	.L105	;
	.cfi_endproc
.LFE73:
	.size	change_file_name, .-change_file_name
	.section	.rodata.str1.1
.LC4:
	.string	"/"
.LC5:
	.string	"."
.LC6:
	.string	".."
	.text
	.p2align 4
	.globl	normalize_path
	.type	normalize_path, @function
normalize_path:
.LFB74:
	.cfi_startproc
	endbr64	
	pushq	%r15	;
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	;
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	;
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12	; tmp203, file
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
; src/file.c:181:     size_t start = 0;
	xorl	%ebp, %ebp	; ivtmp.67
; src/file.c:171: void normalize_path(File* file) {
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
; src/file.c:178:     StrNode* dirs_head = 0;
	xorl	%ebx, %ebx	; node
; src/file.c:171: void normalize_path(File* file) {
	subq	$312, %rsp	;,
	.cfi_def_cfa_offset 368
; src/file.c:172:     size_t path_len = strlen(file->path);
	movq	24(%rdi), %rdi	; file_74(D)->path, file_74(D)->path
; src/file.c:171: void normalize_path(File* file) {
	movq	%fs:40, %rax	; MEM[(<address-space-1> long unsigned int *)40B], tmp226
	movq	%rax, 296(%rsp)	; tmp226, D.5710
	xorl	%eax, %eax	; tmp226
; src/file.c:172:     size_t path_len = strlen(file->path);
	call	strlen@PLT	;
; src/file.c:175:     string path_copy = create_string("", path_len + 1);
	leaq	.LC0(%rip), %rdi	;,
	leaq	1(%rax), %rsi	;, tmp148
; src/file.c:172:     size_t path_len = strlen(file->path);
	movq	%rax, %r15	; tmp204, tmp146
; src/file.c:175:     string path_copy = create_string("", path_len + 1);
	call	create_string@PLT	;
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	movq	24(%r12), %rsi	; file_74(D)->path, file_74(D)->path
	movq	%rax, %rdi	; path_copy,
; src/file.c:175:     string path_copy = create_string("", path_len + 1);
	movq	%rax, %r14	; tmp205, path_copy
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	call	strcpy@PLT	;
; src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	testq	%r15, %r15	; tmp146
	je	.L118	;,
; src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	cmpb	$47, (%r14)	;, *path_copy_77
	je	.L185	;,
.L118:
; src/file.c:178:     StrNode* dirs_head = 0;
	movq	%rbp, %rsi	; ivtmp.67, start
	movq	%rbx, %r13	; node, dirs_tail
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:95:   return __builtin___strncpy_chk (__dest, __src, __len,
	leaq	32(%rsp), %r10	;, tmp202
	jmp	.L134	;
	.p2align 4,,10
	.p2align 3
.L122:
; src/file.c:210:     while (i <= path_len) {
	cmpq	%rbp, %r15	; ivtmp.67, tmp146
	jb	.L121	;,
.L134:
	movq	%rbp, %rax	; ivtmp.67, ivtmp.67
; src/file.c:262:             start = i + 1;
	addq	$1, %rbp	;, ivtmp.67
; src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpq	%rax, %r15	; ivtmp.67, tmp146
	je	.L186	;,
; src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpb	$47, (%r14,%rax)	;, MEM[(char *)path_copy_77 + ivtmp.67_85 * 1]
	jne	.L122	;,
; src/file.c:212:             if (i > start) {
	cmpq	%rax, %rsi	; ivtmp.67, start
	jb	.L120	;,
.L123:
; src/file.c:262:             start = i + 1;
	movq	%rbp, %rsi	; ivtmp.67, start
	jmp	.L122	;
	.p2align 4,,10
	.p2align 3
.L186:
; src/file.c:212:             if (i > start) {
	cmpq	%r15, %rsi	; tmp146, start
	jb	.L120	;,
.L121:
; src/file.c:268:     file->dirs = dirs_head;
	movq	%rbx, (%r12)	; node, file_74(D)->dirs
; src/file.c:271:     if (dirs_tail != 0) {
	testq	%r13, %r13	; dirs_tail
	je	.L135	;,
; src/file.c:272:         string dot = strrchr(dirs_tail->dir, '.');
	movq	0(%r13), %r13	; dirs_tail_55->dir, dirs_tail
; src/file.c:272:         string dot = strrchr(dirs_tail->dir, '.');
	movl	$46, %esi	;,
	movq	%r13, %rdi	; dirs_tail,
	call	strrchr@PLT	;
	movq	%rax, %rbp	; tmp214, dot
; src/file.c:274:         if (dot != NULL && dot != dirs_tail->dir) {
	cmpq	%rax, %r13	; dot, dirs_tail
	je	.L135	;,
	testq	%rax, %rax	; dot
	je	.L135	;,
; src/file.c:276:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	%rax, %rsi	; dot, name_len
; src/file.c:277:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%r13, %rdi	; dirs_tail,
; src/file.c:276:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	subq	%r13, %rsi	; dirs_tail, name_len
; src/file.c:277:             file->name = create_string(dirs_tail->dir, name_len);
	call	create_string@PLT	;
; src/file.c:278:             file->extension = create_string(dot, strlen(dot));
	movq	%rbp, %rdi	; dot,
; src/file.c:277:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%rax, 16(%r12)	; tmp215, file_74(D)->name
; src/file.c:278:             file->extension = create_string(dot, strlen(dot));
	call	strlen@PLT	;
; src/file.c:278:             file->extension = create_string(dot, strlen(dot));
	movq	%rbp, %rdi	; dot,
; src/file.c:278:             file->extension = create_string(dot, strlen(dot));
	movq	%rax, %rsi	; tmp216, tmp175
; src/file.c:278:             file->extension = create_string(dot, strlen(dot));
	call	create_string@PLT	;
; src/file.c:282:             file->extension = 0;
	movq	%rax, 8(%r12)	; _27, file_74(D)->extension
; src/file.c:294:     while (current != 0) {
	testq	%rbx, %rbx	; node
	je	.L137	;,
.L189:
; src/file.c:291:     StrNode* current = dirs_head;
	movq	%rbx, %rbp	; node, current
; src/file.c:292:     size_t node_count = 0;
	xorl	%r15d, %r15d	; node_count
; src/file.c:290:     size_t full_path_len = 0;
	xorl	%r14d, %r14d	; full_path_len
	.p2align 4,,10
	.p2align 3
.L138:
; src/file.c:295:         full_path_len += strlen(current->dir);
	movq	0(%rbp), %rdi	; current_151->dir, current_151->dir
; src/file.c:296:         node_count++;
	addq	$1, %r15	;, node_count
; src/file.c:295:         full_path_len += strlen(current->dir);
	call	strlen@PLT	;
; src/file.c:297:         current = current->next;
	movq	8(%rbp), %rbp	; current_151->next, current
; src/file.c:295:         full_path_len += strlen(current->dir);
	addq	%rax, %r14	; tmp218, full_path_len
; src/file.c:294:     while (current != 0) {
	testq	%rbp, %rbp	; current
	jne	.L138	;,
; src/file.c:304:     string full_path = create_string("", full_path_len + 1);
	leaq	1(%r14), %rax	;, tmp200
	cmpq	$1, %r15	;, node_count
	leaq	(%r14,%r15), %rsi	;, tmp199
	cmovbe	%rax, %rsi	; tmp199,, tmp200, _31
	leaq	.LC0(%rip), %rdi	;,
	call	create_string@PLT	;
; src/file.c:305:     full_path[0] = '\0';
	movb	$0, (%rax)	;, *full_path_97
; src/file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	(%rbx), %rbp	;* node, pretmp_92
; src/file.c:304:     string full_path = create_string("", full_path_len + 1);
	movq	%rax, %r13	; tmp220, full_path
	.p2align 4,,10
	.p2align 3
.L144:
	movq	%r13, %rdi	; full_path,
	call	strlen@PLT	;
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movq	%rbp, %rsi	; pretmp_92,
	leaq	0(%r13,%rax), %rdi	;, tmp187
	call	stpcpy@PLT	;
; src/file.c:318:         current = current->next;
	movq	8(%rbx), %rbx	; current_94->next, node
; src/file.c:309:     while (current != 0) {
	testq	%rbx, %rbx	; node
	je	.L140	;,
; src/file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	(%rbx), %rbp	; current_101->dir, pretmp_92
; src/file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	cmpb	$47, 0(%rbp)	;, MEM <char[1:2]> [(void *)pretmp_92]
	je	.L187	;,
.L147:
; src/file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$0, 0(%r13)	;, MEM[(const char *)full_path_97]
	je	.L144	;,
; src/file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$47, -1(%rax)	;, *_38
	je	.L144	;,
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	movl	$47, %edx	;,
	movw	%dx, (%rax)	;, MEM <char[1:2]> [(void *)_146]
; src/file.c:316:         strcat(full_path, current->dir);
	movq	(%rbx), %rbp	;* node, pretmp_92
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:130:   return __builtin___strcat_chk (__dest, __src, __glibc_objsize (__dest));
	jmp	.L144	;
	.p2align 4,,10
	.p2align 3
.L120:
; src/file.c:213:                 size_t comp_len = i - start;
	subq	%rsi, %rax	; start, ivtmp.67
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:95:   return __builtin___strncpy_chk (__dest, __src, __len,
	movq	%r10, %rdi	; tmp202,
; src/file.c:215:                 strncpy(component, path_copy + start, comp_len);
	addq	%r14, %rsi	; path_copy, tmp152
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:95:   return __builtin___strncpy_chk (__dest, __src, __len,
	movl	$256, %ecx	;,
	movq	%rax, %rdx	; comp_len,
	movq	%rax, 8(%rsp)	; comp_len, %sfp
	call	__strncpy_chk@PLT	;
; src/file.c:216:                 component[comp_len] = '\0';
	movq	8(%rsp), %r8	; %sfp, comp_len
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:95:   return __builtin___strncpy_chk (__dest, __src, __len,
	movq	%rax, %r10	;, tmp202
; src/file.c:216:                 component[comp_len] = '\0';
	movb	$0, 32(%rsp,%r8)	;, component[comp_len_105]
; src/file.c:218:                 if (strcmp(component, ".") == 0) {
	cmpw	$46, (%rax)	;, MEM <char[1:2]> [(void *)&component]
	je	.L123	;,
; src/file.c:220:                 } else if (strcmp(component, "..") == 0) {
	cmpw	$11822, (%rax)	;, MEM <char[1:3]> [(void *)&component]
	je	.L188	;,
.L127:
; src/file.c:249:                 } else if (strlen(component) > 0) {
	cmpb	$0, 32(%rsp)	;, MEM[(const char *)&component]
	je	.L123	;,
; src/file.c:251:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	movq	%r10, 24(%rsp)	; tmp202, %sfp
	movq	%r8, 8(%rsp)	; comp_len, %sfp
	call	alloc_memory@PLT	;
; src/file.c:252:                     node->dir = create_string(component, comp_len);
	movq	24(%rsp), %r10	; %sfp, tmp202
	movq	8(%rsp), %rsi	; %sfp,
; src/file.c:251:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, 16(%rsp)	; node, %sfp
; src/file.c:252:                     node->dir = create_string(component, comp_len);
	movq	%r10, %rdi	; tmp202,
	movq	%r10, 8(%rsp)	; tmp202, %sfp
	call	create_string@PLT	;
; src/file.c:252:                     node->dir = create_string(component, comp_len);
	movq	16(%rsp), %rdx	; %sfp, node
; src/file.c:255:                     if (dirs_tail != 0)
	testq	%r13, %r13	; dirs_tail
	movq	8(%rsp), %r10	; %sfp, tmp202
; src/file.c:252:                     node->dir = create_string(component, comp_len);
	movq	%rax, (%rdx)	; tmp213, node_108->dir
; src/file.c:253:                     node->next = 0;
	movq	$0, 8(%rdx)	;, node_108->next
; src/file.c:255:                     if (dirs_tail != 0)
	je	.L133	;,
; src/file.c:256:                         (dirs_tail)->next = node;
	movq	%rdx, 8(%r13)	; node, dirs_tail_145->next
.L133:
; src/file.c:258:                     dirs_tail = node;
	movq	%rdx, %r13	; node, dirs_tail
; src/file.c:259:                     if (dirs_head == 0) dirs_head = node;
	testq	%rbx, %rbx	; node
	jne	.L123	;,
; src/file.c:258:                     dirs_tail = node;
	movq	%rdx, %rbx	; node, node
; src/file.c:259:                     if (dirs_head == 0) dirs_head = node;
	movq	%rdx, %r13	; node, dirs_tail
	jmp	.L123	;
	.p2align 4,,10
	.p2align 3
.L135:
; src/file.c:281:             file->name = dirs_tail->dir;
	xorl	%eax, %eax	; _27
	movq	%r13, 16(%r12)	; dirs_tail, file_74(D)->name
; src/file.c:282:             file->extension = 0;
	movq	%rax, 8(%r12)	; _27, file_74(D)->extension
; src/file.c:294:     while (current != 0) {
	testq	%rbx, %rbx	; node
	jne	.L189	;,
.L137:
; src/file.c:304:     string full_path = create_string("", full_path_len + 1);
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;,
	call	create_string@PLT	;
; src/file.c:305:     full_path[0] = '\0';
	movb	$0, (%rax)	;, *full_path_64
; src/file.c:304:     string full_path = create_string("", full_path_len + 1);
	movq	%rax, %r13	; tmp219, full_path
	.p2align 4,,10
	.p2align 3
.L140:
; src/file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%r13, %rdi	; full_path,
	call	strlen@PLT	;
; src/file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%r13, %rdi	; full_path,
; src/file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, %rsi	; tmp223, tmp193
; src/file.c:321:     file->path = create_string(full_path, strlen(full_path));
	call	create_string@PLT	;
; src/file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, 24(%r12)	; tmp224, file_74(D)->path
; src/file.c:322: }
	movq	296(%rsp), %rax	; D.5710, tmp227
	subq	%fs:40, %rax	; MEM[(<address-space-1> long unsigned int *)40B], tmp227
	jne	.L190	;,
	addq	$312, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L187:
	.cfi_restore_state
; src/file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	cmpb	$0, 1(%rbp)	;, MEM <char[1:2]> [(void *)pretmp_92]
	je	.L144	;,
	jmp	.L147	;
	.p2align 4,,10
	.p2align 3
.L188:
; src/file.c:220:                 } else if (strcmp(component, "..") == 0) {
	cmpb	$0, 2(%rax)	;, MEM <char[1:3]> [(void *)&component]
	jne	.L127	;,
; src/file.c:222:                     if (dirs_tail != 0 && dirs_tail != dirs_head) {
	testq	%r13, %r13	; dirs_tail
	je	.L130	;,
	cmpq	%r13, %rbx	; dirs_tail, node
	je	.L130	;,
; src/file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	movq	0(%r13), %rax	; dirs_tail_145->dir, dirs_tail_145->dir
	cmpb	$46, (%rax)	;, MEM <char[1:3]> [(void *)_14]
	je	.L191	;,
.L151:
; src/file.c:232:                             StrNode* prev = dirs_head;
	movq	%rbx, %rax	; node, prev
	jmp	.L132	;
	.p2align 4,,10
	.p2align 3
.L152:
; src/file.c:234:                                 prev = prev->next;
	movq	%rdx, %rax	; _17, prev
.L132:
; src/file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	testq	%rax, %rax	; prev
	je	.L123	;,
; src/file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	movq	8(%rax), %rdx	; prev_57->next, _17
; src/file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	cmpq	%r13, %rdx	; dirs_tail, _17
	jne	.L152	;,
; src/file.c:237:                                 prev->next = 0;
	movq	$0, 8(%rax)	;, prev_57->next
; src/file.c:238:                                 dirs_tail = prev;
	movq	%rax, %r13	; prev, dirs_tail
	jmp	.L123	;
	.p2align 4,,10
	.p2align 3
.L185:
; src/file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
; src/file.c:204:         start = 1;
	movl	$1, %ebp	;, ivtmp.67
; src/file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	call	alloc_memory@PLT	;
; src/file.c:199:         node->dir = create_string("/", 1);
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rdi	;, tmp151
; src/file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %rbx	; tmp206, node
; src/file.c:199:         node->dir = create_string("/", 1);
	call	create_string@PLT	;
; src/file.c:200:         node->next = 0;
	movq	$0, 8(%rbx)	;, node_79->next
; src/file.c:199:         node->dir = create_string("/", 1);
	movq	%rax, (%rbx)	; tmp207, node_79->dir
	jmp	.L118	;
	.p2align 4,,10
	.p2align 3
.L130:
; src/file.c:241:                     } else if (dirs_head == 0) {
	testq	%rbx, %rbx	; node
	jne	.L123	;,
; src/file.c:243:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	movq	%r10, 8(%rsp)	; tmp202, %sfp
	call	alloc_memory@PLT	;
; src/file.c:244:                         node->dir = create_string("..", 2);
	movl	$2, %esi	;,
	leaq	.LC6(%rip), %rdi	;, tmp167
; src/file.c:243:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %rbx	; tmp210, node
; src/file.c:244:                         node->dir = create_string("..", 2);
	call	create_string@PLT	;
; src/file.c:247:                         dirs_tail = node;
	movq	%rbx, %r13	; node, dirs_tail
	movq	8(%rsp), %r10	; %sfp, tmp202
; src/file.c:245:                         node->next = 0;
	movq	$0, 8(%rbx)	;, node_114->next
; src/file.c:244:                         node->dir = create_string("..", 2);
	movq	%rax, (%rbx)	; tmp211, node_114->dir
	jmp	.L123	;
.L191:
; src/file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	cmpb	$46, 1(%rax)	;, MEM <char[1:3]> [(void *)_14]
	jne	.L151	;,
; src/file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	cmpb	$0, 2(%rax)	;, MEM <char[1:3]> [(void *)_14]
	jne	.L151	;,
; src/file.c:225:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	movq	%r10, 16(%rsp)	; tmp202, %sfp
	call	alloc_memory@PLT	;
; src/file.c:226:                             node->dir = create_string("..", 2);
	movl	$2, %esi	;,
	leaq	.LC6(%rip), %rdi	;, tmp166
; src/file.c:225:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, 8(%rsp)	; node, %sfp
; src/file.c:226:                             node->dir = create_string("..", 2);
	call	create_string@PLT	;
; src/file.c:226:                             node->dir = create_string("..", 2);
	movq	8(%rsp), %rdx	; %sfp, node
	movq	16(%rsp), %r10	; %sfp, tmp202
	movq	%rax, (%rdx)	; tmp209, node_120->dir
; src/file.c:227:                             node->next = 0;
	movq	$0, 8(%rdx)	;, node_120->next
; src/file.c:228:                             dirs_tail->next = node;
	movq	%rdx, 8(%r13)	; node, dirs_tail_145->next
; src/file.c:229:                             dirs_tail = node;
	movq	%rdx, %r13	; node, dirs_tail
	jmp	.L123	;
.L190:
; src/file.c:322: }
	call	__stack_chk_fail@PLT	;
	.cfi_endproc
.LFE74:
	.size	normalize_path, .-normalize_path
	.p2align 4
	.globl	create_file
	.type	create_file, @function
create_file:
.LFB66:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp	; tmp86, path
; src/file.c:14:     File* file = (File*)alloc_memory(sizeof(File));
	movl	$32, %edi	;,
; src/file.c:13: File* create_file(const string path) {
	pushq	%rbx	;
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp	;,
	.cfi_def_cfa_offset 32
; src/file.c:14:     File* file = (File*)alloc_memory(sizeof(File));
	call	alloc_memory@PLT	;
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
	addq	$8, %rsp	;,
	.cfi_def_cfa_offset 24
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	.cfi_def_cfa_offset 16
	popq	%rbp	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE66:
	.size	create_file, .-create_file
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
