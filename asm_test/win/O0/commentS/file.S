	.file	"file.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.globl	get_cwd
	.def	get_cwd;	.scl	2;	.type	32;	.endef
get_cwd:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
 ; D:/TC/src/file.c:7:     return getcwd(NULL, 0);  // MinGW or LINUX or MACOS
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	getcwd	 ;
 ; D:/TC/src/file.c:11: }
	leave	
	ret	
	.globl	create_file
	.def	create_file;	.scl	2;	.type	32;	.endef
create_file:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; path, path
 ; D:/TC/src/file.c:16:     File* file = (File*)alloc_memory(sizeof(File));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp85, file
 ; D:/TC/src/file.c:17:     file->path = absolute_path(path, NULL);
	movq	16(%rbp), %rax	 ; path, tmp86
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp86,
	call	absolute_path	 ;
 ; D:/TC/src/file.c:17:     file->path = absolute_path(path, NULL);
	movq	-8(%rbp), %rdx	 ; file, tmp87
	movq	%rax, 24(%rdx)	 ; _1, file_4->path
 ; D:/TC/src/file.c:18:     normalize_path(file);
	movq	-8(%rbp), %rax	 ; file, tmp88
	movq	%rax, %rcx	 ; tmp88,
	call	normalize_path	 ;
 ; D:/TC/src/file.c:19:     return file;
	movq	-8(%rbp), %rax	 ; file, _9
 ; D:/TC/src/file.c:20: }
	leave	
	ret	
	.section .rdata,"dr"
.LC0:
	.ascii "\0"
.LC1:
	.ascii "%s/%s\0"
	.text
	.globl	absolute_path
	.def	absolute_path;	.scl	2;	.type	32;	.endef
absolute_path:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$80, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; path, path
	movq	%rdx, 24(%rbp)	 ; base_path, base_path
 ; D:/TC/src/file.c:23:     path = create_string_not_check(path, strlen(path));
	movq	16(%rbp), %rax	 ; path, tmp132
	movq	%rax, %rcx	 ; tmp132,
	call	strlen	 ;
	movq	%rax, %rdx	 ;, _1
 ; D:/TC/src/file.c:23:     path = create_string_not_check(path, strlen(path));
	movq	16(%rbp), %rax	 ; path, tmp133
	movq	%rax, %rcx	 ; tmp133,
	call	create_string_not_check	 ;
	movq	%rax, 16(%rbp)	 ; tmp134, path
 ; D:/TC/src/file.c:24:     size_t path_len = strlen(path);
	movq	16(%rbp), %rax	 ; path, tmp135
	movq	%rax, %rcx	 ; tmp135,
	call	strlen	 ;
	movq	%rax, -8(%rbp)	 ; tmp136, path_len
 ; D:/TC/src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	movq	$0, -16(%rbp)	 ;, i
 ; D:/TC/src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	jmp	.L6	 ;
.L10:
 ; D:/TC/src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	movq	16(%rbp), %rdx	 ; path, tmp137
	movq	-16(%rbp), %rax	 ; i, tmp138
	addq	%rdx, %rax	 ; tmp137, _2
	movzbl	(%rax), %eax	 ; *_2, _3
 ; D:/TC/src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	cmpb	$92, %al	 ;, _3
	jne	.L7	 ;,
 ; D:/TC/src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	movq	16(%rbp), %rdx	 ; path, tmp139
	movq	-16(%rbp), %rax	 ; i, tmp140
	addq	%rdx, %rax	 ; tmp139, _4
 ; D:/TC/src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	movb	$47, (%rax)	 ;, *_4
.L7:
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, -16(%rbp)	 ;, i
	jbe	.L8	 ;,
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	movq	16(%rbp), %rdx	 ; path, tmp141
	movq	-16(%rbp), %rax	 ; i, tmp142
	addq	%rdx, %rax	 ; tmp141, _5
	movzbl	(%rax), %eax	 ; *_5, _6
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, %al	 ;, _6
	jne	.L8	 ;,
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	movq	-16(%rbp), %rax	 ; i, tmp143
	leaq	-1(%rax), %rdx	 ;, _7
	movq	16(%rbp), %rax	 ; path, tmp144
	addq	%rdx, %rax	 ; _7, _8
	movzbl	(%rax), %eax	 ; *_8, _9
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$46, %al	 ;, _9
	jne	.L8	 ;,
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	movq	-16(%rbp), %rax	 ; i, tmp145
	leaq	-2(%rax), %rdx	 ;, _10
	movq	16(%rbp), %rax	 ; path, tmp146
	addq	%rdx, %rax	 ; _10, _11
	movzbl	(%rax), %eax	 ; *_11, _12
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, %al	 ;, _12
	jne	.L8	 ;,
 ; D:/TC/src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	-8(%rbp), %rax	 ; path_len, tmp147
	subq	-16(%rbp), %rax	 ; i, tmp147
	movq	%rax, %rcx	 ; tmp147, _13
 ; D:/TC/src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	-16(%rbp), %rax	 ; i, tmp148
	leaq	1(%rax), %rdx	 ;, _14
	movq	16(%rbp), %rax	 ; path, tmp149
	addq	%rax, %rdx	 ; tmp149, _15
 ; D:/TC/src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	-16(%rbp), %rax	 ; i, tmp150
	leaq	-1(%rax), %r8	 ;, _16
	movq	16(%rbp), %rax	 ; path, tmp151
	addq	%r8, %rax	 ; _16, _17
 ; D:/TC/src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	%rcx, %r8	 ; _13,
	movq	%rax, %rcx	 ; _17,
	call	memmove	 ;
 ; D:/TC/src/file.c:29:             path_len -= 2;
	subq	$2, -8(%rbp)	 ;, path_len
 ; D:/TC/src/file.c:30:             i -= 2;
	subq	$2, -16(%rbp)	 ;, i
.L8:
 ; D:/TC/src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpq	$0, -16(%rbp)	 ;, i
	je	.L9	 ;,
 ; D:/TC/src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	movq	16(%rbp), %rdx	 ; path, tmp152
	movq	-16(%rbp), %rax	 ; i, tmp153
	addq	%rdx, %rax	 ; tmp152, _18
	movzbl	(%rax), %eax	 ; *_18, _19
 ; D:/TC/src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, %al	 ;, _19
	jne	.L9	 ;,
 ; D:/TC/src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	movq	-16(%rbp), %rax	 ; i, tmp154
	leaq	-1(%rax), %rdx	 ;, _20
	movq	16(%rbp), %rax	 ; path, tmp155
	addq	%rdx, %rax	 ; _20, _21
	movzbl	(%rax), %eax	 ; *_21, _22
 ; D:/TC/src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, %al	 ;, _22
	jne	.L9	 ;,
 ; D:/TC/src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	movq	-8(%rbp), %rax	 ; path_len, tmp156
	subq	-16(%rbp), %rax	 ; i, tmp156
	movq	%rax, %r8	 ; tmp156, _23
 ; D:/TC/src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	movq	-16(%rbp), %rax	 ; i, tmp157
	leaq	1(%rax), %rdx	 ;, _24
	movq	16(%rbp), %rax	 ; path, tmp158
	addq	%rax, %rdx	 ; tmp158, _25
 ; D:/TC/src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	movq	16(%rbp), %rcx	 ; path, tmp159
	movq	-16(%rbp), %rax	 ; i, tmp160
	addq	%rcx, %rax	 ; tmp159, _26
 ; D:/TC/src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	movq	%rax, %rcx	 ; _26,
	call	memmove	 ;
 ; D:/TC/src/file.c:34:             path_len--;
	subq	$1, -8(%rbp)	 ;, path_len
 ; D:/TC/src/file.c:35:             i--;
	subq	$1, -16(%rbp)	 ;, i
.L9:
 ; D:/TC/src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	addq	$1, -16(%rbp)	 ;, i
.L6:
 ; D:/TC/src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	movq	-16(%rbp), %rax	 ; i, tmp161
	cmpq	-8(%rbp), %rax	 ; path_len, tmp161
	jb	.L10	 ;,
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpq	$2, -8(%rbp)	 ;, path_len
	jbe	.L11	 ;,
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	movq	16(%rbp), %rax	 ; path, tmp162
	movzbl	(%rax), %eax	 ; *path_65, _27
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpb	$47, %al	 ;, _27
	jne	.L11	 ;,
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	movq	16(%rbp), %rax	 ; path, tmp163
	addq	$1, %rax	 ;, _28
	movzbl	(%rax), %eax	 ; *_28, _29
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpb	$96, %al	 ;, _29
	jle	.L11	 ;,
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	movq	16(%rbp), %rax	 ; path, tmp164
	addq	$1, %rax	 ;, _30
	movzbl	(%rax), %eax	 ; *_30, _31
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpb	$122, %al	 ;, _31
	jg	.L11	 ;,
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	movq	16(%rbp), %rax	 ; path, tmp165
	addq	$2, %rax	 ;, _32
	movzbl	(%rax), %eax	 ; *_32, _33
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpb	$47, %al	 ;, _33
	jne	.L11	 ;,
 ; D:/TC/src/file.c:40:         path[0] = (char)toupper(path[1]);
	movq	16(%rbp), %rax	 ; path, tmp166
	movzbl	1(%rax), %eax	 ; MEM[(char *)path_65 + 1B], tmp167
	movb	%al, -17(%rbp)	 ; tmp167, __x
	call	__locale_ctype_ptr	 ;
 ; D:/TC/src/file.c:40:         path[0] = (char)toupper(path[1]);
	movsbl	-17(%rbp), %eax	 ; __x, _37
	movl	%eax, %ecx	 ; _37,
	call	toupper	 ;
 ; D:/TC/src/file.c:40:         path[0] = (char)toupper(path[1]);
	movl	%eax, %edx	 ; _70, _38
 ; D:/TC/src/file.c:40:         path[0] = (char)toupper(path[1]);
	movq	16(%rbp), %rax	 ; path, tmp168
	movb	%dl, (%rax)	 ; _38, *path_65
 ; D:/TC/src/file.c:41:         path[1] = ':';
	movq	16(%rbp), %rax	 ; path, tmp169
	addq	$1, %rax	 ;, _39
 ; D:/TC/src/file.c:41:         path[1] = ':';
	movb	$58, (%rax)	 ;, *_39
 ; D:/TC/src/file.c:42:         return path;
	movq	16(%rbp), %rax	 ; path, _55
	jmp	.L12	 ;
.L11:
 ; D:/TC/src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpq	$1, -8(%rbp)	 ;, path_len
	jbe	.L13	 ;,
 ; D:/TC/src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	movq	16(%rbp), %rax	 ; path, tmp170
	movzbl	(%rax), %eax	 ; *path_65, _40
 ; D:/TC/src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpb	$64, %al	 ;, _40
	jle	.L13	 ;,
 ; D:/TC/src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	movq	16(%rbp), %rax	 ; path, tmp171
	movzbl	(%rax), %eax	 ; *path_65, _41
 ; D:/TC/src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpb	$90, %al	 ;, _41
	jg	.L13	 ;,
 ; D:/TC/src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	movq	16(%rbp), %rax	 ; path, tmp172
	addq	$1, %rax	 ;, _42
	movzbl	(%rax), %eax	 ; *_42, _43
 ; D:/TC/src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpb	$58, %al	 ;, _43
	jne	.L13	 ;,
 ; D:/TC/src/file.c:54:         return path;
	movq	16(%rbp), %rax	 ; path, _55
	jmp	.L12	 ;
.L13:
 ; D:/TC/src/file.c:55:     if (path_len > 0 && path[0] == '/')
	cmpq	$0, -8(%rbp)	 ;, path_len
	je	.L14	 ;,
 ; D:/TC/src/file.c:55:     if (path_len > 0 && path[0] == '/')
	movq	16(%rbp), %rax	 ; path, tmp173
	movzbl	(%rax), %eax	 ; *path_65, _44
 ; D:/TC/src/file.c:55:     if (path_len > 0 && path[0] == '/')
	cmpb	$47, %al	 ;, _44
	jne	.L14	 ;,
 ; D:/TC/src/file.c:56:         return path;
	movq	16(%rbp), %rax	 ; path, _55
	jmp	.L12	 ;
.L14:
 ; D:/TC/src/file.c:57:     if (base_path == NULL)
	cmpq	$0, 24(%rbp)	 ;, base_path
	jne	.L15	 ;,
 ; D:/TC/src/file.c:58:         base_path = get_cwd();
	call	get_cwd	 ;
	movq	%rax, 24(%rbp)	 ; tmp174, base_path
.L15:
 ; D:/TC/src/file.c:59:     if (base_path == NULL)
	cmpq	$0, 24(%rbp)	 ;, base_path
	jne	.L16	 ;,
 ; D:/TC/src/file.c:60:         return path;
	movq	16(%rbp), %rax	 ; path, _55
	jmp	.L12	 ;
.L16:
 ; D:/TC/src/file.c:61:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	movq	24(%rbp), %rax	 ; base_path, tmp175
	movq	%rax, %rcx	 ; tmp175,
	call	strlen	 ;
 ; D:/TC/src/file.c:61:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	movq	-8(%rbp), %rdx	 ; path_len, tmp176
	addq	%rdx, %rax	 ; tmp176, _46
 ; D:/TC/src/file.c:61:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	addq	$2, %rax	 ;, tmp177
	movq	%rax, -32(%rbp)	 ; tmp177, total_len
 ; D:/TC/src/file.c:62:     string abs_path = create_string_not_check("", total_len);
	movq	-32(%rbp), %rax	 ; total_len, tmp178
	movq	%rax, %rdx	 ; tmp178,
	leaq	.LC0(%rip), %rax	 ;, tmp179
	movq	%rax, %rcx	 ; tmp179,
	call	create_string_not_check	 ;
	movq	%rax, -40(%rbp)	 ; tmp180, abs_path
 ; D:/TC/src/file.c:63:     sprintf(abs_path, "%s/%s", base_path, path);
	movq	16(%rbp), %rcx	 ; path, tmp181
	movq	24(%rbp), %rdx	 ; base_path, tmp182
	movq	-40(%rbp), %rax	 ; abs_path, tmp183
	movq	%rcx, %r9	 ; tmp181,
	movq	%rdx, %r8	 ; tmp182,
	leaq	.LC1(%rip), %rdx	 ;, tmp184
	movq	%rax, %rcx	 ; tmp183,
	call	sprintf	 ;
 ; D:/TC/src/file.c:64:     return absolute_path(create_string(abs_path, total_len), NULL);
	movq	-32(%rbp), %rdx	 ; total_len, tmp185
	movq	-40(%rbp), %rax	 ; abs_path, tmp186
	movq	%rax, %rcx	 ; tmp186,
	call	create_string	 ;
 ; D:/TC/src/file.c:64:     return absolute_path(create_string(abs_path, total_len), NULL);
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; _47,
	call	absolute_path	 ;
.L12:
 ; D:/TC/src/file.c:65: }
	leave	
	ret	
	.globl	get_file_name
	.def	get_file_name;	.scl	2;	.type	32;	.endef
get_file_name:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movq	%rcx, 16(%rbp)	 ; path, path
 ; D:/TC/src/file.c:68:     return path->name;
	movq	16(%rbp), %rax	 ; path, tmp84
	movq	16(%rax), %rax	 ; path_2(D)->name, _3
 ; D:/TC/src/file.c:69: }
	popq	%rbp	 ;
	ret	
	.globl	get_file_extension
	.def	get_file_extension;	.scl	2;	.type	32;	.endef
get_file_extension:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movq	%rcx, 16(%rbp)	 ; path, path
 ; D:/TC/src/file.c:72:     return path->extension;
	movq	16(%rbp), %rax	 ; path, tmp84
	movq	8(%rax), %rax	 ; path_2(D)->extension, _3
 ; D:/TC/src/file.c:73: }
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC2:
	.ascii "/\0"
	.text
	.globl	get_file_dir
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
get_file_dir:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$80, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; path, path
 ; D:/TC/src/file.c:76:     if (path->dirs == NULL) return 0;
	movq	16(%rbp), %rax	 ; path, tmp101
	movq	(%rax), %rax	 ; path_31(D)->dirs, _1
 ; D:/TC/src/file.c:76:     if (path->dirs == NULL) return 0;
	testq	%rax, %rax	 ; _1
	jne	.L22	 ;,
 ; D:/TC/src/file.c:76:     if (path->dirs == NULL) return 0;
	movl	$0, %eax	 ;, _25
 ; D:/TC/src/file.c:76:     if (path->dirs == NULL) return 0;
	jmp	.L23	 ;
.L22:
 ; D:/TC/src/file.c:79:     size_t total_len = 0;
	movq	$0, -8(%rbp)	 ;, total_len
 ; D:/TC/src/file.c:80:     size_t node_count = 0;
	movq	$0, -16(%rbp)	 ;, node_count
 ; D:/TC/src/file.c:81:     StrNode* current = path->dirs;
	movq	16(%rbp), %rax	 ; path, tmp102
	movq	(%rax), %rax	 ; path_31(D)->dirs, tmp103
	movq	%rax, -24(%rbp)	 ; tmp103, current
 ; D:/TC/src/file.c:82:     while (current != NULL) {
	jmp	.L24	 ;
.L26:
 ; D:/TC/src/file.c:83:         if (current->next != NULL) {  // Not the last element (which is the filename)
	movq	-24(%rbp), %rax	 ; current, tmp104
	movq	8(%rax), %rax	 ; current_21->next, _2
 ; D:/TC/src/file.c:83:         if (current->next != NULL) {  // Not the last element (which is the filename)
	testq	%rax, %rax	 ; _2
	je	.L25	 ;,
 ; D:/TC/src/file.c:84:             size_t dir_len = strlen(current->dir);
	movq	-24(%rbp), %rax	 ; current, tmp105
	movq	(%rax), %rax	 ; current_21->dir, _3
 ; D:/TC/src/file.c:84:             size_t dir_len = strlen(current->dir);
	movq	%rax, %rcx	 ; _3,
	call	strlen	 ;
	movq	%rax, -48(%rbp)	 ; tmp106, dir_len
 ; D:/TC/src/file.c:85:             total_len += dir_len;
	movq	-48(%rbp), %rax	 ; dir_len, tmp107
	addq	%rax, -8(%rbp)	 ; tmp107, total_len
 ; D:/TC/src/file.c:86:             node_count++;
	addq	$1, -16(%rbp)	 ;, node_count
.L25:
 ; D:/TC/src/file.c:88:         current = current->next;
	movq	-24(%rbp), %rax	 ; current, tmp108
	movq	8(%rax), %rax	 ; current_21->next, tmp109
	movq	%rax, -24(%rbp)	 ; tmp109, current
.L24:
 ; D:/TC/src/file.c:82:     while (current != NULL) {
	cmpq	$0, -24(%rbp)	 ;, current
	jne	.L26	 ;,
 ; D:/TC/src/file.c:91:     if (node_count == 0) return NULL;
	cmpq	$0, -16(%rbp)	 ;, node_count
	jne	.L27	 ;,
 ; D:/TC/src/file.c:91:     if (node_count == 0) return NULL;
	movl	$0, %eax	 ;, _25
 ; D:/TC/src/file.c:91:     if (node_count == 0) return NULL;
	jmp	.L23	 ;
.L27:
 ; D:/TC/src/file.c:94:     if (node_count > 1)
	cmpq	$1, -16(%rbp)	 ;, node_count
	jbe	.L28	 ;,
 ; D:/TC/src/file.c:95:         total_len += node_count - 1;
	movq	-16(%rbp), %rdx	 ; node_count, tmp110
	movq	-8(%rbp), %rax	 ; total_len, tmp111
	addq	%rdx, %rax	 ; tmp110, _4
	subq	$1, %rax	 ;, tmp112
	movq	%rax, -8(%rbp)	 ; tmp112, total_len
.L28:
 ; D:/TC/src/file.c:98:     string dir_path = create_string_not_check("", total_len + 1);
	movq	-8(%rbp), %rax	 ; total_len, tmp113
	addq	$1, %rax	 ;, _5
	movq	%rax, %rdx	 ; _5,
	leaq	.LC0(%rip), %rax	 ;, tmp114
	movq	%rax, %rcx	 ; tmp114,
	call	create_string_not_check	 ;
	movq	%rax, -40(%rbp)	 ; tmp115, dir_path
 ; D:/TC/src/file.c:99:     dir_path[0] = '\0';
	movq	-40(%rbp), %rax	 ; dir_path, tmp116
	movb	$0, (%rax)	 ;, *dir_path_37
 ; D:/TC/src/file.c:101:     current = path->dirs;
	movq	16(%rbp), %rax	 ; path, tmp117
	movq	(%rax), %rax	 ; path_31(D)->dirs, tmp118
	movq	%rax, -24(%rbp)	 ; tmp118, current
 ; D:/TC/src/file.c:102:     bool first = true;
	movb	$1, -25(%rbp)	 ;, first
 ; D:/TC/src/file.c:103:     while (current != NULL) {
	jmp	.L29	 ;
.L32:
 ; D:/TC/src/file.c:104:         if (current->next != NULL) {  // Not the last element
	movq	-24(%rbp), %rax	 ; current, tmp119
	movq	8(%rax), %rax	 ; current_22->next, _6
 ; D:/TC/src/file.c:104:         if (current->next != NULL) {  // Not the last element
	testq	%rax, %rax	 ; _6
	je	.L30	 ;,
 ; D:/TC/src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	cmpb	$0, -25(%rbp)	 ;, first
	jne	.L31	 ;,
 ; D:/TC/src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	movq	-24(%rbp), %rax	 ; current, tmp120
	movq	(%rax), %rax	 ; current_22->dir, _7
 ; D:/TC/src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	leaq	.LC2(%rip), %rdx	 ;, tmp121
	movq	%rax, %rcx	 ; _7,
	call	strcmp	 ;
 ; D:/TC/src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	testl	%eax, %eax	 ; _8
	je	.L31	 ;,
 ; D:/TC/src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	movq	-40(%rbp), %rax	 ; dir_path, tmp122
	movzbl	(%rax), %eax	 ; MEM[(const char *)dir_path_37], _9
 ; D:/TC/src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	testb	%al, %al	 ; _9
	je	.L31	 ;,
 ; D:/TC/src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	movq	-40(%rbp), %rax	 ; dir_path, tmp123
	movq	%rax, %rcx	 ; tmp123,
	call	strlen	 ;
 ; D:/TC/src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	leaq	-1(%rax), %rdx	 ;, _11
	movq	-40(%rbp), %rax	 ; dir_path, tmp124
	addq	%rdx, %rax	 ; _11, _12
	movzbl	(%rax), %eax	 ; *_12, _13
 ; D:/TC/src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$47, %al	 ;, _13
	je	.L31	 ;,
 ; D:/TC/src/file.c:108:                     strcat(dir_path, "/");
	movq	-40(%rbp), %rax	 ; dir_path, tmp126
	movq	%rax, %rcx	 ; tmp126,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp128, _43
 ; D:/TC/src/file.c:108:                     strcat(dir_path, "/");
	movq	-40(%rbp), %rax	 ; dir_path, tmp129
	addq	%rdx, %rax	 ; _43, _44
	movw	$47, (%rax)	 ;, MEM <char[1:2]> [(void *)_44]
.L31:
 ; D:/TC/src/file.c:110:             strcat(dir_path, current->dir);
	movq	-24(%rbp), %rax	 ; current, tmp130
	movq	(%rax), %rdx	 ; current_22->dir, _14
 ; D:/TC/src/file.c:110:             strcat(dir_path, current->dir);
	movq	-40(%rbp), %rax	 ; dir_path, tmp131
	movq	%rax, %rcx	 ; tmp131,
	call	strcat	 ;
 ; D:/TC/src/file.c:111:             first = false;
	movb	$0, -25(%rbp)	 ;, first
.L30:
 ; D:/TC/src/file.c:113:         current = current->next;
	movq	-24(%rbp), %rax	 ; current, tmp132
	movq	8(%rax), %rax	 ; current_22->next, tmp133
	movq	%rax, -24(%rbp)	 ; tmp133, current
.L29:
 ; D:/TC/src/file.c:103:     while (current != NULL) {
	cmpq	$0, -24(%rbp)	 ;, current
	jne	.L32	 ;,
 ; D:/TC/src/file.c:116:     return create_string(dir_path, strlen(dir_path));
	movq	-40(%rbp), %rax	 ; dir_path, tmp134
	movq	%rax, %rcx	 ; tmp134,
	call	strlen	 ;
	movq	%rax, %rdx	 ;, _15
 ; D:/TC/src/file.c:116:     return create_string(dir_path, strlen(dir_path));
	movq	-40(%rbp), %rax	 ; dir_path, tmp135
	movq	%rax, %rcx	 ; tmp135,
	call	create_string	 ;
.L23:
 ; D:/TC/src/file.c:117: }
	leave	
	ret	
	.globl	get_full_path
	.def	get_full_path;	.scl	2;	.type	32;	.endef
get_full_path:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movq	%rcx, 16(%rbp)	 ; path, path
 ; D:/TC/src/file.c:120:     return path->path;
	movq	16(%rbp), %rax	 ; path, tmp84
	movq	24(%rax), %rax	 ; path_2(D)->path, _3
 ; D:/TC/src/file.c:121: }
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC3:
	.ascii "%s/%s%s\0"
.LC4:
	.ascii "%s%s\0"
	.text
	.def	rebuild_full_path;	.scl	3;	.type	32;	.endef
rebuild_full_path:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$104, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; file, file
 ; D:/TC/src/file.c:124:     string dir = get_file_dir(file);
	movq	16(%rbp), %rax	 ; file, tmp97
	movq	%rax, %rcx	 ; tmp97,
	call	get_file_dir	 ;
	movq	%rax, -32(%rbp)	 ; tmp98, dir
 ; D:/TC/src/file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	cmpq	$0, -32(%rbp)	 ;, dir
	je	.L36	 ;,
 ; D:/TC/src/file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	movq	-32(%rbp), %rax	 ; dir, iftmp.0_15
	jmp	.L37	 ;
.L36:
 ; D:/TC/src/file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	leaq	.LC0(%rip), %rax	 ;, iftmp.0_15
.L37:
 ; D:/TC/src/file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	movq	%rax, -40(%rbp)	 ; iftmp.0_15, dir_cstr
 ; D:/TC/src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	16(%rbp), %rax	 ; file, tmp99
	movq	8(%rax), %rax	 ; file_19(D)->extension, _1
 ; D:/TC/src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%rax, %rax	 ; _1
	je	.L38	 ;,
 ; D:/TC/src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	16(%rbp), %rax	 ; file, tmp100
	movq	8(%rax), %rax	 ; file_19(D)->extension, iftmp.1_16
	jmp	.L39	 ;
.L38:
 ; D:/TC/src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	leaq	.LC0(%rip), %rax	 ;, iftmp.1_16
.L39:
 ; D:/TC/src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	%rax, -48(%rbp)	 ; iftmp.1_16, ext_cstr
 ; D:/TC/src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	-40(%rbp), %rax	 ; dir_cstr, tmp101
	movq	%rax, %rcx	 ; tmp101,
	call	strlen	 ;
	movq	%rax, %rbx	 ;, _2
 ; D:/TC/src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbp), %rax	 ; file, tmp102
	movq	16(%rax), %rax	 ; file_19(D)->name, _3
 ; D:/TC/src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%rax, %rcx	 ; _3,
	call	strlen	 ;
 ; D:/TC/src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	addq	%rbx, %rax	 ; _2, _5
 ; D:/TC/src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	addq	$1, %rax	 ;, tmp103
	movq	%rax, -24(%rbp)	 ; tmp103, path_len
 ; D:/TC/src/file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	movq	16(%rbp), %rax	 ; file, tmp104
	movq	8(%rax), %rax	 ; file_19(D)->extension, _6
 ; D:/TC/src/file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	testq	%rax, %rax	 ; _6
	je	.L40	 ;,
 ; D:/TC/src/file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	movq	-48(%rbp), %rax	 ; ext_cstr, tmp105
	movq	%rax, %rcx	 ; tmp105,
	call	strlen	 ;
 ; D:/TC/src/file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	addq	%rax, -24(%rbp)	 ; _7, path_len
.L40:
 ; D:/TC/src/file.c:131:     string new_path = create_string_not_check("", path_len + 1);
	movq	-24(%rbp), %rax	 ; path_len, tmp106
	addq	$1, %rax	 ;, _8
	movq	%rax, %rdx	 ; _8,
	leaq	.LC0(%rip), %rax	 ;, tmp107
	movq	%rax, %rcx	 ; tmp107,
	call	create_string_not_check	 ;
	movq	%rax, -56(%rbp)	 ; tmp108, new_path
 ; D:/TC/src/file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpq	$0, -32(%rbp)	 ;, dir
	je	.L41	 ;,
 ; D:/TC/src/file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	movq	-40(%rbp), %rax	 ; dir_cstr, tmp109
	movzbl	(%rax), %eax	 ; MEM[(const char *)dir_cstr_24], _9
 ; D:/TC/src/file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	testb	%al, %al	 ; _9
	je	.L41	 ;,
 ; D:/TC/src/file.c:133:         sprintf(new_path, "%s/%s%s", dir_cstr, file->name, ext_cstr);
	movq	16(%rbp), %rax	 ; file, tmp110
	movq	16(%rax), %r8	 ; file_19(D)->name, _10
	movq	-40(%rbp), %rcx	 ; dir_cstr, tmp111
	movq	-56(%rbp), %rax	 ; new_path, tmp112
	movq	-48(%rbp), %rdx	 ; ext_cstr, tmp113
	movq	%rdx, 32(%rsp)	 ; tmp113,
	movq	%r8, %r9	 ; _10,
	movq	%rcx, %r8	 ; tmp111,
	leaq	.LC3(%rip), %rdx	 ;, tmp114
	movq	%rax, %rcx	 ; tmp112,
	call	sprintf	 ;
	jmp	.L42	 ;
.L41:
 ; D:/TC/src/file.c:135:         sprintf(new_path, "%s%s", file->name, ext_cstr);
	movq	16(%rbp), %rax	 ; file, tmp115
	movq	16(%rax), %rdx	 ; file_19(D)->name, _11
	movq	-48(%rbp), %rcx	 ; ext_cstr, tmp116
	movq	-56(%rbp), %rax	 ; new_path, tmp117
	movq	%rcx, %r9	 ; tmp116,
	movq	%rdx, %r8	 ; _11,
	leaq	.LC4(%rip), %rdx	 ;, tmp118
	movq	%rax, %rcx	 ; tmp117,
	call	sprintf	 ;
.L42:
 ; D:/TC/src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	-56(%rbp), %rax	 ; new_path, tmp119
	movq	%rax, %rcx	 ; tmp119,
	call	strlen	 ;
	movq	%rax, %rdx	 ;, _12
 ; D:/TC/src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	-56(%rbp), %rax	 ; new_path, tmp120
	movq	%rax, %rcx	 ; tmp120,
	call	create_string	 ;
 ; D:/TC/src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	16(%rbp), %rdx	 ; file, tmp121
	movq	%rax, 24(%rdx)	 ; _13, file_19(D)->path
 ; D:/TC/src/file.c:138: }
	nop	
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.globl	change_file_extension
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
change_file_extension:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; file, file
	movq	%rdx, 24(%rbp)	 ; new_extension, new_extension
 ; D:/TC/src/file.c:141:     file->extension = new_extension;
	movq	16(%rbp), %rax	 ; file, tmp82
	movq	24(%rbp), %rdx	 ; new_extension, tmp83
	movq	%rdx, 8(%rax)	 ; tmp83, file_2(D)->extension
 ; D:/TC/src/file.c:142:     rebuild_full_path(file);
	movq	16(%rbp), %rax	 ; file, tmp84
	movq	%rax, %rcx	 ; tmp84,
	call	rebuild_full_path	 ;
 ; D:/TC/src/file.c:143: }
	nop	
	leave	
	ret	
	.globl	change_file_name
	.def	change_file_name;	.scl	2;	.type	32;	.endef
change_file_name:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$64, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; file, file
	movq	%rdx, 24(%rbp)	 ; new_name, new_name
 ; D:/TC/src/file.c:146:     file->name = new_name;
	movq	16(%rbp), %rax	 ; file, tmp91
	movq	24(%rbp), %rdx	 ; new_name, tmp92
	movq	%rdx, 16(%rax)	 ; tmp92, file_14(D)->name
 ; D:/TC/src/file.c:149:     if (file->dirs != NULL) {
	movq	16(%rbp), %rax	 ; file, tmp93
	movq	(%rax), %rax	 ; file_14(D)->dirs, _1
 ; D:/TC/src/file.c:149:     if (file->dirs != NULL) {
	testq	%rax, %rax	 ; _1
	je	.L45	 ;,
 ; D:/TC/src/file.c:150:         StrNode* current = file->dirs;
	movq	16(%rbp), %rax	 ; file, tmp94
	movq	(%rax), %rax	 ; file_14(D)->dirs, tmp95
	movq	%rax, -8(%rbp)	 ; tmp95, current
 ; D:/TC/src/file.c:152:         while (current != NULL) {
	jmp	.L46	 ;
.L51:
 ; D:/TC/src/file.c:153:             if (current->next == NULL) {
	movq	-8(%rbp), %rax	 ; current, tmp96
	movq	8(%rax), %rax	 ; current_9->next, _2
 ; D:/TC/src/file.c:153:             if (current->next == NULL) {
	testq	%rax, %rax	 ; _2
	jne	.L47	 ;,
 ; D:/TC/src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	16(%rbp), %rax	 ; file, tmp97
	movq	8(%rax), %rax	 ; file_14(D)->extension, _3
 ; D:/TC/src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%rax, %rax	 ; _3
	je	.L48	 ;,
 ; D:/TC/src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	16(%rbp), %rax	 ; file, tmp98
	movq	8(%rax), %rax	 ; file_14(D)->extension, iftmp.2_11
	jmp	.L49	 ;
.L48:
 ; D:/TC/src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	leaq	.LC0(%rip), %rax	 ;, iftmp.2_11
.L49:
 ; D:/TC/src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	%rax, -24(%rbp)	 ; iftmp.2_11, ext_cstr
 ; D:/TC/src/file.c:156:                 size_t full_name_len = strlen(new_name);
	movq	24(%rbp), %rax	 ; new_name, tmp99
	movq	%rax, %rcx	 ; tmp99,
	call	strlen	 ;
	movq	%rax, -16(%rbp)	 ; tmp100, full_name_len
 ; D:/TC/src/file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	movq	16(%rbp), %rax	 ; file, tmp101
	movq	8(%rax), %rax	 ; file_14(D)->extension, _4
 ; D:/TC/src/file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	testq	%rax, %rax	 ; _4
	je	.L50	 ;,
 ; D:/TC/src/file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	movq	-24(%rbp), %rax	 ; ext_cstr, tmp102
	movq	%rax, %rcx	 ; tmp102,
	call	strlen	 ;
 ; D:/TC/src/file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	addq	%rax, -16(%rbp)	 ; _5, full_name_len
.L50:
 ; D:/TC/src/file.c:159:                 string full_name = create_string_not_check("", full_name_len + 1);
	movq	-16(%rbp), %rax	 ; full_name_len, tmp103
	addq	$1, %rax	 ;, _6
	movq	%rax, %rdx	 ; _6,
	leaq	.LC0(%rip), %rax	 ;, tmp104
	movq	%rax, %rcx	 ; tmp104,
	call	create_string_not_check	 ;
	movq	%rax, -32(%rbp)	 ; tmp105, full_name
 ; D:/TC/src/file.c:160:                 sprintf(full_name, "%s%s", new_name, ext_cstr);
	movq	-24(%rbp), %rcx	 ; ext_cstr, tmp106
	movq	24(%rbp), %rdx	 ; new_name, tmp107
	movq	-32(%rbp), %rax	 ; full_name, tmp108
	movq	%rcx, %r9	 ; tmp106,
	movq	%rdx, %r8	 ; tmp107,
	leaq	.LC4(%rip), %rdx	 ;, tmp109
	movq	%rax, %rcx	 ; tmp108,
	call	sprintf	 ;
 ; D:/TC/src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	-32(%rbp), %rax	 ; full_name, tmp110
	movq	%rax, %rcx	 ; tmp110,
	call	strlen	 ;
	movq	%rax, %rdx	 ;, _7
 ; D:/TC/src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	-32(%rbp), %rax	 ; full_name, tmp111
	movq	%rax, %rcx	 ; tmp111,
	call	create_string	 ;
 ; D:/TC/src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	-8(%rbp), %rdx	 ; current, tmp112
	movq	%rax, (%rdx)	 ; _8, current_9->dir
 ; D:/TC/src/file.c:162:                 break;
	jmp	.L45	 ;
.L47:
 ; D:/TC/src/file.c:164:             current = current->next;
	movq	-8(%rbp), %rax	 ; current, tmp113
	movq	8(%rax), %rax	 ; current_9->next, tmp114
	movq	%rax, -8(%rbp)	 ; tmp114, current
.L46:
 ; D:/TC/src/file.c:152:         while (current != NULL) {
	cmpq	$0, -8(%rbp)	 ;, current
	jne	.L51	 ;,
.L45:
 ; D:/TC/src/file.c:168:     rebuild_full_path(file);
	movq	16(%rbp), %rax	 ; file, tmp115
	movq	%rax, %rcx	 ; tmp115,
	call	rebuild_full_path	 ;
 ; D:/TC/src/file.c:169: }
	nop	
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "Warning: Path component too long, truncating to %zu characters\12\0"
.LC6:
	.ascii ".\0"
.LC7:
	.ascii "..\0"
	.text
	.def	normalize_path;	.scl	3;	.type	32;	.endef
normalize_path:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$448, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; file, file
 ; D:/TC/src/file.c:172:     size_t path_len = strlen(file->path);
	movq	16(%rbp), %rax	 ; file, tmp127
	movq	24(%rax), %rax	 ; file_83(D)->path, _1
 ; D:/TC/src/file.c:172:     size_t path_len = strlen(file->path);
	movq	%rax, %rcx	 ; _1,
	call	strlen	 ;
	movq	%rax, 360(%rsp)	 ; tmp128, path_len
 ; D:/TC/src/file.c:175:     string path_copy = create_string_not_check("", path_len + 1);
	movq	360(%rsp), %rax	 ; path_len, tmp129
	addq	$1, %rax	 ;, _2
	movq	%rax, %rdx	 ; _2,
	leaq	.LC0(%rip), %rax	 ;, tmp130
	movq	%rax, %rcx	 ; tmp130,
	call	create_string_not_check	 ;
	movq	%rax, 352(%rsp)	 ; tmp131, path_copy
 ; D:/TC/src/file.c:176:     strcpy(path_copy, file->path);
	movq	16(%rbp), %rax	 ; file, tmp132
	movq	24(%rax), %rdx	 ; file_83(D)->path, _3
 ; D:/TC/src/file.c:176:     strcpy(path_copy, file->path);
	movq	352(%rsp), %rax	 ; path_copy, tmp133
	movq	%rax, %rcx	 ; tmp133,
	call	strcpy	 ;
 ; D:/TC/src/file.c:178:     StrNode* dirs_head = NULL;
	movq	$0, 440(%rsp)	 ;, dirs_head
 ; D:/TC/src/file.c:179:     StrNode* dirs_tail = NULL;
	movq	$0, 432(%rsp)	 ;, dirs_tail
 ; D:/TC/src/file.c:181:     size_t start = 0;
	movq	$0, 424(%rsp)	 ;, start
 ; D:/TC/src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	cmpq	$0, 360(%rsp)	 ;, path_len
	je	.L53	 ;,
 ; D:/TC/src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	movq	352(%rsp), %rax	 ; path_copy, tmp134
	movzbl	(%rax), %eax	 ; *path_copy_86, _4
 ; D:/TC/src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	cmpb	$47, %al	 ;, _4
	jne	.L53	 ;,
 ; D:/TC/src/file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, 344(%rsp)	 ; tmp135, node
 ; D:/TC/src/file.c:199:         node->dir = create_string("/", 1);
	movl	$1, %edx	 ;,
	leaq	.LC2(%rip), %rax	 ;, tmp136
	movq	%rax, %rcx	 ; tmp136,
	call	create_string	 ;
 ; D:/TC/src/file.c:199:         node->dir = create_string("/", 1);
	movq	344(%rsp), %rdx	 ; node, tmp137
	movq	%rax, (%rdx)	 ; _5, node_92->dir
 ; D:/TC/src/file.c:200:         node->next = 0;
	movq	344(%rsp), %rax	 ; node, tmp138
	movq	$0, 8(%rax)	 ;, node_92->next
 ; D:/TC/src/file.c:202:         dirs_head = node;
	movq	344(%rsp), %rax	 ; node, tmp139
	movq	%rax, 440(%rsp)	 ; tmp139, dirs_head
 ; D:/TC/src/file.c:203:         dirs_tail = node;
	movq	344(%rsp), %rax	 ; node, tmp140
	movq	%rax, 432(%rsp)	 ; tmp140, dirs_tail
 ; D:/TC/src/file.c:204:         start = 1;
	movq	$1, 424(%rsp)	 ;, start
.L53:
 ; D:/TC/src/file.c:209:     size_t i = start;
	movq	424(%rsp), %rax	 ; start, tmp141
	movq	%rax, 416(%rsp)	 ; tmp141, i
 ; D:/TC/src/file.c:210:     while (i <= path_len) {
	jmp	.L54	 ;
.L69:
 ; D:/TC/src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	movq	416(%rsp), %rax	 ; i, tmp142
	cmpq	360(%rsp), %rax	 ; path_len, tmp142
	je	.L55	 ;,
 ; D:/TC/src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	movq	352(%rsp), %rdx	 ; path_copy, tmp143
	movq	416(%rsp), %rax	 ; i, tmp144
	addq	%rdx, %rax	 ; tmp143, _6
	movzbl	(%rax), %eax	 ; *_6, _7
 ; D:/TC/src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpb	$47, %al	 ;, _7
	jne	.L56	 ;,
.L55:
 ; D:/TC/src/file.c:212:             if (i > start) {
	movq	416(%rsp), %rax	 ; i, tmp145
	cmpq	%rax, 424(%rsp)	 ; tmp145, start
	jnb	.L57	 ;,
 ; D:/TC/src/file.c:213:                 size_t comp_len = i - start;
	movq	416(%rsp), %rax	 ; i, tmp149
	subq	424(%rsp), %rax	 ; start, tmp148
	movq	%rax, 408(%rsp)	 ; tmp148, comp_len
 ; D:/TC/src/file.c:214:                 if (comp_len >= componentMaxSize) {
	cmpq	$255, 408(%rsp)	 ;, comp_len
	jbe	.L58	 ;,
 ; D:/TC/src/file.c:215:                     comp_len = componentMaxSize - 1;
	movq	$255, 408(%rsp)	 ;, comp_len
 ; D:/TC/src/file.c:216:                     fprintf(stderr, "Warning: Path component too long, truncating to %zu characters\n", comp_len);
	call	__getreent	 ;
 ; D:/TC/src/file.c:216:                     fprintf(stderr, "Warning: Path component too long, truncating to %zu characters\n", comp_len);
	movq	24(%rax), %rax	 ; _8->_stderr, _9
 ; D:/TC/src/file.c:216:                     fprintf(stderr, "Warning: Path component too long, truncating to %zu characters\n", comp_len);
	movq	408(%rsp), %rdx	 ; comp_len, tmp150
	movq	%rdx, %r8	 ; tmp150,
	leaq	.LC5(%rip), %rdx	 ;, tmp151
	movq	%rax, %rcx	 ; _9,
	call	fprintf	 ;
.L58:
 ; D:/TC/src/file.c:219:                 strncpy(component, path_copy + start, comp_len);
	movq	352(%rsp), %rdx	 ; path_copy, tmp152
	movq	424(%rsp), %rax	 ; start, tmp153
	addq	%rax, %rdx	 ; tmp153, _10
 ; D:/TC/src/file.c:219:                 strncpy(component, path_copy + start, comp_len);
	movq	408(%rsp), %rcx	 ; comp_len, tmp154
	leaq	32(%rsp), %rax	 ;, tmp155
	movq	%rcx, %r8	 ; tmp154,
	movq	%rax, %rcx	 ; tmp155,
	call	strncpy	 ;
 ; D:/TC/src/file.c:220:                 component[comp_len] = '\0';
	leaq	32(%rsp), %rdx	 ;, tmp156
	movq	408(%rsp), %rax	 ; comp_len, tmp158
	addq	%rdx, %rax	 ; tmp156, tmp157
	movb	$0, (%rax)	 ;, component[comp_len_61]
 ; D:/TC/src/file.c:222:                 if (strcmp(component, ".") == 0) {
	leaq	32(%rsp), %rax	 ;, tmp159
	leaq	.LC6(%rip), %rdx	 ;, tmp160
	movq	%rax, %rcx	 ; tmp159,
	call	strcmp	 ;
 ; D:/TC/src/file.c:222:                 if (strcmp(component, ".") == 0) {
	testl	%eax, %eax	 ; _11
	je	.L57	 ;,
 ; D:/TC/src/file.c:224:                 } else if (strcmp(component, "..") == 0) {
	leaq	32(%rsp), %rax	 ;, tmp161
	leaq	.LC7(%rip), %rdx	 ;, tmp162
	movq	%rax, %rcx	 ; tmp161,
	call	strcmp	 ;
 ; D:/TC/src/file.c:224:                 } else if (strcmp(component, "..") == 0) {
	testl	%eax, %eax	 ; _12
	jne	.L60	 ;,
 ; D:/TC/src/file.c:226:                     if (dirs_tail != NULL && dirs_tail != dirs_head) {
	cmpq	$0, 432(%rsp)	 ;, dirs_tail
	je	.L61	 ;,
 ; D:/TC/src/file.c:226:                     if (dirs_tail != NULL && dirs_tail != dirs_head) {
	movq	432(%rsp), %rax	 ; dirs_tail, tmp163
	cmpq	440(%rsp), %rax	 ; dirs_head, tmp163
	je	.L61	 ;,
 ; D:/TC/src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	movq	432(%rsp), %rax	 ; dirs_tail, tmp164
	movq	(%rax), %rax	 ; dirs_tail_56->dir, _13
 ; D:/TC/src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	leaq	.LC7(%rip), %rdx	 ;, tmp165
	movq	%rax, %rcx	 ; _13,
	call	strcmp	 ;
 ; D:/TC/src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	testl	%eax, %eax	 ; _14
	jne	.L62	 ;,
 ; D:/TC/src/file.c:229:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, 304(%rsp)	 ; tmp166, node
 ; D:/TC/src/file.c:230:                             node->dir = create_string("..", 2);
	movl	$2, %edx	 ;,
	leaq	.LC7(%rip), %rax	 ;, tmp167
	movq	%rax, %rcx	 ; tmp167,
	call	create_string	 ;
 ; D:/TC/src/file.c:230:                             node->dir = create_string("..", 2);
	movq	304(%rsp), %rdx	 ; node, tmp168
	movq	%rax, (%rdx)	 ; _15, node_150->dir
 ; D:/TC/src/file.c:231:                             node->next = 0;
	movq	304(%rsp), %rax	 ; node, tmp169
	movq	$0, 8(%rax)	 ;, node_150->next
 ; D:/TC/src/file.c:232:                             dirs_tail->next = node;
	movq	432(%rsp), %rax	 ; dirs_tail, tmp170
	movq	304(%rsp), %rdx	 ; node, tmp171
	movq	%rdx, 8(%rax)	 ; tmp171, dirs_tail_56->next
 ; D:/TC/src/file.c:233:                             dirs_tail = node;
	movq	304(%rsp), %rax	 ; node, tmp172
	movq	%rax, 432(%rsp)	 ; tmp172, dirs_tail
 ; D:/TC/src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	jmp	.L80	 ;
.L62:
 ; D:/TC/src/file.c:236:                             StrNode* prev = dirs_head;
	movq	440(%rsp), %rax	 ; dirs_head, tmp173
	movq	%rax, 400(%rsp)	 ; tmp173, prev
 ; D:/TC/src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	jmp	.L64	 ;
.L66:
 ; D:/TC/src/file.c:238:                                 prev = prev->next;
	movq	400(%rsp), %rax	 ; prev, tmp174
	movq	8(%rax), %rax	 ; prev_62->next, tmp175
	movq	%rax, 400(%rsp)	 ; tmp175, prev
.L64:
 ; D:/TC/src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	cmpq	$0, 400(%rsp)	 ;, prev
	je	.L65	 ;,
 ; D:/TC/src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	movq	400(%rsp), %rax	 ; prev, tmp176
	movq	8(%rax), %rax	 ; prev_62->next, _16
 ; D:/TC/src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	cmpq	%rax, 432(%rsp)	 ; _16, dirs_tail
	jne	.L66	 ;,
.L65:
 ; D:/TC/src/file.c:240:                             if (prev != NULL) {
	cmpq	$0, 400(%rsp)	 ;, prev
	je	.L80	 ;,
 ; D:/TC/src/file.c:241:                                 prev->next = 0;
	movq	400(%rsp), %rax	 ; prev, tmp177
	movq	$0, 8(%rax)	 ;, prev_62->next
 ; D:/TC/src/file.c:242:                                 dirs_tail = prev;
	movq	400(%rsp), %rax	 ; prev, tmp178
	movq	%rax, 432(%rsp)	 ; tmp178, dirs_tail
 ; D:/TC/src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	jmp	.L80	 ;
.L61:
 ; D:/TC/src/file.c:245:                     } else if (dirs_head == NULL) {
	cmpq	$0, 440(%rsp)	 ;, dirs_head
	jne	.L57	 ;,
 ; D:/TC/src/file.c:247:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, 296(%rsp)	 ; tmp179, node
 ; D:/TC/src/file.c:248:                         node->dir = create_string("..", 2);
	movl	$2, %edx	 ;,
	leaq	.LC7(%rip), %rax	 ;, tmp180
	movq	%rax, %rcx	 ; tmp180,
	call	create_string	 ;
 ; D:/TC/src/file.c:248:                         node->dir = create_string("..", 2);
	movq	296(%rsp), %rdx	 ; node, tmp181
	movq	%rax, (%rdx)	 ; _17, node_157->dir
 ; D:/TC/src/file.c:249:                         node->next = 0;
	movq	296(%rsp), %rax	 ; node, tmp182
	movq	$0, 8(%rax)	 ;, node_157->next
 ; D:/TC/src/file.c:250:                         dirs_head = node;
	movq	296(%rsp), %rax	 ; node, tmp183
	movq	%rax, 440(%rsp)	 ; tmp183, dirs_head
 ; D:/TC/src/file.c:251:                         dirs_tail = node;
	movq	296(%rsp), %rax	 ; node, tmp184
	movq	%rax, 432(%rsp)	 ; tmp184, dirs_tail
	jmp	.L57	 ;
.L60:
 ; D:/TC/src/file.c:253:                 } else if (strlen(component) > 0) {
	leaq	32(%rsp), %rax	 ;, component.3_18
 ; D:/TC/src/file.c:253:                 } else if (strlen(component) > 0) {
	movzbl	(%rax), %eax	 ; MEM[(const char *)component.3_18], _19
 ; D:/TC/src/file.c:253:                 } else if (strlen(component) > 0) {
	testb	%al, %al	 ; _19
	je	.L57	 ;,
 ; D:/TC/src/file.c:255:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, 312(%rsp)	 ; tmp185, node
 ; D:/TC/src/file.c:256:                     node->dir = create_string(component, comp_len);
	movq	408(%rsp), %rdx	 ; comp_len, tmp186
	leaq	32(%rsp), %rax	 ;, tmp187
	movq	%rax, %rcx	 ; tmp187,
	call	create_string	 ;
 ; D:/TC/src/file.c:256:                     node->dir = create_string(component, comp_len);
	movq	312(%rsp), %rdx	 ; node, tmp188
	movq	%rax, (%rdx)	 ; _20, node_138->dir
 ; D:/TC/src/file.c:257:                     node->next = 0;
	movq	312(%rsp), %rax	 ; node, tmp189
	movq	$0, 8(%rax)	 ;, node_138->next
 ; D:/TC/src/file.c:259:                     if (dirs_tail != NULL)
	cmpq	$0, 432(%rsp)	 ;, dirs_tail
	je	.L68	 ;,
 ; D:/TC/src/file.c:260:                         dirs_tail->next = node;
	movq	432(%rsp), %rax	 ; dirs_tail, tmp190
	movq	312(%rsp), %rdx	 ; node, tmp191
	movq	%rdx, 8(%rax)	 ; tmp191, dirs_tail_56->next
.L68:
 ; D:/TC/src/file.c:262:                     dirs_tail = node;
	movq	312(%rsp), %rax	 ; node, tmp192
	movq	%rax, 432(%rsp)	 ; tmp192, dirs_tail
 ; D:/TC/src/file.c:263:                     if (dirs_head == NULL) dirs_head = node;
	cmpq	$0, 440(%rsp)	 ;, dirs_head
	jne	.L57	 ;,
 ; D:/TC/src/file.c:263:                     if (dirs_head == NULL) dirs_head = node;
	movq	312(%rsp), %rax	 ; node, tmp193
	movq	%rax, 440(%rsp)	 ; tmp193, dirs_head
	jmp	.L57	 ;
.L80:
 ; D:/TC/src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	nop	
.L57:
 ; D:/TC/src/file.c:266:             start = i + 1;
	movq	416(%rsp), %rax	 ; i, tmp197
	addq	$1, %rax	 ;, tmp196
	movq	%rax, 424(%rsp)	 ; tmp196, start
.L56:
 ; D:/TC/src/file.c:268:         i++;
	addq	$1, 416(%rsp)	 ;, i
.L54:
 ; D:/TC/src/file.c:210:     while (i <= path_len) {
	movq	416(%rsp), %rax	 ; i, tmp198
	cmpq	%rax, 360(%rsp)	 ; tmp198, path_len
	jnb	.L69	 ;,
 ; D:/TC/src/file.c:272:     file->dirs = dirs_head;
	movq	16(%rbp), %rax	 ; file, tmp199
	movq	440(%rsp), %rdx	 ; dirs_head, tmp200
	movq	%rdx, (%rax)	 ; tmp200, file_83(D)->dirs
 ; D:/TC/src/file.c:275:     if (dirs_tail != NULL) {
	cmpq	$0, 432(%rsp)	 ;, dirs_tail
	je	.L70	 ;,
 ; D:/TC/src/file.c:276:         string dot = strrchr(dirs_tail->dir, '.');
	movq	432(%rsp), %rax	 ; dirs_tail, tmp201
	movq	(%rax), %rax	 ; dirs_tail_56->dir, _21
 ; D:/TC/src/file.c:276:         string dot = strrchr(dirs_tail->dir, '.');
	movl	$46, %edx	 ;,
	movq	%rax, %rcx	 ; _21,
	call	strrchr	 ;
	movq	%rax, 336(%rsp)	 ; tmp202, dot
 ; D:/TC/src/file.c:278:         if (dot != NULL && dot != dirs_tail->dir) {
	cmpq	$0, 336(%rsp)	 ;, dot
	je	.L71	 ;,
 ; D:/TC/src/file.c:278:         if (dot != NULL && dot != dirs_tail->dir) {
	movq	432(%rsp), %rax	 ; dirs_tail, tmp203
	movq	(%rax), %rax	 ; dirs_tail_56->dir, _22
 ; D:/TC/src/file.c:278:         if (dot != NULL && dot != dirs_tail->dir) {
	cmpq	%rax, 336(%rsp)	 ; _22, dot
	je	.L71	 ;,
 ; D:/TC/src/file.c:280:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	432(%rsp), %rax	 ; dirs_tail, tmp204
	movq	(%rax), %rax	 ; dirs_tail_56->dir, _23
 ; D:/TC/src/file.c:280:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	336(%rsp), %rdx	 ; dot, tmp205
	subq	%rax, %rdx	 ; _23, _24
 ; D:/TC/src/file.c:280:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	%rdx, 328(%rsp)	 ; _24, name_len
 ; D:/TC/src/file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	movq	432(%rsp), %rax	 ; dirs_tail, tmp206
	movq	(%rax), %rax	 ; dirs_tail_56->dir, _25
 ; D:/TC/src/file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	movq	328(%rsp), %rdx	 ; name_len, tmp207
	movq	%rax, %rcx	 ; _25,
	call	create_string	 ;
 ; D:/TC/src/file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	movq	16(%rbp), %rdx	 ; file, tmp208
	movq	%rax, 16(%rdx)	 ; _26, file_83(D)->name
 ; D:/TC/src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	336(%rsp), %rax	 ; dot, tmp209
	movq	%rax, %rcx	 ; tmp209,
	call	strlen	 ;
	movq	%rax, %rdx	 ;, _27
 ; D:/TC/src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	336(%rsp), %rax	 ; dot, tmp210
	movq	%rax, %rcx	 ; tmp210,
	call	create_string	 ;
 ; D:/TC/src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	16(%rbp), %rdx	 ; file, tmp211
	movq	%rax, 8(%rdx)	 ; _28, file_83(D)->extension
 ; D:/TC/src/file.c:278:         if (dot != NULL && dot != dirs_tail->dir) {
	jmp	.L73	 ;
.L71:
 ; D:/TC/src/file.c:285:             file->name = dirs_tail->dir;
	movq	432(%rsp), %rax	 ; dirs_tail, tmp212
	movq	(%rax), %rdx	 ; dirs_tail_56->dir, _29
 ; D:/TC/src/file.c:285:             file->name = dirs_tail->dir;
	movq	16(%rbp), %rax	 ; file, tmp213
	movq	%rdx, 16(%rax)	 ; _29, file_83(D)->name
 ; D:/TC/src/file.c:286:             file->extension = NULL;
	movq	16(%rbp), %rax	 ; file, tmp214
	movq	$0, 8(%rax)	 ;, file_83(D)->extension
	jmp	.L73	 ;
.L70:
 ; D:/TC/src/file.c:289:         file->name = NULL;
	movq	16(%rbp), %rax	 ; file, tmp215
	movq	$0, 16(%rax)	 ;, file_83(D)->name
 ; D:/TC/src/file.c:290:         file->extension = NULL;
	movq	16(%rbp), %rax	 ; file, tmp216
	movq	$0, 8(%rax)	 ;, file_83(D)->extension
.L73:
 ; D:/TC/src/file.c:294:     size_t full_path_len = 0;
	movq	$0, 392(%rsp)	 ;, full_path_len
 ; D:/TC/src/file.c:295:     StrNode* current = dirs_head;
	movq	440(%rsp), %rax	 ; dirs_head, tmp217
	movq	%rax, 384(%rsp)	 ; tmp217, current
 ; D:/TC/src/file.c:296:     size_t node_count = 0;
	movq	$0, 376(%rsp)	 ;, node_count
 ; D:/TC/src/file.c:298:     while (current != NULL) {
	jmp	.L74	 ;
.L75:
 ; D:/TC/src/file.c:299:         full_path_len += strlen(current->dir);
	movq	384(%rsp), %rax	 ; current, tmp218
	movq	(%rax), %rax	 ; current_65->dir, _30
 ; D:/TC/src/file.c:299:         full_path_len += strlen(current->dir);
	movq	%rax, %rcx	 ; _30,
	call	strlen	 ;
 ; D:/TC/src/file.c:299:         full_path_len += strlen(current->dir);
	addq	%rax, 392(%rsp)	 ; _31, full_path_len
 ; D:/TC/src/file.c:300:         node_count++;
	addq	$1, 376(%rsp)	 ;, node_count
 ; D:/TC/src/file.c:301:         current = current->next;
	movq	384(%rsp), %rax	 ; current, tmp219
	movq	8(%rax), %rax	 ; current_65->next, tmp220
	movq	%rax, 384(%rsp)	 ; tmp220, current
.L74:
 ; D:/TC/src/file.c:298:     while (current != NULL) {
	cmpq	$0, 384(%rsp)	 ;, current
	jne	.L75	 ;,
 ; D:/TC/src/file.c:305:     if (node_count > 1)
	cmpq	$1, 376(%rsp)	 ;, node_count
	jbe	.L76	 ;,
 ; D:/TC/src/file.c:306:         full_path_len += (node_count - 1);
	movq	376(%rsp), %rdx	 ; node_count, tmp221
	movq	392(%rsp), %rax	 ; full_path_len, tmp222
	addq	%rdx, %rax	 ; tmp221, _32
	subq	$1, %rax	 ;, tmp223
	movq	%rax, 392(%rsp)	 ; tmp223, full_path_len
.L76:
 ; D:/TC/src/file.c:308:     string full_path = create_string_not_check("", full_path_len + 1);
	movq	392(%rsp), %rax	 ; full_path_len, tmp224
	addq	$1, %rax	 ;, _33
	movq	%rax, %rdx	 ; _33,
	leaq	.LC0(%rip), %rax	 ;, tmp225
	movq	%rax, %rcx	 ; tmp225,
	call	create_string_not_check	 ;
	movq	%rax, 320(%rsp)	 ; tmp226, full_path
 ; D:/TC/src/file.c:309:     full_path[0] = '\0';
	movq	320(%rsp), %rax	 ; full_path, tmp227
	movb	$0, (%rax)	 ;, *full_path_116
 ; D:/TC/src/file.c:311:     current = dirs_head;
	movq	440(%rsp), %rax	 ; dirs_head, tmp228
	movq	%rax, 384(%rsp)	 ; tmp228, current
 ; D:/TC/src/file.c:312:     bool is_first = true;
	movb	$1, 375(%rsp)	 ;, is_first
 ; D:/TC/src/file.c:313:     while (current != NULL) {
	jmp	.L77	 ;
.L79:
 ; D:/TC/src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	cmpb	$0, 375(%rsp)	 ;, is_first
	jne	.L78	 ;,
 ; D:/TC/src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	384(%rsp), %rax	 ; current, tmp229
	movq	(%rax), %rax	 ; current_66->dir, _34
 ; D:/TC/src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	leaq	.LC2(%rip), %rdx	 ;, tmp230
	movq	%rax, %rcx	 ; _34,
	call	strcmp	 ;
 ; D:/TC/src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testl	%eax, %eax	 ; _35
	je	.L78	 ;,
 ; D:/TC/src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	movq	320(%rsp), %rax	 ; full_path, tmp231
	movzbl	(%rax), %eax	 ; MEM[(const char *)full_path_116], _36
 ; D:/TC/src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	testb	%al, %al	 ; _36
	je	.L78	 ;,
 ; D:/TC/src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	movq	320(%rsp), %rax	 ; full_path, tmp232
	movq	%rax, %rcx	 ; tmp232,
	call	strlen	 ;
 ; D:/TC/src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	leaq	-1(%rax), %rdx	 ;, _38
	movq	320(%rsp), %rax	 ; full_path, tmp233
	addq	%rdx, %rax	 ; _38, _39
	movzbl	(%rax), %eax	 ; *_39, _40
 ; D:/TC/src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$47, %al	 ;, _40
	je	.L78	 ;,
 ; D:/TC/src/file.c:317:                 strcat(full_path, "/");
	movq	320(%rsp), %rax	 ; full_path, tmp235
	movq	%rax, %rcx	 ; tmp235,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp237, _122
 ; D:/TC/src/file.c:317:                 strcat(full_path, "/");
	movq	320(%rsp), %rax	 ; full_path, tmp238
	addq	%rdx, %rax	 ; _122, _123
	movw	$47, (%rax)	 ;, MEM <char[1:2]> [(void *)_123]
.L78:
 ; D:/TC/src/file.c:320:         strcat(full_path, current->dir);
	movq	384(%rsp), %rax	 ; current, tmp239
	movq	(%rax), %rdx	 ; current_66->dir, _41
 ; D:/TC/src/file.c:320:         strcat(full_path, current->dir);
	movq	320(%rsp), %rax	 ; full_path, tmp240
	movq	%rax, %rcx	 ; tmp240,
	call	strcat	 ;
 ; D:/TC/src/file.c:321:         is_first = false;
	movb	$0, 375(%rsp)	 ;, is_first
 ; D:/TC/src/file.c:322:         current = current->next;
	movq	384(%rsp), %rax	 ; current, tmp241
	movq	8(%rax), %rax	 ; current_66->next, tmp242
	movq	%rax, 384(%rsp)	 ; tmp242, current
.L77:
 ; D:/TC/src/file.c:313:     while (current != NULL) {
	cmpq	$0, 384(%rsp)	 ;, current
	jne	.L79	 ;,
 ; D:/TC/src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	320(%rsp), %rax	 ; full_path, tmp243
	movq	%rax, %rcx	 ; tmp243,
	call	strlen	 ;
	movq	%rax, %rdx	 ;, _42
 ; D:/TC/src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	320(%rsp), %rax	 ; full_path, tmp244
	movq	%rax, %rcx	 ; tmp244,
	call	create_string	 ;
 ; D:/TC/src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	16(%rbp), %rdx	 ; file, tmp245
	movq	%rax, 24(%rdx)	 ; _43, file_83(D)->path
 ; D:/TC/src/file.c:326: }
	nop	
	leave	
	ret	
	.ident	"GCC: (GNU) 13.2.0"
	.def	getcwd;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	__locale_ctype_ptr;	.scl	2;	.type	32;	.endef
	.def	toupper;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
