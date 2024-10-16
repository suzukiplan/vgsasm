                    nop                                     ;[0000] 00
                    im        0                             ;[0001] ed 46
                    im        1                             ;[0003] ed 56
                    im        2                             ;[0005] ed 5e
                    di                                      ;[0007] f3
                    ei                                      ;[0008] fb
                    halt                                    ;[0009] 76
                    push      af                            ;[000a] f5
                    push      bc                            ;[000b] c5
                    push      de                            ;[000c] d5
                    push      hl                            ;[000d] e5
                    push      ix                            ;[000e] dd e5
                    push      iy                            ;[0010] fd e5
                    pop       af                            ;[0012] f1
                    pop       bc                            ;[0013] c1
                    pop       de                            ;[0014] d1
                    pop       hl                            ;[0015] e1
                    pop       ix                            ;[0016] dd e1
                    pop       iy                            ;[0018] fd e1
                    ex        de,hl                         ;[001a] eb
                    ex        af,af'                        ;[001b] 08
                    ex        (sp),hl                       ;[001c] e3
                    ex        (sp),ix                       ;[001d] dd e3
                    ex        (sp),iy                       ;[001f] fd e3
                    exx                                     ;[0021] d9
                    ldi                                     ;[0022] ed a0
                    ldir                                    ;[0024] ed b0
                    ldd                                     ;[0026] ed a8
                    lddr                                    ;[0028] ed b8
                    cpi                                     ;[002a] ed a1
                    cpir                                    ;[002c] ed b1
                    cpd                                     ;[002e] ed a9
                    cpdr                                    ;[0030] ed b9
                    outi                                    ;[0032] ed a3
                    otir                                    ;[0034] ed b3
                    otir                                    ;[0036] ed b3
                    outd                                    ;[0038] ed ab
                    otdr                                    ;[003a] ed bb
                    otdr                                    ;[003c] ed bb
