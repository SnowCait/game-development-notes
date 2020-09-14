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
* `JOIN` しない
  * 負荷
  * シャーディング

## マイグレーション
* テーブル定義だけでなくデータもマイグレーションする
* 複数のブランチで並行して開発する場合同じテーブルに対するマイグレーションは気を付ける
  * feature/a で add column して feature/b で rename table & create table してるとマイグレーションの順番によっては feature/a のマイグレーションが意味なくなる
    * テーブルの作り直しはマイグレーションでやらない方がいいのかもしれない

## UPDATE
* 整合性の確認のため更新後 affected rows を確認する
* 基本的には ``SET `value` = `value` + ?`` を使う（前回値のチェックをしない場合）
* WHERE に元の値を含める ``SET `value` = ? WHERE `value = ?`` （前回値のチェックをする場合）

## 帯域
* AWS は上位のインスタンスタイプじゃないと帯域が狭いので CPU やメモリだけでスペックを決めない
  * 10Gbps くらい欲しい

## データ量
* 想定データ量を各テーブル算出しておく
  * 1プレイヤー1レコードなのかどうか

## 要検討リスト
* 負荷対策（水平垂直分割、キャッシュ）
* カスタマーサポート
* データマイニング
* マイグレーション
* トランザクション
* SQL インジェクション
* 帯域
* バックアップ
* メンテナンス
* 時刻（同期、変更）
  * [コード内で「現時刻」を気軽に取得してはいけない | Nekoya press](https://nekoya.github.io/blog/2013/07/09/what-time-is-it/)

## 一般的な Tips
- [SnowCait/database-notes](https://github.com/SnowCait/database-notes)

