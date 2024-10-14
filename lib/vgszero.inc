struct OAM $9000 {
    y           ds.b    1
    x           ds.b    1
    ptn         ds.b    1
    attr        ds.b    1
    h           ds.b    1
    w           ds.b    1
    bank        ds.b    1
    reserved    ds.b    1
}

struct OAM16 $9A00 {
    y           ds.w    1
    x           ds.w    1
}

struct VRAM $8000 {
    bg_name     ds.b    32 * 32     ; BG name table
    bg_attr     ds.b    32 * 32     ; BG attribute table
    fg_name     ds.b    32 * 32     ; FG name table
    fg_attr     ds.b    32 * 32     ; FG attribute table
    oam         OAM     256         ; Sprites (Object Attribute Memory)
    palette     ds.w    16 * 16     ; Palettes
    oam16       OAM16   256         ; 16bit position for sprites
    reserved    ds.b    0x100       ; reserved area
    vcnt        ds.b    1           ; R0: Scanline Vertical Counter
    hcnt        ds.b    1           ; R1: Scanline Horizontal Counter
    bgSX        ds.b    1           ; R2: BG Scroll X
    bgSY        ds.b    1           ; R3: BG Scroll Y
    fgSX        ds.b    1           ; R4: FG Scroll X
    fgSY        ds.b    1           ; R5: FG Scroll Y
    irq         ds.b    1           ; R6: IRQ scanline position
    status      ds.b    1           ; R7: Status
    bgDPM       ds.b    1           ; R8: BG Direct Pattern Maaping
    fgDPM       ds.b    1           ; R9: FG Direct Pattern Maaping
    spDPM       ds.b    1           ; R10: Sprite Direct Pattern Maaping
    mode1024    ds.b    1           ; R11: 1024 pattern mode
}