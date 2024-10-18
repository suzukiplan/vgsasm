# WIP: Z80 Assembler for VGS-Zero

Z80 Assembler for VGS-Zero is a Z80 assembler that supports the entire Z80 instruction set, including hidden instructions, and enables highly readable full assembly language programming using [“structures”](#struct).

Although it was developed for use in game development on the VGS-Zero, it is versatile enough to be used for game development for a wide range of game consoles and PCs, including SMS, GameGear, MSX, and PC-88. _(However, the design guideline is to specialize in VGS-Zero, but not in other console or PC-specific enhancements.)_

## WIP Status

- It is still under development.
- We plan to add version `1.0.0` tags when all functions are completed.
- See the [issues](https://github.com/suzukiplan/vgsasm/issues?q=is%3Aopen+is%3Aissue+label%3AWIP).

## Support OS

- **Linux** (confirmed Ubuntu Desktop)
- macOS (not confirmed)

## Usage

```
vgsasm [-b size_of_binary] /path/to/source.asm
```

- `-b size_of_binary`
  - Specify the size of the output binary.
  - The `size_of_binary` can be specified in decimal or hexadecimal (ex: `0xABCD`)
  - The `size_of_binary` cannot be less than `1`.
  - The upper limit of `size_of_binary` is `65536` (`0x10000`)
  - Assembly will fail if the specified size is exceeded.
  - Boundary areas that do not meet the specified size are filled with `0xFF`.

## Basic Syntax

- Case insensitive (except for string literals)
- Hexadecimal numbers can be written in the format `$ABCD` or `0xABCD`.
- Binary numbers can be written in the format `%0101` or `0b0101`.
- Binary, decimal, and hexadecimal numbers can be four arithmetic operations (`+`, `-`, `*`, `/`)
  - `LD A, 1 + 2 + 3` is `LD A, 6`
  - `LD A, (0x10 + 3 * 2 - %0101)` is `LD A, (17)`
  - `LD A, (0x10 + 3 * 2 - %0101) / 3` is `LD A, 5`
- Strings after `;` or `//` are ignored as comments.

## Preprocessor

### `#include`

```z80
#include "/path/to/file"
```

- Other source files can be combined.
- Duplicate `#include` for the same source file are automatically ignored.

### `#define`

```
#define DEFINITION_NAME Expanded expression
```

The `DEFINITION_NAME` in the source code is expanded to an `Expanded expression`.

## `org`

Specifies the starting address for binary output.

```z80
org $0000
```

In vgsasm, multiple `ORG`s can be specified, for example, if the code for IM1 interrupt is to be generated from 0x0038, it can be written as follows:

```z80
org $0000
.Reset
    ld sp, 0
    im 1
    ei
    jp Main

org $0038
.Interrupt
    // Interrupt procedure
    reti

org $0100
.Main
    // Main procedure
```

The following points should be noted:

- `ORG` must be defined in ascending order from the beginning of the source code.
- The free space from `ORG` to the next `ORG` is filled with 0xFF.

## Labels

```z80
// Normal label
FOO:

// Normal label
LABEL1:

// Inner label at LABEL1: FOO@LABEL1
@FOO

JP FOO          ; Jump to FOO:
JP @FOO         ; Jump to FOO@LABEL1
JP FOO@LABEL1   ; Jump to FOO@LABEL1
JP FOO@LABEL2   ; Jump to FOO@LABEL2

// Normal label (same as LABEL:)
.LABEL2

// Inner label at LABEL2: FOO@LABEL2
@FOO

JP FOO          ; Jump to FOO:
JP @FOO         ; Jump to FOO@LABEL2
JP FOO@LABEL1   ; Jump to FOO@LABEL1
JP FOO@LABEL2   ; Jump to FOO@LABEL2
```

- Labels are written in the format `LABEL:` or `.LABEL`.
- Inner labels are written in `@LABEL` format.
- Labels and inner labels are not case sensitive.
- The label and inner label are symbols that uniquely identify all source files with `#include`.

## `struct`

```z80
struct name $C000 {
    var1 ds.b 1     ; name.var1 = $C000 ... offset(name.var1) = 0
    var2 ds.w 1     ; name.var2 = $C001 ... offset(name.var2) = 1
    var3 ds.b 4     ; name.var3 = $C003 ... offset(name.var3) = 3
    var4 ds.w 4     ; name.var4 = $C007 ... offset(name.var4) = 7
}                   ; sizeof(name) = 15

// Array access
// name[0].var1 = $C000
// name[1].var1 = $C00F
// name[2].var1 = $C01E
```

- You can define a structure with `struct name start_address`.
- A struct is a grouping of single or multiple attributes in a common namespace.
- Attributes are specified in the form `attribute_name {ds.b|ds.w|name} count`.
  - `ds.b` ... 1 byte
  - `ds.w` ... 2 bytes
  - `name` ... `sizeof(name)`
- The `start_address` is usually assumed to be an absolute address in RAM (0xC000 to 0xFFFF).
- This structure has no boundary.
- Can also be accessed as an array in the form `name[index]`.
- `sizeof(structure_name)`: size of structure
- `offset(structure_name.field)` : field address offset

Utilizing `sizeof` and `offset` makes structure access with `LD (IX+d)` smarter.

```z80
struct OAM $9000 {
    y           ds.b    1
    x           ds.b    1
    ptn         ds.b    1
    attr        ds.b    1
    h           ds.b    1
    w           ds.b    1
    bank        ds.b    1
    reserved    ds.b    1
}

org $0000

.Main
    ld ix, OAM[16]                      ; ix = $9000 + 8 * 16
    ld b, 4                             ; djnz loop times = 4
@Loop
    ld (ix + offset(OAM.x)), 0x10       ; ld (ix + 1), 0x10
    ld (ix + offset(OAM.y)), 0x20       ; ld (ix + 0), 0x20
    ld (ix + offset(OAM.ptn)), 0x30     ; ld (ix + 2), 0x30
    ld (ix + offset(OAM.bank)), 0x40    ; ld (ix + 6), 0x40
    add ix, sizeof(OAM)                 ; ix += 8
    djnz @Loop                          ; loop
```

## Support Instruction

- Supports all Z80 instructions, including undocumented.
- Some undocumented instructions are in a slightly special format.
- All instructions are described in [./test/all.asm](./test/all.asm).

## Auto Expand Instruction

In vgsasm, instructions that __do not exist in the Z80__ are complemented by existing instructions.

| Instruction | Auto-expand |
|:------------|:------------|
| `LD RP1, RP2` <br> `*RP = {BC｜DE｜HL｜IX｜IY}` | `LD r1H,r2H`, `LD r1L,r2L`<br>or `PUSH RP2`, `POP RP1`|
| `LD BC,nn` | `LD B,n(high)`, `LD C,n(low)` |
| `LD DE,nn` | `LD D,n(high)`, `LD E,n(low)` |
| `LD HL,nn` | `LD H,n(high)`, `LD L,n(low)` |
| `LD IX,nn` | `LD IXH,n(high)`, `LD IXL,n(low)` |
| `LD IY,nn` | `LD IXH,n(high)`, `LD IXL,n(low)` |
| `LD {IXH｜IXL｜IYH｜IYL},(HL)` | `PUSH AF`, `LD A,(HL)`, `LD {IXH｜IXL｜IYH｜IYL},A`, `POP AF` |
| `LD {BC｜DE},(HL)` | `LD rL,(HL)`, `INC HL`, `LD rH,(HL)`, `DEC HL` |
| `LD {IX｜IY},(HL)` | `PUSH AF`, `LD A,(HL)`, `LD rL,A`, `INC HL`,<br> `LD A,(HL)`, `LD rH,A`, `DEC HL`, `POP AF` |
| `ADD HL,nn` | `PUSH DE`, `LD DE,nn`, `ADD HL,DE`, `POP DE`|
| `ADD IX,nn` | `PUSH DE`, `LD DE,nn`, `ADD IX,DE`, `POP DE`|
| `ADD IY,nn` | `PUSH DE`, `LD DE,nn`, `ADD IY,DE`, `POP DE`|
| `INC (nn)` | `PUSH HL`, `LD HL,nn`, `INC (HL)` `POP HL`|

## License

[GPLv3](LICENSE.txt)
