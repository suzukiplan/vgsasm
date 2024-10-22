#include "vgszero.inc"
#include "init.asm"

;------------------------------------------------------------
; インデクスを除くレジスタを退避
;------------------------------------------------------------
#macro push_all_widhout_i()
{
    push af
    push bc
    push de
    push hl
}

;------------------------------------------------------------
; インデクスを除くレジスタを復帰
;------------------------------------------------------------
#macro pop_all_widhout_i()
{
    pop hl
    pop de
    pop bc
    pop af
}

;------------------------------------------------------------
; FG へ $00 終端の文字列を表示
;------------------------------------------------------------
#macro print_text_fg(posX, posY, attr, string)
{
    push_all_widhout_i()
    ld h, posX
    ld l, posY
    ld b, attr
    ld de, string
    call print_text_sub
    pop_all_widhout_i()
}

.print_text_sub
    ; 座標をネームテーブルアドレスへ変換
    ; HL = L * 32 + H + VRAM.fg_name
    ld a, h
    ld h, 0
    ld c, 32
    mul hl, c
    add hl, a
    add hl, VRAM.fg_name

@Loop
    ; 文字コード取得
    ld a, (de)
    and a
    ret z

    ; 文字コード書き込み
    ld (hl), a

    ; 属性更新
    push de
    ld de, $0400
    add hl, de
    ld a, b
    ld (hl), a
    ld de, -$03FF
    add hl, de
    pop de

    inc de
    jr @Loop
    ret
