# WIP: Z80 Assembler for VGS-Zero

- VGS-Zero のツールチェインに組み込み予定の Z80 アセンブラ
- 完成したら [suzukiplan/vgszero](https://github/suzukiplan/vgszero) に組み込み予定
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
- [ ] 構文解析（ざっくり）
- [ ] その他色々 

## Usage

```bash
vgsasm /path/to/source.asm
```

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

### Labels

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

### `struct`

```z80
struct name $C000 {
    var1 ds.b 1     ; name.var1 = $C000
    var2 ds.w 1     ; name.var2 = $C001
    var3 ds.b 4     ; name.var3 = $C003
    var4 ds.w 4     ; name.var4 = $C007
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

## License

[GPLv3](LICENSE.txt)
