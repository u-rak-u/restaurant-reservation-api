from fastapi import FastAPI


app = FastAPI(title="店舗予約管理API")


@app.get("/health")
def health_check() -> dict[str, str]:
    """アプリケーションが応答可能か確認する。"""
    return {"status": "ok"}
