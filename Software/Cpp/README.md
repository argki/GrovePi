### License

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

---
# GrovePi C++ library

このライブラリは、C++ から GrovePi を利用するための基本機能を提供します。  
GrovePi についての詳細は `https://www.nuget.org/packages/GrovePi/` を参照してください。

### To install package

まず `../GrovePi/Software/Cpp` に移動します。

```bash
$ cd ../GrovePi/Software/Cpp
$ tar -xzvf grovepicpp_0.1.1.tar.gz
$ cd grovepicpp_0.1.1
$ sudo dpkg --install ./grovepicpp_0.1.1.deb
```

パッケージには次のソースファイルが含まれています。

- `grovepi.cpp`
- `grove_dht_pro.cpp`
- `grove_rgb_lcd.cpp`

### To uninstall package

```bash
$ sudo dpkg --remove grovepicpp
```

### To compile with package installed

```bash
g++ -Wall [dependencies[,..]].cpp -lgrovepicpp -o [program_name].out  // 一般的な形式
```

```bash
g++ -Wall grove_relay.cpp -lgrovepicpp -o grove_relay.out            // 簡単な例
```

### To compile without package

```bash
g++ -Wall grovepi.cpp [dependencies[,..]].cpp -o [program_name].out  // 一般的な形式
```

```bash
g++ -Wall grovepi.cpp grove_relay.cpp -o grove_relay.out            // 簡単な例
```

### Then run the executable

```bash
$ ./[program_name].out
```

---
# The basic library functionalities of GrovePi are

- `initGrovePi()` : GrovePi との通信を初期化します。暗黙のアドレス `0x04` を使用します。
- `initDevice(uint8_t address)` : 指定した `address` のデバイスとの通信を初期化します。
- `delay(milliseconds)` : 指定ミリ秒だけ待機します。
- `pinMode(uint8_t pin, uint8_t mode)` : デジタル／アナログポートのモードを設定します。`mode` は `INPUT` / `OUTPUT`。
- `digitalWrite(uint8_t pin, bool value)` : デジタルポートに `HIGH` / `LOW` の値を書き込みます。
- `digitalRead(uint8_t pin)` : 指定ピンからデジタル値（`HIGH` / `LOW`）を読み取ります。
- `analogWrite(uint8_t pin, uint8_t value)` : 指定ピンに 0〜255 のアナログ値を書き込みます。
- `analogRead(uint8_t pin)` : 指定ピンの値を読み取り、0〜255 の値として返します。
- `ultrasonicRead(uint8_t pin)` : 超音波センサーで計測した距離（cm）を返します（デジタルポートを利用）。
- `setMaxI2CRetries(int _max_i2c_retries)` : 処理を中止するまでの I2C 再試行回数を設定します（**通常は使用しないでください**）。
- `setGrovePiAddress(uint8_t addr)` : GrovePi の「暗黙のアドレス」を変更します（ファームウェアや物理アドレス自体は変わらず、到達可能なアドレスだけを変更します。**通常は使用しないでください**）。
- `writeBlock(uint8_t command, uint8_t pin_number, uint8_t opt1 = 0, uint8_t opt2 = 0)` : GrovePi にコマンドを送信します。`command` は対象ピン `pin_number` を操作するコマンドで、`opt1` / `opt2` はコマンドに応じた追加引数です（例えばアナログ出力では `opt1` に書き込みたい値を渡します）。
- `writeByte(uint8_t byte_val)` : GrovePi に 1 バイトだけ送信します。`writeBlock` は、この関数を複数回呼ぶことで構成されています。
- `readBlock(uint8_t *data_block)` : GrovePi から読み取ったデータを配列として返します（配列長は戻り値で返されます）。
- `readByte()` : GrovePi から 1 バイト読み取ります。

# Attention

- このライブラリでは、`initGrovePi()` や `initDevice(uint8_t address)` で通信相手を切り替えない限り、複数の I2C デバイスを同時に扱うことはサポートされていません。
- ライブラリ内のいずれかの関数で I2C ライン上のエラーが発生した場合、`GrovePi::I2CError()` 例外が送出されます（`std::runtime_error` を継承）。
- このライブラリは `GrovePi` 名前空間内に定義されているため、名前解決演算子や `using` 宣言を忘れないようにしてください。

# How to create a deb package

`tar` パッケージを展開し、そのディレクトリに `cd` します。フォルダ構成は次のようになっています。

![archive folder structure](tar_archive.PNG)

----------

`source` フォルダには、ソースファイルに加えて `.o` オブジェクトファイルと `.so` 共有ライブラリが含まれています。  
共有ライブラリを生成するには、以下の手順を実行します。

### Step 1

すべての `.cpp` ファイルを、共有ライブラリ生成に必要な position independent code（PIC）としてコンパイルします。

```bash
g++ -C -Wall -Werror -fpic [cppfile]
```

その後、次のコマンドで共有ライブラリを作成します。

```bash
g++ -shared -o libshared.so [list of .o files]
```

ライブラリ名は常に `lib` プレフィックスと `.so` サフィックスを持つ必要があります。  
例えば `libgrovepicpp.so` という名前であれば、ライブラリ名は `grovepicpp` となります。

作成した共有ライブラリは、`grovepicpp_x.y.z/usr/lib` フォルダにコピーします。

----------

### Step 2

`source` フォルダ内のヘッダファイルをすべて `grovepicpp_x.y.z/usr/include` にコピーします（`include` フォルダは事前にクリーンにしておきます）。

----------

### Step 3

`grovepicpp_x.y.z/DEBIAN/` フォルダ内の `control` ファイルを開き、バージョン番号を適切に変更します。  
例えばバージョンが `0.2.1` の場合:

1. 1 桁目: 大きな変更やアーキテクチャ変更などのメジャーリリースを表します。`0` であれば、まだ完成前のリリースであることを意味します。
2. 2 桁目: 既存アーキテクチャに新機能が追加されたことを表します。
3. 3 桁目: バグ修正やごく小さな変更などを表します。

また、他のフォルダ名もこのバージョン番号に合わせて変更してください。

----------

### Step 4

`grovepicpp_x.y.z` と `source` の 2 つのフォルダが見える階層まで戻り、次のコマンドで実際の `.deb` パッケージを作成します。

```bash
dpkg-deb --build grovepicpp_x.y.z/
```

----------

### Step 5

そのフォルダから 1 つ上の階層に移動し、次のコマンドでアーカイブを作成します。

```bash
tar -csvf grovepicpp_x.y.z.tar.gz grovepicpp_x.y.z/
```

----------

### Voilà! これで配布可能なパッケージが完成です。
