## **GrovePi Open Wifi Finder**

GrovePi は、Grove センサーを Raspberry Pi に接続するためのオープンソース・プラットフォームです。はんだ付け不要で、さまざまな IoT デバイスや発明品を作ることができます。

このプロジェクトでは、オープンな WiFi ネットワークをスキャンします。いわばポータブル WiFi ホットスポットファインダーです。これをポータブルな WiFi ホットスポットファインダーに仕立てる方法については、[こちらのプロジェクトページ](http://www.dexterindustries.com/GrovePi) を参照してください。

### How Does it Work?
GrovePi ボードを Raspberry Pi に差し込み、その上に Grove センサーを接続します。

####Software Setup Notes:
  * このサンプルでは [wifi library](https://wifi.readthedocs.org/en/latest/wifi_command.html) を使用します。`pip install wifi` でインストールしてください。
  * WiFi ドングルは `wlan0` として認識されている必要があります。コマンドラインで `ifconfig` を実行して確認してください。

####Hardware Setup Notes:
  * ブザーは GrovePi の D2 ポートに接続します。
  * LED は GrovePi の D3 ポートに接続します。
  * LCD は I2C-1 に接続します。`sudo i2cdetect -y 1` コマンドで確認してください。

GrovePi は、Raspberry Pi と Grove センサーを接続する役割を担います。[GrovePi についての詳細はこちら](http://www.dexterindustries.com/GrovePi)。

### Make This Start at Boot!
外に持ち出して使う場合などは、起動時に自動でこのプログラムが動くようにしておくと便利です。
 
まず、このディレクトリ内のファイルを home ディレクトリにコピーします。
 
次に `start.sh` というスクリプトを作成し、その中で `wifi_finder.py` を起動するようにします。
 
```bash
sudo nano start.sh
```
 
`start.sh` の内容は次のようになります。
 
```bash
#!/bin/bash
sudo python3 /home/pi/wifi_finder.py
```

続いて `rc.local` を開きます。

```bash
sudo nano /etc/rc.local
```

このファイルの末尾数行を次のようにします。

```bash
sudo sh /home/pi/start.sh
exit 0
```

これで設定は完了です。再起動して動作を確認してください。
 
このサンプルについて質問があれば、[こちらのフォーラム](http://forum.dexterindustries.com/c/grovepi) で問い合わせてください。

LICENSE:  
これらのファイルは [Creative Commons Attribution-ShareAlike 3.0](http://creativecommons.org/licenses/by-sa/3.0/) ライセンスの下で公開されています。

### Raspberry Pi Compatibility
GrovePi は Raspberry Pi A / A+ / B / B+ / 2 と互換性があります。

### Programming the GrovePi
GrovePi は Raspberry Pi 上で Python / C / C# / Go / NodeJS から利用できます。まずは [example projects](http://www.dexterindustries.com/GrovePi/projects-for-the-raspberry-pi/) や [example code](https://github.com/DexterInd/GrovePi/tree/master/Software) から試してみてください。  
GrovePi は Arduino を使って Raspberry Pi と Grove センサーのブリッジを行っており、標準ファームウェアが書き込まれた状態で出荷されています。ファームウェアは Raspberry Pi から書き換えることができます。

### Getting Help
サポートが必要な場合は、[こちらのフォーラム](http://www.dexterindustries.com/GrovePi/projects-for-the-raspberry-pi/) で質問や提案を行えます。

The MIT License (MIT)

GrovePi for the Raspberry Pi: an open source platform for connecting Grove Sensors to the Raspberry Pi.
Copyright (C) 2017  Dexter Industries

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

See more at the [GrovePi Site](http://dexterindustries.com/GrovePi/)
