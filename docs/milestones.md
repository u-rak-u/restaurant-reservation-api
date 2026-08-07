# 進捗と次の作業

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
- [x] 基礎から同時実行対策までの学習用教科書を作成する
- [ ] SQLAlchemy、Pydantic Settings、psycopgの依存関係を`requirements.txt`へ追加する
- [ ] SQLAlchemy 2.xのDB接続を作成する
- [ ] Alembicを導入する

次は、`docs/backend-api-textbook.md`の第3章と第5章を読み、`app/config.py`の設定項目表を作ってから実装します。`config.py`のレビューが終わるまでは、`database.py`へ進みません。
