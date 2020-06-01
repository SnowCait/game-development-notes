# メンテナンス

## 通常メンテナンス
ユーザーの操作を止めてメンテナンス。

### Optimize
MySQL InnoDB では `DELETE` をするとゴミが溜まるので定期的に `OPTIMIZE TABLE` しておく。  
ただし AWS Aurora では非推奨なのでテーブルを作り直す。
```sql
CREATE TABLE `new_table` LIKE `table`;
RENAME TABLE `table` TO `old_table`, `new_table` TO `table`;
INSERT INTO `table` SELECT * FROM `old_table`;
```

## オンメンテ Tips
ユーザーの操作を止めずに行うメンテナンス。

### パーティション
ログテーブルなどは `created_at` などでパーティションを作成し `mysqldump --where` ＆ `DROP PARTITION` してデータ量を維持する。  
`deleted_at` に適用することもできるらしい。値が入ったときにパーティションも移動される。未検証。

### テーブル定義変更
`ALTER TABLE` ではなく新規に作成できる場合。  
ログテーブルなど古い情報を破棄または後から `INSERT SELECT` できるケース。
```sql
CREATE TABLE `new_table`;
RENAME TABLE `table` TO `old_table`, `new_table` TO `table`;
```
