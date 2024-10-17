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
                    or        a                             ;[0068] b7
                    or        b                             ;[0069] b0
                    or        c                             ;[006a] b1
                    or        d                             ;[006b] b2
                    or        e                             ;[006c] b3
                    or        h                             ;[006d] b4
                    or        l                             ;[006e] b5
                    or        ixh                           ;[006f] dd b4
                    or        ixl                           ;[0071] dd b5
                    or        iyh                           ;[0073] fd b4
                    or        iyl                           ;[0075] fd b5
                    or        $ff                           ;[0077] f6 ff
                    or        (hl)                          ;[0079] b6
                    or        (ix+$00)                      ;[007a] dd b6 00
                    or        (ix-$80)                      ;[007d] dd b6 80
                    or        (ix+$7f)                      ;[0080] dd b6 7f
                    or        (iy+$00)                      ;[0083] fd b6 00
                    or        (iy-$80)                      ;[0086] fd b6 80
                    or        (iy+$7f)                      ;[0089] fd b6 7f
                    xor       a                             ;[008c] af
                    xor       b                             ;[008d] a8
                    xor       c                             ;[008e] a9
                    xor       d                             ;[008f] aa
                    xor       e                             ;[0090] ab
                    xor       h                             ;[0091] ac
                    xor       l                             ;[0092] ad
                    xor       ixh                           ;[0093] dd ac
                    xor       ixl                           ;[0095] dd ad
                    xor       iyh                           ;[0097] fd ac
                    xor       iyl                           ;[0099] fd ad
                    xor       $ff                           ;[009b] ee ff
                    xor       (hl)                          ;[009d] ae
                    xor       (ix+$00)                      ;[009e] dd ae 00
                    xor       (ix-$80)                      ;[00a1] dd ae 80
                    xor       (ix+$7f)                      ;[00a4] dd ae 7f
                    xor       (iy+$00)                      ;[00a7] fd ae 00
                    xor       (iy-$80)                      ;[00aa] fd ae 80
                    xor       (iy+$7f)                      ;[00ad] fd ae 7f
                    cp        a                             ;[00b0] bf
                    cp        b                             ;[00b1] b8
                    cp        c                             ;[00b2] b9
                    cp        d                             ;[00b3] ba
                    cp        e                             ;[00b4] bb
                    cp        h                             ;[00b5] bc
                    cp        l                             ;[00b6] bd
                    cp        ixh                           ;[00b7] dd bc
                    cp        ixl                           ;[00b9] dd bd
                    cp        iyh                           ;[00bb] fd bc
                    cp        iyl                           ;[00bd] fd bd
                    cp        $ff                           ;[00bf] fe ff
                    cp        (hl)                          ;[00c1] be
                    cp        (ix+$00)                      ;[00c2] dd be 00
                    cp        (ix-$80)                      ;[00c5] dd be 80
                    cp        (ix+$7f)                      ;[00c8] dd be 7f
                    cp        (iy+$00)                      ;[00cb] fd be 00
                    cp        (iy-$80)                      ;[00ce] fd be 80
                    cp        (iy+$7f)                      ;[00d1] fd be 7f
                    add       a                             ;[00d4] 87
                    add       b                             ;[00d5] 80
                    add       c                             ;[00d6] 81
                    add       d                             ;[00d7] 82
                    add       e                             ;[00d8] 83
                    add       h                             ;[00d9] 84
                    add       l                             ;[00da] 85
                    add       ixh                           ;[00db] dd 84
                    add       ixl                           ;[00dd] dd 85
                    add       iyh                           ;[00df] fd 84
                    add       iyl                           ;[00e1] fd 85
                    add       $ff                           ;[00e3] c6 ff
                    add       (hl)                          ;[00e5] 86
                    add       (ix+$00)                      ;[00e6] dd 86 00
                    add       (ix-$80)                      ;[00e9] dd 86 80
                    add       (ix+$7f)                      ;[00ec] dd 86 7f
                    add       (iy+$00)                      ;[00ef] fd 86 00
                    add       (iy-$80)                      ;[00f2] fd 86 80
                    add       (iy+$7f)                      ;[00f5] fd 86 7f
                    add       a                             ;[00f8] 87
                    add       b                             ;[00f9] 80
                    add       c                             ;[00fa] 81
                    add       d                             ;[00fb] 82
                    add       e                             ;[00fc] 83
                    add       h                             ;[00fd] 84
                    add       l                             ;[00fe] 85
                    add       ixh                           ;[00ff] dd 84
                    add       ixl                           ;[0101] dd 85
                    add       iyh                           ;[0103] fd 84
                    add       iyl                           ;[0105] fd 85
                    add       $ff                           ;[0107] c6 ff
                    add       (hl)                          ;[0109] 86
                    add       (ix+$00)                      ;[010a] dd 86 00
                    add       (ix-$80)                      ;[010d] dd 86 80
                    add       (ix+$7f)                      ;[0110] dd 86 7f
                    add       (iy+$00)                      ;[0113] fd 86 00
                    add       (iy-$80)                      ;[0116] fd 86 80
                    add       (iy+$7f)                      ;[0119] fd 86 7f
                    add       hl,bc                         ;[011c] 09
                    add       hl,de                         ;[011d] 19
                    add       hl,hl                         ;[011e] 29
                    add       hl,sp                         ;[011f] 39
                    add       ix,bc                         ;[0120] dd 09
                    add       ix,de                         ;[0122] dd 19
                    add       ix,ix                         ;[0124] dd 29
                    add       ix,sp                         ;[0126] dd 39
                    add       iy,bc                         ;[0128] fd 09
                    add       iy,de                         ;[012a] fd 19
                    add       iy,iy                         ;[012c] fd 29
                    add       iy,sp                         ;[012e] fd 39
                    push      de                            ;[0130] d5
                    ld        d,$12                         ;[0131] 16 12
                    ld        e,$34                         ;[0133] 1e 34
                    add       hl,de                         ;[0135] 19
                    pop       de                            ;[0136] d1
                    push      de                            ;[0137] d5
                    ld        d,$56                         ;[0138] 16 56
                    ld        e,$78                         ;[013a] 1e 78
                    add       ix,de                         ;[013c] dd 19
                    pop       de                            ;[013e] d1
                    push      de                            ;[013f] d5
                    ld        d,$9a                         ;[0140] 16 9a
                    ld        e,$bc                         ;[0142] 1e bc
                    add       iy,de                         ;[0144] fd 19
                    pop       de                            ;[0146] d1
                    adc       a                             ;[0147] 8f
                    adc       b                             ;[0148] 88
                    adc       c                             ;[0149] 89
                    adc       d                             ;[014a] 8a
                    adc       e                             ;[014b] 8b
                    adc       h                             ;[014c] 8c
                    adc       l                             ;[014d] 8d
                    adc       ixh                           ;[014e] dd 8c
                    adc       ixl                           ;[0150] dd 8d
                    adc       iyh                           ;[0152] fd 8c
                    adc       iyl                           ;[0154] fd 8d
                    adc       $ff                           ;[0156] ce ff
                    adc       (hl)                          ;[0158] 8e
                    adc       (ix+$00)                      ;[0159] dd 8e 00
                    adc       (ix-$80)                      ;[015c] dd 8e 80
                    adc       (ix+$7f)                      ;[015f] dd 8e 7f
                    adc       (iy+$00)                      ;[0162] fd 8e 00
                    adc       (iy-$80)                      ;[0165] fd 8e 80
                    adc       (iy+$7f)                      ;[0168] fd 8e 7f
                    adc       a                             ;[016b] 8f
                    adc       b                             ;[016c] 88
                    adc       c                             ;[016d] 89
                    adc       d                             ;[016e] 8a
                    adc       e                             ;[016f] 8b
                    adc       h                             ;[0170] 8c
                    adc       l                             ;[0171] 8d
                    adc       ixh                           ;[0172] dd 8c
                    adc       ixl                           ;[0174] dd 8d
                    adc       iyh                           ;[0176] fd 8c
                    adc       iyl                           ;[0178] fd 8d
                    adc       $ff                           ;[017a] ce ff
                    adc       (hl)                          ;[017c] 8e
                    adc       (ix+$00)                      ;[017d] dd 8e 00
                    adc       (ix-$80)                      ;[0180] dd 8e 80
                    adc       (ix+$7f)                      ;[0183] dd 8e 7f
                    adc       (iy+$00)                      ;[0186] fd 8e 00
                    adc       (iy-$80)                      ;[0189] fd 8e 80
                    adc       (iy+$7f)                      ;[018c] fd 8e 7f
                    adc       hl,bc                         ;[018f] ed 4a
                    adc       hl,de                         ;[0191] ed 5a
                    adc       hl,hl                         ;[0193] ed 6a
                    adc       hl,sp                         ;[0195] ed 7a
