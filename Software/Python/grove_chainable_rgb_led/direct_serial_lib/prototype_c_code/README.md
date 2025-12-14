このサンプルは、PN532 を SPI 経由で用いて RFID カードを読み取り、その結果に応じて P9813 の LED とブザーを制御するものです。

Input:   PN532 (SPI)
Output:  P9813、GPIO 1 ポート

- NFC モジュール:  http://www.seeedstudio.com/wiki/NFC_Shield_V2.0
- LED ライト:       http://www.seeedstudio.com/wiki/Grove_-_Chainable_RGB_LED
- ブザー:           http://item.taobao.com/item.htm?spm=0.0.0.0.A0Zkth&id=6859691900

概要:
- NFC から繰り返し読み取りを行い、cardID を使って識別します（現状ではブロック単位の読み取り方法は未実装）。
- 一致する固定 ID のカードが検出された場合は緑色の光と特定のブザー音を出します。
- それ以外の場合は赤色の光と別のブザー音を出します。

このサンプルを動かすには `wiringPi` ライブラリが必要です。

コンパイル:

```bash
make
```

実行:

```bash
sudo ./NFClight
```

このプロジェクトで利用しているライブラリの作者の方々に感謝します。

- wiringPi ライブラリ: Gordons Projects — https://projects.drogon.net/raspberry-pi/wiringpi/
- nfc ライブラリ: Katherine — http://blog.iteadstudio.com/to-drive-itead-pn532-nfc-module-with-raspberry-pi/

このプロジェクトは @DaochenShi（shidaochen@live.com） によって作成されました。
