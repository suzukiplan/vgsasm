                    im        0                             ;[0000] ed 46
                    im        1                             ;[0002] ed 56
                    im        2                             ;[0004] ed 5e
                    di                                      ;[0006] f3
                    ei                                      ;[0007] fb
                    halt                                    ;[0008] 76
                    push      af                            ;[0009] f5
                    push      bc                            ;[000a] c5
                    push      de                            ;[000b] d5
                    push      hl                            ;[000c] e5
                    push      ix                            ;[000d] dd e5
                    push      iy                            ;[000f] fd e5
                    pop       af                            ;[0011] f1
                    pop       bc                            ;[0012] c1
                    pop       de                            ;[0013] d1
                    pop       hl                            ;[0014] e1
                    pop       ix                            ;[0015] dd e1
                    pop       iy                            ;[0017] fd e1
                    ex        de,hl                         ;[0019] eb
                    ex        af,af'                        ;[001a] 08
                    ex        (sp),hl                       ;[001b] e3
                    ex        (sp),ix                       ;[001c] dd e3
                    ex        (sp),iy                       ;[001e] fd e3
                    exx                                     ;[0020] d9
                    ldi                                     ;[0021] ed a0
                    ldir                                    ;[0023] ed b0
                    ldd                                     ;[0025] ed a8
                    lddr                                    ;[0027] ed b8
                    cpi                                     ;[0029] ed a1
                    cpir                                    ;[002b] ed b1
                    cpd                                     ;[002d] ed a9
                    cpdr                                    ;[002f] ed b9
                    outi                                    ;[0031] ed a3
                    otir                                    ;[0033] ed b3
                    otir                                    ;[0035] ed b3
                    outd                                    ;[0037] ed ab
                    otdr                                    ;[0039] ed bb
                    otdr                                    ;[003b] ed bb
                    nop                                     ;[003d] 00
                    daa                                     ;[003e] 27
                    cpl                                     ;[003f] 2f
                    ccf                                     ;[0040] 3f
                    scf                                     ;[0041] 37
                    neg                                     ;[0042] ed 44
                    and       a                             ;[0044] a7
                    and       b                             ;[0045] a0
                    and       c                             ;[0046] a1
                    and       d                             ;[0047] a2
                    and       e                             ;[0048] a3
                    and       h                             ;[0049] a4
                    and       l                             ;[004a] a5
                    and       ixh                           ;[004b] dd a4
                    and       ixl                           ;[004d] dd a5
                    and       iyh                           ;[004f] fd a4
                    and       iyl                           ;[0051] fd a5
                    and       $ff                           ;[0053] e6 ff
                    and       (hl)                          ;[0055] a6
                    and       (ix+$00)                      ;[0056] dd a6 00
                    and       (ix-$80)                      ;[0059] dd a6 80
                    and       (ix+$7f)                      ;[005c] dd a6 7f
                    and       (iy+$00)                      ;[005f] fd a6 00
                    and       (iy-$80)                      ;[0062] fd a6 80
                    and       (iy+$7f)                      ;[0065] fd a6 7f
                    and       a                             ;[0068] a7
                    and       b                             ;[0069] a0
                    and       c                             ;[006a] a1
                    and       d                             ;[006b] a2
                    and       e                             ;[006c] a3
                    and       h                             ;[006d] a4
                    and       l                             ;[006e] a5
                    and       ixh                           ;[006f] dd a4
                    and       ixl                           ;[0071] dd a5
                    and       iyh                           ;[0073] fd a4
                    and       iyl                           ;[0075] fd a5
                    and       $ff                           ;[0077] e6 ff
                    and       (hl)                          ;[0079] a6
                    and       (ix+$00)                      ;[007a] dd a6 00
                    and       (ix-$80)                      ;[007d] dd a6 80
                    and       (ix+$7f)                      ;[0080] dd a6 7f
                    and       (iy+$00)                      ;[0083] fd a6 00
                    and       (iy-$80)                      ;[0086] fd a6 80
                    and       (iy+$7f)                      ;[0089] fd a6 7f
                    or        a                             ;[008c] b7
                    or        b                             ;[008d] b0
                    or        c                             ;[008e] b1
                    or        d                             ;[008f] b2
                    or        e                             ;[0090] b3
                    or        h                             ;[0091] b4
                    or        l                             ;[0092] b5
                    or        ixh                           ;[0093] dd b4
                    or        ixl                           ;[0095] dd b5
                    or        iyh                           ;[0097] fd b4
                    or        iyl                           ;[0099] fd b5
                    or        $ff                           ;[009b] f6 ff
                    or        (hl)                          ;[009d] b6
                    or        (ix+$00)                      ;[009e] dd b6 00
                    or        (ix-$80)                      ;[00a1] dd b6 80
                    or        (ix+$7f)                      ;[00a4] dd b6 7f
                    or        (iy+$00)                      ;[00a7] fd b6 00
                    or        (iy-$80)                      ;[00aa] fd b6 80
                    or        (iy+$7f)                      ;[00ad] fd b6 7f
                    or        a                             ;[00b0] b7
                    or        b                             ;[00b1] b0
                    or        c                             ;[00b2] b1
                    or        d                             ;[00b3] b2
                    or        e                             ;[00b4] b3
                    or        h                             ;[00b5] b4
                    or        l                             ;[00b6] b5
                    or        ixh                           ;[00b7] dd b4
                    or        ixl                           ;[00b9] dd b5
                    or        iyh                           ;[00bb] fd b4
                    or        iyl                           ;[00bd] fd b5
                    or        $ff                           ;[00bf] f6 ff
                    or        (hl)                          ;[00c1] b6
                    or        (ix+$00)                      ;[00c2] dd b6 00
                    or        (ix-$80)                      ;[00c5] dd b6 80
                    or        (ix+$7f)                      ;[00c8] dd b6 7f
                    or        (iy+$00)                      ;[00cb] fd b6 00
                    or        (iy-$80)                      ;[00ce] fd b6 80
                    or        (iy+$7f)                      ;[00d1] fd b6 7f
                    xor       a                             ;[00d4] af
                    xor       b                             ;[00d5] a8
                    xor       c                             ;[00d6] a9
                    xor       d                             ;[00d7] aa
                    xor       e                             ;[00d8] ab
                    xor       h                             ;[00d9] ac
                    xor       l                             ;[00da] ad
                    xor       ixh                           ;[00db] dd ac
                    xor       ixl                           ;[00dd] dd ad
                    xor       iyh                           ;[00df] fd ac
                    xor       iyl                           ;[00e1] fd ad
                    xor       $ff                           ;[00e3] ee ff
                    xor       (hl)                          ;[00e5] ae
                    xor       (ix+$00)                      ;[00e6] dd ae 00
                    xor       (ix-$80)                      ;[00e9] dd ae 80
                    xor       (ix+$7f)                      ;[00ec] dd ae 7f
                    xor       (iy+$00)                      ;[00ef] fd ae 00
                    xor       (iy-$80)                      ;[00f2] fd ae 80
                    xor       (iy+$7f)                      ;[00f5] fd ae 7f
                    xor       a                             ;[00f8] af
                    xor       b                             ;[00f9] a8
                    xor       c                             ;[00fa] a9
                    xor       d                             ;[00fb] aa
                    xor       e                             ;[00fc] ab
                    xor       h                             ;[00fd] ac
                    xor       l                             ;[00fe] ad
                    xor       ixh                           ;[00ff] dd ac
                    xor       ixl                           ;[0101] dd ad
                    xor       iyh                           ;[0103] fd ac
                    xor       iyl                           ;[0105] fd ad
                    xor       $ff                           ;[0107] ee ff
                    xor       (hl)                          ;[0109] ae
                    xor       (ix+$00)                      ;[010a] dd ae 00
                    xor       (ix-$80)                      ;[010d] dd ae 80
                    xor       (ix+$7f)                      ;[0110] dd ae 7f
                    xor       (iy+$00)                      ;[0113] fd ae 00
                    xor       (iy-$80)                      ;[0116] fd ae 80
                    xor       (iy+$7f)                      ;[0119] fd ae 7f
                    cp        a                             ;[011c] bf
                    cp        b                             ;[011d] b8
                    cp        c                             ;[011e] b9
                    cp        d                             ;[011f] ba
                    cp        e                             ;[0120] bb
                    cp        h                             ;[0121] bc
                    cp        l                             ;[0122] bd
                    cp        ixh                           ;[0123] dd bc
                    cp        ixl                           ;[0125] dd bd
                    cp        iyh                           ;[0127] fd bc
                    cp        iyl                           ;[0129] fd bd
                    cp        $ff                           ;[012b] fe ff
                    cp        (hl)                          ;[012d] be
                    cp        (ix+$00)                      ;[012e] dd be 00
                    cp        (ix-$80)                      ;[0131] dd be 80
                    cp        (ix+$7f)                      ;[0134] dd be 7f
                    cp        (iy+$00)                      ;[0137] fd be 00
                    cp        (iy-$80)                      ;[013a] fd be 80
                    cp        (iy+$7f)                      ;[013d] fd be 7f
                    cp        a                             ;[0140] bf
                    cp        b                             ;[0141] b8
                    cp        c                             ;[0142] b9
                    cp        d                             ;[0143] ba
                    cp        e                             ;[0144] bb
                    cp        h                             ;[0145] bc
                    cp        l                             ;[0146] bd
                    cp        ixh                           ;[0147] dd bc
                    cp        ixl                           ;[0149] dd bd
                    cp        iyh                           ;[014b] fd bc
                    cp        iyl                           ;[014d] fd bd
                    cp        $ff                           ;[014f] fe ff
                    cp        (hl)                          ;[0151] be
                    cp        (ix+$00)                      ;[0152] dd be 00
                    cp        (ix-$80)                      ;[0155] dd be 80
                    cp        (ix+$7f)                      ;[0158] dd be 7f
                    cp        (iy+$00)                      ;[015b] fd be 00
                    cp        (iy-$80)                      ;[015e] fd be 80
                    cp        (iy+$7f)                      ;[0161] fd be 7f
                    add       a                             ;[0164] 87
                    add       b                             ;[0165] 80
                    add       c                             ;[0166] 81
                    add       d                             ;[0167] 82
                    add       e                             ;[0168] 83
                    add       h                             ;[0169] 84
                    add       l                             ;[016a] 85
                    add       ixh                           ;[016b] dd 84
                    add       ixl                           ;[016d] dd 85
                    add       iyh                           ;[016f] fd 84
                    add       iyl                           ;[0171] fd 85
                    add       $ff                           ;[0173] c6 ff
                    add       (hl)                          ;[0175] 86
                    add       (ix+$00)                      ;[0176] dd 86 00
                    add       (ix-$80)                      ;[0179] dd 86 80
                    add       (ix+$7f)                      ;[017c] dd 86 7f
                    add       (iy+$00)                      ;[017f] fd 86 00
                    add       (iy-$80)                      ;[0182] fd 86 80
                    add       (iy+$7f)                      ;[0185] fd 86 7f
                    add       a                             ;[0188] 87
                    add       b                             ;[0189] 80
                    add       c                             ;[018a] 81
                    add       d                             ;[018b] 82
                    add       e                             ;[018c] 83
                    add       h                             ;[018d] 84
                    add       l                             ;[018e] 85
                    add       ixh                           ;[018f] dd 84
                    add       ixl                           ;[0191] dd 85
                    add       iyh                           ;[0193] fd 84
                    add       iyl                           ;[0195] fd 85
                    add       $ff                           ;[0197] c6 ff
                    add       (hl)                          ;[0199] 86
                    add       (ix+$00)                      ;[019a] dd 86 00
                    add       (ix-$80)                      ;[019d] dd 86 80
                    add       (ix+$7f)                      ;[01a0] dd 86 7f
                    add       (iy+$00)                      ;[01a3] fd 86 00
                    add       (iy-$80)                      ;[01a6] fd 86 80
                    add       (iy+$7f)                      ;[01a9] fd 86 7f
                    add       hl,bc                         ;[01ac] 09
                    add       hl,de                         ;[01ad] 19
                    add       hl,hl                         ;[01ae] 29
                    add       hl,sp                         ;[01af] 39
                    add       ix,bc                         ;[01b0] dd 09
                    add       ix,de                         ;[01b2] dd 19
                    add       ix,ix                         ;[01b4] dd 29
                    add       ix,sp                         ;[01b6] dd 39
                    add       iy,bc                         ;[01b8] fd 09
                    add       iy,de                         ;[01ba] fd 19
                    add       iy,iy                         ;[01bc] fd 29
                    add       iy,sp                         ;[01be] fd 39
                    add       c                             ;[01c0] 81
                    ld        c,a                           ;[01c1] 4f
                    jr        nc,$01c5                      ;[01c2] 30 01
                    inc       b                             ;[01c4] 04
                    add       e                             ;[01c5] 83
                    ld        e,a                           ;[01c6] 5f
                    jr        nc,$01ca                      ;[01c7] 30 01
                    inc       d                             ;[01c9] 14
                    add       l                             ;[01ca] 85
                    ld        l,a                           ;[01cb] 6f
                    jr        nc,$01cf                      ;[01cc] 30 01
                    inc       h                             ;[01ce] 24
                    push      de                            ;[01cf] d5
                    ld        d,$12                         ;[01d0] 16 12
                    ld        e,$34                         ;[01d2] 1e 34
                    add       hl,de                         ;[01d4] 19
                    pop       de                            ;[01d5] d1
                    push      de                            ;[01d6] d5
                    ld        d,$56                         ;[01d7] 16 56
                    ld        e,$78                         ;[01d9] 1e 78
                    add       ix,de                         ;[01db] dd 19
                    pop       de                            ;[01dd] d1
                    push      de                            ;[01de] d5
                    ld        d,$9a                         ;[01df] 16 9a
                    ld        e,$bc                         ;[01e1] 1e bc
                    add       iy,de                         ;[01e3] fd 19
                    pop       de                            ;[01e5] d1
                    adc       a                             ;[01e6] 8f
                    adc       b                             ;[01e7] 88
                    adc       c                             ;[01e8] 89
                    adc       d                             ;[01e9] 8a
                    adc       e                             ;[01ea] 8b
                    adc       h                             ;[01eb] 8c
                    adc       l                             ;[01ec] 8d
                    adc       ixh                           ;[01ed] dd 8c
                    adc       ixl                           ;[01ef] dd 8d
                    adc       iyh                           ;[01f1] fd 8c
                    adc       iyl                           ;[01f3] fd 8d
                    adc       $ff                           ;[01f5] ce ff
                    adc       (hl)                          ;[01f7] 8e
                    adc       (ix+$00)                      ;[01f8] dd 8e 00
                    adc       (ix-$80)                      ;[01fb] dd 8e 80
                    adc       (ix+$7f)                      ;[01fe] dd 8e 7f
                    adc       (iy+$00)                      ;[0201] fd 8e 00
                    adc       (iy-$80)                      ;[0204] fd 8e 80
                    adc       (iy+$7f)                      ;[0207] fd 8e 7f
                    adc       a                             ;[020a] 8f
                    adc       b                             ;[020b] 88
                    adc       c                             ;[020c] 89
                    adc       d                             ;[020d] 8a
                    adc       e                             ;[020e] 8b
                    adc       h                             ;[020f] 8c
                    adc       l                             ;[0210] 8d
                    adc       ixh                           ;[0211] dd 8c
                    adc       ixl                           ;[0213] dd 8d
                    adc       iyh                           ;[0215] fd 8c
                    adc       iyl                           ;[0217] fd 8d
                    adc       $ff                           ;[0219] ce ff
                    adc       (hl)                          ;[021b] 8e
                    adc       (ix+$00)                      ;[021c] dd 8e 00
                    adc       (ix-$80)                      ;[021f] dd 8e 80
                    adc       (ix+$7f)                      ;[0222] dd 8e 7f
                    adc       (iy+$00)                      ;[0225] fd 8e 00
                    adc       (iy-$80)                      ;[0228] fd 8e 80
                    adc       (iy+$7f)                      ;[022b] fd 8e 7f
                    adc       hl,bc                         ;[022e] ed 4a
                    adc       hl,de                         ;[0230] ed 5a
                    adc       hl,hl                         ;[0232] ed 6a
                    adc       hl,sp                         ;[0234] ed 7a
                    sub       a                             ;[0236] 97
                    sub       b                             ;[0237] 90
                    sub       c                             ;[0238] 91
                    sub       d                             ;[0239] 92
                    sub       e                             ;[023a] 93
                    sub       h                             ;[023b] 94
                    sub       l                             ;[023c] 95
                    sub       ixh                           ;[023d] dd 94
                    sub       ixl                           ;[023f] dd 95
                    sub       iyh                           ;[0241] fd 94
                    sub       iyl                           ;[0243] fd 95
                    sub       $ff                           ;[0245] d6 ff
                    sub       (hl)                          ;[0247] 96
                    sub       (ix+$00)                      ;[0248] dd 96 00
                    sub       (ix-$80)                      ;[024b] dd 96 80
                    sub       (ix+$7f)                      ;[024e] dd 96 7f
                    sub       (iy+$00)                      ;[0251] fd 96 00
                    sub       (iy-$80)                      ;[0254] fd 96 80
                    sub       (iy+$7f)                      ;[0257] fd 96 7f
                    sub       a                             ;[025a] 97
                    sub       b                             ;[025b] 90
                    sub       c                             ;[025c] 91
                    sub       d                             ;[025d] 92
                    sub       e                             ;[025e] 93
                    sub       h                             ;[025f] 94
                    sub       l                             ;[0260] 95
                    sub       ixh                           ;[0261] dd 94
                    sub       ixl                           ;[0263] dd 95
                    sub       iyh                           ;[0265] fd 94
                    sub       iyl                           ;[0267] fd 95
                    sub       $ff                           ;[0269] d6 ff
                    sub       (hl)                          ;[026b] 96
                    sub       (ix+$00)                      ;[026c] dd 96 00
                    sub       (ix-$80)                      ;[026f] dd 96 80
                    sub       (ix+$7f)                      ;[0272] dd 96 7f
                    sub       (iy+$00)                      ;[0275] fd 96 00
                    sub       (iy-$80)                      ;[0278] fd 96 80
                    sub       (iy+$7f)                      ;[027b] fd 96 7f
                    sbc       a                             ;[027e] 9f
                    sbc       b                             ;[027f] 98
                    sbc       c                             ;[0280] 99
                    sbc       d                             ;[0281] 9a
                    sbc       e                             ;[0282] 9b
                    sbc       h                             ;[0283] 9c
                    sbc       l                             ;[0284] 9d
                    sbc       ixh                           ;[0285] dd 9c
                    sbc       ixl                           ;[0287] dd 9d
                    sbc       iyh                           ;[0289] fd 9c
                    sbc       iyl                           ;[028b] fd 9d
                    sbc       $ff                           ;[028d] de ff
                    sbc       (hl)                          ;[028f] 9e
                    sbc       (ix+$00)                      ;[0290] dd 9e 00
                    sbc       (ix-$80)                      ;[0293] dd 9e 80
                    sbc       (ix+$7f)                      ;[0296] dd 9e 7f
                    sbc       (iy+$00)                      ;[0299] fd 9e 00
                    sbc       (iy-$80)                      ;[029c] fd 9e 80
                    sbc       (iy+$7f)                      ;[029f] fd 9e 7f
                    sbc       a                             ;[02a2] 9f
                    sbc       b                             ;[02a3] 98
                    sbc       c                             ;[02a4] 99
                    sbc       d                             ;[02a5] 9a
                    sbc       e                             ;[02a6] 9b
                    sbc       h                             ;[02a7] 9c
                    sbc       l                             ;[02a8] 9d
                    sbc       ixh                           ;[02a9] dd 9c
                    sbc       ixl                           ;[02ab] dd 9d
                    sbc       iyh                           ;[02ad] fd 9c
                    sbc       iyl                           ;[02af] fd 9d
                    sbc       $ff                           ;[02b1] de ff
                    sbc       (hl)                          ;[02b3] 9e
                    sbc       (ix+$00)                      ;[02b4] dd 9e 00
                    sbc       (ix-$80)                      ;[02b7] dd 9e 80
                    sbc       (ix+$7f)                      ;[02ba] dd 9e 7f
                    sbc       (iy+$00)                      ;[02bd] fd 9e 00
                    sbc       (iy-$80)                      ;[02c0] fd 9e 80
                    sbc       (iy+$7f)                      ;[02c3] fd 9e 7f
                    sbc       hl,bc                         ;[02c6] ed 42
                    sbc       hl,de                         ;[02c8] ed 52
                    sbc       hl,hl                         ;[02ca] ed 62
                    sbc       hl,sp                         ;[02cc] ed 72
                    bit       0,a                           ;[02ce] cb 47
                    bit       1,b                           ;[02d0] cb 48
                    bit       2,c                           ;[02d2] cb 51
                    bit       3,d                           ;[02d4] cb 5a
                    bit       4,e                           ;[02d6] cb 63
                    bit       5,h                           ;[02d8] cb 6c
                    bit       6,l                           ;[02da] cb 75
                    set       7,a                           ;[02dc] cb ff
                    set       0,b                           ;[02de] cb c0
                    set       1,c                           ;[02e0] cb c9
                    set       2,d                           ;[02e2] cb d2
                    set       3,e                           ;[02e4] cb db
                    set       4,h                           ;[02e6] cb e4
                    set       5,l                           ;[02e8] cb ed
                    res       6,a                           ;[02ea] cb b7
                    res       7,b                           ;[02ec] cb b8
                    res       0,c                           ;[02ee] cb 81
                    res       1,d                           ;[02f0] cb 8a
                    res       2,e                           ;[02f2] cb 93
                    res       3,h                           ;[02f4] cb 9c
                    res       4,l                           ;[02f6] cb a5
                    bit       0,(hl)                        ;[02f8] cb 46
                    set       1,(hl)                        ;[02fa] cb ce
                    res       2,(hl)                        ;[02fc] cb 96
                    bit       0,(ix+$00)                    ;[02fe] dd cb 00 46
                    set       1,(ix+$00)                    ;[0302] dd cb 00 ce
                    res       2,(ix+$00)                    ;[0306] dd cb 00 96
                    bit       0,(iy+$00)                    ;[030a] fd cb 00 46
                    set       1,(iy+$00)                    ;[030e] fd cb 00 ce
                    res       2,(iy+$00)                    ;[0312] fd cb 00 96
                    bit       0,(ix+$7f)                    ;[0316] dd cb 7f 46
                    set       1,(ix+$00)                    ;[031a] dd cb 00 ce
                    res       2,(ix-$80)                    ;[031e] dd cb 80 96
                    bit       0,(iy-$01)                    ;[0322] fd cb ff 46
                    set       1,(iy+$40)                    ;[0326] fd cb 40 ce
                    res       2,(iy-$40)                    ;[032a] fd cb c0 96
                    inc       a                             ;[032e] 3c
                    inc       b                             ;[032f] 04
                    inc       c                             ;[0330] 0c
                    inc       d                             ;[0331] 14
                    inc       e                             ;[0332] 1c
                    inc       h                             ;[0333] 24
                    inc       l                             ;[0334] 2c
                    inc       ixh                           ;[0335] dd 24
                    inc       ixl                           ;[0337] dd 2c
                    inc       iyh                           ;[0339] fd 24
                    inc       iyl                           ;[033b] fd 2c
                    inc       bc                            ;[033d] 03
                    inc       de                            ;[033e] 13
                    inc       hl                            ;[033f] 23
                    inc       sp                            ;[0340] 33
                    inc       ix                            ;[0341] dd 23
                    inc       iy                            ;[0343] fd 23
                    inc       (hl)                          ;[0345] 34
                    inc       (ix+$00)                      ;[0346] dd 34 00
                    inc       (iy+$00)                      ;[0349] fd 34 00
                    inc       (ix-$80)                      ;[034c] dd 34 80
                    inc       (iy-$01)                      ;[034f] fd 34 ff
                    inc       (ix+$01)                      ;[0352] dd 34 01
                    inc       (iy+$7f)                      ;[0355] fd 34 7f
                    push      hl                            ;[0358] e5
                    ld        l,$34                         ;[0359] 2e 34
                    ld        h,$12                         ;[035b] 26 12
                    inc       (hl)                          ;[035d] 34
                    pop       hl                            ;[035e] e1
                    dec       a                             ;[035f] 3d
                    dec       b                             ;[0360] 05
                    dec       c                             ;[0361] 0d
                    dec       d                             ;[0362] 15
                    dec       e                             ;[0363] 1d
                    dec       h                             ;[0364] 25
                    dec       l                             ;[0365] 2d
                    dec       ixh                           ;[0366] dd 25
                    dec       ixl                           ;[0368] dd 2d
                    dec       iyh                           ;[036a] fd 25
                    dec       iyl                           ;[036c] fd 2d
                    dec       bc                            ;[036e] 0b
                    dec       de                            ;[036f] 1b
                    dec       hl                            ;[0370] 2b
                    dec       sp                            ;[0371] 3b
                    dec       ix                            ;[0372] dd 2b
                    dec       iy                            ;[0374] fd 2b
                    dec       (hl)                          ;[0376] 35
                    dec       (ix+$00)                      ;[0377] dd 35 00
                    dec       (iy+$00)                      ;[037a] fd 35 00
                    dec       (ix-$80)                      ;[037d] dd 35 80
                    dec       (iy-$01)                      ;[0380] fd 35 ff
                    dec       (ix+$01)                      ;[0383] dd 35 01
                    dec       (iy+$7f)                      ;[0386] fd 35 7f
                    push      hl                            ;[0389] e5
                    ld        l,$34                         ;[038a] 2e 34
                    ld        h,$12                         ;[038c] 26 12
                    dec       (hl)                          ;[038e] 35
                    pop       hl                            ;[038f] e1
                    rlca                                    ;[0390] 07
                    rla                                     ;[0391] 17
                    rrca                                    ;[0392] 0f
                    rra                                     ;[0393] 1f
                    rlc       a                             ;[0394] cb 07
                    rlc       b                             ;[0396] cb 00
                    rlc       c                             ;[0398] cb 01
                    rlc       d                             ;[039a] cb 02
                    rlc       e                             ;[039c] cb 03
                    rlc       h                             ;[039e] cb 04
                    rlc       l                             ;[03a0] cb 05
                    rlc       (hl)                          ;[03a2] cb 06
                    rlc       (ix+$00)                      ;[03a4] dd cb 00 06
                    rlc       (iy+$00)                      ;[03a8] fd cb 00 06
                    rlc       (ix-$80)                      ;[03ac] dd cb 80 06
                    rlc       (iy-$01)                      ;[03b0] fd cb ff 06
                    rlc       (ix+$01)                      ;[03b4] dd cb 01 06
                    rlc       (iy+$7f)                      ;[03b8] fd cb 7f 06
                    rl        a                             ;[03bc] cb 17
                    rl        b                             ;[03be] cb 10
                    rl        c                             ;[03c0] cb 11
                    rl        d                             ;[03c2] cb 12
                    rl        e                             ;[03c4] cb 13
                    rl        h                             ;[03c6] cb 14
                    rl        l                             ;[03c8] cb 15
                    rl        (hl)                          ;[03ca] cb 16
                    rl        (ix+$00)                      ;[03cc] dd cb 00 16
                    rl        (iy+$00)                      ;[03d0] fd cb 00 16
                    rl        (ix-$80)                      ;[03d4] dd cb 80 16
                    rl        (iy-$01)                      ;[03d8] fd cb ff 16
                    rl        (ix+$01)                      ;[03dc] dd cb 01 16
                    rl        (iy+$7f)                      ;[03e0] fd cb 7f 16
                    rrc       a                             ;[03e4] cb 0f
                    rrc       b                             ;[03e6] cb 08
                    rrc       c                             ;[03e8] cb 09
                    rrc       d                             ;[03ea] cb 0a
                    rrc       e                             ;[03ec] cb 0b
                    rrc       h                             ;[03ee] cb 0c
                    rrc       l                             ;[03f0] cb 0d
                    rrc       (hl)                          ;[03f2] cb 0e
                    rrc       (ix+$00)                      ;[03f4] dd cb 00 0e
                    rrc       (iy+$00)                      ;[03f8] fd cb 00 0e
                    rrc       (ix-$80)                      ;[03fc] dd cb 80 0e
                    rrc       (iy-$01)                      ;[0400] fd cb ff 0e
                    rrc       (ix+$01)                      ;[0404] dd cb 01 0e
                    rrc       (iy+$7f)                      ;[0408] fd cb 7f 0e
                    rr        a                             ;[040c] cb 1f
                    rr        b                             ;[040e] cb 18
                    rr        c                             ;[0410] cb 19
                    rr        d                             ;[0412] cb 1a
                    rr        e                             ;[0414] cb 1b
                    rr        h                             ;[0416] cb 1c
                    rr        l                             ;[0418] cb 1d
                    rr        (hl)                          ;[041a] cb 1e
                    rr        (ix+$00)                      ;[041c] dd cb 00 1e
                    rr        (iy+$00)                      ;[0420] fd cb 00 1e
                    rr        (ix-$80)                      ;[0424] dd cb 80 1e
                    rr        (iy-$01)                      ;[0428] fd cb ff 1e
                    rr        (ix+$01)                      ;[042c] dd cb 01 1e
                    rr        (iy+$7f)                      ;[0430] fd cb 7f 1e
                    sla       a                             ;[0434] cb 27
                    sla       b                             ;[0436] cb 20
                    sla       c                             ;[0438] cb 21
                    sla       d                             ;[043a] cb 22
                    sla       e                             ;[043c] cb 23
                    sla       h                             ;[043e] cb 24
                    sla       l                             ;[0440] cb 25
                    sla       (hl)                          ;[0442] cb 26
                    sla       (ix+$00)                      ;[0444] dd cb 00 26
                    sla       (iy+$00)                      ;[0448] fd cb 00 26
                    sla       (ix-$80)                      ;[044c] dd cb 80 26
                    sla       (iy-$01)                      ;[0450] fd cb ff 26
                    sla       (ix+$01)                      ;[0454] dd cb 01 26
                    sla       (iy+$7f)                      ;[0458] fd cb 7f 26
                    sla       a                             ;[045c] cb 27
                    sla       b                             ;[045e] cb 20
                    sla       c                             ;[0460] cb 21
                    sla       d                             ;[0462] cb 22
                    sla       e                             ;[0464] cb 23
                    sla       h                             ;[0466] cb 24
                    sla       l                             ;[0468] cb 25
                    sla       (hl)                          ;[046a] cb 26
                    sla       (ix+$00)                      ;[046c] dd cb 00 26
                    sla       (iy+$00)                      ;[0470] fd cb 00 26
                    sla       (ix-$80)                      ;[0474] dd cb 80 26
                    sla       (iy-$01)                      ;[0478] fd cb ff 26
                    sla       (ix+$01)                      ;[047c] dd cb 01 26
                    sla       (iy+$7f)                      ;[0480] fd cb 7f 26
                    sll       a                             ;[0484] cb 37
                    sll       b                             ;[0486] cb 30
                    sll       c                             ;[0488] cb 31
                    sll       d                             ;[048a] cb 32
                    sll       e                             ;[048c] cb 33
                    sll       h                             ;[048e] cb 34
                    sll       l                             ;[0490] cb 35
                    sll       (hl)                          ;[0492] cb 36
                    sll       (ix+$00)                      ;[0494] dd cb 00 36
                    sll       (iy+$00)                      ;[0498] fd cb 00 36
                    sll       (ix-$80)                      ;[049c] dd cb 80 36
                    sll       (iy-$01)                      ;[04a0] fd cb ff 36
                    sll       (ix+$01)                      ;[04a4] dd cb 01 36
                    sll       (iy+$7f)                      ;[04a8] fd cb 7f 36
                    sra       a                             ;[04ac] cb 2f
                    sra       b                             ;[04ae] cb 28
                    sra       c                             ;[04b0] cb 29
                    sra       d                             ;[04b2] cb 2a
                    sra       e                             ;[04b4] cb 2b
                    sra       h                             ;[04b6] cb 2c
                    sra       l                             ;[04b8] cb 2d
                    sra       (hl)                          ;[04ba] cb 2e
                    sra       (ix+$00)                      ;[04bc] dd cb 00 2e
                    sra       (iy+$00)                      ;[04c0] fd cb 00 2e
                    sra       (ix-$80)                      ;[04c4] dd cb 80 2e
                    sra       (iy-$01)                      ;[04c8] fd cb ff 2e
                    sra       (ix+$01)                      ;[04cc] dd cb 01 2e
                    sra       (iy+$7f)                      ;[04d0] fd cb 7f 2e
                    srl       a                             ;[04d4] cb 3f
                    srl       b                             ;[04d6] cb 38
                    srl       c                             ;[04d8] cb 39
                    srl       d                             ;[04da] cb 3a
                    srl       e                             ;[04dc] cb 3b
                    srl       h                             ;[04de] cb 3c
                    srl       l                             ;[04e0] cb 3d
                    srl       (hl)                          ;[04e2] cb 3e
                    srl       (ix+$00)                      ;[04e4] dd cb 00 3e
                    srl       (iy+$00)                      ;[04e8] fd cb 00 3e
                    srl       (ix-$80)                      ;[04ec] dd cb 80 3e
                    srl       (iy-$01)                      ;[04f0] fd cb ff 3e
                    srl       (ix+$01)                      ;[04f4] dd cb 01 3e
                    srl       (iy+$7f)                      ;[04f8] fd cb 7f 3e
                    srl       a                             ;[04fc] cb 3f
                    srl       b                             ;[04fe] cb 38
                    srl       c                             ;[0500] cb 39
                    srl       d                             ;[0502] cb 3a
                    srl       e                             ;[0504] cb 3b
                    srl       h                             ;[0506] cb 3c
                    srl       l                             ;[0508] cb 3d
                    srl       (hl)                          ;[050a] cb 3e
                    srl       (ix+$00)                      ;[050c] dd cb 00 3e
                    srl       (iy+$00)                      ;[0510] fd cb 00 3e
                    srl       (ix-$80)                      ;[0514] dd cb 80 3e
                    srl       (iy-$01)                      ;[0518] fd cb ff 3e
                    srl       (ix+$01)                      ;[051c] dd cb 01 3e
                    srl       (iy+$7f)                      ;[0520] fd cb 7f 3e
                    rld                                     ;[0524] ed 6f
                    rrd                                     ;[0526] ed 67
                    ld        a,rlc (ix+$0a)                ;[0528] dd cb 0a 07
                    ld        b,rlc (ix+$0a)                ;[052c] dd cb 0a 00
                    ld        c,rlc (ix+$0a)                ;[0530] dd cb 0a 01
                    ld        d,rlc (ix+$0a)                ;[0534] dd cb 0a 02
                    ld        e,rlc (ix+$0a)                ;[0538] dd cb 0a 03
                    rlc       (ix+$0a)                      ;[053c] dd cb 0a 06
                    ld        h,rlc (ix+$0a)                ;[0540] dd cb 0a 04
                    ld        l,rlc (ix+$0a)                ;[0544] dd cb 0a 05
                    ld        b,rrc (ix+$0a)                ;[0548] dd cb 0a 08
                    ld        b,rl (ix+$0a)                 ;[054c] dd cb 0a 10
                    ld        b,rr (ix+$0a)                 ;[0550] dd cb 0a 18
                    ld        b,sla (ix+$0a)                ;[0554] dd cb 0a 20
                    ld        b,sra (ix+$0a)                ;[0558] dd cb 0a 28
                    ld        b,sll (ix+$0a)                ;[055c] dd cb 0a 30
                    ld        b,srl (ix+$0a)                ;[0560] dd cb 0a 38
                    ld        b,res 0,(ix+$0a)              ;[0564] dd cb 0a 80
                    ld        b,res 1,(ix+$0a)              ;[0568] dd cb 0a 88
                    ld        b,res 2,(ix+$0a)              ;[056c] dd cb 0a 90
                    ld        b,res 3,(ix+$0a)              ;[0570] dd cb 0a 98
                    ld        b,res 4,(ix+$0a)              ;[0574] dd cb 0a a0
                    ld        b,res 5,(ix+$0a)              ;[0578] dd cb 0a a8
                    ld        b,res 6,(ix+$0a)              ;[057c] dd cb 0a b0
                    ld        b,res 7,(ix+$0a)              ;[0580] dd cb 0a b8
                    ld        b,set 0,(ix+$0a)              ;[0584] dd cb 0a c0
                    ld        b,set 1,(ix+$0a)              ;[0588] dd cb 0a c8
                    ld        b,set 2,(ix+$0a)              ;[058c] dd cb 0a d0
                    ld        b,set 3,(ix+$0a)              ;[0590] dd cb 0a d8
                    ld        b,set 4,(ix+$0a)              ;[0594] dd cb 0a e0
                    ld        b,set 5,(ix+$0a)              ;[0598] dd cb 0a e8
                    ld        b,set 6,(ix+$0a)              ;[059c] dd cb 0a f0
                    ld        b,set 7,(ix+$0a)              ;[05a0] dd cb 0a f8
                    in        a,($80)                       ;[05a4] db 80
                    in        a,(c)                         ;[05a6] ed 78
                    in        b,(c)                         ;[05a8] ed 40
                    in        c,(c)                         ;[05aa] ed 48
                    in        d,(c)                         ;[05ac] ed 50
                    in        e,(c)                         ;[05ae] ed 58
                    in        (c)                           ;[05b0] ed 70
                    in        h,(c)                         ;[05b2] ed 60
                    in        l,(c)                         ;[05b4] ed 68
                    out       ($ff),a                       ;[05b6] d3 ff
                    out       (c),a                         ;[05b8] ed 79
                    out       (c),b                         ;[05ba] ed 41
                    out       (c),c                         ;[05bc] ed 49
                    out       (c),d                         ;[05be] ed 51
                    out       (c),e                         ;[05c0] ed 59
                    out       (c),0                         ;[05c2] ed 71
                    out       (c),0                         ;[05c4] ed 71
                    out       (c),h                         ;[05c6] ed 61
                    out       (c),l                         ;[05c8] ed 69
                    ini                                     ;[05ca] ed a2
                    inir                                    ;[05cc] ed b2
                    ind                                     ;[05ce] ed aa
                    indr                                    ;[05d0] ed ba
                    outi                                    ;[05d2] ed a3
                    otir                                    ;[05d4] ed b3
                    otir                                    ;[05d6] ed b3
                    outd                                    ;[05d8] ed ab
                    otdr                                    ;[05da] ed bb
                    otdr                                    ;[05dc] ed bb
                    ld        a,a                           ;[05de] 7f
                    ld        a,b                           ;[05df] 78
                    ld        a,c                           ;[05e0] 79
                    ld        a,d                           ;[05e1] 7a
                    ld        a,e                           ;[05e2] 7b
                    ld        a,h                           ;[05e3] 7c
                    ld        a,l                           ;[05e4] 7d
                    ld        a,ixh                         ;[05e5] dd 7c
                    ld        a,ixl                         ;[05e7] dd 7d
                    ld        a,iyh                         ;[05e9] fd 7c
                    ld        a,iyl                         ;[05eb] fd 7d
                    ld        b,a                           ;[05ed] 47
                    ld        b,b                           ;[05ee] 40
                    ld        b,c                           ;[05ef] 41
                    ld        b,d                           ;[05f0] 42
                    ld        b,e                           ;[05f1] 43
                    ld        b,h                           ;[05f2] 44
                    ld        b,l                           ;[05f3] 45
                    ld        b,ixh                         ;[05f4] dd 44
                    ld        b,ixl                         ;[05f6] dd 45
                    ld        b,iyh                         ;[05f8] fd 44
                    ld        b,iyl                         ;[05fa] fd 45
                    ld        c,a                           ;[05fc] 4f
                    ld        c,b                           ;[05fd] 48
                    ld        c,c                           ;[05fe] 49
                    ld        c,d                           ;[05ff] 4a
                    ld        c,e                           ;[0600] 4b
                    ld        c,h                           ;[0601] 4c
                    ld        c,l                           ;[0602] 4d
                    ld        c,ixh                         ;[0603] dd 4c
                    ld        c,ixl                         ;[0605] dd 4d
                    ld        c,iyh                         ;[0607] fd 4c
                    ld        c,iyl                         ;[0609] fd 4d
                    ld        d,a                           ;[060b] 57
                    ld        d,b                           ;[060c] 50
                    ld        d,c                           ;[060d] 51
                    ld        d,d                           ;[060e] 52
                    ld        d,e                           ;[060f] 53
                    ld        d,h                           ;[0610] 54
                    ld        d,l                           ;[0611] 55
                    ld        d,ixh                         ;[0612] dd 54
                    ld        d,ixl                         ;[0614] dd 55
                    ld        d,iyh                         ;[0616] fd 54
                    ld        d,iyl                         ;[0618] fd 55
                    ld        e,a                           ;[061a] 5f
                    ld        e,b                           ;[061b] 58
                    ld        e,c                           ;[061c] 59
                    ld        e,d                           ;[061d] 5a
                    ld        e,e                           ;[061e] 5b
                    ld        e,h                           ;[061f] 5c
                    ld        e,l                           ;[0620] 5d
                    ld        e,ixh                         ;[0621] dd 5c
                    ld        e,ixl                         ;[0623] dd 5d
                    ld        e,iyh                         ;[0625] fd 5c
                    ld        e,iyl                         ;[0627] fd 5d
                    ld        h,a                           ;[0629] 67
                    ld        h,b                           ;[062a] 60
                    ld        h,c                           ;[062b] 61
                    ld        h,d                           ;[062c] 62
                    ld        h,e                           ;[062d] 63
                    ld        h,h                           ;[062e] 64
                    ld        h,l                           ;[062f] 65
                    ld        l,a                           ;[0630] 6f
                    ld        l,b                           ;[0631] 68
                    ld        l,c                           ;[0632] 69
                    ld        l,d                           ;[0633] 6a
                    ld        l,e                           ;[0634] 6b
                    ld        l,h                           ;[0635] 6c
                    ld        l,l                           ;[0636] 6d
                    ld        ixh,a                         ;[0637] dd 67
                    ld        ixh,b                         ;[0639] dd 60
                    ld        ixh,c                         ;[063b] dd 61
                    ld        ixh,d                         ;[063d] dd 62
                    ld        ixh,e                         ;[063f] dd 63
                    ld        ixh,ixh                       ;[0641] dd 64
                    ld        ixh,ixl                       ;[0643] dd 65
                    ld        ixl,a                         ;[0645] dd 6f
                    ld        ixl,b                         ;[0647] dd 68
                    ld        ixl,c                         ;[0649] dd 69
                    ld        ixl,d                         ;[064b] dd 6a
                    ld        ixl,e                         ;[064d] dd 6b
                    ld        ixl,ixh                       ;[064f] dd 6c
                    ld        ixl,ixl                       ;[0651] dd 6d
                    ld        iyh,a                         ;[0653] fd 67
                    ld        iyh,b                         ;[0655] fd 60
                    ld        iyh,c                         ;[0657] fd 61
                    ld        iyh,d                         ;[0659] fd 62
                    ld        iyh,e                         ;[065b] fd 63
                    ld        iyh,iyh                       ;[065d] fd 64
                    ld        iyh,iyl                       ;[065f] fd 65
                    ld        iyl,a                         ;[0661] fd 6f
                    ld        iyl,b                         ;[0663] fd 68
                    ld        iyl,c                         ;[0665] fd 69
                    ld        iyl,d                         ;[0667] fd 6a
                    ld        iyl,e                         ;[0669] fd 6b
                    ld        iyl,iyh                       ;[066b] fd 6c
                    ld        iyl,iyl                       ;[066d] fd 6d
                    ld        b,b                           ;[066f] 40
                    ld        c,c                           ;[0670] 49
                    ld        b,d                           ;[0671] 42
                    ld        c,e                           ;[0672] 4b
                    ld        b,h                           ;[0673] 44
                    ld        c,l                           ;[0674] 4d
                    ld        b,ixh                         ;[0675] dd 44
                    ld        c,ixl                         ;[0677] dd 4d
                    ld        b,iyh                         ;[0679] fd 44
                    ld        c,iyl                         ;[067b] fd 4d
                    ld        d,b                           ;[067d] 50
                    ld        e,c                           ;[067e] 59
                    ld        d,d                           ;[067f] 52
                    ld        e,e                           ;[0680] 5b
                    ld        d,h                           ;[0681] 54
                    ld        e,l                           ;[0682] 5d
                    ld        d,ixh                         ;[0683] dd 54
                    ld        c,ixl                         ;[0685] dd 4d
                    ld        d,iyh                         ;[0687] fd 54
                    ld        c,iyl                         ;[0689] fd 4d
                    ld        h,b                           ;[068b] 60
                    ld        l,c                           ;[068c] 69
                    ld        h,d                           ;[068d] 62
                    ld        l,e                           ;[068e] 6b
                    ld        h,h                           ;[068f] 64
                    ld        l,l                           ;[0690] 6d
                    push      ix                            ;[0691] dd e5
                    pop       hl                            ;[0693] e1
                    push      iy                            ;[0694] fd e5
                    pop       hl                            ;[0696] e1
                    ld        ixh,b                         ;[0697] dd 60
                    ld        ixl,c                         ;[0699] dd 69
                    ld        ixh,d                         ;[069b] dd 62
                    ld        ixl,e                         ;[069d] dd 6b
                    push      hl                            ;[069f] e5
                    pop       ix                            ;[06a0] dd e1
                    ld        ixh,ixh                       ;[06a2] dd 64
                    ld        ixl,ixl                       ;[06a4] dd 6d
                    push      iy                            ;[06a6] fd e5
                    pop       ix                            ;[06a8] dd e1
                    ld        iyh,b                         ;[06aa] fd 60
                    ld        iyl,c                         ;[06ac] fd 69
                    ld        iyh,d                         ;[06ae] fd 62
                    ld        iyl,e                         ;[06b0] fd 6b
                    push      hl                            ;[06b2] e5
                    pop       iy                            ;[06b3] fd e1
                    push      ix                            ;[06b5] dd e5
                    pop       iy                            ;[06b7] fd e1
                    ld        iyh,iyh                       ;[06b9] fd 64
                    ld        iyl,iyl                       ;[06bb] fd 6d
                    ld        sp,hl                         ;[06bd] f9
                    ld        sp,ix                         ;[06be] dd f9
                    ld        sp,iy                         ;[06c0] fd f9
                    ld        a,(hl)                        ;[06c2] 7e
                    ld        b,(hl)                        ;[06c3] 46
                    ld        c,(hl)                        ;[06c4] 4e
                    ld        d,(hl)                        ;[06c5] 56
                    ld        e,(hl)                        ;[06c6] 5e
                    ld        h,(hl)                        ;[06c7] 66
                    ld        l,(hl)                        ;[06c8] 6e
                    push      af                            ;[06c9] f5
                    ld        a,(hl)                        ;[06ca] 7e
                    ld        ixh,a                         ;[06cb] dd 67
                    pop       af                            ;[06cd] f1
                    push      af                            ;[06ce] f5
                    ld        a,(hl)                        ;[06cf] 7e
                    ld        ixl,a                         ;[06d0] dd 6f
                    pop       af                            ;[06d2] f1
                    push      af                            ;[06d3] f5
                    ld        a,(hl)                        ;[06d4] 7e
                    ld        iyh,a                         ;[06d5] fd 67
                    pop       af                            ;[06d7] f1
                    push      af                            ;[06d8] f5
                    ld        a,(hl)                        ;[06d9] 7e
                    ld        iyl,a                         ;[06da] fd 6f
                    pop       af                            ;[06dc] f1
                    ld        c,(hl)                        ;[06dd] 4e
                    inc       hl                            ;[06de] 23
                    ld        b,(hl)                        ;[06df] 46
                    dec       hl                            ;[06e0] 2b
                    ld        e,(hl)                        ;[06e1] 5e
                    inc       hl                            ;[06e2] 23
                    ld        d,(hl)                        ;[06e3] 56
                    dec       hl                            ;[06e4] 2b
                    push      af                            ;[06e5] f5
                    ld        a,(hl)                        ;[06e6] 7e
                    ld        ixl,a                         ;[06e7] dd 6f
                    inc       hl                            ;[06e9] 23
                    ld        a,(hl)                        ;[06ea] 7e
                    ld        ixh,a                         ;[06eb] dd 67
                    dec       hl                            ;[06ed] 2b
                    pop       af                            ;[06ee] f1
                    push      af                            ;[06ef] f5
                    ld        a,(hl)                        ;[06f0] 7e
                    ld        iyl,a                         ;[06f1] fd 6f
                    inc       hl                            ;[06f3] 23
                    ld        a,(hl)                        ;[06f4] 7e
                    ld        iyh,a                         ;[06f5] fd 67
                    dec       hl                            ;[06f7] 2b
                    pop       af                            ;[06f8] f1
                    ld        (hl),a                        ;[06f9] 77
                    ld        (hl),b                        ;[06fa] 70
                    ld        (hl),c                        ;[06fb] 71
                    ld        (hl),d                        ;[06fc] 72
                    ld        (hl),e                        ;[06fd] 73
                    ld        (hl),h                        ;[06fe] 74
                    ld        (hl),l                        ;[06ff] 75
                    push      af                            ;[0700] f5
                    ld        a,ixh                         ;[0701] dd 7c
                    ld        (hl),a                        ;[0703] 77
                    pop       af                            ;[0704] f1
                    push      af                            ;[0705] f5
                    ld        a,ixl                         ;[0706] dd 7d
                    ld        (hl),a                        ;[0708] 77
                    pop       af                            ;[0709] f1
                    push      af                            ;[070a] f5
                    ld        a,iyh                         ;[070b] fd 7c
                    ld        (hl),a                        ;[070d] 77
                    pop       af                            ;[070e] f1
                    push      af                            ;[070f] f5
                    ld        a,iyl                         ;[0710] fd 7d
                    ld        (hl),a                        ;[0712] 77
                    pop       af                            ;[0713] f1
                    ld        ($1234),a                     ;[0714] 32 34 12
                    ld        ($1234),bc                    ;[0717] ed 43 34 12
                    ld        ($1234),de                    ;[071b] ed 53 34 12
                    ld        ($1234),hl                    ;[071f] 22 34 12
                    ld        ($1234),sp                    ;[0722] ed 73 34 12
                    ld        ($1234),ix                    ;[0726] dd 22 34 12
                    ld        ($1234),iy                    ;[072a] fd 22 34 12
                    ld        a,$80                         ;[072e] 3e 80
                    ld        b,$ff                         ;[0730] 06 ff
                    ld        c,$00                         ;[0732] 0e 00
                    ld        d,$01                         ;[0734] 16 01
                    ld        e,$7f                         ;[0736] 1e 7f
                    ld        h,$80                         ;[0738] 26 80
                    ld        l,$ff                         ;[073a] 2e ff
                    ld        ixh,$11                       ;[073c] dd 26 11
                    ld        ixl,$22                       ;[073f] dd 2e 22
                    ld        iyh,$88                       ;[0742] fd 26 88
                    ld        iyl,$99                       ;[0745] fd 2e 99
                    ld        bc,$8000                      ;[0748] 01 00 80
                    ld        de,$ffff                      ;[074b] 11 ff ff
                    ld        hl,$1234                      ;[074e] 21 34 12
                    ld        ix,$7fff                      ;[0751] dd 21 ff 7f
                    ld        iy,$ffff                      ;[0755] fd 21 ff ff
                    ld        bc,$076a                      ;[0759] 01 6a 07
                    ld        de,$05de                      ;[075c] 11 de 05
                    ld        hl,$0009                      ;[075f] 21 09 00
                    ld        ix,$072e                      ;[0762] dd 21 2e 07
                    ld        iy,$0000                      ;[0766] fd 21 00 00
                    nop                                     ;[076a] 00
                    ld        a,($1234)                     ;[076b] 3a 34 12
                    ld        bc,($5678)                    ;[076e] ed 4b 78 56
                    ld        de,($9abc)                    ;[0772] ed 5b bc 9a
                    ld        hl,($def0)                    ;[0776] 2a f0 de
                    ld        sp,($2525)                    ;[0779] ed 7b 25 25
                    ld        ix,($0831)                    ;[077d] dd 2a 31 08
                    ld        iy,($8931)                    ;[0781] fd 2a 31 89
                    ld        a,($008c)                     ;[0785] 3a 8c 00
                    ld        bc,($0785)                    ;[0788] ed 4b 85 07
                    ld        de,($079f)                    ;[078c] ed 5b 9f 07
                    ld        hl,($076a)                    ;[0790] 2a 6a 07
                    ld        sp,($0759)                    ;[0793] ed 7b 59 07
                    ld        ix,($06dd)                    ;[0797] dd 2a dd 06
                    ld        iy,($06bd)                    ;[079b] fd 2a bd 06
                    nop                                     ;[079f] 00
                    ld        a,(bc)                        ;[07a0] 0a
                    ld        a,(de)                        ;[07a1] 1a
                    ld        (bc),a                        ;[07a2] 02
                    ld        (de),a                        ;[07a3] 12
                    ld        a,(ix-$80)                    ;[07a4] dd 7e 80
                    ld        b,(ix-$01)                    ;[07a7] dd 46 ff
                    ld        c,(ix+$00)                    ;[07aa] dd 4e 00
                    ld        d,(ix+$00)                    ;[07ad] dd 56 00
                    ld        e,(ix+$01)                    ;[07b0] dd 5e 01
                    ld        h,(ix+$7f)                    ;[07b3] dd 66 7f
                    ld        l,(ix+$40)                    ;[07b6] dd 6e 40
                    ld        a,(iy-$80)                    ;[07b9] fd 7e 80
                    ld        b,(iy-$01)                    ;[07bc] fd 46 ff
                    ld        c,(iy+$00)                    ;[07bf] fd 4e 00
                    ld        d,(iy+$00)                    ;[07c2] fd 56 00
                    ld        e,(iy+$01)                    ;[07c5] fd 5e 01
                    ld        h,(iy+$7f)                    ;[07c8] fd 66 7f
                    ld        l,(iy+$40)                    ;[07cb] fd 6e 40
                    ld        (ix-$80),a                    ;[07ce] dd 77 80
                    ld        (ix-$01),b                    ;[07d1] dd 70 ff
                    ld        (ix+$00),c                    ;[07d4] dd 71 00
                    ld        (ix+$00),d                    ;[07d7] dd 72 00
                    ld        (ix+$01),e                    ;[07da] dd 73 01
                    ld        (ix+$7f),h                    ;[07dd] dd 74 7f
                    ld        (ix+$40),l                    ;[07e0] dd 75 40
                    ld        (iy-$80),a                    ;[07e3] fd 77 80
                    ld        (iy-$01),b                    ;[07e6] fd 70 ff
                    ld        (iy+$00),c                    ;[07e9] fd 71 00
                    ld        (iy+$00),d                    ;[07ec] fd 72 00
                    ld        (iy+$01),e                    ;[07ef] fd 73 01
                    ld        (iy+$7f),h                    ;[07f2] fd 74 7f
                    ld        (iy+$40),l                    ;[07f5] fd 75 40
                    ld        (ix-$80),$80                  ;[07f8] dd 36 80 80
                    ld        (ix-$80),$ff                  ;[07fc] dd 36 80 ff
                    ld        (ix-$80),$00                  ;[0800] dd 36 80 00
                    ld        (iy+$7f),$01                  ;[0804] fd 36 7f 01
                    ld        (iy+$7f),$7f                  ;[0808] fd 36 7f 7f
                    ld        (iy+$7f),$ff                  ;[080c] fd 36 7f ff
                    ld        (ix+$00),$80                  ;[0810] dd 36 00 80
                    ld        (ix+$00),$ff                  ;[0814] dd 36 00 ff
                    ld        (ix+$00),$00                  ;[0818] dd 36 00 00
                    ld        (iy+$00),$01                  ;[081c] fd 36 00 01
                    ld        (iy+$00),$7f                  ;[0820] fd 36 00 7f
                    ld        (iy+$00),$ff                  ;[0824] fd 36 00 ff
                    jp        $0000                         ;[0828] c3 00 00
                    jp        $1234                         ;[082b] c3 34 12
                    jp        $ffff                         ;[082e] c3 ff ff
                    jp        $0828                         ;[0831] c3 28 08
                    jp        $0831                         ;[0834] c3 31 08
                    jp        $0009                         ;[0837] c3 09 00
                    jr        $07bc                         ;[083a] 18 80
                    jr        $08bd                         ;[083c] 18 7f
                    jr        $0880                         ;[083e] 18 40
                    jr        $083a                         ;[0840] 18 f8
                    jr        $0828                         ;[0842] 18 e4
                    jr        $07ce                         ;[0844] 18 88
                    jp        z,$1234                       ;[0846] ca 34 12
                    jp        nz,$1234                      ;[0849] c2 34 12
                    jp        c,$1234                       ;[084c] da 34 12
                    jp        nc,$1234                      ;[084f] d2 34 12
                    jp        pe,$1234                      ;[0852] ea 34 12
                    jp        po,$1234                      ;[0855] e2 34 12
                    jp        p,$1234                       ;[0858] f2 34 12
                    jp        m,$1234                       ;[085b] fa 34 12
                    jp        z,$0846                       ;[085e] ca 46 08
                    jp        nz,$0828                      ;[0861] c2 28 08
                    jp        c,$0828                       ;[0864] da 28 08
                    jp        nc,$0000                      ;[0867] d2 00 00
                    jp        pe,$0009                      ;[086a] ea 09 00
                    jp        po,$0828                      ;[086d] e2 28 08
                    jp        p,$0840                       ;[0870] f2 40 08
                    jp        m,$083a                       ;[0873] fa 3a 08
                    jr        z,$07f8                       ;[0876] 28 80
                    jr        nz,$0879                      ;[0878] 20 ff
                    jr        c,$087d                       ;[087a] 38 01
                    jr        nc,$08fd                      ;[087c] 30 7f
                    jr        z,$0846                       ;[087e] 28 c6
                    jr        nz,$0828                      ;[0880] 20 a6
                    jr        c,$0828                       ;[0882] 38 a4
                    jr        nc,$087e                      ;[0884] 30 f8
                    jp        z,$1234                       ;[0886] ca 34 12
                    jp        nz,$1234                      ;[0889] c2 34 12
                    jp        c,$1234                       ;[088c] da 34 12
                    jp        nc,$1234                      ;[088f] d2 34 12
                    jp        pe,$1234                      ;[0892] ea 34 12
                    jp        po,$1234                      ;[0895] e2 34 12
                    jp        p,$1234                       ;[0898] f2 34 12
                    jp        m,$1234                       ;[089b] fa 34 12
                    jp        m,$1234                       ;[089e] fa 34 12
                    djnz      $0823                         ;[08a1] 10 80
                    djnz      $08a4                         ;[08a3] 10 ff
                    djnz      $08a8                         ;[08a5] 10 01
                    djnz      $0928                         ;[08a7] 10 7f
                    djnz      $083a                         ;[08a9] 10 8f
                    djnz      $08a1                         ;[08ab] 10 f4
                    djnz      $08a1                         ;[08ad] 10 f2
                    push      bc                            ;[08af] c5
                    ret                                     ;[08b0] c9

                    push      de                            ;[08b1] d5
                    ret                                     ;[08b2] c9

                    jp        (hl)                          ;[08b3] e9
                    jp        (ix)                          ;[08b4] dd e9
                    jp        (iy)                          ;[08b6] fd e9
                    push      bc                            ;[08b8] c5
                    ret                                     ;[08b9] c9

                    push      de                            ;[08ba] d5
                    ret                                     ;[08bb] c9

                    jp        (hl)                          ;[08bc] e9
                    jp        (ix)                          ;[08bd] dd e9
                    jp        (iy)                          ;[08bf] fd e9
                    call      $0000                         ;[08c1] cd 00 00
                    call      $1234                         ;[08c4] cd 34 12
                    call      $ffff                         ;[08c7] cd ff ff
                    call      $08c1                         ;[08ca] cd c1 08
                    call      $0000                         ;[08cd] cd 00 00
                    call      $0009                         ;[08d0] cd 09 00
                    call      nz,$1234                      ;[08d3] c4 34 12
                    call      z,$1234                       ;[08d6] cc 34 12
                    call      nc,$1234                      ;[08d9] d4 34 12
                    call      c,$1234                       ;[08dc] dc 34 12
                    call      po,$1234                      ;[08df] e4 34 12
                    call      pe,$1234                      ;[08e2] ec 34 12
                    call      p,$1234                       ;[08e5] f4 34 12
                    call      m,$1234                       ;[08e8] fc 34 12
                    call      nz,$08eb                      ;[08eb] c4 eb 08
                    call      z,$08d3                       ;[08ee] cc d3 08
                    call      nc,$08c1                      ;[08f1] d4 c1 08
                    call      c,$08c1                       ;[08f4] dc c1 08
                    call      po,$0009                      ;[08f7] e4 09 00
                    call      pe,$0000                      ;[08fa] ec 00 00
                    call      p,$0009                       ;[08fd] f4 09 00
                    call      m,$0000                       ;[0900] fc 00 00
                    ret                                     ;[0903] c9

                    reti                                    ;[0904] ed 4d

                    retn                                    ;[0906] ed 45

                    ret       nz                            ;[0908] c0
                    ret       z                             ;[0909] c8
                    ret       nc                            ;[090a] d0
                    ret       c                             ;[090b] d8
                    ret       po                            ;[090c] e0
                    ret       pe                            ;[090d] e8
                    ret       p                             ;[090e] f0
                    ret       m                             ;[090f] f8
                    rst       $00                           ;[0910] c7
                    rst       $00                           ;[0911] c7
                    rst       $00                           ;[0912] c7
                    rst       $08                           ;[0913] cf
                    rst       $08                           ;[0914] cf
                    rst       $08                           ;[0915] cf
                    rst       $10                           ;[0916] d7
                    rst       $10                           ;[0917] d7
                    rst       $10                           ;[0918] d7
                    rst       $18                           ;[0919] df
                    rst       $18                           ;[091a] df
                    rst       $18                           ;[091b] df
                    rst       $20                           ;[091c] e7
                    rst       $20                           ;[091d] e7
                    rst       $20                           ;[091e] e7
                    rst       $28                           ;[091f] ef
                    rst       $28                           ;[0920] ef
                    rst       $28                           ;[0921] ef
                    rst       $30                           ;[0922] f7
                    rst       $30                           ;[0923] f7
                    rst       $30                           ;[0924] f7
                    rst       $38                           ;[0925] ff
                    rst       $38                           ;[0926] ff
                    rst       $38                           ;[0927] ff
                    ld        c,b                           ;[0928] 48
                    ld        h,l                           ;[0929] 65
                    ld        l,h                           ;[092a] 6c
                    ld        l,h                           ;[092b] 6c
                    ld        l,a                           ;[092c] 6f
                    inc       l                             ;[092d] 2c
                    ld        d,a                           ;[092e] 57
                    ld        l,a                           ;[092f] 6f
                    ld        (hl),d                        ;[0930] 72
                    ld        l,h                           ;[0931] 6c
                    ld        h,h                           ;[0932] 64
                    ld        hl,$8000                      ;[0933] 21 00 80
                    rst       $38                           ;[0936] ff
                    nop                                     ;[0937] 00
                    ld        bc,$ff7f                      ;[0938] 01 7f ff
                    nop                                     ;[093b] 00
                    djnz      $095e                         ;[093c] 10 20
                    jr        nc,$0980                      ;[093e] 30 40
                    ld        d,b                           ;[0940] 50
                    ld        h,b                           ;[0941] 60
                    ld        (hl),b                        ;[0942] 70
                    add       b                             ;[0943] 80
                    sub       b                             ;[0944] 90
                    and       b                             ;[0945] a0
                    or        b                             ;[0946] b0
                    ret       nz                            ;[0947] c0
                    ret       nc                            ;[0948] d0
                    ret       po                            ;[0949] e0
                    ret       p                             ;[094a] f0
                    ld        c,b                           ;[094b] 48
                    nop                                     ;[094c] 00
                    ld        h,l                           ;[094d] 65
                    nop                                     ;[094e] 00
                    ld        l,h                           ;[094f] 6c
                    nop                                     ;[0950] 00
                    ld        l,h                           ;[0951] 6c
                    nop                                     ;[0952] 00
                    ld        l,a                           ;[0953] 6f
                    nop                                     ;[0954] 00
                    inc       l                             ;[0955] 2c
                    nop                                     ;[0956] 00
                    ld        d,a                           ;[0957] 57
                    nop                                     ;[0958] 00
                    ld        l,a                           ;[0959] 6f
                    nop                                     ;[095a] 00
                    ld        (hl),d                        ;[095b] 72
                    nop                                     ;[095c] 00
                    ld        l,h                           ;[095d] 6c
                    nop                                     ;[095e] 00
                    ld        h,h                           ;[095f] 64
                    nop                                     ;[0960] 00
                    ld        hl,$0000                      ;[0961] 21 00 00
                    nop                                     ;[0964] 00
                    nop                                     ;[0965] 00
                    add       b                             ;[0966] 80
                    rst       $38                           ;[0967] ff
                    rst       $38                           ;[0968] ff
                    nop                                     ;[0969] 00
                    nop                                     ;[096a] 00
                    ld        bc,$ff00                      ;[096b] 01 00 ff
                    ld        a,a                           ;[096e] 7f
                    rst       $38                           ;[096f] ff
                    rst       $38                           ;[0970] ff
                    inc       hl                            ;[0971] 23
                    ld        bc,$1234                      ;[0972] 01 34 12
                    ld        b,l                           ;[0975] 45
                    inc       hl                            ;[0976] 23
                    ld        d,(hl)                        ;[0977] 56
                    inc       (hl)                          ;[0978] 34
                    ld        h,a                           ;[0979] 67
                    ld        b,l                           ;[097a] 45
                    ld        a,b                           ;[097b] 78
                    ld        d,(hl)                        ;[097c] 56
                    adc       c                             ;[097d] 89
                    ld        h,a                           ;[097e] 67
                    sbc       d                             ;[097f] 9a
                    ld        a,b                           ;[0980] 78
                    xor       e                             ;[0981] ab
                    adc       c                             ;[0982] 89
                    cp        h                             ;[0983] bc
                    sbc       d                             ;[0984] 9a
                    call      $00ab                         ;[0985] cd ab 00
                    nop                                     ;[0988] 00
                    jr        z,$0994                       ;[0989] 28 09
                    add       hl,bc                         ;[098b] 09
                    nop                                     ;[098c] 00
                    jr        z,$0998                       ;[098d] 28 09
                    push      af                            ;[098f] f5
                    push      hl                            ;[0990] e5
                    ld        h,b                           ;[0991] 60
                    ld        l,c                           ;[0992] 69
                    ld        a,$00                         ;[0993] 3e 00
                    out       ($c5),a                       ;[0995] d3 c5
                    ld        b,h                           ;[0997] 44
                    ld        c,l                           ;[0998] 4d
                    pop       hl                            ;[0999] e1
                    pop       af                            ;[099a] f1
                    push      af                            ;[099b] f5
                    push      hl                            ;[099c] e5
                    ld        h,d                           ;[099d] 62
                    ld        l,e                           ;[099e] 6b
                    ld        a,$00                         ;[099f] 3e 00
                    out       ($c5),a                       ;[09a1] d3 c5
                    ld        d,h                           ;[09a3] 54
                    ld        e,l                           ;[09a4] 5d
                    pop       hl                            ;[09a5] e1
                    pop       af                            ;[09a6] f1
                    push      af                            ;[09a7] f5
                    ld        a,$00                         ;[09a8] 3e 00
                    out       ($c5),a                       ;[09aa] d3 c5
                    pop       af                            ;[09ac] f1
                    push      af                            ;[09ad] f5
                    push      bc                            ;[09ae] c5
                    ld        c,a                           ;[09af] 4f
                    ld        a,$80                         ;[09b0] 3e 80
                    out       ($c5),a                       ;[09b2] d3 c5
                    pop       bc                            ;[09b4] c1
                    pop       af                            ;[09b5] f1
                    push      af                            ;[09b6] f5
                    push      bc                            ;[09b7] c5
                    ld        c,b                           ;[09b8] 48
                    ld        a,$80                         ;[09b9] 3e 80
                    out       ($c5),a                       ;[09bb] d3 c5
                    pop       bc                            ;[09bd] c1
                    pop       af                            ;[09be] f1
                    push      af                            ;[09bf] f5
                    ld        a,$80                         ;[09c0] 3e 80
                    out       ($c5),a                       ;[09c2] d3 c5
                    pop       af                            ;[09c4] f1
                    push      af                            ;[09c5] f5
                    push      bc                            ;[09c6] c5
                    ld        c,d                           ;[09c7] 4a
                    ld        a,$80                         ;[09c8] 3e 80
                    out       ($c5),a                       ;[09ca] d3 c5
                    pop       bc                            ;[09cc] c1
                    pop       af                            ;[09cd] f1
                    push      af                            ;[09ce] f5
                    push      bc                            ;[09cf] c5
                    ld        c,e                           ;[09d0] 4b
                    ld        a,$80                         ;[09d1] 3e 80
                    out       ($c5),a                       ;[09d3] d3 c5
                    pop       bc                            ;[09d5] c1
                    pop       af                            ;[09d6] f1
                    push      af                            ;[09d7] f5
                    push      hl                            ;[09d8] e5
                    ld        h,b                           ;[09d9] 60
                    ld        l,c                           ;[09da] 69
                    ld        a,$40                         ;[09db] 3e 40
                    out       ($c5),a                       ;[09dd] d3 c5
                    ld        b,h                           ;[09df] 44
                    ld        c,l                           ;[09e0] 4d
                    pop       hl                            ;[09e1] e1
                    pop       af                            ;[09e2] f1
                    push      af                            ;[09e3] f5
                    push      hl                            ;[09e4] e5
                    ld        h,d                           ;[09e5] 62
                    ld        l,e                           ;[09e6] 6b
                    ld        a,$40                         ;[09e7] 3e 40
                    out       ($c5),a                       ;[09e9] d3 c5
                    ld        d,h                           ;[09eb] 54
                    ld        e,l                           ;[09ec] 5d
                    pop       hl                            ;[09ed] e1
                    pop       af                            ;[09ee] f1
                    push      af                            ;[09ef] f5
                    ld        a,$40                         ;[09f0] 3e 40
                    out       ($c5),a                       ;[09f2] d3 c5
                    pop       af                            ;[09f4] f1
                    push      af                            ;[09f5] f5
                    push      bc                            ;[09f6] c5
                    ld        c,a                           ;[09f7] 4f
                    ld        a,$c0                         ;[09f8] 3e c0
                    out       ($c5),a                       ;[09fa] d3 c5
                    pop       bc                            ;[09fc] c1
                    pop       af                            ;[09fd] f1
                    push      af                            ;[09fe] f5
                    push      bc                            ;[09ff] c5
                    ld        c,b                           ;[0a00] 48
                    ld        a,$c0                         ;[0a01] 3e c0
                    out       ($c5),a                       ;[0a03] d3 c5
                    pop       bc                            ;[0a05] c1
                    pop       af                            ;[0a06] f1
                    push      af                            ;[0a07] f5
                    ld        a,$c0                         ;[0a08] 3e c0
                    out       ($c5),a                       ;[0a0a] d3 c5
                    pop       af                            ;[0a0c] f1
                    push      af                            ;[0a0d] f5
                    push      bc                            ;[0a0e] c5
                    ld        c,d                           ;[0a0f] 4a
                    ld        a,$c0                         ;[0a10] 3e c0
                    out       ($c5),a                       ;[0a12] d3 c5
                    pop       bc                            ;[0a14] c1
                    pop       af                            ;[0a15] f1
                    push      af                            ;[0a16] f5
                    push      bc                            ;[0a17] c5
                    ld        c,e                           ;[0a18] 4b
                    ld        a,$c0                         ;[0a19] 3e c0
                    out       ($c5),a                       ;[0a1b] d3 c5
                    pop       bc                            ;[0a1d] c1
                    pop       af                            ;[0a1e] f1
                    push      af                            ;[0a1f] f5
                    push      hl                            ;[0a20] e5
                    ld        h,b                           ;[0a21] 60
                    ld        l,c                           ;[0a22] 69
                    ld        a,$01                         ;[0a23] 3e 01
                    out       ($c5),a                       ;[0a25] d3 c5
                    ld        b,h                           ;[0a27] 44
                    ld        c,l                           ;[0a28] 4d
                    pop       hl                            ;[0a29] e1
                    pop       af                            ;[0a2a] f1
                    push      af                            ;[0a2b] f5
                    push      hl                            ;[0a2c] e5
                    ld        h,d                           ;[0a2d] 62
                    ld        l,e                           ;[0a2e] 6b
                    ld        a,$01                         ;[0a2f] 3e 01
                    out       ($c5),a                       ;[0a31] d3 c5
                    ld        d,h                           ;[0a33] 54
                    ld        e,l                           ;[0a34] 5d
                    pop       hl                            ;[0a35] e1
                    pop       af                            ;[0a36] f1
                    push      af                            ;[0a37] f5
                    ld        a,$01                         ;[0a38] 3e 01
                    out       ($c5),a                       ;[0a3a] d3 c5
                    pop       af                            ;[0a3c] f1
                    push      af                            ;[0a3d] f5
                    push      bc                            ;[0a3e] c5
                    ld        c,a                           ;[0a3f] 4f
                    ld        a,$81                         ;[0a40] 3e 81
                    out       ($c5),a                       ;[0a42] d3 c5
                    pop       bc                            ;[0a44] c1
                    pop       af                            ;[0a45] f1
                    push      af                            ;[0a46] f5
                    push      bc                            ;[0a47] c5
                    ld        c,b                           ;[0a48] 48
                    ld        a,$81                         ;[0a49] 3e 81
                    out       ($c5),a                       ;[0a4b] d3 c5
                    pop       bc                            ;[0a4d] c1
                    pop       af                            ;[0a4e] f1
                    push      af                            ;[0a4f] f5
                    ld        a,$81                         ;[0a50] 3e 81
                    out       ($c5),a                       ;[0a52] d3 c5
                    pop       af                            ;[0a54] f1
                    push      af                            ;[0a55] f5
                    push      bc                            ;[0a56] c5
                    ld        c,d                           ;[0a57] 4a
                    ld        a,$81                         ;[0a58] 3e 81
                    out       ($c5),a                       ;[0a5a] d3 c5
                    pop       bc                            ;[0a5c] c1
                    pop       af                            ;[0a5d] f1
                    push      af                            ;[0a5e] f5
                    push      bc                            ;[0a5f] c5
                    ld        c,e                           ;[0a60] 4b
                    ld        a,$81                         ;[0a61] 3e 81
                    out       ($c5),a                       ;[0a63] d3 c5
                    pop       bc                            ;[0a65] c1
                    pop       af                            ;[0a66] f1
                    push      af                            ;[0a67] f5
                    push      hl                            ;[0a68] e5
                    ld        h,b                           ;[0a69] 60
                    ld        l,c                           ;[0a6a] 69
                    ld        a,$41                         ;[0a6b] 3e 41
                    out       ($c5),a                       ;[0a6d] d3 c5
                    ld        b,h                           ;[0a6f] 44
                    ld        c,l                           ;[0a70] 4d
                    pop       hl                            ;[0a71] e1
                    pop       af                            ;[0a72] f1
                    push      af                            ;[0a73] f5
                    push      hl                            ;[0a74] e5
                    ld        h,d                           ;[0a75] 62
                    ld        l,e                           ;[0a76] 6b
                    ld        a,$41                         ;[0a77] 3e 41
                    out       ($c5),a                       ;[0a79] d3 c5
                    ld        d,h                           ;[0a7b] 54
                    ld        e,l                           ;[0a7c] 5d
                    pop       hl                            ;[0a7d] e1
                    pop       af                            ;[0a7e] f1
                    push      af                            ;[0a7f] f5
                    ld        a,$41                         ;[0a80] 3e 41
                    out       ($c5),a                       ;[0a82] d3 c5
                    pop       af                            ;[0a84] f1
                    push      af                            ;[0a85] f5
                    push      bc                            ;[0a86] c5
                    ld        c,a                           ;[0a87] 4f
                    ld        a,$c1                         ;[0a88] 3e c1
                    out       ($c5),a                       ;[0a8a] d3 c5
                    pop       bc                            ;[0a8c] c1
                    pop       af                            ;[0a8d] f1
                    push      af                            ;[0a8e] f5
                    push      bc                            ;[0a8f] c5
                    ld        c,b                           ;[0a90] 48
                    ld        a,$c1                         ;[0a91] 3e c1
                    out       ($c5),a                       ;[0a93] d3 c5
                    pop       bc                            ;[0a95] c1
                    pop       af                            ;[0a96] f1
                    push      af                            ;[0a97] f5
                    ld        a,$c1                         ;[0a98] 3e c1
                    out       ($c5),a                       ;[0a9a] d3 c5
                    pop       af                            ;[0a9c] f1
                    push      af                            ;[0a9d] f5
                    push      bc                            ;[0a9e] c5
                    ld        c,d                           ;[0a9f] 4a
                    ld        a,$c1                         ;[0aa0] 3e c1
                    out       ($c5),a                       ;[0aa2] d3 c5
                    pop       bc                            ;[0aa4] c1
                    pop       af                            ;[0aa5] f1
                    push      af                            ;[0aa6] f5
                    push      bc                            ;[0aa7] c5
                    ld        c,e                           ;[0aa8] 4b
                    ld        a,$c1                         ;[0aa9] 3e c1
                    out       ($c5),a                       ;[0aab] d3 c5
                    pop       bc                            ;[0aad] c1
                    pop       af                            ;[0aae] f1
                    push      af                            ;[0aaf] f5
                    push      hl                            ;[0ab0] e5
                    ld        h,b                           ;[0ab1] 60
                    ld        l,c                           ;[0ab2] 69
                    ld        a,$02                         ;[0ab3] 3e 02
                    out       ($c5),a                       ;[0ab5] d3 c5
                    ld        b,h                           ;[0ab7] 44
                    ld        c,l                           ;[0ab8] 4d
                    pop       hl                            ;[0ab9] e1
                    pop       af                            ;[0aba] f1
                    push      af                            ;[0abb] f5
                    push      hl                            ;[0abc] e5
                    ld        h,d                           ;[0abd] 62
                    ld        l,e                           ;[0abe] 6b
                    ld        a,$02                         ;[0abf] 3e 02
                    out       ($c5),a                       ;[0ac1] d3 c5
                    ld        d,h                           ;[0ac3] 54
                    ld        e,l                           ;[0ac4] 5d
                    pop       hl                            ;[0ac5] e1
                    pop       af                            ;[0ac6] f1
                    push      af                            ;[0ac7] f5
                    ld        a,$02                         ;[0ac8] 3e 02
                    out       ($c5),a                       ;[0aca] d3 c5
                    pop       af                            ;[0acc] f1
                    push      af                            ;[0acd] f5
                    push      bc                            ;[0ace] c5
                    ld        c,a                           ;[0acf] 4f
                    ld        a,$82                         ;[0ad0] 3e 82
                    out       ($c5),a                       ;[0ad2] d3 c5
                    pop       bc                            ;[0ad4] c1
                    pop       af                            ;[0ad5] f1
                    push      af                            ;[0ad6] f5
                    push      bc                            ;[0ad7] c5
                    ld        c,b                           ;[0ad8] 48
                    ld        a,$82                         ;[0ad9] 3e 82
                    out       ($c5),a                       ;[0adb] d3 c5
                    pop       bc                            ;[0add] c1
                    pop       af                            ;[0ade] f1
                    push      af                            ;[0adf] f5
                    ld        a,$82                         ;[0ae0] 3e 82
                    out       ($c5),a                       ;[0ae2] d3 c5
                    pop       af                            ;[0ae4] f1
                    push      af                            ;[0ae5] f5
                    push      bc                            ;[0ae6] c5
                    ld        c,d                           ;[0ae7] 4a
                    ld        a,$82                         ;[0ae8] 3e 82
                    out       ($c5),a                       ;[0aea] d3 c5
                    pop       bc                            ;[0aec] c1
                    pop       af                            ;[0aed] f1
                    push      af                            ;[0aee] f5
                    push      bc                            ;[0aef] c5
                    ld        c,e                           ;[0af0] 4b
                    ld        a,$82                         ;[0af1] 3e 82
                    out       ($c5),a                       ;[0af3] d3 c5
                    pop       bc                            ;[0af5] c1
                    pop       af                            ;[0af6] f1
                    push      hl                            ;[0af7] e5
                    ld        h,b                           ;[0af8] 60
                    ld        l,c                           ;[0af9] 69
                    in        a,($c8)                       ;[0afa] db c8
                    pop       hl                            ;[0afc] e1
                    push      hl                            ;[0afd] e5
                    ld        h,d                           ;[0afe] 62
                    ld        l,e                           ;[0aff] 6b
                    in        a,($c8)                       ;[0b00] db c8
                    pop       hl                            ;[0b02] e1
                    in        a,($c8)                       ;[0b03] db c8
                    out       ($c6),a                       ;[0b05] d3 c6
                    ld        a,b                           ;[0b07] 78
                    out       ($c6),a                       ;[0b08] d3 c6
                    ld        a,c                           ;[0b0a] 79
                    out       ($c6),a                       ;[0b0b] d3 c6
                    ld        a,d                           ;[0b0d] 7a
                    out       ($c6),a                       ;[0b0e] d3 c6
                    ld        a,e                           ;[0b10] 7b
                    out       ($c6),a                       ;[0b11] d3 c6
                    ld        a,h                           ;[0b13] 7c
                    out       ($c6),a                       ;[0b14] d3 c6
                    ld        a,l                           ;[0b16] 7d
                    out       ($c6),a                       ;[0b17] d3 c6
                    out       ($c6),a                       ;[0b19] d3 c6
                    ld        a,b                           ;[0b1b] 78
                    out       ($c6),a                       ;[0b1c] d3 c6
                    ld        a,c                           ;[0b1e] 79
                    out       ($c6),a                       ;[0b1f] d3 c6
                    ld        a,d                           ;[0b21] 7a
                    out       ($c6),a                       ;[0b22] d3 c6
                    ld        a,e                           ;[0b24] 7b
                    out       ($c6),a                       ;[0b25] d3 c6
                    ld        a,h                           ;[0b27] 7c
                    out       ($c6),a                       ;[0b28] d3 c6
                    ld        a,l                           ;[0b2a] 7d
                    out       ($c6),a                       ;[0b2b] d3 c6
                    out       ($c7),a                       ;[0b2d] d3 c7
                    ld        a,b                           ;[0b2f] 78
                    out       ($c7),a                       ;[0b30] d3 c7
                    ld        a,c                           ;[0b32] 79
                    out       ($c7),a                       ;[0b33] d3 c7
                    ld        a,d                           ;[0b35] 7a
                    out       ($c7),a                       ;[0b36] d3 c7
                    ld        a,e                           ;[0b38] 7b
                    out       ($c7),a                       ;[0b39] d3 c7
                    ld        a,h                           ;[0b3b] 7c
                    out       ($c7),a                       ;[0b3c] d3 c7
                    ld        a,l                           ;[0b3e] 7d
                    out       ($c7),a                       ;[0b3f] d3 c7
                    out       ($c7),a                       ;[0b41] d3 c7
                    ld        a,b                           ;[0b43] 78
                    out       ($c7),a                       ;[0b44] d3 c7
                    ld        a,c                           ;[0b46] 79
                    out       ($c7),a                       ;[0b47] d3 c7
                    ld        a,d                           ;[0b49] 7a
                    out       ($c7),a                       ;[0b4a] d3 c7
                    ld        a,e                           ;[0b4c] 7b
                    out       ($c7),a                       ;[0b4d] d3 c7
                    ld        a,h                           ;[0b4f] 7c
                    out       ($c7),a                       ;[0b50] d3 c7
                    ld        a,l                           ;[0b52] 7d
                    out       ($c7),a                       ;[0b53] d3 c7
