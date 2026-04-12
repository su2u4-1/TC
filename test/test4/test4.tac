TAC {
    designs: []
    entry_point: main
    global: []
    subroutines: [
        test {
            return_type: void
            parameters: []
            local: []
            instructions: [
                $b0 {
                    ret	void
                }
            ]
        }
        main {
            return_type: int
            parameters: []
            local: [
                int	$v0(a)
                string	$v1(b)
                int	$t0
                void	$t1
                int	$v2(i)
                int	$t2
                int	$t3
                int	$t4
                int	$t5
                int	$t6
            ]
            instructions: [
                $b1 {
                    assign	$v0(a) 10
                    assign	$v1(b) ""
                    eq 	$t0 $v0(a) 10
                    jmp_c	$t0 $b2 $b3
                }
                $b2 {
                    call	$t1 $f0(test) 0
                    jmp	$b4
                }
                $b3 {
                    assign	$v0(a) 0
                    jmp	$b4
                }
                $b4 {
                    assign	$v2(i) 0
                    jmp	$b5
                }
                $b5 {
                    lt 	$t2 $v2(i) 5
                    jmp_c	$t2 $b6 $b7
                }
                $b6 {
                    add	$t3 $v0(a) $v2(i)
                    assign	$v0(a) $t3
                    jmp	$b8
                }
                $b8 {
                    add	$t4 $v2(i) 1
                    assign	$v2(i) $t4
                    jmp	$b5
                }
                $b7 {
                    jmp	$b9
                }
                $b9 {
                    gt 	$t5 $v0(a) 10
                    jmp_c	$t5 $b10 $b11
                }
                $b10 {
                    sub	$t6 $v0(a) 1
                    assign	$v0(a) $t6
                    jmp	$b9
                }
                $b11 {
                    ret	0
                }
            ]
        }
    ]
}

info by lib:
    Platform: 2, Structure Memory Used: 16256/17408 bytes, String Memory Used: 1372/2048 bytes, stringCount: 117, Memory Block Count: 663
