#API - Complex Devices

このセクションでは、より複雑なデバイス向けの Python API リファレンスを説明します。このライブラリは Python 2.x / 3.x の両方のメジャーバージョンに対応しています。

このセクションで説明するセンサーは次のとおりです。

- [Grove LED bar](http://wiki.seeedstudio.com/Grove-LED_Bar/)
- [Grove 4-Digit Display](http://wiki.seeedstudio.com/Grove-4-Digit_Display/)
- [Grove Chainable RGB LED](https://www.seeedstudio.com/Grove-Chainable-RGB-LED-p-850.html)

---
**IMPORTANT**

このライブラリ（および他のライブラリ）はスレッドセーフではありません。複数のスレッドやプロセスから同時に GrovePi を呼び出すことはできません。そのような使い方をすると GrovePi が不正な状態になります。

Raspberry Pi から GrovePi をリセットする必要がある場合は、[このセクション](../fw/#resetting-the-grovepi) を参照してください。

各関数は引数が妥当かどうかを検証しません。そのため、呼び出し側で事前に引数の検証・チェックを行う必要があります。不正な引数で関数を呼び出すと、GrovePi の動作が未定義になる可能性があります。
---

##`grovepi.ledBar_init(pin, orientation)`
[LED bar](http://wiki.seeedstudio.com/Grove-LED_Bar/) を初期化します。

**Parameters**

- `pin {Integer}` LED bar を接続するポート番号（D2〜D8）
- `orientation {Integer}` 色の並び方向。`0` で赤→緑、`1` でその逆

**Returns**: 常に `1`

---

##`grovepi.ledBar_orientation(pin, orientation)`
既に初期化済みの [LED bar](http://wiki.seeedstudio.com/Grove-LED_Bar/) の向きを設定します。

**Parameters**

- `pin {Integer}` LED bar を接続するポート番号（D2〜D8）
- `orientation {Integer}` `0` で赤→緑、`1` でその逆

**Returns**: 常に `1`

---

##`grovepi.ledBar_setLevel(pin, level)`
[LED bar](http://wiki.seeedstudio.com/Grove-LED_Bar/) の点灯レベルを設定します。

**Parameters**

- `pin {Integer}` LED bar を接続するポート番号（D2〜D8）
- `orientation {Integer}` LED bar 上のレベル数に対応する `0`〜`10`

**Returns**: 常に `1`

---

##`grovepi.ledBar_toggleLed(pin, led)`
[LED bar](http://wiki.seeedstudio.com/Grove-LED_Bar/) 上に並ぶ 10 個の LED のうち 1 つの状態をトグルします。

**Parameters**

- `pin {Integer}` LED bar を接続するポート番号（D2〜D8）
- `led {Integer}` トグルする LED のインデックス（`0`〜`10`）

**Returns**: 常に `1`

---

##`grovepi.ledBar_setBits(pin, state)`
10 bit の値のビットパターンに基づいて、[LED bar](http://wiki.seeedstudio.com/Grove-LED_Bar/) の各 LED の ON/OFF をまとめて設定します。

**Parameters**

- `pin {Integer}` LED bar を接続するポート番号（D2〜D8）
- `state {Integer}` 10 個の LED それぞれの ON/OFF 状態を表す `0`〜`1023` の値

**Returns**: 常に `1`

---

##`grovepi.ledBar_getBits(pin)`
[LED bar](http://wiki.seeedstudio.com/Grove-LED_Bar/) 上の LED の ON/OFF 状態を読み取ります。

**Parameters**

- `pin {Integer}` LED bar を接続するポート番号（D2〜D8）

**Returns**: 10 個の LED の状態を表す `0`〜`1023` の整数

---

##`grovepi.fourDigit_init(pin)`
[Grove 4-Digit Display](http://wiki.seeedstudio.com/Grove-4-Digit_Display/) を初期化します。

**Parameters**

- `pin {Integer}` 4-Digit Display を接続するポート番号（D2〜D8）

**Returns**: 常に `1`

---

##`grovepi.fourDigit_number(pin, value, leading_zero)`
[Grove 4-Digit Display](http://wiki.seeedstudio.com/Grove-4-Digit_Display/) に数値を表示します。

**Parameters**

- `pin {Integer}` 4-Digit Display を接続するポート番号（D2〜D8）
- `value {Integer}` 表示する数値（`0`〜`9999`）
- `leading_zero {Boolean}` 先頭のゼロを埋めるかどうか

**Returns**: 常に `1`

---

##`grovepi.fourDigit_brightness(pin, brightness)`
[Grove 4-Digit Display](http://wiki.seeedstudio.com/Grove-4-Digit_Display/) の明るさを設定します。

**Parameters**

- `pin {Integer}` 4-Digit Display を接続するポート番号（D2〜D8）
- `brightness {Integer}` 明るさ。`0`（最も暗い）〜`7`（最も明るい）

**Returns**: 常に `1`

---

##`grovepi.fourDigit_digit(pin, segment, value)`
[Grove 4-Digit Display](http://wiki.seeedstudio.com/Grove-4-Digit_Display/) の特定セグメントに値を設定します。

**Parameters**

- `pin {Integer}` 4-Digit Display を接続するポート番号（D2〜D8）
- `segment {Integer}` 対象とする桁（`0`〜`3`）
- `value {Integer}` セグメントに設定する値（`0`〜`15`）

**Returns**: 常に `1`

---

##`grovepi.fourDigit_segment(pin, segment, leds)`
[Grove 4-Digit Display](http://wiki.seeedstudio.com/Grove-4-Digit_Display/) の 1 桁分の LED セグメントをビットパターンで設定します。

**Parameters**

- `pin {Integer}` 4-Digit Display を接続するポート番号（D2〜D8）
- `segment {Integer}` 変更対象の桁（`0`〜`3`）
- `leds {Integer}` 選択した `segment` の各セグメントの ON/OFF を表す `0`〜`255` の値（8 bit のうち 8 bit 目がコロン）

**Returns**: 常に `1`

---

##`grovepi.fourDigit_score(pin, left, right)`
[Grove 4-Digit Display](http://wiki.seeedstudio.com/Grove-4-Digit_Display/) の左右に値を表示します。左右の値には先頭ゼロが付与され、中央のコロンも点灯します。

**Parameters**

- `pin {Integer}` 4-Digit Display を接続するポート番号（D2〜D8）
- `left {Integer}` 左側に表示する値（`0`〜`99`）
- `right {Integer}` 右側に表示する値（`0`〜`99`）

**Returns**: 常に `1`

---

##`grovepi.fourDigit_monitor(pin, analog, duration)`
指定時間のあいだ、[analogRead](#grovepianalogreadpin) の値を [Grove 4-Digit Display](http://wiki.seeedstudio.com/Grove-4-Digit_Display/) に表示します。

**Parameters**

- `pin {Integer}` 4-Digit Display を接続するポート番号（D2〜D8）
- `analog {Integer}` アナログ値を読み取るポート番号（A0〜A2）
- `duration {Integer}` 表示時間（秒）。`0`〜`255`

**Returns**: 常に `1`

---

##`grovepi.fourDigit_on(pin)`
[Grove 4-Digit Display](http://wiki.seeedstudio.com/Grove-4-Digit_Display/) 全体を点灯させます。

**Parameters**

- `pin {Integer}` 4-Digit Display を接続するポート番号（D2〜D8）

**Returns**: 常に `1`

---

##`grovepi.fourDigit_off(pin)`
[Grove 4-Digit Display](http://wiki.seeedstudio.com/Grove-4-Digit_Display/) 全体を消灯させます。

**Parameters**

- `pin {Integer}` 4-Digit Display を接続するポート番号（D2〜D8）

**Returns**: 常に `1`

---

##`grovepi.storeColor(red, green, blue)`
[Grove Chainable RGB LED](https://www.seeedstudio.com/Grove-Chainable-RGB-LED-p-850.html) で後から使用するための色を保存します。

**Parameters**

- `red {Integer}` `0`〜`255`
- `green {Integer}` `0`〜`255`
- `blue {Integer}` `0`〜`255`

**Returns**: 常に `1`

---

##`grovepi.chainableRgbLed_init(pin, numLeds)`
指定ポート上の [chained LEDs](https://www.seeedstudio.com/Grove-Chainable-RGB-LED-p-850.html) を初期化します。

**Parameters**

- `pin {Integer}` Grove RGB LED を接続するポート番号（D2〜D8）
- `numLeds {Integer}` チェーン接続されている LED の数

**Returns**: 常に `1`

---

##`grovepi.chainableRgbLed_test(pin, numLeds, testColor)`
指定ポート上の [chained LEDs](https://www.seeedstudio.com/Grove-Chainable-RGB-LED-p-850.html) を初期化し、すべての LED にテスト用の色を設定します。

**Parameters**

- `pin {Integer}` Grove RGB LED を接続するポート番号（D2〜D8）
- `numLeds {Integer}` チェーン接続されている LED の数
- `testColor {Integer}` すべての LED に適用する色

    - `0` — 黒（消灯）
    - `1` — 青
    - `2` — 緑
    - `3` — シアン
    - `4` — 赤
    - `5` — マゼンタ
    - `6` — 黄
    - `7` — 白

**Returns**: 常に `1`

---

##`grovepi.chainableRgbLed_pattern(pin, pattern, whichLed)`
指定パターンに従って、1 つまたは複数の [chained LEDs](https://www.seeedstudio.com/Grove-Chainable-RGB-LED-p-850.html) に保存済みの色を設定します。

**Parameters**

- `pin {Integer}` Grove RGB LED を接続するポート番号（D2〜D8）
- `pattern {Integer}` パターンの種類

    - `0` — この LED のみ
    - `1` — この LED 以外のすべて
    - `2` — この LED および内側のすべての LED
    - `3` — この LED および外側のすべての LED

- `whichLed {Integer}` GrovePi から外側に向かって数えたときの LED インデックス（`0` 始まり）

**Returns**: 常に `1`

---

##`grovepi.chainableRgbLed_modulo(pin, offset, divisor)`
割り算の剰余パターンに従って、1 つまたは複数の [chained LEDs](https://www.seeedstudio.com/Grove-Chainable-RGB-LED-p-850.html) に保存済みの色を設定します。

**Parameters**

- `pin {Integer}` Grove RGB LED を接続するポート番号（D2〜D8）
- `offset {Integer}` 開始位置とする LED のインデックス（最初の LED は `0`）
- `divisor {Integer}` インデックスを `divisor` で割ったときの剰余が 0 になる LED に色を設定します。例えば `divisor=1` なら全 LED、`divisor=2` なら 2 個おきの LED が設定されます。

**Returns**: 常に `1`

---

##`grovepi.chainableRgbLed_setLevel(pin, level, reverse)`
バーグラフのように、保存済みの色を 1 つまたは複数の [chained LEDs](https://www.seeedstudio.com/Grove-Chainable-RGB-LED-p-850.html) に対してレベル表示します。

**Parameters**

- `pin {Integer}` Grove RGB LED を接続するポート番号（D2〜D8）
- `level {Integer}` 保存済みの色を点灯させる LED の個数
- `reverse {Integer}` `0` で GrovePi から外側に向かってカウント、`1` で外側から内側に向かってカウント

**Returns**: 常に `1`
