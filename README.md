# 店舗予約管理システム

飲食店向けの店舗予約管理APIと、それを操作する顧客・スタッフ向けフロントエンドを、バックエンド設計を学びながら段階的に作るプロジェクトです。

## ドキュメント

- [バックエンド開発教科書](docs/backend-api-textbook.md)
- [要件定義](docs/requirements.md)
- [ドメインモデル](docs/domain_model.md)
- [予約なし利用追加による要件影響の再確認](docs/walk_in_impact_review.md)
- [ADR-0001: 席配置計画を世代付きで保存する](docs/adr/0001-seat-placement-plan-versioning.md)
- [MVP後の拡張案](docs/future_extensions.md)
- [進捗と次の作業](docs/milestones.md)

基礎から予約重複の同時実行対策までを一冊にまとめています。完成コードを写すのではなく、別題材の例を店舗予約APIへ応用する形で進めます。学習用ドキュメントは確定仕様ではなく、今後作成する要件定義、設計文書、ADRを正式な判断基準とします。

## 現在の実装範囲

第1段階のFastAPI最小アプリとヘルスチェック、第2段階前半のDocker ComposeによるPostgreSQL環境まで完了しています。予約なし利用を含む要件定義とMVP範囲の再確定が完了し、現在はドメインモデルとデータベース設計を具体化する段階です。

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

Docker Desktopを起動した状態で、Compose設定と必須環境変数を確認してからPostgreSQLを起動します。

```powershell
docker compose config
docker compose up -d
docker compose ps
```

データベースコンテナの状態が `healthy` になることを確認してください。

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
