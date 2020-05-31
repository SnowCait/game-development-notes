# 配布（運営からのプレゼント、補填）
プレイヤーのプレゼントボックスへ直接積むと非アクティブなユーザーを含んでしまい無駄なレコードができたり実行に時間がかかってしまう。  
それらを避けるためにプレイヤーがログインしたときに配布マスターの情報を元に配布する。

## テーブル

### 配布マスター
デプロイを挟まず管理画面から更新できた方がいいかも。  
master.distribution
- id
- 対象
  - target: 全体、OS毎（必要？不公平になりそう）、個別
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
