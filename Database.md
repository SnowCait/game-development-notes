# Database

## DB構成
* Player (Sharding)
* Game\[, Share, Common\]
* Log (Partition)
* Kpi

## SQL
* 対象範囲が漏れるので `23:59:59` や `BETWEEN` を使わない
  * 必ず `2018-01-01 00:00:00 <= x < 2018-01-02 00:00:00` で比較する
