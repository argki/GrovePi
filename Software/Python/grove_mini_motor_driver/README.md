ライブラリは **Python 3** 向けに書かれています。

発生しうるフォルト（Fault）警告:

* undervoltage lockout
* overcurrent event
* extended current limit event
* overtemperature condition
* unknown condition

Grove Mini Motor Driver で利用可能なコマンドは次のとおりです。

* `moveForward(speed)` : 前進。`speed` は `0-100`%。
* `moveBackwards(speed)` : 後退。`speed` は `0-100`%。
* `setLeftMotor(direction, speed)` : 左モーター制御。`direction` は `'FORWARD'` / `'REVERSE'`、`speed` は `0-100`%。
* `setRightMotor(direction, speed)` : 右モーター制御。`direction` は `'FORWARD'/'REVERSE'`、`speed` は `0-100`%。
* `stopLeftMotor()` : 左モーターを急停止（ブレーキ）。
* `stopRightMotor()`: 右モーターを急停止（ブレーキ）。
* `stopMotors()` : 両方のモーターを急停止（ブレーキ）。
* `disableMotors()` : デバイスをスリープさせる際などにモーターを無効化します。
* `setDisplayFaults(choice = True)` : ターミナルへのフォルト出力を有効／無効にします。

`setDisplayFaults(True)` を設定した場合のターミナル出力例:

```text
> [04-Apr-2017 19:06:08.186616][forward][speed = 0%]
> [04-Apr-2017 19:06:08.188770][left motor warning][undervoltage lockout]
> [04-Apr-2017 19:06:08.190704][right motor warning][undervoltage lockout]
...
> [04-Apr-2017 19:06:13.718809][forward][speed = 100%]
> [04-Apr-2017 19:06:15.777457][reverse][speed = 50%]
> [04-Apr-2017 19:06:17.786247][left motor][stop]
> [04-Apr-2017 19:06:17.789597][right motor][stop]
> [04-Apr-2017 19:06:18.793787][right motor][speed = 70%]
...
> [04-Apr-2017 19:06:29.818316][standby motors]
```
