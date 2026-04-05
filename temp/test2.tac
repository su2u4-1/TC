TAC {
    designs: [
        Test2 8 {
            int a0 0
        }
    ]
    entry_point: main
    global: []
    subroutines: [
        Test2.constructor {
            return_type: Test2
            parameters: []
            local: [
                Test2 t0
                int   t1
                Test2 t2
            ]
            instructions: [
                b0 {
                    alloc t0 Test2 4
                    get_attr t1 t0 a0
                    store    t1 5
                    param    8 t0
                    call     t2 Test2.init 1
                    ret      t2
                }
            ]
        }
        Test2.init {
            return_type: Test2
            parameters: [
                Test2 p0
            ]
            local: [
                int t3
            ]
            instructions: [
                b1 {
                    get_attr t3 p0 a0
                    param 8 t3
                    call  void print 1
                    ret   p0
                }
            ]
        }
        Test2.set_x {
            return_type: void
            parameters: [
                Test2 p1
                int   p2
            ]
            local: [
                int t4
            ]
            instructions: [
                b2 {
                    get_attr t4 p1 a0
                    store    t4 p2
                    ret      void
                }
            ]
        }
        Test2.get_x {
            return_type: int
            parameters: [
                Test2 p3
            ]
            local: [
                int t5
            ]
            instructions: [
                b3 {
                    get_attr t5 p3 a0
                    ret      t5
                }
            ]
        }
        main {
            return_type: int
            parameters: []
            local: [
                Test2 v0
                arr   v1
                int   t6
                int   t7
                int   t8
                int   t9
                int   t10
                int   t11
                int   t12
                int   t13
                int   t14
                int   t15
            ]
            instructions: [
                b4 {
                    // var Test2 t = Test2();
                    call  v0 Test2.constructor 0
                    // var arr nums = arr("int", 10);
                    param 1 "int"
                    param 8 10
                    call  v1 arr 2
                    // nums[0] = 42;
                    get_elem t6 v1 0 
                    assign   t6 42
                    // t.set_x(2 + t.get_x() * 10);
                    param 8 v0
                    param 8 v0
                    call  t7 Test2.get_x 1
                    mul   t8 t7 10
                    add   t9 2 t8
                    param 8 t9
                    call  void Test2.set_x 2
                    // print(t.get_x());
                    param 8 v0
                    call  t10 Test2.get_x 1
                    param 8 t10
                    call  void print 1
                    // t.set_x(nums[0] + 10 - 2 * 5);
                    param 8 v0
                    mul   t11 2 5
                    get_elem t12 v1 0
                    add   t13 t12 10
                    sub   t14 t13 t11
                    param 8 t14
                    call  void Test2.set_x 2
                    // print(t.get_x());
                    param 8 v0
                    call  t15 Test2.get_x 1
                    param 8 t15
                    call  void print 1
                    // return 0;
                    ret   0
                }
            ]
        }
    ]
}
