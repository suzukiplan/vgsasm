org $0000
.Reset
    IM 1
    LD SP, 0
    JR Main

org $0038
.Interrupt
    RETI

org $0100
.Main
    EI
    HALT
    DI
    HALT

org $2000
    DB "Hello, World!"
