# RunCPM コンパイル済バイナリ
Windows 用にコンパイルした [RunCPM](https://github.com/MockbaTheBorg/RunCPM) です。

 - CP/M-80 v2.2 エミュレータで、MSX-DOS のクロスコンパイル環境として使えます。  
 - Visual Studio 2019 でコンパイルされています。 
 - RunCPM のリポジトリから A ドライブのファイル群 ([RunCPM/DISK/A.ZIP](https://github.com/MockbaTheBorg/RunCPM/tree/master/DISK)) を持ってくる必要があります (`.\A\0\` に展開します。B ドライブ以降はご自由に)。  
 - 内部 CCP を使っているので、CCP ファイルは必要ありません。
 - 64KB システムです。
 - 他の方がコンパイルされた [Windows 用バイナリ (MinGW)](https://github.com/guidol70/RunCPM_Windows) もあります。
 - もちろん CP/M-80 用『Turbo Pascal 3.0』が動作します。MSX-DOS ではメモリ不足でコンパイルできなかったものもコンパイルできます。

 
## Turbo Pascal 3.0 でクロスコンパイルする際の注意点

Turbo Pascal 3.0 を使って MSX 用にクロスコンパイルする際の注意点です。


### TPA

MSX-DOS の TPA に合わせてコンパイルオプションで End Address を変更する必要があります。

| Mem | Start<br>(Min) | End | End<br>(Max) |
|:---|:---:|:---:|:---:|
| 64K | 20E3 | **F942** | FC06 |
| MSX0 Stack<br>MSX-DOS (57.25K) | 20E3 | **DE42** | E106 |
| MSX0 Stack<br>MSX-DOS (漢字) | 20E3 | **DA42** | DD06 |
| 56K | 20E3 | **D942** | DC06 |
| MSX0 Stack<br>MSX-DOS2 (54.5K) | 20E3 | **D342** | D606 |
| MSX0 Stack<br>MSX-DOS2 (漢字) | 20E3 | **CF42** | D206 |
| 48K | 20E3 | **B942** | BC06 |
| PC-G850V<br>EborsyEEP (43K) | 20E3 | **A542** | A806 |	   
| 40K | 20E3 | **9942** | 9C06 |
| 32K | 20E3 | **7942** | 7C06 | 
 

### エスケープシーケンス
RunCPM では ANSI エスケープシーケンスが使われていますが、MSX-DOS は VT52 サブセットのエスケープシーケンスが使われています。

MSX 用にクロスコンパイルするには、`TINST` のスクリーン設定で `25) Teleray series 10` (VT52 互換 / ハイライトなし) に設定してください。もちろんこの状態でエディタを使う事はできませんので、エディタを使いたい時は外部エディタを使うか TINST で `6) ANSI` に戻す必要があります。

TINST で切り替えるのが面倒なら、C0 ドライブに開発用 (ANSI)、D0 ドライブにリリースビルド用 (VT52) のように、あらかじめ 2 つの Turbo Pascal をインストールしておくといいかもしれません。

**See also:**

 - [RunCPM - Z80 CP/M emulator (GitHub: @MockbaTheBorg)](https://github.com/MockbaTheBorg/RunCPM)
 - [RunCPM (Z80 CP/M 2.2 エミュレータ) (ht-deko.com)](https://ht-deko.com/arduino/runcpm.html)
 - [RunCPM for Windows - a text-based CP/M-Emulator (GitHub: @guidol70)](https://github.com/guidol70/RunCPM_Windows)
