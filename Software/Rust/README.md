# Rust support for GrovePi

## Introduction
GrovePi を Rust から扱うための Rust Crate です。

使い方の例は、各ディレクトリ内の `main.rs` を参照してください。

## Dependencies
- Rust バージョン 1.65 以降で動作確認済みです。
- Rust crate [**rppal**](https://github.com/golemparts/rppal) が必要で、`Cargo.toml` に依存関係として記述されています。

## Current State
初期状態として、以下の機能が実装・テストされています。

- I2C スレーブデバイス [**Grove-LCD RGB Backlight**](https://wiki.seeedstudio.com/Grove-LCD_RGB_Backlight/) v4.0 への読書き（ポート I2C-1 / I2C-2 / I2C-3）
- Raspberry Pi 3 Model B、および Raspberry Pi Model B Rev 2（Raspbian 2022年9月版）で動作確認済み

## Cross compile for Raspberry Pi

Raspberry Pi 向けクロスコンパイルの手順は、`cross` プロジェクトの説明に従ってください。  
セットアップ手順: https://github.com/cross-rs/cross

セットアップ後、次のようにビルドします。

```bash
cross build --target arm-unknown-linux-gnueabi
```

これで Raspberry Pi 上で実行可能なバイナリが `target/arm-unknown-linux-gnueabi/debug/airq` に生成されます。  
このバイナリを Raspberry Pi に転送し、Pi 上で `grove_rgb_lcd` を実行すると、いくつかのデバッグメッセージと、色の変化が確認できます。

## Add the module `grove_rgb_lcd` to your projects

自身のプロジェクトに `grove_rgb_lcd` モジュールを追加する場合は、`Cargo.toml` に `rppal` 依存を追加しておく必要があります。
