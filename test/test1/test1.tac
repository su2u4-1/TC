TAC {
    designs: [
        Test1 8 {
            int	$a0(a) 0
        }
    ]
    entry_point: main
    global: [
        void	$f0(print)
    ]
    subroutines: [
        Test1.init {
            return_type: Test1
            parameters: [
                Test1	$p0(self)
                int	$p1(value)
            ]
            local: [
                int	$t0
            ]
            instructions: [
                $b0 {
                    get_attr	$t0 $p0(self) $a0(a)
                    store	$t0 $p1(value)
                    ret	$p0(self)
                }
            ]
        }
        Test1.get_a {
            return_type: int
            parameters: [
                Test1	$p2(self)
            ]
            local: [
                int	$t1
                int	$t2
            ]
            instructions: [
                $b1 {
                    get_attr	$t1 $p2(self) $a0(a)
                    load	$t2 $t1
                    ret	$t2
                }
            ]
        }
        Test1.set_a {
            return_type: void
            parameters: [
                Test1	$p3(self)
                int	$p4(value)
            ]
            local: [
                int	$t3
            ]
            instructions: [
                $b2 {
                    get_attr	$t3 $p3(self) $a0(a)
                    store	$t3 $p4(value)
                    ret	void
                }
            ]
        }
        Test1.$constructor {
            return_type: Test1
            parameters: [
                int	$p5(value)
            ]
            local: [
                Test1	$v0(self)
                int	$t4
                Test1	$t5
            ]
            instructions: [
                $b3 {
                    alloc	$v0(self) 8
                    get_attr	$t4 $v0(self) $a0(a)
                    store	$t4 10
                    param	8 $v0(self)
                    param	8 $p5(value)
                    call	$t5 $f1(Test1.init) 2
                    ret	$t5
                }
            ]
        }
        main {
            return_type: int
            parameters: []
            local: [
                Test1	$v1(t)
                Test1	$v2(Test1)
                Test1	$t6
                int	$t7
                void	$t8
                void	$t9
                int	$t10
                void	$t11
                float	$v3(_abc123)
                int	$v4(_def456)
            ]
            instructions: [
                $b4 {
                    param	8 5
                    call	$t6 $f2(Test1.$constructor) 1
                    assign	$v1(t) $t6
                    param	8 $v1(t)
                    call	$t7 $f3(Test1.get_a) 1
                    param	8 $t7
                    call	$t8 $f0(print) 1
                    param	8 $v1(t)
                    param	8 20
                    call	$t9 $f4(Test1.set_a) 2
                    param	8 $v1(t)
                    call	$t10 $f5(Test1.get_a) 1
                    param	8 $t10
                    call	$t11 $f0(print) 1
                    assign	$v3(_abc123) 30.500000
                    assign	$v4(_def456) 15
                    ret	0
                }
            ]
        }
    ]
}

info by lib:
    Platform: 2, Structure Memory Used: 26456/27648 bytes, String Memory Used: 2175/3072 bytes, stringCount: 156, Memory Block Count: 1112
