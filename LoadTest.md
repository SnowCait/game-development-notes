# 負荷テスト
負荷に関するリファクタリングをする際のとっかかり。

## SQL
- ロックしている `FOR UPDATE`
  - 空振りでギャップロックしていないか
- foreach の中で SQL を発行している
- 必要ないデータを取得している
  - 通信量
- INDEX が張られていないクエリ `log_queries_not_using_indexes`
- 画面 (API) 毎のクエリ発行数

## Code
