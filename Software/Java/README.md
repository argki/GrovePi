## Java Library

このリポジトリには、GrovePi 向けの Java ライブラリが含まれています。

#### Installation ####

先に Pi4J ライブラリをインストールしておく必要があります。  
推奨される方法は、公式のインストール手順に従うことです: http://pi4j.com/install.html

#### Compile and Execute the test program ####

Pi4J のインストールとローカルリポジトリの準備が完了したら、GrovePi ライブラリをコンパイルし、テストプログラムを実行できます。

まず Java ディレクトリに移動します。

```bash
$ cd ./Java/
```

フォルダ構成は次のようになります。

```text
$ config  doc  scripts  src  test
```

- **bin** — コンパイラの出力先フォルダです。存在しない場合は Bash スクリプトが自動で作成します。
- **config** — デフォルト設定を格納します。
- **doc** — GrovePi ライブラリのドキュメントを格納します。
- **scripts** — ライブラリをコンパイルし、基本的なテストプログラムを実行するための Bash スクリプトを格納します。
- **src** — GrovePi ライブラリのソースコードです。
- **test** — サンプルコード／サンプルプログラムが入っています。

ライブラリをコンパイルし、テストプログラムを実行するには次のコマンドを使用します。

```bash
$ ./scripts/compile.sh && ./scripts/Test.sh
```

デフォルトでは、`/var/log/GrovePi` フォルダ内にログが出力されます。

問題が発生した場合や、さらに詳しい情報が必要な場合は、公式フォーラム（http://forum.dexterindustries.com/c/grovepi）にコメントを残してください。

## License
GrovePi for the Raspberry Pi: an open source robotics platform for the Raspberry Pi.
Copyright (C) 2017  Dexter Industries

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/gpl-3.0.txt>.
