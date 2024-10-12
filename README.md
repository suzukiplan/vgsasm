# WIP: Z80 Assembler for VGS-Zero

- VGS-Zero のツールチェインに組み込み予定の Z80 アセンブラ
- 完成したら [suzukiplan/vgszero](https://github/suzukiplan/vgszero) に組み込み予定
- 基本的には z88dk の z80asm の構文をサポート予定（全部ではない）
- IXH,IXL,IYH,IYL対応
- 色々なエイリアスを追加予定
- ラベル内ラベルサポート（これは最新のz80asmでは既にサポート済みかも）
- 外部ライブラリ（boost等）を使わず素のgccやclangでコンパイルできるようにする
- 性能はあんまり気にしない
- 対応OS: VGS-Zero 開発環境と同等 (Linux or macOS) なので Windows には対応しない

## WIP Status

- [x] トークン分割
- [x] `#include` を実装
- [x] ラベルパーサー
- [ ] 構文解析（ざっくり）
- [ ] その他色々 

## Basic Syntax

- Case insensitive (except for string literals)
- Hexadecimal numbers can be written in the format `$ABCD` or `0xABCD`.
- Binary numbers can be written in the format `%0101` or `0b0101`.

## Preprocessor

### `#include`

```z80
#include "/path/to/file"
```

- Other source files can be combined.
- Duplicate `#include` for the same source file are automatically ignored.

### Labels

```z80
# Normal label
FOO:

# Normal label
LABEL1:

# Inner label at LABEL1: FOO@LABEL1
@FOO

JP FOO          ; Jump to FOO:
JP @FOO         ; Jump to FOO@LABEL1
JP FOO@LABEL1   ; Jump to FOO@LABEL1
JP FOO@LABEL2   ; Jump to FOO@LABEL2

# Normal label (same as LABEL:)
.LABEL2

# Inner label at LABEL2: FOO@LABEL2
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

## License

[GPLv3](LICENSE.txt)
