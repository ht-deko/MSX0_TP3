?# MSX0 用 Turbo Pascal ライブラリ
自作ライブラリや自作ライブラリが参照しているライブラリの一覧です。

## ■ MDLLIB
**『MDL-LIB version 2.2』** は Martijn Dekker 氏によって作られた『Turbo Pascal 3.0』用 MSX ライブラリです (パブリックドメイン)。すべての BDOS や BIOS が網羅されているわけではありませんが、BDOS や BIOS をあまり意識する事なく MSX の固有機能が使えます。

 - [MDL-LIB 2.2 Pascal Bios include files (hansotten.com)](http://pascal.hansotten.com/delphi/turbo-pascal-on-cpm-msx-dos-and-ms-dos/)

※このリポジトリには含まれていません。


## ■ MSXUTILS
個人的に必要そうなものを MSXUTILS.LIB として別途定義します。

| ファイル名 | 依存ライブラリ |
|:---|:---|
| MSXUTILS.LIB | MDLLIB.LIB |


## ■ EXTBIOS
拡張 BIOS 関連を EXTBIOS.LIB として別途定義します。

| ファイル名 | 依存ライブラリ |
|:---|:---|
| EXTBIOS.LIB | MDLLIB.LIB |


## ■ SPRITE
スプライト関連を SPRITE1.LIB / SPRITE2.LIB として別途定義します。

| ファイル名 | 依存ライブラリ |
|:---|:---|
| SPRITE1.LIB | MDLLIB.LIB, VRAM1.LIB |
| SPRITE2.LIB | MDLLIB.LIB, VRAM2.LIB |


## ■ SYSUTILS
よく使うであろう機能を入れてあります。

| ファイル名 | 依存ライブラリ |
|:---|:---|
| SYSUTILS.LIB |  |


## ■ IOT.LIB
Turbo Pascal から IoT Basic の機能を使うためのライブラリです。
[HRA! さんのコード](https://github.com/hra1129/for_MSX0/tree/main/sample_program/002_device/2023_05_30_1st_update_version/basicn)を参考にしています。

| ファイル名 | 依存ライブラリ |
|:---|:---|
| IOT.LIB | SYSUTILS.LIB |


## ■ LCD.LIB
MSX0 (MSX-DOS) で使える Liquid Crystal Display (LCD) ライブラリです。

| ファイル名 | 依存ライブラリ |
|:---|:---|
| LCD.LIB | SYSUTILS.LIB, IOT.LIB|


**See also:**

 - [MDL-LIB version 2.2 の使い方 (Qiita)](https://qiita.com/ht_deko/items/6f15aee0bd25b550e4df)
 - [【MSX0】IOT.LIB (Qiita)](https://qiita.com/ht_deko/items/a5c0bf6e7969093beb3c)
 - [【MSX0】LCD.LIB (Qiita)](https://qiita.com/ht_deko/items/084bdf1abaeb12753b38)
 
