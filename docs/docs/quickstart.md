## Stacking It

GrovePi を使い始めるためには、まず GrovePi を Raspberry Pi に装着する必要があります。これは他の HAT と同様に、GrovePi を Raspberry Pi の上にそのまま重ねるだけのシンプルな作業です。

電源を入れる前に、ヘッダピンにフォーム（スポンジ状の保護材）が付いたままになっていないか必ず確認してください。フォームは導電性があり、ピン同士をショートさせて Raspberry Pi を再起動させてしまう原因になります。

最終的には、GrovePi は次の写真のように Raspberry Pi の上に載った状態になります。

![Stacked GrovePi](img/stackedgrovepi.jpg)

## How to Install

インストール方法は大きく 2 通りあります。

1. あらかじめ用意されたイメージ [Raspbian For Robots](https://sourceforge.net/projects/dexterindustriesraspbianflavor/) を使う方法  
1. クリーンな Raspbian イメージを用意し、インストール用コマンドを実行する方法

#### For Raspbian For Robots Image

Raspbian For Robots イメージを使う利点は、GrovePi が最初からインストール済みであるため、自分でインストール作業を行う必要がない点です。  
ただし、最新の状態を保つには、コンソールあるいは GUI アプリから定期的にアップデートを実行する必要があります。

#### For Manual Installation

一方、クリーンな Raspbian イメージを使う場合は、最初のインストールにやや時間がかかりますが、その後のアップデートは短時間で済みます。  
この方法のデメリットは、Dexter Industries 製の他のロボット用ソフトウェアが自動では入らないことです。他のロボットを使う予定がない場合は、この方法が向いています。

クリーンな Raspbian イメージに GrovePi をインストールするには、`DexterInd` リポジトリ一式が `pi` ユーザーのホームディレクトリ（例: `~/DexterInd`）に clone 済みであることを前提として、次のコマンドを実行します。

```bash
cd ~/DexterInd/GrovePi/Script
bash update_grovepi.sh
```

#### How to Update to a Newer Version

GrovePi をどの方法でインストールした場合でも（手動インストールか Raspbian For Robots かに関わらず）、最新版へアップデートする方法は 1 つだけです。

```bash
cd ~/DexterInd/GrovePi/Script
bash update_grovepi.sh
```

見てのとおり、クリーンな Raspbian へのインストール時と同じコマンドです。

## Where Is It Installed

GrovePi をインストールするか、あるいは Raspbian For Robots を利用した場合、GrovePi ライブラリは `/home/pi/Dexter/GrovePi` ディレクトリ内に配置されます。

`/home/pi/Dexter/GrovePi` の中身は、[GitHub 上の GrovePi リポジトリ](https://github.com/DexterInd/GrovePi/tree/master) の master ブランチと同じ内容になっています。

## What I2C Bus to Use

既定では、GrovePi ライブラリは `RPI_1SW` バスを使用する設定になっています。これは、Raspberry Pi のハードウェア I2C の問題を回避するために作られたソフトウェア実装の I2C です。高速で、CPU 負荷もほとんどかかりません。通常はこのバスを使うことを推奨しており、その場合は `grovepi` モジュールを import するだけで特別な設定は不要です。

他に、Raspberry Pi 標準のハードウェア I2C である `RPI_1` バスもありますが、こちらはバグや不安定さが知られています。どのような状況でも、このバスを使う理由はほとんどないと考えています。

バスを変更したい場合（例: `RPI_1` に切り替えたい場合）は、`grovepi.set_bus("RPI_1")` のように `grovepi.set_bus("RPI_1")` または `grovepi.set_bus("RPI_1SW")` を呼び出してください。

## Scratch Support

Scratch サポートは、Raspbian For Robots イメージには標準で含まれています。クラシックな Raspbian を使用している場合は、GrovePi をインストールした後に次のコマンドを実行して Scratch 用のサポートを追加してください。

```bash
sudo bash /home/pi/Dexter/GrovePi/Script/install_scratch.sh
```

## Community Support

GrovePi についてさらに知りたい場合は、フォーラムで [grovepi タグ](https://forum.dexterindustries.com/tags/grovepi) が付いたスレッドを確認するか、[GrovePi カテゴリ](https://forum.dexterindustries.com/c/grovepi) を参照してください。
