#include "../lib/vgszero.inc"

.Main
    ld bc, VRAM.oam             ; BC = $9800
    ld hl, sizeof(OAM) * 256    ; HL = OAM size (8) x 256 = 2048
    ld bc, VRAM.oam + 1 * 0x21  ; BC = $9821
