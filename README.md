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
