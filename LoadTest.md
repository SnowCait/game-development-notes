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
- `EXPLAIN`

## Code

## 工数
- 2ヶ月は確保した方が良い
- できれば2回に分けて中間と最終で実施
  - もちろんもっと頻繁に実施できるのが理想

## 参考
- [[技術ブログvol.21] インフラ視点で、負荷テストについて考えてみる | 技術情報ブログ | マネージドホスティングのディーネット](https://www.denet.ad.jp/technology/2014/12/vol21.html)
- [負荷試験ガイド - withgod's blog](https://withgod.hatenablog.com/entry/2020/11/09/131930)
