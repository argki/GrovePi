## Installing

以下の手順にはインターネット接続が必要です。

ローカルに clone 済みのスクリプトを使って GrovePi を最も手早くインストールするには、（`DexterInd` リポジトリ一式が `pi` ユーザーのホームディレクトリ `~/DexterInd` に clone 済みであることを前提として）次のコマンドを実行します。

```bash
cd ~/DexterInd/GrovePi/Script
bash update_grovepi.sh
```

デフォルトでは、GrovePi パッケージはシステム全体（system-wide）にインストールされ、[script_tools](https://github.com/DexterInd/script_tools) と [RFR_Tools](https://github.com/DexterInd/RFR_Tools) はこのスクリプトを実行するたびに更新されます。

オプションを付けて実行する例は次のとおりです。

```bash
cd ~/DexterInd/GrovePi/Script
bash update_grovepi.sh --user-local --no-update-aptget --no-dependencies
```

## Command Options

このコマンドに付けられるオプションは次のとおりです。

* `--no-update-aptget` — 依存パッケージのインストール前に `sudo apt-get update` を実行しないようにします。このオプションを有効にする場合は、`--no-dependencies` を同時に指定しないよう注意してください。RFR_Tools と GrovePi の両方に適用されます。
* `--bypass-rfrtools` — RFR_Tools のインストールを完全にスキップします。
  * `--bypass-python-rfrtools` — [RFR_Tools](https://github.com/DexterInd/RFR_Tools) の Python パッケージのインストール／更新をスキップします。
  * `--bypass-gui-installation` — [RFR_Tools](https://github.com/DexterInd/RFR_Tools) が必要とする GUI 関連パッケージ／依存関係のインストールをスキップします。
* `--no-dependencies` — GrovePi 用の依存パッケージのインストールをスキップします。初回インストールが完了した後の、2 回目以降の更新時に使用することを想定しています。
* `--user-local` — GrovePi の Python パッケージをユーザーのホームディレクトリにインストールします。特別な権限は不要です。内部的には `python3 setup.py install --force --user` が実行されます。
* `--env-local` — 現在の環境内に、特権なしで GrovePi の Python パッケージをインストールします。内部的には `python3 setup.py install --force` が実行されます。
* `--system-wide` — システム全体に GrovePi の Python パッケージを `sudo` 付きでインストールします。内部的には `sudo python3 setup.py install --force` が実行されます。

`--user-local` / `--env-local` / `--system-wide` は **相互排他的** であり、同時に指定することはできません。最後に、異なるバージョンを使いたい場合は、対応するブランチ名やタグ名を引数として指定することで取得できます。

## Minimal Installation

GrovePi を最低限動かすために必要なものだけをインストールしたい場合は、次のコマンドを実行します。

```bash
cd ~/DexterInd/GrovePi/Script
bash update_grovepi.sh --bypass-gui-installation
```

このコマンドは、GrovePi の依存関係のみをインストールし、それ以外は行いません。仮想環境など別の環境で作業している場合は、`--user-local` や `--env-local` などのオプションを組み合わせて使うこともできます。なお、デフォルトでは `--system-wide` が選択されています。
 
## Subsequent Updates

GrovePi をフルインストール用のコマンド、またはミニマルインストール用のコマンドのいずれかで一度インストールしていれば、必要なパッケージや依存関係はすでに入っています。そのため、2 回目以降の更新では依存関係のインストールをスキップし、GrovePi の Python パッケージだけを再インストールすることができます。その場合は次のコマンドを実行します。

```bash
cd ~/DexterInd/GrovePi/Script
bash update_grovepi.sh --bypass-rfrtools --no-dependencies
```

コマンドが複雑に感じる場合は、常にフルインストールまたはミニマルインストール用のコマンドをそのまま使い続けても構いません。
