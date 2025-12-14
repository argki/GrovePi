# Go library for GrovePi

## Introduction
GrovePi を Go から利用するためのライブラリです。  
利用するには、あらかじめ `mrmorphic` の `hwio` ライブラリをインストールしておく必要があります。

```bash
go get github.com/mrmorphic/hwio
```

## Features

- デジタル出力（Digital Write）により、リレーや LED の ON/OFF を制御できます。
- DHT センサー読み取り（DHT Read）により、例えば `Temperature: 25.000000 - Humidity: 95.000000` のように温度・湿度を取得できます。

## Testing

このパッケージには Go のテスト用パッケージが含まれており、Raspberry Pi 上で Visual Studio Code から直接実行できます。
