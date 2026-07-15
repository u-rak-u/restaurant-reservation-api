# Next Action

## 第1段階: 最小FastAPI環境

- [x] プロジェクトフォルダを作成する
- [x] FastAPIの最小アプリケーションを作成する
- [x] `GET /health` を作成する
- [x] ヘルスチェックのpytestを作成する
- [x] Python仮想環境を作成する
- [x] 依存パッケージをインストールする
- [x] pytestが成功することを確認する
- [x] 開発サーバーを起動して `/health` の応答を確認する
- [x] GitHubにPrivateリポジトリを作成し、`main`ブランチをpushする

## 第2段階: PostgreSQL接続とマイグレーション

- [x] Docker Desktopをインストールし、Docker EngineとDocker Composeの起動を確認する
- [x] PostgreSQL 18を起動するCompose構成を作成する
- [x] `.env`をGitの管理対象から除外し、`.env.example`を用意する
- [x] 名前付きボリュームでPostgreSQLのデータを永続化する
- [x] ヘルスチェックが成功することを確認する
- [x] `reservation_app`で`reservation_db`へSQL接続できることを確認する
- [ ] SQLAlchemy 2.xのDB接続を作成する
- [ ] Alembicを導入する

次は、SQLAlchemy 2.xの接続構成とDBセッションの役割を整理してから実装します。
