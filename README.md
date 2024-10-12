# WIP: Z80 Assembler for VGS-Zero

- VGS-Zero のツールチェインに組み込み予定の Z80 アセンブラ
- 完成したら [suzukiplan/vgszero](https://github/suzukiplan/vgszero) に組み込み予定
- 基本的には z88dk の z80asm の構文をサポート予定（全部ではない）
- IXH,IXL,IYH,IYL対応
- 色々なエイリアスを追加予定
- ラベル内ラベルサポート（これは最新のz80asmでは既にサポート済みかも）
- 外部ライブラリ（boost等）を使わず素のgccやclangでコンパイルできるようにする
- 性能はあんまり気にしない

## WIP Status

- [x] トークン分割
- [ ] `#include` を実装
- [ ] その他色々 

