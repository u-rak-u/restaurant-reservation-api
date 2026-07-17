# 店舗予約管理API

飲食店向けの店舗予約管理APIを、バックエンド設計を学びながら段階的に作るプロジェクトです。

## 学習用ドキュメント

- [バックエンド開発教科書](docs/backend-api-textbook.md)

基礎から予約重複の同時実行対策までを一冊にまとめています。完成コードを写すのではなく、別題材の例を店舗予約APIへ応用する形で進めます。

## 現在の実装範囲

第1段階のFastAPI最小アプリとヘルスチェック、および第2段階前半のDocker ComposeによるPostgreSQL環境まで完了しています。現在はSQLAlchemy 2.xの接続を学習・実装する段階です。

## 必要な環境

- Python 3.10以上
- Windows PowerShell

## セットアップ

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -r requirements-dev.txt
```

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
