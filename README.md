# Restaurant Reservation API

飲食店の通常予約、貸切予約、予約なし利用、席配置を一貫して扱う店舗予約管理システムです。FastAPIとPostgreSQLを用い、業務ルールをアプリケーションコードだけでなくデータベース制約やトランザクション設計でも守ることを目標に開発しています。

> [!IMPORTANT]
> 現在はデータベース設計フェーズです。動作するAPIはヘルスチェックのみで、予約機能そのものはまだ実装していません。確定済みの仕様と未実装の範囲は分けて記載しています。

## このプロジェクトで扱う課題

- 通常予約、貸切予約、予約なし利用で共通化すべき情報と固有情報の分離
- 席の結合、移動、世代管理を含むテーブル配置モデル
- PostgreSQLの制約、範囲型、ロックを利用した二重予約・競合対策
- 顧客とスタッフで異なる認証・認可、資格情報の失効と保持期限
- 到着遅延、無断キャンセル、臨時休業など現場で発生する例外状態の管理
- 冪等性、監査、個人情報の削除を含む運用可能なAPI設計

## 現在の到達点

| 分類 | 状態 |
| --- | --- |
| 開発環境 | uvによる依存固定、Docker ComposeによるPostgreSQL 18環境を構築済み |
| API実装 | `GET /health` と自動テストを実装済み |
| 要件・ドメイン | MVPの要件、権限、状態遷移、主要な集約境界を確定済み |
| データベース | テーブルと制約を段階的に設計中 |
| 予約API・認証 | 未実装 |
| フロントエンド | 未実装 |

詳細な進捗は[マイルストーン](docs/project/milestones.md)で管理しています。

## 技術構成

現在導入済み、または開発環境で使用している技術は次のとおりです。

- Python 3.12
- FastAPI / Pydantic / Uvicorn
- PostgreSQL 18
- Docker / Docker Compose
- uv
- pytest / httpx2

SQLAlchemy 2.xとAlembicは後続のアプリケーション実装で導入予定であり、現時点では依存関係に含めていません。

## セットアップ

前提として、uv、Docker Desktop、Docker Compose、Windows PowerShellを使用します。

```powershell
uv python install 3.12
uv sync --locked
Copy-Item .env.example .env
```

`.env`の`POSTGRES_PASSWORD`をローカル開発用の値へ変更してください。`.env`はGitの管理対象外です。

### APIの起動

```powershell
uv run uvicorn app.main:app --reload
```

起動後に`http://127.0.0.1:8000/health`へアクセスすると、次のレスポンスを返します。

```json
{"status": "ok"}
```

### PostgreSQLの起動

```powershell
docker compose config --quiet
docker compose up -d
docker compose ps
.\scripts\test-db-connection.ps1
```

接続確認スクリプトは、パスワードや接続文字列を出力せず成否だけを表示します。開発用イメージの固定方針は[ADR-0005](docs/adr/0005-postgresql-version-and-image-pinning.md)を参照してください。

### テスト

```powershell
uv run python -m pytest
```

## ドキュメント

設計資料の読み方と全体一覧は[ドキュメント索引](docs/README.md)にまとめています。最初に確認する資料は次の4つです。

- [要件定義](docs/requirements.md)
- [ドメインモデル](docs/domain_model.md)
- [データベース設計](docs/database_design.md)
- [ADR一覧](docs/adr/README.md)

設計上の主な判断例:

- [PostgreSQLを採用した理由](docs/adr/0004-adopt-postgresql.md)
- [共通予約と種別詳細を分割する理由](docs/adr/0007-reservation-subtype-tables.md)
- [予約資格情報のハッシュ化と失効方式](docs/adr/0016-reservation-credential-hashing.md)
- [席資源の期間重複を防ぐ制約](docs/adr/0033-seat-resource-block-target-and-period.md)
- [席配置計画の対象を一意にする制約](docs/adr/0036-seat-placement-plan-exclusive-target.md)

## ディレクトリ構成

```text
app/              FastAPIアプリケーション
docs/             要件、設計、ADR、進捗資料
scripts/          開発環境の確認スクリプト
tests/            自動テスト
compose.yaml      ローカルPostgreSQL環境
pyproject.toml    依存関係とプロジェクト設定
uv.lock           解決済み依存バージョン
```

顧客向け規約の草案は法務確認済みの利用規約ではありません。正式仕様と補助資料の区別は[ドキュメント索引](docs/README.md)を参照してください。
