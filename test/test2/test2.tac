TAC {
    designs: [
        arr 0 {}
        Test2 8 {
            int	$a0(x) 0
        }
    ]
    entry_point: main
    global: [
        void	$f0(print)
    ]
    subroutines: [
        arr.init {
            return_type: arr
            parameters: [
                arr	$p0(self)
                string	$p1(type_name)
                int	$p2(size)
            ]
            local: []
            instructions: [
                $b0 {
                    ret	$p0(self)
                }
            ]
        }
        arr.$constructor {
            return_type: arr
            parameters: [
                string	$p3(type_name)
                int	$p4(size)
            ]
            local: [
                arr	$v0(self)
                arr	$t0
            ]
            instructions: [
                $b1 {
                    alloc	$v0(self) 0
                    param	0 $v0(self)
                    param	8 $p3(type_name)
                    param	8 $p4(size)
                    call	$t0 $f1(arr.init) 3
                    ret	$t0
                }
            ]
        }
        Test2.init {
            return_type: Test2
            parameters: [
                Test2	$p5(self)
            ]
            local: [
                int	$t1
                int	$t2
                void	$t3
            ]
            instructions: [
                $b2 {
                    get_attr	$t1 $p5(self) $a0(x)
                    load	$t2 $t1
                    param	8 $t2
                    call	$t3 $f0(print) 1
                    ret	$p5(self)
                }
            ]
        }
        Test2.set_x {
            return_type: void
            parameters: [
                Test2	$p6(self)
                int	$p7(value)
            ]
            local: [
                int	$t4
            ]
            instructions: [
                $b3 {
                    get_attr	$t4 $p6(self) $a0(x)
                    store	$t4 $p7(value)
                    ret	void
                }
            ]
        }
        Test2.get_x {
            return_type: int
            parameters: [
                Test2	$p8(self)
            ]
            local: [
                int	$t5
                int	$t6
            ]
            instructions: [
                $b4 {
                    get_attr	$t5 $p8(self) $a0(x)
                    load	$t6 $t5
                    ret	$t6
                }
            ]
        }
        Test2.$constructor {
            return_type: Test2
            parameters: []
            local: [
                Test2	$v1(self)
                int	$t7
                int	$t8
                int	$t9
                int	$t10
                int	$t11
                Test2	$t12
            ]
            instructions: [
                $b5 {
                    alloc	$v1(self) 8
                    div	$t7 8 4
                    mul	$t8 2 3
                    add	$t9 1 $t8
                    sub	$t10 $t9 $t7
                    get_attr	$t11 $v1(self) $a0(x)
                    store	$t11 $t10
                    param	8 $v1(self)
                    call	$t12 $f2(Test2.init) 1
                    ret	$t12
                }
            ]
        }
        main {
            return_type: int
            parameters: []
            local: [
                Test2	$v2(t)
                Test2	$v3(Test2)
                Test2	$t13
                arr	$v4(nums)
                arr	$v5(arr)
                arr	$t14
                int	$t15
                int	$t16
                int	$t17
                int	$t18
                void	$t19
                int	$t20
                void	$t21
                int	$t22
                int	$t23
                int	$t24
                int	$t25
                int	$t26
                void	$t27
                int	$t28
                void	$t29
            ]
            instructions: [
                $b6 {
                    call	$t13 $f3(Test2.$constructor) 0
                    assign	$v2(t) $t13
                    param	8 "int"
                    param	8 10
                    call	$t14 $f4(arr.$constructor) 2
                    assign	$v4(nums) $t14
                    get_elem	$t15 $v4(nums) 0
                    store	$t15 42
                    param	8 $v2(t)
                    call	$t16 $f6(Test2.get_x) 1
                    mul	$t17 $t16 10
                    add	$t18 2 $t17
                    param	8 $v2(t)
                    param	8 $t18
                    call	$t19 $f5(Test2.set_x) 2
                    param	8 $v2(t)
                    call	$t20 $f7(Test2.get_x) 1
                    param	8 $t20
                    call	$t21 $f0(print) 1
                    mul	$t22 2 5
                    get_elem	$t23 $v4(nums) 0
                    load	$t25 $t23
                    add	$t24 $t25 10
                    sub	$t26 $t24 $t22
                    param	8 $v2(t)
                    param	8 $t26
                    call	$t27 $f8(Test2.set_x) 2
                    param	8 $v2(t)
                    call	$t28 $f9(Test2.get_x) 1
                    param	8 $t28
                    call	$t29 $f0(print) 1
                    ret	0
                }
            ]
        }
    ]
}

info by lib:
    Platform: 2, Structure Memory Used: 39312/40960 bytes, String Memory Used: 5090/6144 bytes, stringCount: 208, Memory Block Count: 1655
