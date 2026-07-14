# 店舗予約管理API

飲食店向けの店舗予約管理APIを、バックエンド設計を学びながら段階的に作るプロジェクトです。

## 現在の実装範囲

第1段階として、FastAPIの最小アプリケーションとヘルスチェックテストだけを実装しています。

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
