	.file	"file.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.globl	get_cwd
	.def	get_cwd;	.scl	2;	.type	32;	.endef
get_cwd:
 ; D:/TC/src/file.c:7:     return getcwd(NULL, 0);  // MinGW or LINUX or MACOS
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	jmp	getcwd	 ;
	.section .rdata,"dr"
.LC0:
	.ascii "\0"
.LC1:
	.ascii "%s/%s\0"
	.text
	.globl	absolute_path
	.def	absolute_path;	.scl	2;	.type	32;	.endef
absolute_path:
	pushq	%r13	 ;
	pushq	%r12	 ;
 ; D:/TC/src/file.c:62:     string abs_path = create_string_not_check("", total_len);
	leaq	.LC0(%rip), %r12	 ;, tmp153
 ; D:/TC/src/file.c:22: string absolute_path(string path, string base_path) {
	pushq	%rbp	 ;
 ; D:/TC/src/file.c:63:     sprintf(abs_path, "%s/%s", base_path, path);
	leaq	.LC1(%rip), %rbp	 ;, tmp154
 ; D:/TC/src/file.c:22: string absolute_path(string path, string base_path) {
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp157, base_path
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
.L22:
 ; D:/TC/src/file.c:23:     path = create_string_not_check(path, strlen(path));
	movq	%rcx, 96(%rsp)	 ; path, path
	call	strlen	 ;
 ; D:/TC/src/file.c:23:     path = create_string_not_check(path, strlen(path));
	movq	96(%rsp), %rcx	 ; path, path
 ; D:/TC/src/file.c:23:     path = create_string_not_check(path, strlen(path));
	movq	%rax, %rdx	 ; tmp158, tmp124
 ; D:/TC/src/file.c:23:     path = create_string_not_check(path, strlen(path));
	call	create_string_not_check	 ;
 ; D:/TC/src/file.c:24:     size_t path_len = strlen(path);
	movq	%rax, %rcx	 ; <retval>,
 ; D:/TC/src/file.c:23:     path = create_string_not_check(path, strlen(path));
	movq	%rax, %rbx	 ; tmp159, <retval>
 ; D:/TC/src/file.c:24:     size_t path_len = strlen(path);
	call	strlen	 ;
	movq	%rax, %rsi	 ; tmp160, path_len
 ; D:/TC/src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	xorl	%eax, %eax	 ; i
.L3:
 ; D:/TC/src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	cmpq	%rsi, %rax	 ; path_len, i
	jnb	.L38	 ;,
 ; D:/TC/src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	leaq	(%rbx,%rax), %rcx	 ;, _2
	movb	(%rcx), %dl	 ; *_2, _3
 ; D:/TC/src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	cmpb	$92, %dl	 ;, _3
	jne	.L4	 ;,
 ; D:/TC/src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	movb	$47, (%rcx)	 ;, *_2
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rax	 ;, i
	jbe	.L9	 ;,
.L10:
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-1(%rbx,%rax), %rcx	 ;, _8
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$46, (%rcx)	 ;, *_8
	jne	.L11	 ;,
	jmp	.L39	 ;
.L4:
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rax	 ;, i
	jbe	.L9	 ;,
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, %dl	 ;, _3
	jne	.L11	 ;,
	jmp	.L10	 ;
.L39:
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, -2(%rbx,%rax)	 ;, *_11
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-2(%rax), %r13	 ;, _10
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	jne	.L11	 ;,
 ; D:/TC/src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	%rsi, %r8	 ; path_len, tmp167
 ; D:/TC/src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	leaq	1(%rbx,%rax), %rdx	 ;, tmp135
 ; D:/TC/src/file.c:29:             path_len -= 2;
	subq	$2, %rsi	 ;, path_len
 ; D:/TC/src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	subq	%rax, %r8	 ; i, tmp167
	call	memmove	 ;
 ; D:/TC/src/file.c:30:             i -= 2;
	movq	%r13, %rax	 ; _10, i
.L9:
 ; D:/TC/src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	testq	%rax, %rax	 ; i
	je	.L12	 ;,
.L11:
 ; D:/TC/src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	(%rbx,%rax), %rcx	 ;, _16
 ; D:/TC/src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, (%rcx)	 ;, *_16
	jne	.L12	 ;,
 ; D:/TC/src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, -1(%rbx,%rax)	 ;, *_19
 ; D:/TC/src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	-1(%rax), %r13	 ;, _18
 ; D:/TC/src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	jne	.L12	 ;,
 ; D:/TC/src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	movq	%rsi, %r8	 ; path_len, tmp168
 ; D:/TC/src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	leaq	1(%rbx,%rax), %rdx	 ;, tmp141
 ; D:/TC/src/file.c:34:             path_len--;
	decq	%rsi	 ; path_len
 ; D:/TC/src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	subq	%rax, %r8	 ; i, tmp168
	call	memmove	 ;
 ; D:/TC/src/file.c:35:             i--;
	movq	%r13, %rax	 ; _18, i
.L12:
 ; D:/TC/src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	incq	%rax	 ; i
	jmp	.L3	 ;
.L38:
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpq	$2, %rsi	 ;, path_len
	jbe	.L14	 ;,
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpb	$47, (%rbx)	 ;, *path_57
	jne	.L15	 ;,
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	movsbl	1(%rbx), %ecx	 ; MEM[(char *)path_57 + 1B],
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	leal	-97(%rcx), %eax	 ;, tmp142
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpb	$25, %al	 ;, tmp142
	ja	.L2	 ;,
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpb	$47, 2(%rbx)	 ;, MEM[(char *)path_57 + 2B]
	jne	.L2	 ;,
 ; D:/TC/src/file.c:40:         path[0] = to_upper(path[1]);
	call	to_upper	 ;
 ; D:/TC/src/file.c:41:         path[1] = ':';
	movb	$58, 1(%rbx)	 ;, MEM[(char *)path_57 + 1B]
 ; D:/TC/src/file.c:40:         path[0] = to_upper(path[1]);
	movb	%al, (%rbx)	 ; tmp161, *path_57
 ; D:/TC/src/file.c:42:         return path;
	jmp	.L2	 ;
.L14:
 ; D:/TC/src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	jne	.L17	 ;,
.L15:
 ; D:/TC/src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	movb	(%rbx), %al	 ; *path_57, tmp169
	subl	$65, %eax	 ;, tmp145
 ; D:/TC/src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpb	$25, %al	 ;, tmp145
	ja	.L18	 ;,
 ; D:/TC/src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpb	$58, 1(%rbx)	 ;, MEM[(char *)path_57 + 1B]
	jmp	.L36	 ;
.L17:
 ; D:/TC/src/file.c:55:     if (path_len > 0 && path[0] == '/')
	testq	%rsi, %rsi	 ; path_len
	je	.L19	 ;,
.L18:
 ; D:/TC/src/file.c:55:     if (path_len > 0 && path[0] == '/')
	cmpb	$47, (%rbx)	 ;, *path_57
.L36:
	je	.L2	 ;,
.L19:
 ; D:/TC/src/file.c:57:     if (base_path == NULL)
	testq	%rdi, %rdi	 ; base_path
	jne	.L21	 ;,
 ; D:/TC/src/file.c:58:         base_path = get_cwd();
	call	get_cwd	 ;
	movq	%rax, %rdi	 ; tmp162, base_path
 ; D:/TC/src/file.c:59:     if (base_path == NULL)
	testq	%rax, %rax	 ; base_path
	je	.L2	 ;,
.L21:
 ; D:/TC/src/file.c:61:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	movq	%rdi, %rcx	 ; base_path,
	call	strlen	 ;
 ; D:/TC/src/file.c:62:     string abs_path = create_string_not_check("", total_len);
	movq	%r12, %rcx	 ; tmp153,
 ; D:/TC/src/file.c:61:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	leaq	2(%rsi,%rax), %r13	 ;, total_len
 ; D:/TC/src/file.c:62:     string abs_path = create_string_not_check("", total_len);
	movq	%r13, %rdx	 ; total_len,
	call	create_string_not_check	 ;
 ; D:/TC/src/file.c:63:     sprintf(abs_path, "%s/%s", base_path, path);
	movq	%rdi, %r8	 ; base_path,
	movq	%rbx, %r9	 ; <retval>,
	movq	%rbp, %rdx	 ; tmp154,
 ; D:/TC/src/file.c:62:     string abs_path = create_string_not_check("", total_len);
	movq	%rax, %rsi	 ; tmp164, abs_path
 ; D:/TC/src/file.c:63:     sprintf(abs_path, "%s/%s", base_path, path);
	movq	%rax, %rcx	 ; abs_path,
 ; D:/TC/src/file.c:64:     return absolute_path(create_string(abs_path, total_len), NULL);
	xorl	%edi, %edi	 ; base_path
 ; D:/TC/src/file.c:63:     sprintf(abs_path, "%s/%s", base_path, path);
	call	sprintf	 ;
 ; D:/TC/src/file.c:64:     return absolute_path(create_string(abs_path, total_len), NULL);
	movq	%rsi, %rcx	 ; abs_path,
	movq	%r13, %rdx	 ; total_len,
	call	create_string	 ;
	movq	%rax, %rcx	 ; tmp165, path
	jmp	.L22	 ;
.L2:
 ; D:/TC/src/file.c:65: }
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
.LC2:
	.ascii "/\0"
.LC3:
	.ascii "Warning: Path component too long, truncating to %zu characters\12\0"
.LC4:
	.ascii ".\0"
.LC5:
	.ascii "..\0"
	.text
	.globl	create_file
	.def	create_file;	.scl	2;	.type	32;	.endef
create_file:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp205, path
 ; D:/TC/src/file.c:16:     File* file = (File*)alloc_memory(sizeof(File));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/file.c:15: File* create_file(const string path) {
	subq	$312, %rsp	 ;,
 ; D:/TC/src/file.c:16:     File* file = (File*)alloc_memory(sizeof(File));
	call	alloc_memory	 ;
 ; D:/TC/src/file.c:17:     file->path = absolute_path(path, NULL);
	xorl	%edx, %edx	 ;
	movq	%rbx, %rcx	 ; path,
 ; D:/TC/src/file.c:16:     File* file = (File*)alloc_memory(sizeof(File));
	movq	%rax, %rsi	 ; tmp206, <retval>
 ; D:/TC/src/file.c:17:     file->path = absolute_path(path, NULL);
	call	absolute_path	 ;
 ; D:/TC/src/file.c:17:     file->path = absolute_path(path, NULL);
	movq	%rax, 24(%rsi)	 ; _1, file_4->path
 ; D:/TC/src/file.c:17:     file->path = absolute_path(path, NULL);
	movq	%rax, %rcx	 ; tmp207, _1
 ; D:/TC/src/file.c:172:     size_t path_len = strlen(file->path);
	call	strlen	 ;
 ; D:/TC/src/file.c:175:     string path_copy = create_string_not_check("", path_len + 1);
	leaq	.LC0(%rip), %rcx	 ;,
	leaq	1(%rax), %rdx	 ;, tmp146
 ; D:/TC/src/file.c:172:     size_t path_len = strlen(file->path);
	movq	%rax, %r13	 ; tmp208, tmp144
 ; D:/TC/src/file.c:175:     string path_copy = create_string_not_check("", path_len + 1);
	call	create_string_not_check	 ;
 ; D:/TC/src/file.c:176:     strcpy(path_copy, file->path);
	movq	24(%rsi), %rdx	 ; file_4->path, file_4->path
	movq	%rax, %rcx	 ; path_copy,
 ; D:/TC/src/file.c:175:     string path_copy = create_string_not_check("", path_len + 1);
	movq	%rax, %rbp	 ; tmp209, path_copy
 ; D:/TC/src/file.c:176:     strcpy(path_copy, file->path);
	call	strcpy	 ;
 ; D:/TC/src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	testq	%r13, %r13	 ; tmp144
	je	.L62	 ;,
 ; D:/TC/src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	cmpb	$47, 0(%rbp)	 ;, *path_copy_12
	jne	.L62	 ;,
 ; D:/TC/src/file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/file.c:204:         start = 1;
	movl	$1, %r14d	 ;, start
 ; D:/TC/src/file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	call	alloc_memory	 ;
 ; D:/TC/src/file.c:199:         node->dir = create_string("/", 1);
	movl	$1, %edx	 ;,
	leaq	.LC2(%rip), %rcx	 ;, tmp149
 ; D:/TC/src/file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %r15	 ; tmp210, node
 ; D:/TC/src/file.c:199:         node->dir = create_string("/", 1);
	call	create_string	 ;
 ; D:/TC/src/file.c:200:         node->next = 0;
	xorl	%r9d, %r9d	 ;
 ; D:/TC/src/file.c:199:         node->dir = create_string("/", 1);
	movq	%rax, (%r15)	 ; tmp211, node_15->dir
 ; D:/TC/src/file.c:200:         node->next = 0;
	movq	%r9, 8(%r15)	 ;, node_15->next
	jmp	.L41	 ;
.L62:
 ; D:/TC/src/file.c:181:     size_t start = 0;
	xorl	%r14d, %r14d	 ; start
 ; D:/TC/src/file.c:178:     StrNode* dirs_head = NULL;
	xorl	%r15d, %r15d	 ; node
.L41:
 ; D:/TC/src/file.c:219:                 strncpy(component, path_copy + start, comp_len);
	leaq	48(%rsp), %rax	 ;, tmp203
 ; D:/TC/src/file.c:209:     size_t i = start;
	movq	%r14, %rdi	 ; start, i
 ; D:/TC/src/file.c:210:     while (i <= path_len) {
	movq	%r15, %rbx	 ; node, node
 ; D:/TC/src/file.c:219:                 strncpy(component, path_copy + start, comp_len);
	movq	%rax, 40(%rsp)	 ; tmp203, %sfp
.L42:
 ; D:/TC/src/file.c:210:     while (i <= path_len) {
	cmpq	%rdi, %r13	 ; i, tmp144
	jb	.L95	 ;,
 ; D:/TC/src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	je	.L43	 ;,
 ; D:/TC/src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpb	$47, 0(%rbp,%rdi)	 ;, MEM[(char *)path_copy_12 + i_17 * 1]
	jne	.L44	 ;,
.L43:
 ; D:/TC/src/file.c:212:             if (i > start) {
	cmpq	%rdi, %r14	 ; i, start
	jnb	.L45	 ;,
 ; D:/TC/src/file.c:213:                 size_t comp_len = i - start;
	movq	%rdi, %r12	 ; i, comp_len
	subq	%r14, %r12	 ; start, comp_len
 ; D:/TC/src/file.c:214:                 if (comp_len >= componentMaxSize) {
	cmpq	$255, %r12	 ;, comp_len
	jbe	.L46	 ;,
 ; D:/TC/src/file.c:215:                     fprintf(stderr, "Warning: Path component too long, truncating to %zu characters\n", comp_len);
	call	__getreent	 ;
 ; D:/TC/src/file.c:215:                     fprintf(stderr, "Warning: Path component too long, truncating to %zu characters\n", comp_len);
	movq	%r12, %r8	 ; comp_len,
	leaq	.LC3(%rip), %rdx	 ;, tmp151
 ; D:/TC/src/file.c:216:                     comp_len = componentMaxSize - 1;
	movl	$255, %r12d	 ;, comp_len
 ; D:/TC/src/file.c:215:                     fprintf(stderr, "Warning: Path component too long, truncating to %zu characters\n", comp_len);
	movq	24(%rax), %rcx	 ; _22->_stderr, _22->_stderr
	call	fprintf	 ;
.L46:
 ; D:/TC/src/file.c:219:                 strncpy(component, path_copy + start, comp_len);
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/file.c:219:                 strncpy(component, path_copy + start, comp_len);
	leaq	0(%rbp,%r14), %rdx	 ;, tmp152
 ; D:/TC/src/file.c:219:                 strncpy(component, path_copy + start, comp_len);
	movq	%r12, %r8	 ; comp_len,
	call	strncpy	 ;
 ; D:/TC/src/file.c:222:                 if (strcmp(component, ".") == 0) {
	movq	40(%rsp), %rcx	 ; %sfp,
	leaq	.LC4(%rip), %rdx	 ;,
 ; D:/TC/src/file.c:220:                 component[comp_len] = '\0';
	movb	$0, 48(%rsp,%r12)	 ;, component[comp_len_25]
 ; D:/TC/src/file.c:222:                 if (strcmp(component, ".") == 0) {
	call	strcmp	 ;
 ; D:/TC/src/file.c:222:                 if (strcmp(component, ".") == 0) {
	testl	%eax, %eax	 ; tmp213
	je	.L45	 ;,
 ; D:/TC/src/file.c:224:                 } else if (strcmp(component, "..") == 0) {
	leaq	.LC5(%rip), %r14	 ;, tmp161
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%r14, %rdx	 ; tmp161,
	call	strcmp	 ;
 ; D:/TC/src/file.c:224:                 } else if (strcmp(component, "..") == 0) {
	testl	%eax, %eax	 ; tmp214
	jne	.L48	 ;,
 ; D:/TC/src/file.c:226:                     if (dirs_tail != NULL && dirs_tail != dirs_head) {
	testq	%r15, %r15	 ; node
	je	.L49	 ;,
	cmpq	%rbx, %r15	 ; node, node
	je	.L49	 ;,
 ; D:/TC/src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	movq	(%r15), %rcx	 ; dirs_tail_28->dir,
	movq	%r14, %rdx	 ; tmp161,
	call	strcmp	 ;
 ; D:/TC/src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	testl	%eax, %eax	 ; tmp215
	jne	.L63	 ;,
 ; D:/TC/src/file.c:229:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/file.c:230:                             node->dir = create_string("..", 2);
	movl	$2, %edx	 ;,
	movq	%r14, %rcx	 ; tmp161,
 ; D:/TC/src/file.c:229:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %r12	 ; tmp216, node
 ; D:/TC/src/file.c:230:                             node->dir = create_string("..", 2);
	call	create_string	 ;
 ; D:/TC/src/file.c:231:                             node->next = 0;
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/file.c:230:                             node->dir = create_string("..", 2);
	movq	%rax, (%r12)	 ; tmp217, node_35->dir
 ; D:/TC/src/file.c:231:                             node->next = 0;
	movq	%r8, 8(%r12)	 ;, node_35->next
 ; D:/TC/src/file.c:232:                             dirs_tail->next = node;
	movq	%r12, 8(%r15)	 ; node, dirs_tail_28->next
 ; D:/TC/src/file.c:233:                             dirs_tail = node;
	movq	%r12, %r15	 ; node, node
	jmp	.L45	 ;
.L63:
 ; D:/TC/src/file.c:236:                             StrNode* prev = dirs_head;
	movq	%rbx, %rax	 ; node, prev
.L50:
 ; D:/TC/src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	testq	%rax, %rax	 ; prev
	je	.L45	 ;,
 ; D:/TC/src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	movq	8(%rax), %rdx	 ; prev_37->next, _38
 ; D:/TC/src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	cmpq	%rdx, %r15	 ; _38, node
	je	.L96	 ;,
 ; D:/TC/src/file.c:238:                                 prev = prev->next;
	movq	%rdx, %rax	 ; _38, prev
	jmp	.L50	 ;
.L96:
 ; D:/TC/src/file.c:241:                                 prev->next = 0;
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/file.c:242:                                 dirs_tail = prev;
	movq	%rax, %r15	 ; prev, node
 ; D:/TC/src/file.c:241:                                 prev->next = 0;
	movq	%rcx, 8(%rax)	 ;, prev_37->next
	jmp	.L45	 ;
.L49:
 ; D:/TC/src/file.c:245:                     } else if (dirs_head == NULL) {
	testq	%rbx, %rbx	 ; node
	jne	.L45	 ;,
 ; D:/TC/src/file.c:247:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/file.c:248:                         node->dir = create_string("..", 2);
	movl	$2, %edx	 ;,
	movq	%r14, %rcx	 ; tmp161,
 ; D:/TC/src/file.c:247:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %rbx	 ; tmp218, node
 ; D:/TC/src/file.c:248:                         node->dir = create_string("..", 2);
	call	create_string	 ;
 ; D:/TC/src/file.c:249:                         node->next = 0;
	xorl	%edx, %edx	 ;
 ; D:/TC/src/file.c:248:                         node->dir = create_string("..", 2);
	movq	%rax, (%rbx)	 ; tmp219, node_40->dir
 ; D:/TC/src/file.c:249:                         node->next = 0;
	movq	%rdx, 8(%rbx)	 ;, node_40->next
	jmp	.L94	 ;
.L48:
 ; D:/TC/src/file.c:253:                 } else if (strlen(component) > 0) {
	cmpb	$0, 48(%rsp)	 ;, MEM[(const char *)&component]
	je	.L45	 ;,
 ; D:/TC/src/file.c:255:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/file.c:256:                     node->dir = create_string(component, comp_len);
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%r12, %rdx	 ; comp_len,
 ; D:/TC/src/file.c:255:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %r14	 ; tmp220, node
 ; D:/TC/src/file.c:256:                     node->dir = create_string(component, comp_len);
	call	create_string	 ;
 ; D:/TC/src/file.c:256:                     node->dir = create_string(component, comp_len);
	movq	%rax, (%r14)	 ; tmp221, node_43->dir
 ; D:/TC/src/file.c:257:                     node->next = 0;
	xorl	%eax, %eax	 ;
	movq	%rax, 8(%r14)	 ;, node_43->next
 ; D:/TC/src/file.c:259:                     if (dirs_tail != NULL)
	testq	%r15, %r15	 ; node
	je	.L51	 ;,
 ; D:/TC/src/file.c:260:                         dirs_tail->next = node;
	movq	%r14, 8(%r15)	 ; node, dirs_tail_28->next
.L51:
 ; D:/TC/src/file.c:262:                     dirs_tail = node;
	movq	%r14, %r15	 ; node, node
 ; D:/TC/src/file.c:263:                     if (dirs_head == NULL) dirs_head = node;
	testq	%rbx, %rbx	 ; node
	jne	.L45	 ;,
 ; D:/TC/src/file.c:262:                     dirs_tail = node;
	movq	%r14, %rbx	 ; node, node
.L94:
 ; D:/TC/src/file.c:263:                     if (dirs_head == NULL) dirs_head = node;
	movq	%rbx, %r15	 ; node, node
.L45:
 ; D:/TC/src/file.c:266:             start = i + 1;
	leaq	1(%rdi), %r14	 ;, start
.L44:
 ; D:/TC/src/file.c:268:         i++;
	incq	%rdi	 ; i
	jmp	.L42	 ;
.L95:
 ; D:/TC/src/file.c:272:     file->dirs = dirs_head;
	movq	%rbx, (%rsi)	 ; node, file_4->dirs
 ; D:/TC/src/file.c:275:     if (dirs_tail != NULL) {
	testq	%r15, %r15	 ; node
	je	.L53	 ;,
 ; D:/TC/src/file.c:276:         string dot = strrchr(dirs_tail->dir, '.');
	movq	(%r15), %r15	 ; dirs_tail_28->dir, node
 ; D:/TC/src/file.c:276:         string dot = strrchr(dirs_tail->dir, '.');
	movl	$46, %edx	 ;,
	movq	%r15, %rcx	 ; node,
	call	strrchr	 ;
	movq	%rax, %rdi	 ; tmp222, dot
 ; D:/TC/src/file.c:278:         if (dot != NULL && dot != dirs_tail->dir) {
	cmpq	%rax, %r15	 ; dot, node
	je	.L53	 ;,
	testq	%rax, %rax	 ; dot
	je	.L53	 ;,
 ; D:/TC/src/file.c:280:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	%rax, %rdx	 ; dot, name_len
 ; D:/TC/src/file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%r15, %rcx	 ; node,
 ; D:/TC/src/file.c:280:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	subq	%r15, %rdx	 ; node, name_len
 ; D:/TC/src/file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	call	create_string	 ;
 ; D:/TC/src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%rdi, %rcx	 ; dot,
 ; D:/TC/src/file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%rax, 16(%rsi)	 ; tmp223, file_4->name
 ; D:/TC/src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	call	strlen	 ;
 ; D:/TC/src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%rdi, %rcx	 ; dot,
 ; D:/TC/src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%rax, %rdx	 ; tmp224, tmp178
 ; D:/TC/src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	call	create_string	 ;
 ; D:/TC/src/file.c:278:         if (dot != NULL && dot != dirs_tail->dir) {
	jmp	.L54	 ;
.L53:
 ; D:/TC/src/file.c:285:             file->name = dirs_tail->dir;
	movq	%r15, 16(%rsi)	 ; node, file_4->name
	xorl	%eax, %eax	 ; _73
.L54:
 ; D:/TC/src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%rax, 8(%rsi)	 ; _73, file_4->extension
 ; D:/TC/src/file.c:295:     StrNode* current = dirs_head;
	movq	%rbx, %r12	 ; node, current
 ; D:/TC/src/file.c:296:     size_t node_count = 0;
	xorl	%ebp, %ebp	 ; node_count
 ; D:/TC/src/file.c:294:     size_t full_path_len = 0;
	xorl	%edi, %edi	 ; full_path_len
.L55:
 ; D:/TC/src/file.c:298:     while (current != NULL) {
	testq	%r12, %r12	 ; current
	je	.L97	 ;,
 ; D:/TC/src/file.c:299:         full_path_len += strlen(current->dir);
	movq	(%r12), %rcx	 ; current_56->dir,
 ; D:/TC/src/file.c:300:         node_count++;
	incq	%rbp	 ; node_count
 ; D:/TC/src/file.c:299:         full_path_len += strlen(current->dir);
	call	strlen	 ;
 ; D:/TC/src/file.c:301:         current = current->next;
	movq	8(%r12), %r12	 ; current_56->next, current
 ; D:/TC/src/file.c:299:         full_path_len += strlen(current->dir);
	addq	%rax, %rdi	 ; tmp226, full_path_len
	jmp	.L55	 ;
.L97:
 ; D:/TC/src/file.c:305:     if (node_count > 1)
	cmpq	$1, %rbp	 ;, node_count
	jbe	.L57	 ;,
 ; D:/TC/src/file.c:306:         full_path_len += (node_count - 1);
	leaq	-1(%rdi,%rbp), %rdi	 ;, full_path_len
.L57:
 ; D:/TC/src/file.c:308:     string full_path = create_string_not_check("", full_path_len + 1);
	leaq	1(%rdi), %rdx	 ;, tmp183
	leaq	.LC0(%rip), %rcx	 ;,
	call	create_string_not_check	 ;
 ; D:/TC/src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	leaq	.LC2(%rip), %rbp	 ;, tmp201
 ; D:/TC/src/file.c:309:     full_path[0] = '\0';
	movb	$0, (%rax)	 ;, *full_path_70
 ; D:/TC/src/file.c:308:     string full_path = create_string_not_check("", full_path_len + 1);
	movq	%rax, %rdi	 ; tmp227, full_path
 ; D:/TC/src/file.c:312:     bool is_first = true;
	movb	$1, %al	 ;, is_first
.L58:
 ; D:/TC/src/file.c:313:     while (current != NULL) {
	testq	%rbx, %rbx	 ; node
	je	.L98	 ;,
 ; D:/TC/src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testb	%al, %al	 ; is_first
	jne	.L59	 ;,
 ; D:/TC/src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	(%rbx), %rcx	 ; current_72->dir,
	movq	%rbp, %rdx	 ; tmp201,
	call	strcmp	 ;
 ; D:/TC/src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testl	%eax, %eax	 ; tmp228
	je	.L59	 ;,
 ; D:/TC/src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$0, (%rdi)	 ;, MEM[(const char *)full_path_70]
	je	.L59	 ;,
 ; D:/TC/src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	movq	%rdi, %rcx	 ; full_path,
	call	strlen	 ;
 ; D:/TC/src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$47, -1(%rdi,%rax)	 ;, *_78
	je	.L59	 ;,
 ; D:/TC/src/file.c:317:                 strcat(full_path, "/");
	movq	%rbp, %rdx	 ; tmp201,
	movq	%rdi, %rcx	 ; full_path,
	call	strcat	 ;
.L59:
 ; D:/TC/src/file.c:320:         strcat(full_path, current->dir);
	movq	(%rbx), %rdx	 ; current_72->dir,
	movq	%rdi, %rcx	 ; full_path,
	call	strcat	 ;
 ; D:/TC/src/file.c:322:         current = current->next;
	movq	8(%rbx), %rbx	 ; current_72->next, node
 ; D:/TC/src/file.c:321:         is_first = false;
	xorl	%eax, %eax	 ; is_first
	jmp	.L58	 ;
.L98:
 ; D:/TC/src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%rdi, %rcx	 ; full_path,
	call	strlen	 ;
 ; D:/TC/src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%rdi, %rcx	 ; full_path,
 ; D:/TC/src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, %rdx	 ; tmp230, tmp193
 ; D:/TC/src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	call	create_string	 ;
 ; D:/TC/src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, 24(%rsi)	 ; tmp231, file_4->path
 ; D:/TC/src/file.c:20: }
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
	.globl	get_file_name
	.def	get_file_name;	.scl	2;	.type	32;	.endef
get_file_name:
 ; D:/TC/src/file.c:68:     return path->name;
	movq	16(%rcx), %rax	 ; path_2(D)->name, path_2(D)->name
 ; D:/TC/src/file.c:69: }
	ret	
	.globl	get_file_extension
	.def	get_file_extension;	.scl	2;	.type	32;	.endef
get_file_extension:
 ; D:/TC/src/file.c:72:     return path->extension;
	movq	8(%rcx), %rax	 ; path_2(D)->extension, path_2(D)->extension
 ; D:/TC/src/file.c:73: }
	ret	
	.globl	get_file_dir
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
get_file_dir:
 ; D:/TC/src/file.c:76:     if (path->dirs == NULL) return 0;
	movq	(%rcx), %rax	 ; path_31(D)->dirs, <retval>
 ; D:/TC/src/file.c:76:     if (path->dirs == NULL) return 0;
	testq	%rax, %rax	 ; <retval>
	je	.L122	 ;,
 ; D:/TC/src/file.c:75: string get_file_dir(File* path) {
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp124, path
	pushq	%rsi	 ;
 ; D:/TC/src/file.c:80:     size_t node_count = 0;
	xorl	%esi, %esi	 ; node_count
 ; D:/TC/src/file.c:75: string get_file_dir(File* path) {
	pushq	%rbx	 ;
 ; D:/TC/src/file.c:79:     size_t total_len = 0;
	xorl	%ebx, %ebx	 ; total_len
 ; D:/TC/src/file.c:75: string get_file_dir(File* path) {
	subq	$40, %rsp	 ;,
.L104:
 ; D:/TC/src/file.c:83:         if (current->next != NULL) {  // Not the last element (which is the filename)
	movq	8(%rax), %rbp	 ; current_53->next, _2
 ; D:/TC/src/file.c:83:         if (current->next != NULL) {  // Not the last element (which is the filename)
	testq	%rbp, %rbp	 ; _2
	je	.L103	 ;,
 ; D:/TC/src/file.c:84:             size_t dir_len = strlen(current->dir);
	movq	(%rax), %rcx	 ; current_53->dir,
 ; D:/TC/src/file.c:86:             node_count++;
	incq	%rsi	 ; node_count
 ; D:/TC/src/file.c:84:             size_t dir_len = strlen(current->dir);
	call	strlen	 ;
 ; D:/TC/src/file.c:85:             total_len += dir_len;
	addq	%rax, %rbx	 ; tmp125, total_len
 ; D:/TC/src/file.c:86:             node_count++;
	movq	%rbp, %rax	 ; _2, <retval>
	jmp	.L104	 ;
.L103:
 ; D:/TC/src/file.c:91:     if (node_count == 0) return NULL;
	testq	%rsi, %rsi	 ; node_count
	je	.L101	 ;,
 ; D:/TC/src/file.c:94:     if (node_count > 1)
	cmpq	$1, %rsi	 ;, node_count
	je	.L105	 ;,
 ; D:/TC/src/file.c:95:         total_len += node_count - 1;
	leaq	-1(%rbx,%rsi), %rbx	 ;, total_len
.L105:
 ; D:/TC/src/file.c:98:     string dir_path = create_string_not_check("", total_len + 1);
	leaq	1(%rbx), %rdx	 ;, tmp107
	leaq	.LC0(%rip), %rcx	 ;, tmp108
	call	create_string_not_check	 ;
 ; D:/TC/src/file.c:99:     dir_path[0] = '\0';
	movb	$0, (%rax)	 ;, *dir_path_36
 ; D:/TC/src/file.c:98:     string dir_path = create_string_not_check("", total_len + 1);
	movq	%rax, %rbx	 ; tmp126, dir_path
 ; D:/TC/src/file.c:101:     current = path->dirs;
	movq	(%rdi), %rsi	 ; path_31(D)->dirs, current
 ; D:/TC/src/file.c:102:     bool first = true;
	movb	$1, %al	 ;, first
 ; D:/TC/src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	leaq	.LC2(%rip), %rdi	 ;, tmp123
.L106:
 ; D:/TC/src/file.c:103:     while (current != NULL) {
	testq	%rsi, %rsi	 ; current
	je	.L125	 ;,
 ; D:/TC/src/file.c:104:         if (current->next != NULL) {  // Not the last element
	cmpq	$0, 8(%rsi)	 ;, current_22->next
	je	.L107	 ;,
 ; D:/TC/src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	testb	%al, %al	 ; first
	jne	.L108	 ;,
 ; D:/TC/src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	movq	(%rsi), %rcx	 ; current_22->dir,
	movq	%rdi, %rdx	 ; tmp123,
	call	strcmp	 ;
 ; D:/TC/src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	testl	%eax, %eax	 ; tmp127
	je	.L108	 ;,
 ; D:/TC/src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$0, (%rbx)	 ;, MEM[(const char *)dir_path_36]
	je	.L108	 ;,
 ; D:/TC/src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	movq	%rbx, %rcx	 ; dir_path,
	call	strlen	 ;
 ; D:/TC/src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$47, -1(%rbx,%rax)	 ;, *_12
	je	.L108	 ;,
 ; D:/TC/src/file.c:108:                     strcat(dir_path, "/");
	movq	%rdi, %rdx	 ; tmp123,
	movq	%rbx, %rcx	 ; dir_path,
	call	strcat	 ;
.L108:
 ; D:/TC/src/file.c:110:             strcat(dir_path, current->dir);
	movq	(%rsi), %rdx	 ; current_22->dir,
	movq	%rbx, %rcx	 ; dir_path,
	call	strcat	 ;
 ; D:/TC/src/file.c:111:             first = false;
	xorl	%eax, %eax	 ; first
.L107:
 ; D:/TC/src/file.c:113:         current = current->next;
	movq	8(%rsi), %rsi	 ; current_22->next, current
	jmp	.L106	 ;
.L125:
 ; D:/TC/src/file.c:116:     return create_string(dir_path, strlen(dir_path));
	movq	%rbx, %rcx	 ; dir_path,
	call	strlen	 ;
 ; D:/TC/src/file.c:117: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/file.c:116:     return create_string(dir_path, strlen(dir_path));
	movq	%rbx, %rcx	 ; dir_path,
 ; D:/TC/src/file.c:116:     return create_string(dir_path, strlen(dir_path));
	movq	%rax, %rdx	 ; tmp129, tmp117
 ; D:/TC/src/file.c:117: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:/TC/src/file.c:116:     return create_string(dir_path, strlen(dir_path));
	jmp	create_string	 ;
.L101:
 ; D:/TC/src/file.c:117: }
	addq	$40, %rsp	 ;,
	xorl	%eax, %eax	 ;
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L122:
	xorl	%eax, %eax	 ;
	ret	
	.section .rdata,"dr"
.LC6:
	.ascii "%s/%s%s\0"
.LC7:
	.ascii "%s%s\0"
	.text
	.def	rebuild_full_path;	.scl	3;	.type	32;	.endef
rebuild_full_path:
	pushq	%r14	 ;
	pushq	%r13	 ;
	leaq	.LC0(%rip), %r13	 ;, iftmp.1_14
	pushq	%r12	 ;
 ; D:/TC/src/file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	movq	%r13, %r12	 ; iftmp.1_14, iftmp.1_14
 ; D:/TC/src/file.c:123: static void rebuild_full_path(File* file) {
	pushq	%rbp	 ;
 ; D:/TC/src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	%r13, %rbp	 ; iftmp.1_14, iftmp.2_15
 ; D:/TC/src/file.c:123: static void rebuild_full_path(File* file) {
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp130, file
	subq	$48, %rsp	 ;,
 ; D:/TC/src/file.c:124:     string dir = get_file_dir(file);
	call	get_file_dir	 ;
 ; D:/TC/src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rbx), %r14	 ; file_18(D)->extension, _1
 ; D:/TC/src/file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	 ; dir
 ; D:/TC/src/file.c:124:     string dir = get_file_dir(file);
	movq	%rax, %rdi	 ; tmp131, dir
 ; D:/TC/src/file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	cmovne	%rax, %r12	 ; dir,, iftmp.1_14
 ; D:/TC/src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%r14, %r14	 ; _1
	cmovne	%r14, %rbp	 ; _1,, iftmp.2_15
 ; D:/TC/src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%r12, %rcx	 ; iftmp.1_14,
	call	strlen	 ;
 ; D:/TC/src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rcx	 ; file_18(D)->name, file_18(D)->name
 ; D:/TC/src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%rax, %rsi	 ; tmp132, tmp101
 ; D:/TC/src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	call	strlen	 ;
 ; D:/TC/src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%rsi,%rax), %rsi	 ;, path_len
 ; D:/TC/src/file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	testq	%r14, %r14	 ; _1
	je	.L129	 ;,
 ; D:/TC/src/file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	movq	%rbp, %rcx	 ; iftmp.2_15,
	call	strlen	 ;
 ; D:/TC/src/file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	addq	%rax, %rsi	 ; tmp134, path_len
.L129:
 ; D:/TC/src/file.c:131:     string new_path = create_string_not_check("", path_len + 1);
	leaq	1(%rsi), %rdx	 ;, tmp111
	movq	%r13, %rcx	 ; iftmp.1_14,
	call	create_string_not_check	 ;
 ; D:/TC/src/file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	testq	%rdi, %rdi	 ; dir
	movq	16(%rbx), %r8	 ; file_18(D)->name, file_18(D)->name
 ; D:/TC/src/file.c:131:     string new_path = create_string_not_check("", path_len + 1);
	movq	%rax, %rsi	 ; tmp135, new_path
 ; D:/TC/src/file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	je	.L130	 ;,
 ; D:/TC/src/file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpb	$0, (%r12)	 ;, MEM[(const char *)iftmp.1_14]
	je	.L130	 ;,
 ; D:/TC/src/file.c:133:         sprintf(new_path, "%s/%s%s", dir_cstr, file->name, ext_cstr);
	movq	%rbp, 32(%rsp)	 ; iftmp.2_15,
	movq	%r8, %r9	 ; file_18(D)->name,
	leaq	.LC6(%rip), %rdx	 ;, tmp114
	movq	%r12, %r8	 ; iftmp.1_14,
	movq	%rax, %rcx	 ; new_path,
	call	sprintf	 ;
	jmp	.L131	 ;
.L130:
 ; D:/TC/src/file.c:135:         sprintf(new_path, "%s%s", file->name, ext_cstr);
	movq	%rbp, %r9	 ; iftmp.2_15,
	leaq	.LC7(%rip), %rdx	 ;, tmp116
	movq	%rsi, %rcx	 ; new_path,
	call	sprintf	 ;
.L131:
 ; D:/TC/src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%rsi, %rcx	 ; new_path,
	call	strlen	 ;
 ; D:/TC/src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%rsi, %rcx	 ; new_path,
 ; D:/TC/src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, %rdx	 ; tmp136, tmp118
 ; D:/TC/src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	call	create_string	 ;
 ; D:/TC/src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, 24(%rbx)	 ; tmp137, file_18(D)->path
 ; D:/TC/src/file.c:138: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
	.globl	get_full_path
	.def	get_full_path;	.scl	2;	.type	32;	.endef
get_full_path:
 ; D:/TC/src/file.c:120:     return path->path;
	movq	24(%rcx), %rax	 ; path_2(D)->path, path_2(D)->path
 ; D:/TC/src/file.c:121: }
	ret	
	.globl	change_file_extension
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
change_file_extension:
 ; D:/TC/src/file.c:141:     file->extension = new_extension;
	movq	%rdx, 8(%rcx)	 ; tmp85, file_2(D)->extension
 ; D:/TC/src/file.c:142:     rebuild_full_path(file);
	jmp	rebuild_full_path	 ;
	.globl	change_file_name
	.def	change_file_name;	.scl	2;	.type	32;	.endef
change_file_name:
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp112, new_name
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp111, file
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:/TC/src/file.c:149:     if (file->dirs != NULL) {
	movq	(%rcx), %rax	 ; file_13(D)->dirs, _1
 ; D:/TC/src/file.c:146:     file->name = new_name;
	movq	%rdx, 16(%rcx)	 ; new_name, file_13(D)->name
 ; D:/TC/src/file.c:149:     if (file->dirs != NULL) {
	testq	%rax, %rax	 ; _1
	je	.L145	 ;,
.L144:
	movq	%rax, %rbp	 ; _1, current
 ; D:/TC/src/file.c:153:             if (current->next == NULL) {
	movq	8(%rax), %rax	 ; current_8->next, _1
 ; D:/TC/src/file.c:153:             if (current->next == NULL) {
	testq	%rax, %rax	 ; _1
	jne	.L144	 ;,
 ; D:/TC/src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rsi), %r14	 ; file_13(D)->extension, _3
	leaq	.LC0(%rip), %r13	 ;, iftmp.3_10
 ; D:/TC/src/file.c:156:                 size_t full_name_len = strlen(new_name);
	movq	%rdi, %rcx	 ; new_name,
 ; D:/TC/src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	%r13, %r12	 ; iftmp.3_10, iftmp.3_10
	testq	%r14, %r14	 ; _3
	cmovne	%r14, %r12	 ; _3,, iftmp.3_10
 ; D:/TC/src/file.c:156:                 size_t full_name_len = strlen(new_name);
	call	strlen	 ;
	movq	%rax, %rbx	 ; tmp113, full_name_len
 ; D:/TC/src/file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	testq	%r14, %r14	 ; _3
	je	.L147	 ;,
 ; D:/TC/src/file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	movq	%r12, %rcx	 ; iftmp.3_10,
	call	strlen	 ;
 ; D:/TC/src/file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	addq	%rax, %rbx	 ; tmp114, full_name_len
.L147:
 ; D:/TC/src/file.c:159:                 string full_name = create_string_not_check("", full_name_len + 1);
	leaq	1(%rbx), %rdx	 ;, tmp100
	movq	%r13, %rcx	 ; iftmp.3_10,
	call	create_string_not_check	 ;
 ; D:/TC/src/file.c:160:                 sprintf(full_name, "%s%s", new_name, ext_cstr);
	movq	%r12, %r9	 ; iftmp.3_10,
	movq	%rdi, %r8	 ; new_name,
	leaq	.LC7(%rip), %rdx	 ;, tmp102
 ; D:/TC/src/file.c:159:                 string full_name = create_string_not_check("", full_name_len + 1);
	movq	%rax, %rbx	 ; tmp115, full_name
 ; D:/TC/src/file.c:160:                 sprintf(full_name, "%s%s", new_name, ext_cstr);
	movq	%rax, %rcx	 ; full_name,
	call	sprintf	 ;
 ; D:/TC/src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rbx, %rcx	 ; full_name,
	call	strlen	 ;
 ; D:/TC/src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rbx, %rcx	 ; full_name,
 ; D:/TC/src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rax, %rdx	 ; tmp116, tmp104
 ; D:/TC/src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	call	create_string	 ;
 ; D:/TC/src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rax, 0(%rbp)	 ; tmp117, current_16->dir
.L145:
 ; D:/TC/src/file.c:169: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/file.c:168:     rebuild_full_path(file);
	movq	%rsi, %rcx	 ; file,
 ; D:/TC/src/file.c:169: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:/TC/src/file.c:168:     rebuild_full_path(file);
	jmp	rebuild_full_path	 ;
	.ident	"GCC: (GNU) 13.2.0"
	.def	getcwd;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	to_upper;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
