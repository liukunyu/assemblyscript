(module
 (type $iii (func (param i32 i32) (result i32)))
 (type $v (func))
 (global $export/a i32 (i32.const 1))
 (global $export/b i32 (i32.const 2))
 (global $export/c i32 (i32.const 3))
 (global $HEAP_BASE i32 (i32.const 4))
 (memory $0 1)
 (export "memory" (memory $0))
 (start $start)
 (func $export/add (; 0 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  ;;@ export.ts:2:13
  (return
   ;;@ export.ts:2:9
   (i32.add
    (get_local $0)
    ;;@ export.ts:2:13
    (get_local $1)
   )
  )
 )
 (func $export/sub (; 1 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  ;;@ export.ts:6:13
  (return
   ;;@ export.ts:6:9
   (i32.sub
    (get_local $0)
    ;;@ export.ts:6:13
    (get_local $1)
   )
  )
 )
 (func $export/mul (; 2 ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  ;;@ export.ts:12:13
  (return
   ;;@ export.ts:12:9
   (i32.mul
    (get_local $0)
    ;;@ export.ts:12:13
    (get_local $1)
   )
  )
 )
 (func $export/ns.two (; 3 ;) (type $v)
 )
 (func $start (; 4 ;) (type $v)
  ;;@ import.ts:11:0
  (drop
   (i32.add
    (i32.add
     (call $export/add
      ;;@ import.ts:11:4
      (i32.const 1)
      ;;@ import.ts:11:7
      (i32.const 2)
     )
     ;;@ import.ts:11:12
     (call $export/sub
      ;;@ import.ts:11:16
      (i32.const 2)
      ;;@ import.ts:11:19
      (i32.const 3)
     )
    )
    ;;@ import.ts:11:24
    (call $export/mul
     ;;@ import.ts:11:28
     (i32.const 3)
     ;;@ import.ts:11:31
     (i32.const 1)
    )
   )
  )
  ;;@ import.ts:13:11
  (call $export/ns.two)
 )
)
(;
[program.elements]
  GLOBAL: NaN
  GLOBAL: Infinity
  FUNCTION_PROTOTYPE: isNaN
  FUNCTION_PROTOTYPE: isFinite
  FUNCTION_PROTOTYPE: clz
  FUNCTION_PROTOTYPE: ctz
  FUNCTION_PROTOTYPE: popcnt
  FUNCTION_PROTOTYPE: rotl
  FUNCTION_PROTOTYPE: rotr
  FUNCTION_PROTOTYPE: abs
  FUNCTION_PROTOTYPE: max
  FUNCTION_PROTOTYPE: min
  FUNCTION_PROTOTYPE: ceil
  FUNCTION_PROTOTYPE: floor
  FUNCTION_PROTOTYPE: copysign
  FUNCTION_PROTOTYPE: nearest
  FUNCTION_PROTOTYPE: reinterpret
  FUNCTION_PROTOTYPE: sqrt
  FUNCTION_PROTOTYPE: trunc
  FUNCTION_PROTOTYPE: load
  FUNCTION_PROTOTYPE: store
  FUNCTION_PROTOTYPE: sizeof
  FUNCTION_PROTOTYPE: select
  FUNCTION_PROTOTYPE: unreachable
  FUNCTION_PROTOTYPE: current_memory
  FUNCTION_PROTOTYPE: grow_memory
  FUNCTION_PROTOTYPE: changetype
  FUNCTION_PROTOTYPE: assert
  FUNCTION_PROTOTYPE: abort
  FUNCTION_PROTOTYPE: i8
  FUNCTION_PROTOTYPE: i16
  FUNCTION_PROTOTYPE: i32
  FUNCTION_PROTOTYPE: i64
  FUNCTION_PROTOTYPE: u8
  FUNCTION_PROTOTYPE: u16
  FUNCTION_PROTOTYPE: u32
  FUNCTION_PROTOTYPE: u64
  FUNCTION_PROTOTYPE: bool
  FUNCTION_PROTOTYPE: f32
  FUNCTION_PROTOTYPE: f64
  FUNCTION_PROTOTYPE: isize
  FUNCTION_PROTOTYPE: usize
  GLOBAL: HEAP_BASE
  FUNCTION_PROTOTYPE: export/add
  FUNCTION_PROTOTYPE: export/sub
  FUNCTION_PROTOTYPE: export/mul
  GLOBAL: export/a
  GLOBAL: export/b
  GLOBAL: export/c
  NAMESPACE: export/ns
  FUNCTION_PROTOTYPE: export/ns.one
  FUNCTION_PROTOTYPE: export/ns.two
  FUNCTION_PROTOTYPE: import/add
  FUNCTION_PROTOTYPE: import/sub
  FUNCTION_PROTOTYPE: import/mul
  GLOBAL: import/a
  GLOBAL: import/b
  GLOBAL: import/c
  NAMESPACE: import/renamed_ns
[program.exports]
  FUNCTION_PROTOTYPE: export/add
  FUNCTION_PROTOTYPE: export/sub
  FUNCTION_PROTOTYPE: export/renamed_mul
  GLOBAL: export/a
  GLOBAL: export/b
  GLOBAL: export/renamed_c
  NAMESPACE: export/ns
;)
