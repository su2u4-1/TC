# Instruction Set Architecture
## Overview
```bnf
code ::= [ "gc:" { global_constant } ] [ "fun:" { subroutine } ] [ "ins:" { instruction } ]
global_constant ::= constant

subroutine ::= subroutine_name ":" number_of_parameters [ "lc:" { local_constant } ] [ "ins:" { instruction } ]
subroutine_name ::= identifier
number_of_parameters ::= number
local_constant ::= constant

constant ::= label_name ":" size constant_value
label_name ::= identifier
size ::= number
constant_value ::= number | string

instruction ::= [ label ":" ] opcode [ operand ] [ operand ] [ operand ]
label ::= identifier
opcode ::= identifier
operand ::= identifier | number | register | memory_address
memory_address ::= "[" register | number "]"

identifier ::= letter { letter | digit | "_" }
number ::= digit { digit }
string ::= '"' { any_character_except_quote } '"'

opcode ::= "ret" | "call" | "mov" | "add" | "sub" | "mul" | "div" | "mod" | "jmp" | "cmp" | "push" | "pop" | "and" | "or" | "xor" | "not" | "shl" | "shr"
register ::= normal_register | special_register
normal_register ::= "r0" | "r1" | "r2" | "r3" | "r4" | "r5" | "r6" | "r7" | "r8" | "r9" | "r10" | "r11" | "r12" | "r13" | "r14" | "r15"
special_register ::= "sp" | "f0" | "f1" | "f2" | "ip" | "rv"
```
## Instructions
`ret value`: return value from subroutine  
`call subroutine_name`: subroutine()  
`mov source destination`: destination = source  
`add source_a source_b destination`: destination = source_a + source_b  
`sub source_a source_b destination`: destination = source_a - source_b  
`mul source_a source_b destination`: destination = source_a * source_b  
`div source_a source_b destination`: destination = source_a / source_b  
`mod source_a source_b destination`: destination = source_a % source_b  
`and source_a source_b destination`: destination = source_a & source_b  
`or source_a source_b destination`: destination = source_a | source_b
`xor source_a source_b destination`: destination = source_a ^ source_b
`not source destination`: destination = ~source
`shl source_a source_b destination`: destination = source_a << source_b
`shr source_a source_b destination`: destination = source_a >> source_b
`jmp mode label`: if (flags == mode) jump to label
> f0: <, f1: =, f2: >
> flags = f0 + f1 * 2 + f2 * 4
> 0: Never, 1: <, 2: =, 3: <=, 4: >, 5: !=, 6: >=, 7: Always
`cmp source_a source_b`: flags = compare(source_a, source_b)
`push source`: push source onto the stack
`pop destination`: pop from the stack into destination
## Frame Layout
```
|     Old Frame     | <- low position
|-------------------|
| r0(callee-saved)  |
|-------------------|
|      ......       |
|-------------------|
| r15(callee-saved) |
|-------------------|
|   Return Address  |
|-------------------|
|     Argument 0    | ┐
|-------------------| │
|      ......       | │ n arguments
|-------------------| │
|    Argument n-1   | ┘
|-------------------|
|    Local var 0    | ┐ <- Stack Pointer
|-------------------| │
|      ......       | │ m local variables
|-------------------| │
|   Local var m-1   | ┘
|-------------------|
|  Other Stack Data | <- high position
```
## Calling Convention
- Arguments are passed on the stack, with the first argument at the lowest address.
- The caller is responsible for pushing the arguments onto the stack before calling the subroutine.
- The callee is responsible for cleaning up the stack after returning.
- The return address is stored on the stack, and the `ret` instruction will pop it back into the instruction pointer (ip).
- The return value is saved in a register `rv`.
- The caller should save any caller-saved registers before calling a subroutine and restore them afterward.
## Other
- if use like `[r0]` it means the value at the address stored in r0.
- if use like `[S0]` it means the value at the address of global constant S0.
- if use like `[LC0]` it means the value at the address of local constant LC0.
## Example
```c
int foo(int x) {
    if (x < 100) {
        return 0;
    } else {
        return 1;
    }
}

int a = 42;

int main(void) {
    int var = 10;
    if (foo(a + var) == 0) {
        printf("Hello, world!\n");
        return 0;
    } else {
        printf("Error\n");
        return 1;
    }
}
```
```asm
gc:
    S0: 15 "Hello, world!\n"
    S1: 7  "Error\n"
    GC0: 4 42          ; global int a

fun:
    foo: 1
        lc:
            LC0: 4 100
        ins:
            ; get argument x
            sub sp 4 r1            ; r1 = sp - 4 (address of x)
            mov [r1] r0            ; r0 = x

            cmp r0 LC0             ; compare x, 100
            jmp 1 L0               ; flags == 1 (<)

            ; else branch
            ret 1

        L0:
            ret 0

    main: 0
        lc:
            LC1: 4 10              ; int var = 10
        ins:
            ; calculate a + var
            add GC0 LC1 r0         ; r0 = a + var

            ; call foo(a + var)
            push r0
            call foo
            mov rv r1              ; r1 = return value

            cmp r1 0
            jmp 2 L1               ; flags == 2 (=)

            ; else branch
            push S1
            call printf
            ret 1

        L1:
            push S0
            call printf
            ret 0

ins:
    call main
    ret rv
```
`ret value`: ```
mov value rv
sub sp 4 sp
sub sp number_of_parameters*4 sp
mov [sp] is
```
