(module
 (type $FFF (func (param f64 f64) (result f64)))
 (type $fff (func (param f32 f32) (result f32)))
 (type $v (func))
 (memory $0 1)
 (export "fmod" (func $fmod/fmod))
 (export "fmodf" (func $fmod/fmodf))
 (export "memory" (memory $0))
 (start $start)
 (func $fmod/fmod (; 0 ;) (type $FFF) (param $0 f64) (param $1 f64) (result f64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 f64)
  (block $folding-inner0
   ;;@ fmod.ts:5:2
   (set_local $3
    ;;@ fmod.ts:5:11
    (i32.wrap/i64
     ;;@ fmod.ts:5:17
     (i64.and
      (i64.shr_u
       ;;@ fmod.ts:3:2
       (tee_local $2
        ;;@ fmod.ts:3:11
        (i64.reinterpret/f64
         ;;@ fmod.ts:3:28
         (get_local $0)
        )
       )
       ;;@ fmod.ts:5:23
       (i64.const 52)
      )
      ;;@ fmod.ts:5:28
      (i64.const 2047)
     )
    )
   )
   ;;@ fmod.ts:6:2
   (set_local $6
    ;;@ fmod.ts:6:11
    (i32.wrap/i64
     ;;@ fmod.ts:6:17
     (i64.and
      (i64.shr_u
       ;;@ fmod.ts:4:2
       (tee_local $5
        ;;@ fmod.ts:4:11
        (i64.reinterpret/f64
         ;;@ fmod.ts:4:28
         (get_local $1)
        )
       )
       ;;@ fmod.ts:6:23
       (i64.const 52)
      )
      ;;@ fmod.ts:6:28
      (i64.const 2047)
     )
    )
   )
   ;;@ fmod.ts:9:2
   (if
    ;;@ fmod.ts:9:6
    (i32.and
     (if (result i32)
      (tee_local $7
       (i32.and
        (if (result i32)
         (tee_local $7
          (i64.eq
           (i64.shl
            (get_local $5)
            ;;@ fmod.ts:9:12
            (i64.const 1)
           )
           ;;@ fmod.ts:9:17
           (i64.const 0)
          )
         )
         (get_local $7)
         ;;@ fmod.ts:9:22
         (f64.ne
          (tee_local $8
           ;;@ fmod.ts:9:33
           (get_local $1)
          )
          (get_local $8)
         )
        )
        (i32.const 1)
       )
      )
      (get_local $7)
      ;;@ fmod.ts:9:39
      (i32.eq
       (get_local $3)
       ;;@ fmod.ts:9:45
       (i32.const 2047)
      )
     )
     (i32.const 1)
    )
    ;;@ fmod.ts:10:27
    (return
     ;;@ fmod.ts:10:11
     (f64.div
      (f64.mul
       ;;@ fmod.ts:10:12
       (get_local $0)
       ;;@ fmod.ts:10:16
       (get_local $1)
      )
      ;;@ fmod.ts:10:21
      (f64.mul
       ;;@ fmod.ts:10:22
       (get_local $0)
       ;;@ fmod.ts:10:26
       (get_local $1)
      )
     )
    )
   )
   ;;@ fmod.ts:11:2
   (if
    ;;@ fmod.ts:11:6
    (i64.le_u
     (i64.shl
      (get_local $2)
      ;;@ fmod.ts:11:12
      (i64.const 1)
     )
     ;;@ fmod.ts:11:17
     (i64.shl
      (get_local $5)
      ;;@ fmod.ts:11:23
      (i64.const 1)
     )
    )
    ;;@ fmod.ts:11:26
    (block
     (br_if $folding-inner0
      ;;@ fmod.ts:12:8
      (i64.eq
       (i64.shl
        (get_local $2)
        ;;@ fmod.ts:12:14
        (i64.const 1)
       )
       ;;@ fmod.ts:12:19
       (i64.shl
        (get_local $5)
        ;;@ fmod.ts:12:25
        (i64.const 1)
       )
      )
     )
     ;;@ fmod.ts:14:11
     (return
      (get_local $0)
     )
    )
   )
   ;;@ fmod.ts:7:2
   (set_local $7
    ;;@ fmod.ts:7:11
    (i32.wrap/i64
     ;;@ fmod.ts:7:17
     (i64.shr_u
      (get_local $2)
      ;;@ fmod.ts:7:23
      (i64.const 63)
     )
    )
   )
   (set_local $2
    ;;@ fmod.ts:18:2
    (if (result i64)
     ;;@ fmod.ts:18:7
     (get_local $3)
     (i64.or
      (i64.and
       ;;@ fmod.ts:23:4
       (get_local $2)
       (i64.const 4503599627370495)
      )
      (i64.const 4503599627370496)
     )
     ;;@ fmod.ts:18:11
     (block (result i64)
      ;;@ fmod.ts:19:9
      (set_local $4
       ;;@ fmod.ts:19:17
       (i64.shl
        (get_local $2)
        ;;@ fmod.ts:19:23
        (i64.const 12)
       )
      )
      (loop $continue|0
       (if
        ;;@ fmod.ts:19:27
        (i64.eqz
         ;;@ fmod.ts:19:28
         (i64.shr_u
          ;;@ fmod.ts:19:29
          (get_local $4)
          ;;@ fmod.ts:19:34
          (i64.const 63)
         )
        )
        (block
         ;;@ fmod.ts:20:6
         (set_local $3
          (i32.sub
           ;;@ fmod.ts:20:8
           (get_local $3)
           (i32.const 1)
          )
         )
         ;;@ fmod.ts:19:39
         (set_local $4
          (i64.shl
           (get_local $4)
           ;;@ fmod.ts:19:45
           (i64.const 1)
          )
         )
         (br $continue|0)
        )
       )
      )
      (i64.shl
       ;;@ fmod.ts:21:4
       (get_local $2)
       ;;@ fmod.ts:21:11
       (i64.extend_u/i32
        (i32.sub
         ;;@ fmod.ts:21:17
         (i32.const 1)
         ;;@ fmod.ts:21:12
         (get_local $3)
        )
       )
      )
     )
    )
   )
   (set_local $5
    ;;@ fmod.ts:26:2
    (if (result i64)
     ;;@ fmod.ts:26:7
     (get_local $6)
     (i64.or
      (i64.and
       ;;@ fmod.ts:31:4
       (get_local $5)
       (i64.const 4503599627370495)
      )
      (i64.const 4503599627370496)
     )
     ;;@ fmod.ts:26:11
     (block (result i64)
      ;;@ fmod.ts:27:9
      (set_local $4
       ;;@ fmod.ts:27:13
       (i64.shl
        (get_local $5)
        ;;@ fmod.ts:27:19
        (i64.const 12)
       )
      )
      (loop $continue|1
       (if
        ;;@ fmod.ts:27:23
        (i64.eqz
         ;;@ fmod.ts:27:24
         (i64.shr_u
          ;;@ fmod.ts:27:25
          (get_local $4)
          ;;@ fmod.ts:27:30
          (i64.const 63)
         )
        )
        (block
         ;;@ fmod.ts:28:6
         (set_local $6
          (i32.sub
           ;;@ fmod.ts:28:8
           (get_local $6)
           (i32.const 1)
          )
         )
         ;;@ fmod.ts:27:35
         (set_local $4
          (i64.shl
           (get_local $4)
           ;;@ fmod.ts:27:41
           (i64.const 1)
          )
         )
         (br $continue|1)
        )
       )
      )
      (i64.shl
       ;;@ fmod.ts:29:4
       (get_local $5)
       ;;@ fmod.ts:29:11
       (i64.extend_u/i32
        (i32.sub
         ;;@ fmod.ts:29:17
         (i32.const 1)
         ;;@ fmod.ts:29:12
         (get_local $6)
        )
       )
      )
     )
    )
   )
   (loop $continue|2
    (if
     ;;@ fmod.ts:36:9
     (i32.gt_s
      (get_local $3)
      ;;@ fmod.ts:36:14
      (get_local $6)
     )
     (block
      ;;@ fmod.ts:38:4
      (if
       ;;@ fmod.ts:38:8
       (i64.eqz
        ;;@ fmod.ts:38:9
        (i64.shr_u
         ;;@ fmod.ts:37:4
         (tee_local $4
          ;;@ fmod.ts:37:8
          (i64.sub
           (get_local $2)
           ;;@ fmod.ts:37:13
           (get_local $5)
          )
         )
         ;;@ fmod.ts:38:15
         (i64.const 63)
        )
       )
       ;;@ fmod.ts:38:20
       (block
        (br_if $folding-inner0
         ;;@ fmod.ts:39:10
         (i64.eqz
          ;;@ fmod.ts:39:11
          (get_local $4)
         )
        )
        ;;@ fmod.ts:41:6
        (set_local $2
         ;;@ fmod.ts:41:11
         (get_local $4)
        )
       )
      )
      ;;@ fmod.ts:43:4
      (set_local $2
       (i64.shl
        (get_local $2)
        ;;@ fmod.ts:43:11
        (i64.const 1)
       )
      )
      ;;@ fmod.ts:36:18
      (set_local $3
       (i32.sub
        (get_local $3)
        (i32.const 1)
       )
      )
      (br $continue|2)
     )
    )
   )
   ;;@ fmod.ts:46:2
   (if
    ;;@ fmod.ts:46:6
    (i64.eqz
     ;;@ fmod.ts:46:7
     (i64.shr_u
      ;;@ fmod.ts:45:2
      (tee_local $4
       ;;@ fmod.ts:45:6
       (i64.sub
        (get_local $2)
        ;;@ fmod.ts:45:11
        (get_local $5)
       )
      )
      ;;@ fmod.ts:46:13
      (i64.const 63)
     )
    )
    ;;@ fmod.ts:46:18
    (block
     (br_if $folding-inner0
      ;;@ fmod.ts:47:8
      (i64.eqz
       ;;@ fmod.ts:47:9
       (get_local $4)
      )
     )
     ;;@ fmod.ts:49:4
     (set_local $2
      ;;@ fmod.ts:49:9
      (get_local $4)
     )
    )
   )
   (loop $continue|3
    (if
     ;;@ fmod.ts:51:9
     (i64.eqz
      ;;@ fmod.ts:51:10
      (i64.shr_u
       ;;@ fmod.ts:51:11
       (get_local $2)
       ;;@ fmod.ts:51:17
       (i64.const 52)
      )
     )
     (block
      ;;@ fmod.ts:52:4
      (set_local $3
       (i32.sub
        ;;@ fmod.ts:52:6
        (get_local $3)
        (i32.const 1)
       )
      )
      ;;@ fmod.ts:51:22
      (set_local $2
       (i64.shl
        (get_local $2)
        ;;@ fmod.ts:51:29
        (i64.const 1)
       )
      )
      (br $continue|3)
     )
    )
   )
   (return
    ;;@ fmod.ts:62:9
    (f64.reinterpret/i64
     (i64.or
      (tee_local $2
       (select
        (i64.or
         (i64.sub
          ;;@ fmod.ts:56:4
          (get_local $2)
          (i64.const 4503599627370496)
         )
         ;;@ fmod.ts:57:10
         (i64.shl
          (i64.extend_u/i32
           (get_local $3)
          )
          ;;@ fmod.ts:57:21
          (i64.const 52)
         )
        )
        (i64.shr_u
         ;;@ fmod.ts:59:4
         (get_local $2)
         ;;@ fmod.ts:59:11
         (i64.extend_u/i32
          (i32.sub
           ;;@ fmod.ts:59:17
           (i32.const 1)
           ;;@ fmod.ts:59:12
           (get_local $3)
          )
         )
        )
        ;;@ fmod.ts:55:6
        (i32.gt_s
         (get_local $3)
         ;;@ fmod.ts:55:11
         (i32.const 0)
        )
       )
      )
      ;;@ fmod.ts:61:8
      (i64.shl
       (i64.extend_u/i32
        (get_local $7)
       )
       ;;@ fmod.ts:61:19
       (i64.const 63)
      )
     )
    )
   )
  )
  ;;@ fmod.ts:13:13
  (f64.mul
   (f64.const 0)
   ;;@ fmod.ts:13:17
   (get_local $0)
  )
 )
 (func $fmod/fmodf (; 1 ;) (type $fff) (param $0 f32) (param $1 f32) (result f32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 f32)
  (local $8 i32)
  (block $folding-inner0
   ;;@ fmod.ts:74:2
   (set_local $4
    ;;@ fmod.ts:74:11
    (i32.and
     ;;@ fmod.ts:74:17
     (i32.shr_u
      ;;@ fmod.ts:72:2
      (tee_local $2
       ;;@ fmod.ts:72:11
       (i32.reinterpret/f32
        ;;@ fmod.ts:72:28
        (get_local $0)
       )
      )
      ;;@ fmod.ts:74:23
      (i32.const 23)
     )
     ;;@ fmod.ts:74:28
     (i32.const 255)
    )
   )
   ;;@ fmod.ts:75:2
   (set_local $6
    ;;@ fmod.ts:75:11
    (i32.and
     ;;@ fmod.ts:75:17
     (i32.shr_u
      ;;@ fmod.ts:73:2
      (tee_local $5
       ;;@ fmod.ts:73:11
       (i32.reinterpret/f32
        ;;@ fmod.ts:73:28
        (get_local $1)
       )
      )
      ;;@ fmod.ts:75:23
      (i32.const 23)
     )
     ;;@ fmod.ts:75:28
     (i32.const 255)
    )
   )
   ;;@ fmod.ts:78:2
   (if
    ;;@ fmod.ts:78:6
    (i32.and
     (if (result i32)
      (tee_local $3
       (i32.and
        (if (result i32)
         (tee_local $3
          (i32.eqz
           (i32.shl
            (get_local $5)
            ;;@ fmod.ts:78:12
            (i32.const 1)
           )
          )
         )
         (get_local $3)
         ;;@ fmod.ts:78:22
         (f32.ne
          (tee_local $7
           ;;@ fmod.ts:78:33
           (get_local $1)
          )
          (get_local $7)
         )
        )
        (i32.const 1)
       )
      )
      (get_local $3)
      ;;@ fmod.ts:78:39
      (i32.eq
       (get_local $4)
       ;;@ fmod.ts:78:45
       (i32.const 255)
      )
     )
     (i32.const 1)
    )
    ;;@ fmod.ts:79:27
    (return
     ;;@ fmod.ts:79:11
     (f32.div
      (f32.mul
       ;;@ fmod.ts:79:12
       (get_local $0)
       ;;@ fmod.ts:79:16
       (get_local $1)
      )
      ;;@ fmod.ts:79:21
      (f32.mul
       ;;@ fmod.ts:79:22
       (get_local $0)
       ;;@ fmod.ts:79:26
       (get_local $1)
      )
     )
    )
   )
   ;;@ fmod.ts:80:2
   (if
    ;;@ fmod.ts:80:6
    (i32.le_u
     (i32.shl
      (get_local $2)
      ;;@ fmod.ts:80:12
      (i32.const 1)
     )
     ;;@ fmod.ts:80:17
     (i32.shl
      (get_local $5)
      ;;@ fmod.ts:80:23
      (i32.const 1)
     )
    )
    ;;@ fmod.ts:80:26
    (block
     (br_if $folding-inner0
      ;;@ fmod.ts:81:8
      (i32.eq
       (i32.shl
        (get_local $2)
        ;;@ fmod.ts:81:14
        (i32.const 1)
       )
       ;;@ fmod.ts:81:19
       (i32.shl
        (get_local $5)
        ;;@ fmod.ts:81:25
        (i32.const 1)
       )
      )
     )
     ;;@ fmod.ts:83:11
     (return
      (get_local $0)
     )
    )
   )
   ;;@ fmod.ts:76:2
   (set_local $8
    ;;@ fmod.ts:76:11
    (i32.and
     (get_local $2)
     ;;@ fmod.ts:76:16
     (i32.const -2147483648)
    )
   )
   (set_local $2
    ;;@ fmod.ts:87:2
    (if (result i32)
     ;;@ fmod.ts:87:7
     (get_local $4)
     (i32.or
      (i32.and
       ;;@ fmod.ts:92:4
       (get_local $2)
       (i32.const 8388607)
      )
      (i32.const 8388608)
     )
     ;;@ fmod.ts:87:11
     (block (result i32)
      ;;@ fmod.ts:88:9
      (set_local $3
       ;;@ fmod.ts:88:17
       (i32.shl
        (get_local $2)
        ;;@ fmod.ts:88:23
        (i32.const 9)
       )
      )
      (loop $continue|0
       (if
        ;;@ fmod.ts:88:26
        (i32.eqz
         ;;@ fmod.ts:88:27
         (i32.shr_u
          ;;@ fmod.ts:88:28
          (get_local $3)
          ;;@ fmod.ts:88:33
          (i32.const 31)
         )
        )
        (block
         ;;@ fmod.ts:89:6
         (set_local $4
          (i32.sub
           ;;@ fmod.ts:89:8
           (get_local $4)
           (i32.const 1)
          )
         )
         ;;@ fmod.ts:88:38
         (set_local $3
          (i32.shl
           (get_local $3)
           ;;@ fmod.ts:88:44
           (i32.const 1)
          )
         )
         (br $continue|0)
        )
       )
      )
      (i32.shl
       ;;@ fmod.ts:90:4
       (get_local $2)
       ;;@ fmod.ts:90:11
       (i32.sub
        ;;@ fmod.ts:90:17
        (i32.const 1)
        ;;@ fmod.ts:90:12
        (get_local $4)
       )
      )
     )
    )
   )
   (set_local $5
    ;;@ fmod.ts:95:2
    (if (result i32)
     ;;@ fmod.ts:95:7
     (get_local $6)
     (i32.or
      (i32.and
       ;;@ fmod.ts:100:4
       (get_local $5)
       (i32.const 8388607)
      )
      (i32.const 8388608)
     )
     ;;@ fmod.ts:95:11
     (block (result i32)
      ;;@ fmod.ts:96:9
      (set_local $3
       ;;@ fmod.ts:96:13
       (i32.shl
        (get_local $5)
        ;;@ fmod.ts:96:19
        (i32.const 9)
       )
      )
      (loop $continue|1
       (if
        ;;@ fmod.ts:96:22
        (i32.eqz
         ;;@ fmod.ts:96:23
         (i32.shr_u
          ;;@ fmod.ts:96:24
          (get_local $3)
          ;;@ fmod.ts:96:29
          (i32.const 31)
         )
        )
        (block
         ;;@ fmod.ts:97:6
         (set_local $6
          (i32.sub
           ;;@ fmod.ts:97:8
           (get_local $6)
           (i32.const 1)
          )
         )
         ;;@ fmod.ts:96:34
         (set_local $3
          (i32.shl
           (get_local $3)
           ;;@ fmod.ts:96:40
           (i32.const 1)
          )
         )
         (br $continue|1)
        )
       )
      )
      (i32.shl
       ;;@ fmod.ts:98:4
       (get_local $5)
       ;;@ fmod.ts:98:11
       (i32.sub
        ;;@ fmod.ts:98:17
        (i32.const 1)
        ;;@ fmod.ts:98:12
        (get_local $6)
       )
      )
     )
    )
   )
   (loop $continue|2
    (if
     ;;@ fmod.ts:105:9
     (i32.gt_s
      (get_local $4)
      ;;@ fmod.ts:105:14
      (get_local $6)
     )
     (block
      ;;@ fmod.ts:107:4
      (if
       ;;@ fmod.ts:107:8
       (i32.eqz
        ;;@ fmod.ts:107:9
        (i32.shr_u
         ;;@ fmod.ts:106:4
         (tee_local $3
          ;;@ fmod.ts:106:8
          (i32.sub
           (get_local $2)
           ;;@ fmod.ts:106:13
           (get_local $5)
          )
         )
         ;;@ fmod.ts:107:15
         (i32.const 31)
        )
       )
       ;;@ fmod.ts:107:20
       (block
        (br_if $folding-inner0
         ;;@ fmod.ts:108:10
         (i32.eqz
          ;;@ fmod.ts:108:11
          (get_local $3)
         )
        )
        ;;@ fmod.ts:110:6
        (set_local $2
         ;;@ fmod.ts:110:11
         (get_local $3)
        )
       )
      )
      ;;@ fmod.ts:112:4
      (set_local $2
       (i32.shl
        (get_local $2)
        ;;@ fmod.ts:112:11
        (i32.const 1)
       )
      )
      ;;@ fmod.ts:105:18
      (set_local $4
       (i32.sub
        ;;@ fmod.ts:105:20
        (get_local $4)
        (i32.const 1)
       )
      )
      (br $continue|2)
     )
    )
   )
   ;;@ fmod.ts:115:2
   (if
    ;;@ fmod.ts:115:6
    (i32.eqz
     ;;@ fmod.ts:115:7
     (i32.shr_u
      ;;@ fmod.ts:114:2
      (tee_local $3
       ;;@ fmod.ts:114:6
       (i32.sub
        (get_local $2)
        ;;@ fmod.ts:114:11
        (get_local $5)
       )
      )
      ;;@ fmod.ts:115:13
      (i32.const 31)
     )
    )
    ;;@ fmod.ts:115:18
    (block
     (br_if $folding-inner0
      ;;@ fmod.ts:116:8
      (i32.eqz
       ;;@ fmod.ts:116:9
       (get_local $3)
      )
     )
     ;;@ fmod.ts:118:4
     (set_local $2
      ;;@ fmod.ts:118:9
      (get_local $3)
     )
    )
   )
   (loop $continue|3
    (if
     ;;@ fmod.ts:120:9
     (i32.eqz
      ;;@ fmod.ts:120:10
      (i32.shr_u
       ;;@ fmod.ts:120:11
       (get_local $2)
       ;;@ fmod.ts:120:17
       (i32.const 23)
      )
     )
     (block
      ;;@ fmod.ts:121:4
      (set_local $4
       (i32.sub
        ;;@ fmod.ts:121:6
        (get_local $4)
        (i32.const 1)
       )
      )
      ;;@ fmod.ts:120:22
      (set_local $2
       (i32.shl
        (get_local $2)
        ;;@ fmod.ts:120:29
        (i32.const 1)
       )
      )
      (br $continue|3)
     )
    )
   )
   (return
    ;;@ fmod.ts:131:9
    (f32.reinterpret/i32
     (i32.or
      (tee_local $2
       (select
        (i32.or
         (i32.sub
          ;;@ fmod.ts:125:4
          (get_local $2)
          (i32.const 8388608)
         )
         ;;@ fmod.ts:126:10
         (i32.shl
          (get_local $4)
          ;;@ fmod.ts:126:21
          (i32.const 23)
         )
        )
        (i32.shr_u
         ;;@ fmod.ts:128:4
         (get_local $2)
         ;;@ fmod.ts:128:11
         (i32.sub
          ;;@ fmod.ts:128:17
          (i32.const 1)
          ;;@ fmod.ts:128:12
          (get_local $4)
         )
        )
        ;;@ fmod.ts:124:6
        (i32.gt_s
         (get_local $4)
         ;;@ fmod.ts:124:11
         (i32.const 0)
        )
       )
      )
      ;;@ fmod.ts:130:8
      (get_local $8)
     )
    )
   )
  )
  ;;@ fmod.ts:82:13
  (f32.mul
   (f32.const 0)
   ;;@ fmod.ts:82:17
   (get_local $0)
  )
 )
 (func $start (; 2 ;) (type $v)
  (local $0 f64)
  (local $1 f32)
  ;;@ fmod.ts:65:0
  (if
   ;;@ fmod.ts:65:7
   (f64.eq
    (tee_local $0
     ;;@ fmod.ts:65:18
     (call $fmod/fmod
      ;;@ fmod.ts:65:23
      (f64.const 1)
      ;;@ fmod.ts:65:26
      (f64.const nan:0x8000000000000)
     )
    )
    (get_local $0)
   )
   (unreachable)
  )
  ;;@ fmod.ts:66:0
  (if
   ;;@ fmod.ts:66:7
   (f64.ne
    (call $fmod/fmod
     ;;@ fmod.ts:66:12
     (f64.const 1.5)
     ;;@ fmod.ts:66:17
     (f64.const 1)
    )
    ;;@ fmod.ts:66:25
    (f64.const 0.5)
   )
   (unreachable)
  )
  ;;@ fmod.ts:67:0
  (if
   (i32.eqz
    ;;@ fmod.ts:67:7
    (f64.lt
     (f64.sub
      (call $fmod/fmod
       ;;@ fmod.ts:67:12
       (f64.const 9.2)
       ;;@ fmod.ts:67:17
       (f64.const 2)
      )
      ;;@ fmod.ts:67:24
      (f64.const 1.2)
     )
     ;;@ fmod.ts:67:30
     (f64.const 2.220446049250313e-16)
    )
   )
   (unreachable)
  )
  ;;@ fmod.ts:68:0
  (if
   (i32.eqz
    ;;@ fmod.ts:68:7
    (f64.lt
     (f64.sub
      (call $fmod/fmod
       ;;@ fmod.ts:68:12
       (f64.const 9.2)
       ;;@ fmod.ts:68:17
       (f64.const 3.7)
      )
      ;;@ fmod.ts:68:24
      (f64.const 1.8)
     )
     ;;@ fmod.ts:68:30
     (f64.const 2.220446049250313e-16)
    )
   )
   (unreachable)
  )
  ;;@ fmod.ts:134:0
  (if
   ;;@ fmod.ts:134:7
   (f32.eq
    (tee_local $1
     ;;@ fmod.ts:134:18
     (call $fmod/fmodf
      ;;@ fmod.ts:134:24
      (f32.const 1)
      ;;@ fmod.ts:134:27
      (f32.const nan:0x400000)
     )
    )
    (get_local $1)
   )
   (unreachable)
  )
  ;;@ fmod.ts:135:0
  (if
   ;;@ fmod.ts:135:7
   (f32.ne
    (call $fmod/fmodf
     ;;@ fmod.ts:135:13
     (f32.const 1.5)
     ;;@ fmod.ts:135:18
     (f32.const 1)
    )
    ;;@ fmod.ts:135:26
    (f32.const 0.5)
   )
   (unreachable)
  )
  ;;@ fmod.ts:136:0
  (if
   (i32.eqz
    ;;@ fmod.ts:136:7
    (f32.lt
     (f32.sub
      (call $fmod/fmodf
       ;;@ fmod.ts:136:13
       (f32.const 9.199999809265137)
       ;;@ fmod.ts:136:18
       (f32.const 2)
      )
      ;;@ fmod.ts:136:25
      (f32.const 1.2000000476837158)
     )
     ;;@ fmod.ts:136:31
     (f32.const 1.1920928955078125e-07)
    )
   )
   (unreachable)
  )
  ;;@ fmod.ts:137:0
  (if
   (i32.eqz
    ;;@ fmod.ts:137:7
    (f32.lt
     (f32.sub
      (call $fmod/fmodf
       ;;@ fmod.ts:137:13
       (f32.const 9.199999809265137)
       ;;@ fmod.ts:137:18
       (f32.const 3.700000047683716)
      )
      ;;@ fmod.ts:137:25
      (f32.const 1.7999999523162842)
     )
     ;;@ fmod.ts:137:31
     (f32.const 1.1920928955078125e-07)
    )
   )
   (unreachable)
  )
 )
)
