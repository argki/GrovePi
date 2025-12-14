GrovePi for Node.js
=======

GrovePi is an open source platform for connecting Grove Sensors to the Raspberry Pi.

## Quick start

最初に、Raspberry Pi 上に Node.js をインストールし、このリポジトリをローカル環境に clone しておく必要があります。  
`npm` がインストールされていることを確認したら、パッケージのインストールに進みます。

Node.js をインストールする一例として、次のような手順があります（必要に応じて公式ドキュメントを参照してください）。

```bash
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install nodejs
cd $HOME && mkdir .node_modules_global
npm config set prefix $HOME/.node_modules_global
```

#### Installing Package from NPM Repository

Node.js アプリケーションのフォルダに移動して、次のコマンドを実行します。

```bash
$ npm install node-grovepi
```

#### Installing Package by Linking the Project In This Repo

このリポジトリ内の `libs` ディレクトリに移動して、次を実行します。

```bash
npm install
npm link
```

その後、自分のアプリケーション（`$HOME` 以下の任意の場所）に移動して、次を 1 回実行します。

```bash
npm link node-grovepi
```

これにより、自分のプロジェクトから、このリポジトリの `libs` フォルダにあるライブラリを参照できるようになります。

#### Using the Library

アプリケーションからモジュールを読み込むには、次のようにします。

```javascript
var GrovePi = require('node-grovepi').GrovePi
```

続いて、GrovePi のベースクラスを読み込みます。

```javascript
var Commands = GrovePi.commands
var Board = GrovePi.board
```

利用したいセンサー／コンポーネントに対応するクラスがすでに用意されている場合は、次のように読み込みます。

```javascript
var AccelerationI2cSensor = GrovePi.sensors.AccelerationI2C
var UltrasonicDigitalSensor = GrovePi.sensors.UltrasonicDigital
var AirQualityAnalogSensor = GrovePi.sensors.AirQualityAnalog
var DHTDigitalSensor = GrovePi.sensors.DHTDigital
var LightAnalogSensor = GrovePi.sensors.LightAnalog
var DigitalButtonSensor = GrovePi.sensors.DigitalButton
var LoudnessAnalogSensor = GrovePi.sensors.LoudnessAnalog
var RotaryAngleAnalogSensor = GrovePi.sensors.RotaryAnalog
```

GrovePi 本体とセンサー／コンポーネントを初期化する例は次のとおりです。

```javascript
var board = new Board({
  debug: true,
  onError: function(err) {
    console.log('Something wrong just happened')
    console.log(err)
  },
  onInit: function(res) {
    if (res) {
      console.log('GrovePi Version :: ' + board.version())

      var lightSensor = new LightAnalogSensor(2)
      console.log('Light Analog Sensor (start watch)')
      lightSensor.on('change', function(res) {
        console.log('Light onChange value=' + res)
      })
      lightSensor.watch()
    }
  }
})
```

対応するクラスが用意されていないセンサーやコンポーネントを使いたい場合は、自分で関数を定義することもできます。

_注: すべてのカスタム関数は、Board の init が完了した後にのみ呼び出してください。_

```javascript
function customAccelerationReading() {
  var write = board.writeBytes(Commands.acc_xyz.concat([Commands.unused, Commands.unused, Commands.unused]))
  if (write) {
    board.wait(100)
    board.readByte()
    var bytes = board.readBytes()
    if (bytes instanceof Buffer) {
      var x = bytes[1] > 32 ? -(bytes[1]-224) : bytes[1]
      var y = bytes[2] > 32 ? -(bytes[2]-224) : bytes[2]
      var z = bytes[3] > 32 ? -(bytes[3]-224) : bytes[3]
      return [x, y, z]
    } else {
      return false
    }
  } else {
    return false
  }
}
```

準備ができたら、次のように `init` メソッドを呼び出します。

```javascript
board.init()
```

各センサー／コンポーネントには、最低でも次の 3 つのデータ取得メソッドがあります。
- **read()** — センサー／コンポーネントから値を 1 回読み取る
- **stream(delay, callback)** — 指定したミリ秒ごと（`delay`）に値を callback に渡すストリームを開始します。終了するには `stopStream()` を呼びます。
- **watch(delay)** — 値に変化があったときだけ "change" イベントを発火するポーリングループを開始します。タイマーは、指定した `delay` もしくはデフォルトの 100ms で動作します。停止するには `stopWatch()` を呼びます。

書き込み用のメソッドは 1 つです。
- **write(value)** — センサー／コンポーネントに値を書き込みます。

一部のセンサーは追加メソッドを持ちます。
- *DigitalButton* センサーは **down** イベントを提供し、コールバックの引数として `singlepress` または `longpress` を受け取ります（押下時間に応じて変化）。
- *RotaryAngleAnalogSensor* は **read** メソッドをオーバーライドし、ノイズを抑えた出力を提供します（値が実際には変化していないのに変化したように見えるケースを避けるため）。戻り値は 0〜100 の範囲となり、このセンサーでは別途 **start** メソッドを呼ぶ必要があります。
- *LoudnessAnalogSensor* は **readAvgMax** メソッドを提供し、一定期間内の平均値と最大値を返します。この期間は `readAvgMax` を呼ぶたびにリセットされるため、`setInterval` などで定期的に呼び出す前提です。この監視を開始するには **start** メソッドを呼ぶ必要があります。

より複雑なサンプルは、リポジトリ内 `tests` フォルダの `basicTest.js` ファイルを参照してください。

## License

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
