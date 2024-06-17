# MSX0 (MSX2) ROM 格納フォルダ

MSX0 の Setup Utility で MSX の種類を **"MSX2"** にした状態でダンプした ROM をこのフォルダに格納します。

```
*---- Setup Utility -----*

msx0-71053463951412
ver:0.05.04

>Exit
 MSX System Unit0
  Disk     BIOSDUMP.DSK
  Type     MSX2
  Ram Size 1M
  Slot     NONE
```

ROM のダンプには HRA! さんの `BIOSDUMP.DSK` を使います。

 - [https://github.com/hra1129/for_MSX0/tree/main/dump_tool/for_msx0_bios2](https://github.com/hra1129/for_MSX0/tree/main/dump_tool/for_msx0_bios2)

MSX0 でこのディスクイメージから起動すると自動で ROM ダンプが開始されます。

| 内容 | ファイル名 |
|:---|:---|
| Main ROM | MSX0BIOS.ROM |
| Sub ROM | MSX0EXT.ROM |
| IoTBASIC | MSX0IOT.ROM |
| X-BASIC | MSX0XBAS.ROM |
| KanjiBASIC | MSX0KDR.ROM |
| KanjiROM | MSX0KFN.ROM |
| MSXDOS1 | MSX0DOS.ROM |
| MSXDOS2 | MSX0DOS2.ROM |

全部で 8 つのファイルが生成されます。
