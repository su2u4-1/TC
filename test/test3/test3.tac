TAC {
    designs: [
        Test1 8 {
            int	$a0(a) 0
        }
        arr 0 {}
        Test2 8 {
            int	$a1(x) 0
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
        arr.init {
            return_type: arr
            parameters: [
                arr	$p6(self)
                string	$p7(type_name)
                int	$p8(size)
            ]
            local: []
            instructions: [
                $b4 {
                    ret	$p6(self)
                }
            ]
        }
        arr.$constructor {
            return_type: arr
            parameters: [
                string	$p9(type_name)
                int	$p10(size)
            ]
            local: [
                arr	$v1(self)
                arr	$t6
            ]
            instructions: [
                $b5 {
                    alloc	$v1(self) 0
                    param	0 $v1(self)
                    param	8 $p9(type_name)
                    param	8 $p10(size)
                    call	$t6 $f2(arr.init) 3
                    ret	$t6
                }
            ]
        }
        Test2.init {
            return_type: Test2
            parameters: [
                Test2	$p11(self)
            ]
            local: [
                int	$t7
                int	$t8
                void	$t9
            ]
            instructions: [
                $b6 {
                    get_attr	$t7 $p11(self) $a1(x)
                    load	$t8 $t7
                    param	8 $t8
                    call	$t9 $f0(print) 1
                    ret	$p11(self)
                }
            ]
        }
        Test2.set_x {
            return_type: void
            parameters: [
                Test2	$p12(self)
                int	$p13(value)
            ]
            local: [
                int	$t10
            ]
            instructions: [
                $b7 {
                    get_attr	$t10 $p12(self) $a1(x)
                    store	$t10 $p13(value)
                    ret	void
                }
            ]
        }
        Test2.get_x {
            return_type: int
            parameters: [
                Test2	$p14(self)
            ]
            local: [
                int	$t11
                int	$t12
            ]
            instructions: [
                $b8 {
                    get_attr	$t11 $p14(self) $a1(x)
                    load	$t12 $t11
                    ret	$t12
                }
            ]
        }
        Test2.$constructor {
            return_type: Test2
            parameters: []
            local: [
                Test2	$v2(self)
                int	$t13
                int	$t14
                int	$t15
                int	$t16
                int	$t17
                Test2	$t18
            ]
            instructions: [
                $b9 {
                    alloc	$v2(self) 8
                    div	$t13 8 4
                    mul	$t14 2 3
                    add	$t15 1 $t14
                    sub	$t16 $t15 $t13
                    get_attr	$t17 $v2(self) $a1(x)
                    store	$t17 $t16
                    param	8 $v2(self)
                    call	$t18 $f3(Test2.init) 1
                    ret	$t18
                }
            ]
        }
        main {
            return_type: int
            parameters: []
            local: [
                Test1	$v3(t)
                Test1	$v4(Test1)
                Test1	$t19
                int	$t20
                void	$t21
                void	$t22
                int	$t23
                void	$t24
                float	$v5(_abc123)
                int	$v6(_def456)
                Test2	$v7(t2)
                Test2	$v8(Test2)
                Test2	$t25
                arr	$v9(nums)
                arr	$v10(arr)
                arr	$t26
                int	$t27
                int	$t28
                int	$t29
                int	$t30
                void	$t31
                int	$t32
                void	$t33
                int	$t34
                int	$t35
                int	$t36
                int	$t37
                int	$t38
                void	$t39
                int	$t40
                void	$t41
            ]
            instructions: [
                $b10 {
                    param	8 5
                    call	$t19 $f4(Test1.$constructor) 1
                    assign	$v3(t) $t19
                    param	8 $v3(t)
                    call	$t20 $f5(Test1.get_a) 1
                    param	8 $t20
                    call	$t21 $f0(print) 1
                    param	8 $v3(t)
                    param	8 20
                    call	$t22 $f6(Test1.set_a) 2
                    param	8 $v3(t)
                    call	$t23 $f7(Test1.get_a) 1
                    param	8 $t23
                    call	$t24 $f0(print) 1
                    assign	$v5(_abc123) 30.500000
                    assign	$v6(_def456) 15
                    call	$t25 $f8(Test2.$constructor) 0
                    assign	$v7(t2) $t25
                    param	8 "int"
                    param	8 10
                    call	$t26 $f9(arr.$constructor) 2
                    assign	$v9(nums) $t26
                    get_elem	$t27 $v9(nums) 0
                    store	$t27 42
                    param	8 $v7(t2)
                    call	$t28 $f11(Test2.get_x) 1
                    mul	$t29 $t28 10
                    add	$t30 2 $t29
                    param	8 $v7(t2)
                    param	8 $t30
                    call	$t31 $f10(Test2.set_x) 2
                    param	8 $v7(t2)
                    call	$t32 $f12(Test2.get_x) 1
                    param	8 $t32
                    call	$t33 $f0(print) 1
                    mul	$t34 2 5
                    get_elem	$t35 $v9(nums) 0
                    load	$t37 $t35
                    add	$t36 $t37 10
                    sub	$t38 $t36 $t34
                    param	8 $v7(t2)
                    param	8 $t38
                    call	$t39 $f13(Test2.set_x) 2
                    param	8 $v7(t2)
                    call	$t40 $f14(Test2.get_x) 1
                    param	8 $t40
                    call	$t41 $f0(print) 1
                    ret	0
                }
            ]
        }
    ]
}

info by lib:
    Platform: 2, Structure Memory Used: 59472/60416 bytes, String Memory Used: 3551/4269 bytes, stringCount: 252, Memory Block Count: 2508
