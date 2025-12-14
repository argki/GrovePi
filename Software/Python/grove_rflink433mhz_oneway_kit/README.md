Link to the Grove 433Mhz Simple RF Link Kit product  : https://www.seeedstudio.com/Grove-433MHz-Simple-RF-link-kit-p-1062.html
Link to the Grove 433Mhz Simple RF Link Kit datasheet :
* http://wiki.seeedstudio.com/images/9/95/ADI%3BACTR433A.pdf
* http://wiki.seeedstudio.com/images/1/1a/1110010P1.pdf

ライブラリは **Python 3** 向けに書かれています。

---

付属のサンプルプログラムをテストするには、2 台の Raspberry Pi が必要です。  
GrovePi ボードと一緒に使う場合は、送信機（transmitter）はジャンパ線で RPi ボードに直接接続する必要がある点に注意してください（TX / RX ピンが入れ替わっているという設計上の問題があるため）。一方、受信機（receiver）のピン配置は正しく揃っています。

---

Grove 433Mhz Simple RF Link Kit 用 `RFLinker` クラスの利用可能な関数は次のとおりです。

* `RFLinker(port = '/dev/ttyS0', chunk_size = 32, max_bad_readings = 32, retries = 20)` : クラスコンストラクタ
    * *port*: RF モジュールを接続している UART ポート
    * *chunk_size*: メッセージの最大長。メッセージ長が *chunk_size* を超える場合は、複数の伝送に分割されます — **`chunk_size` を小さくする場合は、読み取り時の `retries` を増やすようにしてください**
    * *max_bad_readings*: RF 受信機から「不正なバイト」を読み取ることが許容される最大回数。この回数を超えると処理は中止されます。
* `writeMessage(message)`: メッセージ送信用メンバ関数
    * 1 回の送信で最大 256 バイトまで送ることができます。
* `readMessage(message)`: メッセージ受信用メンバ関数
    * 受信したメッセージを文字列として返します。受信に失敗した場合は空文字列を返します。
* `setDisplayVerbose(choice = True)`: メッセージや状態の表示を有効／無効にします（デフォルトは無効）。
* `setChunkSize(chunk_size)`: チャンクサイズ（バイト数）を設定します。
* `setMaxRetries(retries)`: 受信処理を開始してから、あきらめるまでに試行する回数を設定します（高レベルのパラメータ）。
* `setMaxBadReadings(max_bad_readings)`: ストリームから「不正なバイト」を読み取ることが許容される回数を設定します（低レベルのパラメータ）。

注意点:

* `chunk_size` は `retries` と密接に関係します。`chunk_size` が大きいほど、送信を検出するために必要な `retries` は少なくなりますし、その逆も成り立ちます。
