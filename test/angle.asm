struct Enemy $C000 {
    x ds.w 1
    y ds.w 1
}

; Enemy0 が Enemy1 を追いかけるサブルーチン
.Move_Enemy0_aim_Enemy1
@calc_diff_y
    LD A, (Enemy[0].y + 1)  ; A = Enemy0 の Y 座標（整数部）
    SUB (Enemy[1].y + 1)    ; A -= Enemy1 の Y 座標（整数部）
    LD H, A                 ; H = A

@calc_diff_x
    LD A, (Enemy[0].x + 1)  ; A = Enemy0 の X 座標（整数部）
    SUB (Enemy[1].x + 1)    ; A -= Enemy1 の X 座標（整数部）
    LD L, A                 ; L = A

@get_atan2
    ATN2 A, HL              ; A = atan2(H, L)
    LD B, A                 ; B = A

@calc_x
    SIN A, B                ; A = sin(B × π ÷ 128.0)
    ADD (Enemy[0].x)        ; Enemy[0].x += A

@calc_y
    COS A, B                ; A = cos(B × π ÷ 128.0)
    ADD (Enemy[0].y)        ; Enemy[0].y += A
    RET
