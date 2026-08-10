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

## 要件定義

- [x] 顧客、スタッフ、管理者のMVP上の役割を整理する
- [x] 予約番号、予約確認コード、QRコードの用途を整理する
- [x] オンライン取消と電話受付の基本方針を整理する
- [x] SMSとメールをMVPの必須機能にしない方針を決める
- [x] 予約開始間隔、標準利用時間、受付期間、各期限の初期値を決める
- [x] 当日運用責任者の任命・引き継ぎと、後日の最終審査を整理する
- [ ] テーブル自動割り当てと結合ルールを確定する
- [x] 予約状態と状態遷移を確定する
- [ ] 営業時間、定休日、臨時休業の詳細を確定する
- [ ] 個人情報と履歴の保持方針を確定する
- [ ] MVPと後続機能の一覧を最終確認する

次は、テーブル自動割り当て候補の評価順を検討する。要件定義の承認が終わるまでは、SQLAlchemy、DBモデル、APIの本格実装へ進まない。

現在の環境では、Docker Engineの起動、Compose設定の検証、PostgreSQL 18イメージの取得、コンテナのヘルスチェック、パスワードを使用したTCP経由のSQL接続まで完了しています。
