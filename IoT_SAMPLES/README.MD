# IoT BASIC サンプル移植版
MSX0 Stack』付属の IoT BASIC サンプルを『Turbo Pascal』へ移植したものです。
オリジナルの IoT BASIC サンプルは、microSD 内の `DSK\SAMPLE.DSK` に格納されています。

## 移植リスト

| サンプル | 本体 | 説明|
|:---|:---:|:---|
| ACCEL.PAS | 〇 | Battery Bottom2 の加速度センサの値を取得して表示します。 |
| ANALOG_G.PAS | × | Port B (黒) のピン 36 からのアナログ入力信号で簡単なグラフを描きます。 |
| DHT_KNJ.PAS | × | 温度湿度センサから取得した値を表示します。 |
| I2C.PAS | × | DHT20 に対して直接 I<sup>2</sup>C アクセスを行い温度を取得します。 |
| INFO.PAS | 〇 | システムメニューにある `MSX0 Stack 情報` と同等のプログラムです。 |
| LED.PAS | 〇 | Face Bottom Base や Battery Bottoms に搭載されている 10 個の LED を iotput 命令を使って制御します。 |
| PERFORMC.PAS | 〇 | 仮想 Z80 の周波数を振ってオーバークロック余力を測定します。 |
| RCONSOLE.PAS | 〇 | リモートコンソールに文字列を送信します。 |
| SEND2NET.PAS | × | 温度湿度センサーから値を取得しサーバーへ送信します。 |
| TOUCH_G.PAS | 〇 | 本体の LCD タッチパネルを使って簡単なお絵描きができます。 |
| TREE.PAS | 〇 | ノードを再帰的にスキャンしてリスト表示します。 |
| WIFILVL.PAS | 〇 | 接続中の Wi-Fi AP の RSSI (受信信号強度) 値を表示します。 |

※ `×` になっているものは外部センサーが必要です。


**See also:**

 - [【MSX0】IoT BASIC サンプルの移植【Turbo Pascal】 (Qiita)](https://qiita.com/ht_deko/items/2362488c5c99aec4afbf)
 
