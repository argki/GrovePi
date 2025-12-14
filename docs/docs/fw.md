## Flashing the Firmware

ファームウェアを書き込むには、まず GrovePi のライブラリ／リポジトリが Raspberry Pi にインストールされている必要があります。そのためには、先に [Getting Started ガイド](quickstart.md#how-to-install) に従ってセットアップを行ってください。

ライブラリが Raspberry Pi にインストールされたら、次のコマンドを実行して GrovePi にファームウェアを書き込みます。

```bash
cd ~/Dexter/GrovePi/Firmware
bash firmware_update.sh
```
これにより、ファームウェアは最新バージョン（`1.4.0`）に更新されます。

---
**NOTE TO OTHER LIBRARIES**

ファームウェア `1.3.0` は比較的最近リリースされたため、Python 以外の言語で書かれた多くのライブラリは、まだこのバージョンに対応していません。そのため、そうしたライブラリを使う場合は、古いファームウェア（特に `1.2.7`）で動かす必要があります。

`1.2.7` のファームウェアは、`~/Dexter/GrovePi/Firmware/Archive` ディレクトリ内の `grove_pi_v1_2_7.cpp.hex` として保存されています。もしこの古いバージョンを使いたい場合は、次の手順でファームウェアを書き込んでください。

```bash
mv ~/Dexter/GrovePi/Firmware/grove_pi_firmware.hex ~/Dexter/GrovePi/Firmware/grove_pi_v1_3_0.hex.bak
cp ~/Dexter/GrovePi/Firmware/Archive/grove_pi_v1_2_7.cpp.hex ~/Dexter/GrovePi/Firmware/grove_pi_firmware.hex
bash firmware_update.sh
```

---

## Running Tests

GrovePi のテスト一式を実行するには、次のようにします。

```bash
cd ~/Dexter/GrovePi/Troubleshooting
sudo bash all_tests.sh
```

処理が完了すると、`~/Desktop/log.txt` に `log.txt` ファイルが作成されます。

また、Raspberry Pi 上にインストールされているライブラリがどのバージョンのファームウェアに対応しているかを確認したい場合は、`~/Dexter/GrovePi` ディレクトリに移動して次のコマンドを実行します。

```bash
python grovepi.py
```

これにより、GrovePi のファームウェアバージョンが表示されます。古いファームウェア（`v1.2.7` 以下）の場合は、`python grovepi.py` を実行してもバージョンは表示されません。

```bash
pi@raspberrypi:~ $ python grovepi.py
library supports this fw versions: 1.4.0
```

現在 GrovePi に書き込まれているファームウェアのバージョンを知りたい場合は、上記のテスト（`... all_test.sh`）を `Troubleshooting/` ディレクトリから実行するか、次のようなコードを実行します。

```python
import grovepi
print(grovepi.version())
```

まれに GrovePi が反応しなくなるケースがあります。このような場合、Python では例外が発生することが多いです。よくある原因としては次のようなものがあります。

- GrovePi にファームウェアが書き込まれていない  
- Raspberry Pi 上のライブラリと GrovePi 上のファームウェアのバージョンが一致していない

いずれの場合も、ファームウェアを書き直すことで解消されることがほとんどです。

## Building the Firmware

特定の用途に合わせてファームウェアを変更したい場合、自分でビルドしてから書き込む必要があります。Dexter Industries の製造工程では、[PlatformIO](https://platformio.org/) と [Atom IDE](https://atom.io/) を組み合わせて利用しています。

両方をインストールしたら、Atom IDE で `/Firmware/Source/grovepi` ディレクトリをプロジェクトとして追加します。追加されたプロジェクトは以下のような構成になっています。

- `lib/`
- `src/`
- `.gitignore`
- `.travis.yml`
- `extra_script.py`
- `platformio.ini`

その後、ビルドボタンをクリックするか、**ALT-CTRL-B** キーを押して PlatformIO でファームウェアをビルドします。ビルドが完了すると、`/Firmware/Source/grovepi/.pioenvs/grovepi` ディレクトリに `firmware.hex` が生成されます。これが生成されたファームウェアであり、GrovePi に書き込むことができます。

## Resetting the GrovePi

Raspberry Pi から GrovePi をリセットするには、GrovePi ライブラリがインストールされており、かつ `avrdude.conf` で `linuxgpio` プログラマが設定されていることを前提に、次のコマンドを実行します。

```bash
avrdude -c linuxgpio -p m328p
```

<!-- ## Enabling Software I2C

The GrovePi and the Raspberry Pi communicate over an I2C connection, but the problem with the Raspberry Pi's HW implementation has to do with the clock stretching mechanism. This mechanism is badly implemented and can lead to corrupted transfers with the GrovePi.

More details on this issue can be found on these tickets: [raspberrypi/linux/issues/254](https://github.com/raspberrypi/linux/issues/254) and [dexterind/grovepi/issues/411](https://github.com/DexterInd/GrovePi/issues/411).

In order to avoid having problems caused by the clock-stretching mechanism, you can use our bit-bang implementation of the I2C that uses the [RPi.GPIO](https://pypi.org/project/RPi.GPIO/) library. In order to have this alternative software I2C used instead, install the [DI-Sensors library](http://di-sensors.readthedocs.io/en/master/quickstart.html#how-to-install-the-di-sensors).

To check which I2C you're using, you can import the `grovepi` module and then check the value of `grovepi.whichI2C` attribute. If it's set to `"periphery"` then it means the HW I2C is used and otherwise if it's set to `"software"` then it's using the DI-Sensors' one which is bit-banged. -->
