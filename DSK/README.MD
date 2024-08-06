# MSX0 用 Disk イメージ
MSX0 用の Disk イメージです。Turbo Pascal に関係ないものも含まれています。

## ■ DOS2_MSXC.DSK
MSX-C の環境を作るディスクです (ファームウエアバージョン 0.05.04 用)。

`MSXDOS2.SYS` と `COMMAND2.COM` を組み込んで、このディスクから起動したら、

```
A:\>COPY AUTOINST.BAT H:
A:\>H:
H:\>AUTOINST
```

とする事で、このディスクが MSX-C ver1.2 の開発用ディスクとなります。


**See also:**

 - [MSX0 Stack で MSX-C ver1.2 のディスクを作る (C コンパイラを動かせるようにする) (Qiita)](https://qiita.com/ht_deko/items/c81fdf6a9758cbf824ac)
 

## ■ DOS2_MSXC0708.DSK
ファームウエアバージョン 0.07.08 以降に対応した M0CHGDSK.COM が含まれています。
