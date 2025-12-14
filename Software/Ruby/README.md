# Ruby support for GrovePi

## Introduction
この Ruby モジュールは、Ruby から GrovePi を利用するためのサポートを提供します。

使い方の例は、`tests` ディレクトリ内のサンプルを参照してください。

## Dependencies
- Ruby 2.0 以降が必要です。
- Ruby モジュール **i2c-devices** をインストールしておく必要があります。

```bash
gem install i2c-devices
```

## Current State
初期状態として、以下の機能が実装・テストされています。

- ポート A0 / A1 / A2 でのアナログ入力
- ポート D3 / D5 / D6 での PWM によるアナログ出力
- ポート D2〜D8 でのデジタル入力／出力
- ポート I2C-1 / I2C-2 / I2C-3 に接続された I2C スレーブデバイスへの読書き
- Raspberry Pi 3 Model B および Raspberry Pi Model B Rev 2（Raspbian 2017年11月版、GrovePi+ ファームウェア 1.2.7）で動作確認済み

## Todo

- ファームウェアがサポートしている残りのコマンドの実装
- Windows IoT Core 対応
- さらなるテスト
