# 配布（運営からのプレゼント、補填）
プレイヤーのプレゼントボックスへ直接積むと非アクティブなユーザーを含んでしまい無駄なレコードができたり実行に時間がかかってしまう。  
プレイヤーがログインしたときに配布マスターの情報を元に配布する。

## 対象
- 全体
- 特定のプレイヤー

## テーブル

### 配布マスター
master.distribution
- id
- 対象
  - filling_type
- アイテム
  - item_type
  - item_id
  - item_amount
  - item_meta: 追加情報（装備Lvなど）
- 受取可能期間
  - since
  - until

### 受取履歴
player.distribution_history
- player_id
- distribution_id
