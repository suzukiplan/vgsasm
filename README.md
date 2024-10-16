# WIP: Z80 Assembler for VGS-Zero

- VGS-Zero のツールチェインに組み込み予定の Z80 アセンブラ
- 完成したら [suzukiplan/vgszero](https://github.com/suzukiplan/vgszero) に組み込み予定
- 基本的には z88dk の z80asm の構文をサポート予定（全部ではない）
- IXH,IXL,IYH,IYL対応
- 色々なエイリアスを追加予定
- ラベル内ラベルサポート（これは最新のz80asmでは既にサポート済みかも）
- 外部ライブラリ（boost等）を使わず素のgccやclangでコンパイルできるようにする
- アセンブル性能はあんまり気にしない（アセンブル後バイナリの性能は気にする）
- 対応OS: VGS-Zero 開発環境と同等 (Linux or macOS) なので Windows には対応しない

## WIP Status

- [x] トークン分割
- [x] `#include` を実装
- [x] ラベルパーサー
- [x] 構文解析（ざっくり）
- [ ] ニーモニック解析
- [ ] アドレス解決
- [ ] バイナリ出力
- [ ] ドキュメンテーション
- [ ] テスト準備
- [ ] CI 対応

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
    ld ix, OAM[16]
    ld b, 4
@Loop
    ld (ix + offset(OAM.x)), 0x10
    ld (ix + offset(OAM.y)), 0x20
    ld (ix + offset(OAM.ptn)), 0x30
    ld (ix + offset(OAM.bank)), 0x40
    add ix, sizeof(OAM)
    djnz @Loop
```

## Auto-expand Instructions

| Instruction | Auto-expand |
|:------------|:------------|
| `LD (HL++), {r｜n}` | `LD (HL), {r｜n}` <br> `INC HL` |
| `LD (++HL), {r｜n}` | `INC HL` <br> `LD (HL), {r｜n}` |
| `ADD IX, nn` | `PUSH DE` <br> `PUSH HL` <br> `LD H, IXH` <br> `LD L, IXL` <br> `LD D, n<H>` <br> `LD E, n<L>` <br> `ADD HL, DE` <br> `LD IXH, H` <br> `LD IXL, L` <br> `POP HL` <br> `POP DE`|
| `ADD IY, nn` | `PUSH DE` <br> `PUSH HL` <br> `LD H, IYH` <br> `LD L, IYL` <br> `LD D, n<H>` <br> `LD E, n<L>` <br> `ADD HL, DE` <br> `LD IYH, H` <br> `LD IYL, L` <br> `POP HL` <br> `POP DE`|

## License

[GPLv3](LICENSE.txt)
