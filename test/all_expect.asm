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
