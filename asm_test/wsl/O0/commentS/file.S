	.file	"file.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.globl	get_cwd
	.type	get_cwd, @function
get_cwd:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
; src/file.c:7:     return getcwd(NULL, 0);  // MinGW or LINUX or MACOS
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	*getcwd@GOTPCREL(%rip)	;
; src/file.c:11: }
	popq	%rbp	;
	ret	
	.size	get_cwd, .-get_cwd
	.globl	create_file
	.type	create_file, @function
create_file:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; path, path
; src/file.c:16:     File* file = (File*)alloc_memory(sizeof(File));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp85, file
; src/file.c:17:     file->path = absolute_path(path, NULL);
	movq	-24(%rbp), %rax	; path, tmp86
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp86,
	call	absolute_path	;
; src/file.c:17:     file->path = absolute_path(path, NULL);
	movq	-8(%rbp), %rdx	; file, tmp87
	movq	%rax, 24(%rdx)	; _1, file_4->path
; src/file.c:18:     normalize_path(file);
	movq	-8(%rbp), %rax	; file, tmp88
	movq	%rax, %rdi	; tmp88,
	call	normalize_path	;
; src/file.c:19:     return file;
	movq	-8(%rbp), %rax	; file, _9
; src/file.c:20: }
	leave	
	ret	
	.size	create_file, .-create_file
	.section	.rodata
.LC0:
	.string	""
.LC1:
	.string	"%s/%s"
	.text
	.globl	absolute_path
	.type	absolute_path, @function
absolute_path:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -40(%rbp)	; path, path
	movq	%rsi, -48(%rbp)	; base_path, base_path
; src/file.c:23:     path = create_string_not_check(path, strlen(path));
	movq	-40(%rbp), %rax	; path, tmp127
	movq	%rax, %rdi	; tmp127,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _1
; src/file.c:23:     path = create_string_not_check(path, strlen(path));
	movq	-40(%rbp), %rax	; path, tmp128
	movq	%rdx, %rsi	; _1,
	movq	%rax, %rdi	; tmp128,
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp129, path
; src/file.c:24:     size_t path_len = strlen(path);
	movq	-40(%rbp), %rax	; path, tmp130
	movq	%rax, %rdi	; tmp130,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp131, path_len
; src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	movq	$0, -16(%rbp)	;, i
; src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	jmp	.L6	;
.L10:
; src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	movq	-40(%rbp), %rdx	; path, tmp132
	movq	-16(%rbp), %rax	; i, tmp133
	addq	%rdx, %rax	; tmp132, _2
	movzbl	(%rax), %eax	; *_2, _3
; src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	cmpb	$92, %al	;, _3
	jne	.L7	;,
; src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	movq	-40(%rbp), %rdx	; path, tmp134
	movq	-16(%rbp), %rax	; i, tmp135
	addq	%rdx, %rax	; tmp134, _4
; src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	movb	$47, (%rax)	;, *_4
.L7:
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, -16(%rbp)	;, i
	jbe	.L8	;,
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	movq	-40(%rbp), %rdx	; path, tmp136
	movq	-16(%rbp), %rax	; i, tmp137
	addq	%rdx, %rax	; tmp136, _5
	movzbl	(%rax), %eax	; *_5, _6
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, %al	;, _6
	jne	.L8	;,
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	movq	-16(%rbp), %rax	; i, tmp138
	leaq	-1(%rax), %rdx	;, _7
	movq	-40(%rbp), %rax	; path, tmp139
	addq	%rdx, %rax	; _7, _8
	movzbl	(%rax), %eax	; *_8, _9
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$46, %al	;, _9
	jne	.L8	;,
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	movq	-16(%rbp), %rax	; i, tmp140
	leaq	-2(%rax), %rdx	;, _10
	movq	-40(%rbp), %rax	; path, tmp141
	addq	%rdx, %rax	; _10, _11
	movzbl	(%rax), %eax	; *_11, _12
; src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, %al	;, _12
	jne	.L8	;,
; src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	-8(%rbp), %rax	; path_len, tmp142
	subq	-16(%rbp), %rax	; i, _13
; src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	-16(%rbp), %rdx	; i, tmp143
	leaq	1(%rdx), %rcx	;, _14
	movq	-40(%rbp), %rdx	; path, tmp144
	leaq	(%rcx,%rdx), %rsi	;, _15
; src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	-16(%rbp), %rdx	; i, tmp145
	leaq	-1(%rdx), %rcx	;, _16
	movq	-40(%rbp), %rdx	; path, tmp146
	addq	%rdx, %rcx	; tmp146, _17
; src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	%rax, %rdx	; _13,
	movq	%rcx, %rdi	; _17,
	call	*memmove@GOTPCREL(%rip)	;
; src/file.c:29:             path_len -= 2;
	subq	$2, -8(%rbp)	;, path_len
; src/file.c:30:             i -= 2;
	subq	$2, -16(%rbp)	;, i
.L8:
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpq	$0, -16(%rbp)	;, i
	je	.L9	;,
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	movq	-40(%rbp), %rdx	; path, tmp147
	movq	-16(%rbp), %rax	; i, tmp148
	addq	%rdx, %rax	; tmp147, _18
	movzbl	(%rax), %eax	; *_18, _19
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, %al	;, _19
	jne	.L9	;,
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	movq	-16(%rbp), %rax	; i, tmp149
	leaq	-1(%rax), %rdx	;, _20
	movq	-40(%rbp), %rax	; path, tmp150
	addq	%rdx, %rax	; _20, _21
	movzbl	(%rax), %eax	; *_21, _22
; src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, %al	;, _22
	jne	.L9	;,
; src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	movq	-8(%rbp), %rax	; path_len, tmp151
	subq	-16(%rbp), %rax	; i, _23
; src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	movq	-16(%rbp), %rdx	; i, tmp152
	leaq	1(%rdx), %rcx	;, _24
	movq	-40(%rbp), %rdx	; path, tmp153
	leaq	(%rcx,%rdx), %rsi	;, _25
; src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	movq	-40(%rbp), %rcx	; path, tmp154
	movq	-16(%rbp), %rdx	; i, tmp155
	addq	%rdx, %rcx	; tmp155, _26
; src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	movq	%rax, %rdx	; _23,
	movq	%rcx, %rdi	; _26,
	call	*memmove@GOTPCREL(%rip)	;
; src/file.c:34:             path_len--;
	subq	$1, -8(%rbp)	;, path_len
; src/file.c:35:             i--;
	subq	$1, -16(%rbp)	;, i
.L9:
; src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	addq	$1, -16(%rbp)	;, i
.L6:
; src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	movq	-16(%rbp), %rax	; i, tmp156
	cmpq	-8(%rbp), %rax	; path_len, tmp156
	jb	.L10	;,
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	cmpq	$1, -8(%rbp)	;, path_len
	jbe	.L11	;,
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	movq	-40(%rbp), %rax	; path, tmp157
	movzbl	(%rax), %eax	; *path_61, _27
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	cmpb	$64, %al	;, _27
	jle	.L11	;,
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	movq	-40(%rbp), %rax	; path, tmp158
	movzbl	(%rax), %eax	; *path_61, _28
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	cmpb	$90, %al	;, _28
	jg	.L11	;,
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	movq	-40(%rbp), %rax	; path, tmp159
	addq	$1, %rax	;, _29
	movzbl	(%rax), %eax	; *_29, _30
; src/file.c:45:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':') {
	cmpb	$58, %al	;, _30
	jne	.L11	;,
; src/file.c:46:         path[0] = to_lower(path[0]);
	movq	-40(%rbp), %rax	; path, tmp160
	movzbl	(%rax), %eax	; *path_61, _31
; src/file.c:46:         path[0] = to_lower(path[0]);
	movsbl	%al, %eax	; _31, _32
	movl	%eax, %edi	; _32,
	call	*to_lower@GOTPCREL(%rip)	;
; src/file.c:46:         path[0] = to_lower(path[0]);
	movq	-40(%rbp), %rdx	; path, tmp161
	movb	%al, (%rdx)	; _33, *path_61
; src/file.c:47:         memmove(path, path + 1, path_len);
	movq	-40(%rbp), %rax	; path, tmp162
	leaq	1(%rax), %rcx	;, _34
; src/file.c:47:         memmove(path, path + 1, path_len);
	movq	-8(%rbp), %rdx	; path_len, tmp163
	movq	-40(%rbp), %rax	; path, tmp164
	movq	%rcx, %rsi	; _34,
	movq	%rax, %rdi	; tmp164,
	call	*memmove@GOTPCREL(%rip)	;
; src/file.c:48:         path[0] = '/';
	movq	-40(%rbp), %rax	; path, tmp165
	movb	$47, (%rax)	;, *path_61
; src/file.c:49:         path[2] = '/';
	movq	-40(%rbp), %rax	; path, tmp166
	addq	$2, %rax	;, _35
; src/file.c:49:         path[2] = '/';
	movb	$47, (%rax)	;, *_35
; src/file.c:50:         return path;
	movq	-40(%rbp), %rax	; path, _51
	jmp	.L12	;
.L11:
; src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpq	$1, -8(%rbp)	;, path_len
	jbe	.L13	;,
; src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	movq	-40(%rbp), %rax	; path, tmp167
	movzbl	(%rax), %eax	; *path_61, _36
; src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpb	$64, %al	;, _36
	jle	.L13	;,
; src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	movq	-40(%rbp), %rax	; path, tmp168
	movzbl	(%rax), %eax	; *path_61, _37
; src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpb	$90, %al	;, _37
	jg	.L13	;,
; src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	movq	-40(%rbp), %rax	; path, tmp169
	addq	$1, %rax	;, _38
	movzbl	(%rax), %eax	; *_38, _39
; src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpb	$58, %al	;, _39
	jne	.L13	;,
; src/file.c:54:         return path;
	movq	-40(%rbp), %rax	; path, _51
	jmp	.L12	;
.L13:
; src/file.c:55:     if (path_len > 0 && path[0] == '/')
	cmpq	$0, -8(%rbp)	;, path_len
	je	.L14	;,
; src/file.c:55:     if (path_len > 0 && path[0] == '/')
	movq	-40(%rbp), %rax	; path, tmp170
	movzbl	(%rax), %eax	; *path_61, _40
; src/file.c:55:     if (path_len > 0 && path[0] == '/')
	cmpb	$47, %al	;, _40
	jne	.L14	;,
; src/file.c:56:         return path;
	movq	-40(%rbp), %rax	; path, _51
	jmp	.L12	;
.L14:
; src/file.c:57:     if (base_path == NULL)
	cmpq	$0, -48(%rbp)	;, base_path
	jne	.L15	;,
; src/file.c:58:         base_path = get_cwd();
	call	get_cwd	;
	movq	%rax, -48(%rbp)	; tmp171, base_path
.L15:
; src/file.c:59:     if (base_path == NULL)
	cmpq	$0, -48(%rbp)	;, base_path
	jne	.L16	;,
; src/file.c:60:         return path;
	movq	-40(%rbp), %rax	; path, _51
	jmp	.L12	;
.L16:
; src/file.c:61:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	movq	-48(%rbp), %rax	; base_path, tmp172
	movq	%rax, %rdi	; tmp172,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:61:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	movq	-8(%rbp), %rdx	; path_len, tmp173
	addq	%rdx, %rax	; tmp173, _42
; src/file.c:61:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	addq	$2, %rax	;, tmp174
	movq	%rax, -24(%rbp)	; tmp174, total_len
; src/file.c:62:     string abs_path = create_string_not_check("", total_len);
	movq	-24(%rbp), %rax	; total_len, tmp175
	movq	%rax, %rsi	; tmp175,
	leaq	.LC0(%rip), %rax	;, tmp176
	movq	%rax, %rdi	; tmp176,
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp177, abs_path
; src/file.c:63:     sprintf(abs_path, "%s/%s", base_path, path);
	movq	-40(%rbp), %rcx	; path, tmp178
	movq	-48(%rbp), %rdx	; base_path, tmp179
	movq	-32(%rbp), %rax	; abs_path, tmp180
	leaq	.LC1(%rip), %rsi	;, tmp181
	movq	%rax, %rdi	; tmp180,
	movl	$0, %eax	;,
	call	*sprintf@GOTPCREL(%rip)	;
; src/file.c:64:     return absolute_path(create_string(abs_path, total_len), NULL);
	movq	-24(%rbp), %rdx	; total_len, tmp182
	movq	-32(%rbp), %rax	; abs_path, tmp183
	movq	%rdx, %rsi	; tmp182,
	movq	%rax, %rdi	; tmp183,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:64:     return absolute_path(create_string(abs_path, total_len), NULL);
	movl	$0, %esi	;,
	movq	%rax, %rdi	; _43,
	call	absolute_path	;
.L12:
; src/file.c:65: }
	leave	
	ret	
	.size	absolute_path, .-absolute_path
	.globl	get_file_name
	.type	get_file_name, @function
get_file_name:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -8(%rbp)	; path, path
; src/file.c:68:     return path->name;
	movq	-8(%rbp), %rax	; path, tmp84
	movq	16(%rax), %rax	; path_2(D)->name, _3
; src/file.c:69: }
	popq	%rbp	;
	ret	
	.size	get_file_name, .-get_file_name
	.globl	get_file_extension
	.type	get_file_extension, @function
get_file_extension:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -8(%rbp)	; path, path
; src/file.c:72:     return path->extension;
	movq	-8(%rbp), %rax	; path, tmp84
	movq	8(%rax), %rax	; path_2(D)->extension, _3
; src/file.c:73: }
	popq	%rbp	;
	ret	
	.size	get_file_extension, .-get_file_extension
	.section	.rodata
.LC2:
	.string	"/"
	.text
	.globl	get_file_dir
	.type	get_file_dir, @function
get_file_dir:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -56(%rbp)	; path, path
; src/file.c:76:     if (path->dirs == NULL) return 0;
	movq	-56(%rbp), %rax	; path, tmp101
	movq	(%rax), %rax	; path_31(D)->dirs, _1
; src/file.c:76:     if (path->dirs == NULL) return 0;
	testq	%rax, %rax	; _1
	jne	.L22	;,
; src/file.c:76:     if (path->dirs == NULL) return 0;
	movl	$0, %eax	;, _25
; src/file.c:76:     if (path->dirs == NULL) return 0;
	jmp	.L23	;
.L22:
; src/file.c:79:     size_t total_len = 0;
	movq	$0, -8(%rbp)	;, total_len
; src/file.c:80:     size_t node_count = 0;
	movq	$0, -16(%rbp)	;, node_count
; src/file.c:81:     StrNode* current = path->dirs;
	movq	-56(%rbp), %rax	; path, tmp102
	movq	(%rax), %rax	; path_31(D)->dirs, tmp103
	movq	%rax, -24(%rbp)	; tmp103, current
; src/file.c:82:     while (current != NULL) {
	jmp	.L24	;
.L26:
; src/file.c:83:         if (current->next != NULL) {  // Not the last element (which is the filename)
	movq	-24(%rbp), %rax	; current, tmp104
	movq	8(%rax), %rax	; current_21->next, _2
; src/file.c:83:         if (current->next != NULL) {  // Not the last element (which is the filename)
	testq	%rax, %rax	; _2
	je	.L25	;,
; src/file.c:84:             size_t dir_len = strlen(current->dir);
	movq	-24(%rbp), %rax	; current, tmp105
	movq	(%rax), %rax	; current_21->dir, _3
; src/file.c:84:             size_t dir_len = strlen(current->dir);
	movq	%rax, %rdi	; _3,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp106, dir_len
; src/file.c:85:             total_len += dir_len;
	movq	-48(%rbp), %rax	; dir_len, tmp107
	addq	%rax, -8(%rbp)	; tmp107, total_len
; src/file.c:86:             node_count++;
	addq	$1, -16(%rbp)	;, node_count
.L25:
; src/file.c:88:         current = current->next;
	movq	-24(%rbp), %rax	; current, tmp108
	movq	8(%rax), %rax	; current_21->next, tmp109
	movq	%rax, -24(%rbp)	; tmp109, current
.L24:
; src/file.c:82:     while (current != NULL) {
	cmpq	$0, -24(%rbp)	;, current
	jne	.L26	;,
; src/file.c:91:     if (node_count == 0) return NULL;
	cmpq	$0, -16(%rbp)	;, node_count
	jne	.L27	;,
; src/file.c:91:     if (node_count == 0) return NULL;
	movl	$0, %eax	;, _25
; src/file.c:91:     if (node_count == 0) return NULL;
	jmp	.L23	;
.L27:
; src/file.c:94:     if (node_count > 1)
	cmpq	$1, -16(%rbp)	;, node_count
	jbe	.L28	;,
; src/file.c:95:         total_len += node_count - 1;
	movq	-16(%rbp), %rdx	; node_count, tmp110
	movq	-8(%rbp), %rax	; total_len, tmp111
	addq	%rdx, %rax	; tmp110, _4
	subq	$1, %rax	;, tmp112
	movq	%rax, -8(%rbp)	; tmp112, total_len
.L28:
; src/file.c:98:     string dir_path = create_string_not_check("", total_len + 1);
	movq	-8(%rbp), %rax	; total_len, tmp113
	addq	$1, %rax	;, _5
	movq	%rax, %rsi	; _5,
	leaq	.LC0(%rip), %rax	;, tmp114
	movq	%rax, %rdi	; tmp114,
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp115, dir_path
; src/file.c:99:     dir_path[0] = '\0';
	movq	-40(%rbp), %rax	; dir_path, tmp116
	movb	$0, (%rax)	;, *dir_path_37
; src/file.c:101:     current = path->dirs;
	movq	-56(%rbp), %rax	; path, tmp117
	movq	(%rax), %rax	; path_31(D)->dirs, tmp118
	movq	%rax, -24(%rbp)	; tmp118, current
; src/file.c:102:     bool first = true;
	movb	$1, -25(%rbp)	;, first
; src/file.c:103:     while (current != NULL) {
	jmp	.L29	;
.L32:
; src/file.c:104:         if (current->next != NULL) {  // Not the last element
	movq	-24(%rbp), %rax	; current, tmp119
	movq	8(%rax), %rax	; current_22->next, _6
; src/file.c:104:         if (current->next != NULL) {  // Not the last element
	testq	%rax, %rax	; _6
	je	.L30	;,
; src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	cmpb	$0, -25(%rbp)	;, first
	jne	.L31	;,
; src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	movq	-24(%rbp), %rax	; current, tmp120
	movq	(%rax), %rax	; current_22->dir, _7
; src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	leaq	.LC2(%rip), %rdx	;, tmp121
	movq	%rdx, %rsi	; tmp121,
	movq	%rax, %rdi	; _7,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	testl	%eax, %eax	; _8
	je	.L31	;,
; src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	movq	-40(%rbp), %rax	; dir_path, tmp122
	movzbl	(%rax), %eax	; MEM[(const char *)dir_path_37], _9
; src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	testb	%al, %al	; _9
	je	.L31	;,
; src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	movq	-40(%rbp), %rax	; dir_path, tmp123
	movq	%rax, %rdi	; tmp123,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	leaq	-1(%rax), %rdx	;, _11
	movq	-40(%rbp), %rax	; dir_path, tmp124
	addq	%rdx, %rax	; _11, _12
	movzbl	(%rax), %eax	; *_12, _13
; src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$47, %al	;, _13
	je	.L31	;,
; src/file.c:108:                     strcat(dir_path, "/");
	movq	-40(%rbp), %rax	; dir_path, tmp126
	movq	%rax, %rdi	; tmp126,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp128, _43
; src/file.c:108:                     strcat(dir_path, "/");
	movq	-40(%rbp), %rax	; dir_path, tmp129
	addq	%rdx, %rax	; _43, _44
	movw	$47, (%rax)	;, MEM <char[1:2]> [(void *)_44]
.L31:
; src/file.c:110:             strcat(dir_path, current->dir);
	movq	-24(%rbp), %rax	; current, tmp130
	movq	(%rax), %rdx	; current_22->dir, _14
; src/file.c:110:             strcat(dir_path, current->dir);
	movq	-40(%rbp), %rax	; dir_path, tmp131
	movq	%rdx, %rsi	; _14,
	movq	%rax, %rdi	; tmp131,
	call	*strcat@GOTPCREL(%rip)	;
; src/file.c:111:             first = false;
	movb	$0, -25(%rbp)	;, first
.L30:
; src/file.c:113:         current = current->next;
	movq	-24(%rbp), %rax	; current, tmp132
	movq	8(%rax), %rax	; current_22->next, tmp133
	movq	%rax, -24(%rbp)	; tmp133, current
.L29:
; src/file.c:103:     while (current != NULL) {
	cmpq	$0, -24(%rbp)	;, current
	jne	.L32	;,
; src/file.c:116:     return create_string(dir_path, strlen(dir_path));
	movq	-40(%rbp), %rax	; dir_path, tmp134
	movq	%rax, %rdi	; tmp134,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _15
; src/file.c:116:     return create_string(dir_path, strlen(dir_path));
	movq	-40(%rbp), %rax	; dir_path, tmp135
	movq	%rdx, %rsi	; _15,
	movq	%rax, %rdi	; tmp135,
	call	*create_string@GOTPCREL(%rip)	;
.L23:
; src/file.c:117: }
	leave	
	ret	
	.size	get_file_dir, .-get_file_dir
	.globl	get_full_path
	.type	get_full_path, @function
get_full_path:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -8(%rbp)	; path, path
; src/file.c:120:     return path->path;
	movq	-8(%rbp), %rax	; path, tmp84
	movq	24(%rax), %rax	; path_2(D)->path, _3
; src/file.c:121: }
	popq	%rbp	;
	ret	
	.size	get_full_path, .-get_full_path
	.section	.rodata
.LC3:
	.string	"%s/%s%s"
.LC4:
	.string	"%s%s"
	.text
	.type	rebuild_full_path, @function
rebuild_full_path:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	pushq	%rbx	;
	subq	$72, %rsp	;,
	movq	%rdi, -72(%rbp)	; file, file
; src/file.c:124:     string dir = get_file_dir(file);
	movq	-72(%rbp), %rax	; file, tmp97
	movq	%rax, %rdi	; tmp97,
	call	get_file_dir	;
	movq	%rax, -32(%rbp)	; tmp98, dir
; src/file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	cmpq	$0, -32(%rbp)	;, dir
	je	.L36	;,
; src/file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	movq	-32(%rbp), %rax	; dir, iftmp.0_15
	jmp	.L37	;
.L36:
; src/file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	leaq	.LC0(%rip), %rax	;, iftmp.0_15
.L37:
; src/file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	movq	%rax, -40(%rbp)	; iftmp.0_15, dir_cstr
; src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	-72(%rbp), %rax	; file, tmp99
	movq	8(%rax), %rax	; file_19(D)->extension, _1
; src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%rax, %rax	; _1
	je	.L38	;,
; src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	-72(%rbp), %rax	; file, tmp100
	movq	8(%rax), %rax	; file_19(D)->extension, iftmp.1_16
	jmp	.L39	;
.L38:
; src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	leaq	.LC0(%rip), %rax	;, iftmp.1_16
.L39:
; src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	%rax, -48(%rbp)	; iftmp.1_16, ext_cstr
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	-40(%rbp), %rax	; dir_cstr, tmp101
	movq	%rax, %rdi	; tmp101,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rbx	;, _2
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	-72(%rbp), %rax	; file, tmp102
	movq	16(%rax), %rax	; file_19(D)->name, _3
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%rax, %rdi	; _3,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	addq	%rbx, %rax	; _2, _5
; src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	addq	$1, %rax	;, tmp103
	movq	%rax, -24(%rbp)	; tmp103, path_len
; src/file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	movq	-72(%rbp), %rax	; file, tmp104
	movq	8(%rax), %rax	; file_19(D)->extension, _6
; src/file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	testq	%rax, %rax	; _6
	je	.L40	;,
; src/file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	movq	-48(%rbp), %rax	; ext_cstr, tmp105
	movq	%rax, %rdi	; tmp105,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	addq	%rax, -24(%rbp)	; _7, path_len
.L40:
; src/file.c:131:     string new_path = create_string_not_check("", path_len + 1);
	movq	-24(%rbp), %rax	; path_len, tmp106
	addq	$1, %rax	;, _8
	movq	%rax, %rsi	; _8,
	leaq	.LC0(%rip), %rax	;, tmp107
	movq	%rax, %rdi	; tmp107,
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, -56(%rbp)	; tmp108, new_path
; src/file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpq	$0, -32(%rbp)	;, dir
	je	.L41	;,
; src/file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	movq	-40(%rbp), %rax	; dir_cstr, tmp109
	movzbl	(%rax), %eax	; MEM[(const char *)dir_cstr_24], _9
; src/file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	testb	%al, %al	; _9
	je	.L41	;,
; src/file.c:133:         sprintf(new_path, "%s/%s%s", dir_cstr, file->name, ext_cstr);
	movq	-72(%rbp), %rax	; file, tmp110
	movq	16(%rax), %rcx	; file_19(D)->name, _10
	movq	-48(%rbp), %rsi	; ext_cstr, tmp111
	movq	-40(%rbp), %rdx	; dir_cstr, tmp112
	movq	-56(%rbp), %rax	; new_path, tmp113
	movq	%rsi, %r8	; tmp111,
	leaq	.LC3(%rip), %rsi	;, tmp114
	movq	%rax, %rdi	; tmp113,
	movl	$0, %eax	;,
	call	*sprintf@GOTPCREL(%rip)	;
	jmp	.L42	;
.L41:
; src/file.c:135:         sprintf(new_path, "%s%s", file->name, ext_cstr);
	movq	-72(%rbp), %rax	; file, tmp115
	movq	16(%rax), %rdx	; file_19(D)->name, _11
	movq	-48(%rbp), %rcx	; ext_cstr, tmp116
	movq	-56(%rbp), %rax	; new_path, tmp117
	leaq	.LC4(%rip), %rsi	;, tmp118
	movq	%rax, %rdi	; tmp117,
	movl	$0, %eax	;,
	call	*sprintf@GOTPCREL(%rip)	;
.L42:
; src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	-56(%rbp), %rax	; new_path, tmp119
	movq	%rax, %rdi	; tmp119,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _12
; src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	-56(%rbp), %rax	; new_path, tmp120
	movq	%rdx, %rsi	; _12,
	movq	%rax, %rdi	; tmp120,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	-72(%rbp), %rdx	; file, tmp121
	movq	%rax, 24(%rdx)	; _13, file_19(D)->path
; src/file.c:138: }
	nop	
	movq	-8(%rbp), %rbx	;,
	leave	
	ret	
	.size	rebuild_full_path, .-rebuild_full_path
	.globl	change_file_extension
	.type	change_file_extension, @function
change_file_extension:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$16, %rsp	;,
	movq	%rdi, -8(%rbp)	; file, file
	movq	%rsi, -16(%rbp)	; new_extension, new_extension
; src/file.c:141:     file->extension = new_extension;
	movq	-8(%rbp), %rax	; file, tmp82
	movq	-16(%rbp), %rdx	; new_extension, tmp83
	movq	%rdx, 8(%rax)	; tmp83, file_2(D)->extension
; src/file.c:142:     rebuild_full_path(file);
	movq	-8(%rbp), %rax	; file, tmp84
	movq	%rax, %rdi	; tmp84,
	call	rebuild_full_path	;
; src/file.c:143: }
	nop	
	leave	
	ret	
	.size	change_file_extension, .-change_file_extension
	.globl	change_file_name
	.type	change_file_name, @function
change_file_name:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -40(%rbp)	; file, file
	movq	%rsi, -48(%rbp)	; new_name, new_name
; src/file.c:146:     file->name = new_name;
	movq	-40(%rbp), %rax	; file, tmp91
	movq	-48(%rbp), %rdx	; new_name, tmp92
	movq	%rdx, 16(%rax)	; tmp92, file_14(D)->name
; src/file.c:149:     if (file->dirs != NULL) {
	movq	-40(%rbp), %rax	; file, tmp93
	movq	(%rax), %rax	; file_14(D)->dirs, _1
; src/file.c:149:     if (file->dirs != NULL) {
	testq	%rax, %rax	; _1
	je	.L45	;,
; src/file.c:150:         StrNode* current = file->dirs;
	movq	-40(%rbp), %rax	; file, tmp94
	movq	(%rax), %rax	; file_14(D)->dirs, tmp95
	movq	%rax, -8(%rbp)	; tmp95, current
; src/file.c:152:         while (current != NULL) {
	jmp	.L46	;
.L51:
; src/file.c:153:             if (current->next == NULL) {
	movq	-8(%rbp), %rax	; current, tmp96
	movq	8(%rax), %rax	; current_9->next, _2
; src/file.c:153:             if (current->next == NULL) {
	testq	%rax, %rax	; _2
	jne	.L47	;,
; src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	-40(%rbp), %rax	; file, tmp97
	movq	8(%rax), %rax	; file_14(D)->extension, _3
; src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%rax, %rax	; _3
	je	.L48	;,
; src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	-40(%rbp), %rax	; file, tmp98
	movq	8(%rax), %rax	; file_14(D)->extension, iftmp.2_11
	jmp	.L49	;
.L48:
; src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	leaq	.LC0(%rip), %rax	;, iftmp.2_11
.L49:
; src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	%rax, -24(%rbp)	; iftmp.2_11, ext_cstr
; src/file.c:156:                 size_t full_name_len = strlen(new_name);
	movq	-48(%rbp), %rax	; new_name, tmp99
	movq	%rax, %rdi	; tmp99,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp100, full_name_len
; src/file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	movq	-40(%rbp), %rax	; file, tmp101
	movq	8(%rax), %rax	; file_14(D)->extension, _4
; src/file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	testq	%rax, %rax	; _4
	je	.L50	;,
; src/file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	movq	-24(%rbp), %rax	; ext_cstr, tmp102
	movq	%rax, %rdi	; tmp102,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	addq	%rax, -16(%rbp)	; _5, full_name_len
.L50:
; src/file.c:159:                 string full_name = create_string_not_check("", full_name_len + 1);
	movq	-16(%rbp), %rax	; full_name_len, tmp103
	addq	$1, %rax	;, _6
	movq	%rax, %rsi	; _6,
	leaq	.LC0(%rip), %rax	;, tmp104
	movq	%rax, %rdi	; tmp104,
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp105, full_name
; src/file.c:160:                 sprintf(full_name, "%s%s", new_name, ext_cstr);
	movq	-24(%rbp), %rcx	; ext_cstr, tmp106
	movq	-48(%rbp), %rdx	; new_name, tmp107
	movq	-32(%rbp), %rax	; full_name, tmp108
	leaq	.LC4(%rip), %rsi	;, tmp109
	movq	%rax, %rdi	; tmp108,
	movl	$0, %eax	;,
	call	*sprintf@GOTPCREL(%rip)	;
; src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	-32(%rbp), %rax	; full_name, tmp110
	movq	%rax, %rdi	; tmp110,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _7
; src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	-32(%rbp), %rax	; full_name, tmp111
	movq	%rdx, %rsi	; _7,
	movq	%rax, %rdi	; tmp111,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	-8(%rbp), %rdx	; current, tmp112
	movq	%rax, (%rdx)	; _8, current_9->dir
; src/file.c:162:                 break;
	jmp	.L45	;
.L47:
; src/file.c:164:             current = current->next;
	movq	-8(%rbp), %rax	; current, tmp113
	movq	8(%rax), %rax	; current_9->next, tmp114
	movq	%rax, -8(%rbp)	; tmp114, current
.L46:
; src/file.c:152:         while (current != NULL) {
	cmpq	$0, -8(%rbp)	;, current
	jne	.L51	;,
.L45:
; src/file.c:168:     rebuild_full_path(file);
	movq	-40(%rbp), %rax	; file, tmp115
	movq	%rax, %rdi	; tmp115,
	call	rebuild_full_path	;
; src/file.c:169: }
	nop	
	leave	
	ret	
	.size	change_file_name, .-change_file_name
	.section	.rodata
	.align 8
.LC5:
	.string	"Warning: Path component too long, truncating to %zu characters\n"
.LC6:
	.string	"."
.LC7:
	.string	".."
	.text
	.type	normalize_path, @function
normalize_path:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$432, %rsp	;,
	movq	%rdi, -424(%rbp)	; file, file
; src/file.c:172:     size_t path_len = strlen(file->path);
	movq	-424(%rbp), %rax	; file, tmp126
	movq	24(%rax), %rax	; file_82(D)->path, _1
; src/file.c:172:     size_t path_len = strlen(file->path);
	movq	%rax, %rdi	; _1,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, -88(%rbp)	; tmp127, path_len
; src/file.c:175:     string path_copy = create_string_not_check("", path_len + 1);
	movq	-88(%rbp), %rax	; path_len, tmp128
	addq	$1, %rax	;, _2
	movq	%rax, %rsi	; _2,
	leaq	.LC0(%rip), %rax	;, tmp129
	movq	%rax, %rdi	; tmp129,
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, -96(%rbp)	; tmp130, path_copy
; src/file.c:176:     strcpy(path_copy, file->path);
	movq	-424(%rbp), %rax	; file, tmp131
	movq	24(%rax), %rdx	; file_82(D)->path, _3
; src/file.c:176:     strcpy(path_copy, file->path);
	movq	-96(%rbp), %rax	; path_copy, tmp132
	movq	%rdx, %rsi	; _3,
	movq	%rax, %rdi	; tmp132,
	call	*strcpy@GOTPCREL(%rip)	;
; src/file.c:178:     StrNode* dirs_head = NULL;
	movq	$0, -8(%rbp)	;, dirs_head
; src/file.c:179:     StrNode* dirs_tail = NULL;
	movq	$0, -16(%rbp)	;, dirs_tail
; src/file.c:181:     size_t start = 0;
	movq	$0, -24(%rbp)	;, start
; src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	cmpq	$0, -88(%rbp)	;, path_len
	je	.L53	;,
; src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	movq	-96(%rbp), %rax	; path_copy, tmp133
	movzbl	(%rax), %eax	; *path_copy_85, _4
; src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	cmpb	$47, %al	;, _4
	jne	.L53	;,
; src/file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -104(%rbp)	; tmp134, node
; src/file.c:199:         node->dir = create_string("/", 1);
	movl	$1, %esi	;,
	leaq	.LC2(%rip), %rax	;, tmp135
	movq	%rax, %rdi	; tmp135,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:199:         node->dir = create_string("/", 1);
	movq	-104(%rbp), %rdx	; node, tmp136
	movq	%rax, (%rdx)	; _5, node_91->dir
; src/file.c:200:         node->next = 0;
	movq	-104(%rbp), %rax	; node, tmp137
	movq	$0, 8(%rax)	;, node_91->next
; src/file.c:202:         dirs_head = node;
	movq	-104(%rbp), %rax	; node, tmp138
	movq	%rax, -8(%rbp)	; tmp138, dirs_head
; src/file.c:203:         dirs_tail = node;
	movq	-104(%rbp), %rax	; node, tmp139
	movq	%rax, -16(%rbp)	; tmp139, dirs_tail
; src/file.c:204:         start = 1;
	movq	$1, -24(%rbp)	;, start
.L53:
; src/file.c:209:     size_t i = start;
	movq	-24(%rbp), %rax	; start, tmp140
	movq	%rax, -32(%rbp)	; tmp140, i
; src/file.c:210:     while (i <= path_len) {
	jmp	.L54	;
.L69:
; src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	movq	-32(%rbp), %rax	; i, tmp141
	cmpq	-88(%rbp), %rax	; path_len, tmp141
	je	.L55	;,
; src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	movq	-96(%rbp), %rdx	; path_copy, tmp142
	movq	-32(%rbp), %rax	; i, tmp143
	addq	%rdx, %rax	; tmp142, _6
	movzbl	(%rax), %eax	; *_6, _7
; src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpb	$47, %al	;, _7
	jne	.L56	;,
.L55:
; src/file.c:212:             if (i > start) {
	movq	-32(%rbp), %rax	; i, tmp144
	cmpq	%rax, -24(%rbp)	; tmp144, start
	jnb	.L57	;,
; src/file.c:213:                 size_t comp_len = i - start;
	movq	-32(%rbp), %rax	; i, tmp148
	subq	-24(%rbp), %rax	; start, tmp147
	movq	%rax, -40(%rbp)	; tmp147, comp_len
; src/file.c:214:                 if (comp_len >= componentMaxSize) {
	cmpq	$255, -40(%rbp)	;, comp_len
	jbe	.L58	;,
; src/file.c:215:                     fprintf(stderr, "Warning: Path component too long, truncating to %zu characters\n", comp_len);
	movq	stderr(%rip), %rax	; stderr, stderr.3_8
	movq	-40(%rbp), %rdx	; comp_len, tmp149
	leaq	.LC5(%rip), %rcx	;, tmp150
	movq	%rcx, %rsi	; tmp150,
	movq	%rax, %rdi	; stderr.3_8,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/file.c:216:                     comp_len = componentMaxSize - 1;
	movq	$255, -40(%rbp)	;, comp_len
.L58:
; src/file.c:219:                 strncpy(component, path_copy + start, comp_len);
	movq	-96(%rbp), %rdx	; path_copy, tmp151
	movq	-24(%rbp), %rax	; start, tmp152
	leaq	(%rdx,%rax), %rcx	;, _9
; src/file.c:219:                 strncpy(component, path_copy + start, comp_len);
	movq	-40(%rbp), %rdx	; comp_len, tmp153
	leaq	-416(%rbp), %rax	;, tmp154
	movq	%rcx, %rsi	; _9,
	movq	%rax, %rdi	; tmp154,
	call	*strncpy@GOTPCREL(%rip)	;
; src/file.c:220:                 component[comp_len] = '\0';
	leaq	-416(%rbp), %rdx	;, tmp155
	movq	-40(%rbp), %rax	; comp_len, tmp157
	addq	%rdx, %rax	; tmp155, tmp156
	movb	$0, (%rax)	;, component[comp_len_60]
; src/file.c:222:                 if (strcmp(component, ".") == 0) {
	leaq	-416(%rbp), %rax	;, tmp158
	leaq	.LC6(%rip), %rdx	;, tmp159
	movq	%rdx, %rsi	; tmp159,
	movq	%rax, %rdi	; tmp158,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:222:                 if (strcmp(component, ".") == 0) {
	testl	%eax, %eax	; _10
	je	.L57	;,
; src/file.c:224:                 } else if (strcmp(component, "..") == 0) {
	leaq	-416(%rbp), %rax	;, tmp160
	leaq	.LC7(%rip), %rdx	;, tmp161
	movq	%rdx, %rsi	; tmp161,
	movq	%rax, %rdi	; tmp160,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:224:                 } else if (strcmp(component, "..") == 0) {
	testl	%eax, %eax	; _11
	jne	.L60	;,
; src/file.c:226:                     if (dirs_tail != NULL && dirs_tail != dirs_head) {
	cmpq	$0, -16(%rbp)	;, dirs_tail
	je	.L61	;,
; src/file.c:226:                     if (dirs_tail != NULL && dirs_tail != dirs_head) {
	movq	-16(%rbp), %rax	; dirs_tail, tmp162
	cmpq	-8(%rbp), %rax	; dirs_head, tmp162
	je	.L61	;,
; src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	movq	-16(%rbp), %rax	; dirs_tail, tmp163
	movq	(%rax), %rax	; dirs_tail_55->dir, _12
; src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	leaq	.LC7(%rip), %rdx	;, tmp164
	movq	%rdx, %rsi	; tmp164,
	movq	%rax, %rdi	; _12,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	testl	%eax, %eax	; _13
	jne	.L62	;,
; src/file.c:229:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -144(%rbp)	; tmp165, node
; src/file.c:230:                             node->dir = create_string("..", 2);
	movl	$2, %esi	;,
	leaq	.LC7(%rip), %rax	;, tmp166
	movq	%rax, %rdi	; tmp166,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:230:                             node->dir = create_string("..", 2);
	movq	-144(%rbp), %rdx	; node, tmp167
	movq	%rax, (%rdx)	; _14, node_148->dir
; src/file.c:231:                             node->next = 0;
	movq	-144(%rbp), %rax	; node, tmp168
	movq	$0, 8(%rax)	;, node_148->next
; src/file.c:232:                             dirs_tail->next = node;
	movq	-16(%rbp), %rax	; dirs_tail, tmp169
	movq	-144(%rbp), %rdx	; node, tmp170
	movq	%rdx, 8(%rax)	; tmp170, dirs_tail_55->next
; src/file.c:233:                             dirs_tail = node;
	movq	-144(%rbp), %rax	; node, tmp171
	movq	%rax, -16(%rbp)	; tmp171, dirs_tail
; src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	jmp	.L80	;
.L62:
; src/file.c:236:                             StrNode* prev = dirs_head;
	movq	-8(%rbp), %rax	; dirs_head, tmp172
	movq	%rax, -48(%rbp)	; tmp172, prev
; src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	jmp	.L64	;
.L66:
; src/file.c:238:                                 prev = prev->next;
	movq	-48(%rbp), %rax	; prev, tmp173
	movq	8(%rax), %rax	; prev_61->next, tmp174
	movq	%rax, -48(%rbp)	; tmp174, prev
.L64:
; src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	cmpq	$0, -48(%rbp)	;, prev
	je	.L65	;,
; src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	movq	-48(%rbp), %rax	; prev, tmp175
	movq	8(%rax), %rax	; prev_61->next, _15
; src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	cmpq	%rax, -16(%rbp)	; _15, dirs_tail
	jne	.L66	;,
.L65:
; src/file.c:240:                             if (prev != NULL) {
	cmpq	$0, -48(%rbp)	;, prev
	je	.L80	;,
; src/file.c:241:                                 prev->next = 0;
	movq	-48(%rbp), %rax	; prev, tmp176
	movq	$0, 8(%rax)	;, prev_61->next
; src/file.c:242:                                 dirs_tail = prev;
	movq	-48(%rbp), %rax	; prev, tmp177
	movq	%rax, -16(%rbp)	; tmp177, dirs_tail
; src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	jmp	.L80	;
.L61:
; src/file.c:245:                     } else if (dirs_head == NULL) {
	cmpq	$0, -8(%rbp)	;, dirs_head
	jne	.L57	;,
; src/file.c:247:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -152(%rbp)	; tmp178, node
; src/file.c:248:                         node->dir = create_string("..", 2);
	movl	$2, %esi	;,
	leaq	.LC7(%rip), %rax	;, tmp179
	movq	%rax, %rdi	; tmp179,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:248:                         node->dir = create_string("..", 2);
	movq	-152(%rbp), %rdx	; node, tmp180
	movq	%rax, (%rdx)	; _16, node_155->dir
; src/file.c:249:                         node->next = 0;
	movq	-152(%rbp), %rax	; node, tmp181
	movq	$0, 8(%rax)	;, node_155->next
; src/file.c:250:                         dirs_head = node;
	movq	-152(%rbp), %rax	; node, tmp182
	movq	%rax, -8(%rbp)	; tmp182, dirs_head
; src/file.c:251:                         dirs_tail = node;
	movq	-152(%rbp), %rax	; node, tmp183
	movq	%rax, -16(%rbp)	; tmp183, dirs_tail
	jmp	.L57	;
.L60:
; src/file.c:253:                 } else if (strlen(component) > 0) {
	leaq	-416(%rbp), %rax	;, component.4_17
; src/file.c:253:                 } else if (strlen(component) > 0) {
	movzbl	(%rax), %eax	; MEM[(const char *)component.4_17], _18
; src/file.c:253:                 } else if (strlen(component) > 0) {
	testb	%al, %al	; _18
	je	.L57	;,
; src/file.c:255:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -136(%rbp)	; tmp184, node
; src/file.c:256:                     node->dir = create_string(component, comp_len);
	movq	-40(%rbp), %rdx	; comp_len, tmp185
	leaq	-416(%rbp), %rax	;, tmp186
	movq	%rdx, %rsi	; tmp185,
	movq	%rax, %rdi	; tmp186,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:256:                     node->dir = create_string(component, comp_len);
	movq	-136(%rbp), %rdx	; node, tmp187
	movq	%rax, (%rdx)	; _19, node_136->dir
; src/file.c:257:                     node->next = 0;
	movq	-136(%rbp), %rax	; node, tmp188
	movq	$0, 8(%rax)	;, node_136->next
; src/file.c:259:                     if (dirs_tail != NULL)
	cmpq	$0, -16(%rbp)	;, dirs_tail
	je	.L68	;,
; src/file.c:260:                         dirs_tail->next = node;
	movq	-16(%rbp), %rax	; dirs_tail, tmp189
	movq	-136(%rbp), %rdx	; node, tmp190
	movq	%rdx, 8(%rax)	; tmp190, dirs_tail_55->next
.L68:
; src/file.c:262:                     dirs_tail = node;
	movq	-136(%rbp), %rax	; node, tmp191
	movq	%rax, -16(%rbp)	; tmp191, dirs_tail
; src/file.c:263:                     if (dirs_head == NULL) dirs_head = node;
	cmpq	$0, -8(%rbp)	;, dirs_head
	jne	.L57	;,
; src/file.c:263:                     if (dirs_head == NULL) dirs_head = node;
	movq	-136(%rbp), %rax	; node, tmp192
	movq	%rax, -8(%rbp)	; tmp192, dirs_head
	jmp	.L57	;
.L80:
; src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	nop	
.L57:
; src/file.c:266:             start = i + 1;
	movq	-32(%rbp), %rax	; i, tmp196
	addq	$1, %rax	;, tmp195
	movq	%rax, -24(%rbp)	; tmp195, start
.L56:
; src/file.c:268:         i++;
	addq	$1, -32(%rbp)	;, i
.L54:
; src/file.c:210:     while (i <= path_len) {
	movq	-32(%rbp), %rax	; i, tmp197
	cmpq	%rax, -88(%rbp)	; tmp197, path_len
	jnb	.L69	;,
; src/file.c:272:     file->dirs = dirs_head;
	movq	-424(%rbp), %rax	; file, tmp198
	movq	-8(%rbp), %rdx	; dirs_head, tmp199
	movq	%rdx, (%rax)	; tmp199, file_82(D)->dirs
; src/file.c:275:     if (dirs_tail != NULL) {
	cmpq	$0, -16(%rbp)	;, dirs_tail
	je	.L70	;,
; src/file.c:276:         string dot = strrchr(dirs_tail->dir, '.');
	movq	-16(%rbp), %rax	; dirs_tail, tmp200
	movq	(%rax), %rax	; dirs_tail_55->dir, _20
; src/file.c:276:         string dot = strrchr(dirs_tail->dir, '.');
	movl	$46, %esi	;,
	movq	%rax, %rdi	; _20,
	call	*strrchr@GOTPCREL(%rip)	;
	movq	%rax, -112(%rbp)	; tmp201, dot
; src/file.c:278:         if (dot != NULL && dot != dirs_tail->dir) {
	cmpq	$0, -112(%rbp)	;, dot
	je	.L71	;,
; src/file.c:278:         if (dot != NULL && dot != dirs_tail->dir) {
	movq	-16(%rbp), %rax	; dirs_tail, tmp202
	movq	(%rax), %rax	; dirs_tail_55->dir, _21
; src/file.c:278:         if (dot != NULL && dot != dirs_tail->dir) {
	cmpq	%rax, -112(%rbp)	; _21, dot
	je	.L71	;,
; src/file.c:280:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	-16(%rbp), %rax	; dirs_tail, tmp203
	movq	(%rax), %rax	; dirs_tail_55->dir, _22
; src/file.c:280:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	-112(%rbp), %rdx	; dot, tmp204
	subq	%rax, %rdx	; _22, _23
; src/file.c:280:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	%rdx, -120(%rbp)	; _23, name_len
; src/file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	movq	-16(%rbp), %rax	; dirs_tail, tmp205
	movq	(%rax), %rax	; dirs_tail_55->dir, _24
; src/file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	movq	-120(%rbp), %rdx	; name_len, tmp206
	movq	%rdx, %rsi	; tmp206,
	movq	%rax, %rdi	; _24,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	movq	-424(%rbp), %rdx	; file, tmp207
	movq	%rax, 16(%rdx)	; _25, file_82(D)->name
; src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	-112(%rbp), %rax	; dot, tmp208
	movq	%rax, %rdi	; tmp208,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _26
; src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	-112(%rbp), %rax	; dot, tmp209
	movq	%rdx, %rsi	; _26,
	movq	%rax, %rdi	; tmp209,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	-424(%rbp), %rdx	; file, tmp210
	movq	%rax, 8(%rdx)	; _27, file_82(D)->extension
; src/file.c:278:         if (dot != NULL && dot != dirs_tail->dir) {
	jmp	.L73	;
.L71:
; src/file.c:285:             file->name = dirs_tail->dir;
	movq	-16(%rbp), %rax	; dirs_tail, tmp211
	movq	(%rax), %rdx	; dirs_tail_55->dir, _28
; src/file.c:285:             file->name = dirs_tail->dir;
	movq	-424(%rbp), %rax	; file, tmp212
	movq	%rdx, 16(%rax)	; _28, file_82(D)->name
; src/file.c:286:             file->extension = NULL;
	movq	-424(%rbp), %rax	; file, tmp213
	movq	$0, 8(%rax)	;, file_82(D)->extension
	jmp	.L73	;
.L70:
; src/file.c:289:         file->name = NULL;
	movq	-424(%rbp), %rax	; file, tmp214
	movq	$0, 16(%rax)	;, file_82(D)->name
; src/file.c:290:         file->extension = NULL;
	movq	-424(%rbp), %rax	; file, tmp215
	movq	$0, 8(%rax)	;, file_82(D)->extension
.L73:
; src/file.c:294:     size_t full_path_len = 0;
	movq	$0, -56(%rbp)	;, full_path_len
; src/file.c:295:     StrNode* current = dirs_head;
	movq	-8(%rbp), %rax	; dirs_head, tmp216
	movq	%rax, -64(%rbp)	; tmp216, current
; src/file.c:296:     size_t node_count = 0;
	movq	$0, -72(%rbp)	;, node_count
; src/file.c:298:     while (current != NULL) {
	jmp	.L74	;
.L75:
; src/file.c:299:         full_path_len += strlen(current->dir);
	movq	-64(%rbp), %rax	; current, tmp217
	movq	(%rax), %rax	; current_64->dir, _29
; src/file.c:299:         full_path_len += strlen(current->dir);
	movq	%rax, %rdi	; _29,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:299:         full_path_len += strlen(current->dir);
	addq	%rax, -56(%rbp)	; _30, full_path_len
; src/file.c:300:         node_count++;
	addq	$1, -72(%rbp)	;, node_count
; src/file.c:301:         current = current->next;
	movq	-64(%rbp), %rax	; current, tmp218
	movq	8(%rax), %rax	; current_64->next, tmp219
	movq	%rax, -64(%rbp)	; tmp219, current
.L74:
; src/file.c:298:     while (current != NULL) {
	cmpq	$0, -64(%rbp)	;, current
	jne	.L75	;,
; src/file.c:305:     if (node_count > 1)
	cmpq	$1, -72(%rbp)	;, node_count
	jbe	.L76	;,
; src/file.c:306:         full_path_len += (node_count - 1);
	movq	-72(%rbp), %rdx	; node_count, tmp220
	movq	-56(%rbp), %rax	; full_path_len, tmp221
	addq	%rdx, %rax	; tmp220, _31
	subq	$1, %rax	;, tmp222
	movq	%rax, -56(%rbp)	; tmp222, full_path_len
.L76:
; src/file.c:308:     string full_path = create_string_not_check("", full_path_len + 1);
	movq	-56(%rbp), %rax	; full_path_len, tmp223
	addq	$1, %rax	;, _32
	movq	%rax, %rsi	; _32,
	leaq	.LC0(%rip), %rax	;, tmp224
	movq	%rax, %rdi	; tmp224,
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, -128(%rbp)	; tmp225, full_path
; src/file.c:309:     full_path[0] = '\0';
	movq	-128(%rbp), %rax	; full_path, tmp226
	movb	$0, (%rax)	;, *full_path_115
; src/file.c:311:     current = dirs_head;
	movq	-8(%rbp), %rax	; dirs_head, tmp227
	movq	%rax, -64(%rbp)	; tmp227, current
; src/file.c:312:     bool is_first = true;
	movb	$1, -73(%rbp)	;, is_first
; src/file.c:313:     while (current != NULL) {
	jmp	.L77	;
.L79:
; src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	cmpb	$0, -73(%rbp)	;, is_first
	jne	.L78	;,
; src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	-64(%rbp), %rax	; current, tmp228
	movq	(%rax), %rax	; current_65->dir, _33
; src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	leaq	.LC2(%rip), %rdx	;, tmp229
	movq	%rdx, %rsi	; tmp229,
	movq	%rax, %rdi	; _33,
	call	*strcmp@GOTPCREL(%rip)	;
; src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testl	%eax, %eax	; _34
	je	.L78	;,
; src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	movq	-128(%rbp), %rax	; full_path, tmp230
	movzbl	(%rax), %eax	; MEM[(const char *)full_path_115], _35
; src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	testb	%al, %al	; _35
	je	.L78	;,
; src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	movq	-128(%rbp), %rax	; full_path, tmp231
	movq	%rax, %rdi	; tmp231,
	call	*strlen@GOTPCREL(%rip)	;
; src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	leaq	-1(%rax), %rdx	;, _37
	movq	-128(%rbp), %rax	; full_path, tmp232
	addq	%rdx, %rax	; _37, _38
	movzbl	(%rax), %eax	; *_38, _39
; src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$47, %al	;, _39
	je	.L78	;,
; src/file.c:317:                 strcat(full_path, "/");
	movq	-128(%rbp), %rax	; full_path, tmp234
	movq	%rax, %rdi	; tmp234,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp236, _121
; src/file.c:317:                 strcat(full_path, "/");
	movq	-128(%rbp), %rax	; full_path, tmp237
	addq	%rdx, %rax	; _121, _122
	movw	$47, (%rax)	;, MEM <char[1:2]> [(void *)_122]
.L78:
; src/file.c:320:         strcat(full_path, current->dir);
	movq	-64(%rbp), %rax	; current, tmp238
	movq	(%rax), %rdx	; current_65->dir, _40
; src/file.c:320:         strcat(full_path, current->dir);
	movq	-128(%rbp), %rax	; full_path, tmp239
	movq	%rdx, %rsi	; _40,
	movq	%rax, %rdi	; tmp239,
	call	*strcat@GOTPCREL(%rip)	;
; src/file.c:321:         is_first = false;
	movb	$0, -73(%rbp)	;, is_first
; src/file.c:322:         current = current->next;
	movq	-64(%rbp), %rax	; current, tmp240
	movq	8(%rax), %rax	; current_65->next, tmp241
	movq	%rax, -64(%rbp)	; tmp241, current
.L77:
; src/file.c:313:     while (current != NULL) {
	cmpq	$0, -64(%rbp)	;, current
	jne	.L79	;,
; src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	-128(%rbp), %rax	; full_path, tmp242
	movq	%rax, %rdi	; tmp242,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _41
; src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	-128(%rbp), %rax	; full_path, tmp243
	movq	%rdx, %rsi	; _41,
	movq	%rax, %rdi	; tmp243,
	call	*create_string@GOTPCREL(%rip)	;
; src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	-424(%rbp), %rdx	; file, tmp244
	movq	%rax, 24(%rdx)	; _42, file_82(D)->path
; src/file.c:326: }
	nop	
	leave	
	ret	
	.size	normalize_path, .-normalize_path
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
