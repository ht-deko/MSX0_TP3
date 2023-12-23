# ■ MDLLIB
**『MDL-LIB version 2.2』** は Martijn Dekker 氏によって作られた『Turbo Pascal 3.0』用 MSX ライブラリです (パブリックドメイン)。すべての BDOS や BIOS が網羅されているわけではありませんが、BDOS や BIOS をあまり意識する事なく MSX の固有機能が使えます。

 - [MDL-LIB 2.2 Pascal Bios include files (hansotten.com)](http://pascal.hansotten.com/delphi/turbo-pascal-on-cpm-msx-dos-and-ms-dos/)

# ■ MSXUTILS
個人的に必要そうなものを MSXUTILS.LIB として別途定義します。

| ファイル名 | 依存ライブラリ |
|:---|:---|
| MSXUTILS.LIB | MDLLIB.LIB |


# ■ EXTBIOS
拡張 BIOS 関連を EXTBIOS.LIB として別途定義します。

| ファイル名 | 依存ライブラリ |
|:---|:---|
| EXTBIOS.LIB | MDLLIB.LIB |

# ■ SYSUTILS
よく使うであろう機能を入れてあります。

| ファイル名 | 依存ライブラリ |
|:---|:---|
| EXTBIOS.LIB |  |


# ■ IOT.LIB
Turbo Pascal から IoT Basic の機能を使うためのライブラリです。
[HRA! さんのコード](https://github.com/hra1129/for_MSX0/tree/main/sample_program/002_device/2023_05_30_1st_update_version/basicn)を参考にしています。

| ファイル名 | 依存ライブラリ |
|:---|:---|
| EXTBIOS.LIB | SYSUTILS.LIB |
