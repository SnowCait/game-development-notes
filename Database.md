# Database

## DB構成
* Player (Sharding)
* Game\[, Share, Common\]
* Log (Partition)
* Kpi

## master-slave
- master-slave 構成にする
- ゲームのクエリは全て master を見に行く
- 管理画面、バッチ、バックアップなどゲームに直接関係ないものや負荷のかかるものは基本的に slave を見る

## SQL
* 対象範囲が漏れるので `23:59:59` や `BETWEEN` を使わない
  * 必ず `2018-01-01 00:00:00 <= x < 2018-01-02 00:00:00` で比較する

## マイグレーション
* テーブル定義だけでなくデータもマイグレーションする
