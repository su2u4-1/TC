TAC {
    designs: [
        Test1 16 {
            int	$a0 8
        }
    ]
    entry_point: main
    global: [
        void	$f0
    ]
    subroutines: [
        Test1.init {
            return_type: Test1
            parameters: [
                Test1	$p0
                int	$p1
            ]
            local: [
                int	$t0
            ]
            instructions: [
                $b0 {
                    get_attr	$t0 $p0 $a0
                    store	$t0 $p1
                    ret	$p0
                }
            ]
        }
        Test1.get_a {
            return_type: int
            parameters: [
                Test1	$p2
            ]
            local: [
                int	$t1
            ]
            instructions: [
                $b1 {
                    get_attr	$t1 $p2 $a0
                    ret	$t1
                }
            ]
        }
        Test1.set_a {
            return_type: void
            parameters: [
                Test1	$p3
                int	$p4
            ]
            local: [
                int	$t2
            ]
            instructions: [
                $b2 {
                    get_attr	$t2 $p3 $a0
                    store	$t2 $p4
                    ret	void
                }
            ]
        }
        Test1.$constructor {
            return_type: Test1
            parameters: [
                Test1	$p5
                int	$p6
            ]
            local: [
                Test1	$t3
                Test1	$t4
            ]
            instructions: [
                $b3 {
                    alloc	$t3 8
                    assign	$a0 10
                    param	8 $p5
                    param	8 $p6
                    call	$t4 $f1 2
                    ret	$t4
                }
            ]
        }
        main {
            return_type: int
            parameters: []
            local: [
                Test1	$v0
                int	$t5
                void	$t6
                void	$t7
                int	$t8
                void	$t9
            ]
            instructions: [
                $b4 {
                    call	$t5 $f2 0
                    param	8 $t5
                    call	$t6 $f0 1
                    param	8 20
                    call	$t7 $f3 1
                    call	$t8 $f4 0
                    param	8 $t8
                    call	$t9 $f0 1
                    ret	0
                }
            ]
        }
    ]
}

info by lib:
    Platform: 2, Structure Memory Used: 24248/25600 bytes, String Memory Used: 3682/4096 bytes, stringCount: 162, Memory Block Count: 1000
