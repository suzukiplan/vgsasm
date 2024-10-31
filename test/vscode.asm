// include
#include "../lib/vgszero.inc"

struct Foo $C000 {
    var1 ds.b 1     ; param1
    var2 ds.b 1     ; param2
    var3 ds.b 1     ; param3
}

.main
    LD A, 0x123
    LD Foo.var1, $12
    SL A
    SLL A
    LD (IX + 2), %1010
    LD (IY + 1), 0b1010
