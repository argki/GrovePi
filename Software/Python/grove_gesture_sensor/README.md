Grove - Gesture Sensor v1.0 Python library and examples
=======================================================

このライブラリは、[Grove - Gesture Sensor v1.0](http://www.seeedstudio.com/depot/Grove-Gesture-p-2463.html) を GrovePi から扱うための Python ライブラリおよびサンプルです。

コードは、Seeed 提供の Arduino 用 Gesture Sensor ライブラリ（https://github.com/Seeed-Studio/Gesture_PAJ7620）をベースにしています。

##### Files

- **grove_gesture_sensor.py**: ジェスチャーセンサーからデータを読み取るための関数をまとめたライブラリ
- **gesture_print.py**: センサー上で行ったジェスチャーを画面に表示するサンプル。ジェスチャーセンサーのテストに便利です。
- **gesture_value.py**: ジェスチャーに応じた値を返すサンプル。自作のプログラムに組み込む際の参考になります。

##### NOTE

- これは I2C センサーなので、GrovePi 上の任意の I2C ポートに接続できます。
- GrovePi の電源投入後にセンサーをホットプラグすると、GrovePi が再起動することがあります。必ず GrovePi の電源を入れる前にセンサーを接続してください。
- センサーはおおよそ 0.1 秒ごとにポーリングを行い、読み取りの後は 0.4〜1 秒程度待ってから再度ポーリングを開始します。
- データシート上の検知距離は、およそ 5〜15 cm とされています。
- センサーは IR（赤外線）を使うため、強い赤外線光源から離して設置することをおすすめします。

###### GrovePi は Raspberry Pi と Grove センサーを接続するためのボードです。詳しくは `http://www.dexterindustries.com/GrovePi` を参照してください。

###### このライブラリに関する質問があれば、`http://forum.dexterindustries.com/c/grovepi` のフォーラムで問い合わせてください。

# License

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
