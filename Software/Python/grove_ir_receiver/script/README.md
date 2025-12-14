## IR remote control

### このフォルダには、Keyes IR リモコンを GrovePi と一緒に使うためのセットアップ用ファイルが含まれています。

**Files:**
- **ir_recv_example.py** : IR リモコンのボタン入力をテストするためのスクリプト
- **/script/ir_install.sh** : IR リモコン制御用のインストールスクリプト
- **/script/setup_older_version.sh** : 旧型 IR 受信機向けのインストールスクリプト

**Connection:**
IR 受信機を GrovePi 上の RPi シリアルポートに接続します。これにより、IR 信号がシリアルピンへパススルーされます。  
IR 受信機のハードウェア v1.0 以前では IR 受信素子が白いワイヤに接続されており、v1.1 / v1.2 では黄色いワイヤに接続されています。そのため、使用する GPIO がバージョンによって異なります。

**Installation:**
- `ir_install.sh` を実行可能にします: `sudo chmod +x ir_install.sh`
- インストールスクリプトを実行します: `sudo ./ir_install.sh`
- IR 受信機が v1.0 以前の場合は、`setup_older_version` スクリプトも実行します。
  - `sudo chmod +x setup_older_version.sh`
  - `sudo ./setup_older_version.sh`

**Usage:**
`ir_recv_example.py` を実行して、リモコンが正しく動作しているか確認します。
