# Flogo.io library for GrovePi

TIBCO Flogo についての詳細は `http://flogo.io` を参照してください。

## Introduction

ここで紹介する 2 つの Activity は、GrovePi ボード上で Digital Write を実行したり、温度と湿度を読み取ったりする処理を、グラフィカルに定義された Flogo Flow から簡単に利用できるようにするものです。

![GrovePi in Flogo](screenshots/Flogo-GrovePi-Flow.png "A simple GrovePi Flogo Flow.")

## Install

Flogo WebUI 環境にこの Activity をインストールするには、拡張機能の GitHub パス（例: `github.com/DexterInd/GrovePi/Software/flogo/activities/grovepiDigitalWrite`）を指定するだけです。

基本的には、このパスは Activity の JSON に含まれる `ref` と一致している必要があります。

![Flogo WebUI](screenshots/Flogo-add-Activity.png "add a Activity to Flogo WebUI.")

WebUI で "add new Activity" を選択します。

![Flogo WebUI Console](screenshots/GrovePi-Extension-Install.png "Flogo WebUI Console Log.")

インストール処理の状況は Flow WebUI サーバーコンソールに表示されます。しばらくすると WebUI 上に "success" メッセージが表示され、新しい Activity を使えるようになります。

![Flogo WebUI Success](screenshots/GrovePi-Extension-Success.png "Flogo WebUI, Extension added.")

## Activity Interfaces

### Digital Write

Input
- pin           整数のピン番号
- value         `true` / `false`（ブール値）

Output
- success       処理が成功したかどうか（ブール値）

### DHT Read

Input
- pin           整数のピン番号

Output
- temperature   文字列
- humidity      文字列

## Remarks

Falco Tomasetti と [didrocks](https://github.com/didrocks) による Go 言語版 GrovePi 実装をベースにしています。

また、`mrmorphic` の `hwio` ライブラリが必要です。

```bash
go get github.com/mrmorphic/hwio
```
