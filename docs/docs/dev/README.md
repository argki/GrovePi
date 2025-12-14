# Development Notes

このドキュメントの開発用環境を立ち上げるには、まず次の Dockerfile からイメージをビルドします。

```bash
docker image build -t dexterind/grovepi-docs .
```

イメージができたら、コンテナを起動します。必ずこのリポジトリのルートディレクトリで実行してください。

```bash
docker container run -v $(pwd)/docs:/docs -it --rm -p 80:8000 dexterind/grovepi-docs
```

ドキュメントをビルドするには、リポジトリのルートディレクトリから次のコマンドを実行します。

```bash
docker container run -v $(pwd)/docs:/docs -it --rm dexterind/grovepi-docs mkdocs build -c
```

処理が終了したら、新しく生成された `site` ディレクトリの中身を `/docs` ディレクトリにコピーします。

あとは自由にドキュメントを編集し、作業が終わったらビルドして生成物を `docs` フォルダに保存してください。
