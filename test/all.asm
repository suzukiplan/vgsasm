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
    OUTIR   ; OTIR alias
    OUTD
    OTDR
    OUTDR   ; OTDR alias

@Other
    NOP
    DAA
    CPL
    CCF
    SCF
    NEG

Calculation:
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

@And_with_A ; Strictly speaking, `A,` should be omitted, but it is allowed.
    AND A, A
    AND A, B
    AND A, C
    AND A, D
    AND A, E
    AND A, H
    AND A, L
    AND A, IXH
    AND A, IXL
    AND A, IYH
    AND A, IYL
    AND A, $FF
    AND A, (HL)
    AND A, (IX)
    AND A, (IX-128)
    AND A, (IX+127*1)
    AND A, (IY)
    AND A, (IY-128)
    AND A, (IY+127*1)

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

@Or_with_A ; Strictly speaking, `A,` should be omitted, but it is allowed.
    OR A, A
    OR A, B
    OR A, C
    OR A, D
    OR A, E
    OR A, H
    OR A, L
    OR A, IXH
    OR A, IXL
    OR A, IYH
    OR A, IYL
    OR A, $FF
    OR A, (HL)
    OR A, (IX)
    OR A, (IX-128)
    OR A, (IX+127*1)
    OR A, (IY)
    OR A, (IY-128)
    OR A, (IY+127*1)

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

@Xor_with_A ; Strictly speaking, `A,` should be omitted, but it is allowed.
    XOR A, A
    XOR A, B
    XOR A, C
    XOR A, D
    XOR A, E
    XOR A, H
    XOR A, L
    XOR A, IXH
    XOR A, IXL
    XOR A, IYH
    XOR A, IYL
    XOR A, $FF
    XOR A, (HL)
    XOR A, (IX)
    XOR A, (IX-128)
    XOR A, (IX+127*1)
    XOR A, (IY)
    XOR A, (IY-128)
    XOR A, (IY+127*1)

@Compare
    CP A
    CP B
    CP C
    CP D
    CP E
    CP H
    CP L
    CP IXH
    CP IXL
    CP IYH
    CP IYL
    CP $FF
    CP (HL)
    CP (IX)
    CP (IX-128)
    CP (IX+127*1)
    CP (IY)
    CP (IY-128)
    CP (IY+127*1)

@Compare_with_A ; Strictly speaking, `A,` should be omitted, but it is allowed.
    CP A, A
    CP A, B
    CP A, C
    CP A, D
    CP A, E
    CP A, H
    CP A, L
    CP A, IXH
    CP A, IXL
    CP A, IYH
    CP A, IYL
    CP A, $FF
    CP A, (HL)
    CP A, (IX)
    CP A, (IX-128)
    CP A, (IX+127*1)
    CP A, (IY)
    CP A, (IY-128)
    CP A, (IY+127*1)

@Add
    ADD A, A
    ADD A, B
    ADD A, C
    ADD A, D
    ADD A, E
    ADD A, H
    ADD A, L
    ADD A, IXH
    ADD A, IXL
    ADD A, IYH
    ADD A, IYL
    ADD A, $FF
    ADD A, (HL)
    ADD A, (IX)
    ADD A, (IX-128)
    ADD A, (IX+127*1)
    ADD A, (IY)
    ADD A, (IY-128)
    ADD A, (IY+127*1)

@Add_omit_A ; In strict form, `A,` must not be omitted, but may be omitted
    ADD A
    ADD B
    ADD C
    ADD D
    ADD E
    ADD H
    ADD L
    ADD IXH
    ADD IXL
    ADD IYH
    ADD IYL
    ADD $FF
    ADD (HL)
    ADD (IX)
    ADD (IX-128)
    ADD (IX+127*1)
    ADD (IY)
    ADD (IY-128)
    ADD (IY+127*1)

@Add16
    ADD HL, BC
    ADD HL, DE
    ADD HL, HL
    ADD HL, SP
    ADD IX, BC
    ADD IX, DE
    ADD IX, IX
    ADD IX, SP
    ADD IY, BC
    ADD IY, DE
    ADD IY, IY
    ADD IY, SP

@Add16_nn
    ADD HL, $1234
    ADD IX, $5678
    ADD IY, $9ABC

@Adc
    ADC A, A
    ADC A, B
    ADC A, C
    ADC A, D
    ADC A, E
    ADC A, H
    ADC A, L
    ADC A, IXH
    ADC A, IXL
    ADC A, IYH
    ADC A, IYL
    ADC A, $FF
    ADC A, (HL)
    ADC A, (IX)
    ADC A, (IX-128)
    ADC A, (IX+127*1)
    ADC A, (IY)
    ADC A, (IY-128)
    ADC A, (IY+127*1)

@Adc_omit_A ; In strict form, `A,` must not be omitted, but may be omitted
    ADC A
    ADC B
    ADC C
    ADC D
    ADC E
    ADC H
    ADC L
    ADC IXH
    ADC IXL
    ADC IYH
    ADC IYL
    ADC $FF
    ADC (HL)
    ADC (IX)
    ADC (IX-128)
    ADC (IX+127*1)
    ADC (IY)
    ADC (IY-128)
    ADC (IY+127*1)

@Adc16
    ADC HL, BC
    ADC HL, DE
    ADC HL, HL
    ADC HL, SP
    ; ADC IX, BC // unsupported
    ; ADC IX, DE // unsupported
    ; ADC IX, IX // unsupported
    ; ADC IX, SP // unsupported
    ; ADC IY, BC // unsupported
    ; ADC IY, DE // unsupported
    ; ADC IY, IY // unsupported
    ; ADC IY, SP // unsupported

@Adc16_nn
    ; ADC HL, $1234 // unsupported
    ; ADC IX, $5678 // unsupported
    ; ADC IY, $9ABC // unsupported

@Sub
    SUB A
    SUB B
    SUB C
    SUB D
    SUB E
    SUB H
    SUB L
    SUB IXH
    SUB IXL
    SUB IYH
    SUB IYL
    SUB $FF
    SUB (HL)
    SUB (IX)
    SUB (IX-128)
    SUB (IX+127*1)
    SUB (IY)
    SUB (IY-128)
    SUB (IY+127*1)

@Sub_with_A ; Strictly speaking, `A,` should be omitted, but it is allowed.
    SUB A, A
    SUB A, B
    SUB A, C
    SUB A, D
    SUB A, E
    SUB A, H
    SUB A, L
    SUB A, IXH
    SUB A, IXL
    SUB A, IYH
    SUB A, IYL
    SUB A, $FF
    SUB A, (HL)
    SUB A, (IX)
    SUB A, (IX-128)
    SUB A, (IX+127*1)
    SUB A, (IY)
    SUB A, (IY-128)
    SUB A, (IY+127*1)

@Sbc
    SBC A, A
    SBC A, B
    SBC A, C
    SBC A, D
    SBC A, E
    SBC A, H
    SBC A, L
    SBC A, IXH
    SBC A, IXL
    SBC A, IYH
    SBC A, IYL
    SBC A, $FF
    SBC A, (HL)
    SBC A, (IX)
    SBC A, (IX-128)
    SBC A, (IX+127*1)
    SBC A, (IY)
    SBC A, (IY-128)
    SBC A, (IY+127*1)

@Sbc_omit_A ; In strict form, `A,` must not be omitted, but may be omitted
    SBC A
    SBC B
    SBC C
    SBC D
    SBC E
    SBC H
    SBC L
    SBC IXH
    SBC IXL
    SBC IYH
    SBC IYL
    SBC $FF
    SBC (HL)
    SBC (IX)
    SBC (IX-128)
    SBC (IX+127*1)
    SBC (IY)
    SBC (IY-128)
    SBC (IY+127*1)

@Sbc16
    SBC HL, BC
    SBC HL, DE
    SBC HL, HL
    SBC HL, SP
    ; SBC IX, BC // unsupported
    ; SBC IX, DE // unsupported
    ; SBC IX, IX // unsupported
    ; SBC IX, SP // unsupported
    ; SBC IY, BC // unsupported
    ; SBC IY, DE // unsupported
    ; SBC IY, IY // unsupported
    ; SBC IY, SP // unsupported

@Sbc16_nn
    ; SBC HL, $1234 // unsupported
    ; SBC IX, $5678 // unsupported
    ; SBC IY, $9ABC // unsupported

BitOperation:
@Register
    BIT 0, A
    BIT 1, B
    BIT 2, C
    BIT 3, D
    BIT 4, E
    BIT 5, H
    BIT 6, L

    SET 7, A
    SET 0, B
    SET 1, C
    SET 2, D
    SET 3, E
    SET 4, H
    SET 5, L

    RES 6, A
    RES 7, B
    RES 0, C
    RES 1, D
    RES 2, E
    RES 3, H
    RES 4, L

@AddressHL
    BIT 0, (HL)
    SET 1, (HL)
    RES 2, (HL)

@AddressIXY_without_d
    BIT 0, (IX)
    SET 1, (IX)
    RES 2, (IX)
    BIT 0, (IY)
    SET 1, (IY)
    RES 2, (IY)

@AddressIXY
    BIT 0, (IX+127)
    SET 1, (IX+0)
    RES 2, (IX-128)
    BIT 0, (IY-1)
    SET 1, (IY+64)
    RES 2, (IY-64)

Increment:
@Register
    INC A
    INC B
    INC C
    INC D
    INC E
    INC H
    INC L
    INC IXH
    INC IXL
    INC IYH
    INC IYL
    INC BC
    INC DE
    INC HL
    INC SP
    INC IX
    INC IY

@Address
    INC (HL)
    INC (IX) ; same as (IX+0)
    INC (IY) ; same as (IY+0)
    INC (IX-128)
    INC (IY-1)
    INC (IX+1)
    INC (IY+127)
    INC ($1234)

Decrement:
@Register
    DEC A
    DEC B
    DEC C
    DEC D
    DEC E
    DEC H
    DEC L
    DEC IXH
    DEC IXL
    DEC IYH
    DEC IYL
    DEC BC
    DEC DE
    DEC HL
    DEC SP
    DEC IX
    DEC IY

@Address
    DEC (HL)
    DEC (IX) ; same as (IX+0)
    DEC (IY) ; same as (IY+0)
    DEC (IX-128)
    DEC (IY-1)
    DEC (IX+1)
    DEC (IY+127)
    DEC ($1234)

Rotate:
    RLCA
    RLA
    RRCA
    RRA

    RLC A
    RLC B
    RLC C
    RLC D
    RLC E
    RLC H
    RLC L
    RLC (HL)
    RLC (IX) ; same as (IX+0)
    RLC (IY) ; same as (IY+0)
    RLC (IX-128)
    RLC (IY-1)
    RLC (IX+1)
    RLC (IY+127)

    RL A
    RL B
    RL C
    RL D
    RL E
    RL H
    RL L
    RL (HL)
    RL (IX) ; same as (IX+0)
    RL (IY) ; same as (IY+0)
    RL (IX-128)
    RL (IY-1)
    RL (IX+1)
    RL (IY+127)

    RRC A
    RRC B
    RRC C
    RRC D
    RRC E
    RRC H
    RRC L
    RRC (HL)
    RRC (IX) ; same as (IX+0)
    RRC (IY) ; same as (IY+0)
    RRC (IX-128)
    RRC (IY-1)
    RRC (IX+1)
    RRC (IY+127)

    RR A
    RR B
    RR C
    RR D
    RR E
    RR H
    RR L
    RR (HL)
    RR (IX) ; same as (IX+0)
    RR (IY) ; same as (IY+0)
    RR (IX-128)
    RR (IY-1)
    RR (IX+1)
    RR (IY+127)

Shift:
    SLA A
    SLA B
    SLA C
    SLA D
    SLA E
    SLA H
    SLA L
    SLA (HL)
    SLA (IX) ; same as (IX+0)
    SLA (IY) ; same as (IY+0)
    SLA (IX-128)
    SLA (IY-1)
    SLA (IX+1)
    SLA (IY+127)

    SL A            ; alies of SLA
    SL B            ; alies of SLA
    SL C            ; alies of SLA
    SL D            ; alies of SLA
    SL E            ; alies of SLA
    SL H            ; alies of SLA
    SL L            ; alies of SLA
    SL (HL)         ; alies of SLA
    SL (IX)         ; alies of SLA
    SL (IY)         ; alies of SLA
    SL (IX-128)     ; alies of SLA
    SL (IY-1)       ; alies of SLA
    SL (IX+1)       ; alies of SLA
    SL (IY+127)     ; alies of SLA

    SLL A
    SLL B
    SLL C
    SLL D
    SLL E
    SLL H
    SLL L
    SLL (HL)
    SLL (IX) ; same as (IX+0)
    SLL (IY) ; same as (IY+0)
    SLL (IX-128)
    SLL (IY-1)
    SLL (IX+1)
    SLL (IY+127)

    SRA A
    SRA B
    SRA C
    SRA D
    SRA E
    SRA H
    SRA L
    SRA (HL)
    SRA (IX) ; same as (IX+0)
    SRA (IY) ; same as (IY+0)
    SRA (IX-128)
    SRA (IY-1)
    SRA (IX+1)
    SRA (IY+127)

    SRL A
    SRL B
    SRL C
    SRL D
    SRL E
    SRL H
    SRL L
    SRL (HL)
    SRL (IX) ; same as (IX+0)
    SRL (IY) ; same as (IY+0)
    SRL (IX-128)
    SRL (IY-1)
    SRL (IX+1)
    SRL (IY+127)

    SR A            ; alies of SRL
    SR B            ; alies of SRL
    SR C            ; alies of SRL
    SR D            ; alies of SRL
    SR E            ; alies of SRL
    SR H            ; alies of SRL
    SR L            ; alies of SRL
    SR (HL)         ; alies of SRL
    SR (IX)         ; alies of SRL
    SR (IY)         ; alies of SRL
    SR (IX-128)     ; alies of SRL
    SR (IY-1)       ; alies of SRL
    SR (IX+1)       ; alies of SRL
    SR (IY+127)     ; alies of SRL

    RLD
    RRD

@Undocumented
    RLC (IX+10) & A     ; LD A, RLC (IX+10)
    RLC (IX+10) & B     ; LD B, RLC (IX+10)
    RLC (IX+10) & C     ; LD C, RLC (IX+10)
    RLC (IX+10) & D     ; LD D, RLC (IX+10)
    RLC (IX+10) & E     ; LD E, RLC (IX+10)
    RLC (IX+10) & F     ; LD F, RLC (IX+10)
    RLC (IX+10) & H     ; LD H, RLC (IX+10)
    RLC (IX+10) & L     ; LD L, RLC (IX+10)

    RRC (IX+10) & B
    RL (IX+10) & B
    RR (IX+10) & B
    SLA (IX+10) & B
    SRA (IX+10) & B
    SLL (IX+10) & B
    SRL (IX+10) & B

    RES 0, (IX+10) & B
    RES 1, (IX+10) & B
    RES 2, (IX+10) & B
    RES 3, (IX+10) & B
    RES 4, (IX+10) & B
    RES 5, (IX+10) & B
    RES 6, (IX+10) & B
    RES 7, (IX+10) & B

    SET 0, (IX+10) & B
    SET 1, (IX+10) & B
    SET 2, (IX+10) & B
    SET 3, (IX+10) & B
    SET 4, (IX+10) & B
    SET 5, (IX+10) & B
    SET 6, (IX+10) & B
    SET 7, (IX+10) & B

IO:
@IN
    IN A, (0x80)
    IN A, (C)
    IN B, (C)
    IN C, (C)
    IN D, (C)
    IN E, (C)
    IN F, (C)   ; undocumented
    IN H, (C)
    IN L, (C)

@OUT
    OUT ($FF), A
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C)     ; undocumented
    OUT F, (C)  ; undocumented (same as OUT (C))
    OUT (C), H
    OUT (C), L

@Repeat_IN
    INI
    INIR
    IND
    INDR

@Repeat_OUT
    OUTI
    OTIR
    OUTIR
    OUTD
    OTDR
    OUTDR

Transfer_Load_Store:

@LD_A_r
    LD A, A
    LD A, B
    LD A, C
    LD A, D
    LD A, E
    LD A, H
    LD A, L
    LD A, IXH
    LD A, IXL
    LD A, IYH
    LD A, IYL

@LD_B_r
    LD B, A
    LD B, B
    LD B, C
    LD B, D
    LD B, E
    LD B, H
    LD B, L
    LD B, IXH
    LD B, IXL
    LD B, IYH
    LD B, IYL

@LD_C_r
    LD C, A
    LD C, B
    LD C, C
    LD C, D
    LD C, E
    LD C, H
    LD C, L
    LD C, IXH
    LD C, IXL
    LD C, IYH
    LD C, IYL

@LD_D_r
    LD D, A
    LD D, B
    LD D, C
    LD D, D
    LD D, E
    LD D, H
    LD D, L
    LD D, IXH
    LD D, IXL
    LD D, IYH
    LD D, IYL

@LD_E_r
    LD E, A
    LD E, B
    LD E, C
    LD E, D
    LD E, E
    LD E, H
    LD E, L
    LD E, IXH
    LD E, IXL
    LD E, IYH
    LD E, IYL

@LD_H_r
    LD H, A
    LD H, B
    LD H, C
    LD H, D
    LD H, E
    LD H, H
    LD H, L
    ; LD H, IXH // does not exist
    ; LD H, IXL // does not exist
    ; LD H, IYH // does not exist
    ; LD H, IYL // does not exist

@LD_L_r
    LD L, A
    LD L, B
    LD L, C
    LD L, D
    LD L, E
    LD L, H
    LD L, L
    ; LD L, IXH // does not exist
    ; LD L, IXL // does not exist
    ; LD L, IYH // does not exist
    ; LD L, IYL // does not exist

@LD_IXH_r
    LD IXH, A
    LD IXH, B
    LD IXH, C
    LD IXH, D
    LD IXH, E
    ; LD IXH, H // does not exist
    ; LD IXH, L // does not exist
    LD IXH, IXH
    LD IXH, IXL
    ; LD IXH, IYH // does not exist
    ; LD IXH, IYL // does not exist

@LD_IXL_r
    LD IXL, A
    LD IXL, B
    LD IXL, C
    LD IXL, D
    LD IXL, E
    ; LD IXL, H // does not exist
    ; LD IXL, L // does not exist
    LD IXL, IXH
    LD IXL, IXL
    ; LD IXL, IYH // does not exist
    ; LD IXL, IYL // does not exist

@LD_IYH_r
    LD IYH, A
    LD IYH, B
    LD IYH, C
    LD IYH, D
    LD IYH, E
    ; LD IYH, H // does not exist
    ; LD IYH, L // does not exist
    ; LD IYH, IXH // does not exist
    ; LD IYH, IXL // does not exist
    LD IYH, IYH
    LD IYH, IYL

@LD_IYL_r
    LD IYL, A
    LD IYL, B
    LD IYL, C
    LD IYL, D
    LD IYL, E
    ; LD IYL, H // does not exist
    ; LD IYL, L // does not exist
    ; LD IYL, IXH // does not exist
    ; LD IYL, IXL // does not exist
    LD IYL, IYH
    LD IYL, IYL

@LD_rr_rr ; auto expand all
    LD BC,BC
    LD BC,DE
    LD BC,HL
    LD BC,IX
    LD BC,IY

    LD DE,BC
    LD DE,DE
    LD DE,HL
    LD DE,IX
    LD DE,IY

    LD HL,BC
    LD HL,DE
    LD HL,HL
    LD HL,IX
    LD HL,IY

    LD IX,BC
    LD IX,DE
    LD IX,HL
    LD IX,IX
    LD IX,IY

    LD IY,BC
    LD IY,DE
    LD IY,HL
    LD IY,IX
    LD IY,IY

@LD_SP_rr
    LD SP,HL
    LD SP,IX
    LD SP,IY

@Load_register_from_HL
    LD A, (HL)
    LD B, (HL)
    LD C, (HL)
    LD D, (HL)
    LD E, (HL)
    LD H, (HL)
    LD L, (HL)
    LD IXH, (HL) ; auto expand
    LD IXL, (HL) ; auto expand
    LD IYH, (HL) ; auto expand
    LD IYL, (HL) ; auto expand

@Load_pair_register_from_HL ; auto expand all
    LD BC, (HL)
    LD DE, (HL)
    LD IX, (HL)
    LD IY, (HL)

@Store_register_to_HL
    LD (HL), A
    LD (HL), B
    LD (HL), C
    LD (HL), D
    LD (HL), E
    LD (HL), H
    LD (HL), L
    LD (HL), IXH
    LD (HL), IXL
    LD (HL), IYH
    LD (HL), IYL

@Load_immediate
    LD A, -128
    LD B, -1
    LD C, 0
    LD D, 1
    LD E, 127
    LD H, 128
    LD L, 255
    LD IXH, $11
    LD IXL, $22
    LD IYH, $88
    LD IYL, $99
    LD BC, -32768
    LD DE, -1
    LD HL, 0x1234
    LD IX, 32767
    LD IY, 65535

@Load_immediate_label
    LD BC, @Load_immediate_label_End
    LD DE, Transfer_Load_Store
    LD HL, Stack@Main
    LD IX, @Load_immediate
    LD IY, Main

@Load_immediate_label_End
    NOP

@Load_immediate_address
    LD A, ($1234)
    LD BC, ($5678)
    LD DE, ($9ABC)
    LD HL, ($DEF0)
    LD SP, ($2525)
    LD IX, ($0831)
    LD IY, ($8931)

@Load_immediate_address_label
    LD A, (or@Calculation)
    LD BC, (@Load_immediate_address_label)
    LD DE, (@Load_immediate_address_label_end)
    LD HL, (@Load_immediate_label_end)
    LD SP, (@Load_immediate_label)
    LD IX, (@Load_pair_register_from_HL)
    LD IY, (@LD_SP_rr)
@Load_immediate_address_label_end
    NOP

@Load_Store_BC_DE
    LD A, (BC)
    LD A, (DE)
    LD (BC), A
    LD (DE), A
