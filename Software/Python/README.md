## Installing the GrovePi for Python

`DexterInd` リポジトリ一式が `pi` ユーザーのホームディレクトリ（例: `~/DexterInd`）に clone 済みであることを前提とすると、GrovePi の Python ライブラリは次のようにインストールできます。

```bash
cd ~/DexterInd/GrovePi/Script
bash update_grovepi.sh
```

`setup.py` インストーラを直接実行してインストールすることもできますが、その場合はいくつか追加要件に注意してください。具体的には、https://github.com/DexterInd/RFR_Tools に含まれる `di_i2c` モジュールをインストールしておくこと、および `raspi-config` メニューから I2C を有効化しておくことが必要です。

```bash
pip install -r requirements.txt
```

```bash
python3 setup.py install
```

また、GrovePi パッケージに含まれるモジュールが正しく import できるかをテストするために、`python setup.py test` を実行することもできます。`python setup.py test` は、依存パッケージを `pip` でインストールした後に実行してください。テスト対象のモジュールは [package_modules.txt](package_modules.txt) に列挙されています。

## Library Breakdown

サンプルスクリプトには、大きく 2 種類があります。

1. `grovepi` モジュールだけに依存するサンプルプログラム — これらはこのディレクトリ（Python パッケージのルート）に配置されています。
2. `grovepi` 以外のサブライブラリに基づいたサンプルプログラム — これらはこのディレクトリのサブディレクトリに配置されています。

GrovePi パッケージとともにインストールされるライブラリの一覧は [こちら](package_modules.txt) に記載されています。

## Python Consideration

GrovePi パッケージ自体は Python 2.x / 3.x の両方向けにインストール可能ですが、メインの `grovepi.py` 以外の一部ライブラリは Python 3 でのみ利用できます。そのため、今後引退が確実な Python 2 ではなく、最初から Python 3 を標準として使うことをおすすめします。
