# Release Notes For the Firmware

## Maintenance Team

GrovePi チームの現在および過去のメンバー（アルファベット順）は次のとおりです。

- [@CleoQc](https://github.com/CleoQc)
- [@johnisanerd](https://github.com/johnisanerd)
- [@karan259](https://github.com/karan259)
- [@RobertLucian](https://github.com/RobertLucian)

また、GrovePi 本体ではなく他のライブラリへの貢献という形で、以下のような方々にも多大な貢献をいただいています。

- [@marcellobarile](https://github.com/marcellobarile) — NodeJS ライブラリ
- [@mcauser](https://github.com/mcauser) — さまざまな新機能／バグ修正／サンプルコードの追加
- [@lanselambor](https://github.com/lanselambor)
- [@nikkoura](https://github.com/nikkoura)
- [@lucavallin](https://github.com/lucavallin) — Go ライブラリの修正
- [@rpedersen](https://github.com/rpedersen) — C# 関連
- [@k33g](https://github.com/k33g) — Java ライブラリ

## Version 1.4.0 - 27 April 2019

- GrovePi の各デジタルポートに割り込みイベントを設定できるようになり、ハードウェア割り込みが 2 つしかないという制限を回避 [#446](https://github.com/DexterInd/GrovePi/pull/446)
- Grove Dust Sensor、Grove Encoder、Grove Flow Meter が GrovePi 上の任意のデジタルポートで動作し、それぞれ 7 個・3 個・7 個まで同時接続できるように拡張 [#446](https://github.com/DexterInd/GrovePi/pull/446)

## [Version 1.3.0](https://github.com/DexterInd/GrovePi/projects/2) - 1 Aug 2018

- IO レートが極端に低下する原因になっていた同期バグを修正

    - 他ポートの値が混ざってしまう問題を引き起こしていた [#412](https://github.com/DexterInd/GrovePi/issues/412)
    - 関数呼び出しの間にディレイを入れないと I2C エラーが発生する問題を引き起こしていた [#409](https://github.com/DexterInd/GrovePi/issues/409)

- コードを軽くリファクタリングし、構造を整理
- Dust sensor の問題を修正 [#408](https://github.com/DexterInd/GrovePi/issues/408)
- Raspberry Pi の I2C が clock stretching をサポートしていないことによる不具合を緩和 [#411](https://github.com/DexterInd/GrovePi/issues/411)
- DHT センサーの取得処理をデバッグし、サンプリング速度を改善 [#418](https://github.com/DexterInd/GrovePi/issues/418)
- 任意のリモコンを利用できる IR receiver 機能を追加し、ライブラリに内在していた問題を修正 [#416](https://github.com/DexterInd/GrovePi/issues/416)
- Flow meter と Dust sensor を D2 以外のポートにも割り当てられるオプションを追加 [#421](https://github.com/DexterInd/GrovePi/issues/421)

## Version 1.2.7 - 20 Dec 2016

- IO の高速化
- IO エラーの削減
- RTC および MMA7xxx 加速度センサーに関するコードをファームウェアから削除

## Version 1.2.2 - 22 Jan 2015

- Grove Chainable RGB LED を追加
- RGB カラーをメモリに保存し、後から再利用できる機能を追加

## Version 1.2.1 - 30 Dec 2014

- Grove 4 Digit Display を追加

## Version 1.2.0 - 29 Dec 2014

- Grove LED Bar を追加
- ファームウェアのバージョン情報を取得できるように変更

## Version 1.1 - 13 Feb 2014

- DHT、超音波センサー、RTC のコードを追加
- 同種モジュールを複数サポート（未十分テスト）
- プロトコルをより堅牢に改良
