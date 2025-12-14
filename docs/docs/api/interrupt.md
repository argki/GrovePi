#API - Interrupt-Based Devices

このセクションでは、割り込みベースのデバイス向けの Python API リファレンスを説明します。このライブラリは Python 2.x / 3.x の両方のメジャーバージョンに対応しています。

このセクションで説明するセンサーは次のとおりです。

- [Grove Dust Sensor](https://www.seeedstudio.com/Grove-Dust-Sensor%EF%BC%88PPD42NS%EF%BC%89-p-1050.html)
- [Grove Encoder](https://www.seeedstudio.com/Grove-Encoder-p-1352.html)
- [Grove Water Flow Sensor](https://www.seeedstudio.com/M11%2A1.25-Water-Flow-Sensor-p-1345.html)（他の用途にも流用可能）

上記センサー向け API の説明に加え、GrovePi 上で割り込みイベントを設定するための一連の関数についても説明します。これらの関数は上記センサー用 API を構成する部品であり、ご自身のデバイス向けに実装する際にも利用できます。
 
---
**IMPORTANT**

このライブラリ（および他のライブラリ）はスレッドセーフではありません。複数のスレッドやプロセスから同時に GrovePi を呼び出すことはできません。そのような使い方をすると GrovePi が不正な状態になります。

Raspberry Pi から GrovePi をリセットする必要がある場合は、[このセクション](../../fw/#resetting-the-grovepi) を参照してください。

各関数は引数が妥当かどうかを検証しません。そのため、呼び出し側で事前に引数の検証・チェックを行う必要があります。不正な引数で関数を呼び出すと、GrovePi の動作が未定義になる可能性があります。
---

##`grovepi.set_pin_interrupt(pin, ftype, interrupt_mode, period)`
指定ポートに割り込みイベントを紐付けます。

パルスのカウント、パルスの長さの測定、変化時／立ち上がり／立ち下がりなどさまざまなトリガーモードの設定を、指定した時間枠の中で行うことができます。

同じピンに対して、この関数を割り込み解除なしに連続で呼び出した場合は、以前の設定が上書きされ、最新の設定が有効になります。

また、この設定を行うと、該当ピンの OUTPUT 機能は無効化されます。そのピンで出力を行いたい場合は、[grovepi.unset_pin_interrupt](#grovepiunset_pin_interruptpin) で割り込みを解除してください。

**Parameters**

- `pin {Integer}` デバイスを接続するピン（D2〜D8）
- `ftype {Integer}` 割り込みイベントの種類。
  `grovepi.COUNT_CHANGES`（トリガー回数のカウント）、`grovepi.COUNT_LOW_DURATION`（LOW 状態の継続時間の測定）
- `interrupt_mode {Integer}` 割り込みのトリガーモード。`grovepi.CHANGE` / `grovepi.FALLING` / `grovepi.RISING`（Arduino と同様）
- `period {Integer}` 計測した値を GrovePi 上に保存し、マスター側（Raspberry Pi）から読み取れるようにするまでの時間。単位はミリ秒。最小値はあまり小さくしすぎないこと（目安として *5 ms* 未満は避ける）、最大値は *65535 ms*。

**Returns**: None

---

##`grovepi.unset_pin_interrupt(pin)`
指定ピンに紐付けられた割り込みイベントを解除します。

[grovepi.digitalWrite](../gpio/#grovepidigitalwritepin-value) 関数でそのピンに出力を行いたい場合は、この関数で割り込みを解除する必要があります。

**Parameters**

- `pin {Integer}` 割り込みを解除するピン（D2〜D8）

**Returns**: None

---

##`grovepi.unset_all_interrupts()`
すべてのピンに設定されている割り込みイベントを解除します。

**Parameters**: なし

**Returns**: None

---

##`grovepi.is_interrupt_active(pin)`
指定ピンに割り込みイベントが設定されているかどうかを確認します。

**Parameters**

- `pin {Integer}` チェック対象のピン（D2〜D8）

**Returns**: `{Bool}` — 割り込みイベントが設定されていれば `True`、そうでなければ `False`

---

##`grovepi.get_active_interrupts()`
割り込みイベントが設定されているすべてのピンの一覧を取得します。

**Parameters**: なし

**Returns**: 割り込みイベントが有効なピン番号のリスト（整数）

---

##`grovepi.read_interrupt_state(pin)`
指定ピンに紐付いた割り込みイベントが記録した値を取得します。

例えば、ピン D2（例として D2 を使用。実際には任意のデジタルピンで同様）に対して、`ftype` を `grovepi.COUNT_CHANGES`、割り込みモードを `grovepi.RISING`、`period` を *1000 ms* に設定したとします。この条件で 567 回の立ち上がりエッジが検出されると、*1000 ms* の期間が終了した時点で、この関数は D2 の値として 567 を返します。その後も *1000 ms* ごとに値が更新されます。実際の挙動は、最初にどのように割り込みを設定したかによって変わります。

**Parameters**

- `pin {Integer}` 割り込みイベントの記録値を取得する対象ピン

**Returns**: `{Bool}` — 割り込みイベントが設定されていれば `True`、そうでなければ `False`

---

##`grovepi.dust_sensor_en(pin = 2, period = 30000)`
[Grove Dust Sensor](https://www.seeedstudio.com/Grove-Dust-Sensor%EF%BC%88PPD42NS%EF%BC%89-p-1050.html) を有効化します。

このピンにすでに別の割り込みイベントが設定されている場合、このメソッドを呼び出すと前の設定は上書きされます。詳細は [grovepi.set_pin_interrupt](#grovepiset_pin_interruptpin-ftype-interrupt_mode-period) を参照してください。[grovepi.encoder_en](#grovepiencoder_enpin-2-steps-32) や [grovepi.flowEnable](#grovepiflowenablepin-2-period-2000) の後にこの関数を呼んだ場合も同様の効果になります。

この関数は実質的に `set_pin_interrupt(pin, ftype=COUNT_LOW_DURATION, interrupt_mode=CHANGE, period=period)` と同じです。

**Parameters**

- `pin {Integer}` Dust Sensor を接続するピン（D2〜D8）
- `period {Integer}` 測定の更新周期（ms）。最大値は *65535* ms。

**Returns**: None

---

##`grovepi.dust_sensor_dis(pin = 2)`
[Grove Dust Sensor](https://www.seeedstudio.com/Grove-Dust-Sensor%EF%BC%88PPD42NS%EF%BC%89-p-1050.html) を無効化します。

指定ピンに接続された Dust Sensor を無効化します。[unset_pin_interrupt](#grovepiunset_pin_interruptpin) 関数を呼ぶのと同じです。

*この関数は将来のバージョンで削除予定であり、後方互換性のためだけに残されています。*

**Parameters**

- `pin {Integer}` Dust Sensor を接続しているピン（D2〜D8）

**Returns**: None

---
 
##`grovepi.dust_sensor_read(pin = 2, period = 30000)`
[grovepi.set_pin_interrupt](#grovepiset_pin_interruptpin-ftype-interrupt_mode-period) で設定した時間枠において、[Grove Dust Sensor](https://www.seeedstudio.com/Grove-Dust-Sensor%EF%BC%88PPD42NS%EF%BC%89-p-1050.html) の Low Pulse Occupancy（LPO）を読み取ります。

**Parameters**

- `pin {Integer}` Dust Sensor を接続しているピン（D2〜D8）
- `period {Integer}` [grovepi.set_pin_interrupt](#grovepiset_pin_interruptpin-ftype-interrupt_mode-period) で設定した測定周期（ms）。最大値は *65535* ms。

**Returns**: `{(Integer, Float, Float)}` のリスト

- 1 番目の要素: LPO 時間
- 2 番目の要素: LPO 時間 / 測定周期 の割合（パーセンテージ）
- 3 番目の要素: 粒子サイズが _1um_ 以上の場合の濃度（単位は _pcs/283ml=0.01cf_）

Dust Sensor の特性は次のグラフのとおりです。

![Grove Dust Sensor Characteristics](../img/dust_sensor_characteristics.jpg)

---

##`grovepi.encoder_en(pin = 2, steps = 32)`
[Grove Encoder](https://www.seeedstudio.com/Grove-Encoder-p-1352.html) を有効化します。

このピンにすでに別の割り込みイベントが設定されている場合、このメソッドを呼び出すと前の設定は上書きされます。

エンコーダは 2 本の割り込み対応ピンを必要とするため、この関数をある *pin* に対して呼び出すと、その次のピン（*pin + 1*）にも割り込みを設定します。どのピンに割り込みが有効になっているかを確認するには [get_active_interrupts](#grovepiget_active_interrupts) を呼び出してください。

**Parameters**

- `pin {Integer}` Encoder を接続するピン。直後のピン *pin + 1* にも割り込みが設定されます。D2〜D7 のピンに設定できます。最後のピンは、その次のピンが存在しないため使用できません。
- `steps {Integer}` Encoder のステップ数

**Returns**: None

---

##`grovepi.encoder_dis(pin = 2)`
[Grove Encoder](https://www.seeedstudio.com/Grove-Encoder-p-1352.html) を無効化します。

[grovepi.digitalWrite](../gpio/#grovepidigitalwritepin-value) 関数でこのピンに出力を行いたい場合は、この関数で割り込みを解除する必要があります。内部的には、*pin* および *pin + 1* の両方に対して [unset_pin_interrupt](#grovepiunset_pin_interruptpin) を呼ぶのと同じです。

**Parameters**

- `pin {Integer}` Flow Sensor を接続しているピン（D2〜D8）

**Returns**: None

---

##`grovepi.encoderRead(pin = 2)`
[Grove Encoder](https://www.seeedstudio.com/Grove-Encoder-p-1352.html) から現在値を読み取ります。

**Parameters**

- `pin {Integer}` Encoder を接続しているピン（D2〜D7）

**Returns**: 現在位置を表す `{Integer}`

---

##`grovepi.flowEnable(pin = 2, period = 2000)`
[Grove Water Flow Sensor](https://www.seeedstudio.com/M11%2A1.25-Water-Flow-Sensor-p-1345.html) を有効化します。

この関数は、指定した時間枠内で立ち上がりパルスの回数をカウントします。そのため、実質的には `set_pin_interrupt(pin, ftype=COUNT_CHANGES, interrupt_mode=RISING, period=period)` を呼ぶのと同じです。

このピンにすでに別の割り込みイベントが設定されている場合、このメソッドを呼び出すと前の設定は上書きされます。

*この関数は将来のバージョンで削除予定であり、後方互換性のためだけに残されています。*

**Parameters**

- `pin {Integer}` Dust Sensor を接続しているピン（D2〜D8）
- `period {Integer}` 測定の更新周期（ms）。最大値は *65535* ms。

**Returns**: None

---

##`grovepi.flowDisable(pin = 2)`
[Grove Water Flow Sensor](https://www.seeedstudio.com/M11%2A1.25-Water-Flow-Sensor-p-1345.html) を無効化します。

[grovepi.digitalWrite](../gpio/#grovepidigitalwritepin-value) 関数でこのピンに出力を行いたい場合は、この関数で割り込みを解除する必要があります。内部的には [unset_pin_interrupt](#grovepiunset_pin_interruptpin) を呼ぶのと同じです。

*この関数は将来のバージョンで削除予定であり、後方互換性のためだけに残されています。*

**Parameters**

- `pin {Integer}` Flow Sensor を接続しているピン（D2〜D8）

**Returns**: None

---

##`grovepi.flowRead(pin = 2)`
[Grove Water Flow Sensor](https://www.seeedstudio.com/M11%2A1.25-Water-Flow-Sensor-p-1345.html) を用いて測定を行います。

この関数は、[grovepi.flowEnable](#grovepiflowenablepin-2-period-2000) で設定した時間枠内の立ち上がりパルスの回数をカウントします。内部的には [grovepi.read_interrupt_state](#grovepiread_interrupt_statepin) を呼び出すのと同じです。

**Parameters**

- `pin {Integer}` Flow Sensor を接続しているピン（D2〜D8）

**Returns**: 指定時間内に発生した立ち上がりパルス数を表す `{Integer}`
