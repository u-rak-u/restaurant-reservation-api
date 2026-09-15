# ドキュメント索引

このディレクトリには、Restaurant Reservation APIの確定仕様、設計判断、検討資料、進捗記録を保存しています。公開時に文書の位置づけを誤解しないよう、用途ごとに分類しています。

## 最初に読む資料

1. [要件定義](requirements.md) — MVPの対象、業務ルール、権限、状態遷移
2. [ドメインモデル](domain_model.md) — 用語、エンティティ、値オブジェクト、集約境界
3. [データベース設計](database_design.md) — PostgreSQLのテーブル、制約、インデックス
4. [ADR一覧](adr/README.md) — 重要な判断の選択肢、採用理由、欠点

## 正式な仕様・設計

- [要件定義](requirements.md)
- [ドメインモデル](domain_model.md)
- [データベース設計](database_design.md)
- [店舗テーブルレイアウトと自動配置](table_layout.md)
- [MVP後の拡張案](future_extensions.md)

個別の重要判断は`adr/`に記録しています。文書間に差異がある場合は、単独の記述だけで判断せず、関連するADRと現在の進捗を合わせて確認します。

## 補助資料

- [`drafts/`](drafts/) — 正式公開前の草案。確定仕様や法務確認済み文書ではありません。
- [`reviews/`](reviews/) — 要件追加などによる影響確認の記録です。現在の仕様は正式文書側を正とします。

## プロジェクト管理

- [マイルストーン](project/milestones.md) — フェーズ単位の進捗
- [次の作業](project/next-action.md) — 直近の細かな作業順

これらは開発状況を示す資料であり、API契約や業務仕様そのものではありません。
