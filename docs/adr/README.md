# Architecture Decision Records

重要な設計判断について、背景、選択肢、採用理由、欠点、見直し条件を記録しています。番号は判断した順序を表し、重要度や実装順ではありません。

## 基盤と共通方針

- [ADR-0001: 席配置計画を世代付きで保存する](0001-seat-placement-plan-versioning.md)
- [ADR-0002: 電話番号照合に鍵付きハッシュを使用する](0002-phone-number-matching.md)
- [ADR-0003: 内部主キーにUUIDv7を使用する](0003-uuidv7-primary-keys.md)
- [ADR-0004: DBMSにPostgreSQLを採用する](0004-adopt-postgresql.md)
- [ADR-0005: PostgreSQL 18とDockerイメージの固定方針](0005-postgresql-version-and-image-pinning.md)

## 店舗・予約・資格情報

- [ADR-0006: 店舗の識別・タイムゾーン・初期データ方針](0006-store-identity-timezone-and-bootstrap.md)
- [ADR-0007: 共通予約と種別詳細を分割する](0007-reservation-subtype-tables.md)
- [ADR-0008: 予約資格情報を分離して終了時に削除する](0008-reservation-credentials-lifecycle.md)
- [ADR-0009: 共通予約の種別・状態・ライフサイクル日時](0009-reservation-common-columns.md)
- [ADR-0010: 通常予約の人数・予約期間・顧客コメント](0010-regular-reservation-details.md)
- [ADR-0011: 貸切予約のイベント時間・準備片付け時間・参加人数](0011-exclusive-reservation-details.md)
- [ADR-0012: 通常予約の15分到着期限と席解放](0012-late-arrival-and-seat-release.md)
- [ADR-0013: 通常予約の到着期限と遅延実行による席解放](0013-arrival-deadline-persistence.md)
- [ADR-0014: 貸切範囲を種別と正規化した関連で表す](0014-exclusive-reservation-scope.md)
- [ADR-0015: 予約番号を店舗単位の12桁とし3年後に解放する](0015-store-scoped-reservation-number.md)
- [ADR-0016: 予約確認コードとQRトークンの保存・失効方式](0016-reservation-credential-hashing.md)
- [ADR-0017: 無断キャンセル電話照合を予約従属テーブルへ分離する](0017-no-show-phone-match-table.md)
- [ADR-0029: 貸切の到着期限と明示的な資源解放](0029-exclusive-arrival-deadline.md)
- [ADR-0030: 未解決来店案件の管理終結を基本状態と分離する](0030-separate-management-closure-from-status.md)

## スタッフと当日運用責任者

- [ADR-0018: スタッフアカウントを店舗所属の個別アカウントとして管理する](0018-store-scoped-staff-accounts.md)
- [ADR-0019: スタッフ認証情報・ログイン制限・セッションを分離する](0019-separate-staff-authentication-state.md)
- [ADR-0020: 当日運用責任者を時間範囲の任命履歴として保存する](0020-duty-manager-assignment-period.md)
- [ADR-0021: 当日運用責任者の交代手続きを任命と分離して保存する](0021-duty-manager-transition-workflows.md)

## 予約なし利用

- [ADR-0022: 予約なし利用を状態と操作日時を持つ独立した行として保存する](0022-walk-in-visit-state.md)
- [ADR-0023: 予約なし利用の利用日時と席占有を分離して保存する](0023-walk-in-time-and-occupancy.md)
- [ADR-0024: 予約なし利用の占有継続を利用系列で管理する](0024-walk-in-continuation-series.md)
- [ADR-0025: 13名以上の予約なし利用は共通操作IDを監査記録へ保存する](0025-walk-in-batch-operation-id.md)

## 席構成と席配置

- [ADR-0026: フロア・エリア・物理テーブル・配置場所を分離する](0026-separate-floor-area-table-and-location.md)
- [ADR-0027: 席構成マスターのコード・名称・表示順を定める](0027-seat-master-identifiers-and-order.md)
- [ADR-0028: 席資源の一時ブロックを恒久的なマスター状態と分離する](0028-separate-seat-resource-blocks.md)
- [ADR-0031: 物理テーブルの固定・可動を固定配置場所の有無で表す](0031-physical-table-capacity-and-fixed-location.md)
- [ADR-0032: 席構成マスターを廃止日時で無効化し参照後は物理削除しない](0032-retire-seat-masters-without-physical-deletion.md)
- [ADR-0033: 席資源ブロックを対象選択付きの半開期間として保存する](0033-seat-resource-block-target-and-period.md)
- [ADR-0034: 席資源ブロックは停止を広く許可し再開を責任者へ限定する](0034-seat-resource-block-operations-and-warnings.md)
- [ADR-0035: 配置場所の連結可能関係を正規化した無向ペアで保存する](0035-undirected-placement-location-connections.md)
- [ADR-0036: 席配置計画は予約または個別の予約なし利用の一方だけを対象にする](0036-seat-placement-plan-exclusive-target.md)
