org $0000

.Main

@Interrupt
    IM 0
    IM 1
    IM 2
    DI
    EI
    HALT

@Stack
    PUSH AF
    PUSH BC
    PUSH DE
    PUSH HL
    PUSH IX
    PUSH IY
    POP AF
    POP BC
    POP DE
    POP HL
    POP IX
    POP IY

@Exchange
    EX DE, HL
    EX AF, AF'
    EX (SP), HL
    EX (SP), IX
    EX (SP), IY
    EXX

@Repeart
    LDI
    LDIR
    LDD
    LDDR
    CPI
    CPIR
    CPD
    CPDR
    OUTI
    OTIR
    OUTIR
    OUTD
    OTDR
    OUTDR

@Other
    NOP
    DAA
    CPL
    CCF
    SCF
    NEG
