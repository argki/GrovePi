adxl345-python
==============

ADXL345 3 軸 MEMS 加速度センサー IC（Adafruit ADXL345 Triple-Axis Accelerometer などのブレイクアウトボード、http://www.adafruit.com/product/163 で使われているもの）向けの、Raspberry Pi 用 Python i2c ライブラリです。

このライブラリは、IC 向け i2c プロトコルの基本的な実装であり、Raspberry Pi 上で ADXL345 を使い始めるためのシンプルな方法を提供します。

モジュールを import してセンサー値を取得する例は次のとおりです。

```python
from adxl345 import ADXL345

adxl345 = ADXL345()

axes = adxl345.getAxes(True)
print("ADXL345 on address 0x%x:" % (adxl345.address))
print("   x = %.3fG" % (axes['x']))
print("   y = %.3fG" % (axes['y']))
print("   z = %.3fG" % (axes['z']))
```

コマンドラインから直接実行することもできます。

```bash
sudo python3 ADXL345.py
```

この場合、現在の x / y / z 軸の値が G 単位で出力されます。
