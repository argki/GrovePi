#API - GPIO Functions

このセクションでは、GPIO 関連の Python API リファレンスを説明します。このライブラリは Python 2.x / 3.x の両方のメジャーバージョンに対応しています。

---
**IMPORTANT**

このライブラリ（および他のライブラリ）はスレッドセーフではありません。複数のスレッドやプロセスから同時に GrovePi を呼び出すことはできません。そのような使い方をすると GrovePi が不正な状態になります。

Raspberry Pi から GrovePi をリセットする必要がある場合は、[このセクション](../fw/#resetting-the-grovepi) を参照してください。

各関数は引数が妥当かどうかを検証しません。そのため、呼び出し側で事前に引数の検証・チェックを行う必要があります。不正な引数で関数を呼び出すと、GrovePi の動作が未定義になる可能性があります。
---

##`grovepi.digitalRead(pin)`
GrovePi 上の指定ポートの入力が HIGH か LOW かを読み取ります。

**Parameters**

- `pin {Integer}` 読み取り元のポート番号（D2〜D8）

**Returns**: 入力値に応じて `0` または `1`

---

##`grovepi.digitalWrite(pin, value)`
GrovePi 上のデジタルポートに `0` または `1` の出力値を設定します。

**Parameters**

- `pin {Integer}` 出力先のポート番号（D2〜D8）
- `value {Integer}` 出力する値。`0` は 0V、`1` は最大出力電圧（通常 5V）。

**Returns**: 常に `1`

---

##`grovepi.analogRead(pin)`
GrovePi 上の指定ポートから入力電圧を値として読み取ります。

**Parameters**

- `pin {Integer}` 読み取り元のポート番号（A0〜A2）

**Returns**: 入力電圧に対応する 10 bit の `{Integer}` 値

---

##`grovepi.analogWrite(pin, value)`
GrovePi 上の PWM 対応ポートに対して、指定値に対応する出力電圧を設定します。

**Parameters**

- `pin {Integer}` 出力先のポート番号（3, 5, 6, 9）
- `value {Integer}` 0V〜参照電圧（5V）に対応する 8 bit の値

**Returns**: 常に `1`

---

##`grovepi.pinMode(pin, mode)`
GrovePi 上のポートを OUTPUT もしくは INPUT として設定します。

**Parameters**

- `pin {Integer}` 設定対象のポート番号（D2〜D8）
- `mode {String}` 出力に使う場合は `"OUTPUT"`、入力に使う場合は `"INPUT"`

**Returns**: 常に `1`
