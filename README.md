# 店舗予約管理システム

飲食店向けの店舗予約管理APIと、それを操作する顧客・スタッフ向けフロントエンドを、バックエンド設計を学びながら段階的に作るプロジェクトです。

## ドキュメント

- [バックエンド開発教科書](docs/backend-api-textbook.md)
- [要件定義](docs/requirements.md)
- [ドメインモデル](docs/domain_model.md)
- [データベース設計](docs/database_design.md)
- [通常予約規約の暫定案](docs/reservation_terms_draft.md)
- [予約なし利用追加による要件影響の再確認](docs/walk_in_impact_review.md)
- [ADR-0001: 席配置計画を世代付きで保存する](docs/adr/0001-seat-placement-plan-versioning.md)
- [ADR-0002: 電話番号照合に鍵付きハッシュを使用する](docs/adr/0002-phone-number-matching.md)
- [ADR-0003: 内部主キーにUUIDv7を使用する](docs/adr/0003-uuidv7-primary-keys.md)
- [ADR-0004: DBMSにPostgreSQLを採用する](docs/adr/0004-adopt-postgresql.md)
- [ADR-0005: PostgreSQL 18とDockerイメージの固定方針](docs/adr/0005-postgresql-version-and-image-pinning.md)
- [ADR-0006: 店舗の識別・タイムゾーン・初期データ方針](docs/adr/0006-store-identity-timezone-and-bootstrap.md)
- [ADR-0007: 共通予約と種別詳細を分割する](docs/adr/0007-reservation-subtype-tables.md)
- [ADR-0008: 予約資格情報を分離して終了時に削除する](docs/adr/0008-reservation-credentials-lifecycle.md)
- [ADR-0009: 共通予約の種別・状態・ライフサイクル日時](docs/adr/0009-reservation-common-columns.md)
- [ADR-0010: 通常予約の人数・予約期間・顧客コメント](docs/adr/0010-regular-reservation-details.md)
- [ADR-0011: 貸切予約のイベント時間・準備片付け時間・参加人数](docs/adr/0011-exclusive-reservation-details.md)
- [ADR-0012: 通常予約の15分到着期限と席解放](docs/adr/0012-late-arrival-and-seat-release.md)
- [ADR-0013: 通常予約の到着期限と遅延実行による席解放](docs/adr/0013-arrival-deadline-persistence.md)
- [ADR-0014: 貸切範囲を種別と正規化した関連で表す](docs/adr/0014-exclusive-reservation-scope.md)
- [MVP後の拡張案](docs/future_extensions.md)
- [進捗と次の作業](docs/milestones.md)
- [直近の詳細な作業](next-action.md)

基礎から予約重複の同時実行対策までを一冊にまとめています。完成コードを写すのではなく、別題材の例を店舗予約APIへ応用する形で進めます。学習用ドキュメントは確定仕様ではなく、今後作成する要件定義、設計文書、ADRを正式な判断基準とします。

## 現在の実装範囲

第1段階のFastAPI最小アプリとヘルスチェック、第2段階前半のDocker ComposeによるPostgreSQL環境まで完了しています。予約なし利用を含む要件定義とドメインモデルの確定が完了し、現在はデータベース設計を具体化する段階です。

## 必要な環境

- Python 3.12以上の利用可能な安定版
- Windows PowerShell
- Docker Desktop
- Docker Compose

使用するコマンドが見つからない場合は、PythonやDockerをインストールした端末であることと、実行ファイルへPATHが通っていることを確認してください。開発端末と自動実行環境では、利用できるツールが異なる場合があります。

## セットアップ

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -r requirements-dev.txt
Copy-Item .env.example .env
```

作成した `.env` の `POSTGRES_PASSWORD` は、ローカル開発用の十分に推測されにくい値へ変更してください。`.env` はGitの管理対象外です。

## PostgreSQLの起動

Docker Desktopを起動した状態で、Compose設定と必須環境変数を確認してからPostgreSQLを起動します。開発環境ではPostgreSQLとベースOSの系列を揃えるため、公式イメージの `postgres:18.4-trixie` を使用します。マイナー更新と本番環境でのダイジェスト固定方針は [ADR-0005](docs/adr/0005-postgresql-version-and-image-pinning.md) を参照してください。

```powershell
docker compose config --quiet
docker compose up -d
docker compose ps
.\scripts\test-db-connection.ps1
```

データベースコンテナの状態が `healthy` になり、接続確認で `Database connection check: OK` と表示されることを確認してください。接続確認スクリプトは `.env` のパスワード、接続文字列、環境変数一覧を出力しません。Windows PowerShell 5でもBOMなしUTF-8のスクリプトを誤解析しないよう、スクリプト自身のメッセージはASCIIで出力します。

## 起動

```powershell
python -m uvicorn app.main:app --reload
```

起動後、`http://127.0.0.1:8000/health` にアクセスすると、次のレスポンスが返ります。

```json
{"status": "ok"}
```

## テスト

```powershell
python -m pytest
```
