
## **Modular Robotics (Dexter Industries) GrovePi** [![Generic badge](https://img.shields.io/badge/Docs-available-electric.svg)](https://dexterind.github.io/GrovePi) [![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

<!-- Remember to add https://mit-license.org/ of our own -->

![Picture](GrovePi_Plus_By_Dexter_Industries_For_the_Raspberry_Pi.JPG)

GrovePi は、Grove センサーを Raspberry Pi に接続するためのオープンソースなプラットフォームです。はんだ付け不要で、IoT (Internet of Things) デバイスやプロジェクトを簡単に作ることができます。

公式 API は Python で提供されていますが、C / C# / Go / NodeJS など他の言語からも利用できます。これらのライブラリはコントリビュータによって提供されています。

## Getting Started

このリポジトリ内のスクリプトを使って `GrovePi` をクイックインストールするには、`DexterInd` リポジトリ一式が `pi` ユーザーのホームディレクトリ（例: `~/DexterInd`）に clone 済みであることを前提に、次のコマンドを実行します。

```bash
cd ~/DexterInd/GrovePi/Script
bash update_grovepi.sh
```

同じコマンドで `GrovePi` を最新バージョンにアップデートすることもできます。インストール／アップデートの詳細については、この [README](Script/README.md) を参照してください。

仮想環境にインストールしたい場合は、あらかじめ virtualenv を有効化してから次のコマンドを実行します。

```bash
cd ~/DexterInd/GrovePi/Script
bash update_grovepi.sh --user-local --bypass-gui-installation
```

GrovePi の最新ファームウェアを書き込むには、次のように実行します。

```bash
cd /home/pi/Dexter/GrovePi/Firmware
bash firmware_update.sh
```

その後、`grovepi` モジュールを import して実際に使い始めてください。ドキュメントは [こちら](https://dexterind.github.io/GrovePi) にあります。

古い Getting Started ガイドは [こちら](http://www.dexterindustries.com/GrovePi/get-started-with-the-grovepi/) で参照できます。GrovePi を Raspberry Pi のどの向きで重ねるかなどに不安がある場合に役立つかもしれません（基本的には直感的に分かるはずです）。

## Support

### Raspberry Pi Compatibility
GrovePi は Raspberry Pi A / A+ / B / B+ / 2 / B3 / B3+ / A3+ / 4B に対応しています。

### Documentation
[詳細なドキュメント](https://dexterind.github.io/GrovePi) が用意されています。

### Scratch Support
上記のインストールが終わったら、必要に応じて Scratch 用のサポートも追加できます（任意）。
```bash
sudo bash /home/pi/Dexter/GrovePi/Script/install_scratch.sh
```

SD カードに Scratch 2.0 がインストールされている場合、このスクリプトで GrovePi 対応が追加されます。Scratch 1.4 向けの GrovePi 連携も同時にインストールされます。

### Want to use a sensor not in the library yet?  
まだライブラリに含まれていないセンサーを使いたい場合は、[フォーラム](http://forum.dexterindustries.com/c/grovepi) で相談してください。現状サポートされていない言語から GrovePi を使いたい場合も、[フォーラム](http://forum.dexterindustries.com/c/grovepi) で質問してもらえれば、可能な限り対応します。

### Programming the GrovePi
GrovePi は、Raspberry Pi 上で Python / C / C# / Go / NodeJS から利用できます。まずは [example projects](http://www.dexterindustries.com/GrovePi/projects-for-the-raspberry-pi/) や [example code](https://github.com/DexterInd/GrovePi/tree/master/Software) から試してみてください。
GrovePi は Arduino 互換 MCU を使って Raspberry Pi と Grove センサーの橋渡しをしており、標準ファームウェアが書き込まれた状態で出荷されています。このファームウェアは Raspberry Pi から書き換えることができます。

### Getting Help
サポートが必要な場合は、[こちらのフォーラム](http://www.dexterindustries.com/GrovePi/projects-for-the-raspberry-pi/) で質問や提案を行えます。

### Getting Ideas
何から始めればよいか分からない場合は、[プロジェクト例](http://www.dexterindustries.com/GrovePi/projects-for-the-raspberry-pi/) を眺めて、アイデアのヒントにしてみてください。
