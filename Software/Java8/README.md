# IoTDevices
Grove Pi library

GrovePi を Java 8 から利用するためのライブラリです。Maven プロジェクトとして提供されています。

Raspberry Pi 上のデバイスにネイティブアクセスする必要があるため、次のいずれかのライブラリを利用します。

- Pi4J ライブラリ（サードパーティ: http://pi4j.com/）
- DeviceIO ライブラリ（JDK: http://docs.oracle.com/javame/8.0/api/dio/api/index.html）

どちらを使うかは用途に応じて選択できます。Pi4J を使う場合は DeviceIO ライブラリを追加する必要はありません。どちらの実装を使ってもコンポーネントの使い方は同じで、Raspberry Pi の GPIO ポートにどうアクセスするか（Pi4J / DeviceIO）の違いだけです。

## BUILD

ビルドには次のコマンドを実行します。

```bash
mvn install
```

これにより、以下の各プロジェクトの `target` フォルダ内に `.jar` ファイルが作成されます。

- GrovePi-Spec
- GrovePi-pi4j
- GrovePi-dio

## INCLUDING THE LIBRARIES IN YOUR PROJECTS

まず、コアライブラリである GrovePi-Spec の jar をプロジェクトに含めます。  
そのうえで、利用したい実装に応じて次のどちらかを追加します。

- GrovePi-pi4j と Pi4J の jar
  - Pi4J のインストールは公式手順（http://pi4j.com/install.html）に従って行います。
  - インストール後、Pi4J の jar をプロジェクトのライブラリに追加します。
- GrovePi-dio と DeviceIO の jar
  - Raspberry Pi 上にインストールし、生成された jar をプロジェクトに追加します: https://wiki.openjdk.java.net/display/dio/Getting+Started
  - DIO で実行する場合は、Java 実行時に次のオプションを指定します:
    - `-Djava.library.path="/home/pi/dio/build/so"`
    - `-Djava.security.policy="/home/pi/dio/dio.policy"`

Maven 依存関係として利用することもできます。

必須依存関係:

```xml
<dependency>
  <groupId>org.iot.raspberry</groupId>
  <artifactId>GrovePi-spec</artifactId>
  <version>0.1.0-SNAPSHOT</version>
</dependency>
```

デバイス実装の依存関係（どちらか一方を選択）:

```xml
<dependency>
  <groupId>org.iot.raspberry</groupId>
  <artifactId>GrovePi-pi4j</artifactId>
  <version>0.1.0-SNAPSHOT</version>
</dependency>
```

または

```xml
<dependency>
  <groupId>org.iot.raspberry</groupId>
  <artifactId>GrovePi-dio</artifactId>
  <version>0.1.0-SNAPSHOT</version>
</dependency>
```

いずれの場合も、Pi4J または DeviceIO 本体のインストールを忘れないでください。

## RUNNING THE EXAMPLES

サンプルはシンプルな NetBeans プロジェクトとして用意されており、リモート JVM 機能を利用した実行を行いやすくなっています。  
詳細は `http://blog.weston-fl.com/configure-netbeans-to-test-and-deploy-raspberry-pi-project/` を参照してください。

プロジェクトを実行する際は、次の 2 つのパラメータを指定します。

- 実装方式: `pi4j` または `dio`
- 実行するクラス名

ビルド後、`examples.jar`, `GrovePi-spec.jar`, `GrovePi-pi4j.jar`, `GrovePi-dio.jar`（および `pi4j.jar` や `deviceIo.jar`）を 1 か所にまとめます。  
そのうえで、次のようにすべての jar をクラスパスに含めて実行します。

```bash
java -cp lib/* org.iot.raspberry.examples.Runner pi4j BlinkingLed
```

各サンプルには、GrovePi ボードへの接続方法が記載されています。

実行を停止したい場合（無限ループするサンプルなど）は次のようにします。

- Raspberry Pi 上で直接実行している場合: コンソールで `quit` と入力
- NetBeans 経由でリモート実行している場合: プロジェクトをもう一度実行（最初の実行で開始、2 回目の実行で停止 — コンソール入力ができない場合に便利です）

## STARTING YOUR OWN PROJECT

Maven を使用する場合は、上記の依存関係を `pom.xml` に追加します。  
Maven を使わない場合は、必要な jar をプロジェクトに直接追加してください。

あるいは、GrovePi-Spec プロジェクトと DeviceIO / Pi4J 関連のクラスをすべて新規プロジェクトにコピーして、単一の jar にまとめることもできます（ただし、それでも Pi4J または DeviceIO のライブラリ自体は別途必要です）。

## USAGE

利用したい実装に応じて、`GrovePi` クラスのインスタンスを作成します。

```java
GrovePi grovepi = new GrovePi4J();
// OR
GrovePi grovepi = new GrovePiDio();
```

次に、接続したデバイスを生成し、コンストラクタに先ほどの `grovepi` を渡します。

```java
GroveTemperatureAndHumiditySensor dht = new GroveTemperatureAndHumiditySensor(grovePi, 4, GroveTemperatureAndHumiditySensor.Type.DHT11);

// 単純なデジタル入出力の場合
GroveDigitalOut led = grovePi.getDigitalOut(4);
```

コンストラクタの引数に指定する数値は、通常 GrovePi ボード上のポート番号を表します。

**注意:** GrovePi オブジェクトは必ず 1 つだけにしてください。同じボードに接続された複数のデバイスであっても、単一の GrovePi インスタンスを共有して利用します。複数の GrovePi オブジェクトを作成すると、デバイスアクセスの衝突が発生する可能性があります。
