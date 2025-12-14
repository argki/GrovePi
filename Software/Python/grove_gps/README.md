## Using the [Grove GPS Module](http://www.seeedstudio.com/depot/Grove-GPS-p-959.html?cPath=25_130) with the GrovePi

### Setting It Up

新しめの Raspberry Pi では、ライブラリ内で使用しているハードウェアシリアルポート `/dev/ttyAMA0` が Bluetooth モジュール用に割り当てられており、シリアルピン側にはソフトウェア実装の `/dev/ttyS0`（mini UART）が割り当てられています。
しかし、この mini UART は本ライブラリの用途には速度が不十分なため、ハードウェアシリアルが実際のシリアルピンを指すように入れ替える必要があります。  

そのためには、`/boot/config.txt` に次の行を追加または修正します。

```bash
dtoverlay=pi3-miniuart-bt
dtoverlay=pi3-disable-bt
enable_uart=1
```

次に、`/boot/cmdline.txt` から 2 つのコンソール関連の記述を削除します。
初期状態の `/boot/cmdline.txt` は次のようになっているかもしれません。

```text
dwc_otg.lpm_enable=0 console=serial0,115200 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline fsck.repair=yes root wait
```

2 つのコンソール記述を削除すると、次のようになります。

```text
dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline fsck.repair=yes root wait
```

ここまでの 2 ステップが完了したら、再起動が必要です。再起動したうえで、次のセクションに進んでください。

シリアルポートの設定方法について詳しく知りたい場合は、[この解説記事](https://spellfoundry.com/2016/05/29/configuring-gpio-serial-port-raspbian-jessie-including-pi-3/#Disabling_the_Console) を参照してください。

### Running it

GPS スクリプトを実行するには、前セクションの手順に従って設定を済ませたうえで、[Grove GPS Module](http://www.seeedstudio.com/depot/Grove-GPS-p-959.html?cPath=25_130) を GrovePi の **RPIser** ポートに接続しておきます。

スクリプトは Python 3 で起動します。

```bash
sudo python3 dextergps.py
```

出力例は次のようになります。

```bash
['$GPGGA', '150954.000', '4520.7858', 'N', '02557.6659', 'E', '1', '5', '2.84', '76.9', 'M', '36.1', 'M', '', '*6E']
['$GPGGA', '150955.000', '4520.7859', 'N', '02557.6655', 'E', '1', '5', '2.84', '77.0', 'M', '36.1', 'M', '', '*6A']
...
```

### Regarding the Library

**gps.lat** と **gps.NS** はセットで扱われ、同様に **gps.lon** と **gps.EW** もセットで扱われます。

**gps.latitude** と **gps.longitude** は、Google Map に適した形式になるよう計算された値で、南緯や西経を表す場合は負の値になります。

*Note*:
fix が 1 かつ 3 つ以上の衛星が見えている場合にのみ、良好なデータが取得できます。良い結果を得るには、モジュールを窓際など空が開けた場所に近づける必要があるかもしれません。

### Old GPS Scripts

`dextergps.py` は Grove GPS モジュールから値を取得するための新しい標準スクリプトです。古いスクリプトは、もはや使用されていませんが、互換性維持のために残されています。

- [grove_gps_data.py](grove_gps_data.py)
- [grove_gps_hardware_test.py](grove_gps_hardware_test.py)
- [GroveGPS.py](GroveGPS.py)
