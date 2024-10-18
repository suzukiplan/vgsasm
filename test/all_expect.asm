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
                    push      de                            ;[01c0] d5
                    ld        d,$12                         ;[01c1] 16 12
                    ld        e,$34                         ;[01c3] 1e 34
                    add       hl,de                         ;[01c5] 19
                    pop       de                            ;[01c6] d1
                    push      de                            ;[01c7] d5
                    ld        d,$56                         ;[01c8] 16 56
                    ld        e,$78                         ;[01ca] 1e 78
                    add       ix,de                         ;[01cc] dd 19
                    pop       de                            ;[01ce] d1
                    push      de                            ;[01cf] d5
                    ld        d,$9a                         ;[01d0] 16 9a
                    ld        e,$bc                         ;[01d2] 1e bc
                    add       iy,de                         ;[01d4] fd 19
                    pop       de                            ;[01d6] d1
                    adc       a                             ;[01d7] 8f
                    adc       b                             ;[01d8] 88
                    adc       c                             ;[01d9] 89
                    adc       d                             ;[01da] 8a
                    adc       e                             ;[01db] 8b
                    adc       h                             ;[01dc] 8c
                    adc       l                             ;[01dd] 8d
                    adc       ixh                           ;[01de] dd 8c
                    adc       ixl                           ;[01e0] dd 8d
                    adc       iyh                           ;[01e2] fd 8c
                    adc       iyl                           ;[01e4] fd 8d
                    adc       $ff                           ;[01e6] ce ff
                    adc       (hl)                          ;[01e8] 8e
                    adc       (ix+$00)                      ;[01e9] dd 8e 00
                    adc       (ix-$80)                      ;[01ec] dd 8e 80
                    adc       (ix+$7f)                      ;[01ef] dd 8e 7f
                    adc       (iy+$00)                      ;[01f2] fd 8e 00
                    adc       (iy-$80)                      ;[01f5] fd 8e 80
                    adc       (iy+$7f)                      ;[01f8] fd 8e 7f
                    adc       a                             ;[01fb] 8f
                    adc       b                             ;[01fc] 88
                    adc       c                             ;[01fd] 89
                    adc       d                             ;[01fe] 8a
                    adc       e                             ;[01ff] 8b
                    adc       h                             ;[0200] 8c
                    adc       l                             ;[0201] 8d
                    adc       ixh                           ;[0202] dd 8c
                    adc       ixl                           ;[0204] dd 8d
                    adc       iyh                           ;[0206] fd 8c
                    adc       iyl                           ;[0208] fd 8d
                    adc       $ff                           ;[020a] ce ff
                    adc       (hl)                          ;[020c] 8e
                    adc       (ix+$00)                      ;[020d] dd 8e 00
                    adc       (ix-$80)                      ;[0210] dd 8e 80
                    adc       (ix+$7f)                      ;[0213] dd 8e 7f
                    adc       (iy+$00)                      ;[0216] fd 8e 00
                    adc       (iy-$80)                      ;[0219] fd 8e 80
                    adc       (iy+$7f)                      ;[021c] fd 8e 7f
                    adc       hl,bc                         ;[021f] ed 4a
                    adc       hl,de                         ;[0221] ed 5a
                    adc       hl,hl                         ;[0223] ed 6a
                    adc       hl,sp                         ;[0225] ed 7a
                    sub       a                             ;[0227] 97
                    sub       b                             ;[0228] 90
                    sub       c                             ;[0229] 91
                    sub       d                             ;[022a] 92
                    sub       e                             ;[022b] 93
                    sub       h                             ;[022c] 94
                    sub       l                             ;[022d] 95
                    sub       ixh                           ;[022e] dd 94
                    sub       ixl                           ;[0230] dd 95
                    sub       iyh                           ;[0232] fd 94
                    sub       iyl                           ;[0234] fd 95
                    sub       $ff                           ;[0236] d6 ff
                    sub       (hl)                          ;[0238] 96
                    sub       (ix+$00)                      ;[0239] dd 96 00
                    sub       (ix-$80)                      ;[023c] dd 96 80
                    sub       (ix+$7f)                      ;[023f] dd 96 7f
                    sub       (iy+$00)                      ;[0242] fd 96 00
                    sub       (iy-$80)                      ;[0245] fd 96 80
                    sub       (iy+$7f)                      ;[0248] fd 96 7f
                    sub       a                             ;[024b] 97
                    sub       b                             ;[024c] 90
                    sub       c                             ;[024d] 91
                    sub       d                             ;[024e] 92
                    sub       e                             ;[024f] 93
                    sub       h                             ;[0250] 94
                    sub       l                             ;[0251] 95
                    sub       ixh                           ;[0252] dd 94
                    sub       ixl                           ;[0254] dd 95
                    sub       iyh                           ;[0256] fd 94
                    sub       iyl                           ;[0258] fd 95
                    sub       $ff                           ;[025a] d6 ff
                    sub       (hl)                          ;[025c] 96
                    sub       (ix+$00)                      ;[025d] dd 96 00
                    sub       (ix-$80)                      ;[0260] dd 96 80
                    sub       (ix+$7f)                      ;[0263] dd 96 7f
                    sub       (iy+$00)                      ;[0266] fd 96 00
                    sub       (iy-$80)                      ;[0269] fd 96 80
                    sub       (iy+$7f)                      ;[026c] fd 96 7f
                    sbc       a                             ;[026f] 9f
                    sbc       b                             ;[0270] 98
                    sbc       c                             ;[0271] 99
                    sbc       d                             ;[0272] 9a
                    sbc       e                             ;[0273] 9b
                    sbc       h                             ;[0274] 9c
                    sbc       l                             ;[0275] 9d
                    sbc       ixh                           ;[0276] dd 9c
                    sbc       ixl                           ;[0278] dd 9d
                    sbc       iyh                           ;[027a] fd 9c
                    sbc       iyl                           ;[027c] fd 9d
                    sbc       $ff                           ;[027e] de ff
                    sbc       (hl)                          ;[0280] 9e
                    sbc       (ix+$00)                      ;[0281] dd 9e 00
                    sbc       (ix-$80)                      ;[0284] dd 9e 80
                    sbc       (ix+$7f)                      ;[0287] dd 9e 7f
                    sbc       (iy+$00)                      ;[028a] fd 9e 00
                    sbc       (iy-$80)                      ;[028d] fd 9e 80
                    sbc       (iy+$7f)                      ;[0290] fd 9e 7f
                    sbc       a                             ;[0293] 9f
                    sbc       b                             ;[0294] 98
                    sbc       c                             ;[0295] 99
                    sbc       d                             ;[0296] 9a
                    sbc       e                             ;[0297] 9b
                    sbc       h                             ;[0298] 9c
                    sbc       l                             ;[0299] 9d
                    sbc       ixh                           ;[029a] dd 9c
                    sbc       ixl                           ;[029c] dd 9d
                    sbc       iyh                           ;[029e] fd 9c
                    sbc       iyl                           ;[02a0] fd 9d
                    sbc       $ff                           ;[02a2] de ff
                    sbc       (hl)                          ;[02a4] 9e
                    sbc       (ix+$00)                      ;[02a5] dd 9e 00
                    sbc       (ix-$80)                      ;[02a8] dd 9e 80
                    sbc       (ix+$7f)                      ;[02ab] dd 9e 7f
                    sbc       (iy+$00)                      ;[02ae] fd 9e 00
                    sbc       (iy-$80)                      ;[02b1] fd 9e 80
                    sbc       (iy+$7f)                      ;[02b4] fd 9e 7f
                    sbc       hl,bc                         ;[02b7] ed 42
                    sbc       hl,de                         ;[02b9] ed 52
                    sbc       hl,hl                         ;[02bb] ed 62
                    sbc       hl,sp                         ;[02bd] ed 72
                    bit       0,a                           ;[02bf] cb 47
                    bit       1,b                           ;[02c1] cb 48
                    bit       2,c                           ;[02c3] cb 51
                    bit       3,d                           ;[02c5] cb 5a
                    bit       4,e                           ;[02c7] cb 63
                    bit       5,h                           ;[02c9] cb 6c
                    bit       6,l                           ;[02cb] cb 75
                    set       7,a                           ;[02cd] cb ff
                    set       0,b                           ;[02cf] cb c0
                    set       1,c                           ;[02d1] cb c9
                    set       2,d                           ;[02d3] cb d2
                    set       3,e                           ;[02d5] cb db
                    set       4,h                           ;[02d7] cb e4
                    set       5,l                           ;[02d9] cb ed
                    res       6,a                           ;[02db] cb b7
                    res       7,b                           ;[02dd] cb b8
                    res       0,c                           ;[02df] cb 81
                    res       1,d                           ;[02e1] cb 8a
                    res       2,e                           ;[02e3] cb 93
                    res       3,h                           ;[02e5] cb 9c
                    res       4,l                           ;[02e7] cb a5
                    bit       0,(hl)                        ;[02e9] cb 46
                    set       1,(hl)                        ;[02eb] cb ce
                    res       2,(hl)                        ;[02ed] cb 96
                    bit       0,(ix+$00)                    ;[02ef] dd cb 00 46
                    set       1,(ix+$00)                    ;[02f3] dd cb 00 ce
                    res       2,(ix+$00)                    ;[02f7] dd cb 00 96
                    bit       0,(iy+$00)                    ;[02fb] fd cb 00 46
                    set       1,(iy+$00)                    ;[02ff] fd cb 00 ce
                    res       2,(iy+$00)                    ;[0303] fd cb 00 96
                    bit       0,(ix+$7f)                    ;[0307] dd cb 7f 46
                    set       1,(ix+$00)                    ;[030b] dd cb 00 ce
                    res       2,(ix-$80)                    ;[030f] dd cb 80 96
                    bit       0,(iy-$01)                    ;[0313] fd cb ff 46
                    set       1,(iy+$40)                    ;[0317] fd cb 40 ce
                    res       2,(iy-$40)                    ;[031b] fd cb c0 96
                    inc       a                             ;[031f] 3c
                    inc       b                             ;[0320] 04
                    inc       c                             ;[0321] 0c
                    inc       d                             ;[0322] 14
                    inc       e                             ;[0323] 1c
                    inc       h                             ;[0324] 24
                    inc       l                             ;[0325] 2c
                    inc       ixh                           ;[0326] dd 24
                    inc       ixl                           ;[0328] dd 2c
                    inc       iyh                           ;[032a] fd 24
                    inc       iyl                           ;[032c] fd 2c
                    inc       bc                            ;[032e] 03
                    inc       de                            ;[032f] 13
                    inc       hl                            ;[0330] 23
                    inc       sp                            ;[0331] 33
                    inc       ix                            ;[0332] dd 23
                    inc       iy                            ;[0334] fd 23
                    inc       (hl)                          ;[0336] 34
                    inc       (ix+$00)                      ;[0337] dd 34 00
                    inc       (iy+$00)                      ;[033a] fd 34 00
                    inc       (ix-$80)                      ;[033d] dd 34 80
                    inc       (iy-$01)                      ;[0340] fd 34 ff
                    inc       (ix+$01)                      ;[0343] dd 34 01
                    inc       (iy+$7f)                      ;[0346] fd 34 7f
                    push      hl                            ;[0349] e5
                    ld        l,$34                         ;[034a] 2e 34
                    ld        h,$12                         ;[034c] 26 12
                    inc       (hl)                          ;[034e] 34
                    pop       hl                            ;[034f] e1
                    dec       a                             ;[0350] 3d
                    dec       b                             ;[0351] 05
                    dec       c                             ;[0352] 0d
                    dec       d                             ;[0353] 15
                    dec       e                             ;[0354] 1d
                    dec       h                             ;[0355] 25
                    dec       l                             ;[0356] 2d
                    dec       ixh                           ;[0357] dd 25
                    dec       ixl                           ;[0359] dd 2d
                    dec       iyh                           ;[035b] fd 25
                    dec       iyl                           ;[035d] fd 2d
                    dec       bc                            ;[035f] 0b
                    dec       de                            ;[0360] 1b
                    dec       hl                            ;[0361] 2b
                    dec       sp                            ;[0362] 3b
                    dec       ix                            ;[0363] dd 2b
                    dec       iy                            ;[0365] fd 2b
                    dec       (hl)                          ;[0367] 35
                    dec       (ix+$00)                      ;[0368] dd 35 00
                    dec       (iy+$00)                      ;[036b] fd 35 00
                    dec       (ix-$80)                      ;[036e] dd 35 80
                    dec       (iy-$01)                      ;[0371] fd 35 ff
                    dec       (ix+$01)                      ;[0374] dd 35 01
                    dec       (iy+$7f)                      ;[0377] fd 35 7f
                    push      hl                            ;[037a] e5
                    ld        l,$34                         ;[037b] 2e 34
                    ld        h,$12                         ;[037d] 26 12
                    dec       (hl)                          ;[037f] 35
                    pop       hl                            ;[0380] e1
                    rlca                                    ;[0381] 07
                    rla                                     ;[0382] 17
                    rrca                                    ;[0383] 0f
                    rra                                     ;[0384] 1f
                    rlc       a                             ;[0385] cb 07
                    rlc       b                             ;[0387] cb 00
                    rlc       c                             ;[0389] cb 01
                    rlc       d                             ;[038b] cb 02
                    rlc       e                             ;[038d] cb 03
                    rlc       h                             ;[038f] cb 04
                    rlc       l                             ;[0391] cb 05
                    rlc       (hl)                          ;[0393] cb 06
                    rlc       (ix+$00)                      ;[0395] dd cb 00 06
                    rlc       (iy+$00)                      ;[0399] fd cb 00 06
                    rlc       (ix-$80)                      ;[039d] dd cb 80 06
                    rlc       (iy-$01)                      ;[03a1] fd cb ff 06
                    rlc       (ix+$01)                      ;[03a5] dd cb 01 06
                    rlc       (iy+$7f)                      ;[03a9] fd cb 7f 06
                    rl        a                             ;[03ad] cb 17
                    rl        b                             ;[03af] cb 10
                    rl        c                             ;[03b1] cb 11
                    rl        d                             ;[03b3] cb 12
                    rl        e                             ;[03b5] cb 13
                    rl        h                             ;[03b7] cb 14
                    rl        l                             ;[03b9] cb 15
                    rl        (hl)                          ;[03bb] cb 16
                    rl        (ix+$00)                      ;[03bd] dd cb 00 16
                    rl        (iy+$00)                      ;[03c1] fd cb 00 16
                    rl        (ix-$80)                      ;[03c5] dd cb 80 16
                    rl        (iy-$01)                      ;[03c9] fd cb ff 16
                    rl        (ix+$01)                      ;[03cd] dd cb 01 16
                    rl        (iy+$7f)                      ;[03d1] fd cb 7f 16
                    rrc       a                             ;[03d5] cb 0f
                    rrc       b                             ;[03d7] cb 08
                    rrc       c                             ;[03d9] cb 09
                    rrc       d                             ;[03db] cb 0a
                    rrc       e                             ;[03dd] cb 0b
                    rrc       h                             ;[03df] cb 0c
                    rrc       l                             ;[03e1] cb 0d
                    rrc       (hl)                          ;[03e3] cb 0e
                    rrc       (ix+$00)                      ;[03e5] dd cb 00 0e
                    rrc       (iy+$00)                      ;[03e9] fd cb 00 0e
                    rrc       (ix-$80)                      ;[03ed] dd cb 80 0e
                    rrc       (iy-$01)                      ;[03f1] fd cb ff 0e
                    rrc       (ix+$01)                      ;[03f5] dd cb 01 0e
                    rrc       (iy+$7f)                      ;[03f9] fd cb 7f 0e
                    rr        a                             ;[03fd] cb 1f
                    rr        b                             ;[03ff] cb 18
                    rr        c                             ;[0401] cb 19
                    rr        d                             ;[0403] cb 1a
                    rr        e                             ;[0405] cb 1b
                    rr        h                             ;[0407] cb 1c
                    rr        l                             ;[0409] cb 1d
                    rr        (hl)                          ;[040b] cb 1e
                    rr        (ix+$00)                      ;[040d] dd cb 00 1e
                    rr        (iy+$00)                      ;[0411] fd cb 00 1e
                    rr        (ix-$80)                      ;[0415] dd cb 80 1e
                    rr        (iy-$01)                      ;[0419] fd cb ff 1e
                    rr        (ix+$01)                      ;[041d] dd cb 01 1e
                    rr        (iy+$7f)                      ;[0421] fd cb 7f 1e
                    sla       a                             ;[0425] cb 27
                    sla       b                             ;[0427] cb 20
                    sla       c                             ;[0429] cb 21
                    sla       d                             ;[042b] cb 22
                    sla       e                             ;[042d] cb 23
                    sla       h                             ;[042f] cb 24
                    sla       l                             ;[0431] cb 25
                    sla       (hl)                          ;[0433] cb 26
                    sla       (ix+$00)                      ;[0435] dd cb 00 26
                    sla       (iy+$00)                      ;[0439] fd cb 00 26
                    sla       (ix-$80)                      ;[043d] dd cb 80 26
                    sla       (iy-$01)                      ;[0441] fd cb ff 26
                    sla       (ix+$01)                      ;[0445] dd cb 01 26
                    sla       (iy+$7f)                      ;[0449] fd cb 7f 26
                    sla       a                             ;[044d] cb 27
                    sla       b                             ;[044f] cb 20
                    sla       c                             ;[0451] cb 21
                    sla       d                             ;[0453] cb 22
                    sla       e                             ;[0455] cb 23
                    sla       h                             ;[0457] cb 24
                    sla       l                             ;[0459] cb 25
                    sla       (hl)                          ;[045b] cb 26
                    sla       (ix+$00)                      ;[045d] dd cb 00 26
                    sla       (iy+$00)                      ;[0461] fd cb 00 26
                    sla       (ix-$80)                      ;[0465] dd cb 80 26
                    sla       (iy-$01)                      ;[0469] fd cb ff 26
                    sla       (ix+$01)                      ;[046d] dd cb 01 26
                    sla       (iy+$7f)                      ;[0471] fd cb 7f 26
                    sll       a                             ;[0475] cb 37
                    sll       b                             ;[0477] cb 30
                    sll       c                             ;[0479] cb 31
                    sll       d                             ;[047b] cb 32
                    sll       e                             ;[047d] cb 33
                    sll       h                             ;[047f] cb 34
                    sll       l                             ;[0481] cb 35
                    sll       (hl)                          ;[0483] cb 36
                    sll       (ix+$00)                      ;[0485] dd cb 00 36
                    sll       (iy+$00)                      ;[0489] fd cb 00 36
                    sll       (ix-$80)                      ;[048d] dd cb 80 36
                    sll       (iy-$01)                      ;[0491] fd cb ff 36
                    sll       (ix+$01)                      ;[0495] dd cb 01 36
                    sll       (iy+$7f)                      ;[0499] fd cb 7f 36
                    sra       a                             ;[049d] cb 2f
                    sra       b                             ;[049f] cb 28
                    sra       c                             ;[04a1] cb 29
                    sra       d                             ;[04a3] cb 2a
                    sra       e                             ;[04a5] cb 2b
                    sra       h                             ;[04a7] cb 2c
                    sra       l                             ;[04a9] cb 2d
                    sra       (hl)                          ;[04ab] cb 2e
                    sra       (ix+$00)                      ;[04ad] dd cb 00 2e
                    sra       (iy+$00)                      ;[04b1] fd cb 00 2e
                    sra       (ix-$80)                      ;[04b5] dd cb 80 2e
                    sra       (iy-$01)                      ;[04b9] fd cb ff 2e
                    sra       (ix+$01)                      ;[04bd] dd cb 01 2e
                    sra       (iy+$7f)                      ;[04c1] fd cb 7f 2e
                    srl       a                             ;[04c5] cb 3f
                    srl       b                             ;[04c7] cb 38
                    srl       c                             ;[04c9] cb 39
                    srl       d                             ;[04cb] cb 3a
                    srl       e                             ;[04cd] cb 3b
                    srl       h                             ;[04cf] cb 3c
                    srl       l                             ;[04d1] cb 3d
                    srl       (hl)                          ;[04d3] cb 3e
                    srl       (ix+$00)                      ;[04d5] dd cb 00 3e
                    srl       (iy+$00)                      ;[04d9] fd cb 00 3e
                    srl       (ix-$80)                      ;[04dd] dd cb 80 3e
                    srl       (iy-$01)                      ;[04e1] fd cb ff 3e
                    srl       (ix+$01)                      ;[04e5] dd cb 01 3e
                    srl       (iy+$7f)                      ;[04e9] fd cb 7f 3e
                    srl       a                             ;[04ed] cb 3f
                    srl       b                             ;[04ef] cb 38
                    srl       c                             ;[04f1] cb 39
                    srl       d                             ;[04f3] cb 3a
                    srl       e                             ;[04f5] cb 3b
                    srl       h                             ;[04f7] cb 3c
                    srl       l                             ;[04f9] cb 3d
                    srl       (hl)                          ;[04fb] cb 3e
                    srl       (ix+$00)                      ;[04fd] dd cb 00 3e
                    srl       (iy+$00)                      ;[0501] fd cb 00 3e
                    srl       (ix-$80)                      ;[0505] dd cb 80 3e
                    srl       (iy-$01)                      ;[0509] fd cb ff 3e
                    srl       (ix+$01)                      ;[050d] dd cb 01 3e
                    srl       (iy+$7f)                      ;[0511] fd cb 7f 3e
                    rld                                     ;[0515] ed 6f
                    rrd                                     ;[0517] ed 67
                    ld        a,rlc (ix+$0a)                ;[0519] dd cb 0a 07
                    ld        b,rlc (ix+$0a)                ;[051d] dd cb 0a 00
                    ld        c,rlc (ix+$0a)                ;[0521] dd cb 0a 01
                    ld        d,rlc (ix+$0a)                ;[0525] dd cb 0a 02
                    ld        e,rlc (ix+$0a)                ;[0529] dd cb 0a 03
                    rlc       (ix+$0a)                      ;[052d] dd cb 0a 06
                    ld        h,rlc (ix+$0a)                ;[0531] dd cb 0a 04
                    ld        l,rlc (ix+$0a)                ;[0535] dd cb 0a 05
                    ld        b,rrc (ix+$0a)                ;[0539] dd cb 0a 08
                    ld        b,rl (ix+$0a)                 ;[053d] dd cb 0a 10
                    ld        b,rr (ix+$0a)                 ;[0541] dd cb 0a 18
                    ld        b,sla (ix+$0a)                ;[0545] dd cb 0a 20
                    ld        b,sra (ix+$0a)                ;[0549] dd cb 0a 28
                    ld        b,sll (ix+$0a)                ;[054d] dd cb 0a 30
                    ld        b,srl (ix+$0a)                ;[0551] dd cb 0a 38
                    ld        b,res 0,(ix+$0a)              ;[0555] dd cb 0a 80
                    ld        b,res 1,(ix+$0a)              ;[0559] dd cb 0a 88
                    ld        b,res 2,(ix+$0a)              ;[055d] dd cb 0a 90
                    ld        b,res 3,(ix+$0a)              ;[0561] dd cb 0a 98
                    ld        b,res 4,(ix+$0a)              ;[0565] dd cb 0a a0
                    ld        b,res 5,(ix+$0a)              ;[0569] dd cb 0a a8
                    ld        b,res 6,(ix+$0a)              ;[056d] dd cb 0a b0
                    ld        b,res 7,(ix+$0a)              ;[0571] dd cb 0a b8
                    ld        b,set 0,(ix+$0a)              ;[0575] dd cb 0a c0
                    ld        b,set 1,(ix+$0a)              ;[0579] dd cb 0a c8
                    ld        b,set 2,(ix+$0a)              ;[057d] dd cb 0a d0
                    ld        b,set 3,(ix+$0a)              ;[0581] dd cb 0a d8
                    ld        b,set 4,(ix+$0a)              ;[0585] dd cb 0a e0
                    ld        b,set 5,(ix+$0a)              ;[0589] dd cb 0a e8
                    ld        b,set 6,(ix+$0a)              ;[058d] dd cb 0a f0
                    ld        b,set 7,(ix+$0a)              ;[0591] dd cb 0a f8
                    in        a,($80)                       ;[0595] db 80
                    in        a,(c)                         ;[0597] ed 78
                    in        b,(c)                         ;[0599] ed 40
                    in        c,(c)                         ;[059b] ed 48
                    in        d,(c)                         ;[059d] ed 50
                    in        e,(c)                         ;[059f] ed 58
                    in        (c)                           ;[05a1] ed 70
                    in        h,(c)                         ;[05a3] ed 60
                    in        l,(c)                         ;[05a5] ed 68
                    out       ($ff),a                       ;[05a7] d3 ff
                    out       (c),a                         ;[05a9] ed 79
                    out       (c),b                         ;[05ab] ed 41
                    out       (c),c                         ;[05ad] ed 49
                    out       (c),d                         ;[05af] ed 51
                    out       (c),e                         ;[05b1] ed 59
                    out       (c),0                         ;[05b3] ed 71
                    out       (c),0                         ;[05b5] ed 71
                    out       (c),h                         ;[05b7] ed 61
                    out       (c),l                         ;[05b9] ed 69
                    ini                                     ;[05bb] ed a2
                    inir                                    ;[05bd] ed b2
                    ind                                     ;[05bf] ed aa
                    indr                                    ;[05c1] ed ba
                    outi                                    ;[05c3] ed a3
                    otir                                    ;[05c5] ed b3
                    otir                                    ;[05c7] ed b3
                    outd                                    ;[05c9] ed ab
                    otdr                                    ;[05cb] ed bb
                    otdr                                    ;[05cd] ed bb
                    ld        a,a                           ;[05cf] 7f
                    ld        a,b                           ;[05d0] 78
                    ld        a,c                           ;[05d1] 79
                    ld        a,d                           ;[05d2] 7a
                    ld        a,e                           ;[05d3] 7b
                    ld        a,h                           ;[05d4] 7c
                    ld        a,l                           ;[05d5] 7d
                    ld        a,ixh                         ;[05d6] dd 7c
                    ld        a,ixl                         ;[05d8] dd 7d
                    ld        a,iyh                         ;[05da] fd 7c
                    ld        a,iyl                         ;[05dc] fd 7d
                    ld        b,a                           ;[05de] 47
                    ld        b,b                           ;[05df] 40
                    ld        b,c                           ;[05e0] 41
                    ld        b,d                           ;[05e1] 42
                    ld        b,e                           ;[05e2] 43
                    ld        b,h                           ;[05e3] 44
                    ld        b,l                           ;[05e4] 45
                    ld        b,ixh                         ;[05e5] dd 44
                    ld        b,ixl                         ;[05e7] dd 45
                    ld        b,iyh                         ;[05e9] fd 44
                    ld        b,iyl                         ;[05eb] fd 45
                    ld        c,a                           ;[05ed] 4f
                    ld        c,b                           ;[05ee] 48
                    ld        c,c                           ;[05ef] 49
                    ld        c,d                           ;[05f0] 4a
                    ld        c,e                           ;[05f1] 4b
                    ld        c,h                           ;[05f2] 4c
                    ld        c,l                           ;[05f3] 4d
                    ld        c,ixh                         ;[05f4] dd 4c
                    ld        c,ixl                         ;[05f6] dd 4d
                    ld        c,iyh                         ;[05f8] fd 4c
                    ld        c,iyl                         ;[05fa] fd 4d
                    ld        d,a                           ;[05fc] 57
                    ld        d,b                           ;[05fd] 50
                    ld        d,c                           ;[05fe] 51
                    ld        d,d                           ;[05ff] 52
                    ld        d,e                           ;[0600] 53
                    ld        d,h                           ;[0601] 54
                    ld        d,l                           ;[0602] 55
                    ld        d,ixh                         ;[0603] dd 54
                    ld        d,ixl                         ;[0605] dd 55
                    ld        d,iyh                         ;[0607] fd 54
                    ld        d,iyl                         ;[0609] fd 55
                    ld        e,a                           ;[060b] 5f
                    ld        e,b                           ;[060c] 58
                    ld        e,c                           ;[060d] 59
                    ld        e,d                           ;[060e] 5a
                    ld        e,e                           ;[060f] 5b
                    ld        e,h                           ;[0610] 5c
                    ld        e,l                           ;[0611] 5d
                    ld        e,ixh                         ;[0612] dd 5c
                    ld        e,ixl                         ;[0614] dd 5d
                    ld        e,iyh                         ;[0616] fd 5c
                    ld        e,iyl                         ;[0618] fd 5d
                    ld        h,a                           ;[061a] 67
                    ld        h,b                           ;[061b] 60
                    ld        h,c                           ;[061c] 61
                    ld        h,d                           ;[061d] 62
                    ld        h,e                           ;[061e] 63
                    ld        h,h                           ;[061f] 64
                    ld        h,l                           ;[0620] 65
                    ld        l,a                           ;[0621] 6f
                    ld        l,b                           ;[0622] 68
                    ld        l,c                           ;[0623] 69
                    ld        l,d                           ;[0624] 6a
                    ld        l,e                           ;[0625] 6b
                    ld        l,h                           ;[0626] 6c
                    ld        l,l                           ;[0627] 6d
                    ld        ixh,a                         ;[0628] dd 67
                    ld        ixh,b                         ;[062a] dd 60
                    ld        ixh,c                         ;[062c] dd 61
                    ld        ixh,d                         ;[062e] dd 62
                    ld        ixh,e                         ;[0630] dd 63
                    ld        ixh,ixh                       ;[0632] dd 64
                    ld        ixh,ixl                       ;[0634] dd 65
                    ld        ixl,a                         ;[0636] dd 6f
                    ld        ixl,b                         ;[0638] dd 68
                    ld        ixl,c                         ;[063a] dd 69
                    ld        ixl,d                         ;[063c] dd 6a
                    ld        ixl,e                         ;[063e] dd 6b
                    ld        ixl,ixh                       ;[0640] dd 6c
                    ld        ixl,ixl                       ;[0642] dd 6d
                    ld        iyh,a                         ;[0644] fd 67
                    ld        iyh,b                         ;[0646] fd 60
                    ld        iyh,c                         ;[0648] fd 61
                    ld        iyh,d                         ;[064a] fd 62
                    ld        iyh,e                         ;[064c] fd 63
                    ld        iyh,iyh                       ;[064e] fd 64
                    ld        iyh,iyl                       ;[0650] fd 65
                    ld        iyl,a                         ;[0652] fd 6f
                    ld        iyl,b                         ;[0654] fd 68
                    ld        iyl,c                         ;[0656] fd 69
                    ld        iyl,d                         ;[0658] fd 6a
                    ld        iyl,e                         ;[065a] fd 6b
                    ld        iyl,iyh                       ;[065c] fd 6c
                    ld        iyl,iyl                       ;[065e] fd 6d
                    ld        b,b                           ;[0660] 40
                    ld        c,c                           ;[0661] 49
                    ld        b,d                           ;[0662] 42
                    ld        c,e                           ;[0663] 4b
                    ld        b,h                           ;[0664] 44
                    ld        c,l                           ;[0665] 4d
                    ld        b,ixh                         ;[0666] dd 44
                    ld        c,ixl                         ;[0668] dd 4d
                    ld        b,iyh                         ;[066a] fd 44
                    ld        c,iyl                         ;[066c] fd 4d
                    ld        d,b                           ;[066e] 50
                    ld        e,c                           ;[066f] 59
                    ld        d,d                           ;[0670] 52
                    ld        e,e                           ;[0671] 5b
                    ld        d,h                           ;[0672] 54
                    ld        e,l                           ;[0673] 5d
                    ld        d,ixh                         ;[0674] dd 54
                    ld        c,ixl                         ;[0676] dd 4d
                    ld        d,iyh                         ;[0678] fd 54
                    ld        c,iyl                         ;[067a] fd 4d
                    ld        h,b                           ;[067c] 60
                    ld        l,c                           ;[067d] 69
                    ld        h,d                           ;[067e] 62
                    ld        l,e                           ;[067f] 6b
                    ld        h,h                           ;[0680] 64
                    ld        l,l                           ;[0681] 6d
                    push      ix                            ;[0682] dd e5
                    pop       hl                            ;[0684] e1
                    push      iy                            ;[0685] fd e5
                    pop       hl                            ;[0687] e1
                    ld        ixh,b                         ;[0688] dd 60
                    ld        ixl,c                         ;[068a] dd 69
                    ld        ixh,d                         ;[068c] dd 62
                    ld        ixl,e                         ;[068e] dd 6b
                    push      hl                            ;[0690] e5
                    pop       ix                            ;[0691] dd e1
                    ld        ixh,ixh                       ;[0693] dd 64
                    ld        ixl,ixl                       ;[0695] dd 6d
                    push      iy                            ;[0697] fd e5
                    pop       ix                            ;[0699] dd e1
                    ld        iyh,b                         ;[069b] fd 60
                    ld        iyl,c                         ;[069d] fd 69
                    ld        iyh,d                         ;[069f] fd 62
                    ld        iyl,e                         ;[06a1] fd 6b
                    push      hl                            ;[06a3] e5
                    pop       iy                            ;[06a4] fd e1
                    push      ix                            ;[06a6] dd e5
                    pop       iy                            ;[06a8] fd e1
                    ld        iyh,iyh                       ;[06aa] fd 64
                    ld        iyl,iyl                       ;[06ac] fd 6d
                    ld        sp,hl                         ;[06ae] f9
                    ld        sp,ix                         ;[06af] dd f9
                    ld        sp,iy                         ;[06b1] fd f9
                    ld        a,(hl)                        ;[06b3] 7e
                    ld        b,(hl)                        ;[06b4] 46
                    ld        c,(hl)                        ;[06b5] 4e
                    ld        d,(hl)                        ;[06b6] 56
                    ld        e,(hl)                        ;[06b7] 5e
                    ld        h,(hl)                        ;[06b8] 66
                    ld        l,(hl)                        ;[06b9] 6e
                    push      af                            ;[06ba] f5
                    ld        a,(hl)                        ;[06bb] 7e
                    ld        ixh,a                         ;[06bc] dd 67
                    pop       af                            ;[06be] f1
                    push      af                            ;[06bf] f5
                    ld        a,(hl)                        ;[06c0] 7e
                    ld        ixl,a                         ;[06c1] dd 6f
                    pop       af                            ;[06c3] f1
                    push      af                            ;[06c4] f5
                    ld        a,(hl)                        ;[06c5] 7e
                    ld        iyh,a                         ;[06c6] fd 67
                    pop       af                            ;[06c8] f1
                    push      af                            ;[06c9] f5
                    ld        a,(hl)                        ;[06ca] 7e
                    ld        iyl,a                         ;[06cb] fd 6f
                    pop       af                            ;[06cd] f1
                    ld        c,(hl)                        ;[06ce] 4e
                    inc       hl                            ;[06cf] 23
                    ld        b,(hl)                        ;[06d0] 46
                    dec       hl                            ;[06d1] 2b
                    ld        e,(hl)                        ;[06d2] 5e
                    inc       hl                            ;[06d3] 23
                    ld        d,(hl)                        ;[06d4] 56
                    dec       hl                            ;[06d5] 2b
                    push      af                            ;[06d6] f5
                    ld        a,(hl)                        ;[06d7] 7e
                    ld        ixl,a                         ;[06d8] dd 6f
                    inc       hl                            ;[06da] 23
                    ld        a,(hl)                        ;[06db] 7e
                    ld        ixh,a                         ;[06dc] dd 67
                    dec       hl                            ;[06de] 2b
                    pop       af                            ;[06df] f1
                    push      af                            ;[06e0] f5
                    ld        a,(hl)                        ;[06e1] 7e
                    ld        iyl,a                         ;[06e2] fd 6f
                    inc       hl                            ;[06e4] 23
                    ld        a,(hl)                        ;[06e5] 7e
                    ld        iyh,a                         ;[06e6] fd 67
                    dec       hl                            ;[06e8] 2b
                    pop       af                            ;[06e9] f1
                    ld        (hl),a                        ;[06ea] 77
                    ld        (hl),b                        ;[06eb] 70
                    ld        (hl),c                        ;[06ec] 71
                    ld        (hl),d                        ;[06ed] 72
                    ld        (hl),e                        ;[06ee] 73
                    ld        (hl),h                        ;[06ef] 74
                    ld        (hl),l                        ;[06f0] 75
                    push      af                            ;[06f1] f5
                    ld        a,ixh                         ;[06f2] dd 7c
                    ld        (hl),a                        ;[06f4] 77
                    pop       af                            ;[06f5] f1
                    push      af                            ;[06f6] f5
                    ld        a,ixl                         ;[06f7] dd 7d
                    ld        (hl),a                        ;[06f9] 77
                    pop       af                            ;[06fa] f1
                    push      af                            ;[06fb] f5
                    ld        a,iyh                         ;[06fc] fd 7c
                    ld        (hl),a                        ;[06fe] 77
                    pop       af                            ;[06ff] f1
                    push      af                            ;[0700] f5
                    ld        a,iyl                         ;[0701] fd 7d
                    ld        (hl),a                        ;[0703] 77
                    pop       af                            ;[0704] f1
                    ld        a,$80                         ;[0705] 3e 80
                    ld        b,$ff                         ;[0707] 06 ff
                    ld        c,$00                         ;[0709] 0e 00
                    ld        d,$01                         ;[070b] 16 01
                    ld        e,$7f                         ;[070d] 1e 7f
                    ld        h,$80                         ;[070f] 26 80
                    ld        l,$ff                         ;[0711] 2e ff
                    ld        ixh,$11                       ;[0713] dd 26 11
                    ld        ixl,$22                       ;[0716] dd 2e 22
                    ld        iyh,$88                       ;[0719] fd 26 88
                    ld        iyl,$99                       ;[071c] fd 2e 99
                    ld        bc,$8000                      ;[071f] 01 00 80
                    ld        de,$ffff                      ;[0722] 11 ff ff
                    ld        hl,$1234                      ;[0725] 21 34 12
                    ld        ix,$7fff                      ;[0728] dd 21 ff 7f
                    ld        iy,$ffff                      ;[072c] fd 21 ff ff
                    ld        bc,$0741                      ;[0730] 01 41 07
                    ld        de,$05cf                      ;[0733] 11 cf 05
                    ld        hl,$0009                      ;[0736] 21 09 00
                    ld        ix,$0705                      ;[0739] dd 21 05 07
                    ld        iy,$0000                      ;[073d] fd 21 00 00
                    nop                                     ;[0741] 00
                    ld        a,($1234)                     ;[0742] 3a 34 12
                    ld        bc,($5678)                    ;[0745] ed 4b 78 56
                    ld        de,($9abc)                    ;[0749] ed 5b bc 9a
                    ld        hl,($def0)                    ;[074d] 2a f0 de
                    ld        sp,($2525)                    ;[0750] ed 7b 25 25
                    ld        ix,($0831)                    ;[0754] dd 2a 31 08
                    ld        iy,($8931)                    ;[0758] fd 2a 31 89
                    ld        a,($008c)                     ;[075c] 3a 8c 00
                    ld        bc,($075c)                    ;[075f] ed 4b 5c 07
                    ld        de,($0776)                    ;[0763] ed 5b 76 07
                    ld        hl,($0741)                    ;[0767] 2a 41 07
                    ld        sp,($0730)                    ;[076a] ed 7b 30 07
                    ld        ix,($06ce)                    ;[076e] dd 2a ce 06
                    ld        iy,($06ae)                    ;[0772] fd 2a ae 06
                    nop                                     ;[0776] 00
                    ld        a,(bc)                        ;[0777] 0a
                    ld        a,(de)                        ;[0778] 1a
                    ld        (bc),a                        ;[0779] 02
                    ld        (de),a                        ;[077a] 12
                    ld        a,(ix-$80)                    ;[077b] dd 7e 80
                    ld        b,(ix-$01)                    ;[077e] dd 46 ff
                    ld        c,(ix+$00)                    ;[0781] dd 4e 00
                    ld        d,(ix+$00)                    ;[0784] dd 56 00
                    ld        e,(ix+$01)                    ;[0787] dd 5e 01
                    ld        h,(ix+$7f)                    ;[078a] dd 66 7f
                    ld        l,(ix+$40)                    ;[078d] dd 6e 40
                    ld        a,(iy-$80)                    ;[0790] fd 7e 80
                    ld        b,(iy-$01)                    ;[0793] fd 46 ff
                    ld        c,(iy+$00)                    ;[0796] fd 4e 00
                    ld        d,(iy+$00)                    ;[0799] fd 56 00
                    ld        e,(iy+$01)                    ;[079c] fd 5e 01
                    ld        h,(iy+$7f)                    ;[079f] fd 66 7f
                    ld        l,(iy+$40)                    ;[07a2] fd 6e 40
                    ld        (ix-$80),a                    ;[07a5] dd 77 80
                    ld        (ix-$01),b                    ;[07a8] dd 70 ff
                    ld        (ix+$00),c                    ;[07ab] dd 71 00
                    ld        (ix+$00),d                    ;[07ae] dd 72 00
                    ld        (ix+$01),e                    ;[07b1] dd 73 01
                    ld        (ix+$7f),h                    ;[07b4] dd 74 7f
                    ld        (ix+$40),l                    ;[07b7] dd 75 40
                    ld        (iy-$80),a                    ;[07ba] fd 77 80
                    ld        (iy-$01),b                    ;[07bd] fd 70 ff
                    ld        (iy+$00),c                    ;[07c0] fd 71 00
                    ld        (iy+$00),d                    ;[07c3] fd 72 00
                    ld        (iy+$01),e                    ;[07c6] fd 73 01
                    ld        (iy+$7f),h                    ;[07c9] fd 74 7f
                    ld        (iy+$40),l                    ;[07cc] fd 75 40
