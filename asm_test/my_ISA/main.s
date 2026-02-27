str c.str_0: "Usage: %s <filename>\n"

; int main(int argc, char* argv[]) {
f.main:
    ; a0: argc
    ; a1: argv
    ; if (argc < 2) {
    cmps a0 1
    jmp  l.if_end_0 gt
    ; fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
    push g.stderr  ; Since this symbol has not yet been processed, we will temporarily use g. to represent it.
    push c.str_0
    push a1
    call f.fprintf 3
    ; return 1;
    mov  rv 1
    ret
    ; }
l.if_end_0:
    ; string filename = argv[1];
    add  r0 a1 size
    ; parse_file(filename, true, true);
    push r0
    push 1  ; true
    push 1  ; true
    call f.parse_file 3

    ; return 0;
    mov  rv 0
    ret
; }
