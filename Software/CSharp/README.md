# GrovePi for C#

C# 向けの GrovePi 実装には、いくつかのバリエーションがあります。

- Windows IoT Core 向け Universal Windows Platform (UWP)。詳細は [こちら](./README-UWP.md)。
- Linux / Windows 向け .NET Core IoT。詳細は [こちら](https://github.com/dotnet/iot/tree/master/src/devices/GrovePi)。

Windows IoT Core 向け UWP は、Raspberry Pi などのボード上で動作する Windows IoT Core 専用の実装です。XAML と従来の UWP 開発が好きで、UI を必要とする場合に適しています。

.NET Core はオープンソースのフレームワークで、「アジャイルな .NET」と考えるとわかりやすいでしょう。一般的には、Windows に同梱されているデスクトップ .NET Framework とほぼ同等ですが、クロスプラットフォーム（Windows / Linux / macOS）かつクロスアーキテクチャ（x86 / x64 / ARM）で動作するサブセットとして提供され、アプリケーションと一緒に配布できる点が異なります。そのため、バグ修正や新機能追加のために素早く更新でき、Raspbian 上で動作する Raspberry Pi との相性も良好です。.NET Core に不慣れな場合は、[.NET Core IoT ドキュメント](https://github.com/dotnet/iot/tree/master/Documentation) を参照してください。
