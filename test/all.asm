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

Calc8:
@And
    AND A
    AND B
    AND C
    AND D
    AND E
    AND H
    AND L
    AND IXH
    AND IXL
    AND IYH
    AND IYL
    AND $FF
    AND (HL)
    AND (IX)
    AND (IX-128)
    AND (IX+127*1)
    AND (IY)
    AND (IY-128)
    AND (IY+127*1)

@Or
    OR A
    OR B
    OR C
    OR D
    OR E
    OR H
    OR L
    OR IXH
    OR IXL
    OR IYH
    OR IYL
    OR $FF
    OR (HL)
    OR (IX)
    OR (IX-128)
    OR (IX+127*1)
    OR (IY)
    OR (IY-128)
    OR (IY+127*1)

@Xor
    XOR A
    XOR B
    XOR C
    XOR D
    XOR E
    XOR H
    XOR L
    XOR IXH
    XOR IXL
    XOR IYH
    XOR IYL
    XOR $FF
    XOR (HL)
    XOR (IX)
    XOR (IX-128)
    XOR (IX+127*1)
    XOR (IY)
    XOR (IY-128)
    XOR (IY+127*1)
