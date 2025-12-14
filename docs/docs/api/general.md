#API - General Sensors

このセクションでは、さまざまなセンサー向けの Python API リファレンスを説明します。このライブラリは Python 3 を対象としています。

このセクションで説明するセンサーは次のとおりです。

- [Grove Temperature Sensor](http://wiki.seeedstudio.com/Grove-Temperature_Sensor_V1.2/)
- [Grove Ultrasonic Sensor](https://www.seeedstudio.com/Grove-Ultrasonic-Ranger-p-960.html)
- [DHT11](http://wiki.seeedstudio.com/Grove-TemperatureAndHumidity_Sensor/)
- [DHT22](http://wiki.seeedstudio.com/Grove-Temperature_and_Humidity_Sensor_Pro/)
- [Grove IR Receiver](https://www.seeedstudio.com/Grove-Infrared-Receiver-p-994.html) （[Infrared Remote](https://www.dexterindustries.com/shop/infrared-remote/) に必要）

---
**IMPORTANT**

このライブラリ（および他のライブラリ）はスレッドセーフではありません。複数のスレッドやプロセスから同時に GrovePi を呼び出すことはできません。そのような使い方をすると GrovePi が不正な状態になります。

Raspberry Pi から GrovePi をリセットする必要がある場合は、[このセクション](../fw/#resetting-the-grovepi) を参照してください。

各関数は引数が妥当かどうかを検証しません。そのため、呼び出し側で事前に引数の検証・チェックを行う必要があります。不正な引数で関数を呼び出すと、GrovePi の動作が未定義になる可能性があります。
---

##`grovepi.temp(pin, model='1.0')`
GrovePi 上の [Grove Temperature Sensor](http://wiki.seeedstudio.com/Grove-Temperature_Sensor_V1.2/) から温度を読み取ります。

**Parameters**

- `pin {Integer}` 読み取り元のポート番号（A0〜A2）
- `model {String}` 使用するセンサーのモデルに応じて `"1.0"` / `"1.1"` / `"1.2"`

**Returns**: 温度（℃）を表す `{Float}`

---

##`grovepi.ultrasonicRead(pin)`
GrovePi 上の [Grove Ultrasonic Sensor](https://www.seeedstudio.com/Grove-Ultrasonic-Ranger-p-960.html) を使って、物体までの距離を読み取ります。
対象物との距離が近いほどサンプリングレートは速く、遠ざかるほど遅くなります。

**Parameters**

- `pin {Integer}` 読み取り元のポート番号（D2〜D8）

**Returns**: 対象物までの距離（cm）を表す `{Integer}`

---

##`grovepi.version()`
ファームウェアのバージョンを読み取ります。

**Returns**: ファームウェアバージョン（例: `"1.2.7"`）を表す `{String}`

---

##`grovepi.dht(pin, module_type)`
指定した DHT 系モジュールを使って、GrovePi 上で温度と湿度を読み取ります。

**Parameters**

- `pin {Integer}` 読み取り元のポート番号（D2〜D8）
- `module_type {Integer}` 使用するモジュールの種類

    - `0` — [DHT11](http://wiki.seeedstudio.com/Grove-TemperatureAndHumidity_Sensor/)
    - `1` — [DHT22](http://wiki.seeedstudio.com/Grove-Temperature_and_Humidity_Sensor_Pro/)
    - `2` — DHT21
    - `3` — AM2301

**Returns**: `{(Float, Float)}` のリスト。1 番目の要素が温度（℃）、2 番目の要素が湿度（%）。

**On Error**: センサーが要求されたサンプルレートについていけない場合などは、`NaN` を含む `{(Float, Float)}` を返します。

---

##`grovepi.ir_read_signal()`
[Grove IR Receiver](https://www.seeedstudio.com/Grove-Infrared-Receiver-p-994.html) からデコード済みの値を取得します。何らかのリモコン（任意のメーカーのもの）を使う必要があります。推奨しているのは [Infrared Remote](https://www.dexterindustries.com/shop/infrared-remote/) です。

この関数を使う前に、まず [grovepi.ir_recv_pin](#grovepiir_recv_pinpin) 関数を呼び出して、どのポートを使うかを関連付けておく必要があります。

**Parameters**: なし

**Returns**: `{(Integer, Integer, Integer)}` 形式の 3 要素リスト

- 1 番目の要素: メーカーを表す `{Integer}`

    - 不明な場合は `-1`、未使用は `0`
    - RC2, RC5, NEC, SONY, PANASONIC, JVC, SAMSUNG, WHYNTER, AIWA_RC_T501, LG, SANYO, MITSUBISHI, DISH, SHARP, DENON, PRONTO, LEGO_PF は `1`〜`17`

- 2 番目の要素: 一部の Panasonic / Sharp 製リモコンで使われる 16 bit アドレス
- 3 番目の要素: どのボタンが押されたかを識別するための 32 bit デコード値（ボタンとの対応表は用意されていないため、個別にマッピングする必要があります）

---

##`grovepi.ir_recv_pin(pin)`
指定したポートで [Grove IR Receiver](https://www.seeedstudio.com/Grove-Infrared-Receiver-p-994.html) を有効化します。[grovepi.ir_read_signal](#grovepiir_read_signal) や [grovepi.ir_is_data](#grovepiir_is_data) と組み合わせて使用します。

**Parameters**

- `pin {Integer}` IR Receiver を接続するポート番号（D2〜D8）

**Returns**: None

---

##`grovepi.ir_is_data()`
[Grove IR Receiver](https://www.seeedstudio.com/Grove-Infrared-Receiver-p-994.html) から読み取れるデータがあるかどうかを確認します。[grovepi.ir_read_signal](#grovepiir_read_signal) と組み合わせて使用します。

**Parameters**: なし

**Returns**: 利用可能なデータがあれば `True`、なければ `False`
