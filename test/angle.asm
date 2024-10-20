#include "../lib/vgszero.inc"

struct Enemy $C000 {
    x ds.w 1
    y ds.w 1
}

; Enemy0 が Enemy1 を追いかけるサブルーチン
.Move_Enemy0_aim_Enemy1
@calc_diff_y
    LD A, (Enemy[1].y + 1)  ; A = Enemy1 の Y 座標（整数部）
    LD H, A                 ; H = A
    LD A, (Enemy[0].y + 1)  ; A = Enemy0 の Y 座標（整数部）
    SUB H                   ; H = y0 - y1

@calc_diff_x
    LD A, (Enemy[1].x + 1)  ; A = Enemy1 の X 座標（整数部）
    LD L, A                 ; L = A
    LD A, (Enemy[0].x + 1)  ; A = Enemy0 の X 座標（整数部）
    SUB L                   ; L = x0 - x1

@get_atan2
    ATN2 A, HL              ; A = atan2(H, L)
    LD D, A                 ; D = A

@calc_x
    LD HL, (Enemy[0].x)     ; HL = X0
    SIN A, D                ; A = sin(D × π ÷ 128.0)
    ADD HL, A               ; HL += A
    LD (Enemy[0].x), HL      ; Update X of Enemy0

@calc_y
    LD HL, (Enemy[0].y)     ; HL = Y0
    COS A, D                ; A = cos(D × π ÷ 128.0)
    ADD HL, A               ; HL += A
    LD (Enemy[0].y), HL     ; Update Y of Enemy0
    RET
