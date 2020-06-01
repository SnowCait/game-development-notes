# メンテナンス

## オンメンテ Tips
ユーザーの操作を止めずに行うメンテナンス。

### テーブル定義変更
`ALTER TABLE` ではなく新規に作成できる場合。  
ログテーブルなど古い情報を破棄または後から `INSERT SELECT` できるケース。
```sql
CREATE TABLE `new_table`;
RENAME TABLE `table` TO `old_table`, `new_table` TO `table`;
```
